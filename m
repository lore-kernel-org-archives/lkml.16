Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD7296D31
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745622746; cv=none; b=SSB0YR2w3UCrwrpQ2cU/J5oPLzZ5xZ6QifnDxzHRhAgHwwdmDCOOryxkTsxqO/4DqYSCDQKLdqZj2qi/1ObfoK/tJXLiTJ41pgaiG9IflRdx4qkPJwZWUKx6MvL7x0YSeH1cL0eKPIdYSAd1Yx1qxU17t1hd/hMv4o1DsO+Akz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745622746; c=relaxed/simple;
	bh=lBVWirH/wT4DSQRUxAHBU1Z8VmDEiDI997Qr1ai+VDU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VUN8FMD/i7Ow6ijReaqA2kJjJB2tfL8b2Ph+QxcuVxBYqG/LXt3UPL2+9282NMF1iDWEAmtyek0x1KhVNqDW1JyBj3ZDsf3QIoPaKLakAySmM0bvYVIsQdkL7FxHndcvLa/xnW62yQl1nqx+/nlmcXAJzKlDx3TR58Y0ohwSMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU8611xk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU8611xk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso4658248a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745622743; x=1746227543; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tmqGkrT8pKgcGDCBKcXPdyFIvAScDuIz/sDPPptlagc=;
        b=SU8611xkbZtHfQgQjHmPiVWw4ovGxIpSLPe0TOgkJ/pFAt/ILhXm0WMswsIN1Qh+kB
         93MXnjwFqJXpt8PotR4IciS/92EOfZAgcY0QCEoJ1N1sWJgk4b+JGDao2DOYuiTgwxW6
         gtbodZvG7PlgwHrUeXC/U8auPLHvjwCSTd03Sdux3Vr9YUSUcRJjhfF6rh3mhIp9cz8Z
         cKE0GgZHh97oPLvGOB/KdjkaGRkcCPOsWKCHX8TbbJymM3v0bF0a3GTSEM0yf6BSR00w
         XhEZdyuuWu5pIsih7HQw8vEjFtvK+nYBITMnlKLgofy8lHrRO30y4liIUQgXG4gt3Xm5
         Q1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745622743; x=1746227543;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmqGkrT8pKgcGDCBKcXPdyFIvAScDuIz/sDPPptlagc=;
        b=Q5Qv5U4gpoJHL/rd3caGtto4H2UlGAKJaGR8S58Svm879aNtsUAO+Es38RV9yGUZtH
         J64ReMydurqhG6U2sN4OUh8/mJfblrJ4Vqv4UujaSBFcRXdyGBf3GYBXfg9r+/Hhhgix
         SSQos0aTnAypxjRJ0T7nK+zDqovq+fon9JIEKa7ifBSWd23JRubJqZ7ObMkjRkiopkj4
         rGaP4TcGXeoPgKLZ8Rz5svXdA0M3Yo21h0WrhtIJeLzyQIcdDTFsbxo9izUKtxw8xZvb
         lCRTnDBE6yc8yzZcnWulrs2VyX7/f+EBDemj67JKPXdKqTF2Sli6k/QBpICIswwAoMHk
         CbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeqWj85enLSsSSvYpsJC8sVZeSetsJUGIVmsLrm8z4ioS4HBWUAhuNPwnIE0d3pex86yNKiy3EKix91c0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5KOEZQJKoPiFkfmKUSKPJ/dz7cqy+0Zm6WphKBeMbVUAKmkhl
	pwmb7hNrcK0sZHPGpvElpupG9VWO4wrdyyuRz+gQKY3Odts9q2CHItyd+m7GUJHwGO1cT5qfCbV
	pFOY105RmQLj2YrrB+HCKS7xl41U=
X-Gm-Gg: ASbGncuE2DIHI/I9rqy0xq+F+UHxO84Iw4vb8YOs3annBWdFoxnegUrADroTU9/H8Kx
	n4YwStwZb0FU5XfBkVPsNwJW516Zg2cUCyeDe4QoaG5awQGOsWZ04lQo0v692kZ+ZnwaA3GsswQ
	jfd+lbNLggowatgl6Cp9qN
