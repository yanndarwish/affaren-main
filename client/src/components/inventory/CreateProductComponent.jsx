import React from "react";


const CreateProduct = ( { addProduct}) => {
    return (
        <div className="product-container">
            <div className="input-group mb-3">
                <div className="input-group-prepend">
                    <span className="input-group-text">Name</span>
                </div>
                <input id="product-name" className="product-input form-control" type="text" />
            </div>
            <div className="input-group mb-3">
                <div className="input-group-prepend">
                    <span className="input-group-text">Price</span>
                </div>
                <input id="product-price" className="product-input form-control" type="text" />
            </div>
            <div className="input-group mb-3">
                <div className="input-group-prepend">
                    <span className="input-group-text">Quantity</span>
                </div>
                <input id="product-quantity" className="product-input form-control" type="number" />
            </div>
            <div className="input-group mb-3">
                <div className="input-group-prepend">
                    <span className="input-group-text">Alert</span>
                </div>
                <input id="product-alert" className="product-input form-control" type="number" />
            </div>
            <div className="input-group mb-3">
                <div className="input-group-prepend">
                    <span className="input-group-text">Taxe ID</span>
                </div>
                <input id="product-taxe-id" className="product-input form-control" type="number" />
            </div>
            <button className="btn btn-primary" onClick={addProduct}>Add</button>
        </div>
    )
}

export default CreateProduct;
