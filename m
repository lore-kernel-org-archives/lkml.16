Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62583213E81
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231058; cv=none; b=u8RAlc+xSlIiBjsheD96VF9tXlUpYVX4GV4Mnn37EWhm7DHWZ4mk43rcI/TK81/Ny4dZqWvk/DxbDHJGWS6XahtTDol3kw93gpw8E1q2+Qk3WFs5OR0cPA4AkZVDILj9+mIsL/wwW+Ry6eJP0OSXMbC+DO63eHg7lPFVLmcgpz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231058; c=relaxed/simple;
	bh=2foMlVQ/rrFhYchojsGnx6WEkHW4CBP5XOWmzyZJG5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLE8krbA6jDmbWuDZZ8C9BTjAn2UN84cpX59fwvu7nJ0WlV/jbAZBwRq83/r/0Nq8g0ZwKAeYUlqTK0kxwXKuRNDZHffxxFjhJhHANoz6V5MyBbKqYqclbR0xOfApImd7jl3reMoMnlPwYeb1dXnxyiTs35oqQr5alZbcY40JzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xaSuIRmi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xaSuIRmi"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230705266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231053; x=1744835853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=xaSuIRmi8kjsXYQ9y+82uGmTrNho26IN9SuOVRmXC9WFTSoT+u7XxWkYmUrErJMwy5
         auYVbPydBSlFzRzgu381KmgkS5H1JyIwu1hwRb391L7SR8mfkfU0sPLkk8tjnIlqFJjk
         /7t07kiTL3SFK69eleJmLIHPKXnu0USvsBTGas8grLTmvVLANGeeLr/qNvw4tbA0nmmK
         i7nNFbF06TbwPoO8nJd2vzF79eUOkdLTTUdjsLPzoGwisByssm1w0YJgH9042G529xuk
         EdNKRo8RQACtB+yW3kEscg6TMi3y0XFKHTECxnFa7doqw7cVZh+r48suOonQYASZqSh2
         j0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231053; x=1744835853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dUWnnbmvdHhYGfFFJml9oJoedUjXAR2wlXNtpTeJXc=;
        b=fkSEHL1Cpg4jGKeTF0jFZPJw33RkKJEMj8U50eJg9BdP9YTmTVHW9k6E4VTBGLRq7T
         FZhiytzEC1SlLMBtaWfRZcks6y9KKDVRIvv2bEmtn44aJlVUw2PJO358tbfxwalNNPat
         jkw8a09NAaELeQFzD9u4Vzi91KA+jnWO0aTGbAEmhaeBzPlEN4Y1oAlGDZ7VlK9m3aL0
         BlI2L6/XOMf7TYLjGFCHhiWSVCbjg+H0C5e3E1wjOZrKLZyoEeAFjjG1IxozT1fAQJjj
         HjFi7uO4friSgouAcYHTAN0SazsNZt3WN8WXhU2LlJXi/pa3Fi+i4prKJSaFYEf+2xMW
         So0w==
X-Forwarded-Encrypted: i=1; AJvYcCW4lPua4qqmFHSV5OniaC5b/2Vm5WusPEjnpudomqnc2XRg6gYMMW8siquaPJxkLQadcUMaWIvEHp33xBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlNuR/4iaJbtGOB1dKmfk/wYc5i97vqPeEVJTR+wriaiHFUuL
	brlZ/bJ5zDVx7HLoFyXQWlvuKZzVOFXUeukxTG5Q4TSGmeaPRJeMCA0TnDn05uM=
X-Gm-Gg: ASbGnct/8GY8hy6unBCy6QBwoRACBiGJ164EPAR79QRokwvefqv048zBs9qgvCXPb77
	htLaPMRxpI0/+kv9P6AC2nBap5Z1/vLGvsVljPgpZsXwAh99pVPjMmJeQSylmqG2GqQifL7M4Wb
	RWLb41Y05tSlnIvH09o4vMoHzYxMzpL5GW6zjms8ZOX0PMPTnc2AYSaYZwVwbC5+99XWu0w/1xv
	M4udMJ2iOKF3EijaoLTwY+lzO3Kmg829mdIZ8N9KrLJU0oyrcAr3ACV4YxUvMiKFfhcmYlmO4i4
	20vsQ/pB4+ASRPlPb00p5gUM8+XHuOdH0tTN4Y7fUs0kzAwBs2SMqFijogjuaOmLeGhQVSgt85D
	a3iFjdjw5FQpOAid+PIsVqwYXUPg=
X-Google-Smtp-Source: AGHT+IHKPyqKkOQl1VeMSZiViKNNp2YZh/sxu3Ut5v80bTjVlkCkL3GxyPP6wMwuQ/pmeL4UatLsMg==
X-Received: by 2002:a17:906:6a13:b0:ac8:1bb3:894 with SMTP id a640c23a62f3a-acabd25168fmr6274466b.7.1744231052992;
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:28 +0100
Subject: [PATCH v4 07/32] mfd: sec: Move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-7-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..d4d577b54d798938b7a8ff0c2bdbd0b61f87650f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21407,7 +21407,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.604.gff1f9ca942-goog

