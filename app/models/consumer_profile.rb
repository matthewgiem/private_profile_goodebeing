class ConsumerProfile < ActiveRecord::Base
  # validates :question1, presence: true
  # validates :question2, presence: true
  # validates :question3, presence: true
  # validates :question4, presence: true
  # validates :question5, presence: true
  # validates :question6, presence: true
  # validates :box_type, presence: true

  extend Enumerize

  enumerize :age_range, in: ['10-13', '14-17', '18-24','25-34','35-44','45-54','55-64','65-74','75 or better']
  enumerize :box_type, in: ["Beauty", "Wellness", "Beauty & Wellness"]
  enumerize :vegan, in: ["non-vegan", "lacto-ovo", "mostly-vegan", "vegan"], default: "non-vegan"
  enumerize :product_quality, in: ["I prefer to receive larger samples of less expensive products", "I prefer to receive smaller samples of higher end / niche brands & products", "I like to receive a mix of product sizes in a variety of price ranges"]
  enumerize :simple_profile, in: ["True", "False"]
  enumerize :skin_tone, in: {very_fair_pink: 0, very_fair_yellow: 1, light_red: 2, light_yellow: 3, medium_red: 4, medium_yellow: 5, olive: 6, medium_dark: 7, very_dark: 8}
  enumerize :product_type_facial_care, in: {few: 1, some: 2, many: 3}, default: 1
  enumerize :skin_type, in: ["has_skin_care_goal_oil", "has_skin_care_goal_dryness", "has_skin_care_goal_oil_dryness"]
  enumerize :primary_skin_care_goal, in: ["primary_skin_care_goal_general", "primary_skin_care_goal_redness", "primary_skin_care_goal_anti_aging", "primary_skin_care_goal_break_outs"]
  enumerize :secondary_skin_care_goal, in: ["secondary_skin_care_goal_general", "secondary_skin_care_goal_redness", "secondary_skin_care_goal_anti_aging", "secondary_skin_care_goal_break_outs"]
  enumerize :makeup_look, in: ["makeup_minimal", "makeup_classic", "makeup_trendy", "makeup_going_out", "makeup_brights"]
  enumerize :hair_type, in: ["has_normal_hair", "has_oily_hair", "has_dry_hair"]
  enumerize :hair_thickness, in: ["has_thick_hair", "has_medium_hair", "has_fine_hair"]
  enumerize :hair_texture, in: ["has_straight_hair", "has_curly_hair", "has_wavy_hair"]
  enumerize :hair_color_string, in: ["has_light_blonde_hair", "has_strawberry_blonde_hair", "has_dark_blonde_hair", "has_light_brown_hair", "has_medium_brown_hair", "has_dark_brown_hair", "has_ginger_hair", "has_auburn_hair", "has_black_hair", "has_grey_hair"]

  def self.product_type
    [
      :product_type_makeup,
      :product_type_haircare,
      :product_type_bath_shower,
      :product_type_body_care,
      :product_type_fragrances,
      :product_type_nail_care,
      :product_type_beauty_accessories,
      :product_type_sexual_health,
      :product_type_feminine_hygiene,
      :product_type_general_hygiene,
      :product_type_supplements,
      :product_type_super_foods_health_beverages,
      :product_type_lifestyle,
      :product_type_exercise_movement,
      :product_type_natural_medicines,
      :product_type_first_aid
    ]
  end

  ConsumerProfile.product_type.each do |field|
    enumerize field, in: {
        none: 0, few: 1, some: 2, many: 3
      }, default: 0
    end

  def self.product_type_facial_care
    [
      :facial_care_oil_balm_cleansers,
      :facial_care_cream_cleansers,
      :facial_care_foaming_cleansers,
      :facial_care_toners,
      :facial_care_daily_moisturizers,
      :facial_care_spf,
      :facial_care_night_moisturizers,
      :facial_care_anti_aging_serums,
      :facial_care_gel_serums,
      :facial_care_eye_creams,
      :facial_care_eye_serums,
      :facial_care_face_decolette_oils_balms,
      :facial_care_blemish_treatments,
      :facial_care_dry_masks,
      :facial_care_wet_masks,
      :facial_care_sheet_masks,
      :facial_care_srubs,
      :facial_care_enzymes,
      :facial_care_peels,
      :facial_care_acids,
      :facial_care_neck_chest_treatments,
      :facial_care_cleansing_treatments,
      :facial_care_tooth_whiteners
    ]
  end

  ConsumerProfile.product_type_facial_care.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_makeup
    [
      :makeup_liquid_foundation,
      :makeup_cream_foundation,
      :makeup_powder,
      :makeup_cream_blush,
      :makeup_powder_blush,
      :makeup_gel_blush,
      :makeup_cheek_stain,
      :makeup_bb_cc_cream,
      :makeup_liquid_concealer,
      :makeup_cream_concealer,
      :makeup_mascara,
      :makeup_dry_brow_color,
      :makeup_gel_brow_color,
      :makeup_cream_eyeshadow,
      :makeup_powder_eyeshadow,
      :makeup_pencil_eyeliner,
      :makeup_liquid_eyeliner,
      :makeup_gel_eyeliner,
      :makeup_primer,
      :makeup_lipstick,
      :makeup_lip_stain,
      :makeup_lip_gloss,
      :makeup_lip_liner,
      :makeup_highlighter,
      :makeup_blush,
      :makeup_bronzer,
      :makeup_color_correctors,
      :makeup_contouring,
      :makeup_application_tools
    ]
  end

  ConsumerProfile.product_type_makeup.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_haircare
    [
      :haircare_shampoo,
      :haircare_dry_shampoo,
      :haircare_rinse_out_conditioner,
      :haircare_leave_in_conditioner,
      :haircare_masks,
      :haircare_treatments,
      :haircare_styling_aids,
      :haircare_grey_cover,
      :haircare_scalp_treatments
    ]
  end

  ConsumerProfile.product_type_haircare.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_bath_shower
    [
      :bath_shower_aromatherapy,
      :bath_shower_bodywash,
      :bath_shower_body_scrubs,
      :bath_shower_scrubbing_tools,
      :bath_shower_soaps,
      :bath_shower_oils
    ]
  end

  ConsumerProfile.product_type_bath_shower.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_body_care
    [
      :body_care_lotions,
      :body_care_oils,
      :body_care_balms,
      :body_care_treatment_products,
      :body_care_hair_removal,
      :body_care_self_tanner,
      :body_care_spf,
      :body_care_peels,
      :body_care_tools
    ]
  end

  ConsumerProfile.product_type_body_care.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_fragrances
    [
      :fragrances_perfumes,
      :fragrances_scented_oils,
      :fragrances_body_sprays,
      :fragrances_ambient_scents
    ]
  end

  ConsumerProfile.product_type_fragrances.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_nail_care
    [
      :nail_care_color,
      :nail_care_cuticle,
      :nail_care_health,
      :nail_care_polish_remover,
      :nail_care_tools
    ]
  end

  ConsumerProfile.product_type_nail_care.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_beauty_accessories
    [
      :beauty_accessories_cosmetic_brushes,
      :beauty_accessories_bags,
      :beauty_accessories_sponges,
      :beauty_accessories_facial_cleaning_tools,
      :beauty_accessories_hair_brushes
    ]
  end

  ConsumerProfile.product_type_beauty_accessories.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_sexual_health
    [
      :sexual_health_condoms,
      :sexual_health_enhancement
    ]
  end

  ConsumerProfile.product_type_sexual_health.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_feminine_hygiene
    [
      :feminine_hygiene_tampons,
      :feminine_hygiene_pads,
      :feminine_hygiene_cups,
      :feminine_hygiene_wipes,
      :feminine_hygiene_cleansers
    ]
  end

  ConsumerProfile.product_type_feminine_hygiene.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end



  def self.product_type_feminine_hygiene_boolean
    [
      :regular_periods,
      :peri_menopausal,
      :menopausal,
    ]
  end


  def self.product_type_general_hygiene
    [
      :general_hygiene_soap,
      :general_hygiene_lotion_balm,
      :general_hygiene_bug_spray,
      :general_hygiene_deodorant,
      :general_hygiene_oral_care,
      :general_hygiene_cleansing_wipes,
      :general_hygiene_hair_body_wash,
      :general_hygiene_lip_balm
    ]
  end

  ConsumerProfile.product_type_general_hygiene.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_supplements
    [
      :supplements_vitamins,
      :supplements_anti_oxidants,
      :supplements_essential_fatty_acids,
      :supplements_herbs
    ]
  end

  ConsumerProfile.product_type_supplements.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_super_foods_health_beverages
    [
      :super_foods_health_beverages_smoothie_addatives,
      :super_foods_health_beverages_tea,
      :super_foods_health_beverages_coffee,
      :super_foods_health_beverages_energy_beverages,
      :super_foods_health_beverages_athletic_beverages
    ]
  end

  ConsumerProfile.product_type_super_foods_health_beverages.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_lifestyle
    [
      :lifestyle_reusables,
      :lifestyle_non_toxic_living_goods,
      :lifestyle_small_home_accessories,
      :lifestyle_small_fashion_accessories
    ]
  end

  ConsumerProfile.product_type_lifestyle.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_exercise_movement
    [
      :exercise_movement_barre,
      :exercise_movement_yoga,
      :exercise_movement_pilates,
      :exercise_movement_running,
      :exercise_movement_dance,
      :exercise_movement_circuit_training,
      :exercise_movement_resistance_training,
      :exercise_movement_hiking,
      :exercise_movement_cycling,
      :exercise_movement_swimming
    ]
  end

  ConsumerProfile.product_type_exercise_movement.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.product_type_first_aid
    [
      :first_aid_wound_care,
      :first_aid_rash_care,
      :first_aid_insect_bite_care,
      :first_aid_anti_fungal,
      :first_aid_irritation
    ]
  end

  ConsumerProfile.product_type_first_aid.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.skin_concerns
    [
      :skin_concerns_fine_lines,
      :skin_concerns_firmness,
      :skin_concerns_thinning,
      :skin_concerns_lip_volume,
      :skin_concerns_eyelash_eyebrow,
      :skin_concerns_self_tan,
      :skin_concerns_pigmentation,
      :skin_concerns_capillaries,
      :skin_concerns_circles_puffy,
      :skin_concerns_break_outs,
      :skin_concerns_blackheads,
      :skin_concerns_luminosity_flakey,
      :skin_concerns_irritation,
      :skin_concerns_oil,
      :skin_concerns_dryness,
      :skin_concerns_smooth_hydrate_lips
    ]
  end

  ConsumerProfile.skin_concerns.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.facial_care
    [
      :skin_concerns_acne,
      :skin_concerns_sensitivity_irritation,
      :skin_concerns_eczema,
      :skin_concerns_rosacea
    ]
  end

  ConsumerProfile.facial_care.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.lips_color
    [
      :lips_color_blue_reds,
      :lips_color_orange_reds,
      :lips_color_coral,
      :lips_color_plum,
      :lips_color_dark_pink,
      :lips_color_light_pink,
      :lips_color_nude,
      :lips_color_any
    ]
  end

  ConsumerProfile.lips_color.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.eye_color
    [
      :eye_color_blues,
      :eye_color_greens,
      :eye_color_purples,
      :eye_color_brown_beige,
      :eye_color_metallics,
      :eye_color_any
    ]
  end

  ConsumerProfile.eye_color.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.nail_color
    [
      :nail_color_red,
      :nail_color_pink,
      :nail_color_purple,
      :nail_color_grey,
      :nail_color_metallic
    ]
  end

  ConsumerProfile.nail_color.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.eyebrow_color
    [
      :eyebrow_color_light_brown,
      :eyebrow_color_medium_brown,
      :eyebrow_color_dark_brown,
      :eyebrow_color_auburn,
      :eyebrow_color_black,
      :eyebrow_color_any
    ]
  end

  ConsumerProfile.eyebrow_color.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.eyelash_color
    [
      :eyelash_color_brown,
      :eyelash_color_black,
      :eyelash_color_colors,
      :eyelash_color_any
    ]
  end

  ConsumerProfile.eyelash_color.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.shimmer
    [
      :lips_shimmer,
      :cheeks_shimmer,
      :nails_shimmer,
      :eyes_shimmer,
      :face_shimmer
    ]
  end

  ConsumerProfile.shimmer.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.haircare_products
    [
      :shape_define_curly_hair,
      :maximize_curly_hair,
      :smooth_reduce_curly_hair,
      :detangle_hair,
      :increase_volume_hair,
      :reduce_frizy_hair,
      :repair_damaged_hair,
      :manage_excess_oily_hair,
      :reduce_hair_loss,
      :sooth_flakey_scalp_hair,
      :cover_grey_hair,
      :color_hair,
      :protect_hair_from_heat
    ]
  end

  ConsumerProfile.haircare_products.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.fragrance
    [
      :sweet_fragrances,
      :fruity_fragrances,
      :citrus_fragrances,
      :classic_floral_fragrances,
      :tropical_floral_fragrances,
      :earthy_fragrances,
      :woodsy_fragrances,
      :herbal_fragrances,
      :musky_fragrances,
      :spicy_fragrances
    ]
  end

  ConsumerProfile.fragrance.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.body_concerns
    [
      :body_concerns_firming,
      :body_concerns_dry_skin,
      :body_concerns_break_outs,
      :body_concerns_aging_hands,
      :body_concerns_dry_hands,
      :body_concerns_rough_feet,
      :body_concerns_callouses,
      :body_concerns_pilaris_keratosis
    ]
  end

  ConsumerProfile.body_concerns.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.health_concerns
    [
      :health_concern_energy,
      :health_concern_immunity_viral_bacterial,
      :health_concern_anti_oxidant_systemic,
      :health_concern_sports_preformance,
      :health_concern_sports_injury,
      :health_concern_muscle_tightness_pain,
      :health_concern_joint_support,
      :health_concern_systematic_inflammation,
      :health_concern_menstruation,
      :health_concern_conception,
      :health_concern_pregnancy,
      :health_concern_menopause,
      :health_concern_headache,
      :health_concern_seasonal_allergies,
      :health_concern_digestion,
      :health_concern_cardiovascular,
      :health_concern_circulation,
      :health_concern_nutrition,
      :health_concern_bloodsugar,
      :health_concern_weight_loss,
      :health_concern_weight_gain,
      :health_concern_muscle_gain,
      :health_concern_female_hormones,
      :health_concern_male_hormones,
      :health_concern_stress,
      :health_concern_depression,
      :health_concern_anxiety,
      :health_concern_toxins,
      :health_concern_sleep,
      :health_concern_aging
    ]
  end

  ConsumerProfile.health_concerns.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.health_concerns_hair_health
    [
      :health_concern_hair_health_general,
      :health_concern_hair_health_hair_loss,
      :health_concern_hair_health_flakey_scalp,
    ]
  end

  ConsumerProfile.health_concerns_hair_health.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.health_concerns_skin_health
    [
      :health_concern_skin_health_general,
      :health_concern_skin_health_breakouts,
      :health_concern_skin_health_rosacea,
      :health_concern_skin_health_eczema,
      :health_concern_skin_health_psoriasis,
      :health_concern_skin_health_dermatitis,
      :health_concern_skin_health_anti_aging
    ]
  end

  ConsumerProfile.health_concerns_skin_health.each do |field|
    enumerize field, in: {
      none: 0, few: 1, some: 2, many: 3
    }, default: 0
  end

  def self.is_dietary_restricted
    [
      :is_dietary_restricted_no_gluten,
      :is_dietary_restricted_soy_free,
      :is_dietary_restricted_dairy_free,
      :is_dietary_restricted_no_eggs,
      :is_dietary_restricted_no_corn,
      :is_dietary_restricted_no_tree_nuts,
      :is_dietary_restricted_no_peanuts,
      :is_dietary_restricted_no_chocolate,
      :is_dietary_restricted_no_shellfish
    ]
  end

  def self.buy_products
    [
      :buy_products_online,
      :buy_products_health_food_stores,
      :buy_products_department_stores,
      :buy_products_boutiques,
      :buy_products_chain_beauty_stores
    ]
  end

  def self.buy
    [
      :buy_high_end_products,
      :buy_aspirational_brands,
      :buy_affordable_priced,
      :buy_budget_products
    ]
  end

  ConsumerProfile.buy.each do |field|
    enumerize field, in: {
      never: 0, Occassionally: 1, Often: 2
    }, default: 0
  end

  def self.hobby
    [
      :hobby_outdoor_activities,
      :hobby_water_activities,
      :hobby_fitness_studio,
      :hobby_dance,
      :hobby_gym,
      :hobby_cooking_baking,
      :hobby_crafting,
      :hobby_art,
      :hobby_reading_non_fiction,
      :hobby_reading_fantasy_scifi,
      :hobby_reading_mystery_drama,
      :hobby_reading_romance,
      :hobby_photography,
      :hobby_wellnes_enthusiast,
      :hobby_acting,
      :hobby_fashion,
      :hobby_modeling,
      :hobby_interior_design,
      :hobby_sustainabliity
    ]
  end

  # def self.skin_type
  #   [
  #     :has_skin_care_goal_oil,
  #     :has_skin_care_goal_dryness,
  #     :has_skin_care_goal_oil_dryness
  #   ]
  # end

  # def self.primary_skin_care_goal
  #   [
  #     :primary_skin_care_goal_general,
  #     :primary_skin_care_goal_redness,
  #     :primary_skin_care_goal_anti_aging,
  #     :primary_skin_care_goal_break_outs
  #   ]
  # end
  #
  # def self.secondary_skin_care_goal
  #   [
  #     :secondary_skin_care_goal_general,
  #     :secondary_skin_care_goal_redness,
  #     :secondary_skin_care_goal_anti_aging,
  #     :secondary_skin_care_goal_break_outs
  #   ]
  # end

  # def self.makeup_profile
  #   [
  #     :makeup_minimal,
  #     :makeup_classic,
  #     :makeup_trendy,
  #     :makeup_going_out,
  #     :makeup_brights
  #   ]
  # end

  # def self.hair_type
  #   [
  #     :has_normal_hair,
  #     :has_oily_hair,
  #     :has_dry_hair
  #   ]
  # end

  # def self.hair_thickness
  #   [
  #     :has_thick_hair,
  #     :has_medium_hair,
  #     :has_fine_hair
  #   ]
  # end
#
  # def self.hair_texture
  #   [
  #     :has_straight_hair,
  #     :has_curly_hair,
  #     :has_wavy_hair
  #   ]
  # end
  #
  # def self.hair_color
  #   [
  #     :has_light_blonde_hair,
  #     :has_strawberry_blonde_hair,
  #     :has_dark_blonde_hair,
  #     :has_light_brown_hair,
  #     :has_medium_brown_hair,
  #     :has_dark_brown_hair,
  #     :has_ginger_hair,
  #     :has_auburn_hair,
  #     :has_black_hair,
  #     :has_grey_hair
  #   ]
  # end
end
