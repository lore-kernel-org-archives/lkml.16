Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D2DF42;
	Wed,  2 Jul 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450990; cv=fail; b=mVi/FdKiHeWSA5qGAsC01aWcguCeT94Eh4lLasdnC2zDzE1aXO8VuwoEPQbTsJ+ONqe9tbayvAzDniXSF9/9r+EuVXltNIMWzxKzrO015Sb0wTKkzWIxTyD2W+jaQ5J+91YTmYlqHF8cx153kZekJL5DLWZJw6+J4P3ic5sel0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450990; c=relaxed/simple;
	bh=QsI57GrS1gWCkdyDHeozCh0F89Av06K6oYKc2XbM8x0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I915R/yZcPm0bWtNdgX5P+vnFZ0cWUm1d7K5DRl68XQf8VwdjU61j74TKI7cWrk+UitwOT8ETS5q4oi8W4ZL/BUQ8gIwJA9vT2KYWQwwXEGvXauf0L5z9OlyORmS2AOX/Bkq3JXM1Ozv25IRGyIuUGsWnvlOn8Ha++LDeYzjWHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gBUpx0NR; arc=fail smtp.client-ip=40.107.220.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gBUpx0NR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9BJHZ5SErBYsF8ej85JH9MgbKzGEKXL+n8TKymBOp3ejzE2Z9LzTqhdGFY+L1lRW13TFUZ731Xko5eCL9NKZ0hgHmoiG828tMwuz5B+jTq5VY87L2wKL/pXLJtALEwpiwz4E6Nz0En8LYXKPXDG1IWlJa3027hMxyH8JrtsMFeEQms3vVxceuJGlYHJavuN9MyGh6edXQSV12qvd1RbYNJb6WgyU9FtNQl9Gl3lXw4oA4oNe+5V5eH6abbXmEAGszIIj6sZq4n1MMsC5hitVEa9GF8kdKLLHLG//p6ZbjCwtXTOgr4hlhMeqneCIMQz54r45bdtmqrTZyj7mxtz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObfOs9STmGJZmbI71Grb5vPM9rKQw2qCGQTppISr8qI=;
 b=xu4xCt1llpG/gX9KgLUq5JRPtr2H9WDTgNtrZWiljHUGxJYKfCLT72F4C7Iu5/jU/UJ2DOEN/98LW1rdceJ/cTZHcyky2suV/ZTWcWtBoGiAf5XlhPcE5/nx+HD4jjUWVV7o/RxUySY198EDgMpHmZhPbyH2QrSay5kcGmZlFECzuzXYV8UqJ9Duux8BlLqJDnA2GwBBoDyGzKDiwiaMMTRcxn+WTPxdEWU1bzdgfRnIlJns6PLx2JVnapCZW2aZMUX4gVHu/4rclnupOn7ikirM+O8b7btrej81mJzJT7eDKWnuwpqzNZ1ZhJuWil4mPfIWh//N5+sagcUXy42MJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObfOs9STmGJZmbI71Grb5vPM9rKQw2qCGQTppISr8qI=;
 b=gBUpx0NRBQTgvm0WuAnh+UOw8Qopt9R/ck5BNQnJRPl67wdJ1+5TR4i5XwNRsUw7BtN6a2w8gmKRmAw2Z+cd7uJx+WxXxN42IQW3B7Ldha13nImenU7gisehPiVP5jhvpr5sW0XK/mP3DNorO/sR8AbF7cxX4sOQYJIjLdlbH4whmIU9WYgwkvLfA/PfMSHdur2tB1qosO8Md64PuBmwpyGi2Ah7rBlXzJwFct9F5Pjwnn10pg6UbwPfWMSCJF/nlzi2pC5rjiF6JXE29qN36ukxoPqA4Ov11pS5VM0RqmDRmdI6CfpOlyHJCs0Fwa8J1jBktkh2z2H1/lPYxeWxrg==
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by IA1PR12MB7688.namprd12.prod.outlook.com (2603:10b6:208:420::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 2 Jul
 2025 10:09:45 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::6e) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 10:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 10:09:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 03:09:27 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 03:09:26 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 2 Jul
 2025 03:09:26 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/2] platform/mellanox: mlxbf-pmc: Validate event/enable input
