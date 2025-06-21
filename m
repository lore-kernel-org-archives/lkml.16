Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E3214A60F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530734; cv=none; b=uaX6T6ok6a8c3D2jVi/Vdu8fbk8bV0QYfKhmpe6duLtfBoO0unSAKpeRR+y97wAsC0OOyeDciT9cjBuPbb6VJr4y2mvJCNtUgVtWNWgGl6ACKb6pp7FBlEp6gFKbZb3PsvpL6vmh6dMBelYTI+IcK711ZisURqFZAowISXMyxgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530734; c=relaxed/simple;
	bh=WVnYIFa63uiGOCx2VEQbSpu9pTWrHGmvrDMQ6LUov3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcVb9PIXlJnPo3JEiBVaE78y6OOdpWcni1x+aq9uS+NuGZ/07Xyz4Lz11Eaf91lrqUtpLNQUZkb/CxPfrHw5R1vslKkT+s0k6xMa/VI1Vke2Iwfb/TV9FlkXpsb+uXnKAzk+skaviBtqGE5k6PqEJztLqOhTS0SOwmYJE9det9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SpQ+NVM8; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SpQ+NVM8"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id T2zVuhhN4FSdZT2zVuu0sv; Sat, 21 Jun 2025 20:31:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750530662;
	bh=UXRtBefO6UIaMrLklwTYumn3o6AqhMnr9ggp+fc1rNA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SpQ+NVM8EQ5zPnZkDO5XdYE4ENwvLFXcyAaVbmZlyPwgJflClkvx0SEKBSR0TUP/r
	 kwkAw/s6WXmk+L50sJk3VpMfChAkhxFT//gWtB++riUKoPJWLCcN20QdhpanNwUzkt
	 tGj8zhJlGNkxjfm7KkL1OV2VBRneqgm4SL5LFehdDtYtDSbjtuhbpcaNrQ1sHL8sHJ
	 Vl1OpsCE1nTme63Mt2mRTJ884/iZo+oHf+t95qC+lYNukLqgXIX/+IynhX6MAOadfj
	 dOCRc86o7exUJSLfTN/cV/BaHSWhKeJW305OI2/3CVXV/tQQDE+j4sDyeJyketxOuw
	 D7d7wy22cWWsA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Jun 2025 20:31:02 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/3] mfd: tps65219: Remove an unused field from 'struct tps65219'
Date: Sat, 21 Jun 2025 20:30:51 +0200
Message-ID: <8a264c3a92b8e62c1dadd374f2685030e042eb08.1750530460.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
References: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3df4c6367520 ("mfd: tps65219: Add support for soft shutdown
via sys-off API"), the 'nb' field from 'struct tps65219' is unused.
Remove it.

Also remove the now useless #include <linux/notifier.h> for the same
reason.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - No change

v1: https://lore.kernel.org/all/1f5e2e582ad97e9863ed5885266ae271f2be32bc.1749998382.git.christophe.jaillet@wanadoo.fr/
---
 include/linux/mfd/tps65219.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 3e8d29189267..690002932377 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -10,7 +10,6 @@
 #define MFD_TPS65219_H
 
 #include <linux/bitops.h>
-#include <linux/notifier.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 
@@ -440,7 +439,6 @@ enum tps65219_irqs {
  * @regmap: Regmap for accessing the device registers
  * @chip_id: Chip ID
  * @irq_data: Regmap irq data used for the irq chip
- * @nb: notifier block for the restart handler
  */
 struct tps65219 {
 	struct device *dev;
@@ -448,7 +446,6 @@ struct tps65219 {
 
 	unsigned int chip_id;
 	struct regmap_irq_chip_data *irq_data;
-	struct notifier_block nb;
 };
 
 #endif /* MFD_TPS65219_H */
-- 
2.49.0

