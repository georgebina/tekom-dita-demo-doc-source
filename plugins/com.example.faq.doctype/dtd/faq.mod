<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA FAQ                                          -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      May 2013                                          -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//EXAMPLE//ELEMENTS DITA FAQ//EN"
      Delivered as file "faq.mod"                                  -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributes    -->
<!--             for Example FAQ                                  -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             May 2013                                          -->
<!--                                                               -->
<!--             (C) Copyright Eberlein Consulting 2013            -->
<!--             All Rights Reserved.                              -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ARCHITECTURE ENTITIES                       -->
<!-- ============================================================= -->

<!-- default namespace prefix for DITAArchVersion attribute can be
     overridden through predefinition in the document type shell   -->
<!ENTITY % DITAArchNSPrefix
  "ditaarch"
>

<!ENTITY % arch-atts 
             "xmlns:%DITAArchNSPrefix; 
                        CDATA
                                  #FIXED 'http://dita.oasis-open.org/architecture/2005/'
              %DITAArchNSPrefix;:DITAArchVersion
                        CDATA
                                  '1.2'
"
>


<!-- ============================================================= -->
<!--                   SPECIALIZATION OF DECLARED ELEMENTS         -->
<!-- ============================================================= -->


<!ENTITY % faq-info-types 
  "%faq-info-types;
  "
>


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->
 

<!ENTITY % faq          "faq"                                        >
<!ENTITY % question     "question"                                   >
<!ENTITY % answer       "answer"                                     >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->


<!ENTITY included-domains 
  ""
>


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: FAQ                             -->
<!ENTITY % faq.content
                       "((%question;),  
                         (%prolog;)?,
                         (%answer;)?, 

                         (%faq-info-types;)* )"
>
<!ENTITY % faq.attributes
             "id 
                        ID 
                                  #REQUIRED
              %conref-atts;
              %select-atts;
              %localization-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT faq    %faq.content;>
<!ATTLIST faq    
              %faq.attributes;
              %arch-atts;
              domains 
                        CDATA 
                                  "&included-domains;">

<!--                    LONG NAME: Question                        -->
<!ENTITY % question.content
                       "(%title.cnt;)*"
>
<!ENTITY % question.attributes
             "%id-atts;
              %localization-atts;
              base 
                        CDATA 
                                  #IMPLIED
              %base-attribute-extensions;
              outputclass
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT question    %question.content;>
<!ATTLIST question    %question.attributes;>

<!--                    LONG NAME: Answer                    -->
<!ENTITY % answer.content
                       "((%body.cnt;)*, 
                         (%section; |
                          %example; |
                          %conbodydiv;)* )"
>
<!ENTITY % answer.attributes
             "%id-atts;
              %localization-atts;
              base 
                        CDATA 
                                  #IMPLIED
              %base-attribute-extensions;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT answer    %answer.content;>
<!ATTLIST answer    %answer.attributes;>

 
<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST faq          %global-atts;  class CDATA "- topic/topic concept/concept faq/faq ">
<!ATTLIST question     %global-atts;  class CDATA "- topic/title  faq/question ">
<!ATTLIST answer       %global-atts;  class CDATA "- topic/body concept/conbody faq/answer ">

<!-- ================== End DITA Concept  ======================== -->




