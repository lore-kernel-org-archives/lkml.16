Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331331EF0A5;
	Fri, 11 Apr 2025 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378328; cv=fail; b=YKm1HWym3q3ZM4310dRIY9P/OkFWoOfJCLWjH2vv0Dgw0r620CLvTDveaT4FiJhHmZ1/yiRxYh4PKG6hsAUGzGCEQdnnkVL0mD2cm2DC0t4UD4kMY8XKEoHwtMtlPmTP92AlK+Ks3+0vIXwJNltyqWtbSsRzEdz2NBYyDTkC4jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378328; c=relaxed/simple;
	bh=5GtngUwv/pFLVs/5jP4e1YTBT+QZloysFbMq2j+bxzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jtz8yRx43IIY2NXzVtjN8i+Vt8UjFDGDV+cnnpP6de60HNQbmNqntQJmqp4v7PwxwIan0kAsRrpj8QaaVeXU07vjwfP2PLish0xx+GiQYPZYUPRZMAkLLZ6IaIEruDwKSDd/ohSRdnjSP8gLKn1fJebR99Gbrdz+chpBCm5VkhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KKFJpo1l; arc=fail smtp.client-ip=40.107.92.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KKFJpo1l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGD9rNfs/+5uK1RWC0Gq4Rj/fHhStdYOqTkvPd6JsvdXCnbzvccvjryK8L7qBVvEsjndvxyABR0mZ9TzmWK/IUEskLlsSRl4bMG5+6SUH63jCPjYXrfNcTyYkwA95eN//f+Cjwslx0iP3yh/1URcNGQcY7KQ02FUcaWfsR17zAYYeoU9viTFSC6U5zQCDKPTNMlrwRoM9AWvRMzMMN+ZtbRmHSd1PlP9suPiJvvSaKeBC59fRLm28kzZC++gVkeJhXwiVmboyOKjHmbCI5IH3qUXps4EYS/uq2D4hgFhxCUOWllNGOvcISSrRMBXelzg8TdUAYO8EEmuUZi3g8eqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1pRsfusff5dmd7COF46Efmf3bQtvGWyrIdbo/pp59w=;
 b=SEtn1qXfnYU44s9P0KTSoiV7tOXWEv7ESdw9mhaDxC0TYPy68K+92tpRbffWvc8fgvf2eBx3h05pMZ+fVTbqYsoKWUC4irGbc59S3bDP14trurFwClhwiro2vD8839MpZqrzwns1G5cvjMCo8r7Jj39YzA+Ipj4lc4yGmfsa4KYC8bE1yIPSAYzsp5J4D80jNvQ/jd02JY6s1NvD4Fvp7KL7afPxWbCx0xOI2wD9ofrZqm7/aaSxEw5oGhc5yovAbZBI1gpD3VwBPdKdhocJLsFUB6MnsFW0KlVHvSsU/pXhq0ggB76EgUCweb5ou+3ZUM9p1ApmZ62dg+MIS4CUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1pRsfusff5dmd7COF46Efmf3bQtvGWyrIdbo/pp59w=;
 b=KKFJpo1lvpmV7BGTxMI+RsMYsVqkD+j7E4r/26QCRN3R5JSdkdbulz824PrvCvVoBvkSkhu6593kfCUvh+LN8iGFJD8aYHxtTKOo45aH4zsKUGlUbM0+ZXL1ji1+s4mKCTnEOPQdigCwDIqLyRlvtzRS5LSiQ4axcLrVWbpZEZw=
Received: from PH8PR07CA0036.namprd07.prod.outlook.com (2603:10b6:510:2cf::9)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 13:32:01 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::7a) by PH8PR07CA0036.outlook.office365.com
 (2603:10b6:510:2cf::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:32:00 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:31:56 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 05/10] misc: amd-sbi: Optimize the wait condition for mailbox command completion
