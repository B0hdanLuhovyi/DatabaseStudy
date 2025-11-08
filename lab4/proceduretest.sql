use Posters;
CALL sp_AddNewProduct(
    'Space Poster', 
    'High-quality glossy poster with space theme', 
    149.99, 
    20, 
    1
);
select * from product where product.name = 'Space Poster';
