Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B11205ABA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746513341; cv=fail; b=ZyTMDChZ9AlAv4vmPN43hMMl+COD150E6x4LtHXzTos//LQTw2ttzfOwbyw9k8MrxAcUcu4U2ko1LnSth/VMR+mK6GqwFr+bnNBrA89sNqJUTXnooLMudLrX4K76i3NdPSrf3LUCOvRb/EcuMyhZDa/T3KTg76RyVTWtZmRO80E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746513341; c=relaxed/simple;
	bh=gghN7N2JWPcPtKqhH5OfbgPH7Uotaaht7ZqIe88/ZEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CHe8HLj/sMNWPDVrBBcLKnDcalAbtPe+eRRVb0VBxsaC2NKFuJpShXou94OuK+D1z7Hyxa/ObkedkSAh4LxD6PYcL+ayN/8h+W7ogfM8vDI8RCgVpIl7hVdOSJ2+2qNVCR5iiPn7IGxQMHEkprX/y1KdkiR5JSurUysqcVxUPOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e9YpVeR7; arc=fail smtp.client-ip=40.107.223.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e9YpVeR7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAKN2FGAPL7vawxE8hPPw1iP9hxzGocXQtqeZn+RLm/NavdU09ouxXvLomDnoI/bGqARPikCNJPQcxQxbw8uw9mp7cBZMXffkNkwaRS/aocL9BtfH6VKBbzcJu+mVWT9+8XqokLRi9t8hCwmIEtP98a58TXIk8wfW2pbOJtJEqaBWIjyKftPWHuiERrrpF0p9pGAcZEj7cP3RXA9mLCNldnxvcXF4M1W1qg8ijaC2NsyrVp82+wu9jDG5T30965HWf3ArJv79NrvcHAQN4VJm9Zc8jP0tVzNRseXuiglNczE9HMHi/0+DQVVjey/A3oRk8b8sdHygatadjYclyd5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlgCbRtG95RuN7c1fusUlL6/TEea1/rLuCBV2L1VpkI=;
 b=m68hL006L/igV+VkIQ2SU1iFPnXuFgHx2ggZ55wYdxJv6Th/Erp1odXmYCApENlIW3UPGAazeUoH+PalGlzBulEmrH3Q4Phx+JiSlF+oyOywlGPjX7M+UYUNu54R5iZ+aAPytsXfJWXUFpbni8QhRKLX+jUnNboLUY1wR/0fNqhuzVzYgjKVv8D3Tj2IWM+TnlYsy1yH2BVj/AqD/bQPCWW/v0FU/y+sra+422YxCVpBMS9PQLoXqawn8yEUtFGCHZiiSt7GDvJl5F4jriWn6ZvKclq4wgdnVO4i93F6rK6Y9o06ABccbDnRUy+uDxyXdggbF2/4DGnXv9U9gYy+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlgCbRtG95RuN7c1fusUlL6/TEea1/rLuCBV2L1VpkI=;
 b=e9YpVeR7oX7hxV7dvM5RHm/9fZVCiqWUzyoydAmC45t0k3CUmMrB4jhuEzCmlAnAxKRTrePCN8UD7ucD0W/xf5ViaZn8rUyhBWB5IoNT2yGGJanDHcG9NXiJCTSDXeJlUkvmzv1U1AZpFZrepnlHsAN5NK9c/Cnb+nUeP0dLT3o5sB5ZY8xiBQYU+Ijbva0as0KjQ+d/z58rq3nCxg6RDkvoR2yhhMehMQl0dCqT6lPXanSaeLuW1zKiFi40zPKX9oP4YWHdDg30vNhLuaft2Oaj8FquW7J3/EkjlZjztAMPnfmzmFS9mQds8bCUOhNTBnnNmCqseDVM63oUkiNcdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by LV8PR12MB9205.namprd12.prod.outlook.com (2603:10b6:408:191::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 06:35:33 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 06:35:33 +0000
Date: Tue, 6 May 2025 08:35:22 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.15-fixes] sched_ext:
 bpf_iter_scx_dsq_new() should always initialize iterator