Date: Fri, 11 Apr 2025 13:31:17 +0000
Message-ID: <20250411133122.1806991-6-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e68d582-1958-4d5d-f512-08dd78fd3d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OyWCyWn+/frssOxAoywSvia8wpSnJ+gFnxHUzxxun8OBatYlfP6ziJyccdNx?=
 =?us-ascii?Q?m/y2CczJdSnfxyRW+6w6k//UUb2WmZNpOQYkLXpLW9HpmgN2PQDowc0lYExn?=
 =?us-ascii?Q?bbaLoXNyUnLHSO8zLqvjd0YD9oI+TlpJG0TcMoEra02ej6P78PeGIm/4+O5o?=
 =?us-ascii?Q?uorp816ouoqKxS4yg9uSUolZmtAt6vhRhtICwSRO53OlQKTQXHLhZ4iUulCg?=
 =?us-ascii?Q?4iaRAcrWRo/+SOZbgLVpiYfR2rFj0e83azJmpSQXTPr38HSnSlDxS5D+OvIA?=
 =?us-ascii?Q?+V5KPzBPR8lGHFkT9Rq5+pJsHzGXp6hKACQ2f4v8cozEaBUpUivgOlK357c4?=
 =?us-ascii?Q?aVDm/euJTNfL9c1dczdo9kRpgfPxg5dDnu5AnchnB9XWgCXxSn0lePda0gyB?=
 =?us-ascii?Q?SjGEOELsno3Cd36lqC1nGEf+RUpwCwPytM/AEiyUUpMISn3cN36Rf76JU6gT?=
 =?us-ascii?Q?7gzvxJURk2KE5gTc5eyR8ilf4SGNKxcrzohQVFGxdBr5TPdjsF9ipP6vlsYu?=
 =?us-ascii?Q?CrywIDdh7MevS1vYFGG/+mhmhcA9je+tWyVzdG2Kch9QoZU9+uZSPtfaohix?=
 =?us-ascii?Q?xJ6b/bIAPUAxVlyizN2RkqpvNISsdoWrefv6he+4b5EXTvcv/cIl+ghPGjMX?=
 =?us-ascii?Q?QwMiNyPBD+8D3lLzRunai/yTHcPubhqgJ7MFfM87d9wvA5I1IgPDZuv4RQmD?=
 =?us-ascii?Q?hIybZg7ENscU2/UlKPAlBJHSKxVSTFxLcuu66/J/DVq+Um+Is7hJ/+Mieoxg?=
 =?us-ascii?Q?XACHTjT5ATBtGKSv1W59SWfq7gmp9CMrryE9UPNdPY5cnwUUzCB+ZctVTaEL?=
 =?us-ascii?Q?4dP3RSR0voX5cZpAP/fA7L/qyMMLKa2M0HUouiH5p0upeX1oUm5gmcVF4k0P?=
 =?us-ascii?Q?iYoRkWT9UvbH6Oi8157YEuRiKhu4xdiDAvIMuGu5T2tJq2nLWQeTeMBPOfh1?=
 =?us-ascii?Q?Qs4NyMzVxXYFHObqk40XtAV5/q6E0ylSH4UXAc/LlQnBMafP1jeA4EUbFTpR?=
 =?us-ascii?Q?twR7Q0ohXxJWdjse8CFF0ginudUp6MeE6KRNJGnczm+aN9HwgVkldg9JsPtk?=
 =?us-ascii?Q?vjSwkAkPAX4AmP80WBoynXdMGcsyARVlD9RQDavkCtropJ+cXNtlaOU6WNL6?=
 =?us-ascii?Q?Tfp7Wy7/GzrWs5Ygd90FdzjaojCzCe8lghflIfbjmQCgWnsBersRysdjcV5O?=
 =?us-ascii?Q?h/y+TMBB6csulu1KcHaetZQZ9kQO/IoGTnEWaQaMHgR7xY6f2oXuStjimx/O?=
 =?us-ascii?Q?nNmzCuf3VYcP5gVYVkrb2sxpIvn5mngJRowGG1e/IpqQFsWTqnRvLFvqaaP4?=
 =?us-ascii?Q?QepQQuE9cSgDda6Pp34wI8MyAjvMHG47DscuJBJqM2SvlE8wf+UtrPlfkDX6?=
 =?us-ascii?Q?ncqLLmeNqTqdEXdxcVuU8S7ElQMPy2UaQmRYttfLKcSDDdg0wqfvAQUYqjTk?=
 =?us-ascii?Q?Q7ScSLaceO0oVfIEQEn/P8tSWXmnC9svuzphFXkry3QzCQCADVC3B/wYQpO2?=
 =?us-ascii?Q?sLWEYhZyZCSBvMyWmO7jenXECxi67ArohuXL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:00.1955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e68d582-1958-4d5d-f512-08dd78fd3d17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680

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

