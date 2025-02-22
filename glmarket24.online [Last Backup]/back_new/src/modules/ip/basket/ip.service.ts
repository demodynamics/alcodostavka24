import { Injectable, BadRequestException, NotFoundException, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { IpEntity } from './ip.entity';
import { Request, Response } from 'express';


@Injectable()
export class IpService {
    constructor(
        @InjectRepository(IpEntity)
        private ipRepo: Repository<IpEntity>,
    ) { }

    public async checkIp(
        req: Request,
        res: Response
    ) {
        const reg = /^\+7[49]\d{9}$/;
        try {
            const existingIp = await this.ipRepo.findOne({ where: { ip: req.body.ip } });
            if (existingIp) {
                if (existingIp.is_blocked_ip || existingIp.wrong_request_count >= 2) {
                    existingIp.is_blocked_ip = true
                    await this.ipRepo.save(existingIp)
                    res.status(203).json({ message: 'This IP is blocked' });
                    return
                }

                if (req.body.phone && !reg.test(req.body.phone.toString())) {
                    existingIp.wrong_request_count += 1;

                    await this.ipRepo.save(existingIp)
                }
            } else {
                await this.ipRepo.save(this.ipRepo.create({
                    ip: req.body.ip,
                    is_blocked_ip: false,
                    wrong_request_count: req.body.phone && !reg.test(req.body.phone.toString()) ? 1 : 0
                }))
            }

            res.sendStatus(200);
        } catch (e) {
            console.log(e)
        }
    }

    public async redirect(
        req: Request,
        res: Response
    ) {
        try {
            const existingIp = await this.ipRepo.findOne({ where: { ip: req.body.ip } });
            console.log(req.body)
            if (!existingIp) {
                res.sendStatus(200);
                return
            }

            if (existingIp.is_blocked_ip || existingIp.wrong_request_count >= 2) {
                res.status(203).json({ message: 'This IP is blocked' });
            }
        } catch (e) {
            console.log(e)
        }
    }


}
