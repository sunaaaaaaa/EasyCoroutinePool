#include <unistd.h>
#include "coroutine_pool.h"

namespace mypool{

Coroutine_Pool::Coroutine_Pool(const std::string& name,size_t threads):m_name(name),m_threadCount(threads){}

Coroutine_Pool::~Coroutine_Pool(){}


void Coroutine_Pool::start(){
    Mutex::Lock lock(m_mutex);
    if(m_stop_flag){
        return;
    }
    m_threads.resize(m_threadCount);
    for(size_t i = 0; i < m_threadCount; ++i){
        //创建线程，执行mian_loop，在main_loop创建主协程，然后不断取工作队列中的Runner执行
        m_threads[i].reset(new MyThread(std::bind(&Coroutine_Pool::main_loop,this),m_name + "_thread_" + std::to_string(i)));
    }
}

void Coroutine_Pool::stop(){
    m_stop_flag = true;
    //唤醒所有线程执行停止逻辑
    for(size_t i = 0; i < m_threadCount; ++i){
        weekupOneThread();
    }

    //等待所有线程执行完停止逻辑，退出
    std::vector<MyThread::ptr> temp;
    {
        Mutex::Lock lock(m_mutex);
        //将m_threads中的线程强引用全部转换到该局部变量中
        //等函数退出，temp销毁，则所有的强引用消失，线程回收
        temp.swap(m_threads);
    }
    //等待所有线程执行完退出逻辑
    for(auto& i : temp){
        i->join();
    }
}


void Coroutine_Pool::weekupOneThread(){
    if(m_activeThreadCount < m_threadCount){
       std::cout<<"weak up!"<<std::endl;
    }else{
        std::cout<<"not need weak up!"<<std::endl;
    }
}

//线程执行的主循环
void Coroutine_Pool::main_loop(){
    //创建主协程(友元)
    Coroutine main_coroutine;
    // Coroutine::SetMainCoroutine(&main_coroutine);
    //当前活跃线程加1
    ++m_activeThreadCount;
    //取任务
    Runner task;
    while(!m_stop_flag){
        task.init();
        {
           Mutex::Lock lock(m_mutex);
           auto it = m_tasks.begin();
           while(it != m_tasks.end()){
                if(it->getCoroutine() && it->getCoroutine()->getState()==Coroutine::State::EXEC){
                    it++;
                    continue; 
                }
                task = *it;
                //std::cout << task.getCoroutine().get() <<std::endl;
                m_tasks.erase(it);
                break;
           }
        }
       
        if(!m_stop_flag){
           if(task.getCoroutine().get()){
              task.getCoroutine()->call(); 
           }else{
              //说明暂时无任务可执行
              --m_activeThreadCount;
              ++m_idleThreadCount;
              idle();
              ++m_activeThreadCount;
              --m_idleThreadCount; 
           }
        }else{
            //执行停止逻辑,直接break打破循环即可
            break;
        }
    }
}
//线程空闲执行的函数
void Coroutine_Pool::idle(){
    std::cout<<"idle"<<std::endl;
    sleep(5); 
}
}