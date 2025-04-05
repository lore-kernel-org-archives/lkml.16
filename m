Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9A1519A3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743889879; cv=none; b=lBtn6TRCqlISs4R2rdTUEXxD1ef9w2FMe7stI+U6h71HuI+btQ4tX0STgDC1wEwK24UwwmAbJbm6HW8S01W//lLNDV3itPpXxTR7dLJzeN5T5tifYevXcMd5l5NGsPSJhZI2MyAsliE6GKTtEltcbPanl8ywyNADFIdoGXeXyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743889879; c=relaxed/simple;
	bh=P5DWl2I30SyfhYHAxACQ2xYl9w3uaYoXBVfAENUMvZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2CFTME40+rFUdT64NjA7ULzi6JaP3PyR0iavizgvkK66T4+F6uHLRaJ1HEeOVBTz0gEw+SdsMxEXfcjS2MNXfaR4wwzl6/AoJf8dqJYU+YZWUlW/Y8HyLoJ8ZGE9hJG4/N6qSn4eXMI90dd5kzigNCeKlFgJ9U8pWqYJhoO3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8EW2Xze; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8EW2Xze"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so4735516a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743889876; x=1744494676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud/ewkyrMmecxCAoYghhiOwHotHzqr4g+GeslqjCe6c=;
        b=E8EW2XzeoIkI6AFp5jcenN5fbTdAaQ9TeKD1rxBt3XHNTN+HBVAT9cNSJKbgYzIEyC
         jMhqcgoApNgOt5VRIXCS9npW2ddLFeQGTBD1aaFxgjkSbUGCU+5IeA+fQ6nuLNxWLoaL
         4m/k6yNzBwp16JemNl+xhx6T45GxF6933BW4oyMQZ4PyibNhLJgu4tmCke18bF0QjzJB
         jpc3Lw3RG9VAkOwyNJL2cI6BAa/HGqQWLqa9WB97FNxQCcEC6Kdx6eKtW8SwGuBCCwNf
         NHnZczzkS6xcxc7ibIHesopB3cajbf+AoZiw59bnYjLSxQPMq8STEMgY9euwe+Ynet49
         wUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743889876; x=1744494676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ud/ewkyrMmecxCAoYghhiOwHotHzqr4g+GeslqjCe6c=;
        b=MltF5sST4tUl53/pqr1elXI7wYrjGNjbyCTodVORL+wQywTXezp5Fwlno8iULeeFlO
         15J/vhfdBkED+1pnz2YUay7a+KEzYvfpB/9dA/FGs90M+OKGX+oArfaAyLACFhThAeuT
         cNzzGoVPjY69EpQPVwciKn+1+w8JPSbL23TNIBzOQQKSYwadzwnNO72y1VeVNvzHPzKb
         6BJeJIcjNTsWNLxhPWdsoNr1wqc/SRu1DiroH0PLBHKWdcY+DrNAgSjkNe63IrJLp8mp
         6mYB3U3+CtTn6glZjVt1H6Myn1ag6qn92r7AxhUZIvtvYa2Llb88cVBQw8syVD5155RK
         T81A==
X-Forwarded-Encrypted: i=1; AJvYcCUz7pOAokYhC8ReM5zfmYWv4fo6MJJE4ybvP/sCDIZBab7TRZvTzrwbHnrZaC2TLIqtcFVFDPyck50Sl/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YztUWMAF/iL+qdZte8dymA3Q0f4dDV/c2VgrZlrHGWlwpl0RR1S
	0GDbNGmEpvNftOpmWHTummTnt6/opG0cXfGszUPgPoGhwNN1WI5Oday3e/1SoQJ43R6whe3X0Mf
	/txTnVodXSNSp/JCaxVLMXHFmr14ppw==
X-Gm-Gg: ASbGncufD55TU0Oufj9zJ6xF8AIXOmTRytufN7kEntFOIc8e1HNReVFhw7wNRr4uzxW
	pq8DCIpQ4sMPjzPvVpYmgOkdLtrAGjP+6E10gFaGG9hkf/voWAqxrwloFOTCDcVzq0IEJICIiBt
	WGPdGZ5GZDYv3XGJIe8k7k+w5K
X-Google-Smtp-Source: AGHT+IFAxhkDCFaJYi76qMBfOVKfjwDqSmg52QSiii9D3+n5VtMsTZujiMhS77XfBrD2y9NbKG6S5rcj6BGl5aWIm2Y=
X-Received: by 2002:a17:907:9728:b0:ac6:b853:d07f with SMTP id
 a640c23a62f3a-ac7d185e3c9mr623776766b.2.1743889875776; Sat, 05 Apr 2025
 14:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
In-Reply-To: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 6 Apr 2025 07:51:03 +1000
X-Gm-Features: ATxdqUF9yBPE7wBNvjm6ewMZPMXF5vH9OnQtUrcGioOiPWZxiCWpEwcZdeL2T_Y
Message-ID: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
Subject: Fwd: [git pull] drm fixes for 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(resend including Linus this time, autocomplete picked the mailing list)

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
