Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2117.outbound.protection.outlook.com [40.107.20.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E71CCB4B;
	Wed,  7 May 2025 05:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594553; cv=fail; b=WDbgTD3hBh5zNbVCfJMb5ThPle5B6bqktx+ZcYLAQoBVv1dnBgF3zSErb7rjy981QMLZ8UbyvvQF7dFGjrQSGbQYUIF2zfv9p1plpGBi9ObYv5pN2HNATtrpQ6haNwVOhyaHxUyB5g3MfFZ1fDsDDGzfwkVPh7T6YcUQT4dFYec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594553; c=relaxed/simple;
	bh=kRPFOD8DHw67WlEK7UjbXmgMWbzNXDtNKIe2g6j63M8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IbbD8kvquIwie4kWJAysbo5/o1ly2ksSCHLq3CQM8t04gN2nUirRGojjtwW401h23jCVIfc50DZCXwKNuWAjvMFJWTfgi0meHjwWb/6NoV+Zbh4IoQ3XHpkyw8jmjQd5N3dXsGl57UT7Hs8uhxU9shhfF6PZ/Zcgl4TanM/ma3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=SquRJtQK; arc=fail smtp.client-ip=40.107.20.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="SquRJtQK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1dPUyyll5r0BdfMquPyE2WnNjmheuMIAkDHyC6Ie0ovsehqZ/t57ffOhMy2K144wp8U1oQEinrmZx+F77iwQRcaz04ynk/AQSPrnx39j4DoYColpNhHpHamxTlN5djTyLaPbo5pUhrXIVlm/+Yze/YJBBg9kLzc+Ldsmh8dhOI5yh4HusomMDS9ZXUFX2cJnh9ndVN8Y+HiRD4udLWK/9e8zd3QS6Vc2Vk/Ct6WTHwmbr6ZJeDh+16CnuVLsK7emCi1QrStGqvrlGxS3XY6G2+3LQdSP5UYl5KUrKrZjiP30vmr8rkYrGUfpggCPNAGOSXh3zi8LDo6sLXH82UBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cyg4fSPJk3Pp4YvqpxqbAb9YBc55YCyV0kWxXjB3HUs=;
 b=LKaVi5+TXUWD5eEo/D8Gc9LBCpMixMTy588meBVf5c1+49aaD2naQJw8BHzLmNQ77SiDx4cW+E+TxOTdgjQAYc1YZbNo6vTDjwpL80XZyu1bJ9fDzAa9jdrGo2FkWVnbo94p748zhqDruO83w8k72bFKC0MeDglBSzcNOoP6ryA3GHVpW7d8lG7G9LBnt+jcmmb7j5DhfIV4ZkAiM6MR81B/5M09LJNBUWGiZQidT+ckzbCosBVk/VhLfa9xEyfj005Ao+DCGEmE1qSLBj8NoAryWcv6Vn9iEvIAKckExB3CtUoxVdkZ46IW+fWsvvnXT0cjYlwZ2AyzB0qjlO1LFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cyg4fSPJk3Pp4YvqpxqbAb9YBc55YCyV0kWxXjB3HUs=;
 b=SquRJtQKhSfemTPI0pD8wV58/Ehl1AMU/ndW6PE0cvm6htKPpA6uPWVFWTAJp/m5/Or+js59btGJsLmGIhEQmIYxqoGcb7aUjx4Oy+RrkcmqDMo/7FXK/LrVrki8MWO33kkl/iu5aC4a1ctwSVqJ+JeuYVZ5SiH+UvS8qM4FwedKoHrRCJfGI7ecfp3I/kZELEugyl4Uni8BkOZtH+RUD3jjwEK85nDNzIc4zxLxOuswLbXIkfag43QK8JIkN0a5HHx9WpCkyLijlHwe3GmDxXCKPX7IqRENw3CbHUDEP6X76C8DKICtYifxuQBiNkSD93nc/JSVa4TGHwRUrOUEnQ==
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by PR3P195MB0681.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 05:09:04 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::90) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 05:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 05:09:04 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:03 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:00 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <robertcnelson@gmail.com>,
	<francesco.dolcini@toradex.com>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62-thermal: Add Files for each Temp. Grade
