Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F2275870
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379519; cv=fail; b=fcKsNP9jJNyCWJemwED+U8q8SAIa0ZvJdAKzQveRKI2Kajo7r2jjWjR6T4vtuhIsnq4aJdQXV4F4n4/UQntFvViJKtnCeRzPbAyg2pujuizwbjvjqhOvhJaKwBb5S2mS76n9UTFYHbLpLX/Qv7diI8ALNRssjGaF50M9l+fbDMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379519; c=relaxed/simple;
	bh=hIrQ8IRJL8EOBbSv34AERyPuXBrdTFT4nRHMeprwyq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVLIV2cH+p3Z9W/y4pEr3giIuG4uxJmQyuItMLHmXKj3/szYXUTTJYSgesqmXqFPu76DjUoalw+pHtLriboEd+mD7Lkgw8mQO3uIn98mSFWh/PmT/KgFuB9qf0/yCVSLgfmo+V+GmuIfO0ZNF6wMdUsrYp16GFpJVI6kco4JoJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CGpVCf2Z; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CGpVCf2Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8/PbCqAXpuE5v13HdG1RBZ6SaDwYao94Shvs6uQTUb1G1IMf+SiC0laa0iOFoDh81msQyU5tAKEyMSmS3pFXAAEBI4Vm2jFZ+Q20gEWodgAR35ORlaNbBp5COwbERNTpSepVwCG8DQjUdbkDmNLliiKEhuurPgIDowWlfOOR65IZpr6dapJoRdyWcegX9MhBEBbt8fdQeOzgxVjuo8TTyvtGaNdXEEUSWFWr1hmxpINU3A6vgtO/FsZJRzLcI6XDaUG8gn60VQOwQ2N1a4yUqCR1OwKbKI3PRvtNCDaTSlN6YNCexGXdgxNJApcvAuepEvw0EWqtNyv4ct1FCDlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCSlhyB3M0f5RuBAGGrU+uxeZAFt7hAlQWutqD0FpaA=;
 b=PBBNma5vEKZvyCCCUkEh2MVUC7RgVG5FmqS6qH71EGO6QAQWJTBR+tv3nUK/d2uJGS4FbArO/RXRJbTLNF7fN6bzmDN0wpXuwGEbOo0brQPMzCTHeisboqdOW97V89zOYvRpQ47f4ImpIt2otgoyMAHlTXGyQIi9Nl1ELJeaqY+Wis0Z0aJZtU090w412ilJdoxmJd9fUBGBNPw0L//lUQ1eADh2nxgTsnW4jDXgtCM+KW8jugsnP0uR7OTPd8vl68g7v/udmQqQntzNNmTaaQfgTkbprxoBIcEHp5CUi8+0Cq/MPppSxHzplvhyfbOMfOoy2ZlVdBEJ+XchmadVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCSlhyB3M0f5RuBAGGrU+uxeZAFt7hAlQWutqD0FpaA=;
 b=CGpVCf2ZpM84zgsjR7Ac47rkT1fSiJWiRKQIXyKH6hs2SK/ffN+gZGnVgvHm3A1ywNrsRvHVzPnu01QkLc66b/IqQcxb5o+EqyUjJHDpxUBEiHed1PxkmGTw5KGWbL5ahF91PEa+8QL8y+m6vnJhfpJpLT9a3mIueQirRI0tUY8=
Received: from BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::12)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Tue, 1 Jul
 2025 14:18:33 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::88) by BY1P220CA0010.outlook.office365.com
 (2603:10b6:a03:59d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 14:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 14:18:33 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 09:18:27 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <shyam-sundar.s-k@amd.com>,
	<gautham.shenoy@amd.com>, <mario.limonciello@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <anand.umarji@amd.com>, Akshay Gupta
	<akshay.gupta@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 2/2] misc: amd-sbi: Address copy_to/from_user() warning reported in smatch
