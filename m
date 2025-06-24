Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31DB2EF9CB;
	Tue, 24 Jun 2025 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777729; cv=none; b=IOt7lP18FTCMiE3vSJjH91+qYDjKv4DdXcYzjlYa7DbJdwQ4iOXWVv6YGdryeFlOdjpSXO0gIx7vTAQdBYBqnY+qn3xuiHsOnp6JiL2/QSZIReMggkWaqA/DM4lM3bP4ezkjWhMir2DGY+/euwdTKH5qkaRHrh6dOA4CHTrd+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777729; c=relaxed/simple;
	bh=zo0NpMdOdWIh9B4OagOeYIcPDmAgxC72SvmGefvk/Hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L8rfdhQd3W9ccnD1CKGZ7hY82sFhSN5w1oUja/kaCgcez1P6a379cfGvUHxu4EK8RIKOhD4V02zy28zlSxyseSk1SjMwOZ/tXDf4WXQiJi4lsiTJc0E4sbkihzSVohG+QXJpUU7G/G6kePEPfEUIWLUM14dUUdvJbEgulDt6YEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pmSqjgvd; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pmSqjgvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777727; x=1782313727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zo0NpMdOdWIh9B4OagOeYIcPDmAgxC72SvmGefvk/Hw=;
  b=pmSqjgvdw08lsfrSHKDCBLstUd9X3Ph7gL/IkiyaF7TbU8TUH2gnWgks
   Q9iEbtMyt5ArZK1OsUkefo1ZWKAGgiKTZ+qggGqM2zuFdoozF04UTVIsj
   uvYN4AKzc1ZgPWm2YBJtFeHe4zObuyILIVjK/4k0WCBaf/eulCpiHvWUF
   ZWtv0hMs6LYxrZnOvwgYNkk7lEHsdTb1oMvsjSNbRY6sqOrixu/6WVw8W
   buVUYw8bua8zll82XW3LAfQunn5Bkb3+36ryfMI2AmZA9LzcD1BYmWxBv
   hkL816AFB7nSGdY0fDzF4ww7mPYhblERtEcSulU+co7zb9Uwyag21NUNx
   w==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: 8gRjwljjR/KZuu12BifyyQ==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688175"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:44 -0700
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
Subject: [PATCH v2 05/32] clk: at91: clk-main: switch to clk parent data
Date: Tue, 24 Jun 2025 08:08:02 -0700
Message-ID: <222655275e1e58dbb3cb2f6e4e65fc08cc81b7db.1750182562.git.Ryan.Wanner@microchip.com>
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

Use struct clk_parent_data instead of parent_hw as this leads to the use
of modern clock structures.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes will be added in
a later patch. Adjust commit message.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-main.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h      |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 9b462becc693..514c5690253f 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -402,7 +402,7 @@ struct clk_hw * __init
 at91_clk_register_rm9200_main(struct regmap *regmap,
 			      const char *name,
 			      const char *parent_name,
-			      struct clk_hw *parent_hw)
+			      struct clk_parent_data *parent_data)
 {
 	struct clk_rm9200_main *clkmain;
 	struct clk_init_data init = {};
@@ -412,7 +412,7 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	if (!(parent_name || parent_hw))
+	if (!(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
@@ -421,8 +421,8 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &rm9200_main_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -552,7 +552,7 @@ struct clk_hw * __init
 at91_clk_register_sam9x5_main(struct regmap *regmap,
 			      const char *name,
 			      const char **parent_names,
-			      struct clk_hw **parent_hws,
+			      struct clk_parent_data *parent_data,
 			      int num_parents)
 {
 	struct clk_sam9x5_main *clkmain;
@@ -564,7 +564,7 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	if (!(parent_hws || parent_names) || !num_parents)
+	if (!(parent_data || parent_names) || !num_parents)
 		return ERR_PTR(-EINVAL);
 
 	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
@@ -573,8 +573,8 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &sam9x5_main_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index b6f2aca1e1fd..e32a5e85d08f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -195,11 +195,11 @@ struct clk_hw * __init
 at91_clk_register_rm9200_main(struct regmap *regmap,
 			      const char *name,
 			      const char *parent_name,
-			      struct clk_hw *parent_hw);
+			      struct clk_parent_data *parent_data);
 struct clk_hw * __init
 at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
 			      const char **parent_names,
-			      struct clk_hw **parent_hws, int num_parents);
+			      struct clk_parent_data *parent_data, int num_parents);
 
 struct clk_hw * __init
 at91_clk_register_master_pres(struct regmap *regmap, const char *name,
-- 
2.43.0

