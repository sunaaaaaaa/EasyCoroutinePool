#ifndef __MY_POOL_COROUTINE_H_
#define __MY_POOL_COROUTINE_H_
#include <memory>
#include <functional>
#include <ucontext.h>

namespace mypool{

//协程类，实际上是保存一段执行上下文,实际上相当于底层协程库的封装
class Coroutine{
public:
   typedef  std::shared_ptr<Coroutine> ptr;
   friend class Coroutine_Pool;
   //协程状态
   enum State{
       INIT,
       EXEC,
       END,
       EXP,
   }; 
 
private:
   Coroutine();//私有构造器，用于创建主协程，只有友元类Coroutine_Pool可以调用
public:
   //用于创建工作协程
   Coroutine(std::function<void()> task,size_t stacksize = 0);
   ~Coroutine();
   void call();//主协程切换到被调度协程
   void back();//被调度协程切换到主协程
   uint64_t getId() const {return m_id;}
   State getState() const {return m_state;}


   static void CoroutineMain();//协程的主方法，每个协程启动后都是执行该方法，在该方法中执行实际的task，其实和Thread的用法一样
   //但是需要注意，主协程例外

   static void SetCurrent(Coroutine* coroutine);
   static Coroutine* GetCurrent();
   static void SetMainCoroutine(Coroutine* main_coroutine);
   static Coroutine* GetMainCoroutine();
private:
   uint64_t m_id;//协程ID，唯一
   uint32_t m_stacksize;
   State m_state = INIT;
   void* m_stack;
   std::function<void()> m_task;//协程的实际负载任务
   ucontext_t m_context;//实际的协程,存储执行上下文
};


}

#endif