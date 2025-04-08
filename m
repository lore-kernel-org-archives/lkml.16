Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B52356AC;
	Tue,  8 Apr 2025 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126985; cv=none; b=sBxGqWarj2VVNwpc7J0K18lAzlEH2mWSiNymqoCyvWIwD3FbK+bYY+gbXgSfj2RVuaFd1icfI4zPwtay+/gZYyN+5muXvWwlrqbpodDbE2L8ftMXRANmhqp4j1ddB94SNt7vPg55GduBqY4GXKf6MDhDpFMKtL1H70Lx31qKsy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126985; c=relaxed/simple;
	bh=n1/mnxdtmAPmH/0yCHkDnFu0hUsdIiRl4rwzDoAtvHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1nNxFYnRug1RgP2/oK2DH0cbNOlXyVAdalI3jJDBOwJfq74vBqp5yXzwLiF9JaAN/qkuJYu6pt9TzndlfmNM9k5NkKhTTFvB4yGdhGCyoXSdUVvKkP888Q+DYb464NaQem+p3Lf+mYMLLPpHj61jfbGPGLWx+QOq2zXiT65kbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMIc5fjK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMIc5fjK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so56969455e9.3;
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126982; x=1744731782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=;
        b=DMIc5fjKkLV0Dpo9LDyU1KTBHIyeC85XD9AZceu6iN+fbPJ2K0roIjAFmnhqP35QjN
         W5QvxjxCQzRKHrHa3Z6iJyBRptGnMBvYrkjfif194FI9Y5gcEkbYct24aDRuB7PccVlV
         SqLgyUUxMzh9oAzD8Z7EwDJpTjXhm8d4mbru0gpKj4fElj0W5ZkQFD6k5+dql7K1g0SY
         Uedf+2hGG962jkSWqHG1oUSV/mqZ5iI92Duz1XQGtGrqdiR1ROSzgBB4D0x7pS2x8Ire
         7AZHaAdCHg4iEDrcvlkCkb1UO/41UPsXoH/MLohwNNQpiKjfLyKLB3B9nv6NZebORENO
         MM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126982; x=1744731782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=;
        b=VxQvYN6+tiqKmlIKV0FhOQ0SAn14jQ2/NXjkZCXJ5e/yNRFZyACW1orxQywMiSiCTq
         YXYZsB7Qs4KC30NboZF1fme2MXeMVlx6k5D1pRlze+KzMzfaZCP1QiQ/Mny2tNNucNpD
         XaANO0TbCTAs2/J73rotxU5NEeKMqFgeZ+sM5nH7AnIaHffWr4vmnEHn8T3L0QkdSKPn
         uttrc4UNVzxXhoUqATbYUHukDjJdRIb0vJ8Sg2q2N0SIXOxGc8VWSdwDNMe6ynirlglN
         nlozULHlF3ifEIi2MFSi4xJkHb4DnE9tZW0pNdMZ1WIWUAIYExuksChp1r1RgsqPKCv9
         g7pw==
X-Forwarded-Encrypted: i=1; AJvYcCUD61wjxD021t5uYfKHvubWa802jpNrNq3Bkrqodjs77hOktUziE5VI/8kIZdLBIdbVK17z8hXWpG9P@vger.kernel.org, AJvYcCUFbhXjfJQfZui5q/sGXovjPKgIOMUjIU219RBUZP//QGxjcyxVM3mEBjkBc0O5kBibBdKrl8zoUPCri7Ie@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4UoOcA4a7C/bMBXDtj8VBOqdEcJxhA82XSDJJwxQi66HXQSz
	+eSdp9GmLv8bsRjBDI+Huk087yOyjhJd0EBeSPTUvcmJwmoCT3Se
X-Gm-Gg: ASbGncuRtQxfQUTboDVLvGJtqdZxa/zZzDRbwe8/krv7fMXGXdjavBVVK8ZFryu74kb
	qEv1Om9E095ZL8cQ8URV+KB3iluvMsxtC7zAagMu1tRgH8uzNMJlGCXkFCCkfrKW03N3U7SIOfK
	a9wPQ26w5swui62wrYblCAllT6evsgvQbbVHd+2kdKPyWD/UzWx7BinXLWE/gCrpClJymG8StMl
	dzAkALnYpNWvi6PO3WWeZ0hGVT1KBVEcdpBzE+LgzZy6UGNm8mpCLFoIDIJ+sDB4Z0g5D7M/+ic
	toyiKLGP1oMMQFDt3eKrXk4s4IF83c0ddNOC8gFxuNEKEz0CAUt2QaRhTNkHTQmJcfVeU9lS4Gh
	zEX83ZYOUkzHzB6glbg==
X-Google-Smtp-Source: AGHT+IFOFcncwKUYi57UNaeAvO+49/JOi3agiI45bF7fu89GYair4F29jldwkpCUEx5THNXGOXM2Mg==
X-Received: by 2002:a05:600c:1549:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43ecf8f2f4bmr173448545e9.16.1744126981776;
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue,  8 Apr 2025 11:42:35 -0400
Message-Id: <20250408154236.49421-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add header file with AIPSTZ-related definitions: consumer types,
master/peripheral configuration bits, and master ID definitions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 39 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..b816cb6ee9d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER 0x0
+#define IMX8MP_AIPSTZ_PERIPH 0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL (1 << 0)
+#define IMX8MP_AIPSTZ_MTW (1 << 1)
+#define IMX8MP_AIPSTZ_MTR (1 << 2)
+#define IMX8MP_AIPSTZ_MBW (1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP (1 << 0)
+#define IMX8MP_AIPSTZ_WP (1 << 1)
+#define IMX8MP_AIPSTZ_SP (1 << 2)
+#define IMX8MP_AIPSTZ_BW (1 << 3)
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
+#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL					\
+	IMX8MP_AIPSTZ_MASTER						\
+	IMX8MP_AIPSTZ_HIFI4						\
+	(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
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

