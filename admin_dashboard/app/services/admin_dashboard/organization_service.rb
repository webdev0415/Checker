module AdminDashboard
  class OrganizationService
    include Godmin::Resources::ResourceService

    ATTRS = %i[
      name
      address
      contact
      start_date
      end_date
      phone
      alert_count
      current_fcra_count
      current_identity_count_a
      current_identity_count_b
      current_identity_count_c
      current_identity_count_e
      current_internal_user_count
      list_of_group_ids
      list_of_sentinel_profile
      list_of_sentry__id_profile
      list_of_sentry_risk_profile
      signed_agreement_pdf
      subscribe_fcra_count
      subscribe_internal_user_count
      subscribed_identity_count_a
      subscribed_identity_count_b
      subscribed_identity_count_c
      subscribed_identity_count_d
    ]

    attrs_for_index  :name, :address, :contact, :phone, :start_date, :signed_agreement_pdf
    attrs_for_show *ATTRS
  end
end



