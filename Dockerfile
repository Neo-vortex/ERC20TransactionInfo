FROM mcr.hamdocker.ir/dotnet/sdk:7.0 AS build-env
WORKDIR /App

# Copy everything
COPY . .

# Restore as distinct layers
RUN dotnet restore

# Build and publish a release
RUN dotnet publish -c Release -o out

RUN apt update
RUN apt install python3 -y
WORKDIR ./out/wwwroot
ENTRYPOINT ["python3", "-m", "http.server"]
EXPOSE 8000
