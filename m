Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF294230D0E;
	Wed,  2 Apr 2025 05:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573562; cv=fail; b=riMJHszt2RsOwrvW8mX21fp7Bg6EGgnhwyhYUMf8Xb7fdsZ6zvRUJT8kfFQNhqWqZFISMNWgeKbjo1dmjQ2kHAzyHh1JOxRmabN7MJjCEeZlWjhUh/53V8uZLZpyxT45ysmgjFTfPwE94RPMoBDicAj/Ttgz3C/11kaTxUzc9rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573562; c=relaxed/simple;
	bh=RDX27v01fPmv5Uv9TCIjX/zHorXOxynT0yjZQN9PA2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYmW5r3/5t+/A6bIk4GP/pnRST2TqgQB85W5xe1gfzgjhwRBfoJnzv00bXUjFaVmkhnhLYNapI3/8oZsa4SqeVw8F5/j11LadxCm9Ashx2+ClUbmniI8wWMAls/ek/AoM5mJ5vhx1AaL87c6KbMqEgEUeyxPPcWIWxch2f1Zlms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VfS5zH48; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VfS5zH48"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTVKSdZ3PPIRsktluRioimv+EIuIr9AoMEC2ah4TKFLxmb9zH9jA3P9GjSsWO5mTHLIfW4CkB+D+YcAgq3ACLyA/VrCZnCREeR8zmmmA4kyLWEEJwMhFnEVeoJAbMz5n036yLuK72s1PKnk5upsHNIZiQxboxKSB+AnO54QKwaAWAahN5+WOts5sMGpMNXzzL2vPh4RPKILvuK2xHptMzzEPIBY0WJHqxTRTPbHQ371rTZysZh//PMCZNZgk33fP2Ou3MuAbXTHafvlWhlP1S3R10rhVqxDyY5WNBaYmNInZzB15/uPzHjHdh/SkINRHBlqcd7dqA7lPRhzig1Cwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Net3qPNBrD08WRujPk7Mts8D0FWNP2vRRaqCodx9/I=;
 b=BM89rxka6jgS3hEB49v/gjL5F/U4e8+V4Od2bY3+WTnpK9+Kpxlwws6Fl4TnBH2YpOeFwj+m5ZbgJZVlGwTXdSD3HBUTszyFBVro2gYkv0mOg4UW+puZYBGcnardEzY+iG4TTdn1iDbnD7fAr8I6cYNlBgvYwKeFltkrMgKdAjAfOC+5AUR0oiYoGbpDvjp4OTP+8zZXrDLtVViflNJpTBzpx2xzAhXCzH+I/f0ATpBMY1CADnx2qSVP2VJmJrdyMkS94DJHkJC4Yr9Qq81EkBZNgHghZ1pWgH1NcWGwFbpD1Kd5NDW8RhEvlIJYZi5lTFs1F7uenx892mvlZwRoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Net3qPNBrD08WRujPk7Mts8D0FWNP2vRRaqCodx9/I=;
 b=VfS5zH48aCvYpQR4SbPUkiCPDno8fR2SAD+fBE1gqerDmDxoqou+fsW4JpkwMZVaN1Of9hJnZpkylWx+ygcPIEHPrVVLq8HVLWLX0wdL7DmcdjvPh/PfWmQbmv1FKA+rZjfQWPFfuwE/YPDeQiIXNyPSQTtw5mRKady54I5ElNc=
Received: from SJ0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:a03:3a0::30)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Wed, 2 Apr
 2025 05:59:15 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::2b) by SJ0PR03CA0265.outlook.office365.com
 (2603:10b6:a03:3a0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 05:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:14 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:09 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 03/10] misc: amd-sbi: Move hwmon device sensor as separate entity
