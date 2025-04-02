Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDB231CA5;
	Wed,  2 Apr 2025 05:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573580; cv=fail; b=e01soJOcKk2Na4Ipb6Jc/8irEZW+ERyAOmdMijm93PXB9rvEKNOOAC/wNK3xB+LQTsaOu9kDcfnZam+1nt8jngAATTGbD910svX2DZrLAyLlE4CyrDYpn3nugLIym1o23nuxaIe6x8BWdCNtFLlBFEQ9nAvjKwrpRrTYYqtcq3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573580; c=relaxed/simple;
	bh=NWQnhC7IIIesao5/7wC+P1jqO2BpFv8wShxoyNjpOio=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJhEljKudZl1ufT7h4ipQQ0g1EwzYP9oU0hrdvTqzkpkzyIiZFa8ZMDPMgPr+Hm/1/EMbsc+B1JIzQmQMeVqGmnph17qMQ4sCD13rrwfblEqgv7G38X0xI0DFO6xSL29mQGShglKcxrWVkvwXsnvGk6+NMkBdboVEgTUreHKUlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b7kEoUbr; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b7kEoUbr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht29mVjFryFo4PwcDDlqs/TmQsMvs/85Oe6WMICC6UeMbqrFKnsBRfR8HJp4X3GX4oWq+1mvVg3N4zS8dIDIm5Z/piIQGGFbnb9E7pYAA7xsM0byxF3TS/QztMB24Pm7X/3izKSBCc9TrNCUILSyKdEnSgBo2q6IY80hWyLjtZgEzkFrFqYhi6ljisc+E30x1TQ4W5sx06HATz4/8Ed0xj15+GAXnuDDhReR3Z4ExOnvNil0rBEXgUTg8RgXOqHuD5sSjPxRm4LHOYodR3aV8w71XF15uCi5IVLMQ+CK5u8WJlCZIRaJunIDe+puCc+lwChsQFy3EDcyNETEka/vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJiAxxqJTzDFn0OJiCX44FWL2+hj+e8KwHu6KojByuI=;
 b=APopsxbqwg3iNMHZELcIKtl3kmd7kpqMj5sIR/GEtETMBK95eIGCRNaeKEZQrgfN4Q8C1bYgf5ldzq4Gkfa+7ZxHt/pxi95gU5TJV9VoE8FPRlVM0Wu6Tcj89ciFvv7nI2SLECsHyWvjE4ycyP1alzPprotYKTPbmtup2lyfD/n358BfH4/AUSNQcctCLHMWRpbWKXsHWYRejsVhPRehQZ9uOSEa2hT5kPxfa7XZgEZ1c+VMt6lrmYC/8NzxMuOGVTFDxp007OEoTXIL00RcDaZXFkrxH0dVytYEPFL83Cs97suHXlFxq9ZKGLKMdjHBW38R5oZr5xRqs5ZmRRFSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJiAxxqJTzDFn0OJiCX44FWL2+hj+e8KwHu6KojByuI=;
 b=b7kEoUbrYlrGt4kwZuJNzArmpoHA6uya/1tDyQHeoFdmoNiQ5ZWYFI5zlaU0V1N1N1k7f+tTUS8eDQ3rra8e7Asb7C1Izo7SiG9YObRWnVoKgu1HcYIQzDeo0wmPZ4pQeFG5QBH7nTkbCSeUir1Ey/HWd8EgIscv6ljHYL65JPk=
Received: from BY5PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:180::49)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:59:34 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::c1) by BY5PR13CA0036.outlook.office365.com
 (2603:10b6:a03:180::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via Frontend Transport; Wed,
 2 Apr 2025 05:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:34 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:30 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 08/10] misc: amd-sbi: Add support for read MCA register protocol
