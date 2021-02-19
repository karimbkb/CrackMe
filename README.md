# CrackMe
A simple crack me app written in Swift

![alt text](https://i.imgur.com/X2Fje0r.png "CrackMe App")

### Tested with
* Xcode 12.3
* Apple Swift version 5.3.2 
* MacOS Big Sur

### How to run

1. Clone or download the crackme repository
2. You can find and run the `CrackMe.app` file in the root directory

### Reverse Engineering

When disassembling the app you can basically search for the register `0x01000206d` and assemble the instruction to `jmp` to the register `0x01000020d4`. When this is done you can produce a new executable and from that point on anything you type into the username and password will be valid.

Original assembly code:
![alt text](https://i.imgur.com/j2jRWna.jpg "CrackMe App Assembly Code")

After modification:
![alt text](https://i.imgur.com/eZttCFC.jpg "CrackMe App Assembly Code")

### Solution

For those who want to read the assembly line by line to provide valid credentials, this is the solution:

```
VGhlIHVzZXJuYW1lIGlzIGhhcmRjb2RlZCBhbmQgbWlnaHQgYmUgZm91bmQgaW4gdGhlIGFzc2VtYmx5IGNvZGUgc29tZXdoZXJlOiBqb2huZG9lCgpUaGUgcGFzc3dvcmQgY2FuIGJlIGFueSBiYXNlNjQgZW5jb2RlZCB1cmwgd2l0aCBodHRwczovLyBpbiB0aGUgYmVnaW5uaW5nIGFuZCBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAzMiBsZXR0ZXJzCgpFeGFtcGxlOgpqb2huZG9lCmFIUjBjSE02THk5M2QzY3VaMjl2WjJ4bExtTnZiUT09
```
