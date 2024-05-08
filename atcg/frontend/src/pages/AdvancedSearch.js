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
  marginLeft: '10px',
  position: 'relative',
  top: '1px'
};

const AdvancedSearch = () => {
  // State variables for form inputs
  const [colors, setColors] = useState([]);
  const [rarities, setRarities] = useState([]);
  const [type, setType] = useState('');
  const [cardName, setCardName] = useState('');
  const [amountValue, setAmountValue] = useState('');
  const [health, setHealth] = useState('');
  const [attack, setAttack] = useState('');
  const [subtype, setSubtype] = useState('');
  const [allText, setAllText] = useState('');
  const navigate = useNavigate();


  // Handler functions for form inputs

  const handleCardNameChange = (e) => {
    setCardName(e.target.value);
  };


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


  const handleAmountValueChange = (e) => {
    setAmountValue(e.target.value);
  };

  const handleHealthChange = (e) => {
    setHealth(e.target.value);
  };
  
  const handleAttackChange = (e) => {
    setAttack(e.target.value);
  };
  
  const handleSubtypeChange = (e) => {
    setSubtype(e.target.value);
  };
  
  const handleAllTextChange = (e) => {
    setAllText(e.target.value);
  };


  const handleSubmit = (e) => {
    e.preventDefault();
    const params = new URLSearchParams();

    params.set("order", cardName);
    if (cardName.length > 0) params.set("cardName", cardName);
    if(colors.length > 0) params.set("color", colors.join(" "));
    if(rarities.length > 0) params.set("rarity", rarities.join(" "));
    if(type.length > 0) params.set("type", type);
    if(amountValue.length > 0) 
    {
      params.set("amt", amountValue);
    }

    if (health.length > 0) params.set("health", health);
    if (attack.length > 0) params.set("attack", attack);
    if (subtype.length > 0) params.set("subtype", subtype);
    if (allText.length > 0) params.set("allText", allText);

    
    navigate(`/search?${params.toString()}`);
  };

  return (
    <div className="min-h-screen relative bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center overflow-hidden">
      <h1 className="text-white text-3xl font-bold mb-2 text-center mt-4 mb-4">Advanced Search Page</h1>
      <form className="flex flex-col items-start p-4 border border-gray-300 rounded-md w-full max-w-2xl" method='GET' onSubmit={handleSubmit}>
          <div className="mb-2">
            <label className="text-white">
            Card Name:
            </label>
              { <input
                type="text"
                value={cardName}
                onChange={handleCardNameChange}
                className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-black"
                placeholder="Healing potion"
              /> }
              {/* <ComboInput setValues={setCardName}/> */}
          </div>
          
          
          <fieldset className="mb-4">
            <legend className="text-white mb-1">Colors:</legend>
            <div className="space-x-4">
              <label className="inline-flex items-center">
                <input type="checkbox" value="green" onChange={handleColorChange} />
                <span className="ml-3 text-white">Green</span>
                <span className="color-circle bg-green-500" style={colorCircleStyle }></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="blue" onChange={handleColorChange} />
                <span className="ml-3 text-white">Blue</span>
                <span className="color-circle bg-blue-500" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="red" onChange={handleColorChange} />
                <span className="ml-3 text-white">Red</span>
                <span className="color-circle bg-red-500" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="purple" onChange={handleColorChange} />
                <span className="ml-3 text-white">Purple</span>
                <span className="color-circle bg-purple-500" style={colorCircleStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="none" onChange={handleColorChange} />
                <span className="ml-3 text-white">Colorless</span>
                <span className="color-circle bg-indigo-300" style={colorCircleStyle}></span>
              </label>
            </div>
          </fieldset>

          <fieldset className="mb-4">
            <legend className="text-white mb-1">Set:</legend>
            <div className="space-x-4"> 
              <label className="inline-flex items-center">
                <input type="checkbox" value="cor" onChange={handleRarityChange} />
                <span className="ml-3 text-white">COR</span>
                <span className="shape-diamond bg-blue-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="cbd" onChange={handleRarityChange} />
                <span className="ml-3 text-white">CBD</span>
                <span className="shape-diamond bg-green-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="elm" onChange={handleRarityChange} />
                <span className="ml-3 text-white">ELM</span>
                <span className="shape-diamond bg-yellow-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="hoe" onChange={handleRarityChange} />
                <span className="ml-3 text-white">HOE</span>
                <span className="shape-diamond bg-purple-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="str" onChange={handleRarityChange} />
                <span className="ml-3 text-white">STR</span>
                <span className="shape-diamond bg-red-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="whv" onChange={handleRarityChange} />
                <span className="ml-2 text-white">WHV</span>
                <span className="shape-diamond bg-gray-400" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="dep" onChange={handleRarityChange} />
                <span className="ml-2 text-white">DEP</span>
                <span className="shape-diamond bg-orange-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="qil" onChange={handleRarityChange} />
                <span className="ml-3 mr-3 text-white">QIL</span>
                <span className="shape-diamond bg-teal-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="cla" onChange={handleRarityChange} />
                <span className="ml-3 mr-3 text-white">CLA</span>
                <span className="shape-diamond bg-indigo-300" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="nin" onChange={handleRarityChange} />
                <span className="ml-3 mr-3 text-white">NIN</span>
                <span className="shape-diamond bg-pink-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="kgd" onChange={handleRarityChange} />
                <span className="ml-3 mr-3 text-white">KGD</span>
                <span className="shape-diamond bg-cyan-500" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="jig" onChange={handleRarityChange} />
                <span className="ml-3 mr-3 text-white">JIG</span>
                <span className="shape-diamond bg-yellow-200" style={diamondStyle}></span>
              </label>
              <label className="inline-flex items-center">
                <input type="checkbox" value="fal" onChange={handleRarityChange} />
                <span className="ml-3 mr-2 text-white">FAL</span>
                <span className="shape-diamond bg-purple-500" style={diamondStyle}></span>
              </label>
            </div>
          </fieldset>


          <div className="mb-4">
            <label className="text-white">
              Type:
              <select value={type} onChange={handleTypeChange} className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-gray-700">
                <option value="">Select Type:</option>
                <option value="character">Character</option>
                <option value="spell">Spell</option>
                <option value="item">Item</option>
                <option value="district">District</option>
                <option value="token">Token</option>
                <option value="legendary">Legendary</option>
              </select>
            </label>
          </div>

          

          <div className="mb-4">
            <label className="text-white">Cost Value (1-9999):</label>
            <input type="number" 
            value={amountValue} 
            onChange={handleAmountValueChange}
            className="ml-2 px-2 py-1 border border-gray-400 rounded-md bg-gray-200 text-gray-700" 
            placeholder="9999"
            />
          </div>

          <div className="mb-4">
            <label className="text-white">
              Health:
              <input
                type="text"
                value={health}
                onChange={handleHealthChange}
                className="ml-2 px-2 border border-gray-400 rounded-md bg-gray-200 text-gray-700"
                placeholder="Enter health"
              />
            </label>
          </div>

          <div className="mb-4">
            <label className="text-white">
              Attack:
              <input
                type="text"
                value={attack}
                onChange={handleAttackChange}
                className="ml-2 px-2 border border-gray-400 rounded-md bg-gray-200 text-gray-700"
                placeholder="Enter attack"
              />
            </label>
          </div>

          <div className="mb-4">
            <label className="text-white">
              Subtype:
              <input
                type="text"
                value={subtype}
                onChange={handleSubtypeChange}
                className="ml-2 px-2 border border-gray-400 rounded-md bg-gray-200 text-gray-700"
                placeholder="Enter subtype"
              />
            </label>
          </div>

          <div className="mb-4">
            <label className="text-white">
              Text (all instances):
              <input
                type="text"
                value={allText}
                onChange={handleAllTextChange}
                className="ml-2 px-2 border border-gray-400 rounded-md bg-gray-200 text-gray-700"
                placeholder="Enter text"
              />
            </label>
          </div>
          <button type="submit" className="px-4 py-2 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">Search</button>
      </form>

      <div className="mt-auto mb-4"> 
        <p className="text-white text-sm">
          Visit our GitHub repository: {' '}
          <a href="https://github.com/EthanWen11/ATCG-Database-Project" target="_blank" rel="noopener noreferrer" className="text-indigo-400 hover:underline">GitHub Repo</a>
        </p>
      </div>

    </div>
  );
};

export default AdvancedSearch;
