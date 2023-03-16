module NamedAddr::BasicCoin {
    use std::signer;
    use std::error;
    
    const MODULE_OWNER: address = @NamedAddr;


    const ENOT_MODULE_OWNER: u64 = 0;
    const EINSUFFICIENT_BALANCE: u64 = 1;
    const EALREADY_HAS_BALANCE: u64 = 2;

    struct Coin has store {
        value: u64
    }

    
    struct Balance has key {
         val: u64
    }
    
   
     #[view]
    public fun get_bal(owner: address,val:u64){
        assert!(exists<Balance>(owner), error::not_found(ENOT_MODULE_OWNER));
        *&borrow_global<Balance>(owner).value
    }

    public entry fun balance_of(owner: address): u64 acquires Balance {
        
         let account_addr = signer::address_of(&account);
        if (!exists<Balance>(account_addr)) {
            move_to(&owner, Balance {
                message,
                message_change_events: account::new_event_handle<MessageChangeEvent>(&account),
            })
    }

    #[test(account = @0x1)] 
    #[expected_failure] 
    fun mint_non_owner(account: signer) acquires Balance {
        
        publish_balance(&account);
        assert!(signer::address_of(&account) != MODULE_OWNER, 0);
        mint(&account, @0x1, 10);

}
}


 

   