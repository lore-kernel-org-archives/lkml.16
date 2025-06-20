Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCEFBA36
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750389948; cv=none; b=ImGuf4aEgww+KgccFCDXwruX+/68N+jL+rKw2CB7Pqx6gjww9gy118WV9LGlO+8yNebjB8VN1p4FCz4rds52Wbbf7lqGc2nVcrFpALt0+rCsELTdxDxEJqRFdy8PAtX9ztpYyPLGjPD8nzTJXT5pk0lqHhuaSLChedqnNuszOGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750389948; c=relaxed/simple;
	bh=lcDWlvtzuHPc+E8Ni+ZTgcrclOTEBBYAnluToWL98lI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ojW/gzXna9T2x17pPz+XVp4zf+ZC/jGrS0LyzutzW67D33NR67JdEEvyWo6VOx7Tvtrgv1d5TxgyLq64T7CAMxU18q25va/Dw8xwbfMqby2IWIyWYx4gkiJlKsMqVob8pBAWMt6BoN+oOqy0UiZ8b3F2KAhBc9/Hxg+d5j65xkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+lRmISq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+lRmISq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad883afdf0cso286047766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750389945; x=1750994745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fNc/KZVyF2TYBehYCjjppQsaMuU91LnLZJJtO4t02lA=;
        b=P+lRmISqH6JwCerqrEnwTgpLBwFlMhJa4oSs2wk/GnuDYVBgbkLLZM9gVvFxLZ4YaQ
         Z47CCH4lH2NLbNfJpYS+YAonebCWBdtu+Bfe7EZctdVGGCTFHIn/2MjZQ5tFgeJGr34r
         lJI+lKbaaq8stsTLtT2cOon5ANnB1ASi8I5XekJez/fXkIPKVt3b9BWY2EXMGo2Q9c+i
         8jFfgaNDRsi6xWvb/GNElzSAhGidY4JC1WR9UpPhhMkXftDONJu2UOornp3K3vyAqyVY
         VeEdliiXVHT3cFryzt3puhh3nb0xhKKD5l+HfPpD2hnJlP7W0NwPsCgKE2ydbWhk7/dN
         9Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750389945; x=1750994745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNc/KZVyF2TYBehYCjjppQsaMuU91LnLZJJtO4t02lA=;
        b=iqy07QpLiNlkK8GFXjB/upHN1DBPjl7ojG9h3VYJq4dtvdLB7fuHxXpkcJm/sHkd1v
         AgV63JPj8K/Ln+Z8oaYfj3/TgBwV7mtX64AoWlhLq0RQlTD1Ds6ESg8z/Sucq1mLU9MR
         gVXVsX3GpaPAokn/sMVFN9fsFXFhc2ypJ7/xWFBFQL7DLknWF7NcsDWJ/jIufleTuW5J
         U17tzEMyoUgnDO1a2slxFo1OUjCYnBKWladAMkmiQG/qDzuAnqySJ+0aPKUJD6OC1XY8
         /PuYbmzycixlU64h+6HrX/Hn8j16EAgus98ImQ3HxkwJJTaPAfBn8qgNL2p1ztfYO7wB
         S4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcjnlcjhCiIwgbeTN9NEyJB29PHj268/LJBM4Udw9CRWqPkhJWL7Jq3W6d39Vy5wSlx8RlZWroIsVI10I=@vger.kernel.org
X-Gm-Message-State: AOJu0YytGbcfdkXXolVuQfKBdLcLzKxktgkildrPQrEIPoRIrjshuu7X
	K2s3sqF0Cv8/II56+rP/uLoxW+bgRUkFflk9kiXt3ek60zvPr83M7KcYLMHHoQacO45ah8ojx0+
	OZDHH6K5Ry1B+5kw61LnqK4BjB7w1WBck8dAqMTE=
X-Gm-Gg: ASbGncu1CP2bF1jrKfaoshE7rHyPqkL16yuXtQXd9Q+FiiRbKEfjbw881Xlggz/0ETF
	S2SWLFdeEzSUTs4Ux1zVRcZN8I0l9D4YhtNVu73TwHRjZIzafDl0Tiy3EiNyDBvaF81gahbSlB7
	kep8w5/eGz1d6ESMaEOASo8/04jxTeJ7iPZP3udqPqeg==
