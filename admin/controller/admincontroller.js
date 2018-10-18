const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const db = require('../db/admin');
var cors = require('cors');



router.use(bodyParser.urlencoded({extended : false}));
router.use(bodyParser.json());
router.use(cors());

 /*--------------------------POST REQUEST------------------------*/

 router.post('/AddItemCategory', async (req,res)=>
 {
    let category_data=req.body.data;
    try
    {
        await db.addCategory(category_data);
        return res.status(200).send("Category Added");
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})

router.post('/AddItem',async(req,res)=>
{
    let item_data=req.body.data;
    try
    {
        await db.addItem(item_data);
        return res.status(200).send("Item Added");
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})

 /*--------------------------GET REQUEST------------------------*/
router.get('/ViewCategory',async(req,res)=>{
    try
    {
        let data=await db.ViewCategory();
        return res.status(200).send(data.rows);
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})

router.get('/ViewItems',async(req,res)=>{
    try
    {
        let data=await db.ViewItems();
        return res.status(200).send(data.rows);
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})

 /*--------------------------PUT REQUEST------------------------*/

router.put('/updateCategory/:cid',async(req,res)=>{
    let cat_id=req.params.cid;
    let update_values=req.body.data;
    try
    {
        await db.UpdateCategory(cat_id,update_values);
        return res.status(200).send("updated");
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})


router.put('/updateItem/:i_id',async(req,res)=>{
    let item_id=req.params.i_id;
    let update_values=req.body.data;
    try
    {
        await db.UpdateItems(item_id,update_values);
        return res.status(200).send("updated");
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})

 /*--------------------------DeLETE REQUEST------------------------*/
router.delete('/deleteItem/:i_id',async(req,res)=>{
    let item_id=req.params.i_id;
    try
    {
        await db.DeleteItem(item_id);
        return res.status(200).send("Item Deleted");
    }
    catch(error)
    {
        return res.status(400).send("Server Error");
    }
})



module.exports = router;