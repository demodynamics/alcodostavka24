import Catalog from "./catalog/Catalog";
import * as Icon from 'react-bootstrap-icons'
import './Main.css'
import { Button, Form, Modal,InputGroup } from "react-bootstrap";
import { toast } from "react-toastify";
import { useState, useEffect } from "react";
import axios from "axios";


function Main() {

    const [name, setName] = useState()
    const [phone, setPhone] = useState()
    const [show, setShow] = useState(false);
	const [spanError, setSpanError] = useState('');
    const handleClose = () => {
        setShow(false)
        setName("")
        setPhone("")
    };
    const handleShow = () => setShow(true);

     const reg = /^\d{10}$/


    async function sendTelegram() {
        const TOKEN = "6104094925:AAEAcMEOPXFtUvUmgGejDzfl8HBNjLzH8X0"
        const CHAT_ID = "-1001633078067"
        const URI_API = `https://api.telegram.org/bot${TOKEN}/sendMessage`;

        if (name && reg.test(phone)) {
            try {
                await axios.post(URI_API, {
                    chat_id: CHAT_ID,
                    parse_mode: 'html',
                    text: {
                        "Сайт" : "дорогой",
                        заказ: `<b>___быстрый заказ___</b>      <b>Имя:</b> ${name}     <b>Телефон:</b> +7${phone} `
                    }
                })

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
        <>
            <Icon.Telegram className="telegram_icon" onClick={() => window.open("https://t.me/alcodostavkamolnia_bot", '_blank')}/>
            <div className='mainFoto'>
                <div className="divText">
                    <p>ДОСТАВКА АЛКОГОЛЯ ПО МОСКВЕ
                        <br />
                        И МОСКОВСКОЙ ОБЛАСТИ
                        <br /> Круглосуточно<br /> <a className='tel_number_main' href="tel:5554280940">+7 (000) 000-00-01</a>
                        <br />
                        <br />
                        <Button className="button_telegram" variant="success" onClick={() => window.open("https://t.me/alcodostavkamolnia_bot", '_blank')}>Заказать через телеграм{' '}<Icon.Telegram className="telegram_button_icon" /></Button>
                        <Button className="button_one_click" variant="success" onClick={handleShow}>Купить в 1 клик</Button>
                    </p>
                </div>

            </div>

            <Catalog />
            <Modal show={show} onHide={handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Купить в 1 клик</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
						<Form.Label>Имя</Form.Label>
                        <InputGroup className="mb-3">
                            <Form.Control
                                type="text"
                                required
                                autoFocus
                                value={name}
                                onChange={(e) => setName(e.target.value)}
                            />
                        </InputGroup>
							<Form.Label>Тел.</Form.Label>
                        	<InputGroup >
							<InputGroup.Text>+7</InputGroup.Text>
                            <Form.Control
                                type="text"
                                inputMode="numeric"
                                minLength="10"
                                maxLength="10"
                                placeholder="999 000 00 01"
                                name='Nomer telefona'
                                value={phone}
                                onChange={(e) => {
                                        setPhone(e.target.value)
									if(!reg.test(e.target.value)){
										setSpanError('заполните номер телефона правильно')
									}else{
										setSpanError('')
									}
                                }}
                                required
                            />
							</InputGroup>
						<span style={{color: 'red'}}>{spanError}</span>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Отменить
                    </Button>
                    <Button variant="primary" onClick={sendTelegram}>
                        Заказать
                    </Button>
                </Modal.Footer>
            </Modal>
        </>
    )
}

export default Main;