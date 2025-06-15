Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96D472626
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750005250; cv=none; b=SXdS7UiY9FL3kQanIF+NXmtR5yS0nnLsvBWCor2NxHLsXaysA+nZBJA+pIfg5dUrncOD0yE0LPKzmu5nZ9FzOIUqomfMg750ihyE3Kgxs1E+K7FCqLRDpF0H5UIMymPNp3/IU7TTI7ChGwPDYOb5uE7GTEkIn6zrkwdMfwuOd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750005250; c=relaxed/simple;
	bh=aZrUvftQkwfdswore173HVSqDEMjqoa2Nw9jB7a4m+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jpiUjbnHfAqHbUTTRsePuoTa2Lcaf0OFVhMIpZjHgW6ZgYg2D/DyB33kyArFKP0ctgO2cVNuUzb8BZal0EiAumUVFTlzyUrwbCtZzqUUDv2D/h84WoFAXNagheogGJhXf/nZpsjK/dR9S4KBIjStmgeVvS15hCjpPUjoYARcr78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UqGLYxBg; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UqGLYxBg"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id QqHvuAgPNP9oMQqHvuTeXS; Sun, 15 Jun 2025 18:32:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750005175;
	bh=4/7TZBV4Gwj9uyaVbO94LaGTX+fSWVMyARFqxZhD/ww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UqGLYxBgdrgRIeCB90+vy+1pI702NywOYWus4amQxFeiAgrAzDLpuRZDQgr1u9E+l
	 gPiAjL1QX04ET67Fm+J0LqoU+N9yHk8j5g0BMUwk5BGKcCixKYUFNzBYY4Nlb3VXN8
	 aiUmZl7CMayPV06rlDFSjBsJv/SkWDyhIawI2KTKVu1prm7LFypJP+2Tlndh39SACV
	 Ev2En01zQy1tXKqDJCjjDSbUSGtx9XZPEdvWEidYI+lSfaBw78Pbtk/5KT+2QB5zLL
	 6TImbXNansvfvUhh1gmrU+gilxRWmi9XgapJAFmD1vckIpJE3PXqcQFFzlO6NnmKhC
	 orYFg8rbq86MQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Jun 2025 18:32:55 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mfd: rohm-bd71828: Constify some structures
Date: Sun, 15 Jun 2025 18:32:48 +0200
Message-ID: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several structures are not modified in this driver. Constifying them moves
some data to a read-only section, so increases overall security, especially
when the structure holds some function pointers. This is the case for
'gpio_keys_platform_data' and 'mfd_cell'.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  18161	  14112	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22897	   9376	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/mfd/rohm-bd71828.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 738d8b3b9ffe..a14b7aa69c3c 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -25,7 +25,7 @@ static struct gpio_keys_button button = {
 	.type = EV_KEY,
 };
 
-static struct gpio_keys_platform_data bd71828_powerkey_data = {
+static const struct gpio_keys_platform_data bd71828_powerkey_data = {
 	.buttons = &button,
 	.nbuttons = 1,
 	.name = "bd71828-pwrkey",
@@ -43,7 +43,7 @@ static const struct resource bd71828_rtc_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd70528-rtc-alm-2"),
 };
 
-static struct resource bd71815_power_irqs[] = {
+static const struct resource bd71815_power_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_RMV, "bd71815-dcin-rmv"),
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_OUT, "bd71815-clps-out"),
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_IN, "bd71815-clps-in"),
@@ -93,7 +93,7 @@ static struct resource bd71815_power_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_HI_DET, "bd71815-bat-hi-det"),
 };
 
-static struct mfd_cell bd71815_mfd_cells[] = {
+static const struct mfd_cell bd71815_mfd_cells[] = {
 	{ .name = "bd71815-pmic", },
 	{ .name = "bd71815-clk", },
 	{ .name = "bd71815-gpo", },
@@ -109,7 +109,7 @@ static struct mfd_cell bd71815_mfd_cells[] = {
 	},
 };
 
-static struct mfd_cell bd71828_mfd_cells[] = {
+static const struct mfd_cell bd71828_mfd_cells[] = {
 	{ .name = "bd71828-pmic", },
 	{ .name = "bd71828-gpio", },
 	{ .name = "bd71828-led", .of_compatible = "rohm,bd71828-leds" },
@@ -223,7 +223,7 @@ static unsigned int bit5_offsets[] = {3};		/* VSYS IRQ */
 static unsigned int bit6_offsets[] = {1, 2};		/* DCIN IRQ */
 static unsigned int bit7_offsets[] = {0};		/* BUCK IRQ */
 
-static struct regmap_irq_sub_irq_map bd718xx_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map bd718xx_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
@@ -493,7 +493,7 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 	const struct regmap_config *regmap_config;
 	const struct regmap_irq_chip *irqchip;
 	unsigned int chip_type;
-	struct mfd_cell *mfd;
+	const struct mfd_cell *mfd;
 	int cells;
 	int button_irq;
 	int clkmode_reg;
-- 
2.49.0

