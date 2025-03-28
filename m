Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6168619995B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168666; cv=none; b=QG24z/AuqVsFN7Yh4vRgw52YWAB9ZLMsUKtHoKpxUb96mSVMMwct6i3IG88N2o5Mj5JDAkw7TXqc/WUEx3Y8avSuC2Ec/dHQV3JS2GsVHUJBvmlbvv/XkwSv/V3EVZ9XVMDu+AxZ49E4xCbZ9/DvTHdMXkm9brKe/Bb+P0PfIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168666; c=relaxed/simple;
	bh=UlkZld/wRLMptXmKQwcze511hrG+hJRq5bCGkApcG9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyo1nMfRn4pBXKevnzS490uIY5FnLzRnQorUBGwY1jhYRcTb22xfJ60MPDdZxYVAGEXta+ZnPCNCLv+KVUT04m4nQwkEhXnTp5ixI+K5U2jFiGD6Mx3wrMff3cxl13Eac4fzqSdZomPFbCFmOWatqh0kQXnJMBQjBaaPywpQjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=up6ypTB6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="up6ypTB6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3356449a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=up6ypTB6ptQ52jARMKn6f5Hj1V6OdKjHv9DOhfECZ/FK5TiT+ScL1BXQ/fdJNETAA3
         xavnUuzVqDavZF4dw20deY/UR+PUIHmYEXJomeE6ux4HUpCNVhfr3QMDejA79CSCJl2C
         cb7faVl3ixYs5hBA/d9MhtEZLJLTHExhx31zHQ3KN0aPruxxP8SHOO6nnX+6eu484+oZ
         LmKLXn/i7Q0EdPOJSK/ZSzhmcmehEkfDbG26rurID5ffa3pTPr0EZiOwawKIKetaa3i+
         Bsjdo7bLrDlkCBy/My4LuAphaip8hRtrO1jSIyR+X1oxIfNTZkzwybutZJvBFSwQMVm8
         rVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=FS+9E7CYbSdblTCWj6/hWcbi1DJ3mhhlCP/CBPqmls5k/uwr8+7BiKUoDJzI61rd2M
         lDAYZPoD6B+1bv2MlvP8MNzYH7IviQZ0aI+tBJEw81gTQhyRgfxiTJ4Z0voRrvWoRRQ0
         vefw0yVMrFNTnmfbJVYZqhJeKy9Ox+e0/pTpfUUf8NBaWM0aiuNwHsUYfid0hK7y9hrZ
         WQ22y+A+cmrbnVs2/K/NeWD3NGotWKGnEtxQhYe4juI24S+Ao3sHIJMD6gbv5pNIYAEy
         szPKWmc1SC/E5VyxWNNKT5Lmb2Dxq3fJBuRJ0D+5mSdwK38XHcrr2mBreOgFujfeEDkU
         PqqA==
X-Forwarded-Encrypted: i=1; AJvYcCXLB3982rQOwx3mULWXy+ZKBjFnJXjFx93ORFbbzh2+4CNOHvFzZDSsTSdRd09zNY04/bwZCZw5sW8AyZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi7ZmdimuDFZhbQBrHISNExIand9ZWFHMabR0oE8Oq0bydjsH5
	io5FrqMLvTQDR2+xnqEJb18HVRa2PxRNpGLxd5sFkky2cuQCWRhn9BV8pVSmZPE=
X-Gm-Gg: ASbGncu5fPgl2p9HQEhh/gIoqSxvFBkVaLSS2l8+ePAiFd48EoqxHr2ZSE1WJH/P+z6
	7nqsEfwUrXiN+pnFU8RAI3/g2stvO/BUHdanXA/0pbZ77z+PgHq7AxnYuwJj3Kvqeo9nSfYPTpN
	GdbHI0GmKObZ5Yaz/W4icaA9dVMV66czyuujO6frUP53BnidiPf4aMSJsX/eInX/M72GoaNufZ/
	4PDiltw7GTv5+aBNYT/5wxHN94PuC7oacC95Fw3Q+AXjTYWkhyJm5COYNwK0JdOxUfOyaVWKsIJ
	imS8cp5hsXo6LKrzUz6yhhqTi41+kwTtA0u6iVVNIcZ5sL0T92OSanxPdLkCpEpeKuj6ABboRYP
	/ngp/ec5Fnm8apduX5FVwuk6XawJT
X-Google-Smtp-Source: AGHT+IFSv1dN8S6YvQdBhrut9H7MyYLkPc2NAR/e3xh+ZGzELkDUwfqEGTXxlFtku9FFJFYLhMO6Ow==
X-Received: by 2002:a05:6402:278d:b0:5ec:9e9e:3c3 with SMTP id 4fb4d7f45d1cf-5ed8e256dd6mr7177184a12.6.1743168656056;
        Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:51 +0000
Subject: [PATCH v2 05/32] mfd: sec: sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-5-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 14 +++++++-------
 drivers/mfd/sec-irq.c  |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 3e9b65c988a7f08bf16d3703004a3d60cfcb1c75..e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,16 +3,10 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
@@ -23,7 +17,13 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 047fc065fcf17f5bde84143d77a46749111ea5b8..5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,9 +6,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
@@ -16,6 +13,8 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {

-- 
2.49.0.472.ge94155a9ec-goog

