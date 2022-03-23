import React from "react"; 

const SelectedDateComponent = ({filteredSales, selectedDate}) => {
    let filteredSalesTotal = 0
    for (let i = 0; i < filteredSales.length; i++) {
        filteredSalesTotal += filteredSales[i].sale_total;
    }

    let day = selectedDate.slice(8,10);
    let month = selectedDate.slice(5,7);
    let year = selectedDate.slice(0,4);
    return (
        <div className="admin-card grid">
            <div className="card-header flex">
                <h3 className="fs-500">{day + '/' + month + '/' + year}'s Total Income</h3>
                <h1 className="card-title">{Math.round(filteredSalesTotal*100)/100} €</h1>
            </div>
            <p className="card-text">This is this day's total revenue. Select an other date to compare.</p>
        </div>
    )
}

export default SelectedDateComponent;