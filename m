Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27273280308;
	Mon, 16 Jun 2025 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070142; cv=none; b=pRQIXmAeG81yjhfXZR/Px+9l5Gv5ac4/i+kM5lKO369G6QearNf8awcpSPk8sOePA0OIvgYsKdYYrbHWNDPmseVMp5kh8idBqvMV+5nE4F6g7FgIigYsB3MP5G+/uaOIVUvy6evmjtTdw2wnnDyBloZrvxJfyUQJE2odTeOZzAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070142; c=relaxed/simple;
	bh=maef49hvU8csUaVh7R/3qgbrlB+8XwClevuCaZC4J3Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PrURD3RMj9i12vROz2hMeF+VAy1y3820bDViqFOWBdaEqXMxLjXsTb6N5Q+7bIAMwk8z7W2AvR2O+cWxpvCqFwVFQHo/bR69CfFT2dcBiQultDw423s3jKD8c6X9IaEg7NSjxbPPgWz9svSF9ewgQ3h7H9CggL1bcgy7wxM8sHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PYN4RxcT; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PYN4RxcT"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55GAZS4k3711020;
	Mon, 16 Jun 2025 05:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750070128;
	bh=Kwmb+etCxPtFyT6gOreHcG8PEisRSuh/qUTg+ezSL00=;
	h=From:To:CC:Subject:Date;
	b=PYN4RxcTvk3Rki0V9RvwotHd6mOEVZppa4rAE5wYI65Sh39gflpHdrz45T+ZsAzRB
	 qwVWVblM+huXzuiCcvJjH6eEDg4JtCNpTfhguLILyjY9/Gf+adWJdMA35Tu7yNtO94
	 AN6p3WGSXq9ocWchFS5RB5SD8rZuH8AeOn5WtIhc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55GAZSnw874465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 05:35:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 05:35:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 05:35:28 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.143])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55GAZRoE4114547;
	Mon, 16 Jun 2025 05:35:28 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux@armlinux.org.uk>,
        <linux-clk@vger.kernel.org>, <devarsht@ti.com>
CC: <linux-kernel@vger.kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        <j-choudhary@ti.com>
Subject: [PATCH] clk: Add clk_determine_rate function call
Date: Mon, 16 Jun 2025 16:05:27 +0530
Message-ID: <20250616103527.509999-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add a function to determine if a particular rate can be set for a clock
with its argument being the clock and the desired rate so that it could
be exposed to other peripherals.
For example, the display controllers typically has to perform multiple
checks for supported display resolutions including those related to
clock rates. The controller has to check this way before it actually
enables the clock and has to do it multiple times (typically for each
mode), and therefore using the clk_set_rate when its not needed, does
not make sense.

The driver does have "__clk_determine_rate()" but this cannot be used
by other subsystems because of the function arguments used.
"clk_hw" is not accessible to other peripherals due to clk and clk_core
structure definition in driver instead of include file, so we cannot use
already exisiting "__clk_determine_rate()" in other drivers.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/clk/clk.c   | 22 ++++++++++++++++++++++
 include/linux/clk.h | 15 +++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf..f72d638cc211 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2566,6 +2566,28 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	return ret;
 }
 
+/**
+ * clk_determine_rate - determine if the rate for clk can be set or not
+ * @clk: the clk whose rate is being changed
+ * @rate: the new rate for clk
+ *
+ * Check if there is a best match frequency for the desired rate that
+ * can be set for clk.
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_determine_rate(struct clk *clk, unsigned long rate)
+{
+	struct clk_rate_request req;
+
+	if (!clk)
+		return 0;
+
+	clk_hw_init_rate_request(clk->core->hw, &req, rate);
+
+	return __clk_determine_rate(clk->core->hw, &req);
+}
+EXPORT_SYMBOL_GPL(clk_determine_rate);
+
 /**
  * clk_set_rate - specify a new rate for clk
  * @clk: the clk whose rate is being changed
diff --git a/include/linux/clk.h b/include/linux/clk.h
index b607482ca77e..fd81ba738e50 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -829,6 +829,16 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  */
 long clk_round_rate(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_determine_rate - determine if the clock rate for a clock source
+ * can be set or not
+ * @clk: clock source
+ * @rate: desired clock rate in Hz
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_determine_rate(struct clk *clk, unsigned long rate);
+
 /**
  * clk_set_rate - set the clock rate for a clock source
  * @clk: clock source
@@ -1078,6 +1088,11 @@ static inline unsigned long clk_get_rate(struct clk *clk)
 	return 0;
 }
 
+static inline int clk_determine_rate(struct clk *clk, unsigned long rate)
+{
+	return 0;
+}
+
 static inline int clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;
-- 
2.34.1

