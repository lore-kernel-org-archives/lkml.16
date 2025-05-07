Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3817E4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648853; cv=fail; b=FzStzc7FUBd/hmlG2AQtsbk2hQfk8Y+4vpFgF/xa4kc5d9EKAlp1WuL1rrlwdXjp/QthjbRcgb1mC/D2qYT6SRkybkBpvu8AEzopkJn7kYmk1OBezM6LkFmrkMWZ3LmPs7WF2x09aaHC2mp5jE9empubDujk8VuFz85+Hk7IYHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648853; c=relaxed/simple;
	bh=xVAJUGD+61BMLDUNH/C8tMA56IRWxHgI+vP/ntxzQNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NEDahYZ0S18NekZ3No+eZAce5hETjk2334ZK0/femK23PAdz5QlJB35GUgy6PTAgm03lKrQyXl1YFbsJ4DKmSOQuj2dRPSPLdztf/p3Ne4WLORkEBG4OfPSU7ygxx5G4SzLty1qizIwX3+gZJHwGgaCYJuSixw78cERNuKz23N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bxBYVOGG; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bxBYVOGG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MboCi8+DkJcZMhQd4Gco55RmTM1fFCXISX2rXKZKflx1q3D31DlSfhVsa4ZRDhfv1jkgvc52fNIozCnW0XO43nCZN4W8J5dchl+vnOujyy49uPZzBWQv4SjM0SUcCzz2AImyERpQ9pPq3ZFs5GDwHc9fSl2ivgqfc3rhl6WW9hdqaByjY6PWoOPNHYdIm0HVwS73vc3zDeW8bmiNI+YkURf84Zf5nNMDzz4kzTYE7vrd6MJ0s/tP5sJ81USeUzGRdytwoMVGHx1+bTN2L1nxp2OCrmZMsYPXd5zD6nXbwhJPF1oklUDx5U/lIWBAweOLUHMl7a2ZmArnTKNQ1+UPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9qG2VoNFaHHkBqhUNkJtfWablDrWCHy8xhv2/D3r50=;
 b=kasbK7gMZZasVB6z89OvqZfBqBOVvrsOT68fBvMNvsltSWA9KGR0vUv4/6GanysJtT7OjYehiAqKRfRoUxx5ZMSIr9mk/WosXkgwkZjDDsb0N7iQ5YIFx9/22eTTLPvbiR+WPvisIF26T1beFo6N97kFPigEb1ifonuvzr5bCZmRTHVYAYxP93P5i01bfs1cIrcRBXO1L8Y63hid2qwP5uiKX7DxNzudo+e6XQ+OEHW37VCNQanyy8+xN8dYKHGxb0LpC+w85DQBf3oDdoQUoTaUKfAdz3OEuLeh6FiZbggK8GILiHmmg7IRRZ0qHeRmA0j6D4l71LoWjWfBJ/FI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9qG2VoNFaHHkBqhUNkJtfWablDrWCHy8xhv2/D3r50=;
 b=bxBYVOGGh6FfisP5O0BIEp6/h+d+jQiaN17hYBLRNxY3ewjWJKTh2yPeSARYXQN9LAj6kOnbvRpZcqs4XsjCOZRj+IBjy5tT/vYL84QJnmoXQ5YkuI6hcn3p2Ne+lUCeY7Utojrjn7hqOyrphKcvtscYHj0oB7deFIaicvAJElUBdaAO/OPf8cJmO2qFks79hKsUxCuKo6zL/wD7usbwgd/UJy52O6zr43PiH5LuGVSFqn4jl9HBIy+MC3f1uDh43Jhz3UvxVKAi+MBs5RSyWqBSubs3Lt4lYlopsvVmXNRUd0SkQkDNw6ATxqjkgMeRtnTL3oQYAvEmFlAV4xqbzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 20:14:07 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 20:14:07 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/1] prctl: allow overriding system THP policy to always
 per process
