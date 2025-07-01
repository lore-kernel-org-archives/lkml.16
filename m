Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD723ABAA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348471; cv=fail; b=lDkc0/aXcjZgkqGqPDxt6LRiclEbw+RD1/L6/wRBya65BGISsY4q2GnUK5HB3Pq6vA4h65+3ZJrIVxGwAO0DCD+WoLUs/zvyQbj2pqYOK0T0mh5wuKfWSlVsiZWn5r4M+lBG7t93L1dQys+Jkw5OTbqhwVYZMS2A8DfcS74Zc8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348471; c=relaxed/simple;
	bh=ucr7/cPFO3kX54Uk7awsdTBdwlYjevM9JA65BDZqb38=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8sAGltmxk+hejvj74mjPLOiJhQQfEUr4a22AaOBoICtbET+6/k1BLBuu0q/fuatDGmjqPcLem5w67SA8NY7o3K1GlMUr+VDa4g/j9twv2CwFZwPMlpAMPwwfZJM/lRrUjlaK8A/IvF+qSYB2BY28nQAN7revhrkHSlLf+2HtZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t+J2CdZT; arc=fail smtp.client-ip=40.107.95.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t+J2CdZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XF1VTLV9dngG0G5RAlSSs0pSx+E775/y8d/xbCY8Mv8Vur5ZVfugIYTRXW39l80paQl0eJmSIdHZevNaJVVvMltYbK6bMes/5xedASLdpynr8fFfcsbSbw3DjCYj9t7w/9TcoiTGt6UK9x2lyC6l6UaalM1rnlAgzHNSzQBp00xNsCqtuozCbxE00Yw6XKjyHGqmRV3EcrPKtYOshTzVmrRYV+yk5RGP0GKkGjBbN/8m62etqJmFeWNYquQ6YSuS5Z4Ay9XjT/4Cow8+OX9mjlS/zJBXdt/lPhT6wnb3X+iwTEnPVoz569RXZLd8kw0F+D2JEsUTlPIydcYXQTmq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivaEraUrsYkoqahEWIOx1bWTSCv64cNSsy1Ilt+x1dY=;
 b=QUjwfBF+56XRz8/NFR3SLmNBSWYX5msC3s7i81Vtd2cpho9t8T6AtCu6dprD6n3WDPdjs8oZ0gSlPtCbH29rLG5OxyETj4D7EhTH4vCZoPGb51GYhY+mRS2aTvVWCzfdcLz1xlJM1nK785bZfJc2kadtZGxaI5dzciRJ7BG26I6oEXtu7gtAUegAlIDeGlczZPn7I6JYYLuO0C/DinkgNC+24yuRYe7l2J7cU8NMCbsYWETHTsChv4211hGYTatWNGb5UogSrxW8Tl1nreNlSyTnYUgvY2bZ1ofcK5tf/0BiW03Oxo/sBUepQKpS5ksUBxUvtJKb0tzctPecJQigQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivaEraUrsYkoqahEWIOx1bWTSCv64cNSsy1Ilt+x1dY=;
 b=t+J2CdZTWBdVRMczbF6bUYPvTXz1Q0qWj1I7t78mC5RJNAOCaI59Oazt+HzzwK4Ly2+1/xytvq1/rh5gxtHUhgMLOImyhy3waib0mfVLaBfHBhr8ZZZHhvTGXG8W/p4HdxtndPoaNHDWeo3my8Nw9gkRiSPGPuPVV6R6GZIyI/0=
Received: from PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::13)
 by IA1PR12MB7686.namprd12.prod.outlook.com (2603:10b6:208:422::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 05:41:04 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::83) by PH7P220CA0007.outlook.office365.com
 (2603:10b6:510:326::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 05:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Tue, 1 Jul 2025 05:41:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 00:41:00 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <shyam-sundar.s-k@amd.com>,
	<gautham.shenoy@amd.com>, <mario.limonciello@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <anand.umarji@amd.com>, Akshay Gupta
	<akshay.gupta@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 2/2] misc: amd-sbi: Address copy_to/from_user() warning reported in smatch
