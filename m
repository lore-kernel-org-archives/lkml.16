Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0F81F0E20
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173232; cv=none; b=hQDP9B/vUvwjMLxpE3k3A1UZxlIhlzD0ohAdYd7GCm1/NSzFTX27axeP3NUXO4XABXjR2Q8rYANnDC3t1doTBbvqpP5ikijDlLdZIdvQnhfJPVILibfLZwrPbyrmwQQ9q+AhDmX7KQTSh7668FfN+G34mpylF6jOyWosrriW96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173232; c=relaxed/simple;
	bh=71pgvnqAw3UA+IpyU+Dy5uOMDBAifp/mgVuOv7x8aPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pj7PNj6nOzOsurRaS4unKtRPlb5uRL9wz85pGSP55OBKnrZnrCSqAoa3rHw7tEtoVXOwRrFk9RNZEiqNZ0BK4mCzBpWjp/sm1e64QUlHfomchJr2GXuz+F1Zingyk5+xixVeL4pwe5FyyeDPvHwLw0lpF0xhniiPRVJg66Y+ckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WGZu9e8a; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WGZu9e8a"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so678677139f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173229; x=1747778029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoLEEBUGNiFTOGCb4OTLcURUXHh0Is7POKT/aDTs3Qk=;
        b=WGZu9e8atDc/sjVAmpq5f7gFtBHgPWfqzehsK1UXXyjWe4QmnRnyB8Po3vrNhZPSfm
         2BIeqQW6HBet3Cyp/ytwDYrWMPNhADO99434FPaOsyD6jqzW9y8yvGhqYYqeqv+uUhnB
         bKUNv8323dvEfxhH31I8kYPe5TCN1q3i+dZDp0BRF0m6qmt9elQ8TvpSOy/unDXrsScA
         DSm+IHoK1jxCHnnqgJXz0IWkGFu47txnf8LiUZ+Xp4WXqdBvksLbA7gC7NH9z7yJEPAC
         rxSNv2c/IiUU7E13V4DKSt2j7h+LV6s5CQUunwOA/xVLowaf+ORs63SG7qP8ncSKkeRC
         tT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173229; x=1747778029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoLEEBUGNiFTOGCb4OTLcURUXHh0Is7POKT/aDTs3Qk=;
        b=BL134lmnMBUteJ+B4Jdt2XSHiREkwq7Hu1pI70Fff4O5kF+FEUDh/tSTQR30J3Ci7y
         8CPAVK6O0yPvF75F44MMyDYGz/xLdtBTKGHQ4H76dVJV9+S2ooDyq7gatye8A1oUzMEM
         qdjXGgwNhtmgleh/Ak0vXNDwtHf6frgKGuQOnctV62USoVk3dHxKqbAKTpV4RFlpaApk
         Ej3UvDtzA1fzuZuAjCHU8XMVvImqpTHJis1dprZFphaOuTQzQHzm9eq4jvgs8dyXOv32
         Q0+qK3trNpSnp0tojxvKEwEFLbtNM7M9UFb8svCeh+uYr6tsAlpRTvCGMhQob2Pga2Oa
         xn4g==
X-Forwarded-Encrypted: i=1; AJvYcCX7Qt3MlqvC8ZizIv2VjJMDwSiY3YGCT2oXwubAAWYkrYtWyjO446UPPXYCYDag4ltEndfPzCMIUc3HHSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDov4u50t3G7x85kH+Eg1Obp6lEOrOTT7N2ZWTKr4d28gNOa7K
	dpdv6WiNNL6tI8dvTAoJ7aGDoG80tdMasq/A44fJIS3R4tdFpsksBuHR+iwjyGY=
X-Gm-Gg: ASbGnctl2cRiIgqdWL7H9EXkM/Evf9AigUrSUyibx58aFBdte66aV3b9/8rlTjvU21Y
	J0nnNyWnPz2gjNWc3Ka9GMIxgoeKG1EH36JFOP+10TVMz0GC+9rp7W94re+H3TVwaZPvGVBvISn
	bQs2IfQtGOVMS5xxbimGuKmqCi6Dsy+uvcLytfxYkZ6NIePI8LHI4ahaFCdrGAZrbp0dCIogUJQ
	9yyXHU8N3oZKF2wDH/SZS/S0t4yQUT77oYvw90QZNyamSaT2ZeAGLhcX9Ow1XKkTkKXgeeld1kg
	lCQte12BuE9QY/ODkTkD70zHT8spEKkW6mBDAID4toMqnwnjozFl3LpBT4WTORLbaqhwJ/dspr0
	SkFJYCX3yxIK42kR0863SPfCZ
X-Google-Smtp-Source: AGHT+IGDBUqBNV1+C83bdeHkvMMC/RIROVFW0hAND3S6eCYJOwvoQKB1LZmfPoy/YugMmgpVIC3HiA==
X-Received: by 2002:a05:6602:3944:b0:85b:58b0:7ac9 with SMTP id ca18e2360f4ac-86a08e3dc6emr93279839f.10.1747173229345;
        Tue, 13 May 2025 14:53:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/6] reset: spacemit: add K1 reset support
Date: Tue, 13 May 2025 16:53:38 -0500
Message-ID: <20250513215345.3631593-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

This code builds upon the clock controller driver from Haylen Chu.

No code has changed in this version, however two patches were
reworked while trying to separate the clock from the reset code:
  - Patch 4 is new, and consists of clock code that was previously
    found in patch 5 in v9
  - Patch 5 is now the result of squashing together two patches
    from v9 (what remained of patch 5 squashed into patch 4)

*** Stephen, because of various dependencies between the reset
    and clock code in this series, would you be willing to take
    patches 1-5 through the clock tree?  Philipp agreed this
    would be simplest and said he would ACK this.
*** Yixun, I am expecting the DTS changes in patch 6 will go
    through your tree.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v10

					-Alex

Between version 9 and version 10:
  - Reviewed-by tags have been added to all patches
  - Patches 4 and 5 are changed as described above

Here is version 9 of this series.
  https://lore.kernel.org/lkml/20250512183212.3465963-1-elder@riscstar.com/

All other history is available at that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 296 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 754 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 3f7ca16338830d8726b0b38458b2916b3b303aad
-- 
2.45.2

