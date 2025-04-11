Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5729277028
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333756; cv=none; b=n1M3BGDquxrmHgjUQR8dx4PJF0EivTA6oq5P5t2dYij0Ur6dSrCn/GQb66zV2Uc6QFEbEh8FV9MU0L7GZAQ+RQrgCDEKVv+lBpM+5nZb9b/OWtBvTcTvy8gD6mYK3sUXJvvH8/REdabHLHtnbyGNMuOUtEmo8PLaWXw1lOlueiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333756; c=relaxed/simple;
	bh=gqOrP4wS+3zulmap6u+NFQIuSHAi9/1PflL5jKTKhQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9HMC5F/MqPZsGF70fAQMBdsQjM32RqadmzasH4RHL7adYXL6IVSZVRL4z5w+tHa8yWFh2oe9gUj1AkxyZnnSxP3fPRazmIQmWvrFqTAiC3yMrFo653z0gkaKE8WfVckgctRgjm3GctlIbNPYriDWU2Zns2wYGLXvWnE0bGcMaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=dKMosy8m; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="dKMosy8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333751;
	bh=KFtQnngCykasdCrNVPG+SOfUzKEa2z4spwHYuIB44t0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dKMosy8m20GXWuALQvsB5mTGk5kl0tE3piF8e7cwOm5XQ8KseCkLjXYYUmwKiqbE6
	 1qa17aCynswRn9iV8qacBrl5Z5l88Qxjep/zHkFS1TojBwrEMC+DAD6v8sd1fOdXSQ
	 RxGlKd0VIrrxUWtHhGHAFe22mlF5sFG+d93/t1+pF6b9/yTNL5KMHQd8ArbbaL4NO6
	 fp9T9z6tePrn5RSDye+wU44jh9HhwnevrBBUl7mM5HM90/0uuMpqyFNlk2j+7ZqHDc
	 fgj2HJSo7KuuhoP+y7vD6zpzP62u116jrACB1q6D29o2robOLCK1ZLsquhetr4gC8h
	 nwyISRwGGEOhQ==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 562D97D716;
	Fri, 11 Apr 2025 09:09:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 11 Apr 2025 10:38:36 +0930
Subject: [PATCH 6/7] soc: aspeed: lpc-snoop: Rearrange channel paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-6-64f522e3ad6f@codeconstruct.com.au>
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

Order assignments such that tests for conditions not involving resource
acquisition are ordered before those testing acquired resources, and
order managed resource acquisition before unmanaged where possible. This
way we minimise the amount of manual cleanup required.

In the process, improve readability of the code by introducing a channel
pointer that takes the place of the repeated object lookups.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 47 ++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index f6952f71eda52c95aea5ad1084edd218b88f1234..0b2044fd79b1be08dfa33bfcaf249b020c909bb9 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -189,31 +189,33 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
+	struct aspeed_lpc_snoop_channel *channel;
 	int rc = 0;
 
 	if (index < 0 || index >= ARRAY_SIZE(lpc_snoop->chan))
 		return -EINVAL;
 
-	if (lpc_snoop->chan[index].enabled)
+	channel = &lpc_snoop->chan[index];
+
+	if (channel->enabled)
 		return -EBUSY;
 
-	init_waitqueue_head(&lpc_snoop->chan[index].wq);
-	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->chan[index].fifo,
-			 SNOOP_FIFO_SIZE, GFP_KERNEL);
+	init_waitqueue_head(&channel->wq);
+
+	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
+	channel->miscdev.fops = &snoop_fops;
+	channel->miscdev.parent = dev;
+
+	channel->miscdev.name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
+	if (!channel->miscdev.name)
+		return -ENOMEM;
+
+	rc = kfifo_alloc(&channel->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
-	lpc_snoop->chan[index].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_snoop->chan[index].miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
-	if (!lpc_snoop->chan[index].miscdev.name) {
-		rc = -ENOMEM;
-		goto err_free_fifo;
-	}
-	lpc_snoop->chan[index].miscdev.fops = &snoop_fops;
-	lpc_snoop->chan[index].miscdev.parent = dev;
-	rc = misc_register(&lpc_snoop->chan[index].miscdev);
+	rc = misc_register(&channel->miscdev);
 	if (rc)
 		goto err_free_fifo;
 
@@ -236,6 +238,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		goto err_misc_deregister;
 	}
 
+	/* Enable LPC snoop channel at requested port */
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
 	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
 			   lpc_port << snpwadr_shift);
@@ -244,7 +247,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	if (model_data && model_data->has_hicrb_ensnp)
 		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
 
-	lpc_snoop->chan[index].enabled = true;
+	channel->enabled = true;
 
 	return 0;
 
@@ -259,10 +262,14 @@ __attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				     int index)
 {
+	struct aspeed_lpc_snoop_channel *channel;
+
 	if (index < 0 || index >= ARRAY_SIZE(lpc_snoop->chan))
 		return;
 
-	if (!lpc_snoop->chan[index].enabled)
+	channel = &lpc_snoop->chan[index];
+
+	if (!channel->enabled)
 		return;
 
 	/* Disable interrupts along with the device */
@@ -281,10 +288,10 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
-	lpc_snoop->chan[index].enabled = false;
+	channel->enabled = false;
 	/* Consider improving safety wrt concurrent reader(s) */
-	misc_deregister(&lpc_snoop->chan[index].miscdev);
-	kfifo_free(&lpc_snoop->chan[index].fifo);
+	misc_deregister(&channel->miscdev);
+	kfifo_free(&channel->fifo);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)

-- 
2.39.5

