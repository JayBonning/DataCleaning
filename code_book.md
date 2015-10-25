# Data Cleaning assignment #1
The data provided to us was broken out into several files.  We will be utilizing the information from 'Human Activity Recognition Using Smartphones Data Set' which was originally gathered at University of California Irvine.  It was a study in which 30 people between the ages of 19-48 were given a smart phone and the g-force of their activites was recorded over a variety of activites.
<p>
This program takes the output data from the study and combines it into one dataset.  This data is then merged down into the individual component mean and standard deviation per acticity.  All the measurements are in G forces.
<p>

##Original Codebook Addendum
This project extracts and analyses data from the original 'Human Activity Recognition Using Smartphones Data Set'.  This was originally downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  The original data and codebook are available as part of this project.


The dataset includes the following files:
=========================================

- code_book.md
- readme.md - File describing the usage of this program
- run_analysis.R - File with R programming code to combine and anaylse the data provided
- UCI HAR Dataset - Full/Original dataset the application will work against.

output file information
=======================

sub
    Subject Number
        Numeric indication of a unique subject
        
activity
    Subject Activity
        Activity the subject was performing duting analysis
        
mean
    Average G Force
        Average relative g force the subject exerted during the activity

stddev
    G Force standard deviation
        Average standard deviation on the measured G force.