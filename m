Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D14285060;
	Fri, 20 Jun 2025 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415199; cv=fail; b=qw8SWCv1K+NgmpBupFHCbaP3e4aI1zyA9EyJpQndVv90bkqQpDX2YhXcscfZ0gnRN/nAKd2Hm1yJiOZMt4ayGA4T6BGdCnbnwM6xo/jo6KfbPFMKzUcva2sVYE6x5i84ehpnb8CmptHot8iUwAH6+vfEaU9JgeLTCYkQVCkLSeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415199; c=relaxed/simple;
	bh=+/toD3taa1nQFN9gNvXvjtzoGzRobpYuYkkxCqPEWlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQK+SCz/RK4zWnA7pBjgXH5Siym+T0jjtMqyt9k6OrLalFhYuGAwI2GUqNBS78UQnkebBIwelHyxhNdCRD/Bh93LzCAschVRpMcDrIV7V8xh9+afteCp35O3ZADCTgu2aQ6LRCGZdOvBSY8pzJs1neJza/VkKkP/YDiJTV42JnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZjOoPeyy; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZjOoPeyy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRCkfVN9OhkzuzVvOJxe3uID433KOPaNtVi26MLtT2c4Sd8aW7J9yT/xPvkY44ALIpLdK1gb2WhqW8ouPNaRXe5ZacNokUqGghoIGRazncC6qV3Xv+9e+k64640wDDBu9A37yoGUCqh737X3L3hR00/hL7ZPWShb9BBDmvmp9+TWi6wcslOQ+cxJXUCyuG+Q4BKLIuGNoBb9iG4iomkJvA3l6NMxbTfTt9xWndREt+kbBFMY3UUxQ6KxHQhEZEMMCLuaKJ5Fe4f8ZVrZ/E0gblzWdfrJ94Etgs5QE8d7BXjoEbF8NH1/02JQPKcUVUSqpB+Q3O348WAozQpe6WLqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COnNlydRCwW0KEgys43UoGsYHK9Tmp3ch0eM+x0V8XY=;
 b=jswKLZLhiYz0fo5pv7te5iUFYaemy2gVyVZuSZ6vslvrOHwQD4fL2QDN70QCgpM0OQMrmP0BDwyNohfK2iO/FzodPDFlHVossJ2LMNW37OgoB1ORY0nQF5OQkB7Qf+YlEvBQj+4+B0INOs3KUZPazTKnXtF8NI3g8pFuO7I3mf+BrG1UGtVWnly7ZqEHDYJRteOqO9FkdXxvaGKhhXiocWep/Z822OEIpsxQxbIsJYZexMvuAwRKPyrRD0iybu2aHoySlIGQp2+t3eEZvQyc2Q5QVB7psM0pYvpWdX/iPx/yif16yP9zrGltoL+ePRtb13XrZkPXtW1T7ZTjm1x/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COnNlydRCwW0KEgys43UoGsYHK9Tmp3ch0eM+x0V8XY=;
 b=ZjOoPeyyM0O+BqE1R/12igqIKbnzro6yEqNwUag4gXno1U8gn2JBq8ZuoesmugS+7mJK4Ajndd4AnTFCG8hdpjHl1Xjxm+ree8m/LVGEWbz/PUcQXyzB22MnBZEu2dQ4aPOo/e4OyiEXXKJn8f9CBwLas6S4PwxSi8L+YzUCDgs=
Received: from DS7PR03CA0342.namprd03.prod.outlook.com (2603:10b6:8:55::14) by
 DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Fri, 20 Jun 2025 10:26:34 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::77) by DS7PR03CA0342.outlook.office365.com
 (2603:10b6:8:55::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 10:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Fri, 20 Jun 2025 10:26:34 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 05:26:31 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] soundwire: amd: add check for status update registers
