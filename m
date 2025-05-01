Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD91362
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110932; cv=none; b=fzC9Jynnlyn+gWyMkp8XuWlqCiJ3Cyr4BF+E0D8JXUuWPaPGim3kwPXg9aqpvyTqCdAZp4QgDB5/czpnGzVS+zLkMiHPaFLW7ClOplT8tYvQfVMMUWSa4rq8fUI4Xh3DxJC3S9ofUnzZ3PyZDNp8y2lXaOD5dAoTMmGy9sicDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110932; c=relaxed/simple;
	bh=5VDGG4Tt6ixGcUUnWvgYGQSqlfsjXSh3OAgUpU7Jd84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qVdU1tlSKgeNeivJMCj8SLMQXiHTqd6k85CGOOpzK4TTiJFOlWFdPLDOMu8Jlm10lSVIaIDIRIIkpSGJ0J18IXrmJLvcrGQCDCHMjAfJvo4YRDjADTsSKQReKixsHfdCUosjjj68nS8JhF3Q50ihtcW/S5pnSTNE3w7xLSgZtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=YTxro/Qd; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="YTxro/Qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746110920; x=1746370120;
	bh=FaAaZncVGNvh1jWa2RrUNW5wqXclNgOASqEPn4kYyLk=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector:List-Unsubscribe:
	 List-Unsubscribe-Post;
	b=YTxro/QdcNqmljA5zxs0WnrYclBi9WgX8/Uv3u1ylDjfVMuZ1/U6z7xJOeyEuEYfT
	 kkb/BGQ7AB44F6Ix76YD8y+uR8bYJc2EM/liWnl/OtwDSTR9t2llAfoo7mNVe9btQ6
	 fk9N1yrHEAe0tWFOa7XSB14TbalFY8RJzq6O5T9A03iMbhY9wPI0e3xpCzRiIVWTrS
	 vTF2eM1gD2GZXqtZiX1uya6DtmcUx1MKvMmJFh1+ziAvICSekHOTh7o1UT+VLBmqG9
	 kDb8iEFddYEb1RTeztUNyzMBuD4zNkQHKDMRUK/LQE9oI+vb0fnTkuY2FTV0oTlov5
	 rZCRhWg4QcW0Q==
X-Pm-Submission-Id: 4ZpH464345zLc
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 01 May 2025 16:48:35 +0200
Subject: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
X-B4-Tracking: v=1; b=H4sIAMKJE2gC/x3MPQqAMAxA4atIZgONf1WvIg5qo2ap0kgRxLtbH
 L/hvQeUg7BCnz0QOIrK4RMoz2DZJ78xikuGwhS1qQ3h7Cy1t0X1UTGw8oXUNq4rq7m0C0EKz8C
 r3P90GN/3A1gXr8NkAAAA
X-Change-ID: 20250501-bd718x7-snvs-reset-186d934b37c1
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746110918; l=3238;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=5VDGG4Tt6ixGcUUnWvgYGQSqlfsjXSh3OAgUpU7Jd84=;
 b=SlKa5oEQLOEmdDUW5mygrV8YoSdFzZYP6gFouZY5qA6CzxKqM3hqvol387ghLr1LyAWPxzDq8
 5BSgx+dMWA0CGBbUj9Onc7co+x90qI+LMJO5rLxpwOtqhjGaulsmV80
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

With the introduction of the rohm,reset-snvs-powered DT binding [2], the
PMIC settings were only changed when the new property was not found.

As mentioned in [1] the default for BD71387 and BD71847 is to switch to
SNVS power state on watchdog reset.

So even with rohm,reset-snvs-powered added to DT, a watchdog reset causes
transitions through READY instead of SNVS. And with the default reboot
method in mxc_restart() is to cause a watchdog reset, we ended up powering
off the SNVS domains, and thus losing SNVS state such as SNVS RTC and
LPGPR, on reboots.

With this change, the rohm,reset-snvs-powered property results in the PMIC
configuration being modified so POWEROFF transitions to SNVS for all reset
types, including watchdog reset.

[1] commit e770b18bbbae ("regulator: bd718x7: Change next state after poweroff to ready")
[2] commit 049369d46428 ("regulator: bd718x7: Support SNVS low power state")

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/regulator/bd718x7-regulator.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index 1bb048de3ecd5a8df1087a48afc728a64623a024..d8c7fb2e73986a39066c9e8a114dd8d733bc8a33 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -1715,23 +1715,24 @@ static int bd718xx_probe(struct platform_device *pdev)
 					 "rohm,reset-snvs-powered");
 
 	/*
-	 * Change the next stage from poweroff to be READY instead of SNVS
-	 * for all reset types because OTP loading at READY will clear SEL
-	 * bit allowing HW defaults for power rails to be used
+	 * Set next power state from poweroff to be either READY or SNVS for all
+	 * reset types. The default is READY state because OTP loading at READY
+	 * will clear SEL bit allowing HW defaults for power rails to be used.
+	 * Using SNVS power state instead allows SNVS state, such as RTC and
+	 * LPGPR to be persisted over reboots.
 	 */
-	if (!use_snvs) {
-		err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
-					 BD718XX_ON_REQ_POWEROFF_MASK |
-					 BD718XX_SWRESET_POWEROFF_MASK |
-					 BD718XX_WDOG_POWEROFF_MASK |
-					 BD718XX_KEY_L_POWEROFF_MASK,
-					 BD718XX_POWOFF_TO_RDY);
-		if (err)
-			return dev_err_probe(&pdev->dev, err,
-					     "Failed to change reset target\n");
-
-		dev_dbg(&pdev->dev, "Changed all resets from SVNS to READY\n");
-	}
+	err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
+				 BD718XX_ON_REQ_POWEROFF_MASK |
+				 BD718XX_SWRESET_POWEROFF_MASK |
+				 BD718XX_WDOG_POWEROFF_MASK |
+				 BD718XX_KEY_L_POWEROFF_MASK,
+				 use_snvs ? 0 : BD718XX_POWOFF_TO_RDY);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "Failed to change reset target\n");
+
+	dev_dbg(&pdev->dev, "Changed all resets from %s to %s\n",
+		use_snvs ? "READY" : "SNVS", use_snvs ? "SNVS" : "READY");
 
 	config.dev = pdev->dev.parent;
 	config.regmap = regmap;

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250501-bd718x7-snvs-reset-186d934b37c1

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

