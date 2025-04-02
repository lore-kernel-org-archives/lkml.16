Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E54231A24;
	Wed,  2 Apr 2025 05:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573551; cv=fail; b=enewwGqJW0aqe0nZ7Q/tSaehV+2jXmVUugJz525mJUkvzc+CM8Lt2PjR6oqdeJ7Z0h3hPkj0TaF2qJmmyM0heRCDWm76x7I/jjwdxuXPbJse3D6TVLP0g8A248Mqr84gkodOebsSmkHMhQqXcbqsq/Tuk1hciZXMn8knxGPq9D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573551; c=relaxed/simple;
	bh=vPTfx+FM1l8+Au5eo7qX2DBHGI8x0WHFBg/vRacIw8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vih97FadsMYc9HnZ/nxtqX+mYPPEf+yGLHh6YX7+t7VvHYipyghEsrak5fI1osB3ho99ODNYN5cIdpU+UOeRndXkucPGBeCbXfRO03xTe3WMw6mXH2A/BK6cSNaRUjtnKYAd93xHyFUN+DdbL+hrpcgyGaLOAO62BP66mWwR9r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nlRdofVz; arc=fail smtp.client-ip=40.107.237.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nlRdofVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxfgF5w8fIDY11zYsnR2Odqd8e24pRRwXHh0X7kpZRTLwfBDcZ5oE8PSI3lqNjE+NhAUXnz8vJ/m+MCUPYrQ4KFIkWsevtsHvDwA/B5umO5fB5BNOefM1Wq7r4Z1hxhek811ybuJViBbt6s09D6Sq2Q+Exr43OlG6UQb/gDvd2CF8ddQrW+2xc9qmnJefSQzqLs/5TWH9nRnbexY9b6Lk0qio930xEwQzxM9ZjZb88rsownQ1f4uQOLAvxEMn751Nnmvpx0PrsNM1Pp/DGWLihs/cicNhky14zNc7LH2mlOyOZyRNy5EZW04wYvlXPU4x+FYT739CirdTLyu3xti/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qI9zpaTQbT01smitrb46tk8lneQ2pGSya2J3Dkwlbg=;
 b=gbzo/sbczXHVV2DlVeqIznr35b9qLNNddGbTtYW7B2R3pJmofuofWUQalYHoWl7CRKvrEepKzO28R00VyjQbjbVpefl6w7ZmL4oJ05eB47ObiUAed7ngqfc9I3zBvcPWIGrnLUkdrw5xyM5HmqQVRfUwgKTCXxNH505OE0KIVeNPYm1iIKM+GoI/dv9GadLwAWfgy/tfgeFaGsvKd6NDyQrw6w6TDDy2/rf4A/oUKB11t5ya0lqwlKGh4/iymngugejJGs66INP4w0MRuHCGxXrdBRpN5pD1CRxUrpihSTvZcIo96Hj52D78qhYPI2kAatIJArgsGkg0w106+HCUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qI9zpaTQbT01smitrb46tk8lneQ2pGSya2J3Dkwlbg=;
 b=nlRdofVzigfHCdcqs1YxRIlttJxdcf7hI4bGwSO8bKCiVb3cJgfdoeSyZDvHIDdmu3glEFd+UVgqQqx2FMb1uUzoFRIQo7Z86J79HZZhJHPdjI0ZRXOBTlpUkUI9BxwIFHQj9d50vm76fkfMXI9eOttYVq0J5djbmJU51YhNJp0=
Received: from MW4PR03CA0335.namprd03.prod.outlook.com (2603:10b6:303:dc::10)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:59:05 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::63) by MW4PR03CA0335.outlook.office365.com
 (2603:10b6:303:dc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 05:59:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:05 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:58:59 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 01/10] hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc
