   // Adding popstate event listener to handle browser back button
        window.addEventListener("popstate", function (e) {
            $.ajax({
                url: location.href,
                success: function (result) {
                    //$('#ListData').html(result);
                    fillListData(result);
                }
            });
        });

        $(document).ready(function () {              
            $(".loader").fadeOut("slow");            
            var itemId ="";
            $("[name='searchField']").keydown(function (event) {
                if (event.keyCode == 13) {
                    event.returnValue = false;
                    event.cancel = true;
                    event.preventDefault();
                    search();
                    $('#searchModel').modal('toggle');
                }
            });

            
            $(document).on("click", "a[name='deleteItem']", function () {
                itemId = $(this).attr('itemid');
            });

            $(document).on("click", "a[name='accountStatusItem']", function () {
                itemId = $(this).data('id');
            });
            $(document).on("click", "a[name='changepasswordItem']", function () {
                itemId = $(this).data('id');
                $('#lblEmail').val($(this).data('email'));
            });


            $(document).on("click", "#btnDeleteItem", function () {
                $.ajax({
                    type: "POST", //HTTP POST Method
                    url: "/User/Delete", // Controller/View
                    data: { //Passing data
                        Userid: itemId
                    },
                    datatype: "json", // refer notes below
                    success: function (data) {
                        window.location = GetLocationPath();
                    },
                    error: function (jqXHR, status, err) {                        
                    }
                });
            });

            $(document).on("click", "#btnAccActivateItem", function () {
                $(".loader").show();
                $.ajax({
                    type: "POST", //HTTP POST Method
                    url: "/User/ChangeAccountStatus", // Controller/View
                    data: { //Passing data
                        id: itemId,
                        accountStatus: GetStatusValue("Active"),//@Captive.Utility.Enums.AccountStatus.Active.GetHashCode(),
                    },
                    datatype: "json", // refer notes below
                    success: function (data) {
                        window.location =GetLocationPath();
                    },
                    error: function (jqXHR, status, err) {                        
                    }
                });
            });


            $(document).on("click", "#btnAccdeactivateItem", function () {
                $(".loader").show();
                $.ajax({
                    type: "POST", //HTTP POST Method
                    url: "/User/ChangeAccountStatus", // Controller/View
                    data: { //Passing data
                        id: itemId,                        
                        accountStatus: GetStatusValue("Deactivated"),
                    },
                    datatype: "json", // refer notes below
                    success: function (data) {
                        window.location = GetLocationPath();
                    },
                    error: function (jqXHR, status, err) {                        
                    }
                });
            });

            $(document).on("click", "#btnAccSuspendItem", function () {
                $(".loader").show();
                $.ajax({
                    type: "POST", //HTTP POST Method
                    url: "/User/ChangeAccountStatus", // Controller/View
                    data: { //Passing data
                        id: itemId,                        
                        accountStatus: GetStatusValue("Suspended"),
                    },
                    datatype: "json", // refer notes below
                    success: function (data) {
                        window.location = GetLocationPath();
                    },
                    error: function (jqXHR, status, err) {                        
                    }
                });
            });


            $(document).on("click", "#search", function () {     
                search();
            });


            $('body').on('click', '#ListData .pagination a', function (event) {
                event.preventDefault();
                var searchData = GetSearchData();
                var url = $(this).attr('href') + "&search=" + searchData;
                if (url) {
                    $.ajax({
                        url: url,
                        success: function (result) {
                            ChangeUrl('index', url);
                            fillListData(result);
                        }
                    });
                }
            });

            $('#lengthSelect').change(function () {
                search();
            });

            $(document).on("click", "#reset", function () {
                $("#name").val("");
                $("#email").val("");
                $("#UserType").val("");
                $("#AccountStatus").val("");
                $("#search").click();
            });

            $(document).on("click", "#btnChangePassword", function () {
                var userId = itemId;
                var password = $('#Password').val();
                var confirmPassword = $('#ConfirmPassword').val();

                if (!password) {
                    $.toastAlert("Error", "Password can not be empty", "error");
                    return false;
                }
                if (!confirmPassword) {
                    $.toastAlert("Error", "Confirm Password can not be empty", "error");
                    return false;
                }
                if (password != confirmPassword) {
                    $.toastAlert("Error", "Confirm Password does not match with password", "error");
                    return false;
                }


                $.ajax({
                    url: '/User/ChangePassword?userId=' + userId + '&password=' + password,
                    type: "POST",
                    dataType: "JSON",
                    success: function (response) {
                        if (response.isSuccess == true) {
                            $.toastAlert("Success", response.message, "success");
                            $('#changePasswordModel').modal('toggle');
                            $('#Password').val('');
                            $('#ConfirmPassword').val('');
                        }
                        else {
                            $.toastAlert("Error", response.message, "error");

                        }
                    }

                });
            });

         
        });

        function ChangeUrl(page, url) {
            if (typeof (history.pushState) != "undefined") {
                var obj = { Page: page, Url: url };
                history.pushState(null, obj.Page, obj.Url);
            } else {
                alert("Browser does not support HTML5.");
            }
        }

        function GetSearchData() {
            var name = $("#name").val();
            var userTypes = [];
            if ($("#UserType").val() && $("#UserType").val() != "")
            {
                userTypes .push($("#UserType").val());
            }
            var accountStatus = $("#AccountStatus").val();
            var email = $("#email").val();
            var searchingData = {
                Name: name,
                UserTypeId: userTypes,
                AccountStatus: accountStatus,
                Email: email
            };
            return JSON.stringify(searchingData);
        }

        function search() {
            var tempdata = GetQparams();
            var searchData = GetSearchData();
            $.ajax({
                type: "GET", //HTTP GET Method
                url: "/User/ManageUsers", // Controller/View
                data: { //Passing data
                    pageSize: $("#lengthSelect option:selected").val(),
                    data: tempdata,
                    search: searchData,
                },
                datatype: "json", // refer notes below
                success: function (data) {
                    fillListData(data);
                },
                error: function (jqXHR, status, err) {//status is Error and the errorThrown is undefined
                    $.toastAlert("Error", "Request Status : " + jqXHR.status + " has issued a status text of  : " + jqXHR.statusText + "", "error");
                }
            });

        }

        function fillListData(result) {
            $('#ListData').html("");
            $('#ListData').html(result);
            $('[data-toggle="tooltip"]').tooltip();

            $("a[name='accountStatusItem']").click(function (e) {
                itemId = $(this).data('id');
            });
            
        }
