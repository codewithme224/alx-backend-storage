-- Script that creates a stored procedure.


CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
    INSERT INTO average_weighted_score (user_id, score)
    VALUES (user_id, (SELECT AVG(score * weight) FROM corrections WHERE user_id = user_id));
END
