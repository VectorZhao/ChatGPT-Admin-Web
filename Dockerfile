# 使用官方 Node.js 镜像作为基础镜像
FROM node:latest

# 将工作目录设置为 /app
WORKDIR /

# 将项目文件复制到工作目录中
COPY . /

# 将.env文件复制到/apps/chat目录

COPY .env /apps/chat/

# 进入/apps/chat目录
RUN cd /apps/chat

# 安装项目依赖
RUN npm install -g pnpm
RUN pnpm install
RUN npm install -g typescript
RUN npm install -g docusaurus


# 编译项目
RUN npx turbo run build

# 暴露端口 3000
EXPOSE 3000

# 启动项目
CMD ["yarn", "start"]
