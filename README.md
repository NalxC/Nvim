#  Nvim configuration

### Install

```sh
git clone https://github.com/NalxC/Nvim.git ~/.config/nvim
```
### Usage

`lua/config/...` 自定义基础配置

`lua/plugin/...` 添加和修改插件

### Todo

### Tip

- Lazy.nvim ： 当某个插件重复多次写入spec时，lazy会自动把多项配置参数合并成一份，除了config。由此我修改了插件加载方案，分化出module模块，定制不同语言特有的配置，可以按需求加载。
