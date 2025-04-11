Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB41D7E4C;
	Fri, 11 Apr 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378314; cv=fail; b=W5Bx356+HPqalz3QKGtc021ogxzAinKHUwNRnIEf9bQNvRJJ5XABI97lgPq5dvRK8hqCw5KneQnzup6wa6KLVPJtkLh4m3s9kcTtq0PcixBH32Q9rIcsz749NMwrjmv1vJ3+E1D9Yamsi8m1UstjWzCW5L07E1IZsaYjBdTCQok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378314; c=relaxed/simple;
	bh=U0r3uETX1km51zFmRoszMdSLaSs6tS9TBXnEVNOok+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqsIkbD8Dou/yo6sbGRxQX/L5clVVJPWJ+iGOXgy8Whjcjlee6iigvVVjCk4j+TD5o81r3cXpK/RqCVYnxs31OFZClOdXWkWId7jytyJqIQXD7ti/1ZcBr+CE0/rF/9PeTVLS/smVA2kqQxiUBOR3qbNvC4C9oauM3Vpsfm5or8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pnvmIF53; arc=fail smtp.client-ip=40.107.96.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pnvmIF53"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT89H4+c4GUNkfmN6VUTMJvf1DSXLlbAXlFrQ9xm/L0Wrp23dlQW+jQe2nIVKTvjSs+z1UTv+lBVFETIxFokGLhQ+7eyOUK6vZLNXGVbraXTPT+aAB58X3/2ZrOVOlcO62/1UxBE1WpjqsjiGLl5EhUL6K7IKLEBWxMbhyVYrgf7ZQ4VomJ7SGZ7r8gjsqsCVBaykNiIi4kGbO65wZ5nTn1ggzRPvNqmgL/WIcyrZw/jfznwxggkOfVqyKs+EVteX+McEPJarasjlaByBRaqUgO57l8egLhbiAxyOepxq1nvzoiLVpUsqbYqddtpH6rhHQ+U3UHIPz91UgG7AqU22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLyPdMhacxVIHD13lT49K3J74bdtcEX6Riy5Vz9C7SM=;
 b=rhJOmK9JVAEPhgkozTS8C5rXkg6yvFeXfDSQckIKJqgf/yOFfqYacRCEh8AJJeW1QvusJFX6KkjYWZYYcsNgbOWwrBcnuFchBqoSJPNg9rtcWZ0Sk5/dr7qmpS1IGA+WDSiQRbaNY/0o6vOHcutwzsEi102iIFrl33su5deEvgWFJs8IOrt4LWQjsQ9fo6bOzlMGh0gl/A7XdKVnyKOXNsHdkYnV1hvq3OaJduM8IUeXv0Au0YUtHlSutiCoWGHXvwAS3ECbULmyw/gBBJDwo831ektHdCblN1SHjWvPOqFr4GoOK8+H3TTzBfSaBacp7kldrUs7kM4zTamk3bACgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLyPdMhacxVIHD13lT49K3J74bdtcEX6Riy5Vz9C7SM=;
 b=pnvmIF53gJK86f/t3jf1WvMdLsh9Bg6PfeYW/LjMrXaP2wCwDGo84cquULSlSpe+Qhhccv3qZYDUHxUaF36M5W7b3qJV4c7FHoBN5M9RNYJ2ioT+buTxWmcUi+l7b/vaVu7wcFD+Wmsk1PPHce8wj+6AVXx0W4H+rWPfEPVOFkw=
Received: from BYAPR02CA0004.namprd02.prod.outlook.com (2603:10b6:a02:ee::17)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 13:31:44 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a02:ee:cafe::74) by BYAPR02CA0004.outlook.office365.com
 (2603:10b6:a02:ee::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 13:31:44 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:31:40 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 01/10] hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc
