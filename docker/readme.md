# Docker相关的脚本

rm_image.sh 快速删除镜像及其容器, 包括`<none>`镜像

```bash
# 删除普通镜像
rm_image.sh beginman/redis-primary
rm image:beginman/redis-primary
docker image: c630f5c93588
f450136a2a5d
Untagged: beginman/redis-primary:latest
Deleted: sha256:c630f5c93588c1298b0ff4cd60ae1c4f8409fe37a0765edf306ed0c382d5a095
Deleted: sha256:1aadd1c0567a8ef588385988a78794f5a0a6f7f8bdd25fd4914b66f714be7792
删除成功!

# 删除none镜像
rm_image.sh none
...
```

rm_all_images.sh 删除所有镜像

```bash
./rm_all_images.sh
```

