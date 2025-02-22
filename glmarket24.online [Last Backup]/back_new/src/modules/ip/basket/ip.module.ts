import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';import { IpController } from './ip.controller';
import { IpService } from './ip.service';
import { IpEntity } from './ip.entity';
;

@Module({
  imports: [
    TypeOrmModule.forFeature([IpEntity])
  ],
  controllers: [IpController],
  providers: [IpService],
  exports : []
})

export class IpModule {}