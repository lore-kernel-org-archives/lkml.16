Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A764217705
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019060; cv=none; b=QAq1l29UHLeZ14Ltb9tWuydiABH4haWjs/e4lQCQCFqg8d5BHOIRBidEphz60DAopHPuD9J97Olq4GjRT1Fnmc+87Cud0MIW2bvWwiC/oLoMQpWgwjJ63iOu4rT8I3P8Q2Jkb5Wf6l4mnpE6p1vkjKgDwuBMdYBUIiX4iDg54h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019060; c=relaxed/simple;
	bh=w8H0Yk/aiUBgp2kpAaBgGM3BJ2V7MPiQ8mvoAI/hWM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klfmk+46V5SJl2q/lBMaN0c03mBmP9Wfqm5blpgy3+ElKqHez9bSGghz4SqzEk8EGrEMQmwsMFXufxGvXSqCAU5zxzN7/6Mf3cFj3UXpcLcQ4PX1I6zetQGbtSaI8Lp8dl4aiENiDQH80HgkbmIXt8BZ9PSUnQ/LQkM+sRWjYV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABXAQJjnvNnNazXBg--.76S2;
	Mon, 07 Apr 2025 17:44:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd()
Date: Mon,  7 Apr 2025 17:43:47 +0800
Message-ID: <20250407094347.2108-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXAQJjnvNnNazXBg--.76S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw18WF17uw47XFyUAr1UZFb_yoW8WFWUpr
	47Xa45t3Z5X3WDtFyUWF18KF1Yv348KF4jg3yvva48ursavFWxGrZ3Ga4jq3y8Gw18Jw17
	XF4F93WxWr9FkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCREFA2fzgKdR5gABsb

The function bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls the function
bcm47xxnflash_ops_bcm4706_ctl_cmd(), but does not check its return value.
A proper implementation can be found in bcm47xxnflash_ops_bcm4706_write().

Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() via pr_err()
to prevent silent failure. The error Log funciton 'dev_err' is unsuitable
in this situation for it is hard to get device pointer.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v3: Improve code for logging error.
v2: Fix spelling problem.

 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 6487dfc64258..e532c3535b16 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -171,6 +171,7 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 {
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	u32 code = 0;
+	int rc;
 
 	if (cmd == NAND_CMD_NONE)
 		return;
@@ -182,7 +183,9 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 	if (cmd != NAND_CMD_RESET)
 		code |= NCTL_CSA;
 
-	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	rc = bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	if (rc)
+		pr_err("ctl_cmd didn't work with error %d\n", rc);
 }
 
 /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
-- 
2.42.0.windows.2

