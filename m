Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB6201100
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748592745; cv=fail; b=isCWaAE7V4ns758yz0RzATKNqh6eeZN9AxaSHK1hYFZUGf6PWmYKZtM6tbmSpD56P5nj9dVse6hhy286gXInx7CvEo6T2hJkkgTaxnLdH//LpMOB5jvI5ZP/JeneSDsNFKeg2HA/xhf6TwotQspABlt/0nDZllNZU8rKNZxrBjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748592745; c=relaxed/simple;
	bh=DTd+714fJWJiRgISYeK1AuN/RB3jw0ooOb+4Bn48yIE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J1ihOfCe7OUr8e3ei4l1MLKPei+2Cq3Wg9IK0dv9+cNMPqxzBgAIR72/ITwKNMI9I4d3285x8gjtQmrYEGNculE5GmB8MXZGp+bRBEx2LimSZC/FJSQPoBvfZKA270pGpnV/O9Eo7yu3bVAoafyENuNHpMCgKkTCCYTq2oSDQTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Oe4l7A7c; arc=fail smtp.client-ip=40.107.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Oe4l7A7c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJEsuY4msEaEG/lRCr+XoykbfOLP3IjkjE32lfvuIEzg9R81Axi5janJGc5o5TuTz1IcGXGC1R4iaEmPdsm9cl/mkx4cNzlKEir8UKI2fGDScxUfZhD5UABJED+SKlbZ0Y/HL2u0vLhTO//CHSzEIkirjJqxmyRItP4EDR3PdgOAzU0iOxehcyb/hKs9kaRrGcalTSMJG9nM/fiak0hc5KNfudIdUou2F1NisW5NPx+rbyWGMrj0fD/an4bFRIU8yXiOrnOx28UQilZ076Obb1xqcj2rFPuuUGq+oIaYOSvc0L5D4HjHoOhzrbjlBCuDIArbHk2Mlj+zpJjg4QWzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7o79EXIklUQPr/PXSd7dXNPTMm2nzV9TODg39nojr4=;
 b=kKSZKIHHhyB4uSpVvI5RFtYLhNAetkYaUvEHQr39kH/GpIm1lHR0tpcOEwKe0VDJMapBOtldB2WMhiEs6mm8xz9sR946VKFC/vc5jF6OPiKZJSfr3q63YN6Hv4iGcijWhWsaJO00sXdW2+pNwFK9LdLEIL4hzhDL2gP3OR6vHuUAN1l/sDpYbsmugAlVu+cEMnQxk61bBwjB9GwIiTEyI1tf1FSAtRydViubg7wfcVS1ghB6jG4uNPFY44U8sVqa3OrnHCv5yC0qXSZa9hI4PRFSLazYVkHcHGso3iOtdjy4yDlYR1Jnvv7lQUqN0qz994G2Krr6R6qd2HD+uI2nlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7o79EXIklUQPr/PXSd7dXNPTMm2nzV9TODg39nojr4=;
 b=Oe4l7A7cJvx8HP9VQjhXOH/XUV5d0BoxuwZkJWwUStWRtbRgOJjxxZHHu0HKfi10Np7hfsDBW0eLsN8zWrZBhEK3xh3D9kZ9gB5wUv4y+LYr4SWXckzNW/Yr+Y/Z3+x6Cfd53Yg5Wa6qA2pOZYyvFeQpJTomfb7hrAUbUwyCGDU=
Received: from CH0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:610:b3::16)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 30 May
 2025 08:12:20 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::b5) by CH0PR03CA0041.outlook.office365.com
 (2603:10b6:610:b3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 30 May 2025 08:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 08:12:19 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 03:12:16 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <Anand.Umarji@amd.com>,
	Akshay Gupta <akshay.gupta@amd.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] misc: amd-sbi: Address issues reported in smatch
