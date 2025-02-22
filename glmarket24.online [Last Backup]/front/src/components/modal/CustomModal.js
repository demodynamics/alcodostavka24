import { useState } from 'react';
import { Form, Modal } from "react-bootstrap";
import axios from 'axios';
import { toast } from 'react-toastify';
import './Modal.css'



function CustomModal({ show, handleClose }) {

  const [name, setName] = useState()
  const [phone, setPhone] = useState()
  const [spanError, setSpanError] = useState('');
  const [isChecked, setIsChecked] = useState(false);
  const handleOnChange = () => {
    setIsChecked(!isChecked);
  };

  const reg = /(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){11,14}(\s*)?/
  async function sendTelegram() {
    const TOKEN = "6104094925:AAEAcMEOPXFtUvUmgGejDzfl8HBNjLzH8X0"
    const CHAT_ID = "-1001633078067"
    const URI_API = `https://api.telegram.org/bot${TOKEN}/sendMessage`;

    if (name && reg.test(phone)) {
      const userIp = await axios.get('https://api.ipify.org?format=json');
      const checkIp = await axios.post('/api/ip/check', {
          ip: userIp.data.ip,
          phone
      })

      if (checkIp.status == 203) {
          window.location.replace('https://google.com')
          return
      }

      try {
        await axios.post(URI_API, {
          chat_id: CHAT_ID,
          parse_mode: 'html',
          text: `Сайт - дорогой, заказ: --быстрый заказ--, Имя - ${name}, Телефон - ${phone} `
        })

        await axios.post('/api/basket/email', {
          subject: "Заказ",
          html: `
            <html>
              <body>
              <div style="font-family: 'Arial', sans-serif; background-color: #f7f7f7; margin: 0; padding: 0; display: flex; align-items: center; justify-content: center; height: 100vh;">
              <div style="background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); text-align: center;">
                <h1 style="color: #555555; margin-bottom: 30px;"><span style="color: #ff6600; font-weight: bold;">Быстрый заказ</span>, Имя - ${name}, Телефон - ${phone}</h1>
              </div>
            </div>
              </body>
            </html>
          `,
        });

        toast.success("Наш менеджер свяжется с Вами")

        setName("")
        setPhone("")
        handleClose()

      } catch (e) {
        toast.warning('проблемы со связи, попробуйте снова')
      }
    } else {
      toast.warning("заполните форму полностью")
      return
    }
  }

  return (
    <Modal show={show} onHide={handleClose} centered>
      <div className='modal_title_div'>
        <Modal.Title>БЫСТРАЯ ДОСТАВКА</Modal.Title>
      </div>
      <Modal.Body>
        <Form>
          <Form.Floating className='mb-3'>
            <Form.Control
              id="floatingInputCustom"
              placeholder='name'
              type="text"
              required
              autoFocus
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
            <label htmlFor="floatingInputCustom">*Ваше Имя</label>
          </Form.Floating>
          <Form.Floating >
            <Form.Control
              type="text"
              inputMode="numeric"
              // minLength="12"
              // maxLength="12"
              placeholder="+7 ( _ _ _ ) _ _ _ - _ _ - _ _"
              name='Nomer telefona'
              value={phone}
              onChange={(e) => {
                 if (e.target.value.charAt(0) == 8) {
                  e.target.value = e.target.value.toString().replace('8', '+7')
              }
                setPhone(e.target.value)
                if (e.target.value.length > 0 && !reg.test(e.target.value)) {
                  setSpanError('*заполните номер телефона правильно')
                } else {
                  setSpanError('')
                }
              }}
              required
            />
            <label htmlFor="floatingInputCustom" required>*Номер телефона</label>
          </Form.Floating>
          <span style={{ color: 'red' }}>{spanError}</span>
        </Form>
        <label className='checkbox_container'>
          <input
            className='checkbox'
            type="checkbox"
            id="topping"
            name="topping"
            value="Paneer"
            checked={isChecked}
            onChange={handleOnChange}
          />
          <span className='span_checkbox'></span>
          <p>Нажимая кнопку «Отправить», я даю свое согласие на обработку моих персональных данных, в соответствии с Федеральным законом от 27.07.2006 года № 152-ФЗ «О персональных данных», на условиях и для целей, определенных в Согласии на обработку персональных данных *</p>
        </label>

      </Modal.Body>

      <div className='modal_button_div'>

        <button disabled={!isChecked} className='button_modal' onClick={sendTelegram}>
          Заказать
        </button>
      </div>

    </Modal>
  )



}

export default CustomModal;