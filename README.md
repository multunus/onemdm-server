# OneMDM Server 

## Table of Contents

* [About OneMDM](#about-one-mdm)
* [Live Demo](#live-demo)
* [Quick Start](#quick-start)
* [Features](#features)
* [Bugs and Feature Requests](#bugs-and-feature-requests)
* [Contributing](#contributing)
* [Copyright and License](#copyright-and-license)

## About OneMDM

OneMDM is an open source Mobile Device Management (MDM) solution. OneMDM can manage widely distributed android devices which are enrolled in the OneMDM server after installing OneMDM client on these devices.

![devices](https://cloud.githubusercontent.com/assets/5321440/11210309/55bbbff4-8d4d-11e5-9430-03757b0976a3.png)

## Live Demo

You can check the live demo of the server here: [One MDM Server](https://demo-onemdm.herokuapp.com). You can sign in using  the email `user@onemdm.com` and the password `demo1mdm`.

[Download the apk](http://bit.ly/demo-mdm) and install it in your device. Open the OneMDM app for registering your device. Once registered, you can view your device (Model number) in the live demo admin console.

__Note__: Your device will be deleted from the live demo server after ___24 hours___.

[![Code Climate](https://codeclimate.com/github/multunus/onemdm-server/badges/gpa.svg)](https://codeclimate.com/github/multunus/onemdm-server)

[![wercker status](https://app.wercker.com/status/85bee6f48800554f27ff573ebc85a57c/m/master "wercker status")](https://app.wercker.com/project/bykey/85bee6f48800554f27ff573ebc85a57c)


## Quick Start

Eager to get started? This section gives a good introduction to set up OneMDM and run the server on your local machine.

#### Setting up OneMDM Server

OneMDM server uses PostgreSQL as database. Install PostgreSQL if it is not installed already:

``` bash
sudo apt-get install postgresql postgresql-contrib postgresql-server-dev-9.3
```

Clone the repo and install the gems:

``` bash
git clone https://github.com/multunus/onemdm-server.git
cd onemdm-server
bundle install
```

Create `database.yml`. And example file is provided in the `config` directory. Also, update the PostgreSQL username and password in the file:

``` bash
cp config/database.yml.example config/database.yml
```

Create and migrate database:

``` bash
rake db:create
rake db:migrate
```

Run the server:

``` bash
rails s -b 0.0.0.0
```

Now head over to [http://localhost:3000/admin](http://localhost:3000/admin), and you see your OneMDM dashboard.

#### Setting up OneMDM Client

One MDM Client is the android application to run on the client device to communicate with the One MDM Server. Follow these [instructions to set up OneMDM Client](https://github.com/multunus/onemdm-client/blob/master/README.md)

## Features

Features which are currently available :

* **Tracking Device Status**
 
 Track online/offline status of the device in the admin console.

* **Update OneMDM Client App**

  Send notification to registered devices for updating the OneMDM Client.

## Bugs and Feature Requests

Looking to contribute something to OneMDM? **Here's how you can help.**

Please take a moment to read the below information in order to make the contribution process easy and effective for everyone involved.

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue or assessing patches and features.

### Feature Requests

Feature requests are welcome. But take a moment to find out whether your idea fits with the scope and aims of the project. It's up to *you* to make a strong case to convince the project's developers of the merits of this feature. Please provide as much detail and context as possible.

### Bug Reports

A bug is a _demonstrable problem_ that is caused by the code in the repository.
Good bug reports are extremely helpful, so thanks!

Guidelines for bug reports:

0. **Use the GitHub issue search** &mdash; check if the issue has already been
   reported.

1. **Check if the issue has been fixed** &mdash; try to reproduce it using the
   latest `master` or development branch in the repository.

A good bug report shouldn't leave others needing to chase you up for more information. Please try to be as detailed as possible in your report. What is your environment? What steps will reproduce the issue? What OS experience the problem? What would you expect to be the outcome? All these details will help people to fix any potential bugs.

Example:

> Short and descriptive example bug report title
>
> A summary of the issue and the browser/OS environment in which it occurs. If
> suitable, include the steps required to reproduce the bug.
>
> 1. This is the first step
> 2. This is the second step
> 3. Further steps, etc.
>
>
> Any other information you want to share that is relevant to the issue being
> reported. This might include the lines of code that you have identified as
> causing the bug, and potential solutions (and your opinions on their
> merits).

## Contributing

If you would like to contribute code you can do so through GitHub by forking the repository and sending a pull request.

When submitting code, please make every effort to follow existing conventions and style in order to keep the code as readable as possible. Please also make sure your code compiles by running mvn clean verify.

## Copyright and License

    Copyright 2015 Multunus Software Pvt Ltd

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
