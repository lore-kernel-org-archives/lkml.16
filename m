Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADE24EAA2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688095; cv=none; b=O7Lw6vHCRKsX5bqwGjZ+GtlzL6K3FHqU2wnuByCS8+21+D2yEGVdC32p3QqWWdZqapJljb9UNEvEeSTABGensmHxQwYgoO/AZScAKyhVPSH5oSUrtRabBqgxXDoeeuiMRnHlYkMf9fgqknEdNCtJaHgZYFt2v4EwOjkxiqDW1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688095; c=relaxed/simple;
	bh=uxaRy2FsrAxL1iEHbTh9550wYWJvRGKCMBgK882Fytc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lp2DMIw5KlHJ2u3nPgBJUvHPFUazHi2xzRvoZhEzNHutfVgaWTv+aVd5tzQOrwKDZfW0aXpIG+418jHg1VpN9s+Gdz9s0nZeFWbo/IKTW3mXIoDCr0XaNxTUL7JA5Vjw4oMPxcBltlfBWJhsEgCYZzlXP853QLpaYS44gjKKhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [221.222.48.127])
	by APP-01 (Coremail) with SMTP id qwCowAAHqvqGke5n5ouGBQ--.42939S2;
	Thu, 03 Apr 2025 21:47:52 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd().
Date: Thu,  3 Apr 2025 21:47:31 +0800
Message-ID: <20250403134731.2054-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHqvqGke5n5ouGBQ--.42939S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZry3ZF4DCr4kZrW8CFWxJFb_yoWkKFb_GF
	4avr9Fy3yYyw1xZFn5Ar4kA3sIqr4kurnYqwsIyr43G3y3uF18Wa4kZr1Ygr40yF48tF15
	ArWSvF4Fq3WkGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwBA2fuaeJ4fQAAsO

The bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls
bcm47xxnflash_ops_bcm4706_ctl_cmd() without printing error message. A
proper implementation can be found in bcm47xxnflash_ops_bcm4706_write().

Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() to prevent
selent failure.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 6487dfc64258..c89129588bb6 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -182,7 +182,8 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 	if (cmd != NAND_CMD_RESET)
 		code |= NCTL_CSA;
 
-	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code))
+		pr_err("%s ctl_cmd didn't work!\n", __func__);
 }
 
 /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
-- 
2.42.0.windows.2

