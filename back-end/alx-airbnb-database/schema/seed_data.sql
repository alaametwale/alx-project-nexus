-- ================= USERS =================
INSERT INTO users (full_name, email, password, is_seller)
VALUES
('Alaa Meto', 'alaa@email.com', 'hashedpass', TRUE),
('Sara Ahmed', 'sara@email.com', 'hashedpass', FALSE);

-- ================= CATEGORIES =================
INSERT INTO categories (name, description)
VALUES
('Electronics', 'Devices and gadgets'),
('Clothes', 'Fashion and wearables');

-- ================= PRODUCTS =================
INSERT INTO products (name, slug, description, price, stock, category_id, created_by)
VALUES
('iPhone 15', 'iphone-15', 'Latest Apple phone', 1200.00, 10, 1, 1),
('T-Shirt', 't-shirt', 'Cotton T-Shirt', 25.00, 50, 2, 1);

-- ================= PRODUCT IMAGES =================
INSERT INTO product_images (image_url, product_id)
VALUES
('iphone.jpg', 1),
('tshirt.jpg', 2);

-- ================= CART =================
INSERT INTO carts (user_id)
VALUES (2);

INSERT INTO cart_items (cart_id, product_id, quantity)
VALUES (1, 2, 3);

-- ================= ORDER =================
INSERT INTO orders (user_id, total_price, status)
VALUES (2, 75.00, 'Pending');

INSERT INTO order_items (order_id, product_id, price_at_purchase, quantity)
VALUES (1, 2, 25.00, 3);

-- ================= PAYMENT =================
INSERT INTO payments (order_id, method, status, transaction_id, paid_at)
VALUES (1, 'Credit Card', 'Paid', 'TX123456', CURRENT_TIMESTAMP);

-- ================= SHIPPING =================
INSERT INTO shipping_details (order_id, address, city, postal_code, country, phone_number)
VALUES (1, '123 Nile St', 'Cairo', '11511', 'Egypt', '01000000000');

-- ================= REVIEW =================
INSERT INTO reviews (user_id, product_id, rating, comment)
VALUES (2, 2, 5, 'Great quality!');

-- ================= SOCIAL POSTS =================
INSERT INTO posts (user_id, product_id, content)
VALUES (2, 2, 'I love this T-shirt!');

INSERT INTO comments (post_id, user_id, content)
VALUES (1, 1, 'Nice choice!');

INSERT INTO likes (user_id, post_id)
VALUES (1, 1);

-- ================= POLLS =================
INSERT INTO polls (user_id, question)
VALUES (1, 'Which color do you prefer?');

INSERT INTO poll_options (poll_id, option_text)
VALUES
(1, 'Red'),
(1, 'Blue');

INSERT INTO votes (user_id, poll_option_id)
VALUES (2, 1);
