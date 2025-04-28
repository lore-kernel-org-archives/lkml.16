Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2EA1C8612;
	Mon, 28 Apr 2025 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821872; cv=fail; b=n/whkAq2rgCsAxNiMGd9QnrRQ+xoXimaWD4H0wmg0JFUWP/DPdf7fo3y3qQ2OBuWvLOu37+qW3ZQc81wAA52L8mSMzGoaKQ7z7Z0JIurGfN27flZquKs5ZibJA/3bZy/Yz90HTMqHE9J1wObv9ksHXMc13+uwFfPtKnKUz+DK4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821872; c=relaxed/simple;
	bh=IO0EYlJ7bsAoCuzlB3+Wkxv8GWeMj39k89pPIF6cYP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJ4v19GVTQVIdxRBIBPcwLtRNzms2fXomlUlW2GC+zYPO5RdP90NdNOSkCMTtpCumhDObfKYJptvsH18t/OOuRGv/mc2UrcooQA5wZS10SZ6r5DBO9e3RTpcqTO8XwtkkFSmx2noqLh5tK4qG6hbsuRL+6mLnGCOudGePfJv14g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KpnOU7wa; arc=fail smtp.client-ip=40.107.212.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KpnOU7wa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V66xldR0Wys53dwAKcvsdOslo1f9sbbzHfEfGGXazrPNv8zQjbvsHEjNzSYuQcHTIVueKFgyCo6lfmTia946v0hd0ONKTTs58IgOepTmSRpLE4AFl3RiTl6V7vE4nl+Xl5dJUnh9NFZchVkDevrZM5VifOO2kSpdgjeyl6H6Pq5PXULSk9nY9JT3j9HJdMFnw8viOzoBTgsJ5MP3/qwGs1YePwwsbCK2+6o9OwgSCnRoFOs/Ohu5oG+XxQr2FW66wZdZJerfRhpxfawRLt3RofweW7qicPNyLU1qUk4/Zmz+4TDr0aVwy1joGdrmiq73aDh3pw3M9vxGpJZBsQmB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh7Vj4unT+uQoXiK0FYJz+e6kYTg2ceSDEeFnOH0FrQ=;
 b=BOsEX/+fF5VeJ5chxwxcObMlGsTWYx9GnwvH942utIr5o8cvc+Xur16C3hPIUlqvEs7BdbbMjodUB6ot7gS3/5TSbsBVSQdC7+YdCibHy7A+ZO+6P2a76el6i4CVVsV9gBYYyMus0zsDeE5ZETWyYoT6jEgEwAy/rZ1Qs6fPCLJZebRLCqj/WAOF/iTP3xrRN3MPxXbxXcUuYcGfMUBxJXBFw7JxioXPvxnsMmxE4pS9Kzbp1K4v1Crcbp+S7045WmfJuz/Oj2Gb+Nlr+m7gbBAi8AT5Q6Jf9tWsEqlNLF+WqR2ZVoZ9AKXq4JhBxdMb/wNP92RitIrBHHMVP+DeXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh7Vj4unT+uQoXiK0FYJz+e6kYTg2ceSDEeFnOH0FrQ=;
 b=KpnOU7wahfFiHKpK3TJqTsE8GvtH3uPi7CClJKB2koCxFoYCUVhpUWZVfG2yQlHjDEa08Qngy0vDz6G4wc6G+Fegm8RmMGkVARB2QGVqjhmmA+vIIyNYJerhkr5wpH14rjRMP96blWGrLiEa+HVSuzAOkUoqNVQx4PJ+ah+I4EQ=
Received: from MW4PR03CA0051.namprd03.prod.outlook.com (2603:10b6:303:8e::26)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 06:31:00 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::63) by MW4PR03CA0051.outlook.office365.com
 (2603:10b6:303:8e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 06:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:30:59 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:30:55 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 02/10] misc: amd-sbi: Move protocol functionality to core file
