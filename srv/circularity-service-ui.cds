using CircularityService from './circularity-service';

annotate CircularityService.Circularity with {
    partId           @title: 'Part Id';
    partDescr        @title: 'Part Description';
    components       @title: 'Components';
    hazardous        @title: 'Hazardous';
    circularityIndex @title: 'Circularity Index';
}

annotate CircularityService.Component with {
    ID            @(
        UI.Hidden,
        Common: {Text: description}
    );
    componentId   @title: 'Component Id';
    description   @title: 'Component Description';
    decayTimeline @title: 'Decay Time(in years)';
    recyclable    @title: 'Recyclable';
    recyclability @title: 'Percentage Recyclable';

}

annotate CircularityService.Circularity with @(UI: {
    HeaderInfo      : {
        TypeName      : 'Circular Item',
        TypeNamePlural: 'Circular Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: partId
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: partDescr
        }
    },
    SelectionFields : [circularityIndex],
    LineItem        : [
        {Value: partId},
        {Value: partDescr},
        /*{Value: components },*/
        {Value: hazardous, },
        {Value: circularityIndex}
    ],
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target: '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main: {Data: [
        /*{Value: miti_ID},*/
        {
            Value      : partId,
        },
        {
            Value      : circularityIndex,
        }
    ]}
}, ) {

};
/*
annotate CircularityService.Circularity with {
    miti @(Common: {
        //show text, not id for mitigation in the context of risks
        Text           : miti.description,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Mitigations',
            CollectionPath: 'Mitigations',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: miti_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    });
}
*/