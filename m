Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692A923372E;
	Wed,  2 Apr 2025 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573587; cv=fail; b=MOas5beZCmtD550cBCH0wzrN0Etygwsn0q2OsZ1yDwNO7v5nLoS/XgS4cbPkz/FREfW0SuZfn4DsJ9yifU5WB+E2zkrIi7hYprRc/OwTIu5xR0khMuHRnwQrcYtLYwXVCBcWH6FIkh59P69ff6Xnz31FU3WUxI7MKTOVGyLp5CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573587; c=relaxed/simple;
	bh=2L61tWF15GS0XjVazyZTGvGf3Rqxxs8rJVuVHgoCvys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5m4HeJkW8tWcOsJXQXUyJ9RU5Eqo356u5ldU1vecRnZTv5gNylsF/+ur3OAVxmNSuPmkU2z6/9frMSD/CFPvNr19KiE82fkARFIPAI1wH4ODWrGwPSRsMf2XGwDt2tfEI/SL5eZy6itT+w85OWeK5kMJGJJ5Z9VBgK/+hRB4p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M7BGK0Jy; arc=fail smtp.client-ip=40.107.94.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M7BGK0Jy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6nulLdV24gox5U6o5++X3tybUfCGOEcrBs/3FByKGfxLbd2fpHxXc9ffOzd4m+h+7p2dLqg3Y85Q2HlWTzDYb7P68YC9k3fs69EQfl1rO4eUwwH782WmAdUmk0CMqWO6EqFNIRtCFF8Z3eOn91icI7w3/Vk2oikzCJVR5hjLskT0vFI+TMbfM1dRm9C74zQnYeJvX/GJYe0vvuA9qS2MA1H8c36LtvH4oJBYDVjQBs0vYXlHhHMykvEuvdlRpum6tyuviYAiF17THwnv8NQIuLhPGKGN7DnIaEE8nIxPozrHOiFeD/KoMYwzVt6xpHEjfc/r7h1Qb5tXyZ7Prcc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=II23Cr0Ii+Xw4syfxzzYZiK0+yDu0Er7eCOyaHyZglk=;
 b=wAABmchK6jqM2M6ck5GDXLw7MEYnWgY1m92gckyHByw0N/evTBJw75DyWjoSU++DIgvacefOE5vY7t/u/ep5ptAMY51ZYRodUO1BbPMaoVGC6UTaz6HEsX+Aud0DcHzSE9XmoKwNMdF6tsbYXCHVDRRM7XDxsqBuJaOlNAEmKZxvPqe73CUxPJnktLdFFPU6/5GQNgCyECTP8lAXgan0e7cGFazpeXOSvQ7OE5qv/5VBvWtqjxEkPu1NEq9tsXhOBVyPMYflu/r+ClPgXENhcI4I69/9L5E5PukgN/8g6iwphmsjScZk5tBW8mymZLfbohjMGTPI1dMb3+gWXljrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=II23Cr0Ii+Xw4syfxzzYZiK0+yDu0Er7eCOyaHyZglk=;
 b=M7BGK0Jyd85eL796xzAZidfGeXJ8G7c0l1+4zaQxJOIyUMGbMB3gkbdAUhMhhlrsXD3W9FrLnpWahhM/XdNq+/WgKzLEWtk9dQC9IaSkwDkAO4yVw92syeVG8AY6bO/rPCrZ+0ERnorUvcPIQ/QF1mckHTdUy2OpZ32nEbJtP/g=
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 05:59:39 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::89) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 05:59:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:34 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 09/10] misc: amd-sbi: Add support for register xfer
Date: Wed, 2 Apr 2025 05:58:39 +0000
Message-ID: <20250402055840.1346384-10-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: c15659e9-66d7-43d1-236f-08dd71ab8da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vbiceMswHRWdKL+CWfreWsiv8AJNwLjqKYAG/YQ+T2lYsqbFqFk92Zp3jiTv?=
 =?us-ascii?Q?ljY4EjK5S8ZFnpuXTjgjeL1mJzRcDTpaEDMDaAYSYS3X7CmckyVrONhx63k5?=
 =?us-ascii?Q?gpXrTJ8CM3DbVWG6+3laBoeL4hIT+5nhu9QQA7/+87Na3dpcYA22852p+iPg?=
 =?us-ascii?Q?br0xoo19+lXldxku6fn4vVGZXQVSBUdu/qagXLR0wcbB1ryKV/aHhpcodWVE?=
 =?us-ascii?Q?38y1XsnXmGd9d45JdRmGwPzJWT+0GKeQoxMhcJRvYJ1A+1glvQ9+FBfer0p+?=
 =?us-ascii?Q?mJ1oR+mpuMyGoYdYrcrMZZaHnvHxjDLR6oq0ArHI7KqZf5F6Jm8D1SPMWJUl?=
 =?us-ascii?Q?dc0TOeQLjfLlax3oGwmcQLPGP/135mjGykGs1qKVQyrhzhJIucClvPkZJDdA?=
 =?us-ascii?Q?rPYjtp3lJvkbfbZuWKYTH1d8DWclpb8Hdn+fTGWsLvP1fwEnn86FDqdd9ldK?=
 =?us-ascii?Q?axZOvdpErzEMrV9rct8Gt9N9VV405TAji2MPZ3nkeSMeZWHbUoEJLsaSgChZ?=
 =?us-ascii?Q?VbRpIsv++hMj90GFeHRH42aG64fTZ+kifW3PYrZSBZ+w5AdIdNfLTnYOWGWp?=
 =?us-ascii?Q?olClxyXw/0RqSQXpA5DiUFxTnW/TyqkbSmyQEnYtYBr4uMOYwac1rqWvt88z?=
 =?us-ascii?Q?BrWFzPnD6StOqngc3q11vDqu6ezp9XRSBw3bAoppxDNbNSBv9VdH1W76/e8k?=
 =?us-ascii?Q?O2gGK84I+ik705lOV0ewLKMtDSaUAAwtB5IeFHMvrqSejqFMszxnWac1n7iS?=
 =?us-ascii?Q?JPvx4xuqScIgb7xcF6+vQAo0xLSAZLMF6GVsNagtWNNa2W/IMmAnqhyWJAF2?=
 =?us-ascii?Q?Ye1cYqB5ELfgu9lVKG36pcYJYMJEUpYa5YQCMtYw7ZJOnvmH0n0i/NTdpWoA?=
 =?us-ascii?Q?N+/7ODxoQvSnhlKpJSMbZ3iGQkI9mxY+9zV7DgqOIdp6XKgLjsDDql4GBT9N?=
 =?us-ascii?Q?AIWQrJ9uidFaG6nNOnORYL1eE0T1Ob55Sp/wKa9y5VtTEfDNzTPlRQ7aL1+v?=
 =?us-ascii?Q?gRXPSiF00pcK1NmuGmFGhHxzScfkV+HSgERFw6unVbR8mvuZI9s8ud9fcuhY?=
 =?us-ascii?Q?xKmvniLnFjFEu6+XgmxSWmhziXT4aXV1Epq7p0jpNGYirzjLL4U25WK+TikE?=
 =?us-ascii?Q?d3z4F0WX+Dx61w3KrA3p+SbKc3SWn4joFQ2LBu+mrBvbVAcbCUBEvo16xx1A?=
 =?us-ascii?Q?VA9tNrKwHJed5c9Go8pRcDuY6KvFTjf4poAIGerYjLqp75IsukMyVKMemiiz?=
 =?us-ascii?Q?mE0HwRJNnExhx2kHh6jPyQTS8J1WG8tTMi/Yjh86oGPIPZsCbh9hMynoCQmY?=
 =?us-ascii?Q?dAuLn+OhL13/6ArjwIfGKsWXckXtPAEg8Ty0r0cHUiyYxDsn2EUYeAkbvUwt?=
 =?us-ascii?Q?R66WA3PfqkkimjcSiGkKDGJQfuH0/afNKNJZeoPgdy6RVeQWGYRz0A5o6XdR?=
 =?us-ascii?Q?Sw5bkEtt7FXELbYGZVzGk6wDwnANP42XDoJ6U7zNNzMhTnctBqj9EEj/WWJE?=
 =?us-ascii?Q?7eQ9nRZc1rZOHYY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:38.4500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c15659e9-66d7-43d1-236f-08dd71ab8da0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874

