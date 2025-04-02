Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA3230BF7;
	Wed,  2 Apr 2025 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573560; cv=fail; b=Hm9ZhR8WMToI5tueQXJt1mNCHMH0F3TZ/PslNeWXWe3L8uFfbWeK+riMwRtUsieG7N4ONe+LZ20wQP6O7fQuvVCLaR2YoQ5aryqKD73adVwTqgLRCAPbN89E0xu70Wd5NxfIDfpqSgQHzUp5cj9RRpJNk2Iyeb+BLleI2EvVxi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573560; c=relaxed/simple;
	bh=viFp8DbKGwC6MbB6WRy4nLVumQuCbWfOyus6jNSr6qk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4uaPW/G0cdu0bn3v2X9FzCC8bs1XoetnVuMdlGdNihTjDZjOzp4L6aWKkJDI5V1InuZLU2pQc9qEKYNtKZ35W27WXoBMhtwcz9X5gl3r4N4Yul3g178loWVy6xkULaFU+UkPcHY8fv2xQafmiMLE9/DoTusuZj7OBGA4mF/cUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xh4OW8BO; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xh4OW8BO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgpwQ2hP71QI49xZPR/aJ4K+UH7PQqpQfuVqeQsHClRVAuEyPG7oMk9R8UrfOvh2bLkX/3mCjQDzXq11NWaVv4sP4ePHKr5SFzvs5lL0/WX5sE//2/51DKRLNLsJfDZOjmHFwhxrmf+kIiBmh4Evu/dh6i7bDdVctpDEhR2by4ld7nuX42l/AeQvl8ecU1YSyN/indXiWB5Z1CNsGEPrBbwtDjQlmKpZCcItAoxRM9vvwWzRA0fHh7+LP8GyCmUeK52QUS6JElpnOrLv75DqhdwY8hb+H+0/+xh2WJBTQsla87Ur1nIjoOaZ6VMMyExieSJVbZ3NYtK2eUNomSVWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+1U5lUHtH5HwC928X+ElB+vphiFG8FQtIFYYOtg50o=;
 b=nCtVxPYTjzu9+t+bdl9uMtFpTY3CGUfTko2B5PtubJe9fGInDlgba19PoxBw86yEYGbz8VH3BpZBsLI6VsUg7/OmUBGPgy9jFjHVQNagf3cxZ2xcxeelIBy34sf2ufhyX1LES7CTf3bnZ3YYiABZluHKkZbuycWfkXOh6Doi+HAM6vex6YwDujBVU/9QYAmbleKbocL5+fjfZcMs2yDFEHoa0cwBOHLLC+wJnROkxMMNd+DS1QfJZRZwYGY9LNxGIg7BS7dNjMbWmBKLdgy8QhaKLZIiJ0kw9MpvWydXLDgOrKaHxGdmc5Wgj4mnWUBpwygG8tkiFlxgTjZYajauWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+1U5lUHtH5HwC928X+ElB+vphiFG8FQtIFYYOtg50o=;
 b=Xh4OW8BOhgREhREXr5MrJ5rbvGbFNk6DSZHjtQbtxu7HWG5BG8eHjzI2bjH5ZqcUCgLLXfLycyxbMpX1dKv6ytnhTEqQ00YbmVIHM/lZ1MXV4QZotJI/Lgy086G4ZViQkeNiAHKjNa+PPxEswdbpdjdP6NM7fiBsZdsg43FafyI=
Received: from MW4PR03CA0029.namprd03.prod.outlook.com (2603:10b6:303:8f::34)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:59:10 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::eb) by MW4PR03CA0029.outlook.office365.com
 (2603:10b6:303:8f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 05:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:10 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:05 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 02/10] misc: amd-sbi: Move protocol functionality to core file
