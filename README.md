 # テーブル設計

 ## usersテーブル

｜ Column             | Type    | Options                   |
｜ ------------------ | ------- | ------------------------- |
｜ nickname           | string  | null: false               |
｜ email              | string  | null: false, unique: true |
｜ encrypted_password | string  | null: false               |
｜ last_name          | string  | null: false               |
｜ first_name         | string  | null: false               |
｜ last_name_kana     | string  | null: false               |
｜ first_name_kana    | string  | null: false               |
｜ birth_date         | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

｜ Column           | Type       | Options                        |
｜ ---------------- | ---------- | ------------------------------ |
｜ image            | string     | null: false                    |
｜ price            | string     | null: false                    |
｜ name             | string     | null: false                    |
｜ description      | string     | null: false                    |
｜ condition_id     | integer    | null: false                    |
｜ shipping_cost_id | integer    | null: false                    |
｜ prefecture_id    | integer    | null: false                    |
｜ shipping_days    | integer    | null: false                    |
｜ category_id      | integer    | null: false                    |
｜ user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :destination
- has_one :order


## destinationテーブル

｜ Column         | Type       | Options                        |
｜ -------------- | ---------- | ------------------------------ |
｜ post_code      | string     | null: false                    |
｜ prefecture     | string     | null: false                    |
｜ municipalities | string     | null: false                    |
｜ address        | string     | null: false                    |
｜ building_name  | string     |                                |
｜ phone_number   | string     | null: false                    |
｜ order          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order

## ordersテーブル

｜ Column  | Type       | Options                        |
｜ ------- | ---------- | ------------------------------ |
｜ user    | references | null: false, foreign_key: true |
｜ item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination