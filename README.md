# Static Website Hosting on AWS with CloudFront and Route 53
This project demonstrates how to host a static website on AWS S3 with a custom domain, leveraging CloudFront for Content Delivery Network (CDN) optimization, Route 53 for DNS routing, and AWS Certificate Manager (ACM) for secure HTTPS access.
![architecture](https://github.com/user-attachments/assets/a0ecdefc-8869-45cf-a088-4335f884df5e)

## Architecture Components

 ##### Amazon S3 (Static Website Hosting)
  The static website files are hosted on an S3 bucket configured for static website hosting.
  Bucket policies are implemented to allow public access to the required objects.

 #####  Amazon CloudFront (CDN)
  CloudFront is configured as the CDN to cache content globally and serve it with low latency.
  A custom domain is set up with SSL/TLS certificates from ACM for secure connections.

  ##### AWS Certificate Manager (ACM)
  SSL/TLS certificates are provisioned for the custom domain to enable HTTPS traffic.

  ##### Amazon Route 53 (DNS)
  Route 53 manages the domain name and provides an alias record to route traffic to CloudFront.

## Workflow

    Users access the website using the custom domain name.
    Route 53 resolves the domain to the CloudFront distribution.
    CloudFront retrieves the requested content from the S3 bucket or its global edge locations for cached files.
    The static files are served securely over HTTPS with optimized performance.

## Benefits

    High Availability: CloudFront ensures global content delivery with edge locations.
    Secure Connection: ACM provides SSL certificates for HTTPS.
    Scalability: S3 supports virtually unlimited scaling for static file hosting.
    Cost Efficiency: Only pay for what you use with AWS services.

## How to Use

    Clone this repository.
    Update the Terraform files with your domain name and desired S3 bucket name.
    Deploy the infrastructure using Terraform.
    Upload your static website files to the S3 bucket.

## Technologies Used

    Amazon S3
    Amazon CloudFront
    Amazon Route 53
    AWS Certificate Manager (ACM)
    Terraform

