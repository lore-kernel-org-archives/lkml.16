Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC721F1319
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749768544; cv=none; b=fX53AC3sqLs8EMCjABacJWS7b9SdsjxYOqYbWQKCy1ojepaxfBiYSNXilTaR5oIuVgzYaj6utyrgvbGvu/bCo4IL4H4xmo/XnIbP/iY+ZiKymZnajK69SS8HiyB00CvtRZNdg6SXLY3usBZDsrdIAbKfuDOEJ6kkAsc1Yysw7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749768544; c=relaxed/simple;
	bh=5G84Kw37xAPwjiCHjfVwKmHFyKI1o3SclDHCNHMKFyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ar1sAmZP5d/rHJujHrQXxgVin+IU926aZ0AKUXi1EVV9wFReH4hLDmVpPVwAMc2kLYv/1LqbiY0mbcVH7uoHugYte/50yQW1UHiEr8GH168O0/S4r67rot5wFZmjPZ8d6LC0SmlpT7QBIta3DfKiOHZNp1eA3CdBk7RIMdA14r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RJa+IhXH; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RJa+IhXH"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8733548c627so49594339f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749768540; x=1750373340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEGtecxN4SBo9EmL2yEIxP+cEfCEUHwfF20h5d02P8o=;
        b=RJa+IhXHIGBdpvuWmC8JCGva7OP9z1lxiQbo3aRBEgBwFoY9GIMNphYMhGMCh9+a+t
         /xH78CQ7h2TJ8P/m04kSkJNrIGck2ryXOvwJju3QPLiKDrmi0195wB39E6GZwx51oxB2
         xUY0Lc1B9spYNqQmuJI8hRrpl1iHq42pGX+nLmcWA2ZMTtwjtLXlrlOs6U5VKoKYm3jb
         v2GWHgkOFE19JUN7jsaErV3XpFlzwMRMo9LCxB6G7Zwkzo2wBaA0P3vZcc7TiD/sdfRI
         GO7KpvSEuKCSP8uwEYoBOanJiDuKRwPXEtjKjT6jehuzI9ozOmuBJOK95uVI9+GgBu33
         24CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768540; x=1750373340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEGtecxN4SBo9EmL2yEIxP+cEfCEUHwfF20h5d02P8o=;
        b=luHO8Hzgv0kF4vroMWjtPDiSKh0Da9VAQaocBW38lKDNRchErvYl2S9riVr6S0TumD
         8NvxAkAr61p9EX7lsH+JrdDwbPbUbWuIYy7xNypsO9HIgki2STQvzDxtwKis/w1aBZ40
         S9y8mWE9OvEFTdESd0FC+qOsbf/N8P1SLf2n+wjQZbG/2HNOlXTL6tYPKDqU+ehas2C7
         if/K7l1i3TDGvUWZ8o6BtbuvgWDHlyuRX4zXi6TP/q2eWaeV8WmD1VY4BJttseQ8chwD
         JlgiYD7/kIzbLLLDXKIkDuIANQVpazmZDcMh7yFfdNNpZ3V6K088YwSYU7qlbP7/092D
         fUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUitWY2P6bFEwHRIIHviRMGYEj1Qdz0lCK6UBLVZIm0A6+k+6KKLmSj8/UDIY3/toIfjNiyV1jkLoYz2ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbNL+5RjRRQbd6GLVG7iGojjtaYbrHMXfC06/7lQhnksVgBxw
	fo7XaY+cB4VHUdUMMw9lgrB2ZyrfUe9sa3Ns1ZQ6xv9RRvLjWSscQGHOroq8lcpfai4=
X-Gm-Gg: ASbGncuudOLXUTghJmVawHoDU0BSAVHWusoDL2HDyXxJk+WcYHqFs7qp+HJNedUpcbk
	mkKWgBVdLGdOPPxKPaV52Uw54/RPiyTD2kPQVLldRQOZENQzX3dkzowhUq25xXb/6WJXK5wLha1
	kt58HZZRwW7WV05iv2eUNGSm1FYx6R5YTDSC+AOdp2b8SrPZQHg0ytm3Lb8WFqMWwn7yyuUWzxX
	cXcW0f2EEq+/IodHeJY1WrPXHDm6kMP2K3Ighdz31gRQza+2a+Gu57kK4fdNH56mnKAbn2DL4tp
	5rw2KW1WyihMsvrMdii9gprAOvFuT8RZhKLh5JVdqmcWrj4YWP+ucBQ7PuyRTGsmdiIdRwF3/5O
	ZbwKdKaceTbk3EBUmr27vLOTNPQepIn4=
X-Google-Smtp-Source: AGHT+IGicmZ0hXFTaHsWzHl5I27R7PwyfJk0YzLn3/RqKtqq+OswBbWo+sqwPlM8mPpDuZ0Zd2I9sA==
X-Received: by 2002:a05:6602:3887:b0:86c:fa3a:fe97 with SMTP id ca18e2360f4ac-875d3cf8a7bmr38126239f.10.1749768539925;
        Thu, 12 Jun 2025 15:48:59 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149c68bfcsm27925173.66.2025.06.12.15.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:48:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	guodong@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
Date: Thu, 12 Jun 2025 17:48:55 -0500
Message-ID: <20250612224856.1105924-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks, including those used by APB and AXI buses.
Guodong Xu discovered that this clock got disabled while responding to
getting -EPROBE_DEFER when requesting a reset controller.

The needed clock (CLK_DMA, along with its parents) had already been
enabled.  To respond to the probe deferral return, the CLK_DMA clock
was disabled, and this led to parent clocks also reducing their enable
count.  When the enable count for pll1_d8 was decremented it became 0,
which caused it to be disabled.  This led to a system hang.

Marking that clock critical resolves this by preventing it from being
disabled.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
---
v3: Define struct with static scope; added Haylen's Reviewed-by
v2: Reworded the description to provide better detail

 drivers/clk/spacemit/ccu-k1.c  |  3 ++-
 drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..df65009a07bb1 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
 CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
+		CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 51d19f5d6aacb..54d40cd39b275 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+static struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_INIT(_mask_gate),					\
+	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul)						\
-static struct ccu_mix _name = {							\
-	.gate	= CCU_GATE_INIT(_mask_gate),					\
-	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
-	.common = {								\
-		.reg_ctrl	= _reg_ctrl,					\
-		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
-	}									\
-}
+	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, 0)
 
 #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
 			    _mask_gate, _flags)					\

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

