Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF54B2DF3D5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079651; cv=none; b=XSISag4eX4MjFc32CoRKkguMu5X2xjb0X+f8FU9qCIcvOE6uUlgfPmLNGTeQDj9qwFqC4IpTVAe0499dv0iSruqRm0iLr5SuqdOduqY8Z9g0hQrCKmnzQjhUyL3b76DplOq3dV0GI39t7wnpzVquXwPganBAZ4O8ulK9PNP+Q80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079651; c=relaxed/simple;
	bh=5ur0noPldhPSJzrpIbGvJfTAVrDS0OY/wJuG/WreF/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLg8R3YGNwuWbhkbiZgbc+q3G3plgMKpqBjtvJLhcwbo4csZ8Kwk8zHpaPZnSvVQoDhfhykD5QdIRrv11VlMgMBWQcP1RCWoffIEKlgEIK9Ts1CGmGPSjdOamkueRZNLD+eg0IorEwyTTUn3PriihsgEjZyt47HCsw66EFUhZic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=jOyYZgdx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="jOyYZgdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079640;
	bh=ZH2nQiJURmm3f1AacPrlu4/bRjlg+XhQ1J7Bn7VXnB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jOyYZgdxYYAWdVDWWT9hujOZNAzM7/cW8rNsAD7F/VQKHLlPYJNsa9RD7V0Mbu3CD
	 ZC3xxtBeDLKvUk3wfHwhcQr1yNbTCCJEEMVQSNJmxWpUEHRFjg9WINb24ZCOU3tUDx
	 lpiB0l8eGro6Lp/dqaeZwN71irafgr7CH9dBLiaiXT83vQNOr5HJIe4XQA49+S0xgp
	 KU2guJrnLcxMmJENIbv23CfG/lwB6Apj2Dzx5VS0K2o6baF37jr6AgkgJ+/hrW79Bh
	 pn0QzyL/NBVQp9m3AtYxPL4Uj++L8qBSWDBo9zAhlVg04udw67xJS8ziEQu1Vcjm11
	 +u4D9a6bUJasQ==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 329C36884F;
	Mon, 16 Jun 2025 21:14:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:41 +0930
Subject: [PATCH v2 04/10] soc: aspeed: lpc-snoop: Constrain parameters in
 channel paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2

Ensure pointers and the channel index are valid before use.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index ca7536213e0986f737606a52996ffea620df2a7a..804c6ed9c4c671da73a6c66c1de41c59922c82dc 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -25,7 +25,6 @@
 
 #define DEVICE_NAME	"aspeed-lpc-snoop"
 
-#define NUM_SNOOP_CHANNELS 2
 #define SNOOP_FIFO_SIZE 2048
 
 #define HICR5	0x80
@@ -57,6 +56,12 @@ struct aspeed_lpc_snoop_model_data {
 	unsigned int has_hicrb_ensnp;
 };
 
+enum aspeed_lpc_snoop_index {
+	ASPEED_LPC_SNOOP_INDEX_0 = 0,
+	ASPEED_LPC_SNOOP_INDEX_1 = 1,
+	ASPEED_LPC_SNOOP_INDEX_MAX = ASPEED_LPC_SNOOP_INDEX_1,
+};
+
 struct aspeed_lpc_snoop_channel {
 	bool enabled;
 	struct kfifo		fifo;
@@ -68,7 +73,7 @@ struct aspeed_lpc_snoop {
 	struct regmap		*regmap;
 	int			irq;
 	struct clk		*clk;
-	struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
+	struct aspeed_lpc_snoop_channel chan[ASPEED_LPC_SNOOP_INDEX_MAX + 1];
 };
 
 static struct aspeed_lpc_snoop_channel *snoop_file_to_chan(struct file *file)
@@ -182,9 +187,10 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	return 0;
 }
 
+__attribute__((nonnull))
 static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
-				   int channel, u16 lpc_port)
+				   enum aspeed_lpc_snoop_index channel, u16 lpc_port)
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
@@ -251,8 +257,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	return rc;
 }
 
+__attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-				     int channel)
+				     enum aspeed_lpc_snoop_index channel)
 {
 	if (!lpc_snoop->chan[channel].enabled)
 		return;
@@ -331,16 +338,16 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (rc)
 		goto err;
 
-	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
+	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_0, port);
 	if (rc)
 		goto err;
 
 	/* Configuration of 2nd snoop channel port is optional */
 	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
 				       1, &port) == 0) {
-		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
+		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_1, port);
 		if (rc) {
-			aspeed_lpc_disable_snoop(lpc_snoop, 0);
+			aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
 			goto err;
 		}
 	}
@@ -358,8 +365,8 @@ static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
 
 	/* Disable both snoop channels */
-	aspeed_lpc_disable_snoop(lpc_snoop, 0);
-	aspeed_lpc_disable_snoop(lpc_snoop, 1);
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
 
 	clk_disable_unprepare(lpc_snoop->clk);
 }

-- 
2.39.5

