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
        console.log(e.target.dataset.id)

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
        console.log(e.target.dataset.id)
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
        products.map((product, i) => (
            <div className='cart-item flex' key={product.product_name + i}>
                <div className="col-1 align-items-center">
                        <i className="far fa-trash-alt" data-id={product.product_id} onClick={e => removeProduct(e)}></i>
                </div>
                <div className='item-infos flex'>
                    <div className='cart-item-name'>{product.product_name}
                    </div>
                    {/* <div className='cart-item-unit-price col-1 my-auto'>{product.product_price}</div> */}
                    <div className='cart-item-total-price my-auto font-weight-bold'>{Math.round((product.product_price * product.product_quantity) * 100) / 100}
                    </div>
                </div>
                <div className='item-qty-container flex'>
                    <i className="fas fa-minus" data-id={product.product_id} onClick={e => substractOne(e)}></i>
                    <input id="cart-qty-input" type="number" className='item-qty' data-id={product.product_id} value={product.product_quantity} onChange={e => setQuantity(e)}/>
                    <i className="fas fa-plus" data-id={product.product_id} onClick={e => addOne(e)}></i>
                </div>
            </div>
        ))
    )
}

export default CartComponent;