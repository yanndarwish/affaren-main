import React from "react";


const CreateProduct = ( { addProduct}) => {
    const numPad = (e) => {
        const numPad = document.getElementById('numPad')
        numPad.classList.add('visible')
        numPad.setAttribute('data-active', e.target.id)
    }

    return (
        <div className="inventory-product-container grid">
            <div className="product-container">
                <div>
                    <div>
                        <label className="fs-500">Name</label>
                    </div>
                    <input id="product-name" type="text" />
                </div>
                <div>
                    <div>
                        <label className="fs-500">Price</label>
                    </div>
                    <input id="product-price" type="text" data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
                <div>
                    <div>
                        <label className="fs-500">Quantity</label>
                    </div>
                    <input id="product-quantity" type="number" data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
                <div>
                    <div>
                        <label className="fs-500">Alert</label>
                    </div>
                    <input id="product-alert" type="number" data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
                <div>
                    <div>
                        <label className="fs-500">Taxe ID</label>
                    </div>
                    <input id="product-taxe-id" type="number" data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
            </div>
            <button className="btn btn-outline-success" onClick={addProduct}>Add</button>
        </div>
    )
}

export default CreateProduct;
