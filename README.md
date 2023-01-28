# Flutter app architecture

Model–View–ViewModel (MVVM) is a very established architectural pattern when it's come to software development. Here I have tried to put MVVM in simple example which will help you to implement in any project.

<p align="center">
  <img src="https://uploads.toptal.io/blog/image/127608/toptal-blog-image-1543413671794-80993a19fea97477524763c908b50a7a.png" />
</p>

## Introduction

This sample demonstrates how one can

- Setup base architecture of Flutter app using Stacked plugin
- Use dependency injection for layers separation
- Code generator to generate boilerplate code for DI, routes and JSON parsing
- Make api calls using Retrofit plugin (mostly Android developers might be familier with it).

Apart from the basic architecture setup, this sample also demonstrates

- Project folder structure
- Navigation using ViewModel (without context)
- Easy data sharing between the screens
- And few more...

#### dependencies

- [dio](https://pub.dev/packages/dio) : http client
- [retrofit](https://pub.dev/packages/retrofit) : apis 
- [result_monad](https://pub.dev/packages/result_monad) : Result Monad (e.g wrapping result for success and failure) 
- [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger) : logs network calls in a pretty, easy to read format 
- [stacked](https://pub.dev/packages/stacked) : mvvm plugins (viewmodels) 
- [auto_route](https://pub.dev/packages/auto_route) : navigation 
- [get_it](https://pub.dev/packages/get_it): dependency injection
- [mockito](https://pub.dev/packages/mockito): unit testing

# Module Structure

<p align="center">
  <img src="https://camo.githubusercontent.com/a5485a38e6af7aa1055807a47e1833fc9a35eb7b997940b26936dcffae760623/68747470733a2f2f6d69726f2e6d656469756d2e636f6d2f6d61782f3737322f302a73664344456235373157442d374566502e6a7067" />
</p>

There are 3 main modules to help separate the code. They are Data, Domain, and Application.

- **Data** contains Local Storage, APIs, Data objects (Request/Response object, DB objects), and the repository implementation.

- **Domain** contains UseCases, Domain Objects/Models, and Repository Interfaces

- **Application** contains UI, View Objects, Widgets, etc. Can be split into separate modules itself if needed. For example, we could have a module called Device handling things like camera, location, etc.


# Package structure
- using modular architecture to architect the app per feature to be easier and more readable and isolate the feature from each other

<p>
  <img src="https://user-images.githubusercontent.com/19567934/183311532-5efde826-f8ef-48a7-8df5-a0ed1731a2a0.png" />
</p>

# Repository
- Bridge between Data layer and Domain layer
- Connects to data sources and returns mapped data
- Data sources include DB and Api

# UseCase
- Responsible for connecting to repository to retrieve necessary data. returns a Stream that will emit each update.
- This is where the business logic takes place.
- Returns data downstream.
- Single use.
- Lives in Domain (No Platform dependencies. Very testable).

# ViewModel
- Organizes data and holds View state.
- Talks to use cases.
- Does not know about the View.

# View
- Updates UI
- Knows about the ViewModel
- Observes changes to ViewModel.

# Router
- I leave this open ended to suit each projects needs. The main point here is that it is important to consolidate navigation logic to one place. This helps with maintenance and unit testing.

## Setup

One can download the code in zip format or take checkout from the git repository.

### Note
You need to run build_runner command for code generation everytime when you make changes in your original file.

## Todo
- to add more unit tests to increase code coverage
- add widget & integration testing