Date: Mon, 28 Apr 2025 06:30:26 +0000
Message-ID: <20250428063034.2145566-3-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d19e28-d909-4d9d-4667-08dd861e3d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/VRFpwZW3Sf8Vrw8r8nBqU0SkCzqsh41o+r7oupc+8+zlEyqW3gMgcEKGSPe?=
 =?us-ascii?Q?G+LrYxpgO7I56nbQ0wXw2olZ18eO0C6te8TmGVze7FuuHd8HdXBissuvRmed?=
 =?us-ascii?Q?a4fNhboETab9ZdF7/84uT+K/wBSOborLpKypxz3nTB9R13NsWrb+lH3XaxoV?=
 =?us-ascii?Q?bhG4DF7XYSQEGwJtO7FQyUiJoeO48EecN1QXIBCHE7Kc12eTCiSKeQu8TtlK?=
 =?us-ascii?Q?PvT/W3h/vKjicmLHSkGI3SGL83l1IKZKy7NpoHEhRK/ynKDoFHxq95jElwC6?=
 =?us-ascii?Q?QxzOfhGshKzLpl3AaNOW2gyId8zFvPjZAgNO4CIMkcgjn9748Rtic2C61ctC?=
 =?us-ascii?Q?mc0/3hrAIrgkbQgdoGB429h6d5GUQUTBUyW4kYuom39/vHGOOAUSzZzCEiHh?=
 =?us-ascii?Q?slct0GSx+4PUwBdfPyam/rCpWCUThMUoWEVVxYOCzTwvAQTgNWokSfIwqLS/?=
 =?us-ascii?Q?jhBHOOPraWeN64V+UY5JtyR80M6mmuPHaFEF0DjdCP5mFepmBKPdoATW1MpV?=
 =?us-ascii?Q?iT0qL4vRuwMTbxCOLfrhW4i+R74dl0zn1mnSvaHqfxdf+el6kEfrYruY6s/4?=
 =?us-ascii?Q?NUcwLqHzd5pD4SoYl+l+Oxsotzl399oKd5KY2DHjO0gtI+T4TxLV1OlTAHBz?=
 =?us-ascii?Q?0gKCmJNSfoMUAQlYqc+DP5FznAsesT3Dpgf88Vy61zf9O2kmLE6zlGvZoyKW?=
 =?us-ascii?Q?2TlsDgwoWHEg5jZPJSDU9//sfSNPJVu9CsCvJIw7VvRUS3XApvrvgRXzKVGM?=
 =?us-ascii?Q?dN6pLPhImFOJM3vPeN4ELaBUZA5mgx+6aNyoAZXEokjfYbWsS6c77ukY8t73?=
 =?us-ascii?Q?QF8e14YQXOiRkC1+ZqDl7/caJPykVCZDz8u2RxS5VCGcPwSt3WVX5B0Nd+Lw?=
 =?us-ascii?Q?AWRkLNO9ZKknCs31IwVexMfKfGfVw/Kh3flbg8NGjv5Hv7yxcak5N4oUgxU0?=
 =?us-ascii?Q?XHB1lHrAVZc9U/JbspYhM9OhDhpeNVfOZOXGZaNn2kLJFiGpENnx/P4lohLu?=
 =?us-ascii?Q?KlPEOJRrvBSfN6fspk2hoTK1gxlBBM/6MH0kCqyMfKC7pdeohlkj5J/YBrxm?=
 =?us-ascii?Q?VsZDItfUnvXFxlJOr65i0QzbwUiSQC2ow4dgmPWCqlaPnCTizxVM/AK4Orrh?=
 =?us-ascii?Q?QMgkwhZLaZMXM5hxAV5uSXMlIxeCnr18mnAsjvCKkPdT+HNed3CTyuE/ZzRi?=
 =?us-ascii?Q?3LK3mPet39p6hkzbLDwn3otEU2hn5pI4rM+toKzDVMWjYMyGIAcl8h6SlAdh?=
 =?us-ascii?Q?yTVpiniLt1O8OxC9tj27Kq1eYKMs6SdFpeCajh2m/XEPPlDbdgitzJk1N0t5?=
 =?us-ascii?Q?xu7Fql33V8VakwlKfLqj02YWF0bzSK4Lf3ltcN/d73b+w1cOx/weDu75vWqd?=
 =?us-ascii?Q?IWV9aIi+IcXd+WeVaXPhpE9/Hf7i0+fxhBdQUIPHgpeybv5RS8TtFc/v+7A8?=
 =?us-ascii?Q?kOuSIkhsFRyy9bFyGxjDfn4M+p1KCFyt47PnwAnrXLLdOyEz0JklQlhyUM53?=
 =?us-ascii?Q?9N2xG87SOmQzBOsSSEX3nEYTvf+tI7f3Nmno?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:30:59.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d19e28-d909-4d9d-4667-08dd861e3d8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813

