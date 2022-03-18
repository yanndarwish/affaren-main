import React from "react";

const SalesComponent = ( {filteredSales}) => {

    return (
        <div className="sales table-responsive">
        <table className="table table-striped">
            <thead>
                <tr>
                <th scope="col">ID</th>
                <th scope="col">Day</th>
                <th scope="col">Alimentation</th>
                <th scope="col">Magazines</th>
                <th scope="col">Décoration/Alcool</th>
                <th scope="col">Hors Taxe Alimentation</th>
                <th scope="col">Hors Taxe Magazines</th>
                <th scope="col">Hors Taxe Décoration/Alcool</th>
                <th scope="col">TVA Alimentation</th>
                <th scope="col">TVA Magazines</th>
                <th scope="col">TVA Décoration/Alcool</th>
                <th scope="col">Methode de paiement</th>
                <th scope="col">Paiement séparé</th>
                <th scope="col">Methode de paiement 2</th>
                <th scope="col">Montant 2</th>
                <th scope="col">Total</th>
                </tr>
            </thead>
            <tbody>
                {filteredSales.map(sale => (
                    <tr key={sale.sale_id}>
                        <th scope="row">{sale.sale_id}</th>
                        <td>{sale.sale_day}</td>
                        <td>{sale.total_1}</td>
                        <td>{sale.total_2}</td>
                        <td>{sale.total_3}</td>
                        <td>{sale.hors_taxe_1}</td>
                        <td>{sale.hors_taxe_2}</td>
                        <td>{sale.hors_taxe_3}</td>
                        <td>{sale.tva_1}</td>
                        <td>{sale.tva_2}</td>
                        <td>{sale.tva_3}</td>
                        <td>{sale.payment_method_id}</td>
                        <td>{sale.sale_splitted}</td>
                        <td>{sale.payment_method_id_2}</td>
                        <td>{sale.payment_method_id_2_total}</td>
                        <td>{sale.sale_total}</td>
                    </tr>
                ))}
            </tbody>
        </table>
    </div>
    )
}

export default SalesComponent;
