// DemoCoin ICO

// Version of compiler

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo_coin_ico {

    // Introducing the maximum number of Hadcoins available for sale
    uint256 public max_demo_coin = 1000000;

    // Introducing the USD to Hadcoins conversion rate
    uint256 public usd_to_demo_coin = 1000;

    // Introducing the total number of Hadcoins that have bee bought by investors
    uint256 public total_demo_coin_bought = 0;

    // Mapping from the investor address to its equity in Hadcoins and USD
    mapping(address => uint256) equity_demo_coin;
    mapping(address => uint256) equity_usd;

    // Checking if an investor can buy Hadcoins
    modifier can_buy_demo_coin(uint256 usd_invested) {
        require(
            usd_invested * usd_to_demo_coin + total_demo_coin_bought <=
                max_demo_coin
        );
        _;
    }

    // Getting the equity in Hadcoins of an investor
    function equity_in_demo_coin(address investor)
        external
        view
        returns (uint256)
    {
        return equity_demo_coin[investor];
    }

    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external view returns (uint256) {
        return equity_usd[investor];
    }

    // Buying coins
    function buy_demo_coins(address investor, uint32 usd_invested)
        external
        can_buy_demo_coin(usd_invested)
    {
        uint256 demo_coin_bought = usd_invested * usd_to_demo_coin;
        equity_demo_coin[investor] += demo_coin_bought;
        equity_usd[investor] += usd_invested;
        total_demo_coin_bought += demo_coin_bought;
    }

    //Selling coins
    function sell_demo_coins(address investor, uint32 demo_coin_sold) external {
        equity_demo_coin[investor] -= demo_coin_sold;
        equity_usd[investor] = equity_demo_coin[investor] / usd_to_demo_coin;
        total_demo_coin_bought -= demo_coin_sold;
    }
}