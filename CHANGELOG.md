# sysinternals Cookbook CHANGELOG

This file is used to list changes made in each version of the sysinternals cookbook.

## 1.1.7 - *2024-05-06*

## 1.1.6 - *2024-02-17*

## 1.1.5 - *2023-11-01*

- Adopt cookbook from Chef cookbooks
- Require Chef 15.3
- Remove travis config
- Remove delivery
- Update workflows
- Fix markdown

## 1.1.4 - *2022-01-18*

- resolved cookstyle error: recipes/default.rb:34:5 refactor: `Chef/RedundantCode/UseCreateIfMissing`
- resolved cookstyle error: recipes/procexp.rb:22:3 refactor: `Chef/RedundantCode/UseCreateIfMissing`

## 1.1.3 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 1.1.1 (2017-11-22)

- Fix typo in full_suite recipe

## 1.1.0 (2017-11-06)

- Test with Local Delivery instead of Rake
- Added basic chefspec
- Update apache2 license string
- Add new recipe to setup the full Sysinternals Suite

## 1.0.1 (2017-02-21)

- Add windows as a supported platform in the metadata

## 1.0.0 (2017-02-21)

- Moved the cookbook to the chef-cookbooks org
- Require Chef 12.6 or later
- Add new Supermarket metadata
- Add testing in Travis CI with Rakefile
- Resolve all cookstyle warnings
- Fix registry key creation by using the correct slashes
- Adding recipe for Process Explorer