Date: Fri, 11 Apr 2025 13:31:13 +0000
Message-ID: <20250411133122.1806991-2-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411133122.1806991-1-akshay.gupta@amd.com>
References: <20250411133122.1806991-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f1e336-b78a-427b-ff4e-08dd78fd33b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nrcf/J+tkWy/CdBWyY6HrpoEMBXXhlFa4d88ZXWbzgkehSQHG3sU1+snMa0I?=
 =?us-ascii?Q?jOKEMQPqwyilu/o2agHeJ22K54Sg2o1Qc3bOxvlzN0onOw9hyS1tiQ9JIa0Q?=
 =?us-ascii?Q?ug3wjpVK6GiC840ryQGwAGMxclEEs30oEUTEgrABnug9kCs5y3h5XCuezF0W?=
 =?us-ascii?Q?h6NDiWQUbxJ4pxMs2WbMxLB+W5DKJo6pRylT+8Seo1K7edkZg+UP4ASS0uyT?=
 =?us-ascii?Q?YwTTYSnDO9e98k4ZEoWH2YiKt0SHH/INZnPbmmfC7sTGxG642S5APt1E0rlR?=
 =?us-ascii?Q?a4elhsE0JssapEEkzhscNIFLuoZppZNkGw1d5mcpKn4cyAsxo/fqILL8Alo4?=
 =?us-ascii?Q?+sGQn9rUkrgP3kzWsXl22yD3E4Euz3ZOh2mGOo6fphy2vv0nr5ppK3u+SR8J?=
 =?us-ascii?Q?/qQqP/cg+y0YxdjEjPS/Ijs9CdYsi22kJt5FJgwUSWv/W8C1gM0tOZ66RU5e?=
 =?us-ascii?Q?YNsPfzrmBh0bB4YNyXJ9kdwNsUnxW8nxPJYoKvPwehr+ujiK905OyPpkGCFd?=
 =?us-ascii?Q?Ljzh+Bn/l5LetdHVAky86SqgbJVd35uAwq0nP6P44zCHgvOnHiy/0gfwg44Q?=
 =?us-ascii?Q?ZVnAS/HNnuvTSljr2fSOuYHqQPxVAJP5cowM+n91YAnr6/86SvYwxoo3IT57?=
 =?us-ascii?Q?2TqKndd89lFRQZuR+w9/xxhbwOZlFRZI3mGkT8iTntx5d4ofFpY55fgWbHQM?=
 =?us-ascii?Q?FhooMWKsP/t0EP09Lwkg7e3U6wz3rjOZl9bMdPaIhKITCNcUkWuD64ovKtqy?=
 =?us-ascii?Q?dZyRwKVVGby0LRHxzsEa1ILtFLjfkWtYXHDAbwQDH5n+j35fKlAxa5d7piLB?=
 =?us-ascii?Q?7eU34UgXWOciv6JW7+Y6xDFvCkcE2UETkI0BoEbd1td17a28miTYoBSzbckB?=
 =?us-ascii?Q?kLW38SnuMURMRk2viETWVtcOHpGc33fP3/asLHL8K4naEKbpaYJtoHDmzI3Y?=
 =?us-ascii?Q?gB6ijKkFJeWUCEI+KVerXDHYBczoDwr7xZQ36/t1/yZYQ6NM/mTkAEDDYTUn?=
 =?us-ascii?Q?LUA1lwc5mnvBWc9vc4dsmRQqMF+F4quJipx4r+neWLCdyJ4w+Vz9KhYdb1vW?=
 =?us-ascii?Q?GY+55+kzqY+Jq99yzROstS8K2IpqDUgxA4Vp3I+ozx36QdfjcDH86+FUmXUl?=
 =?us-ascii?Q?LP6WbKQqhcmdtIigml4UKZvBmmd7NTyjqw8BGzw1XfJiMBsZiz2DUEhssTRN?=
 =?us-ascii?Q?a6oAMkR+fWG5p1EtduB1opjC94Ozp2hpd5hf7azanUIdAsemC+IAkfRA4JRk?=
 =?us-ascii?Q?NG7e3XaPzyUsBWi6nOOlmD9RzQeJ4FoZCigSj8ODY2U+SMID6DcETI8N7Yti?=
 =?us-ascii?Q?Aed+qzNmjbZJ9fSsjcoEqn7xzJ8TpNTU5MSp+ArDdGdBxww1fzk9m+Xw4eXE?=
 =?us-ascii?Q?oxhdLncN5GDZ/qVkcwY7+9Jb60kP/O6qRQJvTfYMHcIKZ2fsd7e10XizzXBd?=
 =?us-ascii?Q?yevQfpmM51iUkpxYIzTDWRYPjavrFb5tM6WzKrHMklBVTuBEMxchZq9Pnd4R?=
 =?us-ascii?Q?7x75vgM3Wac7X7rPmjkiFNtUnDHoLtCkELU1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:31:44.4343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f1e336-b78a-427b-ff4e-08dd78fd33b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166

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

