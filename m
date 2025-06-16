Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921742DF3EF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079651; cv=none; b=iIQKvX2hc3j2wBCEkHi7007WhDdZBBbOw63gNnSMZUQUDSohWMht1L+omkbxHdiMe7jcJvRRpAG8hQesdPi3Q++KvwrQ/PDfYkZ51vTXDnEcCHjQXp0CO0MmZcXtzizWEGGdRekqdY1rz70ZOFiNYd3C8YKTbGcNdTJSgtmkyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079651; c=relaxed/simple;
	bh=XZ/hpMSqcPDhFeBv3nEIKFYJRxLWPko8hPYvUZIb08Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HeACDHLtwgR9wcMgTkwRRnAphhCMomaAAypLhI+zikM7Bm7SvRwpzOcprisax2gbidcNQKvH4131Qp5yVu0oVeI069FlypJf7kdqfOb8wT7Ok995k/b8YOgLZ3+xF4SxNjKv/WoANuTAqpuzbX+0Pf0Em5q366GXCaBiMqG3V9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=FK6QUhR1; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="FK6QUhR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079641;
	bh=YIWTEhmFsARbk2BN345atKp2DrJ1LmEtzHmUjEpWj/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FK6QUhR1cwtYs5DPuSeAzi7fp76/6QCgGoDSaXgKWhg6g7s/j6FFq1EUiLX0NdXR2
	 HY/JXtzCN+JvM6XYtOscdY3vvcBMgwht9leEXBEgRSIBXRyTnuEcjyxNCglYFDacNG
	 Y3uKK3TYQYd9UUtrGSgwzDDrpa220ufI+GkWCOjFgv/6bwUpoPjTprz8y4AE6m/RNm
	 I10kxqhj2WndFcpsefx9NXEnw9B6xQ2TpHh4rxi9As5JaBeQEwMr9aAqMLUvmDUAhy
	 RqDpHSQEShArOJbSA+CVu1rccSBKNfdyWjkCSxmd+uaU+QoP7p/+TrxNTUpXj5jxwB
	 /TUiPahUDAypg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EE27B68850;
	Mon, 16 Jun 2025 21:14:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:42 +0930
Subject: [PATCH v2 05/10] soc: aspeed: lpc-snoop: Rename 'channel' to
 'index' in channel paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-5-3cdd59c934d3@codeconstruct.com.au>
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

We'll introduce another 'channel' variable shortly

Acked-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 804c6ed9c4c671da73a6c66c1de41c59922c82dc..e9d17239163a8ae5145bd3652fcec572b70bd11c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -190,37 +190,37 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 __attribute__((nonnull))
 static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
-				   enum aspeed_lpc_snoop_index channel, u16 lpc_port)
+				   enum aspeed_lpc_snoop_index index, u16 lpc_port)
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	int rc = 0;
 
-	if (WARN_ON(lpc_snoop->chan[channel].enabled))
+	if (WARN_ON(lpc_snoop->chan[index].enabled))
 		return -EBUSY;
 
-	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
+	init_waitqueue_head(&lpc_snoop->chan[index].wq);
 	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
+	rc = kfifo_alloc(&lpc_snoop->chan[index].fifo,
 			 SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
-	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_snoop->chan[channel].miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
-	if (!lpc_snoop->chan[channel].miscdev.name) {
+	lpc_snoop->chan[index].miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_snoop->chan[index].miscdev.name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
+	if (!lpc_snoop->chan[index].miscdev.name) {
 		rc = -ENOMEM;
 		goto err_free_fifo;
 	}
-	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
-	lpc_snoop->chan[channel].miscdev.parent = dev;
-	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
+	lpc_snoop->chan[index].miscdev.fops = &snoop_fops;
+	lpc_snoop->chan[index].miscdev.parent = dev;
+	rc = misc_register(&lpc_snoop->chan[index].miscdev);
 	if (rc)
 		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
-	switch (channel) {
+	switch (index) {
 	case 0:
 		hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
 		snpwadr_mask = SNPWADR_CH0_MASK;
@@ -246,25 +246,26 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	if (model_data && model_data->has_hicrb_ensnp)
 		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
 
-	lpc_snoop->chan[channel].enabled = true;
+	lpc_snoop->chan[index].enabled = true;
 
 	return 0;
 
 err_misc_deregister:
-	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+	misc_deregister(&lpc_snoop->chan[index].miscdev);
 err_free_fifo:
-	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	kfifo_free(&lpc_snoop->chan[index].fifo);
 	return rc;
 }
 
 __attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-				     enum aspeed_lpc_snoop_index channel)
+				     enum aspeed_lpc_snoop_index index)
 {
-	if (!lpc_snoop->chan[channel].enabled)
+	if (!lpc_snoop->chan[index].enabled)
 		return;
 
-	switch (channel) {
+	/* Disable interrupts along with the device */
+	switch (index) {
 	case 0:
 		regmap_update_bits(lpc_snoop->regmap, HICR5,
 				   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
@@ -279,10 +280,10 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
-	lpc_snoop->chan[channel].enabled = false;
+	lpc_snoop->chan[index].enabled = false;
 	/* Consider improving safety wrt concurrent reader(s) */
-	misc_deregister(&lpc_snoop->chan[channel].miscdev);
-	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	misc_deregister(&lpc_snoop->chan[index].miscdev);
+	kfifo_free(&lpc_snoop->chan[index].fifo);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)

-- 
2.39.5

