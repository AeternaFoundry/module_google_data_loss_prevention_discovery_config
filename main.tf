resource "google_data_loss_prevention_discovery_config" "data_loss_prevention_discovery_configs" {
  for_each = var.data_loss_prevention_discovery_configs

  location          = each.value.location
  parent            = each.value.parent
  deletion_policy   = each.value.deletion_policy
  display_name      = each.value.display_name
  inspect_templates = each.value.inspect_templates
  status            = each.value.status

  dynamic "actions" {
    for_each = each.value.actions != null ? each.value.actions : []
    content {
      dynamic "export_data" {
        for_each = actions.value.export_data != null ? [actions.value.export_data] : []
        content {
          dynamic "profile_table" {
            for_each = export_data.value.profile_table != null ? [export_data.value.profile_table] : []
            content {
              dataset_id = profile_table.value.dataset_id
              project_id = profile_table.value.project_id
              table_id   = profile_table.value.table_id
            }
          }
          dynamic "sample_findings_table" {
            for_each = export_data.value.sample_findings_table != null ? [export_data.value.sample_findings_table] : []
            content {
              dataset_id = sample_findings_table.value.dataset_id
              project_id = sample_findings_table.value.project_id
              table_id   = sample_findings_table.value.table_id
            }
          }
        }
      }
      dynamic "pub_sub_notification" {
        for_each = actions.value.pub_sub_notification != null ? [actions.value.pub_sub_notification] : []
        content {
          detail_of_message = pub_sub_notification.value.detail_of_message
          event             = pub_sub_notification.value.event
          dynamic "pubsub_condition" {
            for_each = pub_sub_notification.value.pubsub_condition != null ? [pub_sub_notification.value.pubsub_condition] : []
            content {
              dynamic "expressions" {
                for_each = pubsub_condition.value.expressions != null ? [pubsub_condition.value.expressions] : []
                content {
                  dynamic "conditions" {
                    for_each = expressions.value.conditions != null ? expressions.value.conditions : []
                    content {
                      minimum_risk_score        = conditions.value.minimum_risk_score
                      minimum_sensitivity_score = conditions.value.minimum_sensitivity_score
                    }
                  }
                  logical_operator = expressions.value.logical_operator
                }
              }
            }
          }
          topic = pub_sub_notification.value.topic
        }
      }
      dynamic "publish_to_chronicle" {
        for_each = actions.value.publish_to_chronicle != null ? [actions.value.publish_to_chronicle] : []
        content {
        }
      }
      dynamic "publish_to_dataplex_catalog" {
        for_each = actions.value.publish_to_dataplex_catalog != null ? [actions.value.publish_to_dataplex_catalog] : []
        content {
        }
      }
      dynamic "publish_to_scc" {
        for_each = actions.value.publish_to_scc != null ? [actions.value.publish_to_scc] : []
        content {
        }
      }
      dynamic "tag_resources" {
        for_each = actions.value.tag_resources != null ? [actions.value.tag_resources] : []
        content {
          lower_data_risk_to_low     = tag_resources.value.lower_data_risk_to_low
          profile_generations_to_tag = tag_resources.value.profile_generations_to_tag
          dynamic "tag_conditions" {
            for_each = tag_resources.value.tag_conditions != null ? tag_resources.value.tag_conditions : []
            content {
              dynamic "sensitivity_score" {
                for_each = tag_conditions.value.sensitivity_score != null ? [tag_conditions.value.sensitivity_score] : []
                content {
                  score = sensitivity_score.value.score
                }
              }
              dynamic "tag" {
                for_each = tag_conditions.value.tag != null ? [tag_conditions.value.tag] : []
                content {
                  namespaced_value = tag.value.namespaced_value
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "org_config" {
    for_each = each.value.org_config != null ? [each.value.org_config] : []
    content {
      dynamic "location" {
        for_each = org_config.value.location != null ? [org_config.value.location] : []
        content {
          folder_id       = location.value.folder_id
          organization_id = location.value.organization_id
        }
      }
      project_id = org_config.value.project_id
    }
  }

  dynamic "other_cloud_starting_location" {
    for_each = each.value.other_cloud_starting_location != null ? [each.value.other_cloud_starting_location] : []
    content {
      dynamic "aws_location" {
        for_each = other_cloud_starting_location.value.aws_location != null ? [other_cloud_starting_location.value.aws_location] : []
        content {
          account_id                 = aws_location.value.account_id
          all_asset_inventory_assets = aws_location.value.all_asset_inventory_assets
        }
      }
    }
  }

  dynamic "targets" {
    for_each = each.value.targets != null ? each.value.targets : []
    content {
      dynamic "big_query_target" {
        for_each = targets.value.big_query_target != null ? [targets.value.big_query_target] : []
        content {
          dynamic "cadence" {
            for_each = big_query_target.value.cadence != null ? [big_query_target.value.cadence] : []
            content {
              dynamic "inspect_template_modified_cadence" {
                for_each = cadence.value.inspect_template_modified_cadence != null ? [cadence.value.inspect_template_modified_cadence] : []
                content {
                  frequency = inspect_template_modified_cadence.value.frequency
                }
              }
              refresh_frequency = cadence.value.refresh_frequency
              dynamic "schema_modified_cadence" {
                for_each = cadence.value.schema_modified_cadence != null ? [cadence.value.schema_modified_cadence] : []
                content {
                  frequency = schema_modified_cadence.value.frequency
                  types     = schema_modified_cadence.value.types
                }
              }
              dynamic "table_modified_cadence" {
                for_each = cadence.value.table_modified_cadence != null ? [cadence.value.table_modified_cadence] : []
                content {
                  frequency = table_modified_cadence.value.frequency
                  types     = table_modified_cadence.value.types
                }
              }
            }
          }
          dynamic "conditions" {
            for_each = big_query_target.value.conditions != null ? [big_query_target.value.conditions] : []
            content {
              created_after = conditions.value.created_after
              dynamic "or_conditions" {
                for_each = conditions.value.or_conditions != null ? [conditions.value.or_conditions] : []
                content {
                  min_age       = or_conditions.value.min_age
                  min_row_count = or_conditions.value.min_row_count
                }
              }
              type_collection = conditions.value.type_collection
              dynamic "types" {
                for_each = conditions.value.types != null ? [conditions.value.types] : []
                content {
                  types = types.value.types
                }
              }
            }
          }
          dynamic "disabled" {
            for_each = big_query_target.value.disabled != null ? [big_query_target.value.disabled] : []
            content {
            }
          }
          dynamic "filter" {
            for_each = big_query_target.value.filter != null ? [big_query_target.value.filter] : []
            content {
              dynamic "other_tables" {
                for_each = filter.value.other_tables != null ? [filter.value.other_tables] : []
                content {
                }
              }
              dynamic "table_reference" {
                for_each = filter.value.table_reference != null ? [filter.value.table_reference] : []
                content {
                  dataset_id = table_reference.value.dataset_id
                  project_id = table_reference.value.project_id
                  table_id   = table_reference.value.table_id
                }
              }
              dynamic "tables" {
                for_each = filter.value.tables != null ? [filter.value.tables] : []
                content {
                  dynamic "include_regexes" {
                    for_each = tables.value.include_regexes != null ? [tables.value.include_regexes] : []
                    content {
                      dynamic "patterns" {
                        for_each = include_regexes.value.patterns != null ? include_regexes.value.patterns : []
                        content {
                          dataset_id_regex = patterns.value.dataset_id_regex
                          project_id_regex = patterns.value.project_id_regex
                          table_id_regex   = patterns.value.table_id_regex
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      dynamic "cloud_sql_target" {
        for_each = targets.value.cloud_sql_target != null ? [targets.value.cloud_sql_target] : []
        content {
          dynamic "conditions" {
            for_each = cloud_sql_target.value.conditions != null ? [cloud_sql_target.value.conditions] : []
            content {
              database_engines = conditions.value.database_engines
              types            = conditions.value.types
            }
          }
          dynamic "disabled" {
            for_each = cloud_sql_target.value.disabled != null ? [cloud_sql_target.value.disabled] : []
            content {
            }
          }
          filter {
            dynamic "collection" {
              for_each = cloud_sql_target.value.filter.collection != null ? [cloud_sql_target.value.filter.collection] : []
              content {
                dynamic "include_regexes" {
                  for_each = collection.value.include_regexes != null ? [collection.value.include_regexes] : []
                  content {
                    dynamic "patterns" {
                      for_each = include_regexes.value.patterns != null ? include_regexes.value.patterns : []
                      content {
                        database_regex               = patterns.value.database_regex
                        database_resource_name_regex = patterns.value.database_resource_name_regex
                        instance_regex               = patterns.value.instance_regex
                        project_id_regex             = patterns.value.project_id_regex
                      }
                    }
                  }
                }
              }
            }
            dynamic "database_resource_reference" {
              for_each = cloud_sql_target.value.filter.database_resource_reference != null ? [cloud_sql_target.value.filter.database_resource_reference] : []
              content {
                database          = database_resource_reference.value.database
                database_resource = database_resource_reference.value.database_resource
                instance          = database_resource_reference.value.instance
                project_id        = database_resource_reference.value.project_id
              }
            }
            dynamic "others" {
              for_each = cloud_sql_target.value.filter.others != null ? [cloud_sql_target.value.filter.others] : []
              content {
              }
            }
          }
          dynamic "generation_cadence" {
            for_each = cloud_sql_target.value.generation_cadence != null ? [cloud_sql_target.value.generation_cadence] : []
            content {
              dynamic "inspect_template_modified_cadence" {
                for_each = generation_cadence.value.inspect_template_modified_cadence != null ? [generation_cadence.value.inspect_template_modified_cadence] : []
                content {
                  frequency = inspect_template_modified_cadence.value.frequency
                }
              }
              refresh_frequency = generation_cadence.value.refresh_frequency
              dynamic "schema_modified_cadence" {
                for_each = generation_cadence.value.schema_modified_cadence != null ? [generation_cadence.value.schema_modified_cadence] : []
                content {
                  frequency = schema_modified_cadence.value.frequency
                  types     = schema_modified_cadence.value.types
                }
              }
            }
          }
        }
      }
      dynamic "cloud_storage_target" {
        for_each = targets.value.cloud_storage_target != null ? [targets.value.cloud_storage_target] : []
        content {
          dynamic "conditions" {
            for_each = cloud_storage_target.value.conditions != null ? [cloud_storage_target.value.conditions] : []
            content {
              dynamic "cloud_storage_conditions" {
                for_each = conditions.value.cloud_storage_conditions != null ? [conditions.value.cloud_storage_conditions] : []
                content {
                  included_bucket_attributes = cloud_storage_conditions.value.included_bucket_attributes
                  included_object_attributes = cloud_storage_conditions.value.included_object_attributes
                }
              }
              created_after = conditions.value.created_after
              min_age       = conditions.value.min_age
            }
          }
          dynamic "disabled" {
            for_each = cloud_storage_target.value.disabled != null ? [cloud_storage_target.value.disabled] : []
            content {
            }
          }
          filter {
            dynamic "cloud_storage_resource_reference" {
              for_each = cloud_storage_target.value.filter.cloud_storage_resource_reference != null ? [cloud_storage_target.value.filter.cloud_storage_resource_reference] : []
              content {
                bucket_name = cloud_storage_resource_reference.value.bucket_name
                project_id  = cloud_storage_resource_reference.value.project_id
              }
            }
            dynamic "collection" {
              for_each = cloud_storage_target.value.filter.collection != null ? [cloud_storage_target.value.filter.collection] : []
              content {
                dynamic "include_regexes" {
                  for_each = collection.value.include_regexes != null ? [collection.value.include_regexes] : []
                  content {
                    dynamic "patterns" {
                      for_each = include_regexes.value.patterns != null ? include_regexes.value.patterns : []
                      content {
                        dynamic "cloud_storage_regex" {
                          for_each = patterns.value.cloud_storage_regex != null ? [patterns.value.cloud_storage_regex] : []
                          content {
                            bucket_name_regex = cloud_storage_regex.value.bucket_name_regex
                            project_id_regex  = cloud_storage_regex.value.project_id_regex
                          }
                        }
                      }
                    }
                  }
                }
                dynamic "include_tags" {
                  for_each = collection.value.include_tags != null ? [collection.value.include_tags] : []
                  content {
                    dynamic "tag_filters" {
                      for_each = include_tags.value.tag_filters != null ? include_tags.value.tag_filters : []
                      content {
                        namespaced_tag_key   = tag_filters.value.namespaced_tag_key
                        namespaced_tag_value = tag_filters.value.namespaced_tag_value
                      }
                    }
                  }
                }
              }
            }
            dynamic "others" {
              for_each = cloud_storage_target.value.filter.others != null ? [cloud_storage_target.value.filter.others] : []
              content {
              }
            }
          }
          dynamic "generation_cadence" {
            for_each = cloud_storage_target.value.generation_cadence != null ? [cloud_storage_target.value.generation_cadence] : []
            content {
              dynamic "inspect_template_modified_cadence" {
                for_each = generation_cadence.value.inspect_template_modified_cadence != null ? [generation_cadence.value.inspect_template_modified_cadence] : []
                content {
                  frequency = inspect_template_modified_cadence.value.frequency
                }
              }
              refresh_frequency = generation_cadence.value.refresh_frequency
            }
          }
        }
      }
      dynamic "other_cloud_target" {
        for_each = targets.value.other_cloud_target != null ? [targets.value.other_cloud_target] : []
        content {
          dynamic "conditions" {
            for_each = other_cloud_target.value.conditions != null ? [other_cloud_target.value.conditions] : []
            content {
              dynamic "amazon_s3_bucket_conditions" {
                for_each = conditions.value.amazon_s3_bucket_conditions != null ? [conditions.value.amazon_s3_bucket_conditions] : []
                content {
                  bucket_types           = amazon_s3_bucket_conditions.value.bucket_types
                  object_storage_classes = amazon_s3_bucket_conditions.value.object_storage_classes
                }
              }
              min_age = conditions.value.min_age
            }
          }
          dynamic "data_source_type" {
            for_each = other_cloud_target.value.data_source_type != null ? [other_cloud_target.value.data_source_type] : []
            content {
              data_source = data_source_type.value.data_source
            }
          }
          dynamic "disabled" {
            for_each = other_cloud_target.value.disabled != null ? [other_cloud_target.value.disabled] : []
            content {
            }
          }
          filter {
            dynamic "collection" {
              for_each = other_cloud_target.value.filter.collection != null ? [other_cloud_target.value.filter.collection] : []
              content {
                dynamic "include_regexes" {
                  for_each = collection.value.include_regexes != null ? [collection.value.include_regexes] : []
                  content {
                    dynamic "patterns" {
                      for_each = include_regexes.value.patterns != null ? include_regexes.value.patterns : []
                      content {
                        dynamic "amazon_s3_bucket_regex" {
                          for_each = patterns.value.amazon_s3_bucket_regex != null ? [patterns.value.amazon_s3_bucket_regex] : []
                          content {
                            dynamic "aws_account_regex" {
                              for_each = amazon_s3_bucket_regex.value.aws_account_regex != null ? [amazon_s3_bucket_regex.value.aws_account_regex] : []
                              content {
                                account_id_regex = aws_account_regex.value.account_id_regex
                              }
                            }
                            bucket_name_regex = amazon_s3_bucket_regex.value.bucket_name_regex
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            dynamic "others" {
              for_each = other_cloud_target.value.filter.others != null ? [other_cloud_target.value.filter.others] : []
              content {
              }
            }
            dynamic "single_resource" {
              for_each = other_cloud_target.value.filter.single_resource != null ? [other_cloud_target.value.filter.single_resource] : []
              content {
                dynamic "amazon_s3_bucket" {
                  for_each = single_resource.value.amazon_s3_bucket != null ? [single_resource.value.amazon_s3_bucket] : []
                  content {
                    dynamic "aws_account" {
                      for_each = amazon_s3_bucket.value.aws_account != null ? [amazon_s3_bucket.value.aws_account] : []
                      content {
                        account_id = aws_account.value.account_id
                      }
                    }
                    bucket_name = amazon_s3_bucket.value.bucket_name
                  }
                }
              }
            }
          }
          dynamic "generation_cadence" {
            for_each = other_cloud_target.value.generation_cadence != null ? [other_cloud_target.value.generation_cadence] : []
            content {
              dynamic "inspect_template_modified_cadence" {
                for_each = generation_cadence.value.inspect_template_modified_cadence != null ? [generation_cadence.value.inspect_template_modified_cadence] : []
                content {
                  frequency = inspect_template_modified_cadence.value.frequency
                }
              }
              refresh_frequency = generation_cadence.value.refresh_frequency
            }
          }
        }
      }
      dynamic "secrets_target" {
        for_each = targets.value.secrets_target != null ? [targets.value.secrets_target] : []
        content {
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

