Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2696D1F37B8;
	Thu, 24 Apr 2025 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481024; cv=none; b=NkX+G8k07mCN+pb05TfUEA+IqshGKcNh6MOoDd9u/WkBHc1tHmr432GmsVdx88kwJ6LFWe4NiWC0h8hGvoiBdn+rbAiVuGXZBVFAr63tsAbQzK488wnilbApaOZpic2K6QznyiplMt1Yg7QvNVFpvixseWaA4/NAjfPAvzCvA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481024; c=relaxed/simple;
	bh=Tq0hPlyp9qMv/BoeEAkyDOYHgk8PJ0sooMCG5eDXcN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xj+1F/Nz6+dhAPIfVD5NKozol+nWivj0ZMIU5Ovigc7xYSLjH72oV67HxhBq4JPlar1e4Fd6ADEP7fcIUfuMpjbipWSaDEPx9Q21L1Zwx9pBAKIJCRCfFXh7mlvdkNibdHrEeR29qEtiSNtImdQITSc1rtU9CCLRWqRSJEJOe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Bep5LGJS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NMVMRiOI reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Bep5LGJS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NMVMRiOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481021; x=1777017021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mg6lhM3R2ZSR9+KErjTtlCk6Ufu88DsvjnmmJE09rCU=;
  b=Bep5LGJSf4PGUdkJKJCQMlzt8IzTwOHGnWGkW/wr4YTkAeiTI64XlXcc
   xtiZcEs455BjKMvWOv2ELC3qKm1hsSEOk7j1E3U3ACMaBLckHX6Te+C3G
   n+5fbpW9d2S+FFMzLeb8MjiiN7mz7193fOQMCx0bOqI1hF7Eml3pujK2/
   lo2vLq7n08A0zJSNUQ4UVMmwKmB9CuwMgEo8xONlWP8i9K0gc4qj1VJ7C
   gohNoANbiZp3HxegW+0kah0orJrG50wIRuMDzXXQzmAwqYg/gDgMw5d2/
   pXXWeywth+LcAmhMV1E+/YLgI2ugLpldj/VaNcfsJVD8B7TcH0pgSDR1/
   Q==;
X-CSE-ConnectionGUID: QGD/Gg/jS3u6KCNl1aBeXA==
X-CSE-MsgGUID: PcGB5fQAT9Golh5t6TkTpw==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691475"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:50:13 +0200
X-CheckPoint: {6809ED35-3C-903EAEAC-E04C76C8}
X-MAIL-CPID: 43870022036A7357E589DFBA273AC112_5
X-Control-Analysis: str=0001.0A006376.6809ED40.009E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3067163FAF;
	Thu, 24 Apr 2025 09:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mg6lhM3R2ZSR9+KErjTtlCk6Ufu88DsvjnmmJE09rCU=;
	b=NMVMRiOIBdx3fzw5lq8FizjygUrUu/GUdNN59KCfjoXxvWG7L1ZA1Y0QbeZVEFnX/cb2Kp
	C6b1zociLFLoIJQUIpxytZQudu+V6UNsRoAtmFbmqYGEIBFtqkxfN9sAkdu+NQbgbnLQHe
	dVaBtnPv6/UKGq9ukriFpOVl7nuEhIGq6nFihgLr7Vsv/rIxb8UT/oFkmFue5Q89AU/l6y
	UI7ubySg1MJfXFfCjMVJqisQRcaIV2kH26Dzfj4SMBD24pW/LIihKriDAgCo0yG/F0764D
	CVCJynmi6eoDf3nsHF0lDRyG6aLbiIS6xxTkYIzy6BzC74peAwwyebiwgZ8kwQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 2/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
Date: Thu, 24 Apr 2025 09:49:59 +0200
Message-ID: <20250424075000.1263138-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
References: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This overlay configures IMX219 MIPI-CSI-2 camera attached to ISP1.
Also add additional overlay both using LVDS display and camera.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Thanks for the review.

Changes in v2:
* Renamed camera clock node
* Fixed unit-address of sensor node

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 ...imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso | 107 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 6f87f28f4583e..47cb156c94e7b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -247,10 +247,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
new file mode 100644
index 0000000000000..e5a2b3780215d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	/*
+	 * The three camera regulators are controlled by a single GPIO. Declare
+	 * a single regulator for the three supplies.
+	 */
+	reg_cam: regulator-cam {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam";
+		/* pad muxing already done in gpio2grp */
+		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_vcc_3v3>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	cam24m: clock-cam24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "cam24m";
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		VANA-supply = <&reg_cam>;
+		VDIG-supply = <&reg_cam>;
+		VDDL-supply = <&reg_cam>;
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			sony_imx219: endpoint {
+				remote-endpoint = <&imx8mp_mipi_csi_in>;
+				clock-lanes = <0>;
+				clock-noncontinuous;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
+
+&isi_0 {
+	status = "disabled";
+
+	ports {
+		port@0 {
+			/delete-node/ endpoint;
+		};
+	};
+};
+
+&isp_0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			isp0_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				remote-endpoint = <&mipi_csi_0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			imx8mp_mipi_csi_in: endpoint {
+				remote-endpoint = <&sony_imx219>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0_out {
+	remote-endpoint = <&isp0_in>;
+};
-- 
2.43.0

