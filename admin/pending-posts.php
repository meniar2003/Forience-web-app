<?php
include "partials/header.php";

// Check if the user is an admin, if not, redirect to logout
if (!isset($_SESSION['user_is_admin'])) {
    header("location: " . ROOT_URL . "logout.php");
    //destroy all sessions and redirect user to login page
    session_destroy();
}

// Fetch categories from the database
$query = "SELECT * FROM posts WHERE status = 'pending'";
$posts = mysqli_query($connection, $query);

?>

<section class="dashboard">
    <!-- Your alert messages code here -->

    <div class="container dashboard__container">
        <!-- Your sidebar code here -->
        <!-- Assuming you have the accept post button here in the sidebar -->
        <?php if (isset($_SESSION['user_is_admin'])) : ?>
            <aside>
                <ul>
                    <li>
                        <a href="<?= ROOT_URL ?>admin/add-post.php">
                            <i class="uil uil-pen"></i>
                            <h5>Add Post</h5>
                        </a>
                    </li>
                                    
                        
                    <li>
                        <a href="<?= ROOT_URL ?>admin/index.php">
                        <i class="uil uil-postcard"></i>                            
                        <h5>Manage Posts</h5>
                        </a>
                    </li>
                    <?php  if(isset($_SESSION['user_is_admin'])) : ?>
                    <li>
                        <a href="<?= ROOT_URL ?>admin/pending-posts.php" class="active">
                            <i class="uil uil-pen"></i>
                            <h5>Pending Posts</h5>
                        </a>
                    </li>
                    <li>
                        <a href="<?= ROOT_URL ?>admin/add-user.php">
                            <i class="uil uil-user-plus"></i> 
                            <h5>Add User</h5>
                        </a>
                    </li>  
    
                    <li>
                        <a href="<?= ROOT_URL ?>admin/manage-users.php">
                            <i class="uil uil-users-alt"></i>
                            <h5>Manage Users</h5>
                        </a>
                    </li>                    
                    <li>
                        <a href="<?= ROOT_URL ?>admin/add-category.php">
                            <i class="uil uil-edit"></i>
                            <h5>Add Category</h5>
                        </a>
                    </li>                    
                    <li>
                        <a href="<?= ROOT_URL ?>admin/manage-categories.php">
                            <i class="uil uil-list-ul"></i>
                            <h5>Manage Categories</h5>
                        </a>
                    </li>
                    <?php endif ?>
                </ul>
            </aside>
        <?php endif; ?>

        <main>
            <h2>Pending Posts</h2>
            <?php if (mysqli_num_rows($posts) > 0) : ?>
                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Thumbnail</th>
                            <th>Body</th>
                            <th>Accept</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($post = mysqli_fetch_assoc($posts)) : ?>
                            <tr>
                                <td><?= $post['title'] ?></td>
                                <td><img src="../images/<?= $post['thumbnail'] ?>" alt="Thumbnail" style="max-width: 100px;"></td>
                                <td><?= $post['body'] ?></td>
                                <td><a href="<?= ROOT_URL ?>admin/accept-post.php?id=<?= $post['id'] ?>" class="btn sm">Accept</a></td>
                                <td><a href="<?= ROOT_URL ?>admin/delete-post.php?id=<?= $post['id'] ?>" class="btn sm danger">Delete</a></td>
                            </tr>
                        <?php endwhile ?>
                    </tbody>
                <?php else : ?>
                    <div class="alert__message error">
                        No pending posts found
                    </div>
                <?php endif ?>
                </table>
        </main>
    </div>
</section>
