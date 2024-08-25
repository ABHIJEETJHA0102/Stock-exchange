
# StockTokenization Smart Contract

[ Details](desc.jpg)

## Overview

The `StockTokenization` smart contract is a Solidity-based contract designed to facilitate the purchase and transfer of tokenized stocks on the Ethereum blockchain. It allows users (referred to as "investors") to purchase stocks, transfer them, and view details of their stock holdings.

## Contract Features

- **Purchase Stocks**: Investors can buy stocks by specifying the stock name, quantity, amount paid, and contact number.
- **Transfer Stocks**: Investors can mark their stocks as transferred.
- **View Stock Details**: Retrieve detailed information about a specific stock purchase.
- **View Investor Stocks**: Retrieve all stocks purchased by a specific investor.

## Contract Structure

### `Investor` Struct

The `Investor` struct holds details about each stock purchase:
- `bytes32 id`: A unique identifier for the stock purchase.
- `uint256 amountPaid`: The amount paid for the stock at the time of purchase.
- `uint256 stockQuantity`: The quantity of the stock purchased.
- `string stockName`: The name of the stock purchased.
- `bool isTransferred`: Indicates whether the stock has been transferred.
- `uint256 contactNumber`: The contact number associated with the purchase.

### State Variables

- `uint256 public totalInvestors`: Counter that tracks the total number of investors, used to generate unique IDs.
- `mapping(bytes32 => Investor) public investorDetails`: Maps the `id` to the `Investor` struct, storing purchase details.
- `mapping(address => bytes32[]) public investorStocks`: Maps investor addresses to an array of `id`s representing their stock purchases.

### Events

- `event StockPurchase(bytes32 id, address investor, string stockName, uint256 stockQuantity, uint256 amountPaid)`: Emitted when a stock is purchased.
- `event StockTransfer(bytes32 id, address investor, string stockName, uint256 stockQuantity)`: Emitted when a stock is transferred.

### Functions

- **`purchaseStock(string memory _stockName, uint256 _stockQuantity, uint256 _amountPaid, uint256 _contactNumber) public returns (bytes32)`**:
  Allows investors to purchase a stock and returns a unique `id`.

- **`transferStock(bytes32 _id) public`**:
  Allows investors to mark a stock as transferred using its `id`.

- **`viewStockDetails(bytes32 _id) public view returns (Investor memory)`**:
  Retrieves details of a specific stock purchase using its `id`.

- **`viewInvestorStocks(address _investor) public view returns (Investor[] memory)`**:
  Retrieves all stocks purchased by a specific investor.

## Usage

1. **Purchasing Stocks**:
   Call the `purchaseStock` function with the stock name, quantity, amount paid, and contact number. This generates a unique `id` and stores the purchase details.

2. **Transferring Stocks**:
   Call the `transferStock` function with the `id` of the stock you want to mark as transferred.

3. **Viewing Stock Details**:
   Call the `viewStockDetails` function with the `id` to retrieve details of a specific stock purchase.

4. **Viewing Investor Stocks**:
   Call the `viewInvestorStocks` function with the investor's address to retrieve all stocks purchased by that investor.

## Security Considerations

- **Unique IDs**: The contract generates unique IDs using a combination of `block.timestamp`, `msg.sender`, and an incrementing counter. This approach reduces the likelihood of ID collisions but should be reviewed for robustness.
- **Access Control**: Implement additional access control mechanisms if needed to restrict stock transfers or other sensitive operations.

## Developer Details

- **Name**: Abhijeet Kumar Jha
- **Email**: abhijeetjha0809@gmail.com
- **GitHub**: [ABHIJEETJHA0102](https://github.com/ABHIJEETJHA0102)

## Deployment Details

- **Chain**: EduChain
- **Contract ID**: 0xa47c8bde1c76b5a5e9c3af7b0b2d4c2e7f5c9e4a

![Contract Details](image.png)
