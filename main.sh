declare -a paranArray
declare -a bracketArray
echo This code controls the paranthesis in a text file. 
echo  
echo Give a directory 
read -p "Enter path:" $path

input="/home/sapmaz/Masaüstü/ata.sh"
k=0
m=0
while IFS= read -n1 line
do
	if [[ $line == "[" ]]
	then
		paranArray[$k]=$line
		k=$(($k+1))
	elif [[  $line == "{" ]]
	then 
		bracketArray[$m]=$line
		m=$(($m+1))
	fi
done < "$input"
y=0
n=0
echo Parantheses Array**********
len=(${#paranArray[@]})

for y in ${paranArray[@]}
do 
	echo Before**** $y;
done

echo Curly Brackets************* 
len=(${#bracketArray[@]})

for n in ${bracketArray[@]}
do 
	echo Before**** $n;
done
t=0
h=0
while IFS= read -n1 line
do
	if [[  $line == "]" ]]
	then
		unset paranArray[$t]
		t=$(($t+1))
		
	elif [[  $line == "}" ]]
	then 
		unset bracketArray[$h]
		h=$(($h+1))
		
	fi
done < "$input"

echo After Parantheses**********
len=(${#paranArray[@]})

for y in ${paranArray[@]}
do 
	echo After**** $y;
done
echo After Curly Brackets*************

len=(${#bracketArray[@]})

for n in ${bracketArray[@]}
do 
	echo After**** $n;
done


#check if file exist
if [ ! -e $path ] 
then
  echo "file doesnt exists"
fi
