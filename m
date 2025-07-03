Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A32F362F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567713; cv=none; b=HwO2AoCPG/YSLEzI0TyHmsKO50DAsbw8tpRzNyC0HR4s9ebD4gX2LStMPraxUPey0hBs1hwsr9GiG9Z656ivGP2ixY6fyXw4EfOwx6Q+f4xXmddESwaL9ttuCb0ku2eLASbdz0rJWNj1X7i0vzU1gPhIkzpH1MRDz5wuwrpDwR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567713; c=relaxed/simple;
	bh=g2Jp3nFdzDCpqkTRi8VIAw0hMS6wPtk21mPBmhu++tY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtacxPlbdOK2J/k+Iw4fZCfg/N0+Wjooghspm/Di04OsL8cftGzysn6MtKSlos9az6Mkt/rVHoewLmmosVElWoOYc76+awHWbKobi1vPMcx1FJbSSbIvlCmPw5ADjb0JXNt7QyW+q1H34dSr9RtAPwD2/wxRb3TT4i/SIjIl5fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUzjlcwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUzjlcwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD4AC4CEE3;
	Thu,  3 Jul 2025 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567713;
	bh=g2Jp3nFdzDCpqkTRi8VIAw0hMS6wPtk21mPBmhu++tY=;
	h=From:To:Cc:Subject:Date:From;
	b=RUzjlcwoLNijbmZtgaC063oZlSftT7OSR304vJ9hQCLhQ2N7gpBcQugMFgMqt+Yw8
	 K0LHrYDwbktvSF8uFo7QgTyp+FqIsgQxyJYXlxCXumvxcgO66j3jGYMGwgJ5bEWxQh
	 YkDA9rcwST1+/KaSOXbpWehG/bBuswMqtL4k1+4uE0tIbI7UjWa36WMpRurUt6JNAX
	 J13miDVT7bMAWypLXEhgcMU0O9+pgPcBRpGq8VzNSL5HOGaXu3MzU6IGEPJjGIBG3F
	 8EECS6h72sov1okm2KGFkgHYYVLPhg6jjk+EkRQ1uB3u1OBNlxwsY7+FlItcfocorJ
	 bfuhlI35Ki8qw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: aspeed: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:07 -0500
Message-ID: <20250703183508.2074735-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The error handling is a bit different. "memory-region" is optional, so
failed lookup is not an error. But then an error in
of_address_to_resource() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 14 +++-----------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c | 14 +++-----------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index ee58151bd69e..b7dbb12bd095 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/regmap.h>
@@ -254,17 +255,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, lpc_ctrl);
 
 	/* If memory-region is described in device tree then store */
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_dbg(dev, "Didn't find reserved memory\n");
-	} else {
-		rc = of_address_to_resource(node, 0, &resm);
-		of_node_put(node);
-		if (rc) {
-			dev_err(dev, "Couldn't address to resource for reserved memory\n");
-			return -ENXIO;
-		}
-
+	rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
+	if (!rc) {
 		lpc_ctrl->mem_size = resource_size(&resm);
 		lpc_ctrl->mem_base = resm.start;
 
diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index 6cc943744e12..3be2e1b1085b 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -19,7 +19,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -334,7 +334,6 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
 	struct aspeed_p2a_ctrl *misc_ctrl;
 	struct device *dev;
 	struct resource resm;
-	struct device_node *node;
 	int rc = 0;
 
 	dev = &pdev->dev;
@@ -346,15 +345,8 @@ static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
 	mutex_init(&misc_ctrl->tracking);
 
 	/* optional. */
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node) {
-		rc = of_address_to_resource(node, 0, &resm);
-		of_node_put(node);
-		if (rc) {
-			dev_err(dev, "Couldn't address to resource for reserved memory\n");
-			return -ENODEV;
-		}
-
+	rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
+	if (!rc) {
 		misc_ctrl->mem_size = resource_size(&resm);
 		misc_ctrl->mem_base = resm.start;
 	}
-- 
2.47.2

