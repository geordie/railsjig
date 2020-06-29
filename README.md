# Railsjig

Railsjig is a template for quickly producing local container sets for simple database driven web applications.

## Prerequisites

* docker
* docker-compose

## Getting Started

To use railsjig to rapidly get a database driven rails application running:

1. Clone the repository to a repository with the name you want to use for your app. To achieve this, run this command, replacing *new-app* with a name of your choosing

	> git clone git@github.com:geordie/railsjig.git *new-app*

	This command will create a directory named *new-app* that contains the files required to build your container set.

2. Navigate to the cloned repository

   > cd *new-app*

3. Run the following script to build your new appliction's container set:

	> ./buildjig.sh

	**Note**: This script has options that you can optionally use to configure your application. For example, use the -p argument to specify the database root user password to initialize with:

	> ./buildjig.sh -p my-db-password

	To see other options:

	> ./build.sh -h

	This command will take several minutes to complete.

4. Start your application:

	> docker-compose up

5. In a browser, navigate to your app at http://localhost

6. Congratulations, you can now rapidly iterate on your data model and application code.

# Additional Details

- MySQL is currently the only supported database






