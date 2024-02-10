<?php

namespace app\modules\it\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\it\models\TodoAction;

/**
 * TodoActionSearch represents the model behind the search form of `app\modules\it\models\TodoAction`.
 */
class TodoActionSearch extends TodoAction
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'todo_id', 'actor'], 'integer'],
            [['hardware', 'software', 'activity', 'start_date', 'end_date', 'docs'], 'safe'],
            [['cost'], 'number'],
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
        $query = TodoAction::find();

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
            'todo_id' => $this->todo_id,
            'cost' => $this->cost,
            'actor' => $this->actor,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
        ]);

        $query->andFilterWhere(['like', 'hardware', $this->hardware])
            ->andFilterWhere(['like', 'software', $this->software])
            ->andFilterWhere(['like', 'activity', $this->activity])
            ->andFilterWhere(['like', 'docs', $this->docs]);

        return $dataProvider;
    }
}
