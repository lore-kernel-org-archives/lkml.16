Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18719CD07
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233469; cv=none; b=q1WqjeH0WA7CxfoTI8sYNQnHrmscthgb2klfGwu4hrhl3cd6AtgVqZjsw0ZS+CB5e43lZ8beC9k3oWThOB24prmUSXZ+QCWCW70fHcSWFsbzWv3xNt03uW3gPos48TMAhZ+TNrSqQCMz5MeYhLjS0n5DvXIzdYganvRLWJoKPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233469; c=relaxed/simple;
	bh=VMdYZrLAD8DMV1DpO50jqiz0vFY6aFjrLaJXiBM7mvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPtGBqCko+YGCVAED5+iDOXLi8RAWiUR9Bd2chc/un0055+sCG+GfNvnLHeuvHDwGlJgRkL8/cZ69ndTyctAB1e/SOkKDggAOX1CVeqBd5zEktMNNBFtWDMII08x97Y/702BX8z951xILHqAYSmaKy/HAhSEBwX5CN9U3qJVFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bVPY8moo; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bVPY8moo"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b41281b50so5124039f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233466; x=1744838266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrV5UlJLrK5aj5lTpRQRYMaHqlL0u3EBGUfh4HcWOG4=;
        b=bVPY8mooGRXZnFbyiZgysvh7XZ+c1nIRhkLwk9qtWfFI/KTkPZW5d/QjeUO0H6Jhqj
         FeoyiT/0JUaPh2f+2pzBaJsW40YRETM9N7jMIfQhD4Xfstc9JiqGWLMC3xome1KsaN0/
         BzJpScvxyL+8joBKnnHnXZJTbEbfT5MglkcwPsBGXCFqT+nr7KQuHgpifT5mrYNcFFR0
         1Kc9qpqRn0xhcmzcqCGCXNLVzv57aLhpkrZgX6LFVmnwrtfPtfmK4IxganXVQDydYbxK
         XuURMpGoF56af+0HiNYJbRpULycS1SUrxGBaGsbGf0IhzTure6XfuD+gdWc2m+fKICeF
         VGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233466; x=1744838266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrV5UlJLrK5aj5lTpRQRYMaHqlL0u3EBGUfh4HcWOG4=;
        b=f3QaLZsPfAOdOMh7Vg0xbZYcv0NXc8DXL4yFbD4z6bADWXPxIy4MHlUzTqUeuJXGYU
         dpqXTIWRUB9JVkzsi78iBfi9G3iHuCf8Fc4Mp8S05CVCaVMKvf1RUh8xKnMxaXebExF0
         6lj3GH2IFeqSyNoBESJAA+kNnmc0yaLojp0B0vm8SABDokoUpfqq4F46GoZPRNGQboax
         Y+GTPNMAzJsGUkg3hpMcSmxFCDZDtuuZgCK97GS0Pv09xqzsH9AH2jSzeRsgZZ4ztou8
         Jd/r8qaXH7F7ux5KCEDfkkEng1MGXgaJWLuaEXFuVZSHRUD3UajAMUCYNYlxiBfFsl8R
         ePmA==
X-Forwarded-Encrypted: i=1; AJvYcCUxDMcoWFtEZgN9hUmj2nz7aW2ibA0IJagtFefzL6sB9LxwWPXkWzfEmAZGcgKz5pIb1Bo02d6TnzzcgsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8drRf8AILDKgiFOKKfond43szC2D7ZawYVF25SifVl7qb/Y7h
	sjOO+OQ2Jocy7hBIX+sI830Nq/oeVvDwnWvosALG/qj6jaeQw5cNK2UW7E8r9880b0dCUdhaHiY
	XDgw=
X-Gm-Gg: ASbGncu8t2sTyQudCSONyEUQjgcKS+p8HulzE048qh9kQoHQ7CVdfmoijmHZhcHYv/K
	czVuNc138pcHZjQbYTH1G+qR9ODP26AQ7qui8qxJtvLo8TB+8Pbp/L5yUHFwSnzu2Dg5tMjIW4C
	L4s27vlpjW3OpautZ4Zz2Z5H/TathOmZxLTb+W2w5eg+6u8VcjItVvfUk8TJUZi1rWciY7roinm
	fotHCo0d8SqgVXJ2eXqpaz+LPNFH3RhPF6FWRn5FW+u22BmFkw4UfSINzo2K4DFchted16qQP7Q
	cvNk7qS73b39pnLL1/zODHZlE5+gXz848AhgxM961HSxA0EgvC9qRbzC1AjSGKBqmjgb6FyLG1Z
	UMb7cR90faFCZWA==
X-Google-Smtp-Source: AGHT+IG6Fs0mDXRYU2o6Td0yWxwYb8N9uHgcDDzyd75KPdUxyiPuO9N5OH70dXQk1TVcz0gCoG5PKQ==
X-Received: by 2002:a05:6e02:1887:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d7e4780824mr6626785ab.21.1744233465833;
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
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
Subject: [PATCH v3 0/7] clk: spacemit: add K1 reset support
Date: Wed,  9 Apr 2025 16:17:33 -0500
Message-ID: <20250409211741.1171584-1-elder@riscstar.com>
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
Haylen Chu has out for review (currently at v6):
  https://lore.kernel.org/lkml/20250401172434.6774-1-heylenay@4d2.org/

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v3

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
 drivers/clk/spacemit/ccu-k1.c                 | 340 ++++++++++++++++--
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 488 insertions(+), 27 deletions(-)

-- 
2.45.2

