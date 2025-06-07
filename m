Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDE15E8B;
	Sat,  7 Jun 2025 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304234; cv=none; b=ciOT8+9a168NX+zF5N0xfY/lzaJV/4NEZLKCJX3BZqNQ7GGZqifY16FrGg9vNVlLd6+/cIwFBQq0FFUMr4kocMdAI6L4dsus5DrHR6nBQvnyER3eEZ6xyGk2eZ8NiTTgBeq1srQXcFXYoNHEZbjNYXaPyPdYAZIhIC3ZJgzr1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304234; c=relaxed/simple;
	bh=sKhnDtstllZuii5hWHsr9I5he6MYPD06tRZoSOBtdoE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c3geie8Qict1wMCYZQMP9VQIdnE82l5oB0HgnEBR65sJJy1QIzBYnmuHTL0/8J1Vo8oYL624fZEJae6WzZqT5f6C7u9rXzSIgAK2MFiu4j+Nn2jD9DINsV4w/E63CeN1RjQ0J+SEvcvrNagd84WiOKyajoMGbc7hCL1mUhQ6AJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7eEytPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7eEytPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48649C4CEE4;
	Sat,  7 Jun 2025 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304233;
	bh=sKhnDtstllZuii5hWHsr9I5he6MYPD06tRZoSOBtdoE=;
	h=From:To:Cc:Subject:Date:From;
	b=N7eEytPPe06EbRaeWSSfIFm2FNfiewNxewu0+HffGPb4l4UyFaUcxsh7oycYmym/B
	 5GL/ZFY9aSqI4xYy4f5u+dn0/sEO2W8wR1DKcWmjQ1P77QM5yvJoS6Wf8aB/jYRiQN
	 xgdHUMXdi4ebuXvrp/19Wyug+9K1LhZZlUFs3OP4Jb5EGKnmlBFdCOrwCofd3QP8wJ
	 AN+Xvsup6vNFfhrYFhXUnkflqZFwohTZebO/1jPeh41VqapRP95ZbzV8RlR2I39tge
	 MySk73S7dZAaiA/yhDCS68g6swtNFfCDsfsBgtr/ziyIwhYiEB+p1jlYvtm7mxTk94
	 nsifPwCFArmBA==
Received: by wens.tw (Postfix, from userid 1000)
	id 3FC195FD0C; Sat,  7 Jun 2025 21:50:30 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] clk: sunxi-ng: a523: Mark MBUS clock as critical
Date: Sat,  7 Jun 2025 21:50:29 +0800
Message-Id: <20250607135029.2085140-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

The MBUS serves as the main data bus for various DMA masters in the
system. If its clock is not enabled, the DMA operations will stall,
leading to the peripherals stalling or timing out. This has been
observed as USB or MMC hosts timing out waiting for transactions
when the clock is automatically disabled by the CCF due to it not
being used.

Mark the clock as critical so that it never gets disabled.

Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 9efb9fd24b42..1a9a1cb869e2 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -385,7 +385,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
 					    0, 0,		/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    0, CCU_FEATURE_UPDATE_BIT);
+					    CLK_IS_CRITICAL,
+					    CCU_FEATURE_UPDATE_BIT);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
-- 
2.39.5

