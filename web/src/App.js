import logo from './logo.svg';
import './App.css';
import {ethers} from "ethers";
import ABI from './foundry-nft-abi.json';
import {useEffect, useState} from "react";

// const ETHEREUM_API_URL = `${process.env.REACT_APP_ETH_NETWORK_RPC_URL}/CNY6XM5R737QXQC15MUYTA59G5RZFAXBEF`
const CONTRACT_ADDRESS = '0x59C5AA42f79C201Ff9C3fFeC1340d9e0B3A855F2';

const App = () => {
    const [provider, setProvider] = useState(null);

    const getContract = async () => {
        try {
            const provider = await new ethers.BrowserProvider(window.ethereum);
            const signer = await provider.getSigner();
            const contract = await new ethers.Contract(CONTRACT_ADDRESS, ABI, signer);
            const sym = await contract.symbol();
            // const mint = await contract.mint();
            // await mint.wait();

            const foo1 = await contract.getFunction('totalSupply').call(null);
            // const foo2 = await contract.getFunction('mint').call(null);
            // const foo3 = await contract.getFunction('totalSupply').call(null);

            console.log('%c...contrat', 'color:gold', sym, foo1)
        } catch (error) {
            console.log('%c...error', 'color:gold', error)
        }
    }
    useEffect(() => {
        if (window.ethereum) {
            setProvider(new ethers.BrowserProvider(window.ethereum));
        } else {
            console.error("Please install MetaMask!");
        }
    }, []);


    useEffect(() => {
        getContract();
    }, [provider]);
    return (
        <div className="App">
            <header className="App-header">
                <img src={logo} className="App-logo" alt="logo"/>


                <a
                    className="App-link"
                    href="https://reactjs.org"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    Learn React
                </a>
            </header>
        </div>
    );
}

export default App
