xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns9:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.1.wsdl" ::)

declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.1.0/mapping/partyClassification/Response_partyClassificationInformation/";
declare namespace ns6 = "http://soa.nordea.com/party/partyread/v1.1";
declare namespace ns5 = "http://soa.nordea.com/party/customerresponsibleandcruslib/v1.0";
declare namespace ns8 = "http://error.ntpsoa.nordea.com/object/v1";
declare namespace ns7 = "http://soa.nordea.com/party/partyclassificationinformationlib/v1.0";
declare namespace ns9 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace ns0 = "http://soa.nordea.com/party/partycommonfieldslib/v1.0";
declare namespace ns2 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.2";
declare namespace ns1 = "http://www.ibm.com/mdm/schema";
declare namespace ns4 = "http://soa.nordea.com/party/partybasiclib/v1.4";
declare namespace ns3 = "http://soa.nordea.com/party/partycontactinformationlib/v1.2";

declare function xf:Response_partyClassificationInformation($getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
                <ns2:requestPartyIdBobj>
                    <ns2:partyIdentifierBobj>
                        <ns2:partyId>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminPartyId) }</ns2:partyId>
                        <ns2:partyIdType>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminSystemValue) }</ns2:partyIdType>
                    </ns2:partyIdentifierBobj>
                </ns2:requestPartyIdBobj>
                <ns7:partyClassificationInformationBobj>
                {
                 for $K  in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PartyClassificationsBObj/ns1:PartyClassificationBObj union $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PartyClassificationsBObj/ns1:PartyClassificationReferenceBObj)
                                return
                                if (fn:local-name($K) = "PartyClassificationBObj") then
                    <ns7:partyClassificationBobj>
                        <ns7:partyClassificationType>{ data($K/ns1:ClassificationValue) }</ns7:partyClassificationType>
                        <ns7:partyClassificationValue>{ data($K/ns1:ClassificationValueValue) }</ns7:partyClassificationValue>
                        <ns7:partyClassificationMethod>{ data($K/ns1:MethodValue) }</ns7:partyClassificationMethod>
                        <ns0:partyDataSourceType>{ data($K/ns1:SourceIdentifierValue) }</ns0:partyDataSourceType>
                        <ns7:partyClassificationReason>{ data($K/ns1:PartyClassificationAdjReason) }</ns7:partyClassificationReason>
                        {
                            let $__nullable := ( data($K/ns1:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns7:partyClassificationDate>{xs:date(xs:dateTime(fn:replace(data($K/ns1:StartDate),' ','T')))}</ns7:partyClassificationDate>
                                else
                                    ()
                        }
                        
                    </ns7:partyClassificationBobj>
                else
                    <ns7:partyClassificationBobj>
                        <ns7:partyClassificationType>{ data($K/ns1:ClassificationReferenceValue) }</ns7:partyClassificationType>
                        <ns7:partyClassificationValue>{ data($K/ns1:PartyClassificationRefNum) }</ns7:partyClassificationValue>
                        <ns7:partyClassificationMethod>{ data($K/ns1:MethodValue) }</ns7:partyClassificationMethod>
                        <ns0:partyDataSourceType>{ data($K/ns1:SourceIdentifierValue) }</ns0:partyDataSourceType>
                        <ns7:partyClassificationReason>{ data($K/ns1:PartyClassificationAdjReason) }</ns7:partyClassificationReason>
                        {
                            let $__nullable := ( data($K/ns1:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns7:partyClassificationDate>{xs:date(xs:dateTime(fn:replace(data($K/ns1:StartDate),' ','T')))}</ns7:partyClassificationDate>
                                else
                                    ()
                        }
                    </ns7:partyClassificationBobj>
                }
                </ns7:partyClassificationInformationBobj>
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse) external;

xf:Response_partyClassificationInformation($getNordeaPartyResponse1)
