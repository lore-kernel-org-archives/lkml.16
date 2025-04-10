Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF561EB9FF;
	Thu, 10 Apr 2025 03:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254289; cv=none; b=raMpI9lkUUrKTZdOhgpc1LzE+ZuF3vpwD5vR90Sx4ZDe2DyFwVCgPrEjfEpKQsYD2IVjpPPTMgz3+5UIMWhjWQPBfKPiSoJSXCiC3zBtDDAacRBaVnMwjELFYInKJYg1BLkugyG+/9vH4BGHOgUDf0HLGLKzBjtwFKAeSf9RWGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254289; c=relaxed/simple;
	bh=dUzbD/e63aQJEVlP/E7TscVCf6h08CvvlV/IBLDs8HU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ou/rXngwQpFjNmawkQE5TpAfQItJTw3Ks1IOV9oT4I5HwcjuL9GqTFnWXmF0CyHTtXHi8bSrQodnNkJbmPXgJ2cb+Cdns0Z+wbPF0fq90yCw9PucyvpYmUhzD+/V8j2SIcGYNaEyEdRXNC4ooAws6OsgsVd0dYpjCgTeKO2LyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfyfRVUK; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfyfRVUK"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-736aaeed234so202240b3a.0;
        Wed, 09 Apr 2025 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744254287; x=1744859087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+KZZSikQDIaAJ5we61TNgyebN6cWkAPQY8BkFWR6dQ=;
        b=CfyfRVUKj9AnUr1lKZgFWKeNrVJAlrrUOZMtpcKk4b2lBohHxYy+B/i4kXCdExKKiW
         NAGRgod8dK50Tc9gB+ie0RlsF4kvNFJp9R9yROIFPa39q8UWlbF0UXjBngya6UVUOIhI
         MecPHFK5HZuMCZYrKd48TrT92gTJPHO9zgiA1Bx23MWmGi92nlEg0hZZ3Da2LKW08amq
         45eqgICdeHCubCoQ6LowyUJ/j9XGrO+lB3rXg2UwrW/pS16BwWMEPTyORl/SYJUfFTez
         V4keRWAGqYM1qH86XN3oFg5n9nuNuUadhp3C/zHMicHY/MzV+mGzQ6aNtG4wduLys+05
         6uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254287; x=1744859087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+KZZSikQDIaAJ5we61TNgyebN6cWkAPQY8BkFWR6dQ=;
        b=odS6Gd9ZTFiD1XSTkRFvNjOmEHI6ZBFLplsbzUX7cCJcFdwTX700ATEf/bevhjFzkH
         XqQy2XWRqI0XpXqfiRr9qaPYEKsLv/rxzaYTFarvjABgvyuMVheJg90urqMbf4+FGu5h
         Tw0HMeccyjfR2NpIXFHse2kSte5gy2Bv6i+Diqpmo1//dQ+O717rJ38cawz9XM+IWO7k
         5vZ0potynlEvABmX343M8b8pPGJqIaXKxApZsHH72UER3olj9Lcf2ktUJlhTTk0SjenE
         3gCGN6Z4XT6PnM643ZMxBhqNYZelTsKnBvi6/ce9/wRlaMo9LrB9cU3USgVeg9LLgIaJ
         Y45A==
X-Forwarded-Encrypted: i=1; AJvYcCUHKun35yAYjhC6zWhpncfmyR+JeYvxf3Yjio4x2VppuTcL5R5jiqXcAYCfczVpWPIVObBFcAYsz2E=@vger.kernel.org, AJvYcCWHdW+FiyWvjsfm12xf29xO1Y8PwqdAZK6oEVRBi9ABaLuj/BNFADq4Jnx+rmfTXcKST6OjRTwOm97QWrxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2Y5sS1oGIYulchr8crFyiWQaOKe3+TOrdTUwLr/fLov7stBu
	C5aPSAbhoPgfIlqID/hR1j3Qe3NC9ZnceX6DfPdyMcZbgDqHVI9r
