Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917E238D39
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010568; cv=fail; b=RLrMyUKogJkqfljXe3QOj/gu8IsmKG/ofpkrG+1z2vrQhf1TVDG14BKyvG2ptClzFEviGXTUDHk30M5s7z9neBsbV0XpKXqf2bz4PCFF8iapGuFRCYoWMZxjtz8UYCHbpTAuAoaYEidVHFYroqJA/f7cet31DDTJ4Hs+U6Cc45I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010568; c=relaxed/simple;
	bh=98wMF23K9ZGDmTkZKuDE0Dc74/Y2cLLK+yrFgSTEzRw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V5LCKt9owiGm84EkXbx05ARdVJiL/Bymcb9m06tPe229QaAyK7d7DPr4THTOJLRyLkuwKBcoxXwziI1xnz75YjdqUiq1YABDrOhI9HDm+Zp4YDEmTHtmlN+gy8T+GTKqjjVd52ApFNDWazOlWScePiVqAweCLbdM0TBIa7hDY9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZxZRW+Uo; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZxZRW+Uo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+WMD05DeASTEKNvqTeRUYMNFrVkARlRjGg3m95XezZz+vO9WefIFdXGwo1hxEBlDKozUw/ZmDsS/FwXDYceXyCN4oRy1y2sK9nWC0ID/M4h3OEX7miWy8fl9q9JmLETR+bJzfcZ2mKoAIGAOtX/uwSbxZ5Swmv8dmt1x3LaBAdnxK3iukomesMO61W9w9Qn/DQduBoVQfOo1Efga8AUhNhU9uygFARBDoui+di138eL2yOdiK5RRyp/JMMQYuxzgVYdZcFwhelF5+qsIQhUOaz1mlR/8Wzf9EaNiH8qYbHTPhEdHPg0vc+G9NYuGHqKUJbqmcB+LtGsp7wEHQzJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrhcJYR5TfBcpoRDDdHq3uB44D+yT6JByeryw4OlMGo=;
 b=ZDu09Mv5hwUu3jKhVG098/lrONlB+szx0EyrXG+LNotPTg4n3dNkwJkTLUmYBSZEKAZ6PG/b9f9J7Nn1Sv6fxds3eChPhZuXntNPXUYTN+bbkGIiUN02ij+N1Guna8m67d96zOLDMYKn4OCcD1LiI8ITPEspuOhDIcVGLlu+ZC2wY7sKfhPvrJ3d4bXV7kENC/6NuW4Bsga5TSlxsQHZBCE2HVWGQPitgJenjC7zLwXpT85wIE9aSPoUDo8Y2oNAaqZddVV6qJPMoxTO2U10Du2R5Bn0eJOk5QLtMeqCrXLlOYiKO1EFM4iZuBXcBIjPCvA/xBU9virCaSj93jaBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrhcJYR5TfBcpoRDDdHq3uB44D+yT6JByeryw4OlMGo=;
 b=ZxZRW+Uo9TZVb6D0gCxT56RNbAPL+mEDp42crKaKfY9mCVXF3DlavrCx8ST4Wl70YLWOZMjVH1bLMwAsIq9OmQyoP3aNbd6cHHm7hJD4bgHZ7nC843bpfeDVdienDmosEshJV4Wslu3bBWB7RYfSMnIsu3M5W/WnkCdk1m3wDN4=
