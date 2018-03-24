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
    
    on SaveScreenshot:sender
        set dialog to display dialog "Save screenshots as: (note, this does not apply for screenshots made with Capture)" buttons {"PNG", "JPG", "TIFF"}
        set pressed to button returned of dialog
        if pressed is equal to "PNG" then
            
            do shell script "defaults write com.apple.screencapture type png"
            
            else if pressed is equal to "JPG" then
            do shell script "defaults write com.apple.screencapture type jpg"
            
            else if pressed is equal to "TIFF" then
            do shell script "defaults write com.apple.screencapture type tiff"
            
        end if
    end SaveScreenshot:
    
    
    
    on DisableNC:sender
        set dialog to display dialog "Enable or disable Notification Centre?" buttons {"Disable", "Enable"}
        set pressed to button returned of dialog
        if pressed is equal to "Disable" then
            do shell script "launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist"
            do shell script "killall NotificationCenter"
            
            else if pressed is equal to "Enable" then
            do shell script "launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist"
            
        end if
    end DisableNC:
    
    on AddRecentAppsFolder:sender
        do shell script "defaults write com.apple.dock persistent-others -array-add '{ \"tile-data\" = { \"list-type\" = 1; }; \"tile-type\" = \"recents-tile\"; }'"
        display dialog "Succes! your Dock will now restart." buttons {"OK"} default button {"OK"}
        do shell script "killall Dock"
    end AddRecentAppsFolder:
    
    on HoverOver:sender
        set dialog to display dialog "Enable light up stack itmes on mouse hover over?" buttons {"Enable", "Disable"}
        set pressed to button returned of dialog
        if pressed is equal to "Disable" then
            
            do shell script "defaults write com.apple.dock mouse-over-hilite-stack -boolean no"
            
            do shell script "killall Dock"
            
            else if pressed is equal to "Enable" then
            do shell script "defaults write com.apple.dock mouse-over-hilite-stack -boolean yes"
            
            do shell script "killall Dock"
            
        end if
        
    end HoverOver:
    
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits 
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
