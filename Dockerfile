# ---- Step 1: Build Angular App ----
    FROM node:18 AS build

    # Đặt thư mục làm việc
    WORKDIR /app
    
    # Copy file package.json và package-lock.json trước để cache layer dependencies
    COPY package*.json ./
    
    # Cài đặt dependencies
    RUN npm install
    
    # Copy toàn bộ code vào container
    COPY . .
    
    # Build Angular app
    RUN npm run build --prod
    
    # ---- Step 2: Run với Nginx ----
    FROM nginx:alpine
    
    # Copy file build từ step trước vào thư mục Nginx
    COPY --from=build /app/dist /usr/share/nginx/html
    
    # Copy file config Nginx tùy chỉnh (nếu có)
    COPY nginx.conf /etc/nginx/conf.d/default.conf
    
    # Mở cổng 80 cho ứng dụng
    EXPOSE 80
    
    # Chạy Nginx
    CMD ["nginx", "-g", "daemon off;"]
    