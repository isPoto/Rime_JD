cp -rf ../../rime/xkjd6.cizu.dict.yaml ../BackDict/
cp -rf ../../rime/xkjd6.danzi.dict.yaml ../BackDict/
cp -rf ../../rime/xkjd6.yingwen.dict.yaml ../BackDict/
cp -rf ../../rime/xkjd6.wxw.dict.yaml ../BackDict/
cp -rf ../../rime/xkjd6.buchong.dict.yaml ../BackDict/
git add ../BackDict/*
git commit -m "更新：备份旧词库"
echo 开始处理排序
sort -t $'\t' -k 2 cizu.txt > xkjd6.cizu.dict.yaml
sort -t $'\t' -k 2 danzi.txt > xkjd6.danzi.dict.yaml
sort -t $'\t' -k 2 yingwen.txt > xkjd6.yingwen.dict.yaml
sort -t $'\t' -k 2 wxw.txt > xkjd6.wxw.dict.yaml
# 补充码表不可重新排序 sort -t $'\t' -k 2 buchong.txt > xkjd6.buchong.dict.yaml
cp -rf buchong.txt ./xkjd6.buchong.dict.yaml

cp -rf xkjd6.buchong.dict.yaml ./buchong.txt
cp -rf xkjd6.cizu.dict.yaml ./cizu.txt
cp -rf xkjd6.danzi.dict.yaml ./danzi.txt
cp -rf xkjd6.yingwen.dict.yaml ./yingwen.txt
cp -rf xkjd6.wxw.dict.yaml ./wxw.txt
cp -rf xkjd6.buchong.dict.yaml ./buchong.txt
echo 更为当前文件
sed -i 's/\b并不比\b\tbbb\b/---\nname: xkjd6.cizu\nversion: "Q1"\nsort: original\n...\n&/' xkjd6.cizu.dict.yaml
sed -i 's/\b不\b\tb\b/---\nname: xkjd6.danzi\nversion: "Q1"\nsort: original\n...\n&/' xkjd6.danzi.dict.yaml
sed -i 's/\bbiangbiang面\b\tbbmmu\b/---\nname: xkjd6.yingwen\nversion: "Q1"\nsort: original\n...\n&/' xkjd6.yingwen.dict.yaml
sed -i 's/\不能\b\tba\b/---\nname: xkjd6.wxw\nversion: "Q1"\nsort: original\n...\n&/' xkjd6.wxw.dict.yaml
sed -i 's/\那\b\ta\b/---\nname: xkjd6.buchong\nversion: "Q1"\nsort: original\n...\n&/' xkjd6.buchong.dict.yaml
echo 执行排序添加头部信息完成
cp -rf xkjd6.cizu.dict.yaml ../../rime/
cp -rf xkjd6.danzi.dict.yaml ../../rime/
cp -rf xkjd6.yingwen.dict.yaml ../../rime/
cp -rf xkjd6.wxw.dict.yaml ../../rime/
cp -rf xkjd6.buchong.dict.yaml ../../rime/
echo 已放置到主词库中
