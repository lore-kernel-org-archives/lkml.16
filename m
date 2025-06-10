Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35295238C10;
	Tue, 10 Jun 2025 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571353; cv=none; b=giFmcld7KzzMJPuJzo4b496Bg5puvQu/jQQDYJ/E1CHLpduNjdtWz+Bq5u9dmkNWW1w99YCxD9rq56ZHXHYit6MSNWzF1dQ4y8A/DhZnFEWpXY1S9Fo9AboZEM5xyxBRCKxezgaf9RTpHQbsdzRe0CHspcb4SnAmyE1fsOp9BRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571353; c=relaxed/simple;
	bh=XfcIcxXI2I5B4MxqQy8GQ6hBuvXXDtfq+RZ9BpUL2VA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JdctcogPiIj3RqGCOZ1MzUMF+fYrGka8+dIfU2lt9ysTWpvjFx48me6vpS+fzxtUnXoROFAzIsEMFPahdQRTlnlv1+UEiYep9wCBbYkouti+dmlNB6a8hAUVPG8Wj7yAT5hLx1Po515d7YXZuRkovQAAfLuqf45QAxlmm9glhiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RC6wsJj3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC6wsJj3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f71831abso5319713f8f.3;
        Tue, 10 Jun 2025 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571350; x=1750176150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=;
        b=RC6wsJj3W6CLwZEiaAL7xgvDb4xYGvNiJpXRz0YyMSDB/Ydi/vnkS2adhToCIjZ4Q3
         mCP9Uj1BtVV0F2+4Ed8NUB/f/iUUcNE/VvvIHfC9qdh8THYadQxYjkV7p3dbAntlscLb
         vv4YoKdUGRNeiNKBg/f6gKDPYAOI7hAWPTyXlZaQVeSjtp8xclo8ph8juCVK6TVyaYFr
         h31aXOhSQ413ft4nGBHl5lb0WvWyWGbuAcS7LSXmdahSYUjLPPHmPJCahv4xfbLm7ThW
         MfFC/ysEnkwjM545hHNaY5DOD/IpHp17yUudpDU6jfEIf9A/k8bpgzrHEsZ5Zkn5TqtO
         T/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571350; x=1750176150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=;
        b=E/NT/1Ev8h7YFkiqtlMumC/Yfl4hUNzC4QLPlHjMlGA6jfzbyAedC2ZBduZeAkvsWu
         4+7aun2eTvet/KE8EFX9NHxJGW+7OqMam8Ytudg+1h8sefRqwLSpSX5w/rtThqpmryRp
         RTMmOk2BGgynN7Vus1bPJuuyScCR8M9p5x6FZziZojyzORBhFEFZ7MT56Y358HwHg5TG
         4mXK1I4jX956d3DKk/9/1D/oWa+Jy+7O2fDgHxZRxhgzC4KfyA6WYFi20wyhyCu6M8z3
         JEetHtW/Xffe73DIyfIsKgrFXfx13RA2AlCaYLDIfnU/U5mijhEEDreP/YjA0URDQADk
         Nscg==
X-Forwarded-Encrypted: i=1; AJvYcCUTjzJ6NWQ/RtmVeVd/Df2r2W3O1Z4ZbRFGTvg0LPb2EEdJd2kHzSuTrCk0Phrz+Zi1H4XYfHZr/vuHaHVq@vger.kernel.org, AJvYcCVar4Q2QaKMc5HjD4mTgThUtiMGUguG3KUtHIzd7+zQHOIvq37SvY8A6C61xIUmOzfSBLrG7cW20AZm@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUIzWPKSKVQERtzBr9RXQiibY7jCX5v80NrR20ewmOKCYf0yk
	FHvfBhJFUSQYqUeeSEN1IT4gTAgPL8WLSVJFw74Com0MoHuktNbcl+Fp
X-Gm-Gg: ASbGncviIM/tIpUdQsWT5Lv2e7TWV68rqlUKDMxrJiEHDqezdofdgXfIadbzZ41feMJ
	f/X0tImwG942ZQyIke+KwyGusjE7+OzMXDE+vpMieb9DMNnzQaHpYB2+EthO75SdnAeGIGb1QHG
	1OW4+Vg2cE58G77z5jXOQhMz2OWOo57A96dkfWLaXp5xGmSUvEru3tk/YnproHwLrWILrNggbok
	2svJjLfRASFVgCBuXMnrB3Y1FoBfdR1lhjNgsVWo0SyOmS6hxsImdPPqaEaBCZmT2GcQM6jWHgF
	meayexUomAwnhsj7YN7Vm9jhQtk2E3VSQLmyCRRJpy3CPzeIq1xF6LhhKKpnts+IEROVRnnitC9
	zNH2Szm+dyBFCsy1TrroGfeU=
X-Google-Smtp-Source: AGHT+IHhY/k+f9IJHPIEjy9iyBzhgiJ5RVh5n83hNt9ZBYYDAnqAlzarCsi43dgG5BIjB8S0cXPlDg==
X-Received: by 2002:a05:6000:4023:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a531ab6dd4mr11951972f8f.42.1749571350236;
        Tue, 10 Jun 2025 09:02:30 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue, 10 Jun 2025 12:01:51 -0400
Message-Id: <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
index 000000000000..6481c484ca37
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
+#define IMX8MP_AIPSTZ_MASTER		0x0
+#define IMX8MP_AIPSTZ_PERIPH		0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL		(1 << 0)
+#define IMX8MP_AIPSTZ_MTW		(1 << 1)
+#define IMX8MP_AIPSTZ_MTR		(1 << 2)
+#define IMX8MP_AIPSTZ_MBW		(1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP		(1 << 0)
+#define IMX8MP_AIPSTZ_WP		(1 << 1)
+#define IMX8MP_AIPSTZ_SP		(1 << 2)
+#define IMX8MP_AIPSTZ_BW		(1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA		0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53		1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2		3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3		3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4		5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7		6 /* Cortex-M7 */
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 307e1671eccf..9b550f225856 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1

