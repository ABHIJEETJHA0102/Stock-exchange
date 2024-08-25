// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StockTokenization {

    struct Investor {
        bytes32 id;            
        uint256 amountPaid;     
        uint256 stockQuantity;  
        string stockName;       
        bool isTransferred;     
        uint256 contactNumber;  
    }

    uint256 public totalInvestors;
    mapping(bytes32 => Investor) public investorDetails;  
    mapping(address => bytes32[]) public investorStocks;  

    event StockPurchase(bytes32 id, address investor, string stockName, uint256 stockQuantity, uint256 amountPaid);
    event StockTransfer(bytes32 id, address investor, string stockName, uint256 stockQuantity);

    function purchaseStock(string memory _stockName, uint256 _stockQuantity, uint256 _amountPaid, uint256 _contactNumber) public returns (bytes32) {
        totalInvestors++;
        bytes32 id = keccak256(abi.encodePacked(block.timestamp, msg.sender, totalInvestors));
        
        investorDetails[id] = Investor(id, _amountPaid, _stockQuantity, _stockName, false, _contactNumber);
        
        investorStocks[msg.sender].push(id);

        emit StockPurchase(id, msg.sender, _stockName, _stockQuantity, _amountPaid);

        return id;
    }

    function transferStock(bytes32 _id) public {
        require(investorDetails[_id].id == _id, "Invalid stock ID");
        require(!investorDetails[_id].isTransferred, "Stock already transferred");

        investorDetails[_id].isTransferred = true;

        emit StockTransfer(_id, msg.sender, investorDetails[_id].stockName, investorDetails[_id].stockQuantity);
    }

    function viewStockDetails(bytes32 _id) public view returns (Investor memory) {
        return investorDetails[_id];
    }

    function viewInvestorStocks(address _investor) public view returns (Investor[] memory) {
        bytes32[] memory stockIds = investorStocks[_investor];
        Investor[] memory stocks = new Investor[](stockIds.length);

        for (uint256 i = 0; i < stockIds.length; i++) {
            stocks[i] = investorDetails[stockIds[i]];
        }

        return stocks;
    }
}