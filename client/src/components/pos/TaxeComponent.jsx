import React from "react";

const taxeComponent = ({taxesId, taxes}) => {

    return (
        taxesId.map(taxe => (
        <div className="taxe-item" key={taxe}>
            <p className="fs-500">Total {taxe} = {Math.round(taxes[`total_${taxe}`] *100) /100}</p>
            <p className="fs-500">Hors Taxe {taxe} = {Math.round(taxes[`ht_${taxe}`] *100) /100}</p>
            <p className="fs-500">TVA {taxe} = {Math.round(taxes[`tva_${taxe}`] *100) /100}</p>
        </div>
        )))
}

export default taxeComponent;