Date: Wed, 2 Apr 2025 05:58:33 +0000
Message-ID: <20250402055840.1346384-4-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e0e72f-cd6f-4e57-013a-08dd71ab7f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZsZ1OhDD9Bk21jYuGgtpn+9+qfRf3496KUz6LOASjIdORbl1HF+iFY+mXbf?=
 =?us-ascii?Q?wiUvnXOoLMiVHZFAGBidyZY9pqvA6Sf9hGV0bhgMWP/LFRCenB7vsU58w71P?=
 =?us-ascii?Q?DAYsFIREKqER/LYBYXKqwbWA1IH+O6W8BgjzSU3aBl9nAB+LeNhGEbYkUrAU?=
 =?us-ascii?Q?4YsbKW0vTfkfPCetJ0u3wMfXviOXxXMiFm+ORjpBiX/bCsEPEC/HxTqGCuaK?=
 =?us-ascii?Q?Y5eBSamdtMIIkNNiVsuuMvNN1jzR+4r498MuhHXcKpOoCZz86cJqLMVzLUKS?=
 =?us-ascii?Q?eYylFBirTsZGk+6kg7XxEi/s1R031MaphyO8dqHOrMIdE8jrmOiHLc9iXckP?=
 =?us-ascii?Q?pbC4RcR46KVk2jLsUnVFOPrpLWIIw1VCc0telUmDThHraiTpbPfpreSKB/ZC?=
 =?us-ascii?Q?8n74BUnlEhisJ//caBvAY1JNEAxE56t6pUpKCRKAzXWZcpeqVz47akA9W6gu?=
 =?us-ascii?Q?rtSNAggs7O6CX1pNC18BkRLjnZMgDVGbcEvsgGJ9wafhKVGQhK51mlS0uHdl?=
 =?us-ascii?Q?M7JmSuVFojwtrBT/h2NYGyhTxbBH75cF5q+wTLOfrP61Pw97d+kTQGxg/wE3?=
 =?us-ascii?Q?4M31Wx8pZJ6cKbbJWTJ3L/99QvpXUYP+LtLzu7U/IVLk1P72xSw138pW7Wl2?=
 =?us-ascii?Q?VwQpeKs6X3K175+mxFYUj5SYlLTsQGIpeuin0Nhza4KbkCJ37w+OT+DQr6Sy?=
 =?us-ascii?Q?fHLTePvpy3G0Z+qvM52gfn/aNXr9yzTXadx9J+VtI7a7l7e1vE32W++8fIn6?=
 =?us-ascii?Q?ByZ4x2UEnwfNNWp0gqeNNilI0XiJKg4Qam+CeszHKXrcadMKLSORMvWsyPMC?=
 =?us-ascii?Q?/UklreyKabrRGtld0JqN9HVMvi+DWpx3CZhG1dMgDzQz1vN7UvkQTH1aQY7X?=
 =?us-ascii?Q?MBXTOVfh8Y0rqRqW1QBSYqj46uA54Yy2NPqcKA3vL5lxFU8M1Oxv76Nhp0sF?=
 =?us-ascii?Q?iTyWtkV5aHdNMGWtfG3PLPX/GBUPZ8gyWIftIhNyLaOLz5QI2GhKsjnrdS6w?=
 =?us-ascii?Q?sOGXKgrllSWHMXJagBBXz2pylzahF78CN5wUqqLhhfgzMoVl6eyHHurBUU+V?=
 =?us-ascii?Q?tvJeM83Jr275loZSAM6H3HLnCFCgVpYMpMTQ9odkdIDxLQ+rYEqvv+iRi1+k?=
 =?us-ascii?Q?jdHR6e94+Kt5x326EXQYD9nWNNmE9OAd94sAMw3CHW394K1qmYGAwy1CTOOY?=
 =?us-ascii?Q?e/qpwVtvlphp5DV50vAeJBbvRX1HE/bq99bLMfr5OCXfc7vDNeiESFEggYJX?=
 =?us-ascii?Q?qVssCt8Pcac5DSWM3FhiXrxVf9przX/0l62h66Yj2BeRTpNTFHvh62b5E3y6?=
 =?us-ascii?Q?W19c6/QDjL8v3B3H2eHGZAUjvi5eXOcdcXTORtXPED+5QT7cf6+GhKBtiPIy?=
 =?us-ascii?Q?NPCYDWmNuQB5BKzWO56qTfBw6zHgCPw8SJ5jQ88bTuSFXVe7dppHA/M1VT1C?=
 =?us-ascii?Q?6L8JaR20nmruVwwxF/LVlKvmK3GoVBhEAy9fS1l6lM0Y+++//VvM5AlsVQHE?=
 =?us-ascii?Q?NBMU+XmyOFiH+ag=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:14.6898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e0e72f-cd6f-4e57-013a-08dd71ab7f79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344

- Move hwmon device sensor to misc as only power is reported through
  hwmon sensor.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v6:
- Fix "Missing a blank line after declarations" warning

Changes since v5:
- Patch rebased

Changes since v4:
New patch: Patch split from v4 patch 1/9
- Update Copyright year to 2025

 drivers/misc/amd-sbi/Makefile    |   2 +-
 drivers/misc/amd-sbi/rmi-core.h  |   1 +
 drivers/misc/amd-sbi/rmi-hwmon.c | 124 +++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/rmi-i2c.c   | 107 +-------------------------
 4 files changed, 128 insertions(+), 106 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/rmi-hwmon.c

diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index 7cd8e0a1aa5d..eac90a7635de 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-sbrmi-i2c-objs  		:= rmi-i2c.o rmi-core.o
+sbrmi-i2c-objs  		:= rmi-i2c.o rmi-core.o rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 8e30a43ec714..27165d3bb20f 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -60,4 +60,5 @@ struct sbrmi_mailbox_msg {
 };
 
 int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data);
 #endif /*_SBRMI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/rmi-hwmon.c b/drivers/misc/amd-sbi/rmi-hwmon.c
new file mode 100644
index 000000000000..9a86fc4a0e7d
--- /dev/null
+++ b/drivers/misc/amd-sbi/rmi-hwmon.c
@@ -0,0 +1,124 @@
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
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon_dev;
+
+		hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
+								 &sbrmi_chip_info, NULL);
+		return PTR_ERR_OR_ZERO(hwmon_dev);
+	}
+	return 0;
+}
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 49049ce5bd02..9ad4c8093399 100644
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
 
@@ -173,12 +74,8 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	if (IS_REACHABLE(CONFIG_HWMON)) {
-		hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
-								 &sbrmi_chip_info, NULL);
-		ret = PTR_ERR_OR_ZERO(hwmon_dev);
-	}
-	return ret;
+	dev_set_drvdata(dev, data);
+	return create_hwmon_sensor_device(dev, data);
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
-- 
2.25.1