Date: Wed, 2 Apr 2025 05:58:31 +0000
Message-ID: <20250402055840.1346384-2-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402055840.1346384-1-akshay.gupta@amd.com>
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3b13ee-c4bf-4c60-9496-08dd71ab79bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B7Xly2oyUencXjPR4LixoYF8g4wQrdZzrVmfkgYuROelAj6I8pGlw58MbCTQ?=
 =?us-ascii?Q?M6Lz/rro2Xd+kpLv+67BnfidlD4d2QT12+1/uQrIAGEv7iKkNYEZfrS/rHYU?=
 =?us-ascii?Q?l67FIKchS9shvdgQNJ2xiWiWd5Apr7LXd8a43uE/cSLE+KMJb99BAR8SHg3Z?=
 =?us-ascii?Q?TYx/AaPW0wQsCX2a87Z+IiWzc6DH0h8SNn8IX/Wjok7Vdy9lnPywohnoo2NX?=
 =?us-ascii?Q?37OS55AFwpDGgTKt+/bOHu4y4+Z/L9CA2QJNr1F6rVKDWXcQrzk1z3UMZPXU?=
 =?us-ascii?Q?RUI5tRox3eCxZMQoEhtLgLVlpdu+oKFthROVyJkFgV4bQER8eCHm9YVJ7+/z?=
 =?us-ascii?Q?OId0waLdCqfNnfZscUgbXMZNdP+/kNCjGeEa0SuYV4pTI77qw8sgpFssS5lz?=
 =?us-ascii?Q?2jIQ0eLZniI3TTh+N+1S8d/6Su8nCJ25BtMNC2JNtsHqbpRc1Fqu2TXeC5oO?=
 =?us-ascii?Q?hydMQ9IqlmsQOmoeofWiqwWj4Wlg4EbeiA9vh1nGgXXomuCLFfmLCO+sx2Hg?=
 =?us-ascii?Q?xmHyVpQyhff1Wj9r104MEKNvusuET8NybPQzm25YKGzjv1C6gyV5Ji7IiSHs?=
 =?us-ascii?Q?fcROxHHQ1U7oECFFJ2F1rmR04N4pUfUNIL7J6LIlMuHMT20Ih+UQlAmdxPmJ?=
 =?us-ascii?Q?iiFcekWJxkFP8kQEIhToBPwVuC59CVU4nFgvUMziJBZson+Be0NcmUUbxnjC?=
 =?us-ascii?Q?8omqGOTygvZeiGa4LPFz0vJ/J6lt44G0LC326Vrk8c+GmItHIAcYtQAl/Qj/?=
 =?us-ascii?Q?VjWj5N7Qi++vpLPDXE6wZkBtLpxWRf4Ym907fZ2d/liwVAtH5kWjGU59eP/5?=
 =?us-ascii?Q?+8MgbnGKiOWQXS9s9CHFQYDD8J+H4ypMDt9D52QTtS4OdSLtIbt7mWqfgsQE?=
 =?us-ascii?Q?XXYGnqgxIymtGI/2yuZsEe/mT2s57VSC3V466dtiT4lw6o2I4g8OwYT3fdMM?=
 =?us-ascii?Q?dih/tUG4hN/85lQ1vRkHnXR1hAlbykOAr47Q2VzHIx8K9xniQNOev9tx9QBC?=
 =?us-ascii?Q?U+tiwKGjx/OktLm2KhCGW+eqXst+tBbXYXblv10kyJd3K5QQN/nWnAfrEX2X?=
 =?us-ascii?Q?hgW7qEKIb8hlvx36rVgssMSP0E6Kz+TyN0tBoR6aRd2HrNgMCKlb0nhQDsKh?=
 =?us-ascii?Q?lmpIJU73WQt2jJUlMwqIh5KaXsDguHyCjdRnf4chBU3ilbyZpg9U3Eo/4cCa?=
 =?us-ascii?Q?GuqGTKzH3XckrgSRRfN4lZzsQ15Rcd72p8U3LRANr3W542Wl61TLrlxBDCov?=
 =?us-ascii?Q?r3kOlWooC6BG1DzQatjfDcj8UgPTJdpj+bCAxhnaHr6+UK1UJFWmApgpDm94?=
 =?us-ascii?Q?3salBXAHY6fpf7WVfubNG9VxUr2iZZFIzUmNmAj6GA4/+UChx2c4zFE0Vu5g?=
 =?us-ascii?Q?r1GwKUVzMJuUM1DdGIpcU/jSE1qmMrE8+48QInQDVzUZ/l8a25ujmqYo2bD3?=
 =?us-ascii?Q?dmvC8EchOmZi4xVvOs634p7y1ZKGHXHbhj7GoVpNbWq4QH1/ohg6ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:05.0729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3b13ee-c4bf-4c60-9496-08dd71ab79bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892

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
index 56bc72c7ce4a..b2792b9664ba 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -649,4 +649,5 @@ source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
 source "drivers/misc/keba/Kconfig"
+source "drivers/misc/amd-sbi/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 545aad06d088..fde23b0b4f0e 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -75,3 +75,4 @@ lan966x-pci-objs		:= lan966x_pci.o
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

