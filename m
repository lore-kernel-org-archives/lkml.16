Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2397E214A82
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233471; cv=none; b=MxyXtXy2fmhl3tn642iRb544MfRvKL1q6vBYDJrszIPgHhEzdT7RGzQ4or+yXbppEPZgcmCe38XELPLLIHV7sRG3ax27B8jQWGvcLXxMMcZsKLllGHRxX6LMW9KONV7q/xaKFuNxDPQ7YgcOU6N3RjDUt4oFLHf0hGogUNzi1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233471; c=relaxed/simple;
	bh=LS7YZ++WbsdVQE1UX7G+UOQmXOkD2lQl6Z+x5E+PHkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGf9FW3t2zFQESURyKypYjfOJx8AQPcPjUsg/lFH3lDIhsBfdXo1u3Qe/rvzynslBiIC7fajjPakfF030etUvWy7SToeP7fbYY84gR9Gpqi4P4DzyoCLzMwVbZcPGMCA+ilS2ym7pR+iQ64T94ouk+fywWnCbypVaCJZLyNbvJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mzDFC4Aj; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mzDFC4Aj"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso1700345ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233468; x=1744838268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Ujt2BqpTFQspxt7ElIhz1eo1LmzpQ0jjYgAj4gQFw=;
        b=mzDFC4AjlYQtRvVwGt842osF35O+N/YmB/9rJOOu/OSBbVhaRENYZierNc9MQu5dTR
         SCfYGpr2dBv+81a7I5nubVWf0ePd/rwj30X79KLoFRR2IlZ0xFFZys7OJKMVcRxtlFw2
         7Y2q/tDEKI4lxAGGSu3F09WcRSkMIzJJCBqzo/j6eG81/xLvHDm82xs7yvht25zY8cYI
         e+lnODCqbbvvzNjBjQE9RAz2sRUYN78lkka2JKB6Ow47agZAJDJfIEmtJM5JRRejpDxA
         lIgIw8lZrz+WlimLGalu4Rjx89f4xdGajTwn+g/dMcUeZArFd1kvT2JVvlRysK8NzZYj
         KUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233468; x=1744838268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/Ujt2BqpTFQspxt7ElIhz1eo1LmzpQ0jjYgAj4gQFw=;
        b=hbrm6mZsUZZ60/DxXKY9WYkPwhAlsJkIMBcUXdODPA5entRJMpTeo67ffHV7hyQQw+
         pQ6B+Klmm09UmnLMRmRdamMq//UvUKeO+0luPpKGDmd2YyhkB6OLAor49iqRgfrCAsz2
         G6+PAZvasOo0ONYbG7oub8vHgHQ4diiKvsy8h1up/a/nf3rHmfG49RaPt0pzvYKmPfyN
         zPMNIbO38imFxKz9Kw5f2JtyqR59Zazfen/sIcUlrzcKrhxC/7l4L/lWKP83dkUouLwV
         stlqDrZ6SzAQiNHmUrGm3IBstkxEDqDlXiA/vTSbYAprP0xTjLMQtl5FgM9rse/MnIJ+
         WDeg==
X-Forwarded-Encrypted: i=1; AJvYcCXUsKunGOO0iuTyHZ1IV0sPOlTj5i+aH7/nj+Z5zr5NaRD27FpH29MQpYRAcFpb8wQvViIrRQfM7AhQ5Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfb3cGQXI58MYYPt47s9CgyyW37eaYYrfNODAEsmI6YaDZwaJk
	QcNo/+BX37vWTRDi+ZFmnbIz9V1rgDW2hXseIqbzHUuD8s3g5TEVcefoEFvducE=
X-Gm-Gg: ASbGncvccg/c6mFt+4k1vgZmN0IdFLMepPCCtVRJ8FtqXcbfbOL4CBITsymoWYff31M
	p/SEIj0Et5yvDxRkcHLy3+GPLZjoZWnpNj6FRsIC4b4ek2Z1U1qNzEXL7B8R0aTB9z6gsNX7AlJ
	pSCSCywXaQECzupIR/V6n1G8vdEXEWNCznvL7yr4TcChx62IF8GlZdKFRdszkuepzUURp5dgCMO
	oR7OpfcY5/ifNTbTrTJcCT0sSK4bd039arjyUdcRpSD3XnhSpayVVWN4wxai4ksex1+fXGLpcZA
	zDjIMmuZnpgnQ716tjBZsRLEzVkD48pKumul+JskfMfblFZXhZJRRnQ8RAbvvUXwE/xucRQuHcl
	oOUg7nBQDv7iu8Q==
X-Google-Smtp-Source: AGHT+IEA351OHRV1gFr2V6hEs8tVqEYmZ8Jl/cV8rxcpoeDrDqiVZAMMDJF5x+pEwEG48cVA0Jzrbg==
X-Received: by 2002:a05:6e02:308a:b0:3d3:f040:5878 with SMTP id e9e14a558f8ab-3d7e477abafmr8500765ab.21.1744233468227;
        Wed, 09 Apr 2025 14:17:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Wed,  9 Apr 2025 16:17:35 -0500
Message-ID: <20250409211741.1171584-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "clk_" to the names of the fields in the spacemit_ccu_data structure
type.  This prepares it for the addition of two similar fields dedicated
to resets.

Move the definition of this type closer to the top of the source file,
after constants are defined but before objects are defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 5804c2f854071..8a8d228b46c3f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -129,6 +129,11 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct spacemit_ccu_data {
+	struct clk_hw **clk_hws;
+	size_t clk_num;
+};
+
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /* Frequency of pll{1,2} must not be updated at runtime */
@@ -933,11 +938,6 @@ CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
 		APMU_PMUA_EM_CLK_RES_CTRL, BIT(3), 0);
 /* APMU clocks end */
 
-struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
-};
-
 static struct clk_hw *k1_ccu_pll_hws[] = {
 	[CLK_PLL1]		= &pll1.common.hw,
 	[CLK_PLL2]		= &pll2.common.hw,
@@ -977,8 +977,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -1018,8 +1018,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -1126,8 +1126,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1196,8 +1196,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1207,13 +1207,13 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
+	for (i = 0; i < data->clk_num; i++) {
+		struct clk_hw *hw = data->clk_hws[i];
 		struct ccu_common *common;
 		const char *name;
 
@@ -1238,7 +1238,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2

