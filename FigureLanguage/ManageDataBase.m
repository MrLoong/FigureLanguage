//
//  ManageDataBase.m
//  FigureLanguage
//
//  Created by MrLoong on 15/9/20.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import "ManageDataBase.h"


static  NSManagedObjectContext *context = nil;

@implementation ManageDataBase

+(void)LoadData{
    //Nil表是从主bundles中加对应的模型实体
    NSManagedObjectModel *model=[NSManagedObjectModel mergedModelFromBundles:nil];
    for (NSEntityDescription *desc in model.entities) {
        NSLog(@"%@",desc.name);
    }
    //通过模型 和数据库持久化
    NSPersistentStoreCoordinator *storeCoordinator=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    //持久化到coredata中
    NSString *document= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    document=[document stringByAppendingPathComponent:@"coredata.db"];
    NSURL *url=[NSURL fileURLWithPath:document];
    
    NSLog(@"%@",url);
    
    NSError *error=nil;
    [storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if(error){
        NSLog(@"打开数据库失败");
        return;
    }
    
    context=[[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator=storeCoordinator;
    
}

+(void)addData :(NSString *)title withText:(NSString *)text{
    
    Message *message  = [[Message alloc] init];
    [message setText:text];
    [message setTitle:title];
    //把实体对象和实体上下文相关联
    NSManagedObject *obj=[NSEntityDescription insertNewObjectForEntityForName:@"Mes" inManagedObjectContext:context];
    [obj setValue: title forKey:@"title"];
    [obj setValue: text forKey:@"text"];

    
    //保存上下文中相关联的对象即可
    
    [context save:nil];
    
}

+(NSMutableArray *)searchdata{
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Mes"];
    
    //排序
    //    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    //    fetch.sortDescriptors=@[sort];
    //加入查询条件 age>20
    //    fetch.predicate=[NSPredicate predicateWithFormat:@"age>%i",20];
    //加入like *c1"
    //fetch.predicate=[NSPredicate predicateWithFormat:@"name like %@",@"*cb1*"];
    NSArray *arr=[context executeFetchRequest:fetch error:nil];
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (NSManagedObject *mode in arr) {
        NSString *title=[mode valueForKey:@"title"];
        NSString *text=[mode valueForKey:@"text"];
        //        int age =[[mode valueForKey:@"age"] intValue];
        
        Message *message = [[Message alloc]init];
        [message setText:text];
        [message setTitle:title];
        NSLog(@"%@",[message getTitle]);
        [arry addObject:message];
    }
    return arry;
    
}

+(void)UdataData{
    //要操作那一张表
    NSFetchRequest *Fetch=[NSFetchRequest fetchRequestWithEntityName:@"Mes"];
    //先创建排序描述，在排序
    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    Fetch.sortDescriptors=@[sort];
    //加入查询条件
    Fetch.predicate=[NSPredicate predicateWithFormat:@"age>%i",5];
    //把条件加入到上下文进行操作,得到查询集合
    NSArray * arr=[context executeFetchRequest:Fetch error:nil];
    for (NSManagedObject *obj in arr) {
        //更改实体的数据
        [obj setValue:@(50) forKey:@"age"];
    }
    //同步更数据库相关联的数据
    [context save:nil];
}

+(void)deleteData{
    //要找出上下文中操作的一张表
    NSFetchRequest *FectchRequest=[NSFetchRequest fetchRequestWithEntityName:@"Mes"];
    FectchRequest.predicate=[NSPredicate predicateWithFormat:@"age<%i",50];
    NSArray *arr=[context executeFetchRequest:FectchRequest error:nil];
    for (NSManagedObject *obj in arr) {
        [context deleteObject:obj];
    }
    //同步数据库
    [context save:nil];
}

@end
