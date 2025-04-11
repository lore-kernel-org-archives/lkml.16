Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308601F30C0;
	Fri, 11 Apr 2025 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378337; cv=fail; b=MLbmmzhLPN+rMA5hDxPh756pNjxj5y5QO7GFtF3YTlk3Rg85H3FfFY9McQKi6+68p1g8iCPs68Z3Vml30KlzcEFicn+/R0mJyFALf+yQuN7wuySmMPWe6DaidLUPJl3mE5HrPgtvNxxjgL3wK2LKeTlBC4SEHS0lkFP3iTSiQaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378337; c=relaxed/simple;
	bh=Ajxinnx1WhIkCBbGXkJv0VNAzoT0mXU7yxYmCFN3+VY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1Zms6Altp4HIS4FrcsR+NAASW/pfT8JpqwvdLVV6mShMtZW+MZ1965tcTHvP9E64PqGTAqwSnEoRoJShMSt+7Bwk+ga7uvjVxQ95eWwBTvEMspmsuiQk6DXUVQtV8Y4zmvIoXICTERQx6aw3Z9GIkEVTWhTcyjkSQAfRjbCfOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3eFrmgBg; arc=fail smtp.client-ip=40.107.243.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3eFrmgBg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9n65tS95fsdo6Ao6DxtnfIxfAovegaVa9mPwaxRInkNxCYaG6roBUtH2On4H3pHgiGrjlqdthb6NeNDqZoBPHLpdTga4Bgx7SapyLRcdGxYTIwK+JLJm0ahuBp815XcgJyqfbseiQ5ES1l4iPG6DPgc8e7TUoaZwQ7xTgLAFZd+H+OaPck7rIoklXBuBMCbU69Dgm5e8KEXUZ5W0r3Ap1OL529D7FI2rNy2MTPpEJjGN5nMvG0SOU5p1VmcNafIqQW4uYu6FxeB12//MHqRLvIKh+2PXKYZvQkJ1HU+piIp3qoBcAo3aUbfuL8PRRx/I/WBwrhZxpzgkz0NB0BMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sukqhytJrB92xdFirbsnSNXn43Q9X5b85qTqslMqKlY=;
 b=wfBnYrqrbOddEgF2MxijO6FEKG9RaI0aJtu5NK/pd4IR3bbzRMf1KDlDhIUveZFZk3cpBOle3r9ih8lsTlrhbJnD4h/lS9YxEBrYls/n5kN/G5hT4sUcTxXkCLehnhBnpnVWox4UJNW3CiJF3xMFXdSotaRHnEPC3CM2pT0+uNywrmC/i53O63F1aksLJxG8EkGJ288oBs6mmw9vvP3maN1hA7+WwnIX+KlPoosjkK6kf+LY1Sx0qUu5JF3Ew7KfcxX4dPC1gONWie0sGT72mL3uPwjecu9ugyPMxObbvWGuNkhLXbqLktOA3IN0/PlUtEVCdwS/iaM98Zkf8t6Bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sukqhytJrB92xdFirbsnSNXn43Q9X5b85qTqslMqKlY=;
 b=3eFrmgBg54Lf+7EkMPrTe3mPzBVHJOuvy/VxtAAFwS7Tcz9a+MpUs7whPVETbr/fshJLrF+AngmkQeHaEimZJCSdDdeDjnxS5JUjULB+g7vm6y1S5ejxVTSJSbfnPc4fSryThFHAsG/iAv8dyATy3J4N/0as3gjXpHJaNNjR/QY=
Received: from PH8PR07CA0028.namprd07.prod.outlook.com (2603:10b6:510:2cf::23)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:32:12 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::38) by PH8PR07CA0028.outlook.office365.com
 (2603:10b6:510:2cf::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:32:11 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:32:08 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 08/10] misc: amd-sbi: Add support for read MCA register protocol
