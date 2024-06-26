# # You can also pull these images from DockerHub amazon/aws-lambda-dotnet:8
# FROM public.ecr.aws/lambda/dotnet:8

# # Copy function code to Lambda-defined environment variable
# COPY . ${LAMBDA_TASK_ROOT}

# # Set the entrypoint to the bootstrap
# CMD [ "AWSLambda1::AWSLambda1.Function::FunctionHandler" ]


# Use the official .NET SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY *.csproj .
RUN dotnet restore

# Copy the rest of the application code
COPY . .

# Build the application
RUN dotnet publish -c Release -o /app/publish

# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Expose port 80
EXPOSE 80

# Entry point
ENTRYPOINT ["dotnet", "AWSLambdaHelloWorld.dll"]