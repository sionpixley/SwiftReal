# SwiftReal
Attempting to make a Swift library that can represent infinitely-long numbers (both integers and real numbers) with no loss in accuracy.

## How To Compile
To compile this code (on macOS or Linux), make sure to have the Swift compiler installed. On macOS, this compiler comes with Xcode and its command-line tools. On Linux, you will have to install various packages (such as clang). I would give a step-by-step process for this, but there is plenty of documentation already online. 

On Fedora, all you have to do is run this command to get the compiler: "sudo dnf install swift-lang".

After you have the compiler installed, navigate to the directory and run this command: "swiftc -O *.swift -o real"
That command will compile all the Swift files under the executable "real". Run the executable with this command: "./real".

## About the Files
The files are fairly simple.

Long.swift holds the implementation for the Long datatype (class).

Real.swift holds the implementation for the Real datatype (class).

main.swift holds the implementation for the unit tests. This file also acts as the driver for all the files. So if you want to test any code, you will have to do so in this file.
