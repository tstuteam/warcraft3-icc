
#guard Buff

define
{
    SUFFIX_BUFF_NAME
    HERO_COUNT

    <INIT_BUFF_STRUCT()> =
    {
        struct HeroWithBuff ## SUFFIX_BUFF_NAME extends array
        {
            private unit hero
            private bool onBuff

            void setHero(unit u)
            {
                this.hero = u
            }

            unit getHero()
            {
                return this.hero
            }

            bool buffOnUnit()
            {
                return this.onBuff
            }

            void setBuffOnUnit()
            {
                this.onBuff = true
            }

            void resetBuffOnUnit()
            {
                this.onBuff = false
            }
        }
    }

    BUFF_ON_UNIT(i) = HeroWithBuff ## SUFFIX_BUFF_NAME[i].buffOnUnit()

    SET_BUFF_ON_UNIT(i) = HeroWithBuff ## SUFFIX_BUFF_NAME[i].setBuffOnUnit()

    RESET_BUFF_ON_HERO(i) = HeroWithBuff ## SUFFIX_BUFF_NAME[i].resetBuffOnUnit()

    GET_HERO(i) = HeroWithBuff ## SUFFIX_BUFF_NAME[i].getHero()

    ADD_UNIT(u) =
    {
        int ind = -1
        whilenot(ind++ == HERO_COUNT)
        {
            if( HeroWithBuff ## SUFFIX_BUFF_NAME[ind].getHero() == u ) { break }
            if( HeroWithBuff ## SUFFIX_BUFF_NAME[ind].getHero() == null ) 
            { 
                HeroWithBuff ## SUFFIX_BUFF_NAME[ind].setHero(u)
                break
            }
        }
        ind = -1
    }
}

void RemoveEnemies(group heroes)
{
    int i = -1
    unit temp = null
    int count = CountUnitsInGroup(heroes)
    whilenot(i++ == count - 1)
    {
        temp = FirstOfGroup(heroes)
        if( IsUnitEnemy( temp, Player(0) ) )
        {
            GroupRemoveUnit(heroes, temp)
        }
        else 
        {
            GroupRemoveUnit(heroes, temp)
            GroupAddUnit(heroes, temp)
        }
        temp = null
    }
}