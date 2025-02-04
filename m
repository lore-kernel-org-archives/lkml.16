Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279B20764E;
	Tue,  4 Feb 2025 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657855; cv=fail; b=lZBSbD/BxMfo6N+UGBXZ+30zTW0gsRjo6c3ArqK0U3LcN1hpmDiROX2Blvab0NJsSKZUXcbY17+2S63L3PxX1ZWhLpmxCnAc3eyCRuC/DMM7K8AKV8KJRb+jroY9NALxGqPqr/XPOa0ZnCiWq+z80JLFDW7FN/TTiOHUQ8xoxPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657855; c=relaxed/simple;
	bh=DJ3vCgcanTL2LLlh2BMU51wOR0pKJgSzm2ygQ1P5BaA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqihW5V6hmoTBNn5DirLeyrdV3WpEh8Q0ICweOxgkjftdVIW0qYfyM2eFsTzKabK1njIxLpEhaUnDN8EleIza49txjKzjOnRdbp55ouTUBzZC9V2kvh5NFSgOCk77VpGeDnjbi2toBG+mNgtsuYBOWcVK6AyU5TZzez3SUBtER8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EGm6ZRn5; arc=fail smtp.client-ip=40.107.244.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EGm6ZRn5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQp5zbxu44XxipUG3X+euQF5OswthYfv5y98gPDzQaNdWveyGpAx9Q3sFFeRQP72PB7aGgAeadhY9k1l0XIJ+JuPRAYK5ISWumJs4MPlKff1i/dYDJxrJAhl8XKNBkzaqymfOcg9cuyPbEG3+vNx/htBuqLmK0WXgcS12ImpSZMBxm7a8mLLW/7fdAbTm/8Tbs2jPuiX79c7abwpxN80Rt3ASqXBYHaXLmoE0i9fIPZ5TKMRMkoO3wHhY4SyxH6/oaoPf8eLzJGwMFvlzh9jMoUwF2pI2nL4jiPg7O9oOdiKI39zgN65nmBDKhA3PzmX3j6KjVATD17wnNKKnNkPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XghcL7bqoP3My4erH32omPFBRmmlz5CQNSMWSQVrCqY=;
 b=u3b9PVKQI6qn9yEwZBCwRbXpWBM9ZgfWPedgtwKL65BRUcQa3rDYBbiyE7byEFSz6N3akKtQX8Ryq6vaCgsBlMVvboty09sHYOLQxJdvXugJot2ubTuxFGynndfm8yXgOpG1QyxFYbTf5008j+CmiT88Fc6Li6vf45cZngmizFfUXGQiDHyLNdelcVbZ9+CpYNauMqKYiFPuGtE2xB7wNsr05yMIFKr9D6lLspvaj1uR/ui26T/RP6WjKY1LVCunu7fFya4welKLfwNcrHdKD4v/ervwDlQ8R/Kdj4ifF7G5GfnCv1nxOQexYdy7Vi75nKXlbuuU6DkG5EGf1h7DkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XghcL7bqoP3My4erH32omPFBRmmlz5CQNSMWSQVrCqY=;
 b=EGm6ZRn5Q68iY5lQOv1asviL8Vnh0J2HzoNVEBztcPfVAMpcJPINiBcaeMIQ/7xJlGSn03CMsua4rxE9YnoMt153TEF1J6MpbYWJJj7ccsKZj2ia4FmYFiY5253cpOpU7yDr0jwfX/w1IwVYkogoeWOKX6+r8io/rdZBgCY22tA=
Received: from SN6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:805:66::21)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Tue, 4 Feb
 2025 08:30:49 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:805:66:cafe::52) by SN6PR08CA0008.outlook.office365.com
 (2603:10b6:805:66::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Tue,
 4 Feb 2025 08:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 08:30:49 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 02:30:47 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/2] arm64: versal-net: Add description for b2197-00 revA board
