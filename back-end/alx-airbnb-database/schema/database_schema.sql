-- =========================
-- USERS
-- =========================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150),
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_seller BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- CATEGORIES
-- =========================
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES categories(id)
);

-- =========================
-- PRODUCTS
-- =========================
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) UNIQUE,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    discount_price DECIMAL(10,2),
    stock INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    category_id INT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

-- =========================
-- PRODUCT IMAGES
-- =========================
CREATE TABLE product_images (
    id SERIAL PRIMARY KEY,
    image_url TEXT NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- =========================
-- CART
-- =========================
CREATE TABLE carts (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- =========================
-- ORDERS
-- =========================
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10,2),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    price_at_purchase DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- =========================
-- PAYMENTS
-- =========================
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT UNIQUE,
    method VARCHAR(50),
    status VARCHAR(50),
    transaction_id VARCHAR(255),
    paid_at TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- =========================
-- SHIPPING DETAILS
-- =========================
CREATE TABLE shipping_details (
    id SERIAL PRIMARY KEY,
    order_id INT UNIQUE,
    address TEXT,
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    phone_number VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- =========================
-- REVIEWS (Product Ratings)
-- =========================
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating >=1 AND rating <=5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- =========================
-- SOCIAL FEATURES
-- =========================
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT,
    product_id INT,
    content TEXT,
    likes_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    user_id INT,
    post_id INT,
    product_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE polls (
    id SERIAL PRIMARY KEY,
    user_id INT,
    question TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE poll_options (
    id SERIAL PRIMARY KEY,
    poll_id INT,
    option_text TEXT,
    votes_count INT DEFAULT 0,
    FOREIGN KEY (poll_id) REFERENCES polls(id)
);

CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    user_id INT,
    poll_option_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (poll_option_id) REFERENCES poll_options(id)
);
