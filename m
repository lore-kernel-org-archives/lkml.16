Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91B22F49E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567681; cv=none; b=ViIcz73IF7GfKWerRxTa88tsCyi23aH7VsKIwzOzTvUaDJ9bC9Fo9O8Y2N+FBbQumEkurn9yejRp3GeoWhyV3WYMZ6rnhnZv+aCJaX3np0pZLE7JqXHU8zMGfSHTxPyhH/6EnVGy0z1Hv6QBv3rzIPG4v/eg2JUsxpko3AuqKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567681; c=relaxed/simple;
	bh=/JRkipVnBK9Drt2hP4/cbR8GiKLEjC3gcVaZiCjT3z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKXi8QAR6iGZcJSNEDOK18M2PHiUpRx6OVI1k1MxkPk6fXNle8bkFk9lqJovA++0+O6j8SpYRz4lJACTYPYcCf1V91MsF/PpXcUavfukysDUjJhT5CmbEcHCNZjPem7SDx8Er/Nriq04H8EOEOcCLEcWhHBw79qbA4xjyM32jjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxeUb33w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxeUb33w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7B3C4CEED;
	Thu,  3 Jul 2025 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567681;
	bh=/JRkipVnBK9Drt2hP4/cbR8GiKLEjC3gcVaZiCjT3z8=;
	h=From:To:Cc:Subject:Date:From;
	b=NxeUb33whrk5EzaSJwmKEH8wcdJTqVyNHE3M1yKSY9V8RJw4JK9VL+v03k4pvje0e
	 mbS2u1j5HMfoZGq3zx0AomoLQB55xV8pikQbLOZgKjlzDxrzr4n7dnbHHxR7NAa3pX
	 sRZ6i2kDlz4dAirEqhHviaoL+k3Mwgdanv0u/OXT26YPOsXteOfueIUlftprtUQF1A
	 rDGC6UAJfcp2J+Ai2EetY+5eBAjON/16Xhw79GWutgB8SyDP4C060MrbhCE33KyU6s
	 Qtql0u6pirAO7P8mHjksgW5o3wzFPpWsYFHQysw3jk7BQZW2TmHBrPY4E1kVbHHFYM
	 3f0lY48uERv9Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fsi: master-ast-cf: Use of_reserved_mem_region_to_resource for "memory-region"
Date: Thu,  3 Jul 2025 13:34:38 -0500
Message-ID: <20250703183439.2073555-1-robh@kernel.org>
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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/fsi/fsi-master-ast-cf.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index 9f2fd444ceb6..e67d7cd30fca 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -13,13 +13,13 @@
 #include <linux/irqflags.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
 #include <linux/firmware.h>
 #include <linux/gpio/aspeed.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_address.h>
 #include <linux/genalloc.h>
 
 #include "fsi-master.h"
@@ -1285,14 +1285,7 @@ static int fsi_master_acf_probe(struct platform_device *pdev)
 	master->gpio_mux = gpio;
 
 	/* Grab the reserved memory region (use DMA API instead ?) */
-	np = of_parse_phandle(mnode, "memory-region", 0);
-	if (!np) {
-		dev_err(&pdev->dev, "Didn't find reserved memory\n");
-		rc = -EINVAL;
-		goto err_free;
-	}
-	rc = of_address_to_resource(np, 0, &res);
-	of_node_put(np);
+	rc = of_reserved_mem_region_to_resource(mnode, 0, &res);
 	if (rc) {
 		dev_err(&pdev->dev, "Couldn't address to resource for reserved memory\n");
 		rc = -ENOMEM;
-- 
2.47.2

