Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FC622AE65
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810268; cv=fail; b=ZRwEUvnb+bNohDGDcPt0uEWYYTtra6PALZrp0UWqqTZzHDeffPLEten8hpUXa+rHmckYFwtbYFFiyXs4WqGKbYwTKP7vfruF4eHVUHHaqVwJ+Wz4yK0izvDFC/1jwE4Y+Fwp+RV45BnfgAXMZ1xmagH8ySsfZuDnfvovpy/xPd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810268; c=relaxed/simple;
	bh=0ZSj1BnQ1f9rzJVMfpi7x1r75PR3CXPrmu0QN9vE7Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dxzz8RGCf88lWOyatD5FN0J9lBPBL7jnadn1nqS0thBMkfNTFwSIl0UrTV2I0zuGJh3kI8ib4JwNad2NUfZbB36XEnqBk+2wj/pOktVnpq+ZWh6iv9XI6fkukjqeAXQ8Zug+NaSVtQ/zRAeM0pklvnE7L+Txl4lZirn4vl0GLQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GtMjWzn9; arc=fail smtp.client-ip=40.107.95.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GtMjWzn9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0z/JOCPIea/mWyOszTqpwxizvkBh7LtuqasSRqLuD4aDd/YGCIKBQ2rpPlLe2hwq82CpX+5bISPm4SMjOTwnurmXUPyDbAXKEQvbN3CQWCGrGgDdm0PyAOCRZe0/0oE2Z0jAYVoLtYPpi9nKkkSvxK/2YsuM02A47vRdRwEgVYUHeUDjNBAU2w0/442IeqTMeEj3mFrmOwVsvT8pn2Uc9qVHMx3aCCOXBgCpoUseYA/5EjfNz0i3f2RZ2iC8BEG2CNL6xXUrY7FjdV0ktvzjclcASSSrxXWV9QL7FiKnADKQZg+Kokv41aR3n8rS90oeriWJipm9tTYRuzQbyRB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntK0DxkZfza2DZIPD+lKMMByS9X8aZrwmuyMrqrbrvY=;
 b=auamnu7nKMaiMNFYGaHjdKp+Om4j3r/b9h1RgKyExUi9Vc2tvtbao7GALiOSBNKuhw4GXDWHAYNaQeORgo6dKfW5MaZ19to1P+j+VmNIXxfQS82Uv3e3B9bacuxcs5taCglwLz021WsV7QfXMinEUudUS0DuBGkNKRNieOsHtboEIGvRyG2VmxkR1UwKyW2l8E9qbyzk7bWkNFhnKL9GxZ2WpqO4AwRsfaBFHUDSlunxyxI2ltQ9a9D5fI1vwn02z3+MdpqQ590UpIgmAqMyt42GmGJ7h1RQ38f3bSXWmFf0O06KEcj9xARXgrl1SEmbGjD+43ltLyr5JSDRq+Khug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntK0DxkZfza2DZIPD+lKMMByS9X8aZrwmuyMrqrbrvY=;
 b=GtMjWzn9VSAwAVc/6tssZyd87iydAxUUx0cNxFBUq+FiLMaKd7wYe2aqPrVegiWfwxUiBIiLpF+w2eLy7VgW6oIUOCuKT8uRwLXp3HmOB6QjoWHweR6HAMbxdxoWuB2VkhYO2dFwjWU3vyTryBaQYtLjzv8fBKY+4cFrSpbt0//1ePJ3iyiRcLXqEDxxkQZEef/4ZNREzM+ubumbOhamsSM8N45YfEneC13e8M+JgzpFUB35j0glF9St/MvaC0PMYr2wjw0nCN42uD3H4jgsAqn53X3LHt6IHKg8FI2svNnC1U4jhtHMgH7agkPdzT7LdvSTZW3kDVZv4Bf44OtzXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 17:04:23 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 17:04:23 +0000
