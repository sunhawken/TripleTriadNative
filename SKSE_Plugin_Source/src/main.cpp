#include <RE/Skyrim.h>
#include <SKSE/SKSE.h>
#include <spdlog/sinks/basic_file_sink.h>

#include "Papyrus.h"

using namespace std::string_view_literals;
using namespace std::string_literals;

namespace {
    void InitLogging() {
        auto path = SKSE::log::log_directory();
        if (!path) return;

        *path /= std::string(PLUGIN_NAME) + ".log";

        auto sink = std::make_shared<spdlog::sinks::basic_file_sink_mt>(path->string(), true);
        auto log  = std::make_shared<spdlog::logger>("global"s, std::move(sink));
        log->set_level(spdlog::level::info);
        log->flush_on(spdlog::level::info);
        spdlog::set_default_logger(std::move(log));
    }

    void OnDataLoaded(SKSE::MessagingInterface::Message* a_msg) {
        if (a_msg->type == SKSE::MessagingInterface::kDataLoaded) {
            if (auto* papyrus = SKSE::GetPapyrusInterface()) {
                if (papyrus->Register(TT::Papyrus::Register)) {
                    SKSE::log::info("Papyrus functions registered");
                } else {
                    SKSE::log::error("Failed to register Papyrus functions");
                }
            }
        }
    }
}

// ── Plugin version (uses CommonLibSSE-NG macros) ────────────────
SKSEPluginInfo(
    .Version = { 1, 0, 0, 0 },
    .Name = PLUGIN_NAME,
    .Author = "Triple Triad Tweaked",
    .SupportEmail = "",
    .StructCompatibility = SKSE::StructCompatibility::Independent,
    .RuntimeCompatibility = SKSE::VersionIndependence::AddressLibrary
)

// ── Entry point ──────────────────────────────────────────────────
SKSEPluginLoad(const SKSE::LoadInterface* a_skse) {
    SKSE::Init(a_skse);
    InitLogging();

    // Runtime detection (multi-target build supports SE, AE, and VR).
    const char* runtime = "Unknown";
    if (REL::Module::IsVR())      runtime = "Skyrim VR";
    else if (REL::Module::IsAE()) runtime = "Skyrim AE";
    else if (REL::Module::IsSE()) runtime = "Skyrim SE";

    SKSE::log::info("{} v{} loaded on {}", PLUGIN_NAME, PLUGIN_VERSION, runtime);

    if (auto* messaging = SKSE::GetMessagingInterface()) {
        messaging->RegisterListener(OnDataLoaded);
    }

    return true;
}
