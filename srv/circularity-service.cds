using {sap.ui.circ as my} from '../db/schema-circ';

@path: 'service/circularity'
service CircularityService {
  entity Circularity          as projection on my.Circularity;
  annotate Circularity with @odata.draft.enabled;
  
  entity Component            as projection on my.Component;
  annotate Component with @odata.draft.enabled;

  entity ComponentComposition as projection on my.ComponentComposition;
  annotate ComponentComposition with @odata.draft.enabled;
}