Date: Fri, 9 May 2025 19:04:15 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yicong Yang <yangyicong@hisilicon.com>, Tejun Heo <tj@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] topology: make for_each_node_with_cpus() O(N)
Message-ID: <aB41j_3g4KHnoXaz@gpd3>
References: <20250509162009.540506-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509162009.540506-1-yury.norov@gmail.com>
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3427a7-0a77-4285-eb6a-08dd8f1b8be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C57NazRO6NQi+B2TXnYEyfYLbp2+r1zkolNEOb8o3riz9x7HmOttS8H3j4ma?=
 =?us-ascii?Q?c8oLxbBhneGeTimIBnah2SvwKIxbSIqW1IqZYXgYqO4tsF5+lO940SUM1lOm?=
 =?us-ascii?Q?IIKHREy4sLaUgff6pDMojXQWAYjYXIlTd2OQ/iHjaZ54ya6In23WzXdG/MPC?=
 =?us-ascii?Q?7mjB4asTKn9NzRkj5U1DXBWLJhyOVqslv29fEoKaHexTLihV1ldzddhYxuG0?=
 =?us-ascii?Q?X6tJoVG3qFEcsqtx12eWqiv5nFZxHjz4vOMbkk+Os/+WUcYG+RkwvdTBNR1s?=
 =?us-ascii?Q?VtM0sLNbbszj4zOT45hve4TlIqNuk3uJETRLu83lvJd7ptFmKlp13U+zDT2n?=
 =?us-ascii?Q?zxm/yw1NUyTk1NWJ5FyDghoMnjCKGlR+60iAWkpx86ck63epP1V1RJEoGE5+?=
 =?us-ascii?Q?ijlEMQgWIgL/+Hxd/t/X5Lu1WTqI65m1BFJF6jvhNS5UWYsKPAac5CXDFjS9?=
 =?us-ascii?Q?X2ovP2rL9hs+D7f06Tiwz+ZVQiN7KsCp/JV0iNLLE2tw3IShPVvk/l2mfVk5?=
 =?us-ascii?Q?7t+BzVnoyiZARU9UlCb+A9NVP7JQRuY/UAAZmZg2NdwZKCkXU45THpuYUlP0?=
 =?us-ascii?Q?F3JuX+SOnRE3gUNxMyHosq9HqMuF7JsbEuvEQQPd9oXH3GqXIkaBli6cZ4Wu?=
 =?us-ascii?Q?lAlaAyqfjSCHFopa0fIB43CNJDl5QBXG20qgccedsToAM1LReGy9+2kjulQo?=
 =?us-ascii?Q?7H5L0zQ8qIYJ2RBHpK0gVr2IBMR9DNfKjj0ZyZ3OdYqkk5wn/JCbShtvgMOI?=
 =?us-ascii?Q?5EzwC5SrfAOvESYwageg6nDumEHdtHFKpsucCGTp9YwxLbfaybzKOyRYJ5g1?=
 =?us-ascii?Q?K29neCF5i4g703nq/V8hMVM0mKDbXnZEcy83KZD8QqplEZanGQEEm2luwYo4?=
 =?us-ascii?Q?aJGMTo5iyPI+49flS7HS01wHzOfAGAIg63LsRyIZRm8QwLGgSQl1Z4Mxzr7k?=
 =?us-ascii?Q?5SGbGno4vwUlzVDIKXwCHCU2GkflWgUnqS/qzSzL0TB0li/UhMSOjbe2BIwR?=
 =?us-ascii?Q?WZ+xWyx00hbqY5e1pXhbpu2f946K4HEEvVa9U1z5XuQLMwxwkwpwuUWwdV5n?=
 =?us-ascii?Q?QcC9c/E9aPQKotI6vXdMgw52FClEmbPN4CWelO5tqWsk2dORRqFXIyOKY6MI?=
 =?us-ascii?Q?vXIkp4zMAGvvA5II5uxJIOclW5eb2kLFyR5uNjyeCel0r+LpkR2GxwSN0mIh?=
 =?us-ascii?Q?YcMhy1Wop2/ty39PTjV1vGilAcrOd1fAmzy7a4DT5z2cppttwyjF1FOJbQEo?=
 =?us-ascii?Q?eSarpNv7d+JZtcGBl9UsClH8cmK8vWY6sW6KLT0JSOLs9Bx00e6G2zJQOGUq?=
 =?us-ascii?Q?vyxDXju8O0bOScI9uu9MDD0KTtoJhsgprc1vFo9kXzJOQCrRvR+9sf36CYAG?=
 =?us-ascii?Q?nn35G6uh13ykWeTxCwsc1sERsZmvxREektAjKMqVXU0imQakuwaGMkO6860z?=
 =?us-ascii?Q?DgzqBVpB/dk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QwNAeZX8nMhz5/Mt7u3J10isbspRoKsPunm9FlH4izsKBFnQiQYXP3SYmVkI?=
 =?us-ascii?Q?23JeUPnR4XQsS4PITC6pu+e9pDuqrgP0MFGHYZLEIajQRFYAR9JHfYBrx33O?=
 =?us-ascii?Q?/YeEy/3qlZStOr1CZUVcLAL8lPxhsnJkZ9Vrzg2pVAma1TwC0RMpzVjv6Wh7?=
 =?us-ascii?Q?x1SFINpF/OQwVf2OVKM0m8kmVG9SdIzY5kG+tAKcw1RtS/JSS1gITUfj+SFO?=
 =?us-ascii?Q?J4cal+6R/VAYjicOE2h6gfLwqsVHJ+zBJHes5k/9GV0skizZIDR4kNl2YhAW?=
 =?us-ascii?Q?ZdDwHUjRBoU4jw6NxPYR8yOsswpHGWK3M+bn3oFmuaOn0KQtUBry4YNg9+hY?=
 =?us-ascii?Q?KgXNYHKQ0u7PH2NDhOIPlBs+8DW7v4dqqFA8ZUP3TZxKlIpMlFSBHQS0H/Y2?=
 =?us-ascii?Q?nUzDcH2RL4UkHKMO+DSJ7Qy6mX0j3/QHs2W0S1cDhwOGsVkhTvhJ3Dg5Wel7?=
 =?us-ascii?Q?emLGQNiGMm4DMQp/eCwiDwKzv+eshCqpJ2S9x9dtGGISWtzmhLqLRIor5enx?=
 =?us-ascii?Q?a3tjJ17SgcLq0y+sT2H80YO49HUmLaeOokikT3xXcdjU7l9GWjrbLrEIceFf?=
 =?us-ascii?Q?ng3uNvGTCTVh7w/5/vOI59/kn35fd+GVN53UhAqN5c0hOn8E7Ga3kETNOgKY?=
 =?us-ascii?Q?Ar0+ROsrl7A6mivHP2QGggvsTtdr7npThYV2FfQR91YsDyJ/EpaGNK+MTZyT?=
 =?us-ascii?Q?i2O2/tAj/GjO3JHeNihwW56Fp2EA3f3dEZ5E8cUCGNponS5Hkwe1zSlIakKr?=
 =?us-ascii?Q?aC9UFxknwcJecC+MQSA4VP/yHoisxtrsqAg+QwUuBSQ79SWY+uN5/ELqWT01?=
 =?us-ascii?Q?BCQAAA3AgRkMZDxwMkGanDi2NWxco9DNMCu/dBhI9fA6y6Eb9ZjDy12KeoJC?=
 =?us-ascii?Q?W73AiyGmA7kp0sZ1SoykxRSED5WX3v1sTWg/HOTXi6GnDqTmLou+w+DcSrZ7?=
 =?us-ascii?Q?pwS7D8OW12fwmNiMadMYutATcNobyAILf5HqzyZSR8nxHszzm1H/gcaMtTEo?=
 =?us-ascii?Q?ezjzlxJX7n4arvtRVBEhKcjCuRbRmx4DB+6p5NKT61brgO+h5fquBf8afyuZ?=
 =?us-ascii?Q?jc7KvKuXEhpSiFT2at7kb5pGcDc6ZUJJd1F2jcuw1AvdCSFUJ1DW+75Exelg?=
 =?us-ascii?Q?ouFdOsvVsv4TFRZTFWo/ZEXqDLFl9LjsTP2sU5z+VDkxxnC9BtbD1POOPigr?=
 =?us-ascii?Q?ljjYTt5AFPrYJk37QtW1qThefLClJDZqooDpJ4gH2nXFNT43kPNV9KKmVl0N?=
 =?us-ascii?Q?QQk/kjFRJFGIKV9rOYPMcBgv1g/M0Zf+ozV+2Jjl++XFqn4aSSWBcmFB4ACN?=
 =?us-ascii?Q?JiVhd4lis/w4Ruvv4UPy0gNriZuunJOiIqErNx0fLLnJ4DiEdXdBSoqws/qh?=
 =?us-ascii?Q?QbveXHLjGbazizmr/rT+UPvxwBqUrszCk2B3kODKG9PAvEnogifg3KgyF8pc?=
 =?us-ascii?Q?A2mjnAOdmUMyjUkxquUrY2NgqYq55NF+OlDPR+XU2vwqlgHUzZrAUVIc933W?=
 =?us-ascii?Q?PagbjAMEDWAJDp4iWIOXwwPRCc3SkSo9iXIXpgn1UrAws5M99qbJ2wpn+o11?=
 =?us-ascii?Q?U+JLTPyOiCDFZRGDxEk372vPFDCh7wVUahdNpkTI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3427a7-0a77-4285-eb6a-08dd8f1b8be6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 17:04:23.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3zsVjCJkTQVfurF+3klHuCeQXfYyaHS3UjMEpyRst8nwLrBkhZF/Gg7AppsyKpBCno54fcNAozShr/BZhQ+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829

