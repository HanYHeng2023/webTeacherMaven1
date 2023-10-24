<%--
  Created by IntelliJ IDEA.
  User: YH
  Date: 2023/10/23
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师信息</title>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function(){

         showAll();

        })
        var page=1;
        var rows=5;
        var maxPage=1;
        function showAll(){

            $.getJSON("findPageAll.do?page="+page+"&rows="+rows,function(pb){
                page=pb.page;
                rows=pb.rows;
                maxPage=pb.maxPage;
                var teList=pb.pageList;
                var tablehead="<table id='t1' border='1px' width='1000px' align='center'>"
                    +"<tr align='center' bgcolor='#CCCCFF'>"
                    +"<td colspan='8'>教师信息展示</td>"
                    +"</tr>"
                    +"<tr>"
                    +"<td >编号</td>"
                    +"<td >姓名</td>"
                    +"<td >性别</td>"
                    +"<td >生日</td>"
                    +"<td >职位</td>"
                    +"<td >部门</td>"
                    +"</tr>";
                var tablebody="";
                for (var i = 0; i< teList.length; i++) {
                    var t=teList[i];
                    tablebody+="<tr>"
                        +"<td >"+t.tno+"</td>"
                        +"<td >"+t.name+"</td>"
                        +"<td >"+t.sex+"</td>"
                        +"<td >"+t.birthday+"</td>"
                        +"<td >"+t.prof+"</td>"
                        +"<td >"+t.depart+"</td>"

                        +"</tr>";
                }
                var endtable=tablehead+tablebody+"</table>";
                $("#mytable").html(endtable);
                $("#page").val(page);
                $("#rows").val(rows);
                $("#pagelable").html(page+"/"+maxPage);
                //处理按钮
                if(page==1){
                    $("#btfirst").attr("disabled",true);
                    $("#btup").attr("disabled",true);
                }
                if(page>1){
                    $("#btfirst").attr("disabled",false);
                    $("#btup").attr("disabled",false);
                }
                if(page==maxPage){
                    $("#btlast").attr("disabled",true);
                    $("#btnext").attr("disabled",true);
                }
                if(page<maxPage){
                    $("#btlast").attr("disabled",false);
                    $("#btnext").attr("disabled",false);
                }
            });




        }

        $(function(){

            $("#btfirst").click(function(){
                page=1;
                showAll();
            });
            $("#btup").click(function(){
                page=page-1;
                if(page<1){
                    page=1;
                }
                showAll();
            });
            $("#btnext").click(function(){
                page=page+1;
                if(page>maxPage){
                    page=maxPage;
                }
                showAll();
            });
            $("#btlast").click(function(){
                page=maxPage;
                showAll();
            });
            //更改当前页
            $("#btchangepage").click(function(){
                var outpage=$("#page").val();
                if(isNaN(outpage)){
                    alert("请输入正确的数字");
                    $("#page").val(page);
                }
                page=outpage;
                showAll();
            });
            //更改每页
            $("#btchangerows").click(function(){
                var outrows=$("#rows").val();
                if(isNaN(outrows)){
                    alert("请输入正确的数字");
                    $("#page").val(rows);
                }
                rows=outrows;
                showAll();
            });

        });

    </script>

</head>
<body>
<div id="mytable"></div>
<form action="" id="form1" name="form1">
    <table border="1px" width="1000px" align="center">
        <tr bgcolor="#CCCCFF" >
            <td><input type="button" id="btfirst" name="btfirst" value="首页"></td>
            <td><input type="button" id="btup" name="btup" value="上一页"></td>
            <td><input type="button" id="btnext" name="btnext" value="下一页"></td>
            <td><input type="button" id="btlast" name="btlast" value="尾页"></td>
            <td>跳转
                <input type="text" id="page" name="page" size="1" >
                页
                <input type="button" id="btchangepage"  name="btchangepage"  value="确定" >
            </td>
            <td>
                每页
                <input type="text" id="rows" name="rows" size="1" >
                条
                <input type="button" id="btchangerows"  name="btchangerows"  value="确定" >
            </td>
            <td ><span id="pagelable">1/1</span></td>
        </tr>
    </table>
</form>
</body>
</html>
