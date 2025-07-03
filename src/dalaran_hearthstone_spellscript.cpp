#include "SpellScriptLoader.h"
#include "SpellScript.h"
#include "Player.h"
#include "AreaDefines.h"

struct DalaranInnCoords
{
    static constexpr double X = 5851.55;
    static constexpr double Y = 636.693;
    static constexpr double Z = 647.513;
};

class spell_dalaran_hearthstone : public SpellScriptLoader
{
public:
    spell_dalaran_hearthstone() : SpellScriptLoader("dalaran_hearthstone") { }

    class spell_dalaran_hearthstone_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_dalaran_hearthstone_SpellScript);

        void HandleAfterCast()
        {
            if (Unit* caster = GetCaster())
            {
                Player* player = caster->ToPlayer();                
                player->TeleportTo(MAP_NORTHREND, DalaranInnCoords::X, DalaranInnCoords::Y, DalaranInnCoords::Z, player->GetOrientation());
            }
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_dalaran_hearthstone_SpellScript::HandleAfterCast);
        }
    };
    
    SpellScript* GetSpellScript() const override
    {
        return new spell_dalaran_hearthstone_SpellScript();
    }
};

void AddSC_spell_dalaran_hearthstone()
{
    new spell_dalaran_hearthstone();
}