Date: Tue, 4 Feb 2025 09:30:33 +0100
Message-ID: <1b23d64107220f5b48fc77ba28c5e59a20d83600.1738657826.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738657826.git.michal.simek@amd.com>
References: <cover.1738657826.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=26577; i=michal.simek@amd.com; h=from:subject:message-id; bh=DJ3vCgcanTL2LLlh2BMU51wOR0pKJgSzm2ygQ1P5BaA=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvSFF3Q+1O+Ob1w4195m8bZl5fuVw8rCy/K2u0woOrjh8 Vebc+aHOmJZGASZGGTFFFmkba6c2Vs5Y4rwxcNyMHNYmUCGMHBxCsBEmqwZ5nDMPjThwYNi41ov JU/xuTGxXz49rmKYnzTruVrjkurXu0w7GLJ391+Ye790PQA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: d158cba3-9a8b-4e7b-492f-08dd44f63ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ac6hTIBb05GyFLY/k6Pjf6s+U2TQlxbnSuU6t7I/0wQ/KEKsHqSwjTpJxnEr?=
 =?us-ascii?Q?jA9dLo3Nc/bjgiKplcQIosr/+5H1mOUg3TwX5v0b1p92QFInj3hUAO8N0GFL?=
 =?us-ascii?Q?QCfKTp67ayYBd64DvzPEUL/g6R1vlHawcsVJpCRED1vox6f4fv0MbUnlO71V?=
 =?us-ascii?Q?tYsp7N+AqJxqXiyjJs6Lpsi3pq7q2tdVbsuOUfeQUIqyEmzYGBLWafiT2CgS?=
 =?us-ascii?Q?P6sdzmf5bNrChjtuAZHDiuQcMEgxUKyiK3LUuZ7YS0eh8YFG8k4dVGXd1HqR?=
 =?us-ascii?Q?lq3SYV7Ef5Dtxr+nn6CYu33289rAcP1l9PjESs3uc8TcKORoWX6f6Pp3f8Bd?=
 =?us-ascii?Q?BuLmiXa8N4maYEY6B2B6RcSOlT0ktWP1NMVCd2zKO3UYe4iRky0Ypd9bYmDb?=
 =?us-ascii?Q?n/TIc6qQUYJzZKBBpY9GsCu1krusbcUCzsqF3asisGIeLbUwwiRIJcogkOfn?=
 =?us-ascii?Q?79TcfQuBIAon0FVLvGBVeZArrpJ+WUXFxEOf31pGEQpfwWAE+7ToDdJ5staQ?=
 =?us-ascii?Q?0I1/4k50QVTz55DIsRrILXZGbzznAUaSXKYEHjIsQiY9Oy3T4cZowUNM4yPW?=
 =?us-ascii?Q?PLD7GEDUV2KMDxq4X+G5k+ZXCv8Ykm05D6Y2PvdJJv6RFhVH4kEIKWpwdaxl?=
 =?us-ascii?Q?4kqyP6P5+tIPSTvEynbYlKA5jUgNoTRFGCyT40biXuFpdgQ7aATsqxu5EleK?=
 =?us-ascii?Q?tcNKgJvR9QCWc7UnzETqVSLoZ6q5RrlfOfxEpvEnraRQ2M7E/4CT9ZGnKqea?=
 =?us-ascii?Q?1uR8+qxzFqmKzgy3Jfth7fmnxXcmL8ISLP3zwq6PKfYR2Cj8+YJhvRE6nyjD?=
 =?us-ascii?Q?7qood3GY6r3hK5hxdczJtug9K66teyl/XHvzYkxDE8Gv4illGWNBqsGQweRD?=
 =?us-ascii?Q?7b5Ip4OjmHS27JC9nZ1obGH4z6/2zr7SEVIv8i3n1S1II9fEf4EpK0Qcg4pa?=
 =?us-ascii?Q?gAvmxZ2cEhTXX3Vpnh4qZCc1aBF5TmGp9aDBcD3ds6Tq2gYUVro7dBrgSd1N?=
 =?us-ascii?Q?0CLUJtYwltxox7d7G5eEMrwjIPhtXHtbMdMoTEoR1GrG/9zU3A7i7JBbetVr?=
 =?us-ascii?Q?X/6NtHrVHIQaJXdn3+6iBo7P3MOxROU6Fw2XRAw8Pbahmec2kAAeaa192aQA?=
 =?us-ascii?Q?Q2mxbWbi+KGaLmL8dLhI6MsQxXii390h10yOs6cctZJpI3GTOxaREc0Ibskc?=
 =?us-ascii?Q?w91z479XAhT8bZy3j8LWCBou7yN/nWUAFsTnXxY/LPiovelNLHyPHHQUiBmG?=
 =?us-ascii?Q?B6c3kiOxBvR8nB5EPAtib6I97PfR5S3NWO2Vt7HvO4k8hC0qu9/buQvPjfDg?=
 =?us-ascii?Q?mBJTtANAC3uY0zxxEkgAji8H6IfFxiz5LFRUUZm8H6Mb5omnu1meZEZX6iaP?=
 =?us-ascii?Q?mypEIfSzHUiSDA8eT7UZzmtVnPdZjMGTHbZu5MZCoBWY5u1aj3oTdnlVEWMX?=
 =?us-ascii?Q?jBfPDTDmpsCNMcaf0996r88eogh0aZSTOn0cs6diXzBM1OPWsXY4vr5QxgQj?=
 =?us-ascii?Q?HFjBl0Zuq1U8dFk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:30:49.6092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d158cba3-9a8b-4e7b-492f-08dd44f63ae2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119

