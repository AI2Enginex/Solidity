// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MathContract {
    // State variable to store the result of the operations
    uint256 public result;

    // Function to add two numbers and return the result
    function addNumbers(uint256 number1, uint256 number2) public pure returns (uint256) {
        return number1 + number2;
    }

    // Function to subtract two numbers and return the result
    function subtractNumbers(uint256 number1, uint256 number2) public pure returns (uint256) {
        return number1 - number2;
    }

    // Function to multiply two numbers and return the result
    function multiplyNumbers(uint256 number1, uint256 number2) public pure returns (uint256) {
        return number1 * number2;
    }

    // Function to set result after addition
    function setResultAfterAddition(uint256 number1, uint256 number2) public {
        result = addNumbers(number1, number2);
    }

    // Function to set result after subtraction
    function setResultAfterSubtraction(uint256 number1, uint256 number2) public {
        result = subtractNumbers(number1, number2);
    }

    // Function to set result after multiplication
    function setResultAfterMultiplication(uint256 number1, uint256 number2) public {
        result = multiplyNumbers(number1, number2);
    }
    
}
