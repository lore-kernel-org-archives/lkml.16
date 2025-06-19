Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DE20C480
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344842; cv=none; b=PokzA/Ycx6E4bAv3Hs8aA1uLvm00dCMno/yd0q0gnzxrOm+AnoxCig9TcEt9rjFyHu+ePAC3gwAdZ3n9aO0Rw+FZOTx+0vPHz7VE4XPS94h5icE6Zax4UEfok0tsAnJ7phJ9GgTMe+ia2YDvJ+ZGPCLAtrseq9Tvp0bnsD9Xkw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344842; c=relaxed/simple;
	bh=fzNnnupMA3aKSPvwO5RS9+uw6COJ0OojzE/96IObkHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s7DvmYmwLrzhdhTKILZEqmgYgQWeHKQOAhjbVOuHWkKxYIBwUmCqlsiUdVa7FBpZRkycNU9UfczVhvuxJyLOb/gGoGslf10evZPkWi21Z1nntDo/fwLISNo0Bpo9soK1QXOF2Dm8gyKNvUgQOYFXE4vr5UTpL+/vH+fV5LeBwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru; spf=pass smtp.mailfrom=itb.spb.ru; dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b=pyp8Cer0; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b="pyp8Cer0"
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:2213:0:640:2844:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 8C69C60B23;
	Thu, 19 Jun 2025 17:53:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id UrPtqvCLgmI0-dlGck7kH;
	Thu, 19 Jun 2025 17:53:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1750344825; bh=TFnT8rksRCUkHgk0vFmvFTJCSDIZN2HPazNQku+gKOY=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=pyp8Cer0jSVMtcjVrgDJqjPpqSsUmcId6ayTUYaow8Vu6AZbjvjoXT/vHUEV5+dP+
	 ugOEcc0ckV3d0CSSqIXiExUfAvG6SURIinqx8CW1LiND+OG2ue0EnrcPykko83Es/h
	 xyl8vhdILP8sW6k+wNZsl0OAV5XQA/cj7KF9R1oI=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Ivan Stepchenko <sid@itb.spb.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ivan Stepchenko <sid@itb.spb.ru>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: fix possible integer overflow in erase_xfer()
Date: Thu, 19 Jun 2025 17:53:13 +0300
Message-Id: <20250619145313.5823-1-sid@itb.spb.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expression '1 << EraseUnitSize' is evaluated in int, which causes
a negative result when shifting by 31 - the upper bound of the valid
range [10, 31], enforced by scan_header(). This leads to incorrect
extension when storing the result in 'erase->len' (uint64_t), producing
a large unexpected value.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
---
 drivers/mtd/ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 8c22064ead38..f2bd1984609c 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -344,7 +344,7 @@ static int erase_xfer(partition_t *part,
             return -ENOMEM;
 
     erase->addr = xfer->Offset;
-    erase->len = 1 << part->header.EraseUnitSize;
+    erase->len = 1ULL << part->header.EraseUnitSize;
 
     ret = mtd_erase(part->mbd.mtd, erase);
     if (!ret) {
-- 
2.39.5

