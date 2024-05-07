import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Search from "./pages/Search";
import AdvancedSearch from "./pages/AdvancedSearch"; // Import AdvancedSearch component
import Test from "./pages/Test";

function App() {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/search" element={<Search />} />
        <Route path="/Advanced" element={<AdvancedSearch />} /> {/* Add this route */}
        <Route path="/test" element={<Test />}/>
      </Routes>
    </div>
  );
}

export default App;