Received: from PH8P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::14)
 by SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 07:22:41 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::62) by PH8P221CA0010.outlook.office365.com
 (2603:10b6:510:2d8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.32 via Frontend Transport; Mon,
 7 Apr 2025 07:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 07:22:41 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 02:22:37 -0500
From: Shivank Garg <shivankg@amd.com>
To: <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
CC: <vbabka@suse.cz>, <kent.overstreet@linux.dev>, <kuba@kernel.org>,
	<harry.yoo@oracle.com>, <kees@kernel.org>, <shivankg@amd.com>
Subject: [PATCH] slub_kunit: Add missing MODULE_DESCRIPTION() to fix modpost warning
Date: Mon, 7 Apr 2025 07:21:54 +0000
Message-ID: <20250407072153.871265-1-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc7c3ea-ca3f-4cd6-a1cb-08dd75a4fbd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oYWN4CamrJPOnF0KR8JQlcgBe1pEfqsUb7rGomjTXFdLfL0tggPXtxZPKyE2?=
 =?us-ascii?Q?s/dWP9ry9yTVOHdO/YTXlehgQ5W++Bf55oBlVLidw6r6c7yJg6g2q9WDeYpT?=
 =?us-ascii?Q?G3/QNWGPfer/hIDDijdofBLNPRTmI/yWRXm8Gt573H6R5a8PlzbolMnMbd2D?=
 =?us-ascii?Q?VC7yyDvaSGw2lXaTwSlqN0lZSE2cx4Mgz1HulKsK7sLE39z8XoOEC8QRFXJD?=
 =?us-ascii?Q?kWngnGRvZhaXQKIqOUE3tvwywHpz4KiHuVybbvyOEiKDatxnQOC0aAEMyFq5?=
 =?us-ascii?Q?rfeTk5uH3aae8HrlpXr5F7V1zbg0jy/Bn1iEYCloyP2/DJpkFz2AaKqHqD+w?=
 =?us-ascii?Q?pj/Q2ElXG04EbmYX+UAh34nB6OciJ7nOYYEsDpGqat1R39YFUMYUXkYQYgIX?=
 =?us-ascii?Q?iFSQfsc3QE9J8kjFZ1vvchj2GU0xWzaIkWXZJv0sMuyLbBXMWX1i3cvynwoy?=
 =?us-ascii?Q?vCt8mZX0MsESMbbr6z4owmkcu7T9S8/I0Ci/thrpB0M1L9vT35LYf2FyRtp0?=
 =?us-ascii?Q?RkyJMmGAAfeupZejgheFBf655hG9mUeBeXfo40F8YUSxk4pelZ5LepwFJwsT?=
 =?us-ascii?Q?ADBBC3pxoZco+ULVJMLFvdhIMuzVdgM24ignPqCuvmPn/xN1M8gv8luepm6b?=
 =?us-ascii?Q?VGK+uKIyIA1gUaiuHGQDdpFwfc4OqfHsYCODp3R0ufkdqGubpa2g2/g086tb?=
 =?us-ascii?Q?ZAlicK+2gHRdnGPUqo917AE9KO3RaNq6TMv2VVgHybTP6s03flGxHGyuXB+u?=
 =?us-ascii?Q?9/Wxft8UtLGYMJOKvs8X0Yo7yRUkBDSantVe2rhqDjAIVbhtHEorFx3T4veC?=
 =?us-ascii?Q?4lrOiafBfmzWM0kcTsYe1DYjJ6IMAy5SNdevMlYKMtZnr00ABMMShZ7tXLZ2?=
 =?us-ascii?Q?DQU2Fpp9sbIxtC/u6AML1cgrWlPt48cRuhe14X8GtDfydj2vJ9alYiRdzUUg?=
 =?us-ascii?Q?BqD03tPk56Axkc82++3E0E9HjB4k2eob5zsum/ndRjNTv93o+0exa4xB5IXS?=
 =?us-ascii?Q?3Y/OwxF2YXXGObuSmnxbl3N27MX6LhJmZyJMCbhJRyR55VZPRW7lB1t9h53x?=
 =?us-ascii?Q?mcpWOJVzBPloHZDY6zyXViPDdeGhgYQLr9OwlzkALDYI5H77r+rR4/A/w2O4?=
 =?us-ascii?Q?ErgWRXfsSZ0E2B7InAplHVUZQFk9bN1U++r4NLHd7EuDxYp/r0A6kgAvZAs6?=
 =?us-ascii?Q?3MbhpjZ9Chi5Ck647bKAnzD9MxX7vGWUwADyYtYoKs8fW1beBe68Tngx7E7O?=
 =?us-ascii?Q?ZAQc+VkMjNEPaytk3S66zJ8G2WzOZFeNXNohqJZ4cLxJtDkG0x8yOFON8KbA?=
 =?us-ascii?Q?i7/EbBZi6f7jL/pXkC5lY6GknaNNn2ZVuOjBKJCh3iBxD6tmAaxWGXb36SQA?=
 =?us-ascii?Q?3BliL7dIwd7+PShNNh8E9fStAZx1tZuOoV6qrXU8uT+NhUQ9nvF0CARgb53s?=
 =?us-ascii?Q?INorkHvrguJq3m4kD1J0ZNWuLE7cjIOp1qPk3BHPNS74zzSLLxAJoQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 07:22:41.4821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc7c3ea-ca3f-4cd6-a1cb-08dd75a4fbd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442

Fix a modpost warning due to the missing MODULE_DESCRIPTION() macro in
slub_kunit.c:

  WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 lib/tests/slub_kunit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index d47c472b0520..f1bc30be6503 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -323,6 +323,8 @@ static struct kunit_suite test_suite = {
 	.init = test_init,
 	.test_cases = test_cases,
 };
+
 kunit_test_suite(test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for SLUB allocator");
 MODULE_LICENSE("GPL");
-- 
2.34.1

