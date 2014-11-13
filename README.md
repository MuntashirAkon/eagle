#EAGLE#

![ScreenShot](/logo.png)

Search for **relative absent words (RAW)** in genomic sequences using a reference sequence.
It builds an image with patterns reporting the absent words regions as well as report the position into a file.

## INSTALLATION ##

Simply run the following instructions at a Linux terminal:

<pre>
wget https://github.com/pratas/eagle/archive/master.zip
unzip master.zip
cd eagle-master
make cleanall 
make
</pre>

Note that these instructions will install EAGLE and several minimal programs to 
cope with specific needs, such as 3D visualization on Gnuplot.

### Run 99 Ebola virus using human as reference

Simply type:

<pre>
. RunAll.sh
</pre>

It will download, filter and find RAWs with an output 3D plot.
Nevertheless, make sure that you have gnuplot installed on your Linux box. 
If not use:

<pre>
sudo apt-get install gnuplot
</pre>

to install.

## PARAMETERS

To see the possible options type
<pre>
./smash
</pre>
or
<pre>
./smash -h
</pre>
These will print the following options:
<pre>
<p>
Usage: Eagle &#60OPTIONS&#62 ... -r [FILE]  [FILE]:&#60...&#62

  -v                       verbose mode             
  -c  &#60ctx&#62                context size model       
  -i                       use inversions           
  -ea &#60pts&#62                enlarge absent           
  -en &#60pts&#62                enlarge N's              
  -s  &#60sub&#62                sub-sample               
  -o  &#60oFile&#62              output map file          
                                                    
  -r  [rFile]              reference file (database)
                                                    
  [tFile1]:&#60tFile2&#62:&#60...&#62  target file(s)</p>         
</pre>

## CITATION ##

On using this software/method please cite:

Paper currently submitted.
DOI: doi-to-appear

## ISSUES ##

For any issue let us know at [issues link](https://github.com/eagle/smash/issues).

## LICENSE ##

GPL v2.

For more information:
<pre>http://www.gnu.org/licenses/gpl-2.0.html</pre>


