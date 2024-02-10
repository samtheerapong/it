<?php

namespace app\modules\config\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\config\models\Profile;

/**
 * ProfileSearch represents the model behind the search form of `app\modules\config\models\Profile`.
 */
class ProfileSearch extends Profile
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'active', 'user_id', 'department'], 'integer'],
            [['thai_name', 'eng_name', 'nick_name', 'location', 'position', 'email', 'tel_number', 'mobile_number', 'emp_id', 'birth_date', 'address', 'starting_date', 'resign_date', 'avatar', 'note'], 'safe'],
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
        $query = Profile::find();

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
            'active' => $this->active,
            'user_id' => $this->user_id,
            'department' => $this->department,
            'birth_date' => $this->birth_date,
            'starting_date' => $this->starting_date,
            'resign_date' => $this->resign_date,
        ]);

        $query->andFilterWhere(['like', 'thai_name', $this->thai_name])
            ->andFilterWhere(['like', 'eng_name', $this->eng_name])
            ->andFilterWhere(['like', 'nick_name', $this->nick_name])
            ->andFilterWhere(['like', 'location', $this->location])
            ->andFilterWhere(['like', 'position', $this->position])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'tel_number', $this->tel_number])
            ->andFilterWhere(['like', 'mobile_number', $this->mobile_number])
            ->andFilterWhere(['like', 'emp_id', $this->emp_id])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'avatar', $this->avatar])
            ->andFilterWhere(['like', 'note', $this->note]);

        return $dataProvider;
    }
}
