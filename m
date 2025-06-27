Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557C1E8322
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058372; cv=none; b=fSvamciTBd1jrA1M70LDF4q+8raglQKvnb+LJmdoayoAQyMJbbwpvhrbdsAFpwcvKo4HvukjaWAhMy2+G/PYtC50ENZPqqYflsg6wUt99Yy0JiW4ysBgke5PXnvhp7tuWRcAbb3YK8JIxS2oDlJGd0Yw17ZA1HRScM065qYnC3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058372; c=relaxed/simple;
	bh=gh0jUXN8O9YvCgl8+M/s+gtwbCZXB/Rj1D9P+ER5Qmw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q7/N2qc/KnoozPz7PWL9f+U0Owq1DiApISSGhX9MSBd86sx3V46zj3J59farhGetobue5YH3SFi3Y+nGmOixcezq7rtmQGBWomdnd5yq6HsqrdITAZYkjSGepCNvNDQDP8oEKMDxDM88qdfUHQfRW+CH2aR3B4AVcyf9yYOp4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfCKTlXm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfCKTlXm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad572ba1347so35706066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751058369; x=1751663169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eSYaoh4Yj9Zkb3jRb/C3UshHoF2mGwDZUBrBeoxNDNU=;
        b=BfCKTlXmnFAR3i7MXep4Jp9Eq+9pwbxIfQRhtA9iSLvXfe5HPTJUUsCPm0HttAZEZa
         HEzCP5yehdKUZ7EPvYDEClGK1Z+9GRG58dwebSPOLK4UZjlr8r6RSkm1YFm82HzKPbvB
         xjkSadWaNoKn3zpmvF4b//H/cBa8CUhGxBVLXDH4A88DFu2jeUHR9oLkeNRUYtj7DW5U
         4hg0ErzpQHB8d3eUpesDVO0N0vWE4AwIY1Ec+sQXhjLwZl8DRV9lWfVlsA+1CjYu5Hio
         YetAJbvmr+BZKLTvh6C6ugKh3V9WX0FIzGBVfEG2IaQUGqrY24Qw3bVSNNYuTt4PPxxU
         f0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751058369; x=1751663169;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSYaoh4Yj9Zkb3jRb/C3UshHoF2mGwDZUBrBeoxNDNU=;
        b=S0n203bRSmmhvI4IaucSWxT2eR3krnrgniz9iy3rHeXQhMsoB5saI4afCtd66+qP5W
         9fH2UvM6VgCofExPMOf5M5MvEOB/6hN9gmxHZagZ4MS9Iu1BfFR+nTqX2/DOF9P74YFZ
         dI6GtbAsI+WHI05w1ZPfZcCfJLyYKvwfaFLlpOK5lKe39+Ue0r68HS10oTdMgR87vZl9
         ZPGddYtpDbR8b1niM5ImK7ugKDtYALi2mWiv+qFsXioxY5HUkGQfbQ1Nr9jWJgrU35Hg
         HFK/reM+3/jZ6gGfnBQozGrW9llM3PrAb4fDkC3q3epwvOuUgRjZD+LsUfWDY2EvQIWh
         Cxog==
X-Forwarded-Encrypted: i=1; AJvYcCVM28H/2iWkNj+E2Pw9j/jow7Cr2XSS9mS/CJQmWYokMdAVvTi5d2u2peptDmLH+UIvaWdLb1paDXeOhio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0ywrjbssQ9bV38XrzVkZ1zvx6BXNWL15zVxJhD7WC7nMV4Xr
	Q7OKMdKlU5V994CIQbspvwW1IJT362Y9YseNFYhcBCUJq8DSMoq1+OqPp6JitFvmEijNMKIF6Lq
	JyVNVQsuKRi/CwvmW1v80EBtlU6k4PxE=
X-Gm-Gg: ASbGnctlS++KIb0PeOegQ3hALb+25LXwCb30iDWXXE6bZEBiDgxx3FlfEoPCpMyjriR
	6RPHxhaEFw1NW1Uyu+Y3CF16g009tIiRsSP+VDXtnk0e6+HJ6+ZriX8SZL0VNIjCR+ee9JHSb8H
	ElzpStg0Wni1w37DtOJjnCCFRBsfJEwwB1i91uc/Xldp914+qmaOYv
X-Google-Smtp-Source: AGHT+IGZUTI57KVsgYCiHEJrvVeih/CZV0VDCz3mpT5lhxBjBjnrXq8uakq9lpRyXmdoT6S7lzgYSnGN4HYTC+LSuDA=
X-Received: by 2002:a17:906:7308:b0:ae0:ad5c:418b with SMTP id
 a640c23a62f3a-ae3500ff37cmr431380066b.45.1751058368343; Fri, 27 Jun 2025
 14:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 28 Jun 2025 07:05:56 +1000
