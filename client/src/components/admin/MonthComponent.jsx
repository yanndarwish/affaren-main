import React from 'react';  
import MonthlyTableComponent from './MonthlyTableComponent';
const XLSX = require('xlsx');


let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];


const MonthComponent = ({selectedDate, selectedMonth, sales, monthlyTable }) => {
    //sum all sales from the month of selected date
    let month = selectedDate.slice(5,7);
    let year = selectedDate.slice(0,4);
    let total = 0;
    sales.map(sale => {
        if(sale.sale_month == month && sale.sale_year == year){
            //add all sales from the month of selected date to selectedMonth if they are not already in it
            if(!selectedMonth.includes(sale)){
                selectedMonth.push(sale);
            }
            total += sale.sale_total;
        }
    })

    //export to excel 
    const exportToExcel = () => {
        let month = selectedDate.slice(5,7);
        let year = selectedDate.slice(0,4);
        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.json_to_sheet(monthlyTable);
        XLSX.utils.book_append_sheet(wb, ws, `${months[month-1]}-${year}`);
        XLSX.writeFile(wb, `${months[month-1]}-${year}.xlsx`);
    }

    let monthLitteral = months[month-1];
    return (
        <div className="month mb-3">
            <div className="card">
                <h5 className="card-header">{monthLitteral}'s Total Income</h5>
                <div className="card-body">
                    <h5 className="card-title">{Math.round(total *100)/100} €</h5>
                    <p className="card-text">This is this month's total revenue. Click below to get more details !</p>
                    <a href="#" className="btn btn-primary" data-toggle="modal" data-target="#month-detail">See details</a>
                </div>
            </div>

            <div className="modal fade" id="month-detail" tabIndex="-1" role="dialog" aria-labelledby="thisMonthTotal" aria-hidden="true">
                <div className="modal-dialog modal-dialog-centered modal-lg container-fluid" role="document">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title" id="exampleModalLabel">This Month's Total Revenue</h5>
                            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div className="modal-body">
                            <MonthlyTableComponent monthlyTable={monthlyTable}/>
                        </div>
                        <div className="modal-footer">
                            <button type="button" className="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" className="btn btn-primary" onClick={exportToExcel}>Export To Excel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default MonthComponent;