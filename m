Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404F23504E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746818382; cv=none; b=Dyw0FiKGbIUO2HMeT2a8+RsTz60dY4F/PHq4Hi9cab6OjQaJU7SW2F0/oJqDGyWoK7SaMBZA46QWJhaBtYfZzEKe/QzBOCIxcopsFfE53rzoCySLGpRttQf3xa/8zZWNEeo/HdXLdwZ0hbRB9mXyQN6JwymsnYs6qEZkTbzrpo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746818382; c=relaxed/simple;
	bh=yBkjjrzIAXmNS8sMpgXG7xXdEYsR7PeGPM4i5rm0HoM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hBCO8GznlhELGf+wdJIju7DR9zP+XDIpP5GQQ0TabnJ0ive37JjpV4Vot36RmSZIWKzbU/ZgGPh7oWCBDOEgh3aDpf/HlW6EjQyZD2+0VWn9E42tfO6aY4eCgYA2MLR9X2RcaonOVDzlEQX3yoGvPSXaJuR1k1Rcn33jjB4LJo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqMcibst; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqMcibst"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so344945066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746818379; x=1747423179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzB/umn34JPN16y9zjrFz51ufK1HJCEqBWxx7qBjw90=;
        b=MqMcibstHJHOhmhzmLMajM+R9F2VphKFHLDc9G5rMYfBQnzCHgqLwedyQIVTkX0sby
         upigi7r6MXtXQX1H2IZ5Lu1ydRigBXTeZ9xAloKuwf8ArvOCxTToMnfVzlLDTBh8nJeM
         61jRwxW+y86/3gBWTvsc/Y0hmrIeYQfY6wNCDd7ZOo/hrx8v4rgfCOHKz+xwKdmuBEzC
         bqPmS0UdGbt+2nurW2uuZz6+v4ZKxysTve2j6mdwa96B/58Xf0d/qrBSsqHYhaDErDkJ
         qu9KubT2jsO2A6CwCzCBJa84zr1Vl/dGg2NJdXv7bJDqY91DrJxnptTLpr+SgVIjiq58
         dmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746818379; x=1747423179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzB/umn34JPN16y9zjrFz51ufK1HJCEqBWxx7qBjw90=;
        b=qoqAe2hG0CvufwQe/LaGezdIRacbJfZDCFyPN+iy658hyCn5b53vgDgHrnDr/WVTJd
         IYB2B7L8m7LqBuQJmJ8OJKJAiKyPzToO1DJP09VZoAyvPpNC9dzJkgd22fA61iOqo5rH
         BY0jxK81iASs+YlUaCOCzfysyADBzObxtxJCP/vw3l72YsldpBvESPoONPKmGWGq2eL8
         TxfUEp2q/QLYuG0GuklQYQxYtjgN660x6LVcH4RUfQ4n5Dxr7ZXW2EFw0F4Cr76/yB9w
         W//lk+Lv0lYo6jL3ZOgP8Swxi584cLxH56F4bX/3yp3iN5+K/zrV9htRekbp8kp92zEC
         Jhdw==
X-Forwarded-Encrypted: i=1; AJvYcCVqpAlrOYic51F9m+8lhkJM34dXv4omWtsGovhI9k25f+0s/AY5KXY+7JZjnWZXcRy4qiipxO9bvcfSPH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9Sj2fHgThONbr6cW7Qd5XxyWyBZeuL8vdfnScsCuccJHnwKj
	YBJ6gJY53dsVFLqZKfuY1NNkc7ohHre1MUO9XVJ/kV4U/MUNHyAfmetV2ylQxyBD9M2kZBoUEIw
	FDXIK4rkEiBTIy7MYtAy+NthnNfA=
X-Gm-Gg: ASbGncs0TWrPhYDPRUQ57xMn2eBbbNaDmzZSwIDGNzfirmGqURpcgTNaE3vomyZJOaq
	aeAffEoY9MzW4CL3NuWrhiNhCoz/ZlY6NiDau0C4wKOhYH/G1IdTyYwIb6kqLtVni+Naf81KYe3
	ccvnOYLqlKeiPQWD4AhcIq3SaE8AXYB4qI1bPY213Yng==
X-Google-Smtp-Source: AGHT+IGtLeECCuBB7dBInHNDCtrxruOGDXeY+EBwBu8tivOfxkDQ8+JenCtoiPui3aQDf6wEPCIW7EgRwdWt4sgw8hU=
X-Received: by 2002:a17:907:179a:b0:ad2:2f00:175c with SMTP id
 a640c23a62f3a-ad22f0018dfmr114181866b.50.1746818378698; Fri, 09 May 2025
 12:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 May 2025 05:19:27 +1000
X-Gm-Features: ATxdqUEfO0Ap1TmurLlvIj5CRSOldZiSN269hFszSyhtjoKQpcf-yWCkfJoLqCo
Message-ID: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Linus,

Weekly drm fixes, bit bigger than last week, but overall amdgpu/xe
with some ivpu bits and a random few fixes, and dropping the
ttm_backup struct which wrapped struct file and was recently frowned
at.

Thanks,
Dave.

drm-fixes-2025-05-10:
drm fixes for 6.15-rc6

drm:
- Fix overflow when generating wedged event

ttm:
- Fix documentation
- Remove struct ttm_backup

panel:
- simple: Fix timings for AUO G101EVN010

amdgpu:
- DC FP fixes
- Freesync fix
- DMUB AUX fixes
- VCN fix
- Hibernation fixes
- HDP fixes

xe:
- Prevent PF queue overflow
- Hold all forcewake during mocs test
- Remove GSC flush on reset path
- Fix forcewake put on error path
- Fix runtime warning when building without svm

