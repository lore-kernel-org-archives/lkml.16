Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7C218838
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517155; cv=fail; b=Fu7EqPw2xU/+OgvwpGO33EbK6CGFDtaSxKBo+FlT4C9Qnvmj6/UgSGx+vE8ToJh4sGpwuhXVTzy5sFwetXvF89Otrtja5gHNjWIqA84783NT0hXpB4o2klxWi4dZS2dDCtWQ9ZZi0zTj+0EsTtOXoiT1jWBUsDnRwDeeG/ut7Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517155; c=relaxed/simple;
	bh=89wk3F+DHf4ZvHBsATrYJqNohItpzF/vH2Es58AswkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cdIjxypu4EeMBqHp7Mjb1gkrlIK/GsYRLUd54oKRfU1JEcxxmit/BAnOhT6vQCOIVf6vPDWOPR3bgSQ7DdLtZsciMXuD42G9LboC30RLpwMrjfGgmUev53nSGKJY8wR/izKpFGUKvZ7csz+sxPLATcJ4YHwVjEcFlYaPQwu7ouU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nKcRjC3u; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nKcRjC3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn3//kPeT0wA2D8gp/fQUJDWePlMOblZ2DfwfuMjpj7/azSY+M82niutd6B/s85f7umdm7gwqFKNK1jdVANqFe9IiaJ+N2S3zODufpbaXa1nL7BUw2mKOlq0m3g/dcWujd7FTejyIdL3dw91I8VTYo2yh0PYT2SGSoltOshNNcjXEyTWus+TdTiwBqNTklFh1yASTeCcypClVQGxQch0s84wmyVPT81HJbTyER/kkZsOpfJdI87fBnIRp45D32dg3ZZyCWRHh2zUPrxhMfLJHhw0xp3BZByfFsOPx3TzFTiqTuWtFF0kGgks7aFBW4c+kX65gxvYiIKdUGz07hcA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyrUm/7DtDdHBx1rgeQ0W2fofnlZg+i8IlqIi2BJZIw=;
 b=QTzbtUMBwo3F9jng+fiRjJgcEGQQA17e2LsnkGJS2Iaoe6zdyhxgMc/Z4aaWXM0uv+98JWk0KXCdYljeLcrPRTb2U9G/qpLwtHe95PiteLvqa+Nf7DJlXTXynrV4zzO1rqT3jeCk9xuDCmlmLQiUaufJj31+lyNRXpOWMb4M570sjlO8WPp1q7btfGMQVsCHmGI4eaXNMKCYesCxJmu3jg8GUL/F/aAp5WokQtshyntolKkmMTX1nGDTDTR2ShpbLh90tYZFp2VQA/AeqBwzTOO8w+LcwmiFXZ2NwCyRfE/eBMgLlTe+0e+eUbZZ3ZHgqgLnzpBCCFFMrTJ/tSHu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyrUm/7DtDdHBx1rgeQ0W2fofnlZg+i8IlqIi2BJZIw=;
 b=nKcRjC3u39V9IiH0eezWBe/jSd2wAK4tQaBy0amYY1qkxLEAZfFOc/T/UnZJAE/JREJQpMnBSV12UUpgYGbWUv3e09GPK5vNDQV7paiZQQlOqsUFG4VrGewfgmmVWHNS/ZpD8oH+uUSyjJ3+SHbmg7dYB/HiKaliXZrlZJ/y4lgsIm0rMYZ2MjxaFY4D/C8Tm0ETnBJ3S20GTDUNm86i8SjOWuSXwVqR7MomXVm6TEqXEn3LPEi8kzCS9y7EOl1ejZQp21f7cvxD1p1NuWKtOVRpTVmz+9u8wR6gRmj577B9k4olbu3L1J+cNz5vJSSWZiE2I+pLoNYrpxREBC14lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 07:39:07 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 07:39:06 +0000
