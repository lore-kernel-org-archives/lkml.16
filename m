Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FFE26FA6B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333753; cv=none; b=LqBjejSZ+geEPtV6MmR93aVGPNZ92YDd1ABzeUJ0dbdCwwaWbdIOFkwtwVZJ5f7bRZW3lyawOtivjTV3FOOwXu3WQtdBqeXZgR/z0/2hjEalKPZjlO54X6wucvoZnO6Foc4aNZEtgT9kI3DUsy7F4czWWuajLt9pVAWCTZ2F9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333753; c=relaxed/simple;
	bh=dBx/Bplbl5f0nTzwDTbIYSziOVoFjQRy/oB8cwrUId4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPCwsvQtG5AFV8qf8UpyiaGt4jT7xp5Q/dEHAOEUXCIQSUWsVW5r9TD/Jv5kDTv6zgv6YcaZtZWJ/xKpDOANRnF63yn5IWbMgwoYpsYjGFv4AkkiA5xrXp7z9oH7JDJ5PnACBt402z08OD5md7SpgGL2VrY1nP6J/z7shT6ItIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KXybtiEp; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KXybtiEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333749;
	bh=Kl9cNe70ebuqUBsGg3wclmdapJ/BbYZ4gItW6jHIc7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KXybtiEpVaRs6sAGdOtnmP9rQxsNzrAWJmdNkLK8ew7d8QxZs4QbeawJkPJVvlGYE
	 kqYN+QPIEr2LOIxkxWgr2NjAowCKjUwCHvNbLmMSyLR7qUkPolYIgpnpWyUpupKQsJ
	 wxAzji6m4w24QEKZHRAbdORveQcLoi+OWJVPb4BDSrxBYVfHp2JrTWXny7XinCq+Tu
	 Vcz/WVUl33+nQkgXC1Ji/Zpx2O+G9Fw1dMcujg6GCyxCOXGLc+cChI2/R6Zi+0025x
	 9OnfmrhQZ2TQTXGqaW6izUHRwuev4+qYKqQQe8ekXqSEjAY3YwmSfMBrtXgZwPtOjP
	 wq48PWVT/MeMw==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4EECF7D712;
	Fri, 11 Apr 2025 09:09:09 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 11 Apr 2025 10:38:33 +0930
Subject: [PATCH 3/7] soc: aspeed: lpc-snoop: Ensure model_data is valid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-3-64f522e3ad6f@codeconstruct.com.au>
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

of_device_get_match_data() can return NULL, though shouldn't in current
circumstances. Regardless, initialise model_data closer to use so it's
clear we need to test for validity prior to dereferencing.

Fixes: 2dee584bc9e3 ("drivers/misc: (aspeed-lpc-snoop): Add ast2400 to compat")
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index e9d9a8e60a6f062c0b53c9c02e5d73768453998d..28f034b8a3b7226efe20cbe30a7da0c2b49fbd96 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -186,10 +186,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
 				   int channel, u16 lpc_port)
 {
-	int rc = 0;
+	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
-	const struct aspeed_lpc_snoop_model_data *model_data =
-		of_device_get_match_data(dev);
+	int rc = 0;
+
 
 	if (lpc_snoop->chan[channel].enabled)
 		return -EBUSY;
@@ -236,9 +236,10 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
 	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
 			   lpc_port << snpwadr_shift);
-	if (model_data->has_hicrb_ensnp)
-		regmap_update_bits(lpc_snoop->regmap, HICRB,
-				hicrb_en, hicrb_en);
+
+	model_data = of_device_get_match_data(dev);
+	if (model_data && model_data->has_hicrb_ensnp)
+		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
 
 	lpc_snoop->chan[channel].enabled = true;
 

-- 
2.39.5

