Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98142EF65C;
	Tue, 24 Jun 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777728; cv=none; b=HPPB5DYHf9dARDyp3W7IrUJT7teQB7sTxrDCPjkRI/UC8YBWkkt6D6M+a8ULxFb/lBfXph7VslnJJgeffqGK08+OYxuaQ2ytSLNq7CXSL2UWVArCBJJ0kvdcEiR14Kn/5m65cHKABlayZJtaToGV6/oJV5oDuTaqC1mrehSqR24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777728; c=relaxed/simple;
	bh=/z69PibqywpVDUupVFU5et9XVf8qDTlwUsinAZCZ8UM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZzvnOlYvp8TSTG6I6WQNQ4Gwju3/SDSnlvuBZFXACceIHAUoZZHAyGTabDwgvE1mRyEwj2G2ioyUUVxOFoqF1scP8Z6vJNRF70we38XkuyKf7+fkVZNHpxzw54xag5kODWvf1tj3CW4lpdxPSmHpT57Md9M4cVPiA61xC4ZPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Fm8R0HCu; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Fm8R0HCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777726; x=1782313726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/z69PibqywpVDUupVFU5et9XVf8qDTlwUsinAZCZ8UM=;
  b=Fm8R0HCulFPUEIKiIaTdB1QVVhlFV+0/4wYusE/StVgA7pm8cg1fL6bU
   HzpMfjjp4mE/DOHWDC2XHu0XWO/KpXh/aA8z/1qgZ8jHYktH+hk1RdlFL
   CI3yeEbGqd4T9dbr35HxSwRL8DmQKuBahRo0EWQKinYJ2hG/UmR+4gYL4
   1pwrgaBX2DWDcqLHdRQNiwPzZhgj1+ZbyXKeTss/qqmrsN/SPLaozaj2B
   3Ue3ns7/iZI/JWqt9p4gj6w5Jm60M/UO6hObwCpkWzMYIWjBhtjbjGcO0
   qmG+EXMbN0Fd/PvxWXj03HxAJ5dwt3J2hl95y+Lugp3myvSV/H9x4amOn
   g==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: Q0O/25CwQsu2txuQI1HkOw==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688174"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:36 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:36 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 04/32] clk: at91: clk-peripheral: switch to clk_parent_data
Date: Tue, 24 Jun 2025 08:08:01 -0700
Message-ID: <94aa65af65553f4251bcc9ca6420c8feafc27324.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Use struct clk_parent_data instead of parent_hw.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove the SoC specific changes those will
be added in a later commit. And adjust commit message]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-peripheral.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h            |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index c173a44c800a..ed97b3c0a66b 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -97,7 +97,7 @@ static const struct clk_ops peripheral_ops = {
 
 struct clk_hw * __init
 at91_clk_register_peripheral(struct regmap *regmap, const char *name,
-			     const char *parent_name, struct clk_hw *parent_hw,
+			     const char *parent_name, struct clk_parent_data *parent_data,
 			     u32 id)
 {
 	struct clk_peripheral *periph;
@@ -105,7 +105,7 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw) || id > PERIPHERAL_ID_MAX)
+	if (!name || !(parent_name || parent_data) || id > PERIPHERAL_ID_MAX)
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -114,8 +114,8 @@ at91_clk_register_peripheral(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &peripheral_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -448,7 +448,7 @@ struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags)
 {
@@ -457,7 +457,7 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!name || !(parent_name || parent_hw))
+	if (!name || !(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	periph = kzalloc(sizeof(*periph), GFP_KERNEL);
@@ -465,8 +465,8 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index b43f6652417f..b6f2aca1e1fd 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -226,13 +226,13 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
 
 struct clk_hw * __init
 at91_clk_register_peripheral(struct regmap *regmap, const char *name,
-			     const char *parent_name, struct clk_hw *parent_hw,
+			     const char *parent_name, struct clk_parent_data *parent_data,
 			     u32 id);
 struct clk_hw * __init
 at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 				    const struct clk_pcr_layout *layout,
 				    const char *name, const char *parent_name,
-				    struct clk_hw *parent_hw,
+				    struct clk_parent_data *parent_data,
 				    u32 id, const struct clk_range *range,
 				    int chg_pid, unsigned long flags);
 
-- 
2.43.0