Date: Fri, 30 May 2025 13:41:58 +0530
Message-ID: <20250530081158.121137-1-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: ce30cc28-a833-44ee-840a-08dd9f51b2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQRnzEsgL2/mI1fv6K0LRfRbDL4WCwJB3oWg+I55mqA1GWVnGMQQkj8/WTsG?=
 =?us-ascii?Q?7J6+pC0qfcwJFxcIWPSZUNM7N8Nz7gE0ljxACDGxIxVOUphFk209aAeCSrh0?=
 =?us-ascii?Q?ZSXTHdAaWjW2MEFPTO0l2vmHwsEDUBwjyTHFQFa2vzyIWx7qEYrXUi5oDNcp?=
 =?us-ascii?Q?EoydXqR7yIZdvlRIGyhveZsH9T6ZOrbweXjweddj+eeR0Al3ystE07DyF+r1?=
 =?us-ascii?Q?25x+oiOoMrZTl+GEmTxJzmizIhMkpVtoOL12nsa8QP+ODDUw6BavPu4DVhkp?=
 =?us-ascii?Q?7LeMsW6K90eDpcHD1aDlTagbDtvk4SHAK9V6Uikpad4wSMlEc7IuqQUuxW43?=
 =?us-ascii?Q?WtU00gpJkSkYaoE/BAe1CPUWoHQ4+6sYc2uenGUwt2gESaSE/ex37OwzJtN+?=
 =?us-ascii?Q?IIwXuBP0lykPWT1CyMxi7ad8INqoOwjtNmj88wO9BCGcehzJIj/BfobGlJVI?=
 =?us-ascii?Q?jJ2A8jxlfcJq/46UKT0gbtxZWmxsTMdK31mbrSujzgu23M3vwSYZ3ZqosCv9?=
 =?us-ascii?Q?/2URUFg2VR6IePv/xyfmNhVj7E98mJ28GB+ylc8GcbTfJlRV0FOULQuMV8sv?=
 =?us-ascii?Q?Um0twGR1wgsAR5gaOQMBbNYLEVN+G9GSBPSXvWfm2prE5CfNddafD8y8Ykt6?=
 =?us-ascii?Q?66SpwOqEmsMIxNgBGRTeKJRlSCT6iRJ0d8OWsFC10kO4MuxGmVmMgzgB759M?=
 =?us-ascii?Q?DkpxYGjR5kEuN3ok4vefPnw2b9bELGf5rz4rOIgRnZE0CfhER0dOu8dR0mx4?=
 =?us-ascii?Q?bWVBoLO9oNen6Vo2xCkuh4Xr4U5grm3qTh5bxLOydmSlEnPJq037Yl9QbRhN?=
 =?us-ascii?Q?0fNvKD9IySv4K5cL6sLtlJ1rv5R1vJyAneeZCSsE+qDP8nsEcKI6HsAseRNq?=
 =?us-ascii?Q?kM6pTj6/4z5AXbxaThTA+Oku2KGIN9PofFO9cqJirGBwFwe3ybAJp22EDkDx?=
 =?us-ascii?Q?TdyrQQvCMLxHhxG5tJLFXrpteVTcfVGEvHYfxAa2fB2qmI7ly8BOZEqfpltf?=
 =?us-ascii?Q?/2HfmfJFaRcJ3N84Hxa2xX1dcfsaw9nluM3zDVPR/OMAzfEo4WXTX3j6Zka9?=
 =?us-ascii?Q?ri9Kc+v/HA3T/vZg0oH8hMVt7SmfxOBMjQr7mN+ROsoO1QFhewXiTcuTW45k?=
 =?us-ascii?Q?ygt7RqHpIUYYe5cTuP0GAqXsxVwNG+vu92ua+5dS+tf6AY7qD1mSNiDBvCAN?=
 =?us-ascii?Q?EtmgUz7S9luEfS91cwhiuNJ81/XzdM2fhKZ1485Ytr5EVdrvgX7rVdl5iy43?=
 =?us-ascii?Q?9fj+JJnBs4nHElfItr9kJCvAtfx7rbGo53nIFbhji7o1WJs5nDRQ06gctu9a?=
 =?us-ascii?Q?vIj42xvGx+i8AdnEcAA4iqlEiCgMcsNTSSS/QM4YTdHWxKKAER2ptwbFrTZT?=
 =?us-ascii?Q?gB5oQJ7uqeOCPcFF/BGtnJHmQpMa3rrZJ9lLFbE4d3FjfAKx8d81MhoNGLlJ?=
 =?us-ascii?Q?SYi72CuJT5rCs5+QtWez1/otmE22pddmvAHuGXBk7FN7PXEg1/JNJb5CEWL7?=
 =?us-ascii?Q?8cGJjwgvYkee6UCLkZ2S3bd/eZyPiEE2ehSO20/maVNoV8CDaIlhOC2Xtw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 08:12:19.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce30cc28-a833-44ee-840a-08dd9f51b2e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598

Smatch warnings are reported for below commit,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?

copy_to/from_user() returns number of bytes, not copied.
In case data not copied, return "-EFAULT".

CPUID thread data from input is available at byte 4 & 5, this
patch fixes to copy the user data correctly in the argument.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
This patch is created on top of linux-next

 drivers/misc/amd-sbi/rmi-core.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index b653a21a909e..9048517c088c 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -42,7 +42,6 @@
 #define RD_MCA_CMD	0x86
 
 /* CPUID MCAMSR mask & index */
-#define CPUID_MCA_THRD_MASK	GENMASK(15, 0)
 #define CPUID_MCA_THRD_INDEX	32
 #define CPUID_MCA_FUNC_MASK	GENMASK(31, 0)
 #define CPUID_EXT_FUNC_INDEX	56
@@ -129,7 +128,7 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 		goto exit_unlock;
 	}
 
-	thread = msg->cpu_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
+	thread = msg->cpu_in_out >> CPUID_MCA_THRD_INDEX;
 
 	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
 	if (thread > 127) {
@@ -210,7 +209,7 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
 		goto exit_unlock;
 	}
 
-	thread = msg->mcamsr_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
+	thread = msg->mcamsr_in_out >> CPUID_MCA_THRD_INDEX;
 
 	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
 	if (thread > 127) {
@@ -373,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
 	mutex_unlock(&data->lock);
 
 	if (msg.rflag && !ret)
-		return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
+		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
+			return -EFAULT;
 	return ret;
 }
 
@@ -391,7 +391,9 @@ static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __use
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user *arg)
@@ -408,7 +410,9 @@ static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __user *arg)
@@ -425,7 +429,9 @@ static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __us
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
-- 
2.34.1

