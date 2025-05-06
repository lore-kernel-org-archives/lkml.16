Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C41DE8B0;
	Tue,  6 May 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561937; cv=none; b=lMlnjzwiDlWCaoMvovU5KpnacwEHNcc5cYJcOoGykKYD/9wrsVo5O+Pj+5CWPeOGuLh86U2iEptYPDLUpMg8Scuixri3BcgOGBTQ3DdfMigTNVdN2k/FW3kU85MzEoe8GsAjxm37t3iCq3HSLCCYNJn9I70paL1LlWsAhMqH57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561937; c=relaxed/simple;
	bh=l4uopfDlFyYIJ4HY7uFezuxz3KQK1Nqe2RPTYmE3TCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHy51GwKDEqqVZHEsuBlNF+1N2SnvD6Nb8ZLGTr1WPq+VAymiBpoeDDN1gXL9mHKbWJsqR/Qb+u4jzyCAagM2EkH1ScQeyLMImMuz7dU94PvtNWYW0XhfvpMOpePWnDyU5qz3vOnO1aJMn8WjDZPWDNanY+4yJVLzwvFUI2ZfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pRyG2cYF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pRyG2cYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561935; x=1778097935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l4uopfDlFyYIJ4HY7uFezuxz3KQK1Nqe2RPTYmE3TCA=;
  b=pRyG2cYFzNu/LgCYBIAcUANH5qLxXN14XM+Ko3rboAWz3JTlXjwizcge
   kD3WtZHT4IJhgjjQcg4AYoabM7u+XSAUQswlGbibKF84CjQwT6+Cpu6oV
   A44eAb6JPNTcUzrUF5h62u1QtiVQ+fq5CqpNdi5RtrNfjYwWfZJwYJSek
   uMIr4IAiKI0AdGG4QztBcX426BYYhuTAWWFbOXe+5Q2HUD/cCLVTX692A
   lpW3Fpap9tyzh9JhzPHSiRKsgm8WAEKQwGesYSQiighQfkHpzCmXAYJyb
   Nxsrp1PO+pKZ7XwSrgZf8LQXfw3JhiVmOeF2tOuO20g2lXlDZ7Knmz3jD
   w==;
X-CSE-ConnectionGUID: dUBqohHAQlqcpEGq8j09lg==
X-CSE-MsgGUID: 9bbqWeX+Sq60Xhm0RAG6sQ==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="208799762"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:33 -0700
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
Subject: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to parent_data
Date: Tue, 6 May 2025 13:04:57 -0700
Message-ID: <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
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

The main_xtal clk_hw struct is not passed into parent_data.hw causing
the main_osc to not have a parent causing a corrupted clock tree.
Passing the main_xtal struct into the parent_data struct will
ensure the correct parent structure for main_osc and a correct clock
tree.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f2..1e9d3c393883 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1100,7 +1100,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
-	static struct clk_parent_data parent_data;
+	static struct clk_parent_data parent_data = {0};
 	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
@@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_data.name = main_xtal_name;
 	parent_data.fw_name = main_xtal_name;
+	parent_data.hw = main_xtal_hw;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
 						 &parent_data, bypass);
 	if (IS_ERR(main_osc_hw))
-- 
2.43.0

