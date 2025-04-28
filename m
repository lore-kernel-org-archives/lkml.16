Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F9610C;
	Mon, 28 Apr 2025 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821892; cv=fail; b=j811ZMC0wBqZXc8O08JKdou8TcIV1myZF+8ZAV7t8LLlXW7CYWEz3EATft7RxSHCT8MUIK3vSOtVEhFhMdc6dlCVnCkVlGr1OgPXWtR30hdTFmNmZm85KetBho6Jul7jE1kZm9EHQ5z7tuuvn70eZQXDb2O3tTmpOTzQzP/eKbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821892; c=relaxed/simple;
	bh=0ekX2teoGyjbkOhLud3zXWMIN40wL0EBsyfUCg2XIho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ite6I1+cDxzkBaMJR5yj6IJstP2M5tvzWsUWYYaZMgKrYGSsPP80ZXpDkieH8LmvBioh7vhLZdjaQj9IiTzSXjUygQm9MdVpG1eazwQy7S3hEOpQ2bUyVjbfBHkxjzg7TBZqFIlhj+pYH6bGUmL9EFpNF/OEYuu6x37utN8zF0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FnpFfR+l; arc=fail smtp.client-ip=40.107.93.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FnpFfR+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTmGMDCE+ltcorWPcUX8rwSXbgbdVnkfLdLDn9Pv2yhKh0nusBfaLrw0Wk/TRCbcOAlhn0VcBcggJqVnzTDYJ0ZDzU7DxH1HAsvsLL0gJVYj3By2a9YfnfTtRTtEX4kZhQ695armZbG8hDtUlD9I1fLYGMMxgejzXDQmWVKp+NRYG9FPSCdRA36WqSqS0mNBXAdRTuPu+wNWaINvptM3aef/pyFcUdUz3ahWG8wdVe4HbcRJz5sETUk5Oz3IBLR9bMjbSAF1fyuXLxJmI3xH7nyGSfigW8zUg4z3uSfToTgRfpPIrTeU6f0byGARbgrybmdFPPhGauDWYH21gPUkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+Zs9DGFr+e2t1LrIK3wxWePOb4KFd4Bq7S/aiOPqyc=;
 b=R0Fnh7jX7ns1GEPa7PubgLCxDdioCw7/SKB4qLzoBgBH34yaxQGPYwRHg8nGKptxZ5e7YTW7MhkPQ+CiWPafVJ+zgU6+04foZFfvq+uEoYcHQsQjcQ8Kyw9xN0gRHXJxTvtgJKLbEWGGpif3jcnf6jF4+H8QW5T3/+pthOLyJIt5yLyxAjsNWy/8E0EMuWTj3+a993M9cA8nrx5XjFs4yh7rflAXxPxN0F3euAeoRbUkh4a+QaOgcO6/s27cKzH+a8biZXcmH41B4alhDriu2EQ0IteokG3KwmBJGFhgmlDmW/jVAdFEHx8tvwFzsuX9FGSjwLTxRAOTcPtFUPR9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+Zs9DGFr+e2t1LrIK3wxWePOb4KFd4Bq7S/aiOPqyc=;
 b=FnpFfR+lC8HH0+vpRtgYs01zQwG4UvHKEkdkygSVURejlT2i21zhiQ9w8lDK85C5gjYWGG5b4xBhb9d5i0COZRmvnf5wa+lUprz7HCaIQiDmHUDLHeYZg0NXZsdKRszx1aNsTeOFORsTC8Q5T5Mu1rHT6bWtUTxDRFMAO+4qWcc=
Received: from SN7PR04CA0084.namprd04.prod.outlook.com (2603:10b6:806:121::29)
 by MW6PR12MB8997.namprd12.prod.outlook.com (2603:10b6:303:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 06:31:25 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::bd) by SN7PR04CA0084.outlook.office365.com
 (2603:10b6:806:121::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 06:31:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:21 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 09/10] misc: amd-sbi: Add support for register xfer
