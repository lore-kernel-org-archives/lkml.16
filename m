Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0527453
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007384; cv=fail; b=jdn11Xkxi3JZDOjTywSyvGgqVZJBoaHLX/CR6PXvVP+DzT5MXGW/vpRdCULG7ymFWgHJVt4IxhxsPvkrFWUXG3CSDwJOe9GSrKenPrUijnmxM2js4AnW2PLzYeIc/Y6tf6gbwSPlu72LbpZgflcmwbJvtBbAvamz0V3HuM1RwX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007384; c=relaxed/simple;
	bh=QLCi5EU/JjmqWdwURub0pxJ/2UrBmNh/gg0jx/R/UGo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hunYD14j9o1kf27AEVac1iccdu2AlwqWQOnZ5NkxM2bV2Zdf6tZGON9VJtpwlxIYbZ0qkDaNlFWnD0cRXI2NIldJsFY5WoFFMme44TnygVa8WYi12f0qCuvyd9Gk6NoIrEJ8CvcVMPr3zhahmImarOr2/dRPfHn7tgWITymiIB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rHD+2GCL; arc=fail smtp.client-ip=40.107.94.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rHD+2GCL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgDj+M25Nz1Tcld7wgqfq8lbH59vKZTF9elBvdSeJ7O2fSfbl2MT8dz51zn9tNullvFLH1QIMRN64+sdrfIwesrLuJWxFD9kS4ADZDrcFtKJ+cRCxIw7OwGiEjBLdAGjuwp1g7q6dXGXuEfa/Y2uj+lw7RiXe4/9YoX+o9SAstLNZ4tbT3pZbxeDuT6LL0M+bir2fU2iNwJ20bzGpLk9BqM9qvzA2EIhdl3/N6ALoLUkiT6fk6h3ajS1LVHyiL1fOoS+GKWja9OeZwjwOLvI9Nalo1hifLOhGhopQXeQMfWo6IHYQ9dPk9F3/+61LKHuF5QF+KkhVh2dWvIvDk37MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtrFOocbBoNY/vH/A4bLP5apF1obGfCwXyMDvR9NmZw=;
 b=J5BDn4EincFQ2NqyQFRYvSaftPpKNQhZsHznRrx7VcX4Tav1hcxNxosYqoHdja/c82UKd9aZk5wgOpRKuOsZHwT0A3MSghy9w9ZYOjgrT61Nr9aMBtAqHWFyOtGSRM/LCWYPoNS5Kw+jZz+3yCNzYHa3XPgby1SSpkhMg/WTChsXrdQDQegeEuTDu/poH9if4yCFS0DgS6w67GK5UahwyGV/awVIP/hknY7ryMQ1Tanmgxd8BWGcn5rXF8IAwKg5GEEK2jjmOgwZ7tLUh6wSwuq6tep94GddVl7foJVnPo+aK/mlaIPX8QCWtdgGWUSmpeRWFd9r+Q9RJk8r0mejZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtrFOocbBoNY/vH/A4bLP5apF1obGfCwXyMDvR9NmZw=;
 b=rHD+2GCLnFcaBpxN/vVr8iHM6sO7B6YxduF+fPyUkd6PFe60DqeZT7fCmG0HRVw3tEMflN8HnHrCGigux/fXHtzpXLgvtP0i80sX9de8lOMyKLRLaK/363EKWlQ4ChlFzDG8rHsbKizKmhWX/hfrqlg9uRyvfHzudoBPFpfvUho=
Received: from BYAPR02CA0019.namprd02.prod.outlook.com (2603:10b6:a02:ee::32)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Wed, 30 Apr 2025 10:02:56 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::88) by BYAPR02CA0019.outlook.office365.com
 (2603:10b6:a02:ee::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 10:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 10:02:55 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 05:02:51 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>, <akpm@linux-foundation.org>
CC: <willy@infradead.org>, <shivankg@amd.com>, <david@redhat.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
	<donettom@linux.ibm.com>, <apopple@nvidia.com>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH V5 0/2]  JFS: Implement migrate_folio for jfs_metapage_aops
