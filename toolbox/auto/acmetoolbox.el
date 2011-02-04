(TeX-add-style-hook "acmetoolbox"
 (lambda ()
    (LaTeX-add-environments
     "framedtext")
    (TeX-add-symbols
<<<<<<< HEAD
     '("framed" ["argument"] 1)
=======
     "nextdepth"
>>>>>>> f8fc420f8e2a19d3d22a8544952e1cc6425d3a02
     "doifnextcharelse"
     "doifnextoptionalelse"
     "doifnextbgroupelse"
     "doifinstringelse"
     "doifassignmentelse"
     "processcommalist"
<<<<<<< HEAD
     "pgfkeyscurrentkey"
=======
     "evalasdimen"
     "checknumericparameter"
     "tovaliddimension"
     "normalizeabove"
     "normalizebelow"
     "toolboxunpack"
>>>>>>> f8fc420f8e2a19d3d22a8544952e1cc6425d3a02
     "expandonearg"
     "expandtwoargs"
     "expanded"
     "dosingleempty"
     "dodoubleempty"
     "dosinglefakeempty"
     "dodoublefakeempty"
     "setvalue"
     "setgvalue"
     "setevalue"
     "setxvalue"
     "getvalue"
     "letvalue"
     "letgvalue"
     "resetvalue"
     "ignorevalue"
     "docopyvalue"
     "declareparameters"
     "dodeclareparameters"
     "dodeclareparametersindeed"
     "declaredimensions"
     "dodeclaredimensions"
     "dodeclaredimensionsindeed"
     "getparameters"
     "dogetparameters"
     "dogetparametersindeed"
     "dodoubleargumentwithset"
     "getrawparameters"
     "dogetrawparameters"
     "copyrawparameters"
     "dododowithnextbox"
     "nextboxht"
     "nextboxwd"
     "nextboxdp"
     "flushnextbox"
     "boxcontent"
     "noboxcontent"
     "doboxcontentindeed"
     "surroundbox"
     "dosurroundbox"
     "dodosurroundbox"
     "dosurroundboxindeed"
     "framedboxwd"
     "framedboxht"
     "framedboxdp"
<<<<<<< HEAD
     "acmeframedfullframedefault"
     "acmeframedbackgrounddefault"
     "acmeframedfullframe"
     "acmeframedbackground")
=======
     "acmeframedleftframe"
     "acmeframedrightframe"
     "acmeframedtopframe"
     "acmeframedbottomframe"
     "acmeframedbackground"
     "acmeframedalign"
     "acmeframedtop"
     "acmeframedbottom"
     "framed"
     "doframed"
     "strutdp"
     "strutht"
     "strutwd"
     "insidestrut"
     "inframe"
     "doinframe")
>>>>>>> f8fc420f8e2a19d3d22a8544952e1cc6425d3a02
    (TeX-run-style-hooks
     "tikz"
     "pgffor"
     "pgfkeys")))

