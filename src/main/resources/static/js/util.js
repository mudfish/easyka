var ctx = $("#ctx").val();
//清空表单，参数为form表单juqery对象
function cleanForm(obj) {
    $(':input',obj)
        .not(':button, :submit, :reset, :radio, .keep')
        .val('')
        .removeAttr('selected')
        ;
}

function getCheckedValue(obj) {
    if (obj.is(":checked")) {
        return 1;
    }else{
        return 0;
    }
}

// d 时间对象，n加的天数
function plusDays(d,n) {
    var time=new Date();
    // 默认借1个月
    time=time.setDate(d.getDate()+n);
    return new Date(time);
}

/**
 * 日期增加指定天数后返回（日期字符串）
 * @param dateStr
 * @param dayCount
 * @returns {string}
 */
function dateAddDays(dateStr,dayCount) {
    var tempDate=new Date(dateStr.replace(/-/g,"/"));//把日期字符串转换成日期格式
    var resultDate=new Date((tempDate/1000+(86400*dayCount))*1000);//增加n天后的日期

    return resultDate.Format("yyyy-MM-dd");
}

// 获取option选项  obj2是隐藏的副本 为可选项
function getList(url,obj,obj2){
    $.ajax({
        type: "GET",
        url: url,
        success: function (result) {
            obj.find("option").remove();
            obj.append(new Option());
            $.each(result.data, function (index, item) {
                obj.append(new Option(item.name, item.id));
            });
            if(obj2){
                obj.val(obj2.val());
            }

            layui.form.render("select");
        }
    })
}

function getListId(url,method,obj,val){
    $.ajax({
        type: method,
        url: url,
        success: function (result) {
            obj.find("option").remove();
            obj.append(new Option());
            $.each(result.data, function (index, item) {
                obj.append(new Option(item.name, item.id));
            });
            if(val){
                obj.val(val);
            }

            layui.form.render("select");
        }
    })
}



// 日期格式化
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

// 验证中文名称
function isChinaName(name) {
    var pattern = /^[\u4E00-\u9FA5]{1,6}$/;
    return pattern.test(name);
}

// 验证手机号
function isPhoneNo(phone) {
    var pattern = /^1[34578]\d{9}$/;
    return pattern.test(phone);
}

// 验证身份证
function isCardNo(card) {
    var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    return pattern.test(card);
}

function getDate(strDate) {
    var st = strDate;
    var a = st.split(" ");
    var b = a[0].split("-");
    var date = new Date(b[0], b[1], b[2]);
    return date;
}

function getDateTime(strDate) {
    var st = strDate;
    var a = st.split(" ");
    var b = a[0].split("-");
    var c = a[1].split(":");
    var date = new Date(b[0], b[1], b[2], c[0], c[1], c[2]);
    return date;
}

function reloadTable(table,tablename,queryWhere){
    //layer.close(index);
    //var queryWhere = {};

    //执行重载
    table.reload(tablename, {
        page: {
            curr: 1 //重新从第 1 页开始
        }
        , where: queryWhere
        , done: function (res, curr, count) {
            this.where = {};
        }
    }, 'data');
}
