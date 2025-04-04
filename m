Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1873D14F9D9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752506; cv=fail; b=l2NfYI6Z/VomNjndltKfBgUYv8Slu3bP31PAQgUryN4ixIPVNEgHcEt4f5tkMPxDU25zfGJn0oLZsfeDqyXnGoVtrRQqe6b4UnFTk9jSo5wBvKVgEjgWpJy0L0MbY9LsRKpuHvn4uxYklMOZ3PkveorNi2m8GYzEfyXJbGVH7RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752506; c=relaxed/simple;
	bh=P3SU58ds4vAFA6S3RrLo0U6W+5A6YZw0YvICz40KbFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S1kcO7urNVEAfqa9crAyh7iTGp+9x1GeeS/ElIfHjWw4Bv7m0+qnW8YZ44RMlGDtz9TyyEaLyhZVyqcahpYvCfOYET4+07HhW03JPqCgEFtr6adZ0O+JrlUYI2JUQFumQDwQI5S36TT0fYDEp3+lJ93w/RFNc9G5oOtoDy0lbII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y7a5blAL; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y7a5blAL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrMEKTZrJQjQ5EcxsmuXT6RsVU63VawAsIcu9vDoL7kSzLcWBQ3Zb36EisGb5kTozMYol+MOpvI/zNq4C6KPaz2uVTDm7t52tzCJNwHu2+0sNFhO7yQXYh3gYepxtkRflxDXoVn1i2PngFu+CSYUuo7iFyqt8XHEykijC6FlDBPesuHhBJ9SEmNmhtYK8SevYLfeZovzRBdn5ntBaXH//yCrO9xkTRse5wyouCo3ciANjlKN7/ZbSQSgtgkbAREQyU88rO/jRcIh3w61K+C3yWIEUBH7TZC9hd5eE++HK3QzdzYzEzokBRgczV1Q34QKn01dRTLanV7X7X4g05xEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mctEUKwX54lQCyPDoyhdP+dnQVvYFadIlk3191cQXM=;
 b=VUOwQ1Gdlf+tlx3kXbITKVB731E5YOhqCzVVVri5tQcDK5n9LRPUbYJlHoVdq55Dp069LD09p2AE7xLQ3bBrn2psTELPAmsuMCT43cNFIsA3erFBADi0/taWdLNLocEH8Z8kIz68b0G5aGOxj0esSAodOBi1hHMzQIqeqA7KacBL2lPrPrOMrmwIGN5NBlJMIA4pv7rxXkkOAkNKM0kaBPvSmDb1RsZo399M6VG4NAmD/DbJ9/ac/l3iEOw+7Nv2Ci2udSXZrDGnLnwunl4xvcwzhBvaocfv4qTjwUd4X4s3PzFlX5oSRDNPkeuxwy6K0fvFec671gagpfHLOrH3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mctEUKwX54lQCyPDoyhdP+dnQVvYFadIlk3191cQXM=;
 b=Y7a5blAL+yPrMviKqnOTMu1ZueHUhMWi1Mh+3yvZO5dM3x9E7pGHN5CPNA7diMcyonMz4bJJu2qaieWgSNFgCz+2B9wiog6JtE2PSGRAa36SnsXwYRVvb06cga/dF368zBiT3DFsWjHT8mDIVxfTBsJAbBnnbIJmxW54pDclePFNLy9tQ9jQzGsUReQK7eBOsRG44GMo0uXXPhN7w/UvIRu+1v16O+Js5ITbM7DQjBNgiZF1SNTYQ1kidT6HHtdqXqVh52IM2/6CQQNOuLA0UQpT8tDy4FcaxfVXuWQXrU5zRksFt74CWwHsuZmopZOhmtzGdhSTxdKOy/GQKYCjTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 07:41:40 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 07:41:40 +0000
Date: Fri, 4 Apr 2025 09:41:32 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCHSET sched_ext/for-6.16] sched_ext: Cleanup "ops" usage in
 symbols
