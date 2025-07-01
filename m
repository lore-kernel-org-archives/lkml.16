Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F87E271A7C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379513; cv=fail; b=DAo9u/4oGGo+ZXDzYFN/uwwk1X3FZ2fHWMfmvndEJ18tfTg+Me2Is/x/yGLuttYMQS/6efb9nip7kYV9fgHzYQNdyaxiPXvxEzvrRVLrvoTRZe8v1VoMtX1a3XwinUpkzfppLhbNFNtoeIVKnxssBUOPIE37HHHs5d6DCulwF6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379513; c=relaxed/simple;
	bh=SP1udluasHRYiyDkah9MsLjKevRONPq6MRMDGqiMgDY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PwfFaQfcfa/ejghVrTdkApQzzZ4tODC83Jga6shq8EkYwHoxjAl6WxaP2hPPedj9ewMkp3ijIwRkzVg0RkAZwiAqELlCccmr47oljyyWGcywtMVRUHzsYKmRmqq9CWwMaJebZHc5MSP2tU7TnUa7NzQYuN6TNzlgACST7idYlwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0K3CDljF; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0K3CDljF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhE5bCwWYMQUVBoxeg0uNPUmP6a6MVgbFgdwSrcYbn9WSsdPq/M2AYjc67D04v88BwX2MwEOgtbMdw+Skr9V5xPep6icF0XT8VjRVT3hd+AuvDN1Np5uYhferJaE46bRwjd25BtND0sXCRT2E97jlbTua9RTidR4c2QrFIKm1CVgP0tW82kW+zMlUvotqHHDgGtz+Y13h5DUQnvMKgmUN6ikYspUnc0L34ws6xbcHIdip9ttkDMyNrawhdO46h8lkpDocSQGEuA1CBSJsC72XfnRyNNreJwl2joTdzKBQ7CUWOzDA9W1eLonglgmco/bp3OJNtlAfrvtWH1pmvKOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=065SpLnWemvRKlNaFYoNKiIeZ6ppYYWoBxziyGYTt08=;
 b=VROliyuWWyfSDLY4s7VQeNKB2Yu78TjYi77K6Jqonty/67XIincFLWysejPpOQ9mnzw/9SosleA+7xcllRoQZ2wiZvOLnLcQBBis74dBgvG9XHNeRt3uUREYf2HMBoTmZqltJxyjXTLmt4nsflKeWsjhSogoIykSIse3Mo2DSvVWk990uU0tl1ha7bPhjEfwoWJabHFeDXnWqyyc733TQvZIEZll+TcWHlZpBorXSaJPWyEFvJPSns3u1Z5/CAHcSWYg5JkIvW4dC6A946Ke5j486biNGcJWbWb+mNDIieQtoWRmx/6X+KvpVFWweAQiLttVMCVk3h0hnOKV4HcKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=065SpLnWemvRKlNaFYoNKiIeZ6ppYYWoBxziyGYTt08=;
 b=0K3CDljFJ7mQkrfVNNImyEO+Piu0p5Isn+JLpg+LRzdtRAk8q4lddp5dpsJxUimOMO2KOplAZX2mQja5TtVihNABnprfe/h2iWYoWfXG0q55q+A/5yf5Tdpsm9Hh63xPBS/6kAo0JDuiK/PI/L3KnW+Q056mdLmBaom627J5WHY=
Received: from BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::13)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 1 Jul
 2025 14:18:28 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::c3) by BY1P220CA0007.outlook.office365.com
 (2603:10b6:a03:59d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Tue,
 1 Jul 2025 14:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 14:18:28 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 09:18:23 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <shyam-sundar.s-k@amd.com>,
	<gautham.shenoy@amd.com>, <mario.limonciello@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <anand.umarji@amd.com>, Akshay Gupta
	<akshay.gupta@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 1/2] misc: amd-sbi: Address potential integer overflow issue reported in smatch
