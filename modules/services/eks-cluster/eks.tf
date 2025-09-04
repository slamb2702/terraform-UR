
# control plane
resource "aws_eks_cluster" "cluster" {
  name     = var.name
  role_arn = aws_iam_role.cluster.arn
  version  = "1.32"

  vpc_config {
    subnet_ids = data.aws_subnets.default.ids
  }

  # Ensure that the IAM Role permissions are created before and deleted after
  # the EKS cluster, EKS will not be able to properly delete 
  # EKS Managed ECS infra such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}

# worker nodes
resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.name
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = data.aws_subnets.default.ids
  instance_types  = var.instance_types

  scaling_config {
    min_size     = var.min_size
    max_size     = var.max_size
    desired_size = var.desired_size
  }

  # Ensure that the IAM Role permissions are created before and deleted after
  # the EKS cluster, EKS will not be able to properly delete 
  # EKS Managed ECS infra such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
  ]
}

