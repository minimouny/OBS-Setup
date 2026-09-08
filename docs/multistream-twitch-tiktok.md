# Twitch + TikTok Simultaneous Streaming on macOS

## Architecture

Use OBS Studio with Aitum Stream Suite.

- Twitch output: landscape 16:9
- TikTok output: portrait 9:16
- Both outputs originate from the same OBS session.
- Keep stream keys out of GitHub.

## Twitch output

Recommended starting point:

- Canvas/output: 1920x1080
- FPS: 60 if the Mac and connection can sustain it, otherwise 30
- Rate control: CBR
- Video bitrate: 6000 Kbps starting point
- Keyframe interval: 2 seconds
- Audio: AAC, 160-320 Kbps
- Encoder: Apple VT H264 Hardware Encoder when available

If performance is poor, reduce Twitch to 1664x936 or 1280x720 before lowering frame rate.

## TikTok output

Recommended vertical starting point:

- Canvas/output: 1080x1920
- FPS: 30 or 60 depending on content and Mac headroom
- Rate control: CBR
- Video bitrate: 5400 Kbps starting point
- Keyframe interval: 2 seconds
- Audio: AAC
- Encoder: Apple VT H264 Hardware Encoder when available

TikTok access varies by account. Direct OBS/RTMP streaming requires TikTok to provide your account a server URL and stream key. If TikTok does not expose those credentials for the account, the alternative desktop workflow may require TikTok LIVE Studio or another TikTok-authorized ingest method.

## Scene design

Create a normal landscape scene collection for Twitch and a vertical canvas in Aitum for TikTok.

Suggested scene names:

1. Starting Soon
2. Main
3. BRB
4. Ending

For the TikTok vertical canvas, reuse the same camera/game/screen sources where possible, but crop and reposition them for 9:16 rather than stretching the 16:9 Twitch composition.

## Audio

Keep one consistent program mix for both services unless you have a specific reason to separate them.

Suggested ordering:

- Microphone: primary voice
- Game/application audio: below voice
- Music: lower than voice and application audio
- Alerts: audible but not dominant

Use OBS monitoring only when needed to prevent echo or doubled audio.

## Installation

From this repository:

```bash
chmod +x scripts/*.sh
./scripts/install_obs.sh
./scripts/install_aitum_stream_suite.sh
```

Restart OBS after installing Aitum Stream Suite.

## Security

Never put Twitch or TikTok stream keys in this repository, screenshots, shell scripts, issue comments, or commits.

Enter keys only in OBS/Aitum's service configuration on the Mac.

## Launch checklist

Before going live:

- Confirm Twitch output is landscape.
- Confirm TikTok output is portrait.
- Confirm microphone level is healthy and not clipping.
- Confirm desktop/game audio is present once, not doubled.
- Confirm no private windows or notifications are visible.
- Confirm Twitch title/category.
- Confirm TikTok title/topic settings where applicable.
- Run a short private/test stream if the platform offers one.
- Check dropped frames and CPU/GPU load for several minutes before relying on the setup.
