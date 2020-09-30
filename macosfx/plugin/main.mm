#import <FxPlug/FxPlugSDK.h>
#include <execinfo.h>
#include <csignal>

static void term_handler(int is)
{
  NSLog(@" **** SIGTERM handler .... %i", is);

  NSLog(@" **** FxPlug backtrace:");
  void* callstack[128];
  int i, frames = backtrace(callstack, 128);
  char** strs = backtrace_symbols(callstack, frames);
  for (i = 0; i < frames; ++i) {
    NSLog(@" %@",@(strs[i]));
  }
  free(strs);
}

int main(int argc, const char *argv[])
{
  std::signal(SIGTERM, term_handler);

  [FxPrincipal startServicePrincipal];
}
