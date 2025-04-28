Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824931CAA7B;
	Mon, 28 Apr 2025 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821888; cv=fail; b=X44o6KSj/HEQv1dDN88f0TGLt1byeen3A+9WMcXgqmK4ZjjXuBUB441dRPgNDcANQ+RsUaKU+jCCwb5PnYvHJiPiDUptOASKuzoEdNiJMkLJN+H09NtpAI5HRZBZiLbQWGl20fFJgdxqgfw7PxnlNr3zjd6CBxCgBtKcx6gDykg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821888; c=relaxed/simple;
	bh=Rnx8RJYrz+aMV2vqmpxUJr6mlnIFAZ+52zVt2L4Ub34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHe/2iQKqZzt5KUiRxNieR4lhlrLFlM+eR6m70najj6wcX9ecbrSScTenQSZVMaDB0ldc1GibKJhON5ON/tzUH5+GD6qjvWamZg2MSQBUJI9c3I6SjL0IvxTpWxa1BTFaxfGlPDEy6l75OznHiNz98Sm1Bi9gKUBupUERW7C0T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ImJt+/83; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ImJt+/83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlwRMbLM1iHGMRAUcIDFqt6U+KepBN2S5u2Wi3a+gSu1bhD8v8Ok2GLn4xV5zx/ygtSMWzme1tVNwHVUIg0Wz2zOQWLkoEhXcbJRoD9xrQiCWfvYltLc0R0QsrI1GWwSfNrB+UcH/MOAT//ykz3QiCIiorU5w90/bOdkGDgUw9snl26PFt/5ErRMP9b61rnRaiuWywCja25oTOyUbjQyZzw7rWnT9DHEC2J/8jsWm/UZiu2u4+aHXjahFfzvCev8kS8ETGDQJDHFwY0DlFYyU2prKBsq+S6Fs/Y+KOJvtUK46YyALSXHESdn1zrp5WVIqoe2H8iWeDbQs+B+1U/Q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/B40bcmO+Pz3vROJyMu3i0f3dg+6qkDvocNPqvHUbs=;
 b=Am1GKYNdSkaZy3eu+a4M1f3+IdOi9tGsT+myn58W7hNqfBtJFLN1nQmygiwHCjgu0Z1Co1EqboUMJ3xlty0y6k41U4dEzMQ4IhvAnas5OR7o7EVkbD4edwOBY3WBrxbmdnlZn4cINSoz2ubxF83w2qPZfXhOxeI7W5jmYEgQWpPFp/P8FxiNmhii8koGLVffBpi057i14L03T4vXER6rOr+gtu8mIUQ8Ww3/yC6af4mZ0JfDAV738hLBcBFU9xPLlH08Zrrak3Owf/MhiAOeZh9QPO+JFg7hmrZB4ocWUyK4YXS3MKV+r51twvHtLoR9JYwGINAl7TkZSB2JfpUGBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/B40bcmO+Pz3vROJyMu3i0f3dg+6qkDvocNPqvHUbs=;
 b=ImJt+/83KkeCWMQfpnQ69Ksj2ACiFM/sBaeTB6aNKVNwDSmR81PceXwhOmgIp/bGN8255vdf9oySIN4XfxvOH6qQRDoN/o8bh5Z+PjSKgr1XwvQH0x8IpTouVWtT94w5rkyhN7msvCFSiygR06T0pd32osR2SPVBtksviPcY87M=
Received: from MW4PR03CA0046.namprd03.prod.outlook.com (2603:10b6:303:8e::21)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:31:22 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::ad) by MW4PR03CA0046.outlook.office365.com
 (2603:10b6:303:8e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:17 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 08/10] misc: amd-sbi: Add support for read MCA register protocol
