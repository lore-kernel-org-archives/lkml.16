Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2781096F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322065; cv=fail; b=AVmJCXcmt2Bo+yfDpbX9Nnqx1ghH5nNY87aCLLpKqmsIJEOfeQDyoqBYwEQzaEm20FT7ncYRkpBBnBnrtuQKQ3GweuyIARyyAhTNJD+rpkfw9PQg2C7ddEGJsZnEulknIOCOJ9NVpWguUsQxaflPPTCKSF+xTu9U0Eqf/QEywt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322065; c=relaxed/simple;
	bh=74I3WecXaAAFGUloOuZWpVBqKaqWzGPMyJwN7Bnmwcw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HS7ZcqfNdhOjd3cIi719azUsdRcQymh1xmgtOtWjiM4ajUVFAmBximvwimyc6lZ9GBfUz63NCc7un2KPYZ0tZAYLUOdTH+Q0XVARmybO+28/0Q0scjLax0u5OcrXE2HN/3mM6g/tdIbqpzUeEG2YV/kS8YcGOmfCtpcYBT4w1h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pz2n+J30; arc=fail smtp.client-ip=40.107.244.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pz2n+J30"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqQy46wHHFMK69TQRw6DMPltUtqLU4Q/x7XCNoJ5AFcb1R7JVChOthCa+SLFFUZ3lGhUi/j2LUrbZWhve/XrCqQdvNiH8QxY6CoRdE5BQggFByF1OR5BrkSjJbk6V8M1i4FnGjYU1v4CEYxjVxhu8SJ3riIs03AMEAtBBmy0eBOtoy3QvICC4MjYXOwsUpoOOZzmaA9CQ0IaG2RB0F98Lfuzsnwd2eWU7BIAeayOSMHr/8TFWEKZ6EyXLv4439sofBXVSkPKj3sSrAFyg3FZH6+yvIMbcIw70a2RH45BHztMJ/qr/wQAzw+dc0/pj4GJqQWHwAt+ZE50nzwCfLx/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXhrQCcoFrDymvDNGjOr+++MiJKpILA4vOt7SmKpjoc=;
 b=vOQYjHgNJm4FfysrowEWej+NwVvANgJM1WE06CWZz0kfrf7r9WmUkGbXjkcc7kbJhpLeEYfO8H4Ca/6VTb+z08Uc66d2h1HFFrH0C/pf2cVGqMbSGQ9LjYiAyucXDazJNKPIzncNaoS7YBTqImamqCTqzaOh2TKKGzunw3+rO8UR2dl35Yf/XHmvm+b6+AEAIFkHnWTyNK6ta0fMkCRNejG9G4cplQU9xowtvfWuT9FSlPBNPUR0ITJm0SS0DOVKfd3GoZFh/BWoHLRuhtiBzx8AJbBcYxnd6jyjAfZjU5dFGFG0R6+ZtAPYvqtqcgcb55CfAR6wIhpknBllqKVcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXhrQCcoFrDymvDNGjOr+++MiJKpILA4vOt7SmKpjoc=;
 b=pz2n+J304JU4+OHWLKzbKUkqnLzfn8rkMmw2a/a2jb0JUjyeYJg6vOPGiHvJCEVGYTFJLmhhSnWlmdizsXZ4ooyFvVMYpziyBW/dT3C5zUSedVo8SZxU04af12A5t7XgAgW/iL1nmHhurl0DrADNFRZfuiZut68DpsEWIsKErB0=
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 11:40:57 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::5b) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Tue,
 22 Apr 2025 11:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 11:40:56 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 06:40:51 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>, <akpm@linux-foundation.org>
CC: <willy@infradead.org>, <shivankg@amd.com>, <david@redhat.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
	<donettom@linux.ibm.com>, <apopple@nvidia.com>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH V4 0/2] JFS: Implement migrate_folio for jfs_metapage_aops
