//
//  MySwiftPackageTests.swift
//  MySwiftPackage
//
//  Created by sandeepsing-maclaptop on 01/04/25.
//

import XCTest
@testable import MySwiftPackage

final class MySwiftPackageTests: XCTestCase {
    
    func testCallFrameworkFunction() {
            let myPackage = MySwiftPackage()
            
            // Capture console output
            let output = captureOutput {
                myPackage.callFrameworkFunction()
            }
            
            // Check if the expected print statements appear
            XCTAssertTrue(output.contains("Test is running..."), "Expected 'Test is running...' in output")
            XCTAssertTrue(output.contains("MyTestFrameWork: is called"), "Expected 'MyTestFrameWork: is called' in output")
        }
    
    // Helper function to capture print output
    private func captureOutput(_ closure: () -> Void) -> String {
        let pipe = Pipe()
        let originalStdOut = dup(STDOUT_FILENO)
        dup2(pipe.fileHandleForWriting.fileDescriptor, STDOUT_FILENO)
        
        closure()
        
        fflush(stdout)
        dup2(originalStdOut, STDOUT_FILENO)
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? ""
    }
}

