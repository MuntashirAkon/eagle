#!/bin/bash
###############################################################################
# MINIMAL SEQUENCES FOUND IN ZIKA VIRUS GENOME AND ABSENT FROM HUMAN DNA (GRC)
###############################################################################
# PARAMETERS ==================================================================
INSTALL=0;
DOWNLOAD=0; # 0
PARSE=0;
EAGLE=0;
PLOT=1;
###############################################################################
if [[ "$INSTALL" -eq "1" ]]; then
rm -fr goose-* EAGLE goose/ eagle/ ;
# GET GOOSE ===================================================================
git clone https://github.com/pratas/goose.git
cd goose/src/
make
cd ../../
cp goose/src/goose-* .
cp goose/scripts/Get* .
cp goose/scripts/Down* .
# GET EAGLE ===================================================================
git clone https://github.com/pratas/eagle.git
cd eagle/
cmake .
make
cp EAGLE ../
cp mink ../
cp rebat ../
cd ../
fi
###############################################################################
if [[ "$DOWNLOAD" -eq "1" ]]; then
. GetHumanParse.sh
perl DownloadZika.pl
fi
###############################################################################
if [[ "$PARSE" -eq "1" ]]; then
rm -fr HS-GENOME REPORT-SPLIT;
for((x=1; x<28; ++x));
  do 
  cat HS$x | grep -v ">" | tr -d -c "ACGT" >> HS-GENOME;
  done
(./goose-splitreads < zika.fa ) &> REPORT-SPLIT;
NZIKAS=`cat REPORT-SPLIT | tail -n 1 | awk '{print $1;}'`;
ZNAMES="";
for((x=1; x<$NZIKAS ; ++x));
  do
  echo "Filtering $x ...";
  cat out$x.fa | grep -v ">" | tr -d -c "ACGT" > Z$x;
  ZNAMES+="Z$x:"; 
  done
cat out$NZIKAS.fa | grep -v ">" | tr -d -c "ACGT" > Z$NZIKAS;
ZNAMES+="Z$NZIKAS";
fi
###############################################################################
if [[ "$EAGLE" -eq "1" ]]; then
mink="11";
maxk="15";
./EAGLE -v -i -t -min $mink -max $maxk -r HS-GENOME $ZNAMES
rm -f data2;
for((x=$mink ; x<=$maxk ; ++x));
  do
  for((y=1 ; y<=$NZIKAS ; ++y));
    do
    ./mink $y $x Z$y-k$x.eg
    cat Z$y-k$x.eg.mink >> data2
    rm -f Z$y-k$x.eg.mink ;
    done
  done
./rebat $NZIKAS 11000 $maxk data2
fi
###############################################################################
# BUILD 3D MAP
if [[ "$PLOT" -eq "1" ]]; then
echo 'set mapping cartesian
set view 360,0,1,1 #0,0,1,1
set auto
set zrange [14:11]
set xrange [1:11000]   
set ztics 1
set isosamples 60
set hidden3d
unset key
set palette defined (11 "red", 12 "brown", 13 "blue", 14 "grey")
set zlabel "K-mer"
set ylabel "Strain"
set xlabel "Length"
splot "data2" u 2:1:3 with points pt 1 palette' | gnuplot -persist
fi
# =============================================================================




