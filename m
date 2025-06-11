Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9B23F404
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638633; cv=none; b=dnKSxe4GkSwl9WcKVYisIZ5N26ts856xrl3edSmUjb/L9NxyY1NfZYOofsXa5NefFnY2GHCYcGYTJGOAfeSLK68Js0nBeDkpPhayojNGPQV9Jg1xiokUcb281ZkY1UB7LC1kJwn4qeGcMcnIpFCwrx6oN5+R33bwBTIgkBCbNao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638633; c=relaxed/simple;
	bh=b4dfARwKzVElkMbw04XmZTkvKo2gCOyiYaN58RPfOnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHrOp3uKsxC/uSmgjAMOZMePfxwOEy7Wnpg7e/CgdYLv8VCxvGqijjYRM+vGgxLR2+Gc1L2FfFA4lOH2PrCl0TWPyLkouJhrY01I19wc9cCXheKy/csuUU7hBN760PbUi3CO/47OqssVX+Jlya/HJ6VRXwdGk8TESIn7j5sqNvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q56LZV7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q56LZV7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDAFC4CEEE;
	Wed, 11 Jun 2025 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638631;
	bh=b4dfARwKzVElkMbw04XmZTkvKo2gCOyiYaN58RPfOnI=;
	h=From:To:Cc:Subject:Date:From;
	b=q56LZV7JNRwzmBe79lLSvEGvdipg30x4rKrWKyIEdbdX3RZlZd2oNk3WHy76DPTUQ
	 GqzOmjrl8AY4vPO4DWoopmlftK34x+mvbubS4hOck1qKrMsrFHtbX6iDT4XuzZwB4J
	 3Y7dOVYy4mpZQUxnOn0nr4TIii772Sd3R5WqyXeasrJOnUdVIkWRM+TWHh9VGKmEzp
	 2RguignrgGE+lYVmI321QreeomkNdRUDDCQT4Z1IMCl+KtN2dCa3kYpVtt8RwLRj1H
	 dX0JBceViWhLGtrippJDlIo6VYDndVlQ3x6sA9wBh4lYACqi4nmHZ+F9I1/HpJeewf
	 LILuIGEtjvfIA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Nathan Chancellor <nathan@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [PATCH] mfd: fix building without CONFIG_OF
Date: Wed, 11 Jun 2025 12:43:29 +0200
Message-ID: <20250611104348.192092-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using the of_fwnode_handle() means that local 'node' variables are unused
whenever CONFIG_OF is disabled for compile testing:

drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
drivers/mfd/88pm860x-core.c:576:29: error: unused variable 'node' [-Werror=unused-variable]
  576 |         struct device_node *node = i2c->dev.of_node;
      |                             ^~~~
drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
drivers/mfd/max8925-core.c:659:29: error: unused variable 'node' [-Werror=unused-variable]
  659 |         struct device_node *node = chip->dev->of_node;
      |                             ^~~~
drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
drivers/mfd/twl4030-irq.c:679:46: error: unused variable 'node' [-Werror=unused-variable]
  679 |         struct                  device_node *node = dev->of_node;
      |                                              ^~~~

Replace these with the corresponding dev_fwnode() lookups that
keep the code simpler in addition to avoiding the warnings.

Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/mfd/88pm860x-core.c | 3 +--
 drivers/mfd/max8925-core.c  | 6 +++---
 drivers/mfd/twl4030-irq.c   | 3 +--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 488e346047c1..77230fbe07be 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int data, mask, ret = -EINVAL;
 	int nr_irqs, irq_base = -1;
-	struct device_node *node = i2c->dev.of_node;
 
 	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
 		| PM8607_B0_MISC1_INT_MASK;
@@ -624,7 +623,7 @@ static int device_irq_init(struct pm860x_chip *chip,
 		ret = -EBUSY;
 		goto out;
 	}
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, chip->irq_base, 0,
+	irq_domain_create_legacy(dev_fwnode(&i2c->dev), nr_irqs, chip->irq_base, 0,
 				 &pm860x_irq_domain_ops, chip);
 	chip->core_irq = i2c->irq;
 	if (!chip->core_irq)
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 78b16c67a5fc..25377dcce60e 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 {
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int ret;
-	struct device_node *node = chip->dev->of_node;
 
 	/* clear all interrupts */
 	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
@@ -682,8 +681,9 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 		return -EBUSY;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), MAX8925_NR_IRQS, chip->irq_base, 0,
-				 &max8925_irq_domain_ops, chip);
+	irq_domain_create_legacy(dev_fwnode(chip->dev), MAX8925_NR_IRQS,
+				 chip->irq_base, 0, &max8925_irq_domain_ops,
+				 chip);
 
 	/* request irq handler for pmic main irq*/
 	chip->core_irq = irq;
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..d3ab40651307 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
@@ -691,7 +690,7 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		return irq_base;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
+	irq_domain_create_legacy(dev_fwnode(dev), nr_irqs, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
-- 
2.49.0

