import { Column, Entity, PrimaryGeneratedColumn, CreateDateColumn } from "typeorm";
import { basketEntityName } from "src/constants";

@Entity(basketEntityName)
export class BasketEntity {
    @PrimaryGeneratedColumn('uuid')
    public id: string;

    @Column({type : 'varchar',  nullable : false})
    public card : string;

    @Column({type : 'varchar', unique : true,  nullable : false})
    public ip : string;

    @CreateDateColumn({ nullable : false})
    public createdAt: Date;
}
