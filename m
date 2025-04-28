Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4391D07BA;
	Mon, 28 Apr 2025 06:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821878; cv=fail; b=YuktO+HypYOWcSuPBjv793RN4S/TqRujS+0GASHG6yxroZigWtWb3BvmWUZ+3kKoOqg3/Jt83G6Bb8/DvLVUmRaYFN24sVvWnTqSYQ+L41LdhpNwH4KJBp2IqzocMLwvIdvzcKFEGrekZfcUfEaDqtqVzlAYMqC3WySrfKuNSfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821878; c=relaxed/simple;
	bh=e/DWYp8yCWjO9OvYcRVnT0RsunCILDOAorbjnyzXtz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MR5fGAqH3QiaFFu+tNPXGUczqh6TCdBJacCOPa8j+DSyivGzGKztgETrwpF9IBI2lcv2WvQl6f9OK9H6mh1IfSbF6h2M0hj8UqlXFwQc2Dp9YoY65akUaB69NIyGasQYhb1C52l0mgjLChCX20kN25iDjhgfW/vxv4FGQZQLAPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tZ4LuJxQ; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tZ4LuJxQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYN1Om1Zog87lPXGXhMkvb/MPvDgUct5yB+Cq9mFe01QIQcE+LZCXJ5oWTxvWprTV/jnylx3euTgOqZYIc5Ep011RV2sV+kKPQAMXPtbO1Ri56xwdOKV2ISuzt7W5yupvTuz3wc4ApLl8dMLwHzULPLvWrGuBfCs+Ph+NFcfka7mREVY8opcs63YCCYadRjlEuVBZIv20kYKXeDIhwGDzbWYXs3a1ynEnf66SrSZ5Mfxyb3GrkB468yFIVNV3N4Z2O3izK67Fp7oI93djfFOpMDWrfCFRg07ptjLhMv0DISTClzNnJcf1QnnRl3VbRa6K8fel4KbD790KWKCbnT3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2ow+x214OSNQ448/bD6Pd9nvg/HePgjYmC5XUwpWQ=;
 b=lX6C+8dj1eTfRCGdVlMGSxbjDtt1fXaCF6mj2z1PGGtGhv3k3McLjUYfG66135OGvFuCRAzo634QMGuIuQ2gVlDf4Wup6wxqMWzSFKKO3bWofbNJ0CnDRCj4aaJBNHCuDt09j90Mo4Trcp8MTowoOheBgnLm0zArZTpJxkQ/K4h75SMH0FNZY+yIOIaq08t4w8Zy3SYERYFxq+CK+lKc64WzYvD9+2hjEKSVg75oCah9tzl9HzySaZJA5MZkXZlxxjNcYXQFooLmrLpL5Bqy/aVr3iokK9cUREf4dieMiRszNX2mQlTTh1xy+jqVnrFAOTdWwx1DMESmiYo+X4TmzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2ow+x214OSNQ448/bD6Pd9nvg/HePgjYmC5XUwpWQ=;
 b=tZ4LuJxQb0rHU93wK799NMMCKaeQXBI1zXCWgNIyrA6U/PrLax4rTb+nQlUu7eF6Nj3cLaybV7qzw9P15aDQszVXjUxPGKhp5M40ba2bIqNGGcn9fN0rzOm95nZy5jORj/6Ym8nU6WXIav25CuQtBFp822AA21S5jNk8Lz1wF24=
Received: from MW4PR03CA0038.namprd03.prod.outlook.com (2603:10b6:303:8e::13)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 06:31:09 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::8e) by MW4PR03CA0038.outlook.office365.com
 (2603:10b6:303:8e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:08 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:30:59 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 03/10] misc: amd-sbi: Move hwmon device sensor as separate entity
