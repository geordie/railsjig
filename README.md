# Railsjig

Railsjig is a jig for quickly bootstrapping new database driven rails applications. Using the jig, you will produce two Docker containers that drive your application, one for the Rails app itself, and the other for the database that the app uses to manage data.

## Prerequisites

* docker
* docker-compose

## Getting Started

To use railsjig to rapidly get a database driven rails application running:

1. Clone the jig repository to a local directory with the name you want to use for your app. To achieve this, run the following command, replacing *new-app* with your app name:

	> git clone git@github.com:geordie/railsjig.git *new-app*

	This command will create a directory named *new-app* that contains the files required to build your container set.

2. Navigate to the cloned repository

   > cd *new-app*

3. Run the following script to build your new application's container set:

	> ./buildjig.sh

	**Optional**: This script has options that you can optionally use to configure your application. For example, use the -p argument to specify the database root user password to initialize with:

	> ./buildjig.sh -p my-db-password

	To see other options:

	> ./build.sh -h

	This command will take several minutes to complete.

4. Start your application:

	> docker-compose up

5. In a browser, navigate to your app at http://localhost

6. Congratulations, you can now rapidly iterate on your data model and application code.

7. Now that you've successfully bootstrapped your new application, you will likely want to disassociate the railsjig repo from your application directory. The following command will remove the git remote associated with railsjig:

	> git remote remove origin

# Additional Details

- MySQL is currently the only supported database

- Please submit an issue if you have questions, comments, or would like to contribute.










