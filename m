Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021131.outbound.protection.outlook.com [52.101.129.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD427A106;
	Tue, 15 Apr 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702055; cv=fail; b=XTfeUHYnS/YxFbdPVsm/ZyvfdiaG3SrrHiR2FW3QmpkQ+10F6jgNrfbI8/4WdllHmDNZznNdAUlMyxzChm5uvVCXEUFvbP9bPuhoCTyzGYnxnyeh1XpIjbFFV33oOf3aFyVcgWT/AsTjDkHvH7DX7gU+H3hg3TBEi/qpRr8yN2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702055; c=relaxed/simple;
	bh=cLKWwgmibQdUtDFrIcrWbpSV5PDK0QvCxr5eDlSip2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+DPF5TG+sGMP8By1+VttPE8lltC/VUbRwDwQS6Yp9A5OA+kGg96m0HHiZV0AufsrZlxG3nbTcRiGpMY9au8IIFOOKmZyhJxq0C3pfdXTShMYe+qyxsbfNo7BS1VxpFY/48lydzhsTcwz70NiBcLOSVNiTcG9EVHIgYJPYMdupA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB1MpYsDHTEF1Etn6Ljx4qTj6X3XNdEqWvZVdAthC6Kdsso3y/MG7TY4wrnJls1e4mcC5SodXGyA5xr592U2BCqYgTMZTEBSQ9Rj5d5OZcwjf6eT3r2lZsVZ7OtZ67H7VNmJnDpvUnUaJMZREsnXjlR9SoeIOGbXOs8yUxp06/YFpkpmuvEIZqwglrUjFw6cCLp4MAuVicp5teocqN7LqzAZ6vWT3Ckhet23cgjmyLi1vQPC9tIZYXmN6Apu2dW9Khv2rcImgXm+ez2x2fKs2rus32m/HF7ZkCYHJaS0F4QGOieIQFPuujBs9+JnP7UUVb3+C0n8qzCCHYGHZYDJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkBrVElOgW9hem4bvXRMhZRRmhYu4aLW9N8FGheGT3U=;
 b=vyFrfdkGw/NMkQc4hAtF1w1EQlxdT998VaiO3gUYOeFsqq9fw5AUVQRu8wxa1uWxawJfRkC5fyZ0OpZDFc3JoWsVDGIVnroMljszcZ7b/91/LwELqiYonKSG8UlLdxT6S3YKdW25Oub9qBLfJWMd/FRLSD3SmIxVZkI+WbJ34q4WefijsNlEV2VBz2tmAwGrIZm5vSFk8ZNE4lNKs7g9KOQ736fumxipce+QQH3ukNMb8HSOHWxRGaHh3kxdX07dHDEWHmCbRSRVwKZu1H/lwuEfNAjtcGhDT3xA9jm+vWU8M83m0Bq9bLSTdPYYbhvrD0J0jq3a+azoYjRnHpIS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0008.apcprd04.prod.outlook.com (2603:1096:4:197::20)
 by TYZPR06MB5906.apcprd06.prod.outlook.com (2603:1096:400:333::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 07:27:28 +0000
Received: from HK2PEPF00006FB5.apcprd02.prod.outlook.com
 (2603:1096:4:197:cafe::ea) by SI2PR04CA0008.outlook.office365.com
 (2603:1096:4:197::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:27:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FB5.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0DCC74160CAC;
	Tue, 15 Apr 2025 15:27:25 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
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
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Date: Tue, 15 Apr 2025 15:27:23 +0800
Message-Id: <20250415072724.3565533-10-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB5:EE_|TYZPR06MB5906:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6fc32997-f9bb-4493-e9bb-08dd7beef8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HK9UGpjgnTlgf1Rf54vG5ZcxKseDzkO3zSJ5LeF1NevaE75+PVmNXd6JV1Yh?=
 =?us-ascii?Q?5H94VG9m0mzc9FO79Kd840hnsgWx7mV61Iw7Q1CFNLUgGxlMLSkuibSMJjBm?=
 =?us-ascii?Q?FMCoakqdxgZ9nGALtwzjbGBUiXbaarxlrpTNCOSEKOoygaHZeCAR6/uJEBrx?=
 =?us-ascii?Q?6CsGMBbLSSDREGrNoRqSanlusTNYuBxA9wSxos3uC7BJAxk3BjO5ORQ6Np+o?=
 =?us-ascii?Q?koSGXZp0Dp5mW9ygWGNn9e53C0S1ebHu/N4VevQimeP91D2NDSeJ9jIQDqlx?=
 =?us-ascii?Q?uM9x6iKkxo/okuAGACsbjSFBLqTd9cW8niC1GYaKvqNZ2qZPHksdh6R9bx1I?=
 =?us-ascii?Q?fdWFsONUa+WWfmDpcrC6PhjmsQWsQ4gWH6fxkFYHaZClPKjOfjP7MZ0Cqzj0?=
 =?us-ascii?Q?aFmMq3FDQDQC5yimX68eC2TnbMxO/0l+nIZVoIzzbq3fsvhmrY3U5BtntxSy?=
 =?us-ascii?Q?4493SoD14oO3XsCLH32EHt4RI6IoCwZf5vPS0/kzO9y3oaW6mkLmPqUKuRp9?=
 =?us-ascii?Q?oXp2To+gSPMbdEjLZMhUpvTrEXEaGxnW2pDpKkWXkj+rNSBCfZB9vxRfFsac?=
 =?us-ascii?Q?dZbsltf5etDFmMrtOrSKuIdP79BpDNdqP2hrfBXsnG4nuAhBTrP++6h8Kzro?=
 =?us-ascii?Q?hMLEuXJ5t+fPNk/paNV/j4tuKUCZ56XnwNxBCnk61cn2eZVw5UVtGstlCqlG?=
 =?us-ascii?Q?5SXSQakB2cmXQVnYwuT5umzJ5GQBhprfuYt2JxyyOUcLIBPOcOxWOiAJN7jC?=
 =?us-ascii?Q?oJYcY5bsUAaHzbIboTaNQ/8D4MIC5Cd3gHwj7uX1HxhpVnzl4RvY2TpIBCYL?=
 =?us-ascii?Q?Yr7fgMBy5/qwtbrcy13TGtXxoBQ05JKax7Eq1A5YoJ0gUDti3QqTXKy0uoYt?=
 =?us-ascii?Q?+O6DSvqRMl8danUHXpjq1s0f1evIOQkwLF0moE05KJU3lkPcYqMf9u9lEPw1?=
 =?us-ascii?Q?tE4LfCtMROrwajtpSzhhjQhGBoi5YxR8KpmTJ8vRzpcvvnqglxfxkF7MQIlL?=
 =?us-ascii?Q?EDR3Gv7gAEsuvSawJQeKena8gXaQYcubxF6hZ1WNOGGvDCMnb/suoNWtDPbX?=
 =?us-ascii?Q?wfsKyvQNfX7xwV6yBaM5r5TCXagt8iJfGR85KjxrKdt9jYZhHUb+nDV+oBJM?=
 =?us-ascii?Q?Qiud/2V2bWFZOUFgX7L9ObUj++KsM1k4UPONGL4e+APnLURTa22JPIt9uLxF?=
 =?us-ascii?Q?jd6w2xYN/C1IV7rXoKaDB+FTq60zbrZrK6sOyifWmpbg31WsqdezT6VwP6ei?=
 =?us-ascii?Q?kElcgkAKQix3PiVPeEbMrFvcCJ3AO0yWXemBM7T1gA3tITd6AbRZaS05TwVe?=
 =?us-ascii?Q?grbL6H1dVfJK+V4JuiflXYX382nBiMIwBoa7ZtvJ0jfSM8q6N1tfqlfVKe8Z?=
 =?us-ascii?Q?794+xvD/EISUjWXE5ngXSdczC0ZaalWvyiLUAa71IBNW2PLINLW0krKOLyxo?=
 =?us-ascii?Q?O9x54Fk7Eztl/8CEqeXPpqLg8CcxnSUagF/sFFdtD2504y2FuPd0RQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc32997-f9bb-4493-e9bb-08dd7beef8ab
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5906

CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
and Orion O6 is the motherboard launched by Radxa. See below for
detail:
https://docs.radxa.com/en/orion/o6/getting-started/introduction

In this commit, it adds sky1 base, mailbox, clock (scmi firmware baseed)
and uart, and the kernel could boot up to console.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
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
 arch/arm64/boot/dts/cix/sky1.dtsi         | 335 ++++++++++++++++++++++
 4 files changed, 377 insertions(+)
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
index 000000000000..11816b52462b
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sky1-clk.h>
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
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg-io-width = <4>;
+			reg = <0x0 0x06590000 0x0 0x80>;
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
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg-io-width = <4>;
+			reg = <0x0 0x065a0000 0x0 0x80>;
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

