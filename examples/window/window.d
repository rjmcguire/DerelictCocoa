import std.stdio;

import derelict.cocoa;


void main(string[] args)
{
    DerelictCocoa.load();

    NSString appName = NSProcessInfo.processInfo().processName();
    writefln("appName = %s", appName);

    auto pool = new NSAutoreleasePool;

    auto NSApp = NSApplication.sharedApplication;

    NSApp.setActivationPolicy(NSApplicationActivationPolicyRegular);

    NSMenu menubar = NSMenu.alloc;
    menubar.init_();
    NSMenuItem appMenuItem = NSMenuItem.alloc();
    appMenuItem.init_();
    menubar.addItem(appMenuItem);
    NSApp.setMainMenu(menubar);

    NSWindow window = NSWindow.alloc();
    window.initWithContentRect(NSMakeRect(10, 10, 200, 200), NSBorderlessWindowMask, NSBackingStoreBuffered, NO);
    window.makeKeyAndOrderFront();

    NSApp.activateIgnoringOtherApps(YES);
    NSApp.run();
}