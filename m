Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023112.outbound.protection.outlook.com [40.107.44.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878F2750F9;
	Tue,  6 May 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522482; cv=fail; b=klZ5y5kYEo+hqqfy0bj62zl2KmrfeFdksJRs6R0OyB7BGV1U0xdGEcVDLptEiaT9OGBBHWv2KM0QY8txgXpXrXkrFtQizi6VDjansO/epnS7wxliGaZPTC2tti2ZHM4RZJOcZm9YuCcjfsQNrtieJFy/NAm7yLfjNdILykbFGXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522482; c=relaxed/simple;
	bh=oZ3uQnoCloOmKw9WtgOkTSEzAlQm9PL5yWtyH6fALlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGzF4211+gp34lvK+628964ryIpA7pehr3sXd21L2wdQ3yi+uy/nlRPF098Qz/0zhXub3qfsVvWDX0sIrlHcVF+glQgtWCjl6jfS8E9zWLLMJVJKe4Yj02dCSlWiSsKfDyyWVEBC4UBoLw0TuYvWzSEIWkzmZqK+zfYM6KzXvr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhNHzbGmKWOSwVTSiocme4kD8GpkbbFNH+IKy6/YGCvFQs3mw+V4yx1hioM/U8Mzw4aOzHFLCfhCbNRaj8k2aOdPvWQFbi8YHjfG9Upo57VXBYYOuBOiptqid1d1NDqvsgZfq0rOul9ZiJwlOE5+0oNfBLvp6fMbvItFyZXJJL81ZFgWYXBG9sZ07tQZjLxbd1pc0Uq4zRdBEEop5v0atzdoSv8xLcQg4ceRFQnQqXkHhFcfzGF/HnY/IN+IiTROI7Q4n9X39kcSNwEazHzo2U4guaS4U0I0hkca8BkYvV/NQU2CdMu4OQl/M3SdpEbdlyNruAY6W7Y1SdJsrdUMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJdEyOh0A4I5MAKAot9ia+uSYqCvpNpv75+oUgUhqFg=;
 b=kpVJEprmvWqptJki4/WbqXTRt1dfOfYcSb2/iVuxkggTX60eE9LaXvrRWfHXBBYUEa6f8J3/XJ8Y5BMtlMdnsIB4xp5LAyc7GuE1+Mh9EbWuQjeI78UlV1u3q/v3ggFFjZWe4l9JZFavOU32kd5Smmjh/MCdEEhVQbvMUmVLNUaKvMuPQbO6ajKCme4qxsqRWp3uVm+z8PC1OiIzLKNUrQC4imlmciLoY4n63h3LvXNzNNK3txJseNUBqjcc5ItqzHU/U1cSOp+fSbDnHvH7lzHKF4Fry5AYtyCZ8nEg/AJR9D9qkC7s/n4PI/FzfX57h3yrCCZ7E4Tg4PnH1tjOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:381::14)
 by TY2PPF7E205D1F6.apcprd06.prod.outlook.com (2603:1096:408::799) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Tue, 6 May
 2025 09:07:56 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:400:381:cafe::ae) by TYCP301CA0024.outlook.office365.com
 (2603:1096:400:381::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Tue,
 6 May 2025 09:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:55 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AFF1B4160CAA;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v7 8/9] arm64: dts: cix: Add sky1 base dts initial support
