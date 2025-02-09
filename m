Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8161DE2B7;
	Sun,  9 Feb 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739125933; cv=none; b=C9zHBRNTzvg0bBhl3y1rmxYslb8hFY4yRATefqlplTHQqrMykHXbMch3Fn9yUqpqH1yGzJ5C9/ijUuCPr2f8wvIJTI3YAHKcA/2tl9rP5IPVAUAIE7FvihX3TcorDEYXJsJETHEOC7Y0x6144qyPmlJksqnxvo/RKK5+KVjgddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739125933; c=relaxed/simple;
	bh=L0jBLHlzITBsyVANOskUhw0mvTFKAlPfFHZqc2BmMIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKT/XPJB3y2Wqadrf0HR3W8wffUDUmxKxfA0jc1vxMi+Hiv/bUDyMJQkZDiEiretarjaZkGv2QsOh3nLjqLyqEeuiFATV+KBMAaVXN/+VL828V9m46YLGaOSVtOJa+bR4Xa1lN2SEVLiMLaq5pCm+0qWkhzW5OaaDTw82LvdQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK9wmCLs; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK9wmCLs"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab771575040so705868466b.1;
        Sun, 09 Feb 2025 10:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739125929; x=1739730729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++ZfHUQ0MCm0RP3ofnBUH+oOmt7UhXpK/206QQBmZmM=;
        b=OK9wmCLsEP16qnK5TYGLcvyXdl93JV7LiTl+KVsNPjN02Ewz9xiz8UnqVNwfl9aooj
         yTcLI0Q3dEfkXVrcXLuz0MaCkJlYJrrzhDtKWfuX+Fi+1PW7QDtD9yqiq1oJ7HdUg5Nd
         XUIv9yvHvY5dotAGiPEoDlghKv3NEq32yEIc3+Byt6l9Z2LUxeq/J+LwVLqFD596I0rI
         xAVtuphLo/bwC3tQf/J/7yR3oJ/WvoiHXqAn4fF3Oir4lt9/EBQuBY6MO9p0rYRHlqbE
         uHs7FKkhIdjQYvikoGcC9HQfpl7A/wA5Jx7IUmmjYdXF8LHo8hrALBs41V+ljH+P/qTH
         oFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739125929; x=1739730729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++ZfHUQ0MCm0RP3ofnBUH+oOmt7UhXpK/206QQBmZmM=;
        b=NWh7IwD3vIaW0a/ZyDYzjlQyJbUPOzKh+O6Fw+/A2v+gvcD4bNOk2G5eSwfWf8PLV8
         NIiYmOw6x1PYmEr7hDBy571IJxiexUTTxZUTeLbvZGqtMbxxTJO9jacxvaIiFG7y6D63
         1bT4UMJ8FLhgSL9a6A0mAUdjnPaBoG6o1V+iAPPceyro/R2r9YSl5K26irSZLoW6b2gh
         QSsJGrFQGjag41vBfFJNQT/xDYUcJs+NYw4v2A7CHYj7ok52qmb7m2CWv96C85S0nUkA
         HTG3KXJEwVAtz1GKZRyWUZZTHLygOaBEeCLidOMt0cWtiS3uB0pJ0Wojn5uiuBkzXn2r
         WJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCURpN0FRDKWP1u1+C8zADzUiG07kqeqZnxJewj4cJ6FTG/r9OigOh3GO5Ag8OHUTC9c/YaUkhVhhGo=@vger.kernel.org, AJvYcCW2DyV8ByP/ICMdYNunwee4Sife3an+bzmRYUxVqeLNgItplq33DsUM3LZJHoZD/rjlThoHfX9pNQYuiSWG@vger.kernel.org
X-Gm-Message-State: AOJu0YykpAroD1ySx5w4QZeTmPaXLceNV/Q+WPZpYExzqJJr51C9ij0C
	DiDNP7tlmxyZ7elirafXgIeNSz3XNgPO3ZeBn0Og/UhvgmN5bgnH1ejmGrIIahI=
X-Gm-Gg: ASbGncvOsJmCYJwTv1dIXF479cQowA7dEbW6IyZgtRh99jVh/f48oE1t9PK6GwG9UzY
	eUPUrCPe/VD1QO30AsrCJjolKubmzwOHXJn1qkiQi1QzbgRnzvwoF7Qs7YL7rNHGU9UL9rqyBQk
	Ow2y3WDmlob5N6c7C3d8IR7jSkJhnspVhmY4jIA76pk65JSe5JSXzjt5knTby+Um1o8oaSSAN5g
	6ksYPJ71899CC8+Xiub+xns61QORl/sg3QmFGmibhWYXVcvkcSq5JY7WJT7UDGTwq4SfvA3HtJm
	G2aruWODy8GsB+wTDsWqABROiIwtHmFQVCB1vqFZ0zMETHcGEiYR26JW5/zQJv2J/tINEyYMnOU
	fzg==
X-Google-Smtp-Source: AGHT+IF25eWQ1V7Er7ceH3ux4Wlw0217IKgZ/NViSm8RTCNQK2c1ekJ42OKIsci8kDQYLk4K5IBrmw==
X-Received: by 2002:a17:907:1c0f:b0:aa6:938a:3c40 with SMTP id a640c23a62f3a-ab76e9dad88mr1610005266b.24.1739125929258;
        Sun, 09 Feb 2025 10:32:09 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c4da47f5sm33658666b.70.2025.02.09.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 10:32:08 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Sun,  9 Feb 2025 19:31:42 +0100
Message-ID: <20250209183142.97671-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-parent the GPU clock during frequency changes of the PLL.
Also it asks to disable and then re-enable the PLL lock bit,
after the factor changes have been applied.

Add clock notifiers for the PLL and the GPU mux clock, using the existing
notifier callbacks, and tell them to use mux 1 (the GPU_CLK1 source),
and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
correct algorithms.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35..e88eefa24 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -328,10 +328,12 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
+
+#define SUN50I_H616_GPU_CLK1_REG        0x674
 static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
 					0, 2,	/* M */
 					BIT(31),/* gate */
-					0);
+					CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
 		      0x67c, BIT(0), 0);
@@ -1120,6 +1122,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
 	.lock		= BIT(28),
 };
 
+static struct ccu_mux_nb sun50i_h616_gpu_nb = {
+	.common		= &gpu0_clk.common,
+	.cm		= &gpu0_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
+	.bypass_index	= 1, /* GPU_CLK1 */
+};
+
+static struct ccu_pll_nb sun50i_h616_pll_gpu_nb = {
+	.common		= &pll_gpu_clk.common,
+	.enable		= BIT(29),	/* LOCK_ENABLE */
+	.lock		= BIT(28),
+};
+
 static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1170,6 +1185,15 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(0);
 	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
+	/*
+	 * Set the input-divider for the gpu1 clock to 3.
+	 * Also enable gpu1 clock.
+	 */
+	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
+	val |= BIT(31);
+	val |= BIT(1);
+	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
+
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
 	 * is no good way to force parent switch (both run with same frequency),
@@ -1190,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	/* Re-lock the CPU PLL after any rate changes */
 	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
 
+	/* Reparent GPU during GPU PLL rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun50i_h616_gpu_nb);
+
+	/* Re-lock the GPU PLL after any rate changes */
+	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
+
 	return 0;
 }
 
-- 
2.47.1