Date: Mon, 28 Apr 2025 06:30:33 +0000
Message-ID: <20250428063034.2145566-10-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|MW6PR12MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b93c326-cdf9-484f-2d7f-08dd861e4cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9dwtRo7wRDXWSeKrUw1ZKd464YnezRjr1dEH48qE+bgDAqE5gKjhsqeocTNF?=
 =?us-ascii?Q?Sr3piDaSEzc6ITcQ8akzHNpQh2zp/xjuQqxXkMhhHLX6dV+XbTRAJbf78QcZ?=
 =?us-ascii?Q?AomXnj3e+XzozE+gIuJfE++8qqCjtKZrfuSW+keoOSHO+9qgDWUtlz2sXTBY?=
 =?us-ascii?Q?RzDStPDnDiij9Ez2+SySXfzk4CaX6uRopj7SxanSb+CfwoyBM4PD/gIVxU3y?=
 =?us-ascii?Q?auzz/HQcaDo+86G23yDtJ5qRb4dhsq7N9RePgmPjgR4+aHE80IHsAbBWxaXu?=
 =?us-ascii?Q?NG9os2sfhNL2yiphZjQa5Z79fM52yg+3psy51BecpVwrRQjWa0S1kDirbri/?=
 =?us-ascii?Q?5E82SsS7N/lL2tpfxMVDoSBUpwf9FdEf+QCpMgasoN5fyT54tWL5Ksk5r6yJ?=
 =?us-ascii?Q?C0Fqik4BmoxbgaoFEZeTM9l2BuXh2WiF6XmhhTLrxFI0xGLCXyr/O/5hRl9b?=
 =?us-ascii?Q?hE3vGxHj7LcEx4cMcIwKlEuaqVVJ1WOU81SEIbQL2Oqb7TcQeYl/CJH1/Q7X?=
 =?us-ascii?Q?wbqVg3hCojm9uu1QDPj5V/OCrVfvSFI1CtAdtyYa/QuK9LCCV0GB5okFvMZc?=
 =?us-ascii?Q?avJVNlVtU5TZZw+4qMGTtt0xNNYcUdL/SA2nrIWnh9du0iMJHuSfbA+ewvVs?=
 =?us-ascii?Q?6s/VPltWYLWpc2J+Bbzddbcg9kQ1icq/CKA4VulW9LE/fEub3xHdkYjWMJEu?=
 =?us-ascii?Q?i5xIl/pz9FJQENZ8v+WAnC5yTcuZO77SX9F2KTD/yDmPdupzMcVJrbQ+l+h4?=
 =?us-ascii?Q?5SGZ7fO79yilImjqp1eAcz+0sDN+Kx/JKOR57uCgdwKKnlxSbEU5jOnJAMND?=
 =?us-ascii?Q?ZBWG/EDKqy4SXxN7hXRv/yCJXsg5vsJk+c4zSd/Gj0aZAkpA6LETqRar6VK0?=
 =?us-ascii?Q?p1GJXTEk1qSVnJf4kZdApDKbYPMqKA3KY9NIqXUlnanSW9DTlsVM4elqhd7j?=
 =?us-ascii?Q?0siqYHHgwDLT++IVdJQPVSESfLsgrvZZOf8Tl7obj3Vx+QfvS4K5i3dWPUIB?=
 =?us-ascii?Q?Fj3SyGuHlBpDdRKDvP9JYmd147Iek5YjRXld3wLQabMKQAJ71nCIqVDwglUu?=
 =?us-ascii?Q?MiMbwT6rhfQtStMcbFvDdE1YFJQDDsrQ2cK0NIjBQZ8DmjrREaBlk7RRHHtS?=
 =?us-ascii?Q?4Cf4xYh1cPbrqrRYng5VDOxUzhSSuR4X2FW/TZXbyyobtowJ9t9eqjHvmNZH?=
 =?us-ascii?Q?JHnq/0ZOpiV66AOI0ZdKex2wiXDjo5V8rAGtvmr1jgJSMwXuLGccseS2kXmb?=
 =?us-ascii?Q?yY378NgXEXfux252dRXKj9j4g+UcJrMjXanNPe2RBQ4ZP6HVM0/lbUWOFaWO?=
 =?us-ascii?Q?j7HGfu96AyfdMWz3Lb9snAxgB8igqnaN7VgIL6E1WAmiuyBeEa7+742PCKHT?=
 =?us-ascii?Q?3FRQKfNbP3lSj2PDEdkSGKgALcqA0rlY3AY+KnS+m8ADkfUAydBSEA3MvJE1?=
 =?us-ascii?Q?M+W/wWSOlE3KO57dikIm95UGET8CoTs9lrXQ7jJG07oep2f1UQ7FceTlV+9C?=
 =?us-ascii?Q?P9ZmzgOmyKXxnVf+5R7FgJZe3ivpaNzRO6qU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:25.1852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b93c326-cdf9-484f-2d7f-08dd861e4cd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8997

