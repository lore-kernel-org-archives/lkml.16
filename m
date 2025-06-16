Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF412877C0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081228; cv=fail; b=dXDVqm/j6LGMGNqP5R16jKP3/S5q3x1dTEAvJqMJoTLL2Au8B0esjgFmaabWvSzV0CGQicElKrz+W4VcU6a+BdBfNe7/FJGHcUDw02o0ulPw7XErD/vo/GyNu72WAlYEUzC7UvGhGf6VEU65wyYNtBU9Y8koa5L3/epMa81jEJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081228; c=relaxed/simple;
	bh=xNqFyqez71/ZJeAEWEeeLU+VNV7V5bFjoxhCRKzL7GY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtUDE07RLJoxVdRzq8B7ieQOMPE+knNDfwBgeA6YcZHTdmwH45snkCOu5P7V8Q5szBoCkSqunOiURwJLEx9+p0jbPSlhQAYBEfQw3Ka94U8RJY+Y6P/rA7nsR7a7+L3EUkOXvzXKjHRsQQAcXZ9GS4LNqLvwXzXd0Y6xZDfoxTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mmseuQMP; arc=fail smtp.client-ip=40.107.95.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mmseuQMP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMAbtltqa3ePcpb8jzNTooM030HyspCjuBs3WoNJaZvlXUKxPFhBxIkUvFAdzcRVfo9Tzw94O1B1qxA2z0R2GkH36B+NdOlYCdJpn4o/uOjfP8NU4VkxAfF5NF1DfhJabKAy77DKjjdpHyRGGXenkrajASylG+TCwGWzh6gI/pSS2WgQ0ZdMvSkWdqy0ONtTAZfFpX204ASsHiEpm5e35Hbyt/LQj5cVPUOVVTtG4l7NsO4kNsg9wMJIbA9lixbKxgPN8svVzWcqG1H70BH6B8uKFZu1zaOBmf9VaUcFUAh5wf0fP09J/DVSMo6MQ1Z5Kd6aIkMaRtqsVT37ipg08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDgCl0d7Wd70n4yrVzUu0KCeeXj09ClwFSF43KbsJYk=;
 b=US547iv//qyW98wWE4U7sKONAdmu0dWditTwWwgteLyJz9gpcQkKKSkFLIXZLKm+3tXb2sWj6QPLxMqScGUlYW2vwU2qstiX6J1wjEiq9iwNnXDXxCltVeH296uJma2z1r9eW02xDSO/hLxJr31ND+jo58UizNNn/oUMuzUB+26p7NZ8WG2C9qcEB78kqXjEX4AK8u4WBvDKCVXMOSpCMajVNqdMVZhG1i9q6Wzn5ZmTvozZkKGbQ+Njm4ZU4mcuq9/gWa19lr0C3rUIs8yR4rp3Pd1xfY+hEX4ZlruUL1RAiirp3aQoNh8I05sk9RCy4Q9XidXWhf1IrjWzNFx80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDgCl0d7Wd70n4yrVzUu0KCeeXj09ClwFSF43KbsJYk=;
 b=mmseuQMPj3H8P01j8XNfgIOoOQEPy0gO9StyfzswutLhccTS+x8DP2D2vjIFZlRWhlb5kXgG7yxAonDAkvig4bikttBfYfVRBdzzETUwCKH80RGgAsmyWsQIEXDf7uTHYEmLwTj1mAVKbQfyJ+UtjWcaentCe2qQMf8W9f9asfY=
