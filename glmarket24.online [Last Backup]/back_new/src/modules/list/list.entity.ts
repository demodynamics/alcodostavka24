import { Column, Entity, PrimaryGeneratedColumn, ManyToOne } from "typeorm";
import { CategoriesEntity } from "./categories/categories.entity";
import { listEntityName } from "src/constants";

@Entity(listEntityName)
export class ListEntity {
    @PrimaryGeneratedColumn('uuid')
    public id: string;

    @Column({type : 'varchar', length : 100, nullable : false})
    public name : string;

    @ManyToOne(() => CategoriesEntity, (category) => category.list)
    public type: CategoriesEntity;

    @Column({type : 'varchar', length : 100, nullable : false})
    public img : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public country : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public itemType : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public taste : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public fortress : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public carbonation : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public bottleType : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public volume : string;

    @Column({type : 'varchar', length : 100, nullable : true})
    public brand : string;

    @Column({type : 'integer', nullable : false})
    public price : number;

    @Column({type : 'integer', nullable : true})
    public oldPrice : number;
}
