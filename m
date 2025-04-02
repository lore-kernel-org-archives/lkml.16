Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B9230BE5;
	Wed,  2 Apr 2025 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573576; cv=fail; b=fXzb9xIDEbRSY5CRCHgIIwkItbGsVmbznGOtvzWWE9YaZh51olZMqMxYtR66KO0E74UVUA+FbAw1qxcv5QZEdqCj6oyKVImDqTNKSfkVPXfQSugjfFafii17S46TgMB7VEs3ldn22mBRNaHvpzSQz0ZRqTd9/9iqyL2moxccPSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573576; c=relaxed/simple;
	bh=kiXA1cmv2+zuMr7SKEmVP6P+E+882uN9ButOlk8YG+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GDzaItWQ6kLBhgjcExU1vSS6PSK034jgg4opH5mEYOLcmENC1EGE29D2QXAd+E3JxrCmElt626UGlLhUwq4UN+gsXksVouyVIBlbTgLIQY5+cJk9Kfxa3j4C77ilawBX6zzRH/hdxPVMYBHT9SRZ1lISYaOZFnWWX2IY6Mst8BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NjiODRHM; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NjiODRHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+4cemp4zU98c6LXTUHWkIx2PytdeMe+e5WCHoREmAeLUd7WpD9emAJokeBtYhztm5na9i3/DIDUm0Gy7ySiBTVo1U8SwD5WXnekkytlPpEVadm0c1D8H5xltvTiSmtM6dr6c4DKL/zQXgXBUWi4Qz346Bv/BAdV6f6i7mMCGJwXLyfOsASD9r4hlb7RoxKeUGtr1EdUBvEcwK7Ct01gSZXUw9/HAn8pvkP9jYRIu2Bc/flcfGY9uj83cy9q21ah9AvsqZK1wvx56pmBIOgVo2B9LFF/4JOdwtLwf/NF/kaOp9rY5u2CJIbBAweV5+WLZJD7i1/dGFbgJz66MfZBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DFzniwGu7byRnkEFJ05gJGg8up/IZavd08jHbVEiFU=;
 b=cB8sYGeXAebWHtwZklVPOhQIEEibTHJ087nbOLHexoFTlvMatzh4tWsZELMEAoFFVwbXFswtgQGqF/RFY0kYTBUOMj9xIvClD1Gaj0MbC+0fOU80BhOH1tXu32zTwVY3iLSQwlwq0lmN2Be5E2Z0bv/uMEprjXhrhbFR96r6eiM6qB39v70dSKtSsKfAbJj5qoHJyuguqOCsJZUmGUhinU8oCI22hR5uYayYz1qe9/LKVOiGr7qMFvX9U2H6RZKJGfRUFn9HL7q2R6QwfPBb2dGtSILbH8R/65hTPSHlK6cWiFGiEYs9LNlnx1EddYfzVQvS4XsR+La66XNJ31t7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DFzniwGu7byRnkEFJ05gJGg8up/IZavd08jHbVEiFU=;
 b=NjiODRHM4KbE1qEwbtNUNdFr94X3b99yhhp6zDCdZxJyu5+XUKItOLdl+17l2lADClC3KXjFuUzaDkhLAF1mPOjVZe7EFO3QOe6GznhErEUIpOZpl0WIarDsZmAVTJFryY4x81D4r/W+9TaEagR+eBRYUZnOdszLb/EPF/JDBqo=
Received: from SJ0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:a03:3a0::7)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 05:59:30 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::8) by SJ0PR03CA0242.outlook.office365.com
 (2603:10b6:a03:3a0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 05:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:30 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:26 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 07/10] misc: amd-sbi: Add support for CPUID protocol
