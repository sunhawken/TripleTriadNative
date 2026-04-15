#pragma once

#include <RE/Skyrim.h>
#include <SKSE/SKSE.h>

namespace TT::Papyrus {
    bool Register(RE::BSScript::IVirtualMachine* a_vm);
    void RegisterCosave();
}
