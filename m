Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594328000A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747428304; cv=none; b=XO8kVgQ2k4GrQyID12s7nIXxEPoEVKpEl+UGI4atVxey+uB95jRlPnqni6IXI51E4aikUy1aWIcbvE3ytKvxZidsi0a9LAlNErtLLhpwzkayg2CTOVaI+r6/1vlYohORhhgwUT3r4x6brhVJHOk5FDfPFQbQbFFOPBNz98uhMug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747428304; c=relaxed/simple;
	bh=NO9RaiGzCiccSjE5OUnUYIHP3JhRGVsl6JIqd+9uFMA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PYFvXXjvh0rQDyS7TEC0bbiL6g3NPgLfZbUmxqGlbruNcUDCQ0Lj5c1ai67Bi67zDYtb916Q32Yws8KxjMcGcVyWomSIlFr4aaWb2fR7wiL/d82DtxAYH5S+Bwuav6Y3PHaEiAJs/IFj5cgBz4Qmd3ZhHsld+OcQsUJ0CAODGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdNfooiR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdNfooiR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso4680831a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747428299; x=1748033099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b0ZX5dcNPDCR1x/qOI+9fZ8HOrmwYXuil42419Nvf7s=;
        b=EdNfooiRiEFVx5R0cvL+x4zQLo0ssXxQ1HzAErLEhmnhAYy4ZkWSNnzhLO3dVmboqz
         tL3VRhb3ULSqvy+9xcuJWpdReY4z9l8y785mv3rKV7Gt1hPgeJlrYP6lq+ND4/aQBLCk
         8Sg4QMsQdeoyshYmCe0iIRkUsoyBQ6AAPb9uRxPtRCwLC7e2mNIFS/Y0H1OjrK+53H9q
         6SYWm4eaV45EAmWDACQ0KFPdbROkO9Q47sp28oj71bsjT2Sn0yoz9ImDgz1AYIlngVXE
         po5v3aRzdFBLr5Ehb9NJ/6O3S1hoqrjvyutR7siykok/3Zw8DaSr+r20xOI4S3X/DWg3
         PGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747428299; x=1748033099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0ZX5dcNPDCR1x/qOI+9fZ8HOrmwYXuil42419Nvf7s=;
        b=R/DkdZeow21qJAM2pqKOguxbTx6assTSQ8tZvtPpk3aPbP8D8wsBkzr+DBYkSkYPbN
         k4lDomDs6e1WqdzO3ukl2I7JSFPAl+k70/QBQR0CNtqpDuUIz6siDp6qznx1oO/g4QUT
         JwmVHwtzYc2eO04UkcsIWUv/yWhj3NSFTaUIkbxgaaWszJMDEEUjGrXmdKnbGKRTWAgI
         26mlylZvwz+UIpiY1Zuswjf7KOHGhUuziXmCh+1uBo8AY7WQjKQ/b/XoBV2l7/8GKjne
         ALvmwIXdIiCWgmy7NU3a2hZR/jNoxp5idZPo6sCvSiKxLJ6rtCQQm0JIYACWf6FAxfRZ
         4zXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLCkLl4LPZ5pl9hMRTa5BczZYP72yzhdsF8UnEQ6aWz+xmGRibcY+nn4VVn7pJgTLyMFigTA7i1/GdKDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtsaRuWiQ5J3dM3LCa9jhlwf3+6rZZOOouQsfjOwAL1p9Uuqa
	mU/KNr5cacwwgRjGHykU4ttGrcZdujtzTppORzC0sCxPB7Lg9IiNllhxJ0Vuialmb+Y5Pjhv58y
	AkR5feRz39e9h1cxVN7Pnth/qAX3EiP0=
X-Gm-Gg: ASbGnctvuywwsoCg3vW22pzglMFvinU5vbEcVkPh077iZkpSar3fqnYiMBoPOGFi+Zq
	iJ1jhPojZpJV9niO2luZtl0Qbf5TeC3nDf8rUqvaLxCOiR7eccYVgvZBZ1k7Wyb/tQScIYkLxX1
	h6wizLIx8lGvqNH1Q/4zfhg3K2nxcF59M=
X-Google-Smtp-Source: AGHT+IFTk33V63lMc5uRZHjpHtnEKW62WAMZtvjUv0UM6PGJMd2Jv6jPdJtO44wfbV8S/u+MYu+XHkyW0z5Yf2Atl+0=
X-Received: by 2002:a17:907:3f8e:b0:ac3:3d10:6f with SMTP id
 a640c23a62f3a-ad536b58e99mr361426566b.8.1747428299251; Fri, 16 May 2025
 13:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 17 May 2025 06:44:48 +1000
X-Gm-Features: AX0GCFuaj0yuoEZrivvc2926hxAqueWFXabAr8nVmyujGREZGPsbgMcF3WnoF7I
Message-ID: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Weekly drm fixes, I'll be honest and say I think this is larger than
I'd prefer at this point, the main blow out point is that xe has two
larger fixes.

One is a fix for active context utilisation reporting, it's for a
reported regression and will end up in stable anyways, so I don't see
any point in holding it up.
Two is a fix for mixed cpu/gpu atomics, which are currently broken,
but are also not something your average desktop/laptop user is going
to hit in normal operation, and having them fixed now is better than
threading them through stable later.

Other than those, it's mostly the usual, a bunch of amdgpu randoms and
a few other minor fixes.

