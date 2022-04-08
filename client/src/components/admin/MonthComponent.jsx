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

    const toggleModal = (e) => {
        console.log(e.target.dataset.toggle)
        const modal = document.querySelector(`.${e.target.dataset.toggle}`)
        const modalToggle = document.querySelector(`.${e.target.dataset.toggle}-toggle`)
        const modalDialog = document.querySelector(`.${e.target.dataset.toggle}-dialog`)
        
        if(e.target.dataset.action === "export") {
            exportToExcel();
        }

        const visibility = modal.getAttribute("data-visible")
        if (visibility === "false") {
            modal.setAttribute("data-visible", true)
            modal.setAttribute("aria-hidden", false)
            modalToggle.setAttribute("aria-expanded", true)
            modalDialog.setAttribute("data-visible", true)
        } else {
            modal.setAttribute("data-visible", false)
            modal.setAttribute("aria-hidden", true)
            modalToggle.setAttribute("aria-expanded", false)
            modalDialog.setAttribute("data-visible", false)
        }
    }

    const openModal = (e) => {
        const modal = document.querySelector(`.${e.target.dataset.toggle}`)
        const modalToggle = document.querySelector(`.${e.target.dataset.toggle}-toggle`)
        const modalDialog = document.querySelector(`.${e.target.dataset.toggle}-dialog`)
        modal.setAttribute("data-visible", true)
        modal.setAttribute("aria-hidden", false)
        modalToggle.setAttribute("aria-expanded", true)
        modalDialog.setAttribute("data-visible", true)
    }
    
    const closeModal = (e) => {
        if(e.target.hasAttribute("data-toggle")){
            const modal = document.querySelector(`.${e.target.dataset.toggle}`)
            const modalToggle = document.querySelector(`.${e.target.dataset.toggle}-toggle`)
            const modalDialog = document.querySelector(`.${e.target.dataset.toggle}-dialog`)

            modal.setAttribute("data-visible", false)
            modal.setAttribute("aria-hidden", true)
            modalToggle.setAttribute("aria-expanded", false)
            modalDialog.setAttribute("data-visible", false)
        }
    }

    const actionModal = (e) => {
        if(e.target.hasAttribute("data-target")){
            const modal = document.querySelector(`.${e.target.dataset.target}`)
            const modalToggle = document.querySelector(`.${e.target.dataset.target}-toggle`)
            const modalDialog = document.querySelector(`.${e.target.dataset.target}-dialog`)
            
            if(e.target.dataset.action === "export") {
                exportToExcel();
            }

            modal.setAttribute("data-visible", false)
            modal.setAttribute("aria-hidden", true)
            modalToggle.setAttribute("aria-expanded", false)
            modalDialog.setAttribute("data-visible", false)
        }
    }

    let monthLitteral = months[month-1];
    return (
        <div className="month">
            <div className="admin-card card grid">
                <div className="card-header flex">
                    <h3 className="fs-500">{monthLitteral}'s Total Income</h3>
                    <h1 className="card-title">{Math.round(total *100)/100} €</h1>
                </div>
                <p className="card-text">This is this month's total revenue. Click below to get more details !</p>
                <button className="btn btn-outline-neutral month-detail-modal-toggle" data-toggle="month-detail-modal" aria-expanded="false" onClick={(e) => openModal(e)}>See details</button>
            </div>

            <div className="modal month-detail-modal" role="dialog" data-visible="false" aria-hidden="true" data-toggle="month-detail-modal" onClick={(e) => closeModal(e)}>
                <div className="modal-dialog month-detail-modal-dialog" role="document" data-visible="false">
                    <div>
                        <div className="modal-header">
                            <h5 className="fs-500">This Month's Total Revenue</h5>
                            <button className="btn close-btn" type="button" data-toggle="month-detail-modal" onClick={(e) => closeModal(e)} aria-label="Close">
                                <span data-toggle="month-detail-modal" aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div className="modal-body">
                            <MonthlyTableComponent monthlyTable={monthlyTable}/>
                        </div>
                        <div className="modal-footer flex">
                            <button type="button" className="btn btn-outline-danger" data-toggle="month-detail-modal" onClick={(e) => closeModal(e)}>Close</button>
                            <button type="button" className="btn btn-outline-success" data-action="export" data-target="month-detail-modal" onClick={(e) => actionModal(e)}>Export To Excel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default MonthComponent;