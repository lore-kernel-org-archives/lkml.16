Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577C2857F7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294119; cv=fail; b=jEAbVS7TL7dbhzMdSbhE7Rr50vuUduHX+U8T/MTpXaKlpvTeA+f5mE4a2ukX9kjTxSFs8Xyc34dFmOgPh6PZxPP4w0zQHHGFnoum1DVdFi7ikiM/r/dM4Svoujb/xKqXHqSDQk9IU4/Mr61U6WMctBfU9d88hQZzIuiN/GXCdj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294119; c=relaxed/simple;
	bh=VMqrJ0wuFGiEyoInhMmPwU2C5WZRCtC1PX2LDmgrpSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWg7YGOjahTtgp3lADSimoy550ZgSe6sMEn684wupJ7Z0gJvYHHkdZ22WPdUTDQyS6T1jBfrQvk8eXgqzQJ3q7OnLKPc7Cn5oN8QgbD0OGIyngdC/mSpb5JBosCuGKrDUIJjrxLjrTLHTAXdN65OXBmq2i7CdF/E1SAXapQ2YrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jitif93O; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jitif93O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEKyo6gWNeXST33BvOF/tJAa5Vn9tiSNaa3V1S7wOiNpbBDD2134nNWjxW5oin/TG06RC9AA/2YPq5fDlxmn+pAPJ17YlxYqVX70qotGrw5L41YDr+cxd9I0vUF9VywbkGdXmPzxUHrODTkMfhnzAAynaXwULGdseKlipc8ei3hU4DHy6QLg9prFgxWAW7VQJGzvkzWzSswoDO5V9G/k9krbR7pyN/y5UHTPP+nqTkzBwJAAyctCZYMnqohz31r1B895kNE0kJKbKpyrpjzj/ijM/aP6IuU7zUTpXIfnFfmX0mjoy83Z/XGFh0cwdzh5+fZNnHUEbgZIpQnvdUhfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GNNcjevYxEqaxR5v/cByfaw8WyNwwtGWsj/fMZ65vk=;
 b=KwkYn0ZB0mGuzhJZmNknDMFyBTeFJ4fDD8vc9FSzXNp5FUhgun4zUmllraOZZS3837+U7L5QSCAMkwQZclsof+107TB8LZKUK7T2qsmWpvh2GohIn9SENqrsFwntcMpm/XzzbZbyyYGMgfNymhYlaISRU/MlvHP2YA/hLnISvgCuZV5Nc6+ijSliQzqK1Y0QyZ2YJtcWWAbViqaji8iJKGe5C6BY6IMLMcHMcW/lZAHgRHKR0UpilRoduaTYXwnQAH7R70zNEiVwnLZ7AHxXEKVAIwEyifn/l6r85EQq/fvUJzujhU9/MJUPnu6xtyMcQSNrHUHX7cxQb8Y1EhsmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GNNcjevYxEqaxR5v/cByfaw8WyNwwtGWsj/fMZ65vk=;
 b=jitif93OkRUJ+HDlWDhrXA8oDtNFqmRdq/9h0L+1hATUB04sRVaQ/UKB+QnEXR3uCULhZI/HWX4COpO7IbLkM+UKS4mOBuh+FtVH8uVxrEsBE2XWpV0jHv4OhWEabDotRAXa5P2RJNjkj8mUZROIl8j8KfKS4G8jTKIjuvin44YWZjaYqos4XSH4kH68L5Au3Wx1iLRkZ3X+5/2ebD+fLZaYw/ycgUGrBuUjrRfGiwKjw018CIFYd/tZDCfcDbb9qtdffJzWzoSgd0+x8qzJkwuSU83sfMUucGe2pnfF4vrcRgN/lBLnneAULWgNIQ7H+AB2G8iE0np6v1U5UePq3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL4PR12MB9721.namprd12.prod.outlook.com (2603:10b6:208:4ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 14:35:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 14:35:14 +0000
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
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Date: Mon, 30 Jun 2025 10:35:11 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <760CB617-74EA-45F4-90D4-0209132859C9@nvidia.com>
In-Reply-To: <20250627115510.3273675-2-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:23a::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL4PR12MB9721:EE_
X-MS-Office365-Filtering-Correlation-Id: e069608b-5f2a-423d-4a4c-08ddb7e35353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gGzmCaOvUFdiBDvgBrR4Q+Xgccd/1mBeatHsTP1CaYcfdNkYq5pF4J97iNhC?=
 =?us-ascii?Q?B/r7BUkNXpagr/nlscKt1O+ubr8CEN2pKtI6b/quVxya8JXsQCdVK31ft/Tr?=
 =?us-ascii?Q?zSjgluNhVPFl1sq0DZRqzf/RtuRi7j41z+MOOBWwUjYDEawzn8YR+jLUgXF/?=
 =?us-ascii?Q?1c8n/JSoaVkZ/oslET7xcE+fqYVLu43XShE4va2DStToMgW4UKSQ0SgnssPe?=
 =?us-ascii?Q?xmxVl8i45k66lWh8QkFNnKxctlG2kpITZ7/JQY2orpg/wS/PB3JRtibnVDof?=
 =?us-ascii?Q?ww2X00RM53inFMG213Z+Mzg6kkz8GmqFzwTHsZjAPsSV2rvdi7DyKsSWJY33?=
 =?us-ascii?Q?rixYcfpzhXaFQ8M3ziPvJHH0wZDnJJxoZ3XgraM1pHxPZHiliJEgUMGgyEV/?=
 =?us-ascii?Q?3uscTlqvcom7nEb5qGqQpUo3NZtQgThS+Z7vwXJYNBNHqRfD6q6gwo946o5j?=
 =?us-ascii?Q?bPM14jX5Y/Oe7qCkfUEFFAky1JP/cTUzIA2y9nyKEQ6NyHQxav/kEQi2ZUoS?=
 =?us-ascii?Q?7BIt4Ylof8czFa40sLZbPHTZw0yyZ8P5YbkJAat+YLaOhqIAsXbj0nOaVzFd?=
 =?us-ascii?Q?pePQRPCW4NFcE1lYgL+rA8YltbnuaBgg/77TmXd5cYaHdQj6P13RZNZVp1BM?=
 =?us-ascii?Q?8UA4RyhJfk0eqLka4VWsD9wSW9fkWFqzEJi5M4tjUbAsRffZteqyZIFzHju5?=
 =?us-ascii?Q?cUKrv8Vdn5qpA+t/eiEZg4uvSAEpZup+3iK+ZnMUTezSyLotzlwiHaAHGLPN?=
 =?us-ascii?Q?DxdblUgHaibiWMy4af7lodQcPEzskIrlchgB9gsTzCAVU/XQzjPn3UVO9m/x?=
 =?us-ascii?Q?9opR7XAKbGNqhrmZZlrIKF9FeW331gWUTInslkYob04ny9Q5wka/XYy5z1TJ?=
 =?us-ascii?Q?UnvV8t7psH/ZVl2elJybQQjje6YzQ0G/qsuYqUWPoCbS5lugxc42Eu7DGavu?=
 =?us-ascii?Q?rJSyWrRzpDZFdqgVUxRVD75H0bl7LQK77LKQMss+vlbqGdBXWepRhOO0O8V0?=
 =?us-ascii?Q?LVD/qcpl24sMeOJKzmqQ7g9ogxMy0LY0EgeJdfoyg8Dkoe8zfriwEt9cKrW4?=
 =?us-ascii?Q?IfO845IVvwPv5BBST+TSceJemeYiEAS6yiEB9/3Jc6qKFHcrXBAKvzR64y93?=
 =?us-ascii?Q?Xp8uHRZfk03YnjG/pci7iCAQnCLuIdNL2HObRTFl+VvPM/x8YNJtO10RfDcE?=
 =?us-ascii?Q?5Ea5uvMoaOLb2dwO2jLfIe0HoVGgDq3qom3uF7ujzSvJzSawQkycj96W5TVS?=
 =?us-ascii?Q?JsLmNZi8waQcgvXIsBFGQDe82iSfkwqwBONyMy0rumqh8B/xsyHPa/gYWuDM?=
 =?us-ascii?Q?ijvMpYn3L03ZjcChMDdDjuPUesVEuw+KjWlsGL6xtW1Oy8xW165xZRib9Zfu?=
 =?us-ascii?Q?AFF52JDf+6En+9XS2AtDQelvm9U0DjXU8qTh14xrpvrWlaUAHSNV8Xn3afIt?=
 =?us-ascii?Q?e66+hmk/uHw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mald1yEE/GxJA/Wmv8p7pJLtDoQA7vdnidjDs1C0esHK0+nU0I0G6vrjkOub?=
 =?us-ascii?Q?r82qGUtryOOJcwNNonwcSiOL6KRXzpbHuLesoNIXYWXw5Olq69xbf7KPRbbv?=
 =?us-ascii?Q?NeZLhcPIUfHScWAHckbkxeTZTB3lljS6KcNCZfR58gMf/QOWApV4o44HfclF?=
 =?us-ascii?Q?AwWXTKVL1CmxZVi/OTfaLuiHqv2tCd/BjLPRl+FznEEWCmweBUFvrGqTtCfH?=
 =?us-ascii?Q?qevw2WmY+PR+mlwv/S+0MvWEzIezorPZ3qt2GC6Yq5IvNCOSRsAsexNVv0Bf?=
 =?us-ascii?Q?nH2wpVnsGNsiDES9QI9XSCnigzHfUbk/eKuTnQzrVYmwcLwRz22rwCmSf2OE?=
 =?us-ascii?Q?jX0ZelPkDm15kwpulHH36slOhuMHm/nyWAGCBTYOXHRVhqCRenypom6Mw/B2?=
 =?us-ascii?Q?l1W7A/GnvUT7KpzyTEhVbvjgys7F2L7QUtzEMPTwX0DmBgULS0UYp+/i2HgN?=
 =?us-ascii?Q?SpysKaLkyROC0TT1UvADX5A9jrs4xwVhvBru1+bj6AB1Sh5h23WwydAFOQZN?=
 =?us-ascii?Q?66M2qeRuurkqcnA3Vg/+gryylzV6fzDhswZQqrcVVts/y+tuF/yIdlPbBQfM?=
 =?us-ascii?Q?Ds9TwFRk9NRXo2pZ+W8jrjbDF0+tEi4zFmnr9Yxk0v2i6uNAROxq3MvUxRTH?=
 =?us-ascii?Q?v7HH2eXby4dPNdQ2imoajsAQqXq6LRbtHg9gURpzT/WBEKN7djhARxxoz88u?=
 =?us-ascii?Q?0auVsK5xBvviJvNUKIngVmkK92Y1ynOJMXSAhIamC5Pt8QgqLLA9dbc+yten?=
 =?us-ascii?Q?IH5UExVNrhZ60vmZa7n+y5VdI4//Od0emUh5Y2YHKunTVMoUE0pzz0TbgCq3?=
 =?us-ascii?Q?HfVcm7IKx2ZibX+34ryMe2pha8tJ16MK1EwjXi0M7bYKjS+Wz3gDsbBs96d8?=
 =?us-ascii?Q?THF1ceYIOcP2FqXn5lKyb8UxUzSJCExrEGH6cFCbB+zuq7EoxjQ+jRpSiYVk?=
 =?us-ascii?Q?qG3CuP+wwhfSorEaYcx7/wWyPxD0X9LuNnDSEfo+yV6zGCZQXHO6USckBmmm?=
 =?us-ascii?Q?uLVzJ8Gy7XSbxGBJiLWqbdAjQKDYEe55JwM9dgrhOQt0TgPtH5mNvnP3Tzoa?=
 =?us-ascii?Q?AUMJsXLChbWrs7leRyhAFpS1y0ITu7CGCqnfYt/vqKDyAYW4sDjxni5ZgvmR?=
 =?us-ascii?Q?Lncnktt9pznOy5Fsx1bi7+adFEFG1yGiZD4FOmERDeZQyUC64yvl+Jv+hXA9?=
 =?us-ascii?Q?JJhbEwXsELrEivoQRbPqi6bWUIREYE5McBm62b6BQpUZ3yWywcRQ5V/Nv1C3?=
 =?us-ascii?Q?Tal/TBPLNhh2XSx9BcXpRYRg1ez6mDlFyDl8OOSiXMAENcTaU6E2Xx4te/n/?=
 =?us-ascii?Q?vGTViBuXFdRdBtkIjmsbLbQtVseYyRKOgQUL1FYZkOvR4ijkuYyLXDPZ5ep5?=
 =?us-ascii?Q?HNU00MCGFVWsT6IlKr3u02b5GHMXZNOcW77KAtwDYVQ6cCnqFzDC7j2qo0h2?=
 =?us-ascii?Q?hia3ywf0rkZRkF5ux24FhO1uTEDZSopomcwL81WG/MMBGk/wrxl47Kt76U+T?=
 =?us-ascii?Q?J4qo3ujjoEQtW2CZxHWkWikd3X0AmCyoNEGSQ0JHHVBXkXjYNxNw1Z9K0Mzg?=
 =?us-ascii?Q?o+sukWl4fVi3NbsX0TMkeH3ia7MAqrBYcsvLKVeE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e069608b-5f2a-423d-4a4c-08ddb7e35353
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:35:14.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpVjna+QKD4l8hfWRsKH4Eud6SqpWT1DWkhijKL8tR39hm0yYEdB1nzwdng8jFhv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9721

On 27 Jun 2025, at 7:55, David Hildenbrand wrote:

> Honoring these PTE bits is the exception, so let's invert the meaning.
>
> With this change, most callers don't have to pass any flags.
>
> No functional change intended.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h  | 16 ++++++++--------
>  mm/madvise.c   |  3 +--
>  mm/memory.c    | 11 +++++------
>  mm/mempolicy.c |  4 +---
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  7 files changed, 18 insertions(+), 25 deletions(-)
>

LGTM. I assume the callers no longer pass any flags will be converted
to use folio_pte_batch() (no flags) later. I will keep reading.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
