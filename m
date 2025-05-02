Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B44376
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746216845; cv=none; b=ZxsDPTxY+US0wEGsiV47TG26u/Kgr8WZ2/ZNdKkbgKsnQ7LQXI0GkhjFM/2Op2mNVK1AEQcuNG54TcrGVJSwLbfQNILKuXNptfmTTYazV1Z+i2aqFhhUI5R3G4BRyUE5UbYi93GuX9aLoNfSu91O5x4CbvB0v5J3Jk0Rx5ivylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746216845; c=relaxed/simple;
	bh=TtJqAB1fKu0acUdQl4SimWlO80c+kj4wqBMlGQjqF5U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Dr/cz9WhL6I7UJaSfPgyRetv8/+o5s8DU3mcDKgImVRAl1bcpuZZPwOqLrtHVDdgL3uv+da7ZN9NOV6iu7JJdcGOPBuT58h1t9pKIj6yGIVTKWMBqU/NMOUS5dLoAw+Vtu/fPE1MFxpGmh0eh6Iq2TIW/VlTqcQxcMubhP/G8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UihQEv3A; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UihQEv3A"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso385166066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746216841; x=1746821641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IWH1cHDu5KH0pRViPEWRqXxu0kS8sZnFv4Swd/5VeOQ=;
        b=UihQEv3AuwxHGh6229tycL01NSPeGMbzVtk69SLMh5OJ6UxGXwSTXMpR5iudgzYCzG
         U8CVjdBj1DazC/FuQV7aLn579VGSHCojBw6zYTgKPQlL1vDQRginm00g+QCfbvIXspgH
         dXZOIkh/YJEzpHW0C+iJyqbOLQ2hoPzXqFwriUst2gLOGrDb2kWpA+rRbAmLDqyUbBWI
         NdOoZSKp+W+7CQ8aJVS7CBMgrCKE3c0VlxbJ9hDw0VpSJNnh6Pza8Yv7oWuHz6XXT2L+
         nuAB1szEZMmS4WGWBy0ndlHOZpQKt9pXtcKAjZuWyC9xury5dMGOSXNIzYJ0sa9ceeSS
         ETQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746216841; x=1746821641;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWH1cHDu5KH0pRViPEWRqXxu0kS8sZnFv4Swd/5VeOQ=;
        b=iHNxQRrgaupDv92rarlkYWV6O9bpHvuvnRIMnUrrp3yxpD64MsmQqeVxeDv0vtAWQe
         sDGVOUlMz+CNopqBMWJQ+ltSXIGCoF8jpBv+Qpsoa+bqQBGZYgqKDoM7A5REw+3V2Lnf
         vBbz3G9xNhIcmLssUNwBV56UXYOKF94ZfIRCEqDah7BV/NvSjcsPXsyflBvg7BDNsPgK
         0nfTpgo7Akqqj9aDmniQ1hQ2sDKuq0oIg1eh9ehvso5ZjFMYE1C1pH30rr1Bb0bYtIXa
         o/O8gfiM1dJCcrekt3FpmbebM7ZXajhKTK1aOtGzacndDIWupE+VmbNAqc+BejsbkDFv
         JJEA==
X-Forwarded-Encrypted: i=1; AJvYcCVftkqgsBxvoReoizIptrcGl1svCSbv9jTRoK+mD4OHiLhHqEjqScNln1KN10RjxmbEO0UEveh43jDBG9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtsh4+RjX2XWou5ZmsTzJp8RfQjCehu21pn9fm/rL68IT2Clx
	doiMHc0SKQlQhI0bu9MOybVhlfv3o0+0k7QwQHQVFACUbhDU8At2p2nXFHCi6HZuoUyxe33zPSs
	UjBk/yqD2V8L44sY0Noq4R5oyIjA=
X-Gm-Gg: ASbGnctQ8Wn/7bRcMZWBfeUr/py+dcLem7xQvVpkdUoS08vDiZSH9YIYkMidiB47nsZ
	qoCI2l83PMhLPqDiOxD2YBKafrjq2HkHOO7o1DO3QN/m7sMvnf/C5rtgv8eRXo0xKEUS8a43qV3
	n8is/dD8FQKzPoU61etuzr
X-Google-Smtp-Source: AGHT+IH5+b2nYFhvbaa9fGevqTPKYSSF08veZF2/Iy6/VoQIjhbmSs2E8Po24EQl6RMyd/DIQ/jaWoBNICOwyu9amY0=
X-Received: by 2002:a17:907:1c1f:b0:ad1:8e6e:bea8 with SMTP id
 a640c23a62f3a-ad1908373a3mr50877666b.37.1746216841199; Fri, 02 May 2025
 13:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 3 May 2025 06:13:49 +1000