X-Gm-Features: Ac12FXxKVxFQX5SfCokGjJXthgR-g7tweuzjxWnSMqqMKCFfZTX517Ve6UycV34
Message-ID: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Regular weekly drm updates, nothing out of the ordinary, amdgpu, xe,
i915 and a few misc bits. Seems about right for this time in the
release cycle.

Dave.

drm-fixes-2025-06-28:
drm fixes for 6.16-rc4

core:
- fix drm_writeback_connector_cleanup function signature
- use correct HDMI audio bridge in drm_connector_hdmi_audio_init

bridge:
- SN65DSI86: fix HPD

amdgpu:
- Cleaner shader support for additional GFX9 GPUs
- MES firmware compatibility fixes
- Discovery error reporting fixes
- SDMA6/7 userq fixes
- Backlight fix
- EDID sanity check

i915:
- Fix for SNPS PHY HDMI for 1080p@120Hz
- Correct DP AUX DPCD probe address
- Followup build fix for GCOV and AutoFDO enabled config

xe:
- Missing error check
- Fix xe_hwmon_power_max_write
- Move flushes
- Explicitly exit CT safe mode on unwind
- Process deferred GGTT node removals on device unwind
The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-28

for you to fetch changes up to 9fbceb37c95939182e1409211447a1d3f3db9274:

  Merge tag 'drm-misc-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-06-28 06:53:00 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc4

core:
- fix drm_writeback_connector_cleanup function signature
- use correct HDMI audio bridge in drm_connector_hdmi_audio_init

bridge:
- SN65DSI86: fix HPD

amdgpu:
- Cleaner shader support for additional GFX9 GPUs
- MES firmware compatibility fixes
- Discovery error reporting fixes
- SDMA6/7 userq fixes
- Backlight fix
- EDID sanity check

i915:
- Fix for SNPS PHY HDMI for 1080p@120Hz
- Correct DP AUX DPCD probe address
- Followup build fix for GCOV and AutoFDO enabled config

xe:
- Missing error check
- Fix xe_hwmon_power_max_write
- Move flushes
- Explicitly exit CT safe mode on unwind
- Process deferred GGTT node removals on device unwind

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/mes: add compatibility checks for set_hw_resource_1
      drm/amdgpu/sdma6: add ucode version checks for userq support
      drm/amdgpu/sdma7: add ucode version checks for userq support

Ankit Nautiyal (1):
      drm/i915/snps_hdmi_pll: Fix 64-bit divisor truncation by using div64_u64

Arnd Bergmann (1):
      drm/i915: fix build error some more

Chaoyi Chen (1):
      drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.16-2025-25-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Haoxiang Li (1):
      drm/xe/display: Add check for alloc_ordered_workqueue()

Imre Deak (1):
      drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS

Jayesh Choudhary (1):
      drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type

Karthik Poosa (1):
      drm/xe/hwmon: Fix xe_hwmon_power_max_write

Louis Chauvet (1):
      drm: writeback: Fix drm_writeback_connector_cleanup signature

Maarten Lankhorst (1):
      drm/xe: Move DSB l2 flush to a more sensible place

Mario Limonciello (2):
      drm/amd: Adjust output for discovery error handling
      drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value

Matthew Auld (1):
      drm/xe: move DPT l2 flush to a more sensible place

Michal Wajdeczko (2):
      drm/xe/guc: Explicitly exit CT safe mode on unwind
      drm/xe: Process deferred GGTT node removals on device unwind

Srinivasan Shanmugam (1):
      drm/amdgpu/gfx9: Add Cleaner Shader Support for GFX9.x GPUs

Takashi Iwai (1):
      drm/amd/display: Add sanity checks for drm_edid_raw()

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 28 ++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 19 ++++++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 10 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             | 19 +++++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             | 12 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 ++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  4 ++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 69 +++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c     |  7 ++-
 drivers/gpu/drm/display/drm_dp_helper.c            |  2 +-
 drivers/gpu/drm/drm_writeback.c                    |  7 ++-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |  4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  2 +-
 drivers/gpu/drm/xe/display/xe_display.c            |  2 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         | 11 ++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  5 +-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c                       | 11 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 10 ++--
 drivers/gpu/drm/xe/xe_hwmon.c                      | 34 +++++------
 21 files changed, 189 insertions(+), 81 deletions(-)
