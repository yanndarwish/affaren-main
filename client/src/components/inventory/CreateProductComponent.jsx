import React from "react";


const CreateProduct = ( { addProduct}) => {
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
                    <input id="product-price" type="text" />
                </div>
                <div>
                    <div>
                        <label className="fs-500">Quantity</label>
                    </div>
                    <input id="product-quantity" type="number" />
                </div>
                <div>
                    <div>
                        <label className="fs-500">Alert</label>
                    </div>
                    <input id="product-alert" type="number" />
                </div>
                <div>
                    <div>
                        <label className="fs-500">Taxe ID</label>
                    </div>
                    <input id="product-taxe-id" type="number" />
                </div>
            </div>
            <button className="btn btn-primary" onClick={addProduct}>Add</button>
        </div>
    )
}

export default CreateProduct;
