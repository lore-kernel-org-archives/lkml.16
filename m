Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A721C878E;
	Mon, 28 Apr 2025 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821861; cv=fail; b=C6JLYjuleEiz5vJ6h2K3bpUOoHlr3iudb+hOm3fqTWaVehW4AH1oW1A0defngoJb2k4+qoRt5/oonFNDuEgLihBXKaUO2TtAl1mqp4TVSXXXEjN+SpKMc0wL+3nmyKgee4ktLnSrVU65YCAR8Ij1p2K0tPC+PdYbdidtJEDD834=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821861; c=relaxed/simple;
	bh=U0r3uETX1km51zFmRoszMdSLaSs6tS9TBXnEVNOok+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pR60ekYwnQ5eJFwLgjHiu3bn7KQciRbYvWhE6Ajm8QmPkZTQz29k+ZNVVDO6wQtxN3jA1eRlM67ZQjyHonpecO/O4X72CS4ciIMGwLLJe/78fxxqNUpOvOK0vfN5DPHCGA350USe10vLR7O6M0RQnVYF+Nj3xVI3/5H4tPmkypU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dTK72NpG; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dTK72NpG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzhJyMYk9ghB+9e8BqYK2ZOuzNd95/6XBWavo2Tk+uDzqvnXFOTAQBJ+rbIb+fF7wBc4SR17Li/GS6yEBM8+9JOmpS6y0DON5AtD8bKD4tILAcui1dLHned66KHAcW4qeyBE0GO2TOuqIFPNkoWNFhXzzhpqMD6kqxf4munfEob5ERrPPJzciV86+tHeDa2belqgjgaPrUZp9RxPd4STDz+6o6cFJttOBD9RTqcHdQzEe0rMvKlA+vymFdJrnIUnsDIGlSWLIS/DGvof6pRfZftvCYL/WXL+XaE+ROYR+P3t1fbf1Pj0IxJPeRr3fqVi/c3V5PUrI70vUO3ZaR/TkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLyPdMhacxVIHD13lT49K3J74bdtcEX6Riy5Vz9C7SM=;
 b=vI0AONmSwNzUdqzkFbBt2Ee2hxIJBH70wEOwtS5R2Dh9juqO5CriKoFN6zgysuYAxtpYTB6oxbiz6ZcMW9MM3A++GycwvOs8i1MyZcZ4DtHFLQJPFSoGhf/vD9xgLlnuUYkY8F/ul+xzWv756Mm8Vj4w9UzIl89fuPa9sW6SW4k7Tty8kqIjI59TDgU2MMPwQnETv0r9ARwcP4OMK9YVsOjtnGmYn1DLbRWPCMtE9sdSfh+ox1+0a0BPxT12z2EQs+hJPYH/6EkgrTnUq9ffCBk087tNnMrTABmFvltMBTaX3Zaoq6Yyu/9Le0LNBWGvbYAQNGHyDUnDfcw4Hvnbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLyPdMhacxVIHD13lT49K3J74bdtcEX6Riy5Vz9C7SM=;
 b=dTK72NpGg7aGTRViSxLtxAZvnHY/fDSyhBe0vVXLoWXsNBHm44J4euNS8yKsjjxsUv/sxPy0EI9Zo6rRsP8J2t2CokzlfwdugSdqO/k7raULuy+YxJ8b/tg4ct1b/JrCcXo+4Ax00s3AzJyvhcn+kxtr7Oq74kdZsJ77vdR3CBI=
Received: from PH7PR17CA0001.namprd17.prod.outlook.com (2603:10b6:510:324::25)
 by MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:30:55 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::bb) by PH7PR17CA0001.outlook.office365.com
 (2603:10b6:510:324::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Mon,
 28 Apr 2025 06:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:30:55 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:30:51 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 01/10] hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc
