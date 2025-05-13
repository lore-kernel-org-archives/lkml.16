Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023131.outbound.protection.outlook.com [52.101.127.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9319995D;
	Tue, 13 May 2025 02:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101818; cv=fail; b=JKFou12ZwarqI9+dEqa927EjB8GLjHMiLpPJqzXJC5gUmwhC+7O6om3sxhebOhOlzdUR34X1avZIcfdWcOqm6JFKaJ++UBG4P65lk03BZ0WywLMhADoLP9YXd/0OlEvBXK4oKhR9woG1tVebS8+Tv6PilVYoTDAO7ssRF4O4O3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101818; c=relaxed/simple;
	bh=Pu9W/fr2WLzOKM1tntBwF8o0Beu0vLz3XHHwCxChagU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwNJDJ/mecRvVouSNvGNu8+UnTGO57a0luez5hJw2skxLWVwordsZkwS4yKj7zbvTfACKjh+TCuR6r70XDZmGLTCWWcaMfK6jTaHKV7FA4Y9q4DhpTDBSFsWhpfynq3gns76w5KWCjC5MxrIveLjo7zAQAbNvaQSFLn8zr0whVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFXR6lnlgPNmt75H9GfmHwaOvkEuNrxceQQEF/Crjev569JihJwZyX/Te3IESJ2ccbJH07MtbYhOgWsXoNgVlhQosuGSXo/GVHcebS2ziFtX6+iBs3ReInFuoXFix9PugZv77ZX5iJ8/IXF58iPn/MBpv6+VJs+61jVH3ThHbVugRIFlVp8YBekeypC3ri9AQsf7CBaYxP9ZWlDsTrfGheZXY4TTn5Ivyursuq30KCwBXXBXRXcMxCzznGioMAKeaqoSZplGwK1eLCjum1boDplffFRrm5DdiL8VLyVsXyoe2MG+5i1lT6JcCAOG5hqths/57PefEoK73Me6SV8ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw5g7oZ0b3ytMUNEmEQP3V7US6NxONf37ZZRtH19Sdk=;
 b=xDjxgUF3P2EThIdE5QfHwG9fWplCSAW8yEjDLqKDcuLA+EcB1wfvQbYi5i4sUyBycXVyuBwNgLafB9Z59p7X0yznOhvgjCwu6CP3L9ivGOuU9h7ckpFsVN8F/5MBJbCMQjVDY0M6731TxjVXWhDnXk71oOtBvEuraJ711No3l/I7qA4OeoO/yPxzpDjw4uaO0OvqgCrjirPg6+NZSx2184L6kFyrPRcEpbvc0PlqynkzBUNUpye+b3NYgTXX40uUzNkC0zumhdECc491c9Erl2BO0Q1n3Srydalanef88Wo+2hxOdoozCpV3ANZj/o4+C+mesC9LJEVXzUckIn5HGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:263::9)
 by SEYPR06MB5671.apcprd06.prod.outlook.com (2603:1096:101:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 02:03:31 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:400:263:cafe::18) by TYCP286CA0018.outlook.office365.com
 (2603:1096:400:263::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:30 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B8BE2416051C;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
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
Subject: [PATCH v8 8/9] arm64: dts: cix: Add sky1 base dts initial support
Date: Tue, 13 May 2025 10:03:26 +0800
Message-Id: <20250513020327.414017-9-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEYPR06MB5671:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac0a8b4f-a4c2-4953-b928-08dd91c25bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CN2Hvxp0NCnk5+nXXZNZqjmXXRIq5WdyxIGLOFNBw0CixA4z6Xj3Fr4ZT2Bv?=
 =?us-ascii?Q?nQq2Oi3o3EeKHIrQRmps09EOh+7JjhPIt7lcLXja639chdC52J0PIyLGCfdP?=
 =?us-ascii?Q?6u5cxLxJjafXLlUhK8F+5dU8Ge6Uoa04xdHPT/ieq4rWopzJKIfhpW5DsfNk?=
 =?us-ascii?Q?dtS5aCTjyUP4wGW+KJmhs852weIrq0nVU2cXDw/wCYuJlBeqExsYSlE3F5ub?=
 =?us-ascii?Q?wBwCQbZWMqk3feHNd9EQpfjt0YhkF4mG6esXuAOOBO3L128u59zLLFhJeeGw?=
 =?us-ascii?Q?ClaHrGWPgpxTP8vqa9tyvsjoGfLlPUIwD2tytoqWBJUpD5cQHajSTlR8nevQ?=
 =?us-ascii?Q?ZrL9YQzFcKcRFGUtn7L6qVUJxFThgGCZ2TFoHtIC/o21igI0XiuEtRXtUqpq?=
 =?us-ascii?Q?UL05meYoyBcErTB3WCSvnh7BJHknVwCfTqcM+CAREMQWckgf5eDyAJfNmof9?=
 =?us-ascii?Q?MoIVnLld7CWFN+HlwMMMiri1XM5Zg8wAfifoZPV0m55/ycPYFj1WjKNwzLYe?=
 =?us-ascii?Q?6p6PMEi052MgJorBnZYnGYuToN1wbq958xpALrZ4NFpOz6tlmfcLl04ZAeZa?=
 =?us-ascii?Q?UgHi5d6ZTwQT0eAeET1xDCXmfAyuEoAV5/SL4i4R8a/V35MwaOrXikvXmEZ4?=
 =?us-ascii?Q?FofNLHTKvkMffMT54VjWPtDCwnfGXOnuEC5ns3L1FWuFmSHFM9TdV91sBsue?=
 =?us-ascii?Q?Cj9IexRs8hcryfrTkS/KAvK0dKevS1ff1p577kODX+2l70T96nea8Rj0vyJX?=
 =?us-ascii?Q?svAyT6eVusqt9wDl7KgIhLHWHTs4DBJQgN6ApiOFTagBapvNw8lP41SbP1Ir?=
 =?us-ascii?Q?hFv8KnW4jfwtWQJpsRN02rRAG8V5MCPfU4waDdzu/akIX9JUxssEeTCBgV5+?=
 =?us-ascii?Q?RWk7OviQAQ0hfKHvZPKdHsc7ALhwqkiIrxR17pPkikL/L1wJfuscIAldhg1e?=
 =?us-ascii?Q?qOdI4UKh2nZJ77w9qS7PEEHAOOuQNwskr3K9Q5l3Lj0x7JbfN82Me2M3bIRY?=
 =?us-ascii?Q?spUxDjvd9ZXsSeDkWCbHqvQQ58GA/caZPwhkCtTR452XdtfRlolUXARnsMr1?=
 =?us-ascii?Q?bZuI4aQ1yVAi07dU3i82tSRDJF9bGsMXTPmVqRLsQXc/a08CY0iMkiZ3kqj7?=
 =?us-ascii?Q?xf8Q1t2BBQspRBV6COzrX+JT6PZLmaOUgiuwfSaFpzXTjVeTWt9DlUx9JfNI?=
 =?us-ascii?Q?HfprhQb4mvG9Dtm7drn68GyjvYqjqJ7kYlnYYPYZGIuRFCp0BtglhW7OarKc?=
 =?us-ascii?Q?/Pekxj+AlAsuAphmaFDWBh9lQZPQfmySqFX+DYcxT6zXIfBWRJfrm8e874kP?=
 =?us-ascii?Q?qfIcgfWbZw5U8CWBm4cnFCjglsSERYgQBO9GliywDLqtoUK/0hEUPOJXARO/?=
 =?us-ascii?Q?RYpyQ+wzZSNtCCr6Iw4z7rMicbujhrjOdZ02zDQ2gOjqaOMg6RmUnhAfyZkn?=
 =?us-ascii?Q?D8/BQ8ujVxrICrjOfyHYMK2OutEPbpHKRmo7w9BFMIbMM8vnR8YvOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:30.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0a8b4f-a4c2-4953-b928-08dd91c25bda
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5671

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