Date: Mon, 28 Apr 2025 06:30:27 +0000
Message-ID: <20250428063034.2145566-4-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 30640314-2451-46ff-9ed2-08dd861e42c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gAwfRbT4T9BKzyBR9aZ0P+J5CUp9jv/GXSi2MZr+KL/+u+vVf5hzk5L98s4q?=
 =?us-ascii?Q?jM3I+cx3rf7iBK4Ys6AUnDrElaw0/8Ghs5r+Gi5VRpRgYaf0JPyOyWSplVWJ?=
 =?us-ascii?Q?c7oHn4a6gb8CKczWK+kYpP/2SQYR5Dpgh4h9JFHdpEjNIVREUQ4IeCU7gHIP?=
 =?us-ascii?Q?KAYbY5exZaZoRaoqKRdnUAiTg21kodJnEV25bB2BfKeoTPWAATfRKk25+2/F?=
 =?us-ascii?Q?uyq75Ag0b3GCXEGmKZ5BEl9ZGl2ulVMak6lrO/Of73iUA7sMbz7l8qO4oKK6?=
 =?us-ascii?Q?uVajaP2PW7eiIOGWmuJu0OUVBbGu+qLHkszPP0o/gVKgpoEYwp/+s++7selF?=
 =?us-ascii?Q?XT93whZiYxIHX9oMSk/en1JF6DmeoWBU7mAppKKYcsK/5JXyx58/W7dlf0Gr?=
 =?us-ascii?Q?QM0qIr4VS68jDeZh3kIFP95JQ20B6KfbvRHlAcFOMYRoBpavV0egna4kCyns?=
 =?us-ascii?Q?EReLvCgv141V7FkgvhURSo1kLVGNoQ6mCbmY4C76WAiC0G64zD5KVnwx3TQt?=
 =?us-ascii?Q?3TbXQdWhKRtWDcL0/vkedDQTzfFfuEu/raWBpsndOhtiPlZTHhAhB1DtxQpa?=
 =?us-ascii?Q?NKuBpJ/y9YPE15u6doHsOrvmCi7zQkBbn1MmbETuLh8ZNymoz4Wb7lpg/h0b?=
 =?us-ascii?Q?kXwZEPVIryKKl9ckEr61hVAZ3cWZI2cQwozMDlvo5Mpbt5v0R2ec1ghRLwt+?=
 =?us-ascii?Q?xFYecDKuKksM06BEZAjGYGxKqNEZMOIHTxkIE14EL8tZrcvd+6jE/YI255NZ?=
 =?us-ascii?Q?xD23qV7kcmxGRrAtflXPh/GVuwOFLLMen+ko+F8HNjrht17PQXE8gSsJBLL0?=
 =?us-ascii?Q?OkDdyAe2c19WxtrcYIb1FqyQg1aFutTzT69xGuAYU4pLrB9Y6zVwnCLgg3oZ?=
 =?us-ascii?Q?67HujR5WSLGqLnExmNYA4peXkBRyiGGELtLSHLI9s/jRCMHPyhahNatVJXrT?=
 =?us-ascii?Q?+zAHTnWkmD8b4+yHXaA2R8tQsl2lHMcFgiK5vKzogb/Y61QMMUw37eyoppsH?=
 =?us-ascii?Q?MKkAUyguKH0A+yqerP0AUQjMxxl1WwxGYVv05UmGwhlO6n8k4gAwgdq+Tfdp?=
 =?us-ascii?Q?NP3ZUrcAzOlpS7jaV4JE0254ogvHpCJCBv+S2/RLOeyfhH+sPWIXrhqkfVMf?=
 =?us-ascii?Q?N67QjuMJCKhjb3FOfFzjoZBResZNlz+3Y/kmxSED7urqNeD0/X1mlUsupA1W?=
 =?us-ascii?Q?bbRI5BAPk0M/pvlVmWHitzPelQyhG4MQjQBPiFs8C8D74zjKCiPM89y+7DCi?=
 =?us-ascii?Q?c274G6BcT8dIXj9uYufG5Z+dDVPey5x4EbGeBM2puxFL315Uec8AFPl+F6Ud?=
 =?us-ascii?Q?23ovgOJDpZoiN1tLu/X1ogpw3p+3vNKTvgsfCcNxcUIrdxd/7ehUBcZKi8XO?=
 =?us-ascii?Q?24OmdlrgkKs9mgPgVIjs5M+GhDOWwORE9FKisWRLNj0EX4o21t/cwdMtVZj/?=
 =?us-ascii?Q?Uros5Fgxtgy5QJH19TNuxFgXPOzlK1WSjZav72cqdG6M4yMlSiBDlU/6+0TE?=
 =?us-ascii?Q?z3FQ6yw+Qc18q32nk07ewqhXqyxTjtuKpTSV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:08.2993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30640314-2451-46ff-9ed2-08dd861e42c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175

