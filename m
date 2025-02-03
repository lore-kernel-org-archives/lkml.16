Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DD20DD48
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605599; cv=none; b=olVmscSmVIrOZBt9IxX+E8sJN5ubeaiByVShTEWNu3Eoh5e8YBakz8TPziRiLFyaA57Eg2nFeIbK7Kor3rwA6/TKNpvDxjMmeQoeIv2HkcO5UkJP/y7zcHSqofiYEciRvBsdLvwpCiQhRYaP/mcOxjiDtjQoIaq2uiGUQCnFFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605599; c=relaxed/simple;
	bh=qshjXtaWsmq+miG75h76yMxhDfdjIeN8Apqeb+d9ZgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1vRt5hHcDUKnh1sNs/HoYry/p1kf6LQH0QVspYjRuGk6N91x/ELDPj9fCd12bEZY2l8NgflXi7fpa8zmHFTCxLcgkNwfHv9sSX0r9t5wb/U2VBV1RnMPzi1FDCY2Vo8ZXdI+oWZB8XIFRj1RpLphsOBHQ7XKNwbsAZnXuH738I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ZiRPJiyf; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ZiRPJiyf"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YmvQz2gV5zlgTxB;
	Mon,  3 Feb 2025 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738605587; x=1741197588; bh=c92Li
	XdgTBYuAqm6pJ8+3ipTJuaazbd+XsyjGXY70Nc=; b=ZiRPJiyf4I4tf0dfqTzJ4
	m8eDRoqZAmhifDXHlnoQ/7Q9Cc87MfHBm7/HEbTugxTc1x0YMiUb2Z1/C8qEdaw6
	xO4YBIhN+SYUVzBhylFZ0d4NcMWOaJD9qqDCSCr9NQQ8d/ooo5lepljO61AixhJo
	A11HdZm5qjUgrsEBsakGN89oaBth1YejLlEyCOtdJhZ7rgnv1hrojSLfIEPSN4pI
	RJr/KPr2l32HQ7OZae4JglpgjyKeT8E+J8paP/2ztLakwClEJovR9etdJqzNN3HO
	E/vt50hSsV6Law8pbnS8gZpZiQiZ6sws0ld6WpBG94xkz12BgZFVx+FHyGqQqReV
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id sE2IHZJojXet; Mon,  3 Feb 2025 17:59:47 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YmvQp4ccvzlgTvy;
	Mon,  3 Feb 2025 17:59:46 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 3/5] irq: Remove irq_set_lockdep_class() and __irq_set_lockdep_class()
Date: Mon,  3 Feb 2025 09:59:37 -0800
Message-ID: <20250203175939.3133477-4-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250203175939.3133477-1-bvanassche@acm.org>
References: <20250203175939.3133477-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The previous patch made __irq_set_lockdep_class() empty. Hence remove thi=
s
function and all its callers.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/powerpc/sysdev/fsl_msi.c             |  5 -----
 drivers/base/regmap/regmap-irq.c          |  4 ----
 drivers/gpio/gpio-bcm-kona.c              |  8 --------
 drivers/gpio/gpio-brcmstb.c               | 10 ----------
 drivers/gpio/gpiolib.c                    |  6 ------
 drivers/gpu/drm/msm/msm_mdss.c            |  3 ---
 drivers/irqchip/irq-renesas-intc-irqpin.c | 11 -----------
 drivers/mfd/arizona-irq.c                 |  5 -----
 drivers/net/dsa/mv88e6xxx/chip.c          |  8 --------
 drivers/pinctrl/pinctrl-at91-pio4.c       |  8 --------
 drivers/pinctrl/pinctrl-single.c          | 11 -----------
 drivers/pinctrl/sunxi/pinctrl-sunxi.c     |  9 ---------
 drivers/spmi/spmi-pmic-arb.c              |  5 -----
 drivers/thermal/qcom/lmh.c                |  7 -------
 include/linux/gpio/driver.h               | 14 --------------
 include/linux/irqdesc.h                   | 10 ----------
 kernel/irq/generic-chip.c                 | 15 ---------------
 kernel/irq/irqdesc.c                      |  8 --------
 18 files changed, 147 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.=