Date: Tue, 6 May 2025 22:08:44 -0700
Message-ID: <20250507050847.912756-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|PR3P195MB0681:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c834b7c-a335-4dbc-1a33-08dd8d254978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG5POFJLSkdpaENyd1JXZWJzNFVwS1FSYVNMTWhUUG15V3p0ZForMDJHQk9U?=
 =?utf-8?B?RGQzOFh0cWVLSCtCTm9QbTE5ZkxoUzFlSTcxdEJ1S3RQRmpNaWFTVm5OcG53?=
 =?utf-8?B?Y3J3dkUySFlZSjEyejEvQVUxR0NUUWR0TXRyb3lQaGd0V1dHVWxETmJ3RHl5?=
 =?utf-8?B?dmZNWUQweEQrTmNwOWR0MW9oV1BPN1V2WkNjckM1djNpVnJOaHdLakdjMW5V?=
 =?utf-8?B?QU5Nd1dzU0N0cFZaenVpVEFqTDZUYzB1Y1VoeTNXbHJpU1NSUU8zeGZzZnJi?=
 =?utf-8?B?VG8zc0pzd2pRdmUwSXJWOFZSNzU3OTk5ZDN1eU1meGl1cWZuL2NubVgwQXZE?=
 =?utf-8?B?Z24wU3Z4WFQwM3ZPN2N1MFZqdkxJRTNpRW1ua1JHZmtKZDc1dS95bUdSNDFO?=
 =?utf-8?B?TTRjK3dEeUN1U2ZnMHkwNU1GcGFRZFpnS0QrR3JUL1NUT1JVQWc1bFp3aXZS?=
 =?utf-8?B?Mmt4RUt3RTlEUmFROTc0cEE2SFlUb1ZKVHVWNkxJeUhmckl6elRsdGtUQ0FX?=
 =?utf-8?B?b3QrUGR0ZjcxSFI2SEtLRVJwV2JaM3ZVUjd6M2llQW4yMnZudEhObHBtWnNl?=
 =?utf-8?B?SDBCeDl5Q3hqMXhQY2xIY1FSdzdISmt1SHc1d2RHb0M4Y3FjanFGWElXQ2VX?=
 =?utf-8?B?Vmlac2c5eVIyN1dRV21HVjVxZVVGY3hiZ2pWTEkwYmZyRWt4dXYveUNRRnBu?=
 =?utf-8?B?UWdUMWd1Ry8zV2l3OWROcDU0LzRhZUNFQThnMVJaejlBeStJNmxTdkdEMndp?=
 =?utf-8?B?Q1N4UnYrYWxJL3RSNzBnVkNFOEhIWGlFd09aYlZ0SzFOVGFGK0xSM1hrNnJj?=
 =?utf-8?B?cDJmYUtEbWdsR1hmWWorVEk1QWFIVlZrTmhLU005dnRQaUU5QmZRZUlldEx2?=
 =?utf-8?B?WDM3UWhrK0VzMWQ0NUxpQUpocUQ1Y1NmOGtOTGJTS0FTOC9DVkd6c09EOU9K?=
 =?utf-8?B?YmljblZVNFBOV2p1S3N0MUJxYjdSVzFyOFlrVW51OFgyUjFvMlB4cXkrd1JV?=
 =?utf-8?B?cEZOK2tBVmM2aVFqRzFDbExMOGx1S09PTU9paFl4UHBZUWFOL050Zk9CYVll?=
 =?utf-8?B?NnJRbFlkS3FGWjU1eDMzNHVmTjlsc2RPSjdIdzl2KzY1S3o2dnRyNlVBSnVs?=
 =?utf-8?B?b2FlRDBXRTFiK0ZYblRGRk1KT1ZVazdpTmhscE5TbGpuWUFRM2R3cEx3OE5B?=
 =?utf-8?B?MnJqWTBUZGFHSnA0TlZxNmJzRmY3cys4aEtUc01veGdPN0JhNmZYOU1pMklT?=
 =?utf-8?B?WDN3cmJOb0t0b0Uva3lDdUhTWUc5anF3UmtUSTNpaXdEa2hGbFhYeURuQ1Ay?=
 =?utf-8?B?N2tDenZaUGR4Zld4Z2lIT0tzS1liMmoyZzNHZEcvRnJNdmVQQnlxTlRUUnlT?=
 =?utf-8?B?djRhc3oyaEpFNGVDd3U3aE9STExSVEFtNGl4MENMc3lYUHVwNHl2WjhaMlRl?=
 =?utf-8?B?c21KanBGNFhOM1NNZjFZMzAwWjYvbUdHZitOTVpJdnlQVzFJL2pQWDdEMkZ3?=
 =?utf-8?B?YzBTYlNtaUZxZ2YweUN4a0M2SDNSYmI2MjNHUWEvVVY2R2RVcWFsMVgvUzZH?=
 =?utf-8?B?Kzh4MTQrT3k5a0dzdnEvRjlncHZoOUtzc1hxS2hscDFDdXV3dTdWclIrMExh?=
 =?utf-8?B?aXI3RklvYmlaYnFMbkhYQVdUc1kxYzJteVhtQ0pGOUREdnpGS1FoZlJKRjBO?=
 =?utf-8?B?NzY0U3JwNDFOWVNFTEF0TVFQWlhnREFYT2U4djhVZENXeHkwa0luUjJlRGNQ?=
 =?utf-8?B?SDFXRjhyL1c0b1N6QWQ5RmxmZzQ1Z2pnTkNmZGkyQk9Ud1B1MWpwMnVCQmhk?=
 =?utf-8?B?YXJMZ256K3BMZ0tUOUozVnVSN0thSWsvMFJNTjU0K1NyeHZXeDljMzJ4VWpB?=
 =?utf-8?B?ZW9yZUtzOGNMU3BkdDRheTBrcmpOQVlXN3Z4dzNQTGtsQTd5T0NmM1lIY1Av?=
 =?utf-8?B?TGZDUzRIRnBHaURQNDczWGdnV0trV2pMSmhPdHZxWWtubkllK1FnSHM3eHN1?=
 =?utf-8?B?ZkRJMkVxcW9xTjRzWS80SVhocUhBdkorZW83SERzcFN1Wm8xUVdVRDBoQy9V?=
 =?utf-8?B?aHNCaUhwMDlLcWFTV2JnQkhOS0xKYWR2emx3dz09?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:09:04.1681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c834b7c-a335-4dbc-1a33-08dd8d254978
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0681

