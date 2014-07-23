------------------Ad Category------------------------
--C1  = Clothing
--C2  = Sports
--C3  = Jewelry
--C4  = Digital
--C5  = Appliance
--C6  = Cosmetic
--C7  = Baby
--C8  = HouseHold
--C9  = Daily
--C10 = Car
--C11 = Pets&Entertaiment
--C12 = Service
-----------------segmentations-----------------------
--X1  = male
--X2  = female
--X3  = western
--X4  = eastern
--X5  = developed
--X6  = undeveloped
-------------------------------------------------
local cjson = require 'cjson'
function get_init_data()
    local RATE = {
                C1 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C2 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C3 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
    
                C4 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C5 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C6 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C7 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                }, 
                
                C8 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                }, 
                
                C9 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C10 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C11 = {
                        p  = 1/12,
                        X1 = 0.5 ,
                        X2 = 0.5 ,
                        X3 = 0.5 ,
                        X4 = 0.5 ,
                        X5 = 0.5 ,
                        X6 = 0.5
                },
                
                C12 = {
                        p  = 1/12,
                        X1 = 0.5,
                        X2 = 0.5,
                        X3 = 0.5,
                        X4 = 0.5,
                        X5 = 0.5,
                        X6 = 0.5
                }
        }

    local statistic = {
                    total = 0, 
                    detail ={
                          C1 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
                          
                          C2 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },

                          C3 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    

                          C4 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    
                          C5 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    
                          C6 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },

                          C7 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    
   
                          C8 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
                          
                          C9 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    

                          C10 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    

                          C11 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          },
    
   
                          C12 = {
                              n  = 0,
                              X1 = 0,
                              X2 = 0,
                              X3 = 0,
                              X4 = 0,
                              X5 = 0,
                              X6 = 0
                          }
                    }
    }
    local result = {}
    result.RATE = RATE
    result.statistic = statistic
    return cjson.encode(result)
end
