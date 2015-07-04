HTMLWidgets.widget({

  name: 'shinyBioPv',

  type: 'output',

  initialize: function(el, width, height) {

    var pv = require("bio-pv");

    var viewer = pv.Viewer(document.getElementById(el.id), {
      quality: 'medium',
      width: 'auto',
      height: 'auto',
      antialias: true,
      outline: true,
      slabMode: 'auto'
    });


    return {
      viewer: viewer,
      pv: pv
    }

  },

  renderValue: function(el, x, instance) {
    var pv = instance.pv;
    var viewer = instance.viewer;
    pdbId = x.pdbcode;
    console.log(pdbId);
    var url = 'https://cors-anywhere.herokuapp.com/http://www.rcsb.org/pdb/files/'+pdbId+'.pdb'
    pv.io.fetchPdb(url, function(structure) {
    // render everything as helix/sheet/coil cartoon, coloring by secondary 
    // structure succession
        viewer.rm('*');
        var go = viewer.cartoon('structure', structure, {
          color: pv.color.ssSuccession(),
          showRelated: '1',
        });

        // find camera orientation such that the molecules biggest extents are 
        // aligned to the screen plane.
        var rotation = pv.viewpoint.principalAxes(go);
        viewer.setRotation(rotation)

        // adapt zoom level to contain the whole structure
        viewer.autoZoom();
     });
  },

  resize: function(el, width, height, instance) {
    instance.viewer.fitParent();
  }

});
