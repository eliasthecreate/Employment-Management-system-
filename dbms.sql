-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2025 at 10:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `total_hours` decimal(4,2) DEFAULT NULL,
  `status` enum('Present','Absent','Late','Half-Day','Holiday') DEFAULT 'Present',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `employee_id`, `date`, `check_in`, `check_out`, `total_hours`, `status`, `notes`, `created_at`) VALUES
(1, 1, '2024-01-15', '08:55:00', '17:05:00', 8.17, 'Present', NULL, '2025-12-22 08:32:41'),
(2, 2, '2024-01-15', '09:00:00', '17:00:00', 8.00, 'Present', NULL, '2025-12-22 08:32:41'),
(3, 3, '2024-01-15', '09:10:00', '17:30:00', 8.33, 'Present', NULL, '2025-12-22 08:32:41'),
(4, 4, '2024-01-15', '08:50:00', '17:10:00', 8.33, 'Present', NULL, '2025-12-22 08:32:41'),
(5, 5, '2024-01-15', '09:30:00', '17:00:00', 7.50, 'Late', NULL, '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_code` varchar(10) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `budget` decimal(15,2) DEFAULT 0.00,
  `established_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_code`, `manager_id`, `budget`, `established_date`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Human Resources', 'HR', 1, 1000000.00, '2020-01-15', 'Handles recruitment, employee relations, and HR operations', '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(2, 'Information Technology', 'IT', 2, 2000000.00, '2020-01-15', 'Manages technology infrastructure and software development', '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(3, 'Finance', 'FIN', 3, 1500000.00, '2020-01-15', 'Handles financial planning, accounting, and budgeting', '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(4, 'Marketing', 'MKT', 4, 1200000.00, '2020-02-01', 'Responsible for marketing campaigns and brand management', '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(5, 'Sales', 'SALES', 5, 1800000.00, '2020-02-01', 'Handles sales operations and customer acquisition', '2025-12-22 08:32:41', '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Stand-in structure for view `department_summary`
-- (See below for the actual view)
--
CREATE TABLE `department_summary` (
`department_id` int(11)
,`department_name` varchar(100)
,`total_employees` bigint(21)
,`average_salary` decimal(14,6)
,`manager_name` varchar(101)
);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `national_id` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT 'USA',
  `department_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `hire_date` date NOT NULL,
  `employment_type` enum('Full-Time','Part-Time','Contract','Temporary') DEFAULT 'Full-Time',
  `salary` decimal(10,2) NOT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `profile_picture` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `emergency_contact_phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `gender`, `national_id`, `address`, `city`, `state`, `postal_code`, `country`, `department_id`, `position_id`, `hire_date`, `employment_type`, `salary`, `bank_account`, `is_active`, `profile_picture`, `emergency_contact_name`, `emergency_contact_phone`, `created_at`, `updated_at`) VALUES
(1, 'Elijah', 'Chiwaya', 'chiwayaelijah6@gmail.com', '+0763766200', '1985-03-15', 'Male', 'ZMB12345678', '123 Main St', 'Lusaka', 'LS', '10101', 'Zambia', 1, 1, '2020-03-01', 'Full-Time', 75000.00, NULL, 1, NULL, NULL, NULL, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(2, 'Joseph', 'Zulu', 'josephzulu@gmail.com', '+07777222', '1990-07-22', 'Male', 'ZMB23456789', '456 Oak Ave', 'Ndola', 'CB', '20202', 'Zambia', 2, 3, '2020-04-15', 'Full-Time', 95000.00, NULL, 1, NULL, NULL, NULL, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(3, 'Sarah', 'Mwale', 'sarah.mwale@example.com', '+07777333', '1988-11-10', 'Female', 'ZMB34567890', '789 Pine St', 'Kitwe', 'CB', '20203', 'Zambia', 3, 5, '2020-05-20', 'Full-Time', 85000.00, NULL, 1, NULL, NULL, NULL, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(4, 'David', 'Banda', 'david.banda@example.com', '+07777444', '1992-04-25', 'Male', 'ZMB45678901', '321 Cedar Rd', 'Lusaka', 'LS', '10102', 'Zambia', 4, 7, '2020-06-15', 'Full-Time', 80000.00, NULL, 1, NULL, NULL, NULL, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(5, 'Grace', 'Phiri', 'grace.phiri@example.com', '+07777555', '1991-09-18', 'Female', 'ZMB56789012', '654 Elm St', 'Livingstone', 'SO', '60101', 'Zambia', 5, 8, '2020-07-01', 'Full-Time', 50000.00, NULL, 1, NULL, NULL, NULL, '2025-12-22 08:32:41', '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_details`
-- (See below for the actual view)
--
CREATE TABLE `employee_details` (
`employee_id` int(11)
,`full_name` varchar(101)
,`email` varchar(100)
,`phone` varchar(20)
,`hire_date` date
,`salary` decimal(10,2)
,`department_name` varchar(100)
,`position_title` varchar(100)
,`is_active` tinyint(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `skill_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `proficiency_level` enum('Beginner','Intermediate','Advanced','Expert') DEFAULT 'Intermediate',
  `certification` varchar(255) DEFAULT NULL,
  `certification_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_skills`
--

INSERT INTO `employee_skills` (`skill_id`, `employee_id`, `skill_name`, `proficiency_level`, `certification`, `certification_date`, `description`, `created_at`) VALUES
(1, 1, 'HR Management', 'Expert', 'PHR Certified', NULL, NULL, '2025-12-22 08:32:41'),
(2, 1, 'Employee Relations', 'Advanced', 'SHRM-CP', NULL, NULL, '2025-12-22 08:32:41'),
(3, 2, 'Java', 'Expert', 'Oracle Certified Professional', NULL, NULL, '2025-12-22 08:32:41'),
(4, 2, 'Python', 'Advanced', NULL, NULL, NULL, '2025-12-22 08:32:41'),
(5, 3, 'Financial Analysis', 'Expert', 'CFA', NULL, NULL, '2025-12-22 08:32:41'),
(6, 3, 'Excel', 'Advanced', 'Microsoft Office Specialist', NULL, NULL, '2025-12-22 08:32:41'),
(7, 4, 'Digital Marketing', 'Advanced', 'Google Ads Certified', NULL, NULL, '2025-12-22 08:32:41'),
(8, 4, 'Social Media', 'Expert', 'Hootsuite Certified', NULL, NULL, '2025-12-22 08:32:41'),
(9, 5, 'Sales', 'Advanced', 'CSP Certified', NULL, NULL, '2025-12-22 08:32:41'),
(10, 5, 'Customer Service', 'Expert', 'CCSP', NULL, NULL, '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `leave_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` enum('Sick','Vacation','Personal','Maternity','Paternity','Bereavement','Other') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected','Cancelled') DEFAULT 'Pending',
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` timestamp NULL DEFAULT NULL,
  `applied_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`leave_id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `total_days`, `reason`, `status`, `approved_by`, `approved_date`, `applied_date`, `notes`) VALUES
(1, 1, 'Vacation', '2024-02-01', '2024-02-05', 5, 'Family vacation', 'Approved', 2, '2024-01-20 08:00:00', '2025-12-22 08:32:41', NULL),
(2, 3, 'Sick', '2024-02-10', '2024-02-12', 3, 'Flu', 'Approved', 1, '2024-02-05 12:30:00', '2025-12-22 08:32:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `payroll_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `overtime_pay` decimal(10,2) DEFAULT 0.00,
  `bonuses` decimal(10,2) DEFAULT 0.00,
  `deductions` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `net_salary` decimal(10,2) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` enum('Bank Transfer','Check','Cash') DEFAULT 'Bank Transfer',
  `status` enum('Pending','Paid','Failed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`payroll_id`, `employee_id`, `pay_period_start`, `pay_period_end`, `basic_salary`, `overtime_pay`, `bonuses`, `deductions`, `tax_amount`, `net_salary`, `payment_date`, `payment_method`, `status`, `created_at`) VALUES
(1, 1, '2024-01-01', '2024-01-15', 37500.00, 500.00, 1000.00, 800.00, 4500.00, 33700.00, '2024-01-20', 'Bank Transfer', 'Paid', '2025-12-22 08:32:41'),
(2, 2, '2024-01-01', '2024-01-15', 47500.00, 750.00, 1500.00, 1000.00, 6000.00, 42750.00, '2024-01-20', 'Bank Transfer', 'Paid', '2025-12-22 08:32:41'),
(3, 3, '2024-01-01', '2024-01-15', 42500.00, 600.00, 1200.00, 900.00, 5200.00, 38200.00, '2024-01-20', 'Bank Transfer', 'Paid', '2025-12-22 08:32:41'),
(4, 4, '2024-01-01', '2024-01-15', 40000.00, 400.00, 1000.00, 800.00, 4800.00, 35800.00, '2024-01-20', 'Bank Transfer', 'Paid', '2025-12-22 08:32:41'),
(5, 5, '2024-01-01', '2024-01-15', 25000.00, 300.00, 800.00, 500.00, 3000.00, 22600.00, '2024-01-20', 'Bank Transfer', 'Paid', '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `performance_reviews`
--

CREATE TABLE `performance_reviews` (
  `review_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `review_date` date NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `rating` decimal(3,2) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comments` text DEFAULT NULL,
  `goals` text DEFAULT NULL,
  `strengths` text DEFAULT NULL,
  `improvement_areas` text DEFAULT NULL,
  `next_review_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance_reviews`
--

INSERT INTO `performance_reviews` (`review_id`, `employee_id`, `review_date`, `reviewer_id`, `rating`, `comments`, `goals`, `strengths`, `improvement_areas`, `next_review_date`, `created_at`) VALUES
(1, 1, '2024-01-10', 2, 4.50, 'Excellent leadership and HR management skills', 'Improve employee training programs', 'Strong communication, organized, team player', 'Could improve on time management', '2024-07-10', '2025-12-22 08:32:41'),
(2, 2, '2024-01-10', 1, 4.80, 'Outstanding technical leadership and team management', 'Implement new development methodologies', 'Technical expertise, problem-solving, leadership', 'Could improve documentation practices', '2024-07-10', '2025-12-22 08:32:41'),
(3, 3, '2024-01-10', 1, 4.60, 'Excellent financial analysis and reporting', 'Streamline financial reporting processes', 'Analytical skills, attention to detail, reliability', 'Could improve on meeting deadlines', '2024-07-10', '2025-12-22 08:32:41'),
(4, 4, '2024-01-10', 1, 4.30, 'Great marketing campaign management', 'Expand digital marketing efforts', 'Creative, strategic thinking, communication', 'Could improve on data analysis', '2024-07-10', '2025-12-22 08:32:41'),
(5, 5, '2024-01-10', 4, 4.40, 'Strong sales performance and customer relations', 'Increase sales targets by 15%', 'Persuasive, customer-focused, results-driven', 'Could improve on product knowledge', '2024-07-10', '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_title` varchar(100) NOT NULL,
  `position_code` varchar(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`position_id`, `position_title`, `position_code`, `department_id`, `min_salary`, `max_salary`, `job_description`, `requirements`, `created_at`) VALUES
(1, 'HR Manager', 'HR-MGR', 1, 60000.00, 90000.00, 'Oversees all HR operations and strategies', NULL, '2025-12-22 08:32:41'),
(2, 'HR Specialist', 'HR-SPEC', 1, 45000.00, 65000.00, 'Handles employee relations and HR processes', NULL, '2025-12-22 08:32:41'),
(3, 'IT Manager', 'IT-MGR', 2, 80000.00, 120000.00, 'Manages IT infrastructure and team', NULL, '2025-12-22 08:32:41'),
(4, 'Software Developer', 'DEV', 2, 60000.00, 95000.00, 'Develops and maintains software applications', NULL, '2025-12-22 08:32:41'),
(5, 'Finance Manager', 'FIN-MGR', 3, 70000.00, 110000.00, 'Oversees financial operations and planning', NULL, '2025-12-22 08:32:41'),
(6, 'Accountant', 'ACC', 3, 50000.00, 75000.00, 'Handles accounting and financial reporting', NULL, '2025-12-22 08:32:41'),
(7, 'Marketing Manager', 'MKT-MGR', 4, 65000.00, 100000.00, 'Leads marketing strategies and campaigns', NULL, '2025-12-22 08:32:41'),
(8, 'Sales Representative', 'SALES-REP', 5, 40000.00, 70000.00, 'Responsible for sales and customer relationships', NULL, '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `project_manager_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `budget` decimal(15,2) DEFAULT NULL,
  `status` enum('Planning','In Progress','On Hold','Completed','Cancelled') DEFAULT 'Planning',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `project_code`, `description`, `department_id`, `project_manager_id`, `start_date`, `end_date`, `budget`, `status`, `created_at`) VALUES
(1, 'HR System Upgrade', 'HR-UPGRADE-2024', 'Upgrade HR management system to latest version', 1, 1, '2024-01-01', '2024-06-30', 50000.00, 'In Progress', '2025-12-22 08:32:41'),
(2, 'E-commerce Platform', 'ECOMM-2024', 'Develop new e-commerce platform', 2, 2, '2024-02-01', '2024-12-31', 150000.00, 'Planning', '2025-12-22 08:32:41'),
(3, 'Financial Reporting System', 'FRS-2024', 'Implement new financial reporting system', 3, 3, '2024-03-01', '2024-09-30', 100000.00, 'Planning', '2025-12-22 08:32:41'),
(4, 'Brand Redesign', 'BRAND-2024', 'Company-wide brand redesign and marketing', 4, 4, '2024-02-15', '2024-08-31', 80000.00, 'Planning', '2025-12-22 08:32:41'),
(5, 'Sales Training Program', 'SALES-TRAIN-2024', 'Develop and implement new sales training program', 5, 5, '2024-01-15', '2024-03-31', 25000.00, 'In Progress', '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `project_assignments`
--

CREATE TABLE `project_assignments` (
  `assignment_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  `assignment_date` date NOT NULL,
  `hours_allocated` int(11) DEFAULT NULL,
  `completion_percentage` decimal(5,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_assignments`
--

INSERT INTO `project_assignments` (`assignment_id`, `project_id`, `employee_id`, `role`, `assignment_date`, `hours_allocated`, `completion_percentage`, `notes`, `created_at`) VALUES
(1, 1, 1, 'Project Manager', '2024-01-01', 200, 20.00, NULL, '2025-12-22 08:32:41'),
(2, 1, 2, 'Technical Consultant', '2024-01-01', 100, 10.00, NULL, '2025-12-22 08:32:41'),
(3, 2, 2, 'Project Manager', '2024-02-01', 500, 5.00, NULL, '2025-12-22 08:32:41'),
(4, 2, 3, 'Backend Developer', '2024-02-01', 300, 5.00, NULL, '2025-12-22 08:32:41'),
(5, 2, 4, 'UI/UX Designer', '2024-02-01', 200, 10.00, NULL, '2025-12-22 08:32:41'),
(6, 3, 3, 'Project Manager', '2024-03-01', 400, 0.00, NULL, '2025-12-22 08:32:41'),
(7, 3, 1, 'Business Analyst', '2024-03-01', 100, 0.00, NULL, '2025-12-22 08:32:41'),
(8, 4, 4, 'Project Manager', '2024-02-15', 300, 15.00, NULL, '2025-12-22 08:32:41'),
(9, 4, 5, 'Marketing Specialist', '2024-02-15', 200, 20.00, NULL, '2025-12-22 08:32:41'),
(10, 5, 5, 'Project Manager', '2024-01-15', 150, 40.00, NULL, '2025-12-22 08:32:41'),
(11, 5, 1, 'Training Coordinator', '2024-01-15', 100, 30.00, NULL, '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','Manager','Employee') DEFAULT 'Employee',
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `employee_id`, `username`, `password_hash`, `role`, `last_login`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Elijah chiwaya', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', NULL, 1, '2025-12-22 08:32:41', '2025-12-22 08:34:04'),
(2, 2, 'jzulu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Manager', NULL, 1, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(3, 3, 'smwale', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Manager', NULL, 1, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(4, 4, 'dbanda', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Manager', NULL, 1, '2025-12-22 08:32:41', '2025-12-22 08:32:41'),
(5, 5, 'gphiri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Manager', NULL, 1, '2025-12-22 08:32:41', '2025-12-22 08:32:41');

-- --------------------------------------------------------

--
-- Structure for view `department_summary`
--
DROP TABLE IF EXISTS `department_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `department_summary`  AS SELECT `d`.`department_id` AS `department_id`, `d`.`department_name` AS `department_name`, count(`e`.`employee_id`) AS `total_employees`, avg(`e`.`salary`) AS `average_salary`, concat(`m`.`first_name`,' ',`m`.`last_name`) AS `manager_name` FROM ((`departments` `d` left join `employees` `e` on(`d`.`department_id` = `e`.`department_id` and `e`.`is_active` = 1)) left join `employees` `m` on(`d`.`manager_id` = `m`.`employee_id`)) GROUP BY `d`.`department_id`, `d`.`department_name`, concat(`m`.`first_name`,' ',`m`.`last_name`) ;

-- --------------------------------------------------------

--
-- Structure for view `employee_details`
--
DROP TABLE IF EXISTS `employee_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_details`  AS SELECT `e`.`employee_id` AS `employee_id`, concat(`e`.`first_name`,' ',`e`.`last_name`) AS `full_name`, `e`.`email` AS `email`, `e`.`phone` AS `phone`, `e`.`hire_date` AS `hire_date`, `e`.`salary` AS `salary`, `d`.`department_name` AS `department_name`, `p`.`position_title` AS `position_title`, `e`.`is_active` AS `is_active` FROM ((`employees` `e` join `departments` `d` on(`e`.`department_id` = `d`.`department_id`)) join `positions` `p` on(`e`.`position_id` = `p`.`position_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `unique_employee_date` (`employee_id`,`date`),
  ADD KEY `idx_attendance_employee_date` (`employee_id`,`date`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`),
  ADD UNIQUE KEY `department_code` (`department_code`),
  ADD KEY `fk_department_manager` (`manager_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `national_id` (`national_id`),
  ADD KEY `idx_employee_department` (`department_id`),
  ADD KEY `idx_employee_position` (`position_id`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `idx_leave_employee_status` (`employee_id`,`status`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`payroll_id`),
  ADD KEY `idx_payroll_employee_period` (`employee_id`,`pay_period_start`,`pay_period_end`);

--
-- Indexes for table `performance_reviews`
--
ALTER TABLE `performance_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`position_id`),
  ADD UNIQUE KEY `position_code` (`position_code`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD UNIQUE KEY `project_code` (`project_code`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `project_manager_id` (`project_manager_id`);

--
-- Indexes for table `project_assignments`
--
ALTER TABLE `project_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_skills`
--
ALTER TABLE `employee_skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `payroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `performance_reviews`
--
ALTER TABLE `performance_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_assignments`
--
ALTER TABLE `project_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_department_manager` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`) ON DELETE SET NULL;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`);

--
-- Constraints for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD CONSTRAINT `employee_skills_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `employees` (`employee_id`) ON DELETE SET NULL;

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `performance_reviews`
--
ALTER TABLE `performance_reviews`
  ADD CONSTRAINT `performance_reviews_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `performance_reviews_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`project_manager_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `project_assignments`
--
ALTER TABLE `project_assignments`
  ADD CONSTRAINT `project_assignments_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_assignments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
