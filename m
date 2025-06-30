Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03692C3749
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305210; cv=fail; b=VbBiOF3EDAdx4UHZdATJYelm3if9XvGreh14tgGH7DPM8+Na9x2VtfihTjsiMWWlVgLIRC8c0UOm9SX/pFuYPM+W4VYSdJrAhyae+F3laG2KXKmp2w/VJS96b4m4BsaCzIVUoJGxNrAE6Nylydp2hr++cUL06jZALLquYqmyZe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305210; c=relaxed/simple;
	bh=Up719CR2izOl7l0lNEu2DxPuDK5ObjJ9sSwhrFMrP6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMe2bIXRl0cPTU8GsSd+73H5EbqdZPepHCHJm0ioAcT1owAA0grX60W8CPs2oe+rCvl4oQgcjjzwPcutoee2a5wFAoMLhqyI1y/xdCCoUWHryUKAtFcXWDBxeEo6G9p0U0Qbcc0AyKEApnmZ+rRcAfkHyl2+RrJVuxzr5Ddx3n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jtK9A0nU; arc=fail smtp.client-ip=40.107.95.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jtK9A0nU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb7+gPRbFrM/BCxa12zHisYJTB1bIOLV4tuzYW57IUdNk6aCtuTGXi3CqQ+T7drYgoMFO0ar8We8/YToIAwimBUzOFsKgGZkThc+RXqgb3qvb6cdi+ediIbgOdLuqzmGrOBiDJwPfZyC4ZXiIM938ptOmQ1UB5co2OtYYinwnriUtXm9qylKF1HJKycZAeP3pOGJdU4c6iNNFUsg7qB3YuvIxnSI/wwLWjNC3vrQnSHEzGFg67t4QZgotg/JptFXmVIMb5p3hNz1oAMgBn8a4BF6eSqGxSgyrnkOCfHUDI5nl/Pj80BH+Zh4v8pbjvdYielpanVKo8V+NfN6ElrJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDS/3DorpfHhfKyPEak0PtYVD4Rl9LEuT7ZLDAwF4Wo=;
 b=e6hSlkPQwm61iLCLObNNLVsa5S4hRCGMXEvFBV1fTIbUGyDawTZWz1tPuOIjBhf4RzH8QFXoWle9aplxRPtdSek3lrRU2QWIN72ReeZwg9/hh3hmC+u7mcN3qeu0x/RUP6yjFBDJYbSJwtRnZJAeWCVjo1+E1gPRYa0lMsXr7PFy8XqkhUtIKsc6yDh9ZVm4INwx8LCxB3bpgW55AvaaeaRTL8G0KLikhtvRu41kP+gdCjZ+qxvuhX97kPU63r8mD+nDzYKvs5pymDCTCWDGfgSvJKh307xKl3BDTqZs+nZPHJaSuD37ZMvRHcOTB14ZaQ7EjFSDZjIQiAyIyEB/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDS/3DorpfHhfKyPEak0PtYVD4Rl9LEuT7ZLDAwF4Wo=;
 b=jtK9A0nUgQZRvpICzL7euqZIZwqYr01sTZGDcfr6MAI2rg0YxikGRN3zN5nioMau8Gy/n4oh3gr4zsY4YNJDV+GaMR14BaUxjSm6lnkPeqp39kVDUGmJwc7tH9Al7uq8DAXwCAwKPyV7/FloQBqKNoH7w2pCOYJt+Zv5WZmWWgZv3xhOHOWdvQURGqPMbvVmG6/9nUIxgxy1/GFyMaJWFQsX+Z9JBi2Aw5XeZBifgLz7zYNRlWyg+1Eelxq7WJdOPDVL+iv1c8+86NjWQ1CPPjIe1v1qP4kuzBp6RIWElce/QgtvN2IO7Lv4ha77ChWBDciUINGDMkaJMqLLA7dp9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB6697.namprd12.prod.outlook.com (2603:10b6:510:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 17:40:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 17:40:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Date: Mon, 30 Jun 2025 13:40:01 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <1DE187B9-F11A-4336-A5E6-933E210DAFA0@nvidia.com>
In-Reply-To: <20250627115510.3273675-3-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0028.namprd18.prod.outlook.com
 (2603:10b6:208:23c::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5131fd8d-02c4-4312-cc1f-08ddb7fd261e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6PDC6iL/iUqFvIah1YLv0pSQq46U6wTOpTGWTY3q0Zu3eJxVGQ2fMmRSc80f?=
 =?us-ascii?Q?67+n2rwjmpJqolaAuLcSOKSTFVVCOG9FjQwxZQIzp0/J1TpbJQMbSCM9LKL6?=
 =?us-ascii?Q?k5rnEo3BNABkV1C2gf+ARTSMcWHYtJYJcTUjud7ukQ5ieuzXdDQ690TNKvrk?=
 =?us-ascii?Q?YGyoazTnZzr3TFLvujo5T6HKXBNW38JFAq3ctbFT+4L/QoaKXo9OTC76hJoM?=
 =?us-ascii?Q?g69dp0Q+WKp/NphQDEFyyLh263q3ZBupwn8m5ooffgK2pHeMe8YoUI3Z98pH?=
 =?us-ascii?Q?FnJTcBXIV4zoOsG0NEU1Q7rXlSDpLjrdmQ7ycNslk3DRXfnxSgLOrQxY0FI8?=
 =?us-ascii?Q?On/06HhX3AbUBL+wlid7n2P3KMfjOxg4Jp9Uk0DTz6GvVQ+s5F54YvjRO0OI?=
 =?us-ascii?Q?BC9Pt6pN46mTvnCbwbJUon1iZm1jWUP1qPcHPF0Yz4uBBAmdmKXNgE/N8m84?=
 =?us-ascii?Q?Gik8JcBnA+m5c1FPCwgwkMEg/a6jG8MoWxoVocefRQN4TPwZKGjAvCKvpvWU?=
 =?us-ascii?Q?vMu2hY09NNvXCDyVtgLp3qQckFQBnP5hs8qF14Xuw4xHyyKaMmnLGHXi52RP?=
 =?us-ascii?Q?XBOaLYZQgRZhWL5nHyr0iO1HBwy+3/nHDsMa/FXQYKQ67702kXZmFC+rgYEf?=
 =?us-ascii?Q?OCF5+pxkrmGviGUPbwgxhxyJSc8nLARVjyMQ9L1BNQ/zZj2G54ix53dtcKNj?=
 =?us-ascii?Q?KZkNwrWCpgKFAJDmObfD5mFdrt1YNt312iOypxDgn1l2gAh3UEj0IQF5YAkp?=
 =?us-ascii?Q?YgCP3EKz4moT4wSmwQeMnjPSvWDBgkn5cYCOeqdw69kwItUjeywE8MpaiRH9?=
 =?us-ascii?Q?Kf9xzeNNMEP+r22XBZoLbYyCpVm2zQHzKb0aF5dKHi9ITFwNsquPlzxsgQB2?=
 =?us-ascii?Q?Eq3MAHTha6sB0+Bbss9bSSa7YmxeLjP4PGP8YF302kzxtsnVkUxn4oIHX07s?=
 =?us-ascii?Q?cUGXp+9SgrgKj9TqESFDdJXtHj0oTCWU5c3/JicnltNx4u01DDDUvfUTnOAn?=
 =?us-ascii?Q?YAUQOQELzpeDLrnGdvlIMJ6tBAgwBCMlfOQ0eG6cBtulqxnLykfaAMZHHkfB?=
 =?us-ascii?Q?zqUsu6/qpc6c59E4m+fIcQhXI6FnmfF02Ml/Svzp0dmk2d5hiYYp/ic3jOgx?=
 =?us-ascii?Q?cVEEpY/I/CZL1ee2fDe2ohbr05xnrQQz+io0Dt3KrhCBAwqRKJRewxir0CmC?=
 =?us-ascii?Q?AyCUnNqJUGB7H9ijmFnAlZAs3qyqVdQz69fOzqhZryKU2z5lfSUAsFAFnchW?=
 =?us-ascii?Q?xIR7oDcvHKZFx87nqqvkYO3SsLVFCWQ83Ehx1hkN8WyJFN39yHEuAl9i9Cdb?=
 =?us-ascii?Q?i9P6iffZiUefJygusKU5OqVA3LIbkS4o4E7HW81Wj4cqDOsauC6CeM4tfCjb?=
 =?us-ascii?Q?LnhZ/kXoWEIaiq9/RjOheLZZ+TB9IQbrQzgzDaGOfDoswfvckPkTCKreE5mS?=
 =?us-ascii?Q?CohtVaFFIQY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I+8Al6cAs5CK9NyoXuYIXl4gzlbKdrTV/QEnHgOKxrrbDybDHN8YkO0AOcyn?=
 =?us-ascii?Q?x5V39UN+vHvPcLVPiMEV4DinmshPE/bm4JwwKxQO6IxbNl2t0tZXt4r0MrlN?=
 =?us-ascii?Q?juuH3opFuDb/RDNzY8nIUy7MHvGtqQXr6fQlX1T6JqJRb12WusXQd+5bZK/m?=
 =?us-ascii?Q?wntdW0oFjYM6pS0CKDcOxe974gl0bc9j1PKiFKC60YWZmoKnSF1S7gzcWblc?=
 =?us-ascii?Q?vuWVAg3flN6cHwYpV9SPzz0pGvJtoiSQhNqgqqns0gRi/LbJqZvqMhkXXlip?=
 =?us-ascii?Q?6Qm6phYZVrPi+XvITToR0smXZEkxgdsXa6kLxcwyzSFSiaNu4QmP9FzMkyX0?=
 =?us-ascii?Q?mUw3kc5/bKslWqPPgwo4idb9DTFlxsHxGjGmpBeHDuNo0WmaFagTYOmaqZet?=
 =?us-ascii?Q?OjaqGVmkjdfOyOjKXtj5ZFzLQiRH2PNpGr7142HP88jiK1P37eyk9gjyidMI?=
 =?us-ascii?Q?TexhsGjXav8GDOnBr7HB79NVdKXNrx1eZHQfANksblFlsPYSmWzEounp0agl?=
 =?us-ascii?Q?K9sD6wocykiCFp2xgo8nnlGc29cdTR3OnV0/iz1efELJaJV3bYu6se1vH9qS?=
 =?us-ascii?Q?AquK8+Iv/VakAa3FePo7sAO+Ehy2e+Xgj4yeQBJ5jcu17G9ADYmAt/6P9GrA?=
 =?us-ascii?Q?rHVgWNijtnKyozudOsRP/o+7BGHssM/jE6RTpfEHQ2IYaqQs9OjwBivKOp0R?=
 =?us-ascii?Q?xAUmW0CV4NC9WFTvVFQ7GyRNeW9q0z2zsR20twW1oVZ4NF8bR8iJVwNyOZFd?=
 =?us-ascii?Q?Z8DeRt2XsVvJsvr5Ujaci3uMrSknZk/8ahlGa7ip1qDO+V5it/jJNdIeyiFK?=
 =?us-ascii?Q?7ZJroibPjwoOP/y+XxLTR5W9lZhLdQesmx/33G22E2dEftLiD7Lkojq6l4yB?=
 =?us-ascii?Q?v9dPmr1GpkOyvBN3RGauxCk/3jNCxr7t/DwZLyOszVD7YWMi+fqviFF8V+u1?=
 =?us-ascii?Q?79O3bDtLbXG872Dkct5s6y0zQg8OXBENpzPnUiptiW1r/xXyz202Es4SwTeI?=
 =?us-ascii?Q?FVi/iKOVD4vc1HLoow8NRC+bxAVh9lkUIYH+8iSjsn4k76TyTxmR53taA7gs?=
 =?us-ascii?Q?OiE0s7nRNMpkCpsxj/YJMzF/WvfVstEeURmkY71Tn1xFvwsG4Y46jSajG5KD?=
 =?us-ascii?Q?wPqj467BfpqxEgJACyoDjwZxIrVV6aqadw8pcBBrIwai9EMamXG4hGPfQROo?=
 =?us-ascii?Q?focMBfKvLYmJrCf6IBwoKY9fMQPugyd7msMo23BPBNC103bhPPYaln90M0zm?=
 =?us-ascii?Q?5+c6sINMEI6v8+yJaUtQV80Xbr4qLIS+py2/b3/DIDQi+8SXykXai0Jfu3sl?=
 =?us-ascii?Q?ziKT0g/le8TF4ewVOPMOkSEjOjQ5M0KgaDDzJ96IZD1KPcV3kc7Yd+QHlScG?=
 =?us-ascii?Q?gAA4ZyBuDsRnpKTZCnQUQkVtkX2hVruNfPHgD2N/L8Qh7ZkmjAEJ4TRgZ5EM?=
 =?us-ascii?Q?yCOKotcK3ccjBSB3gkjAqu+ybDJdE32RUBLGPme5x14ddaD02/GlF5Jb6nQw?=
 =?us-ascii?Q?GJZQVtUw5fCUJeMZ38dLcVJo6hI0Qjv6WkIDO68sN/qexxGiHkeEiN7Yt2dQ?=
 =?us-ascii?Q?Z9igXJEXUc59V57mzgM27RGHyyW/qPrWC6JFsXLu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5131fd8d-02c4-4312-cc1f-08ddb7fd261e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:40:05.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 387IxepdzNG1jqPaSL9XYrYFua5xLA1ZKlVqwtDpxw6VQKRHqrgw9FfNj7rsclGB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6697

On 27 Jun 2025, at 7:55, David Hildenbrand wrote:

> Let's clean up a bit:
>
> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
>
> (2) Let's switch to "unsigned int" for everything
>
> (3) We can simplify the code by leaving the pte unchanged after the
>     pte_same() check.
>
> (4) Clarify that we should never exceed a single VMA; it indicates a
>     problem in the caller.
>
> No functional change intended.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h | 37 +++++++++++++++----------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
>

LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
