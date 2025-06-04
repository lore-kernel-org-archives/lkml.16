Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300BB2475C2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024674; cv=none; b=TUtZHHy/RRJLooG7jMqOeVHOXOVA3OJgYJU6VhvUrXcFZbB4gDdpzbQLWWr6S0RNSjIlMbhBGBKjO/VFHQNcAv/3eAcL9+GkUCaA6la0CHpJhoLeFOrpLsl7J3vOQvPuBjAF2QhsmZivRyzRnsCT0xCyfYscsrdb/WSrTWtp99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024674; c=relaxed/simple;
	bh=7wZBTAGrNfSHVUSbIrH62aYt/z7Oh7TmDhSzaHHOK/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e9rbTUEoz+poc8CQkUBrGx/KuWt2KnTopSqG7NbmxTojfCvsCw5fdlhf1Chj1aKYlFS7PKPnZvinBj5Lni9PJSbr8uYMIwRICdIzbcPJDQ02cZQ9JGNrp/lHV2N1apalS6gTtX5bMO0pSbRY2ehlg4MmNkiqKl904wmw06K59Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I2dRidDR; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I2dRidDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=2QALGxwPi385gRG5AfiZexaj+frrv2bP+KaEk0aGjIA=;
	b=I2dRidDR1O0cg2pbCDUuhmErWUmYKSzL7DbkT4UXwn/s1nNYKT+Zmocc2yObVC
	j0JajyBQdzYfo2KuSFGEs4pE3KLYaRbiFK64IYvUjkkbmkj9swALk0UPFhPcAM6V
	aZ0tW8IIcxfJ3qRCEuJfqSdpwwm0skKfCRhotL2QuxaOM=
Received: from liubaolin-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3X+GG_z9odVJMGA--.1635S2;
	Wed, 04 Jun 2025 16:10:47 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] mfd: Remove unused of_node variables
Date: Wed,  4 Jun 2025 16:10:43 +0800
Message-Id: <20250604081043.802659-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X+GG_z9odVJMGA--.1635S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1xGr47tw13WF47XFWrXwb_yoW8CFykpF
	ZxGFy5Ar4UJa1DuayvkrWDuFy5t3WrG3y0kF1xCasa9r43Aa4kKFyYqry8XF15CFWxJFy3
	tFZ7tFy8CF4FkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU0hF7UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/1tbiUhFiymg-qOnzQQACsN

From: Baolin Liu <liubaolin@kylinos.cn>

Clean up unused device tree node variables to eliminate compiler warnings:
`warning: unused variable ‘node’`

No functional changes.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 drivers/mfd/88pm860x-core.c | 1 -
 drivers/mfd/max8925-core.c  | 1 -
 drivers/mfd/twl4030-irq.c   | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 488e346047c1..750f9db95386 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int data, mask, ret = -EINVAL;
 	int nr_irqs, irq_base = -1;
-	struct device_node *node = i2c->dev.of_node;
 
 	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
 		| PM8607_B0_MISC1_INT_MASK;
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 78b16c67a5fc..9d6358337d97 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 {
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int ret;
-	struct device_node *node = chip->dev->of_node;
 
 	/* clear all interrupts */
 	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..c95a73186112 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
-- 
2.39.2