Let me know if you have any problems with this,

Dave.

drm-fixes-2025-05-17:
drm fixes for 6.15-rc7

dma-buf:
- Avoid memory reordering in fence handling

meson:
- Avoid integer overflow in mode-clock calculations

panel-mipi-dbi:
- Fix output with drm_client_setup_with_fourcc()

amdgpu:
- Fix CSA unmap
- Fix MALL size reporting on GFX11.5
- AUX fix
- DCN 3.5 fix
- VRR fix
- DP MST fix
- DML 2.1 fixes
- Silence DP AUX spam
- DCN 4.0.1 cursor fix
- VCN 4.0.5 fix

ivpu:
- Fix buffer size in debugfs code

gpuvm:
- Add timeslicing and allocation restriction for SVM

xe:
- Fix shrinker debugfs name
- Add HW workaround to Xe2
- Fix SVM when mixing GPU and CPU atomics
- Fix per client engine utilization due to active contexts
  not saving timestamp with lite restore enabled.
The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3=
:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-17

for you to fetch changes up to c81dbc490bcdfd0dd6199c5c382dc923cea0029b:

  Merge tag 'drm-xe-fixes-2025-05-15-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-05-16 11:21:35 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc7

dma-buf:
- Avoid memory reordering in fence handling

meson:
- Avoid integer overflow in mode-clock calculations

panel-mipi-dbi:
- Fix output with drm_client_setup_with_fourcc()

amdgpu:
- Fix CSA unmap
- Fix MALL size reporting on GFX11.5
- AUX fix
- DCN 3.5 fix
- VRR fix
- DP MST fix
- DML 2.1 fixes
- Silence DP AUX spam
- DCN 4.0.1 cursor fix
- VCN 4.0.5 fix

ivpu:
- Fix buffer size in debugfs code

gpuvm:
- Add timeslicing and allocation restriction for SVM

xe:
- Fix shrinker debugfs name
- Add HW workaround to Xe2
- Fix SVM when mixing GPU and CPU atomics
- Fix per client engine utilization due to active contexts
  not saving timestamp with lite restore enabled.

----------------------------------------------------------------
Aradhya Bhatia (1):
      drm/xe/xe2hpg: Add Wa_22021007897

Aurabindo Pillai (1):
      drm/amd/display: check stream id dml21 wrapper to get plane_id

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.15-2025-05-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-05-15' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-15-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David (Ming Qiang) Wu (1):
      drm/amdgpu: read back register after written for VCN v4.0.5

Fabio Estevam (1):
      drm/tiny: panel-mipi-dbi: Use drm_client_setup_with_fourcc()

Gabe Teeger (1):
      Revert: "drm/amd/display: Enable urgent latency adjustment on DCN35"

George Shen (1):
      drm/amd/display: fix link_set_dpms_off multi-display MST corner case

Himal Prasad Ghimiray (1):
      drm/gpusvm: Introduce devmem_only flag for allocation

Hyejeong Choi (1):
      dma-buf: insert memory barrier before updating num_fences

I Hsin Cheng (1):
      drm/meson: Use 1000ULL when operating with mode->clock

John Olender (1):
      drm/amd/display: Defer BW-optimization-blocked DRR adjustments

Markus Burri (1):
      accel/ivpu: Use effective buffer size for zero terminator

Matthew Brost (3):
      drm/xe: Strict migration policy for atomic SVM faults
      drm/gpusvm: Add timeslicing support to GPU SVM
      drm/xe: Timeslice GPU on atomic SVM fault

Melissa Wen (2):
      drm/amd/display: Fix null check of pipe_ctx->plane_state for
update_dchubp_dpp
      Revert "drm/amd/display: Hardware cursor changes color when
switched to software cursor"

Philip Yang (1):
      drm/amdgpu: csa unmap use uninterruptible lock

Thomas Hellstr=C3=B6m (1):
      drm/xe: Fix the gem shrinker name

Tim Huang (1):
      drm/amdgpu: fix incorrect MALL size for GFX1151

Umesh Nerlige Ramappa (3):
      drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
      drm/xe: Save the gt pointer in lrc and drop the tile
      drm/xe: Add WA BB to capture active context utilization

Wayne Lin (2):
      drm/amd/display: Correct the reply value when AUX write incomplete
      drm/amd/display: Avoid flooding unnecessary info messages

 drivers/accel/ivpu/ivpu_debugfs.c                  |   2 +-
 drivers/dma-buf/dma-resv.c                         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  12 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   8 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  10 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  20 ++-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   5 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  13 +-
 drivers/gpu/drm/drm_gpusvm.c                       |  37 +++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   5 +-
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   5 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |   2 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        | 199 +++++++++++++++++=
++--
 drivers/gpu/drm/xe/xe_lrc.h                        |   5 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   9 +-
 drivers/gpu/drm/xe/xe_module.c                     |   3 -
 drivers/gpu/drm/xe/xe_module.h                     |   1 -
 drivers/gpu/drm/xe/xe_pci.c                        |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |   1 +
 drivers/gpu/drm/xe/xe_pt.c                         |  14 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   7 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                        | 116 +++++++++---
 drivers/gpu/drm/xe/xe_svm.h                        |   5 -
 drivers/gpu/drm/xe/xe_trace_lrc.h                  |   8 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   4 +
 include/drm/drm_gpusvm.h                           |  47 +++--
 38 files changed, 474 insertions(+), 121 deletions(-)