- Provide user register access over IOCTL.
  Both register read and write are supported.
- APML interface does not provide a synchronization method. By defining,
  a register access path, we use APML modules and library for
  all APML transactions. Without having to use external tools such as
  i2c-tools, which may cause race conditions.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
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

 drivers/misc/amd-sbi/rmi-core.c | 25 +++++++++++++++++++++++++
 include/uapi/misc/amd-apml.h    |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 463bfc18dc22..6d092e0f4b48 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -349,6 +349,27 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	return ret;
 }
 
+static int rmi_register_xfer(struct sbrmi_data *data,
+			     struct apml_message *msg)
+{
+	int ret;
+
+	if (WARN_ON(!msg))
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	if (msg->data_in.reg_in[AMD_SBI_RD_FLAG_INDEX])
+		ret = regmap_read(data->regmap,
+				  msg->data_in.reg_in[AMD_SBI_REG_OFF_INDEX],
+				  &msg->data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX]);
+	else
+		ret = regmap_write(data->regmap,
+				   msg->data_in.reg_in[AMD_SBI_REG_OFF_INDEX],
+				   msg->data_in.reg_in[AMD_SBI_REG_VAL_INDEX]);
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	struct apml_message msg = { 0 };
@@ -382,6 +403,10 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		/* MCAMSR protocol */
 		ret = rmi_mca_msr_read(data, &msg);
 		break;
+	case APML_REG:
+		/* REG R/W */
+		ret = rmi_register_xfer(data, &msg);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 9993fa49460e..9e44621b0dfe 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -10,6 +10,7 @@
 enum apml_protocol {
 	APML_CPUID	= 0x1000,
 	APML_MCA_MSR,
+	APML_REG,
 };
 
 /* These are byte indexes into data_in and data_out arrays */
@@ -27,6 +28,7 @@ struct apml_message {
 	/*
 	 * [0]...[3] mailbox 32bit input
 	 *	     cpuid & mca msr,
+	 *	     rmi rd/wr: reg_offset
 	 * [4][5] cpuid & mca msr: thread
 	 * [4] rmi reg wr: value
 	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
@@ -53,6 +55,7 @@ struct apml_message {
 	 * Mailbox Messages:	0x0 ... 0x999
 	 * APML_CPUID:		0x1000
 	 * APML_MCA_MSR:	0x1001
+	 * APML_REG:		0x1002
 	 */
 	__u32 cmd;
 	/*
@@ -85,6 +88,7 @@ struct apml_message {
  * - Mailbox message read/write(0x0~0x999)
  * - CPUID read(0x1000)
  * - MCAMSR read(0x1001)
+ * - Register read/write(0x1002)
  * - returning "-EFAULT" if none of the above
  * "-EPROTOTYPE" error is returned to provide additional error details
  */
-- 
2.25.1

