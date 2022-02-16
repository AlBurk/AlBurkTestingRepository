#Product reader
output test_example_id {
  value       = module.test_example.codebuild_id
  description = "test_example project id"
}

output test_example_arn {
  value       = module.test_example.codebuild_arn
  description = "test_example project arn"
}

output test_example_payload_url {
  value       = module.test_example.*.codebuild_with_filters_payload_url
  description = "test_example webhook url"
}

output test_example_secret {
  value       = module.test_example.*.codebuild_with_filters_secret
  description = "test_example secret for webhook"
  sensitive   = true
}
