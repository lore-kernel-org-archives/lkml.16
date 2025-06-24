Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D72FE303;
	Tue, 24 Jun 2025 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777761; cv=none; b=sYqZg+vX4gvJaMYHpTyOLiw3dMHZpo9Zho1EL9bYC7ohRLH+tjHe1rawQclPSvGupoDMqwOlSVLmzADg9OWTTrbxVOPMuzYpuLwB2DxnaQuCq6M9e28VX9Y2hAs4ihDx3erNjfqVJ5K/GPyxV8jxsIsjqKXfQYPhX3nKexGekBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777761; c=relaxed/simple;
	bh=ks//bS6BKYns21riYfrNCT4X6p254F5rw7NfuZH7dgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RUUkgRA8DPTSqw+bFjRCzSk3utp6PqbN/P+Ef9yuSCAKIXEJlnIP201+E58XGfhDC4WO/IENDrX+wj3SZhbEg1f4JX9BJkbf2NThehcX83mYuvqkSfkLriQxmMZF3+59fvRh+MQLmTgcjFcNtpQAjLC5rE+rk6+IHCPGLCeuvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Y4QgDx8H; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Y4QgDx8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777759; x=1782313759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ks//bS6BKYns21riYfrNCT4X6p254F5rw7NfuZH7dgU=;
  b=Y4QgDx8HTPY00Pg/dh1S3xb4HR7o+bp6xf702jmyiN32QbA4S40qgGdB
   lxtzAK5galP23pP47dD/kIzNn+srZCGbr5tCjxT/eDK3RajVnwzQx3xlt
   aAggQCB3NQP0eO85Kr1YVByTxklP/G0ia6g82zafeg9G4QRb1QSoV2S/h
   Zvrf/Qnehqv6iY6giN1PnYa8jRJWY3FtoyiaD2/N9gJAdkIvawa6cX4y6
   oRtBu6XRhCN/LDNjB1HT73gev9JhRtFEMHRIO6HnN+S6ZCwFMmQuJMQmQ
   A7LHZI4YxI9ji4XfrZKAkibgW3oW4nfdC84ATc9RaqfYFzoTqEbANfTJX
   g==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: JVVgi/eEQK2Jc2N/P3uw4Q==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641586"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:38 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:38 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 18/32] clk: at91: clk-slow: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:15 -0700
Message-ID: <1890a4cd63daba9288ea29c6a295e86c278cba57.1750182562.git.Ryan.Wanner@microchip.com>
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

Add support for parent_hw in slow clock drivers. With this parent-child
relation is described with pointers rather than strings making
registration a bit faster.

All the SoC based drivers that rely on clk-slow were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-slow.c  | 8 ++++++--
 drivers/clk/at91/dt-compat.c | 2 +-
 drivers/clk/at91/pmc.h       | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
index ac9f7a48b76e..5b7fc6210e09 100644
--- a/drivers/clk/at91/clk-slow.c
+++ b/drivers/clk/at91/clk-slow.c
@@ -39,11 +39,12 @@ struct clk_hw * __init
 at91_clk_register_sam9260_slow(struct regmap *regmap,
 			       const char *name,
 			       const char **parent_names,
+			       struct clk_parent_data *parent_data,
 			       int num_parents)
 {
 	struct clk_sam9260_slow *slowck;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (!name)
@@ -58,7 +59,10 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sam9260_slow_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)&parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 	init.flags = 0;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 5afd7c9f53fd..fa8658d3be7b 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -823,7 +823,7 @@ static void __init of_at91sam9260_clk_slow_setup(struct device_node *np)
 
 	of_property_read_string(np, "clock-output-names", &name);
 
-	hw = at91_clk_register_sam9260_slow(regmap, name, parent_names,
+	hw = at91_clk_register_sam9260_slow(regmap, name, parent_names, NULL,
 					    num_parents);
 	if (IS_ERR(hw))
 		return;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index e5ab2fb3bc89..24c32e42f264 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -273,6 +273,7 @@ struct clk_hw * __init
 at91_clk_register_sam9260_slow(struct regmap *regmap,
 			       const char *name,
 			       const char **parent_names,
+			       struct clk_parent_data *parent_data,
 			       int num_parents);
 
 struct clk_hw * __init
-- 
2.43.0

