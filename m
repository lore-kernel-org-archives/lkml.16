Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83C634
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799612; cv=none; b=d6lt/LkZbWzBmdZqEc7xpYzBSnC0r04GuxDzF8GsOivwm+Yd9InZuzdQuQgnORti6dZR6Q85pyVPi3wfrybBRN8kGYlfK0DfFkWm5HYbLFonwx6wl0mnK2dgVOTlfDcggcCpJkd3BwbnFEk8tqH9mJrd5oM1Z06oklE3kJczMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799612; c=relaxed/simple;
	bh=3YEL4jWV2gmSn5Eo6z3VpcSbx++CMKSfeZ5Ard044tw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dfmcDFeoLNwr74MAZAK4BmsiFBjNPtVDABTJaFULcZZAhU/1uZox+S/+F52VONw49bXg0WPUc8qsHqzroK0Y9RAT3m4GvMe23VFzbHIcsLII+qrFdbFN+nnRa4BBwiXnamM30vqJHiwt8N/xy6bQk4ATXTelR1mvHBcarTkmgag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikw62DF3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikw62DF3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso92401266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743799608; x=1744404408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6hRsnXtdDToRwE5VkYur5EcjHw55DqS5b6vMN9pCfr4=;
        b=ikw62DF3dJkX5SDQgQ0LYfETfzGtqmSax8tJX1NoBr38VJQSL+bTLitc1A8sJ9SSPZ
         TmrI0xjyH9QjgWOV5xCaukL2ZoHr4JGvyMktpwfrq8lHSUw3bxCowFILrZ3nI4JltNhM
         Tdeou5X7VvP8xt3C6ey7Jy5aoXdRZuPt6hShnH3equOXBfgrfKA/RB04ejaHkL2VCSre
         Yb1Oo7hblQnnMOpCyvmyFhfnDHFaJl8pd6U6p0tz5/rCS885GDAAy12jIlClI2gtB3BG
         GQkhBsw4ELBdHhGwUy33hLBOw3RSglo5/p6mindaynCDNRhv8TCIDdGZgg75mNR9ghl6
         6aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743799608; x=1744404408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hRsnXtdDToRwE5VkYur5EcjHw55DqS5b6vMN9pCfr4=;
        b=WK5JJasVJkk/v2Utqnn6sqkzGM4568mwSLlq1xkKPuWcHQHhm8k3FZ+Vnm8T7YEwJh
         5llqxjySp62U4H9doGZ0bqpBcQzcW4D7uBYmk+MvGWCZCjg8vasxYo1TBI79jtt1s/V+
         30vdBb/vyK4Fq7ojwWmJXzmPDr0VE+nV10gp/w8O/7c+eIPHb0/9eoLJIt2A3XNTjvl3
         xXMiuQdyDKiHOshdU4E50pOMbCpNfBdLoQUjWQNwyqs7ihxyx+biI7iuDnFqb9dH4FK1
         7EnAKSwrm1w5npX07Z99fLKOaSk/nfl3A+bFGUV2ClwWOeQMionEMsFW4Z4TRGLD8g/l
         oATw==
X-Gm-Message-State: AOJu0YxL0umAsQ4kKc4AeKnsgNhS+uTMcfsTNLlo+F4j5Itti56OCfOx
	aMUfeS1zT7kxr3mLpTlY3AFgyebHaOiIHpByNEWalYVy94LT+oqJRKaoKclKQrF+P3G30OehRL0
	8W4NTtU2Dqf2cC8hn+9nBF2XYL58C9C7Y
X-Gm-Gg: ASbGnct+P03D2Ky3dl+0IaeOeMpXQfZKeo8Ro0+WzrWg9IC5+j3q+H5UE68dVn72Q+M
	j7b+IbYwBln6MqYVYTbVxasS6aNJfaLZDDel74Ke0ctBXsWkqe45/nNkwsFgKDhRIw0t+ZStY9/
	4Q2lmt6X4xEo1ekvrfv8GMDCGD
X-Google-Smtp-Source: AGHT+IFpL3ZnB9lDuEP5Av7ZBTbINZTCZ+03xATDynYVrD77yLKvElf+pz1L127nTfVIsgeaoJcjyI5OKPc8QPFbEVo=
X-Received: by 2002:a17:907:2cc6:b0:ac6:b815:83ee with SMTP id
 a640c23a62f3a-ac7d1c35d38mr431590866b.43.1743799607507; Fri, 04 Apr 2025
 13:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 5 Apr 2025 06:46:35 +1000
X-Gm-Features: ATxdqUFQISWzBjVBOYCGg4eHEbpmZwyJMVRccY99sBggwBrSZbuwMv98o6CKmk0
Message-ID: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc1
To: LKML <linux-kernel@vger.kernel.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Weekly fixes, mostly from the end of last week, this week was very
quiet, maybe you scared everyone away. I probably should have
highlighted Jani's work more closely, but it never occured that anyone
would willingingly build a kernel without O=3D../toilet-builddir. This
doesn't contain any fixes for that stuff, Jani is working on it, and
hopefully you can help that make forward progress.

As for this, it's mostly amdgpu, and xe, with some i915, adp and
bridge bits, since I think this is overly quiet I'd expect rc2 to be a
bit more lively.

Regards,
Dave.

drm-next-2025-04-05:
drm fixes for 6.15-rc1

bridge:
- tda998x: Select CONFIG_DRM_KMS_HELPER

