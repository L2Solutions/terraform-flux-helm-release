<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.4.1, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.4.1, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart"></a> [chart](#input\_chart) | Name of, or path to the chart | `string` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the chart | `string` | `"*"` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | Interval to check the repo for reconciliation | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the release | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace the release belongs to(not deployed to) | `string` | `"flux-system"` | no |
| <a name="input_source_name"></a> [source\_name](#input\_source\_name) | HelmRepository or GitRepository source name | `string` | n/a | yes |
| <a name="input_source_namespace"></a> [source\_namespace](#input\_source\_namespace) | Namespace of the source repository | `string` | `null` | no |
| <a name="input_values"></a> [values](#input\_values) | Values to apply to the release | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manifest"></a> [manifest](#output\_manifest) | n/a |
<!-- END_TF_DOCS -->