Message-ID: <aBmtqqmP8JiIKKDB@gpd3>
References: <aBkt_4tEZATxf6-Q@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBkt_4tEZATxf6-Q@slm.duckdns.org>
X-ClientProxiedBy: ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::23) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|LV8PR12MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: d77d9716-b4f7-4e56-826c-08dd8c6833ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xbzNhdybLSzl8ObB9IOY/CI+a0giVcGm92Lay7hPWw1+9HbHZa01RThzkzAc?=
 =?us-ascii?Q?KNsUke+qgpkTY3yb1YePhDW8sBF6axAhyYr1QRZ6TEdcTrmFO8EBLMgvTjtC?=
 =?us-ascii?Q?pGKgZ18JTjam2JHw+GIxuY2oxOxrHCclUhyzVLVLy1CO3Gpyj8f8Fu4JdiU6?=
 =?us-ascii?Q?6jHEEepRCs5vtMxgdWve2tgd8hpe9Pe+7tFEHDi1RQ4BKSZOU3L4fHIumnru?=
 =?us-ascii?Q?ThHMgnqN+rH2oAXv58HqOVvTeUPmYxVlVKLFDZCYHtPdYReCackAMNgKHcef?=
 =?us-ascii?Q?BndBMhW2zPZsOmlC6Rh4HVa8QlDCeIL+IKuGr+GoWHOkOOWcnQ0BnNmK4dCD?=
 =?us-ascii?Q?1hMrP6KPcN/M077AfRXFyWeEQDM3tS2kyhIPrAjFOVOrMTgp1aSHbWbmu6Bf?=
 =?us-ascii?Q?DRfhtr3wZt59cUfTgzYpBTFXie2GdxvjzTLsuKytMCP69HY268UB/oTCOUoo?=
 =?us-ascii?Q?PQtdG+4duM3XRV8gIFyskfXjCa6z+Wg1e5mcmxrhUgKHC72SsZKJ/GkIUZTc?=
 =?us-ascii?Q?meXMX7c17d6m/NuU0NFbHHJQNyJTJmwZR1rWLs2i4N4wbnmL7xR6r7l8TmuO?=
 =?us-ascii?Q?0yZlcsNhyCwfX6vh19EcNkQntirPuOclxi59aTP2e/VZBkHTBba4kHE+N+nX?=
 =?us-ascii?Q?EQ5FduPyfM/B9He1mw+fBTstHuQxpGeF+hF962h+6WFXK56ePSyF2reeyyTh?=
 =?us-ascii?Q?Zl/AJdZjkCZw8KO0tVUAKU/bO8hteaDwNS0TAC/C+fnwMPIP6IU70D1XORQr?=
 =?us-ascii?Q?ac3ca0lEiZ+RJXRkY6GQVWSbVOPmm71q+ZgbtqQPdjZLj5TLQT6FzKTKsCl/?=
 =?us-ascii?Q?VSNgJNNw9YXtj9MmIpQiY7Jp9WRwrUVmfG8XvLB5c0xd8aJB8tlFfiWK+fZg?=
 =?us-ascii?Q?Qqkp6wYP6mDgCud105UDp081X0Vr6mr6Uhr3lQPXZgI3hRqbyukkD7K7QJf3?=
 =?us-ascii?Q?LDmXBkBlbMqysF/jO0JSx+/qxFdsj0eIHCn67K+obAM6X6I9lQoq1Syrbw2+?=
 =?us-ascii?Q?AaaUCIISvvp4j3DB3xLm2teqzkIbQzj2H+guWOqj9CTZzGOiIlMKd/D2Ub30?=
 =?us-ascii?Q?ZKuKuc0o63u30lP6YqB8EUvG7J4flPDySKTXaiGEKL6sqlrzBkMJCjx9dOFO?=
 =?us-ascii?Q?qgLbTYL43mznszhKHkaWM7AqA89Vtlck//m3QA9radN/SQ34Dsk39XcOzsVr?=
 =?us-ascii?Q?Bdu5+AHySQtHuMs3CS74OXp+fQQXbOsCQ2vZ6gtXwkwvCB8aN6OCdjCR4mfg?=
 =?us-ascii?Q?D7zOZO0vUAeRSW3GQZ4dYCKbIvrrbzrw2tjPmUrchk5gjoyX69DGNTHxBdy/?=
 =?us-ascii?Q?iUlMRS3p9zcVESVB54ricLzXl0H4UPk8Sr5K193O6t8eZCSrwlokcUsljRQ9?=
 =?us-ascii?Q?MhQ6uyxYx6z1JHp25MfbT7ucxqIb3HefL6068/RrDyn3r3k+NRslAb3RoT2U?=
 =?us-ascii?Q?/jKru7ERB20=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S8Orypi2Sy7jUDY2QT/wRkAtoijU8QajAzxve0+1xNAyaZFzTawcXFrwf3mN?=
 =?us-ascii?Q?WXuGkN5C8ZOiyCm7gppJ/WW9Mwkvr8Ylro3jZ0WSDNitqyhjhUwQSzl0Sar6?=
 =?us-ascii?Q?2eZGFTHRFN4rLa9bxh2hbA9tXxEZ1wfGes+o3YPlVngAAAV0zFqchuVJmP8O?=
 =?us-ascii?Q?evRqEYQ8+QhhRmnydoX1+UwXiZAkBtYA8wKLA9P1XgnfDMWHvOKGd//DsdC3?=
 =?us-ascii?Q?lwwqwjJdaPm6svOGY3nPneWj5pW5R425Ml+72KjsfE/05zyZxPNXe08wpoBp?=
 =?us-ascii?Q?XGv2EAKFSuL+HD9DtWfLUU+q0nD9lPOJ/Tk73lZgEBQBFNImgsL2bPRqqRAB?=
 =?us-ascii?Q?66uGGEXfN7uIgQ3Bdt3gl1tSjnhZRz46zPZH4jZ8odCOBC+zEUAiUgPXyW6v?=
 =?us-ascii?Q?ep/WQg2RpOc3OtCF+d0ls/UcxoThQDDyQYl5P5tE7I67ie88LLANe2XA/zNV?=
 =?us-ascii?Q?BzqBaDCg+cjFmE6+R6zfoZ3J5pgHrJIYYqtLoVw/l+WNUp3GyQ1y9HQxQSH7?=
 =?us-ascii?Q?baivYyejM4nTOTB6gb6UrClan01n1eFWS08oxt+IHIawkT//uVn/qkjO4HK9?=
 =?us-ascii?Q?Elz+QM53GgI5Cu0CLT7BZ1DZj5d090QYNNILpunirn13XLk75p6018aavl4N?=
 =?us-ascii?Q?s4MT+2M6a2rb7rfl55SepaizSX8JFBZhT46BWoe4OUXptrVvnWX+40G9/hYL?=
 =?us-ascii?Q?mLIPnaa334n0fWnGwOl27tiQOJEOjebftIqdTK7Zq7PeBHmI9gePKyvmzPs7?=
 =?us-ascii?Q?HMHtefSZzMs1IdhD/ZiNpgJbcNEapF05gvsIs+MySediXmEMLrXfTz6lFWVf?=
 =?us-ascii?Q?sm2wms+LXHNGvIZDyCu7DKJ6WKs+bAv/PaNREcuUP86mOtLez4saHUrL4R/G?=
 =?us-ascii?Q?l03lFmdhwp/oG5njFHD/ho8Lbvnwa5d0P3Nu2X6vktE17e46o24hUhhMHvns?=
 =?us-ascii?Q?xr1mwbvENm+ElfAPYL2PzYOKEOPCbltpuWUI2FpvnbXTZfTSuFtWHQ3hfInV?=
 =?us-ascii?Q?Z8Qu11snQUL1Bd5Aj7651i+Gm0r4rqR1T2uUxqqudVJ1BYyFsSd+N5hng1uw?=
 =?us-ascii?Q?P0cMU8saLl163MWyPTftyn7fN5YcUxO/gWnARHGO8hTkynMhTBkSrj7NYFHU?=
 =?us-ascii?Q?+fNnVB6GdhQrfgqPqVbm6AKbsPLEau7nsq/gHOUA0zy5/5/FOqSzMaeajx9s?=
 =?us-ascii?Q?TpYkcfDgCUF5v3nXm9tqdtnOyRXqIsukMYFRbpoUNTrY89PphFeUb0cfznrl?=
 =?us-ascii?Q?6N+FviYOrTjii/lt5vkt/4GrMANevWS3thSI/svSUVzZsxrloeqtU3WUYYdw?=
 =?us-ascii?Q?UjyvCbmfGENV6NuocZC6VrUtAYA0K4IbeCnJUQJJlPYGkNqCwJ560n3liGEC?=
 =?us-ascii?Q?wUkSnNK5SSxQu4KuVoINZ9xw5cSb9bSMnOoDjnDW+P/CcWxkjJRn3PBsRxZO?=
 =?us-ascii?Q?APtuIlGm+cbUxIXwgsrBVCYm2QFgFjOlL3XpklhFadlRHKdgY90vS/k2Ndzj?=
 =?us-ascii?Q?Ifd8jWtO/TB+/K27tRpwniNk5WY9I8ISGTAmd0VTqen1lICckc07vdqmPu47?=
 =?us-ascii?Q?l0fO0ucpnPVWQAQqAafYhWpuerwOU6hgDbPFct6s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77d9716-b4f7-4e56-826c-08dd8c6833ba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 06:35:33.0397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIB2/IRi3xc+iR+wqFw3/aW/eVb39TPHFNS96ctd/eFMx5OcuWIMGhxCC6vmdYpHuODU42UR/o33PGafYYb2Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9205

