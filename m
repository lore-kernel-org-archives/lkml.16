Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952D17C219
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 05:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745040003; cv=none; b=eVkl/ayBm6Zl1M79ZJhv5oYkCvCRO+dTNY/yzHLPyIGM6ETsRxZfoj1hxPj6X8F44NKQ6auXQhRqBElBkZv/7PJoXCl2X4KsRzAZaORI1ssMLTGyNtzYFKKRgVKyBpZz1DSLaly4+R2TfmdBa3t8TStAmCZb+1WdZ1lCYh4HXpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745040003; c=relaxed/simple;
	bh=pfENF6ZO4GFUwtMBD4h5ZaW9MTwA7/zq2Dmyg693lV4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W8Am70MbkIY1O2BXPHeIKZ3StwLXmj1E8YmY2YAPdx5HbrZF+gcOYGKjRnngpeX5lVZPF2csAkMTna1UiQ7oGP38XtZFQ7p2NK/Au2BajkO+ecP8jZeCFtnH7ZzmeWndNbydF97qYNEPo1dOQuymm6dor4yr8Dlif8XCmJSg6Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp/PAmEI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp/PAmEI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac41514a734so366767766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745040000; x=1745644800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4qy193G/yKAzPZrbZZI+4C7rTMR6HHOb2/qcaQ+evw=;
        b=bp/PAmEI1IapozN+4i449kjMBYsK+YHvzevq7Xa4+0iqxf+BNPnVVdDxZQo9H6BaOK
         Elrg0EJ4aLzcgIzGXE2ZezUjDP9n94XhUDgQzzYDubI+WYfAtriUGSG7UAaZpEjbKlTe
         bJeadbdjG7LxF+rMQ4njkOu7Gg1A9+uI7z/KbsYCnhw/2TmLufzcdWLXIs9W92tEisI6
         rTMe3DCWPiCsNdyBhpFZmKf7oCjwqTxBk62WmfjDNyD36M31hNe8r44r8fJTi1ecssYT
         G9MIBZwtCzaX3BBJ/duwkO34fHOCk0ZgVsXBAogI1u8P2QCa9RRBV/8o62WRdoH38h4c
         9v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745040000; x=1745644800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4qy193G/yKAzPZrbZZI+4C7rTMR6HHOb2/qcaQ+evw=;
        b=gHB7N2QjpgDJhdVaCpy15jBVXhGYdeewHcJsPmRTyUhi2/Y/CcW81EcfNVrOmNYI5G
         j0yf3irmi+kALqVBW4xC7lHj/prldvPddhVY5ljR2JOtPhkTLPsjcaKm7vI90SauFHCl
         BpAkKDhni/hKEoxxIHquwkSCpemE15spC6h7F/YkkHD+AbqpH2+3+h7wB9apClCIBrGE
         cycnyUT/uAR6mUSXc61Sdp+zT37wC3N86mx20OZYWmF2Vr5wK66V1xKgvOQ9paneHK4r
         JkGE7NMGETXbaJp4pchGbhDAVmCy+KGXwJYNzxpQvQj4wfK+SUPGRuRJ0N6viJYC98nT
         J1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUy808dyJqGW2TgWYb2lQxw/v2xOsCyVHa5R2Y8dL8FO5DMd5WsHVaE9dj9fSMFIGP07zZzmLZosoYuvgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2mMQKN0It/L/gn8uIXv3dA7XZAtL4hK0KGGg0F1SO1hsK3672
	LP7VWi0VM2RtddN8wC5qGP5ozmu+vawAVMhpPNfAds4ESAPoseL1z8gI5Qg5lN+Gk2y2l52X/Bk
	/5+Kf2qQZTmRgCl9jjAoxi6KbC9g=
