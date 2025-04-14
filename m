Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1E26AD0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744597298; cv=none; b=cfvrRsYJL6dmNYEegX79YIQ8Br94Gm6va7+bwcL0SYkNIZRTsaxPgxyrnhmZ4/ZgqCTmlrImLMNRCM6iD4ppgEC+i45D9zMgVK9OnRT9oPklbDUXWwzCi9OyjxrOEkP0RkBG5OQzsSun9KmCZDo+0ldO+Qn+mbMSTPtgrfZjkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744597298; c=relaxed/simple;
	bh=Vu5WsQ+7J9lQduPSuEZf7+DnEiGD+PqAeVSVVK1h5+E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iZ1li6UFmsUuiolkw7tH6g3HRlMiAPMqq2fZn8V+5+cglg418Me/cX3vzgUV1/rkMPvmyhV5Q10uk6/PEFV00zoMsDbJFSI6pObW9j715iaYidIvjLSkT2kf5d+URYDHOOomlMG3+bDibdanF+GfC/YtOGVJ1k3DPiNQ82EtZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAD3nf4kcfxnGYHACA--.37636S2;
	Mon, 14 Apr 2025 10:21:24 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: alexisczezar.torreno@analog.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] regulator: adp5055: Remove unneeded semicolon
Date: Mon, 14 Apr 2025 10:19:50 +0800
Message-Id: <20250414021950.3755819-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3nf4kcfxnGYHACA--.37636S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DWw47JrWfuFg_yoWfXrb_ur
	nrAw4xJF4DZwsxGr1kAFsIvF9Ivw1qqanavr4UKa9xJ3srAF18Za43Zry7Z3yUAw4UWrnr
	WanxWF48Ar42gjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JU9XocUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/regulator/adp5055-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/adp5055-regulator.c b/drivers/regulator/adp5055-regulator.c
index ad8e42cb1f3f..97f77bc71256 100644
--- a/drivers/regulator/adp5055-regulator.c
+++ b/drivers/regulator/adp5055-regulator.c
@@ -165,7 +165,7 @@ static int adp5055_parse_fw(struct device *dev, struct  adp5055 *adp5055)
 		ret = regmap_write(regmap, ADP5055_DVS_LIM0 + i, val);
 		if (ret)
 			return ret;
-	};
+	}
 
 	val = FIELD_PREP(ADP5055_MASK_EN_MODE, adp5055->en_mode_software);
 	ret = regmap_write(regmap, ADP5055_CTRL_MODE1, val);
-- 
2.25.1

