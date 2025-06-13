Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D8230277
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749847381; cv=none; b=MNnBeq5bJfMwct3GplkHP14GX4BVZD0qeDMLNexrEIIpn6BIRQuoHyGR5Cd03gGL4f9ROz3FxEeCqxDUMZv0Sn9BP5c6Mli/K1mna3FIJcXCyobb+C/nnGEgNNpb0Akmi6S33HHT73xjg+tElfRmPfFzWIdbpLoEaskN3G+pNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749847381; c=relaxed/simple;
	bh=fyAW/nTTib/lx1q/OpSv//6vzUS3nVFT/oyLaCqjOE4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WbxUdi4Rj7M8oJ+VNaKVf311QhIBwwOI2xou70jeVUy93HfBjtZb9+qrPflvH5x7CcLEi2M+yZtYj5K5Lym3NvWmmOf1ZBydmSC5lnTgHEjqeqsfWgk4VC7k9niJHq7MZbxWzFeAOl6zLqE2TrC0SS5nWeDPmbG40ov4EsyibvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/eGh3uk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/eGh3uk"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adb4e36904bso496911466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749847377; x=1750452177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4hL3bPOZiCumThELDqvwKH3aWWnHVUJPiuyMpNFx7dA=;
        b=K/eGh3ukCMIhmrW0KyJkEr7eM8d5HJ19l1KQn2Vf+hUmOPBLumoLcgnvAxz4KvFISy
         9RkzQj0NxtzR8Oyo9EIFVs1Jq1etxMNfov8mw9DZXo5RQVSUGJqWY8kLCuZK61euEZ9H
         aw3SsKk9QnJNwbqqydN6dzW2nTuvS4on2TId6B25Jo5b25ueJ6UJiYDO3pJtFEpeWDRI
         opOlv4XR1akStUo1OdHOnHDCfT9kBxVN/bWEZQKrxrET/Nd88Aja83hGKhz79Dd6BguC
         jcx7i1adveiCBb+UV396pt/5O503NcsLExqpHh5lBnJppTe/QRu29zt2il/xb2xHMEho
         pE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749847377; x=1750452177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hL3bPOZiCumThELDqvwKH3aWWnHVUJPiuyMpNFx7dA=;
        b=DaUo9Cn5Vv1Wy0wQLF4fGbUFXi4O2irn6839xGTdTshjQ4vfzPWbggZivbOUCyHzGc
         hYQcdB169SsQQ7CTliDO4VUV61+C3ileX9oGgTf+zN2WYHBfOXU7R1WVPSowqlfnPmju
         BAnWdYMIyPmRudhtA51PGk/EedXwjdYQIhUldHyG1bLPCfHLMLo4rNLl30WDo0PtTlch
         FhdKwJ60nwOI6Nmy1hohydD5JdhFfnwYV3uPCUtksB35QBJWDOeoALYgRPiE2g0YEAAc
         zQvsv1Lu7glDFQARFTSpFZ/N34deiFzy+hH5PI3T5vGzwm+ewfcuKC2hroRbfjuMrIyE
         8oTA==
X-Forwarded-Encrypted: i=1; AJvYcCX26l0YJjgTq4jpLeItBPBGvA9iXc6ov88Ftrg93gwFvAxZgogW4JxS6XEx5D9dn7g0Sddw1J6pJupfjX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyWuYOvvml0VdQbdyoYbw3HliFMo1zeWiKl0G6cuUHCEpRfKG
	tFezdeSiCJdxzc3RyHGF6vqdc7gwqMuFuuOiTeETwLAJGRYIgum28vTxrMMW59myyJq7GZeDUJV
	zP0+mqlxDsVBKyidPopKqWEE5FqkGhYI=
X-Gm-Gg: ASbGncvE/vQRE467158EXY2xISfIKBQkYpla+uaCcM/s33siDmijReLv6qv0b4dSXzi
	W5JV+UE0BpizDMDiUKTkJgzHIlpIMLXh8+XfGFjGWB7c5qekFtOlHWGD1ZjLFRkbuhpj/baFKQ7
	MxqQWm3t/dKEpKjEiZfjpW2yCy9/yPLHObAVmLAd0juQ==
