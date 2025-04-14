Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089432F32
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612285; cv=none; b=hAMYCD1+A0RtuErFndDUWz+rn2Icx/LAPMe7lkGrLpVE1r5IEyRW3NKWMLFa7KO9Yi4JAzPoaoSNAWIaxMIiIF1fKbk6yZ+ZjovCPpH7t6nzEuY1Y2hW1x7ZSwU7jfvz+tGciOp5IHD3eGfB3GwrQf9gGQrisBVe6aNxNK3Bf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612285; c=relaxed/simple;
	bh=w8H0Yk/aiUBgp2kpAaBgGM3BJ2V7MPiQ8mvoAI/hWM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgqNWAh9/g9Uz9gzd5982mqcfgLruW5S3DWgyJyyMtGW/1bLUhzIbmnIK1EshEMLyairhzuDDGMFVK5eWDO1wJp5DK7XR5U5zuqKyW0NC+JwPX0tsPiR0bsAVVzTe2nEVb6o1rL9VlbAanMw2p0wIsmbAS1Hg2UT295JOPl0WoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnYgqqq_xnDYjlCA--.14406S2;
	Mon, 14 Apr 2025 14:31:08 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3 RESEND] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd()
Date: Mon, 14 Apr 2025 14:30:40 +0800
Message-ID: <20250414063041.2060-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnYgqqq_xnDYjlCA--.14406S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw18WF17uw47XFyUAr1UZFb_yoW8WFWUpr
	47Xa45t3Z5X3WDtFyUWF18KF1Yv348KF4jg3yvva48ursavFWxGrZ3Ga4jq3y8Gw18Jw17
	XF4F93WxWr9FkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUmL9UUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAMA2f8nMA0BgAAsj

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

