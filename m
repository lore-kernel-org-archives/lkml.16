Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699B243387
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748485344; cv=none; b=V4/YHKVCIpNVCm3MqIguISu1GZoM8zJZJcysXf0mFv4vAb+vLcuOfm05Qgwb6gNuAqguA5Yjy3ggwzrnmZI7FAIW1in3MDByOA9f3/NXihzfcTSpZW45a3dYi28ukStGKaeDiVzna6R8QN4v4txnkYFe0u0eUjrM5MpizVzFKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748485344; c=relaxed/simple;
	bh=MiKJ98aYp/cFAB23MDjYqgqZPuqeZOGrkWqwoX5FoWs=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=IXhBGjZJFtH4hAT4PQkVAsY+PW3g8Kcc+J+id89lOqP1Z3aoAq052CZKkaWLpmBrUxKBHIoZwNtrMqnn9WsPKl9+6doo6kf/wNN0KxSwH5PEKF6ln+JMwmQZP2xaCkn2Y8XzC76P550p3C9MQ7qHa5oyx+t+CKdmZkTjVhc9z14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b79B274JDz51SYg;
	Thu, 29 May 2025 10:22:18 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 54T2LxxY019807;
	Thu, 29 May 2025 10:21:59 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 29 May 2025 10:22:00 +0800 (CST)
Date: Thu, 29 May 2025 10:22:00 +0800 (CST)
X-Zmail-TransId: 2afc6837c4c8ffffffffdf9-534be
X-Mailer: Zmail v1.0
Message-ID: <202505291022003179-UwGRHwJQ-a0Mox6S2Gg@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <hayashi.kunihiko@socionext.com>
Cc: <mhiramat@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <yang.tao172@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?YnVzOiB1bmlwaGllci1zeXN0ZW0tYnVzOiBVc2Ugc3RyX29uX29mZigpIGhlbHBlciBpbiB1bmlwaGllcl9zeXN0ZW1fYnVzX2NoZWNrX2Jvb3Rfc3dhcCgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54T2LxxY019807
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6837C4DA.006/4b79B274JDz51SYg

From: Shao Mingyin <shao.mingyin@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/bus/uniphier-system-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/uniphier-system-bus.c b/drivers/bus/uniphier-system-bus.c
index cb5c89ce7b86..ee8e432a5277 100644
--- a/drivers/bus/uniphier-system-bus.c
+++ b/drivers/bus/uniphier-system-bus.c
@@ -10,6 +10,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>

 /* System Bus Controller registers */
 #define UNIPHIER_SBC_BASE	0x100	/* base address of bank0 space */
@@ -120,7 +121,7 @@ static void uniphier_system_bus_check_boot_swap(

 	is_swapped = !(readl(base_reg) & UNIPHIER_SBC_BASE_BE);

-	dev_dbg(priv->dev, "Boot Swap: %s\n", is_swapped ? "on" : "off");
+	dev_dbg(priv->dev, "Boot Swap: %s\n", str_on_off(is_swapped));

 	/*
 	 * If BOOT_SWAP was asserted on power-on-reset, the CS0 and CS1 are
-- 
2.25.1