- Move hwmon device sensor to misc as only power is reported through
  hwmon sensor.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v7:
- Address Arnd review comment, adding new Kconfig symbol for hwmon enablement

Changes since v6:
- Fix "Missing a blank line after declarations" warning

Changes since v5:
- Patch rebased

Changes since v4:
New patch: Patch split from v4 patch 1/9
- Update Copyright year to 2025

 drivers/misc/amd-sbi/Kconfig     |  10 ++-
 drivers/misc/amd-sbi/Makefile    |   3 +-
 drivers/misc/amd-sbi/rmi-core.h  |   8 ++
 drivers/misc/amd-sbi/rmi-hwmon.c | 121 +++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/rmi-i2c.c   | 104 +-------------------------
 5 files changed, 142 insertions(+), 104 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/rmi-hwmon.c

diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index 0c8981f97f25..4840831c84ca 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -2,9 +2,17 @@
 config AMD_SBRMI_I2C
 	tristate "AMD side band RMI support"
 	depends on I2C
-	depends on HWMON
 	help
 	  Side band RMI over I2C support for AMD out of band management.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called sbrmi-i2c.
+
+config AMD_SBRMI_HWMON
+	bool "SBRMI hardware monitoring"
+	depends on AMD_SBRMI_I2C && HWMON
+	depends on !(AMD_SBRMI_I2C=y && HWMON=m)
+	help
+	  This provides support for RMI device hardware monitoring. If enabled,
+	  a hardware monitoring device will be created for each socket in
+	  the system.
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index 7cd8e0a1aa5d..38eaaa651fd9 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-sbrmi-i2c-objs  		:= rmi-i2c.o rmi-core.o
+sbrmi-i2c-objs  		+= rmi-i2c.o rmi-core.o
+sbrmi-i2c-$(CONFIG_AMD_SBRMI_HWMON)	+= rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 8e30a43ec714..977ee05af6a6 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -60,4 +60,12 @@ struct sbrmi_mailbox_msg {
 };
 
 int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+#ifdef CONFIG_AMD_SBRMI_HWMON
+int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data);
+#else
+static inline int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data)
+{
+	return 0;
+}
+#endif
 #endif /*_SBRMI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/rmi-hwmon.c b/drivers/misc/amd-sbi/rmi-hwmon.c