Date: Wed, 2 Apr 2025 05:58:38 +0000
Message-ID: <20250402055840.1346384-9-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: a9865eba-8908-49b2-d080-08dd71ab8b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y28+i1809rs2PtD6lz+YdLRpvYnEQEWQa37rH0X9V1nPTfArtrK6FIOgmDUg?=
 =?us-ascii?Q?RgzSWEmasBZmCMGwEPPFmxozhgQFVU6f6/GD7Ufl2O9zxj/6uSdfU+eBtbkW?=
 =?us-ascii?Q?Z/O+FurUgNx8CXy+LEHQ/UQ7UH8mES2ggjZiaYalmMrpTMGQ7WXoyaufJa6H?=
 =?us-ascii?Q?r19TTnQejyVsdxZUNLtsHxjrh3YCmLVwdaM9+NpnPOKwcRQTomCdrngsNplx?=
 =?us-ascii?Q?+z1M4yNoGrd7FHv9piRjT39C3gA23Lxy9vSOlhq7kp0px0Xduc9peDOPFYTL?=
 =?us-ascii?Q?clmJf0BSRy3xSTR40x4ybS+SXgZTUIxzMRppW5eXfbVXqecPRrOhOy71asuh?=
 =?us-ascii?Q?KUtvZjRbIh4pw8hIov4FoMZgTu2J48lbWQ7lbqDM6nrMYV1i3pCYtvvkiequ?=
 =?us-ascii?Q?B+MJhCqo/NXWROzdQjX9dx8Wzll/iHFGyRbNsd7FBWELPDNc7kCexhBAfuJ0?=
 =?us-ascii?Q?sJ1HL9zGhQKO2Sb1wDi/N8mOi0t3t1FJtf/OMTbQ0sdXKp4OOM4z7WuYHLns?=
 =?us-ascii?Q?uFNVlUF9d879DFKZJCziI+Aja+pKdmXYJKHxGdKRoGDTAE5ZXkVRbpotaedl?=
 =?us-ascii?Q?c/Lh5gA+6A894EpImbfnJ5z4S9/WxuZ6b4UDa4uBpiEkk0mBB7/9O3FKtM5M?=
 =?us-ascii?Q?T/iQ3ltXTwmt/EbYFEtydauvI05rq51HwXWOAwTTRVwYm06WeazOi84tMvod?=
 =?us-ascii?Q?AuM2tXhg9wdvKlX35wbieTUWlZdx0ynx4PGV/wBke0eHydUaRCaLqZCFicgg?=
 =?us-ascii?Q?cATDPZcBmFo9F3JhsTn2RGq0hB3HA/UV2Q45InxQWZzpiq9PxNgtjrwqT0um?=
 =?us-ascii?Q?OZB4VpHoC4MW5oY3nd6NuLAVyjZSNQMSAZOLumumnqswpOKnQLlWEPma1x4t?=
 =?us-ascii?Q?1lTenCqLleWYcLphRvU4/+H3XWoyxPF4yKlyOo8aLH0IgQ8vsA8H2E+s1O7q?=
 =?us-ascii?Q?iq18VMvRdxdTit26rzQI+kTiS3fgqTfw60v3HgBV6F06UPXsc4dw5HQTShFZ?=
 =?us-ascii?Q?RFnOrVBzoHyy4t/tt9bSi9kWLVKTZRzlWFEmLHmukC9tvuWOazTHDuD5dFQy?=
 =?us-ascii?Q?Tej2TsKsSeD5exE7YDtYbPAcsDMBOVIHPhLItGdqMYb5jbWDKenn2rglbVMe?=
 =?us-ascii?Q?T9DOtn22xtv3h2f/h3pypM85R3zWRta/FBQ1QQf1Te0jzTND64xy8FdxDDl2?=
 =?us-ascii?Q?6B+YJDDuMXkwezruhCa2LelqBCX7KR+hmCW58wweaeyGS0VnCeLz9gxGLgDN?=
 =?us-ascii?Q?KMv4+pTPhnQwLl4pPn5VJrGZNGs1/ROdHK/nC4G5DvovkIrKf4YZ2nYX+sbh?=
 =?us-ascii?Q?GK2YBEwXm88dr5S4ReTshJpLopBOjmmER53E3bdcUzrSE4XuhLpzdraFuyaI?=
 =?us-ascii?Q?0M7ceFrAlcEof5s22Ncx05MqN0n5ish+QA+DznHMu1PMqMl+rrSbS1Y6bGIz?=
 =?us-ascii?Q?+RoNE8nib51Pttl75fvCGt+0wRnh/q9pCFlCtEuAjkD8NUz9cUD5I0EzBfuq?=
 =?us-ascii?Q?7ZyAPtKM8Xn2W1CTtZOBAtV9iHD9gK3OODID?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:34.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9865eba-8908-49b2-d080-08dd71ab8b1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246

- AMD provides custom protocol to read Machine Check Architecture(MCA)
  registers over sideband. The information is accessed for range of
  MCA registers by passing register address and thread ID to the protocol.
  MCA register read command using the register address to access
  Core::X86::Msr::MCG_CAP which determines the number of MCA banks.
  Access is read-only

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v6:
- Rebased patch, previously patch 9

Changes since v5:
- Patch rebased

Changes since v4:
- Previously patch 7
- Address review comment for documentation warning

Changes since v3:
- Address review comments:
  - update the #define to inline function
  - pack the union inside the structure

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- bifurcated from previous patch 5

 drivers/misc/amd-sbi/rmi-core.c | 100 ++++++++++++++++++++++++++++++++
 include/uapi/misc/amd-apml.h    |  18 ++++--
 2 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index eccde823aba8..463bfc18dc22 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -30,10 +30,16 @@
 #define CPUID_WR_DATA_LEN	0x8
 #define CPUID_RD_REG_LEN	0xa
 #define CPUID_WR_REG_LEN	0x9
+/* MSR */
+#define MSR_RD_REG_LEN		0xa
+#define MSR_WR_REG_LEN		0x8
+#define MSR_RD_DATA_LEN		0x8
+#define MSR_WR_DATA_LEN		0x7
 
 /* CPUID MSR Command Ids */
 #define CPUID_MCA_CMD	0x73
 #define RD_CPUID_CMD	0x91
