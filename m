Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA52AE6D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749399358; cv=none; b=kJSJonxEqFbexlhAdPOxRGz/Sa8f8Fr396dwWQi9dPnmtAZIxezoNfdFu6GOcgeqQQGnIUsP7gGmzfo1GNZuy2nAV2oWF4qRbuCguFmZByQM7hhv6R5R21gzj2TTZx6/6vqrhsi7qEoDRyuJEtEkDWUfscn4hg/ODVl4JcRREPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749399358; c=relaxed/simple;
	bh=+TMXY3PgyOmmro5hM3GVH6HvB10aNdJaPdpBwKz/48w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfBfLJ/4MpiAnQzhQO6SUW5fJ9wufdu77eJNBMC/bBZYC8CC2TpMNKWZ3FqQPi9SeTdTYqtVMVv2bovXSoNKkFgcb3PKBmN//B+aUVDSxHdCavCtn6/rx7Jl0x9eeIKowz7In3ioQQ3mqOqxKtX3WupLxVBJC9FMfLw8L8CEC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=g8aLhamM; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="g8aLhamM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zJRQ3uMzczhw8zoS9UEtZ+ccogb2vXX4Opul1mk0vkk=; b=g8aLhamMQG8FXYMv
	1SQ4ZwRPE1V9j2pvNlDyOCRVs754GLZL43v4ICmC00e6gbx9prjvTJMNDzJW33IZaIkKyG6nqOfCJ
	ql8JinlHq7guNl01fQRbkMjcSpIlQa9TgtYLtdMVguhJqXDpjq450AMXELotre9deLytNp985hA7h
	vD9LDAa6HSFHZaU11xVl4MioTLvb26dPaQgE+hBcHStLoDBz1MUmtzQdHH3E0pXg+gWO2CmQeqtS4
	D1Futbv60MRufbnJvIpofHrahsXvg/j08rnn1lt23/EU4k+/wgVUGRO2bqbhj9shgdacaOB9N+rAj
	BNm4JMsV6l9NVANqYQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOIgJ-008Gsb-2B;
	Sun, 08 Jun 2025 16:15:35 +0000
From: linux@treblig.org
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mtd: ubi: Remove unused ubi_flush
Date: Sun,  8 Jun 2025 17:15:35 +0100
Message-ID: <20250608161535.90030-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ubi_flush() was added in 2012 as part of
commit 62f384552b67 ("UBI: modify ubi_wl_flush function to clear work queue
for a lnum")
but has remained unused.

(It's friend ubi_wl_flush() is still used)

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mtd/ubi/kapi.c  | 27 ---------------------------
 include/linux/mtd/ubi.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index f1ea8677467f..df0a5a57b072 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -791,33 +791,6 @@ int ubi_sync(int ubi_num)
 }
 EXPORT_SYMBOL_GPL(ubi_sync);
 
-/**
- * ubi_flush - flush UBI work queue.
- * @ubi_num: UBI device to flush work queue
- * @vol_id: volume id to flush for
- * @lnum: logical eraseblock number to flush for
- *
- * This function executes all pending works for a particular volume id / logical
- * eraseblock number pair. If either value is set to %UBI_ALL, then it acts as
- * a wildcard for all of the corresponding volume numbers or logical
- * eraseblock numbers. It returns zero in case of success and a negative error
- * code in case of failure.
- */
-int ubi_flush(int ubi_num, int vol_id, int lnum)
-{
-	struct ubi_device *ubi;
-	int err = 0;
-
-	ubi = ubi_get_device(ubi_num);
-	if (!ubi)
-		return -ENODEV;
-
-	err = ubi_wl_flush(ubi, vol_id, lnum);
-	ubi_put_device(ubi);
-	return err;
-}
-EXPORT_SYMBOL_GPL(ubi_flush);
-
 BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
 
 /**
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 562f92504f2b..c3f79c4be1cc 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -250,7 +250,6 @@ int ubi_leb_unmap(struct ubi_volume_desc *desc, int lnum);
 int ubi_leb_map(struct ubi_volume_desc *desc, int lnum);
 int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum);
 int ubi_sync(int ubi_num);
-int ubi_flush(int ubi_num, int vol_id, int lnum);
 
 /*
  * This function is the same as the 'ubi_leb_read()' function, but it does not
-- 
2.49.0

