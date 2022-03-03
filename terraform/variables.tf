variable "ecs_task_def_memory" {
  type          = number
  description   = "ECS task definition memory"
  default       = 512
}

variable "ecs_task_def_cpu" {
  type          = number
  description   = "ECS task definition cpu"
  default       = 256
}

variable "ecs_service_desired_count" {
  type          = number
  description   = "ECS service desired task count"
  default       = 2
}

variable "lb_container_port" {
  type          = number
  description   = "Container port"
  default       = 5637
}