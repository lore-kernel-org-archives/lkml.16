Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383D1C3BE0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748038538; cv=none; b=RaRz7Z9hxzoX9vQI/cEXUAmK6F8o68vKOkQ3DPu8GC1tBlPa+k4KDx8u9aPtK+p9TIBkxYyAw1TxRDI4oQQyF8PV5+RQgCXokxVA/yhvq6LEDNznDVUDAf1zSl65N6WrFLSe9yT0K7MXMFxwRHv+2wLMVv0N3vGW7MJPZpJufBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748038538; c=relaxed/simple;
	bh=ee8CPdCx5DVp5sVGKbw5mHtHxiPP3MrG45USdRA9uts=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rGpIXTEqzda7Zs8p46JZp92G/6gtSF8ZqrWE3LQX9vfitQx9O+JWjTkghQr9orr2cxWAJFNBLjJB35UMuHyygy9gmSwj0POMSiD/+uQK+LxgYZzaEKKHdF0Mv3sWIo6gB/wCM19xzt+diZhWkBttJ3LP9taDvdj/lRE+uX1E2OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM0ebyU2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM0ebyU2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace94273f0dso46679866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748038535; x=1748643335; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y2BCrrZcBFm32iNJbAlwuWT4RjrO8k1g2FtTBOuY0/M=;
        b=EM0ebyU2uKAg57wLl7xrEeEMD66u4+l2qG5q+jblnftasLSUAY8b2V6tqr5Oxk92tH
         /SPm1q3KehS+aVm6LhraYjSooE1NTuBMtD1Tp4fxZwF/2Y9SCUABhRXZ3iyL1y8P9eP9
         ejH51Opejg5Gtm+emxO+SMKBtRObbqX8/fnyavvzmt5+FJHMIYeZoE80X+bVnx9Sl2GG
         wbFJ4xqdp+1DkF5FEg90sK7pKhKbcDen3+2KCtRW4WeScFoDUfA5JazWdAn7F/LPwhhk
         JnfXmMH7ux+dHLr/HlKfa0HwGA3o+AjiEa34WuU5JhsD1XQS6QijYycABB9lMycHcuYl
         vldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748038535; x=1748643335;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2BCrrZcBFm32iNJbAlwuWT4RjrO8k1g2FtTBOuY0/M=;
        b=pXGb7zKLCufHanv2dId1XQuvr8QBnRvN4UBVMozDLBVh32M+Ri/fGyFHCktTtZw+6L
         X5uiuiLzmraHbLf8Iw613+4Ih36fYfimgpV2htnjrKKH1y1NuNKTTIV1SXAV9iYLQk0Q
         mSbOfT8O0xM2hD7dfUVTqNfY8nRvaKhpZvr7bTxpRzYsYz5xsymcs1kKIXAw8yteZthV
         Pn49RwTv/WxVEhtGgG7bh3Wi6epjK4jijY+fvO03EY73sXuO0l7F9DTLMapgM044PKe/
         M101X4nV+rNCRR7gmus3/tBIDk7dL8G8fYNQE7zTLqaADr020X6CdHh0hWgS13RaHIL+
         EZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Rp8kaMbSdLSzDmKbbsrWbKD+8txPTLH6NVd3Vg66Ubx4wE8MG/KqKUH8tvcSR79a1ePss6qITdn6g8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YynYsbpw86oDkiQU88r7n13z+ZcfyegrATKWDKEDebOC96KMcZq
	Hl8LgG/UOe9VLtjLp4LKrC10lZg2vYbzgLPKPa6Nqfabl9ywF6KLm35vkCZhrhB1Zwn3iWr62Qh
	0lJiHsJDmXTPQ25/kLyIvjRghXoiwRrM=
X-Gm-Gg: ASbGncsI+hF+eifFZKDUqXU8t9bpRkCKkQTu7JLBZ+Xs6hQnLX9PStr0+5bcFXkGUez
	Bk+j5jwRw4YxjitQ/9VonBa4aC0TTDAHB4m4cqzAw4eMmNMIEj4UNhIyp8CrgkrifIQChL1klBh
	DJvIwDTkmWyltKdQgR2Livs4H7dSAWQjs=
X-Google-Smtp-Source: AGHT+IEQqL0ERYw9B4VO9729NHhCXW4sq6epvLnt0hryQqzUio/Oc62ldk/dicuEsPaIALs2BTn3O77IxRizJlxCvcI=
X-Received: by 2002:a17:906:f595:b0:ad2:48f4:5968 with SMTP id
 a640c23a62f3a-ad85b1bd264mr69246666b.25.1748038534793; Fri, 23 May 2025
 15:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 24 May 2025 08:15:22 +1000
X-Gm-Features: AX0GCFv8VKzmsUPytk0CDNUuVV8gKHAYNg4SR8dtz_S6vN9SwQeuxhYxkLm84_o
Message-ID: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Weekly drm fixes pull, on target to be quiet, just one amdgpu, one
edid and a few minor xe fixes.

Regards,
Dave.

drm-fixes-2025-05-24:
drm fixes for 6.15-rc8/final

edid:
- fix HDR metadata reset

amdgpu:
- Hibernate fix

xe:
- Make sure to check all forcewakes when dumping mocs
- Fix wrong use of read64 on 32b register
- Synchronize Panther Lake PCI IDs
The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-24

for you to fetch changes up to fe1e5a1f2d1c2d4385a414dacca0e5275c0af281:

  Merge tag 'drm-xe-fixes-2025-05-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-05-24 07:42:23 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc8/final

edid:
- fix HDR metadata reset

amdgpu:
- Hibernate fix

xe:
- Make sure to check all forcewakes when dumping mocs
- Fix wrong use of read64 on 32b register
- Synchronize Panther Lake PCI IDs

----------------------------------------------------------------
Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2025-05-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.15-2025-05-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Mario Limonciello (1):
      Revert "drm/amd: Keep display off while going into S4"

Matt Atwood (1):
      drm/xe/ptl: Update the PTL pci id table

Shuicheng Lin (1):
      drm/xe: Use xe_mmio_read32() to read mtcfg register

Tejas Upadhyay (1):
      drm/xe/mocs: Check if all domains awake

feijuan.li (1):
      drm/edid: fixed the bug that hdr metadata was not reset

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 -----
 drivers/gpu/drm/drm_edid.c                        |  1 +
 drivers/gpu/drm/xe/xe_mmio.c                      | 10 +++++-----
 drivers/gpu/drm/xe/xe_mocs.c                      | 11 ++++++-----
 include/drm/intel/pciids.h                        |  4 ++++
 5 files changed, 16 insertions(+), 15 deletions(-)
