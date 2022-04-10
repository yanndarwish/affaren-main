import React, {useState, useEffect} from 'react';
import LowStockProductsComponent from './LowStockProductsComponent';
import ip from '../../ip'
const XLSX = require('xlsx');

const LowStock = () => {
    const [lowStockProducts, setLowStockProducts] = useState([]);

    const getLowStockProducts = async () => {
        try {
            const lowStockProducts = await fetch(`http://${ip}:5000/low-stock/products`);
            const lowStockProductsJson = await lowStockProducts.json();
            //sort by stock
            lowStockProductsJson.sort((a,b) => {
                return a.product_quantity - b.product_quantity;
            })
            setLowStockProducts(lowStockProductsJson);
        } catch (err) {
            console.error(err.message)
        }
    }

    //export this table to excel
    const exportToExcel = () => {
        const table = document.getElementById('low-stock-table');
        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.table_to_sheet(table);
        XLSX.utils.book_append_sheet(wb, ws, 'Low Stock Products');
        XLSX.writeFile(wb, 'Low Stock Products.xlsx');
    }

    useEffect(() => {
        getLowStockProducts();
    }, [])

    return (
        <div className="grid-container grid-container--low-stock">
            <div className="flex heading-section">
                <h1 className="fs-700">Items to Order</h1>
                <button className="btn btn-outline-success" onClick={exportToExcel}>Export to Excel</button>
            </div>

            <LowStockProductsComponent lowStockProducts={lowStockProducts}/>
        </div>

    )
}

export default LowStock;