#!/usr/bin/env bash
BASE="/mnt/usb-Seagate_BUP_Portable_00000000NABAFQXH-0:0-part2/_movies"

echo "🎬 Renombrando archivos problemáticos..."

# Rocky
mv "$BASE/Rocky/Rockyii.1979.1080P-Dual-Lat.mp4" "$BASE/Rocky/Rocky.II.1979.1080P-Dual-Lat.mp4" && echo "✅ Rocky II" || echo "⚠️ Rocky II no encontrado"
mv "$BASE/Rocky/Rockyiii.1982.1080P-Dual-Lat.mp4" "$BASE/Rocky/Rocky.III.1982.1080P-Dual-Lat.mp4" && echo "✅ Rocky III mp4" || echo "⚠️ Rocky III mp4 no encontrado"
mv "$BASE/Rocky/Rockyiii.1982.1080P-Dual-Lat.srt" "$BASE/Rocky/Rocky.III.1982.1080P-Dual-Lat.srt" && echo "✅ Rocky III srt" || echo "⚠️ Rocky III srt no encontrado"

# Terminator
mv "$BASE/terminator/01.Terminator.1984.1080P.Dual-Lat-Cinecalidad.Lat.mp4" "$BASE/terminator/Terminator.1984.1080P-Dual-Lat.mp4" && echo "✅ Terminator 1" || echo "⚠️ Terminator 1 no encontrado"
mv "$BASE/terminator/02.Terminator.2el.juicio.final.1991.1080P-Dual-Lat.mp4" "$BASE/terminator/Terminator.2.Judgment.Day.1991.1080P-Dual-Lat.mp4" && echo "✅ Terminator 2" || echo "⚠️ Terminator 2 no encontrado"
mv "$BASE/terminator/03.Terminator3larebelióndelasmáquinas.2005.1080P-Dual-Lat.mp4" "$BASE/terminator/Terminator.3.Rise.of.the.Machines.2005.1080P-Dual-Lat.mp4" && echo "✅ Terminator 3" || echo "⚠️ Terminator 3 no encontrado"
mv "$BASE/terminator/04.Terminator.salvation.2009.1080p-dual-lat-cinecalidad.re.mp4" "$BASE/terminator/Terminator.Salvation.2009.1080p-Dual-Lat.mp4" && echo "✅ Terminator Salvation mp4" || echo "⚠️ Terminator Salvation mp4 no encontrado"
mv "$BASE/terminator/04.Terminator.salvation.2009.1080p-dual-lat-cinecalidad.re.srt" "$BASE/terminator/Terminator.Salvation.2009.1080p-Dual-Lat.srt" && echo "✅ Terminator Salvation srt" || echo "⚠️ Terminator Salvation srt no encontrado"
mv "$BASE/terminator/05.Terminator.genisys.2015.1080P-Dual-Lat.mp4" "$BASE/terminator/Terminator.Genisys.2015.1080P-Dual-Lat.mp4" && echo "✅ Terminator Genisys mp4" || echo "⚠️ Terminator Genisys mp4 no encontrado"
mv "$BASE/terminator/05.Terminator.genisys.2015.1080P-Dual-Lat.srt" "$BASE/terminator/Terminator.Genisys.2015.1080P-Dual-Lat.srt" && echo "✅ Terminator Genisys srt" || echo "⚠️ Terminator Genisys srt no encontrado"
mv "$BASE/terminator/06.Terminator.dark.fate.2019.1080P-Dual-Lat.mp4" "$BASE/terminator/Terminator.Dark.Fate.2019.1080P-Dual-Lat.mp4" && echo "✅ Terminator Dark Fate mp4" || echo "⚠️ Terminator Dark Fate mp4 no encontrado"
mv "$BASE/terminator/06.Terminator.dark.fate.2019.1080P-Dual-Lat.srt" "$BASE/terminator/Terminator.Dark.Fate.2019.1080P-Dual-Lat.srt" && echo "✅ Terminator Dark Fate srt" || echo "⚠️ Terminator Dark Fate srt no encontrado"

