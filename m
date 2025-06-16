Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF22DF3F8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079653; cv=none; b=a9jd3AQ5cqsJdSYSynqydv21qSGIefP8A/hkOLMgRLlDiRmVTA7MClC5GgL5BhZPtouXy5PEIiJ/ho67rcuEmDvPTZSboWDoaAso6sP1sqJ9qeCi1B/gFcA18JYQeF5jsSItJimKBwBnua/Z+2lv8gCdMeYBg6qVmsxtYQxM7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079653; c=relaxed/simple;
	bh=mBQ7hq5bdQ7tYVchATpKpWG5RTlqVkDJc0DCHtMQtoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojUGp/SLm+I2ELD9WYyWsH1OWLpkojJnEmiFjBORBoyuhzMukmDaeTyXJxHuDCb0bq72JickmBKoxbFoTnJgaWYB9iRn4pEHo6CdcnOhxUAFremPevc8tzRu70fEmen5IrCTQGQPQZs8tPZf0v8qzxN3XBOLTJRXX+vZSPXIOd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GIzxj/i+; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GIzxj/i+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079644;
	bh=i2REkO5gC9yhhzzDAZNsIufUfzsU30pxXTvOzVJMONo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GIzxj/i++dzVYAoGl+ADpT2pTEv0hdoXLGIxEUVZz1a/E+B98oW7o5wNsBrLAfXoH
	 wq9mkz2SyLLhoCfSHmB9930qF/GxE+rLlTgfQqMr12CEQVqvcwhVNtqzxd1ghLWTh+
	 LG/awzjWC14PBNqnHQhBE7BRWnRsMrIILflBvw+646t+NatPDi2mQhrpFCcy9iJnhq
	 BhqH6GNGLkUI0WA+XkMNbWIxAMAtsVfiUDzq9QAwrAcuthlwK7HhM4dfYuR0ieDV+5
	 JD/TONikpwaOXW+EoVm3kSeavD3PbVpHuJbAHwd9c8BedB3Lh3FoIFv0FrKX5G1s8W
	 dfkFDicFHXfdg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6552E68856;
	Mon, 16 Jun 2025 21:14:03 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:45 +0930
Subject: [PATCH v2 08/10] soc: aspeed: lpc-snoop: Use dev_err_probe() where
 possible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-8-3cdd59c934d3@codeconstruct.com.au>
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

Exploit that it returns the provided error to eliminate some lines, and
return the actual error involved rather than -ENODEV.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index bd4afa7f258eb3c1e64fe87d2b4be5f8422fbaf7..8dbc9d4158b89f23bda340f060d205a29bbb43c3 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -12,6 +12,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/dev_printk.h>
 #include <linux/interrupt.h>
 #include <linux/fs.h>
 #include <linux/kfifo.h>
@@ -316,10 +317,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	}
 
 	lpc_snoop->regmap = syscon_node_to_regmap(np);
-	if (IS_ERR(lpc_snoop->regmap)) {
-		dev_err(dev, "Couldn't get regmap\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(lpc_snoop->regmap))
+		return dev_err_probe(dev, PTR_ERR(lpc_snoop->regmap), "Couldn't get regmap\n");
 
 	dev_set_drvdata(&pdev->dev, lpc_snoop);
 
@@ -330,12 +329,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	}
 
 	lpc_snoop->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(lpc_snoop->clk)) {
-		rc = PTR_ERR(lpc_snoop->clk);
-		if (rc != -EPROBE_DEFER)
-			dev_err(dev, "couldn't get clock\n");
-		return rc;
-	}
+	if (IS_ERR(lpc_snoop->clk))
+		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk), "couldn't get clock");
 
 	rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
 	if (rc)

-- 
2.39.5

