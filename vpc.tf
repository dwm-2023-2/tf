resource "aws_vpc" "dwm-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "dwm-vpc"
  }
}

resource "aws_subnet" "dwm-subnet-private" {
  vpc_id     = aws_vpc.dwm-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    name = "dwm-subnet"
  }
}

resource "aws_subnet" "dwm-subnet-public" {
  vpc_id     = aws_vpc.dwm-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    name = "dwm-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dwm-vpc.id
  tags = {
    name = "dwm-igw"
  }

}
