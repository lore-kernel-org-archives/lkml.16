Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02655221D8E;
	Tue, 15 Apr 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737672; cv=none; b=nkVOWBZUlBEtmtTEPRKlC4+GCg3JkS/bmkLirf9zoN+6zSx+jh+NUy66jZgIcyDmnRYqOPErBCSodOeh9cWivjXmhoc0EtMVp0xqykg2Ux/157IpNIXcDJacGRG32X/kjKo5OtKIuCBDFVju0uQEYeSk5cGV49VwudgQc2pOBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737672; c=relaxed/simple;
	bh=jhENJ0w4vz6KVeQI9RNy8HNZdBwnE5EMBVJIr+vh5qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TqT4y5XrpN7NhntCY7yxaZRlx8fXtyxvjxsA498uZNLv0um2pnW+/1XpX+d1ykuex5rHU/wIfBosy/mVzZ8XKFScgFVAEAg3HkPBX8+K92CFjO3+5gXZNwJXrlczWv6o5kJxyYf31deoHodoTKUF+sCHdTWVfBzab0E2dCZEBp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efM02cla; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efM02cla"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3954783f8f.2;
        Tue, 15 Apr 2025 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737669; x=1745342469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=;
        b=efM02claBvOSpZq7dtmriGxBlE2rb++CwmN+SJqSeOYofUG+6zVCK7UYciCCn+00+k
         2m7Kyq9EMj7h4JXa3ONk9w0SE0RzVCZAwrV0P/14dffSOSLm0rGCE64lpr5yZiT1OZJu
         mWqg4oo5nHOndT9EDZAWPPitlHhfWC8YzmiX24mewFxAObg+w2gpw/+9oy12uhiKKBrQ
         +M64pNCu6fmn5dG+PmGZQVg656QkVmNO+RNGsHMTWhE7bPVjH0+vEL4Sc1BK69Vkin5k
         vhQtQRaGD3S1SurFetnbTc92wDtf1GTBhFb/6LZUWq+EIsKSQYOO6djMBEfnicMpHTtp
         P41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737669; x=1745342469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=;
        b=bGCN7Ft/RUSCEM93mRcNQd0P3+F1ktjh9yqb+fNG6iEmeg3O4cgsTQCB79Zk6v4zQG
         RYZWsUMWsA0LRyYCR5GkeNBH946VdFBicj0C3MEImyBg79Y7KeOPMcIJ+Y2as3M5KLDe
         +3zg7XexhCIZdBvDZ0Gmy75+0x/igguyy/YyYdt8reZep2u1XW9LfZ9pSuIiwPGyR02J
         +0Rz/24702fnWO8var53XibbFt/YKzLYq/bmFCYYKsOrj79wJy4qVPVF5z+ZiU0dl3t+
         M9TP6nxtZOboNEwFtoiVEk3GtV+CMm3biVyCHUMVv5+WsbSzxDFEizDKZ3Y2WY+jXywF
         e+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrlvNli9KKDsQ9rDoKOSx+oycpa+YNcOhrs7XRAmO/Y7gY1waPAQv/jS3Nhk7jSzGs7OQHjONCp9yc@vger.kernel.org, AJvYcCWp7y2W2JwsUWt+JgRA16Lvnrq9EqFs8F7qoAkvhVSqh0kcQels+qNOii7c+fghVnJOVh4hriR9vev9cDRd@vger.kernel.org
X-Gm-Message-State: AOJu0YwHigvY9xXTCDgy/iLheY+QQRz4hrgfl53+4UPWQ0t4fzs8u3l+
	lxntjFK2zWBeW9DafVsRZQpEPTe4oxngu7sTqxxEdMxgGWQTKa9B
X-Gm-Gg: ASbGnctg9tB6yeNngg4t+zLo3W8klYjIujN6YA5oEeY2ljhqAIt3Q+hyX+qrNbkssvt
	Q8SzPvdTuTl5pt/G4VgC2FuBk8eQR/5l3FR9I+xDSe2nFzYDyJOBr9QjHHjInhc9WCDYgvWnS9H
	gGj+1/2F2on5A7IMioJjbgDFyLOYSPi553L7qOfbkaAbHT7+Nu5mrfCez3Ja2ntC87y84qAq705
	leLG0H28ex+g20y/aJT0kzOfQMnDcD++OfxG3V9oh3DNW2F2b/LNqMt5cvXnUVhHcih+NraJRJ9
	FxKbvUly4xhnVY+dge3r+4Io8wrDJTSXJ8pifXvd4OVCsCkeidxaEJCFeqmgnO1YAWIrL8D+zLd
	PH3c=
X-Google-Smtp-Source: AGHT+IE5LwUFFqRN1DRApHuDZUZuydgO0U6kSCqbQ6tZKxGSHxRY3Qiff50MLBjjeVgYq+0MQAeeSA==
X-Received: by 2002:a05:6000:1a8f:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-39ee2760646mr250766f8f.43.1744737669297;
        Tue, 15 Apr 2025 10:21:09 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:08 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue, 15 Apr 2025 13:19:18 -0400
Message-Id: <20250415171919.5623-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..b5bfcbcf38b8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,33 @@
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

