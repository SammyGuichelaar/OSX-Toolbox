//
//  main.m
//  OSX ToolBox
//
//  Created by Sam Guichelaar on 3/24/18.
//  Copyright © 2018 Sam Guichelaar. All rights reserved.
//  Project created to open source 2012 era project.

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
