resource "aws_route_table_association" "publicassociation" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.public_subnet_routeTable.id  
}