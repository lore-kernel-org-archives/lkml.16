Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405782DFA4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870166; cv=fail; b=kap7AOGW15QhLvn9u+05P0oxUTY50gsKukqmAYFo/+BbK7Nk4Jpkp+0V1wyz95zQJ3VokoZuAAUEnH2lD2mYp1uTgP6UUzUN+I8J+9xCSXg/qbkPtJrVi2MxA23sCCiRCpHdMer80hwk4dBQ/oaEM9LxQGzGc4lhj3Gmfb3FkZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870166; c=relaxed/simple;
	bh=H2E9Lf2JOgdA7NYYW9jRMQSobfoJt/eD8AGoZaBQkF0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EzKEiaxsY3tZ1NPSakE0rZ+T0OWw/xOHGNO8v+C8ROWmjZA5PqMh6q45IlndwhluI0IFZYirqaOAE97oJf4L9GaXx5jrkXjca/q99kHfq5ntN9CxI2zyQ+CR4C927yyF+Q8zoZO5oyCjn6uZg0RW/KD71/lNQBvJOnfjcIO5ETs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f1QQSzUz; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f1QQSzUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3R0Hm1ynKXmBt4gSckeRWtMnIYAny0sfqGcSLY8+IvKbMaAbqaB+vphOzCX1NRREfWfz9DatSQ/sI8ezGuSDIwO7cpMkTZA+fYWiIas0C2u7RDzGwRYVbXEMHszd7iDlTqokhzLrYgs7NEsLcwUeYdwh1n9OX4fG/5se/tRYrbs6IgEOp8HL3Kx+tKOjArBECzq1fVUfpDWaz6ZibicAOGvrwtyz5YsrZiPm1KT79wQ5vW/u45OlGDX17nHmPEPC8TP500NpRZTwHPC+KsBydydjMAHjImN2jXuZTFdF4FrYBd0Y/8RfJiDvfkZlxKIel3skI9wxdIldduElCkGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqXY5Er945eAXJw3y2E6CwqK9UQNVuGmxj7sj7iOfXc=;
 b=oD6F7aS0Y7aOcYI1kR+Zl+NY4e5lVuB76KjwYEYQpyUxngjrimynZfYaXIRjUMvaYxt4FwPiiEv7mqdUgKutbsK/Mpig6gYW2MCM9IkizuwYHMkdaYv3EsteRQQy6lOWz2Ki6l17/KPN9wUuFrKungxGEFXOgktA271btzaWFaPyP4rwpUnBwLFH+sLbFhwuHbe2riq0Vq5XwVCMI+HVUiihRPrGMBNDyKv6M9hta9k9jfQJq84+mrfzd1IIm1nV4digUxscZK38Ch8BUru7tmkxzyCbf6DuYwmd72g4UXvH2+ugtHIzX1/Qx31CMSum/rTHydhalk/327Xe7t82nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqXY5Er945eAXJw3y2E6CwqK9UQNVuGmxj7sj7iOfXc=;
 b=f1QQSzUzvUJ9U3QqEsVNE5rM31nicmLl9d6d5MDURijAxm/DcAb6r4eu+WCboD+TOyIf6odvoa6z/zak+hYGuohIsUSz4LWNlXABYgOf8ZFRJMBnFPlCbwArEGaKgGi4p88ePvtJXUaWQL/jNNkd5+SnEOTiLRaRAuZ3FyBhFnU=
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.21; Thu, 17 Apr 2025 06:09:20 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::bd) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 06:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 06:09:19 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 01:09:14 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>, <akpm@linux-foundation.org>
CC: <willy@infradead.org>, <shivankg@amd.com>, <david@redhat.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
	<donettom@linux.ibm.com>, <apopple@nvidia.com>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH V3 0/2] JFS: Implement migrate_folio for jfs_metapage_aops
