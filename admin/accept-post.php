<?php
include "partials/header.php";

if (!isset($_SESSION['user_is_admin'])) {
    header("location: " . ROOT_URL . "logout.php");
    //destroy all sessions and redirect user to login page
    session_destroy();
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id'])) {
    // Retrieve the post ID from the URL parameter
    $post_id = $_GET['id'];

    // Update the status of the post to 'accepted' in the database
    $query = "UPDATE posts SET status = 'accepted' WHERE id = '$post_id'";
    $result = mysqli_query($connection, $query);

    if ($result) {
        // Redirect back to the pending posts page with success message
        $_SESSION['accept-post-success'] = "Post accepted successfully.";
        header("location: " . ROOT_URL . "admin/pending-posts.php");
        exit();
    } else {
        // Redirect back to the pending posts page with error message
        $_SESSION['accept-post-error'] = "Error accepting the post. Please try again.";
        header("location: " . ROOT_URL . "admin/pending-posts.php");
        exit();
    }
} else {
    // Redirect back to the pending posts page if post ID is not provided
    header("location: " . ROOT_URL . "admin/pending-posts.php");
    exit();
}
?>