Date: Fri, 11 Apr 2025 13:31:20 +0000
Message-ID: <20250411133122.1806991-9-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 023a7c8e-7da5-4349-0a46-08dd78fd4420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UWAKasdp30sXYdAnF+TmQZMzcjh45LLBd4SPWiLyCzCItRL0J41IjfhedesW?=
 =?us-ascii?Q?6H68l0BMMJQ+1ZHN01vLD7ojBrMg6pMHphlTDGw/xzPE1XVZupotaGTjn2f5?=
 =?us-ascii?Q?QBjGc8/hEcn+QOL5bCNIAgX1bBWf/kRs/YLSbwgl+zk9g6GwGPz/QF4xFHe2?=
 =?us-ascii?Q?vZsmAHUfccRiej22EILvbgrMgLEbLqm4osK2cSA+f6HSrqschD9eKdFh5nGc?=
 =?us-ascii?Q?UVFU6wgvxg0jsmVnFBsumqIEaWb2sZObCe3SmhecvnhG04OKrvVG7JZKijQc?=
 =?us-ascii?Q?ZhE63iv4/D7ghVP0VLavOb/zZjwth/jHl7GQYLo4uHGylpM9ps+r5euVcI2x?=
 =?us-ascii?Q?RHDW9TjthAVQ86MXfQXPF1uQarFeLgziVPHZ+zge+mfacLVmSBNFOFgXdgOm?=
 =?us-ascii?Q?SfHXm3A18ohLfI6lwnW4yaPVjm4CcSeuZz3SQLFAOOX+vWoLkDhu21XqxcPa?=
 =?us-ascii?Q?dsCIOMf6Pb/6PkBcGnNLHJyNRnHjmTxK8UqNCEXGKVaL10MlcMadbzR2FVWN?=
 =?us-ascii?Q?oEN3j/JBUg+mvs7zL28SlIerFapmXoO+8DgkurRKAW2YEAueUuPq5LctXsCG?=
 =?us-ascii?Q?OkbzotZhiG5lR4j4VnU03GAql5zpl1o6jdKxw3gVIg3XDZ9WBCprgTWR6Rs0?=
 =?us-ascii?Q?mBqT+oAA+9la20wQ2KI/J34ZRAvxHy5iMPoqgHnLVnVT//IojWX5Hp0ay8Ah?=
 =?us-ascii?Q?B9f8WEIJgo9LOj2j4W4aXY/sxcad2krQA+qitE6SgB+6BM2YEQYU38z5fmZq?=
 =?us-ascii?Q?OHIrfyO2SEAI4CNhm+9ECyQpIhlanH/kYQva5+dDelo4/fCiJnUaFQFlgp/C?=
 =?us-ascii?Q?Nv9qMmUnJojBxF6EvqApGT3c3qw21/lOf5Lxr/of4j8XkDJ1EdVJH9+Fgw/C?=
 =?us-ascii?Q?72G6G6YhImysOMexS0da2EJPlhnKWk+47dnfyDpRfVGtfih34C8ndhZ0IS1+?=
 =?us-ascii?Q?K+n7Su7o32OVS4+DWYCOwQSj14kaefKYyyT3kUZHDPETcKdrGegDoqkplq0G?=
 =?us-ascii?Q?JhV9H17D2pYRKpnBwxM7UkGltGtJBa+oT794xjNxHdiCaz37XXsK1GJZrChl?=
 =?us-ascii?Q?mHgWhZd0L8qmarkDILoSj4TfdFm/93A6sD2UITCfgab79ZxN15qmAufEQi4y?=
 =?us-ascii?Q?6RJaYLk/uIkT0dxSm5GbllyIrEqF94wGEhI1rqjsnV2ZRCum5BDlMoBah9GJ?=
 =?us-ascii?Q?Vm1QA6ZWczgZIGFFRtI2b53Kl0WYbnpjEIDDiMPMuJdt7Am52bGcqDv2Q/QY?=
 =?us-ascii?Q?Zh9Y8XpXusxTSrPCsaSLSqmj9LAaJhuH1IgCKMUDvxKxXiUIZhNwFfSor9ty?=
 =?us-ascii?Q?6k2M4adeG59ACpcW7jnJOlo7d1UYE9x3myC0kWsr34FC96nuZbFMhMh55zzi?=
 =?us-ascii?Q?DYX8N+JpZsGDQtFpRSRdm06OQAfnU4xNSuYYxxL/9ACk5EfXQ8npLhLlpWh/?=
 =?us-ascii?Q?7BcdTuXhFuscOz/eWRKp6Y8HSVUfwfMy2NS0y6WKUNtteMesTIQqWyDrKLda?=
 =?us-ascii?Q?/wkVkB3hCFWaOEDPCbdsOOO7gAKGItqZMtLU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:11.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 023a7c8e-7da5-4349-0a46-08dd78fd4420
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286

