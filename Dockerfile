# ---- Build Angular App ----
    FROM node:18 AS build

    WORKDIR /app
    COPY package*.json ./
    RUN npm install
    COPY . .
    RUN npm run build --prod
    
    # ---- Chạy Angular bằng serve ----
    FROM node:18
    
    WORKDIR /app
    RUN npm install -g serve
    
    # Copy build từ step trước vào container
    COPY --from=build /app/dist /app/dist
    
    # Mở cổng 8081
    EXPOSE 8081
    
    # Chạy ứng dụng bằng serve trên port 8081
    CMD ["serve", "-s", "dist/my-angular-app", "-l", "8081"]
    