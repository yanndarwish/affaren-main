import React from "react";

const taxeComponent = ({taxesId, taxes}) => {
    return (
        taxesId.map(taxe => (
        <div className="taxe-item" key={taxe}>
            <p>Total {taxe} = {taxes[`total_${taxe}`]}</p>
            <p>Hors Taxe {taxe} = {taxes[`ht_${taxe}`]}</p>
            <p>TVA {taxe} = {taxes[`tva_${taxe}`]}</p>
        </div>
        )))
}

export default taxeComponent;