var t1 = document.getElementById('t1').value;
var t2 = document.getElementById('t2').value;
var t3 = document.getElementById('t3').value;
var c1 = document.getElementById('c1').value;
var c2 = document.getElementById('c2').value;
var c3 = document.getElementById('c3').value;

var ctx = document.getElementById('thu');
var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['Tổng Thu CN1','Tổng Thu CN2','Tổng Thu CN3'],
        datasets:[
            {
                labels: 'Tổng Thu Của Các Chi Nhánh',
                backgroundColor:["#0196CE","#005574","#02202B"],
                data:[t1,t2,t3]
            }    
        ]
    },
    options: {
        animation:{
            animateScale: true
        }
    }
});

var ctx = document.getElementById('chi');
var myDoughnutChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['Tổng Chi CN1','Tổng Chi CN2','Tổng Chi CN3'],
        datasets:[
            {
                label: 'Tổng Chi Của Các Chi Nhánh',
                backgroundColor:["#0196CE","#005574","#02202B"],
                data:[c1,c2,c3]
            }    
        ]
    },
    options: {
        animation:{
            animateScale: true
        }
    }
});