The AM62x SoC supports three temperature ranges:
* A: -40 to 105C - Extended Industrial
* H:   0 to  95C - Commercial
* I: -40 to 125C - Automotive

Add device tree include files to adjust the alert and critical trip
points in k3-am62-thermal based on the temperature grade.

Passive trip points are always set 10C below critical.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../dts/ti/k3-am62-thermal-automotive.dtsi    | 20 +++++++++++++++++++
 .../dts/ti/k3-am62-thermal-commercial.dtsi    | 20 +++++++++++++++++++
 .../dts/ti/k3-am62-thermal-industrial.dtsi    | 20 +++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi b/arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
new file mode 100644
index 000000000000..7de461da16ac
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+&main0_alert {
+	temperature = <115000>;
+};
+
+&main0_crit {
+	temperature = <125000>;
+};
+
+&main1_alert {
+	temperature = <115000>;
+};
+
+&main1_crit {
+	temperature = <125000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi b/arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
new file mode 100644
index 000000000000..a6845a0c513c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+&main0_alert {
+	temperature = <85000>;
+};
+
+&main0_crit {
+	temperature = <95000>;
+};
+
+&main1_alert {
+	temperature = <85000>;
+};
+
+&main1_crit {
+	temperature = <95000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi b/arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi
new file mode 100644
index 000000000000..eece26eebdef
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+&main0_alert {
+	temperature = <95000>;
+};
+
+&main0_crit {
+	temperature = <105000>;
+};
+
+&main1_alert {
+	temperature = <95000>;
+};
+
+&main1_crit {
+	temperature = <105000>;
+};
-- 
2.25.1