amdgpu:
- Guard against potential division by 0 in fan code
- Zero RPM support for SMU 14.0.2
- Properly handle SI and CIK support being disabled
- PSR fixes
- DML2 fixes
- DP Link training fix
- Vblank fixes
- RAS fixes
- Partitioning fix
- SDMA fix
- SMU 13.0.x fixes
- Rom fetching fix
- MES fixes
- Queue reset fix

xe:
- Fix NULL pointer dereference on error path
- Add missing HW workaround for BMG
- Fix survivability mode not triggering
- Fix build warning when DRM_FBDEV_EMULATION is not set

i915:
- Bounds check for scalers in DSC prefill latency computation
- Fix build by adding a missing include

adp:
- Fix error handling in plane setup
The following changes since commit cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c=
:

  Merge tag 'drm-intel-gt-next-2025-03-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2025-03-25 08:21:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-04-05

for you to fetch changes up to e2cb28ea3e01cb25095d1a341459901363dc39e9:

  Merge tag 'drm-misc-next-fixes-2025-04-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-04-05 06:28:03 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc1

bridge:
- tda998x: Select CONFIG_DRM_KMS_HELPER

amdgpu:
- Guard against potential division by 0 in fan code
- Zero RPM support for SMU 14.0.2
- Properly handle SI and CIK support being disabled
- PSR fixes
- DML2 fixes
- DP Link training fix
- Vblank fixes
- RAS fixes
- Partitioning fix
- SDMA fix
- SMU 13.0.x fixes
- Rom fetching fix
- MES fixes
- Queue reset fix

xe:
- Fix NULL pointer dereference on error path
- Add missing HW workaround for BMG
- Fix survivability mode not triggering
- Fix build warning when DRM_FBDEV_EMULATION is not set

i915:
- Bounds check for scalers in DSC prefill latency computation
- Fix build by adding a missing include

adp:
- Fix error handling in plane setup

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx11: fix num_mec
      drm/amdgpu/gfx12: fix num_mec

Ankit Nautiyal (1):
      drm/i915/watermark: Check bounds for scaler_users for dsc prefill lat=
ency

Arnd Bergmann (1):
      drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER

Asad Kamal (3):
      drm/amd/pm: Remove host limit metrics support
      drm/amd/pm: Update smu metrics table for smu_v13_0_6
      drm/amd/pm: Add gpu_metrics_v1_8

Brendan Tam (1):
      drm/amd/display: prevent hang on link training fail

Candice Li (1):
      Remove unnecessary firmware version check for gc v9_4_2

Charlene Liu (1):
      Revert "drm/amd/display: dml2 soc dscclk use DPM table clk setting"

Christian K=C3=B6nig (1):
      drm/amdgpu: stop unmapping MQD for kernel queues v3

Dan Carpenter (1):
      drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()

Dave Airlie (5):
      Merge tag 'drm-misc-next-fixes-2025-03-27' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-fixes-2025-03-25' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-03-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.15-2025-03-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2025-04-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next

Denis Arefev (5):
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero

Harish Chegondi (1):
      drm/xe/eustall: Fix a possible pointer dereference after free

Jesse.zhang@amd.com (1):
      Revert "drm/amdgpu/sdma_v4_4_2: update VM flush implementation for SD=
MA"

Leo Li (2):
      drm/amd/display: Increase vblank offdelay for PSR panels
      drm/amd/display: Actually do immediate vblank disable

Lijo Lazar (2):
      drm/amdgpu: Add NPS2 to DPX compatible mode
      drm/amdgpu: Prefer shadow rom when available

Lucas De Marchi (2):
      drm/xe: Move survivability back to xe
      drm/xe: Set survivability mode before heci init

Mario Limonciello (1):
      drm/amd: Handle being compiled without SI or CIK support better

Michal Wajdeczko (1):
      drm/xe/vf: Don't check CTC_MODE[0] if VF

Stanley.Yang (1):
      drm/amdgpu: Update ta ras block

Tomasz Paku=C5=82a (1):
      drm/amd/pm: Add zero RPM enabled OD setting support for SMU14.0.2

Vinay Belgaumkar (1):
      drm/xe: Apply Wa_16023105232

Xiang Liu (2):
      drm/amdgpu: Use correct gfx deferred error count
      drm/amdgpu: Parse all deferred errors with UMC aca handle

Yue Haibing (2):
      drm/i915/display: Fix build error without DRM_FBDEV_EMULATION
      drm/xe: Fix unmet direct dependencies warning

 drivers/gpu/drm/adp/adp_drv.c                      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   8 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |  34 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  44 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  58 ++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  88 ++--------------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  90 ++--------------
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 104 +++--------------=
--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  45 +-------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  58 ++---------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  66 +++---------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  79 +++-----------
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_sdma_pkt_open.h  |  70 -------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  41 ++++++--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   7 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 114 +++++++++++++++++=
++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |   2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  15 ---
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  55 +++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/bridge/Kconfig                     |  13 +--
 drivers/gpu/drm/i915/display/intel_fbdev.h         |   2 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   5 +-
 drivers/gpu/drm/xe/Kconfig                         |   2 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   4 +
 drivers/gpu/drm/xe/xe_device.c                     |  17 ++-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |  54 +++++++---
 drivers/gpu/drm/xe/xe_gt_types.h                   |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  33 ++++++
 drivers/gpu/drm/xe/xe_pci.c                        |  16 ++-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |  31 ++++--
 drivers/gpu/drm/xe/xe_survivability_mode.h         |   1 -
 drivers/gpu/drm/xe/xe_wa.c                         |   6 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   2 +
 52 files changed, 537 insertions(+), 701 deletions(-)
