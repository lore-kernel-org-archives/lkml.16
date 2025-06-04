Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE128DF15
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034844; cv=none; b=TjnGm0dK9yrwakEDIhBQADYaLeUv/+J1zBAP55g4MGRRgH56mBSIqu2LFagAsYUcxUv3RsamNGBVG7sYpbBgyOMb1ByQTbis3xsymVdsnAJhunQJpC5xboLCrakSW15LAIPPOAWyMebyb78m8/82Hx9KyBZHJfkq+QMjuqBkOaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034844; c=relaxed/simple;
	bh=v/veQCLfrMcIRAj6dJqLlBlutbTVZR6wTEh4vNB9rjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AtzlArl8lLLvJKsTMDfvXWqdTPlUJ6oUahdSh2bfv0HDqqXUCyGuFfHP2iAISDj1UJXQX2pdy0iqz4WsHfXhb/+vEWK/Dd8jE8XlBgx6hpPKEr1//Iw1UWs1XtaqLP6yb3nxoIL4d/qQknfGd3i/RfR8Ak0GjuyK2mjaMjvXLI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uMlrD-0000Jr-37; Wed, 04 Jun 2025 13:00:31 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uMlrC-001mPi-2B;
	Wed, 04 Jun 2025 13:00:30 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uMlrC-001JDN-1w;
	Wed, 04 Jun 2025 13:00:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 04 Jun 2025 13:00:30 +0200
Subject: [PATCH] clk: scmi: Fix children encountered before parents case
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAE0nQGgC/x2MQQ5AMBAAvyJ7tkk1KviKOFQtNihpRSSNv9u4T
 DJzmASRAlOENksQ6ObIhxcp8gzcYv1MyKM4aKWNqlSJblsxup3RLbyNgTyeVnjhxA+WxtZNoYd
 6sApkcQaS/O+7/n0/xXveK24AAAA=
X-Change-ID: 20250604-clk-scmi-children-parent-fix-45a8912b8ba0
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749034830; l=2736;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=v/veQCLfrMcIRAj6dJqLlBlutbTVZR6wTEh4vNB9rjU=;
 b=p/7n0aM4JHmJA90LjJcorfb/OkVNPqsasWKC6s95WollCc5lkgTOdCrSA0J7PxaGnLV6Ujqk3
 BPOxZ5yBsoACaD1Fsr6qlqo0jsefBvPwUw34LZMz5myarg0YgOSshMj
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

When it comes to clocks with parents the SCMI clk driver assumes that
parents are always initialized before their children which might not
always be the case.

During initialization of the parent_data array we have:

	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];

hws[sclk->info->parents[i]] will not yet be initialized when children
are encountered before their possible parents. Solve this by allocating
all struct scmi_clk as an array first and populating all hws[] upfront.

Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/clk-scmi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 15510c2ff21c0335f5cb30677343bd4ef59c0738..f258ad7dda73e3c50c3ce567a8e22b3d2ec9836b 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -404,6 +404,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
 	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
+	struct scmi_clk *sclks;
 
 	if (!handle)
 		return -ENODEV;
@@ -430,18 +431,24 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
+	sclks = devm_kcalloc(dev, count, sizeof(*sclks), GFP_KERNEL);
+	if (!sclks)
+		return -ENOMEM;
+
 	for (idx = 0; idx < count; idx++) {
-		struct scmi_clk *sclk;
-		const struct clk_ops *scmi_ops;
+		struct scmi_clk *sclk = &sclks[idx];
 
-		sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
-		if (!sclk)
-			return -ENOMEM;
+		hws[idx] = &sclk->hw;
+	}
+
+	for (idx = 0; idx < count; idx++) {
+		struct scmi_clk *sclk = &sclks[idx];
+		const struct clk_ops *scmi_ops;
 
 		sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
 		if (!sclk->info) {
 			dev_dbg(dev, "invalid clock info for idx %d\n", idx);
-			devm_kfree(dev, sclk);
+			hws[idx] = NULL;
 			continue;
 		}
 
@@ -479,13 +486,11 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		if (err) {
 			dev_err(dev, "failed to register clock %d\n", idx);
 			devm_kfree(dev, sclk->parent_data);
-			devm_kfree(dev, sclk);
 			hws[idx] = NULL;
 		} else {
 			dev_dbg(dev, "Registered clock:%s%s\n",
 				sclk->info->name,
 				scmi_ops->enable ? " (atomic ops)" : "");
-			hws[idx] = &sclk->hw;
 		}
 	}
 

---
base-commit: 5abc7438f1e9d62e91ad775cc83c9594c48d2282
change-id: 20250604-clk-scmi-children-parent-fix-45a8912b8ba0

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

