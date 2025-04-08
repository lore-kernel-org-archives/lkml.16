Received: from forward202d.mail.yandex.net (forward202d.mail.yandex.net [178.154.239.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAA255250
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148698; cv=none; b=ExBrmptiIY6Qm4UNDnLNc1lrxPd3wMROIKYJtPCpbgEdVNHTZtRWJLuJ9Ub0dP4VAqsX1xkpVQAOkjdslfi1gw6XTpzJzBh+TUMFNUKS1XR1F/weGKFVc7iHpI7YJ+HTTQANx4gbe3BPBgdxwDJlzpyeXam/KsYukHHVYowuoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148698; c=relaxed/simple;
	bh=JC4AvRsU5dO5lSN/wK1tzyfO3xJ3Lusym5x1J5A6aCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZggNWKsDsIAG74DbYuIZ5RG+ZyL7PQLk48mLgg7/7H/aW3G9N5+47HDP96JG1++hleO1eVMlZnuXLhbyVVwzFfiZjgMcRlp6MevkInnSTBIdKjvb+gKM/Js1p/b8MqzOg2J4maCg3tUwHoMpcHI+ZU4LdIVGBl3mqLHUUqQL+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=OdDSfyar; arc=none smtp.client-ip=178.154.239.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="OdDSfyar"
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward202d.mail.yandex.net (Yandex) with ESMTPS id B48D563F97
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:39:21 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:c54a:0:640:3e90:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 24FFE6098D;
	Wed,  9 Apr 2025 00:39:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 8dlTpA3Lj4Y0-JWBBQtGG;
	Wed, 09 Apr 2025 00:39:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1744148353; bh=JZcXqYJrQv6btI2jGdZDGW5h7bHWwXKxZoNoLSUTsnk=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=OdDSfyarzXf6b9xGs1RS9fAjnVN0YHKQSNeUJ7HGsUFO6080+NKjIt5Qt1+EAWsHS
	 t10a9cQfD2P3M50WLiBn1CL9as/uCNnlw1WsENBaZLPOiE9STo5ljkkCncfaZEIHZB
	 nODID2ntwoKtZtL6XIp6YF2AA1oow9gQJwpJH9p8=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Mikhail Arkhipov <m.arhipov@rosa.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mikhail Arkhipov <m.arhipov@rosa.ru>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
Date: Wed,  9 Apr 2025 00:39:06 +0300
Message-Id: <20250408213906.23129-1-m.arhipov@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ctx->steps is zero, the loop processing ECC steps is skipped,
and the variable ret remains uninitialized. It is later checked
and returned, which leads to undefined behavior and may cause
unpredictable results in user space or kernel crashes.

This scenario can be triggered in edge cases such as misconfigured
geometry, ECC engine misuse, or if ctx->steps is not validated
after initialization.

Initialize ret to zero before the loop to ensure correct and safe
behavior regardless of the ctx->steps value.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
Signed-off-by: Mikhail Arkhipov <m.arhipov@rosa.ru>
---
 drivers/mtd/nand/ecc-mxic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 6b487ffe2f2d..e8bbe009c04e 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -614,7 +614,7 @@ static int mxic_ecc_finish_io_req_external(struct nand_device *nand,
 {
 	struct mxic_ecc_engine *mxic = nand_to_mxic(nand);
 	struct mxic_ecc_ctx *ctx = nand_to_ecc_ctx(nand);
-	int nents, step, ret;
+	int nents, step, ret = 0;
 
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
-- 
2.39.5 (Apple Git-154)

