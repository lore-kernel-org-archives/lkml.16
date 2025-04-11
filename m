Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4E1F236E;
	Fri, 11 Apr 2025 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378336; cv=fail; b=OEaw/B0eX2RYlBnuRM8MH+/J3s2cPX8FtxzVCmpYMTXiv7zYFVKEYvUNNb4r1LXyGngE61/q1scX5hzZrXZv5lH3Um2jZtoeSmUfqhDgEkK8f6JWSznKEO8I4I/uYwp4LnPrORvtpTpvx0sAL4RqDl5YkZmgvjvGhQI5jyyQQ8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378336; c=relaxed/simple;
	bh=8opl4y0hnuZ9gx2dEW2/a9TrekbQPLO1eMV1qq96I2Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTmWgISufjonYP8GHB8irIIFdviylLlRWQqmqAit6ENMmjnP1us5iyH344/GbAg93BW5b+9fHrdxcaZPhHv2mZt6pE/rLD1VIRy4sAfENI4TS9uJljnCKNKi5kkO8CfFWE3VOjgqzfizHCRwCOFMo3ar86sOg1whIEgHpc5oRYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rVVLyKnE; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rVVLyKnE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ79Y9KI7MnFaK1JGQ2Xjcu8JJDG0PD7azvopKPOcWQ2s1mk16gfdANGpxy5BMDAXRgWkzyqQKTwKXpRgdTgY1uqQooni/ZhuB3JT48BXeljufFthEYVTE17+yuNkbT/82tw9cZpupA1vIl7Aj5NOLecJpvOauFSfNNhBw+62X5tWjPE2aPMxMDIpnK/5TMbDwTgnT75co84tvpJ6MY8BaxPEC2JVE2AvnkrKs+37ydEFxZQrPJqOttlz8ToAmA0L/cm0qc1WkC8ii6k8lyjUWlrRdMO/6DP+vmW/LWb2s/+MrH4+feG1zvH7c7vSs80vdneG2Zo1/j8tmcvBfURVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LENG8yRUDJ2eVDDiT8rg4/91BvisxWe9lf7dFLhlMyo=;
 b=AOyJJ6yU7nw09M4dPburnQsLQoG/HX4S5UfiFfM+a0FRYaFJo3tkCCXbYwa3malQTs2WlQHxCqHwjIk3m4V5rw+AAyj4NSGXHTja+KdgtKke8YW2R+yNbsB2Mf/Zkbr32v/kczcTc8l4QIMLYsvxGZydfuPyGuIng9qDIgDZvjOp6Aop/YGoLif6k75eZYMyvomTKxe3DzQo+gDNJUugLncN2KiG/fz/qU7QBbOWVs2wtwBh1gyMQ1GFVqKcxOILPpSu7TexdQtXWF37733PIbRIEbxOXGxqjLeVBht9utSWqFjA6Nzl+WQjhu4JDwFUfZ7xFL7Prcal3SxAr/lhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LENG8yRUDJ2eVDDiT8rg4/91BvisxWe9lf7dFLhlMyo=;
 b=rVVLyKnErCee9LbfXd8AYLPZzamwMLBubMuiWqUZtPtMhQJ9AK/iv+iYrl4RwsNmAS2qi0ptR1fvTRJViyD/Dv+KBecx/MiXljsGjUGw8gaOfBvVXV6g5esj5ZflCXNY+uFdMeBtxMj5/7vPQtJ8/y2U/qSE01bo5bRdhkRhE5I=
Received: from PH8PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:2cf::21)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 13:32:09 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::94) by PH8PR07CA0026.outlook.office365.com
 (2603:10b6:510:2cf::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:32:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:32:09 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:32:04 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 07/10] misc: amd-sbi: Add support for CPUID protocol