Received: from CH5P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::28)
 by DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 13:40:24 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::62) by CH5P223CA0023.outlook.office365.com
 (2603:10b6:610:1f3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Mon,
 16 Jun 2025 13:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 13:40:23 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 08:40:10 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <hannes@cmpxchg.org>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <dave@stgolabs.net>, <nifan.cxl@gmail.com>,
	<xuezhengchu@huawei.com>, <yiannis@zptcorp.com>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <bharata@amd.com>
Subject: [RFC PATCH v1 1/4] mm: migrate: Allow misplaced migration without VMA too
Date: Mon, 16 Jun 2025 19:09:28 +0530
Message-ID: <20250616133931.206626-2-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616133931.206626-1-bharata@amd.com>
References: <20250616133931.206626-1-bharata@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DS2PR12MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 86868c70-204a-4527-2973-08ddacdb5880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jf5BuVtng15McUt35y5mEIj9QEIcZdku+7/qU9pbN0uYsdz5tRDo+EWPuI5P?=
 =?us-ascii?Q?tc/ZmuCowZ/x+gETOb8xEiYvXrT2RxRvtfgpPwCt/I4bq6jXwWdZFahJpT+s?=
 =?us-ascii?Q?ur3Ct6TrGMe6dT+Aw9GI4yM3gw+SxqlWVs8E9N4L64iiY1rkA+FKy7jl08Wq?=
 =?us-ascii?Q?QRGg0J7o9iUNFUTa2g8GPMJxXToFfbhXVNMM39I+ZhD5yPg7uQ4BekpamoJk?=
 =?us-ascii?Q?DODsFgpJVadjzXyl7zHepfbVoiX4tn4PLzKUpKtx/s4bktH9DkxO6qHS/7Yo?=
 =?us-ascii?Q?Md61yMYuRC2hnNngXDkONsmmnOccSSbvYc7x3CuYgpTkCpAYvSoZCfygEFxq?=
 =?us-ascii?Q?VJt3zt8w/+bqsFaqQXDSGo9/n4jmMszsCLQEFcNqyWYONNyZ/8Xm0VeQskXp?=
 =?us-ascii?Q?RMboSbR7Bra6GuEWqGs7rbJYGbpVZYkGntcxvMdR1RgGLzvsy136dqkfiDwi?=
 =?us-ascii?Q?DKlgfx6BRPwP1GLrML3z42933DNv6l/xKDsPaodsgezYF6Omwbc0YSDRYp5y?=
 =?us-ascii?Q?F14MioUXSwYZ2aRS+dzSMGt3nb9Y0n25dk4mJYvgtoG+STuGLQef8Kd0AmFD?=
 =?us-ascii?Q?hIPEXxVU5k+jZgRk50Ct6aJzqaGW8uOtnG+wi5An4mUemjV9g0SPW/qGh8t5?=
 =?us-ascii?Q?OWyuPfp9MJxRBqCVbIIPK+idEx1u31+rOf81tn90+851ne8SfLiq0hHfPjYM?=
 =?us-ascii?Q?D9dwFgUEoRyVKTeMMEQWfIcktbW1USeErwrKwDRih/0xTQtrCjeg6wc12DWS?=
 =?us-ascii?Q?BgUSPDXG6PqZJm9dPfslAcjtf8S7kntzy7BZYb6CRjZUww/jeuv6zxYq28Kl?=
 =?us-ascii?Q?TnJPxwxrK/R2DjkvA3tc+BnNMIqsNNmWWyDWP1LE1JGy7yvjroS83b4abqXp?=
 =?us-ascii?Q?XH87/512LB7sgeBLZtAsciMGq4nJ3pf4s0357w/cETyccZ1giFFLNLAL6mSd?=
 =?us-ascii?Q?g7/g3NiQRZ7f4i/wfw4ItcrFOTgpLb1dOAcxfh/Lxeo8KDi+DztZui0MreSH?=
 =?us-ascii?Q?V95QhICdadZoRRcLqcFYrlwSiik6GnlIJMgoyYn0fNkFFA+auiUnBXtRtAot?=
 =?us-ascii?Q?VYBMgGAwEIEuN9YJHcUCHIy+EO8CPgVLPtTrkLM26NXOZVTlN8o0PLXm2sUG?=
 =?us-ascii?Q?15ZRBMKtMiJXhmPQUhX9VWxW8ptuPdVYEgjsJDehXazGpT3ZqIIJsNnahSzJ?=
 =?us-ascii?Q?gPezxekdqsHwHjKTdSgKeq4DCx4OXvF89e06kbCrYuRa9ynJV88IpDtv07CK?=
 =?us-ascii?Q?1+pO5fCN913D3DSOygVIEZb5nRL8Mx9j+SbYDc6gDkImGx6ZeMZy8+cOq+jn?=
 =?us-ascii?Q?+KENQJrEKpaLcEdH2ZH8SkgiXbywGBtx6857xr99/WPXx22RxRPHRbDhPyGx?=
 =?us-ascii?Q?xsEQR4rq3lVko0Qi3O2jB8h54vdBJsBGWPXn22LImNBEvRenUWRyceY7BCoQ?=
 =?us-ascii?Q?sto19F++jF1Gbk7CtX/obV/5cKmHJKnHMUkfbOJnSKV7dCtsScCHR3cNic2H?=
 =?us-ascii?Q?/QCtmTDSycdNyyYBRqczhfcdQRDQau2FFI9V?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:40:23.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86868c70-204a-4527-2973-08ddacdb5880
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712

We want isolation of misplaced folios to work in contexts
where VMA isn't available. In order to prepare for that
allow migrate_misplaced_folio_prepare() to be called with
a NULL VMA.

Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 mm/migrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8cf0f9c9599d..9fdc2cc3dd1c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2580,7 +2580,8 @@ static struct folio *alloc_misplaced_dst_folio(struct folio *src,
 
 /*
  * Prepare for calling migrate_misplaced_folio() by isolating the folio if
- * permitted. Must be called with the PTL still held.
+ * permitted. Must be called with the PTL still held if called with a non-NULL
+ * vma.
  */
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node)
@@ -2597,7 +2598,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		 * See folio_maybe_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio))
+		if (vma && (vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio))
 			return -EACCES;
 
 		/*
-- 
2.34.1