Date: Mon, 28 Apr 2025 06:30:25 +0000
Message-ID: <20250428063034.2145566-2-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250428063034.2145566-1-akshay.gupta@amd.com>
References: <20250428063034.2145566-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|MN6PR12MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0ea839-9f00-4718-995f-08dd861e3af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7pIRn18+ITOj5yaRJGmQXyJIoD7q6CXHuKCLxIDcw9hDuV+4ZspoSnryGTi5?=
 =?us-ascii?Q?Hb9rd8v+QYYR3lcT4nnu0wb0w3W0uTISyrLk8Kofu2VS2vF2c4I+SLPbdnUM?=
 =?us-ascii?Q?iQTB7RQkZAd+SKsEq8Ep4FqPoRk9dy5UpEzkntRbpLhiBs1fuRu0Rrb1I0vU?=
 =?us-ascii?Q?LKkF5pg2KnKBKDdoeMik9ZdWcccYx9TvxVCc0sR2boTD3FFiotJ3BeALxDWI?=
 =?us-ascii?Q?NBYYocHCINeAt1BfCrz4DC5fHVkwZyOd7DD/w154UNSMvQ8iKQAJFzTuolrt?=
 =?us-ascii?Q?9qAkidhpcsfMGIrka9msVxoPrg2n4CUhqsl+JsZVkWrREjMmDlEwBPCmST4q?=
 =?us-ascii?Q?aAJD02XfrQtswtrCLT029jlgnnjMtfypmI3mHIfAlT9sapRslO3gQL4malJk?=
 =?us-ascii?Q?Thyq5nlswgCtCDNZiHifHRMKrR6qIm48CZ/M6a/L4nA5gBtyLjH5GJWOs8q1?=
 =?us-ascii?Q?r8iegnV6RaC0OQmSMArfF1bfjqHz6zTTbQj2+dHmxUa4GS7g1EW0644is4O2?=
 =?us-ascii?Q?PxByRLWiYAesnJK/bby2BOTp4OWCFsJFF3wsFZSu1TtlCBVB7WNtPsefCCEA?=
 =?us-ascii?Q?00KiBtcdct/kuNDJL7Q8LrENTd9O4cQxKO3FRUt5Z73w2gOPzNYF0azThOnt?=
 =?us-ascii?Q?yO9xGciZEvD25kOSWtkEE0+N2nCr7bBMSabyspxr1YbJOSaVAfyrq90JGbCl?=
 =?us-ascii?Q?WFKFZsXYNf/jiqyUWoAne3CycICwYrrdlDMaEuL5LO6r/+Wy9T6B+KfN09Jb?=
 =?us-ascii?Q?tUcDxLcrgW6UxUd5dpYLqOm0o5h2Su1xVt/V7cxJxw+l+V/WAgRXY0OZXNlT?=
 =?us-ascii?Q?5vnFLzDl5rhWBu7SR7TXGo2pPZtmCtrvpEWVdrMKsbH6jBnAdvefLucDf8Us?=
 =?us-ascii?Q?CrmRcuJ1wVSM7A912Gz9LEAPUVuBE514+WK25cWzTfV/y2Nxc1M1g87jAwkU?=
 =?us-ascii?Q?d5KEYoKjrdIHTvy3x9EjdAQNoKwTmtBG4pqtCpPkV9vXe5QyLrHzu7Y3PU3D?=
 =?us-ascii?Q?/1EoYVjN5r4PZCLpgBRS+tRkJhRqr9Kc4syjHwPLHT5UWfkrNA5l02VzekyE?=
 =?us-ascii?Q?gXPxHQTnkR3R7de2tAKrtvTURSuEO1WhD9FrsHXNzmK54fjnTJDSVeePDUvH?=
 =?us-ascii?Q?z7MQQFkhE0M1dVr9kdxhFNxhDxqDV2rcD+YpqC8yixnPbCAQZvTBK5JPq4G6?=
 =?us-ascii?Q?GfPQ8U8SZPwcevXLt7dFC0/sq7Kyv3Jtgw/h94NCOR2VPF82WwWHD7MFkY7O?=
 =?us-ascii?Q?R21MA9SwIBcoSHCQMT83cmPwx0rbM0yK5qQ/kpYltS+X1YWFg1td1zOvbFpa?=
 =?us-ascii?Q?YN+WNxNXVjiHYSkjAvPyEZOvSep7Hc0YyY42cxIp+AfbMop4I9zdphGzdTXH?=
 =?us-ascii?Q?WW5iGSCWJrfys1/LIkmcloCWm0AwDUNf0tABpv4gukp0s9BmGsD2xj2oYxrJ?=
 =?us-ascii?Q?y8pp0C2aGnrKtVwCqvAEuQE1V4fQQFzwSTnlJb4a8rb6aq7bNg2SVYTkh+QI?=
 =?us-ascii?Q?uMtmf/+nOT1RdQWJjPdNMPG6HSxo345FIDby?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:30:55.1890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0ea839-9f00-4718-995f-08dd861e3af0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8568

This is done to support other functionality provided by the SBRMI, which
does not fit in the hwmon subsystem.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since v4:
- Split in 3 new patches as per review comments
  1. Bring drivers/hwmon to drivers/misc/amd-sbi
  2. Move out the core functionality
  3. Move out the hwmon functionality.

Changes since v3:
Rebase the patch
Added Acked-by

Changes since v2:
Rebase the patch

Changes since v1:
- File name update
- Add hwmon sensor registration in this patch
- Update Copyright year

 drivers/hwmon/Kconfig                   | 10 ----------
 drivers/misc/Kconfig                    |  1 +
 drivers/misc/Makefile                   |  1 +
 drivers/misc/amd-sbi/Kconfig            |  9 +++++++++
 drivers/misc/amd-sbi/Makefile           |  2 ++
 drivers/{hwmon => misc/amd-sbi}/sbrmi.c |  0
 6 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/Kconfig
 create mode 100644 drivers/misc/amd-sbi/Makefile
 rename drivers/{hwmon => misc/amd-sbi}/sbrmi.c (100%)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f91f713b0105..6ddc5f2b5338 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1887,16 +1887,6 @@ config SENSORS_SBTSI
 	  This driver can also be built as a module. If so, the module will
 	  be called sbtsi_temp.
 
-config SENSORS_SBRMI
-	tristate "Emulated SB-RMI sensor"
-	depends on I2C
-	help
-	  If you say yes here you get support for emulated RMI
-	  sensors on AMD SoCs with APML interface connected to a BMC device.
-
-	  This driver can also be built as a module. If so, the module will
-	  be called sbrmi.
-
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 6b37d61150ee..9973cfd2ef5b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -648,4 +648,5 @@ source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
 source "drivers/misc/keba/Kconfig"
+source "drivers/misc/amd-sbi/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d6c917229c45..3dc18bc69a53 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -74,3 +74,4 @@ lan966x-pci-objs		:= lan966x_pci.o
 lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
+obj-y				+= amd-sbi/
diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
new file mode 100644
index 000000000000..be2d9e495eb7
--- /dev/null
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config AMD_SBRMI_I2C
+        tristate "AMD side band RMI support"
+        depends on I2C
+        help
+          Side band RMI over I2C support for AMD out of band management.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbrmi-i2c.
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
new file mode 100644
index 000000000000..304394bf5e59
--- /dev/null
+++ b/drivers/misc/amd-sbi/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi.o
diff --git a/drivers/hwmon/sbrmi.c b/drivers/misc/amd-sbi/sbrmi.c
similarity index 100%
rename from drivers/hwmon/sbrmi.c
rename to drivers/misc/amd-sbi/sbrmi.c
-- 
2.25.1

