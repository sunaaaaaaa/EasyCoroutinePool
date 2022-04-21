#ifndef __MY_POOL_LOCK_H_
#define __MY_POOL_LOCK_H_
#include <semaphore.h>
#include <stdint.h>
#include <pthread.h>
#include <thread>

namespace mypool{

class Semaphore{
public:
     Semaphore(uint32_t count = 0){
        if(sem_init(&m_semaphore,0,count)){
            throw std::logic_error("sem_init error");
        }
     }

     ~Semaphore(){
        sem_destroy(&m_semaphore);
     }

     void wait(){  
        if(sem_wait(&m_semaphore)){
            throw std::logic_error("sem_wait error");
        } 
     }

     void notify(){
        if(sem_post(&m_semaphore)){
            throw std::logic_error("sem_post error");
        }
     }
private:
     //禁用拷贝构造函数,赋值运算符
     Semaphore(const Semaphore&) = delete;
     Semaphore(const Semaphore&&) = delete;
     Semaphore& operator=(const Semaphore&) = delete;
private:
     sem_t m_semaphore;
};

//Mutex RAII封装类，不要将该类对象供多个线程共同使用
template<class T>
class LockRAII{
public:
    LockRAII(T& mutex):m_mutex(mutex){
        m_mutex.lock();
        is_locked = true; 
    }

    ~LockRAII(){
       unlock(); 
    }

    void lock(){
        if(!is_locked){
            m_mutex.lock();
            is_locked = true;
        }
    }

    void unlock(){
        if(is_locked){
            m_mutex.unlock();
            is_locked = false;
        }
    }
private:
    T& m_mutex;
    bool is_locked = false;
};

class Mutex{
public:
    typedef LockRAII<Mutex> Lock;
    Mutex(){
       pthread_mutex_init(&m_mutex,nullptr);
    }
    ~Mutex(){
       pthread_mutex_destroy(&m_mutex);   
    }

    void lock(){
        pthread_mutex_lock(&m_mutex);
    }

    void unlock(){
        pthread_mutex_unlock(&m_mutex);
    }
private:
    Mutex(const Mutex&) = delete;
    Mutex(const Mutex&&) = delete;
    Mutex& operator=(const Mutex&) = delete; 
private:
    pthread_mutex_t m_mutex;    
};



}

#endif