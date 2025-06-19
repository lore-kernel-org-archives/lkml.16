Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B72472BB;
	Thu, 19 Jun 2025 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315205; cv=none; b=WiLXSMo2QCBuXBzcAmG9PzwSnydjhvPULP7BjMwnfcqQiurT4u6eoR+GgjWiDps/3aqfpHOwasdsIz3v6FZsFfi8XWs0dl6yJgy2iHSlXzwwp3F+KPhCQSHpAkkUzQLW2aJpzEuqmO87pDtJ0psT22kNll8H2J6j4K8iprkBdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315205; c=relaxed/simple;
	bh=5Dy8R3r1trSV7SkvB99zlqtFMYecQ8TD4rVB+HmNbng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YaEzPo7/2r4xwxjK6h5ndBfDtfxNd/E4pFKz6NreBXOPBx5VJVtPzxQZw1XEdARfMXmSc4gN5Y86XRwy1gK4DKI/DnqA1N9s1u0nv7c+wuQzeNhqgMORkCel9zX5oCdpbeV3eI0aKl3p8d6CZpeqdPZe87Xq8mK+RhF0xRyBIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=jttLxcgD; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="jttLxcgD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W7TliLsbfaYS7bb2ke6NaPLrLNQJB72CmG4Z4X0ynZY=; b=jttLxcgD09J+VEGwbEJ0CXBPZN
	Ld+UvUG0kHf0Gn1biOp4vcm+Vzee0iawOKXQa12OTBoMuMID5Wgz4tuzOin/pmssa1WIMCBKmnH9x
	SKtgnNREeEf/xlyZj5tQM/c2NLQ7XZcef4TSM6dZVTVR4EHKhU/zuMkxu9KNuN9DONr6AiT4XLjgQ
	PN8ZETmgx671FTYWWNoysp04FphfxRxd1rpWnZLyKXU4JnJ26Lk4eZ9y5Q8lgaT8+vWPI3uUBRVEx
	A7ByflVRA8fHi1zs6/CtIF7nYi3XmcIXiY7iJZV+VQkhw5vz1/T8i1wTIbjys4eiOoxUCiAmYJYmq
	AEsgdMmA==;
Received: from [89.212.21.243] (port=44058 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uS8wG-00EVcY-1b;
	Thu, 19 Jun 2025 08:39:55 +0200
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: imx93-phycore-som: Add RPMsg overlay
Date: Thu, 19 Jun 2025 08:39:51 +0200
Message-Id: <20250619063954.1730231-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619063954.1730231-1-primoz.fiser@norik.com>
References: <20250619063954.1730231-1-primoz.fiser@norik.com>
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
index 000000000000..9200113c9ec3
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
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
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

