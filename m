Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2079.outbound.protection.outlook.com [40.107.102.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E971FE455;
	Fri, 30 May 2025 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583918; cv=fail; b=ohbBgNU27G1WwnNexk47F0kkZBLoHZrb4x5H4IjrGiriv/2Eh/STrLdK1BJCI4o64I7DDXLliWbsuBk3Uvt3ITl6GBs5rfJ7ZgL7Lr8Hqc/aS5jaLN1V4TxBOtOskqRwC5xYtleVNGE97pkRa2HMmrJJ15ROPnYNdTXLIwWqOY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583918; c=relaxed/simple;
	bh=xZUAly+0ygCE8pDqNS+3law5MILv5tTFSI0RFNmv86g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V9RZA4TWcoKpvIIXcH048BnNnfzQoypq6NRMgUcoyLDJT0o6VC76wvqZ6fnSLl8ly16pZVpOu21Xb6Z+c3J8vDNpuLGG5a0JThLOOXkKGoa6vWXgiXD9yXUDnhqUWjfCjFmC+oerPkOIlSxpzS7xvuF2IqwBXGCAgGka1cGaAjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tJLVV+07; arc=fail smtp.client-ip=40.107.102.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tJLVV+07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ect5ugFlcOHAJziyRxzr8tQbyoN799ab64+UFIwwyCTQwqrTEvGW1QJ6bQHzHqYC0wnWi68CsHFArs7bxxmXBFCNW1LY3pjXnpt3TBl1CxzGaVwYIUPcaOkzz3HnzVCZJAnMHmbvxTe9xzjzaDH6QOBObb8jhDtbZs0JQx9jEgnO9RBaKjn0Ymt8xdjzirpCJRWXTg8nK79ImTZlkUV4UpNUsB567ieXeaehl0lEOjjLjp7L5aJYnQ0638B7eofpfsTqyXapqotwzFGswo9FG3I84YKIguoHwLIyq36qKEw9fqS6QlgVnW4IdfBoQD8+kFjZDmdmmDymmAsooG5usw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs+nJYuRxqJZCs0YRi7Oh9Ns7wPrLyQgoAQctng5T8U=;
 b=Z15FSUTwjF3nZ31Bpeuyiil4YFq9dvZeU+BWmHLmKWibrPIbFQhrGyXnk/z3dgBt7npOwscOEgAloxLGYk+ikokkrCM+UiieQVX1eyJbD3Uo1/NmdKb8n9L+JXXH/L1kLNSeMCShvmC6UwT8BahNn6+eYeKsPBg6z8rxvY2fMWqfXPA2WG4D4yNi2BVCryBSVFXmsrxZAir7T6HvBNHRvzWhP3p1ffI4DWRa+ZtXyJNwsZbQb1P6cSzKdF4obRYzGMeQt2lUt7eDRUesjPwAyX1sJ/JhfWSNHAOnzsP4ix0Nh2lRWt9+bL2/x8WRFm958kl227wxr/q4WceK+uqeFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs+nJYuRxqJZCs0YRi7Oh9Ns7wPrLyQgoAQctng5T8U=;
 b=tJLVV+07+Pfu7nyvWOoHNfJ0/LpGx6VcXvp+tPCfmyRnKP8vEJS6/T5i4wEP1ldZIErjrOeYZdTsKU0yVSYZ8nxBQ/hAvG2wlo49QWPyxlCIhGwifUrlOgotiirFoaODvNBIl/xjO87sh4GbN4TgZ8cj8qfDbhxOX/qpcgvrxyg=
Received: from BY5PR13CA0026.namprd13.prod.outlook.com (2603:10b6:a03:180::39)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 05:45:13 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::28) by BY5PR13CA0026.outlook.office365.com
 (2603:10b6:a03:180::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 05:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 05:45:12 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 00:45:09 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/3] soundwire: amd: cancel pending slave status handling workqueue during remove sequence
