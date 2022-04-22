import React, {useState} from "react"; 
import printer from '../../printer'

let date = new Date();
    let dd = String(date.getDate()).padStart(2, '0');
    let mm = String(date.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = date.getFullYear();

    date = yyyy+'-'+mm+'-'+dd;
    //get time
    const getTime = () => {
        const date = new Date();
        const time = date.toLocaleTimeString();
        return time;
    }

const SelectedDateComponent = ({filteredSales, selectedDate}) => {
    const [time, setTime] = useState({time:getTime(), 
        day:dd,
        month:mm,
        year:yyyy});
    
    let filteredSalesTotal = 0
    for (let i = 0; i < filteredSales.length; i++) {
        filteredSalesTotal += filteredSales[i].sale_total;
    }
    let totals = {
        cash:0,
        card:0,
        check:0
    }
    // let totals.cash = 0
    // let totals.card = 0
    // let totals.check = 0
    for (let i = 0; i < filteredSales.length; i++) {
        if (filteredSales[i].sale_splitted === true) {
            if (filteredSales[i].payment_method_id === 1) {
                totals.cash += Math.round((filteredSales[i].sale_total - filteredSales[i].payment_method_id_2_total) * 100) / 100;
            } else if (filteredSales[i].payment_method_id === 2) {
                totals.card += Math.round((filteredSales[i].sale_total - filteredSales[i].payment_method_id_2_total) * 100) / 100;
            } else if (filteredSales[i].payment_method_id === 3) {
                totals.check += Math.round((filteredSales[i].sale_total - filteredSales[i].payment_method_id_2_total) * 100) / 100;
            }
            if (filteredSales[i].payment_method_id_2 === 1) {
                totals.cash += Math.round((filteredSales[i].payment_method_id_2_total) * 100) / 100;
            } else if (filteredSales[i].payment_method_id_2 === 2) {
                totals.card += Math.round((filteredSales[i].payment_method_id_2_total) * 100) / 100;
            } else if (filteredSales[i].payment_method_id_2 === 3) {
                totals.check += Math.round((filteredSales[i].payment_method_id_2_total) * 100) / 100;
            }
        } else {
            if (filteredSales[i].payment_method_id === 1) {
                totals.cash += Math.round(filteredSales[i].sale_total * 100) / 100;
            } else if (filteredSales[i].payment_method_id === 2) {
                totals.card += Math.round(filteredSales[i].sale_total * 100) / 100;
            } else if (filteredSales[i].payment_method_id === 3) {
                totals.check += Math.round(filteredSales[i].sale_total * 100) / 100;
            }
        }
        console.log(totals.card, totals.cash, totals.check)
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
                    <h1 className="card-title">{Math.round(totals.cash*100)/100} €</h1>
                </div>
                <div className="card-body-item">
                    <h3 className="fs-500">Card</h3>
                    <h1 className="card-title">{Math.round(totals.card*100)/100} €</h1>
                </div>
                <div className="card-body-item">
                    <h3 className="fs-500">Check</h3>
                    <h1 className="card-title">{Math.round(totals.check*100)/100} €</h1>
                </div>
            </div>
            <button className="btn btn-outline-neutral month-detail-modal-toggle" data-toggle="month-detail-modal" aria-expanded="false" onClick={() => printer(filteredSales, time, totals)}>Print Daily Totals</button>
        </div>
    )
}

export default SelectedDateComponent;