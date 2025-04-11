Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F171DE896;
	Fri, 11 Apr 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378322; cv=fail; b=UevhlhhtKilhu1KcmLwNVcTuIiyntxT/VV022T+Xt09CtQKWI171NdGYun5toF1/93KoDWVDSfzLtgsVRhjRuhlLB/wVYA18xKrWtTtZCTX00/BPU7Ex208Cg2ICVuZJdHr/s6o0DIR0PiVfefts9AV+9hfwF+NasmJuZXL66IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378322; c=relaxed/simple;
	bh=e/DWYp8yCWjO9OvYcRVnT0RsunCILDOAorbjnyzXtz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USHJsQ1BxGjgyl2e9anEBhFaeCYyl8Le/aPrqB3jySvGcp1t7tJWQq5vaX73AbEwi0dBbvi6hVba0pNkqqhh2e4merS9/dnMccqnNC8Rar+t25/33K2hdSptcW4GQpW+8FdPd66+t01+f6whue9xU8EwP9na6G2JdT+x5pOTQ2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jrXYZkSi; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jrXYZkSi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrPw0x7LkmgysGtPehkiRc9HyZvX9MbXOdBxy8w4crvJ9F8sn+IR+S1CXAzqosInBqM3cvJ+XRPTCxcG43tq4cvFX3eOeL2dOe6gPdqK3/6IFVvIDid9yzUWJrOfgZGVgwi8Iquy+punnm6YUzZo2cSKO2NpM2IwRFBOiJ4/4zShY7c9f/RDEjRXSf5L6+ibdXt2naL3d2AeC6dJkMXHzLXh5jzTw1QaojGYLcUDow8YHxxKmwPTPlW4XQEW2LCGTHHRNO4/5VZFf3VGWDuzOIy5tpb2HnJeb2z14i7hPFVFxe8FRssMiGNi9J1wvo/f4BT/Havhbjd8+HYhT2+tVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2ow+x214OSNQ448/bD6Pd9nvg/HePgjYmC5XUwpWQ=;
 b=B9EKl3VstiiufEi0nB6O0MVgqxOYG5QbGbbxCD5jw9b5cdT6rksXpwOkpKqGkPwFgqsqv9KT0OMo9HGOBTW3MVgliq7DD+9qLjn51AvupuB1Bwym01vLRIoa0TqUDsxkg9b07IzUf6la13M1hVx2NBv2lOA2Lvrv0nP7a2V55UHVb2Z4pUQ0VysraEwUfT2u5usOf8wl50Y+3QHt6du/PJVzeI7BWTKZLTLgXop/F/7lLe6UqLQ2uxMR0TPsIkvYjcC4bUyzJ9ZAkPh88DYM1DRsb7uucX0Z3XUS8vOCGGNRQ7aQgOspS8kZodnQiZhrZ5XsVT9EArewT5oNyewV9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2ow+x214OSNQ448/bD6Pd9nvg/HePgjYmC5XUwpWQ=;
 b=jrXYZkSicODkGb+kVIUvkz5rrgsnSaaMHXZAuQZRAXMKvu4nFzks4hHi/CDL1S8u+vS5CJBpPS+5jVxJV2EDDDVaty3ylwRyJ5RqoMMPs1hPlmUklkihykDPnZCBfNdrN0P3YItxEx24ptSkLbGR3B7NgYvnpfNtGImnvSA8hqE=
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by SA1PR12MB6750.namprd12.prod.outlook.com (2603:10b6:806:257::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Fri, 11 Apr
 2025 13:31:54 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::51) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:31:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:31:53 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:31:49 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 03/10] misc: amd-sbi: Move hwmon device sensor as separate entity