- This is done to utilize the protocol functionality into
  other domains.
- Increase the scalability of the module with different bus(i2c/i3c)

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v7:
- Add dependency on hwmon subsystem

Changes since v5:
- Address kernel test robot error:
 - undefined reference to `devm_hwmon_device_register_with_info'
Changes since v4:
New patch: Patch split from v4 patch 1/9
- Update Copyright year to 2025

 drivers/misc/amd-sbi/Kconfig                |   9 +-
 drivers/misc/amd-sbi/Makefile               |   3 +-
 drivers/misc/amd-sbi/rmi-core.c             | 113 +++++++++++++
 drivers/misc/amd-sbi/rmi-core.h             |  63 ++++++++
 drivers/misc/amd-sbi/{sbrmi.c => rmi-i2c.c} | 166 ++------------------
 5 files changed, 192 insertions(+), 162 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/rmi-core.c
 create mode 100644 drivers/misc/amd-sbi/rmi-core.h
 rename drivers/misc/amd-sbi/{sbrmi.c => rmi-i2c.c} (53%)

diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index be2d9e495eb7..0c8981f97f25 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config AMD_SBRMI_I2C
-        tristate "AMD side band RMI support"
-        depends on I2C
-        help
-          Side band RMI over I2C support for AMD out of band management.
+	tristate "AMD side band RMI support"
+	depends on I2C
+	depends on HWMON
+	help
+	  Side band RMI over I2C support for AMD out of band management.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called sbrmi-i2c.
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index 304394bf5e59..7cd8e0a1aa5d 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi.o
+sbrmi-i2c-objs  		:= rmi-i2c.o rmi-core.o
+obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
new file mode 100644
index 000000000000..74456756270c
--- /dev/null
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi-core.c - file defining SB-RMI protocols compliant
+ *		  AMD SoC device.
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mutex.h>
+#include "rmi-core.h"
+
+/* Mask for Status Register bit[1] */
+#define SW_ALERT_MASK	0x2
+
+/* Software Interrupt for triggering */
+#define START_CMD	0x80
+#define TRIGGER_MAILBOX	0x01
+
+int rmi_mailbox_xfer(struct sbrmi_data *data,
+		     struct sbrmi_mailbox_msg *msg)
+{
+	int i, ret, retry = 10;
+	int sw_status;
+	u8 byte;
+
+	mutex_lock(&data->lock);
+
+	/* Indicate firmware a command is to be serviced */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG7, START_CMD);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/* Write the command to SBRMI::InBndMsg_inst0 */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG0, msg->cmd);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * For both read and write the initiator (BMC) writes
+	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
+	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
+	 */
+	for (i = 0; i < 4; i++) {
+		byte = (msg->data_in >> i * 8) & 0xff;
+		ret = i2c_smbus_write_byte_data(data->client,
+						SBRMI_INBNDMSG1 + i, byte);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+
+	/*
+	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
+	 * perform the requested read or write command
+	 */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
+	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
+	 * of the requested command
+	 */
+	do {
+		sw_status = i2c_smbus_read_byte_data(data->client,
+						     SBRMI_STATUS);
+		if (sw_status < 0) {
+			ret = sw_status;
+			goto exit_unlock;
+		}
+		if (sw_status & SW_ALERT_MASK)
+			break;
+		usleep_range(50, 100);
+	} while (retry--);
+
+	if (retry < 0) {
+		dev_err(&data->client->dev,
+			"Firmware fail to indicate command completion\n");
+		ret = -EIO;
+		goto exit_unlock;
+	}
+
+	/*
+	 * For a read operation, the initiator (BMC) reads the firmware
+	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
+	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
+	 */
+	if (msg->read) {
+		for (i = 0; i < 4; i++) {
+			ret = i2c_smbus_read_byte_data(data->client,
+						       SBRMI_OUTBNDMSG1 + i);
+			if (ret < 0)
+				goto exit_unlock;
+			msg->data_out |= ret << i * 8;
+		}
+	}
+
+	/*
+	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
+	 * ALERT to initiator
+	 */
+	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
+					sw_status | SW_ALERT_MASK);
+
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
new file mode 100644
index 000000000000..8e30a43ec714
--- /dev/null
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _SBRMI_CORE_H_
+#define _SBRMI_CORE_H_
+
+#include <linux/mutex.h>
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+
+/* SB-RMI registers */
+enum sbrmi_reg {
+	SBRMI_CTRL		= 0x01,
+	SBRMI_STATUS,
+	SBRMI_OUTBNDMSG0	= 0x30,
+	SBRMI_OUTBNDMSG1,
+	SBRMI_OUTBNDMSG2,
+	SBRMI_OUTBNDMSG3,
+	SBRMI_OUTBNDMSG4,
+	SBRMI_OUTBNDMSG5,
+	SBRMI_OUTBNDMSG6,
+	SBRMI_OUTBNDMSG7,
+	SBRMI_INBNDMSG0,
+	SBRMI_INBNDMSG1,
+	SBRMI_INBNDMSG2,
+	SBRMI_INBNDMSG3,
+	SBRMI_INBNDMSG4,
+	SBRMI_INBNDMSG5,
+	SBRMI_INBNDMSG6,
+	SBRMI_INBNDMSG7,
+	SBRMI_SW_INTERRUPT,
+};
+
+/*
+ * SB-RMI supports soft mailbox service request to MP1 (power management
+ * firmware) through SBRMI inbound/outbound message registers.
+ * SB-RMI message IDs
+ */
+enum sbrmi_msg_id {
+	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
+	SBRMI_WRITE_PKG_PWR_LIMIT,
+	SBRMI_READ_PKG_PWR_LIMIT,
+	SBRMI_READ_PKG_MAX_PWR_LIMIT,
+};
+
+/* Each client has this additional data */
+struct sbrmi_data {
+	struct i2c_client *client;
+	struct mutex lock;
+	u32 pwr_limit_max;
+};
+
+struct sbrmi_mailbox_msg {
+	u8 cmd;
+	bool read;
+	u32 data_in;
+	u32 data_out;
+};
+
+int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+#endif /*_SBRMI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/sbrmi.c b/drivers/misc/amd-sbi/rmi-i2c.c
similarity index 53%
rename from drivers/misc/amd-sbi/sbrmi.c
rename to drivers/misc/amd-sbi/rmi-i2c.c
index d48d8e5460ff..6412f00eb381 100644
--- a/drivers/misc/amd-sbi/sbrmi.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * sbrmi.c - hwmon driver for a SB-RMI mailbox
- *           compliant AMD SoC device.
+ * rmi-i2c.c - Side band RMI over I2C support for AMD out
+ *             of band management
  *
- * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
+ * Copyright (C) 2024 Advanced Micro Devices, Inc.
  */
 
 #include <linux/delay.h>
@@ -14,64 +14,10 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include "rmi-core.h"
 
 /* Do not allow setting negative power limit */
 #define SBRMI_PWR_MIN	0
-/* Mask for Status Register bit[1] */
-#define SW_ALERT_MASK	0x2
-
-/* Software Interrupt for triggering */
-#define START_CMD	0x80
-#define TRIGGER_MAILBOX	0x01
-
-/*
- * SB-RMI supports soft mailbox service request to MP1 (power management
- * firmware) through SBRMI inbound/outbound message registers.
- * SB-RMI message IDs
- */
-enum sbrmi_msg_id {
-	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
-	SBRMI_WRITE_PKG_PWR_LIMIT,
-	SBRMI_READ_PKG_PWR_LIMIT,
-	SBRMI_READ_PKG_MAX_PWR_LIMIT,
-};
-
-/* SB-RMI registers */
-enum sbrmi_reg {
-	SBRMI_CTRL		= 0x01,
-	SBRMI_STATUS,
-	SBRMI_OUTBNDMSG0	= 0x30,
-	SBRMI_OUTBNDMSG1,
-	SBRMI_OUTBNDMSG2,
-	SBRMI_OUTBNDMSG3,
-	SBRMI_OUTBNDMSG4,
-	SBRMI_OUTBNDMSG5,
-	SBRMI_OUTBNDMSG6,
-	SBRMI_OUTBNDMSG7,
-	SBRMI_INBNDMSG0,
-	SBRMI_INBNDMSG1,
-	SBRMI_INBNDMSG2,
-	SBRMI_INBNDMSG3,
-	SBRMI_INBNDMSG4,
-	SBRMI_INBNDMSG5,
-	SBRMI_INBNDMSG6,
-	SBRMI_INBNDMSG7,
-	SBRMI_SW_INTERRUPT,
-};
-
-/* Each client has this additional data */
-struct sbrmi_data {
-	struct i2c_client *client;
-	struct mutex lock;
-	u32 pwr_limit_max;
-};
-
-struct sbrmi_mailbox_msg {
-	u8 cmd;
-	bool read;
-	u32 data_in;
-	u32 data_out;
-};
 
 static int sbrmi_enable_alert(struct i2c_client *client)
 {
@@ -94,100 +40,6 @@ static int sbrmi_enable_alert(struct i2c_client *client)
 	return 0;
 }
 
-static int rmi_mailbox_xfer(struct sbrmi_data *data,
-			    struct sbrmi_mailbox_msg *msg)
-{
-	int i, ret, retry = 10;
-	int sw_status;
-	u8 byte;
-
-	mutex_lock(&data->lock);
-
-	/* Indicate firmware a command is to be serviced */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG7, START_CMD);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/* Write the command to SBRMI::InBndMsg_inst0 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG0, msg->cmd);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/*
-	 * For both read and write the initiator (BMC) writes
-	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
-	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
-	 */
-	for (i = 0; i < 4; i++) {
-		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = i2c_smbus_write_byte_data(data->client,
-						SBRMI_INBNDMSG1 + i, byte);
-		if (ret < 0)
-			goto exit_unlock;
-	}
-
-	/*
-	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
-	 * perform the requested read or write command
-	 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/*
-	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
-	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
-	 * of the requested command
-	 */
-	do {
-		sw_status = i2c_smbus_read_byte_data(data->client,
-						     SBRMI_STATUS);
-		if (sw_status < 0) {
-			ret = sw_status;
-			goto exit_unlock;
-		}
-		if (sw_status & SW_ALERT_MASK)
-			break;
-		usleep_range(50, 100);
-	} while (retry--);
-
-	if (retry < 0) {
-		dev_err(&data->client->dev,
-			"Firmware fail to indicate command completion\n");
-		ret = -EIO;
-		goto exit_unlock;
-	}
-
-	/*
-	 * For a read operation, the initiator (BMC) reads the firmware
-	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
-	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
-	 */
-	if (msg->read) {
-		for (i = 0; i < 4; i++) {
-			ret = i2c_smbus_read_byte_data(data->client,
-						       SBRMI_OUTBNDMSG1 + i);
-			if (ret < 0)
-				goto exit_unlock;
-			msg->data_out |= ret << i * 8;
-		}
-	}
-
-	/*
-	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
-	 * ALERT to initiator
-	 */
-	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
-					sw_status | SW_ALERT_MASK);
-
-exit_unlock:
-	mutex_unlock(&data->lock);
-	return ret;
-}
-
 static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
@@ -297,7 +149,7 @@ static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 	return ret;
 }
 
-static int sbrmi_probe(struct i2c_client *client)
+static int sbrmi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
@@ -323,12 +175,11 @@ static int sbrmi_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &sbrmi_chip_info, NULL);
-
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
-	{"sbrmi"},
+	{"sbrmi-i2c"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sbrmi_id);
@@ -343,15 +194,16 @@ MODULE_DEVICE_TABLE(of, sbrmi_of_match);
 
 static struct i2c_driver sbrmi_driver = {
 	.driver = {
-		.name = "sbrmi",
+		.name = "sbrmi-i2c",
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
-	.probe = sbrmi_probe,
+	.probe = sbrmi_i2c_probe,
 	.id_table = sbrmi_id,
 };
 
 module_i2c_driver(sbrmi_driver);
 
 MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>");
 MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
 MODULE_LICENSE("GPL");
-- 
2.25.1

