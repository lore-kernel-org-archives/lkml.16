Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D401D5CE5;
	Fri,  7 Feb 2025 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917429; cv=none; b=ERw2tR2JvdXfgynEyFy+wnaDMx1XsEkzEuHRaZSyJl1LYbhzx/X3q88D+rENR1gY0v0rgq7IEig4VJ5l07hT+Xo3IFQvhaH7cCmJNE7hFRQGz008arbwqACi2E/DOwHmGeW9vzOqekdPV0QTHD484+VONqYH0HDS2fw3y11M5as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917429; c=relaxed/simple;
	bh=cOF5o6TN5V+ATdWgBW0jgO9n1zkXTUk12bJKODIY53o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o9E8HPqUY1SyTfamlq1+VdeNYKZN1WjdgMrBWOOCcWSO+2naQioutERIKGaEYYy268FuExK+fut10rUKoPLK2KxZnWmwgrdhx9ZuDx57Jw19u9nqwAo2z9qdNTwGiY96jmB2ElsEWYt3P919LOuUf2X1F+1onHSkYCmSFeH3xtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=AId7TkP0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FyU2EShc reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="AId7TkP0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FyU2EShc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917428; x=1770453428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=;
  b=AId7TkP0eBknFDNEwJ5+EQ2TNX/+gtFLUBqed/qBugrfgZqXmKbw8lVK
   AuqQnpHoTSdYKz3rc7wcBSV6yCCKEJf9o0Q24SbJQ8fps5UVGPymABXJk
   ibtc5RXVKBmWy9+JoBrQDXR6wD0ftSjO9YKwih713hlelqROK7I7ttl+b
   q1K7xt8Tr19NLyis12rNFnOceh43FcDgRScMBYEDGAYBShIKqy/a9dnK/
   MTB7+Lpzlp6fbP2XIjsbH8Gnn3c/xGiDW14nmI3PnDNmB3S8IafIGXgWC
   e12Cnf3ohq69AJah82iEf6CW4YIWtBsnyt4XVcrrQu84mRe575ON9emHp
   Q==;
X-CSE-ConnectionGUID: SibWdkl1S+y9b3n+e7uqig==
X-CSE-MsgGUID: xw/SnEJbQr6N2mBpPHPcvg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636079"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:44 +0100
X-CheckPoint: {67A5C61B-4-727D2C21-EE1B71AA}
X-MAIL-CPID: 64714A091E530C861FD836DF9D93E3AB_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 197BC1682BC;
	Fri,  7 Feb 2025 09:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=;
	b=FyU2EShcawV//6bBdOofeoPWKSDffyu5W3+hU5JwaAHWw/uVv28o1Nlm0iGpgTXakqrovn
	vipTkGsTcnk5JJGDsFs/IjU+5DdxP2lZ0oSX2PG4t0yHGwxHdfOD+5dgSYjImUdXQGzq6r
	ZZ6cnhi0JVL6gX9X26nIbuv3uzllelSkptCHFeakScmTLCj2OdaEc4IxeALupNpV5H7uLI
	C28M9xw94fQeqTl6sHWlxoiHvTMsbiqAfifDpkvJD3mK+3Md7/PeYcj2tlwUtpBAcj8kro
	tjyeTpKhrPc0pyf9dVWFiVl5/eLDuf6KfxmN4SC0gOeR9nJVf9YXqfn3cDAOsw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] arm64: dts: imx8mn: Add i.MX8M Nano OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:08 +0100
Message-Id: <20250207083616.1442887-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These definitions define the location of corresponding disable bits
in OCOTP peripheral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
new file mode 100644
index 0000000000000..43583c4a70156
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MN_OCOTP_H
+#define __DTS_IMX8MN_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MN_OCOTP_M7_DISABLE		20 8
+#define IMX8MN_OCOTP_M7_MPU_DISABLE	20 9
+#define IMX8MN_OCOTP_M7_FPU_DISABLE	20 10
+#define IMX8MN_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MN_OCOTP_GPU3D_DISABLE	20 24
+#define IMX8MN_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MN_OCOTP_ENET_DISABLE	20 29
+#define IMX8MN_OCOTP_MIPI_CSI_DISABLE	20 30
+#define IMX8MN_OCOTP_ASRC_DISABLE	20 31
+
+#endif /* __DTS_IMX8MN_OCOTP_H */
-- 
2.34.1

