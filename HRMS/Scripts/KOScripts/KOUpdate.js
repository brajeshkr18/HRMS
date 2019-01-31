var parsedSelectedCourse = $.parseJSON(selectedCourse);
$(function () {
    ko.applyBindings(modelUpdate);
});

var modelUpdate = {
    CourseID: ko.observable(parsedSelectedCourse.CourseID),
    CourseName: ko.observable(parsedSelectedCourse.CourseName),
    CourseDescription: ko.observable(parsedSelectedCourse.CourseDescription),
    updateCourse: function () {
        try {
            $.ajax({
                url: '/Demo/Update',
                type: 'POST',
                dataType: 'json',
                data: ko.toJSON(this),
                contentType: 'application/json',
                success: successCallback,
                error: errorCallback
            });
        } catch (e) {
            window.location.href = '/Demo/Read/';
        }
    }
};

function successCallback(data) {
    window.location.href = '/Demo/Read/';
}
function errorCallback(err) {
    window.location.href = '/Demo/Read/';
}