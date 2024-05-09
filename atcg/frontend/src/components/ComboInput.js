import React, { useState } from 'react'
import CreatableSelect from 'react-select/creatable';



const ComboInput = ({ setValues, data }) => {
  let [input, setInput] = useState('');

  const handleInputChange = (inputValue) => {
    setInput(inputValue);
  }

  console.log(data)

  const handleValueChange = (valuesLabel) => {
    let values = valuesLabel.map(({ value, label }) => (value));
    setValues(values);
    console.log(values)
  }

  // instead of defining these options, we call a get all possible selections and pass them as props
  const options = []

  data.map((name) => {
    options.push({ value: `${name.cardName}`, label: `${name.cardName}` })
  })

  return (
    <>
      <CreatableSelect
        isMulti
        options={options}
        placeholder="Healing Potion"
        onInputChange={handleInputChange}
        onChange={handleValueChange}
        formatCreateLabel={() => `${input}`}
      />
    </>

  )
}

export default ComboInput