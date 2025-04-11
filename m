Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BEB26FA76
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333754; cv=none; b=cqzun8m4LDIFbl5EFHG6uoUsxp960MF5Zr4gYWFRmH5UcnDnxLVQmPkhL1ERIOCx/WQp+dRj5osRstuLojETIup+ot0nfcJ7APVI5wvyel9HtQslw6MqOTaggAbeUyuB2oWozK3nV5l8Xkzbjkxhy5ciIZSJKLUuiCGE9Uv1Rt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333754; c=relaxed/simple;
	bh=iTHQc9ORJlCDjDDGtj17RbNP0g3Untm6AKISTQWSUyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEWvEk7iakVgrNrl/tjSBx9hGZdAj3Gqnvl5RuQj9l/Zru05yfHOhmOM1t/e+dSy+KARHA4pYkyJKbtbUf20jHO209uqEmbhoo319ue1j1mr4uCP/BIG8YhNIQ+zIZzaQzsmxch9E8zt5dRK7OKQ7FdBn+I1X8iC1HMyISaYGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=So5fjgqt; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="So5fjgqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333750;
	bh=ABw4ARhNQAkd4rlXFYixFM0InLDEdXfdXSG/4HG1QLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=So5fjgqt9a9pj2mC+YdxESJ/ZFNZh4U8IMB+HEFP0wC04D7yukXU067Ok9Fudgw5m
	 I/eFeoUIFghXlhYObM+Q0OFIVkjRMLYNiu2/zlSSBu0rnT5+AkmvrCztE7AF2i7Zw5
	 do7euB8rxbndWNAiuvpLeL807qtoFuGMPdPKWfjbpQQIiH4VUR44T2fyDXmZ3g7Rdp
	 pzlUl7giYfvNYNWQ9kxC1H7WVwzwln1zHX87DRf4BbF5qbLa4qEzyyvMxHJN06w9Lg
	 YHZO5UtF2UHjq5jitMgrBk8vBnDhj+T9jKTp1rCFPr8YvrhJUP3ufKJtUftKgK3aep
	 a9802cCCXkNWg==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 01ECA7D714;
	Fri, 11 Apr 2025 09:09:09 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 11 Apr 2025 10:38:34 +0930
Subject: [PATCH 4/7] soc: aspeed: lpc-snoop: Constrain parameters in
 channel paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-4-64f522e3ad6f@codeconstruct.com.au>
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

Ensure pointers and the channel index are valid before use.

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 28f034b8a3b7226efe20cbe30a7da0c2b49fbd96..6ab362aeb180c8ad356422d8257717f41a232b3c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -182,6 +182,7 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	return 0;
 }
 
+__attribute__((nonnull))
 static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
 				   int channel, u16 lpc_port)
@@ -190,6 +191,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	int rc = 0;
 
+	if (channel < 0 || channel >= ARRAY_SIZE(lpc_snoop->chan))
+		return -EINVAL;
 
 	if (lpc_snoop->chan[channel].enabled)
 		return -EBUSY;
@@ -252,9 +255,13 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	return rc;
 }
 
+__attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				     int channel)
 {
+	if (channel < 0 || channel >= ARRAY_SIZE(lpc_snoop->chan))
+		return;
+
 	if (!lpc_snoop->chan[channel].enabled)
 		return;
 

-- 
2.39.5

