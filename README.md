# Employee Management System (EMS)

A modern, web-based Employee Management System designed to streamline team operations, track attendance, manage payroll, and handle leave requests. Built with PHP, MySQL, and styled with Tailwind CSS for a premium, responsive user experience.

## ✨ Key Features

-   **Dashboard**: A centralized overview of team operations and real-time stats.
-   **Employee Management**: Full CRUD (Create, Read, Update, Delete) functionality for employee records.
-   **Department & Project Tracking**: Organize employees into departments and assign them to specific projects.
-   **Attendance System**: Track daily check-ins and check-outs.
-   **Payroll Management**: Automated salary calculations and payroll generation.
-   **Leave Management**: Submit and manage employee leave requests.
-   **Role-Based Access**: Specialized views and permissions for Admins, Managers, and Employees.
-   **Modern UI**: Beautifully designed interface using Tailwind CSS with glassmorphism effects and dark mode aesthetics.

## 🛠️ Technology Stack

-   **Backend**: PHP (PDO for database interactions)
-   **Database**: MySQL
-   **Frontend**: HTML5, Vanilla JavaScript, Tailwind CSS (CDN)
-   **Styling**: Custom CSS for enhanced visuals

## 🚀 Getting Started

Follow these steps to get the application running on your local machine using XAMPP.

### Prerequisites

1.  **XAMPP** installed (Download from [Apache Friends](https://www.apachefriends.org/index.html)).
2.  **Web Browser** (Chrome, Firefox, Edge, etc.).

### Installation Steps

1.  **Clone or Copy the Project**:
    Place the project folder into your XAMPP's `htdocs` directory:
    `C:\xampp\htdocs\dbms`

2.  **Start XAMPP Services**:
    Open the XAMPP Control Panel and start **Apache** and **MySQL**.

3.  **Setup the Database**:
    -   Open your browser and go to `http://localhost/phpmyadmin`.
    -   Create a new database named `dbms`.
    -   Import the SQL schema (if provided) or create the necessary tables: `employees`, `users`, `departments`, `attendance`, `leaves`, `payroll`, and `projects`.

4.  **Configure Database Connection**:
    -   Open `db.php` in the project root.
    -   Ensure the database credentials match your local setup:
        ```php
        $host = 'localhost';
        $db   = 'dbms';
        $user = 'root'; // Default XAMPP user
        $pass = '';     // Default XAMPP password (empty)
        ```

5.  **Access the Application**:
    -   Navigate to `http://localhost/dbms` in your web browser.

## 🔑 Demo Credentials

To explore the dashboard immediately, use the following demo account:

-   **Username**: `Elijah chiwaya`
-   **Password**: `password`

> [!NOTE]
> You can also use the **"Fill demo credentials"** button on the login page to quickly populate these fields.

## 📁 Project Structure

-   `index.php` - Homepage/Entry point.
-   `login.php` / `logout.php` - Authentication management.
-   `dashboard.php` - Main administrative overview.
-   `employees.php` - Employee listing and management.
-   `attendance.php` - Attendance tracking module.
-   `payroll.php` - Salary and payroll processing.
-   `db.php` - Database connection configuration.
-   `functions.php` - Core utility functions and security helpers.
-   `header.php` / `footer.php` - Reusable UI components.

---

### 📝 Important Note
Ensure the `BASE_PATH` in `functions.php` or `header.php` matches your directory structure if you rename the project folder. By default, it is configured for `/dbms`.
