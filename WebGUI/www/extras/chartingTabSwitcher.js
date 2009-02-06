WebGUI.ChartFormSwitcher = function ( selectElem, constiuents ) {
    this.selector   = document.getElementById( selectElem );
    this.container  = YAHOO.util.Dom.getAncestorByTagName( selectElem, 'div' );
    this.constituents = constiuents;

    if (this.selector.value === null) {
        this.selector.selectedIndex = 0;
    }

    YAHOO.util.Event.addListener( this.selector, 'change', this.switchFormElements, this, true );

    this.switchFormElements();
}

WebGUI.ChartFormSwitcher.prototype.switchFormElements = function () {
//    var classParts = this.selector.value.split(/::/);
//    var className = this.selector.value.replace( /::/g, '_' );
    var enableClasses = this.constituents[ this.selector.value ];
    
    var tr = YAHOO.util.Dom.getElementsBy( 
        // Find all rows that contain chart properties
        function ( el ) {
            return el.className && el.className.match( /WebGUI_/ );
        },
        'tr',
        this.container
    );

    for (var i = 0; i < tr.length; i++) {
        tr[i].style.display = 'none';

        for (var j=0; j < enableClasses.length; j++) {
            if ( tr[ i ].className === enableClasses[ j ] ) {
                tr[i].style.display = '';
            }
        }
    }
    
}