Date: Wed, 2 Apr 2025 05:58:32 +0000
Message-ID: <20250402055840.1346384-3-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b3e524-95a3-4df9-a56f-08dd71ab7cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hjUt1pKu/02llTWTUzc+elDShBtHuFfBaSUk4Ep1I422CRuGva8+/oP1iLye?=
 =?us-ascii?Q?fcE2aP+G7Z14gpelOXvbdHqruyPcIAiSfHlDQCojHREqvlMLUPGb7hrLbHpf?=
 =?us-ascii?Q?RZSJDctVO8T0IydmGPmutXt6GF5qjtdZZTLaW3jY7ISTpOdMV2FHKQR/G8vX?=
 =?us-ascii?Q?DqN3e2bKIAXxcgl8fzZLbXve8h5TrWyLlEBc18dqx7QWINfDjjp5621nqtk7?=
 =?us-ascii?Q?lFdsUK8yNsT46RPE+ArWrWIQZeyWSPpP7bcFMK+CcE2ME0MVyW5J5cfafN+L?=
 =?us-ascii?Q?7yymrXojBIHB4y8x/gBCFQfap9oZXJNrdHjvwjImxiuC6Uq8VPQOfjzdIj1Y?=
 =?us-ascii?Q?0Ztd99UpJVRN4rtCLxRS43VPxJSsDAN73MdOcyl7wNFrVKt34NjMh+UsahZ+?=
 =?us-ascii?Q?5aLUDK+ZNdMpBnCloUOacSsJHn6PLwpNUHwMvXrB0MhJ9Y8FlwqTI6a1dw4o?=
 =?us-ascii?Q?cwSJQIreMJqnpZjrLkfiEkE7hsEcTv5tbyu8ic9tMMHFrgI6uhcYIkbL0wA7?=
 =?us-ascii?Q?gkFPGsyKhe/SZ3f961gOC0puGg9RLZc5EzmYBZwxmu3Dh8RXqXldO4JDiC2N?=
 =?us-ascii?Q?GeDbezhqNTHgL4z0lbd5grIxfpog1N1hWEw3dbg9Oru4Dch5bXUNV3opFxhX?=
 =?us-ascii?Q?6A6kbtuCCIUWMOcl/y+0ruHi4gXWiXIj5Bn+oJt/E8jrbePYHH67jFM1rcl3?=
 =?us-ascii?Q?SKPINOdH+TWQbVNvKDy8gv50IiVTgEaWMJpY2Cz5e4SVrNct8wx7KgECt6KV?=
 =?us-ascii?Q?5gaPF6jW8n8BsRCfxz+6KI4htpnjJ2hmnxMJZiJWi/m07cw9tXa5eYsATMES?=
 =?us-ascii?Q?Cqs/d8AYBDEc64YT83Pt6imjLFntFMCtC/Hdo+5xiksk3DCqCZzYbu/uDH9q?=
 =?us-ascii?Q?u7Q8uAbrwn23xpz2/50OAGeMWIVJcUels9o8wxOX7nb25iGshripiH7BxK4x?=
 =?us-ascii?Q?NzfGQXXCQq8G7jRBH7bm/nKrJWBk2Gf7R5XIA+lTtKhiSAoiZhC7w/ftsC/t?=
 =?us-ascii?Q?PaV4U37PK1wyj4vVnSXfB5Itg0yCUmX9v6j1SRqxGLOY7rP1qvj7tH5F6Vla?=
 =?us-ascii?Q?A2Pkd1obDVX1PX4l/TWK2G5wD2+M+k5Rb+2xEo8G+SCGggMlZHfIMz6cGoKO?=
 =?us-ascii?Q?L2lbpEGa8gxVLjv7B3L9OOUjTCQgrrGKIn41Qp4n1UzRjoGYGIJZH4c5/B7y?=
 =?us-ascii?Q?zfyWZn2AR4tjTLE91LLjrF1l3cMKcKdZvR3GmKXtxygPye2GnIOVQ1d1MilH?=
 =?us-ascii?Q?hCXnCTJUY1z2iF0HMMhqPBa1hcmwB3ldRpY9L0Ijayr5cJcVpLGUVrnUOqKc?=
 =?us-ascii?Q?wgNwbRvVjeKFRHVxzkY2WCLKJKsS6L/j9NYTJfDi966e+iAoTdSh68HQpORh?=
 =?us-ascii?Q?vaTnXpUgb6R9N4WtjBDzQtKoPx3YJGxMIkLU65YCZO4Y0SHBZNOJz4oEsWDG?=
 =?us-ascii?Q?mqqVDGImbsDWIYx+mPa+5xGsnsJtoXQdhPybFjcEfaQT0vhZvXu7Hw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:10.1524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b3e524-95a3-4df9-a56f-08dd71ab7cc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224

- This is done to utilize the protocol functionality into
  other domains.
- Increase the scalability of the module with different bus(i2c/i3c)

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v5:
- Address kernel test robot error:
 - undefined reference to `devm_hwmon_device_register_with_info'
Changes since v4:
New patch: Patch split from v4 patch 1/9
- Update Copyright year to 2025

 drivers/misc/amd-sbi/Makefile               |   3 +-
 drivers/misc/amd-sbi/rmi-core.c             | 113 +++++++++++++
 drivers/misc/amd-sbi/rmi-core.h             |  63 +++++++
 drivers/misc/amd-sbi/{sbrmi.c => rmi-i2c.c} | 175 ++------------------
 4 files changed, 193 insertions(+), 161 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/rmi-core.c
 create mode 100644 drivers/misc/amd-sbi/rmi-core.h
 rename drivers/misc/amd-sbi/{sbrmi.c => rmi-i2c.c} (52%)

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
similarity index 52%
rename from drivers/misc/amd-sbi/sbrmi.c
rename to drivers/misc/amd-sbi/rmi-i2c.c
index d48d8e5460ff..49049ce5bd02 100644
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
@@ -321,14 +173,16 @@ static int sbrmi_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
-							 &sbrmi_chip_info, NULL);
-
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+								 &sbrmi_chip_info, NULL);
+		ret = PTR_ERR_OR_ZERO(hwmon_dev);
+	}
+	return ret;
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
-	{"sbrmi"},
+	{"sbrmi-i2c"},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sbrmi_id);
@@ -343,15 +197,16 @@ MODULE_DEVICE_TABLE(of, sbrmi_of_match);
 
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

