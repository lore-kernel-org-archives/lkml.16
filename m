Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF341F4167;
	Fri, 11 Apr 2025 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378342; cv=fail; b=ljO7lxGTJE90c3engAu6TEvwWLp/GJn4OnBKFs3po2kbO5yE1g+VafZrQ9SBvG+ybwHP3+rGVVQJ68Gis/t2zvBHAvG7zOCYEKW9LW//yMPCak4LvVhVvZRQF6mMvB5TT7wHkEFXAJ1aFejytRjv2Rr5VOG+mifrJnW3nl5YMsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378342; c=relaxed/simple;
	bh=BSmjI7t7dWSN/HnxKXCvBHgyyD7oNBGvcJlw62Ialas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i43BFhgXPhRVAiUqJUzCzUfeQyNpiLPtrHFt2roKbtNor7PvlIpY3TfZipqqRvkltc+vC8hI9ouTWm2+TQs39QZWndi4JvHngvTDbWS51gTib1QUGzk4tzu3u68erKGRiLHwWf3CsVLjjdg8V1HF+yKJ0GBCxwcUxayAx3ob2F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hs0/sZny; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hs0/sZny"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofgj7WERyojGaWrYuKvdCRwHBmnzrc0YX6B1ZjA42HzbqgPbDCy8lX7tIshy3ehFJtTrGyZE95vjZDtPA6An0XgW941K8ot7R1h0x9+J/p3/3aHw37ruW3kKOhh1k3oMs+MwqRJ31jCY1oHV/ncaHWrZWpfqc1De8Q+FWDpF48vA8O9zPWFbwjuKVSAmTJnB6EPJMUhVQ7tApwlG2FsM51WJ5DhW49wiCM8GOTkfEkVJn6VwYBFL/4/8FTnVUjua6nGN9HrZB6jyzC+FVoZsUC2bPkWgltmNfrEdI8yGM3X6l5uDo8/H4bFg1Bs+4lVxml3Z4zZrLFYANVx8NsWk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naW/k81cyGE3BC/UoPYu18dV5CV4uzzB5XlARDUZeUo=;
 b=vJh2wkT8J+rSA9cZc1Axlet4Thy8/ghKh4DZRQcHcbmHkVeTauZnNAT25PDIfhUN4uK/WZbidpC835vS0hg7hm1Xzns6SH09uwEgLMRkbTH5+9pXY24wMm1LEnEOWrz2J9GdBExizhyvCKYYI2pug8VAVDaRFINU+wrqoLyTDsVDAwGb5URJyUUaPnA1IK+fEr/OaBh+tBGmjxooGkXmYE/xH7O3+CVcvv548ENQ7jUjqEtSZEF/4N8i2dVSqpUTUPZRiUFFpkWNhw1mw6iVHwzJoZEeYMz8lC+P/61iHqU7ecjUsQxw9FY5T/rMULj4/hc85Hwe8/p+j0KYGtqnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naW/k81cyGE3BC/UoPYu18dV5CV4uzzB5XlARDUZeUo=;
 b=Hs0/sZnygqMo1g9yQcfQzbpVPcC2uIS3RT2EgDTFnXJt/TJYVem5rXL+Hyst/sg23m+XnBLKIwnxtLGiy8QKkwBjx27PMWiVGyT+xzyt2jGECwBS9NOrQARw0j4whHJDuJF8AS2CAUTe32Qo7T5pU0sM/V3s6pu+sWE4E8wBpJM=
Received: from PH8PR07CA0044.namprd07.prod.outlook.com (2603:10b6:510:2cf::12)
 by SN7PR12MB7452.namprd12.prod.outlook.com (2603:10b6:806:299::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 13:32:16 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::7a) by PH8PR07CA0044.outlook.office365.com
 (2603:10b6:510:2cf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:32:15 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:32:11 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 09/10] misc: amd-sbi: Add support for register xfer