Date: Tue, 6 May 2025 09:38:58 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Bing Huang <huangbing@kylinos.cn>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
	joshdon@google.com, brho@google.com, haoluo@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/sched_ext: Fix errors when running make mrproper
Message-ID: <aBm8ksy5IQAbhga1@gpd3>
References: <20250506073432.2291120-1-huangbing@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506073432.2291120-1-huangbing@kylinos.cn>
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: a108b98f-7945-471b-0f0b-08dd8c7114f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x5DgLBmPDcK0ryZqv9TPrCVMqwLjt31zaGP+UVxk65yv8JpQQSGSPCfAses3?=
 =?us-ascii?Q?Zwrz7tVvtemI9Dq4100J1MwaErj9duJjX9+p8bs+qbshD8sqfIQNQ2tdIaai?=
 =?us-ascii?Q?yALaRfm+UDkGXJpc52RO4TSUhhcbSsSiS4kh8biB/27+ppnyOcqF3nnUBNbQ?=
 =?us-ascii?Q?eKtHcuYrHIiS/T0WOGish4OjVK0XYvWvLicB75utJIcj89XjEXFQESVsHQbC?=
 =?us-ascii?Q?uy4rreYI9C6jBf7d4h5VFcdjVJQALRH9U5STiE91irRj2dHtgyCY79lKazMU?=
 =?us-ascii?Q?rlxYXYN7npI5LsdDjA8lc5gkO+R9JLsDwjureu8Kg9YOzzZezRFDgWgT7SkV?=
 =?us-ascii?Q?gSv0nxXtw2UEAUNV6i6Yh/jXHE/DKXQnBSqoxbWdDD1ddSZ7h5pVEUBZ0dbF?=
 =?us-ascii?Q?MkQOco1Z92Vwr7uXD+z+382x69FzvfJpOHIUBeuqHuCUXfwpIkhp/H4p+PcB?=
 =?us-ascii?Q?kAw6AIGmF31Gu/P4wb1zxFX0I21cAFL3NpCweW4KkRkkMulwtkl+p9FjyNnQ?=
 =?us-ascii?Q?mFGzoizyMg53EaU2+pTSIqjjdzyPX01k6s4jLWvL4ONACXcOS0oHOAsmspSd?=
 =?us-ascii?Q?8zRGOKDd7ViMnc969npdHDPak3wyb4xXisbbH4vB5K1iQinXgC2v8nWHw8K3?=
 =?us-ascii?Q?rQ8ttTfn89UoXmFEdrluu7FD7zm1pORwyGpPTjY7NusFkVm1dYGs6ZipCPD+?=
 =?us-ascii?Q?jm+xTiw76BYUQj7tESGv7e/ae5CeyaLGcyAKQvQL2/bY2XA0AlV5uj6Vj5mU?=
 =?us-ascii?Q?NuefqpdRKonKNhLx4JKEe6SIlHpI+DXQ2lKIcVy5qTo6Aet5vftViD7WkHXe?=
 =?us-ascii?Q?38iW7a7CDGOAyShwMwdWxu40Wqx4ykaf7UC+NXtGaW32lSlE0qT0rp73o1g8?=
 =?us-ascii?Q?UjOkU/bYw8aFMBph6m6BBBfm5mnLqPCe/8SsOFcXI+0ZaeV0Fcrz828l0LlL?=
 =?us-ascii?Q?zd03A1GhgvBHzbvRgx7cuCt9Ex3i7fb9PDITWWaMKfIeOpptzCIGUVF3ImKv?=
 =?us-ascii?Q?UCQkZOSClR8hoOHSOHazztg0imre6vC1qDAob+m4IO8rZ2uoveafj/EjlGHr?=
 =?us-ascii?Q?AJ3345yDBoYxCTSZouzrOWdhO60EAXtF2UBDCiq1kQWtKbmP4JGIw9BcyD3Z?=
 =?us-ascii?Q?4nGFdTKxCgakakKmeG0PZkTSWLv2N2nH5Ge1J2MxS3FotAdsBQz/0OFH1nSj?=
 =?us-ascii?Q?/CXMcNbKrtt3mJ59yzoZGVBQQbYIvW0a9/GkmBDbsbfMINLZ6TVrZm0Z3kZG?=
 =?us-ascii?Q?40SJPVqOpN158j1SlcZbJG8LfyMRb3BvF37cKdL/kH9ccjhneelQjofma786?=
 =?us-ascii?Q?BYQw08wyFQvq0p9qdBJz6zP37UUo8u5kyx8JnnoPp77wPVrig3ac/Lou2Ail?=
 =?us-ascii?Q?CnCSNDH9P8JUKqZdkkaSrZrzUNKzPDyFgt5gZLG7A9JFINOe/YxNBK1llVBe?=
 =?us-ascii?Q?eVD2AUaB1JE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAQRpMfxXzwx+a+SjslbvVD//AkiopRyHyXwIlvVyF0cSV1XZzq++nu+hJll?=
 =?us-ascii?Q?ZCLsZFjrrFegRWS2kZGwO2cd+Mufr6xNyR1Vipevrqd5hlXIUrRianTM3NVS?=
 =?us-ascii?Q?6ZV4hVBTH9fg6t2aUiNqHhJoHNj6gRQkd9YH9ycDDVdzYJy45RNYOZ6kLbON?=
 =?us-ascii?Q?BTRtvHNp269wuhBco3C3fRkd6qhioZDkpwfO0+5/OhlFbvjcvTAW8RvlTqwb?=
 =?us-ascii?Q?4UCV70ZpHzCafmmDJrBIx6koJGRROfabHGW0EO9wiqUlo2N534kIOtxv60j7?=
 =?us-ascii?Q?i9g5tIJPIdes2sl0qcfH0DQZnWGGU0iDjOeHv1PQ4Tn3l7q4QTzDyYfEMR7N?=
 =?us-ascii?Q?rE0ZS23Od2I7kIUbaAp6BnV3k1Nkx9l3iLpFlrapQKptmDA17kFD0Mr4ZIth?=
 =?us-ascii?Q?i7W/9Xb95VLUdSI9Y4ccRZwVVWKdHqq1Wth29Lz7+UnkzlMe4VM9CiU4zYM8?=
 =?us-ascii?Q?aUlMTdfu84Kuz0oWl/0FKpBaNV6DnQAXRm2KWxJbKquhbKqeSHOw11gbfhc5?=
 =?us-ascii?Q?nfYNVwrv8DPgQ6Bi4BTGhvGtHfb5HcRPHW6WGOjSnTlX4I7kQEhG6/Voss/G?=
 =?us-ascii?Q?2l0ZsMNCN1TvB0nOK5KZSJlN5YfdajNMkkKROZ67hl+T7vqSlkVa3GgP2vRe?=
 =?us-ascii?Q?LNEvSGn26ig75ZzMCBX7iJJXIIZ78pxPVJ1eVWwadeqWHqYONHsBy65iDsIO?=
 =?us-ascii?Q?9ue606I6pTYXqLvDCp2IEnOAhc5ntMNMTRvqv+mc1EQ5Nfu6KIZnzI4fSm18?=
 =?us-ascii?Q?mPDenzcOP8ry3Tom+NyCizoDgc+bE6z4AkepLvuKHNtl1f5HAHrZBuHjKWAO?=
 =?us-ascii?Q?MpPLCXLiETxefvMR27tG0mjGLrGYJMVJasn6Th5GSIEwYOiGgNVeSNVHufdM?=
 =?us-ascii?Q?cH7Uk471zggx1Ud4atmqvy5e3Z1bqT7ds5SLVUHsI6MYmkBaBCZ59idAJa5c?=
 =?us-ascii?Q?IbSh63/p8nudURuGT3t65Aj7zvjsywploePTbappvv65G0N6vCVjJkh3kuiB?=
 =?us-ascii?Q?ffkSo5N9O6wNuEP9CXuyAAYjFOtGyh6gv1FCXxY6ZlH9clZAQFyQKbtSvFXC?=
 =?us-ascii?Q?NcsmEuujSx8rJmkK30Ha63Jcf3AHcO2MylXidUFkXzxNV6y9MoWYYTsZNi2O?=
 =?us-ascii?Q?JfvJ2iWV1ffH7KH6CYAymkWOBviAZ+nZctjxAV8pGGo3ajS6y8rFOkWKdISI?=
 =?us-ascii?Q?+/lOu26Ik2fWkeqRlSssovPYY7hZE4vQGzDzpdUNlH2DP3/17uVH267Fkpq3?=
 =?us-ascii?Q?TQ1K9uFkINEj+MvSSUdr8Bw4HEW2xCWwe3YyTow7YR8oQmgK5+1BEQmlkUpc?=
 =?us-ascii?Q?y+tSMHsR0q3U+fJkoIU6icounndTotM6JAilbtFha/lY7qPBx86DRhFfe034?=
 =?us-ascii?Q?7odA+5QRJ/SfM0WoD4e9SQY60CXdrVxagBE3cJhsj5btpD6BRvWKx23VubQF?=
 =?us-ascii?Q?092CxPn+BoydDAou2zgk5XFYNvSN5X6NFZhhDsguoDAKP272xbRLmLSzZQZd?=
 =?us-ascii?Q?Wd4HjFzsaOgmiHlCVB/tHI8BS2hVW3EzFy2YDlqZxBeGwSiUtF+nPDcGSzNd?=
 =?us-ascii?Q?V+PeLb4KweJ1l9kv7PUdwVVbwn49xHbYY5ZHgVRt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a108b98f-7945-471b-0f0b-08dd8c7114f0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:39:06.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2EuVxT0AGglClj5moTv6V6wp5/kUnj0ApNTPu2rMPVkwxnhi1UqOw68GNJAfw/HIahyhrhnwYNZmiES1U3kZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

