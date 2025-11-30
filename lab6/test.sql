-- Це має спрацювати, бо ми дали права SELECT
SELECT * FROM Product;
-- Це має викликати ПОМИЛКУ, бо ми не давали прав DELETE
DELETE FROM Product as p WHERE p.id = 1;