X-Google-Smtp-Source: AGHT+IET8xWO1D+x00RVkTeuPqvd992UPFSm86bfBkgnM4s78zQiG2ovHpKlTOImo44IANEEWFSQZ5F+OYX/DAbMyhc=
X-Received: by 2002:a17:907:3f0c:b0:adb:469d:2221 with SMTP id
 a640c23a62f3a-ae057bb8de1mr82186766b.45.1750389944395; Thu, 19 Jun 2025
 20:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Jun 2025 13:25:32 +1000
X-Gm-Features: AX0GCFvn3TUUoghVh90ptscpSJQdBrJP2lqef56U6lSm5W85zQX-UWdzoa77-pI
Message-ID: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Bit of an uptick in fixes for rc3, msm and amdgpu leading the way,
with i915/xe/nouveau with a few each and then some scattered misc
bits, nothing looks too crazy,

Dave.

drm-fixes-2025-06-20:
drm fixes for 6.16-rc3

msm:
- Display:
  - Fixed DP output on SDM845
  - Fixed 10nm DSI PLL init
- GPU:
  - SUBMIT ioctl error path leak fixes
  - drm half of stall-on-fault fixes.
  - a7xx: Missing CP_RESET_CONTEXT_STATE
  - Skip GPU component bind if GPU is not in the device table.

i915:
- Fix MIPI vtotal programming off by one on Broxton
- Fix PMU code for GCOV and AutoFDO enabled build

xe:
- A workaround update
- Fix memset on iomem
- Fix early wedge on GuC Load failure

amdgpu:
- DP tunneling fix
- LTTPR fix
- DSC fix
- DML2.x ABGR16161616 fix
- RMCM fix
- Backlight fixes
- GFX11 kicker support
- SDMA reset fixes
- VCN 5.0.1 fix
- Reset fix
- Misc small fixes

amdkfd:
- SDMA reset fix
- Fix race in GWS scheduling

nouveau:
- update docs reference
- fix backlight name buffer size
- fix UAF in r535 gsp rpc msg
- fix undefined shift

mgag200:
- drop export header

ast:
- drop export header

malidp:
- drop informational error

ssd130x:
- fix clear columns

etnaviv:
- scheduler locking fix

v3d:
- null pointer crash fix
The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e=
:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-20

for you to fetch changes up to b8de9b21e8499a09ef424e101a8703e8e1866bfd:

  Merge tag 'drm-xe-fixes-2025-06-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-06-20 09:01:51 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc3

msm:
- Display:
  - Fixed DP output on SDM845
  - Fixed 10nm DSI PLL init
- GPU:
  - SUBMIT ioctl error path leak fixes
  - drm half of stall-on-fault fixes.
  - a7xx: Missing CP_RESET_CONTEXT_STATE
  - Skip GPU component bind if GPU is not in the device table.

i915:
- Fix MIPI vtotal programming off by one on Broxton
- Fix PMU code for GCOV and AutoFDO enabled build

xe:
- A workaround update
- Fix memset on iomem
- Fix early wedge on GuC Load failure

amdgpu:
- DP tunneling fix
- LTTPR fix
- DSC fix
- DML2.x ABGR16161616 fix
- RMCM fix
- Backlight fixes
- GFX11 kicker support
- SDMA reset fixes
- VCN 5.0.1 fix
- Reset fix
- Misc small fixes

amdkfd:
- SDMA reset fix
- Fix race in GWS scheduling

nouveau:
- update docs reference
- fix backlight name buffer size
- fix UAF in r535 gsp rpc msg
- fix undefined shift

mgag200:
- drop export header

ast:
- drop export header

malidp:
- drop informational error

ssd130x:
- fix clear columns

etnaviv:
- scheduler locking fix

v3d:
- null pointer crash fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: switch job hw_fence to amdgpu_fence
      drm/amdgpu/sdma5: init engine reset mutex
      drm/amdgpu/sdma5.2: init engine reset mutex

Alex Hung (2):
      drm/amd/display: Fix mpv playback corruption on weston
      drm/amd/display: Check dce_hwseq before dereferencing it

