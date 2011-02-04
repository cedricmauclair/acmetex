(TeX-add-style-hook "acmebeamer"
 (lambda ()
    (LaTeX-add-environments
     "sitemize")
    (TeX-add-symbols
     '("emptyline" ["argument"] 0)
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
     '("usebeamer" ["argument"] 1)
     "leftmargin"
     "rightmargin"
     "titlepagelineoffset"
     "em"
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
     "ok"
     "ko"
     "maketitle"
     "domaketitle"
     "frametoc"
     "doframetoc"
     "dodoframetoc"
     "headlineleft"
     "headlinecenter"
     "headlineright"
     "footlineleft"
     "footlinecenter"
     "footlineright"
     "emstyle"
     "blocksparameters"
     "defineblocks"
     "dodefineblocks"
     "defineblock"
     "dodefineblock"
     "setupblocks"
     "dosetupblocks"
     "setupblock"
     "dosetupblock"
     "dodefineblockindeed"
     "current"
     "insertblocktitle"
     "block"
     "alertblock"
     "exampleblock"
     "defaultblock"
     "defaultendblock"
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
     "usefgorcolor"
     "useordefinefgbgcolor"
     "acmeplaintheme"
     "oldsection"
     "section"
     "secname"
     "subsecname")
    (TeX-run-style-hooks
     "tikz"
     "acmetoolbox")))

