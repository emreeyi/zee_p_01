CLASS zee_xml_to_html DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zee_xml_to_html IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_xml  TYPE string,
          gt_html TYPE TABLE OF char255.

*  lv_xml = '<books><book><title>ABAP Programming</title><author>John Doe</author></book><book><title>Advanced ABAP</title><author>Jane Smith</author></book></books>'.
*lv_xml = <?xml version="1.0" encoding="utf-8"?><Invoice xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:cctc="urn:un:
"unece:uncef

*lv_xml = '<?xml version="1.0" encoding="UTF-8"?>' &&
*'<Invoice xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2 UBL-Invoice-2.1.xsd" xmlns:xades="http://uri.etsi.org/01903/v1.3.2#" xmlns:cbc="urn:oasis:names:speci' &&
*'fication:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:udt="urn:un:unece:uncef' &&
*'act:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:ubltr="urn:oasis:names:specification:ubl:schema:xsd:TurkishCustomizationExtensionComponents" xmlns:cctc="urn:un:unece:uncefact:documentation:2" xmlns:qdt="urn:oasis:names:specificatio' &&
*'n:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">'&&
*'<cbc:UBLVersionID>2.1</cbc:UBLVersionID>' &&
*
*'<cbc:CustomizationID>TR1.2</cbc:CustomizationID>' &&
*
*'<cbc:ProfileID>EARSIVFATURA</cbc:ProfileID>' &&

