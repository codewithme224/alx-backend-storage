-- Script that ranks glam rock bands by their lifespan


SELECT band_name, (split - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
