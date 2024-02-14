<?php

namespace app\modules\hr\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\hr\models\Cars;

/**
 * CarsSearch represents the model behind the search form of `app\modules\hr\models\Cars`.
 */
class CarsSearch extends Cars
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'car_type_id', 'seats', 'status_id'], 'integer'],
            [['license_plate', 'photo', 'last_service'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Cars::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'car_type_id' => $this->car_type_id,
            'seats' => $this->seats,
            'last_service' => $this->last_service,
            'status_id' => $this->status_id,
        ]);

        $query->andFilterWhere(['like', 'license_plate', $this-> license_plate])
            ->andFilterWhere(['like', 'photo', $this->photo]);

        return $dataProvider;
    }
}
