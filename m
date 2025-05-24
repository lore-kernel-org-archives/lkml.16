Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33321EEA5D
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748103125; cv=none; b=A7xcbayZcrTuaOuFxW8u53LyIgwcnZaZ+cVGFqiBf2aHZS06ZzERtfAI226+GL5UpdSJWfHq2/JAz2+R3VEf9e+QbDpzgDH2k8x7tC3fs0f+bd/f/oP4bKM3cXl9w0Oc1j725yOvPUkL+8aYXjfjZjGEf9TnVjgYzUKr5RjT1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748103125; c=relaxed/simple;
	bh=MFb/QiWyLDUm78aMKEfxoK1mzgM/wr/cRwi7aM35eiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+WWQS/CxfUaLOQKamEfxj4Ms90wnRyh5TUKkR1sujQIqCg6xhmOVRg/8MLbB3H4X7bAi+BlYvIdTRZ1T1S4TxXHg1PAQkNYjaWv0tXB5rig8EJPX1fOY2n5U6fjWLJdYS7UErdiSd3j/or08r5bchefKBrQBb/UEhqGJq5Zc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=EDPSfmk8; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EDPSfmk8"
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id IrSUuI1zk7nctIrSUuJnW5; Sat, 24 May 2025 18:10:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748103051;
	bh=bvxyCYtpvBuLxyyPBVFxUFFbUBuGFb/ODhJ+wj6k5Cg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=EDPSfmk8gZx+oHEAzvOklA4Tpze4LfxE/aQxKeSnP8RNY37EHpGzdXmgLBZGrG3kO
	 6ElSA3x6+OAnRRMmbX07INMdTbJiysrQXT/yWgrDJ/0FwJ8OHGBu8n9Q6BWCSuqTMk
	 uEtWrh4iedjeUfy4O4aP79jXxD3T6E8D4LIECWlrKTzTzbDZAu5Zus5McvQWp7aEeg
	 c/g+OvkfzXF46iLbeQ/48PVeU3WjVfWCadLErVw91UxubFiNRJ8sbbg+eWiPuzxKQw
	 AmEmqXYNj3D8+/wHol+JWJ+zaA3h/h40E5Km/oGG8TwtIb5Rsf3VVBMoJuQeU5dmf3
	 VqucCNuMdTyZA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 May 2025 18:10:51 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] regulator: tps6594-regulator: Constify struct tps6594_regulator_irq_type
Date: Sat, 24 May 2025 18:10:38 +0200
Message-ID: <1446fb1938f3f38115be3e53f5dda3c8bb0ba5a1.1748103005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct tps6594_regulator_irq_type' are not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  25645	  14480	     64	  40189	   9cfd	drivers/regulator/tps6594-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  27949	  12176	     64	  40189	   9cfd	drivers/regulator/tps6594-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/regulator/tps6594-regulator.c | 60 +++++++++++++--------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index ac53792e3fed..0193efb5dffa 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -56,7 +56,7 @@ struct tps6594_regulator_irq_type {
 	unsigned long event;
 };
 
