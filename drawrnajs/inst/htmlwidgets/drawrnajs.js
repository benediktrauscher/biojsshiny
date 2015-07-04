HTMLWidgets.widget({

  name: 'drawrnajs',

  type: 'output',

  initialize: function(el, width, height) {
    console.log("hello");

    var rnaDiv = document.getElementById(el.id);
    rnaDiv.className += " cy";
    var rna = require("drawrnajs");

    return {
      drawrnajs: rna,
      div: rnaDiv
    };

  },

  renderValue: function(el, x, instance) {
    console.log(x);
    console.log(instance);
    var rna = x.rna;
    var dotbr = x.dotbr;
    var struct = instance.drawrnajs.t.transformDotBracket(rna, dotbr);
    var app = instance.drawrnajs.vis;
    app({graph: struct, el: instance.div});
  },

  resize: function(el, width, height, instance) {

  }

});