X-Gm-Gg: ASbGnctj+cBivqoCPjhOBggNVsuSgJBwPNg3jcsQqSjaur+MP6D/XdGRedEXFz469yC
	isYGu2E+829LO0PZhpqA4HKTRon0m4TXeDKuScwpwwyCkR2o7SNk4XUJ7GeSKbb1ozdRB6MrIKa
	pdo2Kp7dVqeb/eoSrDvq/zjO3jmH7R1+4=
X-Google-Smtp-Source: AGHT+IGX+H7blyO9O2IZIcMf/GbMEebHGvi3KDEWr5ty1K8Chcjwt7Xp7VuXDZRGe702QXmsX2Ex+rOJAFL7miwCGgM=
X-Received: by 2002:a17:907:d8e:b0:acb:30a9:8361 with SMTP id
 a640c23a62f3a-acb74db5f78mr411309466b.40.1745039999365; Fri, 18 Apr 2025
 22:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 19 Apr 2025 15:19:47 +1000
X-Gm-Features: ATxdqUE4L_w9F4cg0enA_0ANZpRSqXBY-u7vHQckr6-wKOW5jOmco9XtqJDmklg
Message-ID: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Easter rc3 pull request, fixes in all the usuals, amdgpu, xe, msm,
with some i915/ivpu/mgag200/v3d fixes, then a couple of bits in
dma-buf/gem.

Hopefully has no easter eggs in it,

Regards,
Dave.

drm-fixes-2025-04-19:
drm fixes for 6.15-rc3

dma-buf:
- Correctly decrement refcounter on errors

gem:
- Fix test for imported buffers

amdgpu:
- Cleaner shader sysfs fix
- Suspend fix
- Fix doorbell free ordering
- Video caps fix
- DML2 memory allocation optimization
- HDP fix

i915:
- Fix DP DSC configurations that require 3 DSC engines per pipe

xe:
- Fix LRC address being written too late for GuC
- Fix notifier vs folio deadlock
- Fix race betwen dma_buf unmap and vram eviction
- Fix debugfs handling PXP terminations unconditionally

msm:
- Display:
  - Fix to call dpu_plane_atomic_check_pipe() for both SSPPs in
    case of multi-rect
  - Fix to validate plane_state pointer before using it in
    dpu_plane_virtual_atomic_check()
  - Fix to make sure dereferencing dpu_encoder_phys happens after
    making sure it is valid in _dpu_encoder_trigger_start()
  - Remove the remaining intr_tear_rd_ptr which we initialized
    to -1 because NO_IRQ indices start from 0 now
- GPU:
  - Fix IB_SIZE overflow

ivpu:
- Fix debugging
- Fixes to frequency
- Support firmware API 3.28.3
- Flush jobs upon reset

mgag200:
- Set vblank start to correct values

v3d:
- Fix Indirect Dispatch
The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444=
:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-19

for you to fetch changes up to 0467145fab3b3a7a1efd221722310fe32329b3da:

  Merge tag 'drm-msm-fixes-2025-04-18' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-04-19
15:09:29 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc3

dma-buf:
- Correctly decrement refcounter on errors

gem:
- Fix test for imported buffers

amdgpu:
- Cleaner shader sysfs fix
- Suspend fix
- Fix doorbell free ordering
- Video caps fix
- DML2 memory allocation optimization
- HDP fix

i915:
- Fix DP DSC configurations that require 3 DSC engines per pipe

xe:
- Fix LRC address being written too late for GuC
- Fix notifier vs folio deadlock
- Fix race betwen dma_buf unmap and vram eviction
- Fix debugfs handling PXP terminations unconditionally

msm:
- Display:
  - Fix to call dpu_plane_atomic_check_pipe() for both SSPPs in
    case of multi-rect
  - Fix to validate plane_state pointer before using it in
    dpu_plane_virtual_atomic_check()
  - Fix to make sure dereferencing dpu_encoder_phys happens after
    making sure it is valid in _dpu_encoder_trigger_start()
  - Remove the remaining intr_tear_rd_ptr which we initialized
    to -1 because NO_IRQ indices start from 0 now
