variable "data_loss_prevention_discovery_configs" {
  description = <<EOT
Map of data_loss_prevention_discovery_configs, attributes below
Required:
    - location
    - parent
Optional:
    - deletion_policy
    - display_name
    - inspect_templates
    - status
    - actions (block):
        - export_data (optional, block):
            - profile_table (optional, block):
                - dataset_id (optional)
                - project_id (optional)
                - table_id (optional)
            - sample_findings_table (optional, block):
                - dataset_id (optional)
                - project_id (optional)
                - table_id (optional)
        - pub_sub_notification (optional, block):
            - detail_of_message (optional)
            - event (optional)
            - pubsub_condition (optional, block):
                - expressions (optional, block):
                    - conditions (optional, block):
                        - minimum_risk_score (optional)
                        - minimum_sensitivity_score (optional)
                    - logical_operator (optional)
            - topic (optional)
        - publish_to_chronicle (optional, block):
        - publish_to_dataplex_catalog (optional, block):
        - publish_to_scc (optional, block):
        - tag_resources (optional, block):
            - lower_data_risk_to_low (optional)
            - profile_generations_to_tag (optional)
            - tag_conditions (optional, block):
                - sensitivity_score (optional, block):
                    - score (required)
                - tag (optional, block):
                    - namespaced_value (optional)
    - org_config (block):
        - location (optional, block):
            - folder_id (optional)
            - organization_id (optional)
        - project_id (optional)
    - other_cloud_starting_location (block):
        - aws_location (optional, block):
            - account_id (optional)
            - all_asset_inventory_assets (optional)
    - targets (block):
        - big_query_target (optional, block):
            - cadence (optional, block):
                - inspect_template_modified_cadence (optional, block):
                    - frequency (optional)
                - refresh_frequency (optional)
                - schema_modified_cadence (optional, block):
                    - frequency (optional)
                    - types (optional)
                - table_modified_cadence (optional, block):
                    - frequency (optional)
                    - types (optional)
            - conditions (optional, block):
                - created_after (optional)
                - or_conditions (optional, block):
                    - min_age (optional)
                    - min_row_count (optional)
                - type_collection (optional)
                - types (optional, block):
                    - types (optional)
            - disabled (optional, block):
            - filter (optional, block):
                - other_tables (optional, block):
                - table_reference (optional, block):
                    - dataset_id (required)
                    - project_id (optional)
                    - table_id (required)
                - tables (optional, block):
                    - include_regexes (optional, block):
                        - patterns (optional, block):
                            - dataset_id_regex (optional)
                            - project_id_regex (optional)
                            - table_id_regex (optional)
        - cloud_sql_target (optional, block):
            - conditions (optional, block):
                - database_engines (optional)
                - types (optional)
            - disabled (optional, block):
            - filter (required, block):
                - collection (optional, block):
                    - include_regexes (optional, block):
                        - patterns (optional, block):
                            - database_regex (optional)
                            - database_resource_name_regex (optional)
                            - instance_regex (optional)
                            - project_id_regex (optional)
                - database_resource_reference (optional, block):
                    - database (required)
                    - database_resource (required)
                    - instance (required)
                    - project_id (required)
                - others (optional, block):
            - generation_cadence (optional, block):
                - inspect_template_modified_cadence (optional, block):
                    - frequency (required)
                - refresh_frequency (optional)
                - schema_modified_cadence (optional, block):
                    - frequency (optional)
                    - types (optional)
        - cloud_storage_target (optional, block):
            - conditions (optional, block):
                - cloud_storage_conditions (optional, block):
                    - included_bucket_attributes (optional)
                    - included_object_attributes (optional)
                - created_after (optional)
                - min_age (optional)
            - disabled (optional, block):
            - filter (required, block):
                - cloud_storage_resource_reference (optional, block):
                    - bucket_name (optional)
                    - project_id (optional)
                - collection (optional, block):
                    - include_regexes (optional, block):
                        - patterns (optional, block):
                            - cloud_storage_regex (optional, block):
                                - bucket_name_regex (optional)
                                - project_id_regex (optional)
                    - include_tags (optional, block):
                        - tag_filters (optional, block):
                            - namespaced_tag_key (optional)
                            - namespaced_tag_value (optional)
                - others (optional, block):
            - generation_cadence (optional, block):
                - inspect_template_modified_cadence (optional, block):
                    - frequency (optional)
                - refresh_frequency (optional)
        - other_cloud_target (optional, block):
            - conditions (optional, block):
                - amazon_s3_bucket_conditions (optional, block):
                    - bucket_types (optional)
                    - object_storage_classes (optional)
                - min_age (optional)
            - data_source_type (optional, block):
                - data_source (optional)
            - disabled (optional, block):
            - filter (required, block):
                - collection (optional, block):
                    - include_regexes (optional, block):
                        - patterns (optional, block):
                            - amazon_s3_bucket_regex (optional, block):
                                - aws_account_regex (optional, block):
                                    - account_id_regex (optional)
                                - bucket_name_regex (optional)
                - others (optional, block):
                - single_resource (optional, block):
                    - amazon_s3_bucket (optional, block):
                        - aws_account (optional, block):
                            - account_id (optional)
                        - bucket_name (optional)
            - generation_cadence (optional, block):
                - inspect_template_modified_cadence (optional, block):
                    - frequency (optional)
                - refresh_frequency (optional)
        - secrets_target (optional, block):
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location          = string
    parent            = string
    deletion_policy   = optional(string)
    display_name      = optional(string)
    inspect_templates = optional(list(string))
    status            = optional(string)
    actions = optional(list(object({
      export_data = optional(object({
        profile_table = optional(object({
          dataset_id = optional(string)
          project_id = optional(string)
          table_id   = optional(string)
        }))
        sample_findings_table = optional(object({
          dataset_id = optional(string)
          project_id = optional(string)
          table_id   = optional(string)
        }))
      }))
      pub_sub_notification = optional(object({
        detail_of_message = optional(string)
        event             = optional(string)
        pubsub_condition = optional(object({
          expressions = optional(object({
            conditions = optional(list(object({
              minimum_risk_score        = optional(string)
              minimum_sensitivity_score = optional(string)
            })))
            logical_operator = optional(string)
          }))
        }))
        topic = optional(string)
      }))
      publish_to_chronicle = optional(object({
      }))
      publish_to_dataplex_catalog = optional(object({
      }))
      publish_to_scc = optional(object({
      }))
      tag_resources = optional(object({
        lower_data_risk_to_low     = optional(bool)
        profile_generations_to_tag = optional(list(string))
        tag_conditions = optional(list(object({
          sensitivity_score = optional(object({
            score = string
          }))
          tag = optional(object({
            namespaced_value = optional(string)
          }))
        })))
      }))
    })))
    org_config = optional(object({
      location = optional(object({
        folder_id       = optional(string)
        organization_id = optional(string)
      }))
      project_id = optional(string)
    }))
    other_cloud_starting_location = optional(object({
      aws_location = optional(object({
        account_id                 = optional(string)
        all_asset_inventory_assets = optional(bool)
      }))
    }))
    targets = optional(list(object({
      big_query_target = optional(object({
        cadence = optional(object({
          inspect_template_modified_cadence = optional(object({
            frequency = optional(string)
          }))
          refresh_frequency = optional(string)
          schema_modified_cadence = optional(object({
            frequency = optional(string)
            types     = optional(list(string))
          }))
          table_modified_cadence = optional(object({
            frequency = optional(string)
            types     = optional(list(string))
          }))
        }))
        conditions = optional(object({
          created_after = optional(string)
          or_conditions = optional(object({
            min_age       = optional(string)
            min_row_count = optional(number)
          }))
          type_collection = optional(string)
          types = optional(object({
            types = optional(list(string))
          }))
        }))
        disabled = optional(object({
        }))
        filter = optional(object({
          other_tables = optional(object({
          }))
          table_reference = optional(object({
            dataset_id = string
            project_id = optional(string)
            table_id   = string
          }))
          tables = optional(object({
            include_regexes = optional(object({
              patterns = optional(list(object({
                dataset_id_regex = optional(string)
                project_id_regex = optional(string)
                table_id_regex   = optional(string)
              })))
            }))
          }))
        }))
      }))
      cloud_sql_target = optional(object({
        conditions = optional(object({
          database_engines = optional(list(string))
          types            = optional(list(string))
        }))
        disabled = optional(object({
        }))
        filter = object({
          collection = optional(object({
            include_regexes = optional(object({
              patterns = optional(list(object({
                database_regex               = optional(string)
                database_resource_name_regex = optional(string)
                instance_regex               = optional(string)
                project_id_regex             = optional(string)
              })))
            }))
          }))
          database_resource_reference = optional(object({
            database          = string
            database_resource = string
            instance          = string
            project_id        = string
          }))
          others = optional(object({
          }))
        })
        generation_cadence = optional(object({
          inspect_template_modified_cadence = optional(object({
            frequency = string
          }))
          refresh_frequency = optional(string)
          schema_modified_cadence = optional(object({
            frequency = optional(string)
            types     = optional(list(string))
          }))
        }))
      }))
      cloud_storage_target = optional(object({
        conditions = optional(object({
          cloud_storage_conditions = optional(object({
            included_bucket_attributes = optional(list(string))
            included_object_attributes = optional(list(string))
          }))
          created_after = optional(string)
          min_age       = optional(string)
        }))
        disabled = optional(object({
        }))
        filter = object({
          cloud_storage_resource_reference = optional(object({
            bucket_name = optional(string)
            project_id  = optional(string)
          }))
          collection = optional(object({
            include_regexes = optional(object({
              patterns = optional(list(object({
                cloud_storage_regex = optional(object({
                  bucket_name_regex = optional(string)
                  project_id_regex  = optional(string)
                }))
              })))
            }))
            include_tags = optional(object({
              tag_filters = optional(list(object({
                namespaced_tag_key   = optional(string)
                namespaced_tag_value = optional(string)
              })))
            }))
          }))
          others = optional(object({
          }))
        })
        generation_cadence = optional(object({
          inspect_template_modified_cadence = optional(object({
            frequency = optional(string)
          }))
          refresh_frequency = optional(string)
        }))
      }))
      other_cloud_target = optional(object({
        conditions = optional(object({
          amazon_s3_bucket_conditions = optional(object({
            bucket_types           = optional(list(string))
            object_storage_classes = optional(list(string))
          }))
          min_age = optional(string)
        }))
        data_source_type = optional(object({
          data_source = optional(string)
        }))
        disabled = optional(object({
        }))
        filter = object({
          collection = optional(object({
            include_regexes = optional(object({
              patterns = optional(list(object({
                amazon_s3_bucket_regex = optional(object({
                  aws_account_regex = optional(object({
                    account_id_regex = optional(string)
                  }))
                  bucket_name_regex = optional(string)
                }))
              })))
            }))
          }))
          others = optional(object({
          }))
          single_resource = optional(object({
            amazon_s3_bucket = optional(object({
              aws_account = optional(object({
                account_id = optional(string)
              }))
              bucket_name = optional(string)
            }))
          }))
        })
        generation_cadence = optional(object({
          inspect_template_modified_cadence = optional(object({
            frequency = optional(string)
          }))
          refresh_frequency = optional(string)
        }))
      }))
      secrets_target = optional(object({
      }))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 30 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