X-Google-Smtp-Source: AGHT+IFbYQ+2iFR7S/u7nsYXV11sOemyomei8G6gARGgyO0bDnQjksxdk7K85FYgv6vPimpeu2QI16jyGjeNrP3Ew9c=
X-Received: by 2002:a17:907:3f17:b0:acb:58f5:4529 with SMTP id
 a640c23a62f3a-ace71394307mr313873366b.45.1745622742560; Fri, 25 Apr 2025
 16:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Apr 2025 09:12:11 +1000
X-Gm-Features: ATxdqUFSwwc7uu860_jUpvTlumw25sQQBYyeK2MYs5a6E0i_lkdE8bixFaKtgIM
Message-ID: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
couple of minor fixes, seems a bit quiet, but probably some lag from
Easter holidays.

Dave.

drm-fixes-2025-04-26:
drm fixes for 6.15-rc4

amdgpu:
- P2P DMA fixes
- Display reset fixes
- DCN 3.5 fixes
- ACPI EDID fix
- LTTPR fix
- mode_valid() fix

exynos:
- fix spelling error
- remove redundant error handling in exynos_drm_vidi.c module.
- marks struct decon_data as const in the exynos7_drm_decon driver
since it is only read.
- Remove unnecessary checking in exynos_drm_drv.c module

meson:
- Fix VCLK calculation

panel:
- jd9365a: Fix reset polarity
The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-26

for you to fetch changes up to 250130d2daaa0a828bafbd6ad58479a645029e82:

  Merge tag 'amd-drm-fixes-6.15-2025-04-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2025-04-26
08:12:41 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc4

amdgpu:
- P2P DMA fixes
- Display reset fixes
- DCN 3.5 fixes
- ACPI EDID fix
- LTTPR fix
- mode_valid() fix

exynos:
- fix spelling error
- remove redundant error handling in exynos_drm_vidi.c module.
- marks struct decon_data as const in the exynos7_drm_decon driver
since it is only read.
- Remove unnecessary checking in exynos_drm_drv.c module

meson:
- Fix VCLK calculation

panel:
- jd9365a: Fix reset polarity

----------------------------------------------------------------
Anindya Sundar Gayen (1):
      drm/exynos: fixed a spelling error

Christian Hewitt (1):
      Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Colin Ian King (1):
      drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2025-04-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'exynos-drm-fixes-for-v6.15-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-04-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Felix Kuehling (3):
      drm/amdgpu: Use allowed_domains for pinning dmabufs
      drm/amdgpu: Don't pin VRAM without DMABUF_MOVE_NOTIFY
      drm/amdgpu: Allow P2P access through XGMI

George Shen (1):
      drm/amd/display: Use 16ms AUX read interval for LTTPR with old sinks

Gergo Koteles (1):
      drm/amd/display: do not copy invalid CRTC timing info

Guoqing Jiang (1):
      drm/exynos: Remove unnecessary checking

Hugo Villeneuve (1):
      drm: panel: jd9365da: fix reset signal polarity in unprepare

Krzysztof Kozlowski (1):
      drm/exynos: exynos7_drm_decon: Consstify struct decon_data

Leo Li (1):
      drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF

Mario Limonciello (1):
      drm/amd/display: Fix ACPI edid parsing on some Lenovo systems

Martin Blumenstingl (1):
      drm/meson: use unsigned long long / Hz for frequency types

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustment on DCN35

Roman Li (2):
      drm/amd/display: Fix gpu reset in multidisplay config
      drm/amd/display: Force full update in gpu reset

Wentao Liang (1):
      drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  52 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  41 ++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |  54 ++++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |   3 -
 drivers/gpu/drm/meson/meson_drv.c                  |   2 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c                 | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h                 |  13 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   4 +-
 16 files changed, 229 insertions(+), 183 deletions(-)