Date: Mon, 28 Apr 2025 06:30:32 +0000
Message-ID: <20250428063034.2145566-9-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: aacdfdfa-2ad2-4418-d22b-08dd861e4a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FvNVdaykDLFn9SeRMXdRmQ1XLZBkiIk1Po1CmKloVV+UEqB8Dyxply+QldXc?=
 =?us-ascii?Q?KcPvv4HtpqRlhJ/6BSIiSPs2MH+/bz5am/368JN85B2p3wR8ZEltU079N8y3?=
 =?us-ascii?Q?WpVh3YatYwmZIS8awPjJxIm9gxeoScochQQeJ1u4awvqfnAL6++RoPBDsb/4?=
 =?us-ascii?Q?12lNAd47rAGJNHtHsntc3MBcmxaV95t6KYFfUI5LW0TDRbRsFPPoqGpUlJnR?=
 =?us-ascii?Q?BjI3SQKjmWdoznd+4+Kv6lVVGW8Fq9RP3Piz9W000zH29Od1Aik4c3V9Pufu?=
 =?us-ascii?Q?hcUYuEOrWvoNM8ZO7VFwlNQxbc6DSIvWWYrpgzltYa1zxtKqhyPytdpMxb4M?=
 =?us-ascii?Q?CupZxug4N8PK5U7D41CfoV8j22Uvc91vXxWBt8/Cij+rEYHoJwF7JgM5UyBt?=
 =?us-ascii?Q?Z1h8sQieU95dmxlbLQJgil0zG81c1WucmTDB+s7/VCBrLzCUFabxo0MsVi2P?=
 =?us-ascii?Q?1ltU4XodNbLGz2OhaqrDJ/5W7usThRzrkUQat6aCmHPKyqMLYyqnzk/zpDRO?=
 =?us-ascii?Q?kVNuzKNWm4/XqNLoz0W4plN5khqc1ERThI50ZMaqNCAVBw6fCuP8Ay4jD0jm?=
 =?us-ascii?Q?nKpDw2/P/uKAF0I3rtjXHzZx9b9gMpvXl0SKRvJjNgFoUeRREAjU+krGL/k1?=
 =?us-ascii?Q?9dHoDs8wvEFPXBT5UZuJUspOGsbUb1e21WvZp0z04zPbqn7hFwbOd9+AwyxO?=
 =?us-ascii?Q?wgake+sKRDxeieLSyZpSDgDB6IU0J61ywkZlXS8fySOBk08Vzn/Ol40aDbi1?=
 =?us-ascii?Q?wBN/ar0ly9f4gsPMv0738lfORb4E4rhIxoi5OpxK7JXHdsleJ5cPoMHhFnsT?=
 =?us-ascii?Q?LmdeYzasOOGAe3u5aeki8c9t6YEzmjxt1K0+kcvz7bvFjCSkjbb0ZRE6Fb5C?=
 =?us-ascii?Q?aHPTrX7EYZJ6F85lAgFeHNunFEcsJYXiKPWbDaaMKHKYRfd0yG1WaQTYx76Q?=
 =?us-ascii?Q?fDXssWh3dEdp3JoRoh/WZ0x6xKcVepmV+z9xm+mnrl0DMw+M1JQmcaptpzBs?=
 =?us-ascii?Q?ZGt0TASDBycFaLm/y/gphC7APifFVM0oJqdlA2s8pdJwfSwR6flWyvLmWlpE?=
 =?us-ascii?Q?FFHagpjkoE2PaLJaN5t5jOKo/K/qIOuXUfKT+iM+OOonQ1mEsRzS5hJwDVFL?=
 =?us-ascii?Q?7H+mTkq8wtVRA97fR9T22VCOc4+5/KmEKKGTVs37Ph2Kz79LWryXKFZ6eXX2?=
 =?us-ascii?Q?NaD0KLqIEn3FhDGWuMeEmzSjTUVfGZTBqXMJ6zsQOeUCQ3BVumiCIMz0qdgt?=
 =?us-ascii?Q?rUV8QJ4AT6iQA4bOHXXzzHhL/AHhsFdrxqYT5WyQX2IzwKL9Er+NnqJbMS60?=
 =?us-ascii?Q?l7TFPycEv8IgagUxHy3R+Z/BGpRROscJ/qYDrsoM6OkgJlhrWvwVbERQwZj4?=
 =?us-ascii?Q?mrZQKw5KmosqNXAUVI+8lLIVgiDkQ7iUjjmHjdBrdMRPA83pnufHWMf2sHuB?=
 =?us-ascii?Q?b/D4blJ/3hnWVjoqOd0ETOoQeEgWnnJVKDr3vgigVYrw+fO7l7tPEPf43m8q?=
 =?us-ascii?Q?ZIyc5mhJ7fkn5VEMU2SAbJIpHMVuU8R01Yo1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:21.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacdfdfa-2ad2-4418-d22b-08dd861e4a9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

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

