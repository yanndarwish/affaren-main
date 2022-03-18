import React from "react";

const CartComponent = ({products, setProducts, setQtyUpdated}) => {

     //remove a product from a transaction
     const removeProduct = (e) => {
        products.map(product => {
            if (product.product_id == e.target.dataset.id) {
                //remove product from products list
                products.splice(products.indexOf(product),1);
            }
        })
        setProducts(products);
        setQtyUpdated(true);
    }

    const substractOne = (e) => {
        products.map(product => {
            if (product.product_id == e.target.dataset.id) {
                product.product_quantity -= 1;
                if (product.product_quantity == 0) {
                    removeProduct(e);
                }
            }
        })
        setQtyUpdated(true);
        setProducts(products);
    }

    //add 1 to product quantity
    const addOne = (e) => {

        products.map(product => {
            if (product.product_id == e.target.dataset.id) {
                product.product_quantity += 1;
            }
        })
        setQtyUpdated(true);
        setProducts(products);
    }

    const setQuantity = (e) => {
        products.map(product => {
            if (product.product_id == e.target.dataset.id) {
                product.product_quantity = parseInt(e.target.value);
            }
        })
        console.log(products)
        setQtyUpdated(true);
        setProducts(products);
    }

    return (
        products.map(product => (
            <div className='row cart-item justify-content-between align-items-center border-bottom pb-2 pt-2' key={product.product_name}>
                <div className="col-1 align-items-center">
                        <i className="far fa-trash-alt" data-id={product.product_id} onClick={e => removeProduct(e)}></i>
                </div>
                <div className='col-4 flex-column text-left align-items-start'>
                    <div className='cart-item-name text-left my-auto text-truncate'>{product.product_name}
                    </div>
                    {/* <div className='cart-item-unit-price col-1 my-auto'>{product.product_price}</div> */}
                    <div className='cart-item-total-price my-auto font-weight-bold'>{Math.round((product.product_price * product.product_quantity) * 100) / 100}
                    </div>
                </div>
                <div className='col-6 d-flex justify-content-between align-items-center'>
                    <i className="fas fa-minus" data-id={product.product_id} onClick={e => substractOne(e)}></i>
                    <input type="number" className='cart-item-quantity col-3 my-auto font-weight-bold text-center p-0' data-id={product.product_id} value={product.product_quantity} onChange={e => setQuantity(e)}/>
                    <i className="fas fa-plus" data-id={product.product_id} onClick={e => addOne(e)}></i>
                </div>
            </div>
        ))
    )
}

export default CartComponent;