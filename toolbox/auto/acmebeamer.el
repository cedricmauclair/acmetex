(TeX-add-style-hook "acmebeamer"
 (lambda ()
    (LaTeX-add-environments
     "framedtext"
     "sitemize")
    (TeX-add-symbols
     '("warn" ["argument"] 0)
     '("whng" ["argument"] 0)
     '("frwn" ["argument"] 0)
     '("mood" ["argument"] 0)
     '("wink" ["argument"] 0)
     '("wide" ["argument"] 0)
     '("grin" ["argument"] 0)
     '("csmiley" ["argument"] 2)
     '("fsmiley" ["argument"] 2)
     '("msmiley" ["argument"] 2)
     '("wsmiley" ["argument"] 2)
     '("wgsmiley" ["argument"] 2)
     '("gsmiley" ["argument"] 2)
     '("emptyline" ["argument"] 0)
     '("usebeamer" ["argument"] 1)
     "tempdim"
     "leftmargin"
     "rightmargin"
     "titlepagelineoffset"
     "setlen"
     "framedboxwd"
     "framedboxht"
     "framedboxdp"
     "framedfullframedefault"
     "framedbackgrounddefault"
     "framedfullframe"
     "framedbackground"
     "framed"
     "startframedtext"
     "insidestrut"
     "inframe"
     "doinframe"
     "slide"
     "oldsetbeamersize"
     "setbeamersize"
     "unitsquare"
     "dounitsquare"
     "fullsquare"
     "dofullsquare"
     "unitcircle"
     "dounitcircle"
     "fullcircle"
     "dofullcircle"
     "unittriangle"
     "dounittriangle"
     "fulltriangle"
     "dofulltriangle"
     "maketitle"
     "logocustom"
     "frametoc"
     "doframetoc"
     "dodoframetoc"
     "headlineleft"
     "headlinecenter"
     "headlineright"
     "footlineleft"
     "footlinecenter"
     "footlineright"
     "pagenumbercustom"
     "usesquareitems"
     "usecircleitems"
     "usetriangleitems"
     "usefilledsquareitems"
     "usefilledcircleitems"
     "usefilledtriangleitems"
     "emptyfull"
     "emptyhalf"
     "definelanguageswitch"
     "dodefinelanguageswitch"
     "ok"
     "ko"
     "usefgorcolor"
     "useordefinefgbgcolor"
     "acmeplaintheme"
     "oldsection"
     "section"
     "secname"
     "subsecname")
    (TeX-run-style-hooks
     "acmetoolbox"
     "tikz")))

