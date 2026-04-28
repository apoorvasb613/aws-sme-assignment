resource "aws_s3_bucket" "website" {
  bucket = "foodapp-website-demo-12345"
}
resource "aws_s3_bucket_website_configuration" "website_hosting" {

  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

}
resource "aws_s3_bucket" "images" {
  bucket = "foodapp-images-demo-12345"
}
