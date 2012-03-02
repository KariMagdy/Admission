# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
(($) ->
  $.fn.allBut = (context) ->
    target = this
    otherList = $()
    processList = $(context or "body").children()
    while processList.size() > 0
      cElem = processList.first()
      processList = processList.slice(1)
      unless cElem.filter(target).size() is target.size()
        if cElem.has(target).size() > 0
          processList = processList.add(cElem.children())
        else
          otherList = otherList.add(cElem)
    otherList
) jQuery

guardianOther = ->
  console.log "relation was clicked"
  if $(this).val()=="Other"
    console.log "otherrr"
    console.log $(this).parent().parent().children()
    $(this).parent().parent().children('.relation3').show()
  else
    $(this).parent().parent().children('.relation3').hide()

guardianNo2Fathers = (event) ->
  console.log "relation was clicked"
  if $(this).val()=="Father"
    $(event.data.element).children('option').eq(2).attr('disabled',true)
  else
    $(event.data.element).children('option').eq(2).attr('disabled',false)

guardianNo2Mothers = (event) ->
  console.log "relation was clicked"
  if $(this).val()=="Mother"
    $(event.data.element).children('option').eq(1).attr('disabled',true)
  else
    $(event.data.element).children('option').eq(1).attr('disabled',false)

No2Nos = (event) ->
  console.log "relation was clicked"
  if $(this).val()=="false"
    $(event.data.element).children('option').eq(1).attr('disabled',true)
  else
    $(event.data.element).children('option').eq(1).attr('disabled',false)


hideAddress1 = ->
  #console.log("in here")
    console.log $(this).val()
    if $(this).val()=="Both"
      console.log("in Both")
      $(this).parent().parent().parent().children('div').eq(1).hide()
    else
      $(this).parent().parent().parent().children('div').eq(1).show()
     
hideAddress0 = ->
  #console.log("in here")
    console.log $(this).val()
    if $(this).val()=="Both"
      console.log("in Both")
      $(this).parent().parent().parent().children('div').eq(0).hide()
    else
      $(this).parent().parent().parent().children('div').eq(0).show()
     

changeGender = ->
  #console.log("in here")
    console.log $(this).val()
    if $(this).val()=="Female"
      console.log("in Female")
      $('#applicant_military_status').children('option').eq(0).attr('disabled',false)
      $('#applicant_military_status').val("Does not apply").attr("selected", "selected")
      #$("#elementid").val("Oranges").attr("selected", "selected")
      $('#applicant_military_status').attr("disabled","disabled")
    else
      console.log("in male")
      $('#applicant_military_status').removeAttr('disabled')
      $('#applicant_military_status').children('option').eq(0).attr('disabled',true)
      $('#applicant_military_status').val("Exempted").attr("selected", "selected")

$ ->             
  $('#applicantbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#applicantform').allBut('#allforms').fadeOut();
    $('#applicantform').show()
    
  $('#addressbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#addressform').allBut('#allforms').fadeOut();
    $('#addressform').show()
    
  $('#admissioninformationbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#admissionform').allBut('#allforms').fadeOut();
    $('#admissionform').show()
    
  $('#workbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#workform').allBut('#allforms').fadeOut();
    $('#workform').show()

  $('#secondaryschoolbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#secondaryform').allBut('#allforms').fadeOut();
    $('#secondaryform').show()

  $('#collegebutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#collegeform').allBut('#allforms').fadeOut();
    $('#collegeform').show()        
    
  $('#unirelatedinfobutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#uniform').allBut('#allforms').fadeOut();
    $('#uniform').show()
    
  $('#healthbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#healthform').allBut('#allforms').fadeOut();
    $('#healthform').show()

  $('#attachmentbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#attachmentform').allBut('#allforms').fadeOut();
    $('#attachmentform').show()

  $('#guardianbutton').click ->
    console.log "I was Clicked"
    #$('#applicantform').show()
    #$('#addressform').hide()
    $('#guardianform').allBut('#allforms').fadeOut();
    $('#guardianform').show()  
    
  $('#applicant_uni_related_info_attributes_uni_choice_attributes_print_advertisements').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $('#printAd').show()
    else  
      $('#printAd').hide()
      
  $('#applicant_uni_related_info_attributes_uni_choice_attributes_nu_seminar_workshop_and_conference').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $('#NuSeminar').show()
    else  
      $('#NuSeminar').hide()
      
  $('#applicant_uni_related_info_attributes_uni_choice_attributes_other').click (->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $('#other').show()
    else  
      $('#other').hide()
    )
      
  $('#applicant_uni_related_info_attributes_other_choice_attributes_fields_of_study').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $('#fieldsofstudy').show()
    else  
      $('#fieldsofstudy').hide()
      
  $('#applicant_uni_related_info_attributes_other_choice_attributes_other').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $('#other2').show()
    else  
      $('#other2').hide()
      
  $('#applicant_checkSecondary').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $(this).parent().parent().children('div').eq(1).hide()
    else  
      $(this).parent().parent().children('div').eq(1).show()
      
  $('#applicant_checkCollege').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $(this).parent().parent().children('div').eq(1).hide()
    else  
      $(this).parent().parent().children('div').eq(1).show()
      
  $('#applicant_checkWork').click ->
    console.log "wohoo"
    if $(this).is(':checked')
      console.log "over here"
      $(this).parent().parent().children('div').eq(1).hide()
    else  
      $(this).parent().parent().children('div').eq(1).show()
      


