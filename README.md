# SMB BruteForce 1.0v

## Introduction

This batch script facilitates SMB (Server Message Block) brute-force attacks in Windows environments. It prompts users for essential information and systematically attempts to authenticate against SMB servers, providing detailed logging for security assessment.

This code has not been tested in a real environment, in addition to the fact that it was created with the sole purpose of learning and studying more about cybersecurity, remember that the code may have flaws or even is not completely functional according to its initial proposal.

## Description

This script prompts the user for a target IP address, a username, and the path to a password list file. It then attempts to log in to the SMB server using each password in the provided list. If a correct password is found, it will be displayed, and the script will terminate. A detailed record of all login attempts is maintained in a log file.

## Features

- Validation of `IP address` to ensure valid inputs.
- Checking for the existence of the `password list` file.
- Tracking progress during the brute-force process.
- Detailed logging of login attempts in a log file.

## Requirements

- This script is intended for Windows systems.
- Access to the Windows command line is required.

## Notices

- Using this script on systems `without explicit permission may violate privacy and security laws`.
- This script should only be used for educational purposes or on systems where the user has explicit authorization to test security.

## How to Use

- Enter the target SMB server's IP address.
- Enter the username to be tested.
- Provide the full path to the password list file.
- Wait while the script attempts to log in to the SMB server using the passwords from the provided list.
- If a correct password is found, it will be displayed on the screen and logged in the log file.
