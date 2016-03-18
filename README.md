# CocoaPod-iOS-App-Chains-ObjectiveC
App Chains are the easy way to code Real Time Personalization (RTP) into your app. 
Easily add an App-Chains functionality using this CocoaPod plugin for ObjectiveC iOS apps


Contents
=========================================
* Introduction
* Example (of an app using RTP)
* CocoaPod integration
* Configuration
* Troubleshooting
* Resources
* Maintainers
* Contribute


Introduction
=========================================
An app chain is an integration of an API call and an analysis of an app user's genes. Each app chain provides information about a specific trait, condition, disease, supplement or medication. App chains are used to provide genetically tailored content to app users so that the user experience is instantly personalized at the genetic level. This is called [Real Time Personalization (RTP)](https://sequencing.com/developer-documentation/what-is-real-time-personalization-rtp).

Each app chain consists of:

1. **API call**
 * API call that triggers an app hosted by Sequencing.com to perform genetic analysis on your app user's genes
2. **API response**
 * the straightforward, easy-to-use results are sent to your app as the API response
3. **Personalzation**
 * your app uses this information, which is obtained directly from your app user's genes in real-time, to create a truly personalized user experience

To code Real Time Personalization (RTP) technology into apps, developers may [register for a free account](https://sequencing.com/user/register/) at Sequencing.com. App development with RTP is always free.


Example
======================================
What types of apps can you personalize with app chains? Any type of app... even a weather app. 
* The open source [Weather My Way +RTP app](https://github.com/SequencingDOTcom/Weather-My-Way-RTP-App/) differentiates itself from all other weather apps because it uses app chains to provide genetically tailored content in real-time to each app user.
* Experience it yourself using one of the fun sample genetic data files. These sample files are provided for free to all apps that use app chains.


CocoaPod integration
======================================
Please follow this guide to install App-Chain module in your existed or new project

	* see general CocoaPods instruction 
		```
		https://cocoapods.org > getting started
		```
			
	* create a new project in Xcode
	
	* create Podfile in your project directory: 
		```
		$ pod init
		```
		
	* specify ```sequencing-app-chains-api-objc``` pod parameters: 
		```
		$ pod 'sequencing-app-chains-api-objc', '~> 1.0.0'
		```		
		
	* install the dependency in your project: 
		```
		$ pod install
		```
		
	* always open the Xcode workspace instead of the project file: 
		```
		$ open *.xcworkspace
		```


Configuration
======================================
There are no strict configurations that have to be performed.

Just drop the source files for an app chain into your project to add Real-Time Personalization to your app.

Code snippets below contain the following three placeholders. Please make sure to replace each of the placeholders with real values:
* ```<your token>``` 
 * replace with the oAuth2 secret obtained from your [Sequencing.com account](https://sequencing.com/api-secret-generator)
  * The code snippet for enabling Sequencing.com's oAuth2 authentication for your app can be found in the [oAuth2 code and demo repo](https://github.com/SequencingDOTcom/oAuth2-code-and-demo)

* ```<chain id>``` 
 * replace with the App Chain ID obtained from the list of [App Chains](https://sequencing.com/app-chains)

* ```<file id>``` 
 * replace with the file ID selected by the user while using your app
  * The code snippet for enabling Sequencing.com's File Selector for your app can be found in the [File Selector code repo](https://github.com/SequencingDOTcom/File-Selector-code)


### Objective-C

AppChains Objective-C API overview

Method  | Purpose | Arguments | Description
------------- | ------------- | ------------- | -------------
`-(instancetype)initWithToken:(NSString *)token` | Constructor | **token** - security token provided by sequencing.com | 
`-(instancetype)initWithToken:(NSString *)token withHostName:(NSString *)hostName`  | Constructor | **token** - security token provided by sequencing.com <br> **hostName** - API server hostname. api.sequencing.com by default | Constructor used for creating AppChains class instance in case reporting API is needed and where security token is required
`- (void)getReportWithRemoteMethodName:(NSString *)remoteMethodName             withApplicationMethodName:(NSString *)applicationMethodName                      withDatasourceId:(NSString *)datasourceId withSuccessBlock:(void (^)(Report *result))success withFailureBlock:(void (^)(NSError *error))failure`  | Reporting API | **remoteMethodName** - REST endpoint name, use "StartApp" <br> **applicationMethodName** - name of data processing routine <br> **datasourceId** - input data identifier <br> <br> **success** - callback executed on success operation<br> **failure** - callback executed on operation failure

Adding code to the project:
* Add AppChains.h, AppChains.m into your source folder and import AppChains in your Objective-C source file (```#import "AppChains.h"```).

After that you can start utilizing Reporting API

```objectivec
[appChains getReportWithRemoteMethodName:@"StartApp"
               withApplicationMethodName:@"<chain id>"
                        withDatasourceId:@"<file id>"
                        withSuccessBlock:^(Report *result) {
                               NSArray *arr = [result getResults];
                               for (Result *obj in arr) {
                                    ResultValue *frv = [obj getValue];

                                    if ([frv getType] == kResultTypeFile) {
                                        [(FileResultValue *)frv saveToLocation:@"/tmp/"];
                                    }
                                }
                            } withFailureBlock:^(NSError *error) {
                                NSLog(@"Error occured: %@", [error description]);
                            }];
```


Troubleshooting
======================================
Each app chain code should work straight out-of-the-box without any configuration requirements or issues. 

Other tips

* Ensure that the following three placeholders have been substituted with real values:

1. ```<your token>```
  * replace with the oAuth2 secret obtained from your [Sequencing.com account](https://sequencing.com/api-secret-generator)
   * The code snippet for enabling Sequencing.com's oAuth2 authentication for your app can be found in the [oAuth2 code and demo repo](https://github.com/SequencingDOTcom/oAuth2-code-and-demo)
2. ```<chain id>```
  * replace with the App Chain ID obtained from the list of [App Chains](https://sequencing.com/app-chains)
3. ```<file id>```
  * replace with the file ID selected by the user while using your app. 
   * The code snippet for enabling Sequencing.com's File Selector for your app can be found in the [File Selector code repo](https://github.com/SequencingDOTcom/File-Selector-code)
   
* [Developer Documentation](https://sequencing.com/developer-documentation/)

* [oAuth2 guide](https://sequencing.com/developer-documentation/oauth2-guide/)

* Review the [Weather My Way +RTP app](https://github.com/SequencingDOTcom/Weather-My-Way-RTP-App/), which is an open-source weather app that uses Real-Time Personalization to provide genetically tailored content

* Confirm you have the latest version of the code from this repository.


Resources
======================================
* [App chains](https://sequencing.com/app-chains)
* [File selector code](https://github.com/SequencingDOTcom/File-Selector-code)
* [Developer center](https://sequencing.com/developer-center)
* [Developer Documentation](https://sequencing.com/developer-documentation/)

Maintainers
======================================
This repo is actively maintained by [Sequencing.com](https://sequencing.com/). Email the Sequencing.com bioinformatics team at gittaca@sequencing.com if you require any more information or just to say hola.

Contribute
======================================
We encourage you to passionately fork us. If interested in updating the master branch, please send us a pull request. If the changes contribute positively, we'll let it ride.
