-- Script to create the procedure ComputeAverageScoreForUser in your MySQL database


CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    INSERT INTO average_score (user_id, score)
    VALUES (user_id, (SELECT AVG(score) FROM corrections WHERE user_id = user_id));
END
