import React, { useState } from 'react'
import CreatableSelect from 'react-select/creatable';



const ComboInput = ({setValues}) => {
    let [input, setInput] = useState('');

    const handleInputChange = (inputValue) => {    
        setInput(inputValue);
    }

    const handleValueChange = (valuesLabel) => {
        let values = valuesLabel.map(({value, label}) => (value));
        setValues(values);
        console.log(values)
    }

    // instead of defining these options, we call a get all possible selections and pass them as props
    const options = [
        { value: 'chocolate', label: 'Chocolate' },
        { value: 'strawberry', label: 'Strawberry' },
        { value: 'vanilla', label: 'Vanilla' }
    ]

  return (
    <CreatableSelect 
    isMulti 
    options={options} 
    placeholder="Healing Potion"
    onInputChange={handleInputChange} 
    onChange={handleValueChange} 
    formatCreateLabel={() => `${input}`}/>
  )
}

export default ComboInput