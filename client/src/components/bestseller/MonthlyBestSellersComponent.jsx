import React from 'react';
const XLSX = require('xlsx');


const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];


const MonthlyBestSellersComponent = ({selectedDate, monthlyBestSellers}) => {
    //get month name from selected date
    let month = selectedDate.slice(5,7);
    let monthName = months[month-1];

    const exportMonthlyBestSellers = () => {
        //get month name from selected date
        let month = selectedDate.slice(5,7);
        let monthName = months[month-1];
        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.json_to_sheet(monthlyBestSellers);
        XLSX.utils.book_append_sheet(wb, ws, `${monthName} Best Sellers`);
        XLSX.writeFile(wb, `${monthName} Best Sellers.xlsx`);
    }

    return (
        <div className="best-seller-card card">
            <div className="heading-section flex">
                <h5 className="fs-500">{monthName}'s Best Sellers</h5>
                <button className="btn btn-sm btn-outline-secondary" onClick={exportMonthlyBestSellers}>Export to Excel</button>
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
                            {monthlyBestSellers.map(product => {
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

export default MonthlyBestSellersComponent;