--
--  AppDelegate.applescript
--  OSX Toolbox 2
--
--  Created by Sam Guichelaar on 20/08/12.
--  Copyright (c) 2012 SamGuichelaar. All rights reserved.
--  Script are not great and only used for my needs personally.

script AppDelegate
    property parent : class "NSObject"
    
    -- IBOutlets
    property window : missing value
    
    on applicationWillFinishLaunching:aNotification
        
    end applicationWillFinishLaunching:
    
    on FreeRam:sender
        do shell script "sudo purge" with administrator privileges
        
    end FreeRam:
    
    
    
    on Quitall:sender
        tell application "QuitAll" to activate
    end Quitall:
    
    on ShowHidden:sender
        
        set dialog to display dialog "Show or hide hidden files?" buttons {"Show", "Hide"}
        set pressed to button returned of dialog
        if pressed is equal to "Show" then
            do shell script "defaults write com.apple.finder AppleShowAllFiles true"
            do shell script "killall Finder"
            
            else if pressed is equal to "Hide" then
            do shell script "defaults write com.apple.finder AppleShowAllFiles false"
            do shell script "killall Finder"
            
            
        end if
        
        
    end ShowHidden:
    
    on ShowLibrary:sender
        
        set dialog to display dialog "Show or hide Library folder in the User folder?" buttons {"Show", "Hide"}
        set pressed to button returned of dialog
        if pressed is equal to "Show" then
            
            do shell script "chflags nohidden ~/Library/"
            
            else if pressed is equal to "Hide" then
            do shell script "chflags hidden ~/Library/"
            
        end if
    end ShowLibrary:
    
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits 
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
