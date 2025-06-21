Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CC30E842
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501903; cv=none; b=RoonS6XvAOmQdZK/8rW1518VOdKlhEcANOscsZW9arsWhvaQZiiXDraCtfndUtVc82WeSK7uuZz5m0v353PhNdoTQw6iLcpYhTpYCAycyasnS2aNQRpu+LUkZPYbu1WZUOxnOwm7deSMqrdTLIQ6/Uh+9KZ1kT/8r9DGPhacH0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501903; c=relaxed/simple;
	bh=B6berukrUY7atvfgg8Oi6KVv1rAM7ebSCspc5Xr/FaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1BZxtnBf1SefE39XcYm7fQ+G8OJOYfXoR/KUAFjdaYP20iu+PKmgxwRQHYKINf1aP27RiWRxeqdNKvKdPAqhnv+k0zwDMRhX7l0YA7X7CXB8hq5DJmqx2x1NEaRTj3LEjJYXltzSorj1ymBELCGCAJq9uYj+M2DOf2izwHGVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=a81aLC9a; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="a81aLC9a"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id SvUQuoKOu1trMSvUQuSbjP; Sat, 21 Jun 2025 12:30:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750501827;
	bh=srPzhV0CtF12Fq8y9js6136ymbzjkGO8KLu1ECLK52o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a81aLC9aAZYGXvyOMqlWMXUB9cAxxmFWkkKn2No65hRc5jeFifrak6fSookrFvPwj
	 wn4Fk9+wHSPlNL5endEkyzw7MKIfsD4q5W0HjRFEwTrtIUAzTkwOassgFnfG2i0Z2W
	 ocB05EEei2i6AgWQQmc1dMSA1xj5SzvTqzVXewRunxNbEAfpGC07g+uB4spk5xm6Ov
	 Pi4u666p7C+F3PRlmaYiPmawLk1p/VrUWa+hwQunhzV5qc4elEqRH4fagK9HEoxzYj
	 a/pMFkONcj9BFzjzXmP6rghtDU7hL/vehrj4laCOr+ezjgSvcX7ShFDK2Hiiw7XWTU
	 V7Ug2d9NLLJ3g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Jun 2025 12:30:27 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] mfd: rohm-bd71828: Constify some structures
Date: Sat, 21 Jun 2025 12:28:38 +0200
Message-ID: <037e28e587ae899da9acdb45c606d75ec61f858b.1750501700.git.christophe.jaillet@wanadoo.fr>
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
  18321	  13952	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22897	   9376	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Compile tested only

Changes in v2:
  - Rebase with latest -next because part of this patch was already
    submitted by someone else, and applied
  - Update the numbers accordingly
  - Add R-b tag. (v2 is the same as v1, without hunk 5 which has already
    been applied)

v1: https://lore.kernel.org/all/d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/rohm-bd71828.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 47e574a57077..a14b7aa69c3c 100644
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

