<?php

namespace app\modules\hr\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\hr\models\CarReserve;

/**
 * CarReserveSearch represents the model behind the search form of `app\modules\hr\models\CarReserve`.
 */
class CarReserveSearch extends CarReserve
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'passenger', 'user_id', 'car_id', 'rider_id', 'approve_by', 'status_id'], 'integer'],
            [['code', 'destination', 'description', 'date_start', 'date_end', 'note', 'approve_date', 'approve_comment', 'created_at', 'updated_at'], 'safe'],
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
        $query = CarReserve::find();

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
            'passenger' => $this->passenger,
            'date_start' => $this->date_start,
            'date_end' => $this->date_end,
            'user_id' => $this->user_id,
            'car_id' => $this->car_id,
            'rider_id' => $this->rider_id,
            'approve_by' => $this->approve_by,
            'approve_date' => $this->approve_date,
            'status_id' => $this->status_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'destination', $this->destination])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'note', $this->note])
            ->andFilterWhere(['like', 'approve_comment', $this->approve_comment]);

        return $dataProvider;
    }
}
