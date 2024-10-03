#!/bin/bash

mkdir -p submission_reminder_app

cd submission_reminder_app || exit

touch reminder.sh functions.sh config.env submissions.txt


echo "davy, shell  navigation, submitted" >> submissions.txt
echo "chris, linux commands, submitted" >> submissions.txt
echo "loic, shell navigation, not submitted" >> submissions.txt
echo "eric, shell script, submitted" >> submissions.txt
ech0 "bruce, shell navigation, not submitted" >> submissions.txt


echo "#!/bin/bash
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
" > reminder.sh
chmod +x reminder.sh

echo "#!/bin/bash

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

" > functions.sh
chmod +x functions.sh 

echo "# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
"> config.env
echo "MAX_SUBMISSIONS=100" >> config.env


echo "Environment setup complete!"