Date: Wed, 07 May 2025 16:14:05 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <97FEC8A9-A8F6-4023-913F-5187062B0E3A@nvidia.com>
In-Reply-To: <20250507141132.2773275-2-usamaarif642@gmail.com>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <20250507141132.2773275-2-usamaarif642@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN0PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:408:e8::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: d5be8368-be4b-4883-ddbd-08dd8da3b859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ednIzFh8bL9bJ+u5MDG0eExkjtFINp3Niqm2f5EUp4pgdR3TW67/gmMHhd0E?=
 =?us-ascii?Q?2pOK59qFE45ygK6xcoqDUn/hMZ9uWju2PgjLNtQ/rsytwa1gpEkVvYXbcDz+?=
 =?us-ascii?Q?ZbtCBYehLrtSn9xQHKqc89Ow4nWxWP5550jTDs4whtLLseDqb6hx6dgjexsd?=
 =?us-ascii?Q?uGxgkkqHQq8Xm8vPC3u30ja2xQdP3sSOWAFpIeCwwOXR7FgUkairl1xiADuM?=
 =?us-ascii?Q?DIk91cNjHHoZZ6QaArA9nJ3KiBGwGHh5oBc7tW4L6an3UmkDx82nlKqZWDW1?=
 =?us-ascii?Q?PtcHtBG6lSOmVk4xkfO/l2WWqSdXrmT++ejiXCa+aBCVQTFK4GsthXWiTcc8?=
 =?us-ascii?Q?8PTIo0BDKGB14/9CSSR7R6O2LR3Xm8pP1LhKeTQoKebWU7AjnLB5CNxdnTi9?=
 =?us-ascii?Q?cd6nlmIaCWE0x3NpbuI62V7vJ9FHYh9sSfHinTQT31WwW6MAz21qfs0ZcmRB?=
 =?us-ascii?Q?VEj1LSC9xy7JdSzY10eE2B9nfW7v0baG+f3TYrNx2ocpmxLKjMsUtQL3+U8/?=
 =?us-ascii?Q?HdV5gbVmdr03DC+muvY0nGn7JCa50zpOWyAXhdoxHIOny+JutGJenrUvRQ1D?=
 =?us-ascii?Q?Is8kWqQCCyVfxjBiWfCK+m9KbZDOHg8z2wiRQW/6LQNX2OaGqThMO6hmjlYy?=
 =?us-ascii?Q?zFSYcGZ+dXMcPmeiNoeeKHRPchQie6jJtLvyWqI24sfNotRginuNvpQOfl4k?=
 =?us-ascii?Q?6L+x0J1XyzaHu4LtwbUBCDe7VDU2rvzCrVH4dbwG8Kfk4UtfBE4BQHv5omCZ?=
 =?us-ascii?Q?IHisy2ml+c4V0JuDKbFkp+gm3ZwOZSNNNjRnAUE7A7gOql2+az/U4UNrbZXo?=
 =?us-ascii?Q?5V6/FGuuk8O8eoKZbmMuPIPFZL2BM6sapbu2148y+/NqvVpzqG/d611DvM7A?=
 =?us-ascii?Q?Ti4favkCXZUvcV4iiCL3n/2CSS8dH2mt3edpAsYyTsvvw3eHxv3pwm7N0d96?=
 =?us-ascii?Q?1nsQQcjagk8vJJjxDQoWU1y0Mib7H9NQXzCctiM2RhMz9E4XqX+aHrU5BTWM?=
 =?us-ascii?Q?TtNAvaZuOf9bNo85L9eN0LVKO49wpNHmOASLkamsXHmq/urlLUlG2VMRZ1xj?=
 =?us-ascii?Q?8iOQod6SSv+XRTGvvCaeL66jR9AcQhCG7vqjGoRC6U+lgC95tAWIv4/IlJ8T?=
 =?us-ascii?Q?xDNqzhmBYLxoq7EY140BPy/dwH0R5PFHN5IuYdF/Gk38rmImJbGtLKDf5gI9?=
 =?us-ascii?Q?+j7wmNcKBtaaubAdCWcPDPAxdr1PGEydB1q4A8/4JL5zwaF3euUFjm2HXY5D?=
 =?us-ascii?Q?QZ5twxROMJgysT8vVHUNgCFt8cCpGJFHxOLDWJUPuUK12KokqvCoGqhP08QI?=
 =?us-ascii?Q?5qIwnYg1/HLK+Fz0Ct6TyUGBxLnP+sqJeaUbNm8SWfELGyzcVUFOrunsQ4iT?=
 =?us-ascii?Q?+VW5k6J15D0lU5NdwM+DQRrVIN63RzHrPr32QKh02pm1OmuOvzcycgW7PO/C?=
 =?us-ascii?Q?kZUGIyWlt6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oxAUtZ6/4m8NTih4ddpinbPqruRAUJ4W0hETpLwEQmuNGSb/4WxFWvxo88KH?=
 =?us-ascii?Q?izxunwWw6vSnfEULId6YehUkJEcuiAu7yXHbIo4umac8EGvw+XlSfKRZhqgR?=
 =?us-ascii?Q?mqR6abfx5nc3CK0pCNblNpd+m0mSOS/iimU9qgMsER0MJ7jAxYreD4IK84me?=
 =?us-ascii?Q?PrxFdczHGACXZ5i3I2VQa/gR1rQGV28+Kl064H+nG9KNb77KS6wjetrpXJog?=
 =?us-ascii?Q?FWsHi5r8k9Xv5lzegTxKaLgTlibXSLQVwjANf20DpnpKy8kfJSXPfjhX9GXJ?=
 =?us-ascii?Q?M1yZCJ16ajY+S3V8Z+ZMX76vSTwEZk/HmNgmsAgVu4gPfid7DKPHsMAlOZZl?=
 =?us-ascii?Q?9TBnnYKsJ0gAvssrQVw7bEQMISMJJr49apyKDiP6bvBY3s5rUTlo75ZPELiJ?=
 =?us-ascii?Q?vJcONEXlRkR285wE3hgkhlT0YrjAZ5NMaBJJ3UCSOa5ad9AJcpQqhDhsMoLk?=
 =?us-ascii?Q?gR0T0SjipjJbEy9wEYj2Kfrjmb4uA8bnzfFDbWAYh37r43I9L9Jm6pkB11sL?=
 =?us-ascii?Q?8BtEEAzq2Pgnn0P3vKkMNbdJHFiy9SXdVER6RRrV2ByxH2HWUrieYHQfxb7h?=
 =?us-ascii?Q?vTd1KI1IQ9XQvqhq73qAtxMxxKf/e1picgYUPzb/YR1zmD63oZ+vtfrM/w7J?=
 =?us-ascii?Q?RbOJbSyf3UfPwMZfm9Eo/irpYqa6CoGGemUt8SDFrf+u5n1oEbtvNO/+7Dn2?=
 =?us-ascii?Q?cxzywSLsV0v1VnPdgtKH0YIAGSiEKOXJ9oDVUlbtr5xlR7RclvsxZaZD3AD4?=
 =?us-ascii?Q?swyUf2JRjTwQQDCMrWy4/3JCUziVCh2DIlYGoe24ipXeCiTNjHI4btf0dZgU?=
 =?us-ascii?Q?VggsSbkTh4PZ4HIAuKEwkfXFt0SRgAOkhjPHUktdM2BXwPmNd1D2FQOMB66o?=
 =?us-ascii?Q?Cc1/R2DljxIrD+aWVTeZ1adkAdEHElWL6SSFU4bQn3w2VKjR3IiD6vrGoKc4?=
 =?us-ascii?Q?l2amHzLQYNagvgEr/Xpwo8U7L/lmGIOf5hfndXoDm6ebueEdPyOU/7PF/2Pq?=
 =?us-ascii?Q?SkU8+byCKO21OjLPg1wjHGsg/L4HrP+iMU28T/5ETiu8odomjy2O6VewIRRL?=
 =?us-ascii?Q?K+yIohmQMqT6FXsMEY/tfQODQP0EJghFTGkm1/KKgSPUfGGK5Gh+JHRyByTX?=
 =?us-ascii?Q?fu05OWD3IkW3YwJdKnXDQFLlofbsqeUybp1HS0JX3K1b1XEqwxiyi27h2lEK?=
 =?us-ascii?Q?yeMlF0K/NsNztiiYefX9273Hv8Y/PCL9AAOg9JzPA4aB6oc8uARpRrB+G1Sp?=
 =?us-ascii?Q?fUUkcgJcTdob77JXW2nZS9Xaq27AWOC343FMdpONwuCAUyz+QTR0WVUluBOH?=
 =?us-ascii?Q?PzsVly67WwpzvPGk6dCFTjQWX5Cyg1FED2lRC6TpgWyLDGMhqVS80NgmamK2?=
 =?us-ascii?Q?U3oQfkouVYMkKLqdd4Av+uIfuUl/sjbGJrFmPxXRwWpw4OPxB8F34rHePnQn?=
 =?us-ascii?Q?4MMT/oQkoQzCMrEEv2ZlgaqOjrFXlpDVhchzbSyEzNXA5zTwvlrPHIcuKOZZ?=
 =?us-ascii?Q?etimhKnDwaksLeLhTPZkQYx+pRcFcnF+ndfoKoW6R6g82sDyCsk6umPJLrZe?=
 =?us-ascii?Q?M5Y2YBSiJY5MuLn1BazOjOUkZW8SMvQ4u/n7gfxX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5be8368-be4b-4883-ddbd-08dd8da3b859
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:14:06.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTB6nmCdWtrU+x1Am5h5tl48okc4wiNadachPBhf/TsDuaStl46JcRR2AKlbTSSn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033