Message-ID: <Z--NLGOGQe_9xULR@gpd3>
References: <20250403225026.838987-1-tj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403225026.838987-1-tj@kernel.org>
X-ClientProxiedBy: ZR2P278CA0046.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::19) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: fb53b34d-875a-4795-f7d8-08dd734c2366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GSqPisdrbob1PHAi9BYK9zRtzdKj/lZxxn95jmpeGQqttC+if9585c4iO86F?=
 =?us-ascii?Q?NPuHaaqnN4t+g1AFBGbZCCVRkgPJXV4ICKkQn6cGc1YXX2SSfwpmPQtA3ekL?=
 =?us-ascii?Q?tsXzzyWTlp80zitkiR3g4cquVxcdPOIgUMVOD4V9i3x07s5heQsRLR0CWPfy?=
 =?us-ascii?Q?fDCj/RJCWReCuy0VCOnCMe6NmdM52mbCVLkwqtqa3XQFn92WuFYBLYbQ9pM8?=
 =?us-ascii?Q?lNkmGZkRLFHsX6xKD3cDvsaSEBi/If7u9eF4vSKfycQfvymdNoQPemLYOvem?=
 =?us-ascii?Q?oQXUG3KwgWEnD9Vy0utr/Ky9lBwPe9pLghWvsy8gCaz1PQOCm4D3NxNfEYXg?=
 =?us-ascii?Q?T78PT700KWvkHvOgT3i8td1xAz6AhqDViIZQlA5A6MxnnMzY1C0JkB6xmgJ7?=
 =?us-ascii?Q?cbOGGcFvgmtCaVesS3YLFweKNzodkyQreN3Ee07+Q/JfIKInlWFZK5iv3u0I?=
 =?us-ascii?Q?il7PqglEIwnRGFrNOY1GrTibAtR8oy+EC9iruQOjM+PKCwsZqSj29+4bT8r/?=
 =?us-ascii?Q?5UBUCydh9ZXQdTl0xDSn9+4EHMq1+czkYXPKuU7Dxux3TQhd7W6zuQa6oe6m?=
 =?us-ascii?Q?+kFfF4YPCBcCwbGXxzi0ojaHZ6LZBHfsbdz6Vhnm2IKg3q/7aFYCbljPPMpy?=
 =?us-ascii?Q?2Q2/xdTAsEG9V5Fd36Y7tpr/AkGJtWjc0/6iUDfQckcSLkQZT9lnVmVoCasY?=
 =?us-ascii?Q?t5HpsTVRLsaoUkJp8XVwCcRXzuq3PncEgo9313Xw0yImYHBxVTJlFtmTLgAH?=
 =?us-ascii?Q?lltdNWDipTNq6TXQJPUtRrR98Yj9bEsbm+zvYfMJUfBo0g481PzYGALVyHAD?=
 =?us-ascii?Q?JlFK3fhOJrL5Lw2Bb1TD2fm3cpSAHqwUvXRXA1t8Su7wCCslx+JTSsBr48on?=
 =?us-ascii?Q?mUj81CEF1wSPQvv9b/nvFJHDC+e1r15ldU6+rJABX5wnlW6VpT4NAlwfj+yu?=
 =?us-ascii?Q?4nrmaoq6J3iJGcVpMRrD6M+bvNJfA5lkETLVHVShth2OEcR+KqE6PxS2d3aU?=
 =?us-ascii?Q?GBQ//o8GVa6dcZVV3OkboLwIfejge7NINtSp7AqTXkmq/4OkIgPKIniZ56Ot?=
 =?us-ascii?Q?V/VZ2x9O/Jn6fKbJLcwVODx5355L5D0FHO+g+HmFY1uDATjprTn2kkTbTk7Z?=
 =?us-ascii?Q?VS0aMxpXbpFt+tO3bYN0Uxk7JAumIUof0Wl3c30DYJP1h6PZ/kyOvM2M8LRU?=
 =?us-ascii?Q?Hkn0EJ+iKa1Io9XvsLdkPXM9DjaFV7dFKa1tzhGcahoPHjLPneVGomJIoa69?=
 =?us-ascii?Q?VuNBO/HN/2B/p45+LLiKU1IaiaOUKyJTLYFQ0PueVU/2q4BEz3MBiSl/TdYh?=
 =?us-ascii?Q?Z/R6At4O4B5XflhyPIAlmZ862b2A47iR2RCFbaTokLjPO6vvUtr8D1oUQP7L?=
 =?us-ascii?Q?DtI/FoDVARlMUCNyAHlM+TTJPMsI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U2sLVuM4hm2+0wAVn7EBaTK+WQg3SaHbswLgYsan6UJeT6Tj+Fv+MMUqHzlW?=
 =?us-ascii?Q?cDc8De8Tom/khxMO2JCRObpY5jG59xrXfzy6y3gx5h4ksh2K7dpNPYB9iZJb?=
 =?us-ascii?Q?4IW/3ZtEuHAXHupzyDH2PBs4u78qi3yFhRkl7TpDOP8RYVw4TnfpNLMFOyR+?=
 =?us-ascii?Q?D2t0Tf+DJWHVCKvrTdVAREwl1sqvilpKkfHMQZuGlen/pT5c/UH6K0qioLkj?=
 =?us-ascii?Q?adzGhWa/tJ36/g2iWaWj93Q7oMHYryBPeZLURULhLAnlk2hEpvy8XcfFap38?=
 =?us-ascii?Q?5ruMvCzk/s3sfHv+i+nyTpUXb1L22ar/a3N447qjfDWGvxte9Om/yU19jc/E?=
 =?us-ascii?Q?8yVMeA8kLDrbAgeO3Me2gwVbDhRQMHecs07r3uOR1ItZrbT2aKGx+rcVBWAb?=
 =?us-ascii?Q?PSMcsU5XeUCe70nK6X0Vm9vlztffW+MdZmA/rRnyfmkmC6S65/5yD+QRN56a?=
 =?us-ascii?Q?hkvKx0T6eQEj0oxhnSsdyXh5cm0ezwj0leDxHOQY432drWyDSQ2pXXLbgZAz?=
 =?us-ascii?Q?xk+uPrJVMVjwmJxAxFAFMDyJnhIWKkTBXLUIJzztMvT54kfLnjeldGeu9nJp?=
 =?us-ascii?Q?zdSDYDAkvNWkHxUZvEaZwE+cxgiDHE3yqv/9OMZs0vwpIX3Y/jkWN4/D1nMx?=
 =?us-ascii?Q?Ic19QdlaFVFPIBPRiMukL46+3wrEhS0EHvbDO1TM4km61alavaMHn+YdHL9G?=
 =?us-ascii?Q?pUJ9hinc+MNZA358+ja4oH5mHiYnF2Hm+SFSE5mtI1HEbN5GxnnhngAWREyz?=
 =?us-ascii?Q?CNZ73dNKSYM7NuyQNfIuak029UDIGIGdYihFBXfotygVhGhoeiXr9hSYUJ+e?=
 =?us-ascii?Q?I/GSVpZFlqv9Kwg79Ng1DZj05qm7oa3qKnYZLTGglJmPx2uYBW30lQUx1fWb?=
 =?us-ascii?Q?qpR8rGeO5qc/NYOJF4uW3ZI7dxiH6giILdfzcTTkgL4WOtqXfeYyIZxBuJif?=
 =?us-ascii?Q?OL4sC0EoYb89rB3a4iphDfDknECLnEmIkFHsWanpghi5IsiNFfI/bwRbR+JS?=
 =?us-ascii?Q?AGzZ43AFSDt/x7tbIBrzVyvIl72BqgUd6rW6EayqUDfC7itZxtJyc/sYV9zU?=
 =?us-ascii?Q?bONhy1QwQRLgaYTwIoENF1hCIEykFnTzTlrQIZTNyP0bQHZb9SQUqYhOhsuU?=
 =?us-ascii?Q?TSHX9oYKKSTvcuGVuAytTfVzjPl2RDzd4BFI/ZkXHaloJgXBJE7oyo10Bz6B?=
 =?us-ascii?Q?GwcUxDybJ7lOkbUaliF2H0LCt0QYVaIWMqf54zMwVGp+I6FgbLwLr5MQ4PFd?=
 =?us-ascii?Q?1b+E7IQ9kaYD6j6P2yhPlh4qHoo4Ek7iqIqEDx/BycvtEN+VQJGX+nctA6v7?=
 =?us-ascii?Q?yqE6Oyvq6TpM2+nqcDVklynhnR3EqAoPzxAGsVcBZ5AJezmWbH6oH7qheyKk?=
 =?us-ascii?Q?fRECYPbnpk4kRwR8mdyu3SY18t4SbdyAXORFWax4fCfqnMRtLOp2GvLr2HWG?=
 =?us-ascii?Q?lZRrV7cmN+oXbO+scLz+xc5H3uK4J91/goVfLphEgb/J7ySz/eAcOIEaSM0x?=
 =?us-ascii?Q?VCSn1GqKJovJLYU7PAGSzGPeL20pH7BRqMJjtN5kBgW72oIbsIGjPA4x9MyL?=
 =?us-ascii?Q?sXqwjAPc7//s0pIWkAKW7p/vPw4zCTwtwh5YzdZ9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb53b34d-875a-4795-f7d8-08dd734c2366
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 07:41:40.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9NJ8hfXddUd5G0pPAsCPlBqBi1xwTEmQuQO18fNOcxCOc3F17kpZ3aZtEJhZB+tIwvklAYxBXkzzZi/7fHKhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170

