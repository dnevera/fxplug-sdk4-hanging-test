#import "AppDelegate.h"
#include <fstream>

#include <csignal>


@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    //[NSApp hide:nil];
}

- (void)applicationWillBecomeActive:(NSNotification*)note {}

- (void)applicationDidFinishLaunching:(NSNotification *)note
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(200.0 * NSEC_PER_MSEC)),
                   dispatch_get_main_queue(),
                   ^{
                      //[NSApp terminate:nil];
                   }
    );
}

@end