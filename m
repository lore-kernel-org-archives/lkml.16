Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F329A5;
	Mon,  5 May 2025 01:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746408951; cv=none; b=rdqoPuH13D31XALr30a0tpqSl73AgOzumxCuhA2851DHshP9mTl0+jZqJu9j1mp4yOeDaGDgdGz5azMeeRFDLCX2Rd/orlXta2E9C5iSR7AurrOg1Scrwl2Ajf3Ic+rudOFHiZ6OZG+wNsGm2BaWJJjkDiO0nuDipuOLuhF0Jwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746408951; c=relaxed/simple;
	bh=rVlov5MiAeeifq0xC9nEvILniSr3HH1Z9+3WYyYzqmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l0HeKSam2H3tYj27r2ulvW3zjX8WNmRFTlBM6ZterMUbVjZAQSPmKP29NwN8MEvZRrzmJ6+7GQ2PzRhRfaCvdR6DICQJJsFcslbdUw98ck9HmxH1MtS2V9R3OXs6bqkGKH1Shel20nzlLkogjPJCKuLa1OJ0nUQBcQ1B85VZB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Y96/W1nk; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Y96/W1nk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=xE3NZTQkEdEVV6ngcG8aEKyvPiYBzkHan35NZ82mHcc=; b=Y96/W1nkkOgzE4YG
	k6X6zdl03ibTb2a7ccH5oIyVSQbsc3koRsgqAaODPM0f7zs1F33SPHAar7w8fktzV7cOXul6iPFUM
	cZiUazV0LYqLF6PWDKS5Q62OppYUOZPwawksXypXD29A6C6Cr/CUwAIdd46z12Qzb6800Qqhn+dp2
	JYKa4oYM32Cggn/615/MTo4zHCO9ksKX1/i/R35/Jz1xuFOmTbpoA9LxVfZl3fPL2oL/It65Hdofj
	7itYcE4RcLRRf9iQzSquoxpu0sRtywxjRsuIQs6rYyEnU4HzYiQ1yz0JJ7FRoOmglX8j2pDnHX1rf
	2NWDnfz8i0reW3J/+Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uBkkD-001M9R-2b;
	Mon, 05 May 2025 01:35:45 +0000
From: linux@treblig.org
To: florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] clk: bcm: kona: Remove unused scaled_div_build
Date: Mon,  5 May 2025 02:35:45 +0100
Message-ID: <20250505013545.359745-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

scaled_div_build() was added in 2014 by
commit 1f27f15258bf ("clk: bcm281xx: add initial clock framework support")
but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/clk/bcm/clk-kona.c | 18 ------------------
 drivers/clk/bcm/clk-kona.h |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 2b0ea882f1e4..0171e6b2bfca 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -53,24 +53,6 @@ static inline u64 scaled_div_value(struct bcm_clk_div *div, u32 reg_div)
 	return (u64)reg_div + ((u64)1 << div->u.s.frac_width);
 }
 
-/*
- * Build a scaled divider value as close as possible to the
- * given whole part (div_value) and fractional part (expressed
- * in billionths).
- */
-u64 scaled_div_build(struct bcm_clk_div *div, u32 div_value, u32 billionths)
-{
-	u64 combined;
-
-	BUG_ON(!div_value);
-	BUG_ON(billionths >= BILLION);
-
-	combined = (u64)div_value * BILLION + billionths;
-	combined <<= div->u.s.frac_width;
-
-	return DIV_ROUND_CLOSEST_ULL(combined, BILLION);
-}
-
 /* The scaled minimum divisor representable by a divider */
 static inline u64
 scaled_div_min(struct bcm_clk_div *div)
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index e09655024ac2..348a3454ce40 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -492,8 +492,6 @@ extern struct clk_ops kona_peri_clk_ops;
 /* Externally visible functions */
 
 extern u64 scaled_div_max(struct bcm_clk_div *div);
-extern u64 scaled_div_build(struct bcm_clk_div *div, u32 div_value,
-				u32 billionths);
 
 extern void __init kona_dt_ccu_setup(struct ccu_data *ccu,
 				struct device_node *node);
-- 
2.49.0

