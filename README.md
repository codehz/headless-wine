## notes

### generate disabled dlls list

```bash
awk '/^enable_(.+)/ && !/=/ { print gensub(/_/, "-", "g", gensub(/^enable_(.+)/, "args+=(--disable-\\1)", "g", $1)) }' configure
```

### generate disabled features list

```bash
awk '/^with_(.+)/ && !/=/ { print gensub(/_/, "-", "g", gensub(/^with_(.+)/, "args+=(--without-\\1)", "g", $1)) }' configure
```