- Provide user register access over IOCTL.
  Both register read and write are supported.
- APML interface does not provide a synchronization method. By defining,
  a register access path, we use APML modules and library for
  all APML transactions. Without having to use external tools such as
  i2c-tools, which may cause race conditions.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v8:
- Address kernel test robot build error:
  - error: unknown type name 'u16'
  - error: unknown type name 'u8'

Changes since v7:
- Address Arnd comment:
  - New IOCTL and structure defined to separate
    ioctl for each protocol

Changes since v6:
- Rebased patch, previously patch 10

Changes since v5:
- Patch rebased

Changes since v4:
- Previously patch 8
- Address review comment for documentation warning

Changes since v3:
- Add ioctl description comment

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- bifurcated from previous patch 5

 drivers/misc/amd-sbi/rmi-core.c | 29 +++++++++++++++++++++++++++++
 include/uapi/misc/amd-apml.h    | 31 +++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 171d6e871373..b653a21a909e 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -350,6 +350,33 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	return ret;
 }
 
+static int apml_rmi_reg_xfer(struct sbrmi_data *data,
+			     struct apml_reg_xfer_msg __user *arg)
+{
+	struct apml_reg_xfer_msg msg = { 0 };
+	unsigned int data_read;
+	int ret;
+
+	/* Copy the structure from user */
+	if (copy_from_user(&msg, arg, sizeof(struct apml_reg_xfer_msg)))
+		return -EFAULT;
+
+	mutex_lock(&data->lock);
+	if (msg.rflag) {
+		ret = regmap_read(data->regmap, msg.reg_addr, &data_read);
+		if (!ret)
+			msg.data_in_out = data_read;
+	} else {
+		ret = regmap_write(data->regmap, msg.reg_addr, msg.data_in_out);
+	}
+
+	mutex_unlock(&data->lock);
+
+	if (msg.rflag && !ret)
+		return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
+	return ret;
+}
+
 static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __user *arg)
 {
 	struct apml_mbox_msg msg = { 0 };
@@ -414,6 +441,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		return apml_cpuid_xfer(data, argp);
 	case SBRMI_IOCTL_MCAMSR_CMD:
 		return apml_mcamsr_xfer(data, argp);
+	case SBRMI_IOCTL_REG_XFER_CMD:
+		return apml_rmi_reg_xfer(data, argp);
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index f718675d3966..745b3338fc06 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -58,6 +58,21 @@ struct apml_mcamsr_msg {
 	__u32 pad;
 };
 
+struct apml_reg_xfer_msg {
+	/*
+	 * RMI register address offset
+	 */
+	__u16 reg_addr;
+	/*
+	 * Register data for read/write
+	 */
+	__u8 data_in_out;
+	/*
+	 * Register read or write
+	 */
+	__u8 rflag;
+};
+
 /*
  * AMD sideband interface base IOCTL
  */
@@ -118,4 +133,20 @@ struct apml_mcamsr_msg {
  */
 #define SBRMI_IOCTL_MCAMSR_CMD		_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)
 
+/**
+ * DOC: SBRMI_IOCTL_REG_XFER_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_reg_xfer_msg
+ *	Pointer to the &struct apml_reg_xfer_msg that will contain the protocol
+ *	information
+ *
+ * @Description
+ * IOCTL command for APML messages using generic _IOWR
+ * The IOCTL provides userspace access to AMD sideband register xfer protocol
+ * - Register xfer protocol to get/set hardware register for given offset
+ */
+#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)
+
 #endif /*_AMD_APML_H_*/
-- 
2.25.1