On Tue, May 06, 2025 at 03:34:32PM +0800, Bing Huang wrote:
> If the system environment used to compile the kernel code does not
> have the BTF feature enabled, running make mrproper will result in
> errors similar to the following:
> 
> Makefile:84: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-4.4.131-20190505.kylin.server-generic".  Stop.
> make[2]: *** [Makefile:192: sched_ext_clean] Error 2
> make[1]: *** [/home/huangbing/klinux/Makefile:1374: sched_ext] Error 2
> make: *** [Makefile:236: __sub-make] Error 2
> 
> Signed-off-by: Bing Huang <huangbing@kylinos.cn>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

You can just add Suggested-by here, no need to add my SoB line. Apart than
that, looks good to me.

Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> ---
> 
> v1->v2: Sort MAKECMDGOALS and check for clean target
> 
>  tools/sched_ext/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
> index ca3815e572d8..212717aa78af 100644
> --- a/tools/sched_ext/Makefile
> +++ b/tools/sched_ext/Makefile
> @@ -79,9 +79,11 @@ VMLINUX_BTF_PATHS ?= $(if $(O),$(O)/vmlinux)					\
>  		     /sys/kernel/btf/vmlinux					\
>  		     /boot/vmlinux-$(shell uname -r)
>  VMLINUX_BTF ?= $(abspath $(firstword $(wildcard $(VMLINUX_BTF_PATHS))))
> +ifneq ($(sort $(MAKECMDGOALS)),clean)
>  ifeq ($(VMLINUX_BTF),)
>  $(error Cannot find a vmlinux for VMLINUX_BTF at any of "$(VMLINUX_BTF_PATHS)")
>  endif
> +endif
>  
>  BPFTOOL ?= $(DEFAULT_BPFTOOL)
>  
> -- 
> 2.25.1
> 
