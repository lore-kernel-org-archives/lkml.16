Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBDC1A317D;
	Fri, 11 Apr 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378315; cv=fail; b=KGNyeqQUDyrph8NmWZMM96XUZ0vYOx52k1jJOQnNiXQBCvjNSaKpzOLXj9DN1cF1DChBVViUY26ccwl5NpDCCqffXhpVe0E0ffT14d5QKYkRel8VjyqfAlFRv9klxEIBeL6dK5cPrBtcUcgxJsNNMzD+kVUtN9pPksUPIm1g4rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378315; c=relaxed/simple;
	bh=IO0EYlJ7bsAoCuzlB3+Wkxv8GWeMj39k89pPIF6cYP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6C/AsS92SNL7v33KNUzsENjKD5SZGacsXlSUPkIdZHJ6RTxDeD7toSgpRyIGvnk+NtzPXbx9d6hJLjgvDB15jXQP+3sBn5yNJAX2yuqeuQsSgTO402UuPxGJDgtfLeDXQzlJaDPZPnBfPrZwptXjEwl7HDeM3x5KnNDfC3fT6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CFWFhu+z; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CFWFhu+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZm+Oamv933T2fY6fRObg7L6BmQXqTKIBNiE8nQni2kx6SBQ8Igh4Q3Tvxb/bh9Hn/vkG6kl3c1vAQC3z3V4o4wbjm5COka0xrmCgcmNMfICLTnRvaBmiujOYxrxzOgi79zFSuY5g/txndLPZWQWgK8STAP4BNX4MewGaecR7AOFSqg1VZZeaEvBi+c7N5e4JZczg+ImZbKN5HwSdIwHHwHGwPjK/QeAM1p4LoiDAwsRJRw3FMB6Bcloup4AvcKdap4DA+CWRWjuLqpatje+ura7o5Vg4iKoiPaGG+x/7aBE3oXiLhaY1dNquPQvviFHUt0/Fz7ng7GWWGoCJxIG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh7Vj4unT+uQoXiK0FYJz+e6kYTg2ceSDEeFnOH0FrQ=;
 b=p5tPdyGclldPsfk5bTSkUH0hPNlmHEvXQiA+vJSUtjzPrvcmBuK//xi37a3NJxBXk4O2WOiGIa/oNkv+fgEvonRMJY4DgSS059L6GtWlgBWxPPWc4nWcWFW0eBrqiAno7Na+ILW8AIEQG4xGcnEhjV/ahaoq/88G/6w7z4wjoKD82ct+KQ6IEtiCd8slBK06dVzMfNKtJKSoGvM+nsS0X0DSdT62dPqsbWFF0XtNHFeTU6w8ozOTYxdysD1dE+1mnyq2wnGfb6MX2MOQ4p69dhhet9nsiaSA6tcqj1Q+95ErfBj431x1c9UiBJ52auqOBG+8fVPLydmMMfwKNCkk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh7Vj4unT+uQoXiK0FYJz+e6kYTg2ceSDEeFnOH0FrQ=;
 b=CFWFhu+zoCcWInJQENOsrZcRAcNPI+emat56HNCPi++Faf2sDqvGdvbMprhV1unLqQr8nS9hGJGuJ6wKJ+Y86xtxenLN7r6MWyX8i2BdALPj5TwPrvIfCJwXtitBO4upvDLivNAMBEbcLR+pGaZWDK0FjjwYO6pYkx8l4a9U6I8=
Received: from MW4PR04CA0107.namprd04.prod.outlook.com (2603:10b6:303:83::22)
 by PH7PR12MB7427.namprd12.prod.outlook.com (2603:10b6:510:202::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 13:31:49 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:83:cafe::13) by MW4PR04CA0107.outlook.office365.com
 (2603:10b6:303:83::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 13:31:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:31:45 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 02/10] misc: amd-sbi: Move protocol functionality to core file
