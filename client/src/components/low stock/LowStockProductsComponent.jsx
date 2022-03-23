import React from "react";

const LowStockProductsComponent = ({lowStockProducts}) => {
    return (
        <div className="container">
            <table className="table table-striped">
                <thead>
                    <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Alert Level</th>
                    <th scope="col">In Stock</th>
                    </tr>
                </thead>
                <tbody>
                        {lowStockProducts.map(product => (
                            <tr className={product.product_quantity < product.product_alert /2 ? "text-danger" : null} key={product.product_id}>
                                <th scope="row">{product.product_name}</th>
                                <td>{product.product_alert}</td>
                                <td>{product.product_quantity}</td>
                            </tr>
                        ))}
                </tbody>
            </table>
        </div>
    )
}

export default LowStockProductsComponent;