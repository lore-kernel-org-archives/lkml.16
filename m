Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A431DDC3F;
	Mon, 28 Apr 2025 06:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821887; cv=fail; b=mH+we8eXTKIrlymxpJImofM+96NYxtYW6/tZqEYtd0F34x/hhzKKTkYrM2Plu34992mxWnLEy3teWY41VbyWj2b4UHjAqiF4B3fvnkBTPcRZwZvGlCX0yVNbaPbI7HBreQCZJ/s9oSWhpnP5fCkv0ELKw7AR4AyyLKl05qN9MRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821887; c=relaxed/simple;
	bh=8opl4y0hnuZ9gx2dEW2/a9TrekbQPLO1eMV1qq96I2Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+Zi+daeeqOH6zF8nrcanOkH2QNwg2op/eAiWe4B2XGWq+1BZzz6WAa5haPaWuoH9LqDHdb1lFVzVg+HY4qOfiWov2kR46sxFNNP2PcawEQMTpPCeEt4yQo63S7NRKMbP2v0qVXCedZnoIle77Huw4UzmGEIFkmoiRhkFR2dh5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yFyB35Cj; arc=fail smtp.client-ip=40.107.92.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yFyB35Cj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj9KK/Bgu075Eht0ZPBG4lIDtH24SLtZaLRa2qRkkhojMEYL0cWfZcQYB1S5ujKOXyO7q9sY4duzLeyDv7RQvjVJSEDYoukCzzKuk3XOMI3DSSPDuPXz+CbLESO73mg03FAhzF150xvZsofpeYUr9IU/Haxa/40pWStIdn9OdqeMbwnDzBtw1vs8we2ylzXBi6V+Wa7HHsHUJ0p8k80xplsv544JviE5j89bbENkoifb/fzFgxeDGajkp+4JudRsGIajPx4/KIJUcHFvTg7Qv4KkpPgrKsODBAiZ+w7YEbuEA07ZbiMWWv21aCEPXwEvyi6jX9W3D+h2W2FG6wcNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LENG8yRUDJ2eVDDiT8rg4/91BvisxWe9lf7dFLhlMyo=;
 b=N0HENhX/6ocCYIF2tFnqX6DWyM5CuSksRbjPV8Lauz1dYNTbk5C5zfc4A/WjXsmKlOODE4R/H8e/DsYW+SZMPHXDiUYtAskCeS3XHUsykd9Q3fukvcCj3ftKiD9wYOB8HfznRKztckX77Kd/gF/WiZPdH87moJD23roBSZAbo5JJ7h+2IsmFM5zQZxLBhZtzov3ssRWAvuAI+h5FthKecNmcJ9C6xyOLmQQHGO/E7/ASaRRWf6mPqXBkJ9Kj5spjBUGkEZXnxapBdNnnMMwtWB5qqlO/+aEbfRQjUz7+skbeIZjIxAM9FBPksOi6avyQlDHF5/Nbz7idojzmtoySBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LENG8yRUDJ2eVDDiT8rg4/91BvisxWe9lf7dFLhlMyo=;
 b=yFyB35CjDqNHZUDcJ6vWqKr8JYergS1SgMpiI7rdmM3SohmXFyhevYY6EvNz9VUgs3437e+wKUY/UIVGGTQ0gqsQZb3gPZMw/82QiCNM6icmTdmnqYF9SmbyrCwnfN2MapAFKJhqsfQboqhsqYsvbfsUagPnuFd5Q6RfpwqupCo=
Received: from MW4PR03CA0038.namprd03.prod.outlook.com (2603:10b6:303:8e::13)
 by PH7PR12MB6956.namprd12.prod.outlook.com (2603:10b6:510:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:31:18 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::b0) by MW4PR03CA0038.outlook.office365.com
 (2603:10b6:303:8e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:17 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:14 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 07/10] misc: amd-sbi: Add support for CPUID protocol