Date: Wed, 2 Apr 2025 05:58:37 +0000
Message-ID: <20250402055840.1346384-8-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 27616768-3e77-4269-47c6-08dd71ab88bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+5uSltcoWyEyVZC8QgG2dWGuTeklYUbIgvF4uJc4ROQ0hGSx17HdUHs04BNn?=
 =?us-ascii?Q?Kstr12Aqx5rx04t59AJHHuQaJxQnqjJOs8SobYPh8QqxoLTnf2hbWMSiTFqP?=
 =?us-ascii?Q?AdgxzgiDDnk80hHAs9bc5bNt0xsAWcVH2/1X6CKpkqgmfL1ajjOcMifae3l+?=
 =?us-ascii?Q?HBnSvMQx1RFOCrMv0sgU+pzj0/TSb8xkjUQ4xO+zFK2TmxO5pVqyjt0OH5e0?=
 =?us-ascii?Q?WLehYLHlR8RUAbzYYTq+hJOFiPQHZRkXoWIDdPGJhuNARX066FQ4DOm323tr?=
 =?us-ascii?Q?w3kkNM8gMVwN0L0b0exSE4fAACoRj5xMK98JXWtfFs+4E9+44hgOoOLULVRP?=
 =?us-ascii?Q?FKPT6dSSnMDibA4DGmcqo/VTz96nbPZTwbu7EPmVB+JmOq0+Nh2043EZ2krR?=
 =?us-ascii?Q?ztl03JFuxYVuK3hjukf12ETda6KO2dNPlYK8lu8Ry4pbs6wZTQKUPWjCjkEu?=
 =?us-ascii?Q?rHj+1NW9iHEfYOfl5VrBWsgCpaA4r/2ANtl1wMmsLk1+ja4a0UtvNQ8FHg6L?=
 =?us-ascii?Q?98pBpiURM+vBHSqhZtIO/AsGfBf2yWp3FlshjHHLrueTYaGuV88uGSE6PPxZ?=
 =?us-ascii?Q?3P2eQqM8bqA1BvNWi8t+DJ1AAv4ZnjzGZcyOG3LJppHyXPEm2R5f6gosT/pj?=
 =?us-ascii?Q?BZ1wZRZdXkbWgTbmrdzSzyTAMeEWjeJVKHqNhbpvjgwyOBDLqFcovzTfNvwF?=
 =?us-ascii?Q?QwCpOmhhdwctWvhaNQlE0vxXXplHu5i9U4R2z0/Defy8WdtFRzECDye4pv6Z?=
 =?us-ascii?Q?h68S33R18K9V9bLNtc51EHOJqbHwM2kP9qUZu3e9dus/Q7ahOVCPJ6PmQU/c?=
 =?us-ascii?Q?h/vjbs30YH6Yy92h2DAvZpyHH/8K0Wd3/9YzUjuuH5MrQjKMsGz/RNlvjgJ8?=
 =?us-ascii?Q?c4YV7DhOKJK9MF3oGSK9kJKSSNpzZclFE4NhtKjdA1RBxj7eNTPz506qQ6iH?=
 =?us-ascii?Q?f0lieuvMy/y4NrMGcuUPgbuwyrAfKQ90/yqEevnmrNJdq3PY6pz8CQHeGBJT?=
 =?us-ascii?Q?0hKTyi6KROR6tH3lCSerEVAJBQmd8ATBg6OkxqMRmR/WWa2uKeISV4gmZnSS?=
 =?us-ascii?Q?G71KXH9aUp8v8FUf3whE0S4cPtw6akdTiDas2p6O4QEXbxEoIbth5V/LM6j1?=
 =?us-ascii?Q?Rfi5exaOCDbguJKUvLHoXdLIFF9/4ouboNzdwb+A4utzMKSUWg1mITuPCKiT?=
 =?us-ascii?Q?JabqVdoO2X8nL5fwyHAj6qvF5kecDCPMSvaRWOvtqgVMdov/xLaLJlqx7K36?=
 =?us-ascii?Q?J2HtvshZ8hh5rmoE0VbT5NGXOQD3qH6iE1xowx7kI633Yb9W9YnbsQyyfKmA?=
 =?us-ascii?Q?x+oRNOnss09BAvN89olYrRKGmKijY6/Eh3QMGjmVdinAs1qbfCXTCoeCC366?=
 =?us-ascii?Q?QOWl0mQQAzVlvNO8mwoPNqQCUSJAuLlKtKWLdo9hNSxHAa5OApPYum6hEamF?=
 =?us-ascii?Q?68v6D6KFsMsIexTUi4EeHhgg8vvLbMNl15MK/goh+wmj6Hhy2hR2dTz+Aonn?=
 =?us-ascii?Q?8XL5P3bdFWadOsSTCkCBXxkrYv+uVt5nZKf2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:30.2368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27616768-3e77-4269-47c6-08dd71ab88bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

- AMD provides custom protocol to read Processor feature
  capabilities and configuration information through side band.
  The information is accessed by providing CPUID Function,
  extended function and thread ID to the protocol.
  Undefined function returns 0.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v6:
- Address Arnd comment
  - Add padding to the uapi structure
- Rebased patch, previously patch 8

Changes since v5:
- Patch rebased

Changes since v4:
- Previously patch 6
- Address review comments

