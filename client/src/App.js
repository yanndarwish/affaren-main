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

  const toggleNav = () => {
    const nav = document.querySelector('.primary-navigation')
    const navToggle = document.querySelector('.mobile-nav-toggle')

    const visibility = nav.getAttribute("data-visible")
    if (visibility === "false") {
        nav.setAttribute("data-visible", true)
        navToggle.setAttribute("aria-expanded", true)
    } else {
        nav.setAttribute("data-visible", false)
        navToggle.setAttribute("aria-expanded", false)
    }
  }

  document.addEventListener('click', (e) => {
    if (!e.target.hasAttribute('data-nav')) {
      const nav = document.querySelector('.primary-navigation')
      const navToggle = document.querySelector('.mobile-nav-toggle')

      nav.setAttribute("data-visible", false)
      navToggle.setAttribute("aria-expanded", false)
    }
  })

  return (
    <Fragment>
      <div className="grid-container grid-container--home">
          <nav data-nav="true">
            
              <ul data-visible="false" data-nav="true" className="primary-navigation underline-indicators grid">
              <div className="logo" alt="logo" data-nav="true"></div>
                <li className="nav-item" data-nav="true">
                  <a className="uppercase ff-source text-dark letter-spacing-2 active" href="#" data-nav="true" onClick={togglePosMode}>
                  <i className="fas fa-cash-register" data-nav="true"></i>
                  Point Of Sale<span className="sr-only">(current)</span>
                  </a>
                </li>
                <li className="nav-item" data-nav="true">
                  <a className="uppercase ff-source text-dark letter-spacing-2" href="#" data-nav="true"onClick={toggleAdminMode}>
                  <i className="fas fa-chart-line" data-nav="true"></i>
                    Admin
                  </a>
                </li>
                <li className="nav-item" data-nav="true">
                  <a className="uppercase ff-source text-dark letter-spacing-2" href="#" data-nav="true" onClick={toggleInventoryMode}>
                  <i className="fas fa-boxes" data-nav="true"></i>
                    Inventory
                  </a>
                </li>
                <li className="nav-item" data-nav="true">
                  <a className="uppercase ff-source text-dark letter-spacing-2" href="#" data-nav="true" onClick={toggleLowStockMode}>
                  <i className="fas fa-truck-loading" data-nav="true"></i>
                    Low Stock
                  </a>
                </li>
                <li className="nav-item" data-nav="true">
                  <a className="uppercase ff-source text-dark letter-spacing-2" href="#" data-nav="true" onClick={toggleBestSellerMode}>
                  <i className="fas fa-award" data-nav="true"></i>
                  Best Sellers
                  </a>
                </li>
              </ul>
          </nav>
          

          <main role="main">
          <button className="mobile-nav-toggle" aria-controls="primary-navigation" data-nav="true" onClick={() => toggleNav()}><span className="sr-only" aria-expanded="false">Menu</span></button>
            {adminMode ? <Suspense fallback={<div>Loadind...</div>}><Admin /></Suspense>: null}
            {posMode ? <PoS /> : null}
            {inventoryMode ? <Suspense fallback={<div>Loadind...</div>}><Inventory /></Suspense> : null}
            {lowStockMode ? <Suspense fallback={<div>Loadind...</div>}><LowStock /></Suspense> : null}
            {bestSellerMode ? <Suspense fallback={<div>Loadind...</div>}><BestSellers /></Suspense> : null}
            
          </main>
    </div>
    </Fragment>
  );
}


export default App;