- GPU:
  - Fix IB_SIZE overflow

ivpu:
- Fix debugging
- Fixes to frequency
- Support firmware API 3.28.3
- Flush jobs upon reset

mgag200:
- Set vblank start to correct values

v3d:
- Fix Indirect Dispatch

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display/dml2: use vzalloc rather than kzalloc

Andrzej Kacprowski (2):
      accel/ivpu: Fix the NPU's DPU frequency calculation
      accel/ivpu: Show NPU frequency in sysfs

Ankit Nautiyal (2):
      drm/i915/display: Add macro for checking 3 DSC engines
      drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices

Chenyuan Yang (1):
      drm/msm/dpu: Fix error pointers in dpu_plane_virtual_atomic_check

Christian K=C3=B6nig (1):
      drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4

Dan Carpenter (1):
      dma-buf/sw_sync: Decrement refcount on error in
sw_sync_ioctl_get_deadline()

Daniele Ceraolo Spurio (1):
      drm/xe/pxp: do not queue unneeded terminations from debugfs

Dave Airlie (5):
      Merge tag 'amd-drm-fixes-6.15-2025-04-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-04-17' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-04-17' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-04-18' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-msm-fixes-2025-04-18' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

David Rosca (1):
      drm/amdgpu: Add back JPEG to video caps for carrizo and newer

Dmitry Baryshkov (1):
      drm/msm/dpu: drop rogue intr_tear_rd_ptr values

Jun Nie (1):
      drm/msm/dpu: check every pipe per capability

Karol Wachowski (2):
      accel/ivpu: Update FW Boot API to version 3.28.3
      accel/ivpu: Add cmdq_id to job related logs

Lijo Lazar (1):
      drm/amdgpu: Use the right function for hdp flush

Lucas De Marchi (1):
      drm/xe: Set LRC addresses before guc load

Maciej Falkowski (1):
      accel/ivpu: Flush pending jobs of device's workqueues

Mario Limonciello (1):
      drm/amd: Forbid suspending into non-default suspend states

Matthew Auld (2):
      drm/xe/userptr: fix notifier vs folio deadlock
      drm/xe/dma_buf: stop relying on placement in unmap

Ma=C3=ADra Canal (1):
      drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later

Qasim Ijaz (1):
      drm/msm/dpu: reorder pointer operations after sanity checks to
avoid NULL deref

Rob Clark (1):
      drm/msm/a6xx+: Don't let IB_SIZE overflow

Thomas Zimmermann (2):
      drm/gem: Internally test import_attach for imported objects
      drm/mgag200: Fix value in <VBLKSTR> register

ZhenGuo Yin (1):
      drm/amdgpu: fix warning of drm_mm_clean

 drivers/accel/ivpu/ivpu_drv.c                      |  10 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  17 ++-
 drivers/accel/ivpu/ivpu_hw.h                       |  16 +--
 drivers/accel/ivpu/ivpu_hw_btrs.c                  | 134 ++++++++++-------=
----
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |   7 +-
 drivers/accel/ivpu/ivpu_job.c                      |  15 +--
 drivers/accel/ivpu/ivpu_sysfs.c                    |  49 +++++++-
 drivers/accel/ivpu/vpu_boot_api.h                  |  13 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  53 +++++---
 drivers/dma-buf/sw_sync.c                          |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  14 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  14 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  12 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   7 ++
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   6 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   7 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   8 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  74 ++++++------
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |   7 ++
 drivers/gpu/drm/v3d/v3d_sched.c                    |  16 ++-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   5 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  75 +++++++-----
 drivers/gpu/drm/xe/xe_hmm.c                        |  24 ----
 drivers/gpu/drm/xe/xe_pxp_debugfs.c                |  13 +-
 include/drm/drm_gem.h                              |   3 +-
 include/uapi/drm/ivpu_accel.h                      |   4 +-
 47 files changed, 407 insertions(+), 285 deletions(-)
