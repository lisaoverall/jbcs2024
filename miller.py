#!/usr/bin/env python3

# Adapted from:
# Andreas Zeller, Rahul Gopinath, Marcel Böhme, Gordon Fraser, and Christian Holler: "Fuzzing: Breaking Things with Random Inputs". In Andreas Zeller, Rahul Gopinath, Marcel Böhme, Gordon Fraser, and Christian Holler, "The Fuzzing Book", https://www.fuzzingbook.org/html/Fuzzer.html. Retrieved 2024-01-18 18:11:45+01:00.
#
# The content of this project is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. The source code that is part of the content, as well as the source code used to format and display that content is licensed under the MIT License. 

import os
import random
import subprocess
import tempfile


trials = 100
program = "bc"

basename = "input.txt"
tempdir = tempfile.mkdtemp()
FILE = os.path.join(tempdir, basename)


def fuzzer(max_length: int = 100, char_start: int = 32, char_range: int = 32) -> str:
    """A string of up to `max_length` characters
       in the range [`char_start`, `char_start` + `char_range`)"""
    string_length = random.randrange(0, max_length + 1)
    out = ""
    for i in range(0, string_length):
        out += chr(random.randrange(char_start, char_start + char_range))
    return out


runs = []
for i in range(trials):
    data = fuzzer()
    with open(FILE, "w") as f:
        f.write(data)
    result = subprocess.run([program, FILE],
                            stdin=subprocess.DEVNULL,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            universal_newlines=True)
    runs.append((data, result))

passing_runs = sum(1 for (data, result) in runs if result.stderr == "")
print(f"passing runs: {passing_runs}")

errors = [(data, result) for (data, result) in runs if result.stderr != ""]

# (first_data, first_result) = errors[0]
# print(repr(first_data))
# print(first_result.stderr)

nonzero_return_codes = sum(1 for (data, result) in runs if result.returncode != 0)
print(f"nonzero return codes: {nonzero_return_codes}")
