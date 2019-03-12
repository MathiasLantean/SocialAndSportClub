$(document).ready(function() {
  var table = $('#dataTable').DataTable({
    "ajax": {
                "url": "doGetMemberList.php",
                "type": "GET",
            },
    "processing": true,
    "serverSide": true,
    "searching": false,
    "bLengthChange": false,
    "columnDefs": [
        {
            "targets": 0,
            "data": "photo",
            "render": function(data,type,row){
                return '<img class="img-profile rounded-circle" src="' + data + '" width=45px, height=45px >';
            },
            orderable: false
        }, 
        {
            "targets": 1,
            "data": "name",
        },
        {
            "targets": 2,
            "data": "surname",
        },
        {
            "targets": 3,
            "data": "email",
        },
        {
            "targets": 4,
            "data": "phone",
        },
        {
            "targets": 5,
            "data": "address",
        },
        {
            "targets": 6,
            "data": "DOB",
        },
        {
            "targets": -1,
            "data": "id",
            "render": function(data,type,row){
                var ret = '<a href="editMember.php?id='+ data +'"><button>Edit</button></a>';
                ret += '<button class="delete-usr" id="'+ data +'">Delete</button>'
                return ret;
            },
        } 
    ]
  });
  
   $('#dataTable tbody').on( 'click', '.delete-usr', function () {
        var id = $(this).attr("id");
        var data = table.row( $(this).parents('tr') ).data();
        
        if(confirm("Do you want to delete " + data[6]+ "?")){
            $.ajax({
                url: "doDeleteMember.php",
                type: "GET",
                data: "id=" + id,
                success: function(data){
                    table.row($(this).parents('tr')).remove().draw();
                },
                error: function(data){
                    console.log("error");
                }
             });
        }
    } );
    
    $('#statusFilter').on('change', function(){
        var filter_value = $(this).val();
        var new_url = 'doGetMemberList.php?activity='+filter_value;
        table.ajax.url(new_url).load();
    });
  
});

