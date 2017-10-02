# Testing Integration (Example with Java or Ruby)

Simple project of API to run tests with RSpec/Ruby or JUnit/Cucumber/Java

## Pre Condition

- You must have already installed:
-- RVM installed
-- Bundler installed
-- Java 1.8
-- Maven
-- IntelliJ Idea Community Edition

## Project Ruby - lecture
- Get in on folder/directory lecture
- Run bundler to install project with rails:

  bundle install

- Install database:
  
  rake db:migrate

- To up server, run this command:
  
  rails s

## Framework Testing with Ruby
- Get in on folder/directory testing_ruby
- Run bundler to install framework:

  bundle install

- To run tests:
  
  rspec spec

Ps: You must have your Server Application up to run your tests

## Framework Testing with Java
- Get in on folder/directory testing_java
- Run maven to install libraries and dependecies.
  
  mvn clean install

- Open IntelliJ
- Import Maven Project
- Install Cucumber for Java plugin
- Run tests with IntelliJ

Ps: You must have your Server Application up to run your tests
