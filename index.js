// Requires
const mysql = require('mysql');
const inquirer = require('inquirer');
require('console.table');

// Prompts
const promptMessages = {
    viewAllEmployees: "View Employees",
    viewByDepartment: "View Employees by Department",
    viewByManager: "View Employees by Manager",
    addEmployee: "Add Employee",
    removeEmployee: "Remove Employee",
    updateRole: "Update Employee Roles",
    updateEmployeeManager: "Update Employee Managers",
    viewAllRoles: "View all Roles",
    exit: "Exit",
};

const connection = mysql.createConnection({
    host: 'localhost',

    port: 3306,

    user: 'root',

    password: 'm00m00c0ws',
    database: 'employees'
});

connection.connect(err => {
    if (err) throw err;
    prompt();
});

function prompt() {
    inquirer.prompt({
        name: 'action',
        type: 'list',
        message: 'What would you like to do?',
        choices: [
            promptMessages.viewAllEmployees,
            promptMessages.viewByDepartment,
            promptMessages.viewByManager,
            promptMessages.addEmployee,
            promptMessages.removeEmployee,
            promptMessages.updateRole,
            promptMessages.exit
        ]
    })
    .then(answer => {
        console.log('answer', answer);
        switch (answer.action) {
            case promptMessages.viewAllEmployees:
                viewAllEmployees();
                break;

            case promptMessages.viewByDepartment:
                viewByDepartment();
                break;

            case promptMessages.viewByManager:
                viewByManager();
                break;

            case promptMessages.addEmployee:
                addEmployee();
                break;

            case promptMessages.removeEmployee:
                remove('delete');
                break;

            case promptMessages.updateRole:
                remove('role');
                break;

            case promptMessages.viewAllRoles:
                viewAllRoles();
                break;

            case promptMessages.exit:
                connection.end();
                break;
        }
    })
}