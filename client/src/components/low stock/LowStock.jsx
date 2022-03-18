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
        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.json_to_sheet(lowStockProducts);
        XLSX.utils.book_append_sheet(wb, ws, 'Low Stock Products');
        XLSX.writeFile(wb, 'Low Stock Products.xlsx');
    }

    useEffect(() => {
        getLowStockProducts();
    }, [])

    return (
        <div className="container-fluid text-center p-4">
            <div className="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 className="h2">Items to Order</h1>
                <div className="btn-toolbar mb-2 mb-md-0">
                    <div className="btn-group mr-2">
                        <button className="btn btn-sm btn-outline-secondary" onClick={exportToExcel}>Export to Excel</button>
                    </div>
                </div>
            </div>
            <LowStockProductsComponent lowStockProducts={lowStockProducts}/>
        </div>

    )
}

export default LowStock;