Date: Fri, 20 Jun 2025 15:55:20 +0530
Message-ID: <20250620102617.73437-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250620102617.73437-1-Vijendar.Mukunda@amd.com>
References: <20250620102617.73437-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d36973-d08a-4c0a-c8c3-08ddafe4eea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qmkua9r3YME8P54ESZ5Yt/pE+KTs8SRkmsJ1f2kA7kf95KDtOiunSViArtqT?=
 =?us-ascii?Q?g6MNPOo2MiKR/rUt5/LwAJXrjXJHQTcrwZUVgTFbnO36DFK8QNVXcHngUb0H?=
 =?us-ascii?Q?SgUor1u8GFx3hzROLxu0yFyfTgfvQIPKFc590BYrqWdyXL0q0FtB6xZl+tUq?=
 =?us-ascii?Q?70aQ5G47POhGOLGefJMvTw2VjGrvxdJuxWpjTgUBiesBkJc4c5mG6LfyUSVC?=
 =?us-ascii?Q?m8bTQMh3f47kKV8kP3LqCVcpQjUtQ/iOeFpd3z1mgG59zE6sEpxeSM7zTCYd?=
 =?us-ascii?Q?jjmHEUMWF2HFKAxzZL9rcASk9AV5d8/d9cQUWG7O0ngUiEDaS91aCJQXPAKW?=
 =?us-ascii?Q?mm3MShAHD052HDBXGVU4zh8FwfWXhOJXwtE5OtqeQibYrKCBUTCTY6MGMlaK?=
 =?us-ascii?Q?beFfHYWxYZc+6+4UK45E9ChsMw20MgfjJ/V7H2KuphqWeBlZ+GBbAeOt4XoB?=
 =?us-ascii?Q?5Wv0NGQ2U1tMB32i6KzoCjDnxv1j5fhY/jExhr20eP9wMWY8lHjv7eMIZmgl?=
 =?us-ascii?Q?Z/TRgAdzuqRQoDh4akVugYq7jMmCh505c2kuuZnQ3xSKpp6Bb3ERFCb1aCeT?=
 =?us-ascii?Q?ZiUMC0uF/xY5cKDuE7GuFIry4pRotj4+X0OLLq/NY91eKwH/0MOl0m7NKAkx?=
 =?us-ascii?Q?XiCiByg+yCtJcl6Jn6g/ftyuIqRe4HCPfWxX6rhyMXMisGYfN5jDEHgmjDLe?=
 =?us-ascii?Q?YOAxiTIawY9Fy+IB+ye9yitOoG2s/pqXVxaqLQQoSwqXMh29bcxDsVBNJCYJ?=
 =?us-ascii?Q?qyx4AVijO9RUIO9hRGyXdgz9dYHdEirQ79aV0nvCEhO8toCZ03d13na5b+jW?=
 =?us-ascii?Q?yNm4CiiiuYsN6GRoeGCAUzUdIC2HjIc7zGaQGr/0jr3EPs2o/xwF5bXWu4Mc?=
 =?us-ascii?Q?/82cda/iVwCeasaXA7sLWaOmrTDVCgdvsEmo/SvN6lJQ6tJgUVn9XHJclom3?=
 =?us-ascii?Q?L6t6QOicSOsHffqbvC8RPPaPu+ArRyUGrY7tVOs3HxF+zyRic6C4sbegH4RO?=
 =?us-ascii?Q?UV6PS0rrL/3KGhNvzt0at3yAJ4qMoCQt2AZ1BT2zkqtTn21DzBel1YUKRVdk?=
 =?us-ascii?Q?FWxgAkoWCqjFEMphqjhWaUE7cMtpXyNrOctlOnWg4lBJbzkdPs+xUddh3jkT?=
 =?us-ascii?Q?dnWTX2pmcrO7Zy8qUGf7jEAhvrx1jY0cVucc5DquH4dzKpoNRis1f3ZcA7g7?=
 =?us-ascii?Q?axg4lbXdGFws5SyiAQtCj+/IlP8tklEkWJkCrOtrzNM396xg3j2T9JD6tCR6?=
 =?us-ascii?Q?vhYh744cbb14hGkHBEq8vxQ31uVav9VuQYvzMd6Ziu+J2tkvSiHMTzBmDwK8?=
 =?us-ascii?Q?goUcdgoeIJprR1R7bhGvJSnoAyy4u4Hp6qletiIgOUCKicPZlabHhtFKX3X1?=
 =?us-ascii?Q?GqdWnEHamHfWINvKmITMtFxrtaFnhNs6DqYcAajuXrR7h8Bz7pcR7vviTQYu?=
 =?us-ascii?Q?ewh4qImHo5EL3H+4CgaNYNUO/T5hP6Fap2rYufrB4TQnNdfxVEi+KISN/IDu?=
 =?us-ascii?Q?JlbeIULcdH/CDswC6RtbQW9PEWiQJ0kQyhRo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 10:26:34.6921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d36973-d08a-4c0a-c8c3-08ddafe4eea1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042

Add check to proceed handling SoundWire interrupts when valid
status is reported in any one of the status registers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 732c3e9cdd9c..5a7468e33012 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -931,6 +931,9 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
+	if (!status_change_0to7 && !status_change_8to11)
+		return;
+
 	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
 		amd_manager->instance, status_change_0to7, status_change_8to11);
 	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
-- 
2.45.2

