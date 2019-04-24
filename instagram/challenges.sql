
-- Challenge 1 --

SELECT 
    username AS Username,
    DATE_FORMAT(created_at, '%m/%d/%Y') AS Joined
FROM users
ORDER BY created_at
    LIMIT 5;

SELECT 
    username AS Username,
    DATE_FORMAT(created_at, '%M %D, %Y') AS Joined
FROM users
ORDER BY created_at
    LIMIT 5;

-- Challenge 2 --

SELECT 
    DAYNAME(created_at) AS Day,
    COUNT(*) AS Total
FROM users
GROUP BY Day
ORDER BY Total DESC
LIMIT 2;

-- Challenge 3 --

SELECT
    username AS User,
    DATE_FORMAT(users.created_at, '%m/%d/%Y') AS Joined,
    IFNULL(image_url, 'No Posts') AS Posts
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NUll
ORDER BY Joined DESC;

-- Challenge 4 -- 

SELECT
    photos.image_url as Photo,
    users.username as 'Posted by User',
    COUNT(likes.user_id) AS Likes
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY Likes DESC
    LIMIT 1;

-- Challenge 5 --

SELECT
    (SELECT
        COUNT(*)
    FROM photos) /
    (SELECT
        COUNT(*)
    FROM users) AS Average;

-- Challenge 6 --

SELECT
    tag_name AS Hashtag,
    COUNT(*) AS Used
FROM tags
INNER JOIN photo_tags
    ON photo_tags.tag_id = tags.id
GROUP BY Hashtag
ORDER BY Used DESC
    LIMIT 5;

-- Challenge 7 --

SELECT
    username AS User,
    COUNT(*) AS Likes
FROM users
INNER JOIN likes
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING Likes = (SELECT COUNT(*) FROM photos);


















