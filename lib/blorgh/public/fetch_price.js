function fetch_price(url,data,success) {
    // 异步对象
    var ajax = new XMLHttpRequest();


    // get请求
    if (data) {
        // 如果有值
        url+='?';
        url+=data;
    }else{

    }
    // 设置 方法 以及 url
    ajax.open(method,url);

    // send即可
    ajax.send();


    // 注册事件
    ajax.onreadystatechange = function () {
        // 在事件中 获取数据 并修改界面显示
        if (ajax.readyState==4&&ajax.status==200) {
            // console.log(ajax.responseText);

            // 将 数据 让 外面可以使用
            // return ajax.responseText;

            // 当 onreadystatechange 调用时 说明 数据回来了
            // ajax.responseText;

            // 如果说 外面可以传入一个 function 作为参数 success
            success(ajax.responseText);
        }
    }

}
