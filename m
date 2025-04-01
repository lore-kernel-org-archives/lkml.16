Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6889220E33D;
	Tue,  1 Apr 2025 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522361; cv=none; b=GuhRGyJvHFQi4NtpksMethFukaM5QQQWpuDrxS7Sn0GohjdUHgjfsNWJaQOih69mw00ph6+7+EwzfcQ0G9pb1E0tTJRjXzHmy5AtNkIGolCMCOR/FvoaU0xCURDjJFNjY12yNGP1d3LJeQhrnUC0AGomc3q0giYgfekcO+aFHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522361; c=relaxed/simple;
	bh=HH0oAiXb2UmIxHzrzPgqGqA5ibbNu6HqpAv4SPnDq0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gWInj5A9IzukuaLGH7w/4dvgRUv58OwstNkZZk4L+6Re3KrBL6rUSDgRSZ3faZvV/wkJU+vWEVGJ2PMSRDLeQiUAT7HaVeTznMDpSMWYNzAU1m7ExYCJeqQKq1RX0NR2PWmwncUxvIUiKQuNdCQpSn77ZZMfVjpwmk7CTtGeEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9+tFLoR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9+tFLoR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0782d787so38089035e9.0;
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522358; x=1744127158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=;
        b=O9+tFLoRdL9DBAdzs+0Q9yGXyBYarU5eUUIEVrVLyp+ZzaRoW4h3V1IFDFWqCDo2Ad
         Gg8a6mGsiUZ3OTkkDfK94x49rqAoRphpBJO1qrt2VgzuPoHWKl80A1XTxszPwiTRQk/+
         Tp9i9owTwL4h6KYO9EtAj2ZpzFpBpZbNNK7cNLwgj8xFeLdD9DePNyfAYYCrJcAAQykt
         G3I8VCzg/yi6cCnc/4217j+Cpb8j6nCy7YbipjVntGKKqd+zp/XGKucDxUuhgMLMdKiB
         7YOx5BA+Ks0shODnHVyCgfpZqLBfOgd0lCBE6LtNdRyjJl9AQMgbn32YCod6sBqna1I6
         +qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522358; x=1744127158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=;
        b=pb5l0JaviqKIxR3uV0EeqHUyekyFxX4F69rlviu0uUVn6C/5tjhNajTYogsDqvff9L
         szaBEacSylSW+uS/DgdOyB7pOetn3TZF/Sj7182UP3ZnWloBxdoOggHkLXm8zmhGQ3n7
         sj1h3GHmcYr9gxkGC4rIotsAHRwKv+WTiGil5q5kmT/nSgobp34GI/d7UBS8nsXV/Rlt
         qNmi6nJG63ETeL0fpgZc5atcEIcOiR9g2ZzmpIhagyJ/IrRTeIrRTEV8QSVVawSBDuPg
         cOCg2K2rgXYhCkUsPEiXSN8jaxVXlVdDnZB0JyTPWjONekUlWYDD6wUqcZc5kekvFRcg
         L/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUqJDXUZgDPfIM0Gfjtx1qgUSOf9fSlI/H9O8eGZk0H94j+1KmOzIBnz4qK3zMT6uCsBclvS+YjDBBFvp7h@vger.kernel.org, AJvYcCWTYtwYXas8k3Qv0uDWVE2++NY2OhVdYzd7YFwjGZ1yFRwf0GRKMHYn6GbeU4oFkKypAPmHaTPbbGxe@vger.kernel.org
X-Gm-Message-State: AOJu0YzsSc952g0Yh9D/ev77CwyqDbHDL0qzRFCje7yBtcBAN8kH/Ir7
	36CynJx0v0RYRn/QOh5rnF/cEAxAj712Fm8Rm+Q8EnaB/adRMZ5l
X-Gm-Gg: ASbGnctcKlZREZnoiXB9SIneZ19fwOyl7dDQQmBWZZ50mHnNZkVvafFZ0Br62dG+MAZ
	O2B5Wlsf8azqyjwPpMxE1frMi96ZT+BGVrtMf0ZKeMlOE/w/F47czYByZfn9EVXBijrkK/NfmNr
	THOMfoKUJQ+unBMawG41k8d+v89lJJljlOGh6f7Vp9rEyd7CIZ/qmhqphJsOCTkaLAKsp6C/pRD
	3CWeUnb+2N+s79dEgk5Jr9TlPj+Dj/rpAzlnkrilAYJlqBuKsfcVZ9Sa/vPIXWshmc2DyJf60KL
	fnSVaowmN1Jk4v4Fs3+rN4ioxxtCF0Xa3XADeZxZxLQBrp/kALapTt3slh1/SJsU6XKrU8UE1tg
	2H+12grI=
X-Google-Smtp-Source: AGHT+IG9ZYKWN1b40JEhYbcSZx3uZ/1WRX1tT2EFyx9rWI4+Ii3DekqK4BS11iLLv97oUFUaX8G+Zw==
X-Received: by 2002:a05:600c:3d0d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43db61e0584mr134804935e9.2.1743522357576;
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] arm64: dts: imx8mp: add aipstz master ID definitions
Date: Tue,  1 Apr 2025 11:44:03 -0400
Message-Id: <20250401154404.45932-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add header file with master ID definitions for i.MX8MP's AIPSTZ.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 25 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..23725cdef23b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+#include <dt-bindings/bus/imx-aipstz.h>
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */
+
+/* helper macros */
+#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL				\
+	IMX_AIPSTZ_MASTER					\
+	IMX8MP_AIPSTZ_HIFI4					\
+	(IMX_AIPSTZ_MPL | IMX_AIPSTZ_MTW | IMX_AIPSTZ_MTR)
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index aa7940c65f2d..ebbc99f9ceba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1

