# CMD_UAC_Bypass


# BATCH & POWERSHELL UAC Bypasses Tierlist
| Tier | Method | Reliability | Detection Risk | Notes |
|------|--------|-------------|----------------|-------|
| S | Fodhelper | ★★★★★ | Medium | Best overall. Most consistent on Windows 10 & Windows 11. |
| S | ComputerDefaults | ★★★★★ | Medium | Almost as good as Fodhelper. Strong backup. |
| A | SilentCleanup | ★★★★☆ | Low-Medium | Very good fallback. Uses scheduled task. |
| B | WSReset | ★★★☆☆ | Medium | Works decently, but less stable than S-tier. |
| B | MMC (mscfile) | ★★★☆☆ | High | Classic technique, but often patched/detected. |
| C | CMSTP | ★★☆☆☆ | Medium-High | Older technique, works on some systems. |
| C | Eventvwr | ★★☆☆☆ | High | Mostly patched on modern Windows. |
| D | Sdclt | ★☆☆☆☆ | High | Largely patched since ~2018. Least recommended. |

