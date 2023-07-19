namespace sap.ui.circ;

using {managed} from '@sap/cds/common';

entity ComponentComposition : managed {
  key ID         : UUID @(Core.Computed: true);
      component  : Association to Component;
      percentage : Decimal;
}

entity Component : managed {
  key ID            : UUID @(Core.Computed: true);
      componentId   : String(100);
      description   : String;
      decayTimeline : String;
      recyclable    : Boolean;
      recyclability : Integer;
}

entity Circularity : managed {
  key ID               : UUID @(Core.Computed: true);
      partId           : String(100);
      partDescr        : String;
      components       : many {
        component  : Association to Component;
        percentage : Decimal;
      };
      hazardous        : Boolean;
      circularityIndex : Integer;
}