Date: Tue,  6 May 2025 17:07:51 +0800
Message-Id: <20250506090752.3695666-9-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506090752.3695666-1-peter.chen@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|TY2PPF7E205D1F6:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: decc404e-5773-4129-a699-08dd8c7d7d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ee5L5/mUyZ41crn1HDad1Fe5z0aAvtRYZD60HiIUyiCYLc9JbSFZUFmahbRx?=
 =?us-ascii?Q?NU7U14Fu4cOMAULZvjZh6oMnZJGt4eXQVgio00ZLLH0sqol2draxiX6fjebs?=
 =?us-ascii?Q?hYfTXmf/rzoIdV1FZBSyNFB2ie2JjLxnPZvZhitBf4GE/3GudrOTa/Mhmzuy?=
 =?us-ascii?Q?79mMPLaFPCf5XUJQmn0NeE5F8zLuVHIRDn34fLUvTcDdReDER56kDjMrWO//?=
 =?us-ascii?Q?fAZM9iPu63Ad2Eca8ImJ9dKLitMBAQrB9T0OYnMPxTvbXGkyAN+1371VDcWP?=
 =?us-ascii?Q?M1xxlkRe8N9VsVfsWVyQ+WFfVYEk4+3R9UTQI6Kesdyd2AE65pVnxjCFwZJ8?=
 =?us-ascii?Q?6UncUrrITDJAn9ELNxrj5Ei31uR8TRFbiy97+3It1jMe0cXcR43flJ7y1PqK?=
 =?us-ascii?Q?C2TZdr7IGvGY/E05Of+BCAvHh2tF6Sd9e0AZqeJ+8dErgffHfuAlUfdn8YAS?=
 =?us-ascii?Q?3HqKmOzaHff5SQ91iOVbAdZ7o/i/1iL3OELxn2Dog6dRkAxpJKVBEDMcc4k0?=
 =?us-ascii?Q?AI2CGk5JU7c0LGUcgsq+QncX2Mq26BqBbPS+zrM1a5+z0GBRv9HRhSphxFWT?=
 =?us-ascii?Q?pzSdLFmo/5NKHJ8H3qEKSseHf92W5jVLe3AwmRYFOYkXx5ULmZAHTLZXDjWy?=
 =?us-ascii?Q?I2E+jqZ0jxqlxBIvvw8TkP8/bP+ES9ME7BztvCS4av3iopO6oyJf0oJZx+I0?=
 =?us-ascii?Q?wa/UCqrnPM/PwHjt8tiFREb2RG34cDkfn4MHLrGmXTKTF7mWFXOuqbaHO19+?=
 =?us-ascii?Q?Pv8gJbaIfQznR0MXwcgHRBh1NIuplqWr2OmdQQeeobZv20x1imloFJgT+LU5?=
 =?us-ascii?Q?PUJacYLfnwtzbTzDkbjeP8/6feu/z7rFb1Og8rR1bUWl2B1FihiFkhnQjFww?=
 =?us-ascii?Q?SHfYPVefNgK+Fqqf7UepMpiJYvxbTRiWXQ+qSs1797igYrThMj2jHP64Yiv1?=
 =?us-ascii?Q?tf6rsDc2BpYMfivsnLeIKW72oDTvm3muBPOmJkvpgVMg7wv0KNk3luo5KDzd?=
 =?us-ascii?Q?D68heZ+xVWII0Hmc/Doe2DTbFM0k1B5n/MNAw8wLLeE/iUHAQ9t5eX52EQz7?=
 =?us-ascii?Q?RK1I8+DcI2EHMbhvUaBN/h03Z0cmi6s6EKqC/6ij6Xc9MMUM5ElCB8uyBoIx?=
 =?us-ascii?Q?1lbnFFfLCq3sep93NeQrzVpaw7Ydt2iwMZV1XYZIq1MvE9+94hYvw+hko5ZP?=
 =?us-ascii?Q?ljD5zfBE0V+XPicffX0FIVDA6PA3BGT9AImB6LyQ0gZ7xBPmx+E2A7ySPfQt?=
 =?us-ascii?Q?L0vh952SCMgJQ0gjZhxKTpVaXbB9k5EfpwpOM6hQdh9YPMkAdtJ8uAEFKAbR?=
 =?us-ascii?Q?DcEcT79k4jsifALUZPkaM7CoQnOaHqUQe7brN846ZxBtP6jI/UsW8nkgdphZ?=
 =?us-ascii?Q?GVtMUi9RcWx2K5rkNzGAUrkqNtUrLCuf0GFFGb9fMGosr2E36ebZO+oGiU1l?=
 =?us-ascii?Q?I4QL+/vH7ghw5maqGo9sd1Fx4Ued8tS2s+pSysuXy4S+0gN1WvLbvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:55.2551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: decc404e-5773-4129-a699-08dd8c7d7d21
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7E205D1F6

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

