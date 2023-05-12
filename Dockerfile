# 使用官方 Node.js 镜像作为基础镜像
FROM node:latest

# 将工作目录设置为 /app
WORKDIR .

# 将项目文件复制到工作目录中
COPY . /app

# 进入/app/apps/chat目录
cd 

# 安装项目依赖
RUN npm install -g pnpm yarn
RUN pnpm install


# 设置环境变量
COPY .env.example /app

# 编译项目
RUN yarn build



# 暴露端口 3000
EXPOSE 3000

# 启动项目
CMD ["yarn", "start"]