Date: Tue, 1 Jul 2025 14:18:03 +0000
Message-ID: <20250701141804.385024-1-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: f259eb4c-89f0-490b-014f-08ddb8aa2666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i3mMOkPE6LjqFOUGF+dLztyR90GOHAI1Oi41tbItv04EzTbsJqSXmF/qzJ5c?=
 =?us-ascii?Q?hPcLUFTGQ9bxIu0UTFBcVMizK2v10GQYwdSVUa/CFio4oBZh2utjZg52+FtA?=
 =?us-ascii?Q?7JQdmCyrYEC/S334nSZ+pzJts4tSxt4p0WZVbmTlAobb9Q+OQvnEyLr9mYcc?=
 =?us-ascii?Q?k2ZwWCkFSCQVPNg4yB/oN9YRorImdnPuxurBSZD7ulbvvpajCvyhTnEdu+2O?=
 =?us-ascii?Q?+JHtLsEmB2TSxtkB++TdN1PnDJwwOHETWlKHwTg+ckAZCu8dcRw80nPuQjPs?=
 =?us-ascii?Q?zRAUWKyIWr7m6lIOpF7zWBtVqWbpeavODweCHXwCye1K/zj/uXFi2pc9X+8B?=
 =?us-ascii?Q?FnRE9XjMhoINir+9OayKpZwiXIqR4qFWj09yYX+nnzRlA330r3m0Xh23S/jw?=
 =?us-ascii?Q?12B6QuwSZt+q22FFYoBjfwJjFgNwG3soNC513QqCiMcZ9LfXi6sN7NchwUMR?=
 =?us-ascii?Q?OMmwwuowe35PBgM4JRuWhE+OHedJDPb63NNBYa1IhhsIiumxvOXXwLxi9xI9?=
 =?us-ascii?Q?+YR/SJeQhB124pjov5DnfxjtG/1ErAr9XID9ksLQ9G24YYr31y5npZY60wZR?=
 =?us-ascii?Q?M2IYhxDJ2C7ZRT2NuoNg92SMNFBg9PxJyrq2zSk7S1OFVHTPAQRy4N+2oL1m?=
 =?us-ascii?Q?HpRKsNTzkxFn0cpzZbMjzlTw0qCNyAa4SI+SLk8IRsf9UE2bF5MNdHxajTQm?=
 =?us-ascii?Q?2nBJVhz+T+R/XZiXqxy45O9+DUnpaNgtMIj5CxNw/gPk4JnlhuJ9k7U9Xijo?=
 =?us-ascii?Q?OTVm9gdv0tav3fQomiqIR5BVBQS+XabemiY3ibmMlt8trHacjnn4mcsw93kg?=
 =?us-ascii?Q?2RS5+pKVpvAh8OhUwPl3SyrZlxy2B1sZ98zFY/Wx6j173ChqiKnFrYf5MBy3?=
 =?us-ascii?Q?DrNjC56kraDEjYHY0fNLteInNqg1ZwzmDGMzt7EG32uasiw/G+1daiLuvYD/?=
 =?us-ascii?Q?+bPWvaduyfVCwo6P26uQBa7bJHOAzrFAPv7uMASbCTQw3QSR1aAfJjH2NlhN?=
 =?us-ascii?Q?66qExSXL6cgVFswojWvLw7c3W+qTOIFfwoNXtadHd8XeFPuTTIMAMjglkKFP?=
 =?us-ascii?Q?0N4/KlHQux1sAN81aqfw0G1KPtsgwt+VANeWxh9kxYtI49+ttxIvKAwbSCVA?=
 =?us-ascii?Q?U3UlYmT7T2i0AVh0jbIok84Dgkg31ACxHJjlazS68iGXNJVOXO4atqPErEy2?=
 =?us-ascii?Q?uYr7i+frNigJpL2jfgSXm3IEqFIOx5SIO9y5KFljSKQ2XSJkOBX31lG6aiUc?=
 =?us-ascii?Q?Rg5e/IUlZDXYENVD9tfGYqx4g0Fc4eIgtLqSS967BSYMiMhy6V+qOGqfGsI/?=
 =?us-ascii?Q?OU8h+D7w5j+yZyE0b0Dy/tMeTGEGLLrhCddvmLcMGUvnNWw0/GBueSU65Zci?=
 =?us-ascii?Q?FpplyTg3mkM/4kaBbOVqxsEK5W5V+fIEn68rzIVG/3p2dUJ6UY8Qo7A6ntBB?=
 =?us-ascii?Q?5CTY7Y2esuXYUrkd//CrrLF45gZpnpRzTum1GKZmAbZtIokjlJluaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:18:28.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f259eb4c-89f0-490b-014f-08ddb8aa2666
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575

Smatch warnings are reported for below commit,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'

CPUID & MCAMSR thread data from input is available at byte 4 & 5, this
patch fixes to copy the user data correctly in the argument.
Previously, CPUID and MCAMSR data is return only for thread 0.

Fixes: bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
Fixes: 69b1ba83d21c ("misc: amd-sbi: Add support for read MCA register protocol")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes from v3:
 - Update commit message to address Greg's comment to include
   "Fixes: Commit ID"
 - Update commit message to include MCAMSR thread data index fix.
  
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

