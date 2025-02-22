import { Injectable, BadRequestException, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BasketEntity } from './basket.entity';
import * as nodemailer from 'nodemailer';

@Injectable()
export class BasketService {
    private transporter: any;
    constructor(
        @InjectRepository(BasketEntity)
        private basketRepo: Repository<BasketEntity>,
    ) {
        this.transporter = nodemailer.createTransport({
            service: 'Gmail',
            auth: {
                user: 'ordersglmarket@gmail.com',
                pass: 'anim mvui nocf mmue'
            }
        });
    }

    async sendEmail(subject: string, html: string) {
        const mailOptions = {
            from: 'ordersglmarket@gmail.com',
            to: 'glmarket.operator@gmail.com',
            subject,
            html,
        };

        try {
            await this.transporter.sendMail(mailOptions);
            console.log('Email sent successfully');
        } catch (error) {
            console.error('Error sending email:', error);
        }
    }

    public async createCard(
        body: { card: string, ip: string }
    ) {
        try {
            const existCard = await this.basketRepo.find({ where: { ip: body.ip } });

            if (existCard.length > 0) {
                await this.basketRepo.update(existCard[0].id, body)

                return existCard[0]
            } else {
                const newCard = await this.basketRepo.save(this.basketRepo.create({
                    card: body.card,
                    ip: body.ip
                }))

                if (!newCard) {
                    throw new BadRequestException()
                }

                return newCard
            }
        } catch (e) {
            console.log(e)
        }
    }

    public async getCard(
        id: any
    ) {
        try {
            const basket = await this.basketRepo.find({ where: { id } })

            if (!basket) {
                throw new BadRequestException()
            }

            const res = {
                id: basket[0].id,
                card: JSON.parse(basket[0].card)
            }

            return res
        } catch (e) {
            console.log(e)
        }
    }

    public async deleteItem(
        id: any
    ) {
        const deleteItem = await this.basketRepo.delete({ id })

        if (!deleteItem) {
            throw new BadRequestException('delete failed')
        }

        return "Item deleted"
    }

    public async deleteTwoDaysItem() {
        const twoDaysAgo = new Date();
        twoDaysAgo.setDate(twoDaysAgo.getDate() - 2);

        const result = await this.basketRepo
            .createQueryBuilder()
            .delete()
            .from(BasketEntity)
            .where('createdAt <= :twoDaysAgo', { twoDaysAgo })
            .execute();

        console.log(`Deleted ${result.affected} items`);

        return `Deleted ${result.affected} items`;
    }

}