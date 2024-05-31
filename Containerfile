# You can also pull these images from DockerHub amazon/aws-lambda-dotnet:8
FROM public.ecr.aws/lambda/dotnet:8

# Copy function code to Lambda-defined environment variable
COPY . ${LAMBDA_TASK_ROOT}

# Set the entrypoint to the bootstrap
CMD [ "AWSLambda1::AWSLambda1.Function::FunctionHandler" ]