Hi Tejun,

On Thu, Apr 03, 2025 at 12:49:42PM -1000, Tejun Heo wrote:
> The tag "ops" is used for two different purposes. First, to indicate that
> the entity is directly related to the operations such as flags carried in
> sched_ext_ops. Second, to indicate that the entity applies to something
> global such as enable or bypass states. The second usage is historical and
> causes confusion rather than clarifying anything. For example,
> scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
> scx_ops_flags.

We should probably rename also SCX_OPS_TASK_ITER_BATCH, which is not
related to sched_ext_ops as well.

Apart than that and the other comment about scx_error(), this looks like a
good cleanup.

Acked-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> 
> This inconsistency will become more noticeable with the planned multiple
> scheduler support. Clean them up in preparation.
> 
> This patchset is on top of the current linus#master e8b471285262 ("Merge tag
> 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux") and
> contains the following patches:
> 
>  0001-sched_ext-Drop-ops-from-scx_ops_enable_state-and-fri.patch
>  0002-sched_ext-Drop-ops-from-scx_ops_helper-scx_ops_enabl.patch
>  0003-sched_ext-Drop-ops-from-scx_ops_bypass-scx_ops_breat.patch
>  0004-sched_ext-Drop-ops-from-scx_ops_exit-scx_ops_error-a.patch
>  0005-sched_ext-Drop-ops-from-scx_ops_-init-exit-enable-di.patch
> 
> which are also available in the following git branch:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-drop-ops-from-names
> 
> diffstat follows.
> 
>  kernel/sched/ext.c                |  458 ++++++++++++++++++--------------------
>  kernel/sched/ext_idle.c           |   20 -
>  kernel/sched/sched.h              |    4
>  tools/sched_ext/scx_show_state.py |   14 -
>  4 files changed, 239 insertions(+), 257 deletions(-)
> 
> --
> tejun
> 
