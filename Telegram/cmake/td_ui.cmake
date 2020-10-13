# This file is part of Telegram Desktop,
# the official desktop application for the Telegram messaging service.
#
# For license and copyright information please follow this link:
# https://github.com/telegramdesktop/tdesktop/blob/master/LEGAL

add_library(td_ui OBJECT)
init_target(td_ui)
add_library(tdesktop::td_ui ALIAS td_ui)

include(lib_ui/cmake/generate_styles.cmake)
include(cmake/generate_numbers.cmake)

set(style_files
    ui/td_common.style
    ui/filter_icons.style
    ui/chat/chat.style
    boxes/boxes.style
    dialogs/dialogs.style
    chat_helpers/chat_helpers.style
    calls/calls.style
    export/view/export.style
    info/info.style
    intro/intro.style
    media/player/media_player.style
    passport/passport.style
    profile/profile.style
    settings/settings.style
    media/view/media_view.style
    overview/overview.style
    window/window.style
)

set(dependent_style_files
    ${submodules_loc}/lib_ui/ui/colors.palette
    ${submodules_loc}/lib_ui/ui/basic.style
    ${submodules_loc}/lib_ui/ui/layers/layers.style
    ${submodules_loc}/lib_ui/ui/widgets/widgets.style
)

generate_styles(td_ui ${src_loc} "${style_files}" "${dependent_style_files}")
generate_numbers(td_ui ${res_loc}/numbers.txt)

target_precompile_headers(td_ui PRIVATE ${src_loc}/ui/ui_pch.h)
nice_target_sources(td_ui ${src_loc}
PRIVATE
    ${style_files}
    
    core/mime_type.cpp
    core/mime_type.h

    ui/chat/attach/attach_album_thumbnail.cpp
    ui/chat/attach/attach_album_thumbnail.h
    ui/chat/attach/attach_album_preview.cpp
    ui/chat/attach/attach_album_preview.h
    ui/chat/attach/attach_common.h
    ui/chat/attach/attach_extensions.cpp
    ui/chat/attach/attach_extensions.h
    ui/chat/attach/attach_prepare.cpp
    ui/chat/attach/attach_prepare.h
    ui/chat/attach/attach_single_file_preview.cpp
    ui/chat/attach/attach_single_file_preview.h
    ui/chat/message_bar.cpp
    ui/chat/message_bar.h
    ui/chat/pinned_bar.cpp
    ui/chat/pinned_bar.h
    ui/controls/emoji_button.cpp
    ui/controls/emoji_button.h
    ui/controls/send_button.cpp
    ui/controls/send_button.h
    ui/text/format_values.cpp
    ui/text/format_values.h
    ui/text/text_options.cpp
    ui/text/text_options.h
    ui/toasts/common_toasts.cpp
    ui/toasts/common_toasts.h
    ui/cached_round_corners.cpp
    ui/cached_round_corners.h
    ui/grouped_layout.cpp
    ui/grouped_layout.h
    
    ui/ui_pch.h
)

target_include_directories(td_ui
PUBLIC
    ${src_loc}
)

target_link_libraries(td_ui
PUBLIC
    tdesktop::td_lang
    desktop-app::lib_ui
)
