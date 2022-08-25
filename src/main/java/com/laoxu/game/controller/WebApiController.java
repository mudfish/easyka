package com.laoxu.game.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.laoxu.game.common.HttpUtils;
import com.laoxu.game.common.QRcodeUtil;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.config.AliPayConfig;
import com.laoxu.game.config.WxPayConfig;
import com.laoxu.game.entity.*;
import com.laoxu.game.service.GoodsItemService;
import com.laoxu.game.service.GoodsService;
import com.laoxu.game.service.GoodsTypeService;
import com.laoxu.game.service.OrderService;
import com.laoxu.game.vo.KmVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.geom.QuadCurve2D;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 *  供web使用的公共接口
 * @Author laoxu
 * @Date 2021/5/30 22:59
 **/
@Controller
@RequestMapping("/webapi")
public class WebApiController {
    private static final Logger logger = LoggerFactory.getLogger(WebApiController.class);

    @Autowired
    GoodsTypeService typeService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    OrderService orderService;

    @Autowired
    GoodsItemService kmService;

    @Value("${web.notifyUrl}")
    private String notifyUrl;

    @Value("${web.APP_ID}")
    private String APP_ID;

    @Value("${web.APP_SECRET}")
    private String APP_SECRET;

    @Value("${web.API_URL}")
    private String API_URL;

    /**
     * 支付时调用该方法，设置好传入参数PayParams
     * @param payParams
     * @return
     */
    public String pay(PayParams payParams) {
        //计算并设置签名sign
        payParams.setSign(generateOrderSign(payParams, APP_ID, APP_SECRET));

        String paramsString = JSONObject.toJSONString(payParams);
        //String apiUrl = "https://www.gogozhifu.com/shop/api/createOrder";
        //发起的goPost请求里需要设置请求头App-Id和App-Secret
        // String result = HttpUtils.goPost(API_URL, paramsString, APP_ID, APP_SECRET);
        MultiValueMap params = new LinkedMultiValueMap<>();
        params.add("payId",payParams.getPayId());
        params.add("type",payParams.getType());
        params.add("price",payParams.getPrice());
        params.add("sign",payParams.getSign());
        params.add("param",payParams.getParam());
        params.add("isHtml",payParams.getIsHtml());
        params.add("notifyUrl",payParams.getNotifyUrl());

        String result = HttpUtils.post(API_URL,params);
        // 以form-data形式调用接口
        //logger.info("订单{}支付结果：{}",payParams.getPayId(),result);
        // 如果使用了GOGO支付收银台页面，直接在跳转的页面完成支付即可

        return result;
    }

