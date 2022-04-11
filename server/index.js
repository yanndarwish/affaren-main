const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./db');
const {
    query
} = require('express');

//middleware
app.use(cors());
app.use(express.json());

// ROUTES

//                  PRODUCTS

// Create a product
app.post('/products', async (req, res) => {
    try {
        const {
            name,
            price,
            quantity,
            alert,
            barcode,
            taxe_id
        } = req.body;
        const newProduct = await pool.query("INSERT INTO products (product_name, product_price, product_quantity, product_barcode, taxe_id, product_alert) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *", [name, price, quantity, barcode, taxe_id, alert]);
        res.json(newProduct.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
});

// Get a product
app.get('/products/:barcode', async (req, res) => {
    try {
        const {
            barcode
        } = req.params;
        const product = await pool.query("SELECT * FROM products WHERE product_barcode = $1", [barcode]);
        res.json(product.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
});

//edit a product
app.put('/products/:barcode', async (req, res) => {
    try {
        const {
            barcode
        } = req.params;
        const {
            name,
            price,
            quantity,
            alert,
            taxe_id
        } = req.body;
        const updateProduct = await pool.query("UPDATE products SET product_name = $1, product_price = $2, product_quantity = $3, taxe_id = $4, product_alert = $5 WHERE product_barcode = $6 RETURNING *", [name, price, quantity, taxe_id, alert, barcode]);
        res.json(updateProduct.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
});

// SALES TRANSACTION

// create a sales transaction
app.post("/sales", async (req, res) => {
    try {
        const newSale = await pool.query("INSERT INTO sales_transactions (sale_total) VALUES (0) RETURNING *");
        res.json(newSale.rows[0]);
    } catch (err) {
        console.error(err.message)
    }
})

//Get the last sales transaction
app.get("/last-sale", async (req, res) => {
    try {
        const lastSale = await pool.query("SELECT * FROM sales_transactions ORDER BY sale_id DESC LIMIT 1");
        res.json(lastSale.rows[0]);
    } catch (err) {
        console.error(err.message)
    }
})

// delete a sales transaction
app.delete("/transactions/:sale_id", async (req, res) => {
    try {
        const {
            sale_id
        } = req.params;
        const deleteSale = await pool.query("DELETE FROM sales_transactions WHERE sale_id = $1", [sale_id]);
        res.json(deleteSale.rows[0]);
    } catch (err) {
        console.error(err.message)
    }
})
// PRODUCTS IN TRANSACTION

// add a product to a transaction
app.post("/sales/:sale_id/product", async (req, res) => {
    try {
        const {
            sale_id
        } = req.params;
        const {
            product_id,
            product_name,
            product_price,
            product_quantity,
            product_taxe,
            sale_year,
            sale_month,
            sale_day
        } = req.body;
        console.sale_day
        const newProduct = await pool.query("INSERT INTO products_in_transactions (sale_id, product_id, product_name, product_price, quantity, taxe_id, sale_day, sale_month, sale_year) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *", [sale_id, product_id, product_name, product_price, product_quantity, product_taxe, sale_day, sale_month, sale_year]);
        res.json(newProduct.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

// Get all products in a transaction
app.get("/sales/:sale_id", async (req, res) => {
    try {
        const {
            sale_id
        } = req.params;
        const products = await pool.query("SELECT * FROM products_in_transactions WHERE sale_id = $1", [sale_id]);
        res.json(products.rows);
    } catch (err) {
        console.error(err.message);
    }
})

// Clear a transaction
app.delete("/sales/:sale_id", async (req, res) => {
    try {
        const {
            sale_id
        } = req.params;
        const clearTransaction = await pool.query("DELETE FROM products_in_transactions WHERE sale_id = $1", [sale_id]);
        res.json('transaction cleared');
    } catch (err) {
        console.error(err.message)
    }
})

// CONFIRM TRANSACTION

// Update product stock
app.put("/close/products/:product_id/stock", async (req, res) => {
    try {
        const {
            product_id
        } = req.params;
        const {
            quantity
        } = req.body;
        const newProduct = await pool.query(`UPDATE products SET product_quantity = product_quantity - ${quantity} WHERE product_id = $1 RETURNING *`, [product_id]);
        res.json(newProduct.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

// Set all the account info in sales_transactions
app.put("/accounting/sales/:sale_id", async (req, res) => {
    try {
        const {
            sale_id
        } = req.params;
        const {
            sale_total,
            taxe_amount,
            tva_1,
            tva_2,
            tva_3,
            total_1,
            total_2,
            total_3,
            hors_taxe_1,
            hors_taxe_2,
            hors_taxe_3,
            sale_year,
            sale_month,
            sale_day,
            sale_time
        } = req.body;
        const closeSale = await pool.query(`UPDATE sales_transactions SET sale_total = $1, taxe_amount = $2, tva_1 = $3, tva_2 = $4, tva_3 = $5, hors_taxe_1 = $6, hors_taxe_2 = $7, hors_taxe_3 = $8, total_1 = $9, total_2 = $10, total_3 = $11, sale_year = $12, sale_month = $13, sale_day = $14, sale_time = $15 WHERE sale_id = $16 RETURNING *`, [sale_total, taxe_amount, tva_1, tva_2, tva_3, hors_taxe_1, hors_taxe_2, hors_taxe_3, total_1, total_2, total_3, sale_year, sale_month, sale_day, sale_time, sale_id]);
        res.json(closeSale.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

//close a sale
app.put("/close/sales/:sale_id", async (req, res) => {
    try {
        const {
            sale_id
        } = req.params;
        const {
            paid
        } = req.body;
        const closeSale = await pool.query(`UPDATE sales_transactions SET sale_paid = true, payment_method_id = $1 WHERE sale_id = $2 RETURNING *`, [paid,sale_id]);
        res.json(closeSale.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
})

//set splitted sale, method and amount
app.put("/close/sales/:sale_id/split", async (req, res) => {
    try {
        const { sale_id } = req.params
        const { 
            payment_method_id_2,
            payment_method_id_2_total
        } = req.body
        const setSplitted = await pool.query(`UPDATE sales_transactions SET sale_splitted = true, payment_method_id_2 = $1, payment_method_id_2_total = $2 WHERE sale_id = $3 RETURNING *`, [payment_method_id_2, payment_method_id_2_total, sale_id])
        res.json(setSplitted.rows[0])
    } catch (err) {
        console.error(err.message)
    }
})

// ADMIN

//get products where stock is under alert level 
app.get("/low-stock/products", async (req, res) => {
    try {
        const alertProducts = await pool.query('SELECT * FROM products WHERE product_quantity < product_alert');
        res.json(alertProducts.rows);
    } catch (err) {
        console.error(err.message)
    }
})

//get most sold products
app.get("/best-sellers", async (req,res) => {
    try {
        const bestSellers = await pool.query("SELECT * FROM products_in_transactions;")
        res.json(bestSellers.rows); 
    } catch (err) {
        console.error(err.message)
    }
})

// get all the sales transactions
app.get("/sales", async (req,res) => {
    try {
        const allSales = await pool.query(`SELECT * FROM sales_transactions ORDER BY sale_id DESC`);
        res.json(allSales.rows);
    } catch (err) {
        console.error(err.message)
    }
})

//delete all the products of this sale in products_in_transactions
app.put("/reset/sales/:sale_id", async (req,res) => {
    try {
        const { sale_id } = req.params;
        const deleteProducts = await pool.query(`UPDATE products_in_transactions SET product_id = NULL, quantity = NULL, product_name = NULL, product_price = NULL, taxe_id = NULL WHERE sale_id = $1`, [sale_id]);
        res.json(deleteProducts.rows);
    } catch (err) {
        console.error(err.message)
    }
})

//delete null values in products_in_transactions
app.delete("/delete/sales/:sale_id/null", async (req,res) => {
    try {
        const { sale_id } = req.params;
        const deleteNull = await pool.query(`DELETE FROM products_in_transactions WHERE NOT (product_name IS NOT NULL)`);
        res.json(deleteNull.rows);
    } catch (err) {
        console.error(err.message)
    }
})


// Listening
app.listen(5000, () => {
    console.log('Listening on port 5000');
})