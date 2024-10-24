FROM ubuntu:noble
ENV TZ="Europe/Dublin"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y npm
RUN mkdir /app
WORKDIR /app
RUN npm init -y -f
COPY ./ /app/
RUN npm install ai
RUN npm install ollama-ai-provider
RUN npx create-next-app@latest ollamafe --app --yes
COPY actions.ts /app/ollamafe/app/actions.ts
COPY page.tsx /app/ollamafe/app/page.tsx
RUN cd /app/ollamafe/ && npm run dev &
EXPOSE 3000
