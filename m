Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A33235047
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348260; cv=none; b=USh8pLu4i8j9E3UNnUYmnB7Qjppe6h4bcaHmI7Z2syENedLAJ1BnLJ1y2qlEC7NwJ33vO3zu3EEBfJ9Z/lwAmMNcl3IVoMih6xx2s4lId6IYxrkV9EAjHP+ba996TzphnthmH0lXdFi2jmJ7iyA9fdLpZAvX3CVQIVWgEknOPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348260; c=relaxed/simple;
	bh=rNXhKprF9+ev69e0bQtMWsAKJz8Oyc4P7Auc+A4an9U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ud9mYzpTL+3SPQHpnQOlx8Vq6shErRZ4ZMDRugJrqu7JM0RUd39kpwqHCjJT2hPv58DB+cc7dFKkAoV1Tdkg5oOQkJW9xyjacIywuiMidEQymj7ybq9gYj8kNqZ8Ha8j+sxLE4Ld2k6v3J2dwYuHLdJ+v3GUo0LW23bBwwkRQtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iRpS8l+m; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iRpS8l+m"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so4936932a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348258; x=1751953058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OkurqPOKVLu65iMMmlRK8LRX8T/SvzGfPgIac7M7N4=;
        b=iRpS8l+mPMQnexjXtf9A5rVqIbyWr+cexrtsZ1tVnicnSBS3yVHtTAtNRoPVUOT7z5
         B8c6VAcTj7sODhiXlCIjCrkruBQ3sQsmNvbiQpwr2maB/2SvdSIr7WvCEV5edRx1kCAq
         /YKlCvSIJLcu2C6MgBYkBtDbQ2iNOh+lBT+GezjukMpJag5EuBQIRqwzWMdY5ERrMGmH
         XeSklvv+LKt3+xiIeK9Qku3y53if5G6w0gdQpMPdupQAQVutJarFPSUs+wgqIvbQRocr
         T2hHj4Fg/BjOu0Xtgu9LZuhP26giPLXKBuVmeXndPlCns/MmkzecMi2z5xxmMteEN0eW
         2SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348258; x=1751953058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OkurqPOKVLu65iMMmlRK8LRX8T/SvzGfPgIac7M7N4=;
        b=uyF5rygt3Bk8X1tFlHWjA8lJsDJ4U/3UOwp0sSzVoRN3CenL0jr5vsP/XnLOCdpi6n
         Q7Xt7K0AnTBueJSWYf+EZAoepT3qOVVjYopQh2nQktq/Vlh+7pMeQ7OmvUhZnCRo9QKn
         lYWRl+djePCJUOXe1QubmmiHAGdcwok7M9bfI1mRafQ4YidlQcgp2UOXr00e6lCj5jR9
         zCUWwmrELp1RlsIxkDiLbgfUsDPFDPq9D632pbm/jNBWhyg2CECtr5UrfcHtJaWzqi5m
         34J/PxwqDL5QbNzhVQ+JcuUXgyLOomKyGfnMPwDcZ3ftkFmtQaDDOEU5GxetAK63n/K1
         dDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKa/DiEHWH6grzi7PGjvj0IKcTYK1hHNehMuSdRZzUQWmyjbmWkeJZ2Z3cBluxbN2j66d5H9e/79K6YQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYT+yp4uxEg6yrQRr5jWVclt2rDsy7gLkNzTNPubgeSzliNly
	sL09TOJpGRb6v7IV3kAm/Uqo1McsllSd8MnHGlqm3DpimMJBXmylJvZ3C143f5ygPXF6wWvBy1f
	1dpbjA2mk6BSd
X-Gm-Gg: ASbGncvwehU0DiePfiFBTN2yORLrFYRk5SxF4Ga5aEu6x+ibdqD8bBbwx4JCYkYtvjx
	cx93/3DlrIdHuEH/04SGO0N1il8LfpMyd6YOR3tvqa9jYJAdZo0WpubT7ByNBGJAasQj9jKgSU4
	ZU4itHIIU1EkTQtPmNarfYb7m5xupzt+aTYzSpKOcfBS9wzFopSYb4QnaCdlfuFJ2XQhHBSp/0C
	cELjObugDgQMCOmaMfjz8msbR812uPQl1dMCF+HypUvFpzSawWQ9TzlTe47N2k4NtHLLspnNeMe
	9LMDB7YnmBCXK+7u6v+bMduRzkmFwzP0T/NcuAU=
X-Google-Smtp-Source: AGHT+IGUAu2BOtg2ZvlOoErwNcYS0F/WULHswWmUQuGgbrebTfzSSTeVLb4j/vMfvu8YXkL6LJmixA==
X-Received: by 2002:a17:90b:5386:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-318c925242bmr19994442a91.26.1751348257949;
        Mon, 30 Jun 2025 22:37:37 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:37 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Tue, 01 Jul 2025 13:36:54 +0800
