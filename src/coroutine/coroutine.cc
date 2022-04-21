#include "coroutine.h"
#include <iostream>
#include <atomic>

namespace mypool{

class Allocate{
public:
   static void* Alloc(size_t size){
       return malloc(size);
   }

   static void Dealoc(void* val,size_t size){
       free(val);
   }     
};

//协程id
static std::atomic<uint64_t> g_coroutine_id {0};

//当前线程的主协程
static thread_local Coroutine* t_main_coroutine = nullptr;
//当前正在执行的协程
static thread_local Coroutine* t_current_coroutine = nullptr;

void Coroutine::SetCurrent(Coroutine* coroutine){
    // if(coroutine == nullptr){
    //     std::cout<<"set current coroutine ,but parameter is nullptr"<<std::endl;
    //     return;
    // }
    t_current_coroutine = coroutine;
}

Coroutine* Coroutine::GetCurrent(){
    return t_current_coroutine; 
}

void Coroutine::SetMainCoroutine(Coroutine* main_coroutine){
    // if(main_coroutine == nullptr){
    //     std::cout<<"set main coroutine,but parameter is nullptr"<<std::endl;
    //     return;
    // }
    t_main_coroutine = main_coroutine; 
}

Coroutine* Coroutine::GetMainCoroutine(){
    return t_main_coroutine;
}

//默认构造函数用于创建主协程，仅友元类Coroutine_Pool可以调用
Coroutine::Coroutine(){
    std::cout<<"create main coroutine!"<<std::endl;
    m_state = EXEC;
    m_id = ++g_coroutine_id;
    SetMainCoroutine(this);
    SetCurrent(this);
    if(getcontext(&m_context)){
        throw std::logic_error("create main coroutine context error!");
    }
}
//创建工作协程,携带负载
Coroutine::Coroutine(std::function<void()> task,size_t stacksize):m_id(++g_coroutine_id),m_task(task){
    m_stacksize = stacksize ? stacksize : 1024 * 1024;
    m_stack = malloc(m_stacksize);
    if(getcontext(&m_context)){
        throw std::logic_error("create worker coroutine error!");
    }

    m_context.uc_link = nullptr;
    m_context.uc_stack.ss_size = m_stacksize;
    m_context.uc_stack.ss_sp = m_stack;

    makecontext(&m_context, &Coroutine::CoroutineMain,0); 
}

Coroutine::~Coroutine(){
    std::cout<<"delete coroutine,id: " << m_id <<std::endl;
    if(m_stack){
        free(m_stack);
    }
    
    if(t_current_coroutine == this){
        std::cout<<"delete current coroutine,id: " << m_id <<std::endl;
        SetCurrent(nullptr);  
    }
    if(t_main_coroutine == this){
        std::cout<<"delete main coroutine:" << m_id <<std::endl;
        SetMainCoroutine(nullptr);
    }     
}

void Coroutine::CoroutineMain(){
    Coroutine* cur = GetCurrent();
    if(cur == nullptr){
        std::cout << "current coroutine is nullptr!"<<std::endl;
        //切回主线程
        cur->back();
    }
    try{
       //执行任务 
       cur->m_task();
       //执行完毕
       cur->m_task = nullptr;
       cur->m_state = END;
    }catch(std::exception& ex){
       cur->m_state = EXP;
       std::cout<< "task exec error!"<< ex.what()<<std::endl;
    }catch(...){
        throw std::logic_error("task exec error!");
    }
    Coroutine* temp = cur;
    cur = nullptr;
    //切回主线程
    temp->back();
}


void Coroutine::call(){
    SetCurrent(this);
    m_state = EXEC;
    if(swapcontext(&(t_main_coroutine->m_context),&m_context)){
        throw std::logic_error("swap task coroutine error!");
    }
}

void Coroutine::back(){
   SetCurrent(t_main_coroutine);
   if(swapcontext(&m_context,&(t_main_coroutine->m_context))){
       throw std::logic_error("swap main coroutine error!");
   } 
}

}