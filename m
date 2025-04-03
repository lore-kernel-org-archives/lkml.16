Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41885243947
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670747; cv=none; b=IRYVC+9RP3Gng8mALpkPDQs7iXdyxt4Ib7cSyGU599YbtvQz1bzRm3AjvOw07if7dxH8OQsIgaK9AA/2WWW86n7K0/FIwGzcmFuTREzpYxwmjLFVfnnMxoZupMEbIgzjQfMddW2DXaF5ekE0PjHJE/6atmWNgvZjCy8FdOLfSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670747; c=relaxed/simple;
	bh=UlkZld/wRLMptXmKQwcze511hrG+hJRq5bCGkApcG9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okwa1p4FnjkAxhuVxB4aacBraSi2E+TsN4AYH32HuXh6u+3P61z03fGO2anjgG4TT440WBvj7kfa1lijAl9scFXaXQKarujX9RRoFucfh15EQw0lYXEQx42FU1XSY9Nd3JMwc+46I7PNRegmL1aKa3P3q3qSVSt8nBeXUvy+0Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WiVmgiHj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WiVmgiHj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so1319099a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670742; x=1744275542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=WiVmgiHjyHP/0yfIw3e1J63bfZPyDlI1cSJVkfOg4jncxVrNobdRoMwudiWOkj8blU
         W4ryDzIrec9tDVjxilifV2VFYuMuSBAj53NFZFcbhGWCuBS6Uyu2sRcpSK/YIBEgRQ7+
         2nSj2z7VNTb4YbZYGzuz1x3i2R9ecKapUeGGGofoCYJpwDAmQyeU6MJHi2hZ7mlHtauM
         rwIe0VSStT/Xejb0/F1SK3BlnSChpG8KX/oKntAIQ5RHgPKaIpfrZOvGuHjVX3aV2u7S
         XbApIj5pGLkqzx0Yt4GWIL95XUJ1/8jfINBdutltzW8nZo366R3btRaGVAgkcSXLLs2n
         sxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670742; x=1744275542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvnZunCYyaEwV4fUoehy+lbIydvSzIujDoR6jNNiKRw=;
        b=WtQv+P4CKVWyOFzCagBl4TDlS8i4rTuVWCUq4liwXvDWM2qgG3G0aKINKEWMsnTqpM
         7IdNxxu46peJdgG7mQm94LMRwjBQDHD9nAQxFIuAPczntklJHxkrt0wiN4duIYC3XK5X
         kxIZShHQyjvto8zSi+XKyDsAl5jvCmXK8X03z2FNYDJajtj0E74ZXJVdskzdBUG+knsq
         KApLdmIEjpGwpAuBQa5dKC2X+nIL1O+9xdC9Fcqwh8GV57a2mLc68rr/TgwfRfZfitYL
         ngZicA31DJQkrSoUW0Qqo5GYlGjiUQgSLsVPQXZNQoJETS0KGiQooJViEDcBcDG2SH2U
         C8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKxA5zvhkyDD6/OFX6UcTDnljm4suYzE9vcqOCB9CCQd76aPbpfGhXSzTFu6r9EmCCJ5kAePbMT+wZtu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iEWO9tUduCeQQgwrmWX6sQOoCC9K+CRM/Z8PxtbYcgHNUOV6
	1lYS8wsfBLlWvsgRF1TDXBQTyHPk9nHIogAcLs5wDsUAjFiyDuDBvZjNpPU/ozE=
X-Gm-Gg: ASbGncvFox+nBcCkb0Z8Bx8uRlA5uDdBsn0kgTPbYPQ4yJOF9NbHChGD3maBQMBsJSk
	Ep3beIYCUBCgPAuSOJhK7cH0nrf51f7cp/oIAGbFPWe9M790I2Q7OS8l4HYA+cjcoHADOXauv/0
	HQJ3OWJ1NPqFOMCBwjIMIEBj1YfHjonYo4XBulAjCjOlR7eVK6ErEpNy2vu63BRP+OOvk1165F/
	toorQD2Own2peMdOLBF5enZM4PyTGAUPIKB7otG428RibgcUnDiiIIy1S+kov1i2Dr/EnwVwjbg
	AcmfLYy3iYwY42NOtcxmKvk5wtzDxVQiobnDSALGmKGPezqXoA8EZnOXYyUkWOHbu6o5wG5LoqH
	rXQPP0F3IkAhJIkuGeBaQO4KOiKT9
X-Google-Smtp-Source: AGHT+IHLPvSEymTsQ03JgORzrfz3sWcW5LSP8Sp0KzcMY46wC//GzsWqGdq35W45MXKHrK74iEdBWA==
X-Received: by 2002:a05:6402:51ce:b0:5ec:f769:cfa1 with SMTP id 4fb4d7f45d1cf-5edfdd155cfmr14720447a12.29.1743670742249;
        Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:57 +0100
Subject: [PATCH v3 05/32] mfd: sec: sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-5-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

