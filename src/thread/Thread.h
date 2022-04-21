#ifndef __MY_POOL_THREAD_H_
#define __MY_POOL_THREAD_H_
#include "../lock/lock.h"
#include <iostream>
#include <atomic>
#include <functional>
#include <memory>
#include <string>

namespace mypool{

class MyThread{
public:
    typedef std::shared_ptr<MyThread> ptr;

    MyThread(std::function<void()> cb,const std::string& name);
    ~MyThread();

    void join();
    pid_t getId()const {return m_pid;}
    const std::string& getName()const {return m_name;}

    static MyThread* GetThis();
private:    
    static void* run(void* arg);
    //禁止线程之间的拷贝构造
    MyThread(const MyThread&) = delete; //C11写法
    MyThread(const MyThread&&) = delete; //c11提供的为重写复制构造函数
    MyThread& operator=(const MyThread&) = delete;
private:
    pid_t m_pid;
    std::string m_name;
    pthread_t m_thread;//实际的线程标识
    std::function<void()> m_task;//该线程要执行的任务
    Semaphore m_semaphore; //信号量，用于等待线程真正执行task 
};


}

#endif