Date: Mon, 28 Apr 2025 06:30:31 +0000
Message-ID: <20250428063034.2145566-8-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|PH7PR12MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 1294c6a4-1c39-4c9f-bba2-08dd861e485c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KOofephLN8UFlEyAPbllQ+/szcTLuCHSHTyPNlgf4iIrcEblGwhCK0dx38iV?=
 =?us-ascii?Q?DqsW3mcSqZ6L1n3K7JHqwivc8gkxS5WNXeY/fugKDCWtnEUn9SmPQE6eFYeM?=
 =?us-ascii?Q?mhdoVLPx6+jmFIXTjv7c8UGw0PtQ72SY2Np7EUcfPWwaDBlRYFnWpsiOyT61?=
 =?us-ascii?Q?iup0+kTF0fyKmmUqPKa4vtWp2EUiYUGZRccFUjlzrrPA5oaWditcHDZX8Imz?=
 =?us-ascii?Q?rZ5V4y3OcyQ4+5pDY4gcWkOfctnacHegJ1+6feJxH//aZYkC5GbdzLDE4iAq?=
 =?us-ascii?Q?7oDTR1v0uuLM5/6A20ukUV4NDztdB/5lYyiOGRWKpMVzB3TQfVapScM8adoN?=
 =?us-ascii?Q?473PLeQ3UTCI7Wih/vYXYujRxyJk16hnV14oZI/j+SQl8jErtRow/bJClosU?=
 =?us-ascii?Q?Tm81vWNzcsTg18l4rfUk/wsZGTRa+MBC8VE490361IFQjOiIH+bITzEfWjJ6?=
 =?us-ascii?Q?unggPh12IBK/rGokF+dJuwoEC5dp0sSjI5JUaJbz4q5ld6MQj0J0u2+0US0l?=
 =?us-ascii?Q?D94eRyfblZzmPlqDQYN+pbLkpsH50mDD0XYiciq/oD0Ntv7hUMDPVczLhAQN?=
 =?us-ascii?Q?oghrtU65h6QE5riLin570ed0vSFMjvSe8c75D0YlNhjQBu4spd2wem/xphuw?=
 =?us-ascii?Q?kv+em+R2ydvbz3YdiDLVCNNg6/KuNON3Wtm8RiMSepfnHARK1bsx67kaeGP9?=
 =?us-ascii?Q?Gioin0G5K9KXz0CCUplIifB/2PzuJvMabwURu7NQzCQGdzr5eAO0n+sWCXRu?=
 =?us-ascii?Q?TnZPv3VL0O7JObT9v3dNQw4se6gTlt+rz9rp6Aw+oxKnCSlLSuEntyvkKTAb?=
 =?us-ascii?Q?VJciyfMVDSH27SEi3PeYtmyXRGWvABaOOez5oigrvk7p486+EyydH6UaiaLZ?=
 =?us-ascii?Q?RD7PsyysvaPz/HUuN0fyAyTpV4aZdowWrvZTb1V7tK0OFhkjAZqPLdwGTbx6?=
 =?us-ascii?Q?b4ouEFhgTw//7XRaq9BKeialG5hwguKXRA4wh52dECSER9oym4dYu5TKRV3N?=
 =?us-ascii?Q?Qa1GwkT4c5Gwbej6xXgme7LiOIydmjfVmwbzhwzjHu2HPA6PhF+frVJHyT77?=
 =?us-ascii?Q?Ukob7utdfg0oj0f/Zu1n74wB+cL7V4QTLwFg9Mig+kMn+wGy7Mw4RXyp7yMu?=
 =?us-ascii?Q?SQ3Cu+U11EZYKUP7apbO4dX2LcrHi0j7m8VDjC6XSNojWRL39ZviiW15MfuH?=
 =?us-ascii?Q?JPyF75KNzXsbahOOZxvizNCbiLBjKtfgSUdwxTk092KhdgbWkIwGrAiJvQJm?=
 =?us-ascii?Q?Lpd9oswa4MLPtycRRUSGOuxM7/16fqZTF716//p+X6EYVp2d7T2JS6abrLcK?=
 =?us-ascii?Q?HA/HdmTpAkOkHz6zlav1vVPha72Yov1LsBTaYj2K7AWuzxmpnJtF7X0XVtVN?=
 =?us-ascii?Q?ADVLVTMlzgeAv2ivQ+mVw6GkNAzn8WuYVBVCWUs/87QEyJGMpwJlOug4V385?=
 =?us-ascii?Q?t6LThmbhOrS3Krt4G3IS07rHuF0aPGKNMLYaTFtuirf3/c+CtFo0YMABCCtk?=
 =?us-ascii?Q?LyZCeNb+FTfWNeqljnWtsA4I5Ft7n0TySiTR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:17.7109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1294c6a4-1c39-4c9f-bba2-08dd861e485c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6956

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