new file mode 100644
index 000000000000..720e800db1f0
--- /dev/null
+++ b/drivers/misc/amd-sbi/rmi-hwmon.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * rmi-hwmon.c - hwmon sensor support for side band RMI
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include "rmi-core.h"
+
+/* Do not allow setting negative power limit */
+#define SBRMI_PWR_MIN  0
+
+static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+	struct sbrmi_mailbox_msg msg = { 0 };
+	int ret;
+
+	if (!data)
+		return -ENODEV;
+
+	if (type != hwmon_power)
+		return -EINVAL;
+
+	msg.read = true;
+	switch (attr) {
+	case hwmon_power_input:
+		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	case hwmon_power_cap:
+		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	case hwmon_power_cap_max:
+		msg.data_out = data->pwr_limit_max;
+		ret = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (ret < 0)
+		return ret;
+	/* hwmon power attributes are in microWatt */
+	*val = (long)msg.data_out * 1000;
+	return ret;
+}
+
+static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+	struct sbrmi_mailbox_msg msg = { 0 };
+
+	if (!data)
+		return -ENODEV;
+
+	if (type != hwmon_power && attr != hwmon_power_cap)
+		return -EINVAL;
+	/*
+	 * hwmon power attributes are in microWatt
+	 * mailbox read/write is in mWatt
+	 */
+	val /= 1000;
+
+	val = clamp_val(val, SBRMI_PWR_MIN, data->pwr_limit_max);
+
+	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
+	msg.data_in = val;
+	msg.read = false;
+
+	return rmi_mailbox_xfer(data, &msg);
+}
+
+static umode_t sbrmi_is_visible(const void *data,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+		case hwmon_power_cap_max:
+			return 0444;
+		case hwmon_power_cap:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info * const sbrmi_info[] = {
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
+	NULL
+};
+
+static const struct hwmon_ops sbrmi_hwmon_ops = {
+	.is_visible = sbrmi_is_visible,
+	.read = sbrmi_read,
+	.write = sbrmi_write,
+};
+
+static const struct hwmon_chip_info sbrmi_chip_info = {
+	.ops = &sbrmi_hwmon_ops,
+	.info = sbrmi_info,
+};
+
+int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data)
+{
+	struct device *hwmon_dev;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
+							 &sbrmi_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 6412f00eb381..9ad4c8093399 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -8,7 +8,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -16,9 +15,6 @@
 #include <linux/of.h>
 #include "rmi-core.h"
 
-/* Do not allow setting negative power limit */
-#define SBRMI_PWR_MIN	0
-
 static int sbrmi_enable_alert(struct i2c_client *client)
 {
 	int ctrl;
@@ -40,100 +36,6 @@ static int sbrmi_enable_alert(struct i2c_client *client)
 	return 0;
 }
 
-static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
-		      u32 attr, int channel, long *val)
-{
-	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
-	int ret;
-
-	if (type != hwmon_power)
-		return -EINVAL;
-
-	msg.read = true;
-	switch (attr) {
-	case hwmon_power_input:
-		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
-		ret = rmi_mailbox_xfer(data, &msg);
-		break;
-	case hwmon_power_cap:
-		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
-		ret = rmi_mailbox_xfer(data, &msg);
-		break;
-	case hwmon_power_cap_max:
-		msg.data_out = data->pwr_limit_max;
-		ret = 0;
-		break;
-	default:
-		return -EINVAL;
-	}
-	if (ret < 0)
-		return ret;
-	/* hwmon power attributes are in microWatt */
-	*val = (long)msg.data_out * 1000;
-	return ret;
-}
-
-static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
-		       u32 attr, int channel, long val)
-{
-	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
-
-	if (type != hwmon_power && attr != hwmon_power_cap)
-		return -EINVAL;
-	/*
-	 * hwmon power attributes are in microWatt
-	 * mailbox read/write is in mWatt
-	 */
-	val /= 1000;
-
-	val = clamp_val(val, SBRMI_PWR_MIN, data->pwr_limit_max);
-
-	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
-	msg.data_in = val;
-	msg.read = false;
-
-	return rmi_mailbox_xfer(data, &msg);
-}
-
-static umode_t sbrmi_is_visible(const void *data,
-				enum hwmon_sensor_types type,
-				u32 attr, int channel)
-{
-	switch (type) {
-	case hwmon_power:
-		switch (attr) {
-		case hwmon_power_input:
-		case hwmon_power_cap_max:
-			return 0444;
-		case hwmon_power_cap:
-			return 0644;
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
-static const struct hwmon_channel_info * const sbrmi_info[] = {
-	HWMON_CHANNEL_INFO(power,
-			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
-	NULL
-};
-
-static const struct hwmon_ops sbrmi_hwmon_ops = {
-	.is_visible = sbrmi_is_visible,
-	.read = sbrmi_read,
-	.write = sbrmi_write,
-};
-
-static const struct hwmon_chip_info sbrmi_chip_info = {
-	.ops = &sbrmi_hwmon_ops,
-	.info = sbrmi_info,
-};
-
 static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 {
 	struct sbrmi_mailbox_msg msg = { 0 };
@@ -152,7 +54,6 @@ static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 static int sbrmi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device *hwmon_dev;
 	struct sbrmi_data *data;
 	int ret;
 
@@ -173,9 +74,8 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
-							 &sbrmi_chip_info, NULL);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	dev_set_drvdata(dev, data);
+	return create_hwmon_sensor_device(dev, data);
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
-- 
2.25.1

