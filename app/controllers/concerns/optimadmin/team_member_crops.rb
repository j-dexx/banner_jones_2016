module Optimadmin
  module TeamMemberCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for TeamMember,
                      [
                        [:image, {
                          small: ['fill', 45, 45],
                          slider: ['fill', 117, 146],
                          navigation: ['fill', 130, 195],
                          show: ['fill', 220, 220],
                          index: ['fill', 296, 296]
                        }]
                      ]
    end
  end
end
