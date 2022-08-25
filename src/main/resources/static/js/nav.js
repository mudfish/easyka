//JavaScript代码区域
var $ = layui.jquery,
    element = layui.element;
$(document).on('click', 'a', function () {
    if (!$(this)[0].hasAttribute("tab_id") || $(this).attr("tab_id") === '') {
        return;
    }
    var layid = $(this).attr("tab_id");
    var text = $(this).text();
    var dataurl = $(this).attr("data-url");

    var tabs = $(".layui-tab-title").children();
    var msg = true;
    $.each(tabs, function (i, item) {
        var tabid = $(item).attr("lay-id");
        alert('遍历' + tabid);
        if (tabid === layid) {
            alert('相等了');
            msg = false;
            return false;
        }

    });
    if (msg) {
        element.tabAdd('mytab', {
            title: text,
            content: "<iframe frameborder='0' width='100%' height='100%' src='" + dataurl + "'></iframe>",
            id: layid
        });
    }
    resize();
    element.tabChange('mytab', layid);


});

function resize() {
    var $content = $(".layui-tab-content");
    $content.height($(this).height() - 200);
    $content.find('iframe').each(function () {
        $(this).height($content.height());
        $(this).width("100%")

    })

}

$(window).on('resize', function () {
    var $content = $(".layui-tab-content");
    $content.height($(this).height() - 200);
    $content.find('iframe').each(function () {
        $(this).height($content.height());
        $(this).width("100%")

    });

});
$(window).on('load', function () {
    var $content = $(".layui-tab-content");
    $content.height($(this).height() - 200);
    $content.find('iframe').each(function () {
        $(this).height($content.height());
        $(this).width("100%")

    });

})