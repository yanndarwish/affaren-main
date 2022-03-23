import React from "react";
const XLSX = require('xlsx');


const DailyBestSellersComponent = ({selectedDate, dailyBestSellers}) => {
    const exportDailyBestSellers = () => {
        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.json_to_sheet(dailyBestSellers);
        XLSX.utils.book_append_sheet(wb, ws, `${selectedDate} Best Sellers`);
        XLSX.writeFile(wb, `${selectedDate} Best Sellers.xlsx`);
    }
    return (
        <div className="best-seller-card card">
            <div className="flex heading-section">
                <h5 className="fs-500">{selectedDate}'s Best Sellers</h5>
                <button className="btn btn-sm btn-outline-secondary" onClick={exportDailyBestSellers}>Export to Excel</button>
            </div>
            <div className="card-body">
                <div>
                    <table className="table">
                        <thead>
                            <tr>
                            <th scope="col">Product</th>
                            <th scope="col">Quantity Sold</th>
                            </tr>
                        </thead>
                        <tbody>
                            {/* map through object and display quantity sold */}
                            {dailyBestSellers.map(product => {
                                return (
                                    <tr key={product.product_name}>
                                        <td>{product.product_name}</td>
                                        <td>{product.quantity}</td>
                                    </tr>
                                )
                            })}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )
}

export default DailyBestSellersComponent;