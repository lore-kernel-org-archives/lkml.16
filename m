Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440F2857FB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646747; cv=none; b=QvurkyDnfVN3LXOBj/hUwIRuYtQ7ebjMDEl9yeVnI51/8Jzp6hC9njzDik5osOUfQ6GvRiooyCPZPJhTlbb38tVVraYYgk3HRU3QXA0q0M7K/RROVvwMKpmDvDmzMGOcFzH8nMLzYj3bAzAAGZKUK0A/8xqbckZ14ofEeZNawko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646747; c=relaxed/simple;
	bh=c4q9hKJ0GfSD4cmrQLce0PPykLtXw5caieViAR29pPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0CQLIvZQv00xZ3pM8TfZ3z7vDOhh9kYA26Y2sjSv1kv5KS5qdbNVa5NfG2FslDHQoFNSVoYYX55b2ivF0ynQpvye9r+Bu3lI+u9S3T+Vbyg/a3+hVAHkBjsIGsCwb1g2t/rjbsEfHyeRpAXEWAvpU0xVKOqQNcMT0BbFVkdZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=M9GyxUvn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="M9GyxUvn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363616a1a6so18935125ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646744; x=1750251544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4QOx+b/QncvHLv/sLMwOKnuymoyk68+Yx3qOBYw2f8=;
        b=M9GyxUvn1UMaCwbbFLIX7weFVaLwLVo3/2bEe5sFY+FoeCLkX80ke1SKw4DpS0PMyG
         etjxkmuPj4popWwpxtXxs9KIUgPNNfSeEQPaDIIkOIUKEmIAFnK24D4YgXCw5zrTmKHZ
         zXqBS8FxrTpvdAK2PkchX4UrndepKANf2TNLtJuynfd3c+/t5QxGseMNaMKM7MJbA9+6
         UG5M71JceK9nIqvWHzgBIg/J79IGYtPap6ohC883x1wZyH3jSg2BOywipySBRi04bX8U
         BvMNCEleXtYG/3pipPlk9WmITlUq+0Vk+ER/dU2PthLLrEdGM/8KWO1Sw2DXDOHvF9C3
         jsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646744; x=1750251544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4QOx+b/QncvHLv/sLMwOKnuymoyk68+Yx3qOBYw2f8=;
        b=OSJ51CNP/etB9ovozWYaKulNVM1bJ0xx31mpK9733kP6Zh1v5jvsrY22sAdghf9NsG
         jmIQwXhU28ciDFERgAi/NQCrW21RPE2KRH5NuSwVJhkFERuz9xxvgehQfZ9LYCGh1/GH
         IE3N6d1Rdt2aqAiWYiiP5i5x5cCExUbjSqIY1u66EGAZssgUOsR5nNapX+VNGuVt3R9p
         mFIv0bLlpVRYgQCdwlayAs5ryL70CixMv+cZP5Qy7NYXIZsAaUxJkgcFMOu0hPWrSFrc
         A5/6QgBG/huXQ5n0A56iHMd5Emz6ZCfRN3Gy85vfaa7+x6Zd8hO8UNCYkeoGdf63GrEi
         z1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM4kGiLNgAFiIiVg3GxlW2gIvYaHDEHUG+9Iw44UuOG0vjik7iN0729H+jdK1q07tG6/Gzco6Z0TlhD1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiObdrr3sHQDNdta08XrzIxPMEp0jc1KSyarsS+3lrVUKolAaT
	hbGPNrO9xydmbmwITxxZjYnsR0h1TKprFzH9QMxShGAkh/XSta3jWLNUgwfJqHSXWgU=
X-Gm-Gg: ASbGncuYbFyRWz6jNmpiUy8Tv1P2lCr10MwOgfVyKVIQzgkMr7d7eWTuhSh0R9uQIHR
	B64Ejonak/b53zOMqwARmEtTlW0uaNBUoLR1GQ8qeinbtFUrwJKFcnJXiNidBFpOmqTeJZ8xR6l
	kmtOSJi2c11i7uuapCghi8sCDOBtXkkMwTqOu2XTem2DAsYcLuj9jawpZoUMbbxj26rb5PD6zOW
	qlNBG8rFSxfzVTOPGTvw8vJCoriLgluU/K/+1VcQh4tixDZ0hO0uX6qt7wJ3r8km0rpZbIYnfdf
	ryxkIJD513BzYImnPHaAcAsQmfoSePoJDh/fEBstYas+4+8J5QeZieUW2ROTQ/THDRvnnVHpqdA
	V9MToP3z06I41ZLpCx4jTlQ==
X-Google-Smtp-Source: AGHT+IHeeQKbfAGNGeX62nkTUoAIUb+/0YEOPG1s+np4s8lIc4gcrO2OCn3QlplFdVVleQo4sYhIgw==
X-Received: by 2002:a17:902:e74b:b0:234:f182:a759 with SMTP id d9443c01a7336-23641af07efmr51079475ad.28.1749646744203;
        Wed, 11 Jun 2025 05:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:03 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/8] dma: mmp_pdma: Add SpacemiT K1 SoC support with 64-bit addressing
Date: Wed, 11 Jun 2025 20:57:15 +0800
Message-ID: <20250611125723.181711-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the existing MMP PDMA driver to support SpacemiT PDMA
controllers with 64-bit addressing capabilities, as used in the K1 SoC.

The SpacemiT K1 SoC contains a PDMA controller that is largely compatible
with the existing Marvell MMP PDMA, but adds support for 64-bit physical
addressing through Long Physical Address Extension (LPAE) mode. This
requires programming additional high address registers (DDADRH, DSADRH,
DTADRH) and enabling the DCSR_LPAEEN control bit.

The implementation maintains full backward compatibility with existing
32-bit Marvell platforms while adding the necessary infrastructure for
64-bit address handling through a flexible configuration-based approach.

Key features added:
- 64-bit DMA address support via LPAE mode
- Platform-specific operation abstractions (mmp_pdma_ops)
- Optional clock and reset controller support for modern SoCs
- Device tree integration for SpacemiT K1 SoC and Banana Pi F3 board

Testing:
This patchset has been tested on SpacemiT K1-based Banana Pi F3 hardware
to ensure the PDMA controller operates correctly with 64-bit addressing.
Existing functionality on 32-bit platforms remains unchanged.

This patchset is based on [spacemit/for-next]
  base: https://github.com/spacemit-com/linux for-next
Plus the reset controller driver, posted by Alex Elder (v10):
https://lore.kernel.org/all/20250513215345.3631593-1-elder@riscstar.com/

Guodong Xu (8):
  dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
  dma: mmp_pdma: Add optional clock support
  dma: mmp_pdma: Add optional reset controller support
  dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit addressing
  riscv: dts: spacemit: Add dma bus and PDMA node for K1 SoC
  riscv: dts: spacemit: Enable PDMA0 controller on Banana Pi F3
  dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
  riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../bindings/dma/marvell,mmp-dma.yaml         |  17 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 234 ++++++++--------
 arch/riscv/configs/defconfig                  |   3 +-
 drivers/dma/Kconfig                           |   2 +-
 drivers/dma/mmp_pdma.c                        | 249 +++++++++++++++---
 6 files changed, 370 insertions(+), 139 deletions(-)

-- 
2.43.0