Date: Fri, 30 May 2025 11:13:41 +0530
Message-ID: <20250530054447.1645807-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
References: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DS0PR12MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 825df425-7cc1-42a5-0566-08dd9f3d259e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KhLcQh4vMGtalK35wXUVTXs+PSPm/SLE+5zSNK2JiMScZMA8wD0T38ODThe+?=
 =?us-ascii?Q?QBrGV5vqDlmlboadI0eRwQv2aYvINKMB30ucJxfVm6cvjVFDo9uu7wLtAtRZ?=
 =?us-ascii?Q?6tWgUI8inQA7SC7uEcnxx9vKFhr1j+diLiGZqa1PjVfmOMEATJ0sIG0lahdn?=
 =?us-ascii?Q?CTUYwZuJbdKK152r0Hu2U7s3QWqQYHU8QngZ5xNfS+31Qgmmu2RXfF0NZnWv?=
 =?us-ascii?Q?jNWYyaojUVluK4hIlb4bEueBzUusz4bbEgvbSzVtxuwJJbHiZI4ThAsezd2j?=
 =?us-ascii?Q?FW+Y++gZ5LMDVSMTsd/T6q+yyCKVmi6oYOucPaP8N+10IgKrVffG6KYkiWRo?=
 =?us-ascii?Q?FcrKlMm2b8//k051y5xqztyxk0mLEXxdbLXW4e4HcmgV5qM6erWoAC32BJog?=
 =?us-ascii?Q?DnYrnr5XRaBL7KS4487FL/tbsVDt/7oqTReR+y1wjo3iNlVcddjemIHwLTTo?=
 =?us-ascii?Q?LmWE6u2orWCbnGFFNMsOji6MilrHq1T7p+Mkoajg9vCJKnrcWdJH8GrWck4Y?=
 =?us-ascii?Q?xbz1w7CPqp7cZSerNFtrShI4vdUoH/LOEhHhxuO7uaZmmbM1p8zdwt3iRL31?=
 =?us-ascii?Q?4cNcNznQHYp1vDjMp/yds5iS7DHMzcSfp7YuUHMtwja4CNRROA9S+N4gDpIf?=
 =?us-ascii?Q?iXfJH8utXAD+RfqojwKKANts8pLgpPce4hL47B9ZR4SBfu8RsEeSWTTQ+751?=
 =?us-ascii?Q?/6UGJQjRPz//oHbfcGpQgwPPerLdJHPVNDEiYBhj2InM9aKvPpZvgfIigQTT?=
 =?us-ascii?Q?rUUyXOvETVq7jKEnheonow3SAdYBL5K6InNMKN77/HtN91u7nZxD8ZEemE6p?=
 =?us-ascii?Q?iDR68pC2YPE571oPa4mcru2EWdaoveKvylOPwNq9DM/XCs+qRx34YIFCwYBH?=
 =?us-ascii?Q?27XDTcKIQ484ftAKUvqEqBATf3ngsZQhZ9jh3E6GOQyA/iNCnypUddLPVufc?=
 =?us-ascii?Q?2QnNxPW6smCn1zjnhbl4r81uPOGKTdH5pu1/axW+KiTg96IkFCCay+lvphQ9?=
 =?us-ascii?Q?eNUfZKvHtBe7XefakH/Hlg0bCsiKTe5S+JQoU7fh6TZ9eZ5yqiVoBIMuNbMd?=
 =?us-ascii?Q?Doh+rzE7psIEdNEdjKbpYbyhNJ4agUXav5bfscLrO7orrccVy+8a8Qv1Szj1?=
 =?us-ascii?Q?vTUxfvZ22b9wfO8Gxjk/DhmtrDac2rLoboGmORg8LeEwVKDWw3shQQsFM4VR?=
 =?us-ascii?Q?Y/7NT/GvuMn3YcAtpWKkji6Ed4BFal2sOxXHPTcxejYIka3+i1pNytabf45O?=
 =?us-ascii?Q?GllKNEZdlQzAuYa7QaB0PsoqhtgFu09gfF7c2s0dQDJ97A/Bv92k+5UDJ8vL?=
 =?us-ascii?Q?SZQOJvVyK5HOotKUznmURNloFxducpm1efXcNCyWgvLPpcmmwGeFlC6J1DBJ?=
 =?us-ascii?Q?91Ub0PZW0x6U3umwCLQSedM3GrlEm569eCp2XUoesZwegUNV+84XACdNxsZ5?=
 =?us-ascii?Q?r7LPuxcdirQjEvpfmeF253ZwzcCbcgaPIVO+MV6CBULQVRQ9YlKfvYi/2Rpe?=
 =?us-ascii?Q?dvgMIUhCPaoec/UJC9k51QYIgc+37eLxdB7a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:45:12.8155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825df425-7cc1-42a5-0566-08dd9f3d259e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415

During remove sequence, cancel the pending slave status update workqueue.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b775ecab697c..8913a1a83007 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1074,6 +1074,7 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	amd_disable_sdw_interrupts(amd_manager);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
-- 
2.45.2

