-- Order store procedure


CREATE TRIGGER update_quantity AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity - 1
WHERE id = NEW.item_id;