$(document).ready ->
  $('#applicantform').allBut('#allforms').fadeOut();
  $('#applicantform').show()
  $('.relation3').hide()
  $('#printAd').hide()
  $('#NuSeminar').hide()
  $('#other').hide()
  $('#fieldsofstudy').hide()
  $('#other2').hide()
  $('#applicant_gender').change(changeGender).trigger('change')
  $('#applicant_addresses_attributes_0_address_type').change(hideAddress1).trigger('change')
  $('#applicant_addresses_attributes_1_address_type').change(hideAddress0).trigger('change')
  $('#applicant_guardians_attributes_0_relation').change({element: '#applicant_guardians_attributes_1_relation'}, guardianNo2Fathers).trigger('change')
  $('#applicant_guardians_attributes_1_relation').change({element: '#applicant_guardians_attributes_0_relation'}, guardianNo2Fathers).trigger('change')
  $('#applicant_guardians_attributes_0_relation').change({element: '#applicant_guardians_attributes_1_relation'}, guardianNo2Mothers).trigger('change')
  $('#applicant_guardians_attributes_1_relation').change({element: '#applicant_guardians_attributes_0_relation'}, guardianNo2Mothers).trigger('change')
  $('#applicant_guardians_attributes_0_financial').change({element: '#applicant_guardians_attributes_1_financial'}, No2Nos).trigger('change')
  $('#applicant_guardians_attributes_1_financial').change({element: '#applicant_guardians_attributes_0_financial'}, No2Nos).trigger('change')
  
  $('.relation').each ->
       $(this).change(guardianOther).trigger('change')
 
  if $('#applicant_uni_related_info_attributes_uni_choice_attributes_print_advertisements').is(':checked')
      $('#printAd').show()
  else  
      $('#printAd').hide()
  
  if $('#applicant_uni_related_info_attributes_uni_choice_attributes_nu_seminar_workshop_and_conference').is(':checked')
      $('#NuSeminar').show()
  else  
      $('#NuSeminar').hide()
  
  if $('#applicant_uni_related_info_attributes_uni_choice_attributes_other').is(':checked')
    $('#other').show()
  else  
    $('#other').hide()
  
   if $('#applicant_uni_related_info_attributes_other_choice_attributes_fields_of_study').is(':checked')
      $('#fieldsofstudy').show()
    else  
      $('#fieldsofstudy').hide()
    
    if $('#applicant_uni_related_info_attributes_other_choice_attributes_other').is(':checked')
      $('#other2').show()
    else  
      $('#other2').hide()
    
    if $('#applicant_checkSecondary').is(':checked')
      $('#applicant_checkSecondary').parent().parent().children('div').eq(1).hide()
    else  
      $('#applicant_checkSecondary').parent().parent().children('div').eq(1).show()
   
    if $('#applicant_checkCollege').is(':checked')
      $('#applicant_checkCollege').parent().parent().children('div').eq(1).hide()
    else  
      $('#applicant_checkCollege').parent().parent().children('div').eq(1).show()
    
    if $('#applicant_checkWork').is(':checked')
      $('#applicant_checkWork').parent().parent().children('div').eq(1).hide()
    else  
      $('#applicant_checkWork').parent().parent().children('div').eq(1).show()
      
  