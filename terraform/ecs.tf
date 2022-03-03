
resource "aws_ecs_cluster" "ecs_timeoff" {
    name = "ecs-timeoff-app"
}

resource "aws_ecs_task_definition" "ecs_task_timeoff" {
    family                   = "ecs-task-family-timeoff-app"
    container_definitions    = file("container-definitions/container-def.json")
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    memory                   = var.ecs_task_def_memory
    cpu                      = var.ecs_task_def_cpu
    execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
}