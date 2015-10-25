Getting and Cleaning Data
=========================

Description
-----------

As part of the project, the the 'UCI HAR Dataset' is already in the solution.  This program will combine the output from the test and training sets, and analyse the mean and standard deviation for the data sets.  By default the output will be put into the 'Tidy' directory, so please verify it is there if you are not specifying a file.

Usage
-----
- run_analysis(file name)

Arguments
---------
x - Name of the outputfile

Details
-------
This program can use a significant amount of memory depending on the size of the files combined, and is really locked into one dataset that is specified as part of the project.


Sample Output
-------------
<p>
<p><code>"sub" "activity" "mean" "stddev"</code></p>
<p><code>1 "WALKING" -0.463716542749936 0.497295074540271</code></p>
<p><code>2 "STANDING" -0.486713996139449 0.502811089306893</code></p>
<p>etc.</p>
</p>