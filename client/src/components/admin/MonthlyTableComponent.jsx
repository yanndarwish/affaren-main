import React from "react";

const MonthlyTableComponent = ({monthlyTable}) => {
    return (
        <div className="monthly-details">
            <table className="table">
                <thead>
                    <tr>
                    <th scope="col">Day</th>
                    <th scope="col">Alimentation</th>
                    <th scope="col">Magazines</th>
                    <th scope="col">Décoration/Alcool</th>
                    <th scope="col">Hors Taxe Alimentation</th>
                    <th scope="col">Hors Taxe Magazines</th>
                    <th scope="col">Hors Taxe Décoration/Alcool</th>
                    <th scope="col">Total Hors Taxe</th>
                    <th scope="col">TVA Alimentation</th>
                    <th scope="col">TVA Magazines</th>
                    <th scope="col">TVA Décoration/Alcool</th>
                    <th scope="col">Total TVA</th>
                    <th scope="col">Total Cash</th>
                    <th scope="col">Total Card</th>
                    <th scope="col">Total Chèque</th>
                    <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                        {monthlyTable.map(day => (
                            <tr key={day.sale_day}>
                                <th scope="row">{day.sale_day}</th>
                                <td>{Math.round(day.alimentation *100)/100}</td>
                                <td>{Math.round(day.magazines *100)/100}</td>
                                <td>{Math.round(day.décoration *100)/100}</td>
                                <td>{Math.round(day.horsTaxeAlimentation *100)/100}</td>
                                <td>{Math.round(day.horsTaxeMagazines *100)/100}</td>
                                <td>{Math.round(day.horsTaxeDecoration *100)/100}</td>
                                <td>{Math.round((day.horsTaxeAlimentation + day.horsTaxeMagazines + day.horsTaxeDecoration) *100)/100}</td>
                                <td>{Math.round(day.tvaAlimentation *100)/100}</td>
                                <td>{Math.round(day.tvaMagazines *100)/100}</td>
                                <td>{Math.round(day.tvaDecoration *100)/100}</td>
                                <td>{Math.round((day.tvaAlimentation + day.tvaMagazines + day.tvaDecoration)*100)/100}</td>
                                <td>{Math.round(day.totalCash *100)/100}</td>
                                <td>{Math.round(day.totalCard *100)/100}</td>
                                <td>{Math.round(day.totalCheque *100)/100}</td>
                                <td>{Math.round(day.total *100)/100}</td>
                            </tr>
                        ))}
                </tbody>
            </table>
        </div>
    )
}

export default MonthlyTableComponent;