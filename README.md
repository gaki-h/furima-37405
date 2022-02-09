 # テーブル設計

 ## usersテーブル

｜ Column          | Type    | Options                   |
｜ ----------------| ------- | ------------------------- |
｜ nickname        | string  | null: false               |
｜ email           | string  | null: false               |
｜ password        | string  | null: false               |
｜ last_name       | string  | null: false               |
｜ first_name      | string  | null: false               |
｜ last_name_kana  | string  | null: false               |
｜ first_name_kana | string  | null: false               |
｜ birth_data      | integer | null: false               |

### Association

- has_many :items
- has_one :destination


## itemsテーブル

｜ Column        | Type       | Options                        |
｜ ------------- | ---------- | ------------------------------ |
｜ image         | string     | null: false                    |
｜ price         | string     | null: false                    |
｜ name          | string     | null: false                    |
｜ description   | string     | null: false                    |
｜ condition     | string     | null: false                    |
｜ shipping_cost | string     | null: false                    |
｜ prefecture_id | string     | null: false                    |
｜ shipping_days | string     | null: false                    |
｜ category_id   | references | null: false, foreign_key: true |
｜ brand_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :category
- belongs_to :brand


## destinationテーブル

｜ Column         | Type       | Options                        |
｜ -------------- | ---------- | ------------------------------ |
｜ post_code      | string     | null: false                    |
｜ prefecture     | string     | null: false                    |
｜ municipalities | string     | null: false                    |
｜ address        | string     | null: false                    |
｜ building_name  | string     |                                |
｜ phone_number   | string     | null: false                    |
｜ user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :orders


## ordersテーブル

｜ Column  | Type       | Options                        |
｜ ------- | ---------- | ------------------------------ |
｜ user_id | references | null: false, foreign_key: true |
｜ item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :destination


## categoryテーブル

｜ Column   | Type       | Options                        |
｜ -------- | ---------- | ------------------------------ |
｜ name     | string     | null: false                    |
｜ ancestry | references | null: false, foreign_key: true |

### Association

- has_many :items


## brandテーブル

｜ Column | Type       | Options                        |
｜ ------ | ---------- | ------------------------------ |
｜ name   | string     | null: false                    |

### Association

- has_many :items