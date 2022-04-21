#include "Thread.h"
#include <syscall.h>
#include <unistd.h>
namespace mypool{

static thread_local MyThread* cur_thread = nullptr;

MyThread* MyThread::GetThis(){
    return cur_thread;
} 

MyThread::MyThread(std::function<void()> task,const std::string& name):m_name(name),m_task(task){
    if(name.empty()){
        m_name = "UNKNOW";
    }
    //创建一个线程,将本对象作为run方法参数，并执行本对象的run方法
    int res = pthread_create(&m_thread,nullptr,&MyThread::run,this);
    if(res){
        std::cout<<"thread.cc pthread_create thread fail,res = "<<res<<" name ="<< name <<std::endl;
        throw std::logic_error("pthread_create error");
    }
    //需要等待真正的线程真正的构建完毕，开始执行run方法到达一定的阶段才可以直接返回，否则可能线程并未构建完全
    m_semaphore.wait();
}

//该方法由新创建的线程执行，因此需要将线程的本地变量设置
void* MyThread::run(void* arg){
    MyThread* mythread = (MyThread*) arg;
    cur_thread = mythread;
    mythread->m_pid = syscall(SYS_gettid);
    //设置线程名
    pthread_setname_np(pthread_self(),mythread->m_name.substr(0,15).c_str());
    std::cout << mythread->m_name << " start!" <<std::endl;
    //取任务，将MyThread包装类中的task对象置空，防止线程执行完任务后，任务还被持有
    std::function<void()> task;
    task.swap(mythread->m_task);
    //唤醒主线程
    mythread->m_semaphore.notify();
    //子线程执行任务
    task();
    //执行任务完毕后返回，销毁线程
    return 0;
}

MyThread::~MyThread(){
    if(m_thread){
        pthread_detach(m_thread);
    }
}

void MyThread::join(){
    if(m_thread){
        //执行该语句的线程需要等待m_thread对应的线程执行结束
        int res = pthread_join(m_thread,nullptr);
        if(res){
            std::cout<<"pthread_join thread fail,rt = "<< res <<" name="<<m_name<<std::endl;
            throw std::logic_error("pthread_join error");
        }
        
    }
}

}