Date: Fri, 11 Apr 2025 13:31:14 +0000
Message-ID: <20250411133122.1806991-3-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH7PR12MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 74274f77-44aa-48bb-a2eb-08dd78fd365a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lZkuY0bC93DjlbeGw6YVDHihm0Kyuk3Lcfwkj3TzgYcl5N7ED1+PAxQf20g6?=
 =?us-ascii?Q?HGzvQPa3zhmNf/4kZp8KYPAh4bxVaKSL1XNBiFxMOTykYXib0gf5Xl8+Hmph?=
 =?us-ascii?Q?w2ljePfLBCnjyucdjiFZoJolTOuqXwrwNp4uJhOeGQDc0VISqUeSfv2JtFbQ?=
 =?us-ascii?Q?bxdw4Vej0QVIcRiz5aBEqhb02f148ypVHJAOklI7xkcbz8osR7Oqiq2dkdgL?=
 =?us-ascii?Q?VirPTCu4vfBGdXpqHEOXeBnyl1SLE6K2XgvwfpkRYFxRn0mSbC0r/XIbeXjx?=
 =?us-ascii?Q?Lr1IaKNQoNUdzTpGHVca8Z3mBZVSWnDEQnlY9EmwOFJsdEiV5RTN1nljpt+M?=
 =?us-ascii?Q?IWbnMkFs2E9TDK47Qz8GQxgS5mtiBKR7H/HCkF7UYcjeiW+rV/QvG/zCQfmL?=
 =?us-ascii?Q?GVvyf2zY8VFdTYmKCCRDjyrT50sRCtvNyMPBB2Lh1qFcX04NhLNaYNskw9UM?=
 =?us-ascii?Q?5wxrS5g0r5NA8aVmVdyY0TwauZkT1NBhNp3ozmGpNcXJNi1wu/Gg8iSKXJ0c?=
 =?us-ascii?Q?EBx1eK2t9yS82uOMb4+Rrt8AV5Q8BSHFwFTl6wYsPY2PJNT27SPpl5acCVU/?=
 =?us-ascii?Q?GCe06BT5Re2Y1iNeobAdYdUX+RnUZBSL7HuRo8aux5ckcI/07mFdEyqoy8We?=
 =?us-ascii?Q?kZQZRQt5RcUzSxCGFgHARBt9Ufk6TGFbCNVodm+2ZH/tQelg/Sv/TnXSrtrj?=
 =?us-ascii?Q?eRB2HS6ehWMVUHXRJu60axQ+/isWybH9ypASCuGQBVPCEtRbfQwL/QPPo0kU?=
 =?us-ascii?Q?egC2ByaqMRQTBW7ruzyiaMDtXrRpcHivtc5Tp76HTCEzCMHN9++T0BiSAFpQ?=
 =?us-ascii?Q?Mo/nHg7DzqHghZXbJYliRC7RPD/IZai7+Kr469omM/Le8OR6zVJ0X7JGoRNf?=
 =?us-ascii?Q?/QtUHxHN4Qyxs0Jzd/kW0SJPZM14QmPFwaIdJnCmwKLFnoH+sFfxJbVi0Wei?=
 =?us-ascii?Q?8Rwx5Co94Y43KtuL3pnsmo/QeZ+pQYMxWSixcsWIt8To94HPnyNigznOBIXs?=
 =?us-ascii?Q?2cpbOktAlVHkymSOuktqZFEz3DNk417YRaelftoWLYZR36PM/xUV28papGBy?=
 =?us-ascii?Q?XHGRbgjQDaFvN4N7cSV4oBcCnV9G+mOeZKma5vJRGG5XBlYz8+q+gGEQMOUQ?=
 =?us-ascii?Q?dOXgJs4NkVRs7Te+DYNoOePvjvBLAN8sA6mRgxhuxFiZuheO3kBeC6qgzCCw?=
 =?us-ascii?Q?JV/pIqLnujnu3hFOVfZsOjSA+CNLDytFzQbL75zJiVUR3bYBY3MXl7Fo3soZ?=
 =?us-ascii?Q?tSmYKcK+SmD58yJE8Ir2IgNeA6M7591KhuJ5q65BglsIi9/sp44e6NrQTits?=
 =?us-ascii?Q?8cFG0MPIiNJdX+nV4CQMhL1bebHbF5gC85ZtAzI9QAbUHzQp3JMQFChgW1EQ?=
 =?us-ascii?Q?6HLWDGL7reo+xUIq3d3bBofIN8a0ym+4ozziCtZ8jNnm4ZiaFjPSTZCfTXTW?=
 =?us-ascii?Q?5o3t63OOJ99CoR9gXb+kFQaSjQ56OAFDOWTk3NIuoyeMxNGbE3l7xN7D1WKb?=
 =?us-ascii?Q?GnJ3ak7caT4Gp7FiXiVEBoL+K7PT4CO9nzfL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:31:48.9040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74274f77-44aa-48bb-a2eb-08dd78fd365a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7427

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

