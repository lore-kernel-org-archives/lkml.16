Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2F28851E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734056; cv=none; b=dgQlICiEtaFUxBLS+Oi7Pwjezz/rdafiUQxlwedTdtNGl1Hr0UcWPQ0edXOHxaJUremdH2XW4/F5F1+UMJFuzLolf3YOF9dwMvo6Q4/ezN/h975vQeJR/3xU7vl9fa4vPRPhAiK1mh5UNKH4h8z4DY+nSy3PlZ+4XFO/Cccvk4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734056; c=relaxed/simple;
	bh=kwdZ+Z/LF2j5ZHRi5G+bPYrNTJt3HUhSLkNyRXcZ9eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0Z+5a886mWSWUNML+OxlF1envyB83Ont49j5OVpviTNp3cgXNRP2BbRZN4KpRmFMPfH09HVPTgfMoUdiVU8KQe+/vofol0fPPe1Mn1qX06UNDg2NyspS4y3wD9cZWNmmX37sw9wGE6XUcT1SXOmmkmlh+vLXAU1zzG30JUJfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bDuD3WYO; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bDuD3WYO"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso44227839f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734054; x=1747338854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lLkvBZF0TFGQibyx4RWv5E5ajzDClCRIu3CVnS98Us=;
        b=bDuD3WYODUVXsumOVYeUcUNDa0D9bE127XnBqbs6R0welv+Er71IWsXEvj56qrCMOz
         3hglFUNsEyQvyJB8S0SpyTFeUVB7Rw8I5kJLiT53Xd+idxH6J6yhOLncGLd20R6G0KER
         FKk9E4bukEzPcIXA6tKyg6DScF+d59TAdvXCbNzFDT/9Rx8i9r4HUhr/A7qrZLOpRFaY
         dgOrDsM4rPhZcD30t/lY4QEbRnS98EDIEc6PSE7E3OnA0yXAfFBtmpUjjAE3qXFgauvp
         gjpAdTuQIR2fz+fmsj5QLOfKTTqXUw8KHdIBGla5Qx9a82/bVxO0RDt95gSU0jAZPiGq
         2Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734054; x=1747338854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lLkvBZF0TFGQibyx4RWv5E5ajzDClCRIu3CVnS98Us=;
        b=hTBN9wz5f5wme3sgM1ofxPGmrT1zYJnBi6/OmHmbTv7QFOp2eHrnM+kW+0q2o5sWlT
         /iINcEpVSTtjn14cJQlMeQ++w0g6laMJWVLPwi+892yugxDToWK9sL6bnEUMl9/xb39U
         k4TUsoRwTKezD8I8X+9D63+SXE7b9jvQjmt2TF9PiPEBaMHGEWqy+6ruQPyUFR+wg0V1
         Wc/ZVymDYDcJ/Vt7+PCxKJ356Ndpun2hZdWkie4zC8qiMWMbTixhxo+NloYJVvw1sTJH
         L8d2KsvYMqDQRR8VvgKWDu1SEOc87pLcdTb372KHXsmrpNg9MB3XoeAt4SfFqVXbQcmL
         CPwg==
X-Forwarded-Encrypted: i=1; AJvYcCUxFgyDyOZ6W0Nd8axbzdHHqT4AbZ5tuYRWrhbSOQ8N9++NEiRI7YzVCYMDbnnjMSgwfxTPKIuJysO9ZOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcK8P1RO6Eaq3Pl0PR3HXnAJzaZ0kWGsFqAAZrYsz95PrZfTE6
	p74BwUU+8VDip/sJf7lYYkugCSJOo2LgMd2Ixa/SXaJpbJtDwSHNsG9T9O2idJw=
X-Gm-Gg: ASbGnctlWWhxQFjQpA3kovleqEQR5qcMwB8CZAD2P8/+kvWymdVCCiSuhrc7MSG6caS
	GrAuZIfeO1clVURnKNXvliKOPtCd5SJY19dI4QIZcKweydiZfIiIXp8Nq4Iv/ja1z6D69W+TWdc
	K2+/DcnwHXxsbN+5iaGckhS85d2t3PPec1eoNrbuOyrwB6Hlu65wk7R9htn6Xt2R+27D3ig+tNA
	3hcRgSVET5oK7Tw7+lm024hPxMeTXLM3Z/PVuGlaTBG/1ImzddSOwLC1q7LkWGhbVrcgy0cob11
	LS336oQ4o9tJLORzGGrCTlCVwX8k/X/k9INzZcGToz0+Juw4tYoZoH1hBKc7cfHtFkX+YyJ32nZ
	Bgp+I8H09PFOubg==
X-Google-Smtp-Source: AGHT+IH5+4NgW3qpid/j20Fj9qORDUdDDPvUwcmU1QEIhjjCmPh4Q+zFzAEnHPWUc/XIcbJzlBPzLA==
X-Received: by 2002:a05:6602:2c0d:b0:864:627a:3d85 with SMTP id ca18e2360f4ac-8676362d62emr131255239f.11.1746734053891;
        Thu, 08 May 2025 12:54:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:13 -0700 (PDT)
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
Subject: [PATCH v7 0/6] clk: spacemit: add K1 reset support
Date: Thu,  8 May 2025 14:54:02 -0500
Message-ID: <20250508195409.2962633-1-elder@riscstar.com>
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
This version differs from v6 in that all of the code is collected
into a single source file, "reset-spacemit.c", as suggested by
Philipp Zabel.  Other suggestions (detailed in the patches that
follow) have also been incorporated.  The first patch is identical
to what was sent previously.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v7

Between version 6 and version 7:
  - The new shared header file is now named "k1-syscon.h" (suggested
    by Haylen Chu)
  - The SPACEMIT_CCU_K1 config option has been removed (suggested
    by Philipp Zabel)
  - The SPACEMIT_CCU config option is now tristate, and selects
    AUXILIARY_BUS (suggested by Haylen Chu)
  - All code is concentrated into a single file "reset-spacemit.c"
    rather than in a directory (suggested by Philipp Zabel)
  - A bogus return value has been fixed, and a few irrelevant comments
    have been removed (suggested by Philipp Zabel)
  - MODULE_AUTHOR(), MODULE_DESCRIPTION(), and MODULE_LICENSE() are
    now supplied (suggested by Haylen Chu)

Here is version 6 of this series.
  https://lore.kernel.org/lkml/20250506210638.2800228-1-elder@riscstar.com/

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

Here is version 5 of this series.
  https://lore.kernel.org/lkml/20250418145401.2603648-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

					-Alex

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  reset: spacemit: add support for SpacemiT CCU resets
  reset: spacemit: define three more CCUs
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 224 ++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 740 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2

