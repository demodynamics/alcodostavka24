import './basket.css';
import { useCallback, useEffect, useState } from 'react';
import { Button, Form } from 'react-bootstrap';
import axios from 'axios';
import * as Icon from 'react-bootstrap-icons'
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';

const TOKEN = "6104094925:AAEAcMEOPXFtUvUmgGejDzfl8HBNjLzH8X0";
const CHAT_ID = "-1001633078067";

function Basket({ setBasketCount }) {
    const [basketItems, setBasketItems] = useState(JSON.parse(localStorage.getItem('basket')) || []);
    const [totalPrice, setTotalPrice] = useState(0);
    const [totalPriceDel, setTotalPriceDel] = useState(0);
    const [nameA, setNameA] = useState('');
    const [phoneA, setPhoneA] = useState('');
    const [streetA, setStreetA] = useState('');
    const [homeA, setHomeA] = useState('');
    const [otherA, setOtherA] = useState('');
    const [selectedCity, setSelectedCity] = useState('Москва');
    const [selectedValue, setSelectedValue] = useState(0);
    const [spanError, setSpanError] = useState('');
    const navigate = useNavigate()
    const handleRadioChange = (event) => setSelectedValue(parseInt(event.target.value));
    const handleSelectChange = (event) => setSelectedCity(event.target.value);

    useEffect(() => {
        let newTotalPrice = [null]

        if (basketItems) {
            newTotalPrice = basketItems.reduce((acc, item) => {
                return (acc + item.price * item.quantity);
            }, 0);
        }
        setTotalPrice(newTotalPrice)
    }, [basketItems]);

    useEffect(() => {
        setTotalPriceDel(parseInt(selectedValue) + totalPrice);
    }, [totalPrice, selectedValue]);

    const handleRemoveItem = (index) => {
        const newBasketItems = [...basketItems];
        newBasketItems.splice(index, 1);
        setBasketItems(newBasketItems);
        localStorage.setItem('basket', JSON.stringify(newBasketItems));
        setBasketCount(JSON.parse(localStorage.getItem('basket')).length)
    };

    function sendItems() {
        const send = []
        if (localStorage.getItem('basket')) {
            JSON.parse(localStorage.getItem('basket')).forEach(e => {
                send.push({
                    "Имя": `<b>${e.name}</b>`,
                    "Цена": `<b>${e.price}</b>`,
                    "Количество": `<b>${e.quantity}</b>`
                })
            })
        }

        return send
    }

    const reg = /(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){11,14}(\s*)?/;

    async function sendTelegram(e) {
        e.preventDefault()

        const userIp = await axios.get('https://api.ipify.org?format=json');
        const checkIp = await axios.post('/api/ip/check', {
            ip: userIp.data.ip,
            phone: phoneA
        })

        if (checkIp.status == 203) {
            window.location.replace('https://google.com')
            return
        }

        const URI_API = `https://api.telegram.org/bot${TOKEN}/sendMessage`;
        if (nameA && reg.test(phoneA) && streetA && homeA && selectedValue && basketItems.length > 0) {
            try {
                await axios.post(URI_API, {
                    chat_id: CHAT_ID,
                    parse_mode: 'html',
                    text: `Сайт - дорогой, заказчик  /  Имя - ${nameA},  Телефон - ${phoneA},  Город - ${selectedCity},  Улица - ${streetA},  Дом - ${homeA},  Дополнительно - ${otherA ? otherA : "---"},  Стоимость доставки - ${selectedValue},  итого = ${totalPrice}  :                 заказ - ${JSON.stringify(sendItems())}`
                })

                await axios.post('/api/basket/email', {
                    subject: "Заказ",
                    html: `
                      <html>
                        <body>
                        <h1 style="font-size: 24px;">Заказчик:</h1>
                        <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Имя</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${nameA}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Телефон</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${phoneA}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Город</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${selectedCity}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Улица</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${streetA}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Дом</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${homeA}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Дополнительно</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${otherA ? otherA : "---"}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Стоимость доставки</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${selectedValue}</td>
                          </tr>
                          <tr>
                            <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Итого (сумма без учета доставки)</th>
                            <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${totalPrice}</td>
                          </tr>
                        </table>
                        
                        <h2 style="font-size: 20px;">Заказ:</h2>
                        <table style="width: 100%; border-collapse: collapse;">
                          <thead>
                            <tr>
                              <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Имя</th>
                              <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Цена</th>
                              <th style="border: 1px solid #dddddd; text-align: left; padding: 8px; background-color: #f2f2f2;">Количество</th>
                            </tr>
                          </thead>
                          <tbody>
                            ${sendItems().map(item => `
                              <tr>
                                <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${item.Имя}</td>
                                <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${item.Цена}</td>
                                <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;">${item.Количество}</td>
                              </tr>
                            `).join('')}
                          </tbody>
                        </table>
                        
                        </body>
                      </html>
                    `,
                });

                toast.success("Заказ принят")

                setNameA("")
                setPhoneA("")
                setStreetA("")
                setHomeA("")
                setOtherA("")
                localStorage.setItem('basket', JSON.stringify([]))
                setBasketItems([])
                setBasketCount(JSON.parse(localStorage.getItem('basket')).length)

                if (JSON.parse(localStorage.getItem('cardId'))) {
                    const id = JSON.parse(localStorage.getItem('cardId'));
                    await axios.delete(`/api/basket/delete/${id}`);
                }
            } catch (e) {
                toast.warning('Проблемы со связи, попробуйте снова')
            }
        } else {
            toast.warning("Заполните форму полностью и без ошибок")
            return
        }
    }

    const handlePlusQuantity = useCallback((item) => {
        let basketFilter = basketItems.map((el) => {
            if (el.id === item.id) {
                el.quantity++
            }
            return el
        })
        setBasketItems(basketFilter)
        localStorage.setItem('basket', JSON.stringify(basketItems))
    }, [basketItems])

    const handleDashQuantity = useCallback((item) => {
        if (item.quantity === 1) {
            return
        }
        let basketFilter = basketItems.map((el) => {
            if (el.id === item.id) {
                el.quantity--
            }
            return el
        })
        setBasketItems(basketFilter)
        localStorage.setItem('basket', JSON.stringify(basketItems))
    }, [basketItems])

    return (
        <div className='bask_container'>
             <span><span className='span_back' onClick={()=>navigate('/')}>Главная</span> {'>'} Корзина</span>
            <div className="basket_container_responsive">
               
                <div className='table_div'>
                    {
                        basketItems && basketItems.length === 0 ?
                            <p style={{ marginLeft: '5px' }}>Корзина Пустая</p> :
                            <table className='basket_table'>
                                <tbody>
                                    {basketItems && basketItems.map((item, index) => {
                                        return (
                                            <tr key={index}>
                                                <td className='img_td_th'>
                                                    <img className='img_td' src={`/api/imgs/${item.type.name}/${item.img}${/\.\w+$/.test(item.img) ? '' : '.jpg'}`} alt="" />
                                                </td>
                                                <td className='td_name'>{item.name}
                                                    <div className='td_name_div'>
                                                        <h6>Объем</h6>
                                                        <h4>{item.volume}</h4>
                                                    </div>

                                                </td>
                                                <td className='td_price'>{item.price} P</td>
                                                <td>
                                                    <div className="quantity">
                                                        <p className='p_quantity'>
                                                            <Icon.Dash className='icon_dash' onClick={() => { handleDashQuantity(item) }} />
                                                            {item.quantity}
                                                            <Icon.Plus className='icon_plus' onClick={() => { handlePlusQuantity(item) }} />
                                                        </p>

                                                    </div>
                                                </td>
                                                <td>
                                                    <Button className="btn_delete" variant="light" onClick={() => handleRemoveItem(index)}><Icon.Trash /></Button>
                                                </td>
                                                <td className='td_price'><span>Всего: </span>{item.quantity > 1 ? item.price * item.quantity : item.price} P</td>
                                            </tr>
                                        )
                                    })}
                                </tbody>
                            </table>
                    }

                </div>

                <div className='div_total'>
                    <p>Итого к оплате (сумма без учета доставки) <span>{isNaN(totalPrice) ? '-' : totalPrice.toString()} P</span></p>
                </div>
            </div>
            <h1 className='basket-title'>ДЕТАЛИ ОПЛАТЫ</h1>
            <hr />
            <div className='form_basket'>


                <div className='basket-information'>
                    <p>Свыше 15-и км. от МКАД, 1 км. - 15 рублей</p>
                    <div className='radios'>

                        <div>
                            <h5>Оплата наличными или онлайн переводом.</h5>
                        </div>
                        <div>
                            <input type='radio' id='vmkad' name="delivery" value={450} onChange={handleRadioChange} />{" "}<label htmlFor="vmkad">Москва в пределах МКАД</label><span> - <b>450 P</b></span>
                        </div><br />
                        <div>
                            <input type='radio' id='zamkad' name="delivery" value={700} onChange={handleRadioChange} />{" "}<label htmlFor="zamkad">Москва за пределами МКАД</label><span> - <b>700 P</b></span>
                        </div><br />
                        <div>
                            <input type='radio' id='mo' name="delivery" value={900} onChange={handleRadioChange} />{" "}<label htmlFor="mo">Московская область</label><span> - <b>от 900 P</b></span>
                        </div>
                    </div><hr />
                    <h1>Стоимость товара: {isNaN(totalPrice) ? '-' : totalPrice.toString()} P</h1>
                    <h1>Стоимость доставки: {isNaN(selectedValue) ? '-' : selectedValue.toString()} P</h1>
                    <hr />
                    <h1>Итого к оплате: {isNaN(totalPriceDel) ? '-' : totalPriceDel.toString()} P</h1>
                </div>
                <div className='form_delivery_div'>
                    <Form className='form_delivery' >
                        <h1>Оплата и доставка</h1>
                        <Form.Floating className='mb-3'>
                            <Form.Control
                                id="floatingInputCustom"
                                placeholder='Имя'
                                type="text"
                                name='Imya'
                                value={nameA}
                                onChange={(e) => setNameA(e.target.value)}
                                required
                            />
                            <label htmlFor="floatingInputCustom">*Ваше Имя</label>
                        </Form.Floating>
                        <Form.Floating>
                            <Form.Control
                                type="text"
                                inputMode="numeric"
                                // minLength="12"
                                // maxLength="12"
                                placeholder="+7 ( _ _ _ ) _ _ _ - _ _ - _ _"
                                name='Nomer telefona'
                                value={phoneA}
                                onChange={(e) => {
                                    if (e.target.value.charAt(0) == 8) {
                                        e.target.value = e.target.value.toString().replace('8', '+7')
                                    }
                                    setPhoneA(e.target.value)
                                    if (e.target.value.length > 0 && !reg.test(e.target.value)) {
                                        setSpanError('*заполните номер телефона правильно')
                                    } else {
                                        setSpanError('')
                                    }
                                }}
                                required
                            />
                            <label htmlFor="floatingInputCustom">*Номер телефона</label>
                        </Form.Floating>
                        <span style={{ color: 'red' }}>{spanError}</span>
                        <Form.Floating>

                            <input
                                type="text"
                                list="cities"
                                className="form-control"
                                value={selectedCity}
                                onChange={handleSelectChange}
                            />
                            <datalist id="cities">
                                <option value="Москва" />
                                <option value="Балашиха" />
                                <option value="Красногорск" />
                                <option value="Лобня" />
                                <option value="Люберцы" />
                                <option value="Мытищи" />
                                <option value="Одинцово" />
                                <option value="Подольск" />
                                <option value="Пушкино" />
                                <option value="Реутов" />
                                <option value="Троицк" />
                                <option value="Химки" />
                                <option value="Щербинка" />
                                <option value="Электроугли" />
                                <option value="Видное" />
                                <option value="Дзержинск" />
                                <option value="Долгопрудный" />
                                <option value="Домодедово" />
                                <option value="Королев" />
                                <option value="Железнодорожный" />
                                <option value="Жуковский" />
                                <option value="Зеленоград" />
                                <option value="Климовск" />
                            </datalist>
                            <label htmlFor="floatingInputCustom">*Город</label>
                        </Form.Floating>
                        <Form.Floating>

                            <Form.Control
                                type="text"
                                placeholder="Название Улицы"
                                name='Ulica'
                                value={streetA}
                                onChange={(e) => setStreetA(e.target.value)}
                                required
                            />
                            <label htmlFor="floatingInputCustom">*Название Улицы</label>
                        </Form.Floating>
                        <Form.Floating>

                            <Form.Control
                                type="text"
                                inputMode="numeric"
                                placeholder='Home'
                                value={homeA}
                                onChange={(e) => setHomeA(e.target.value)}
                                required
                            />
                            <label htmlFor="floatingInputCustom">*Дом</label>
                        </Form.Floating>
                        <Form.Floating>
                            <Form.Control
                                className='texterea'
                                as="textarea"
                                name='Dopolnitelno'
                                aria-label="With textarea"
                                placeholder="примечание к вашему заказу"
                                value={otherA}
                                onChange={(e) => setOtherA(e.target.value)}

                            />
                            <label htmlFor="floatingInputCustom">Примечание к вашему заказу</label>
                        </Form.Floating>
                        <Form.Floating className='close'>
                            <Form.Control
                                type="text"
                                name='zakaz'
                                value={JSON.stringify({
                                    zakaz: encodeURIComponent(JSON.stringify(sendItems())),
                                    summa: totalPrice
                                })}
                                onChange={() => console.log()}
                                required
                            />
                        </Form.Floating>

                        <button variant="primary" type="submit" onClick={(e) => sendTelegram(e)}>
                            Заказать
                        </button>
                    </Form>
                </div>
            </div>
        </div>
    )
}

export default Basket;