Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C22F0022;
	Tue, 24 Jun 2025 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777733; cv=none; b=E+WYJLsNjM87obpNJg6n0xpcmPRdrxEhNp9mocAJGMJ50+G/RCTv3Zyks7iV7YbUP/6EwQLEEacyPdsM3AulpUOHIAxncO/PLljrSSPPCfWpK8CLdmaunMRo51j3I0s87QQg70tPQXcERaWRE8MoKIgRIAIeN13TCweYDFvJiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777733; c=relaxed/simple;
	bh=mGNBpxLhK/suF8aQRgzePzXG6XsVBcxdF/e78gbuu1M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lnag56HsdkFRxau1axieHpeVthHtbudNSkLAFcc7M/3JcEgzG988dT56j6kfz4a+36NUbpW+6p2ZsrUYlAvfAvnJdvnyMsfW8pZIHcIvxaBghTyXeLEPyTsuzWbLlxr6D3VOVNb9a6XjQ5u137zBK98rqo7TcDtDT+q30fHLmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=PaF2XQuz; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PaF2XQuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777731; x=1782313731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mGNBpxLhK/suF8aQRgzePzXG6XsVBcxdF/e78gbuu1M=;
  b=PaF2XQuz2sP6E7EnktdSCKt2XE9pq2HgRXj4xegATYqrlNV22WLZgtkj
   SyA34bdVhoXIBbVo4D0TLgDvzJdAkSJ0BmVA80IStqoihSHrfEaoJimuF
   xTWpaUWzNPltn1LYrZhNn5biKi56pYQsmy0VvpkI8q41GQ2f7siKmjKm4
   152Kr0oJLczseKHjAxxK5DQlIfGPMKw2iljT7eWHsq0WNDRebGOAorzlz
   5W+gQlcpf/X3vJT4kYkztINKsVx4fDP1i2jeGaZOwWHBTskIbi3j7zV85
   1uu4PqFe9Avwrljxz33FrahZeQMuYnO74DWog0d8ds73UGr8UNhGPB6Pe
   Q==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: rFYi28elRHSiPxGB3goiuw==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688183"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:37 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:37 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 09/32] clk: at91: clk-generated: use clk_parent_data
Date: Tue, 24 Jun 2025 08:08:06 -0700
Message-ID: <2ca410a8828aa740266a3d736504b925f3a37c84.1750182562.git.Ryan.Wanner@microchip.com>
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

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-generated.c | 8 ++++----
 drivers/clk/at91/pmc.h           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 4b4edeecc889..d9e00167dbc8 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -319,7 +319,7 @@ struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 			    const struct clk_pcr_layout *layout,
 			    const char *name, const char **parent_names,
-			    struct clk_hw **parent_hws,
+			    struct clk_parent_data *parent_data,
 			    u32 *mux_table, u8 num_parents, u8 id,
 			    const struct clk_range *range,
 			    int chg_pid)
@@ -329,7 +329,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 	struct clk_hw *hw;
 	int ret;
 
-	if (!(parent_names || parent_hws))
+	if (!(parent_names || parent_data))
 		return ERR_PTR(-ENOMEM);
 
 	gck = kzalloc(sizeof(*gck), GFP_KERNEL);
@@ -338,8 +338,8 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 	init.name = name;
 	init.ops = &generated_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 34036f2d0578..0646775dfb1d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -171,7 +171,7 @@ struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 			    const struct clk_pcr_layout *layout,
 			    const char *name, const char **parent_names,
-			    struct clk_hw **parent_hws, u32 *mux_table,
+			    struct clk_parent_data *parent_data, u32 *mux_table,
 			    u8 num_parents, u8 id,
 			    const struct clk_range *range, int chg_pid);
 
-- 
2.43.0

