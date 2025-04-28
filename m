Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF81D63F5;
	Mon, 28 Apr 2025 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821883; cv=fail; b=RJWF3/YMITIRVSajP91KfEA4Dp58LAga8ztl/wrpcXxQEsNP/54Hd2xfRfe0uD/D9d1pA0e+YtYwuWgFesnAAjkMCTe/VgaJLlN2+1MK6N3/h3D3UxZh5xzIiAbe/zCfKcLSJmDKyiOcQGAPJDQjNTyG4/H50PXnpM3POM/9yS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821883; c=relaxed/simple;
	bh=5GtngUwv/pFLVs/5jP4e1YTBT+QZloysFbMq2j+bxzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WurDtDw2ihSftgcjkIghpbgqQ0gC+vhV1Kcj+xpPq4VvaneoY/sb9cZFVF+vgrGFP7XPn1Lt0qAa4pmH7pkS0QdJnCjKp/oljXnDuLa13+Aki1zD93ItiEWJRn81a+3Cfj7G4MQe3HPf/fgei1JiXj9fVW3faFZGkowAje5akFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tQ41XWN7; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tQ41XWN7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbqdCP0XhR8qG4u7tAwtHMjhC/rUDe238QbDpkTNYWrjLur7AU/NMpytmcfeWIpU0zIzvn4TnHqDqwUKQ7zhzz11YUUQ62KXev9SU0c9wgH23pdUPPiQD0j+IAQ8AvN9tUI4TwtrhDXhc7QVvcya/q6pbMyGhCKzvKRNCekEvSUiF6jYNyzOcIcSYmQ4b1EbFHWLB2O0f1IovVam2E4plkVR0luP5y6Chq3ejJuJmJznSixGzGm2/gvB8EVpDFtsJqpSaHgmm2DYnI1PVd/eXaXnvpQnzO0nz66TDSfhr7VkqNo9ffLzNrNLvL8ejCPoTtAs5DDaq6I8PirYaGR0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1pRsfusff5dmd7COF46Efmf3bQtvGWyrIdbo/pp59w=;
 b=gGuet79jUCHoXzgCewb+yOxJBEzBHtblkzwHGIdWTah45tI+7zyMU0ZjRiaSewr6ov091IvLiZDn3Y6IFQlYm3QIlE69pw3mkFXbvyEC8sZrVD76rz2l/7cvdSO6SAxSBPQqncG0+9xhaE45AI/uu3Zv3gUaGw9x3w+Psp0yO+xqTUN6OrfYu+R50ocw8vwWfs/Qjm4Nrw/qcmhCwuGvBGrOafPEy3qppBmN6YPjuIw749yUaaJKA5POczlFVhh5xAJ8xNjy1tOgK/YlgwT6gi6FT5Fw+dyCzGcTe7ha0hXlvIaBee9YIQXZR0nt0lEG2rhoD72j+WvOL0z4L/5CBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1pRsfusff5dmd7COF46Efmf3bQtvGWyrIdbo/pp59w=;
 b=tQ41XWN7HlEobDoj+1N01g00tE6hcB3ZTqww3l8mZwxS6kro9mFiI2ZWSlv8EOmRO8CD769RQz9lDeDcb6Ts+3YSzBaE/dbprk+VrnNj0sLo+CiprwdFfx+a/YbcAqdItinxr9mFbwC4uOhGhRRjI92+0nccy7kyuucZufe1+ao=
Received: from SN7PR04CA0087.namprd04.prod.outlook.com (2603:10b6:806:121::32)
 by CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:31:14 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::6c) by SN7PR04CA0087.outlook.office365.com
 (2603:10b6:806:121::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:31:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:31:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:31:06 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 05/10] misc: amd-sbi: Optimize the wait condition for mailbox command completion
