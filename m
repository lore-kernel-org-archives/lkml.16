Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1CF1D88AC;
	Tue,  6 May 2025 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561935; cv=none; b=CsO/zBK7Bt1RFGqirI/taZJjw3K9NRN0bXiAYnVJ2leluf+tBaExBoMplqgZwmBXg2JEiKoJvvCRor1AhnZj7gsb0oaWUdoCdxlbBocKw/JYBBMdLU7AUAWKw4EqjSxpMM7bh5basSczJyA1IhGXKbXeJIqFWR385Jnp63BnkN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561935; c=relaxed/simple;
	bh=v1/WaetPPLIbLAn+oTP+5ur1UuwyBHGcg4dgKfrOu4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8JvqSPTCEqQdOHM78c+s9sTl7hdn1qYXo1P9kcbe0UjCUw+u1+8UPwYN/7uDf7H9S2yX45q6TgdbTBo4k3m7Z/4+wYKwxgiDfXH0u/SUhgxzqegFtdE4ooODVF0nDVFz4VoVDb3YwveO2SsFZ3NKOKKtjgyIrivhkKBuggTFC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=w5WfUMcU; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="w5WfUMcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561933; x=1778097933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1/WaetPPLIbLAn+oTP+5ur1UuwyBHGcg4dgKfrOu4U=;
  b=w5WfUMcUz41TEBN4IgbdImfV7T8O7Er23ULDdR/ThbmQdjewNBMleO5/
   hW6/BP4UldhBLJWcct2cyvhkL/USehBdKcs35ui7mJ8qNBRdpRta1TQkZ
   Jw6HNTu6DHAQ0/QRNlBa92guNzSvvJLIa1C5JMZjvy5kNFmCn3+s8IxCW
   9MSUpHHwAFB0iqchJsiiDbIKUToYf4gBLOQlCKpJn3eoOoneXcg47ol4b
   4Sm0CAxJDt1q483TZAjGpFo2ECAS7SF2h7g9deM1uMy6DTdzK5DWLZliQ
   aBJvwL8Q88pMJaSjhqqtgZDfUIBDCefdJ6CX5/4nXMnZOkYAASvum+QTm
   A==;
X-CSE-ConnectionGUID: dUBqohHAQlqcpEGq8j09lg==
X-CSE-MsgGUID: YIJGv1ATSQ2Tmu2fBmv5Ig==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="208799759"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 6 May 2025 13:05:12 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 6 May 2025 13:05:12 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v3 1/4] clk: at91: sckc: Fix parent_data struct for slow osc
Date: Tue, 6 May 2025 13:04:56 -0700
Message-ID: <b17dc7f0d4ed0a507ac8d0d8e7e27430a73b97a1.1746561722.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746561722.git.Ryan.Wanner@microchip.com>
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

The slow xtal is not described correctly as a parent, the driver looks for a
"slow_xtal" string which is incorrect and will not work with the new
formating of xtals.

To avoid this and keep this driver backwards compatible the
parent_data.fw_name is replaced with parent_data.name and the original
parent_data.name is replaced with parent_data.index. Using the index is
safe due to the driver requiring only 1 xtal.

Fixes: 8aa1db9ccee0e ("clk: at91: sckc: switch to parent_data/parent_hw")
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sckc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 021d1b412af4..952a805b6f7e 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -374,7 +374,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	const char *xtal_name;
 	struct clk_hw *slow_rc, *slow_osc, *slowck;
 	static struct clk_parent_data parent_data = {
-		.name = "slow_xtal",
+		.index = 0,
 	};
 	const struct clk_hw *parent_hws[2];
 	bool bypass;
@@ -407,7 +407,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	if (!xtal_name)
 		goto unregister_slow_rc;
 
-	parent_data.fw_name = xtal_name;
+	parent_data.name = xtal_name;
 
 	slow_osc = at91_clk_register_slow_osc(regbase, "slow_osc",
 					      &parent_data, 1200000, bypass, bits);
@@ -476,7 +476,7 @@ static void __init of_sam9x60_sckc_setup(struct device_node *np)
 	const char *xtal_name;
 	const struct clk_hw *parent_hws[2];
 	static struct clk_parent_data parent_data = {
-		.name = "slow_xtal",
+		.index = 0,
 	};
 	bool bypass;
 	int ret;
@@ -494,7 +494,7 @@ static void __init of_sam9x60_sckc_setup(struct device_node *np)
 	if (!xtal_name)
 		goto unregister_slow_rc;
 
-	parent_data.fw_name = xtal_name;
+	parent_data.name = xtal_name;
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 	slow_osc = at91_clk_register_slow_osc(regbase, "slow_osc",
 					      &parent_data, 5000000, bypass,
@@ -592,7 +592,7 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 	const char *xtal_name;
 	const struct clk_hw *parent_hws[2];
 	static struct clk_parent_data parent_data = {
-		.name = "slow_xtal",
+		.index = 0,
 	};
 	int ret;
 
@@ -609,7 +609,7 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 	xtal_name = of_clk_get_parent_name(np, 0);
 	if (!xtal_name)
 		goto unregister_slow_rc;
-	parent_data.fw_name = xtal_name;
+	parent_data.name = xtal_name;
 
 	osc = kzalloc(sizeof(*osc), GFP_KERNEL);
 	if (!osc)
-- 
2.43.0