Alexander Stein (1):
      drm/arm/malidp: Silence informational message

Bagas Sanjaya (1):
      Documentation: nouveau: Update GSP message queue kernel-doc reference

Colin Ian King (1):
      drm/nouveau/gsp: Fix potential integer overflow on integer shifts

Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

Daniele Ceraolo Spurio (1):
      drm/xe: Fix early wedge on GuC load failure

Dave Airlie (5):
      Merge tag 'drm-msm-fixes-2025-06-16' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-intel-fixes-2025-06-18' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.16-2025-06-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-06-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Frank Min (2):
      drm/amdgpu: Add kicker device detection
      drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13

Jacob Keller (1):
      drm/nouveau/bl: increase buffer size to avoid truncate warning

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Jay Cornwall (1):
      drm/amdkfd: Fix race in GWS queue scheduling

Jesse Zhang (3):
      drm/amdgpu: Fix SDMA engine reset with logical instance ID
      drm/amdgpu: Use logical instance ID for SDMA v4_4_2 queue operations
      drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences

Jesse.Zhang (1):
      drm/amdkfd: move SDMA queue reset capability check to node_show

John Keeping (1):
      drm/ssd130x: fix ssd132x_clear_screen() columns

Krzysztof Kozlowski (1):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate

Lijo Lazar (1):
      drm/amdgpu: Release reset locks during failures

Lucas De Marchi (1):
      drm/xe: Fix memset on iomem

Mario Limonciello (2):
      drm/amd/display: Only read ACPI backlight caps once
      drm/amd/display: Export full brightness range to userspace

Ma=C3=ADra Canal (2):
      drm/v3d: Avoid NULL pointer dereference in `v3d_job_update_stats()`
      drm/etnaviv: Protect the scheduler's pending list with its lock

Michael Strauss (1):
      drm/amd/display: Get LTTPR IEEE OUI/Device ID From Closest LTTPR To H=
ost

Nicholas Kazlauskas (1):
      drm/amd/display: Add more checks for DSC / HUBP ONO guarantees

Peichen Huang (1):
      drm/amd/display: Add dc cap for dp tunneling

Rob Clark (6):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

Sonny Jiang (1):
      drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause

Thomas Zimmermann (2):
      drm/ast: Do not include <linux/export.h>
      drm/mgag200: Do not include <linux/export.h>

Tzung-Bi Shih (1):
      drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_16023588340

Yihan Zhu (1):
      drm/amd/display: Fix RMCM programming seq errors

Zhi Wang (1):
      drm/nouveau: fix a use-after-free in r535_gsp_rpc_push()

 Documentation/gpu/nouveau.rst                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 82 +++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 30 ++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            | 12 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 16 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           | 16 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          | 17 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  6 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 ++
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |  9 ++-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 10 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 57 +++++++++------
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 33 +++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  8 ++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  4 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  5 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 28 ++++++++
 .../display/dc/link/protocols/link_dp_capability.c | 38 ++++++++--
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |  3 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |  3 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  3 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |  3 +
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 12 +++-
 drivers/gpu/drm/arm/malidp_planes.c                |  2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |  5 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  4 +-
 drivers/gpu/drm/mgag200/mgag200_ddc.c              |  1 -
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  5 --
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 18 +++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 39 +++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 54 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 ++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  7 ++
 drivers/gpu/drm/msm/msm_debugfs.c                  | 32 +++++++++
 drivers/gpu/drm/msm/msm_drv.c                      | 10 ++-
 drivers/gpu/drm/msm/msm_drv.h                      | 23 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c               | 17 ++++-
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 +++---
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 +--
 drivers/gpu/drm/msm/msm_iommu.c                    | 12 ++--
 drivers/gpu/drm/msm/msm_mmu.h                      |  2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  3 +-
 drivers/gpu/drm/msm/registers/gen_header.py        |  8 ++-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 17 +++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c  |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  8 ++-
 drivers/gpu/drm/xe/xe_gt.c                         |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  8 +++
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  7 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |  5 ++
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  3 +
 72 files changed, 599 insertions(+), 201 deletions(-)
