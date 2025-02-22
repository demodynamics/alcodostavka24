import { Module, NestModule, MiddlewareConsumer, RequestMethod, forwardRef } from '@nestjs/common';
import { ListModule } from './modules/list/list.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import config from './orm.config';
import { AdminModule } from './modules/admin/admin.module';
import { AuthMiddleware, IWhiteListItem } from './middlewares';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { BasketModule } from './modules/basket/basket.module';
import { ScheduleModule } from '@nestjs/schedule';
import { IpModule } from './modules/ip/basket/ip.module';

@Module({
  imports: [
    TypeOrmModule.forRoot(config),
    ListModule,
    AdminModule,
    BasketModule,
    IpModule,
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', '..', 'back_new', 'image'),
      serveRoot: "/api/imgs"
    }),
    ScheduleModule.forRoot()
  ],
  controllers: [],
  providers: [],
})


export class AppModule implements NestModule {
  public configure (consumer: MiddlewareConsumer): void {
    const authWhiteList: IWhiteListItem[] = [
      { url: '/api/admin/login' },
      { url: '/api/admin/register' },
      { url: '/api/list/add' },
      { url: '/api/basket/add' },
      { url: '/api/basket/get/:id' },
      { url: '/api/basket/delete/:id' },
      { url: '/api/ip/check' },
      { url: '/api/ip/redirect' },
      { url: '/api/basket/email' },
    ];
    consumer.apply(AuthMiddleware(authWhiteList)).forRoutes({
      path: '*',
      method: RequestMethod.ALL
    });
  }
}

