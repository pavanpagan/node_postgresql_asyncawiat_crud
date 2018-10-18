var pg = require('pg');
var Pool = require('pg-pool')
var momentnew = require('moment-timezone');
const moment = require('moment');


var config = {
    user: 'postgres',
    database: 'kotmaster',
    password: 'root',
    host: 'localhost',
    port: 5432
  };
  
  var con = new pg.Pool(config);
  con.connect();
  

  let current_date_time=moment.tz('Asia/Kolkata').format("YYYY-MM-DD h:mm:ss a");


module.exports.addCategory = async function(category_data)
{
    let category_name = category_data.category_Name;
    let type_id=category_data.type_id;
    let query1 = "insert into item_category(category_name,t_id) values($1,$2)";
    try
    {
       let data=await con.query(query1,[category_name,type_id]);
       return data;
    }
    catch(err)
    {
        throw err;
    }
}

module.exports.addItem=async function(item_data)
{
    let item_name=item_data.item_name;
    let item_desc=item_data.item_desc;
    let item_status=item_data.item_status;
    let c_id=item_data.c_id;
    let image=item_data.image;
    let price=item_data.price;
    let query1="insert into items(item_name,item_desc,item_status,c_id,image) values($1,$2,$3,$4,$5) returning item_id as item_id";
    let params1=[item_name,item_desc,item_status,c_id,image];
    let query2="insert into prices(i_id,price,date_time) values($1,$2,$3)";

    try
        {
            await con.query('BEGIN');
            let data=await con.query(query1,params1);
            let item_id=data.rows[0].item_id;
            let params2=[item_id,price,current_date_time];
            await con.query(query2,params2);
            return await con.query('COMMIT');
        }
    catch(error)
        {
            try 
            {
                await con.query('ROLLBACK');
            }
            catch (rollbackError)
            {
                console.log('A rollback error occurred:', rollbackError);
                throw rollbackError
            }
            throw error;
        }
}

module.exports.ViewCategory = async function()
{
    let query1="select * from item_category"
    try
    {
        let data=await con.query(query1);
        return data;
    }
    catch(err)
    {
        throw err
    }
}

module.exports.ViewItems = async function()
{
    let query1=`select type_name,category_name,item_name,item_desc,item_status,image,price,date_time from items 
    INNER JOIN prices ON items.item_id=prices.i_id 
    INNER JOIN item_category ON item_category.category_id=items.c_id
    INNER JOIN item_type ON item_type.type_id=item_category.t_id`;
    try
    {
        let data=await con.query(query1);
        return data;
    }
    catch(err)
    {
        throw err
    }
}


module.exports.UpdateCategory=async function(cat_id,update_values)
{
    let category_id=cat_id;
    let category_name=update_values.category_name;
    let t_id=update_values.t_id;
    let query1="update item_category set category_name=$1,t_id=$2 where category_id=$3";
    let params1=[category_name,t_id,category_id];

    try
    {
        return await con.query(query1,params1);
    }
    catch(err)
    {
        throw err;
    }
}

module.exports.UpdateItems=async function(item_id,update_values)
{
    let items_id=item_id;
    let item_name=update_values.item_name;
    let item_desc=update_values.item_desc;
    let item_status=update_values.item_status;
    let c_id=update_values.c_id;
    let image=update_values.image;
    let price=update_values.price;

    let query1=`update items set item_name=$1,item_desc=$2,item_status=$3,c_id=$4,image=$5 
    where item_id=$6 returning item_id as item_id`;
    let params1=[item_name,item_desc,item_status,c_id,image,items_id];
    let query2=`update prices set price=$1,date_time=$2 where i_id=$3`;
    try
        {
            await con.query('BEGIN');
            let data=await con.query(query1,params1);
            let item_id=data.rows[0].item_id;
            let params2=[price,current_date_time,item_id];
            await con.query(query2,params2);
            return await con.query('COMMIT');
        } 
    catch(error)
        {
            try 
            {
                await con.query('ROLLBACK');
            } 
            catch (rollbackError)
            {
                console.log('A rollback error occurred:', rollbackError);
                throw rollbackError
            }
            throw error;
        } 
}


module.exports.DeleteItem=async function(item_id)
{
    let items_id=item_id;
    let query1=`delete from items where item_id=$1`;
    
    try
    {
        return await con.query(query1,[items_id]);
    }
    catch(err)
    {
        throw err;
    }
}
