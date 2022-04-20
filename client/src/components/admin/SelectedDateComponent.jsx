import React from "react"; 

const SelectedDateComponent = ({filteredSales, selectedDate}) => {
    let filteredSalesTotal = 0
    for (let i = 0; i < filteredSales.length; i++) {
        filteredSalesTotal += filteredSales[i].sale_total;
    }

    let todaysTotalCash = 0
    let todaysTotalCard = 0
    let todaysTotalCheck = 0
    for (let i = 0; i < filteredSales.length; i++) {
        if (filteredSales[i].sale_splitted === true) {

        } else {
            if (filteredSales[i].payment_method_id === 1) {
                todaysTotalCash += Math.round(filteredSales[i].sale_total * 100) / 100;
            } else if (filteredSales[i].payment_method_id === 2) {
                todaysTotalCard += Math.round(filteredSales[i].sale_total * 100) / 100;
            } else if (filteredSales[i].payment_method_id === 3) {
                todaysTotalCheck += Math.round(filteredSales[i].sale_total * 100) / 100;
            }
        }
        console.log(todaysTotalCard, todaysTotalCash, todaysTotalCheck)
    }

    console.log(filteredSales)
    let day = selectedDate.slice(8,10);
    let month = selectedDate.slice(5,7);
    let year = selectedDate.slice(0,4);
    return (
        <div className="admin-card card grid">
            <div className="card-header">
                <h3 className="fs-500">{day + '/' + month + '/' + year}'s Total Income</h3>
                <h1 className="card-title">{Math.round(filteredSalesTotal*100)/100} €</h1>
            </div>
            <div className="card-body flex">
                <div className="card-body-item">
                    <h3 className="fs-500">Cash</h3>
                    <h1 className="card-title">{Math.round(todaysTotalCash*100)/100} €</h1>
                </div>
                <div className="card-body-item">
                    <h3 className="fs-500">Card</h3>
                    <h1 className="card-title">{Math.round(todaysTotalCard*100)/100} €</h1>
                </div>
                <div className="card-body-item">
                    <h3 className="fs-500">Check</h3>
                    <h1 className="card-title">{Math.round(todaysTotalCheck*100)/100} €</h1>
                </div>
            </div>
        </div>
    )
}

export default SelectedDateComponent;