c
index 1aa0cb097c9c..680ab348e636 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -345,9 +345,6 @@ static void fsl_of_msi_remove(struct platform_device =
*ofdev)
 	kfree(msi);
 }
=20
-static struct lock_class_key fsl_msi_irq_class;
-static struct lock_class_key fsl_msi_irq_request_class;
-
 static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_devi=
ce *dev,
 			       int offset, int irq_index)
 {
@@ -366,8 +363,6 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, s=
truct platform_device *dev,
 		dev_err(&dev->dev, "No memory for MSI cascade data\n");
 		return -ENOMEM;
 	}
-	irq_set_lockdep_class(virt_msir, &fsl_msi_irq_class,
-			      &fsl_msi_irq_request_class);
 	cascade_data->index =3D offset;
 	cascade_data->msi_data =3D msi;
 	cascade_data->virq =3D virt_msir;
diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regma=
p-irq.c
index 0bcd81389a29..33ec28e3a802 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -511,16 +511,12 @@ static irqreturn_t regmap_irq_thread(int irq, void =
*d)
 		return IRQ_NONE;
 }
=20
-static struct lock_class_key regmap_irq_lock_class;
-static struct lock_class_key regmap_irq_request_class;
-
 static int regmap_irq_map(struct irq_domain *h, unsigned int virq,
 			  irq_hw_number_t hw)
 {
 	struct regmap_irq_chip_data *data =3D h->host_data;
=20
 	irq_set_chip_data(virq, data);
-	irq_set_lockdep_class(virq, &regmap_irq_lock_class, &regmap_irq_request=
_class);
 	irq_set_chip(virq, &data->irq_chip);
 	irq_set_nested_thread(virq, 1);
 	irq_set_parent(virq, data->irq);
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 5321ef98f442..624a121a64d8 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -503,13 +503,6 @@ static struct of_device_id const bcm_kona_gpio_of_ma=
tch[] =3D {
 	{}
 };
=20
-/*
- * This lock class tells lockdep that GPIO irqs are in a different
- * category than their parents, so it won't report false recursion.
- */
-static struct lock_class_key gpio_lock_class;
-static struct lock_class_key gpio_request_class;
-
 static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 				 irq_hw_number_t hwirq)
 {
@@ -518,7 +511,6 @@ static int bcm_kona_gpio_irq_map(struct irq_domain *d=
, unsigned int irq,
 	ret =3D irq_set_chip_data(irq, d->host_data);
 	if (ret < 0)
 		return ret;
-	irq_set_lockdep_class(irq, &gpio_lock_class, &gpio_request_class);
 	irq_set_chip_and_handler(irq, &bcm_gpio_irq_chip, handle_simple_irq);
 	irq_set_noprobe(irq);
=20
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 491b529d25f8..25d7107a74cb 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -309,14 +309,6 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_=
to_bank(
 	return NULL;
 }
=20
-/*
- * This lock class tells lockdep that GPIO irqs are in a different
- * category than their parents, so it won't report false recursion.
- */
-static struct lock_class_key brcmstb_gpio_irq_lock_class;
-static struct lock_class_key brcmstb_gpio_irq_request_class;
-
-
 static int brcmstb_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 		irq_hw_number_t hwirq)
 {
@@ -334,8 +326,6 @@ static int brcmstb_gpio_irq_map(struct irq_domain *d,=
 unsigned int irq,
 	ret =3D irq_set_chip_data(irq, &bank->gc);
 	if (ret < 0)
 		return ret;
-	irq_set_lockdep_class(irq, &brcmstb_gpio_irq_lock_class,
-			      &brcmstb_gpio_irq_request_class);
 	irq_set_chip_and_handler(irq, &priv->irq_chip, handle_level_irq);
 	irq_set_noprobe(irq);
 	return 0;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..940d3f980457 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1523,7 +1523,6 @@ static int gpiochip_hierarchy_irq_domain_alloc(stru=
ct irq_domain *d,
=20
 	chip_dbg(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
 		  irq, parent_hwirq);
-	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
 	ret =3D irq_domain_alloc_irqs_parent(d, irq, 1, &gpio_parent_fwspec);
 	/*
 	 * If the parent irqdomain is msi, the interrupts have already
@@ -1715,11 +1714,6 @@ static int gpiochip_irq_map(struct irq_domain *d, =
unsigned int irq,
 		return -ENXIO;
=20
 	irq_set_chip_data(irq, gc);
-	/*
-	 * This lock class tells lockdep that GPIO irqs are in a different
-	 * category than their parents, so it won't report false recursion.
-	 */
-	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
 	irq_set_chip_and_handler(irq, gc->irq.chip, gc->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (gc->irq.threaded)
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
index dcb49fd30402..3c6f2e83d0f5 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -125,14 +125,11 @@ static struct irq_chip msm_mdss_irq_chip =3D {
 	.irq_unmask =3D msm_mdss_irq_unmask,
 };
=20
-static struct lock_class_key msm_mdss_lock_key, msm_mdss_request_key;
-
 static int msm_mdss_irqdomain_map(struct irq_domain *domain,
 		unsigned int irq, irq_hw_number_t hwirq)
 {
 	struct msm_mdss *msm_mdss =3D domain->host_data;
=20
-	irq_set_lockdep_class(irq, &msm_mdss_lock_key, &msm_mdss_request_key);
 	irq_set_chip_and_handler(irq, &msm_mdss_irq_chip, handle_level_irq);
=20
 	return irq_set_chip_data(irq, msm_mdss);
diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/=
irq-renesas-intc-irqpin.c
index 954419f2460d..1c57a34bb541 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -315,15 +315,6 @@ static irqreturn_t intc_irqpin_shared_irq_handler(in=
t irq, void *dev_id)
 	return status;
 }
=20
-/*
- * This lock class tells lockdep that INTC External IRQ Pin irqs are in =
a
- * different category than their parents, so it won't report false recur=
sion.
- */
-static struct lock_class_key intc_irqpin_irq_lock_class;
-
-/* And this is for the request mutex */
-static struct lock_class_key intc_irqpin_irq_request_class;
-
 static int intc_irqpin_irq_domain_map(struct irq_domain *h, unsigned int=
 virq,
 				      irq_hw_number_t hw)
 {
@@ -334,8 +325,6 @@ static int intc_irqpin_irq_domain_map(struct irq_doma=
in *h, unsigned int virq,
=20
 	intc_irqpin_dbg(&p->irq[hw], "map");
 	irq_set_chip_data(virq, h->host_data);
-	irq_set_lockdep_class(virq, &intc_irqpin_irq_lock_class,
-			      &intc_irqpin_irq_request_class);
 	irq_set_chip_and_handler(virq, &p->irq_chip, handle_level_irq);
 	return 0;
 }
diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index d919ae9691e2..962d9ffab5cd 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -180,17 +180,12 @@ static struct irq_chip arizona_irq_chip =3D {
 	.irq_set_wake		=3D arizona_irq_set_wake,
 };
=20
-static struct lock_class_key arizona_irq_lock_class;
-static struct lock_class_key arizona_irq_request_class;
-
 static int arizona_irq_map(struct irq_domain *h, unsigned int virq,
 			      irq_hw_number_t hw)
 {
 	struct arizona *data =3D h->host_data;
=20
 	irq_set_chip_data(virq, data);
-	irq_set_lockdep_class(virq, &arizona_irq_lock_class,
-		&arizona_irq_request_class);
 	irq_set_chip_and_handler(virq, &arizona_irq_chip, handle_simple_irq);
 	irq_set_nested_thread(virq, 1);
 	irq_set_noprobe(virq);
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx=
/chip.c
index 68d1e891752b..08236d7e845e 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -343,20 +343,12 @@ static int mv88e6xxx_g1_irq_setup_common(struct mv8=
8e6xxx_chip *chip)
=20
 static int mv88e6xxx_g1_irq_setup(struct mv88e6xxx_chip *chip)
 {
-	static struct lock_class_key lock_key;
-	static struct lock_class_key request_key;
 	int err;
=20
 	err =3D mv88e6xxx_g1_irq_setup_common(chip);
 	if (err)
 		return err;
=20
-	/* These lock classes tells lockdep that global 1 irqs are in
-	 * a different category than their parent GPIO, so it won't
-	 * report false recursion.
-	 */
-	irq_set_lockdep_class(chip->irq, &lock_key, &request_key);
-
 	snprintf(chip->irq_name, sizeof(chip->irq_name),
 		 "mv88e6xxx-%s", dev_name(chip->dev));
=20
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctr=
l-at91-pio4.c
index 8b01d312305a..ec939fb50759 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1065,13 +1065,6 @@ static const struct of_device_id atmel_pctrl_of_ma=
tch[] =3D {
 	}
 };
=20
-/*
- * This lock class allows to tell lockdep that parent IRQ and children I=
RQ do
- * not share the same class so it does not raise false positive
- */
-static struct lock_class_key atmel_lock_key;
-static struct lock_class_key atmel_request_key;
-
 static int atmel_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -1218,7 +1211,6 @@ static int atmel_pinctrl_probe(struct platform_devi=
ce *pdev)
 		irq_set_chip_and_handler(irq, &atmel_gpio_irq_chip,
 					 handle_simple_irq);
 		irq_set_chip_data(irq, atmel_pioctrl);
-		irq_set_lockdep_class(irq, &atmel_lock_key, &atmel_request_key);
 		dev_dbg(dev,
 			"atmel gpio irq domain: hwirq: %d, linux irq: %d\n",
 			i, irq);
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-s=
ingle.c
index 5be14dc979e2..bd82eef6ccc4 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -216,16 +216,6 @@ static enum pin_config_param pcs_bias[] =3D {
 	PIN_CONFIG_BIAS_PULL_UP,
 };
=20
-/*
- * This lock class tells lockdep that irqchip core that this single
- * pinctrl can be in a different category than its parents, so it won't
- * report false recursion.
- */
-static struct lock_class_key pcs_lock_class;
-
-/* Class for the IRQ request mutex */
-static struct lock_class_key pcs_request_class;
-
 /*
  * REVISIT: Reads and writes could eventually use regmap or something
  * generic. But at least on omaps, some mux registers are performance
@@ -1556,7 +1546,6 @@ static int pcs_irqdomain_map(struct irq_domain *d, =
unsigned int irq,
 	irq_set_chip_data(irq, pcs_soc);
 	irq_set_chip_and_handler(irq, &pcs->chip,
 				 handle_level_irq);
-	irq_set_lockdep_class(irq, &pcs_lock_class, &pcs_request_class);
 	irq_set_noprobe(irq);
=20
 	return 0;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
index bde67ee31417..0db3a3a4066a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -35,13 +35,6 @@
 #include "../core.h"
 #include "pinctrl-sunxi.h"
=20
-/*
- * These lock classes tell lockdep that GPIO IRQs are in a different
- * category than their parents, so it won't report false recursion.
- */
-static struct lock_class_key sunxi_pinctrl_irq_lock_class;
-static struct lock_class_key sunxi_pinctrl_irq_request_class;
-
 static struct irq_chip sunxi_pinctrl_edge_irq_chip;
 static struct irq_chip sunxi_pinctrl_level_irq_chip;
=20
@@ -1639,8 +1632,6 @@ int sunxi_pinctrl_init_with_variant(struct platform=
_device *pdev,
 	for (i =3D 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
 		int irqno =3D irq_create_mapping(pctl->domain, i);
=20
-		irq_set_lockdep_class(irqno, &sunxi_pinctrl_irq_lock_class,
-				      &sunxi_pinctrl_irq_request_class);
 		irq_set_chip_and_handler(irqno, &sunxi_pinctrl_edge_irq_chip,
 					 handle_edge_irq);
 		irq_set_chip_data(irqno, pctl);
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 5c058db21821..11af89f45210 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -939,8 +939,6 @@ static int qpnpint_irq_domain_translate(struct irq_do=
main *d,
 	return 0;
 }
=20
-static struct lock_class_key qpnpint_irq_lock_class, qpnpint_irq_request=
_class;
-
 static void qpnpint_irq_domain_map(struct spmi_pmic_arb_bus *bus,
 				   struct irq_domain *domain, unsigned int virq,
 				   irq_hw_number_t hwirq, unsigned int type)
@@ -955,9 +953,6 @@ static void qpnpint_irq_domain_map(struct spmi_pmic_a=
rb_bus *bus,
 	else
 		handler =3D handle_level_irq;
=20
-
-	irq_set_lockdep_class(virq, &qpnpint_irq_lock_class,
-			      &qpnpint_irq_request_class);
 	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, bus,
 			    handler, NULL, NULL);
 }
diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index d2d49264cf83..5225b3621a56 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -73,14 +73,7 @@ static struct irq_chip lmh_irq_chip =3D {
 static int lmh_irq_map(struct irq_domain *d, unsigned int irq, irq_hw_nu=
mber_t hw)
 {
 	struct lmh_hw_data *lmh_data =3D d->host_data;
-	static struct lock_class_key lmh_lock_key;
-	static struct lock_class_key lmh_request_key;
=20
-	/*
-	 * This lock class tells lockdep that GPIO irqs are in a different
-	 * category than their parents, so it won't report false recursion.
-	 */
-	irq_set_lockdep_class(irq, &lmh_lock_key, &lmh_request_key);
 	irq_set_chip_and_handler(irq, &lmh_irq_chip, handle_simple_irq);
 	irq_set_chip_data(irq, lmh_data);
=20
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..087a295a5480 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -157,20 +157,6 @@ struct gpio_irq_chip {
 	 */
 	unsigned int default_type;
=20
-	/**
-	 * @lock_key:
-	 *
-	 * Per GPIO IRQ chip lockdep class for IRQ lock.
-	 */
-	struct lock_class_key *lock_key;
-
-	/**
-	 * @request_key:
-	 *
-	 * Per GPIO IRQ chip lockdep class for IRQ request.
-	 */
-	struct lock_class_key *request_key;
-
 	/**
 	 * @parent_handler:
 	 *
diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 5f4bd476fcc8..c16e8e1c1079 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -257,14 +257,4 @@ static inline bool irq_is_percpu_devid(unsigned int =
irq)
 	return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
 }
=20
-void __irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lo=
ck_class,
-			     struct lock_class_key *request_class);
-static inline void
-irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lock_clas=
s,
-		      struct lock_class_key *request_class)
-{
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		__irq_set_lockdep_class(irq, lock_class, request_class);
-}
-
 #endif
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index c4a8bca5f2b0..91c359d9133e 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -441,13 +441,6 @@ irq_get_domain_generic_chip(struct irq_domain *d, un=
signed int hw_irq)
 }
 EXPORT_SYMBOL_GPL(irq_get_domain_generic_chip);
=20
-/*
- * Separate lockdep classes for interrupt chip which can nest irq_desc
- * lock and request mutex.
- */
-static struct lock_class_key irq_nested_lock_class;
-static struct lock_class_key irq_nested_request_class;
-
 /*
  * irq_map_generic_chip - Map a generic chip for an irq domain
  */
@@ -487,10 +480,6 @@ int irq_map_generic_chip(struct irq_domain *d, unsig=
ned int virq,
 	/* Mark the interrupt as installed */
 	set_bit(idx, &gc->installed);
=20
-	if (dgc->gc_flags & IRQ_GC_INIT_NESTED_LOCK)
-		irq_set_lockdep_class(virq, &irq_nested_lock_class,
-				      &irq_nested_request_class);
-
 	if (chip->irq_calc_mask)
 		chip->irq_calc_mask(data);
 	else
@@ -558,10 +547,6 @@ void irq_setup_generic_chip(struct irq_chip_generic =
*gc, u32 msk,
 		if (!(msk & 0x01))
 			continue;
=20
-		if (flags & IRQ_GC_INIT_NESTED_LOCK)
-			irq_set_lockdep_class(i, &irq_nested_lock_class,
-					      &irq_nested_request_class);
-
 		if (!(flags & IRQ_GC_NO_MASK)) {
 			struct irq_data *d =3D irq_get_irq_data(i);
=20
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 261305a213fd..14b845c2b29e 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -1061,11 +1061,3 @@ unsigned int kstat_irqs_usr(unsigned int irq)
 	rcu_read_unlock();
 	return sum;
 }
-
-#ifdef CONFIG_LOCKDEP
-void __irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lo=
ck_class,
-			     struct lock_class_key *request_class)
-{
-}
-EXPORT_SYMBOL_GPL(__irq_set_lockdep_class);
-#endif
