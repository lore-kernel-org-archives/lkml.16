Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91240204C0D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966672; cv=none; b=fS5cnoxmO1VfwXNFoobNEeqYXenC0vk+CNjkt11lX5EAMkqSqv+foX2n3bt8mGMil795EJLhhgoVbSvMB+nLCunIUVNTkN14DERn6SzQ0x5c3DGv6YVOsDduQB8pCrnz6ZkhFgfl0CZ6N+kpw2cP5uydCzDr8OW/5XvWCVU1+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966672; c=relaxed/simple;
	bh=1VBWD+pr1gDwz1nhhp79tshupOUilvdxBmYkOXGpHbw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=qq+JxO3XYOvglAnvB7J4Jp8Q+eyGwm9Enlbc+y51OvG5xflZ7j1JzH6RungfyhZS0ceBeTmhFGSpW4g0T257jyaibmRa6e91Y6+y2mvOXgvmfDHW6brptxkwSEmJ2MuisuEPHVD+Xm8n30s6zda+C+jAkwi3JSECxAzppL3GCig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=PpCQ89bE; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="PpCQ89bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744966666;
	bh=X4jkvVHMspO7XnGg8sDV2xlWadaOaoxQGrWlQefT+Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PpCQ89bEHPGrpfqn1ChLjBexL7oDn6Zvfy0NtWVdS0bZHTcPquF+tDoLsM7iD320q
	 AcBjNn4r6eTtIMdjjbUprQNMbFh9IE7PosFP764Wop0CbbaouwrC65WtI2b7W9floY
	 Ye07k/LY10bOakISPLbtyO46OFiM595rx26vWn0U=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id CD9B2CDC; Fri, 18 Apr 2025 16:51:25 +0800
X-QQ-mid: xmsmtpt1744966285th1u4dd4r
Message-ID: <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieI0g5xoRW0AIzl3BHfJuwK+mHjMJNFCaXlHpQfHiyKJFzNZ6ISw
	 U+lL2HfNmfXrHGq25nPN6W4dTHN8m7lQIanARoQArPJtMWHx8dWedVehVkmPc1qAm0nENEm5C/An
	 tni2g2HQ81aZwKhIZXTonpo5SsCtGe2QCeZRGmxAKGEGF+q85JS2FQiD2LPlf3Zo1Cfe+RB97WU4
	 cir0JL1SoTLZv9K6ODtXO9TrzfaRApDVvrQFKjDkhti95v0otJuJZQY8i+Zt5yTsnKgx5HtSK3P+
	 kMdv9f0y3/voG7WoInUdMK7FAaF/fM9gEtoSNSUilm4zD/LkGgCDfth0/f33BupP8d9C/Xk1LlFW
	 h2xJHw+YYTVSaA4xPNsHVanDmyKhFqLHEFx99JkccU3j9SozjCTJhQhyQXc19S4eMvlFz1DjvBQj
	 /dyLM7urzy4UeqsN9EujP030PtpKAz9DJZUPo6SNdfZ+zs7FU+w06yZ0M954O2QkQBQK321YIkLR
	 0lKDZSIGbS/E/Lki1t1HqghN5edciIUTPCxJcFpPPScxV661d9+T0ZUnfRKgZ4+8p6cx0Wn/6Nu3
	 +mwNj/HLPrLLwVHnbwCCR0jU8fnWzDhnfp4KAv3fGD+aZsevAKI0qdCMHcpWBCg8Pu8nGvUzpl83
	 RJAFjxa+PBFAox/jNRH9jKZs2cWD6VQWCGl1V/4FxiR4icFSu0uhPymIaCGqphehf9Tq77Qo+btk
	 df0371OMnL459dxYHeY8MgoE4PODVTiAvXpD0NdBhCOO4FRMTr/NIpgsp/gfJ6wzF1p9SFWx7xuc
	 MZwL+ENkA+y1timnM2pOZw1mRRowFs2WQ4QmwODOO5NopYo2UNH6sMo5IXp/Fu7O02JiVrnfXkCp
	 ftVL31yLG7O3bJ0+gD427g9mC4/e39iYtA+OzdxnTC6ClNTpME2Ung1+JUnYzqEwALQu6hPWTmi+
	 RUdRCDCT35sDATT2kbkoNGwYAMdj0yyDW6g5EuSo1Ke+iIzEdW3TVXSaTAFcw7
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: xiaopeitux@foxmail.com
To: linux-kernel@vger.kernel.org,
	f.fangjian@huawei.com,
	robh@kernel.org,
	john.g.garry@oracle.com,
	andriy.shevchenko@linux.intel.com,
	xuwei5@hisilicon.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
Date: Fri, 18 Apr 2025 16:51:23 +0800
X-OQ-MSGID: <3d4093ed1eacc6a8b75f6115ba5d149e8860a62c.1744964101.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744964101.git.xiaopei01@kylinos.cn>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

linux/console.h,linux/io.h,linux/pci.h,linux/slab.h
are not used, this patch removes it.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/bus/hisi_lpc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 53dd1573e323..1fcc3f51f9ca 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -7,17 +7,13 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/console.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/logic_pio.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
-#include <linux/slab.h>
 
 #define DRV_NAME "hisi-lpc"
 
-- 
2.25.1