# Predator
mv "$BASE/predator/01.Depredador.1987.1080P-Dual-Lat.mkv" "$BASE/predator/Predator.1987.1080P-Dual-Lat.mkv" && echo "✅ Predator 1" || echo "⚠️ Predator 1 no encontrado"
mv "$BASE/predator/02.Depredador.2.1990.1080P-Dual-Lat.mkv" "$BASE/predator/Predator.2.1990.1080P-Dual-Lat.mkv" && echo "✅ Predator 2" || echo "⚠️ Predator 2 no encontrado"

# Harry Potter
mv "$BASE/harry potter/04.Harry.Potter.y.el.cáliz.de.fuego.2005.1080p-dual-lat.mp4" "$BASE/harry potter/Harry.Potter.and.the.Goblet.of.Fire.2005.1080p-dual-lat.mp4" && echo "✅ HP 4 mp4" || echo "⚠️ HP 4 mp4 no encontrado"
mv "$BASE/harry potter/04.Harry.Potter.y.el.cáliz.de.fuego.2005.1080p-dual-lat.srt" "$BASE/harry potter/Harry.Potter.and.the.Goblet.of.Fire.2005.1080p-dual-lat.srt" && echo "✅ HP 4 srt" || echo "⚠️ HP 4 srt no encontrado"
mv "$BASE/harry potter/05.Harry.Potter.and.the.Order.of.the.Phoenix.2007.bluray-latino-e-ingles-subt.mp4" "$BASE/harry potter/Harry.Potter.and.the.Order.of.the.Phoenix.2007.1080p-dual-lat.mp4" && echo "✅ HP 5 mp4" || echo "⚠️ HP 5 mp4 no encontrado"
mv "$BASE/harry potter/05.Harry.Potter.and.the.Order.of.the.Phoenix.2007.bluray-latino-e-ingles-subt.srt" "$BASE/harry potter/Harry.Potter.and.the.Order.of.the.Phoenix.2007.1080p-dual-lat.srt" && echo "✅ HP 5 srt" || echo "⚠️ HP 5 srt no encontrado"
mv "$BASE/harry potter/06.Harry.Potter.and.the.Half.Blood.Prince.2009.bluray-latino-e-ingles-subt.mp4" "$BASE/harry potter/Harry.Potter.and.the.Half.Blood.Prince.2009.1080p-dual-lat.mp4" && echo "✅ HP 6 mp4" || echo "⚠️ HP 6 mp4 no encontrado"
mv "$BASE/harry potter/06.Harry.Potter.and.the.Half.Blood.Prince.2009.bluray-latino-e-ingles-subt.srt" "$BASE/harry potter/Harry.Potter.and.the.Half.Blood.Prince.2009.1080p-dual-lat.srt" && echo "✅ HP 6 srt" || echo "⚠️ HP 6 srt no encontrado"
mv "$BASE/harry potter/07.Harry.Potter.And.The.Deathly.Hallows.Part.1.2010.1080P-Dual-Lat.mp4" "$BASE/harry potter/Harry.Potter.and.the.Deathly.Hallows.Part.1.2010.1080P-Dual-Lat.mp4" && echo "✅ HP 7.1 mp4" || echo "⚠️ HP 7.1 mp4 no encontrado"
mv "$BASE/harry potter/07.Harry.Potter.And.The.Deathly.Hallows.Part.1.2010.1080P-Dual-Lat.srt" "$BASE/harry potter/Harry.Potter.and.the.Deathly.Hallows.Part.1.2010.1080P-Dual-Lat.srt" && echo "✅ HP 7.1 srt" || echo "⚠️ HP 7.1 srt no encontrado"
mv "$BASE/harry potter/07.Harry.Potter.And.The.Deathly.Hallows.Part.2.2011.1080P-Dual-Lat.mp4" "$BASE/harry potter/Harry.Potter.and.the.Deathly.Hallows.Part.2.2011.1080P-Dual-Lat.mp4" && echo "✅ HP 7.2 mp4" || echo "⚠️ HP 7.2 mp4 no encontrado"
mv "$BASE/harry potter/07.Harry.Potter.And.The.Deathly.Hallows.Part.2.2011.1080P-Dual-Lat.srt" "$BASE/harry potter/Harry.Potter.and.the.Deathly.Hallows.Part.2.2011.1080P-Dual-Lat.srt" && echo "✅ HP 7.2 srt" || echo "⚠️ HP 7.2 srt no encontrado"

