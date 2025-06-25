Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFEF29DB99
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849669; cv=fail; b=SEDvMx9M9jCSqS9/GXQm8rfIbyCHOI9ssnJefAiVOuanGCZHBq6nnK9TD6Y36pUAPXVZ3qLZx2C6dfArPK0M/9YtZAA3vZfq7kEXT9mxQxd9Zn6iB9e69i+dp17zTiJ7a9W+5snAG7AdjORVr7KT5WxeYmnV+z7+RmMTJzm7JN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849669; c=relaxed/simple;
	bh=OnoxouYxixEjot56u3L41Nrxane+AGlmkMYKZocYniU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U1SB9sbbYILeqAt5nswZuX8/G0xk3M0WEJaSIW0RKUeuVW0GN6Wcql/rl5eiRv0hJnIfLGzwCgwxwxS1DebfItERDWXFwJV0Y/CkKuib49u3p8OLFh5XkLxRPKqt3dUUv3zB8Sr0JVFy0O98ebOXVBPEirurS1fPWTDbXAJtPMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E2BdUv5K; arc=fail smtp.client-ip=40.107.236.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E2BdUv5K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGSL8jbwgexsQl0fasUwo/WUdR8hsT8jn2C5OQb0+tPBCi/1wqR2vBMVz3a35TFPlHg1pG9xaKOCWti4xDxPKXUKcYtrqPVbo9IXWv2thOXW3mdbLYos8/oL/Bo0+wrklsG0RiXRPQlxLbqZQJYfBHloK5roonDWlOY+EFSpbmadYD4okUN1Y2egM9rzZ1qlSt9v3ypbXK6TG9zCb0l1jK/lXkykbwgr57dpi6KgK+dIQaLO372Pk6ENMtaJfcio3/ewHc/GRbz52cPOGZmlYBzhZ9/xix4XYQYv5y1vapVIciXfIiphvgdlSSkg17x49/kM7iczrAOJIdZIAEksow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujRcOYWsxzmN/MPj7Rt5EJR/Of488e067Ik+aRDVdmY=;
 b=uOncnZ3+bcPmIBW8Avg4aVzWdlyGyz4W68lgQmKqLlWHNGKws1Qo9wcOF7W11c5GNXxkKLkl4BuMO6qWef+VFa/8j5CLfHwS/BGUlTQ7sXCF+++8vf/cQn2k0w+20qrHmTNi52IF/zwQEgIcgDuLLI2xTls8F9oaCVNzNGYt/5ZHGttS4M2hRXPMhaRvV3VY1lz/WcMVKZaiflXag97c4X1trv6UYKrakLTPYSATsU39XSYDP/m6jBhMTuClrX2TMnM4YwvPQDYNwZ90oT2OdObeYqCzWzqvKz974JPlgwKimb3ZCgcceNgeu4JyuCQ5qrPsObHxNkAHh0fLuK5gYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujRcOYWsxzmN/MPj7Rt5EJR/Of488e067Ik+aRDVdmY=;
 b=E2BdUv5KQph50wZH+BKJua3vrDgPyUUBLhxuSEhNm3BQjd9OkPlsUQXyjLXMFLK+rVlmeVlJPHT5WjNBU25cFFW1TFJ+Yf85zUK3oOrU7kknukdPaICgHKO6tg6kSBMHRo2xtD0ERgFGmcsjylVBSA61XL0aoJBf7v73FkeZEiw=
Received: from BL1PR13CA0281.namprd13.prod.outlook.com (2603:10b6:208:2bc::16)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 11:07:43 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::20) by BL1PR13CA0281.outlook.office365.com
 (2603:10b6:208:2bc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Wed,
 25 Jun 2025 11:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 11:07:43 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 06:07:39 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <shyam-sundar.s-k@amd.com>,
	<gautham.shenoy@amd.com>, <mario.limonciello@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <anand.umarji@amd.com>, Akshay Gupta
	<akshay.gupta@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 1/2] misc: amd-sbi: Address potential integer overflow issue reported in smatch
