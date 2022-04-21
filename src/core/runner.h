#ifndef __MY_POOL_RUNNER_H_
#define __MY_POOL_RUNNER_H_
#include <atomic>
#include <functional>
#include "../coroutine/coroutine.h"
namespace mypool{
//协程池执行的任务抽象

static std::atomic<uint64_t> g_runner_id {0};
class Coroutine;
class Runner{
public:
    Runner():task_id(++g_runner_id){}    
    Runner(std::function<void()> task):task_id(++g_runner_id){
        Coroutine::ptr temp(new Coroutine(task));
        m_coroutine = temp;
    }
    uint64_t getRunnerId() const {return task_id;}
    Coroutine::ptr getCoroutine()const {return m_coroutine;}
    void init(){
        m_coroutine = nullptr;
    }
private:
    Coroutine::ptr m_coroutine;
    uint64_t task_id;
};

}

#endif