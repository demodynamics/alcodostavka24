import { Body, Controller, Get, Post, Req, Res } from '@nestjs/common';
import { IpService } from './ip.service';
import { Request, Response } from 'express';

@Controller('ip')
export class IpController {
    constructor(
        private readonly ipService: IpService
    ) { }

    @Post('/check')
    async checkIp(
        @Req() req:Request, 
        @Res() res:Response
    ) {
       return await this.ipService.checkIp(req, res);
    }

    @Post('/redirect')
    async redirect(
        @Req() req:Request, 
        @Res() res:Response
    ) {
        return await this.ipService.redirect(req, res)
    }
   

}