+#define RD_MCA_CMD	0x86
 
 /* input for bulk write to CPUID protocol */
 struct cpu_msr_indata {
@@ -70,6 +76,16 @@ static inline void prepare_cpuid_input_message(struct cpu_msr_indata *input,
 	input->ext		= ext_func;
 }
 
+static inline void prepare_mca_msr_input_message(struct cpu_msr_indata *input,
+						 u8 thread_id, u32 data_in)
+{
+	input->rd_len		= MSR_RD_DATA_LEN;
+	input->wr_len		= MSR_WR_DATA_LEN;
+	input->proto_cmd	= RD_MCA_CMD;
+	input->thread		= thread_id << 1;
+	input->value		= data_in;
+}
+
 static int sbrmi_get_rev(struct sbrmi_data *data)
 {
 	struct apml_message msg = { 0 };
@@ -167,6 +183,86 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 	return ret;
 }
 
+/* MCA MSR protocol */
+static int rmi_mca_msr_read(struct sbrmi_data *data,
+			    struct apml_message *msg)
+{
+	struct cpu_msr_outdata output = {0};
+	struct cpu_msr_indata input = {0};
+	int ret, val = 0;
+	int hw_status;
+	u16 thread;
+
+	mutex_lock(&data->lock);
+	/* cache the rev value to identify if protocol is supported or not */
+	if (!data->rev) {
+		ret = sbrmi_get_rev(data);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+	/* MCA MSR protocol for REV 0x10 is not supported*/
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
+	prepare_mca_msr_input_message(&input, thread,
+				      msg->data_in.mb_in[AMD_SBI_RD_WR_DATA_INDEX]);
+
+	ret = regmap_bulk_write(data->regmap, CPUID_MCA_CMD,
+				&input, MSR_WR_REG_LEN);
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
+			       &output, MSR_RD_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   HW_ALERT_MASK);
+	if (ret < 0)
+		goto exit_unlock;
+
+	if (output.num_bytes != MSR_RD_REG_LEN - 1) {
+		ret = -EMSGSIZE;
+		goto exit_unlock;
+	}
+	if (output.status) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = output.status;
+		goto exit_unlock;
+	}
+	msg->data_out.cpu_msr_out = output.value;
+
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_message *msg)
 {
@@ -282,6 +378,10 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	case APML_CPUID:
 		ret = rmi_cpuid_read(data, &msg);
 		break;
+	case APML_MCA_MSR:
+		/* MCAMSR protocol */
+		ret = rmi_mca_msr_read(data, &msg);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 1ae952785112..9993fa49460e 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -7,8 +7,11 @@
 
 #include <linux/types.h>
 
-/* command ID to identify CPUID protocol */
-#define APML_CPUID	0x1000
+enum apml_protocol {
+	APML_CPUID	= 0x1000,
+	APML_MCA_MSR,
+};
+
 /* These are byte indexes into data_in and data_out arrays */
 #define AMD_SBI_RD_WR_DATA_INDEX	0
 #define AMD_SBI_REG_OFF_INDEX		0
@@ -23,8 +26,9 @@
 struct apml_message {
 	/*
 	 * [0]...[3] mailbox 32bit input
-	 *	     cpuid,
-	 * [4][5] cpuid: thread
+	 *	     cpuid & mca msr,
+	 * [4][5] cpuid & mca msr: thread
+	 * [4] rmi reg wr: value
 	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
 	 *	[7:0] -> bits [7:4] -> ext function &
 	 *	bit [0] read eax/ebx or ecx/edx
@@ -38,7 +42,7 @@ struct apml_message {
 	/*
 	 * 8 bit data for reg read,
 	 * 32 bit data in case of mailbox,
-	 * up to 64 bit in case of cpuid
+	 * up to 64 bit in case of cpuid and mca msr
 	 */
 	union {
 		__u64 cpu_msr_out;
@@ -48,10 +52,11 @@ struct apml_message {
 	/* message ids:
 	 * Mailbox Messages:	0x0 ... 0x999
 	 * APML_CPUID:		0x1000
+	 * APML_MCA_MSR:	0x1001
 	 */
 	__u32 cmd;
 	/*
-	 * Status code is returned in case of CPUID access
+	 * Status code is returned in case of CPUID/MCA access
 	 * Error code is returned in case of soft mailbox
 	 */
 	__u32 fw_ret_code;
@@ -79,6 +84,7 @@ struct apml_message {
  * The APML RMI module checks whether the cmd is
  * - Mailbox message read/write(0x0~0x999)
  * - CPUID read(0x1000)
+ * - MCAMSR read(0x1001)
  * - returning "-EFAULT" if none of the above
  * "-EPROTOTYPE" error is returned to provide additional error details
  */
-- 
2.25.1

