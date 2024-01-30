# Back-end Application
## Tech details

|**Resource**|**Resource Name**|**Version**|**Comment**|
| :-: | :-: | :-: | :-: |
|Back-end programming language|ruby|3.1.4||
|Back-end web framework|Rails|7.1.3||
|Database|MySQL|8.3.0||

## Installation & Lunch

How to run a project locally?

1. Preparing
Make sure that defined ruby and rails gem are installed on your machine. After that, install all other gems used in this project with bundle install. Last step will be starting MySQQL database on your localhost within the credentials set at `config/database.yml`

To start MySQL server: `C:\> "{Path to your MySQL Server}\bin\mysqld"`

To stop MySQL server: `C:\> "{Path to your MySQL Server}\bin\mysqld" -u root shutdown`

2. Start server
To start our server on uor localhost run `rails s`

3. Stop server
To stop our server on our localhost use `Ctrl-C`

4. Run migrations or detabase schema

To create database `rails db:create`. 

To run migrations `rails db:migrate`

To run seed `rails db:seed`

5. Run unit tests

To run unit tests run `rspec` or `rspec file/to/test`

7. Show logs
Rails will automatically show all the logs on your terminal window.

## Additional Instructions for Ubuntu

If you are working on the Ubuntu operating system, you can follow these steps to run the project:

### Installing Dependencies
Install the necessary packages such as Ruby and MySQL using the following commands:

```bash
sudo apt update
sudo apt install ruby-full
sudo apt install mysql-server
sudo systemctl start mysql.service
```
1. Installing Gems

Use the `bundle install` command to install all the necessary gems used in your project.

2. Starting MySQL

To start MySQL server:

`sudo service mysqld start`

To stop MySQL server:

`sudo service mysqld stop`

3. Starting the Server

Launch the server by using the `rails s` command

4. Stopping the Server

To stop the server, use `Ctrl-C`

5. Running Migrations and Creating the Database

To create database `rails db:create`. 

To run migrations `rails db:migrate`

To run seed `rails db:seed`

6. Running Tests

Execute unit tests using the `rspec` command

7. Checking Logs

Rails will automatically display logs in your terminal.

## After application started

To create a first user run:

1. Enter in the application console

```
rails c
```

2. Use these credentials to sign in

email: `localuser@example.com`, 
password: `password`

Or run command to create your own user, replace YOUR_EMAIL_ADDRESS with your email (you can provide your own password)

```
User.create!(email: "YOUR_EMAIL_ADDRESS", password: "password", password_confirmation: "password")
```

3. Run command to create the task. Replace PRIORITY with chosen one. You can choose one of three types of PRIORITY: { low, medium, high }

```
Task.create!(title: "your task title", description: "your task description", due_date: Date.today, priority: "PRIORITY")
```
