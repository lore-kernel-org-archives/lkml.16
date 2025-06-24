Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34F2FD870;
	Tue, 24 Jun 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777759; cv=none; b=VecUv7Ye3cr5NfopD41BM/QsBcPIDOb8/mMoTRISEKYpuv9GQeTRSrvWZjItlOhYJ97DY9Lv4QHHhOG1jm1wwGE6rvenUN7P8TReQ0YM3zeC8LOAPUrTCQNKq9rchwpAXC69eHAP9LN62zZybdPEpjCdvV2G7kRdBy1w81BkX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777759; c=relaxed/simple;
	bh=p8hKSAxPTGypFQ4ukRy4fkUp3r3iUW8ues0RYFqVcIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cr60zO35nAfAQJC44EQBzXO0C8DwfrnD++CDYBRkL6MX124moYbzOrpZpvrHaoe5dgnDeXhiArQj4aRz54nuXbovTS9AUqOPT62P6wWp0VY3wG5GCOuI+NfFo7g43D1UXRvDkDFte+gqP3tb7RmfUChHgy9Q3Xb/F13ltL8yLCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vShGESwl; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vShGESwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777757; x=1782313757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8hKSAxPTGypFQ4ukRy4fkUp3r3iUW8ues0RYFqVcIo=;
  b=vShGESwlcbvUp9SHlGkzz2CuHb+0sX8YLRRJz10PPhXDaylOlaaLO2WV
   gAZTf7v+M6jFm3iKt9YgShMld0lhExDK0u/2tvd5URjkeb7YhtqpyK8m5
   eP0n6K9igIj+7QYy2eAPO6Ni8amnxId3pqSurxSevhAUylDQAxU6B76Qn
   UKsUPY6qAo7hthGNZlFVhFQGJ8b+6wx2ZxShspemwU6qzpnup6JUSHu6S
   gRQJsEXSja70JM5dKwLl/XrlwdMydIgmbOzGv5s9QG8TVlYFYFCaPT1pK
   MH9mIPBj7KBO0Tv+bGoU4JnvGVjE4tgQJF5dP7PX6JMJP039+1fbkdxdf
   A==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: o7aRdA0LRuObY6L1IPtmtA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641583"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:15 -0700
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
Subject: [PATCH v2 16/32] clk: at91: clk-i2s-mux: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:13 -0700
Message-ID: <d94b3c0c9958469ca1c5c34961ad27d0d0b7160b.1750182562.git.Ryan.Wanner@microchip.com>
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

Add support for parent_hw in i2s mux clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-i2s-mux were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-i2s-mux.c | 6 +++++-
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-i2s-mux.c b/drivers/clk/at91/clk-i2s-mux.c
index fe6ce172b8b0..04d9fcf940fb 100644
--- a/drivers/clk/at91/clk-i2s-mux.c
+++ b/drivers/clk/at91/clk-i2s-mux.c
@@ -51,6 +51,7 @@ static const struct clk_ops clk_i2s_mux_ops = {
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id)
 {
 	struct clk_init_data init = {};
@@ -63,7 +64,10 @@ at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &clk_i2s_mux_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
 	i2s_ck->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index ccdeba3a1130..2b1aa834f111 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -239,7 +239,7 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 			continue;
 
 		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
-					       parent_names, 2, bus_id);
+					       parent_names, NULL, 2, bus_id);
 		if (IS_ERR(hw))
 			continue;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index fe42700df6db..a380054d580d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -182,6 +182,7 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id);
 
 struct clk_hw * __init
-- 
2.43.0

