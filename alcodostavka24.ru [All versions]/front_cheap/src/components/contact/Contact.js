
import './contact.css'

function Contact() {
    return (
        <>
            <div className="contact">
                <div className='contact_div'>
                    <h1>Контакты доставки алкоголя по Москве</h1>
                    <hr />
                    <p>
                        Наш интернет магазин название сайта занимается продажей и доставкой оригинальных спиртных
                        напитков в Москве и Подмосковье круглосуточно. У нас вы найдете широкий ассортимент
                        товаров: от классических марок до алкоголя супер-премиум класса, от нежного шампанского до
                        виски бочковой крепости, от греческого бренди до кубинского рома, от серебряной текилы до
                        черной водки. Происхождение всех спиртных напитков, имеющихся в продаже, имеют акцизы и
                        марки ЕГАИС, что исключает возможность подделок и обеспечивает только качественные и
                        сертифицированные товары недорого. Всегда верим, что помогая другим, ты помогаешь прежде
                        всего себе.
                        <br />
                        Мы хотим, чтобы покупка алкоголя в нашем интернет магазине название сайта была удобной и
                        приятной. Наши консультанты в любое время окажут Вам профессиональные консультации по
                        товару. Широкий ассортимент нашего магазина и гибкая система скидок позволяют нам
                        оставаться лучшими на рынке. На страницах нашего интернет-магазина как совсем не дорогие
                        напитки, так и эксклюзивы. Получить алкоголь через 30 минут после оформления заказа и
                        оставаться всегда в хорошем расположении духа — все это название сайта. Наш курьер
                        обязательно с Вами свяжется и уточнит все детали во время выполнения заявки. Он уточнит
                        маршрут и особые пожелания.
                        <br />
                        Доставка алкоголя на дом 24 часа в сутки - это отличное решение для клиента, умеющего ценить
                        качественный сервис на всех этапах заказа. Как следствие, много довольных и счастливых
                        клиентов, которые стали для нас постоянными.
                        
                        Мы ценим каждого нашего клиента и стремимся предоставить только высококачественный сервис. Закажите алкоголь с доставкой в Москве у нас и наслаждайтесь комфортом и удобством, которые мы можем вам предложить!
                    </p>
                    <h1 className='connect'><a className='tel_number_contact' href="tel:5554280940">+7 (000) 000-00-01</a></h1>
                    <h1 className='connect'  onClick={() => window.open("https://t.me/alcodostavka24molnia_bot", '_blank')}>Телеграм: @alcodostavkamolnia_bot</h1>
                </div>


                <div className='map_div'>
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d406512.0576584382!2d37.272616543034665!3d55.746635512126495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46b54afc73d4b0c9%3A0x3d44d6cc5757cf4c!2z0JzQvtGB0LrQstCwLCDQoNC-0YHRgdC40Y8!5e0!3m2!1sru!2sam!4v1684143418121!5m2!1sru!2sam"
                        width='100%'
                        height="450"
                        style={{ border: 0 }}
                        allowFullScreen=""
                        loading="lazy"
                        referrerPolicy="no-referrer-when-downgrade"
                    ></iframe>
                </div>
            </div>
        </>

    )

}

export default Contact;