*<cbc:ID>ÖN GÖRÜNÜM</cbc:ID>' &&
*
*<cbc:CopyIndicator>false</cbc:CopyIndicator>' &&
*
*<cbc:UUID>ÖN GÖRÜNÜM</cbc:UUID>' &&
*
*<cbc:IssueDate>2025-01-24</cbc:IssueDate>' &&
*
*<cbc:IssueTime>14:46:07</cbc:IssueTime>' &&
*
*<cbc:InvoiceTypeCode>SATIS</cbc:InvoiceTypeCode>
*
*<cbc:DocumentCurrencyCode>TRY</cbc:DocumentCurrencyCode>
*
*<cbc:TaxCurrencyCode>TRY</cbc:TaxCurrencyCode>
*
*<cbc:PricingCurrencyCode>TRY</cbc:PricingCurrencyCode>
*
*<cbc:PaymentCurrencyCode>TRY</cbc:PaymentCurrencyCode>
*
*<cbc:LineCountNumeric>1</cbc:LineCountNumeric>
*
*
*-<cac:OrderReference>
*
*<cbc:ID>0040000024</cbc:ID>
*
*<cbc:IssueDate>2025-01-24</cbc:IssueDate>
*
*</cac:OrderReference>
*
*
*-<cac:AccountingSupplierParty>
*
*
*-<cac:Party>
*
*<cbc:WebsiteURI/>
*
*
*-<cac:PartyIdentification>
*
*<cbc:ID schemeID="VKN">9000068418</cbc:ID>
*
*</cac:PartyIdentification>
*
*
*-<cac:PartyIdentification>
*
*<cbc:ID schemeID="TICARETSICILNO"/>
*
*</cac:PartyIdentification>
*
*
*-<cac:PartyIdentification>
*
*<cbc:ID schemeID="MERSISNO"/>
*
*</cac:PartyIdentification>
*
*
*-<cac:PartyName>
*
*<cbc:Name>MYZ Bilgisayar Otomotiv İnşaat Petrol Sanayi ve Ticaret Limited Şirketi</cbc:Name>
*
*</cac:PartyName>
*
*
*-<cac:PostalAddress>
*
*<cbc:StreetName>Levent Mahallesi Levent Caddesi</cbc:StreetName>
*
*<cbc:CitySubdivisionName>BEŞİKTAŞ</cbc:CitySubdivisionName>
*
*<cbc:CityName>ISTANBUL</cbc:CityName>
*
*<cbc:PostalZone>34330</cbc:PostalZone>
*
*
*-<cac:Country>
*
*<cbc:Name>TÜRKİYE</cbc:Name>
*
*</cac:Country>
*
*</cac:PostalAddress>
*
*
*-<cac:PartyTaxScheme>
*
*
*-<cac:TaxScheme>
*
*<cbc:Name>Beşiktaş</cbc:Name>
*
*</cac:TaxScheme>
*
*</cac:PartyTaxScheme>
*
*
*-<cac:Contact>
*
*<cbc:Telephone>0212 444 8 976</cbc:Telephone>
*
*<cbc:Telefax/>
*
*<cbc:ElectronicMail/>
*
*</cac:Contact>
*
*</cac:Party>
*
*</cac:AccountingSupplierParty>
*
*
*-<cac:AccountingCustomerParty>
*
*
*-<cac:Party>
*
*
*-<cac:PartyIdentification>
*
*<cbc:ID schemeID="VKN">1111111111</cbc:ID>
*
*</cac:PartyIdentification>
*
*
*-<cac:PartyName>
*
*<cbc:Name>PRODEA TESTTEST2</cbc:Name>
*
*</cac:PartyName>
*
*
*-<cac:PostalAddress>
*
*<cbc:StreetName>altunizade mahallesi 09</cbc:StreetName>
*
*<cbc:CitySubdivisionName>Üsküdar</cbc:CitySubdivisionName>
*
*<cbc:CityName>İstanbul</cbc:CityName>
*
*<cbc:PostalZone>34100</cbc:PostalZone>
*
*
*-<cac:Country>
*
*<cbc:Name>Türkiye</cbc:Name>
*
*</cac:Country>
*
*</cac:PostalAddress>
*
*
*-<cac:PartyTaxScheme>
*
*
*-<cac:TaxScheme>
*
*<cbc:Name>ÜSKÜDAR</cbc:Name>
*
*</cac:TaxScheme>
*
*</cac:PartyTaxScheme>
*
*
*-<cac:Contact>
*
*<cbc:Telephone/>
*
*<cbc:Telefax/>
*
*</cac:Contact>
*
*</cac:Party>
*
*</cac:AccountingCustomerParty>
*
*
*-<cac:InvoiceLine>
*
*<cbc:ID>1</cbc:ID>
*
*<cbc:InvoicedQuantity unitCode="NIU">1.000 </cbc:InvoicedQuantity>
*
*<cbc:LineExtensionAmount currencyID="TRY">583.33 </cbc:LineExtensionAmount>
*
*
*-<cac:Item>
*
*<cbc:Description/>
*
*<cbc:Name>Araç kiralama</cbc:Name>
*
*
*-<cac:SellersItemIdentification>
*
*<cbc:ID>10000001</cbc:ID>
*
*</cac:SellersItemIdentification>
*
*
*-<cac:BuyersItemIdentification>
*
*<cbc:ID/>
*
*</cac:BuyersItemIdentification>
*
*</cac:Item>
*
*
*-<cac:TaxTotal>
*
*<cbc:TaxAmount currencyID="TRY">116.67</cbc:TaxAmount>
*
*
*-<cac:TaxSubtotal>
*
*<cbc:TaxableAmount currencyID="TRY">583.33</cbc:TaxableAmount>
*
*<cbc:TaxAmount currencyID="TRY">116.67</cbc:TaxAmount>
*
*<cbc:Percent>20.00</cbc:Percent>
*
*
*-<cac:TaxCategory>
*
*
*-<cac:TaxScheme>
*
*<cbc:Name>KDV</cbc:Name>
*
*<cbc:TaxTypeCode>0015</cbc:TaxTypeCode>
*
*</cac:TaxScheme>
*
*</cac:TaxCategory>
*
*</cac:TaxSubtotal>
*
*</cac:TaxTotal>
*
*
*-<cac:AllowanceCharge>
*
*<cbc:ChargeIndicator>false</cbc:ChargeIndicator>
*
*<cbc:MultiplierFactorNumeric>0.00 </cbc:MultiplierFactorNumeric>
*
*<cbc:Amount currencyID="TRY">0.00</cbc:Amount>
*
*</cac:AllowanceCharge>
*
*
*-<cac:Price>
*
*<cbc:PriceAmount currencyID="TRY">583.33</cbc:PriceAmount>
*
*</cac:Price>
*
*</cac:InvoiceLine>
*
*
*-<cac:TaxTotal>
*
*<cbc:TaxAmount currencyID="TRY">116.67</cbc:TaxAmount>
*
*
*-<cac:TaxSubtotal>
*
*<cbc:TaxableAmount currencyID="TRY">583.33</cbc:TaxableAmount>
*
*<cbc:TaxAmount currencyID="TRY">116.67</cbc:TaxAmount>
*
*<cbc:Percent>20.00</cbc:Percent>
*
*
*-<cac:TaxCategory>
*
*
*-<cac:TaxScheme>
*
*<cbc:Name>KDV</cbc:Name>
*
*<cbc:TaxTypeCode>0015</cbc:TaxTypeCode>
*
*</cac:TaxScheme>
*
*</cac:TaxCategory>
*
*</cac:TaxSubtotal>
*
*</cac:TaxTotal>
*
*
*-<cac:LegalMonetaryTotal>
*
*<cbc:LineExtensionAmount currencyID="TRY">583.33</cbc:LineExtensionAmount>
*
*<cbc:TaxExclusiveAmount currencyID="TRY">583.33</cbc:TaxExclusiveAmount>
*
*<cbc:TaxInclusiveAmount currencyID="TRY">700.00</cbc:TaxInclusiveAmount>
*
*<cbc:PayableAmount currencyID="TRY">700.00</cbc:PayableAmount>
*
*<cbc:AllowanceTotalAmount currencyID=""/>
*
*</cac:LegalMonetaryTotal>
*
*<cbc:Note>Yalnız YEDİYÜZ TRY</cbc:Note>
*
*<cbc:Note>FaturaVade: 30-07-2025</cbc:Note>
*
*'</Invoice>'.


        CALL TRANSFORMATION ZPRO_EUYG_EARCHIVE_PREVIW_1040
        SOURCE XML lv_xml
        RESULT XML gt_html.

  ENDMETHOD.
ENDCLASS.