Date: Wed, 30 Apr 2025 10:01:49 +0000
Message-ID: <20250430100150.279751-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: d27bc3a0-bdb4-4a60-dc4e-08dd87ce2dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/76KAsmjb8BaGjp/h6g3/eb1/Sb3cuU2+YlA/9aE92aHEHhHeW4uDCO1m9yK?=
 =?us-ascii?Q?MJs7rtA0cpq6xICuiOvYylUX5ZkeyEknCVmXPveblx/XBjvmlmk7V2fEBCzy?=
 =?us-ascii?Q?XNIDqM0fN1arxPWyUWd6Emb0maqFMVyt9bJrTwEWTNHc3gQmMZK4wbYdheU3?=
 =?us-ascii?Q?2KdpKSakxCnUtZdUf7Qm6Dq4H6vUadsC8lF1EvUTXBIfYPLJlcmps4Ymi/ZG?=
 =?us-ascii?Q?nGaMyGvG5lhQ0/BWt58znTTr0WRKELrgOeN5c2+GgLB0tHFmkNVyWjDKKY6g?=
 =?us-ascii?Q?jWJiMZ/ORG59Z8Dy0/1M/rwFhpmtvY99R6Xr6jShzF59Of8l258fElwPTxMM?=
 =?us-ascii?Q?pVABXLZTUrwPBKG08e9x65/V4lhyCmZe9hj5FpZE8hfZDYA3XgC1PsAduqKJ?=
 =?us-ascii?Q?FJyDzw4CwGpGv+DX6G+QTk0eLtK0lDbBIrGJR9/zeVuey5ye0WIgRY7kf97Y?=
 =?us-ascii?Q?nfKXH/A61noysOswo/2odYILdTNYIZhLQMBnqE4DXJ9lCeyNlLTAw28YQPE/?=
 =?us-ascii?Q?hGPy6TFDAPijnLmN6NVy3Oh3QCCO3xGaQu+JjjOJbw1wc91W0yldHbaJWSHE?=
 =?us-ascii?Q?2YeiJdusQZNehBoSLVDZYE6yMg/zT44ogh5vqPGWAMlPDvPIwZJBG9FHbh/d?=
 =?us-ascii?Q?Haqd/5uonYlp0KVHBPk0WP5CoflLKcy3pl4A8sMY8GQhVvI/7hy59a27TXGK?=
 =?us-ascii?Q?oXJmfA5eyL6TibCtMYRcg9iAuX+brxjI3HBi52mkIRaB+xJ7/cgpTLPiz+B9?=
 =?us-ascii?Q?J0Y5GoQNsTF9/oC5G2QBtHcYxcKnm9KL2z2uvZuC9Ffz7TeGEaVY0sflyw7C?=
 =?us-ascii?Q?x9DnPRrmZZFwy26uJ1i13nWrZR9AjCutYT1YL7TQdNUGO6l5YcPyGjW2b9Y6?=
 =?us-ascii?Q?ertDR+Nzm9VoNlXVAPjrWw/9lWFceM0G3rr1Pk603A578xlqrfLjMQoeiE4R?=
 =?us-ascii?Q?RKKACuepLxWx0Hmdmcy+gIIHOVFcokIWkWznQXZ75OYUHdKLbBIsRutLJC0q?=
 =?us-ascii?Q?3jWlz2RfuQ/iYX/TI487CVnjhGQ/cQgIYfaydn37QN6GwPhYOq6PRDfydmUk?=
 =?us-ascii?Q?nTWMMqSEob3OXh4xIyIgbSC67xCwSmObHrLn/N1Y7WpAqf66XSMKCpz29fj5?=
 =?us-ascii?Q?dSYpuPyLNjcRDMel25RqHiKsLIXM+hY5AgCDseU4/Ec37A7PxJvFpbAHLboL?=
 =?us-ascii?Q?NdbYLeB1pGjxKO5YvthKzSRru7DR3GQ0AkMv9GeGV3j8RvxrNuuXAPsympJI?=
 =?us-ascii?Q?nSvdvrugDS3ixi2cKJG6gWgS1DJxfBcq5KMzKkhC8p+TBoY+BZUZEm6BiAEN?=
 =?us-ascii?Q?X7GaOlo3VeZ0s/UuihJ+7nnFFQOz2GHMwZXniRXF57RVIDqwyEzin6l1+Jx5?=
 =?us-ascii?Q?rXX/VOF0sdgcLXeoo5EVpNbKwV02wsRJhW5g1dBjnfXTPynjq+7YTzh3uoau?=
 =?us-ascii?Q?BYSaYAB71CYR7G0tdw9GmHvl8V2I2Q5HR4CklPG18ohG2sP7OVNTkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:02:55.6599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27bc3a0-bdb4-4a60-dc4e-08dd87ce2dce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

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

To fix this issue, this series implement metapage_migrate_folio() for JFS
which handles both single and multiple metapages per page configurations.

While most filesystems leverage existing migration implementations like
filemap_migrate_folio(), buffer_migrate_folio_norefs() or buffer_migrate_folio()
(which internally used folio_expected_refs()), JFS's metapage architecture
requires special handling of its private data during migration. To support this,
this series introduce the folio_expected_ref_count(), which calculates
external references to a folio from page/swap cache, private data, and page
table mappings.
This standardized implementation replaces the previous ad-hoc
folio_expected_refs() function and enables JFS to accurately determine whether
a folio has unexpected references before attempting migration.

[1]: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299

Changelogs:
V5 (current):
- Add folio_expected_ref_count() for refcount calculation
- Add details about need of folio_expected_ref_count() for JFS

V4:
- https://lore.kernel.org/all/20250422114000.15003-1-shivankg@amd.com
- Make folio_expected_refs() inline and rename to folio_migration_expected_refs()

V3:
- https://lore.kernel.org/all/20250417060630.197278-1-shivankg@amd.com
- Fix typos

V1/V2:
- https://lore.kernel.org/all/20250413172356.561544-1-shivankg@amd.com
- Implement metapage_migrate_folio() similar to buffer_migrate_folio() but
  specialized to move JFS metapage data

#syz test: https://github.com/shivankgarg98/linux.git 69a58d5260

Shivank Garg (2):
  mm: Add folio_expected_ref_count() for reference count calculation
  jfs: implement migrate_folio for jfs_metapage_aops

 fs/jfs/jfs_metapage.c | 94 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mm.h    | 55 +++++++++++++++++++++++++
 mm/migrate.c          | 22 ++--------
 3 files changed, 153 insertions(+), 18 deletions(-)

-- 
2.34.1

