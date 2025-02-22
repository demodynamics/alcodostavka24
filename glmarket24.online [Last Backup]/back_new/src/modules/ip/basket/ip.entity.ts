import { Column, Entity, PrimaryGeneratedColumn, CreateDateColumn } from "typeorm";
import { ipEntityName } from "src/constants";

@Entity(ipEntityName)
export class IpEntity {
    @PrimaryGeneratedColumn('uuid')
    public id: string;

    @Column({type : 'varchar', unique : true,  nullable : true})
    public ip : string;

    @Column({type : 'integer',  nullable : true})
    public wrong_request_count : number;

    @Column({type : 'boolean',  nullable : false})
    public is_blocked_ip : boolean;

    @CreateDateColumn({ nullable : false})
    public created_at: Date;
}
