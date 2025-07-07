Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0204814A82;
	Mon,  7 Jul 2025 06:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868666; cv=none; b=L3k5ORNGrYEDrOn5XAkx59+QxnBVVE4zV3Sp8zV5rCnvQFsEKj6eljLga8RzVh+CGzEI+V586i439d09wzOMtRCDmt2IjJvDUGoeWo9ncuii729kNosQTFEXWRUu8f3GVkDBR8EBcOZXb7QLwbnl79nDVZ5vZ8KBUMg+rod6OBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868666; c=relaxed/simple;
	bh=ywKkp03jH+gfInGP9oVa9S/zNAkbi+fU8woSzIp+x6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PQbKNsWZN/GraJFwcIOBM2UApexNKindqBTlJKj/xNgF9ScqckFwqktBrs3NqR4+OOssMOJW0bIOakPmbAKNKPXRrP6THYczKy9lAWHGFO2NC1V7a678ERtl1SmlSZUZEThht5jtRx2FvhXKIQqibGxZWCefM9JkHKn1YOm8m0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=56226 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYf4B-00DKr8-0U;
	Mon, 07 Jul 2025 08:11:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/4] arm64: dts: imx93-phycore-som: Add RPMsg overlay
Date: Mon,  7 Jul 2025 08:10:58 +0200
Message-Id: <20250707061101.1194618-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707061101.1194618-1-primoz.fiser@norik.com>
References: <20250707061101.1194618-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add an overlay used for remote processor inter-core communication
between A55 and M33 cores on the phyCORE-i.MX93 SoM based boards.

Overlay adds the required reserved memory regions and enables the
mailbox unit and the M33 core for RPMsg (Remote Processor Messaging
Framework).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reorder reserved memory nodes by address

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d120..08a1de299538 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
+
+imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
new file mode 100644
index 000000000000..c6cb5c580455
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Primoz Fiser <primoz.fiser@norik.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@a4000000 {
+			reg = <0 0xa4000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@a4008000 {
+			reg = <0 0xa4008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@a4010000 {
+			reg = <0 0xa4010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@a4018000 {
+			reg = <0 0xa4018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@a4020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xa4020000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1>,
+		 <&mu1 1 1>,
+		 <&mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		 <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
-- 
2.34.1

