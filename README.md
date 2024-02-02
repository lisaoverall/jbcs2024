# JBCS 2024

This repository contains materials for "Fuzzing for automated vulnerability discovery", a 90-minute workshop given at the 2024 [Jean Bartik Computing Symposium](https://www.usna.edu/CS/JBCS/Jean_Bartik_Computing_Symposium_2024/index.php).

This workshop will survey automated software testing techniques with applications to vulnerability research. We will focus on fuzzing, a dynamic testing technique that leverages iterative random input generation to elicit unexpected program behavior. Attendees will learn how to run basic fuzzers, add instrumentation to programs, and perform manual root cause analysis. We will also introduce frameworks to write fuzzing harnesses and discuss some research topics in fuzzing.

Pre-requisites: students should have some object-oriented Python programming experience; C/C++ experience will be necessary for the more advanced exercises. Ideally students will also have some exposure to basic concepts in exploit development (e.g., what is a buffer overflow, unsafe C functions)

## Quick start
Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://developer.hashicorp.com/vagrant/downloads).

```bash
cd /path/to/jbcs2024
vagrant up
vagrant reload
vagrant ssh
```

Instrumenting the library for the Heartbleed example takes a while to compile, so I suggest to do the following after verifying that you can ssh into your VM:

```
cd /path/to/jbcs2024/heartbleed
make openssl
``` 