X-Google-Smtp-Source: AGHT+IHs1rFLtd5Dyf296bDQtnWpyPbmXlE6lQX0psbVbCQn+LYSDEDdvBqxQCr3f3jMNK4CbR7c5otykkAdap5nzIc=
X-Received: by 2002:a17:907:962a:b0:adb:7f8:9ec2 with SMTP id
 a640c23a62f3a-adfad682f5fmr50158466b.53.1749847377370; Fri, 13 Jun 2025
 13:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 14 Jun 2025 06:42:46 +1000
X-Gm-Features: AX0GCFvBYudheTPQsPErwJpRx7FcK8QPcnYVNFFml7BF63WDlP4W812XArPXbDU
Message-ID: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Quiet week, only two PRs came my way, xe has a couple of fixes and
then a bunch of fixes across the board, vc4 probably fixes the biggest
problem,

Regards,
Dave.

drm-fixes-2025-06-14:
drm fixes for 6.16-rc2

vc4:
- Fix infinite EPROBE_DEFER loop in vc4 probing.

amdxdna:
- Fix amdxdna firmware size.

meson:
- modesetting fixes

sitronix:
- Kconfig fix for st7171-i2c.

dma-buf:
- Fix -EBUSY WARN_ON_ONCE in dma-buf

udmabuf:
- Use dma_sync_sgtable_for_cpu in udmabuf.

xe:
- Fix regression disallowing 64K SVM migration
- Use a bounce buffer for WA BB
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-14

for you to fetch changes up to 1364af9cb2c5716f1905113cc84ff77ddf16a22e:

  Merge tag 'drm-misc-fixes-2025-06-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-06-13 14:57:09 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc2

vc4:
- Fix infinite EPROBE_DEFER loop in vc4 probing.

amdxdna:
- Fix amdxdna firmware size.

meson:
- modesetting fixes

sitronix:
- Kconfig fix for st7171-i2c.

dma-buf:
- Fix -EBUSY WARN_ON_ONCE in dma-buf

udmabuf:
- Use dma_sync_sgtable_for_cpu in udmabuf.

xe:
- Fix regression disallowing 64K SVM migration
- Use a bounce buffer for WA BB

----------------------------------------------------------------
Christian K=C3=B6nig (1):
      dma-buf: fix compare in WARN_ON_ONCE

Dave Airlie (2):
      Merge tag 'drm-xe-fixes-2025-06-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Gabriel Dalimonte (1):
      drm/vc4: fix infinite EPROBE_DEFER loop

Lizhi Hou (1):
      accel/amdxdna: Fix incorrect PSP firmware size

Lucas De Marchi (1):
      drm/xe/lrc: Use a temporary buffer for WA BB

Maarten Lankhorst (1):
      drm/xe/svm: Fix regression disallowing 64K SVM migration

Marek Szyprowski (1):
      udmabuf: use sgtable-based scatterlist wrappers

Martin Blumenstingl (3):
      drm/meson: fix debug log statement when setting the HDMI clocks
      drm/meson: use vclk_freq instead of pixel_freq in debug print
      drm/meson: fix more rounding issues with 59.94Hz modes

Nathan Chancellor (1):
      drm/sitronix: st7571-i2c: Select VIDEOMODE_HELPERS

 drivers/accel/amdxdna/aie2_psp.c           |  4 +--
 drivers/dma-buf/dma-buf.c                  |  2 +-
 drivers/dma-buf/udmabuf.c                  |  5 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  2 +-
 drivers/gpu/drm/meson/meson_vclk.c         | 55 ++++++++++++++++++--------=
----
 drivers/gpu/drm/sitronix/Kconfig           |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 12 +++----
 drivers/gpu/drm/xe/xe_lrc.c                | 24 ++++++++++---
 drivers/gpu/drm/xe/xe_svm.c                |  2 +-
 9 files changed, 68 insertions(+), 39 deletions(-)
