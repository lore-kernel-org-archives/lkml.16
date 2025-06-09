Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023132.outbound.protection.outlook.com [52.101.127.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11076535D8;
	Mon,  9 Jun 2025 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438996; cv=fail; b=S+k0AoP8tpE6dZ4/cFjFng/G4MiBu5bSWEAF9I19YDaMc2FghOGIOC/BNrscCIMFJX3RxHC2OeUFVwk0BdFYny0OvqDgFcTs+K/q9GBQNyITIoRGlmGDRr8MxYnFuql+eprPAIZpKzVaaROeqoEr+FBXSa3D5eIMntKYfm7b39E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438996; c=relaxed/simple;
	bh=oZ3uQnoCloOmKw9WtgOkTSEzAlQm9PL5yWtyH6fALlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCiVCBNisHUz7U6juLC+sruKj0Zu7VnZa1aYMVssnnHLt4Q+y/4VydI4phSkTbswUfBibJ6G+kXViGtGiPp4AVVE2D7S/pJiAvdi3pm9ewy4s/DWgp0tWeoeLBOlV35oDEJLDq0KhbFwILppnG0+dW4nkxdI0kBdSTk5kTu+kDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EirUgjw+s21KjNIVcqF6DwFwIj5rhSJTj9NZaryp1I3xJVbzGyOBjGO1pB1qe1DOd96aEwP2g0X8TbUHnk0239VP4UHTDPVVqy9iCChCSZ09M104wuTOo1ZhfDZ2zIbYAChppzCCBpH6PxQT+WPjFySEqZF6Apbr2HhLgDNHT25GP7q8U7bbglwgiUDCBhCqpttSJEjexVdXA56ufTDjOKJ/0VDB+5kSBkQK9qoWN2S4oGPlHlLqCVpy2xKXGbiZRcmrOu1k4c6Glo5yoNilSadZgEYEcr0bEjZv+0z4cNGuobBqq0B9bBULssfTbIUCzElll0ihgmaXR5ssCw0bIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJdEyOh0A4I5MAKAot9ia+uSYqCvpNpv75+oUgUhqFg=;
 b=cpK1bQUZRQXCdJkxc3PTezTaoBF6Fy+9dh5kEAzke90qKy6luuyROEfMyOFGbC7O+HSfBGEbAVKQMutVqpqKujdoG/W4Ef1TYGxt19bQ6OEtZpG37flBtijnZ1dr4oz5yaPUYG/5vmYJ2RRFbra2Uw5MBADlQ7gDX/DHsDSkE5g2QU5AEPFDQbg0q7PC/ILmytTJzjfLEgcHuLXWY520ZhWjVqJ+1c4NPVlQ+FwzNMXco1Qy4tmhvTiStkQddGT18YmrrYdUDg0Gj79Jp64ZD/R8tAq0a1ubuHk6kgi+Mse779jRhgEHri0hM2H9eArUXUsiidyb22kAdZI1QcrwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:79::12)
 by SE1PPF50B2D80A0.apcprd06.prod.outlook.com (2603:1096:108:1::415) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 03:16:29 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:405:79:cafe::14) by TYCP286CA0365.outlook.office365.com
 (2603:1096:405:79::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F32A14160CAB;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v9 8/9] arm64: dts: cix: Add sky1 base dts initial support
