# Use the official .NET SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY ["AWSLambdaHelloWorld/AWSLambdaHelloWorld.csproj", "AWSLambdaHelloWorld/"]
RUN dotnet restore "AWSLambdaHelloWorld/AWSLambdaHelloWorld.csproj"

# Copy the rest of the application code
COPY ["AWSLambdaHelloWorld/", "AWSLambdaHelloWorld/"]

# Build and publish the application
WORKDIR "/src/AWSLambdaHelloWorld"
RUN dotnet publish "AWSLambdaHelloWorld.csproj" -c Release -o /app/publish

# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Expose port 80 to the outside world
EXPOSE 80

# Set the entry point to the application
ENTRYPOINT ["dotnet", "AWSLambdaHelloWorld.dll"]