Date: Mon, 28 Apr 2025 06:30:29 +0000
Message-ID: <20250428063034.2145566-6-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 726626b8-941c-4370-7c86-08dd861e45ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gd4tg7XBth69CEm2nUbzf3302aKFSzIU8Qsfftvdm1+AFtxqyEYO+BwtCObx?=
 =?us-ascii?Q?INNAm7g2a7j3X+upPx3p+mEEqH/zV2aXVZJpj5gaL74dBTU1WWM+UJ/ZJ8zR?=
 =?us-ascii?Q?S2W0ENe1q5Q7xu2d34XwUXy6puXckYIX1PNa2AX/y8jPl4f0sWWMBYRBV/FC?=
 =?us-ascii?Q?kCrBYlNHC3voH02a21LzbwDZV3Uolt1veP/Okibp6Q2EQN153B05qOO/0L9t?=
 =?us-ascii?Q?MpbUNOkozWrGpMj0zlB0xbUJItboewp4NKwuVlflaoWuXprdKHbmFN8hrtiW?=
 =?us-ascii?Q?0uO7h6zou4bpo7kQnbZMxMbNk5ejutPJRpw5DEOdXfMh3uZEN94I8eOwI7Qt?=
 =?us-ascii?Q?QAO6C9QyadSdWofvj779CZE4FzKiL4Y2sr3mwoLaw8U6VTj/2MeAEsJILVsG?=
 =?us-ascii?Q?wG2QgXNXFsliig1hC3UTnDdAydFnmo6IFOFYlGfnUhO0lXTXsDBHU3YGAsZs?=
 =?us-ascii?Q?uIfrvN8iB9iA0d42B+Iq2tDzYf740IzUjXANwFaxRydllcmF0zbz7ztezTCb?=
 =?us-ascii?Q?SHPLTrUw1qnb1ML97Jn8GwAb4b/XE5hNwjpwfVmHbkg9CUQxw/axnT0UtwQu?=
 =?us-ascii?Q?e3HvZsOycGbjvKU5MReyPQb107hEIEoaunw0DWSDrqjJc0WeL6vZX9aBHn6n?=
 =?us-ascii?Q?5/Cc7PmiHFj27jFkWuVqC3t0nDf3cBVGde5DjA3typCCweomzEjnENdMHvsy?=
 =?us-ascii?Q?8xCu+kWOyqgovVKQqFTrsf1u4SeGNYIphkawfsNqU4lYNhj0UfYiCpThnVi8?=
 =?us-ascii?Q?mQHam4G29y0IJFOyVwuA6M3KEfLGRZxVw1pR2uOh0KiKia9fYec5kvqpmxcU?=
 =?us-ascii?Q?+SpiLDdzw76d+7wBXiiucGIKQcYiTCEZxmm4icN2u4jXi+A4YFbC9HZ6uEuD?=
 =?us-ascii?Q?kLo97xxr0NO4SaIdhSKBfBfKhfhDm8s6jsoYFwK+xxx8aYiTeH0s9sbdu7Np?=
 =?us-ascii?Q?/cdrU+WLCSQPfA3Gdmd9wGxeF9VhuYjYrgwiBKadAIq8aJjswkfGh9hQA70l?=
 =?us-ascii?Q?5Da2vb4N78MMZyFzZlJa4aFzJLOSbNAHoWIYXOygmjswrqmFn9unAOekKrtH?=
 =?us-ascii?Q?+L1Kzk6ykBMCA+nn8OXikUK+0CvabrEiaepBPizdMkI0mu+lvj2apvHpLb0i?=
 =?us-ascii?Q?g+wrs7Ofe264s/2LdwyhL0Tf6sMOhQ6aNcgelD+BG7vYsfN16hRNBH4KqaDN?=
 =?us-ascii?Q?0fFwtyiEpBjkLSz087jsdj+B//AjmdT6hoWWUkXM3Q1EnSCmLsFo4vFhAvmI?=
 =?us-ascii?Q?+1fMYZElV66+Zqhae73KLR8ZTX6HjgVzoExSe9c2sZb/GONLLd6BIfy1inDZ?=
 =?us-ascii?Q?RmzPRyBXQ/GDGAe9pctYmEbVPPYpFNVa/lEiL8rljhvJw+UezPY6xwhNDY88?=
 =?us-ascii?Q?XJoUlxFhR99Z9dv/lyGJXYiQTuunL1SUPHDbDuaHAYNfy/eP13rfHsr/hzr6?=
 =?us-ascii?Q?+rwtLYtg1t8BhQlRY2k0T2O6V+Qbd72tEU+yXep4i5l6nw0rlk7w0D1xKPc3?=
 =?us-ascii?Q?z/IEe3NhDvcxyQJ7fAC/yYQZkBMX24TjbWtS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:31:13.6371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 726626b8-941c-4370-7c86-08dd861e45ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936

- optimize the wait condition to indicate command completion
  by replacing the do while loop with regmap subsystem API
  regmap_read_poll_timeout()

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v4:
- Previously patch 3

Changes since v3:
- New patch as per suggestion from Arnd

 drivers/misc/amd-sbi/rmi-core.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 663ab9176d95..1d5e2556ab88 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -23,7 +23,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
 	unsigned int bytes;
-	int i, ret, retry = 10;
+	int i, ret;
 	int sw_status;
 	u8 byte;
 
@@ -64,21 +64,10 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
 	 * of the requested command
 	 */
-	do {
-		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
-		if (sw_status < 0) {
-			ret = sw_status;
-			goto exit_unlock;
-		}
-		if (sw_status & SW_ALERT_MASK)
-			break;
-		usleep_range(50, 100);
-	} while (retry--);
-
-	if (retry < 0) {
-		ret = -EIO;
+	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, sw_status,
+				       sw_status & SW_ALERT_MASK, 500, 2000000);
+	if (ret)
 		goto exit_unlock;
-	}
 
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
-- 
2.25.1

