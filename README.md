# THIS REPO IS ARCHIVED UNTIL I CAN FIND ENOUGH TIME TO CONTINUE WORK ON IT
# SwiftReal
Attempting to make a Swift library that can represent infinitely-long numbers (both integers and real numbers) with no loss in accuracy.

## How To Compile
To compile this code (on macOS or Linux), make sure to have the Swift compiler installed. On macOS, this compiler comes with Xcode and its command-line tools. On Linux, you will have to install various packages (such as clang). I would give a step-by-step process for this, but there is plenty of documentation already online. 

On Fedora, all you have to do is run this command to get the compiler: "sudo dnf install swift-lang".

After you have the compiler installed, navigate into the "Real" directory and run this command: "swiftc -O -whole-module-optimization *.swift -o real"
That command will compile all the Swift files under the executable "real". Run the executable with this command: "./real".

## About the Files
The files are fairly simple.

Real is a directory that holds all the source files.

Long.swift holds the implementation for the Long datatype.

Real.swift holds the implementation for the Real datatype.

main.swift holds the implementation for the unit tests. This file also acts as the driver for all the files. So if you want to test any code, you will have to do so in this file. Or if you want to incorporate this library with your own code, remove the main.swift file and make your own.

CODE_OF_CONDUCT.md explains the code of conduct of this repo (please read).

SECURITY.md explains the process of reporting a security flaw related to this repo. It also holds info for which versions are still receiving updates (please read).

LICENSE is the standard MIT License (please read).
