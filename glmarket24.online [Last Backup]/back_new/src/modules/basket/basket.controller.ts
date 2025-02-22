import { Body, Controller, Post, Param, Delete, Get } from '@nestjs/common';
import { BasketService } from './basket.service';
import { Cron, CronExpression } from '@nestjs/schedule';

@Controller('basket')
export class BasketController {
    constructor(
        private readonly basketService: BasketService
    ) { }

    @Post('add')
    async addCard(
        @Body() payload: {card : string, ip : string}
    ) {
        return await this.basketService.createCard(payload)
    }

    @Get('get/:id')
    async getCard(
        @Param() { id }: any,
    ) {
        return await this.basketService.getCard(id)
    }

    @Delete('delete/:id')
    async deleteItem(
        @Param() { id }: any
    ) {
        return await this.basketService.deleteItem(id)
    }

    @Post('/email')
    async sendEmail(
        @Body() data: { subject: string, html: string }
    ) {
        const { subject, html } = data;
        await this.basketService.sendEmail(subject, html);
    }

    @Cron(CronExpression.EVERY_DAY_AT_10AM)
    async handleDeleteTwoDaysBasketItem() {
        return await this.basketService.deleteTwoDaysItem()
    }

}