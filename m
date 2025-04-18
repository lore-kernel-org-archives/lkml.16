Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BB1D618E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988052; cv=none; b=A0wlKMCIoOHOI0qIbEeCMr04hiuzAeUeDxbEnAwwzkQm+/heRyMH8yeJGSkgi59OXsB3gfszCXBPniYlGEEQpENwxtyN/xUyn3I3VSd3ekXJnbUykBgu4oNE7eoymRr0jOA5OHK3KSWtOknuLYmMSducuCRf/qvcEFkUUaZQnQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988052; c=relaxed/simple;
	bh=pcYI/mBPHAIWHl1kcIeUbuno01L8luoMXUN7kqO9X+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lL6ZLWwosYl7VYK+YHs2jTPH9l0fuJxTc0dHL3auNoWnro3RtBApFyaoP4L7BaMT/UdaB5/m032KkMj1S5XNMnncoS7lX8tlU5mkuMZ7mSBFYbqaYVpXJ410pdg2cjT4LGFqOW+TLLEXBZ4iYXzpucjYfV7QSjsyjHLP4qoRWw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yJjm3nfG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yJjm3nfG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47690a4ec97so20003911cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988049; x=1745592849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGLQrJG9/WVjMRDCZD5X9MgDJzulV+jWlnrfByD2cXU=;
        b=yJjm3nfGGFwCMhLTbM9QCdFKam47oKexNPthQejTVZCObvifVhqvEGpyyfOxfacI7L
         pOvtpELsUfeEjNRkJ2UuaQuCDKMKkawc2XwBRFIkfOHKcLPEOoH1QbPb4VoPDZ65c810
         m6RPritvZgWn7MkTq/odQF8MiNiYj8KUYYTAfz7LESSl6UyOWN6/caDzdnRbeUdCeyYv
         nRz6mGP8UlQfh9jmZJ6vfooeLz5apxa6gq3gcqz0YyJ4py/TBFXj8X2lw5qRb3WLGdnk
         lJA+LhM4KWWwrlo7laYz0i9EDLaBYp56twahWCKx0vIkAf82gyJHyRQpWq0NDDMLHeQo
         bKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988049; x=1745592849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGLQrJG9/WVjMRDCZD5X9MgDJzulV+jWlnrfByD2cXU=;
        b=DzTfABd6JcW4buinyWHLAmUjDxpmRrKqfUijbLJLfnGf05zHW6UAMycBhJZMsekpOM
         e0nP8+GA+C4kFXeCkDRbWY4DvVInTH/mR/kIaUNBroHhFhiWZcsobmZzRonWlgeN8OD/
         PrjVRjNQ1tGfX8i04BNyEs6DndUXjGV4EdY50HSNwgmjmTGhCpVrYLKsMgxaGIZI2/XW
         lIL1DjKL0VqKghMSf+BCvyyHMNZopf4YS/jAL8YkIcWXy+egNV/YIPPnIijJlf0cHX0v
         mXKaiqa/w2tX+A5kP/AV2qunkPXRhWKOOPnGx8xYadzs8u7B9K9o0vcPib0N9X5or5N2
         Gbhw==
X-Forwarded-Encrypted: i=1; AJvYcCWbKBq7wq55olGFykHdAfS+Ri4tR3GCKC3GI0p85RzYvYop+Z80vvbAxW1VaQ62Ib1y+fCOJx1kckRTQY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE9yikb6Pg7IZvBEEvvvkqQ1LZOSg9H9AoMGLewESb6SriKHg9
	snVCernZdjizjT6zHOEHn7gWDTYyDm0aCkZA1iCa3Q9KWXEEFAUDA0Tt746Me98=
X-Gm-Gg: ASbGncs5Gg7U9q8DvLv8/IgkHkcTI0He0OFnUZ/ykhHlTGteL8TpGyrrd5r9VXfyaZR
	awENuY4YqIWXKOFt0QjyL+E6uaEMhijZA2G3G8z5mwQJVhalsibXM5SdyOWcHD7OsA3Xa+hJELz
	KsYf13ZYdGxB0y5y6gJfbFS2Ity4tv1RvYSAXxp2WNrXjAHSIyxpa7F/HryLL4I02H5A6M5tM8j
	HoqteXYcRb1npJ5ZyiYMQhYNytXJBc/Uh3k9aLn1Zbey6AG3XA8DkRBmDrrJpwYlMoOhKDyUcD9
	grvXNn5xSbX3on9iICsljET8xi17Q1JaDJY2MRkreEzt+BGB0mF2LfPqAHdj2xqQncQDrhQztZU
	0bguOIH0k3xukSg==
X-Google-Smtp-Source: AGHT+IHEqzlEJZsM9ibzpxY3pVimq3gvrY9lGtxVp45evTuL1ehJDJBIbt283Y62JHB4YPt3Xe3sXw==
X-Received: by 2002:a05:622a:1987:b0:472:133f:93ae with SMTP id d75a77b69052e-47aec4cf703mr39891641cf.48.1744988049055;
        Fri, 18 Apr 2025 07:54:09 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:08 -0700 (PDT)
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
Subject: [PATCH v5 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Fri, 18 Apr 2025 09:53:54 -0500
Message-ID: <20250418145401.2603648-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
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

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..a7712d1681a11 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,8 +130,8 @@
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
 struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
+	struct clk_hw **clk_hws;
+	size_t clk_num;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
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
 
@@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2