Add description for VN-X board. The board is using Versal NET SoC which has
16 a78 cores with additional IPs.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- New patch in series

 arch/arm64/boot/dts/xilinx/Makefile           |   2 +
 .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 231 ++++++
 .../xilinx/versal-net-vn-x-b2197-01-revA.dts  | 116 +++
 arch/arm64/boot/dts/xilinx/versal-net.dtsi    | 752 ++++++++++++++++++
 4 files changed, 1101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net.dtsi

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 1068b0fa8e98..7f5a8801cad1 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -29,3 +29,5 @@ zynqmp-smk-k26-revA-sck-kv-g-revA-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revA.dtb
 zynqmp-smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revB.dtb
+
+dtb-$(CONFIG_ARCH_ZYNQMP) += versal-net-vn-x-b2197-01-revA.dtb
diff --git a/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi b/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
new file mode 100644
index 000000000000..b7a8a1a512cb
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Xilinx Versal NET fixed clock
+ *
+ * (C) Copyright 2022, Xilinx, Inc.
+ * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
+ *
+ * Michal Simek <michal.simek@amd.com>
+ */
+
+/ {
+	clk60: clk60 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <60000000>;
+	};
+
+	clk100: clk100 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk125: clk125 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	clk150: clk150 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <150000000>;
+	};
+
+	clk160: clk160 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <160000000>;
+	};
+
+	clk200: clk200 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+	};
+
+	clk250: clk250 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;
+	};
+
+	clk300: clk300 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <300000000>;
+	};
+
+	clk450: clk450 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <450000000>;
+	};
+
+	clk1200: clk1200 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1200000000>;
+	};
+
+	firmware {
+		versal_net_firmware: versal-net-firmware {
+			compatible = "xlnx,versal-net-firmware", "xlnx,versal-firmware";
+			bootph-all;
+			method = "smc";
+		};
+	};
+};
+
+&adma0 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma1 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma2 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma3 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma4 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma5 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma6 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&adma7 {
+	clocks = <&clk450>, <&clk450>;
+};
+
+&can0 {
+	clocks = <&clk160>, <&clk160>;
+};
+
+&can1 {
+	clocks = <&clk160>, <&clk160>;
+};
+
+&gem0 {
+	clocks = <&clk125>, <&clk125>, <&clk125>, <&clk125>, <&clk250>;
+};
+
+&gem1 {
+	clocks = <&clk125>, <&clk125>, <&clk125>, <&clk125>, <&clk250>;
+};
+
+&gpio0 {
+	clocks = <&clk100>;
+};
+
+&gpio1 {
+	clocks = <&clk100>;
+};
+
+&i2c0 {
+	clocks = <&clk100>;
+};
+
+&i2c1 {
+	clocks = <&clk100>;
+};
+
+&i3c0 {
+	clocks = <&clk100>;
+};
+
+&i3c1 {
+	clocks = <&clk100>;
+};
+
+&ospi {
+	clocks = <&clk200>;
+};
+
+&qspi {
+	clocks = <&clk300>, <&clk300>;
+};
+
+&rtc {
+	/* Nothing */
+};
+
+&sdhci0 {
+	clocks = <&clk200>, <&clk200>, <&clk1200>;
+};
+
+&sdhci1 {
+	clocks = <&clk200>, <&clk200>, <&clk1200>;
+};
+
+&serial0 {
+	clocks = <&clk100>, <&clk100>;
+};
+
+&serial1 {
+	clocks = <&clk100>, <&clk100>;
+};
+
+&spi0 {
+	clocks = <&clk200>, <&clk200>;
+};
+
+&spi1 {
+	clocks = <&clk200>, <&clk200>;
+};
+
+&ttc0 {
+	clocks = <&clk150>;
+};
+
+&usb0 {
+	clocks = <&clk60>, <&clk60>;
+};
+
+&dwc3_0 {
+	clocks = <&clk60>;
+};
+
+&usb1 {
+	clocks = <&clk60>, <&clk60>;
+};
+
+&dwc3_1 {
+	clocks = <&clk60>;
+};
+
+&wwdt0 {
+	clocks = <&clk150>;
+};
+
+&wwdt1 {
+	clocks = <&clk150>;
+};
+
+&wwdt2 {
+	clocks = <&clk150>;
+};
+
+&wwdt3 {
+	clocks = <&clk150>;
+};
+
+&lpd_wwdt0 {
+	clocks = <&clk150>;
+};
+
+&lpd_wwdt1 {
+	clocks = <&clk150>;
+};
diff --git a/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts b/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
new file mode 100644
index 000000000000..06b2301f48a0
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Xilinx Versal Net VNX board revA
+ *
+ * (C) Copyright 2022, Xilinx, Inc.
+ * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
+ *
+ * Michal Simek <michal.simek@amd.com>
+ */
+
+/dts-v1/;
+
+#include "versal-net.dtsi"
+#include "versal-net-clk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "xlnx,versal-net-vnx-revA", "xlnx,versal-net-vnx", "xlnx,versal-net";
+	model = "Xilinx Versal NET VNX revA";
+	dma-coherent;
+
+	memory: memory@0 {
+		reg = <0 0 0 0x80000000>;
+		device_type = "memory";
+	};
+
+	memory_hi: memory@800000000 {
+		reg = <8 0 3 0x80000000>;
+		device_type = "memory";
+	};
+
+	memory_hi2: memory@50000000000 {
+		reg = <0x500 0 4 0>;
+		device_type = "memory";
+	};
+
+	chosen {
+		bootargs = "console=ttyAMA1,115200n8";
+		stdout-path = "serial1:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		rsc_tbl_carveout: rproc@bbf14000 {
+			reg = <0 0xbbf14000 0 0x1000>;
+			no-map;
+		};
+		rpu0vdev0vring0: rpu0vdev0vring0@bbf15000 {
+			reg = <0 0xbbf15000 0 0x1000>;
+			no-map;
+		};
+		rpu0vdev0vring1: rpu0vdev0vring1@bbf16000 {
+			reg = <0 0xbbf16000 0 0x1000>;
+			no-map;
+		};
+		rpu0vdev0buffer: rpu0vdev0buffer@bbf17000 {
+			reg = <0 0xbbf17000 0 0xD000>;
+			no-map;
+		};
+		reserve_others: reserveothers@0 {
+			reg = <0 0x0 0 0x1c200000>;
+			no-map;
+		};
+		pdi_update: pdiupdate@1c200000 {
+			reg = <0 0x1c200000 0 0x6000000>;
+			no-map;
+		};
+		reserve_optee_atf: reserveopteeatf@22200000 {
+			reg = <0 0x22200000 0 0x4100000>;
+			no-map;
+		};
+	};
+};
+
+&gem1 {
+	status = "okay";
+	iommus = <&smmu 0x235>;
+	phy-handle = <&phy>;
+	phy-mode = "rmii";
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		phy: ethernet-phy@4 {
+			reg = <4>;
+		};
+	};
+};
+
+&ospi {
+	num-cs = <2>;
+	iommus = <&smmu 0x245>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
+
+&sdhci1 {
+	status = "okay";
+	iommus = <&smmu 0x243>;
+	non-removable;
+	disable-wp;
+	no-sd;
+	no-sdio;
+	cap-mmc-hw-reset;
+	bus-width = <8>;
+	no-1-8-v;
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&smmu {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
new file mode 100644
index 000000000000..fc9f49e57385
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -0,0 +1,752 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Xilinx Versal NET
+ *
+ * (C) Copyright 2022, Xilinx, Inc.
+ * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
+ *
+ * Michal Simek <michal.simek@amd.com>
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "xlnx,versal-net";
+	model = "Xilinx Versal NET";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			bootscr-address = /bits/ 64 <0x20000000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu100>;
+				};
+				core2 {
+					cpu = <&cpu200>;
+				};
+				core3 {
+					cpu = <&cpu300>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu10000>;
+				};
+
+				core1 {
+					cpu = <&cpu10100>;
+				};
+
+				core2 {
+					cpu = <&cpu10200>;
+				};
+
+				core3 {
+					cpu = <&cpu10300>;
+				};
+			};
+			cluster2 {
+				core0 {
+					cpu = <&cpu20000>;
+				};
+
+				core1 {
+					cpu = <&cpu20100>;
+				};
+
+				core2 {
+					cpu = <&cpu20200>;
+				};
+
+				core3 {
+					cpu = <&cpu20300>;
+				};
+			};
+			cluster3 {
+				core0 {
+					cpu = <&cpu30000>;
+				};
+
+				core1 {
+					cpu = <&cpu30100>;
+				};
+
+				core2 {
+					cpu = <&cpu30200>;
+				};
+
+				core3 {
+					cpu = <&cpu30300>;
+				};
+			};
+
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu100: cpu@100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x100>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu200: cpu@200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x200>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu300: cpu@300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x300>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu10000: cpu@10000 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x10000>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu10100: cpu@10100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x10100>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu10200: cpu@10200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x10200>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu10300: cpu@10300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x10300>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu20000: cpu@20000 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x20000>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu20100: cpu@20100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x20100>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu20200: cpu@20200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x20200>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu20300: cpu@20300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x20300>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu30000: cpu@30000 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x30000>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu30100: cpu@30100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x30100>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu30200: cpu@30200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x30200>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		cpu30300: cpu@30300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x30300>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x40000000>;
+				local-timer-stop;
+				entry-latency-us = <300>;
+				exit-latency-us = <600>;
+				min-residency-us = <10000>;
+			};
+		};
+	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-1066000000 {
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1866000000 {
+			opp-hz = /bits/ 64 <1866000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1900000000 {
+			opp-hz = /bits/ 64 <1900000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1999000000 {
+			opp-hz = /bits/ 64 <1999000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-2050000000 {
+			opp-hz = /bits/ 64 <2050000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-2100000000 {
+			opp-hz = /bits/ 64 <2100000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-2200000000 {
+			opp-hz = /bits/ 64 <2200000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <500000>;
+		};
+	};
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &dcc;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		rtc = &rtc;
+		usb0 = &usb0;
+		usb1 = &usb1;
+		spi0 = &ospi;
+		spi1 = &qspi;
+	};
+
+	dcc: dcc {
+		compatible = "arm,dcc";
+		status = "disabled";
+		bootph-all;
+	};
+
+	firmware {
+		psci {
+			compatible = "arm,psci-1.0";
+			method = "smc";
+		};
+	};
+
+	fpga: fpga-region {
+		compatible = "fpga-region";
+		fpga-mgr = <&versal_fpga>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
+	timer: timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 4>, <1 14 4>, <1 11 4>, <1 10 4>;
+	};
+
+	versal_fpga: versal-fpga {
+		compatible = "xlnx,versal-fpga";
+	};
+
+	amba: axi {
+		compatible = "simple-bus";
+		bootph-all;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		adma0: dma-controller@ebd00000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd00000 0 0x1000>;
+			interrupts = <0 72 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma1: dma-controller@ebd10000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd10000 0 0x1000>;
+			interrupts = <0 73 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma2: dma-controller@ebd20000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd20000 0 0x1000>;
+			interrupts = <0 74 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma3: dma-controller@ebd30000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd30000 0 0x1000>;
+			interrupts = <0 75 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma4: dma-controller@ebd40000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd40000 0 0x1000>;
+			interrupts = <0 76 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma5: dma-controller@ebd50000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd50000 0 0x1000>;
+			interrupts = <0 77 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma6: dma-controller@ebd60000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd60000 0 0x1000>;
+			interrupts = <0 78 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		adma7: dma-controller@ebd70000 {
+			compatible = "xlnx,zynqmp-dma-1.0";
+			status = "disabled";
+			reg = <0 0xebd70000 0 0x1000>;
+			interrupts = <0 79 4>;
+			clock-names = "clk_main", "clk_apb";
+			#dma-cells = <1>;
+			xlnx,bus-width = <64>;
+		};
+
+		can0: can@f1980000 {
+			compatible = "xlnx,canfd-2.0";
+			status = "disabled";
+			reg = <0 0xf1980000 0 0x6000>;
+			interrupts = <0 27 4>;
+			clock-names = "can_clk", "s_axi_aclk";
+			rx-fifo-depth = <64>;
+			tx-mailbox-count = <32>;
+		};
+
+		can1: can@f1990000 {
+			compatible = "xlnx,canfd-2.0";
+			status = "disabled";
+			reg = <0 0xf1990000 0 0x6000>;
+			interrupts = <0 28 4>;
+			clock-names = "can_clk", "s_axi_aclk";
+			rx-fifo-depth = <64>;
+			tx-mailbox-count = <32>;
+		};
+
+		gem0: ethernet@f19e0000 {
+			compatible = "xlnx,versal-gem", "cdns,gem";
+			status = "disabled";
+			reg = <0 0xf19e0000 0 0x1000>;
+			interrupts = <0 39 4>, <0 39 4>;
+			clock-names = "pclk", "hclk", "tx_clk", "rx_clk",
+				      "tsu_clk";
+		};
+
+		gem1: ethernet@f19f0000 {
+			compatible = "xlnx,versal-gem", "cdns,gem";
+			status = "disabled";
+			reg = <0 0xf19f0000 0 0x1000>;
+			interrupts = <0 41 4>, <0 41 4>;
+			clock-names = "pclk", "hclk", "tx_clk", "rx_clk",
+				      "tsu_clk";
+		};
+
+		gic: interrupt-controller@e2000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			reg = <0 0xe2000000 0 0x10000>,
+			      <0 0xe2060000 0 0x200000>;
+			interrupt-controller;
+			interrupts = <1 9 4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			its: msi-controller@e2040000 {
+				compatible = "arm,gic-v3-its";
+				msi-controller;
+				#msi-cells = <1>;
+				reg = <0 0xe2040000 0 0x20000>;
+			};
+		};
+
+		gpio0: gpio@f19d0000 {
+			compatible = "xlnx,versal-gpio-1.0";
+			status = "disabled";
+			reg = <0 0xf19d0000 0 0x1000>;
+			interrupts = <0 20 4>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio1: gpio@f1020000 {
+			compatible = "xlnx,pmc-gpio-1.0";
+			status = "disabled";
+			reg = <0 0xf1020000 0 0x1000>;
+			interrupts = <0 180 4>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		i2c0: i2c@f1940000 {
+			compatible = "cdns,i2c-r1p14";
+			status = "disabled";
+			reg = <0 0xf1940000 0 0x1000>;
+			interrupts = <0 21 4>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@f1950000 {
+			compatible = "cdns,i2c-r1p14";
+			status = "disabled";
+			reg = <0 0xf1950000 0 0x1000>;
+			interrupts = <0 22 4>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i3c0: i3c@f1948000 {
+			compatible = "snps,dw-i3c-master-1.00a";
+			status = "disabled";
+			reg = <0 0xf1948000 0 0x1000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			interrupts = <0 21 4>;
+		};
+
+		i3c1: i3c@f1958000 {
+			compatible = "snps,dw-i3c-master-1.00a";
+			status = "disabled";
+			reg = <0 0xf1958000 0 0x1000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			interrupts = <0 22 4>;
+		};
+
+		ospi: spi@f1010000 {
+			compatible = "xlnx,versal-ospi-1.0", "cdns,qspi-nor";
+			status = "disabled";
+			reg = <0 0xf1010000 0 0x10000>,
+			      <0 0xc0000000 0 0x20000000>;
+			interrupts = <0 182 4>;
+			cdns,fifo-depth = <256>;
+			cdns,fifo-width = <4>;
+			cdns,is-dma = <1>; /* u-boot specific */
+			cdns,trigger-address = <0xc0000000>;
+		};
+
+		qspi: spi@f1030000 {
+			compatible = "xlnx,versal-qspi-1.0";
+			status = "disabled";
+			reg = <0 0xf1030000 0 0x1000>;
+			interrupts = <0 183 4>;
+			clock-names = "ref_clk", "pclk";
+		};
+
+		rtc: rtc@f12a0000 {
+			compatible = "xlnx,zynqmp-rtc";
+			status = "disabled";
+			reg = <0 0xf12a0000 0 0x100>;
+			interrupts = <0 200 4>, <0 201 4>;
+			interrupt-names = "alarm", "sec";
+			calibration = <0x8000>;
+		};
+
+		sdhci0: mmc@f1040000 {
+			compatible = "xlnx,versal-8.9a", "arasan,sdhci-8.9a";
+			status = "disabled";
+			reg = <0 0xf1040000 0 0x10000>;
+			interrupts = <0 184 4>;
+			clock-names = "clk_xin", "clk_ahb", "gate";
+			#clock-cells = <1>;
+			clock-output-names = "clk_out_sd0", "clk_in_sd0";
+		};
+
+		sdhci1: mmc@f1050000 {
+			compatible = "xlnx,versal-net-emmc";
+			status = "disabled";
+			reg = <0 0xf1050000 0 0x10000>;
+			interrupts = <0 186 4>;
+			clock-names = "clk_xin", "clk_ahb", "gate";
+			#clock-cells = <1>;
+			clock-output-names = "clk_out_sd1", "clk_in_sd1";
+		};
+
+		serial0: serial@f1920000 {
+			bootph-all;
+			compatible = "arm,pl011", "arm,primecell";
+			status = "disabled";
+			reg = <0 0xf1920000 0 0x1000>;
+			interrupts = <0 25 4>;
+			reg-io-width = <4>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		serial1: serial@f1930000 {
+			bootph-all;
+			compatible = "arm,pl011", "arm,primecell";
+			status = "disabled";
+			reg = <0 0xf1930000 0 0x1000>;
+			interrupts = <0 26 4>;
+			reg-io-width = <4>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		smmu: iommu@ec000000 {
+			compatible = "arm,smmu-v3";
+			status = "disabled";
+			reg = <0 0xec000000 0 0x40000>;
+			#iommu-cells = <1>;
+			interrupt-names = "combined";
+			interrupts = <0 169 4>;
+			dma-coherent;
+		};
+
+		spi0: spi@f1960000 {
+			compatible = "cdns,spi-r1p6";
+			status = "disabled";
+			interrupts = <0 23 4>;
+			reg = <0 0xf1960000 0 0x1000>;
+			clock-names = "ref_clk", "pclk";
+		};
+
+		spi1: spi@f1970000 {
+			compatible = "cdns,spi-r1p6";
+			status = "disabled";
+			interrupts = <0 24 4>;
+			reg = <0 0xf1970000 0 0x1000>;
+			clock-names = "ref_clk", "pclk";
+		};
+
+		ttc0: timer@f1dc0000 {
+			compatible = "cdns,ttc";
+			status = "disabled";
+			interrupts = <0 43 4>, <0 44 4>, <0 45 4>;
+			timer-width = <32>;
+			reg = <0x0 0xf1dc0000 0x0 0x1000>;
+		};
+
+		ttc1: timer@f1dd0000 {
+			compatible = "cdns,ttc";
+			status = "disabled";
+			interrupts = <0 46 4>, <0 47 4>, <0 48 4>;
+			timer-width = <32>;
+			reg = <0x0 0xf1dd0000 0x0 0x1000>;
+		};
+
+		ttc2: timer@f1de0000 {
+			compatible = "cdns,ttc";
+			status = "disabled";
+			interrupts = <0 49 4>, <0 50 4>, <0 51 4>;
+			timer-width = <32>;
+			reg = <0x0 0xf1de0000 0x0 0x1000>;
+		};
+
+		ttc3: timer@f1df0000 {
+			compatible = "cdns,ttc";
+			status = "disabled";
+			interrupts = <0 52 4>, <0 53 4>, <0 54 4>;
+			timer-width = <32>;
+			reg = <0x0 0xf1df0000 0x0 0x1000>;
+		};
+
+		usb0: usb@f1e00000 {
+			compatible = "xlnx,versal-dwc3";
+			status = "disabled";
+			reg = <0 0xf1e00000 0 0x100>;
+			clock-names = "bus_clk", "ref_clk";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			dwc3_0: usb@f1b00000  {
+				compatible = "snps,dwc3";
+				status = "disabled";
+				reg = <0 0xf1b00000 0 0x10000>;
+				interrupt-names = "host", "peripheral", "otg", "wakeup";
+				interrupts = <0 29 4>, <0 29 4>, <0 33 4>, <0 98 4>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+				dr_mode = "peripheral";
+				maximum-speed = "high-speed";
+				snps,usb3_lpm_capable;
+				clock-names = "ref";
+			};
+		};
+
+		usb1: usb@f1e10000 {
+			compatible = "xlnx,versal-dwc3";
+			status = "disabled";
+			reg = <0x0 0xf1e10000 0x0 0x100>;
+			clock-names = "bus_clk", "ref_clk";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			dwc3_1: usb@f1c00000  {
+				compatible = "snps,dwc3";
+				status = "disabled";
+				reg = <0x0 0xf1c00000 0x0 0x10000>;
+				interrupt-names = "host", "peripheral", "otg", "wakeup";
+				interrupts = <0 34 4>, <0 34 4>, <0 38 4>, <0 99 4>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+				dr_mode = "host";
+				maximum-speed = "high-speed";
+				snps,usb3_lpm_capable;
+				clock-names = "ref";
+			};
+		};
+
+		wwdt0: watchdog@ecc10000 {
+			compatible = "xlnx,versal-wwdt";
+			status = "disabled";
+			reg = <0 0xecc10000 0 0x10000>;
+			timeout-sec = <30>;
+		};
+
+		wwdt1: watchdog@ecd10000 {
+			compatible = "xlnx,versal-wwdt";
+			status = "disabled";
+			reg = <0 0xecd10000 0 0x10000>;
+			timeout-sec = <30>;
+		};
+
+		wwdt2: watchdog@ece10000 {
+			compatible = "xlnx,versal-wwdt";
+			status = "disabled";
+			reg = <0 0xece10000 0 0x10000>;
+			timeout-sec = <30>;
+		};
+
+		wwdt3: watchdog@ecf10000 {
+			compatible = "xlnx,versal-wwdt";
+			status = "disabled";
+			reg = <0 0xecf10000 0 0x10000>;
+			timeout-sec = <30>;
+		};
+
+		lpd_wwdt0: watchdog@ea420000 {
+			compatible = "xlnx,versal-wwdt";
+			status = "disabled";
+			reg = <0 0xea420000 0 0x10000>;
+			timeout-sec = <30>;
+		};
+
+		lpd_wwdt1: watchdog@ea430000 {
+			compatible = "xlnx,versal-wwdt";
+			status = "disabled";
+			reg = <0 0xea430000 0 0x10000>;
+			timeout-sec = <30>;
+		};
+	};
+};
-- 
2.43.0

