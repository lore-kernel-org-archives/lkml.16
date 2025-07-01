Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9747C279333
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381791; cv=none; b=u2vRwN/KBCSRAom3gGSd41B8lQJPUZAKm+IgVxotewX6LzY6keQYA5ejdn+YQFsI0R3QTosExfBZkcyCBnIQZ4EGk4WL2ABzCdk5mH3fXqfU7NJcEP6oWmF2p3bRmfYGqASygbaAlTqdVvCWG5Xw92GMe79XR6xWaCkjL8gTom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381791; c=relaxed/simple;
	bh=7glF9ul1Ffe3mtTQchO9Faf2l0Z5kXL0fjkvgyKSEQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ma8FDoW4gdKs23C1xyjZH1iqewzrSZflPkdog+t/7udAErDq0Y8kbNdLP8Ru8bgZOtX1HmmD+GPQtmw4lbLffa3pmM5i756Tc38IBMdoxqjXddW5Ji/G+5+bgPzuCB4kWjHqeCNEB10tFIqBklZNt73j2QGtzMYsKu3WO/ra0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=s1bSOAHt; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="s1bSOAHt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=abU1by4IsnvGu/+KzEI3QjACFcQKq8gAL7reMdifVsk=; b=s1bSOAHt2KWZCyHj
	rPyQvbbd0oLeXhmVQcosYzARCNF+QVrP1cArSxWAzosbnF0iSZBbBPW5spaeUKKi2hSkszswPGhKt
	quVd0kUz/FL9c2GqaYisRMtnLeTgRHaUxzsmJrdkJJxK23cKKHr0zldWzpI7z8ocs3JhjtNQTnljT
	N4AeFu3lym6pnXN7CRfIkE8/Go8WNHfnOldKNIQHSlpgXtBKuFGlc6pWd+ZUGNASeKDgFAWvbk7Or
	+obksQWha8fIJgXIRB717gnpre4orzl6M1A5iyKSrW15zYGZl9PbwwwAmxvsANd62EzmYS1zOo9Ei
	t/1ACalEWY1bsXEZYw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uWcPJ-00DKKa-2d;
	Tue, 01 Jul 2025 14:56:25 +0000
From: linux@treblig.org
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mfd: pcf50633: Remove the header
Date: Tue,  1 Jul 2025 15:56:25 +0100
Message-ID: <20250701145625.204048-1-linux@treblig.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The patches to remove all of the pieces of the pcf50633
have gone in and we're left with the header.

Remove it.

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/mfd/pcf50633/core.h | 229 ------------------------------
 1 file changed, 229 deletions(-)
 delete mode 100644 include/linux/mfd/pcf50633/core.h

