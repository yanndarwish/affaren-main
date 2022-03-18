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
        <div className="card mb-3">
                <h5 className="card-header">{day + '/' + month + '/' + year}'s Total Income</h5>
                <div className="card-body">
                    <h5 className="card-title">{Math.round(filteredSalesTotal*100)/100} €</h5>
                    <p className="card-text">This is this day's total revenue. Select an other date to compare.</p>
                </div>
            </div>
    )
}

export default SelectedDateComponent;