Date: Tue, 1 Jul 2025 14:18:04 +0000
Message-ID: <20250701141804.385024-2-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701141804.385024-1-akshay.gupta@amd.com>
References: <20250701141804.385024-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 647a8f3e-13cb-480a-521e-08ddb8aa299f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mvJIdZXD/joXl/N5zaRrjFLwOEZEsCktHprI6IgcTL0VDwdVaXHZhP1kd6D9?=
 =?us-ascii?Q?JZfLUvbzzflSAqHy6c+OHeFGSBZZR3GvBH/hPhsDW2VbqxWllqooF01Lev+M?=
 =?us-ascii?Q?HDfYl/verBD3nU7gTr7pfYWmUmLdCW3ep9VCJDVIgY0v2i1UUrALlUMla/nq?=
 =?us-ascii?Q?SHG/V95+q6UfMiUcgiyirrDZ05FgLsXTJQktzwLdGwUjaK3ZWWersrmCGAFI?=
 =?us-ascii?Q?wxa+KhQBFgwbG5YIivsFfIRIf29x1ysyMS08ktmmoxOhS4xT43Ootj5yb9HG?=
 =?us-ascii?Q?u1TuyySlT4IMZAtk13c61WjeFjRnjxIR/eW0seDWsZ0ucSc8VEkyDItE9gAo?=
 =?us-ascii?Q?gT8SpTi7H+30ZKn4ue9Ry3t43SE2VOI5AVFnnk6tfLLvJeWbonn+Xdz6mJu8?=
 =?us-ascii?Q?Wr2Zm99X1Z5otB4jW3yY87BMRB5Q9imKEx7WtJ9tcNqzKzW0vVwZu8dYYi/J?=
 =?us-ascii?Q?23dkb68clClhiBWnXCcYdDLHl1i+IpntBULumIKWpiSZooQ+bYw/R8wM8zz0?=
 =?us-ascii?Q?TE5hB1KpcioNVLLruFteq94jO7v6OHv9SOahlJDlVv5j1rnTcYF+HTTjfY5F?=
 =?us-ascii?Q?N887Pyu77wtTbH/R1ferkOrnktnUjSSFnNte6fSthgqnuYskOk37KkVEertB?=
 =?us-ascii?Q?F+hABV+ix0Ln6V1XozS1Ghwmj8hwtGnzaptSZAmVF49zFX5rMc++fmRKX4UN?=
 =?us-ascii?Q?e5u2OOo6YMSMLSX4G+wzFNxzkodOItRkhAqQmxJqX5rnrO9K4iPkE9qFwIA8?=
 =?us-ascii?Q?/g8whreniIEdKBuXfg2Sq7q1FYP+NXjQGRUFSWtEtRRMmUd1vFi1lvJFX0Ed?=
 =?us-ascii?Q?kyvhN6KKfHpFVnmJQhUI6hORBVP73GLBIW1UTXM0d4uA9W654VN1x9EwPJKd?=
 =?us-ascii?Q?SM7dNliHWcsELrTY1vqKiAMAqruIfErwCQqFuOerC9HQ6SYX3ODRvnzdcZWS?=
 =?us-ascii?Q?b+yAaHPEG6LPyi6UaogW/R19EwroalB0TVY0nrow/Ekgf3xZQUA7RmtONMol?=
 =?us-ascii?Q?8Q+Vdvv2zT7fa3UgUzU06888G+AnvV9q9Wlw8sDR4i74x+6+VYbiQbBKY69V?=
 =?us-ascii?Q?3Wj9K2aehIuNea6A80YK4i/2oz70mYmnKUgXoUgnpcFen8VOlzxoXJnmc0o9?=
 =?us-ascii?Q?jWuWVLxkUFQshjfsb4gPB1s6iHLfYiUxUYw+uleUTm+1sIGLDC1+/w0ksHwO?=
 =?us-ascii?Q?1Q4hIzHKh1LoYcrDLQ2CFNpgM2j6WTRlTYg9783G1XsO+Rn8UCJNRTlP9/e9?=
 =?us-ascii?Q?jzrt3uVP8T9hyPbsdoCpsEv7BGXFHiLNJfhS/7dv2Q5f1drpzA8PSZ3gZXrP?=
 =?us-ascii?Q?U1aQztJKHamy7eugILoR3Q4VFgB08C+i2M729Prno2RP07AET3bnBa1sQjKU?=
 =?us-ascii?Q?1HHay6mOkZMKUcL9d1M5J9YmQ1IeEYnVIM0i1QcRhMm+cH29+1K6GX+wzICQ?=
 =?us-ascii?Q?d5vtw8tAiJO1IAOCCxMEwxSqKpciY4ylXaEAG3WAVHojaYOhNU3RaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:18:33.7379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647a8f3e-13cb-480a-521e-08ddb8aa299f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889

Smatch warnings are reported for below commit,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?

copy_to/from_user() returns number of bytes, not copied.
In case data not copied, return "-EFAULT".
Additionally, fixes the "-EPROTOTYPE" error return as intended.

Fixes: 35ac2034db72 ("misc: amd-sbi: Add support for AMD_SBI IOCTL")
Fixes: bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
Fixes: 69b1ba83d21c ("misc: amd-sbi: Add support for read MCA register protocol")
Fixes: cf141287b774 ("misc: amd-sbi: Add support for register xfer")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes from v3:
 - Update commit message to include "Fixes: Commit ID" as Greg's suggestion

Changes from v2:
 - Update commit message to add, "fix the -EPROTOTYPE error return".

Changes from v1:
 - Split patch as per Greg's suggestion

 drivers/misc/amd-sbi/rmi-core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 3570f3b269a9..9048517c088c 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -372,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
 	mutex_unlock(&data->lock);
 
 	if (msg.rflag && !ret)
-		return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
+		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
+			return -EFAULT;
 	return ret;
 }
 
@@ -390,7 +391,9 @@ static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __use
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user *arg)
@@ -407,7 +410,9 @@ static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __user *arg)
@@ -424,7 +429,9 @@ static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __us
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
-- 
2.25.1