Changes since v3:
- Address review comments:
  - update the #define to inline function
  - pack the union inside the structure

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- bifurcated from previous patch 5

 drivers/misc/amd-sbi/rmi-core.c | 148 ++++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h |   5 +-
 include/uapi/misc/amd-apml.h    |  18 ++++
 3 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 2dbd8c5b9a1b..eccde823aba8 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -17,11 +17,156 @@
 
 /* Mask for Status Register bit[1] */
 #define SW_ALERT_MASK	0x2
+/* Mask to check H/W Alert status bit */
+#define HW_ALERT_MASK	0x80
 
 /* Software Interrupt for triggering */
 #define START_CMD	0x80
 #define TRIGGER_MAILBOX	0x01
 
+/* Default message lengths as per APML command protocol */
+/* CPUID */
+#define CPUID_RD_DATA_LEN	0x8
+#define CPUID_WR_DATA_LEN	0x8
+#define CPUID_RD_REG_LEN	0xa
+#define CPUID_WR_REG_LEN	0x9
+
+/* CPUID MSR Command Ids */
+#define CPUID_MCA_CMD	0x73
+#define RD_CPUID_CMD	0x91
+
+/* input for bulk write to CPUID protocol */
+struct cpu_msr_indata {
+	u8 wr_len;	/* const value */
+	u8 rd_len;	/* const value */
+	u8 proto_cmd;	/* const value */
+	u8 thread;	/* thread number */
+	union {
+		u8 reg_offset[4];	/* input value */
+		u32 value;
+	} __packed;
+	u8 ext; /* extended function */
+};
+
+/* output for bulk read from CPUID protocol */
+struct cpu_msr_outdata {
+	u8 num_bytes;	/* number of bytes return */
+	u8 status;	/* Protocol status code */
+	union {
+		u64 value;
+		u8 reg_data[8];
+	} __packed;
+};
+
+static inline void prepare_cpuid_input_message(struct cpu_msr_indata *input,
+					       u8 thread_id, u32 func,
+					       u8 ext_func)
+{
+	input->rd_len		= CPUID_RD_DATA_LEN;
+	input->wr_len		= CPUID_WR_DATA_LEN;
+	input->proto_cmd	= RD_CPUID_CMD;
+	input->thread		= thread_id << 1;
+	input->value		= func;
+	input->ext		= ext_func;
+}
+
+static int sbrmi_get_rev(struct sbrmi_data *data)
+{
+	struct apml_message msg = { 0 };
+	int ret;
+
+	msg.data_in.reg_in[AMD_SBI_REG_OFF_INDEX] = SBRMI_REV;
+	msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX] = 1;
+	ret = regmap_read(data->regmap,
+			  msg.data_in.reg_in[AMD_SBI_REG_OFF_INDEX],
+			  &msg.data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX]);
+	if (ret < 0)
+		return ret;
+
+	data->rev = msg.data_out.reg_out[AMD_SBI_RD_WR_DATA_INDEX];
+	return 0;
+}
+
+/* Read CPUID function protocol */
+static int rmi_cpuid_read(struct sbrmi_data *data,
+			  struct apml_message *msg)
+{
+	struct cpu_msr_indata input = {0};
+	struct cpu_msr_outdata output = {0};
+	int val = 0;
+	int ret, hw_status;
+	u16 thread;
+
+	mutex_lock(&data->lock);
+	/* cache the rev value to identify if protocol is supported or not */
+	if (!data->rev) {
+		ret = sbrmi_get_rev(data);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+	/* CPUID protocol for REV 0x10 is not supported*/
+	if (data->rev == 0x10) {
+		ret = -EOPNOTSUPP;
+		goto exit_unlock;
+	}
+
+	thread = msg->data_in.reg_in[AMD_SBI_THREAD_LOW_INDEX] |
+		 msg->data_in.reg_in[AMD_SBI_THREAD_HI_INDEX] << 8;
+
+	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
+	if (thread > 127) {
+		thread -= 128;
+		val = 1;
+	}
+	ret = regmap_write(data->regmap, SBRMI_THREAD128CS, val);
+	if (ret < 0)
+		goto exit_unlock;
+
+	prepare_cpuid_input_message(&input, thread,
+				    msg->data_in.mb_in[AMD_SBI_RD_WR_DATA_INDEX],
+				    msg->data_in.reg_in[AMD_SBI_EXT_FUNC_INDEX]);
+
+	ret = regmap_bulk_write(data->regmap, CPUID_MCA_CMD,
+				&input, CPUID_WR_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * For RMI Rev 0x20, new h/w status bit is introduced. which is used
+	 * by firmware to indicate completion of commands (0x71, 0x72, 0x73).
+	 * wait for the status bit to be set by the hardware before
+	 * reading the data out.
+	 */
+	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, hw_status,
+				       hw_status & HW_ALERT_MASK, 500, 2000000);
+	if (ret)
+		goto exit_unlock;
+
+	ret = regmap_bulk_read(data->regmap, CPUID_MCA_CMD,
+			       &output, CPUID_RD_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   HW_ALERT_MASK);
+	if (ret < 0)
+		goto exit_unlock;
+
+	if (output.num_bytes != CPUID_RD_REG_LEN - 1) {
+		ret = -EMSGSIZE;
+		goto exit_unlock;
+	}
+	if (output.status) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = output.status;
+		goto exit_unlock;
+	}
+	msg->data_out.cpu_msr_out = output.value;
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_message *msg)
 {
@@ -134,6 +279,9 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		/* Mailbox protocol */
 		ret = rmi_mailbox_xfer(data, &msg);
 		break;
+	case APML_CPUID:
+		ret = rmi_cpuid_read(data, &msg);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index e3a11575d19e..3f2c1c6b22d4 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -15,7 +15,8 @@
 
 /* SB-RMI registers */
 enum sbrmi_reg {
-	SBRMI_CTRL		= 0x01,
+	SBRMI_REV,
+	SBRMI_CTRL,
 	SBRMI_STATUS,
 	SBRMI_OUTBNDMSG0	= 0x30,
 	SBRMI_OUTBNDMSG1,
@@ -34,6 +35,7 @@ enum sbrmi_reg {
 	SBRMI_INBNDMSG6,
 	SBRMI_INBNDMSG7,
 	SBRMI_SW_INTERRUPT,
+	SBRMI_THREAD128CS	= 0x4b,
 };
 
 /*
@@ -56,6 +58,7 @@ struct sbrmi_data {
 	struct mutex lock;
 	u32 pwr_limit_max;
 	u8 dev_static_addr;
+	u8 rev;
 };
 
 int rmi_mailbox_xfer(struct sbrmi_data *data, struct apml_message *msg);
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index d0c548e34150..1ae952785112 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -7,39 +7,56 @@
 
 #include <linux/types.h>
 
+/* command ID to identify CPUID protocol */
+#define APML_CPUID	0x1000
 /* These are byte indexes into data_in and data_out arrays */
 #define AMD_SBI_RD_WR_DATA_INDEX	0
 #define AMD_SBI_REG_OFF_INDEX		0
 #define AMD_SBI_REG_VAL_INDEX		4
 #define AMD_SBI_RD_FLAG_INDEX		7
+#define AMD_SBI_THREAD_LOW_INDEX	4
+#define AMD_SBI_THREAD_HI_INDEX		5
+#define AMD_SBI_EXT_FUNC_INDEX		6
 
 #define AMD_SBI_MB_DATA_SIZE		4
 
 struct apml_message {
 	/*
 	 * [0]...[3] mailbox 32bit input
+	 *	     cpuid,
+	 * [4][5] cpuid: thread
+	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
+	 *	[7:0] -> bits [7:4] -> ext function &
+	 *	bit [0] read eax/ebx or ecx/edx
 	 * [7] read/write functionality
 	 */
 	union {
+		__u64 cpu_msr_in;
 		__u32 mb_in[2];
 		__u8 reg_in[8];
 	} data_in;
 	/*
 	 * 8 bit data for reg read,
 	 * 32 bit data in case of mailbox,
+	 * up to 64 bit in case of cpuid
 	 */
 	union {
+		__u64 cpu_msr_out;
 		__u32 mb_out[2];
 		__u8 reg_out[8];
 	} data_out;
 	/* message ids:
 	 * Mailbox Messages:	0x0 ... 0x999
+	 * APML_CPUID:		0x1000
 	 */
 	__u32 cmd;
 	/*
+	 * Status code is returned in case of CPUID access
 	 * Error code is returned in case of soft mailbox
 	 */
 	__u32 fw_ret_code;
+	/* Add padding to align the structure */
+	__u32 padding[2];
 };
 
 /*
@@ -61,6 +78,7 @@ struct apml_message {
  * The IOCTL provides userspace access to AMD sideband protocols
  * The APML RMI module checks whether the cmd is
  * - Mailbox message read/write(0x0~0x999)
+ * - CPUID read(0x1000)
  * - returning "-EFAULT" if none of the above
  * "-EPROTOTYPE" error is returned to provide additional error details
  */
-- 
2.25.1

