import {draw} from "./script/drawer"
import {validateForm} from "./script/validation"

$(document).ready(function(){
    $.ajax({
        url: 'server/hello.php',
        method: "GET",
        dataType: "html",
        success: function(data){
            console.log(data);
            if (data) {
                data = JSON.parse(data)
                let t_x = 0
                let t_y = 0
                let t_r = 0

                let temp = '';
                for (let row of data) {
                    temp += "<tr class='columns'> <td>" + row.x + "</td> <td>" +
                        row.y + "</td> <td>" + row.r + "</td> <td>" + row.status +
                        "</td> <td>" + row.current_time + "</td> <td>" + row.script_time + "</td> </tr>";
                    t_x = row.x
                    t_y = row.y
                    t_r = row.r
                }

                $("#x-value").val(t_x)
                $("#y-value").val(t_y)
                $("#r-value").val(t_r)

                $("#results-body").html(temp);
            }
        },
        error: function(error){
            console.log(error);
        },
    })
})


$("#user-input").on("submit", function(event){
    event.preventDefault();
    if (validateForm()) {
        $.ajax({
            url: 'server/script.php',
            method: "GET",
            data: $(this).serialize() + "&timezone=" + new Date().getTimezoneOffset(),
            dataType: "html",

            success: function(data){
                console.log(data);

                if (data) {
                    data = JSON.parse(data)
                    let temp = '';
                    for (let row of data) {
                        temp += "<tr class='columns'> <td>" + row.x + "</td> <td>" +
                            row.y + "</td> <td>" + row.r + "</td> <td>" + row.status +
                            "</td> <td>" + row.current_time + "</td> <td>" + row.script_time + " ms </td> </tr>";
                    }

                    let last = data.pop()
                    draw(last.x, last.y, last.r)

                    $("#results-body").html(temp);
                }
            },
            error: function(error){
                console.log(error);
            },
        })
    }
});

let selector = document.querySelector("#r-value");
// let xInput = document.getElementById("x-value");
// let yInput = document.getElementById("y-value");

selector.addEventListener("change", function() {
    draw(0, 0, selector.value);
});
