
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

resource "aws_ecs_service" "ecs_service_timeoff" {
    name            = "ecs-service-timeoff-app"
    cluster         = "${aws_ecs_cluster.ecs_timeoff.id}"
    task_definition = "${aws_ecs_task_definition.ecs_task_timeoff.arn}"
    launch_type     = "FARGATE"
    desired_count   = var.desired_tasks

    network_configuration {
        subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
        assign_public_ip = true
    }
}