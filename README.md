# Dose

> A Dependency Injection Container for Swift

## WORK IN PROGRESSSS

## ANY HELP WILL BE APPRECIATED

Coming from the PHP world, I used to develop with a lot of frameworks and concepts and one thing I like is the Dependendy Injection Container and Services system of [Symfony2](https://symfony.com/doc/current/book/service_container.html "Symfony2 Service Container")

I didn't find out amazing "simple" DIC online except Typhoon which is great but also big.
And I needed to play with Swift for a project.

Then here is Dose, a simple Dependency Injection Container clearly inspired by Symfony2 but also different and less powerful (at least for now)

## Purposes

The objective here is to bring a DIC into an iOS application.
All must stays simple, my goal was to avoid to always rely on the UIApplication delegate and always have plenty of singleton.

## Key features

* Easy to use
* Base on a configuration file
* Lazy loading of services
* All in Swift

## Why it's cool and powerful

There is a bunch of useful reasons to use a service container:

* to avoid singleton everywhere in your code
* improve the simplicity of your Units Tests
* Decrease the couplage between the different classes of your code
* Increase the legibility of your code
* Allow you to organise by "service" and share those services!
* Services will be created/instanciated only on demand wich is also a huge advantage for performances.

## Simple explanation

First, really simple, base on the dependency injection principle. Let say you have a logger which respects the protocol LoggerProtocol

You can create your MyLogger : LoggerProtocol implementing the good methods, BUT, if you want later to change your Logger using antother librairy, well if this new lib respects the LoggerProtocol you have nothing to do except to make little change in the simple Plist configuration file!

Then if you have 5 services which each needs the logger, your code won't change. You'll just have to change the definition of the service.

And to call a method on one of your service, just call it:

	Kernel.instance.get("my.service.name")->getLastFacebookComments()

> Scroll down to see how to create a service.

Look a the DoseTest classes to understand better if you're not familiar with Dependency Injection Container

> if you want to help me on the documentation, feel free to PR

## Installation

### CocoaPods (not publish yet)

CocoaPods is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

	$ gem install cocoapods
	
To integrate Dose into your Xcode project using CocoaPods, specify it in your Podfile:

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

	pod 'Dose', '~> 1.0.0'

Then, run the following command:

	$ pod install

## Usage

### Setting it up

#### A dose of a kernel

Yes, I called that the Kernel, firt you need to create it and to boostrap it.

The easiest way to get your Kernel available from where you want is to add a property on you application delegate

> Note that it is not required to do that. That is just the quickiest way.

```swift

    @UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?
        /// Your Kernel
        let kernel = Kernel()
        
        func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
            // Bootstrap your Kernel
            kernel.bootstrap()
            ....
            ....
        }
        
```

I would suggest to create your own Kernel by extending the Dose.Kernel


```swift

import Foundation
import Dose

class Kernel : Dose.Kernel {
    
    /**
    Sugar function to get the Kernel Instance
    Allow you to call Kernel.instance.get("service")
    */
    static var instance: Kernel {
        get {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            return appDelegate.kernel
        }
    }
}
```

> Doing that, you'll be able in the future to override the boostrap() method if necessary.


#### A dose of a definition

The definition file is where all the magic is set up. You need a simple Plist file that looks like:

```xml

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>parameters</key>
        <dict>
            <key>debug_output</key><true/>
            <key>lambdakey</key><string>A VALUE</string>
        </dict>
    	<key>services</key>
    	<dict>
        	<key>dose.service1</key>
        	<dict>
            	<key>class</key><string>DoseTests.Service1</string>
            	<key>arguments</key>
            	<array>
                	<string>@lambdakey</string>
                	<string>An argument</string>
	            </array>
    	    </dict>
	        <key>dose.service2</key>
    	    <dict>
        	    <key>class</key><string>DoseTests.Service2</string>
            	<key>arguments</key>
	            <array>
   		            <string>Second Service</string>
                    <string>@dose.service1</string>
	            </array>
        	</dict>
		</dict>
    </dict>
	</plist>
		
```

Find a bigger example here: <https://github.com/Plopix/Dose/blob/master/DoseTests/services.plist>

##### A dose of a service

Each service:

* is define by an name. Ex:dose.service1
* needs a "class" to be instanciated. Ex:DoseTests.Service1
  
  > Please note that you need to precise the Prefix, it's usually you application name but it could be a class from another module.

* can have several arguments.


##### A dose of an argument

The cool thing about argument is the "magic" character: "@".
Whith that you can refer to another service!

Then in the previous example, dose.service2 will have dose.service1 passed in argument in order to be instanciated.

> It works with the parameters too, because actually a parameter is not that much different than a service, one is a String or a Bool etc.. and the other is a Closure.

Amazing!

### Creating a service

Of course, it is always your responsability to create and develop you service, but he MUST extend of Dose.Service. He will receive an Array as arguments.
Here is an exemple:

```swift

    import Foundation
    import Dose

    class Service3 : Service {
        
        let name: String
        let logger: LoggerProtocol
        
        required init(args:[Any]) {
            name = args[1] as! String
            logger = args[0] as! LoggerProtocol
            super.init(args: args)
        }
    }
```

That's it, you are ready to go.

### Retrieve a service

Just call it: Kernel.instance.get("dose.service.name")

> Note that the call to a service trigger its instanciation.


## Providers

* @todo: Documentation

## Todo

* @todo: Review the documentation.
* @todo: Talked about the included Service, Providers etc...
* @todo: check the circular references
* @todo: Improve the plist features: tags? factory? inheritance?, scopes? etc..


## Credits

Mostly inspired by [Symfony2](https://github.com/symfony/symfony) Service Container, [Silex](https://github.com/silexphp/Silex) and [Pimple](https://github.com/silexphp/Pimple)

Developed by [Sébastien Morel](https://www.linkedin.com/in/sebastienmorel) supported by [Novactive](http://www.novactive.us)

## Contact, support, help, requests

Feel free to contact me: morel.seb[at]gmail[dot]com


