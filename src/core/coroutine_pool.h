#ifndef __MY_POOL_CORE_H
#define __MY_POOL_CORE_H
#include <vector>
#include <list>
#include <memory>
#include <atomic>
#include <string>
#include <map>
#include "../thread/Thread.h"
#include "runner.h"
#include "future.h"
#include "../lock/lock.h"
#include "../coroutine/coroutine.h"

namespace mypool{

class Coroutine_Pool{
public:
    typedef std::shared_ptr<Coroutine_Pool> ptr;

    Coroutine_Pool(const std::string& name = "",size_t threads = 1); 
    ~Coroutine_Pool();
    const std::string& getPoolName()const{return m_name;}

    void start();
    void stop();

    template<class T>
    void execute(T task){
        Mutex::Lock lock(m_mutex);
        Runner r(task);
        if(r.getCoroutine()){
            m_tasks.push_back(r);
        } 
    }

    template<class T>
    Future submitWithRes(T task){
        Future f;
        return f;
    }
private:
    //唤醒睡眠的线程
    void weekupOneThread();
    //线程执行的主循环
    void main_loop();
    //线程空闲执行的函数
    void idle();
private:

    volatile bool m_stop_flag = false;//停止标志
    //协程池名称
    std::string m_name;
    Mutex m_mutex;//互斥锁

    std::atomic<size_t> g_coroutine_count {0}; //协程池内总的协程数目
    std::atomic<size_t> g_task_count {0}; //协程池内的任务数目
    //线程数目
    size_t m_threadCount = 0;
    std::atomic<size_t> m_activeThreadCount {0};
    std::atomic<size_t> m_idleThreadCount {0};

    //线程队列
    std::vector<MyThread::ptr> m_threads;
    //任务队列
    std::list<Runner> m_tasks; 
};

}

#endif