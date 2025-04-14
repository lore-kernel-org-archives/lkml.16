Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0401D6193
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658245; cv=none; b=W34VtPIrwhW5xkfGGoeztAZ3EOAX7/KiG/ma9O3n5qJWi0jTpWYG58wrZTCPmXc7pCs7+vQm/SUPyA4c+tJkpmxSPGbsSKT/3CzXMD1GMKLL9P1BciJ9DO8vkNsDUxUSOANgn4+Kioqi7vRG4trL7EplDsUFzqJolAHQWTmiJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658245; c=relaxed/simple;
	bh=oZwsWyN19YQuLxvi70G/U0IIHVAnZHz9qoqnnkeShL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVJt1Zn+4ZfrnNTlb+W/Q+13WdLnshn/0jUEVVZpILLiJv7zqmXgHpFyufsxkFdVh1CgKyiHIMkX2a/iObyLMWdwezwq2hExPoC0kn+GmFHdb1Ub+X6bjFc4sO25n/e/cL1L4HTxk7jHVkFsIMqlCn+yUGDgSgL+GFfInK3dUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WiReNg3l; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WiReNg3l"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so17007675ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658241; x=1745263041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOnX2shAz2EreIKfS+XNRjetpp9PVDTaCPEwF/lvRS8=;
        b=WiReNg3ltf06AJz+dZ5PQQf92X9ZKOz0Qjmbwf/wY8EX6voqW+yx0qsXbeL3oBxKqP
         eZhMD5BjkLY5/TsLiavNXOmsEM9r7Aik7Pufufv3Q02pCpYmdZNQ8o6sXh4KkKCds88t
         F6SH99obRBtuUnYq0jZpikRcKjs+QciWT2o0ivc8dVlDPHSUf9BGGRRqgDKGGdzttoEV
         lIAhPOhvQAOxeg/EZStL8W5WVnPyDUL8v0kiaNlufdV2nrmCQi9SLNsK5a1ghnMqGDC4
         3WIcqlIInp+uOker8gLx7Ze0S7VO+3d/CBRxBCv3fYx7/aFNDSGUqqLbUvGrOdYXNrKb
         MCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658241; x=1745263041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOnX2shAz2EreIKfS+XNRjetpp9PVDTaCPEwF/lvRS8=;
        b=FaYCzw5Wf4zYlflcBmlzWZnWmqmGM5B613pl9LOwNbl3zTLCFAIBsnmNuBLBTodqQH
         PQJdkf1mZZ/LuHoPES6exDwxXcNbp17Gd1vZPt0DrHWhKCGMejgE8MSBe20MInQ7hLoo
         obdilPONNIEj04ks0vG+VlkU+jEBgREKzltV+ufaOraZpIZcNoY+wCkQjRzQb1IbYrqP
         kzV1pe402YyEJVY8g1AeCWf681Cd2APPAxjSSp5uJN6vXB4A2wc5fYEg3ALUnl+MoSSk
         XTtcX9VZjvbXnEbUlZaq+gjB0lt4WdqDQnEaTAxkmHl9GUQCpMBPzgQ5d/G4GJDYfaNb
         ylfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfjS3H6Qe+mPsWgddb9VzZncj7JHRubr89DhJCP0KQUlEaJ+3l/Y535fuDJIHshZowxD8NVbtzEXCxSq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJc7uZjODJM/8cJWnI8VbP2RBm/rz9d295c4V94jSbbfFoCHLD
	SC7I5iDYeIsGowWJLWSL3nMjUrUsZ8HlfHnYrO0tnw+A0D0fruvsgZjpHaQ0lAc=
X-Gm-Gg: ASbGnctsGOOLTkwDWiXFcKMZEdXQvbMDSC7iy8CQ1YAqq0juiYIDEMCE/3bAYy7By5T
	0J7KWARprThAk2IVEStcnrnUZvSB5Nobj8q+ytPke87UvSNII5Y/KyoPImB8T+7qVJfxU7NWIKO
	vZiYk1JN1Txsrq1AG335Mt1p5jHZ5h6s1CMHuPjD27E79DtOFMz/Kerw+MoODan7foIysA9+Bzj
	HxzJHJqmVjYziDYasj5eDDBW5Ao4fuXqtU2QYuUpmeW+2z6An91iyrwOwFezZXCfrZf1/s1BwnV
	/eaMm4M/ui9KBSp7Kze3/s8+RnEGipnx/SmliNcYpjiPNjWos1YyMwZ7/Arz1eitQms+Cq+f+n2
	DN8WPlfjjZ1+lUw==
X-Google-Smtp-Source: AGHT+IF+wewcSr2YJ4blAeH5OccXBibu/mClWnQWAdm112vnTse7zLtH44BvxSZA8DZrAtcKFRUvag==
X-Received: by 2002:a05:6e02:2145:b0:3d5:890b:d9df with SMTP id e9e14a558f8ab-3d7ec266fd2mr117489655ab.15.1744658241457;
        Mon, 14 Apr 2025 12:17:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] clk: spacemit: add K1 reset support
Date: Mon, 14 Apr 2025 14:17:07 -0500
Message-ID: <20250414191715.2264758-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

As before, this version is built upon the clock controller driver that
Haylen Chu has out for review (currently at v7):
  https://lore.kernel.org/lkml/20250412074423.38517-2-heylenay@4d2.org/

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v4

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 2 of this series.
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

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: rename spacemit_ccu_data fields
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 482 insertions(+), 23 deletions(-)


base-commit: 846ce0a9d3e86830a3c6253c3b62104b369d6a95
-- 
2.45.2

