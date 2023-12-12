// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringOperations {
    // Concatenate two strings
    function concatenateStrings(string memory a, string memory b) public pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }

    // Get the length of a string
    function getStringLength(string memory str) public pure returns (uint) {
        return bytes(str).length;
    }

    // Compare two strings
    function compareStrings(string memory a, string memory b) public pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

    // Convert string to uppercase
    function convertToUppercase(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        for (uint i = 0; i < strBytes.length; i++) {
            if ((uint8(strBytes[i]) >= 97) && (uint8(strBytes[i]) <= 122)) {
                strBytes[i] = bytes1(uint8(strBytes[i]) - 32);
            }
        }
        return string(strBytes);
    }

    // Check if a string contains another string
    function containsSubstring(string memory str, string memory substr) public pure returns (bool) {
        return (bytes(str).length >= bytes(substr).length) && (keccak256(abi.encodePacked(str)) == keccak256(abi.encodePacked(substr)));
    }
    
    function reverseString(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        uint len = strBytes.length;
        for (uint i = 0; i < len / 2; i++) {
            bytes1 temp = strBytes[i];
            strBytes[i] = strBytes[len - 1 - i];
            strBytes[len - 1 - i] = temp;
        }
        return string(strBytes);
    }

    // Get the substring of a string
    function getSubstring(string memory str, uint start, uint length) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        require(start + length <= strBytes.length, "Substring out of bounds");
        bytes memory result = new bytes(length);
        for (uint i = 0; i < length; i++) {
            result[i] = strBytes[start + i];
        }
        return string(result);
    }

    // Count occurrences of a substring in a string
    function countOccurrences(string memory str, string memory substr) public pure returns (uint) {
        bytes memory strBytes = bytes(str);
        bytes memory substrBytes = bytes(substr);
        uint count = 0;
        for (uint i = 0; i <= strBytes.length - substrBytes.length; i++) {
            bool isMatch = true;
            for (uint j = 0; j < substrBytes.length; j++) {
                if (strBytes[i + j] != substrBytes[j]) {
                    isMatch = false;
                    break;
                }
            }
            if (isMatch) {
                count++;
                i += substrBytes.length - 1; // Skip to the end of the matching substring
            }
        }
        return count;
    }
    function removeSpaces(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        uint len = strBytes.length;
        uint destIndex = 0;
        for (uint i = 0; i < len; i++) {
            if (strBytes[i] != bytes1(" ")) {
                strBytes[destIndex] = strBytes[i];
                destIndex++;
            }
        }
        bytes memory result = new bytes(destIndex);
        for (uint i = 0; i < destIndex; i++) {
            result[i] = strBytes[i];
        }
        return string(result);
    }

    // Remove special characters from a string
    function removeSpecialCharacters(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        uint len = strBytes.length;
        uint destIndex = 0;
        for (uint i = 0; i < len; i++) {
            if (
                (strBytes[i] >= bytes1("0") && strBytes[i] <= bytes1("9")) ||
                (strBytes[i] >= bytes1("A") && strBytes[i] <= bytes1("Z")) ||
                (strBytes[i] >= bytes1("a") && strBytes[i] <= bytes1("z"))
            ) {
                strBytes[destIndex] = strBytes[i];
                destIndex++;
            }
        }
        bytes memory result = new bytes(destIndex);
        for (uint i = 0; i < destIndex; i++) {
            result[i] = strBytes[i];
        }
        return string(result);
    }
    
}
