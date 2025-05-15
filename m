Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE821F461A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298483; cv=none; b=EwWnj8NzwudqlHiNY2ddPStb081cmck8xeJudECtMugTlOtWeHijiC3AhRzQ83UcP1WJl4PNJB0D8w0Za84r52F9/8yiPzsZwc5F71wJyyVcZG4389Cu25S60YbNUpd77+lc7F8NTNGjc1zDxcr5cntFEa2LIYFbGYo9s5Pds2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298483; c=relaxed/simple;
	bh=3fbwG17g0zGe0WHDorq39S/ESe25tR5ldW0/jUF0+Lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ae7rCR8K1NXyjS5WwwekzUcglP/WJ0oOBszbdzJS/Zd9xUF22pvCI4VaF0Ippb9jUWp27RIF63P2A7EXxPjVW/563hOWRpA+NFgniRRhduHgXyqIsMz71DqEE7nSGNsIuvjEpCTDE/8Ublf/eMJkccmJsQfS9BPctc17nFE0FZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAA3dw+iqCVotbHaFQ--.49892S2;
	Thu, 15 May 2025 16:41:06 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: qiang.zhao@nxp.com,
	christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: fsl: qe: Consolidate chained IRQ handler install/remove
Date: Thu, 15 May 2025 16:39:19 +0800
Message-Id: <20250515083919.3811473-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3dw+iqCVotbHaFQ--.49892S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1fZFWUWr1fAr17tr4UXFb_yoWkZFc_Ww
	45X347Xr18ZasayF12ywsxAF4rZF4vqrnrCanYqFZay34fJ397AF1UtFnxur1kWF15ZF1k
	Ary5ZrWfGrWUGjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU00eHDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Chained irq handlers usually set up handler data as well.
irq_set_chained_handler_and_data() can set both under irq_desc->lock.
Replace the two calls with one.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/fsl/qe/qe_ic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 17e6d2377c7c..4068b501a3a3 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -450,13 +450,11 @@ static int qe_ic_init(struct platform_device *pdev)
 
 	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
 
-	irq_set_handler_data(qe_ic->virq_low, qe_ic);
-	irq_set_chained_handler(qe_ic->virq_low, low_handler);
+	irq_set_chained_handler_and_data(qe_ic->virq_low, low_handler, qe_ic);
 
-	if (high_handler) {
-		irq_set_handler_data(qe_ic->virq_high, qe_ic);
-		irq_set_chained_handler(qe_ic->virq_high, high_handler);
-	}
+	if (high_handler)
+		irq_set_chained_handler_and_data(qe_ic->virq_high,
+						 high_handler, qe_ic);
 	return 0;
 }
 static const struct of_device_id qe_ic_ids[] = {
-- 
2.25.1