i915:
- Fix oops on resume after disconnecting DP MST sinks during suspend
- Fix SPLC num_waiters refcounting

ivpu:
- Increase timeouts
- Fix deadlock in cmdq ioctl
- Unlock mutices in correct order

v3d:
- Avoid memory leak in job handling
The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb=
:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-10

for you to fetch changes up to c2c64ed09c7b44a893d22c8b8ddb3ba7265494f3:

  Merge tag 'drm-intel-fixes-2025-05-09' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
(2025-05-10 05:07:18 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc6

drm:
- Fix overflow when generating wedged event

ttm:
- Fix documentation
- Remove struct ttm_backup

panel:
- simple: Fix timings for AUO G101EVN010

amdgpu:
- DC FP fixes
- Freesync fix
- DMUB AUX fixes
- VCN fix
- Hibernation fixes
- HDP fixes

xe:
- Prevent PF queue overflow
- Hold all forcewake during mocs test
- Remove GSC flush on reset path
- Fix forcewake put on error path
- Fix runtime warning when building without svm

i915:
- Fix oops on resume after disconnecting DP MST sinks during suspend
- Fix SPLC num_waiters refcounting

ivpu:
- Increase timeouts
- Fix deadlock in cmdq ioctl
- Unlock mutices in correct order

v3d:
- Avoid memory leak in job handling

----------------------------------------------------------------
Alex Deucher (7):
      Revert "drm/amd: Stop evicting resources on APUs in suspend"
      drm/amdgpu: fix pm notifier handling
      drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flus=
h
      drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush

Alex Hung (1):
      drm/amd/display: Remove unnecessary DC_FP_START/DC_FP_END

Aurabindo Pillai (1):
      drm/amd/display: more liberal vmin/vmax update for freesync

Austin Zheng (1):
      drm/amd/display: Call FP Protect Before Mode Programming/Mode Support

Daniele Ceraolo Spurio (1):
      drm/xe/gsc: do not flush the GSC worker from the reset path

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2025-05-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-05-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-09' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-05-09' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

Feng Jiang (1):
      drm: Fix potential overflow issue in event_string array

Imre Deak (1):
      drm/i915/dp: Fix determining SST/MST mode during MTP TU state computa=
tion

Jacek Lawrynowicz (2):
      accel/ivpu: Increase state dump msg timeout
      accel/ivpu: Fix pm related deadlocks in cmdq ioctls

Karol Wachowski (1):
      accel/ivpu: Correct mutex unlock order in job submission

Kevin Baker (1):
      drm/panel: simple: Update timings for AUO G101EVN010

Matthew Brost (1):
      drm/xe: Add page queue multiplier

Ma=C3=ADra Canal (1):
      drm/v3d: Add job to pending list if the reset was skipped

Roman Li (1):
      drm/amd/display: Fix invalid context error in dml helper

Ruijing Dong (1):
      drm/amdgpu/vcn: using separate VCN1_AON_SOC offset

Shuicheng Lin (2):
      drm/xe: Release force wake first then runtime power
      drm/xe: Add config control for svm flush work

Tejas Upadhyay (1):
      drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs

Thomas Hellstr=C3=B6m (2):
      drm/ttm: Fix ttm_backup kerneldoc
      drm/ttm: Remove the struct ttm_backup abstraction

Vinay Belgaumkar (1):
      drm/i915/slpc: Balance the inc/dec for num_waiters

Wayne Lin (5):
      drm/amd/display: Shift DMUB AUX reply command if necessary
      drm/amd/display: Fix the checking condition in dmub aux handling
      drm/amd/display: Remove incorrect checking in dmub aux handler
      drm/amd/display: Copy AUX read reply data whenever length > 0
      drm/amd/display: Fix wrong handling for AUX_DEFER case

 drivers/accel/ivpu/ivpu_hw.c                       |  2 +-
 drivers/accel/ivpu/ivpu_job.c                      | 35 ++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 18 ---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 29 ++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 10 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              | 12 +++++-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |  7 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 36 +++++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 28 ++++++++++++--
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  8 ++--
 .../amd/display/dc/dml2/dml2_translation_helper.c  | 14 +++----
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  6 ---
 drivers/gpu/drm/drm_drv.c                          |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                | 14 +++++--
 drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++------
 drivers/gpu/drm/ttm/ttm_backup.c                   | 44 ++++++------------=
----
 drivers/gpu/drm/ttm/ttm_pool.c                     |  6 +--
 drivers/gpu/drm/ttm/ttm_tt.c                       |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    | 28 ++++++++++----
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |  7 +++-
 drivers/gpu/drm/xe/xe_gsc.c                        | 22 +++++++++++
 drivers/gpu/drm/xe/xe_gsc.h                        |  1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  | 11 ++++++
 drivers/gpu/drm/xe/xe_gsc_proxy.h                  |  1 +
 drivers/gpu/drm/xe/xe_gt.c                         |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  9 +++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c               | 11 +++++-
 drivers/gpu/drm/xe/xe_svm.c                        | 12 ++++++
 drivers/gpu/drm/xe/xe_svm.h                        |  8 ++++
 drivers/gpu/drm/xe/xe_uc.c                         |  8 +++-
 drivers/gpu/drm/xe/xe_uc.h                         |  1 +
 drivers/gpu/drm/xe/xe_vm.c                         |  3 +-
 include/drm/ttm/ttm_backup.h                       | 18 ++++-----
 include/drm/ttm/ttm_tt.h                           |  2 +-
 47 files changed, 285 insertions(+), 195 deletions(-)