Date: Wed, 2 Jul 2025 06:09:02 -0400
Message-ID: <2ee618c59976bcf1379d5ddce2fc60ab5014b3a9.1751380187.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1751380187.git.shravankr@nvidia.com>
References: <cover.1751380187.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|IA1PR12MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b948d3-9b28-4c7f-d82f-08ddb950914c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4t1WK336JMln1RpBA5REGCUvubr3xHvMhHU40kmn13APOt5gJ/f7OPXAKXwW?=
 =?us-ascii?Q?cLucreQRQ75WrxkvTAbLYQBKlWNdkemHgEAMHs+a2cw6xZcLDOkTMOmTMASU?=
 =?us-ascii?Q?MZ+X9gCSeMC0l372i2nKy+zvzJLcVyFifN0laX09mb1EJCAccfb/0L9WXvmK?=
 =?us-ascii?Q?/QAlZ0v50wNTVWXnjvUJuaRMGPtdw8Xby7TR/G/4++ULRFlHF/skCW+3FvhF?=
 =?us-ascii?Q?QTJCl/HOXy4QWuj56O1A/ve0ZfyQ5rNZIFZ+rkDdovBKT0Eb4LYMKjIqfRr2?=
 =?us-ascii?Q?qtqlqaGPdPJ6BPxIYHZ+j4d+x4macc6f5D8uZJoumGU1gF3/gM7KivQZ0JYQ?=
 =?us-ascii?Q?PlV7CEXmfc7nz1VllcqhJLntUTAIz9w3PMc2eXG14fsDxHlc7r5xPNKQ11mO?=
 =?us-ascii?Q?ID7vfb3TrDsyG69SpD8vrsL+6nFwmlMEtwut5S9MFcy8XxshxlNIhBMoAqCE?=
 =?us-ascii?Q?1mpBIwrkuV51z2clqT+1pL9WJtr2upDHkr7TAPl2UHGaXFgnsvBg71NUAFNA?=
 =?us-ascii?Q?6jtL20QC2yD8claUQWrbB/B2Cwl3nFSogYwsg0I+HEA49TfwBHKvIbIrGH/v?=
 =?us-ascii?Q?PkoS5Y+wGnkLTD6TzhPj36bMxq8l8bra8uqIrnOiEzPblHda53mNi9kzENHs?=
 =?us-ascii?Q?VUMLzjzKHpexsUzTJcR+QgLHddiI1G/pVSiI9MtnHA4TvSCQJjzGe2eg5le/?=
 =?us-ascii?Q?P21ZPidC2BJtq2S33+YiC0GZDwEXu9sC2C+gWYqalsrHt2rA5tLWpB5zTnml?=
 =?us-ascii?Q?ewf2EisuarHj/++8NVM2/2wjMIuhVZnUpuy4QEMQ73AwrduFx5a6XsCPamTi?=
 =?us-ascii?Q?tK7EBgwKoHIEuFGXjs4y8P9plH+Vhn2aY7RtWpYqm1tW2XFCKKh2sKjINn5Z?=
 =?us-ascii?Q?6M4SXvqHwGl5p1T4qrJKBfFRed/AOyCw06XYesfNJbY16wSdHH2zMekhrNNq?=
 =?us-ascii?Q?wKF7G7VMsUbfoKap0ITWlC7UdhsabPHc4QL7eHxyQsdFbUI7WolgItYI8MKL?=
 =?us-ascii?Q?cEBUEru8fm6wBPwI5NqVhp1d8pomCxNo++r8yFiwy2XAhubSrajUhB6c/NW/?=
 =?us-ascii?Q?ySSck27YvUomB7NvyeiNaT3WBdSPXVVKxqj25d3Di5LHHNSqmkWQ9yvE0hhh?=
 =?us-ascii?Q?xMOAq+Jx8b7a1o+WI07rIh8rtocuHDfAWQAOhTuk8X9NMy6eMBBbljTILMfr?=
 =?us-ascii?Q?0hhp2fFoJ+6fkp0dLfOa1S9kowQK9wSccwR4rVa+DtjAvopA+V8XTAncJD69?=
 =?us-ascii?Q?y/SnNjsGizfmmdyi9RRFFTj82meeYDKS1HyDJ/aqaBDSUJ9Q/ibQnA8XdkzE?=
 =?us-ascii?Q?ZGRV8HIh71ID6weOTrx/4+it/Tp/CHK+U5daXYsgTElgpsVuMzmJ0m7XsNT9?=
 =?us-ascii?Q?dWe32u+AN21c8sWmDzuCK9hQdLYDGnks1bNZfYeaMMRdecNjSfaW6dWlLF0Y?=
 =?us-ascii?Q?CvokZ5hqmx3yg+q8P45ITnDwWeV82FoPdcm+w+6+D36hg3SyBqMjx6giL/k7?=
 =?us-ascii?Q?4E661htQY3VQjaLCb66sMdi7/u2YUKJwWDEP?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:09:44.1421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b948d3-9b28-4c7f-d82f-08ddb950914c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7688

Before programming the event info, validate the event number received as input
by checking if it exists in the event_list. Also fix a typo in the comment for
mlxbf_pmc_get_event_name() to correctly mention that it returns the event name
when taking the event number as input, and not the other way round. For setting
the enable value, the input should be 0 or 1 only. Use kstrtobool() in place of
kstrtoint() in  mlxbf_pmc_enable_store() to accept only valid input.

Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 9cc3d4ca53cf..9aa8de1122e5 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1223,7 +1223,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
 	return -ENODEV;
 }
 
-/* Get the event number given the name */
+/* Get the event name given the number */
 static char *mlxbf_pmc_get_event_name(const char *blk, u32 evt)
 {
 	const struct mlxbf_pmc_events *events;
@@ -1807,6 +1807,9 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 		err = kstrtouint(buf, 0, &evt_num);
 		if (err < 0)
 			return err;
+
+		if (!mlxbf_pmc_get_event_name(pmc->block_name[blk_num], evt_num))
+			return -EINVAL;
 	}
 
 	if (strstr(pmc->block_name[blk_num], "l3cache"))
@@ -1887,13 +1890,14 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 {
 	struct mlxbf_pmc_attribute *attr_enable = container_of(
 		attr, struct mlxbf_pmc_attribute, dev_attr);
-	unsigned int en, blk_num;
+	unsigned int blk_num;
 	u32 word;
 	int err;
+	bool en;
 
 	blk_num = attr_enable->nr;
 
-	err = kstrtouint(buf, 0, &en);
+	err = kstrtobool(buf, &en);
 	if (err < 0)
 		return err;
 
@@ -1913,14 +1917,11 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
 			MLXBF_PMC_WRITE_REG_32, word);
 	} else {
-		if (en && en != 1)
-			return -EINVAL;
-
 		err = mlxbf_pmc_config_l3_counters(blk_num, false, !!en);
 		if (err)
 			return err;
 
-		if (en == 1) {
+		if (en) {
 			err = mlxbf_pmc_config_l3_counters(blk_num, true, false);
 			if (err)
 				return err;
-- 
2.43.2