Date: Mon,  9 Jun 2025 11:16:26 +0800
Message-Id: <20250609031627.1605851-9-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SE1PPF50B2D80A0:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b69b3952-d2e0-4741-f6c5-08dda70406a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nzwgsO8RbtD6shpmUCuDp1gcLqN6hgAqq0SYViKka5pjPNwKS3c1ALt3fLAY?=
 =?us-ascii?Q?1VxmnaeJMpSVEaLPJJdw+v1aJSInLwldsMWMLfyK5bkya3SeM3KaAjr+4vC+?=
 =?us-ascii?Q?z+GdRa8jK8PPTtDoMaq5wmBPF4v1uzohjs+i8Aj9V2psLM8jYtxa5ZavACED?=
 =?us-ascii?Q?thdlKmm+dkPneilfd8+9oPAmX2pSjS5bmbJ73ogsLG5iy9lt9695mPU8OW9D?=
 =?us-ascii?Q?1DurBS0QCaow23ene8ZK3crWarH+SkFfbs8ZieRHqeQ6Eejzsfx9UpQwTUxb?=
 =?us-ascii?Q?ARP8Uyr2hrxHx5nb/6OQZ/YioeJIOe5O7246k2ns9ebu8Tks53tiDBAXBmm9?=
 =?us-ascii?Q?iqCIGD9Rkrlm2xF+yWHLzs+s8MTbfYjfaW9SpYSXC7MdtCgVvMFY/VE+bhmh?=
 =?us-ascii?Q?802LZHuy60hTCRoor5NchDr1UvHsd3GsD9Mwf7IS7V0S58U+a9HK2mMW8V+B?=
 =?us-ascii?Q?QF5lGIGVdhXF2yhPP2nqNMKrSlqLQPnjUu586yxyEDTjY+6tUzEGKU6bd0KA?=
 =?us-ascii?Q?y5OVHSxEmAIQh0IhppcdV+g4c5qgjKFgIHFtqb9S5yyyue6fzRItGhQNahIm?=
 =?us-ascii?Q?Rn/gZrzmvuSrCqRYF4vtIeqguGtC11zYR6sPi4CeDO7bXztyeCQjLcg2Yq2g?=
 =?us-ascii?Q?kA3c0ilAxsl63zfewtMdEMCoxrRBhuDSgvLQErIISsTMdDxLEIKnBbjaTB6Q?=
 =?us-ascii?Q?/kgQHVeTgAQ4p1bAWNJv7TmPebVDZCiLa22/VRrijWZkmGHMJyskjjGzTLJ7?=
 =?us-ascii?Q?fpj9r1dQ4aErdteh7e8siQPRBiEBq/ZxV6Knn5PdojgYR0kvSA9rrU96hwZG?=
 =?us-ascii?Q?liEXJfV1vZrWrin7EM0/AZlk0pca4pi/5XSgEdyBVk6xs4K35dVqNJ7zY2F6?=
 =?us-ascii?Q?XZEsK0JBVeIUumnPf8FdHsr47TDo6t1Q5nS2FKBndsJVA+bCL5++YxDuxmZH?=
 =?us-ascii?Q?XBKsmaiX6mKIjsccFjI/gpU43wjEsnPa+PknAmY+UZRhMHNA8taKgBz/S4et?=
 =?us-ascii?Q?iKdix/OOqVFm3QZkIanBiPDv3SM/nPpj8UqrDhYwkVg7WuqloYzd9AIU32A4?=
 =?us-ascii?Q?RpCPL7WWW1GlR4POGzt7DE/c+xgayyvf6PE6zUgIggy9DyLEZueCJ9VMUs0a?=
 =?us-ascii?Q?PdRg+KjNTp68dJpYyOj33hWIePkdG9weepyoHOmj0FUZk1by+4D7aVd95rTE?=
 =?us-ascii?Q?2FzyWw/IWuv9P6uF1OYSWAY2dFZrY3FuRsCDraPez3qnTrkee1BICRWQPOB0?=
 =?us-ascii?Q?hJ5B5MoazDp2ZAXYdZtvf49IKO0oqZvnJ2n8/2CH5O92GBTU1yl7cSt7OBtU?=
 =?us-ascii?Q?17vbdSOx+D9EbgzvZzw0S+EuFPrSSp0m8kiVx1Ekny9goW+KUHAdUyHUPqT6?=
 =?us-ascii?Q?D/u8TMm6DbAD7KzHqyfoFgy++0FF86yp50wHSPowuVeQbAiIkKOeZVuiF+TM?=
 =?us-ascii?Q?ePxmowM9X5TWRZBRiMomuYQBFD/bfCbUVCKUwdXK5sXrLs66WD/Ztw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.7887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b3952-d2e0-4741-f6c5-08dda70406a9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF50B2D80A0

CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
and Orion O6 is the motherboard launched by Radxa. See below for
detail:
https://docs.radxa.com/en/orion/o6/getting-started/introduction

In this commit, it only adds limited components for running initramfs
at Orion O6.

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
Changes for v7:
- Refine *_scmi_mem nodes for their properties ordering
- Delete Krzysztof Kozlowski and Fugang Duan's tag due to substantial changes
- Add two Tested-by tags from Enric Balletbo i Serra and Kajetan Puchalski

Changes for v6:
- Add mailbox, scmi and uart support

Changes for v5:
- Delete pmu-spe node which need to refine, and add it in future

Changes for v4:
- Add ppi-partition entry for gic-v3 node, and let pmu-a520 and pmu-a720's interrupt entry
get its handle
- Remove gic-v3's #redistributor-regions and redistributor-stride properties
- Change gic-v3's #interrupt-cells as 4, and change all interrupt specifiers accordingly
- Remove "arm,no-tick-in-suspend" for timer due to global counter is at always-on power domain
- Remove timer's clock frequency due to firmware has already set it
- Add Krzysztof Kozlowski's reviewed-by

Changes for v3:
- Fix two dts coding sytle issues 

Changes for v2:
- Corrects the SoF tag's name
- Fix several coding sytle issues
- move linux,cma node to dts file
- delete memory node, memory size is passed by firmware
- delete uart2 node which will be added in future patches
- Improve for pmu and cpu node to stands for more specific cpu model
- Improve the timer node and add hypervisor virtual timer irq
- Pass "make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb"

 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/cix/Makefile          |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  39 +++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 331 ++++++++++++++++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..8e7ccd0027bd 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -13,6 +13,7 @@ subdir-y += bitmain
 subdir-y += blaize
 subdir-y += broadcom
 subdir-y += cavium
+subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
 subdir-y += hisilicon