Date: Tue, 1 Jul 2025 05:40:41 +0000
Message-ID: <20250701054041.373358-2-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701054041.373358-1-akshay.gupta@amd.com>
References: <20250701054041.373358-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|IA1PR12MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5b1f5b-7d94-4a90-4385-08ddb861de90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X6bBfMJqaAaNo3ptj2Z8/MbIcg6ksqGCIYpNWm9/ri9boQMO6dIo5y7/h1pj?=
 =?us-ascii?Q?xwNOMv5VbZxVbU8SG6YEzHt2InPqo4rOMicEYk00vY+7CR8+rS5AAVH4Qot4?=
 =?us-ascii?Q?56rILKF3jMSBl4ATm4+D7uGxpVqJu8xMCVWc1nUbeLqv8Byj8F2ZRUVDJ2x0?=
 =?us-ascii?Q?HAdkeqd/xSg0kUZfcHhHLGplp847oS6nIQf6ro0tSGTNKkBgF66FhHgsa6Lh?=
 =?us-ascii?Q?7JCHHi2liCaz8OcUnoeGGVpZr+efHKDqXdq2nMiWTwvzc8S1726BBNFofjbr?=
 =?us-ascii?Q?sF7n57Hi3yM/AU71V5SHX3XGomAr4bx2Sn+yHP6hV5B5urwbMsUxKOe2ZrXg?=
 =?us-ascii?Q?zarl6SgEg87ioGbYCxejI9iJ/ZrgkFCTQYjVSw+6SiNVpxO+xhQyOigJ5wi3?=
 =?us-ascii?Q?7EsGBeqmWuhaoK+AySGLyY+/1PLyplY/CXGvcL0bD40dTs2WQH4ITQW6o0ke?=
 =?us-ascii?Q?mEfZidxCaJohueDN3xHDN+LA5g5D7DTzoifDteNNrf/EHxHrVJOIjZ8Pctrf?=
 =?us-ascii?Q?xiFGUDvlt/9NyjBzjR0nL3gVB0ZiYfEl0KPZn8eGpWPEu6K9xsUcghSULMPj?=
 =?us-ascii?Q?cOfMeSGmH5K2NcZR3VEqxftkSQvqGYz7mf6HkNlkIinoqgku1lStxXvmd7Bv?=
 =?us-ascii?Q?W1IRahMEaKd8Ny/O37ClTKzSgTFmWT/Hgk8BXSU0NdZPPKLN3jNcnzniAztr?=
 =?us-ascii?Q?RYXKAmuUp6JnynBRuydgNNPzxVPSScUsgP6KrDolAjgXqOLCB+0gANJyEc/s?=
 =?us-ascii?Q?3AJacNauypvv3qWRI+q+uCGgxjQfwbJxPMSSHtr/sgKDnnHuSOV5zNgEEoOA?=
 =?us-ascii?Q?O3Gt7RpGvX45qwVWU+TsknYVI3YQFAtHask/b8IowyTLlfWugqPSgsGMZMWd?=
 =?us-ascii?Q?EzRH2yQIr0xILd9QpMd6UTKnw0K6aJ3daYvtYvtilXI6n4a160TxT+2oDGYG?=
 =?us-ascii?Q?Tvc8vYOe936JMGhaTvzNrNnFeCfceFA7V22pUwC2TVez20lcyBsdnCWEqeJp?=
 =?us-ascii?Q?K2vnyyAv73r4OYedy0KfIh72Lo2q+KGggt+Txry6xTcF6Qvdz42I+36vTInA?=
 =?us-ascii?Q?s9q5xaq5xC2KJ08WahOI7XT2pgai2XKG8wLUZDMXIxR1S9gtsdG3likps/rV?=
 =?us-ascii?Q?ylWDkR0IAB7O+ICn/WZMVBLBGo1OvUCGf7LXKQ+gaJioE/uUhq9Qyi58DUvr?=
 =?us-ascii?Q?Km0+ANGTTaZaPtIDwoNXqzLWvevKH2af9c5hYOwD00vNaPtBGsh8WskkYbkU?=
 =?us-ascii?Q?RGAeZhPMnGrrHsR2GljcRCECn1MMhcgbaNJj7hcVAoFOgVszxLUCh5g1wPek?=
 =?us-ascii?Q?6rA71TNabI179yCgUuFG+8TObRd/oaaOzYGNNNH8AjA8teFIReV8T6DkKB3t?=
 =?us-ascii?Q?SIst71yMHV7jZt2Aa0FN1Vt32KxbDcA9ENuhRCA5XrrQc4xTXW60hDTvrJs0?=
 =?us-ascii?Q?Ry2iXfIJKkFhd/qisjgR/Zy2bwWjRq/h2NF0uXMMQNYDC2ZmNW+GPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:41:04.0417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5b1f5b-7d94-4a90-4385-08ddb861de90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7686

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

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
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

