g++ main.cpp -o prog
if [ $? -ne 0 ]
	then
		echo "Compile Error"
		exit
fi

FILES=$( ls test*.cpp)

for i in $FILES; do
	g++ $i -o $i.out
	if [ $? -ne 0 ]
		then
			echo "$i Compile Error"
			exit
	fi
done

TESTS=$( ls test*.cpp.out)

SUCCESS=0
FAIL=0

for i in $TESTS; do
	./$i
	if [ $? -ne 0 ]
		then
			FAIL=$(($FAIL + 1))
	else
		SUCCESS=$(($SUCCESS + 1))
	fi
done

echo "Test case results:"
echo "Successes: $SUCCESS"
echo "Failures: $FAIL"

if [ $FAIL -ne 0 ]
	then
		exit
fi
