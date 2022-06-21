# Terraform Flux Helm Release Module

This module applies a `flux` `HelmRelease` custom resource using the Terraform `helm` provider and its `helm_release` resource. Using the `helm` provider allows for installing `flux` and configuring custom resources for it in one apply.

## Chart Sources

The following modules may be used as sources:

[terraform-flux-helm-repository](https://registry.terraform.io/modules/Skyfjall/helm-repository/flux/latest)

[terraform-flux-git-repository](https://registry.terraform.io/modules/Skyfjall/git-repository/flux/latest)

## Additional Flux Module Resources

The below modules provide support for installation and individual configuration of `fluxcd` Custom Resources:

[Flux Install Module - terraform-flux-install](https://registry.terraform.io/modules/Skyfjall/install/flux/latest)

[Flux HelmRepository Module - terraform-flux-helm-repository](https://registry.terraform.io/modules/Skyfjall/helm-repository/flux/latest)

[Flux GitRepository Module - terraform-flux-git-repository](https://registry.terraform.io/modules/Skyfjall/git-repository/flux/latest)

[Flux Kustomization Module - terraform-flux-kustomization](https://registry.terraform.io/modules/Skyfjall/kustomization/flux/latest)

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                        | Version           |
| --------------------------------------------------------------------------- | ----------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0, < 2.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement_helm)                   | >= 2.5.1, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="requirement_random"></a> [random](#requirement_random)             | >= 3.1.3, < 4.0.0 |

## Providers

| Name                                                      | Version           |
| --------------------------------------------------------- | ----------------- |
| <a name="provider_helm"></a> [helm](#provider_helm)       | >= 2.5.1, < 3.0.0 |
| <a name="provider_random"></a> [random](#provider_random) | >= 3.1.3, < 4.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                        | Type     |
| ----------------------------------------------------------------------------------------------------------- | -------- |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)   | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name                                                                     | Description                                                                          | Type                                                                                                      | Default         | Required |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- | --------------- | :------: |
| <a name="input_chart"></a> [chart](#input_chart)                         | Name of, or path to the chart                                                        | `string`                                                                                                  | n/a             |   yes    |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version) | Version of the chart                                                                 | `string`                                                                                                  | `"*"`           |    no    |
| <a name="input_interval"></a> [interval](#input_interval)                | Interval to check the repo for reconciliation                                        | `string`                                                                                                  | `"5m0s"`        |    no    |
| <a name="input_name"></a> [name](#input_name)                            | Name of the release                                                                  | `string`                                                                                                  | n/a             |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)             | Namespace the release belongs to(not deployed to)                                    | `string`                                                                                                  | `"flux-system"` |    no    |
| <a name="input_random_suffix"></a> [random_suffix](#input_random_suffix) | Add a random alpha-numeric suffix to resource names(prevents helm release collision) | `bool`                                                                                                    | `true`          |    no    |
| <a name="input_source_ref"></a> [source_ref](#input_source_ref)          | Object containing source configuration                                               | <pre>object({<br> name = string<br> namespace = optional(string)<br> kind = optional(string)<br> })</pre> | n/a             |   yes    |
| <a name="input_values"></a> [values](#input_values)                      | Values to apply to the release                                                       | `any`                                                                                                     | `null`          |    no    |

## Outputs

| Name                                                           | Description                                |
| -------------------------------------------------------------- | ------------------------------------------ |
| <a name="output_manifest"></a> [manifest](#output_manifest)    | n/a                                        |
| <a name="output_name"></a> [name](#output_name)                | Name of the object with suffix(if enabled) |
| <a name="output_namespace"></a> [namespace](#output_namespace) | Namespace the object was applied to        |

<!-- END_TF_DOCS -->
