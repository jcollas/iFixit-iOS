//
//  Config.m
//  iFixit
//
//  Created by David Patierno on 2/3/11.
//  Copyright 2011 iFixit. All rights reserved.
//

class ConfigNew {
    
static Config *currentConfig = nil;

    class func currentConfig() {
        if (!currentConfig) {
            currentConfig = [[self alloc] init];
            currentConfig.site = ConfigIFixit;
            currentConfig.dozuki = false
        }
        return currentConfig
    }

- (void)setSite:(NSInteger)theSite {
    
    site = theSite;

    switch (site) {
        case ConfigIFixit:
            self.host = "www.ifixit.com";
            self.baseURL = "http://www.ifixit.com/Guide";
            answersEnabled = true
            collectionsEnabled = true
            self.store = "http://www.ifixit.com/Store";
            break;
        case ConfigIFixitDev:
            self.host = "www.cominor.com";
            self.baseURL = "http://www.cominor.com/Guide";
            answersEnabled = true
            collectionsEnabled = true
            self.store = "http://www.ifixit.com/Parts-Store";
            break;
        case ConfigMake:
            self.host = "makeprojects.com";
            self.baseURL = "http://makeproject.com";
            answersEnabled = false
            collectionsEnabled = true
            self.store = nil;
            break;
        case ConfigMakeDev:
            self.host = "make.cominor.com";
            self.baseURL = "http://make.cominor.com";
            answersEnabled = false
            collectionsEnabled = true
            self.store = nil;
            break;
        case ConfigZeal:
            self.host = "zealoptics.dozuki.com";
            self.baseURL = "http://zealoptics.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            break;
        case ConfigMjtrim:
            self.host = "mjtrim.dozuki.com";
            self.baseURL = "http://mjtrim.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = "http://www.mjtrim.com/";
            self.private = false
            break;
        case ConfigAccustream:
            self.host = "accustream.dozuki.com";
            self.baseURL = "http://accustream.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = "http://www.accustream.com/waterjet-parts.html";
            self.private = false
            self.scanner = true
            break;
        case ConfigMagnolia:
            self.host = "magnoliamedical.dozuki.com";
            self.baseURL = "http://magnoliamedical.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            self.private = true
            self.scanner = false
            break;
        case ConfigComcast:
            self.host = "comcast.dozuki.com";
            self.baseURL = "http://comcast.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            self.private = true
            self.scanner = false
            self.sso = "http://comcast.dozuki.com";
            break;
        case ConfigDripAssist:
            self.host = "dripassist.dozuki.com";
            self.baseURL = "http://dripassist.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            self.private = false
            self.scanner = false
            break;
        case ConfigPva:
            self.host = "pva.dozuki.com";
            self.baseURL = "http://pva.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            self.private = false
            self.scanner = false
            break;
        case ConfigOscaro:
            self.host = "oscaro.dozuki.com";
            self.baseURL = "http://oscaro.dozuki.com";
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            self.private = false
            self.scanner = false
            break;
        /*EAOOptions*/
        default:
            self.host = nil;
            self.baseURL = nil;
            answersEnabled = false
            collectionsEnabled = false
            self.store = nil;
            self.title = nil;
    }
    
    switch (site) {
        // Make
        // We should probably remove this
        case ConfigMake:
        case ConfigMakeDev:
            self.backgroundColor = [UIColor whiteColor];
            self.textColor = [UIColor blackColor];
            self.toolbarColor = [UIColor colorWithRed:0.16 green:0.67 blue:0.89 alpha:1.0];
            
            // Load intro and step css from the css folder.
            self.introCSS = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"make_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS  = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"make_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            break;
        // iFixit
        case ConfigIFixit:
        case ConfigIFixitDev:
            self.backgroundColor = [UIColor colorWithRed:39/255.0f green:41/255.0f blue:43/255.0f alpha:1];
            self.textColor = [UIColor whiteColor];
            self.toolbarColor = [UIColor colorWithRed:10/255.0f green:10/255.0f blue:10/255.0f alpha:1];
            self.buttonColor = [UIColor colorWithRed:0.0f green:113/255.0f blue:206.0/255.0f alpha:1.0];
            
            // Load intro and step css from the css folder.        
            self.introCSS    = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"ifixit_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS     = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"ifixit_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            self.moreInfoCSS = ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
                ? [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_ipad" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil]
                : [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_iphone" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            break;
        // MJ Trim
        case ConfigMjtrim:
            self.textColor = [UIColor blackColor];
            self.backgroundColor = [UIColor whiteColor];
            self.toolbarColor = [UIColor colorWithRed:204/255.0f green:0.0f blue:0.0f alpha:1.0];
            self.buttonColor = [UIColor colorWithRed:234/255.0f green:166.0/255.0f blue:160.0/255.0f alpha:1.0];
            self.tabBarColor = self.toolbarColor;

            concreteBackgroundImage = UIImage(named:"concreteBackgroundWhite.png")
            self.introCSS = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"make_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS  = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"make_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            break;
        // Config Magnolia
        case ConfigMagnolia:
            self.textColor = [UIColor blackColor];
            self.backgroundColor = [UIColor whiteColor];
            self.toolbarColor = [UIColor whiteColor];
            self.buttonColor = [UIColor colorWithRed:0.0f green:113/255.0f blue:206.0/255.0f alpha:1.0];
            self.tabBarColor = self.buttonColor;

    concreteBackgroundImage = UIImage(named:"concreteBackgroundWhite.png")
            self.introCSS = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"make_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS  = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"make_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            break;
        case ConfigAccustream:
            self.backgroundColor = [UIColor blackColor];
            self.textColor = [UIColor whiteColor];
            self.toolbarColor = [UIColor blackColor];
            self.buttonColor = [UIColor colorWithRed:0.0f green:113/255.0f blue:206.0/255.0f alpha:1.0];
            
            // Load intro and step css from the css folder.        
            self.introCSS = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"accustream_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS  = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"accustream_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            self.moreInfoCSS = ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
            ? [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_ipad" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil]
            : [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_iphone" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            break;
            
        case ConfigDripAssist:
            self.backgroundColor = [UIColor blackColor];
            self.textColor = [UIColor whiteColor];
            self.toolbarColor = [UIColor colorWithRed:192.0f/255.0f green:192.0f/255.0f blue:192.0/255.0f alpha:1.0];
            self.buttonColor = [UIColor colorWithRed:109.0f/255.0f green:109.0f/255.0f blue:109.0f/255.0f alpha:1.0];
            
            // Load intro and step css from the css folder.        
            self.introCSS = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"ifixit_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS  = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"ifixit_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            self.moreInfoCSS = ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
                ? [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_ipad" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil]
                : [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_iphone" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            break;
        default:
            self.backgroundColor = [UIColor blackColor];
            self.textColor = [UIColor whiteColor];
            self.toolbarColor = [UIColor blackColor];
            self.buttonColor = [UIColor colorWithRed:0.0f green:113/255.0f blue:206.0/255.0f alpha:1.0];
            
            // Load intro and step css from the css folder.        
            self.introCSS = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"ifixit_intro" ofType:"css"] encoding:NSUTF8StringEncoding error:nil];
            self.stepCSS  = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"ifixit_step" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
            self.moreInfoCSS = ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
                ? [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_ipad" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil]
                : [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:"category_more_info_iphone" ofType:"css"]  encoding:NSUTF8StringEncoding error:nil];
    }
}

    class func host() -> String {
        
    // SSO sites on a custom domain need access to their own sessionid.
    if ([Config currentConfig].sso && [Config currentConfig].custom_domain)
        return [Config currentConfig].custom_domain;
    // Everyone else uses the main .dozuki.com host.
    return [Config currentConfig].host;
}
    class func baseURL() -> String {
        return Config.currentConfig().baseURL
    }

}