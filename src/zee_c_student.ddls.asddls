@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Student'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zee_c_student 
as projection on zee_student as Student
{

    @EndUserText.label: 'Student ID'
    key Id,
    @EndUserText.label: 'First Name22'
    Firstname,
    @EndUserText.label: 'Last Name33'
    Lastname,
    @EndUserText.label: 'Age'
    Age,
    @EndUserText.label: 'Course'
    Course,
    @EndUserText.label: 'Course Duration'
    Courseduration,
    @EndUserText.label: 'Status'
    Status,
    @EndUserText.label: 'Gender'
    Gender,
    @EndUserText.label: 'DOB'
    Dob
}
