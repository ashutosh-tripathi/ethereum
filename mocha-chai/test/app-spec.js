const assert=require('assert');
const {expect}=require('chai');
const {add}= require('../src/app');



describe('the add function',()=>{
    it('should add two numbers',()=>{
        const result= add(1,2);
        console.log("result", result);
        assert.equal(result,3);
        expect(result).to.equal(3);
    });
    
    it('should be able to handle one number',()=>{
        const result=add(1);
        expect(result).to.equal(1);
    });
    it('should handle 0 numbers',()=>{
        const result=add();
        expect(result).to.equal(0);
    })
});