//
//  LifestagesDatabase.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation


struct LifestagesDatabase {
    

    let lifestages = [LifeStage(name: "Egg Stage",
                                 food: "No food yet! Just becoming a cute baby caterpillar",
                                 stageDescription: "A butterfly starts life as a very small, round, oval or cylindrical egg.   Some butterfly eggs may be round, some oval and some may be ribbed while others may have other features.",
                                 imgFile: "lifestage1",
                                 bulletPoints: ["The egg shape depends on the type of butterfly.", "If you look close enough you can actually see the tiny caterpillar growing inside of it."], iconFile: "eggs"),
    
                    LifeStage(name: "Larva Stage",
                                 food: "Leaves, lots of leaves!",
                                 stageDescription: "When the egg finally hatches, most of you would expect for a butterfly to emerge, right?  Well, not exactly.  In the butterfly’s life cycle, there are four stages and this is only the second stage.  Butterfly larvae are actually what we call caterpillars. Caterpillars do not stay in this stage for very long and mostly, in this stage all they do is eat.",
                                 imgFile: "lifestage2",
                                 bulletPoints: ["When the egg hatches, the caterpillar will eat the start eating the leaf they born onto!", "The mother butterfly needs to pick the right type of leaf to lay her eggs on otherwise her baby will have nothing to eat!"], iconFile: "larva"),
    
                    LifeStage(name: "Chrysalis Stage",
                                   food: "You don't wanna know",
                                   stageDescription: "The pupa stage is one of the coolest stages of a butterfly’s life.  As soon as a caterpillar is done growing and they have reached their full length/weight, they form themselves into a pupa, also known as a chrysalis.",
                                   imgFile: "lifestage3",
                                   bulletPoints: ["Inside the chysalis the real action is happening called metamorphosis!", "Tissue, limbs and organs of a caterpillar have all been changed by the time the pupa is finished, and is now ready for the final stage of a butterfly’s life cycle."], iconFile: "chrysalis"),
    
                    LifeStage(name: "Adult Butterfly",
                                   food: "All the leaves!",
                                   stageDescription: "When the butterfly first emerges from the chrysalis, both of the wings are going to be soft and folded against its body. This is because the butterfly had to fit all its new parts inside of the pupa.",
                                   imgFile: "lifestage4",
                                   bulletPoints: ["As soon as the butterfly has rested after coming out of the chrysalis, it will pump blood into the wings in order to get them working and flapping", "When in the fourth and final stage of their lives, adult butterflies are constantly on the look out to reproduce and when a female lays their eggs on some leaves, the butterfly life cycle will start all over"], iconFile: "Butterfly") ]

}
