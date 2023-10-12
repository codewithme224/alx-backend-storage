-- Script that creates a stored procedure AddBonus that adds a new correction for a student.


CREATE PROCEDURE AddBonus (IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    INSERT INTO corrections (user_id, project_id, score, created_at)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score, NOW());
END