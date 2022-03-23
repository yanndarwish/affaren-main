import React from "react";

const taxeComponent = ({taxesId, taxes}) => {

    return (
        taxesId.map(taxe => (
        <div className="taxe-item" key={taxe}>
            <p className="fs-500">Total {taxe} = {taxes[`total_${taxe}`]}</p>
            <p className="fs-500">Hors Taxe {taxe} = {taxes[`ht_${taxe}`]}</p>
            <p className="fs-500">TVA {taxe} = {taxes[`tva_${taxe}`]}</p>
        </div>
        )))
}

export default taxeComponent;