Date: Fri, 11 Apr 2025 13:31:19 +0000
Message-ID: <20250411133122.1806991-8-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7d4d7b-99aa-4aeb-0883-08dd78fd427a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ymDqY2sAdAh3M9qOHiKOvw2bSTDmVqtKIIq4cbkMPZizDOaqFuKnTFxHzo1N?=
 =?us-ascii?Q?iqy5Os0OXbYs8X/43UkgYPkM6cMImyQmqP3xmE17grgQoL2syCbHSPr3mpPM?=
 =?us-ascii?Q?4cWNLneZb0oukjKK/b2SSzVIDKuC7DFV2YKP3s4OHiRR2T1Su5z+aHJDXB/W?=
 =?us-ascii?Q?sA4ApJbIA1xOnL6oUBG+h4qt6YWilMVx+QShIiAjLw/yMeAstZyJuGgA7w/z?=
 =?us-ascii?Q?P1euWFtQa5iPY0jGCMti/77iJMX+1c+LXlQkj74kbCeogdAvntokJhJ5TfoO?=
 =?us-ascii?Q?iXWuvABqXYTXG2+GRBGr9yxjrLfVC6VrB/qedvcwio065S4qqe7dqdi6FPn3?=
 =?us-ascii?Q?5XLKvTTPchASE3It8464QyYayA6VcytGugnacahadyaI6hLEi12xd1x19glZ?=
 =?us-ascii?Q?SYhYiYz1iKA7+6ootzXoKcCPqP2Ca6nTbakHfd9fLRuo3Ii4ADkYDC9CiMQa?=
 =?us-ascii?Q?r4Bk6gVBSnKq6peVodhaIm6621BacWnRp24S1CJxc4SjlTannV4CAImGQT8S?=
 =?us-ascii?Q?R61HGB27P3jCpEqca6xE6w16sUhI/VcwK9zffDZi7sl37OE8vGxyZiy8nNcW?=
 =?us-ascii?Q?v3LwFG2WJH4DoxhmqJ/ZvaXA3Jc46V1ID66Z3yCsws2I7TsfEdDWpjT1nT4R?=
 =?us-ascii?Q?MQgiCLg307l2cmD9U7ID5qdUlYFmD0vLcE5n4c9NboJbSft+MNVky9CGq9Ot?=
 =?us-ascii?Q?+D5T/yXqq3UPH3aHt6sGoAUoAvgRswbFhGurBeNbMdAKtQpFT6IPFgHQfSA7?=
 =?us-ascii?Q?nb7lVmboVGa/MyR1pE28FdY/wSCQ2++gaKuOa5qSoID211tiG8Foguzcf5vQ?=
 =?us-ascii?Q?6yGAd9i5IDSJD6t733J4jboDECFjBYm4HVjm3Ny4OCt9nFQ5dYrcoz7jGOfp?=
 =?us-ascii?Q?ZW/1n276YRCiGGZ1tripaqB5VxRP3JdDY+3t5TGnGOZ/Xa25Zia9oewDnBx2?=
 =?us-ascii?Q?w0Sln4fNTJDvBJiUj29Z2eDAc7gMCXSPD3GTNuvc2R5snWiV7WvmZGG7reTA?=
 =?us-ascii?Q?hdIsti92dkkm9Dw6LYge6P2NoYPQiRuTiPzNpRl2ngxUA/vctzQlWs1K1gnS?=
 =?us-ascii?Q?D1AxghMWa0nyyJWlqYR/r9T6e9z8TNn88TDBs/JaIpsFK53HKxhqTK5PrwdI?=
 =?us-ascii?Q?8hn36CYOix4ORgy2DYgeKz+GXdUGzf+bkbnbUXUSMtVGR9b9ty5FQX5luLdA?=
 =?us-ascii?Q?h9Xatfs6j77wCA3xuo8w0ToJmS0Z+8SSYQuQ6ckHJjafwp18frO5RsKNzIAX?=
 =?us-ascii?Q?+g90zpRCsUeVFaDReCYvESt4A5Y0trv8AAuLj/cuJrTKz5OWknh55ysTWq0x?=
 =?us-ascii?Q?kHNMofZGqkvQ2KNTkgprvDvxISFviycmO0x3YXb1ocKxk6GR/qsvaJyIVu09?=
 =?us-ascii?Q?1XEHs9FoJsCSByCO3os/wfKvujMWktT99Jy/BTvy3WBrTPAXKS3YhHYpDQAB?=
 =?us-ascii?Q?loWKjndW+9XuV3ulFt+TN5uaVhxybhV0apmsltDFTCP1mQ3B/kOtAsOm7alj?=
 =?us-ascii?Q?hxcTYqwy7nTlb8pQAR3DB3cqiOOr2+9ihhaZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:09.2268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7d4d7b-99aa-4aeb-0883-08dd78fd427a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

