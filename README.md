# UAC_Bypasses
A collection of Windows security UAC bypasses and documentation for learning about privilege boundaries, UAC behavior, and defensive detection.

![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Purpose](https://img.shields.io/badge/Purpose-Education-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📖 About

This repository contains educational security research material focused on understanding how Windows security features work, how privilege boundaries can be tested in controlled environments, and how defenders can identify suspicious behavior.

The goal is to help students, researchers, and defenders better understand Windows internals and improve security awareness.

---

## ⚠️ Disclaimer

This project is intended for:

- ✅ Security research
- ✅ Defensive learning
- ✅ CTFs and lab environments
- ✅ Authorized testing only

Do not use this material on systems you do not own or have explicit permission to test.

The author is not responsible for misuse, damage, or unauthorized activity performed using this material.

---

## 📚 Topics Covered

- Windows User Account Control (UAC)
- Privilege boundaries
- Windows security architecture
- Detection and mitigation concepts
- Defensive analysis techniques

---

## 🧪 Recommended Environment

For safe testing, use:

- A virtual machine
- A Windows test installation
- Snapshots before experiments
- No personal data

---

## 🛡️ Defensive Notes

Understanding offensive techniques helps defenders:

- Improve monitoring
- Configure security policies
- Detect suspicious activity
- Harden Windows environments

---

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