Date: Thu, 17 Apr 2025 06:06:29 +0000
Message-ID: <20250417060630.197278-1-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|PH0PR12MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e2dc27-f3e5-49d6-37d8-08dd7d7663f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zwXZjIpyWAKuAlhH9kXx4HMaMFMOvQVVv0rubTsUMV0mdaT63JBhSSRy81Km?=
 =?us-ascii?Q?xSmLZeCTJqSBmtz0NkIHtbu9kxDFrc5ZaF3nOx7z8SA/INdVmOZyvj43PPgN?=
 =?us-ascii?Q?3+f9YEqScRgcXhfOjdOAV/IR/cjHe2E8DJLtFiolvM+iHXVnyoDqzwMw8hsC?=
 =?us-ascii?Q?/yGFfnu2tBUd5ns+BE6yoCazdRP6HQEvGQV6d09IWUFXy47Xq2tFur9D/m8K?=
 =?us-ascii?Q?9VVsu6CNc5pqbVaL9B6ArbXZ1p4sVkJQQdT89iBN3jlQpTM5t6XuPS3F+Jfl?=
 =?us-ascii?Q?SXfvqDq2nN7Xs1NuCK+XdlEEpWpsFYqcEoPyKwiD+rJvjoEk/rujzsdf29f1?=
 =?us-ascii?Q?RzM/hWEr4F+SU1ZfT4YHV15FVhqhO/Grgakop/nSH5ksvEtMJLC6O1n69IB1?=
 =?us-ascii?Q?d+J9OzjV5TrFjsquuU5WA1Yyxtw71czRvxc/c9iHFO9YJP5nASTVp4d3Y/Gf?=
 =?us-ascii?Q?JWSdNgaB26rclV753LPtIZ3VdxUFIcBtslwJMqiVQM5IREEL0Ah7NVYcFmpZ?=
 =?us-ascii?Q?RK7TeWysXko1ihyve/Qq7iFrGZ5U31ScJZ8DYcff8kA+y8jFD10GX8ixHSHA?=
 =?us-ascii?Q?ZDO0KiencZAaIYsj59xke+40jMYJJdgzDWWS7ewb04Xqqw2xaaaETz4NCt1p?=
 =?us-ascii?Q?8VXy8VfzHMTgI8j+iUvLE3FNdyfz4pPrAVXxsqfnBh3RXzd+B3lsgEUWRhQb?=
 =?us-ascii?Q?zWb90z4TiMpiFYBxMmn6rO0sGuwcl1WSMRWLOf+8K/9Aen00SmxaFJBBERZh?=
 =?us-ascii?Q?n4zFMvyJ4gRmRr1+ruKmdQkfu+llkSRIGuS39lWrTYK//LEzcBmsj2liVejx?=
 =?us-ascii?Q?HqRnPO3ZBEIUHIUUJee89fpB9diX1InchXqKX1XYZd26idv/pREYdFbuXGT4?=
 =?us-ascii?Q?c3Q6AvuJuk96ZDYEpxra5kXfPhNDJoSWDXJVUSr8cC3Lj3OdZKslMrwcovb2?=
 =?us-ascii?Q?lEmryiLPRszyV67u9dh/+SSx/x8fc4hAlFG+DRG7ThAU4qvokPu1/sEVHd8a?=
 =?us-ascii?Q?MPa47bhAoP7r4qY5NUghlt4xwKgz8nPZhHJxmB1ETou1m/sC3VEdhm29PPvE?=
 =?us-ascii?Q?LpzvIMuEdUXQh/W9+y0wr4HQbXP/4dkQpu7isgbJGv7VPIjN6zZwTzyuAOIb?=
 =?us-ascii?Q?m+svScmC/uMNg7gofg8mC2K4JZ4+g4pstHPc8ObpT0n6vNGe0ol5cdERMfgf?=
 =?us-ascii?Q?rbsADTJUm9ni3Iv79RZV9HyTIBXdHMv5+Sm5i7PikkR8fE/y3poCTntvwefB?=
 =?us-ascii?Q?IIVmw/UiuLdS7ZrI/+mXuJme61UAggYqZV8KcjOQrfjQqBGNAZWnVU9ttnTk?=
 =?us-ascii?Q?HUHXMK0wo0yXEhAVSbfUElq/2wyJrmHkEBUYP2rJ7tEM26gXvsPugTSd8Euk?=
 =?us-ascii?Q?616ut265BCiVrdKLYMAjwBzq49+q7EzkJz/JzEN6yVv6tFLyVwtAXuSYJKzu?=
 =?us-ascii?Q?kFVuS2p4Ian4D8dJ4W3xJp6EuQd9TTkkTHxgf4LOcFPefJ7f7jO08Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 06:09:19.1281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e2dc27-f3e5-49d6-37d8-08dd7d7663f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648

This patch addresses a warning that occurs during memory compaction due
to JFS's missing migrate_folio operation. The warning was introduced by
commit 7ee3647 ("migrate: Remove call to ->writepage") which added
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

This Implement metapage_migrate_folio which handles both single and multiple
metapages per page configurations.

[1]: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299

V1/V2:
https://lore.kernel.org/all/20250413172356.561544-1-shivankg@amd.com

#syz test: https://github.com/AMDESE/linux-mm.git 07246f14ea

Best Regards,
Shivank

Shivank Garg (2):
  mm: export folio_expected_refs for JFS migration handler
  jfs: implement migrate_folio for jfs_metapage_aops

 fs/jfs/jfs_metapage.c   | 94 +++++++++++++++++++++++++++++++++++++++++
 include/linux/migrate.h |  1 +
 mm/migrate.c            |  3 +-
 3 files changed, 97 insertions(+), 1 deletion(-)

-- 
2.34.1