# Jurassic Park
mv "$BASE/jurassic park/01. Jurassic.Park.1993.1080P-Dual-Lat.mp4" "$BASE/jurassic park/Jurassic.Park.1993.1080P-Dual-Lat.mp4" && echo "✅ JP 1 mp4" || echo "⚠️ JP 1 mp4 no encontrado"
mv "$BASE/jurassic park/01. Jurassic.Park.1993.1080P-Dual-Lat.srt" "$BASE/jurassic park/Jurassic.Park.1993.1080P-Dual-Lat.srt" && echo "✅ JP 1 srt" || echo "⚠️ JP 1 srt no encontrado"
mv "$BASE/jurassic park/02. The.Lost.World.Jurassic.Park.1997.1080P-Dual-Lat.mp4" "$BASE/jurassic park/The.Lost.World.Jurassic.Park.1997.1080P-Dual-Lat.mp4" && echo "✅ JP 2 mp4" || echo "⚠️ JP 2 mp4 no encontrado"
mv "$BASE/jurassic park/02. The.Lost.World.Jurassic.Park.1997.1080P-Dual-Lat.srt" "$BASE/jurassic park/The.Lost.World.Jurassic.Park.1997.1080P-Dual-Lat.srt" && echo "✅ JP 2 srt" || echo "⚠️ JP 2 srt no encontrado"
mv "$BASE/jurassic park/03. Jurassic.Park.III.2001.1080P-Dual-Lat.mp4" "$BASE/jurassic park/Jurassic.Park.III.2001.1080P-Dual-Lat.mp4" && echo "✅ JP 3 mp4" || echo "⚠️ JP 3 mp4 no encontrado"
mv "$BASE/jurassic park/03. Jurassic.Park.III.2001.1080P-Dual-Lat.srt" "$BASE/jurassic park/Jurassic.Park.III.2001.1080P-Dual-Lat.srt" && echo "✅ JP 3 srt" || echo "⚠️ JP 3 srt no encontrado"
mv "$BASE/jurassic park/04. Jurassic.world.2015.1080P-Dual-Lat.mp4" "$BASE/jurassic park/Jurassic.World.2015.1080P-Dual-Lat.mp4" && echo "✅ JP 4 mp4" || echo "⚠️ JP 4 mp4 no encontrado"
mv "$BASE/jurassic park/04. Jurassic.world.2015.1080P-Dual-Lat.srt" "$BASE/jurassic park/Jurassic.World.2015.1080P-Dual-Lat.srt" && echo "✅ JP 4 srt" || echo "⚠️ JP 4 srt no encontrado"
mv "$BASE/jurassic park/05. Jurassic.world.fallen.kingdom.2018.1080p-dual-lat-cinecalidad.to.mp4" "$BASE/jurassic park/Jurassic.World.Fallen.Kingdom.2018.1080P-Dual-Lat.mp4" && echo "✅ JP 5 mp4" || echo "⚠️ JP 5 mp4 no encontrado"
mv "$BASE/jurassic park/05. Jurassic.world.fallen.kingdom.2018.1080p-dual-lat-cinecalidad.to.srt" "$BASE/jurassic park/Jurassic.World.Fallen.Kingdom.2018.1080P-Dual-Lat.srt" && echo "✅ JP 5 srt" || echo "⚠️ JP 5 srt no encontrado"
mv "$BASE/jurassic park/06. Jurassic.World.Dominion.2022.1080P-Dual-Lat.mp4" "$BASE/jurassic park/Jurassic.World.Dominion.2022.1080P-Dual-Lat.mp4" && echo "✅ JP 6 mp4" || echo "⚠️ JP 6 mp4 no encontrado"
mv "$BASE/jurassic park/06. Jurassic.World.Dominion.2022.1080P-Dual-Lat.srt" "$BASE/jurassic park/Jurassic.World.Dominion.2022.1080P-Dual-Lat.srt" && echo "✅ JP 6 srt" || echo "⚠️ JP 6 srt no encontrado"

