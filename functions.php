<?php
// functions.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Define base path if not already defined
if (!defined('BASE_PATH')) {
    // Detect base path or set to empty for root domain
    $script_dir = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME']));
    define('BASE_PATH', $script_dir === '/' ? '' : $script_dir);
}

// Ensure base path is available in session
$_SESSION['base_path'] = BASE_PATH;

function is_logged_in() {
    return isset($_SESSION['user_id']);
}

function require_login() {
    if (!is_logged_in()) {
        redirect(url('login.php'));
    }
}

function has_role($roles) {
    return in_array($_SESSION['role'], (array)$roles);
}

function require_role($roles) {
    require_login();
    if (!has_role($roles)) {
        die("Access denied.");
    }
}

function h($string) {
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

/**
 * Redirect to a URL, automatically prepending the base path if needed
 * @param string $url The URL to redirect to
 */
function redirect($url) {
    // Don't modify absolute URLs or URLs that already have the base path
    if (strpos($url, 'http') === 0 || strpos($url, BASE_PATH) === 0) {
        header("Location: " . $url);
    } else {
        // Ensure the URL starts with a slash
        $url = ltrim($url, '/');
        header("Location: " . rtrim(BASE_PATH, '/') . '/' . $url);
    }
    exit;
}

/**
 * Generate a URL with the base path
 * @param string $path The path to append to the base URL
 * @return string The full URL
 */
function url($path = '') {
    $path = ltrim($path, '/');
    return rtrim(BASE_PATH, '/') . '/' . $path;
}

function format_date($date) {
    return $date ? date('M j, Y', strtotime($date)) : '—';
}

function format_money($amount) {
    return 'K ' . number_format($amount, 2);
}