Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F6218AA3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565608; cv=none; b=mThZ1WzR4mmM6rihzScmY0ndi9/PhUKnoXVFCZg2+zvPG6AqdmgriWX8d2W/RcXDyU0/cI+MrjaQX5SKYQC1aGrL/ilp3dyRWMJwHfT7o/7C5klfP0mNNN99U67Gpy6vFnNgEI7gVSvl2ANmUYCNfdk+AOVRQ/NwpgHsi2EP5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565608; c=relaxed/simple;
	bh=ERNUVozEOVt14+yZDFjTZpFiaXN84yn5w7dLaTHaL9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CU1DuLUvZtJsY1m3j1BVspFidT7rBw3CCnC+6zv8u3ShCUBkKhOn05qZpmMj1UWXd9AEDgZ2+HpUFq/naADWTz9Jh3S4yxFbtCfzYILYepsYgWd+5tbgc/eiJ+Qyl/XJWhRxBnHVSsor/Ws/19WZ1HuxdrHRUHCJGxFh34DtlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F+3i9RXz; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F+3i9RXz"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85dac9728cdso170477939f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565604; x=1747170404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=F+3i9RXzL7sv4SaVclDtnqEzmiCThSpxM1btD6+6QL25D90tMoEHYHqpiNZpfEBcxn
         iKhY0OrCGXkBMKjevJCciXbE5P7+sBIl7Wm/Cy7uin6Key+KacDEzuEzDsx4x7U2sP/f
         QECC236yEoldWRfrhkqx7FLC8Hc7LUFuKhZSQXP6h7vmqjFi64ptZK/frD3f/SmCtOyg
         co3+OCe/XIbNxfLqvouEHunt5rumqOxGCI6vXB0zuTIlhkstGpcy3v2Jy7qi9k62aR3y
         kcgqCmGvXxgV2d/nGUQKYgk4fa7RgZ/FN4RnMWPzsHC99ow3Q0yl0/wEg0qbyn1iahhJ
         0PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565604; x=1747170404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=lglNqu3qWeQQ0lZ7FIBdCLIxhQytLKzZJfcoVmp+m1OuiIOFrsKpPy0pM+IzpBIton
         P/3GGxJPh5meCKrr/pvhth7cWVM9SyD5Ys38h+Y7nufV5VMzuNOFBKE4IDWE9z1c1vAu
         EAdE6kQKy1c5QHh61s+ahYPzhCHYakgTUWaILVngSFTYCwRgC9wZUOpoat0/rbCyKtVv
         6SjaYseTBIBnpjAshBrr21LX3ukRLpeJRwrS8l7sgEObOX3J/cga6MhV9X80UJ5nwZuQ
         kqm76PhI7y6umOea3eGKMjbn8LJBm1faqezia1ZgqzXpicoE91onIAHu7wiRv8mObb/S
         4EuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCYvyMx6is+lLZt3x+SXrwrl7kbUqrvt/7dnBRt0bn/4TE0wGIupU0pkLqzGLKPqKLxSwcOPcUWzMGNhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0xliqaf3xeRRb3ur//nRibPGtSP9xxisQH655VKwZVefxk9c
	Mktl9wX0kHoIqKkS36AvxfW0tO/r3+o2IcUEXwvr8sTjxyT81pL24BITaEeqMIw=
X-Gm-Gg: ASbGncvL65/lxGn1Oup/TEj1PWRDaiWc4GZxFR1H1Ry2Ny9CATiiXDB6HdWh9XbNFhR
	dnlbeobez135xTvwnV6UkiVnysgh+JhByYmhv00ow6qzt6g2GCwv13Zd0jupXwffKJfW45qBA7s
	0HL0iiNV5vcn+upHGSYWsvNK4JCj1nEI6Db4KWuQl13rCSq8T7hvbnXBp+CN6xzfvgNo+Aa7DJI
	v//91g5WkvJjnM1CTgqYTXrMx5cNgM5VtNtWpdjDIUhoiTtwu1C87A0e5EFU2AlK4XTsvrBwYeL
	cr38mM8jwLbnL/h/XhcB645fzGpJMygGOM1777L5K0MkU43tlKHb+UgSV92laAxNFmYNR5lIS+W
	Zqc0D7UiWFBpgaw==
X-Google-Smtp-Source: AGHT+IHmLwR/RdxY6gKxsVffp2BFaQw1Bk6UdfmCxeRt2RRt1uEhRJSBeWBP2YNWT9ppTywhStu3jQ==
X-Received: by 2002:a05:6602:6b07:b0:85b:41cc:f709 with SMTP id ca18e2360f4ac-86747413db3mr136372539f.14.1746565603723;
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
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
Subject: [PATCH v6 0/6] clk: spacemit: add K1 reset support
Date: Tue,  6 May 2025 16:06:31 -0500
Message-ID: <20250506210638.2800228-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

This code builds upon the clock controller driver from Haylen Chu.
This version has been reworked to use the auxiliary device model,
as requested by Stephen Boyd.  As a result the reset code resides
under drivers/reset rather than drivers/clk.  A new header file
holds definitions used by the clock and reset drivers.  The first
patch is the same as before, so I preserved Krzysztof's Reviewed-by
tag.  I dropped the tags from Haylen and Philipp, given the new
location of the code.  (The actual reset code is largely the same.)

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v6

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

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

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/ccu-k1.c                 | 220 ++++++++---------
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/spacemit/Kconfig                |  12 +
 drivers/reset/spacemit/Makefile               |   7 +
 drivers/reset/spacemit/core.c                 |  61 +++++
 drivers/reset/spacemit/core.h                 |  39 +++
 drivers/reset/spacemit/k1.c                   | 231 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++
 include/soc/spacemit/ccu_k1.h                 | 155 ++++++++++++
 12 files changed, 777 insertions(+), 125 deletions(-)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/core.c
 create mode 100644 drivers/reset/spacemit/core.h
 create mode 100644 drivers/reset/spacemit/k1.c
 create mode 100644 include/soc/spacemit/ccu_k1.h

base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2
