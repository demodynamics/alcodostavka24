import * as Icon from 'react-bootstrap-icons'
import React, { useEffect, useState } from 'react';
import './Main.css'
import Marquee from 'react-fast-marquee';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';
import BasicExample from '../accordion/Accordion';
import { Form } from 'react-bootstrap';
import { toast } from 'react-toastify';

function Main({ setBasketCount, activeKey, setActiveKey }) {
    const [name, setName] = useState()
    const [phone, setPhone] = useState()
    const [spanError, setSpanError] = useState('');
    const [isChecked, setIsChecked] = useState(false);
    const reg = /(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){11,14}(\s*)?/
    const handleOnChange = () => {
        setIsChecked(!isChecked);
    };
    const { id } = useParams()
    const navigate = useNavigate()
    async function sendTelegram(e) {
        e.preventDefault()
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

            } catch (e) {
                toast.warning('проблемы со связи, попробуйте снова')
            }
        } else {
            toast.warning("заполните форму полностью")
            return
        }
    }

    async function getCardItems() {
        if (id) {
            const card = await axios.get(`/api/basket/get/${id}`)

            if (card.status === 200) {
                if (card.data.card && card.data.card.length > 0) {
                    localStorage.setItem('cardId', JSON.stringify(id))
                    localStorage.setItem('basket', JSON.stringify(card.data.card))
                    setBasketCount(card.data.card.length)
                }
            }
        }
        navigate('/')
    }

    useEffect(() => {
        getCardItems()
    }, [])

    return (
        <>
            <div className="div_main">
                <div className="div_main_foto">
                    <img src='./img-main/fon.jpg' alt="" />
                    <Icon.Telegram className="telegram_icon" onClick={() => window.open("https://t.me/alcodostavkamolnia_bot", '_blank')} />
                    <div className="divText">
                        <p>ДОСТАВКА ПРОДУКТОВ ПО МОСКВЕ И МОСКОВСКОЙ ОБЛАСТИ</p>
                        <p>Круглосуточно</p>
                        <a className='tel_number_main' href="tel:+74950155560">+7(495)01-555-60</a>
                    </div>
                    <div className='modal_main'>

                        <Form className='form'>
                            <p>БЫСТРАЯ ДОСТАВКА</p>
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
                            <div className='modal_button_div'>

                                <button disabled={!isChecked} className='button_modal' onClick={sendTelegram}>
                                    Заказать
                                </button>
                            </div>
                        </Form>
                    </div>
                </div>
                <Marquee speed={40}>
                    <div className='div_logo_brand'>
                        <img src='./img-main/absolut.png' alt='absolute' />
                        <img src='./img-main/ballantines-finest.png' alt='ballantines' />
                        <img src='./img-main/jack.png' alt='jack' />
                        <img src='./img-main/jameson.png' alt='jameson' />
                        <img src='./img-main/Jim-Beam.png' alt='jim-beam' />
                        <img src='./img-main/Chivas.png' alt='chivas' />
                        <img src='./img-main/Johnnie_Walker.png' alt='walker' />
                        <img src='./img-main/jameson.png' alt='jameson' />
                        <img src='./img-main/Jim-Beam.png' alt='jim-beam' />
                        <img src='./img-main/Chivas.png' alt='chivas' />
                        <img src='./img-main/Johnnie_Walker.png' alt='walker' />
                    </div>
                </Marquee>
                <Marquee direction='right' speed={40}>
                    <div className='div_logo_brand2'>
                        <img src='./img-main/cheetos.png' alt='cheetos' />
                        <img src='./img-main/Hrusteam.png' alt='hrusteam' />
                        <img src='./img-main/korochki.png' alt='korochki' />
                        <img src='./img-main/lays.png' alt='lays' />
                        <img src='./img-main/Oker.png' alt='oker' />
                        <img src='./img-main/shturval.png' alt='shturval' />
                        <img src='./img-main/beerka.png' alt='beerka' />
                        <img src='./img-main/martin.png' alt='martin' />
                        <img src='./img-main/lays.png' alt='lays' />
                        <img src='./img-main/Oker.png' alt='oker' />
                        <img src='./img-main/shturval.png' alt='shturval' />
                        <img src='./img-main/beerka.png' alt='beerka' />
                        <img src='./img-main/martin.png' alt='martin' />
                        <img src='./img-main/shturval.png' alt='shturval' />
                    </div>
                </Marquee>

                <h1 className='catalog_h1'>Каталог</h1>
                <BasicExample setBasketCount={setBasketCount} activeKey={activeKey} setActiveKey={setActiveKey} />

            </div>
        </>
    )
}

export default Main;