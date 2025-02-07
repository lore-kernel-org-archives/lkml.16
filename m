Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670621B0404;
	Fri,  7 Feb 2025 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917439; cv=none; b=UbtrPdSs6FcOjC36c9EInJx0zSR/N/qPA4xevVpF6rMNGiLeiM4PuaTdYv2BZcflnc2ga/a3D7nwf4/hp4PImrT62OAndASEfpvhPdU65dnJEmpSffidGhrW911C+exxdxoucLiG3T+4xMdqzsmsjsxNTs8DeiZmweqL4O9r8L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917439; c=relaxed/simple;
	bh=haLy3ZdHav/1OLiykoyy4KR9sUKC34asEag2s6a/lXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a3Kz9c7ntdGJXNDbwT9jHZixz0DG0J6k6CQLaMaRyutS7RKZpib+19zmix/MQIbaC6gyFTcTJ1SOEdE6GHUv1m83erlYDJkOql4BsYIoyxiY0avthHBBWQRHQP3Tm2SXVDGpOp/oI6ktd/LVHNCYUxSwmJUTt0JqUzjuMiLcZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dulKqz/5; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=r71H/U5R reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dulKqz/5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="r71H/U5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917439; x=1770453439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UL37XeC1hd/H2U+yhmEQrAT3CUEu9El1GzT1Hy7j0Po=;
  b=dulKqz/59BtdPhjOhJxdA7IZWwvMY5ETriusTN1bEG2RK87g4p7Mu82j
   QBgItU6Pis5nSXYToKgtxbujGiyZtkZYN/FqO/iIEEJbg3DQL1pZlxV3n
   L8NnyXcqkO8BrytoBDp4EQu/OyOlsmvcv14CYQAp3mnR447D07wKH7bPN
   P2i0V48U5nuckL+PDSB332v5yKwPN7zhYZMhTk7a092HnXIqQUAi18ew2
   rGPCI/EPX/RgGNhkL+7PcIyELL39SNc2WKIJjrwXkWG7YLbldxpe9SLU/
   nEuwBvNLUqBka4jCxn69XchK1eYfzgGyIc4KMqXC71zgrsidIcsQEaqY5
   A==;
X-CSE-ConnectionGUID: /rZ0D+G4QKOih0Hmp6hmAg==
X-CSE-MsgGUID: yPL0BN5HThW+2EuS65l4mg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636091"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:55 +0100
X-CheckPoint: {67A5C626-14-2D67083E-CAF60585}
X-MAIL-CPID: 500D698AFA798B87F8070EACC0FC3FD5_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B070216833B;
	Fri,  7 Feb 2025 09:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UL37XeC1hd/H2U+yhmEQrAT3CUEu9El1GzT1Hy7j0Po=;
	b=r71H/U5Rh0uC28453S3IACjCz0EQvKknjoIN7MqaBMAmjjxQ28RjRa+zaZ0mjOhqUrQaVQ
	ZDmMpaUtpKASTsWnq8HOFVTax1NLZVj+KLZRZeeS76Q8X7Xh1a14AUYprb4MswHVD5rZ7/
	/3raXxXPd68e1ft3V1ZnC/Drv+qoZZOHF+6MR2+q4pa2G5loF68im+b1T3Y5Gc8Gdhzwmp
	UGH+5bNFGqaOEbHCWLvhBjoQ/isoWRqIfr44UxSHe3nPFwxiHpKyrohCnspXm2epOgjnJ5
	xJMO/4bWxtSwByGut6XNfdyrw5W5wabxSFNPLVvOr83xZifoAGBvFzudDnJi8g==
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
Subject: [PATCH v2 05/10] arm64: dts: imx8mp: Add i.MX8M Plus OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:10 +0100
Message-Id: <20250207083616.1442887-6-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
new file mode 100644
index 0000000000000..c9f49c61f3656
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MP_OCOTP_H
+#define __DTS_IMX8MP_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MP_OCOTP_M7_DISABLE			16 21
+#define IMX8MP_OCOTP_VPU_G1_DISABLE		16 24
+#define IMX8MP_OCOTP_VPU_G2_DISABLE		16 25
+#define IMX8MP_OCOTP_CAN_DISABLE		16 28
+#define IMX8MP_OCOTP_CAN_FD_DISABLE		16 29
+#define IMX8MP_OCOTP_VPU_VC8000E_DISABLE	16 30
+#define IMX8MP_OCOTP_IMG_ISP1_DISABLE		20 0
+#define IMX8MP_OCOTP_IMG_ISP2_DISABLE		20 1
+#define IMX8MP_OCOTP_IMG_DEWARP_DISABLE		20 2
+#define IMX8MP_OCOTP_NPU_DISABLE		20 3
+#define IMX8MP_OCOTP_AUDIO_PROCESSOR_DISABLE	20 4
+#define IMX8MP_OCOTP_ASRC_DISABLE		20 5
+#define IMX8MP_OCOTP_GPU2_DISABLE		20 6
+#define IMX8MP_OCOTP_GPU3_DISABLE		20 7
+#define IMX8MP_OCOTP_USB1_DISABLE		20 8
+#define IMX8MP_OCOTP_USB2_DISABLE		20 9
+#define IMX8MP_OCOTP_PCIE1_DISABLE		20 11
+#define IMX8MP_OCOTP_ENET1_DISABLE		20 13
+#define IMX8MP_OCOTP_ENET2_DISABLE		20 14
+#define IMX8MP_OCOTP_MIPI_CSI1_DISABLE		20 15
+#define IMX8MP_OCOTP_MIPI_CSI2_DISABLE		20 16
+#define IMX8MP_OCOTP_MIPI_DSI1_DISABLE		20 17
+#define IMX8MP_OCOTP_LVDS1_DISABLE		20 19
+#define IMX8MP_OCOTP_LVDS2_DISABLE		20 20
+#define IMX8MP_OCOTP_EARC_RX_DISABLE		20 30
+
+#endif /* __DTS_IMX8MP_OCOTP_H */
-- 
2.34.1