diff --git a/arch/arm64/boot/dts/cix/Makefile b/arch/arm64/boot/dts/cix/Makefile
new file mode 100644
index 000000000000..ed3713982012
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_CIX) += sky1-orion-o6.dtb
diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
new file mode 100644
index 000000000000..d74964d53c3b
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ */
+
+/dts-v1/;
+
+#include "sky1.dtsi"
+/ {
+	model = "Radxa Orion O6";
+	compatible = "radxa,orion-o6", "cix,sky1";
+
+	aliases {
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x28000000>;
+			linux,cma-default;
+		};
+	};
+
+};
+
+&uart2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
new file mode 100644
index 000000000000..9c723917d8ca
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/cix,sky1.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a520";
+			enable-method = "psci";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <403>;
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a520";
+			enable-method = "psci";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <403>;
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a520";
+			enable-method = "psci";
+			reg = <0x0 0x200>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <403>;
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a520";
+			enable-method = "psci";
+			reg = <0x0 0x300>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <403>;
+		};
+
+		cpu4: cpu@400 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0x400>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu5: cpu@500 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0x500>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu6: cpu@600 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0x600>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu7: cpu@700 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0x700>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu8: cpu@800 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0x800>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu9: cpu@900 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0x900>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu10: cpu@a00 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0xa00>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu11: cpu@b00 {
+			compatible = "arm,cortex-a720";
+			enable-method = "psci";
+			reg = <0x0 0xb00>;
+			device_type = "cpu";
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+				core4 {
+					cpu = <&cpu4>;
+				};
+				core5 {
+					cpu = <&cpu5>;
+				};
+				core6 {
+					cpu = <&cpu6>;
+				};
+				core7 {
+					cpu = <&cpu7>;
+				};
+				core8 {
+					cpu = <&cpu8>;
+				};
+				core9 {
+					cpu = <&cpu9>;
+				};
+				core10 {
+					cpu = <&cpu10>;
+				};
+				core11 {
+					cpu = <&cpu11>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		ap_to_pm_scmi: scmi {
+			compatible = "arm,scmi";
+			mbox-names = "tx", "rx";
+			mboxes = <&mbox_ap2pm 8>, <&mbox_pm2ap 8>;
+			shmem = <&ap2pm_scmi_mem &pm2ap_scmi_mem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+		};
+	};
+
+	pmu-a520 {
+		compatible = "arm,cortex-a520-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_partition0>;
+	};
+
+	pmu-a720 {
+		compatible = "arm,cortex-a720-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_partition1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0 0x20 0>;
+		dma-ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		uart0: serial@40b0000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0x040b0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&scmi_clk CLK_TREE_FCH_UART0_FUNC>, <&scmi_clk CLK_TREE_FCH_UART0_APB>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@40c0000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0x040c0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&scmi_clk CLK_TREE_FCH_UART1_FUNC>, <&scmi_clk CLK_TREE_FCH_UART1_APB>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@40d0000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0x040d0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&scmi_clk CLK_TREE_FCH_UART2_FUNC>, <&scmi_clk CLK_TREE_FCH_UART2_APB>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart3: serial@40e0000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0x040e0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&scmi_clk CLK_TREE_FCH_UART3_FUNC>, <&scmi_clk CLK_TREE_FCH_UART3_APB>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		mbox_ap2se: mailbox@5060000 {
+			compatible = "cix,sky1-mbox";
+			reg = <0x0 0x05060000 0x0 0x10000>;
+			interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+			cix,mbox-dir = "tx";
+		};
+
+		mbox_se2ap: mailbox@5070000 {
+			compatible = "cix,sky1-mbox";
+			reg = <0x0 0x05070000 0x0 0x10000>;
+			interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+			cix,mbox-dir = "rx";
+		};
+
+		ap2pm_scmi_mem: ap2pm-shmem@6590000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x06590000 0x0 0x80>;
+			reg-io-width = <4>;
+		};
+
+		mbox_ap2pm: mailbox@6590080 {
+			compatible = "cix,sky1-mbox";
+			reg = <0x0 0x06590080 0x0 0xff80>;
+			interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+			cix,mbox-dir = "tx";
+		};
+
+		pm2ap_scmi_mem: pm2ap-shmem@65a0000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x065a0000 0x0 0x80>;
+			reg-io-width = <4>;
+		};
+
+		mbox_pm2ap: mailbox@65a0080 {
+			compatible = "cix,sky1-mbox";
+			reg = <0x0 0x065a0080 0x0 0xff80>;
+			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+			cix,mbox-dir = "rx";
+		};
+
+		mbox_sfh2ap: mailbox@8090000 {
+			compatible = "cix,sky1-mbox";
+			reg = <0x0 0x08090000 0x0 0x10000>;
+			interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+			cix,mbox-dir = "rx";
+		};
+
+		mbox_ap2sfh: mailbox@80a0000 {
+			compatible = "cix,sky1-mbox";
+			reg = <0x0 0x080a0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+			cix,mbox-dir = "tx";
+		};
+
+		gic: interrupt-controller@e010000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0e010000 0 0x10000>,	/* GICD */
+			      <0x0 0x0e090000 0 0x300000>;       /* GICR * 12 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW 0>;
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			gic_its: msi-controller@e050000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x0e050000 0x0 0x30000>;
+				msi-controller;
+				#msi-cells = <1>;
+			};
+
+			ppi-partitions {
+				ppi_partition0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_partition1: interrupt-partition-1 {
+					affinity = <&cpu4 &cpu5 &cpu6 &cpu7 &cpu8 &cpu9 &cpu10 &cpu11>;
+				};
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};
-- 
2.25.1

