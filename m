Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CB277813
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333757; cv=none; b=t13FVwC9rd+dkAZB2ac1OYVYnV6bD0JCWcHo1aRU4+5cYYGkf7CCpsGwA6gYXHqj587CBU3H1+Bv3AN1VnU7yY9F60YmLety7Cv55EQAs5lYchOgkJskZrr48jXvugHVXPHdWCzOtwIwjK8jFDKwGDBY1IY4dnG6iNuux2na0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333757; c=relaxed/simple;
	bh=LrP+ipWnCA5TPWfgCau0QTS5BKGUb5r5yRPdt3zcBsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSRkONgK4PHzifqSmr7MtgxOqcuq4rkyzCZZp+JrfoJSUkw+KyikgF/yfmQ4rdmFhsK5P93Rj1Ef6YU0f1w5EgRv+oynAhcS8wV9EFf8EhO9vylKYu5HHRjKsFjMckfNHlhAWA/XRdEzBbmIDwS/xXI+1LpXNA0oZy7F9nqTZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Q8c6qqoe; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Q8c6qqoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333752;
	bh=gIkAaCaSRxoDKHS10fE7AU9S0jyaF+J3B0+u4ydPtBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q8c6qqoe+aZNDwwnV4L7OyUawRWb9tkB2mDBA6g0V4v6FjJVBOgcuXKiF4TcHubPT
	 J+WwIuvytl9UydDMC7o2yZC6P7/4m0F1zzHaUlNygBrGOlVe+UPeaKMdKmwJRHIdx2
	 RiKE5z3xdHKX+QOcCfG7/ZDSRlZf4AwFu1L8t4rKRI6YLeRrUAhU66eAQCFTn/LCrK
	 JKvQDNQPBBpgAfBggNqRMaqgsPruKNGtDWZXl0B1qYxcnkyq0G2+pLPLi+8SZCdWUL
	 ltXjZ+6fo62eSYxrPS39qZPcB+LfR5sDyCiEqOLe7J00pbIgkUo/tKhS4LvEo/60Nt
	 2M2m3Zo1T3IwQ==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 09C097D717;
	Fri, 11 Apr 2025 09:09:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 11 Apr 2025 10:38:37 +0930
Subject: [PATCH 7/7] soc: aspeed: lpc-snoop: Lift channel config to const
 structs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-7-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2

The shifts and masks for each channel are defined by hardware and
are not something that changes at runtime. Accordingly, describe the
information in an array of const structs and associate elements with
each channel instance, removing the need for the switch and handling of
its default case.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 82 +++++++++++++++++------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 0b2044fd79b1be08dfa33bfcaf249b020c909bb9..b54d8fbf7b83ebadd4fe1b16cbddf07a0bfac868 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -10,6 +10,7 @@
  * 0x80 writes made by the BIOS during the boot process.
  */
 
+#include "linux/ratelimit.h"
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
@@ -57,7 +58,15 @@ struct aspeed_lpc_snoop_model_data {
 	unsigned int has_hicrb_ensnp;
 };
 
+struct aspeed_lpc_snoop_channel_cfg {
+	u32 hicr5_en;
+	u32 snpwadr_mask;
+	u32 snpwadr_shift;
+	u32 hicrb_en;
+};
+
 struct aspeed_lpc_snoop_channel {
+	const struct aspeed_lpc_snoop_channel_cfg *cfg;
 	bool enabled;
 	struct kfifo		fifo;
 	wait_queue_head_t	wq;
@@ -188,7 +197,6 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   int index, u16 lpc_port)
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
-	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	struct aspeed_lpc_snoop_channel *channel;
 	int rc = 0;
 
@@ -200,6 +208,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	if (channel->enabled)
 		return -EBUSY;
 
+	if (WARN_ONCE(!channel->cfg, "snoop channel %d lacks required config", index))
+		return -EINVAL;
+
 	init_waitqueue_head(&channel->wq);
 
 	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
@@ -220,39 +231,20 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
-	switch (index) {
-	case 0:
-		hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
-		snpwadr_mask = SNPWADR_CH0_MASK;
-		snpwadr_shift = SNPWADR_CH0_SHIFT;
-		hicrb_en = HICRB_ENSNP0D;
-		break;
-	case 1:
-		hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W;
-		snpwadr_mask = SNPWADR_CH1_MASK;
-		snpwadr_shift = SNPWADR_CH1_SHIFT;
-		hicrb_en = HICRB_ENSNP1D;
-		break;
-	default:
-		rc = -EINVAL;
-		goto err_misc_deregister;
-	}
-
-	/* Enable LPC snoop channel at requested port */
-	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
-	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
-			   lpc_port << snpwadr_shift);
+	regmap_update_bits(lpc_snoop->regmap, HICR5, channel->cfg->hicr5_en,
+		channel->cfg->hicr5_en);
+	regmap_update_bits(lpc_snoop->regmap, SNPWADR, channel->cfg->snpwadr_mask,
+		lpc_port << channel->cfg->snpwadr_shift);
 
 	model_data = of_device_get_match_data(dev);
 	if (model_data && model_data->has_hicrb_ensnp)
-		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
+		regmap_update_bits(lpc_snoop->regmap, HICRB, channel->cfg->hicrb_en,
+			channel->cfg->hicrb_en);
 
 	channel->enabled = true;
 
 	return 0;
 
-err_misc_deregister:
-	misc_deregister(&lpc_snoop->chan[index].miscdev);
 err_free_fifo:
 	kfifo_free(&lpc_snoop->chan[index].fifo);
 	return rc;
@@ -272,21 +264,7 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	if (!channel->enabled)
 		return;
 
-	/* Disable interrupts along with the device */
-	switch (index) {
-	case 0:
-		regmap_update_bits(lpc_snoop->regmap, HICR5,
-				   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
-				   0);
-		break;
-	case 1:
-		regmap_update_bits(lpc_snoop->regmap, HICR5,
-				   HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
-				   0);
-		break;
-	default:
-		return;
-	}
+	regmap_update_bits(lpc_snoop->regmap, HICR5, channel->cfg->hicr5_en, 0);
 
 	channel->enabled = false;
 	/* Consider improving safety wrt concurrent reader(s) */
@@ -294,6 +272,21 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	kfifo_free(&channel->fifo);
 }
 
+static const struct aspeed_lpc_snoop_channel_cfg channel_cfgs[] = {
+	{
+		.hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
+		.snpwadr_mask = SNPWADR_CH0_MASK,
+		.snpwadr_shift = SNPWADR_CH0_SHIFT,
+		.hicrb_en = HICRB_ENSNP0D,
+	},
+	{
+		.hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
+		.snpwadr_mask = SNPWADR_CH1_MASK,
+		.snpwadr_shift = SNPWADR_CH1_SHIFT,
+		.hicrb_en = HICRB_ENSNP1D,
+	},
+};
+
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 {
 	struct aspeed_lpc_snoop *lpc_snoop;
@@ -308,6 +301,13 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (!lpc_snoop)
 		return -ENOMEM;
 
+	static_assert(ARRAY_SIZE(channel_cfgs) == ARRAY_SIZE(lpc_snoop->chan),
+		"Broken implementation assumption regarding cfg count");
+	static_assert(ARRAY_SIZE(lpc_snoop->chan) == 2,
+		"Broken implementation assumption regarding channel count");
+	lpc_snoop->chan[0].cfg = &channel_cfgs[0];
+	lpc_snoop->chan[1].cfg = &channel_cfgs[1];
+
 	np = pdev->dev.parent->of_node;
 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
 	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&

-- 
2.39.5

