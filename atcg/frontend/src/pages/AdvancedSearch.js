  import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import ComboInput from '../components/ComboInput';

const diamondStyle = {
  display: 'inline-block',
  width: '12px',
  height: '12px',
  transform: 'rotate(45deg)',
  position: 'relative',
  marginLeft: '10px',
  top: '-1px' 
};

const colorCircleStyle = {
  display: 'inline-block',
  width: '14px',
  height: '14px',
  borderRadius: '50%',
  marginLeft: '5px',
  position: 'relative',
  top: '1px'
};

const AdvancedSearch = () => {
  // State variables for form inputs
  const [colors, setColors] = useState([]);
  const [rarities, setRarities] = useState([]);
  const [type, setType] = useState('');
  const [cardName, setCardName] = useState([]);
  const [amountMatch, setAmountMatch] = useState('Match');
  const [amountValue, setAmountValue] = useState('');
  const navigate = useNavigate();


  // Handler functions for form inputs
  const handleColorChange = (e) => {
    const { value, checked } = e.target;
    if (checked) {
      setColors([...colors, value]);
    } else {
      setColors(colors.filter(color => color !== value));
    }
  };

  const handleRarityChange = (e) => {
    const { value, checked } = e.target;
    if (checked) {
      setRarities([...rarities, value]);
    } else {
      setRarities(rarities.filter(rarity => rarity !== value));
    }
  };

  const handleTypeChange = (e) => {
    setType(e.target.value);
  };

  // const handleCardNameChange = (e) => {
  //   setCardName(e.target.value);
  // };

  const handleAmountMatchChange = (e) => {
    setAmountMatch(e.target.value);
  };

  const handleAmountValueChange = (e) => {
    setAmountValue(e.target.value);
  };


  const handleSubmit = (e) => {
    e.preventDefault();
    const params = new URLSearchParams();
    // order by name by default
    params.set("order", "name");
    if(colors.length > 0) params.set("color", colors.join(" "));
    if(rarities.length > 0) params.set("rarity", rarities.join(" "));
    if(type.length > 0) params.set("type", type);
    if(cardName.length > 0) params.set("cardName", cardName.join(" "));
    if(amountValue.length > 0) 
    {
      params.set("match", amountMatch);
      params.set("amt", amountValue);
    }

    navigate(`/search?${params.toString()}`);
  };

  // Render function for the form
  return (
    <div className="min-h-screen relative bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center overflow-hidden">
      <h1 className="text-white text-3xl font-bold mb-2 text-center mt-10 mb-8">Advanced Search Page</h1>
      <form className="flex flex-col items-start p-4 border border-gray-300 rounded-md w-full max-w-2xl" method='GET' onSubmit={handleSubmit}>
          <fieldset className="mb-4">
            <legend className="text-white mb-1">Colors:</legend>
            <div className="space-x-4">
              <label className="inline-flex items-center">
                <input type="checkbox" value="White" onChange={handleColorChange} />
                <span className="ml-3 text-white">White</span>
                <span className="color-circle" style={{ backgroundColor: "white", ...colorCircleStyle }}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Black" onChange={handleColorChange} />
                <span className="ml-3 text-white">Black</span>
                <span className="color-circle bg-black" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Blue" onChange={handleColorChange} />
                <span className="ml-3 text-white">Blue</span>
                <span className="color-circle bg-blue-500" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Red" onChange={handleColorChange} />
                <span className="ml-3 text-white">Red</span>
                <span className="color-circle bg-red-500" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Green" onChange={handleColorChange} />
                <span className="ml-3 text-white">Green</span>
                <span className="color-circle bg-green-500" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Any" onChange={handleColorChange} />
                <span className="ml-3 text-white">Any</span>
                <span className="color-circle bg-gray-500" style={colorCircleStyle}></span>
              </label>
            </div>
          </fieldset>

          <fieldset className="mb-4">
            <legend className="text-white mb-1">Rarity:</legend>
            <div className="space-x-4"> {/* Add horizontal spacing between checkboxes */}
              <label className="inline-flex items-center">
                <input type="checkbox" value="Uncommon" onChange={handleRarityChange} />
                <span className="ml-3 text-white">Uncommon</span>
                <span className="shape-diamond bg-blue-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Common" onChange={handleRarityChange} />
                <span className="ml-3 text-white">Common</span>
                <span className="shape-diamond bg-green-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Rare" onChange={handleRarityChange} />
                <span className="ml-3 text-white">Rare</span>
                <span className="shape-diamond bg-yellow-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="Mythic" onChange={handleRarityChange} />
                <span className="ml-3 text-white">Mythic</span>
                <span className="shape-diamond bg-purple-500" style={diamondStyle}></span>
              </label>
            </div>
          </fieldset>


          <div className="mb-4">
            <label className="text-white">
              Type:
              <select value={type} onChange={handleTypeChange} className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-gray-700">
                <option value="">Select Type:</option>
                <option value="fire">Fire</option>
                <option value="earth">Earth</option>
                <option value="air">Air</option>
                <option value="water">Water</option>
              </select>
            </label>
          </div>

          <div className="mb-4">
            <label className="text-white">
            Card Name:
            </label>
              {/* <input
                type="text"
                value={cardName}
                onChange={handleCardNameChange}
                className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-black"
                placeholder="Healing potion"
              /> */}
              <ComboInput setValues={setCardName}/>
          </div>

          <div className="mb-4">
            <label className="text-white">
              Amount Match:
              <select value={amountMatch} onChange={handleAmountMatchChange} className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-gray-700">
                <option value="Match">Match</option>
                <option value="LesserThan">Lesser Than</option>
                <option value="GreaterThan">Greater Than</option>
              </select>
            </label>
            <label className="text-white ml-2">
              Amount Value (1-9999):
            </label>
            <input type="number" value={amountValue} onChange={handleAmountValueChange} className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-gray-700" />
          </div>
          <button type="submit" className="px-4 py-2 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">Search</button>
      </form>
    </div>
  );
};

export default AdvancedSearch;
