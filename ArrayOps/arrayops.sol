// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOperations {
    // State variable to store an array of integers
    uint256[] public myArray;

    // Function to initialize the array
    function initializeArray(uint256[] memory values) public returns (uint256[] memory){
        myArray = values;
        return myArray;
    }

    // Function to get the length of the array
    function getArrayLength(uint256[] memory my_Array) public returns (uint256) {
        return initializeArray(my_Array).length;
    }
    // Function to add array element
    function getArraySum(uint256[] memory my_Array) public returns (uint256) {
        uint256 sum = 0;
        uint256[] memory myarray = initializeArray(my_Array);
        for (uint256 i = 0; i < myarray.length; i++) {
            sum += myarray[i];
        }
        return sum;
    }

    // function to multiply array elements
    function getArrayMul(uint256[] memory my_Array) public  returns (uint256) {
        uint256 mul = 1;
        uint256[] memory myarray = initializeArray(my_Array);
        for (uint256 i = 0; i < myarray.length; i++) {
            mul *= myarray[i];
        }
        return mul;
    }

    //Function to get an element at a specific index
    function getElementAtIndex(uint256[] memory my_Array,uint256 index) public returns (uint256) {
        uint256[] memory myarray = initializeArray(my_Array);
        require(index < myarray.length, "Index out of bounds");
        return myarray[index];
    }
    // function to check if value exists
    function valueExists(uint256[]  memory my_Array,uint256 value) public returns (bool) {
        uint256[] memory myarray = initializeArray(my_Array);

        for (uint256 i = 0; i < myarray.length; i++) {
            if (myarray[i] == value) {
                return true;
            }
        }
        return false;
    }
    
    // get exponential value
    function getPow(uint256[] memory my_Array, uint256 power) public returns (uint256[] memory) {
       
        uint256[] memory myarray = initializeArray(my_Array);
        for (uint256 i = 0; i < myarray.length; i++) {
            myarray[i] = myarray[i] ** power;
        }
        return myarray;
    }
    
    // divide by value
    function reduceToValue(uint256[] memory my_Array, uint256 power) public returns (uint256[] memory) {
       
        uint256[] memory myarray = initializeArray(my_Array);
        for (uint256 i = 0; i < myarray.length; i++) {
            myarray[i] = myarray[i] / power;
        }
        return myarray;
    }

}
