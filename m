Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E811805E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747521244; cv=none; b=Qp6gaMWVhfIwmD4QxH73r7j4B7f9G8np4J7cQlcjyN+3X9YMQ+TYzZQ3aBqmTK3lvXUppW8QRsrkAncOgC9KrqvLq3EtwwMfTRNHmnrYo+x+2rYSp6BrIYPs1PVOlkI2rGJoAqSQ7ZzXjqTGrbZ0Hn6A+edMPYACZ6rbX3nTdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747521244; c=relaxed/simple;
	bh=pQbsoR7Xo/JxnzUfIr3fZjU7WK20oqlwVRHRSYCfKiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JIVUmx9Xll2kcIq4W5B5PaLwlZ1OvqDxEBfQAZqU0ah0sxoCq4hw+HDKe7LQLa3tloVoHa5HxWx6xVgJZa2ciSiMJFmuCTwaOZZCLjv2FPUdvnCcPdJUI2K8QZQign/CVzSia1M/BHa+qrT1H+LClo8xH68AjzVnWjmRV0kOC2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7DLyRKJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7DLyRKJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a108684f90so2188746f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747521239; x=1748126039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzkktdqJCNLhRRBaWuTTOETckyWFDqCSM3iz7CxRh0I=;
        b=f7DLyRKJ3571mN5gsU2cYFEeIef7CH8fnVhqEH27A/lFZbeIB//14IV3QAjsszdVh6
         LQ4eUyovr2+Y7LLtPmRWgxULNXvKBRr1NV4sMQq287QnCaB/RQQKnXNATCv5EOpzHszV
         8AVbmYOlLX77Q8TnhOXJsemakDu/HdiViUqKbYzGdsVyjtDKXDd9oqiIn6xqsqEaeJH+
         MGedtE6j2fBbGGiVzMOXrJrU4bS06DzK/pMLaCnq7unetf+lPFGNOpS9L6iywHU+3XDs
         ogrlaJKkXVqcS+Lr80YHlYtNCgnI+0mo9CqEQyfS6HW94BAqzHVXjcZM/2RoG+ckCeiz
         LBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747521239; x=1748126039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzkktdqJCNLhRRBaWuTTOETckyWFDqCSM3iz7CxRh0I=;
        b=sCFS6a5sVAVZWmoSfsMm4qoFeZtJtRVeq0NRVvXtpXVA0Gysk5stXBmSwBAsoQOjlw
         nrOYzE0kWZaOyJZy3XI1gZPwLazBEt28+ra5Jvko02c7rT6r6RrZAb883s0hBe++yMxG
         yGWQ7WcVweLD/ASDXyn1yUr4bEYID24gK0uFZQPkuyPIwzJkhOJsDyiRXG5sKgNPXRzR
         PNseL1VvKLjPNOlsFvpU492rXHZS5ianmPtzShrTFd7ULB+Bmoo2lT/A17BrxUdIF/wy
         GumaqXyaiKYM/rvhh4JakEq05R9IsDiSMCq0sysgZ8UUtIEKtTyOwGfujfGmFWcCjLj5
         PdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWicf8t/e08Lmic5xprBzhSJwcaHE8IwI2NbKzT4Xk/nkZh39t52YkPU+72QEdmbvzqLPAM/zLQPUrbQeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKMCeuP+xra61s0Yf/AJwFafOanmO2KvHX6M/Y80m+eUezMaR
	IYDGbPHNkGBq6MGpizNfRc5epKRbqPKn+LXzFMN0cPAW7bTXoU0Ai08FblP7B4nnfByVEb+yMa+
	zv0T14C6NsQ==