Message-Id: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPZzY2gC/3WS22pbMRBFf8Wc58poRndTSv4jBCONRrZIfemRc
 xII+feO4zzUpQWBNGL2XnuE3qfBc+cxbVbv08xLH/10lAK/rSba5+OOVa9ST6jR6aBBvZ7m537
 cbeshb68X2wVVqEjNaZ9zDZMozzO3/vbp+vh0q2f+9SLml9vlVPJgRafDoV82q8WvwauZzPQnV
 UJcmR5ACXbugxZVudHp2PpOhZZ0C6ZiNHWzwFV54DHyl/T7lxYRbXTiD9oltAoU/6w8P1ztxiX
 Pa8nw419Yh6hkPYMadU9dJUfBpRyDL+7/PDRXhTyNKi+Dh5obqdd+VovMoEiDtTqixGoPws9jn
 WlNx0/+OV9of8NTMORN4Wa81ewNWlMrNUM6FNCxWtd8BH+v0i2XHFwtxlDy2cXIAZFsw2KilwO
 VmjnzvUr6o5fWFj3IRjoBiH3mxGALIgBVLJHuVawbR2skgwmVYow1CTIkzgFCa5qNtVAq/DVXI
 80NSPaaE+YajdW6Zie/JjdItnGQpGF6+vj4DbuEOQuXAgAA
X-Change-ID: 20250701-working_dma_0701_v2-7d2cf506aad7
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

This patchset adds support for SpacemiT K1 PDMA controller to the existing
mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
but extends it with 64-bit addressing capabilities through LPAE (Long
Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
DSADRH and DTADRH).

In v2, the major update is, per Vinod's feedback, splitting mmp_pdma driver
changes into two parts:
  - First patch adds _ops abstraction layer and implements 32-bit support
  - Second patch adds K1-specific 64-bit support

The patchset has been tested on BananaPi F3 board.

Patch 1, 2, 3, 4 and 5 belong to dmaengine, and has no extra dependencies.

Patch 6, 7 and 8 change SpacemiT K1 device tree and RISC-V defconfig. They
have the following dependencies:
1. riscv: defconfig: run savedefconfig to reorder it
    It has been merged into riscv/linux.git (for-next)
    Link: https://git.kernel.org/riscv/c/d958097bdf88
2. riscv: dts: spacemit: Add DMA translation buses for K1
    It is currently under review.
    Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/

To verify the PDMA functionality on SpacemiT K1, it is required to apply
the following patchsets in order:
1. [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
    Link: https://lore.kernel.org/all/20250612224856.1105924-1-elder@riscstar.com/
2. [PATCH v11 0/6] reset: spacemit: add K1 reset support
    Link: https://lore.kernel.org/all/20250613011139.1201702-1-elder@riscstar.com/

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0701_v2

Changes in v2:
- Tag the series as "damengine".
- Used more specific compatible string "spacemit,k1-pdma"
- Enhanced DT bindings with conditional constraints:
   - clocks/resets properties only required for SpacemiT K1
   - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
   - #dma-cells set to 1 for other variants
- Split mmp_pdma driver changes per maintainer feedback:
   - First patch (4/8) adds ops abstraction layer and 32-bit support
   - Second patch (5/8) adds K1-specific 64-bit support
- Merged Kconfig changes into the dmaengine: mmp_pdma driver patch (5/8)
- Enabled pdma0 on both BPI-F3 and Milk-V Jupiter

Link to v1:
https://lore.kernel.org/all/20250611125723.181711-1-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (8):
      dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1 PDMA support
      dmaengine: mmp_pdma: Add optional clock support
      dmaengine: mmp_pdma: Add optional reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA0 node for K1 SoC
      riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3 and Milkv Jupiter
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../devicetree/bindings/dma/marvell,mmp-dma.yaml   |  49 ++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
 arch/riscv/configs/defconfig                       |   1 +
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/mmp_pdma.c                             | 281 ++++++++++++++++++---
 7 files changed, 320 insertions(+), 32 deletions(-)
---
base-commit: 7204503c922cfdb4fcfce4a4ab61f4558a01a73b
change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3
prerequisite-message-id: <20250612224856.1105924-1-elder@riscstar.com>
prerequisite-patch-id: 0c2a226feb2b3e7a2f090a4f10325ff9f709f6e2
prerequisite-change-id: 20250522-22-k1-sdhci-95c759a876b5:v1
prerequisite-patch-id: 53fc23b06e26ab0ebb2c52ee09f4b2cffab889e2
prerequisite-message-id: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
prerequisite-patch-id: 7f04dcf6f82a9a9fa3a8a78ae4992571f85eb6ca
prerequisite-patch-id: 291c9bcd2ce688e08a8ab57c6d274a57cac6b33c
prerequisite-patch-id: 957d7285e8d2a7698beb0c25cb0f6ea733246af0
prerequisite-patch-id: 2c73c63bef3640e63243ddcf3c07b108d45f6816
prerequisite-patch-id: 0faba75db33c96a588e722c4f2b3862c4cbdaeae
prerequisite-patch-id: 5db8688ef86188ec091145fae9e14b2211cd2b8c
prerequisite-patch-id: e0fe84381637dc888d996a79ea717ff0e3441bd1
prerequisite-patch-id: 2fc0ef1c2fcda92ad83400da5aadaf194fe78627

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