# Otros
mv "$BASE/favoritas/Elquintoelemento.1997.1080P.1080P-Dual-Lat.mp4" "$BASE/favoritas/The.Fifth.Element.1997.1080P-Dual-Lat.mp4" && echo "✅ Fifth Element mp4" || echo "⚠️ Fifth Element mp4 no encontrado"
mv "$BASE/favoritas/Elquintoelemento.1997.1080P.1080P-Dual-Lat.srt" "$BASE/favoritas/The.Fifth.Element.1997.1080P-Dual-Lat.srt" && echo "✅ Fifth Element srt" || echo "⚠️ Fifth Element srt no encontrado"
mv "$BASE/por ver/Conanelbarbaro.1982.1080P-Dual-Lat.mp4" "$BASE/por ver/Conan.the.Barbarian.1982.1080P-Dual-Lat.mp4" && echo "✅ Conan mp4" || echo "⚠️ Conan mp4 no encontrado"
mv "$BASE/westerns/Dances.with.Wolves.DC.1990.720p.BluRay.x264.YIFY.mp4" "$BASE/westerns/Dances.with.Wolves.1990.720p.BluRay.x264.YIFY.mp4" && echo "✅ Dances with Wolves mp4" || echo "⚠️ Dances with Wolves mp4 no encontrado"
mv "$BASE/westerns/Dances.with.Wolves.DC.1990.720p.BluRay.x264.YIFY.srt" "$BASE/westerns/Dances.with.Wolves.1990.720p.BluRay.x264.YIFY.srt" && echo "✅ Dances with Wolves srt" || echo "⚠️ Dances with Wolves srt no encontrado"
mv "$BASE/kids/animadas/Around.the.World.Ini.2021.1080p-dual-lat.mp4" "$BASE/kids/animadas/Around.the.World.in.80.Days.2021.1080p-dual-lat.mp4" && echo "✅ Around the World mp4" || echo "⚠️ Around the World mp4 no encontrado"
mv "$BASE/kids/animadas/Around.the.World.Ini.2021.1080p-dual-lat.srt" "$BASE/kids/animadas/Around.the.World.in.80.Days.2021.1080p-dual-lat.srt" && echo "✅ Around the World srt" || echo "⚠️ Around the World srt no encontrado"
mv "$BASE/kids/animadas/Madagascar.A.Little.Wild.Holiday.Goose.Chaseo.2021.1080p-dual-lat.mp4" "$BASE/kids/animadas/Madagascar.A.Little.Wild.Holiday.Goose.Chase.2021.1080p-dual-lat.mp4" && echo "✅ Madagascar mp4" || echo "⚠️ Madagascar mp4 no encontrado"
mv "$BASE/kids/animadas/Madagascar.A.Little.Wild.Holiday.Goose.Chaseo.2021.1080p-dual-lat.srt" "$BASE/kids/animadas/Madagascar.A.Little.Wild.Holiday.Goose.Chase.2021.1080p-dual-lat.srt" && echo "✅ Madagascar srt" || echo "⚠️ Madagascar srt no encontrado"

# Total Recall
mv "$BASE/80s y 90s/Total.Recall.Mind.Bending.Edition.1990.720p.BluRay.x264.YIFY.mp4" "$BASE/80s y 90s/Total.Recall.1990.720p.BluRay.x264.YIFY.mp4" && echo "✅ Total Recall mp4" || echo "⚠️ Total Recall mp4 no encontrado"
mv "$BASE/80s y 90s/Total.Recall.Mind.Bending.Edition.1990.720p.BluRay.x264.YIFY.srt" "$BASE/80s y 90s/Total.Recall.1990.720p.BluRay.x264.YIFY.srt" && echo "✅ Total Recall srt" || echo "⚠️ Total Recall srt no encontrado"

# Dora - año correcto es 2019, no 2025
mv "$BASE/kids/live action/Dora.Y.La.Ciudad.Perdida.2025.1080P-Dual-Lat.mkv" "$BASE/kids/live action/Dora.and.the.Lost.City.of.Gold.2019.1080P-Dual-Lat.mkv" && echo "✅ Dora mkv" || echo "⚠️ Dora mkv no encontrado"
mv "$BASE/kids/live action/Dora.Y.La.Ciudad.Perdida.2025.1080P-Dual-Lat.srt" "$BASE/kids/live action/Dora.and.the.Lost.City.of.Gold.2019.1080P-Dual-Lat.srt" && echo "✅ Dora srt" || echo "⚠️ Dora srt no encontrado"

echo ""
echo "✅ Renombrado completo"