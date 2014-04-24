# loop through the files and list country with highest 
# life expectancy

for filename in *.txt
    do source ../scripts/lifeExp.sh $filename
done
