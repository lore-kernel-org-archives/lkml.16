Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212A1ACEAC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446691; cv=none; b=VmBxvRvziG2Xsq6x1DaiHSGOxrDCHJj/iEIDnyLrlHQu5z2itlJB5LAl1PD4+8vZHi1SMY/JGdpD332sx2VJdlytpV4pEW4ml7PDPNbKnq4xIe1AcrY1P6KtqjXZtu570EiuNA1dDt6icR83dpNQaNCSGTxjdXexNj7/1vhh/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446691; c=relaxed/simple;
	bh=0arvIUSifnZxahyQL3PgmRS+MaPEBBGATf2lplycaL4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YQnyJVibGl+EeqR4ER/OeTY6g1pE4g/VpNgpM4JK1n0+USGpNhc4+ZrWcUob5FfNUugoxAHWb+ify1qEpvxa4iS07LKeOwtOCutORtr24PIxvl/e135TzadiieE6nj0ApIcLPJxTYeraUHRnSBUw2MYevHlZzVBC5X88tzxhj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 5 May 2025
 13:59:38 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 5 May 2025 13:59:38 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1uBuTy-008B5T-0u;
	Mon, 05 May 2025 13:59:38 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<frieder.schrempf@kontron.de>, <Frank.Li@nxp.com>, <marex@denx.de>,
	<yibin.gong@nxp.com>, <joy.zou@nxp.com>, <linux-kernel@vger.kernel.org>
CC: <martijn.de.gouw@prodrive-technologies.com>, Paul Geurts
	<paul.geurts@prodrive-technologies.com>
Subject: [PATCH] regulator: pca9450: Add restart handler
Date: Mon, 5 May 2025 13:59:36 +0200
Message-ID: <20250505115936.1946891-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When restarting a CPU powered by the PCA9450 power management IC, it
is beneficial to use the PCA9450 to power cycle the CPU and all its
connected peripherals to start up in a known state. The PCA9450 features
a cold start procedure initiated by an I2C command.

Add a restart handler so that the PCA9450 is used to restart the CPU.
The restart handler sends command 0x14 to the SW_RST register,
initiating a cold reset (Power recycle all regulators except LDO1, LDO2
and CLK_32K_OUT)

As the PCA9450 is a PMIC specific for the i.MX8M family CPU, the restart
handler priority is set just slightly higher than imx2_wdt and the PSCI
restart handler. This makes sure this restart handler takes precedence.

Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
---
 drivers/regulator/pca9450-regulator.c | 27 +++++++++++++++++++++++++++
 include/linux/regulator/pca9450.h     |  5 +++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index a56f3ab754fa..14d19a6d6655 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/reboot.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -33,6 +34,7 @@ struct pca9450 {
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *sd_vsel_gpio;
+	struct notifier_block restart_nb;
 	enum pca9450_chip_type type;
 	unsigned int rcnt;
 	int irq;
@@ -965,6 +967,25 @@ static irqreturn_t pca9450_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int pca9450_i2c_restart_handler(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct pca9450 *pca9450 = container_of(nb, struct pca9450, restart_nb);
+	struct i2c_client *i2c = container_of(pca9450->dev, struct i2c_client, dev);
+
+	dev_dbg(&i2c->dev, "Restarting device..\n");
+	if (i2c_smbus_write_byte_data(i2c, PCA9450_REG_SWRST, SW_RST_COMMAND) == 0) {
+		/* tRESTART is 250ms, so 300 should be enough to make sure it happened */
+		mdelay(300);
+		/* When we get here, the PMIC didn't power cycle for some reason. so warn.*/
+		dev_warn(&i2c->dev, "Device didn't respond to restart command\n");
+	} else {
+		dev_err(&i2c->dev, "Restart command failed\n");
+	}
+
+	return 0;
+}
+
 static int pca9450_i2c_probe(struct i2c_client *i2c)
 {
 	enum pca9450_chip_type type = (unsigned int)(uintptr_t)
@@ -1107,6 +1128,12 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 	pca9450->sd_vsel_fixed_low =
 		of_property_read_bool(ldo5->dev.of_node, "nxp,sd-vsel-fixed-low");
 
+	pca9450->restart_nb.notifier_call = pca9450_i2c_restart_handler;
+	pca9450->restart_nb.priority = PCA9450_RESTART_HANDLER_PRIORITY;
+
+	if (register_restart_handler(&pca9450->restart_nb))
+		dev_warn(&i2c->dev, "Failed to register restart handler\n");
+
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
diff --git a/include/linux/regulator/pca9450.h b/include/linux/regulator/pca9450.h
index b427b5873de1..85b4fecc10d8 100644
--- a/include/linux/regulator/pca9450.h
+++ b/include/linux/regulator/pca9450.h
@@ -35,6 +35,8 @@ enum {
 	PCA9450_DVS_LEVEL_MAX,
 };
 
+#define PCA9450_RESTART_HANDLER_PRIORITY 130
+
 #define PCA9450_BUCK1_VOLTAGE_NUM	0x80
 #define PCA9450_BUCK2_VOLTAGE_NUM	0x80
 #define PCA9450_BUCK3_VOLTAGE_NUM	0x80
@@ -235,4 +237,7 @@ enum {
 #define I2C_LT_ON_RUN			0x02
 #define I2C_LT_FORCE_ENABLE		0x03
 
+/* PCA9450_REG_SW_RST command */
+#define SW_RST_COMMAND			0x14
+
 #endif /* __LINUX_REG_PCA9450_H__ */
-- 
2.39.2