On Mon, May 05, 2025 at 11:30:39AM -1000, Tejun Heo wrote:
> From 3ca42b7aea35cbcfb8d1fdde09e10a54edf97b26 Mon Sep 17 00:00:00 2001
> From: Tejun Heo <tj@kernel.org>
> Date: Mon, 5 May 2025 11:28:21 -1000
> 
> BPF programs may call next() and destroy() on BPF iterators even after new()
> returns an error value. bpf_iter_scx_dsq_new() could leave the iterator in
> an uninitialized state after an error return causing bpf_iter_scx_dsq_next()
> to dereference garbage data. Make bpf_iter_scx_dsq_new() always clear
> $kit->dsq so that next() and destroy() become noops.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Fixes: 650ba21b131e ("sched_ext: Implement DSQ iterator")
> Cc: stable@vger.kernel.org # v6.12+
> ---
>  kernel/sched/ext.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 4e37b40ce280..f5133249fd4d 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -6827,6 +6827,12 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
>  	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
>  		     __alignof__(struct bpf_iter_scx_dsq));
>  
> +	/*
> +	 * next() and destroy() will be called regardless of the return value.
> +	 * Always clear $kit->dsq.

Nit (feel free to ignore): we could mention that bpf_for_each() is the one
calling next() and destroy(), but overall looks good to me.

Acked-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> +	 */
> +	kit->dsq = NULL;
> +
>  	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
>  		return -EINVAL;
>  
> -- 
> 2.49.0
