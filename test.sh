g++ main.cpp -o prog
if [ $? -ne 0 ]
	then
		echo "Compile Error"
fi