Date: Fri, 11 Apr 2025 13:31:21 +0000
Message-ID: <20250411133122.1806991-10-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SN7PR12MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7e9f3b-099d-4861-f223-08dd78fd464d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YY8hMd8TKk1JuAJ4SaiQgvgDVk1Ld86cES2yi0nYWhfe+Kb7ElPUWiAIrSCc?=
 =?us-ascii?Q?IwuMJU829hzI3fYIL5PbhPySwVe6txX10VNnwVZrukbDJEc7Uix4xPBCCzsc?=
 =?us-ascii?Q?QLduFezoqJQwLhNlXgynB5AcX2sZO5ZHkTFiyN3e8lt7rEh0qeb1OH61XpMS?=
 =?us-ascii?Q?vIlHgl9GtHmJTeXT4Wq0ukhJPjJcJdfdn7YarRbNSOUWfo70otDGDm45bdD9?=
 =?us-ascii?Q?SOnHtAl0euQdYzo9QVsExIywvEF+kv3k6CTvRnZMgUUPjFwit2Jqk6+CWsXM?=
 =?us-ascii?Q?LKMLufK1pRxIjhYgW+VF+eYtk9sAkFEW/2ZZH6zOdtGJQL25Vy0R41+az853?=
 =?us-ascii?Q?YTovl81qD49ByGueZFB54LMwptRr0p/qaMDQZddveGSkg7TixEN1nHsdfM0N?=
 =?us-ascii?Q?zfRnSMaf29TRSdX9vveT/4alT+V4QdxxazsYe28kKS4flXTGh9O+zdGwMO7J?=
 =?us-ascii?Q?Au6wtcaS0dFFrVvae1Mk/ZRHTtInQs2YFZFWbZoSGOhQIM0pqercZc7Xb5Ns?=
 =?us-ascii?Q?EF7MNOsJfgw6oVUa7XiUrZhmvr5eGqmm6QKCpcw+Ligm3lXk9UcKOifRNBjU?=
 =?us-ascii?Q?Ussq6EZWI9LqL9XV8Ej/7SOaDrTQYkCQUgfeur5xk0258w8HeHG4LzvB8+Sn?=
 =?us-ascii?Q?5ShSriphK8dtGjXJIW/KSWCOiLVHstO0QBe34JgpWlhM3LuP+PzJsbmfR/iu?=
 =?us-ascii?Q?NiE074leP3vEOzhO/mmy55Ngbl2n4gNbb/EYDvtl9T+rNfNP029sK9PHHL1p?=
 =?us-ascii?Q?AX2+K2QflrmSfmp2H97Jsd8cgNRQUhe1OS2gDlgTupDHxLEk2+iQYlyCE7/G?=
 =?us-ascii?Q?Ov6vYEiHZvFz5rCP2tSY//nEqkp/PIQPjrm1rBrfprEiSO9pHbfpKZRmoNFc?=
 =?us-ascii?Q?doEY7H8X57Zwj8HFpZSBFQ5f5nHIIz6MiNBKjSZkd4SoDM+EQUg83P8RKVPB?=
 =?us-ascii?Q?YH4knKXfOiPYHAN+F/hWn4d5gFVdnmfMuzMwok4ULn5NRjuROZr8c4wuPsFD?=
 =?us-ascii?Q?X0KCPmk9XFB8EQehuE9F4EDwQlxRV1lNtkTAbDjTboW/veEmKrMjBfdskk6l?=
 =?us-ascii?Q?21FzaEp+rg/t+fDnse7YSog9HT+z+d2JnGmK9dgJ4ZFvTJEGupBmIweYZmmn?=
 =?us-ascii?Q?2I9ZxdABE8m7vaImrReQqdh+c4PhGB7o1rRbATXahbSL/cvKrWCdTQkVthu1?=
 =?us-ascii?Q?r2JBZtN7pwrv4LWkOiPZIFGl80rAIXVZ8clVsi8+aGHbAYkh326XYT6KFnIe?=
 =?us-ascii?Q?Ttp/VHXJMdhPpqWeFn5Nzv/qWDZk0APLm9jJoHIkZXEReiOnv1kLRqqdebsO?=
 =?us-ascii?Q?FCvY+yJI6REE/7obj3XXDMU+kGVpEuXbUv48RJVwfDxnqBWMFyHOqIj5gSZx?=
 =?us-ascii?Q?OM1+tPPz/6q+pMFXIRRxJEM8dnELabZjEfQc6iJSL9X785nNXWr99HU+VSOB?=
 =?us-ascii?Q?7YLzvlfPPHwg1/qwIwHZSNTSLAFjafB+ajmYMV9xm6rFzhrGGdNA5hPUEX0I?=
 =?us-ascii?Q?psjXjO4R+S/XFiWNip16DZThq3sWuu7hwN6u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:15.6488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7e9f3b-099d-4861-f223-08dd78fd464d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7452

- Provide user register access over IOCTL.
  Both register read and write are supported.
- APML interface does not provide a synchronization method. By defining,
  a register access path, we use APML modules and library for
  all APML transactions. Without having to use external tools such as
  i2c-tools, which may cause race conditions.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
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
index f718675d3966..3b5f5af61a1e 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -58,6 +58,21 @@ struct apml_mcamsr_msg {
 	__u32 pad;
 };
 
+struct apml_reg_xfer_msg {
+	/*
+	 * RMI register address offset
+	 */
+	u16 reg_addr;
+	/*
+	 * Register data for read/write
+	 */
+	u8 data_in_out;
+	/*
+	 * Register read or write
+	 */
+	u8 rflag;
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