X-Gm-Gg: ASbGnct0Jv8cPTMnz0NqWN8BmnKMBpxaEu6CN8gQeMZXMiEFL9a0Ej6bfTMnykBOtK3
	lbZhwOjLojBAwLAAh6NCLENvxiFh0oQPHLjZtZdokgFgM6KSnj5Q8ybv/v/65U50i2EKa6z5NGp
	IdqwahvjQHYIICiTau4G1mJaPJVROEMv7JVjf8DB8xMzRU+mayL+OlXr/eIvZuct1yCHq/kKiFI
	qVnfVQlabLox9xiQ9g0ajb+3bE3vFokfJQPmoziOlYvDIpxEjF03tJh0FfYIvsc9FdRDVTHLgPP
	Nuoy7SLQ+773cF2daxJFpedAMvwJwZPNBAmkops4syqlhKoKP/Y+NSmkZxmA
X-Google-Smtp-Source: AGHT+IGppK0l+Wi4DUbZRUynck6L0cfQc8tueoiS2IINvL8/BYVhZLix+P0I6hR/pSbzWUOrOm58bg==
X-Received: by 2002:a05:6000:2586:b0:3a3:6a58:6f99 with SMTP id ffacd0b85a97d-3a36a587093mr1019930f8f.19.1747521239165;
        Sat, 17 May 2025 15:33:59 -0700 (PDT)
Received: from toyger.lan ([2001:818:dd7b:1900:7a2:6834:4278:6687])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1f9sm7357966f8f.1.2025.05.17.15.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 15:33:57 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH] mailmap: update and consolidate Casey Connolly's name and email
Date: Sat, 17 May 2025 23:32:38 +0100
Message-ID: <20250517223237.15647-2-casey.connolly@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've used several email addresses and a previous name to contribute.
Consolidate all of these to my primary email and update my name.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 .mailmap                                                      | 3 +++
 .../devicetree/bindings/display/panel/lg,sw43408.yaml         | 2 +-
 .../devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml          | 2 +-
 .../bindings/power/supply/qcom,pmi8998-charger.yaml           | 2 +-
 MAINTAINERS                                                   | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts             | 2 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c                 | 4 ++--
 drivers/iio/adc/qcom-spmi-rradc.c                             | 4 ++--
 drivers/power/supply/qcom_pmi8998_charger.c                   | 4 ++--
 include/soc/qcom/qcom-spmi-pmic.h                             | 2 +-
 11 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/.mailmap b/.mailmap
index 60f8ed80ec10..cf2b76d4442e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -154,8 +154,11 @@ Brian Cain <bcain@kernel.org> <bcain@quicinc.com>
 Brian King <brking@us.ibm.com>
 Brian Silverman <bsilver16384@gmail.com> <brian.silverman@bluerivertech.com>
 Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
 Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
+Casey Connolly <casey.connolly@linaro.org> <caleb.connolly@linaro.org>
+Casey Connolly <casey.connolly@linaro.org> <caleb@connolly.tech>
+Casey Connolly <casey.connolly@linaro.org> <caleb@postmarketos.org>
 Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
 Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
index bbaaa783d184..2219d3d4ac43 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -6,9 +6,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: LG SW43408 1080x2160 DSI panel
 
 maintainers:
-  - Caleb Connolly <caleb.connolly@linaro.org>
+  - Casey Connolly <casey.connolly@linaro.org>
 
 description:
   This panel is used on the Pixel 3, it is a 60hz OLED panel which
   required DSC (Display Stream Compression) and has rounded corners.
diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
index f39bc92c2b99..862e450da214 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
@@ -6,9 +6,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm's SPMI PMIC Round Robin ADC
 
 maintainers:
-  - Caleb Connolly <caleb.connolly@linaro.org>
+  - Casey Connolly <casey.connolly@linaro.org>
 
 description: |
   The Qualcomm SPMI Round Robin ADC (RRADC) provides interface to clients to
   read the voltage, current and temperature for supported peripherals such as
diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
index a0f9d49ff8fb..90c7dc7632c5 100644
--- a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
@@ -6,9 +6,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm PMI8998/PM660 Switch-Mode Battery Charger "2"
 
 maintainers:
-  - Caleb Connolly <caleb.connolly@linaro.org>
+  - Casey Connolly <casey.connolly@linaro.org>
 
 properties:
   compatible:
     enum:
diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..14ca3b570231 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7547,9 +7547,9 @@ F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
 F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 
 DRM DRIVER FOR LG SW43408 PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