X-Gm-Gg: ASbGncvATQCeorKCp5sHL9zcuy2G2DmL+kZ94uqPc+Ls2QxBLboTSjtQyocBwbaUM0H
	dSAPavbhCItWY/QoUbxmX6Y2d8XD5DwowUnWQj78roguSNLscWttJochu4KcWgFHkoxYlZndHVF
	p5nJV75+mlazFWlXqq9tTYQPb2JUzRGfXLU15RPpftCEXMsY0+rxzmm19w8f78ilb9hPJu1PblZ
	8+1uH5dgMdeIOlguRA7gcWGSwt/BgJIN3zkuIHcZ8gW7sIPP2DqsnE2BP9ks8dFVHgAP/DcpNTz
	UQ+buyvw35W6f4DU1Yd+BwzUMqh6pvflMZDdJ7IXT4eYNa8rGadpLpkyT6NRxSaDcEKpzmmi6sC
	BZw==
X-Google-Smtp-Source: AGHT+IHgtIqi32EvJvsz1zRRwYdM5Cbekj5LQFgEfYxdtthuDwvKdqfhaj0lrnhCh2dKYSmGj4BGsA==
X-Received: by 2002:a05:6a20:9f92:b0:1f5:97c3:419c with SMTP id adf61e73a8af0-2016cc9a977mr935469637.6.1744254286836;
        Wed, 09 Apr 2025 20:04:46 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a322115dsm1997405a12.69.2025.04.09.20.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:04:46 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: imx-card: Add NULL check in ap806_syscon_common_probe()
Date: Thu, 10 Apr 2025 11:04:38 +0800
Message-Id: <20250410030438.53232-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() in ap_cp_unique_name() returns NULL when memory
allocation fails. Currently, ap806_syscon_common_probe() does not check
for this case, which results in a NULL pointer dereference.

Add NULL check after ap_cp_unique_name() to prevent this issue.

Fixes: baf4c10f8878 ("clk: mvebu: ap806: Fix clock name for the cluster")
Fixes: 33c0259092c8 ("clk: mvebu: add helper file for Armada AP and CP clocks")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 948bd1e71aea..1461922752e3 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -173,6 +173,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* CPU clocks depend on the Sample At Reset configuration */
 	name = ap_cp_unique_name(dev, syscon_node, "pll-cluster-0");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail0;
+	}
 	ap806_clks[0] = clk_register_fixed_rate(dev, name, NULL,
 						0, cpuclk_freq);
 	if (IS_ERR(ap806_clks[0])) {
@@ -181,6 +185,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	}
 
 	name = ap_cp_unique_name(dev, syscon_node, "pll-cluster-1");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail1;
+	}
 	ap806_clks[1] = clk_register_fixed_rate(dev, name, NULL, 0,
 						cpuclk_freq);
 	if (IS_ERR(ap806_clks[1])) {
@@ -190,6 +198,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* Fixed clock is always 1200 Mhz */
 	fixedclk_name = ap_cp_unique_name(dev, syscon_node, "fixed");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail2;
+	}
 	ap806_clks[2] = clk_register_fixed_rate(dev, fixedclk_name, NULL,
 						0, 1200 * 1000 * 1000);
 	if (IS_ERR(ap806_clks[2])) {
@@ -199,6 +211,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* MSS Clock is fixed clock divided by 6 */
 	name = ap_cp_unique_name(dev, syscon_node, "mss");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail3;
+	}
 	ap806_clks[3] = clk_register_fixed_factor(NULL, name, fixedclk_name,
 						  0, 1, 6);
 	if (IS_ERR(ap806_clks[3])) {
@@ -208,6 +224,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* SDIO(/eMMC) Clock is fixed clock divided by 3 */
 	name = ap_cp_unique_name(dev, syscon_node, "sdio");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail4;
+	}
 	ap806_clks[4] = clk_register_fixed_factor(NULL, name,
 						  fixedclk_name,
 						  0, 1, 3);
@@ -218,6 +238,10 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 
 	/* AP-DCLK(HCLK) Clock is DDR clock divided by 2 */
 	name = ap_cp_unique_name(dev, syscon_node, "ap-dclk");
+	if (!name) {
+		ret = -ENOMEM;
+		goto fail5;
+	}
 	ap806_clks[5] = clk_register_fixed_rate(dev, name, NULL, 0, dclk_freq);
 	if (IS_ERR(ap806_clks[5])) {
 		ret = PTR_ERR(ap806_clks[5]);
-- 
2.34.1