Date: Fri, 11 Apr 2025 13:31:15 +0000
Message-ID: <20250411133122.1806991-4-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SA1PR12MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ebca10-5927-4f23-4e40-08dd78fd395e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AOx+D0jCH+19VoKAWDQ0vOENpi7KCFjlUgQTZPGnM6ceLFoWyR4idCEqmi5F?=
 =?us-ascii?Q?qg5aivC3oxZ6VS4OSPRk0ZDpgbszRI+a1BouM1CCbioOP3BjvRGk+/4GAl6u?=
 =?us-ascii?Q?3LyhBtjjlw5cHu3hn4+Kz3rU3BkfOaWa7Q8g3UnU/V/eD8Xt/TfWvodoFcus?=
 =?us-ascii?Q?bnwEliGmPgAECwdITFeey3X5ZXGuUaO04LcAW7Iwre6W/ij+UeA/aV6lY2rT?=
 =?us-ascii?Q?IvnBnG1pQrOcS9Xc7r1MmkGv6G2hjusUfzXrnco084gypqPVe3WtBZ3WA5So?=
 =?us-ascii?Q?arFHllOoL/Ezahhn1mQBghehX+Tf/zGJnAx6UNXasB29keuEGxRjksdT/fyA?=
 =?us-ascii?Q?rb/yORTXP9BWkX9F12ViXgIiLS9W532EoNQtQaMdgRojwk5g8R4ItsKOShV+?=
 =?us-ascii?Q?JL9sLD7cO7q7x2baDIXdiw7Delwyi9ti6akffK0MH0ofbdfGJe+l7U5omjC3?=
 =?us-ascii?Q?y+yamiXhGPuY7iYqjPgQXQjhYFNgIY/PpkB6vZmWH8KxEsHDVWvSem7gfW5k?=
 =?us-ascii?Q?7pfFOGatfo1cqfJw5FSaEwQsWITmW6w3wZ1EKGlqFSi+VwhfbAKb2ll6PAeo?=
 =?us-ascii?Q?+vm7Kz0TKAuubS1DGd6DRCWOh69Kn2uEQ2serKaYXAXZpwsX9sCrH9ngrUSa?=
 =?us-ascii?Q?g0N/DTtu1Hd722/Ml1qt9nw3N7J166emFARehloysc+J38aeT6m5MyIEtpaj?=
 =?us-ascii?Q?d/kqEJE+vr9ugA0z+uzsJuJYZ7MOokKa/j/hVfjAI3KIz+tBpMubUrh7GAjP?=
 =?us-ascii?Q?QjH0ZfRD9MB4FHu+GP8I+dOwJy574cQ5zCgau3s9hgpN0LksAZVITkgNsnR3?=
 =?us-ascii?Q?m5n4Qdn9rfdV24Trz924p3MCrkZtvh+QHY36JtRSFHGpbW0I+D7FiQrYaf1+?=
 =?us-ascii?Q?q4a2YJ9rXbQxjPhFuee6/+xff2s5rU447fvqbMdkym0SidIpOoVstn3//IBX?=
 =?us-ascii?Q?4WmvKq3Kob6Qg2z6Od2lMAad0zSMjEyUN3Wevf6hFWXLvDPaTbBITQiR77cF?=
 =?us-ascii?Q?VJTT9nC1wCzNTtT/+dLKyWQNvul4QQNINUMa5FZa4omkCkLK30PymyK/KVXO?=
 =?us-ascii?Q?f81IQ53279PRiKUHkaJjqZgmHm/BPAgtLzwudQ4bstRckXk8CcBfJ8fDoMSA?=
 =?us-ascii?Q?yu5urE73J3xas72Id7vmauk3wzmb3fjqUjwpbqOk79RTGrY1arNTJF8VI/rA?=
 =?us-ascii?Q?k83n7/fzuiG55y4Fkwx5421iRGQBtdgFdE0LTwrcpVIvkkgbyz/GTxRk/Jzg?=
 =?us-ascii?Q?TdHENL5Np5P5SDUtU0sKZa7UTPrHj8oXP6j0hWKPcGcoI7Ok2vj44GpANBeR?=
 =?us-ascii?Q?jfwSESl+oCJ4IjpfDe0qrNQZHY0uwhIQZyeQFhk51ypVP3ArA110d89LUeJ3?=
 =?us-ascii?Q?VI10xkiI5qQGfzBvKhBHsyUuuzbFtIJPvdVORNyle4FEECytx37yaKqwSBul?=
 =?us-ascii?Q?hhzteMP1WjX5TsAd2yYenC/cjxkliXzosgyMbms5cWc7OtFSsT9xNLrOUUrE?=
 =?us-ascii?Q?TeLSUXXbAKMfND6XSOuEcul23wlYX4LosEiZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:31:53.9456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ebca10-5927-4f23-4e40-08dd78fd395e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6750

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

