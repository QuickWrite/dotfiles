#!/usr/bin/env bash

WORKSPACE="$1"

read X Y < <(hyprctl cursorpos | tr -d ',')

MONITOR=$(
  hyprctl -j monitors | jq -r \
    --argjson X "$X" \
    --argjson Y "$Y" '
    .[] |
    select(
      $X >= .x and
      $X < (.x + .width) and
      $Y >= .y and
      $Y < (.y + .height)
    ) |
    .name
  '
)

hyprctl dispatch moveworkspacetomonitor "$WORKSPACE $MONITOR"
hyprctl dispatch workspace "$WORKSPACE"
