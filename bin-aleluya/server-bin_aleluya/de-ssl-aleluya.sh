# For God so loved the world that he gave His only begotten Son
# That all who believe in Him should not perish but have everlasting life

echo ALELUYA - PLEASE RUN IN ROOT AS ROOT
read -n 1
for aleluya in *-aleluya; do
  nm_aleluya=`basename -s -aleluya $aleluya`
  if [ -d /etc/letsencrypt/live/$nm_aleluya ]; then
    sed -i 's/#SSL-ALELUYA//g' $aleluya/etc-aleluya/nginx-aleluya.conf
    echo $aleluya - Praise God
  else
    echo $aleluya - NO SSL ------ HALLELUJAH
  fi
done
echo PRAISE JESUS
