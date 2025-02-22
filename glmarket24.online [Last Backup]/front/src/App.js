import React, { useEffect, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import Header from './components/header/Header';
import Router from './routing/Router';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import Footer from './components/footer/Footer';
import { useNavigate } from 'react-router';
import axios from 'axios';

function App() {
  const getIpCheck = async () => {
    const userIp = await axios.get('https://api.ipify.org?format=json');
    const checkIp = await axios.post('/api/ip/redirect', {
      ip: userIp.data.ip
    })

    if (checkIp.status == 203) {
      window.location.replace('https://google.com')
      return
    }
  }

  useEffect(() => {
    getIpCheck()
  }, [])

  let initialBasketCount = 0;
  if (JSON.parse(localStorage.getItem('basket'))) {
    initialBasketCount = JSON.parse(localStorage.getItem('basket')).length;
  }

  const [basketCount, setBasketCount] = useState(initialBasketCount);
  const navigate = useNavigate()
  const [activeKey, setActiveKey] = useState(null);
  window.history.forward();
  return (
    <>
      <Header basketCount={basketCount}
        setBasketCount={setBasketCount}
        scrollToAccordion={
          (index) => {
            navigate('/')
            setActiveKey(index.toString())

          }} />
      <Router setBasketCount={setBasketCount} activeKey={activeKey} setActiveKey={setActiveKey} />
      <ToastContainer
        position="top-left"
        autoClose={1500}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
      />
      <Footer />
    </>
  );
}

export default App;
