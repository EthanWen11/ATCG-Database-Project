import React, { useState } from 'react'
import { useNavigate, useSearchParams } from 'react-router-dom';

const SortForm = ({setOrder}) => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();

    const handleOnChange = (e) => {
        e.preventDefault();
        setOrder(e.target.value);
    }

    return (
        <div>
            <span className=' text-left mr-2 font-semibold text-md text-white'>sorted by</span>
            <select className=' w-28 rounded-sm border-none font-medium hover:text-cyan-700' name="order" id="order-select" onChange={handleOnChange} required>
                <option selected value="id">Card ID</option>
                <option value="set">Set ID</option>
                <option value="name">Name</option>
            </select>
        </div>
    )
}

export default SortForm