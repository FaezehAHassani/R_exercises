I want to check how branching works.
<<<<<<< HEAD
First you make a new branch named as experiment and enter the branch by: git checkout -b experiment
Then you modify your file and commit it with git commit -am "Update README_test.file.md"
Then you do: git checkout master
=======

First you make a new branch named as experiment and enter the branch by: git checkout -b experiment

Then you modify your file and commit it with: git commit -am "Update README_test.file.md"

Then you do: git checkout master

>>>>>>> experiment
Then you use: git merge experiment: to merge branch experiment to master