Date: Tue, 22 Apr 2025 11:40:00 +0000
Message-ID: <20250422114000.15003-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: ff105488-20c2-481d-f84d-08dd81928bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gnjgjBIz6cctCUTjEsrDExMBV5WI85+DMismD5SSKQpavoLRa757KnAuzhb3?=
 =?us-ascii?Q?RaD+owpr7nH6fIkTi9grJXfkJlmstcR0KHJzSuf7OKJcydK/zpr7Nb8Y8Any?=
 =?us-ascii?Q?lEiH0guBdSdO0gsHmmq2NLJlEKkG52ikSCJX82VW9Apiz+5DiOdBjjCDecKM?=
 =?us-ascii?Q?Vdgq0STEvdiXnWBGshBFkOBLSmhMdjiO6juh69b60DGZxvqjOv4DIa2vlBND?=
 =?us-ascii?Q?QaDc8Fdq9evltHY8awRG4nbLfSND4PdnvSK2Fms7nJXYMhc+wXekGPDya97a?=
 =?us-ascii?Q?O85sx3r2GzGEDNMDr0d//5fu617Zws7U0M7robd1/mPFQ2+t03bBYfpio0pb?=
 =?us-ascii?Q?f6iXBeSzxtJHwmXWPXzhaz8CpD7565x/PPffBR9IzPk007lAs3qVfzHfJob+?=
 =?us-ascii?Q?fY1AVHDTloXglHkMBshk1d4aldY2AEgkgETwcJ0K5YN1eDlCCCx545RXYFHt?=
 =?us-ascii?Q?Silcmkh8efS6cZ3XZZsxZ6tYg7ukfTtL22mIoArdyJU2lEyElVWGKQGFymIg?=
 =?us-ascii?Q?jTW0GwxKrNZrD868JHVrwYTPMjASjoyal2JtUl4W2wiZn+TZSUrSqdFbSKZV?=
 =?us-ascii?Q?8KLA6jiVBwIsi/jVVzzK/cilfDvrsvK8fcJVX+X6MwDoLqst73pyO90txU2X?=
 =?us-ascii?Q?58w6l5iFZouMC0Tzt7CwRwva+XZkkr2X1IVzRNfwqBf0oZYlZiHJojOXT1Ya?=
 =?us-ascii?Q?p/W446enXar00DDcYN4pJeXLxrbWrohCh/jaoyfPUHsZ/JDY3OWfNR/QVzFb?=
 =?us-ascii?Q?UKNKuSxnu8j20GRWeCgca0vlzkmBwoZNkoEsK6j7//Vi6PdazbRQZLWkXuC1?=
 =?us-ascii?Q?pZrWbmO1O667B05u2lhP6qZOo7d1aLd7iylXmfJFC1g4j231+I7/wzsSvmV7?=
 =?us-ascii?Q?sibN+GlgAlMkTjE153L6+bjURTR0tE49fEvoUTWKC1YhhPJVNBpDzpju1Uam?=
 =?us-ascii?Q?AUC54Hy4HFeCoOS/fN0gses5gY42zMRchUptDi6N4c95JzQWGYLVtkYS2A66?=
 =?us-ascii?Q?mdMZZF4V6tbkOOc2t+Ll+aA05MCxaFi6rKHx0s/rARl6D6Lh+I5i/URzAsWO?=
 =?us-ascii?Q?pQFjmG7WYSxK+f9mwnZcsXIeyovsZJtumMvm7XRCa8O/AC++U6QQm+J+IoEg?=
 =?us-ascii?Q?YsIW3DZrO+8rZRRwfl8ey3TMlOs9cUTK3WCw7HdrZgNI8pePm0Amw8RVz0z5?=
 =?us-ascii?Q?oatcnjonWHCbIx3JjfAU9qrSx2jhct3NSo3Tmlb1Z/VjEox2krVlsUM5+1Yo?=
 =?us-ascii?Q?+0d9/2nGvgXw5NJt03vxBxpdm4bmUlpy4SX5gg8EKdCWksN68jWOJBchTcmi?=
 =?us-ascii?Q?iGt2NeTQcoLuJUvP5/50P8IJoxWGVSSELdu3x4W7jM+PstpYuGL70kWwjPik?=
 =?us-ascii?Q?pCU9nsH9i2ia6q8yiGeQGAcytaTnug1sxbXOj/h3bbAygDexvFCFJjS00sOV?=
 =?us-ascii?Q?ltVAu0cFf7YQ8+nTVOLKIVoivIyWMVwHydz9sBNZVMf9C1A4eTR6gA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:40:56.9113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff105488-20c2-481d-f84d-08dd81928bfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426

This patch addresses a warning that occurs during memory compaction due
to JFS's missing migrate_folio operation. The warning was introduced by
commit 7ee3647243e5 ("migrate: Remove call to ->writepage") which added
explicit warnings when filesystem don't implement migrate_folio.

The syzbot reported following [1]:
  jfs_metapage_aops does not implement migrate_folio
  WARNING: CPU: 1 PID: 5861 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
  WARNING: CPU: 1 PID: 5861 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
  Modules linked in:
  CPU: 1 UID: 0 PID: 5861 Comm: syz-executor280 Not tainted 6.15.0-rc1-next-20250411-syzkaller #0 PREEMPT(full) 
  Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
  RIP: 0010:fallback_migrate_folio mm/migrate.c:953 [inline]
  RIP: 0010:move_to_new_folio+0x70e/0x840 mm/migrate.c:1007

This implement metapage_migrate_folio which handles both single and multiple
metapages per page configurations.

[1]: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299

Previous Versions:
V1/V2:
https://lore.kernel.org/all/20250413172356.561544-1-shivankg@amd.com
V3:
https://lore.kernel.org/all/20250417060630.197278-1-shivankg@amd.com

#syz test: https://github.com/AMDESE/linux-mm.git f17a3b8bc


Shivank Garg (2):
  mm: export folio_expected_refs for JFS migration handler
  jfs: implement migrate_folio for jfs_metapage_aops

 fs/jfs/jfs_metapage.c   | 94 +++++++++++++++++++++++++++++++++++++++++
 include/linux/migrate.h |  1 +
 mm/migrate.c            |  3 +-
 3 files changed, 97 insertions(+), 1 deletion(-)

-- 
2.34.1

