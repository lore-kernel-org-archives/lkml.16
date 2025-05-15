Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FA14900B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298137; cv=none; b=D3JtGAebbAdtiXvp1zV6w94aKXwYpgIqztTiYVOa5gcYEn2FRdckWyaptOCRAm4kKcmtwKDwC1pppyCMYuTG0o+T7XQVQxYQpCRqFU+3vEskRKVxL4CAamxyYLtz3sYXHvKCUh/Cm/r5dukYk+8qyuCihMziYc2YwMrh3JRC9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298137; c=relaxed/simple;
	bh=y0bMo/unmXbfKx2jqD1auRYxYI4xYTh2PoiDEKBXwrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pG+rRk3ER1VKv9Q9R4mmcIonLjpeV0i9TSqIxVNAQepsGbxi5fagMCuBe+Y9uMQEPm6rIVXwcaeEN8ujQpfKbufT6avLkphz0qjfuNuO2Fz9Np4hChASQGC91goZeEiqkGrnikym3szqbWybSfUHz8/BkZNX0aJIJ1Y5EbnPxzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAnYQlSpyVoRv7ZFQ--.50029S2;
	Thu, 15 May 2025 16:35:30 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] irqchip/irq-pruss-intc: Consolidate chained IRQ handler install/remove
Date: Thu, 15 May 2025 16:34:50 +0800
Message-Id: <20250515083450.3811411-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnYQlSpyVoRv7ZFQ--.50029S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1fZFWUWr1fAr17KF4Durg_yoWfArb_uw
	4fWrs3Jr40yrs0yF1xJFnxAFy2yw4kWr1Du3ySqF9xtry5J343CF1qvFnIkr4UWF1rAas7
	Cr98urWfAry7GjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUndgAUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Chained irq handlers usually set up handler data as well.
irq_set_chained_handler_and_data() can set both under irq_desc->lock.
Replace the two calls with one.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/irqchip/irq-pruss-intc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 8f7c9dc45953..1feba8e26e27 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -581,8 +581,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		host_data->intc = intc;
 		host_data->host_irq = i;
 
-		irq_set_handler_data(irq, host_data);
-		irq_set_chained_handler(irq, pruss_intc_irq_handler);
+		irq_set_chained_handler_and_data(irq, pruss_intc_irq_handler,
+						 host_data);
 	}
 
 	return 0;
-- 
2.25.1