- AMD provides custom protocol to read Processor feature
  capabilities and configuration information through side band.
  The information is accessed by providing CPUID Function,
  extended function and thread ID to the protocol.
  Undefined function returns 0.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v7:
- Address Arnd comment:
  - New IOCTL and structure defined to separate
    ioctl for each protocol

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


 drivers/misc/amd-sbi/rmi-core.c | 168 ++++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h |   5 +-
 include/uapi/misc/amd-apml.h    |  37 +++++++
 3 files changed, 209 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 7d13c049c98d..471f50f0c368 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -17,11 +17,160 @@
 
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
+/* CPUID MCAMSR mask & index */
+#define CPUID_MCA_THRD_MASK	GENMASK(15, 0)
+#define CPUID_MCA_THRD_INDEX	32
+#define CPUID_MCA_FUNC_MASK	GENMASK(31, 0)
+#define CPUID_EXT_FUNC_INDEX	56
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
+	unsigned int rev;
+	u16 offset = SBRMI_REV;
+	int ret;
+
+	ret = regmap_read(data->regmap, offset, &rev);
+	if (ret < 0)
+		return ret;
+
+	data->rev = rev;
+	return 0;
+}
+
+/* Read CPUID function protocol */
+static int rmi_cpuid_read(struct sbrmi_data *data,
+			  struct apml_cpuid_msg *msg)
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
+	thread = msg->cpu_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
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
+				    msg->cpu_in_out & CPUID_MCA_FUNC_MASK,
+				    msg->cpu_in_out >> CPUID_EXT_FUNC_INDEX);
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
+	msg->cpu_in_out = output.value;
+exit_unlock:
+	if (ret < 0)
+		msg->cpu_in_out = 0;
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_mbox_msg *msg)
 {
@@ -123,6 +272,23 @@ static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __use
 	return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
 }
 
+static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user *arg)
+{
+	struct apml_cpuid_msg msg = { 0 };
+	int ret;
+
+	/* Copy the structure from user */
+	if (copy_from_user(&msg, arg, sizeof(struct apml_cpuid_msg)))
+		return -EFAULT;
+
+	/* CPUID Protocol */
+	ret = rmi_cpuid_read(data, &msg);
+	if (ret && ret != -EPROTOTYPE)
+		return ret;
+
+	return copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg));
+}
+
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -132,6 +298,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	switch (cmd) {
 	case SBRMI_IOCTL_MBOX_CMD:
 		return apml_mailbox_xfer(data, argp);
+	case SBRMI_IOCTL_CPUID_CMD:
+		return apml_cpuid_xfer(data, argp);
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 8ab31c6852d1..975ae858e9fd 100644
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
 
 int rmi_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg *msg);
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index a5f086f84b06..bb57dc75758a 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -25,6 +25,24 @@ struct apml_mbox_msg {
 	__u32 fw_ret_code;
 };
 
+struct apml_cpuid_msg {
+	/*
+	 * CPUID input
+	 * [0]...[3] cpuid func,
+	 * [4][5] cpuid: thread
+	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
+	 *	[7:0] -> bits [7:4] -> ext function &
+	 *	bit [0] read eax/ebx or ecx/edx
+	 * CPUID output
+	 */
+	__u64 cpu_in_out;
+	/*
+	 * Status code for CPUID read
+	 */
+	__u32 fw_ret_code;
+	__u32 pad;
+};
+
 /*
  * AMD sideband interface base IOCTL
  */
@@ -48,4 +66,23 @@ struct apml_mbox_msg {
  */
 #define SBRMI_IOCTL_MBOX_CMD		_IOWR(SB_BASE_IOCTL_NR, 0, struct apml_mbox_msg)
 
+/**
+ * DOC: SBRMI_IOCTL_CPUID_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_cpuid_msg
+ *	Pointer to the &struct apml_cpuid_msg that will contain the protocol
+ *	information
+ *
+ * @Description
+ * IOCTL command for APML messages using generic _IOWR
+ * The IOCTL provides userspace access to AMD sideband cpuid protocol
+ * - CPUID protocol to get CPU details for Function/Ext Function
+ * at thread level
+ * - returning "-EFAULT" if none of the above
+ * "-EPROTOTYPE" error is returned to provide additional error details
+ */
+#define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)
+
 #endif /*_AMD_APML_H_*/
-- 
2.25.1

