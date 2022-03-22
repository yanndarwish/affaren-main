import React, {Fragment, useState, lazy, Suspense} from 'react';
import './App.css';
import PoS from './components/pos/PoS';

const Admin = lazy(() => import('./components/admin/Admin'));
const Inventory = lazy(() => import('./components/inventory/Inventory'));
const LowStock = lazy(() => import('./components/low stock/LowStock'));
const BestSellers = lazy(() => import('./components/bestseller/BestSeller'));

function App() {
  const [adminMode, setAdminMode] = useState(false);
  const [posMode, setPosMode] = useState(true);
  const [inventoryMode, setInventoryMode] = useState(false);
  const [lowStockMode, setLowStockMode] = useState(false);
  const [bestSellerMode, setBestSellerMode] = useState(false);

  const toggleAdminMode = () => {
    if (!adminMode) {
      setAdminMode(!adminMode);
      setPosMode(false);
      setInventoryMode(false);
      setLowStockMode(false);
      setBestSellerMode(false);
    }
  }


  const togglePosMode = () => { 
    if (!posMode) {
      setPosMode(!posMode);
      setAdminMode(false);
      setInventoryMode(false);  
      setLowStockMode(false);   
      setBestSellerMode(false);
    }
  }

  const toggleInventoryMode = () => {
    if (!inventoryMode) {
      setInventoryMode(!inventoryMode);
      setAdminMode(false);
      setPosMode(false);
      setLowStockMode(false);
      setBestSellerMode(false);
    }
  }

  const toggleLowStockMode = () => {
    if (!lowStockMode) {
      setLowStockMode(!lowStockMode);
      setAdminMode(false);
      setPosMode(false);
      setInventoryMode(false);
      setBestSellerMode(false);
    }
  }

  const toggleBestSellerMode = () => {
    if (!bestSellerMode) {
      setBestSellerMode(!bestSellerMode);
      setAdminMode(false);
      setPosMode(false);
      setInventoryMode(false);
      setLowStockMode(false);
    }
  }

  return (
    <Fragment>
      <div className="grid-container grid-container--home">
          <nav className="navigation">
              <ul className="primary-navigation underline-indicators grid">
                <li className="">
                  <a className="uppercase ff-sans-cond text-dark letter-spacing-2 active" href="#" onClick={togglePosMode}>
                  <i className="fas fa-cash-register"></i>
                  Point Of Sale<span className="sr-only">(current)</span>
                  </a>
                </li>
                <li className="">
                  <a className="uppercase ff-sans-cond text-dark letter-spacing-2" href="#"onClick={toggleAdminMode}>
                  <i className="fas fa-chart-line"></i>
                    Admin
                  </a>
                </li>
                <li className="">
                  <a className="uppercase ff-sans-cond text-dark letter-spacing-2" href="#" onClick={toggleInventoryMode}>
                  <i className="fas fa-boxes"></i>
                    Inventory
                  </a>
                </li>
                <li className="">
                  <a className="uppercase ff-sans-cond text-dark letter-spacing-2" href="#" onClick={toggleLowStockMode}>
                  <i className="fas fa-truck-loading"></i>
                    Low Stock
                  </a>
                </li>
                <li className="">
                  <a className="uppercase ff-sans-cond text-dark letter-spacing-2" href="#" onClick={toggleBestSellerMode}>
                  <i className="fas fa-award"></i>
                  Best Sellers
                  </a>
                </li>
              </ul>
          </nav>
          

          <main role="main" className="">
            <div className="">
            {adminMode ? <Suspense fallback={<div>Loadind...</div>}><Admin /></Suspense>: null}
            {posMode ? <PoS /> : null}
            {inventoryMode ? <Suspense fallback={<div>Loadind...</div>}><Inventory /></Suspense> : null}
            {lowStockMode ? <Suspense fallback={<div>Loadind...</div>}><LowStock /></Suspense> : null}
            {bestSellerMode ? <Suspense fallback={<div>Loadind...</div>}><BestSellers /></Suspense> : null}
            </div>
          </main>
    </div>
    </Fragment>
  );
}


export default App;
