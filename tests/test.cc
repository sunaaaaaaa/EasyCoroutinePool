#include "../src/core/coroutine_pool.h"
#include <iostream>
#include <unistd.h>

void hello(){
   std::cout << "hello,world" <<std::endl;
}

void bye(){
    std::cout << "byebye" <<std::endl;
}

void test1(){
   mypool::Coroutine_Pool cp("task",2);
   cp.start();
   cp.execute(&hello);
   cp.execute(&bye);
   sleep(5);
   cp.stop();
}

void test2(){

}

int main(){
   test1();
}