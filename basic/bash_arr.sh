#!/bin/bash

#in bash, you create array like this

arr=(one two three)

#to call the elements

echo ${arr[0]}
echo ${arr[2]}

# or shell

array=( "A" "B" "ElementC" "ElementE" )
for element in ${array[@]}
do
        echo $element
    done

    echo ""
    echo "Nbr of elements:" ${#array[@]}

    echo ""
    echo ${array[@]}