On 7 May 2025, at 10:00, Usama Arif wrote:

> Allowing override of global THP policy per process allows workloads
> that have shown to benefit from hugepages to do so, without regressing
> workloads that wouldn't benefit. This will allow such types of workload=
s
> to be run/stacked on the same machine.
>
> It also helps in rolling out hugepages in hyperscaler configurations
> for workloads that benefit from them, where a single THP policy is like=
ly
> to be used across the entire fleet, and prctl will help override it.
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/huge_mm.h                          |  3 ++-
>  include/linux/mm_types.h                         |  7 ++-----
>  include/uapi/linux/prctl.h                       |  3 +++
>  kernel/sys.c                                     | 16 ++++++++++++++++=

>  tools/include/uapi/linux/prctl.h                 |  3 +++
>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>  6 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..0587dc4b8e2d 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -293,7 +293,8 @@ unsigned long thp_vma_allowable_orders(struct vm_ar=
ea_struct *vma,
>  		if (vm_flags & VM_HUGEPAGE)
>  			mask |=3D READ_ONCE(huge_anon_orders_madvise);
>  		if (hugepage_global_always() ||
> -		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> +		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()) ||
> +		    test_bit(MMF_THP_ALWAYS, &vma->vm_mm->flags))
>  			mask |=3D READ_ONCE(huge_anon_orders_inherit);
>
>  		orders &=3D mask;
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index e76bade9ebb1..9bcd72b2b191 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1704,11 +1704,8 @@ enum {
>  #define MMF_VM_MERGEABLE	16	/* KSM may merge identical pages */
>  #define MMF_VM_HUGEPAGE		17	/* set when mm is available for khugepaged=
 */
>
> -/*
> - * This one-shot flag is dropped due to necessity of changing exe once=
 again
> - * on NFS restore
> - */
> -//#define MMF_EXE_FILE_CHANGED	18	/* see prctl_set_mm_exe_file() */
> +/* override inherited page sizes to always for the entire process */
> + #define MMF_THP_ALWAYS	18

Could we have something like MMF_THP_POLICY_SET and another field
for "always"? Otherwise, how are we going to set MMF_THP_MADVISE if
we want it in the future?

>
>  #define MMF_HAS_UPROBES		19	/* has uprobes */
>  #define MMF_RECALC_UPROBES	20	/* MMF_HAS_UPROBES can be wrong */
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 15c18ef4eb11..22c526681562 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -364,4 +364,7 @@ struct prctl_mm_map {
>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>
> +#define PR_SET_THP_ALWAYS	78
> +#define PR_GET_THP_ALWAYS	79
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index c434968e9f5d..ee56b059ff1f 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned lon=
g, arg2, unsigned long, arg3,
>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>  		mmap_write_unlock(me->mm);
>  		break;
> +	case PR_GET_THP_ALWAYS:
> +		if (arg2 || arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error =3D !!test_bit(MMF_THP_ALWAYS, &me->mm->flags);
> +		break;
> +	case PR_SET_THP_ALWAYS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		if (mmap_write_lock_killable(me->mm))
> +			return -EINTR;
> +		if (arg2)
> +			set_bit(MMF_THP_ALWAYS, &me->mm->flags);
> +		else
> +			clear_bit(MMF_THP_ALWAYS, &me->mm->flags);
> +		mmap_write_unlock(me->mm);
> +		break;

prctl can take more than one arguments. Would it be better to add
PR_SET_THP_POLICY and PR_GET_THP_POLICY and specify PR_THP_POLICY_ALWAYS
in the second argument? So that in the future, if we want to add
more THP policies, we do not need to keep piling up PR_{GET,SET}_THP_*?

>  	case PR_MPX_ENABLE_MANAGEMENT:
>  	case PR_MPX_DISABLE_MANAGEMENT:
>  		/* No longer implemented: */
> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linu=
x/prctl.h
> index 35791791a879..f5f6cff42b3f 100644
> --- a/tools/include/uapi/linux/prctl.h
> +++ b/tools/include/uapi/linux/prctl.h
> @@ -328,4 +328,7 @@ struct prctl_mm_map {
>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on ex=
ec */
>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
>
> +#define PR_GET_THP_ALWAYS	78
> +#define PR_SET_THP_ALWAYS	79
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools=
/perf/trace/beauty/include/uapi/linux/prctl.h
> index 15c18ef4eb11..680996d56faf 100644
> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> @@ -364,4 +364,7 @@ struct prctl_mm_map {
>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>
> +#define PR_GET_THP_ALWAYS	78
> +#define PR_SET_THP_ALWAYS	79
> +
>  #endif /* _LINUX_PRCTL_H */
> -- =

> 2.47.1


--
Best Regards,
Yan, Zi
