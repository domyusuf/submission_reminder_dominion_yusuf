# Submission Reminder Script

## Overview
This Bash script automates the creation of a user-specific environment to track assignment submissions. It generates a structured directory with necessary files to monitor and remind students about pending assignments.

## Features
- **User Prompt:** Requests the user's name and personalizes the base directory.
- **Directory Creation:** Generates a structured workspace with the following subdirectories:
  - `app/`: Contains the reminder script.
  - `modules/`: Stores helper functions.
  - `assets/`: Holds submission records.
  - `config/`: Stores configuration settings.
- **Submission Tracking:** Reads a predefined file listing students and their assignment statuses.
- **Reminder Functionality:** Identifies students who haven't submitted assignments and prints reminders.
- **Configuration File:** Allows easy modification of assignment details.
- **Startup Execution:** Provides a startup script for quick execution.

## Directory Structure
```
submission_reminder_<username>/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
```

## Installation & Usage
1. **Clone Repository**
   ```bash
   git clone 
   ```

2. **Make Script Executable and Run the Script**
   ```bash
   chmod +x create_environment.sh
   ./create_environment.sh
   ```
3. **Navigate To Newly Created Directory and Execute the Startup Script**
   ```bash
   cd submission_reminder_<your_name>/
   ./startup.sh
   ```

## File Descriptions
- **`submissions.txt`**: Stores students' submission records.
- **`config.env`**: Stores assignment details such as name and due date.
- **`functions.sh`**: Defines helper functions to process submissions.
- **`reminder.sh`**: Checks pending submissions and prints reminders.
- **`startup.sh`**: Runs the reminder script automatically.

## Expected Output
Upon running `startup.sh`, the script displays:
- Assignment name
- Days remaining
- List of students who haven’t submitted

Example Output:
```
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Menes has not submitted the Shell Navigation assignment!
Reminder: Grace has not submitted the Shell Navigation assignment!
```


