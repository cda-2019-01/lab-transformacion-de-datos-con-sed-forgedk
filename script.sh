# Escriba su código aquí
mkdir temp
sed 's#\([0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\)#20\3-\2-\1#' data.csv > temp/outYearFormat.csv
sed 's#\([0-9]\)/\([0-9]\)/\([0-9][0-9][0-9][0-9]\)#\3-\2-\1#' temp/outYearFormat.csv> temp/outYearFormat2.csv
sed 's#\([0-9][0-9][0-9][0-9]\)-\([0-9]\)-\([0-9]\)#\1-0\2-0\3#' temp/outYearFormat2.csv> temp/outYearFormat3.csv
sed 's#[a-z]#\U&#g' temp/outYearFormat3.csv > temp/outToUperCase.csv
sed 's#,#.#g' temp/outToUperCase.csv > temp/outWithOutComa.csv
sed 's#;#.#4' temp/outWithOutComa.csv > temp/outWithOutComaLastOcurrence.csv
sed 's#;N#;\\N#g' temp/outWithOutComaLastOcurrence.csv  > temp/outReplaceOnlyNWithNull.csv
sed 's#;;#;\\N;#g' temp/outReplaceOnlyNWithNull.csv  > temp/outReplaceSlashN.csv
sed 's#;\r$#;\\N\r#g' temp/outReplaceSlashN.csv  > temp/outReplaceSlashNEndingLine.csv
sed -i ':a;N;$!ba;s/;\n/;\\N\n/g'  temp/outReplaceSlashNEndingLine.csv
sed 's#;#,#g' temp/outReplaceSlashNEndingLine.csv 
rm -r temp