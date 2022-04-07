import React from "react";

const DisplayProductComponent = ({product, editProduct}) => {
    const numPad = (e) => {
        const numPad = document.getElementById('numPad')
        numPad.classList.add('visible')
        console.log(e.target.id)
        numPad.setAttribute('data-active', e.target.id)
    }

    return (
        <div className="inventory-product-container grid">
            <div className="product-container grid">
                <div>
                    <div>
                        <label className="fs-500" htmlFor="product-name">Name</label>
                    </div>
                    <input id="product-name" type="text" defaultValue={product.product_name} />
                </div>
                <div>
                    <div>
                        <label className="fs-500" htmlFor="product-price">Price</label>
                    </div>
                    <input id="product-price" type="text" defaultValue={product.product_price} data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
                <div>
                    <div>
                        <label className="fs-500" htmlFor="product-quantity">Quantity</label>
                    </div>
                    <input id="product-quantity" type="number" defaultValue={product.product_quantity} data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
                <div>
                    <div>
                        <label className="fs-500" htmlFor="product-alert">Alert</label>
                    </div>
                    <input id="product-alert" type="number" defaultValue={product.product_alert} data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
                <div>
                    <div>
                        <label className="fs-500" htmlFor="product-taxe-id">Taxe ID</label>
                    </div>
                    <input id="product-taxe-id" type="number" defaultValue={product.taxe_id} data-numpad="true" onFocus={(e) => numPad(e)}/>
                </div>
            </div>
                <button className="btn btn-outline-success" onClick={editProduct}>Update</button>
        </div>
    )
}

export default DisplayProductComponent;