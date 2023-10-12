-- Script to create the procedure ComputeAverageWeightedScoreForUsers in your MySQL database


CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    INSERT INTO average_weighted_score (user_id, score)
    SELECT id, AVG(score * weight)
    FROM corrections
    GROUP BY user_id;
END