-M:	Caleb Connolly <caleb.connolly@linaro.org>
+M:	Casey Connolly <casey.connolly@linaro.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 712f29fbe85e..b9a0f7ac4d9c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2023, Luca Weiss <luca.weiss@fairphone.com>
- * Copyright (c) 2024, Caleb Connolly <caleb@postmarketos.org>
+ * Copyright (c) 2024, Casey Connolly <casey.connolly@linaro.org>
  */
 
 /dts-v1/;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index e5da58d11064..2cf7b5e1243c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2022, Alexander Martinz <amartinz@shiftphones.com>
- * Copyright (c) 2022, Caleb Connolly <caleb@connolly.tech>
+ * Copyright (c) 2022, Casey Connolly <casey.connolly@linaro.org>
  * Copyright (c) 2022, Dylan Van Assche <me@dylanvanassche.be>
  */
 
 /dts-v1/;
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 210a25afe82b..d92ae6b6100f 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech>
+/* Copyright (c) 2020 Casey Connolly <casey.connolly@linaro.org>
  * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
 
@@ -259,7 +259,7 @@ static struct mipi_dsi_driver sofef00_panel_driver = {
 };
 
 module_mipi_dsi_driver(sofef00_panel_driver);
 
-MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
+MODULE_AUTHOR("Casey Connolly <casey.connolly@linaro.org>");
 MODULE_DESCRIPTION("DRM driver for Samsung AMOLED DSI panels found in OnePlus 6/6T phones");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/adc/qcom-spmi-rradc.c b/drivers/iio/adc/qcom-spmi-rradc.c
index 63ebaf13ef19..f61ad0510f04 100644
--- a/drivers/iio/adc/qcom-spmi-rradc.c
+++ b/drivers/iio/adc/qcom-spmi-rradc.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2017, 2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Linaro Limited.
- *  Author: Caleb Connolly <caleb.connolly@linaro.org>
+ *  Author: Casey Connolly <casey.connolly@linaro.org>
  *
  * This driver is for the Round Robin ADC found in the pmi8998 and pm660 PMICs.
  */
 
@@ -1015,6 +1015,6 @@ static struct platform_driver rradc_driver = {
 };
 module_platform_driver(rradc_driver);
 
 MODULE_DESCRIPTION("QCOM SPMI PMIC RR ADC driver");
-MODULE_AUTHOR("Caleb Connolly <caleb.connolly@linaro.org>");
+MODULE_AUTHOR("Casey Connolly <casey.connolly@linaro.org>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/power/supply/qcom_pmi8998_charger.c b/drivers/power/supply/qcom_pmi8998_charger.c
index 74a8d8ed8d9f..c2f8f2e24398 100644
--- a/drivers/power/supply/qcom_pmi8998_charger.c
+++ b/drivers/power/supply/qcom_pmi8998_charger.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2023, Linaro Ltd.
- * Author: Caleb Connolly <caleb.connolly@linaro.org>
+ * Author: Casey Connolly <casey.connolly@linaro.org>
  *
  * This driver is for the switch-mode battery charger and boost
  * hardware found in pmi8998 and related PMICs.
  */
@@ -1044,7 +1044,7 @@ static struct platform_driver qcom_spmi_smb2 = {
 };
 
 module_platform_driver(qcom_spmi_smb2);
 
-MODULE_AUTHOR("Caleb Connolly <caleb.connolly@linaro.org>");
+MODULE_AUTHOR("Casey Connolly <casey.connolly@linaro.org>");
 MODULE_DESCRIPTION("Qualcomm SMB2 Charger Driver");
 MODULE_LICENSE("GPL");
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index a62d500a6fda..df3d3a0af98a 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2022 Linaro. All rights reserved.
- * Author: Caleb Connolly <caleb.connolly@linaro.org>
+ * Author: Casey Connolly <casey.connolly@linaro.org>
  */
 
 #ifndef __QCOM_SPMI_PMIC_H__
 #define __QCOM_SPMI_PMIC_H__
-- 
2.49.0

