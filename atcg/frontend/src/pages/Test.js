import React, { useState } from 'react'
import ComboInput from '../components/ComboInput'

const Test = () => {
    const [cardName, setCardName] = useState([''])
  return (
    <div>
        <form action="">
            <ComboInput setValues={setCardName}/>
        </form>
    </div>
  )
}

export default Test