<?php

namespace app\modules\it\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\it\models\Todo;

/**
 * TodoSearch represents the model behind the search form of `app\modules\it\models\Todo`.
 */
class TodoSearch extends Todo
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'department', 'request_name', 'status', 'created_by', 'updated_by'], 'integer'],
            [['todo_code', 'request_date', 'title', 'photo', 'created_at', 'updated_at'], 'safe'],
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
        $query = Todo::find();

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
            'request_date' => $this->request_date,
            'department' => $this->department,
            'request_name' => $this->request_name,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'created_by' => $this->created_by,
            'updated_at' => $this->updated_at,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'todo_code', $this->todo_code])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'photo', $this->photo]);

        return $dataProvider;
    }
}
