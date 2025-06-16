Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595B32E06E7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079653; cv=none; b=Tx74uoBSBe+vnAJ4VaNicdXw2l0erwbDbf48kGOA2MgZNxj/R+RoVVoXD9z+zwt7TfJVqF4GCgSgok45df/20QQz/nhoL5NYfihQwAryACOCN7/QTdw7FUr1NGFPZKZeK9fkaLxzFTsDR9WtLpOKACSUNQ9lVH02weOhLolD5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079653; c=relaxed/simple;
	bh=sjkl1O4ErLFKt8lRkAcwILhxh18eIGJZh77hdM1zBs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdyrlfAIjx/ocUzOAOphLSCPLzIlYz0Tznq34uB54zPk1OAwAFAEOM5Lfr34o5oyGGMSYHujcQQpo/x9+0ONNMtytVYOA6krawAT3oS7IumPfVMhXa2jvWKFFZtyLWMbKJW/xPZ+UvmYxCQ6MVi6NR8HnnX57psEY0jtJNOHlhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NET9XgRj; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NET9XgRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079644;
	bh=/lpAFC+njrZ4FhM5FG8e1pUsSKmtZTOJbqXCRTKS2KA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NET9XgRjDDQ6ddYttVxtQQdwpx+++CZ5MpuoMLb+RCxX1XQ2awHXdTmlIXAuvPoAJ
	 Q8hrXFQaM3fRylKuxJ1Y3vD3W9p6YXg1/IJuY3am41P97IS6G7hXmT2/wdgVsZpEXM
	 9lNsijfZ6XdryEQPDvWUA05rOX6aR0IFxoHHOiLY/SZslg3oXvo/uhMQ1eWc8U3hI8
	 uEqX/NKjFlA9new7sR3d/wrbx9mqqJUSkLKb6rZovmV4dr5jFHMoYKYxS1KhQFW4UV
	 Enpi2+O5gHKCG16JEitCnpEhaTs/6G+4gA4ufuv6czctTfU496CBJNy73ycsAMGJGt
	 GYKBaiXjdZn7w==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 426156885C;
	Mon, 16 Jun 2025 21:14:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:46 +0930
Subject: [PATCH v2 09/10] soc: aspeed: lpc-snoop: Consolidate channel
 initialisation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-9-3cdd59c934d3@codeconstruct.com.au>
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

Previously, channel initialisation was a bit perilous with respect to
resource cleanup in error paths. While the implementation had issues,
it at least made an effort to eliminate some of its problems by first
testing whether any channels were enabled, and bailing out if not.

Having improved the robustness of resource handling in probe() we can
now rearrange the initial channel test to be located with the subsequent
test, and rework the unrolled conditional logic to use a loop for an
improvement in readability.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 8dbc9d4158b89f23bda340f060d205a29bbb43c3..9f88c5471b1b6d85f6d9e1970240f3d1904d166c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -294,12 +294,21 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	kfifo_free(&channel->fifo);
 }
 
+static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
+{
+	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
+
+	/* Disable both snoop channels */
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
+}
+
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 {
 	struct aspeed_lpc_snoop *lpc_snoop;
-	struct device *dev;
 	struct device_node *np;
-	u32 port;
+	struct device *dev;
+	int idx;
 	int rc;
 
 	dev = &pdev->dev;
@@ -322,12 +331,6 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, lpc_snoop);
 
-	rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0, &port);
-	if (rc) {
-		dev_err(dev, "no snoop ports configured\n");
-		return -ENODEV;
-	}
-
 	lpc_snoop->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(lpc_snoop->clk))
 		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk), "couldn't get clock");
@@ -336,30 +339,24 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_0, port);
-	if (rc)
-		return rc;
+	for (idx = ASPEED_LPC_SNOOP_INDEX_0; idx <= ASPEED_LPC_SNOOP_INDEX_MAX; idx++) {
+		u32 port;
 
-	/* Configuration of 2nd snoop channel port is optional */
-	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
-				       1, &port) == 0) {
-		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_1, port);
-		if (rc) {
-			aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
-			return rc;
-		}
+		rc = of_property_read_u32_index(dev->of_node, "snoop-ports", idx, &port);
+		if (rc)
+			break;
+
+		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, idx, port);
+		if (rc)
+			goto cleanup_channels;
 	}
 
-	return 0;
-}
+	return idx == ASPEED_LPC_SNOOP_INDEX_0 ? -ENODEV : 0;
 
-static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
-{
-	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
+cleanup_channels:
+	aspeed_lpc_snoop_remove(pdev);
 
-	/* Disable both snoop channels */
-	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
-	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
+	return rc;
 }
 
 static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {

-- 
2.39.5