- AMD provides custom protocol to read Machine Check Architecture(MCA)
  registers over sideband. The information is accessed for range of
  MCA registers by passing register address and thread ID to the protocol.
  MCA register read command using the register address to access
  Core::X86::Msr::MCG_CAP which determines the number of MCA banks.
  Access is read-only

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v7:
- Address Arnd comment:
  - New IOCTL and structure defined to separate
    ioctl for each protocol

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


 drivers/misc/amd-sbi/rmi-core.c | 114 ++++++++++++++++++++++++++++++++
 include/uapi/misc/amd-apml.h    |  33 +++++++++
 2 files changed, 147 insertions(+)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 471f50f0c368..171d6e871373 100644
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
 
 /* CPUID MCAMSR mask & index */
 #define CPUID_MCA_THRD_MASK	GENMASK(15, 0)
@@ -76,6 +82,16 @@ static inline void prepare_cpuid_input_message(struct cpu_msr_indata *input,
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
 	unsigned int rev;
@@ -171,6 +187,85 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 	return ret;
 }
 
+/* MCA MSR protocol */
+static int rmi_mca_msr_read(struct sbrmi_data *data,
+			    struct apml_mcamsr_msg  *msg)
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
+	thread = msg->mcamsr_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
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
+				      msg->mcamsr_in_out & CPUID_MCA_FUNC_MASK);
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
+	msg->mcamsr_in_out = output.value;
+
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_mbox_msg *msg)
 {
@@ -289,6 +384,23 @@ static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user
 	return copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg));
 }
 
+static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __user *arg)
+{
+	struct apml_mcamsr_msg msg = { 0 };
+	int ret;
+
+	/* Copy the structure from user */
+	if (copy_from_user(&msg, arg, sizeof(struct apml_mcamsr_msg)))
+		return -EFAULT;
+
+	/* MCAMSR Protocol */
+	ret = rmi_mca_msr_read(data, &msg);
+	if (ret && ret != -EPROTOTYPE)
+		return ret;
+
+	return copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg));
+}
+
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -300,6 +412,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		return apml_mailbox_xfer(data, argp);
 	case SBRMI_IOCTL_CPUID_CMD:
 		return apml_cpuid_xfer(data, argp);
+	case SBRMI_IOCTL_MCAMSR_CMD:
+		return apml_mcamsr_xfer(data, argp);
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index bb57dc75758a..f718675d3966 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -43,6 +43,21 @@ struct apml_cpuid_msg {
 	__u32 pad;
 };
 
+struct apml_mcamsr_msg {
+	/*
+	 * MCAMSR input
+	 * [0]...[3] mca msr func,
+	 * [4][5] thread
+	 * MCAMSR output
+	 */
+	__u64 mcamsr_in_out;
+	/*
+	 * Status code for MCA/MSR access
+	 */
+	__u32 fw_ret_code;
+	__u32 pad;
+};
+
 /*
  * AMD sideband interface base IOCTL
  */
@@ -85,4 +100,22 @@ struct apml_cpuid_msg {
  */
 #define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)
 
+/**
+ * DOC: SBRMI_IOCTL_MCAMSR_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_mcamsr_msg
+ *	Pointer to the &struct apml_mcamsr_msg that will contain the protocol
+ *	information
+ *
+ * @Description
+ * IOCTL command for APML messages using generic _IOWR
+ * The IOCTL provides userspace access to AMD sideband MCAMSR protocol
+ * - MCAMSR protocol to get MCA bank details for Function at thread level
+ * - returning "-EFAULT" if none of the above
+ * "-EPROTOTYPE" error is returned to provide additional error details
+ */
+#define SBRMI_IOCTL_MCAMSR_CMD		_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)
+
 #endif /*_AMD_APML_H_*/
-- 
2.25.1