    /**
     * 列出所有商品分类
     * @return
     */
    @GetMapping("/getAllGoodsType")
    @ResponseBody
    public Result<String> getAllGoodsType(){
        List<GoodsType> list = typeService.list(null);
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            sb.append("<option value='"+list.get(i).getId()+"'>"+list.get(i).getTypeName()+"</option>");
        }
        return ResultUtil.ok(sb.toString());
    }

    /**
     * 根据商品分类列出商品
     * @param typeId
     * @return
     */
    @GetMapping("/getGoods/{typeId}")
    @ResponseBody
    public Result<String> getGoods(@PathVariable Integer typeId){
        List<Goods> list = goodsService.selectGoodsList(typeId,1);
        StringBuffer sb = new StringBuffer();
        Goods good = null;
        for (int i = 0; i < list.size(); i++) {
            good = list.get(i);
            sb.append("<option id='"+good.getId()+"' value='"+good.getId()+"' title='"+good.getPrice()+"' kc='"+good.getKmLeft()+"'" +
                    "imgs='"+good.getPic()+"' alt='"+good.getGoodsDesc()+"'>"+good.getGoodsName()+"</option>");
        }
        return ResultUtil.ok(sb.toString());
    }

    /**
     * 检查卡密接口
     * @param gId
     * @param qty
     * @return
     */
    @PostMapping("/checkKm")
    @ResponseBody
    public Result<String> checkKm(@RequestParam Integer gId, @RequestParam Integer qty){
        QueryWrapper<GoodsItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("goods_id", gId);
        queryWrapper.isNull("order_no");
        Integer kmLeft = kmService.count(queryWrapper);
        if(kmLeft < qty){
            return ResultUtil.fail("卡密库存不足");
        }

        return ResultUtil.ok("卡密库存充足");
    }

    /**
     * 创建订单接口
     * @param orderNo
     * @param goodId
     * @param qty
     * @param amount
     * @param contact
     * @param channel
     * @param response
     * @return
     * @throws IOException
     */
    @PostMapping("/createOrder")
    @ResponseBody
    public Result<Map<String,Object>> createOrder(@RequestParam String orderNo,
                                                  @RequestParam Integer goodId,
                                                  @RequestParam Integer qty,
                                                  @RequestParam BigDecimal amount,
                                                  @RequestParam String contact,
                                                  @RequestParam String channel,
                                                  HttpServletResponse response
                                                  ) throws IOException {
        // 检查参数
        if(StringUtils.isEmpty(orderNo)){
            return ResultUtil.fail("订单号为空，无法创建订单！");
        }
        if(goodId == null){
            return ResultUtil.fail("商品为空，无法创建订单！");
        }
        if(StringUtils.isEmpty(contact)){
            return ResultUtil.fail("联系方式为空，无法创建订单！");
        }
        if(StringUtils.isEmpty(channel)){
            return ResultUtil.fail("支付渠道为空，无法创建订单！");
        }
        // 判断订单是否已存在
        Order order  = orderService.getOrder(orderNo);
        if(order==null){
            order  = new Order();
            order.setOrderNo(orderNo);
            order.setGoodsId(goodId);
            order.setQty(qty);
            order.setAmount(amount);
            order.setChannel(channel);
            order.setContact(contact);
            // 订单创建时间
            order.setCreateTime(DateUtil.format(new Date(),"yyyy-MM-dd HH:mm:ss:SSS"));
            boolean saved = orderService.save(order);
            if(!saved){
                return ResultUtil.fail("订单创建失败！");
            }
        }

        // 调用支付接口，返回二维码
        // 创建支付参数
        PayParams payParams = new PayParams();
        payParams.setPayId(orderNo);
        payParams.setPrice(amount.toString());
        payParams.setParam("vpay123");
        payParams.setIsHtml(0);  // 返回json数据
        payParams.setNotifyUrl(notifyUrl);  // 支付成功回调接口


        String result="";
        if(channel.equals("wxpay")){
            payParams.setType(1);
            //result = WxPay.nativePay(orderNo, String.valueOf(amount), WxPayConfig.mchId, String.valueOf(goodId), "2", null, notifyUrl, null, null, null, null, WxPayConfig.key);
        }
        if(channel.equals("alipay")){
            payParams.setType(2);
            //result = AliPay.nativePay(orderNo, String.valueOf(amount), AliPayConfig.mchId, String.valueOf(goodId), "2", null, notifyUrl, null, null, null, null, AliPayConfig.key);
        }

        logger.info("发起订单{}支付",orderNo);
        String payResult = pay(payParams);
        JSONObject jo = JSONObject.parseObject(payResult);
        JSONObject data = jo.getJSONObject("data");
        logger.info("订单{}支付结果：{}",orderNo, data.toJSONString());
        /*
          订单2022351212856581支付结果：{"code":1,"msg":"成功","data":{"wayId":7691,"payId":"2022351212856581","orderId":"2022040512130263117108",
          "payType":"2","price":"0.1","reallyPrice":"0.10","payUrl":"https:\/\/qr.alipay.com\/fkx12971vr9yulhfvcjqmea","isAuto":1,"state":0,"timeOut":10,"date":1649131982}}
         */
        ;
        Map<String,Object> map = new HashMap<>();
        map.put("url", QRcodeUtil.crateQRCode(data.getString("payUrl"),200,180));
        map.put("orderNo", orderNo);
        map.put("realPrice",data.getString("reallyPrice")); // 真实价格

        // 更新支付流水号
        order.setPayNo(data.getString("orderId"));
        orderService.saveOrUpdate(order);

        return ResultUtil.ok(map);
    }

    /**
     * 订单状态检测接口
     * @param data
     * @return
     */
    @RequestMapping("/checkOrderStatus")
    @ResponseBody
    public Result<Boolean> checkOrderStatus(@RequestParam Map<String, String> data) {
        String result = "";
        try {
            String orderNo = data.get("orderNo");
            if (StrUtil.isBlank(orderNo)) {
                return ResultUtil.fail("订单号不能为空");
            }
            Order order = orderService.getOrder(orderNo);
            // 订单状态="未支付"
            if (order.getStatus() == 0) {
                return ResultUtil.ok(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 支付成功
        return ResultUtil.ok(true);
    }

    /**
     * 异步回调接口
     * @param notifyParams
     * @param response
     * @return
     *//*
    @RequestMapping(value = "/notifyUrl",method = {RequestMethod.GET,RequestMethod.POST})
    public String notifyUrl(@RequestBody NotifyParams notifyParams, HttpServletResponse response) {
        return notify(notifyParams, response);
    }*/

    @ResponseBody
    @RequestMapping(value = "/notifyUrl",method = {RequestMethod.GET,RequestMethod.POST})
    public String notifyUrl(NotifyParams notifyParams, HttpServletResponse response) {
        logger.info("接收到回调：{}",notifyParams.toString());
        return notify(notifyParams, response);
    }

    public String notify(NotifyParams notifyParams, HttpServletResponse response) {
        if (null != notifyParams) {
            String sign = generateNotifySign(notifyParams, APP_ID, APP_SECRET);
            if (sign.equals(notifyParams.getSign())) {
                // 在这里根据商户自己需求完成后续逻辑操作
                // 订单数据更新操作...
                boolean success = orderService.paySuccess(notifyParams.getPayId());
                if (!success) {
                    return "fail";
                }
                // 成功完成后正确返回
                response.setStatus(HttpServletResponse.SC_OK);
                return "success";
            }
        }
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        return "error";
    }

    /*@RequestMapping("/order/notify")
    public String notify(@RequestParam Map<String, String> data, HttpServletRequest request, HttpServletResponse response) {
        try {

            System.out.println("接受到支付结果回调");
            System.out.println(data.toString());

            String payChannel = data.get("payChannel");

            String attach = data.get("attach");

            if(StrUtil.isBlank(payChannel)){
                return "payChannel is not null";
            }

            String key=null;
            if("wxpay".equals(payChannel)){
                key=WxPayConfig.key;
            }
            if("alipay".equals(payChannel)){
                key=AliPayConfig.key;
            }

            // 验证签名
            boolean sign = PaySignUtil.checkNotifySign(request, key);

            System.out.println("签名验证："+sign);

            if (!sign) {
                return "签名验证失败！";
            }

            String outTradeNo = data.get("outTradeNo"); // 商户订单号
            String payNo = data.get("payNo"); // 支付单号（第三方支付单号）
            String time = data.get("time"); // 支付成功时间
            String code = data.get("code"); // 支付结果 【1：成功；0：失败】

            if (Integer.valueOf(code).intValue() != 1) {
                return "pay fail";
            }

            boolean success = orderService.paySuccess(outTradeNo, payNo, time);
            if (!success) {
                return "fail";
            }
            PrintWriter out = response.getWriter();
            out.print("SUCCESS");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }*/


    @PostMapping("/queryKm")
    public String queryKm(@RequestParam(required = true) String keyword, Model model){
        // 先根据联系方式
        QueryWrapper<Order> orderQueryWrapper = new QueryWrapper<>();
        orderQueryWrapper.eq("order_no", keyword);
        orderQueryWrapper.or().eq("contact",keyword).or().eq("pay_no", keyword);
        Order order = orderService.getOne(orderQueryWrapper);
        // 根据订单号查卡密列表
        List<GoodsItem> kms = null;
        List<KmVO> list = null;
        if(order!=null){
            QueryWrapper<GoodsItem> kmQuery = new QueryWrapper<>();
            kmQuery.eq("order_no", order.getOrderNo());
            kms = kmService.list(kmQuery);

            Goods goods = goodsService.getById(order.getGoodsId());
            KmVO km = null;
            if(kms.size() > 0){
                list = new ArrayList<>();
                for (int i = 0; i < kms.size(); i++) {
                    km = new KmVO();
                    km.setOrderNo(order.getOrderNo());
                    km.setContact(order.getContact());
                    km.setGoodsName(goods.getGoodsName());
                    km.setGoodsPrice(String.valueOf(goods.getPrice()));
                    km.setPayTime(order.getPayTime());
                    km.setKm(kms.get(i).getKm());

                    list.add(km);
                }
            }
        }

        model.addAttribute("kmlist", list);

        return "getAllKm";
    }

    @GetMapping("/getAllKm")
    public String getAllKm(){
        return "getAllKm";
    }

    //生成下单签名sign
    private static String generateOrderSign(PayParams params, String appId, String appSecret) {
        if (!StringUtils.isEmpty(appId) && !StringUtils.isEmpty(appSecret)) {
            StringBuilder sb = new StringBuilder();
            //sb.append(appId);
            sb.append(params.getPayId());
            sb.append(params.getParam());
            sb.append(params.getType());
            sb.append(params.getPrice());
            sb.append(appSecret);
            return md5(sb.toString());
        }
        return "";
    }

    //生成回调通知的签名sign
    private static String generateNotifySign(NotifyParams params, String appId, String appSecret) {
        if (!StringUtils.isEmpty(appSecret)) {
            StringBuilder sb = new StringBuilder();
            //sb.append(appId);
            sb.append(params.getPayId());
            sb.append(params.getParam());
            sb.append(params.getType());
            sb.append(params.getPrice());
            sb.append(params.getReallyPrice());
            sb.append(appSecret);
            return md5(sb.toString());
        }
        return "";
    }

    // md5加密
    private static String md5(String data) {
        String ret = "";
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] bytes = md5.digest(data.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                String temp = Integer.toHexString(b & 0xff);
                temp = temp.toLowerCase();
                if (temp.length() == 1) {
                    sb.append("0");
                }
                sb.append(temp);
            }

            ret = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return ret;
    }

}
