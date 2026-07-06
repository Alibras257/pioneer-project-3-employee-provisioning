#!/bin/bash

# ==========================================
# Pioneer DevOps Project 3
# Employee Account Provisioning Tool
# ==========================================

INPUT_FILE="./input/new_employees.txt"
LOG_FILE="./logs/provisioning.log"
EMPLOYEE_DIR="./output/employees"

# Create required directories if they do not exist
mkdir -p ./logs
mkdir -p "$EMPLOYEE_DIR"

# Function to log messages with timestamp
log_message() {
    local MESSAGE="\$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" >> "$LOG_FILE"
}

# Function to create standardized username
generate_username() {
    local FULL_NAME="\$1"
    echo "$FULL_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_'
}

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file not found: $INPUT_FILE"
    log_message "ERROR: Input file not found: $INPUT_FILE"
    exit 1
fi

echo "Starting employee provisioning..."
log_message "INFO: Employee provisioning started"

# Read employee names line by line
while IFS= read -r EMPLOYEE_NAME || [ -n "$EMPLOYEE_NAME" ]; do

    # Skip empty lines
    if [ -z "$EMPLOYEE_NAME" ]; then
        continue
    fi

    USERNAME=$(generate_username "$EMPLOYEE_NAME")
    USER_DIR="$EMPLOYEE_DIR/$USERNAME"
    WELCOME_FILE="$USER_DIR/welcome.txt"

    # Create employee directory
    if mkdir -p "$USER_DIR"; then
        echo "Provisioned directory for: $EMPLOYEE_NAME"
        log_message "SUCCESS: Created directory for $EMPLOYEE_NAME at $USER_DIR"
    else
        echo "Failed to create directory for: $EMPLOYEE_NAME"
        log_message "ERROR: Failed to create directory for $EMPLOYEE_NAME"
        continue
    fi

    # Create welcome message
    cat <<EOF > "$WELCOME_FILE"
Welcome, $EMPLOYEE_NAME!

Your employee workspace has been created successfully.

Username: $USERNAME
Directory: $USER_DIR

We are excited to have you onboard.
EOF

    if [ $? -eq 0 ]; then
        echo "Created welcome message for: $EMPLOYEE_NAME"
        log_message "SUCCESS: Created welcome message for $EMPLOYEE_NAME"
    else
        echo "Failed to create welcome message for: $EMPLOYEE_NAME"
        log_message "ERROR: Failed to create welcome message for $EMPLOYEE_NAME"
    fi

done < "$INPUT_FILE"

echo "Employee provisioning completed."
log_message "INFO: Employee provisioning completed"
