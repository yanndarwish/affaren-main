import React, {useState} from "react";
import ip from '../../ip'

const SalesComponent = ( {filteredSales}) => {
    const [saleId, setSaleId] = useState('');

    // delete a transaction
    const deleteTransaction = async () => {
        console.log(saleId);
        try {
            const response = await fetch(`http://${ip}:5000/sales/${saleId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            const otherResponse = await fetch(`http://${ip}:5000/transactions/${saleId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            alert(`Transaction ${saleId} has been deleted`);
            }
        catch (err) {
            console.error(err.message);
        }
    }

    const openModal = (e) => {
        const modal = document.querySelector(`.${e.target.dataset.toggle}`)
        const modalToggle = document.querySelector(`.${e.target.dataset.toggle}-toggle`)
        const modalDialog = document.querySelector(`.${e.target.dataset.toggle}-dialog`)
        setSaleId(e.target.dataset.id);
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
    
            if(e.target.dataset.action === "delete_sale") {
                deleteTransaction()
            } 

            modal.setAttribute("data-visible", false)
            modal.setAttribute("aria-hidden", true)
            modalToggle.setAttribute("aria-expanded", false)
            modalDialog.setAttribute("data-visible", false)
        }
    }

    return (
        <div className="sales table-responsive">
        <table className="table table-striped">
            <thead>
                <tr>
                <th scope="col"><i className="far fa-trash-alt"></i></th>
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
                        <td><i className="far fa-trash-alt delete-sale-modal-toggle close-btn" data-id={sale.sale_id} data-toggle="delete-sale-modal" aria-expanded="false" onClick={(e) => openModal(e)}></i></td>
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
        <div className="modal delete-sale-modal" id="deleteSale" role="dialog" data-visible="false" aria-hidden="true" data-toggle="delete-sale-modal" onClick={(e) => closeModal(e)}>
                            <div className="modal-dialog delete-sale-modal-dialog" role="document" data-visible="false">
                                <div>
                                    <div className="modal-header">
                                        <h5 className="fs-500">Delete Sale <span>{saleId}</span> </h5>
                                        <button type="button" className="close-btn" data-toggle="delete-sale-modal" onClick={(e) => closeModal(e)} aria-label="Close">
                                            <span aria-hidden="true" data-toggle="delete-sale-modal">&times;</span>
                                        </button>
                                    </div>
                                    <div className="modal-body">
                                        Are you sure you want to delete the sale ?
                                    </div>
                                    <div className="modal-footer flex">
                                        <button type="button" className="btn btn-outline-danger" data-toggle="delete-sale-modal" onClick={(e) => closeModal(e)}>Close</button>
                                        <button type="button" className="btn btn-outline-success" data-target="delete-sale-modal" data-action="delete_sale" onClick={(e) => actionModal(e)}>Delete Sale</button>
                                    </div>
                                </div>
                            </div>
                        </div>
    </div>
    )
}

export default SalesComponent;
