Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3FC1C5D7F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195761; cv=none; b=IOQfI656mn5BKtNF4w7mdW1smNPSu2NFTCOHkyf9FjmUZuqFtMfFo02dA/+1iMiIHjrBzzKF3tAGS2utqEya7+4mwn5nEhi7kle7cUWUwpzZjr4ISV1MwKcs6WCp2ZSazvXQpL5s5ZM2c5vf8gFOiOBJ5gyKypliySxnUByh3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195761; c=relaxed/simple;
	bh=b1a8moIudFYGQBBhZ0ZFwpnDk+15x8Wgx+ZUtGp0Kxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNG4bD9yOYJPSWz6rjltbw9y2GqZT1B0as7xGGb5B4ARWAb105cRGn6Z+UCeLAN7EnFB1NhdT411s2XvDBB9NRD7+WJ6OMVmx32sc0TykPAFv2J3cMHvshFlGeJPUmyLBfWTLxVZ2o83keREHQIh8qoE9CijOBVKvbXMsaPMJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c9TCqEP+; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c9TCqEP+"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ce868498d3so8765545ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195757; x=1743800557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHJYMx5Ny8sSHNURLwOrkk6ILyuNYFJwUzbCpGHWiDs=;
        b=c9TCqEP+s9zS9L94KmrusyCFRtVbamHajsz4onjhmq7HFM9LRsizp74BCVidFq45Ff
         bvHHJLQWVGdQEmViaMN1TWIn9a3WegBYq/ZDWoqd+PUcnVsF2/A7rYFxJBWczA+R3LAK
         q7pgm5ro6+7igdBPECJhomiTNl+rsxFPw80mwMWI1utWB5JnwoqgudWTFdSzXvcLVvM3
         4qNCu0nQSmzNxY1riwAKfNvR38BGqgOA+3wFLu3JhDq159jEMZeQiqhA/GhQVO38l5zw
         0zdelRHJx6TpA3UyZi2rpYKl3hkWfOm/BFwbX1OhIs4FUE2XLIxCDP1h7pIb+NyDQ0ti
         +zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195757; x=1743800557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHJYMx5Ny8sSHNURLwOrkk6ILyuNYFJwUzbCpGHWiDs=;
        b=s40YBJZzB0+EukWknWAfbsy8uPP3pN1o+6gNx7VtdO4gSBy3U9uKrGyJeS11B0hb9Z
         svFZhS/QMlOhZicyu2qKnPvCH9A3PMnmQiAmjMRSI00/69YEqI5/QLHMjFQt7ryTnIh2
         exemeKxq/e8jadbIFvRKcAcMPyxtyhOi+Y46QTeW+I+sntTT7JRDvJMF8KXVMpS63KWY
         fo83wW68SfFIgWN2aE7g979RKVER4AjhOXKPommkbqXOWxQA7XGHMNc9VMrJ3lIqKC1C
         XkDIwp11ds69P0uwxz2M4H3Mh+OOE9AOaRLn+E36gub6kMfkkDtXFncmbl9KSLLC1gii
         ZanQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY5Cp/GONqv0J6SpaM6AnU4wWAkYkV+AqFYTibkkW8nStEhC7yfq3Z2+KVoUgQbsRgft7QoXDL+rHAUCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXU6AZNBYKe+FveQ6EalXGdi5WKIBiN3yEusaY8E1sNyJpL1oZ
	BdPELvr6UBx+fOAwU111mCWevjS0xa4h3pYM6S+bOTCFRf/B49gKwPUG9Mkyvs4=
X-Gm-Gg: ASbGncsCVKBN7DxQoSd8PFmhoisO6qGoXIikJbj3khA/wGdZex+lVn+7AuN4WAG88ix
	g3xi2tQBpX/eHyDHexjJn5KcOrOpGMgCTd9BrMXeBh4O1Uxme11gJLhEOD1XiGPIbgedfP62T9a
	UHBQPBCWWWBZXlb5hUmA27GrlDvbI0BexztbkuW6VVe3N15njJdkv2uEiBcw+0nB8a2W3dhtbOm
	KQSzz9YbpSUwlHBwqXoNLdvuSzEoBhmO8SGXGGy3aKRbDrdqRna/0+aiK/jkjcLd89ML9O+5BTr
	YIIs/MLMQyR0YGIqMzIdb//WM4L8hbpjdrbv2NCAoZD1tLzXlVnVZBpg8aKkVEwU61/17DSkDoR
	csAD3Kqos2wZc9u4kBw==
X-Google-Smtp-Source: AGHT+IHk48TQj5LU1BljWFGSUTe9vm5Iy8BdohARUm7BRbpRyYRCt5Yc1AT2nUjsk81V+iVQCDA4Kw==
X-Received: by 2002:a05:6e02:260a:b0:3d5:d743:8089 with SMTP id e9e14a558f8ab-3d5e091344amr12125865ab.7.1743195757226;
        Fri, 28 Mar 2025 14:02:37 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] clk: spacemit: add K1 reset support
Date: Fri, 28 Mar 2025 16:02:25 -0500
Message-ID: <20250328210233.1077035-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14.  This version of the series is updated
in reponse to review feedback from the initial version:
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

As before, this version is built upon the clock controller driver that
Haylen Chu currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The basic content of the patches has not changed since last time, so
I won't repeat the explantion of each here.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v2

Since last time:
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

Note that I did *not* change anything related to the "remote CPU" (RCPU
and RCPU2) resets (and clocks).

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct spacemit_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 380 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 128 ++++++
 4 files changed, 521 insertions(+), 18 deletions(-)

-- 
2.45.2