X-Gm-Features: ATxdqUGs0PnOxmt2B41wQhgJOvIJZ_8jVR5PAqirocl5W192K0P8o4yakp6yjoQ
Message-ID: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Weekly drm fixes, amdgpu and xe as usual, the new adp driver has a
bunch of vblank fixes, then a bunch of small fixes across the board.
Seems about the right level for this time in the release cycle.

Regards,
Dave.

drm-fixes-2025-05-03:
drm fixes for 6.15-rc5

ttm:
- docs warning fix

kunit
- fix leak in shmem tests

fdinfo:
- driver unbind race fix

amdgpu:
- Fix possible UAF in HDCP
- XGMI dma-buf fix
- NBIO 7.11 fix
- VCN 5.0.1 fix

xe:
- Eustall locking fix and disabling on VF
- Documentation fix kernel version supporting hwmon entries
- SVM fixes on error handling

i915:
- Fix build for CONFIG_DRM_I915_PXP=n

nouveau:
- fix race condition in fence handling

ivpu:
- interrupt handling fix
- D0i2 test mode fix

adp:
- vblank fixes

mipi-dbi:
- timing fix
The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-03

for you to fetch changes up to 4e6de6b8f0d5181fcf546ee98b908372fa3cfc0d:

  Merge tag 'drm-xe-fixes-2025-05-01' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-05-02 14:12:52 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc5

ttm:
- docs warning fix

kunit
- fix leak in shmem tests

fdinfo:
- driver unbind race fix

amdgpu:
- Fix possible UAF in HDCP
- XGMI dma-buf fix
- NBIO 7.11 fix
- VCN 5.0.1 fix

xe:
- Eustall locking fix and disabling on VF
- Documentation fix kernel version supporting hwmon entries
- SVM fixes on error handling

i915:
- Fix build for CONFIG_DRM_I915_PXP=n

nouveau:
- fix race condition in fence handling

ivpu:
- interrupt handling fix
- D0i2 test mode fix

adp:
- vblank fixes

mipi-dbi:
- timing fix

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Fix the D0i2 disable test mode

Chen Linxuan (1):
      drm/i915/pxp: fix undefined reference to
`intel_pxp_gsccs_is_ready_for_sessions'

Chris Bainbridge (1):
      drm/amd/display: Fix slab-use-after-free in hdcp

Dafna Hirschfeld (1):
      drm/gpusvm: set has_dma_mapping inside mapping loop

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2025-04-30' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-04-30' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-05-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-01' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Felix Kuehling (1):
      drm/amdgpu: Fail DMABUF map of XGMI-accessible memory

Harish Chegondi (2):
      drm/xe/eustall: Resolve a possible circular locking dependency
      drm/xe/eustall: Do not support EU stall on SRIOV VF

Harshit Mogalapalli (1):
      drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()

Janne Grunau (5):
      drm: adp: Use spin_lock_irqsave for drm device event_lock
      drm: adp: Handle drm_crtc_vblank_get() errors
      drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      drm: adp: Remove pointless irq_lock spin lock
      drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS

John Harrison (1):
      drm/xe/guc: Fix capture of steering registers

Karol Wachowski (1):
      accel/ivpu: Correct DCT interrupt handling

Lijo Lazar (1):
      drm/amdgpu: Fix offset for HDP remap in nbio v7.11

Lucas De Marchi (1):
      drm/xe/hwmon: Fix kernel version documentation for temperature

Maxime Ripard (1):
      drm/tests: shmem: Fix memleak

Philipp Stanner (1):
      drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()

Russell Cloran (1):
      drm/mipi-dbi: Fix blanking for non-16 bit formats

Sonny Jiang (1):
      drm/amdgpu: Add DPG pause for VCN v5.0.1

Sunil Khatri (1):
      drm/ttm: fix the warning for hit_low and evict_low

Tvrtko Ursulin (1):
      drm/fdinfo: Protect against driver unbind

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  4 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  4 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |  2 +-
 drivers/accel/ivpu/ivpu_pm.c                       | 18 ++++----
 drivers/gpu/drm/Kconfig                            |  2 +-
 drivers/gpu/drm/adp/adp_drv.c                      | 27 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  5 ++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 54 ++++++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 19 ++++++--
 drivers/gpu/drm/drm_file.c                         |  6 +++
 drivers/gpu/drm/drm_gpusvm.c                       |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |  6 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |  8 +++-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  2 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  3 ++
 drivers/gpu/drm/ttm/ttm_bo.c                       |  3 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   | 14 +++++-
 drivers/gpu/drm/xe/xe_eu_stall.h                   |  3 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  2 +-
 21 files changed, 146 insertions(+), 42 deletions(-)
