# This module is now located at <https://registry.terraform.io/modules/OmniTeqSource/helm-release/flux/latest>

<!--- start terraform-docs --->

## Requirements

| Name                                                                        | Version           |
| --------------------------------------------------------------------------- | ----------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.4.1, < 3.0.0 |

## Providers

| Name                                                                  | Version           |
| --------------------------------------------------------------------- | ----------------- |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | >= 2.4.1, < 3.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                    | Type     |
| ----------------------------------------------------------------------------------------------------------------------- | -------- |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name                                                                              | Description                                       | Type     | Default         | Required |
| --------------------------------------------------------------------------------- | ------------------------------------------------- | -------- | --------------- | :------: |
| <a name="input_chart"></a> [chart](#input_chart)                                  | Name of, or path to the chart                     | `string` | n/a             |   yes    |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version)          | Version of the chart                              | `string` | `"*"`           |    no    |
| <a name="input_interval"></a> [interval](#input_interval)                         | Interval to check the repo for reconciliation     | `string` | `null`          |    no    |
| <a name="input_name"></a> [name](#input_name)                                     | Name of the release                               | `string` | n/a             |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                      | Namespace the release belongs to(not deployed to) | `string` | `"flux-system"` |    no    |
| <a name="input_source_name"></a> [source_name](#input_source_name)                | HelmRepository or GitRepository source name       | `string` | n/a             |   yes    |
| <a name="input_source_namespace"></a> [source_namespace](#input_source_namespace) | Namespace of the source repository                | `string` | `null`          |    no    |
| <a name="input_values"></a> [values](#input_values)                               | Values to apply to the release                    | `any`    | `null`          |    no    |

## Outputs

| Name                                                        | Description |
| ----------------------------------------------------------- | ----------- |
| <a name="output_manifest"></a> [manifest](#output_manifest) | n/a         |
