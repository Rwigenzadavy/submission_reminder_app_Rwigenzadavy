#!/bin/bash

mkdir -p submission_reminder_app

cd submission_reminder_app || exit

touch reminder.sh functions.sh config.env submissions.txt


echo "Student1, Assignment1, 2024-10-01" >> submissions.txt
echo "Student2, Assignment2, 2024-10-02" >> submissions.txt
echo "Student3, Assignment3, 2024-10-03" >> submissions.txt
echo "Student4, Assignment4, 2024-10-04" >> submissions.txt
echo "Student5, Assignment5, 2024-10-05" >> submissions.txt


echo "#!/bin/bash" > reminder.sh
echo "echo 'Reminder script running...'" >> reminder.sh
chmod +x reminder.sh

echo "#!/bin/bash" > functions.sh
echo "function hello() {" >> functions.sh
echo "    echo 'Hello from functions.sh'" >> functions.sh
echo "}" >> functions.sh
chmod +x functions.sh 

echo "APP_NAME='Submission Reminder'" > config.env
echo "MAX_SUBMISSIONS=100" >> config.env


echo "Environment setup complete!"

