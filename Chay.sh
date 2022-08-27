echo "- Kiểm thử"

echo "- Cập nhật thư viện"
sudo apt-get update > /dev/null
sudo apt-get install zstd binutils e2fsprogs erofs-utils simg2img img2simg > /dev/null
pip3 install protobuf bsdiff4 six crypto construct google docopt pycryptodome > /dev/null

echo "pycryptodome
docopt
protobuf<=3.20.1" > requirements.txt
pip3 install -r requirements.txt > /dev/null

Likk="$GITHUB_WORKSPACE"
ListTM="tmp
Unpack
Repapk
Unzip
Payload
Super
"
for Vak in $ListTM; do
mkdir -p $Vak
done

echo "- Tải tập tin"
Taive() { curl -s -L "$1" -o "$2"; }
Xem() { curl -s -L -G "$@"; }
Laylink() { grep -m1 "$1://" $Likk/Zom_custom.md; } 

echo " Tìm tên rom" 
Tenrom=$(grep -m1 "https://" $Likk/Zom_custom.md | awk -F/ '{print $5}') && Dinhdang=$(echo $Tenrom | awk -F. '{print $NF}');
echo "
$Tenrom 
$Dinhdang
"

echo " Tải về"
Taive "$(Laylink https)" "$Likk/$Tenrom" 

echo "Kiểm tra định dạng"
[[ "$Dinhdang" == "zip" ]] && unzip -qo "$Likk/$Tenrom" -d "$Likk/Unzip"
[[ "$Dinhdang" == "tgz" ]] && tar -cf "$Likk/$Tenrom" -C "$Likk/Unzip"
[[ -s $Likk/Unzip/images/super.img ]] && mv -f $Likk/Unzip/images/super.img $Likk/Unzip/super.img 
echo "Xong"