Hi Yury,

On Fri, May 09, 2025 at 12:20:08PM -0400, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> for_each_node_with_cpus() calls nr_cpus_node() at every iteration, which
> makes it O(N^2). Kernel tracks such nodes with N_CPU record in node_states
> array. Switching to it makes for_each_node_with_cpus() O(N).

Makes sense to me.

Maybe we should mention that previously we were only considering online
nodes with CPUs assigned. Now, we can include also offline nodes with CPUs
assigned (assuming it's possible)?

Semantically speaking, since the name doesn't include "online", it seems
more logical to ignore the state of the node. And if checking the online
state is required, the user can just use node_online() within the loop.

Thanks,
-Andrea

> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  include/linux/nodemask.h | 1 +
>  include/linux/topology.h | 5 +----
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> index f0ac0633366b..1e2bdda1a0a5 100644
> --- a/include/linux/nodemask.h
> +++ b/include/linux/nodemask.h
> @@ -541,6 +541,7 @@ static __always_inline int node_random(const nodemask_t *maskp)
>  
>  #define for_each_node(node)	   for_each_node_state(node, N_POSSIBLE)
>  #define for_each_online_node(node) for_each_node_state(node, N_ONLINE)
> +#define for_each_node_with_cpus(node)	for_each_node_state(node, N_CPU)
>  
>  /*
>   * For nodemask scratch area.
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 24e715f0f6d2..ffee6b4a071a 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -29,6 +29,7 @@
>  
>  #include <linux/arch_topology.h>
>  #include <linux/cpumask.h>
> +#include <linux/nodemask.h>
>  #include <linux/bitops.h>
>  #include <linux/mmzone.h>
>  #include <linux/smp.h>
> @@ -39,10 +40,6 @@
>  #define nr_cpus_node(node) cpumask_weight(cpumask_of_node(node))
>  #endif
>  
> -#define for_each_node_with_cpus(node)			\
> -	for_each_online_node(node)			\
> -		if (nr_cpus_node(node))
> -
>  int arch_update_cpu_topology(void);
>  
>  /* Conform to ACPI 2.0 SLIT distance definitions */
> -- 
> 2.43.0
> 
