# Pioneer DevOps - Employee Account Provisioning Tool

## Project Overview
This project automates a simple employee onboarding workflow using a Bash script. The script reads a list of new employee names from an input file, creates a directory for each employee, generates a personalized welcome message, and logs all successful operations and errors.

## Project Goals
- Automate weekly employee onboarding tasks using Bash scripting
- Practice loops, functions, and file handling in Linux
- Create a structured repository for scripts, input files, logs, documentation, and screenshots
- Implement logging for monitoring and troubleshooting
- Document the execution flow and project assumptions

## Repository Structure

```bash
pioneer-project-3-employee-provisioning/
├── docs/
│   └── script-flow.md
├── input/
│   └── new_employees.txt
├── logs/
│   └── provisioning.log
├── output/
│   └── employees/
├── screenshots/
├── scripts/
│   └── provision_employees.sh
├── .gitignore
└── README.md
Features
Reads employee names from an input file
Creates a directory for each employee
Generates a welcome.txt file for each employee
Logs successful operations and errors with timestamps
Stores generated employee folders under output/employees/
Prerequisites
Linux environment
Bash shell
Git
Permission to execute shell scripts
Input File
The employee list is stored in:

bash
input/new_employees.txt
Each line in the file represents one new employee name.

Example:

txt
Ibraheem Aloyinlapa
John Doe
Jane Smith
Michael Johnson
Sarah Williams
David Brown
Emily Davis
Script Execution Instructions
1. Clone the repository
bash
git clone <your-repository-url>
cd pioneer-project-3-employee-provisioning
2. Make the script executable
bash
chmod +x scripts/provision_employees.sh
3. Run the provisioning script
bash
./scripts/provision_employees.sh
What the Script Does
When executed, the script will:

Read employee names from input/new_employees.txt
Generate a username for each employee by:
converting the name to lowercase
replacing spaces with underscores
Create a folder for each employee inside:
bash
output/employees/
Create a welcome.txt file inside each employee folder
Record all actions in:
bash
logs/provisioning.log
Example Output Structure
bash
output/employees/
├── ibraheem_aloyinlapa/
│   └── welcome.txt
├── john_doe/
│   └── welcome.txt
├── jane_smith/
│   └── welcome.txt
├── michael_johnson/
│   └── welcome.txt
├── sarah_williams/
│   └── welcome.txt
├── david_brown/
│   └── welcome.txt
└── emily_davis/
    └── welcome.txt
Verification Commands
View generated employee folders
bash
tree output
View the log file
bash
cat logs/provisioning.log
View a sample welcome message
bash
cat output/employees/john_doe/welcome.txt
Logging
The script writes timestamped logs to:

bash
logs/provisioning.log
The log captures:

script start
successful directory creation
successful welcome message creation
errors, if any
script completion
Documentation
Additional documentation is available in:

bash
docs/script-flow.md
This file explains:

the script workflow
logic used in the script
assumptions made in the project
Screenshots
The screenshots/ directory contains evidence of:

script execution
generated employee directories
sample welcome message
log file contents
Author
Ibraheem Aloyinlapa