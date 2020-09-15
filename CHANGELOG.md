# Changelog

## [0.2.0] Minor Release: Documentation (2020-09-15)

* First draft of markdown documentation to help new users understand the existing components.
* Added a minor improvement on the Service Adapter, where the error state is being cleared after a successful response.

## [0.1.6+1] Minor bug fix on JsonService parameters (2020-07-26)

## [0.1.6] Bug fix on JsonService parameters (2020-07-23)

* Some issues were found when passing multiple path parameters to the JsonRequest, so some changes had to be done on the service itself.
* Added a skip to a failing test that should be fixed in the next release.

## [0.1.5] Bug fix on BlocProvider (2020-07-23)

## [0.1.4] Repository (2020-07-22)

* Added the Repository class, which is used as the bridge between services and the use cases.
* Minor fix on Pipe to avoid sending repeated data.
* Minor fix on BlocProvider, it now calls the dispose of the bloc when it disposes itself.
* Improved example, with another screen that accepts a generic payment.

## [0.1.3] Bloc Provider Bug Fix (2020-07-15)

## [0.1.2] Use Case and Entity (2020-07-03)

* Adding two new components to simplify the bloc code. A bloc is going to be used just as the bridge between UI components and use cases. A bloc will have multiple use cases that interact with one or more entities, each use case reflects one scenario and will be holding all the business logic. Entities will preserve the state of the business data (it is a direct replacement for the BusinessModel, which will be Deprecated on the next version)

## [0.1.1] Json Service POST fix (2020-07-03)

* A JsonService was not sending correctly the JSON body as a request parameter to RestAPI, so it was fixed.

## [0.1.0] First Minor Release (2020-05-17)

* Added the rest of the code to the example project, with tests.
* Fixed json encoding in JsonService. It is now assumed the RestApi implementation will return string responses (under evaluation, since it could be better to assume RestApi does the conversion).
* Fixed JsonService handler callbacks.
* Added tests for Presenter and Screen to showcase different ways to tests the components on flutter widget tests (driver tests are pending).

## [0.0.2] Example Fixes (2020-05-16)

* Fixed example folder, with some classes to showcause the usage of the main components. The UI is not finished.

## [0.0.1] Initial Release (2020-05-16)

* First batch of clean framework components, with tests.