diff --git a/include/linux/mfd/pcf50633/core.h b/include/linux/mfd/pcf50633/core.h
deleted file mode 100644
index 42d2b0e4884e..000000000000
--- a/include/linux/mfd/pcf50633/core.h
+++ /dev/null
@@ -1,229 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * core.h  -- Core driver for NXP PCF50633
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * All rights reserved.
- */
-
-#ifndef __LINUX_MFD_PCF50633_CORE_H
-#define __LINUX_MFD_PCF50633_CORE_H
-
-#include <linux/i2c.h>
-#include <linux/workqueue.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/machine.h>
-#include <linux/pm.h>
-#include <linux/power_supply.h>
-
-struct pcf50633;
-struct regmap;
-
-#define PCF50633_NUM_REGULATORS	11
-
-struct pcf50633_platform_data {
-	struct regulator_init_data reg_init_data[PCF50633_NUM_REGULATORS];
-
-	char **batteries;
-	int num_batteries;
-
-	/*
-	 * Should be set accordingly to the reference resistor used, see
-	 * I_{ch(ref)} charger reference current in the pcf50633 User
-	 * Manual.
-	 */
-	int charger_reference_current_ma;
-
-	/* Callbacks */
-	void (*probe_done)(struct pcf50633 *);
-	void (*mbc_event_callback)(struct pcf50633 *, int);
-	void (*regulator_registered)(struct pcf50633 *, int);
-	void (*force_shutdown)(struct pcf50633 *);
-
-	u8 resumers[5];
-};
-
-struct pcf50633_irq {
-	void (*handler) (int, void *);
-	void *data;
-};
-
-int pcf50633_register_irq(struct pcf50633 *pcf, int irq,
-			void (*handler) (int, void *), void *data);
-int pcf50633_free_irq(struct pcf50633 *pcf, int irq);
-
-int pcf50633_irq_mask(struct pcf50633 *pcf, int irq);
-int pcf50633_irq_unmask(struct pcf50633 *pcf, int irq);
-int pcf50633_irq_mask_get(struct pcf50633 *pcf, int irq);
-
-int pcf50633_read_block(struct pcf50633 *, u8 reg,
-					int nr_regs, u8 *data);
-int pcf50633_write_block(struct pcf50633 *pcf, u8 reg,
-					int nr_regs, u8 *data);
-u8 pcf50633_reg_read(struct pcf50633 *, u8 reg);
-int pcf50633_reg_write(struct pcf50633 *pcf, u8 reg, u8 val);
-
-int pcf50633_reg_set_bit_mask(struct pcf50633 *pcf, u8 reg, u8 mask, u8 val);
-int pcf50633_reg_clear_bits(struct pcf50633 *pcf, u8 reg, u8 bits);
-
-/* Interrupt registers */
-
-#define PCF50633_REG_INT1	0x02
-#define PCF50633_REG_INT2	0x03
-#define PCF50633_REG_INT3	0x04
-#define PCF50633_REG_INT4	0x05
-#define PCF50633_REG_INT5	0x06
-
-#define PCF50633_REG_INT1M	0x07
-#define PCF50633_REG_INT2M	0x08
-#define PCF50633_REG_INT3M	0x09
-#define PCF50633_REG_INT4M	0x0a
-#define PCF50633_REG_INT5M	0x0b
-
-enum {
-	/* Chip IRQs */
-	PCF50633_IRQ_ADPINS,
-	PCF50633_IRQ_ADPREM,
-	PCF50633_IRQ_USBINS,
-	PCF50633_IRQ_USBREM,
-	PCF50633_IRQ_RESERVED1,
-	PCF50633_IRQ_RESERVED2,
-	PCF50633_IRQ_ALARM,
-	PCF50633_IRQ_SECOND,
-	PCF50633_IRQ_ONKEYR,
-	PCF50633_IRQ_ONKEYF,
-	PCF50633_IRQ_EXTON1R,
-	PCF50633_IRQ_EXTON1F,
-	PCF50633_IRQ_EXTON2R,
-	PCF50633_IRQ_EXTON2F,
-	PCF50633_IRQ_EXTON3R,
-	PCF50633_IRQ_EXTON3F,
-	PCF50633_IRQ_BATFULL,
-	PCF50633_IRQ_CHGHALT,
-	PCF50633_IRQ_THLIMON,
-	PCF50633_IRQ_THLIMOFF,
-	PCF50633_IRQ_USBLIMON,
-	PCF50633_IRQ_USBLIMOFF,
-	PCF50633_IRQ_ADCRDY,
-	PCF50633_IRQ_ONKEY1S,
-	PCF50633_IRQ_LOWSYS,
-	PCF50633_IRQ_LOWBAT,
-	PCF50633_IRQ_HIGHTMP,
-	PCF50633_IRQ_AUTOPWRFAIL,
-	PCF50633_IRQ_DWN1PWRFAIL,
-	PCF50633_IRQ_DWN2PWRFAIL,
-	PCF50633_IRQ_LEDPWRFAIL,
-	PCF50633_IRQ_LEDOVP,
-	PCF50633_IRQ_LDO1PWRFAIL,
-	PCF50633_IRQ_LDO2PWRFAIL,
-	PCF50633_IRQ_LDO3PWRFAIL,
-	PCF50633_IRQ_LDO4PWRFAIL,
-	PCF50633_IRQ_LDO5PWRFAIL,
-	PCF50633_IRQ_LDO6PWRFAIL,
-	PCF50633_IRQ_HCLDOPWRFAIL,
-	PCF50633_IRQ_HCLDOOVL,
-
-	/* Always last */
-	PCF50633_NUM_IRQ,
-};
-
-struct pcf50633 {
-	struct device *dev;
-	struct regmap *regmap;
-
-	struct pcf50633_platform_data *pdata;
-	int irq;
-	struct pcf50633_irq irq_handler[PCF50633_NUM_IRQ];
-	struct work_struct irq_work;
-	struct workqueue_struct *work_queue;
-	struct mutex lock;
-
-	u8 mask_regs[5];
-
-	u8 suspend_irq_masks[5];
-	u8 resume_reason[5];
-	int is_suspended;
-
-	int onkey1s_held;
-
-	struct platform_device *rtc_pdev;
-	struct platform_device *mbc_pdev;
-	struct platform_device *adc_pdev;
-	struct platform_device *input_pdev;
-	struct platform_device *bl_pdev;
-	struct platform_device *regulator_pdev[PCF50633_NUM_REGULATORS];
-};
-
-enum pcf50633_reg_int1 {
-	PCF50633_INT1_ADPINS	= 0x01,	/* Adapter inserted */
-	PCF50633_INT1_ADPREM	= 0x02,	/* Adapter removed */
-	PCF50633_INT1_USBINS	= 0x04,	/* USB inserted */
-	PCF50633_INT1_USBREM	= 0x08,	/* USB removed */
-	/* reserved */
-	PCF50633_INT1_ALARM	= 0x40, /* RTC alarm time is reached */
-	PCF50633_INT1_SECOND	= 0x80,	/* RTC periodic second interrupt */
-};
-
-enum pcf50633_reg_int2 {
-	PCF50633_INT2_ONKEYR	= 0x01, /* ONKEY rising edge */
-	PCF50633_INT2_ONKEYF	= 0x02, /* ONKEY falling edge */
-	PCF50633_INT2_EXTON1R	= 0x04, /* EXTON1 rising edge */
-	PCF50633_INT2_EXTON1F	= 0x08, /* EXTON1 falling edge */
-	PCF50633_INT2_EXTON2R	= 0x10, /* EXTON2 rising edge */
-	PCF50633_INT2_EXTON2F	= 0x20, /* EXTON2 falling edge */
-	PCF50633_INT2_EXTON3R	= 0x40, /* EXTON3 rising edge */
-	PCF50633_INT2_EXTON3F	= 0x80, /* EXTON3 falling edge */
-};
-
-enum pcf50633_reg_int3 {
-	PCF50633_INT3_BATFULL	= 0x01, /* Battery full */
-	PCF50633_INT3_CHGHALT	= 0x02,	/* Charger halt */
-	PCF50633_INT3_THLIMON	= 0x04,
-	PCF50633_INT3_THLIMOFF	= 0x08,
-	PCF50633_INT3_USBLIMON	= 0x10,
-	PCF50633_INT3_USBLIMOFF	= 0x20,
-	PCF50633_INT3_ADCRDY	= 0x40, /* ADC result ready */
-	PCF50633_INT3_ONKEY1S	= 0x80,	/* ONKEY pressed 1 second */
-};
-
-enum pcf50633_reg_int4 {
-	PCF50633_INT4_LOWSYS		= 0x01,
-	PCF50633_INT4_LOWBAT		= 0x02,
-	PCF50633_INT4_HIGHTMP		= 0x04,
-	PCF50633_INT4_AUTOPWRFAIL	= 0x08,
-	PCF50633_INT4_DWN1PWRFAIL	= 0x10,
-	PCF50633_INT4_DWN2PWRFAIL	= 0x20,
-	PCF50633_INT4_LEDPWRFAIL	= 0x40,
-	PCF50633_INT4_LEDOVP		= 0x80,
-};
-
-enum pcf50633_reg_int5 {
-	PCF50633_INT5_LDO1PWRFAIL	= 0x01,
-	PCF50633_INT5_LDO2PWRFAIL	= 0x02,
-	PCF50633_INT5_LDO3PWRFAIL	= 0x04,
-	PCF50633_INT5_LDO4PWRFAIL	= 0x08,
-	PCF50633_INT5_LDO5PWRFAIL	= 0x10,
-	PCF50633_INT5_LDO6PWRFAIL	= 0x20,
-	PCF50633_INT5_HCLDOPWRFAIL	= 0x40,
-	PCF50633_INT5_HCLDOOVL		= 0x80,
-};
-
-/* misc. registers */
-#define PCF50633_REG_OOCSHDWN	0x0c
-
-/* LED registers */
-#define PCF50633_REG_LEDOUT 0x28
-#define PCF50633_REG_LEDENA 0x29
-#define PCF50633_REG_LEDCTL 0x2a
-#define PCF50633_REG_LEDDIM 0x2b
-
-static inline struct pcf50633 *dev_to_pcf50633(struct device *dev)
-{
-	return dev_get_drvdata(dev);
-}
-
-int pcf50633_irq_init(struct pcf50633 *pcf, int irq);
-void pcf50633_irq_free(struct pcf50633 *pcf);
-extern const struct dev_pm_ops pcf50633_pm;
-
-#endif
-- 
2.50.0

