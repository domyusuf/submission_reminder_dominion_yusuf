#!/usr/bin/bash

#Creating user environment

#Prompt for name

read -p "Please enter name: " username

#Create base directory
base_dir="submission_reminder_${username}"

#Create subdirectories
mkdir -p "${base_dir}"/{app,modules,assets,config}


#Submissions file
cat << "EOF" > "$base_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Moyin, Git, submitted
Grace, Shell Basics, not submitted
Menes, Shell Navigation, submitted
Samantha, Git, not submitted
Felicia, Shell Basics, submitted
EOF

#Create config.env
cat << "EOF" > "$base_dir/config/config.env"
#Application Configuration
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

#Create function.sh
cat << "EOF" > "$base_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

#Create startup file
cat << "EOF" > "$base_dir/startup.sh"
#!usr/bin/bash
./app/reminder.sh
EOF

#Create reminder.sh
cat << "EOF" > "$base_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF


#Status message
echo "
 +-+-+-+-+-+-+-+-+-+-+
 |S|U|C|C|E|S|S|F|U|L|
 +-+-+-+-+-+-+-+-+-+-+

 "

echo "${username}'s directory created successfully"

#Change permissions

chmod +x "$base_dir/startup.sh"
chmod +x "$base_dir/modules/functions.sh"
chmod +x "$base_dir/app/reminder.sh"
