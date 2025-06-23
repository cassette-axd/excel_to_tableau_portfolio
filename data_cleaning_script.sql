/*

Data cleaning steps
 
 1. removing unecessary columns by only selecting the ones we need
 2. extract relevant instagram info from the first columns
 3. rename the column names


*/

CREATE VIEW view_usa_ig_2024 AS

SELECT 
    CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME)-1) as VARCHAR(100)) as name, 
    TOPIC_OF_INFLUENCE as topic, actual_username as username, 
    follower_count_api as follower_count, 
    post_count_api as post_count
FROM top_usa_ig_2024