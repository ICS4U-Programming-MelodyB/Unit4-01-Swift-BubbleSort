// This program will sort and array
// using the bubble method.

//
//  Created by Melody Berhane

//  Created on 2023-05-9.

//  Version 1.0

//  Copyright (c) 2023 Melody. All rights reserved.
import Foundation

// This function sorts the array.
func sortBubble(_ arrayNums: [Int]) -> [Int] {
    var sortedNums = arrayNums
    // If statement, returning empty array 
    // to avoid out of bounds error. 
    if sortedNums.count < 2 {
        return sortedNums
    }
    // Usage of loop to access each element.
    for counter1 in 0..<sortedNums.count - 1 {
        for counter2 in 0..<sortedNums.count - counter1 - 1 {
            // Comparing numbers next to each other, 
            // if it is bigger it will swap and move towards the
            // end of the list. It uses the temp variable
            // to store value.
            if sortedNums[counter2] > sortedNums[counter2 + 1] {
                let temp = sortedNums[counter2]
                sortedNums[counter2] = sortedNums[counter2 + 1]
                sortedNums[counter2 + 1] = temp
            }
        }
    }
    return sortedNums
}

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line
    // also creating list.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Convert from string of list to array of integers
    // & check for blank lines.
    for line in inputLines {
        var intArray: [Int] = []
        let numberStrings = line.components(separatedBy: " ")
        
        // Checking to see if array contains blank line.
        if numberStrings.isEmpty {
            let data5 = Data("No integers found on line.\n".utf8)
            output.write(data5)
            continue
        }

        // Convert from string to integer & check for invalid input.
        for str in numberStrings {
            if let intValue = Int(str) {
                intArray.append(intValue)
            } else {
                let data5 = Data("Invalid input: '\(str)' is not a valid integer\n".utf8)
                output.write(data5)
                break
            }
        }
        
        // Sort the integer array.
        let bubbleSort = sortBubble(intArray)
        
        // Write to file.
        let data3 = Data("The sorted array is:  \(bubbleSort)\n".utf8)
        output.write(data3)
    }

    // Close input & output file.
    input.closeFile()
    output.closeFile()
}