-static struct tps6594_regulator_irq_type tps6594_ext_regulator_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_ext_regulator_irq_types[] = {
 	{ TPS6594_IRQ_NAME_VCCA_OV, "VCCA", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_VCCA_UV, "VCCA", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_VMON1_OV, "VMON1", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
@@ -69,7 +69,7 @@ static struct tps6594_regulator_irq_type tps6594_ext_regulator_irq_types[] = {
 	  REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 };
 
-static struct tps6594_regulator_irq_type tps65224_ext_regulator_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_ext_regulator_irq_types[] = {
 	{ TPS65224_IRQ_NAME_VCCA_UVOV, "VCCA", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 	{ TPS65224_IRQ_NAME_VMON1_UVOV, "VMON1", "voltage out of range",
@@ -80,13 +80,13 @@ static struct tps6594_regulator_irq_type tps65224_ext_regulator_irq_types[] = {
 
 struct tps6594_regulator_irq_data {
 	struct device *dev;
-	struct tps6594_regulator_irq_type *type;
+	const struct tps6594_regulator_irq_type *type;
 	struct regulator_dev *rdev;
 };
 
 struct tps6594_ext_regulator_irq_data {
 	struct device *dev;
-	struct tps6594_regulator_irq_type *type;
+	const struct tps6594_regulator_irq_type *type;
 };
 
 #define TPS6594_REGULATOR(_name, _of, _id, _type, _ops, _n, _vr, _vm, _er, \
@@ -262,7 +262,7 @@ static const struct regulator_desc tps65224_buck_regs[] = {
 			  4, 0, 0, NULL, 0, 0),
 };
 
-static struct tps6594_regulator_irq_type tps6594_buck1_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_buck1_irq_types[] = {
 	{ TPS6594_IRQ_NAME_BUCK1_OV, "BUCK1", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_BUCK1_UV, "BUCK1", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_BUCK1_SC, "BUCK1", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -270,7 +270,7 @@ static struct tps6594_regulator_irq_type tps6594_buck1_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_buck2_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_buck2_irq_types[] = {
 	{ TPS6594_IRQ_NAME_BUCK2_OV, "BUCK2", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_BUCK2_UV, "BUCK2", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_BUCK2_SC, "BUCK2", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -278,7 +278,7 @@ static struct tps6594_regulator_irq_type tps6594_buck2_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_buck3_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_buck3_irq_types[] = {
 	{ TPS6594_IRQ_NAME_BUCK3_OV, "BUCK3", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_BUCK3_UV, "BUCK3", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_BUCK3_SC, "BUCK3", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -286,7 +286,7 @@ static struct tps6594_regulator_irq_type tps6594_buck3_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_buck4_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_buck4_irq_types[] = {
 	{ TPS6594_IRQ_NAME_BUCK4_OV, "BUCK4", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_BUCK4_UV, "BUCK4", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_BUCK4_SC, "BUCK4", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -294,7 +294,7 @@ static struct tps6594_regulator_irq_type tps6594_buck4_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_buck5_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_buck5_irq_types[] = {
 	{ TPS6594_IRQ_NAME_BUCK5_OV, "BUCK5", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_BUCK5_UV, "BUCK5", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_BUCK5_SC, "BUCK5", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -302,7 +302,7 @@ static struct tps6594_regulator_irq_type tps6594_buck5_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_ldo1_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_ldo1_irq_types[] = {
 	{ TPS6594_IRQ_NAME_LDO1_OV, "LDO1", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_LDO1_UV, "LDO1", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_LDO1_SC, "LDO1", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -310,7 +310,7 @@ static struct tps6594_regulator_irq_type tps6594_ldo1_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_ldo2_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_ldo2_irq_types[] = {
 	{ TPS6594_IRQ_NAME_LDO2_OV, "LDO2", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_LDO2_UV, "LDO2", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_LDO2_SC, "LDO2", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -318,7 +318,7 @@ static struct tps6594_regulator_irq_type tps6594_ldo2_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_ldo3_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_ldo3_irq_types[] = {
 	{ TPS6594_IRQ_NAME_LDO3_OV, "LDO3", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_LDO3_UV, "LDO3", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_LDO3_SC, "LDO3", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -326,7 +326,7 @@ static struct tps6594_regulator_irq_type tps6594_ldo3_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps6594_ldo4_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps6594_ldo4_irq_types[] = {
 	{ TPS6594_IRQ_NAME_LDO4_OV, "LDO4", "overvoltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ TPS6594_IRQ_NAME_LDO4_UV, "LDO4", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
 	{ TPS6594_IRQ_NAME_LDO4_SC, "LDO4", "short circuit", REGULATOR_EVENT_REGULATION_OUT },
@@ -334,42 +334,42 @@ static struct tps6594_regulator_irq_type tps6594_ldo4_irq_types[] = {
 	  REGULATOR_EVENT_OVER_CURRENT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_buck1_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_buck1_irq_types[] = {
 	{ TPS65224_IRQ_NAME_BUCK1_UVOV, "BUCK1", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_buck2_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_buck2_irq_types[] = {
 	{ TPS65224_IRQ_NAME_BUCK2_UVOV, "BUCK2", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_buck3_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_buck3_irq_types[] = {
 	{ TPS65224_IRQ_NAME_BUCK3_UVOV, "BUCK3", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_buck4_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_buck4_irq_types[] = {
 	{ TPS65224_IRQ_NAME_BUCK4_UVOV, "BUCK4", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_ldo1_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_ldo1_irq_types[] = {
 	{ TPS65224_IRQ_NAME_LDO1_UVOV, "LDO1", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_ldo2_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_ldo2_irq_types[] = {
 	{ TPS65224_IRQ_NAME_LDO2_UVOV, "LDO2", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type tps65224_ldo3_irq_types[] = {
+static const struct tps6594_regulator_irq_type tps65224_ldo3_irq_types[] = {
 	{ TPS65224_IRQ_NAME_LDO3_UVOV, "LDO3", "voltage out of range",
 	  REGULATOR_EVENT_REGULATION_OUT },
 };
 
-static struct tps6594_regulator_irq_type *tps6594_bucks_irq_types[] = {
+static const struct tps6594_regulator_irq_type *tps6594_bucks_irq_types[] = {
 	tps6594_buck1_irq_types,
 	tps6594_buck2_irq_types,
 	tps6594_buck3_irq_types,
@@ -377,21 +377,21 @@ static struct tps6594_regulator_irq_type *tps6594_bucks_irq_types[] = {
 	tps6594_buck5_irq_types,
 };
 
-static struct tps6594_regulator_irq_type *tps6594_ldos_irq_types[] = {
+static const struct tps6594_regulator_irq_type *tps6594_ldos_irq_types[] = {
 	tps6594_ldo1_irq_types,
 	tps6594_ldo2_irq_types,
 	tps6594_ldo3_irq_types,
 	tps6594_ldo4_irq_types,
 };
 
-static struct tps6594_regulator_irq_type *tps65224_bucks_irq_types[] = {
+static const struct tps6594_regulator_irq_type *tps65224_bucks_irq_types[] = {
 	tps65224_buck1_irq_types,
 	tps65224_buck2_irq_types,
 	tps65224_buck3_irq_types,
 	tps65224_buck4_irq_types,
 };
 
-static struct tps6594_regulator_irq_type *tps65224_ldos_irq_types[] = {
+static const struct tps6594_regulator_irq_type *tps65224_ldos_irq_types[] = {
 	tps65224_ldo1_irq_types,
 	tps65224_ldo2_irq_types,
 	tps65224_ldo3_irq_types,
@@ -516,11 +516,11 @@ static irqreturn_t tps6594_regulator_irq_handler(int irq, void *data)
 static int tps6594_request_reg_irqs(struct platform_device *pdev,
 				    struct regulator_dev *rdev,
 				    struct tps6594_regulator_irq_data *irq_data,
-				    struct tps6594_regulator_irq_type *regs_irq_types,
+				    const struct tps6594_regulator_irq_type *regs_irq_types,
 				    size_t interrupt_cnt,
 				    int *irq_idx)
 {
-	struct tps6594_regulator_irq_type *irq_type;
+	const struct tps6594_regulator_irq_type *irq_type;
 	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
 	size_t j;
 	int irq;
@@ -558,8 +558,8 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = {};
 	struct tps6594_regulator_irq_data *irq_data;
 	struct tps6594_ext_regulator_irq_data *irq_ext_reg_data;
-	struct tps6594_regulator_irq_type *irq_type;
-	struct tps6594_regulator_irq_type *irq_types;
+	const struct tps6594_regulator_irq_type *irq_type;
+	const struct tps6594_regulator_irq_type *irq_types;
 	bool buck_configured[BUCK_NB] = { false };
 	bool buck_multi[MULTI_PHASE_NB] = { false };
 
@@ -573,9 +573,9 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	unsigned int irq_count;
 	unsigned int multi_phase_cnt;
 	size_t reg_irq_nb;
-	struct tps6594_regulator_irq_type **bucks_irq_types;
+	const struct tps6594_regulator_irq_type **bucks_irq_types;
 	const struct regulator_desc *multi_regs;
-	struct tps6594_regulator_irq_type **ldos_irq_types;
+	const struct tps6594_regulator_irq_type **ldos_irq_types;
 	const struct regulator_desc *ldo_regs;
 	size_t interrupt_count;
 
-- 
2.49.0

