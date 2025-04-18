Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7661D54E2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988050; cv=none; b=oVi1XlzoOS+uWi8HAh8mxv1i6ro3YlN0P0+gCNBVVZ/91Q91bj5D0jjfY2sEUqkuPQrLmqfuWOMjcyDJuECHejl73L4K0nF5KWO/WT5LkHRqO9hKsZ5arvnt+6bPPgFFqp+mbUtl3gyreS9P6GEovB7BOKRk/BqzwczuaU/fios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988050; c=relaxed/simple;
	bh=dlNXHuUORBV8qyM4a+/YpF7hE5uuPIDHKUaPv4eKnS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVSdzOVMPMPoFld8EkNqGWGtW3G3s4pSQhjE00L1QB0iqzy1qtT+Ptf2tML5trGU1A9PV9375Nrvu1aYEvDIPsVEFJuEpAksuYDCdMYrnLPtHbnYnBXpwCAFVECg7uNxUJmqTvGjtJvPQ0BVNGJHcUyVrpNvBRqg6p1jSH+dHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eNWgBPiU; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eNWgBPiU"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476b89782c3so21803481cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988046; x=1745592846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=eNWgBPiUZBBGywto8apaQKwi0lvLeSL9o8o75LMShhgWvF7u9JpTMdOij00XXoRr+Y
         2YEvPfNzv8KOURvdDiyTu/pIWrX4o95B+wENzOQBgCFIH63/p0iImXAMCJuR36JamtIk
         9G/K6VapKRl25yzpMIne3PAKSCFZNP6hjYK88sBufFg1NurCtfdyJZg6Rjxn21X8EKzV
         /sQYwA94VV1kRg9j2f96mykISRusQoeUck0aKPmE1y6uDl+0sEjN6SVggHF92NG8qbMq
         sBrUa+RVBaLmgVktiUHM0o6DM9nx1k3t/5JUJjHwKuSDZsmguusYhAlF9+xhY445he31
         BsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988046; x=1745592846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=AzSDsQAhIkBHkdz7Wjk9Re9Igmi9P0c57b8kh7SagUOeKksnOvrFsCIKET80beaAbB
         J6gqY7A3HOec9XF/Lxjn5RSD4GayWNY3HXgFA5/dPwMHZU/wudnnFS+QIPjvsCZg17z2
         mYZ976Qq+bq7QWXw5kwMEHENLzoRB7A6XwViLPOacQPSAsxVM1Iea9liwZpivM8RHgUx
         149xEAQsfH7TTUxOg0M2Y3nWMuc5hpSdsi0khwpLDQvi3S64USvlULtiaAI4YcLCfwrk
         x7XDfkMsuaxtuLjxpdhIpm1UQiJAb+k+ZmwYJBDlfFgSIcmI8cUVCT5Wp0t3itaxgTO3
         kgBg==
X-Forwarded-Encrypted: i=1; AJvYcCVPWqAvT6hCdrs//moAxJkk0a9YzHwD9xBJstAQ8Y9bzRnfeOrJJGfoTnUFmxENuuFjP12FPHXc9GLP+38=@vger.kernel.org
X-Gm-Message-State: AOJu0YzngK/+WHvqjNFkWRiwCtQ7CA6kp13MUBJ2XAI1M8Q3UF2nQGEf
	LnP8qvyQIQngjSkKydMopqoaycr0dRqIW6q8UkOqDqcGZ7zaxsiY1SSmIqAZ2o0=
X-Gm-Gg: ASbGncsIhbaNHvKwyIvITgHt3XFltBWMhRG3VodoSSphoCj1UI/undwjIiHgMwMa0xL
	pDmN3EJGUUi7LgGokkrfzvVMBzbVxlKw+ZYejsF03yH75zOKvAQ/umLn8b4yy2n5N1CdI7LYMf1
	dJBgBmIRv8D65Pa/Ge8a2t+RZzZtwLW4DDIdBWrZrUM/bn8zu9t2SsN8esFaEuBCSdSCH+qAdBi
	CfIU/mj0QkMB7S2ZHauo3fjL9PAwBn8LbBndJQc9ttSCUAUul37lYgdlVmnU85pmov+8bKZU7BB
	raAyUsMONCLeCz05U9kgNKt/wvcmGHT/UV/VB1uKWW8j6iVFAVh+YywCxAeMQQrPxim4UPDYv27
	rvf/yE2miBUl5I78ifzI6C7EG
X-Google-Smtp-Source: AGHT+IHiEG1eSrMtmu7ABawgdFJIO6lV2wB6Q3AXU/kHDB1pdQpbBxefqDVD369wLGK+b6k5u7CG9g==
X-Received: by 2002:ac8:5a92:0:b0:476:7327:382b with SMTP id d75a77b69052e-47aec396ac0mr52829231cf.16.1744988046352;
        Fri, 18 Apr 2025 07:54:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:05 -0700 (PDT)
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
Subject: [PATCH v5 0/7] clk: spacemit: add K1 reset support
Date: Fri, 18 Apr 2025 09:53:52 -0500
Message-ID: <20250418145401.2603648-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

Most of the the clock controller driver that Haylen Chu had out for
review has been accepted (at v8).  So this time this series is
based on the "for-next" branch in the SpacemiT repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v5

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
*** BLURB HERE ***

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


base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
-- 
2.45.2

