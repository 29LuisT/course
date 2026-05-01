SELECT 
    l.listing_id,
    l.created_at,
    r.review_date
FROM {{ ref('dim_listings_cleansed') }} AS l --AIRBNB.DEV.DIM_LISTINGS_CLEANSED l
LEFT JOIN {{ ref('fct_reviews') }} AS r--AIRBNB.DEV.FCT_REVIEWS r
ON l.listing_id = r.listing_id
WHERE r.review_date <= l.created_at
LIMIT 10