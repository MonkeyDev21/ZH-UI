echo "- Chạy thử nghiệm lệnh"
echo
TOME="$GITHUB_WORKSPACE"
chmod -R 777 $TOME/.github/bin
e2fsdroid=$TOME/.github/bin/e2fsdroid
make_ext4fs=$TOME/.github/bin/make_ext4fs
Ten=system
Tam=$TOME/tam
New=$TOME/$Ten
mkdir -p $Tam 
mkdir -p $New
Tenfc=$TOME/.github/${Ten}_file_contexts
SizeM=$((5*1024))M
touch $New/test.txt

  #sudo $make_ext4fs -J -T 1230768000 -a '/' -l "$SizeM" -L '/' $TOME/tmp/$Ten.img $New/ 
#tune2fs -l $TOME/tmp/$Ten.img
  sudo mke2fs -O ^has_journal -L / -M / -t ext4 -b 4096 -I 256 -m 0 -E hash_alg=half_md4 -O dir_index,filetype,extent,sparse_super,large_file,huge_file,uninit_bg,dir_nlink,extra_isize -e continue -o +user_xattr -o +acl -l $TOME/tmp/$Ten.img 
tune2fs -l $TOME/tmp/$Ten.img
  sudo $e2fsdroid -T "1230768000" -a '/' -S "$Tenfc" -f "$New" $TOME/tmp/$Ten.img
tune2fs -l $TOME/tmp/$Ten.img
  #tune2fs -o +acl -L '/' -M '/' $TOME/tmp/$Ten.img
  #e2fsck -fy $TOME/tmp/$Ten.img 
  #tune2fs -E hash_alg=half_md4 -O dir_index,filetype,extent,sparse_super,large_file,huge_file,uninit_bg,dir_nlink,extra_isize -e continue -o +user_xattr $TOME/tmp/$Ten.img 
  sudo mount -o rw,loop $TOME/tmp/$Ten.img $Tam
  ls -l $Tam
  cd $TOME
  sudo umount -f $Tam
  tune2fs -l $TOME/tmp/$Ten.img 