Date: Wed, 25 Jun 2025 11:07:06 +0000
Message-ID: <20250625110707.315489-1-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f0059c-8bd4-4743-290c-08ddb3d881f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/3Ytep54QN5j7s48NGlVGJLjZtDe+f7ZxvbWEm4tM+4GR+rI0mNmhz2LEPLg?=
 =?us-ascii?Q?XzWRjm0zyzEq5NKnwluRQfxsldTW0kAYd+w0J317xNmZyxeQayuX3fm/utLs?=
 =?us-ascii?Q?3XbwWvvMRqyiB7E1pcbZifNJiSU1/qZN6cqC7OEQ+VgX+mDpkF9N2IKy5RXW?=
 =?us-ascii?Q?AjCD1ASYtNCIKd+6mpoF6+mh9AJVtpErXdANXv5McDZ34w4utX/dpkknR1A+?=
 =?us-ascii?Q?UBNApK/HcNcmRpT/dOoN47UKFm0dAfB86VKsn7XXNaLaTbJmQVqROnbl3WKh?=
 =?us-ascii?Q?G5EBA3R0pcXjnVQyTlzD1K708vZEvkhQ2UUmNLwVvLNh/hmVetgGjzi1kdsR?=
 =?us-ascii?Q?kUUgfnfgTrnvm25P/94jI3An2EpgTncUIsKw7znkTrGwzFmlhJVvgYIr8N+X?=
 =?us-ascii?Q?xtPNTz7rPZifjE95zJNP8rXXhGg9zgX3IhRWhlY4iBlt/Zp7d0P+fVo0PT9U?=
 =?us-ascii?Q?VoR3gwKFe3aYq2NF2VCagIhI/4V3Zk5XWuhe1mcwypsm96CpQOX7t0pH8bD7?=
 =?us-ascii?Q?hLfQJQb25lcAjwqvuUPrwJAqKt4u1xzJVE5o33/q04MPGNwDBdrYOMlaV3Rx?=
 =?us-ascii?Q?C6wVOAEpDA08hm+uSW2E+Kzgs52oqMtjmDR7pAbSMMaO+mDuwaHe2nJ7mqEB?=
 =?us-ascii?Q?vN1SN93ApPX7pNsMTEG9LjhtTUoiFRkgJEpcAo4akQvJIoU1QcDtagju0u0G?=
 =?us-ascii?Q?RU/aa9jKDvBONlPG/JTSca6IIzZUjAjJuoYIw9i+6bV3moGogdMtIXwZ8bIJ?=
 =?us-ascii?Q?mZs8cVGbJcf42BjlYQpzX7b88Y8NA/Wfj46TzSa0TJGvi3I5wL712+7WpjZu?=
 =?us-ascii?Q?OW84rq+P32kzO5SEMhUQ+e32m1wgPwt5Yq8nRgTekdygGM2BamhYh1b530eR?=
 =?us-ascii?Q?k2PaGSfwmIH/Rzn/y99RvTEfAMN7CCt02gWPnRAZCBdtItdh0T7UCJsgG2b/?=
 =?us-ascii?Q?4S87+9S6KnMr7BIIt1A6oD87POveanLQ9JzFh0d5ODgijq0Yt36fAZQxofvq?=
 =?us-ascii?Q?QGsEebIJohIffvdkqjAQ5cy0ynmD+aeNJchuE3ExWZeWySRKEloMJ+ed8NOA?=
 =?us-ascii?Q?u58IdUvOmzzmjbICXH8IXIbpuv/nb58nWKpI7Qv96xC+aTeM5CtEb/nk95nF?=
 =?us-ascii?Q?PbFtU+Z+2IzhoI6WsC9hHWqvXYUkWqs45JJxhkl5JxCCC7T5s+QOmtBKgugA?=
 =?us-ascii?Q?fJhORIeEDLOaILL69okXz9NsB2EpCMrK2pGGP4M53pKxzA34zqkwnowkc0+I?=
 =?us-ascii?Q?W4T8tSulCv7rj7HGl2GepzKWmwdjLJ5PntMQWXnBUKjGR7HyBvxU1fZHS8LG?=
 =?us-ascii?Q?fgrkPex8/ao1o6ywnlcauVVKj+xqwq/XYAtkstYmI2ZtyLYOV/KXY8j6099n?=
 =?us-ascii?Q?pyAGFkyMqrTSLC9DQd3PpUmvS2zHetG5xwYwyMd7mHKO7ikmBePITRLwEGLx?=
 =?us-ascii?Q?O42f7B1qktxruJdU9gbgHqrNq/6glH2EUJgLGvkOF0gugKivqLbBy4ydkPqk?=
 =?us-ascii?Q?psgeVrrzYvPPwS8TFHRJMVkiDEz6NN0AyLtqK7FUhHySPj1QDFScyc7Z6g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:07:43.0935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f0059c-8bd4-4743-290c-08ddb3d881f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081

Smatch warnings are reported for below commit,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'

CPUID thread data from input is available at byte 4 & 5, this
patch fixes to copy the user data correctly in the argument.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes from v1:
 - Split patch as per Greg's suggestion

 drivers/misc/amd-sbi/rmi-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index b653a21a909e..3570f3b269a9 100644
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
-- 
2.25.1

