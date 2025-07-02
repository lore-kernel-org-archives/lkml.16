Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CFE2BD5B5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466359; cv=fail; b=T4W42SEuFe3p1aUwqKgdLQSV6jsKjhV9nVevz8BjMlkLboErLrvTpF6u+aLOq2u9qOtmJjTBGYlRhTlHKwi3RX2h4JCBxzi6bzyJu6GyDxaKEJh3DE8sOTqJPOtTCvs6BtazVyc7ICJO0gnvmHWqCp+qV/DKHatbaThM/F+c6g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466359; c=relaxed/simple;
	bh=I++ofJ1y/VKhrs0T65A3M+7FIOWA46fG2JFJIYebKHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QJFK42SeTvc88k97u9iCu30Luzsl2tNicIvLC+0Jadw9WxL8ssUzRRR/Gsj3rWBlxKVPx7Nf8L6EwDqocTEEGR+XzCAUzZOfdYA8EtBfMVzO1MD7oOxR25uhddweHsdc4lI8vKKfYcas7ARN7QwizxkJWlzdF6MEe7XDOu2FNxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OQIqME5J; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OQIqME5J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKcsCA5h/OTjRhhgshMr5GB1/LmR4uXIzF7sAfygVn2hOaCLgq66rOZKO7daLdd3rGw67kl79SmhkmYfSdtl275/OVVi0iJuuqpLyxylwIkbJLxQKO3FVhhRznwvzEThYSb7NP+yYRTY6Ud+53v93z3TRrIw2gut4ez0YclDCN3+/fvKbl9g52NiUE8jQO+VT/wMG+rkcas4BrRnXtUHo2u757grORnjnkbGJuHX2VnP+LvRE8Mat2XgSog/HBXr6+ipV2uzFMlLsJKj6kYoGmLPxArUcM0+ixz0Kx5dAB/+A9aRrC+woPF0Mf6ANfXMm+i+mMx7y+FvQBMZwJxuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/lr/FKQAFLKUcoANP5BvQ/XdBoEeQ03yR8fi5Si52Y=;
 b=BtNNgjHfA88Xt09Y+Pqp3kal/VYru8e+9P8ZUl/LO93DMxVeUzBd/2xqtEBADDdIlpk5ej0PPSuGhPt4hUtrWz+S7o0ifmj5DwvMPkUwPeAEnoNyyIkev01aA72YgIYc7mHfsXubYi8n71kdPx8WQ1VZ6SGgLzlwXCK4R0HYB8nIpnI0H1BHEiCUCtYUyF1gcbfhZwQnH2W4rj1AqoEyums2Udf06r2xsss4hHH4wnkQbF46mxSA7+yn3QvmxmBv4PLSwra2Oi43Xj9dA1uPKKCNxRybeFbrS6S2HkehrkHfKpzB9Dsur6XUtM4Ma0Vf9aQ4KVO582t1VwUi0X5+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/lr/FKQAFLKUcoANP5BvQ/XdBoEeQ03yR8fi5Si52Y=;
 b=OQIqME5J3O6TNyg26hEfnw3t9SIvLREn02WqkUQurTzFPK0hHjzWvGR/n8zwXnQUsBvcvdWyT+e1vuYsOKSunvLz18zCdEHFYSZg/SQC2YMOSSzFQ0p1WI5et87lJEVpRPYybHDkUsbDyY3/ryANc9D3CFktK+7zhk07GVEb1vR5CrmgVDMd9rJn6PJrbyD6poU3SP6BYK4QRcQH5wGlEH33fPLjQdOaXXjr4JQhizgxQz29pgzlRdzrVdKaB/4svszXc8WzMO4qCiYACKHK73oi8P+M+3A9DOriDkdPdrVBPCloViwQQgnGXxq56r+XnlL8jBWnqVBcbD6/eSYQ5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Wed, 2 Jul 2025 14:25:54 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 14:25:53 +0000
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
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_flags()
Date: Wed, 02 Jul 2025 10:25:52 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <42BA6F99-8DCD-41EF-87E9-A538FACD15D4@nvidia.com>
In-Reply-To: <20250702104926.212243-4-david@redhat.com>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-4-david@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:208:32a::23) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 264ddc1c-f9d5-410a-9520-08ddb9745a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CJDUPRzaW3/zLI2jxkGgTIHWuYeXTVmHd8nvrLCFIbZ2JyeGk9CsnYYGJeVg?=
 =?us-ascii?Q?QM71aOaqrT2yRTkeMYD57xAXbwJ6XnrHc+XHTHRhHnFkKOSWUIgsGp2VD2v+?=
 =?us-ascii?Q?XTZ4Vvy5/vcZwxHTtSrAXjsUvt99qf0dqpTaM8FrVlbW60i25CKY59ZbTqsy?=
 =?us-ascii?Q?kw5IscRdMMs6hgB7WHkELD36TYJgAqjyaVNyVPBhFo+rnHGlQmAnj3SD+XI/?=
 =?us-ascii?Q?TuJJzEDlB7y9Kb4l12+NOPU4w6tZ7828JNm6OJtXs5DSZ/nPAtzSXz2hgbXv?=
 =?us-ascii?Q?IJigpqcruZIojFce/WAsVD9kxI3FylceBeDrzwWaBIXQgTLej2WgsFpRNfD2?=
 =?us-ascii?Q?defog76vItI+SptJkcX9BDlUE4lV8PWKF7u/N+nr6YO28iq9malouaSZpUXK?=
 =?us-ascii?Q?dX2JLEhBaCGK1/n5vxaIQXZ+o36a/NrZXuz8+3lzah/Zz9KTIE6z2hdZAfeK?=
 =?us-ascii?Q?SIupp++tUlQDAp1VqNT+7eCOxSxkNLSFUuBIbD42SQM4ujSXLqsja5rP2nBg?=
 =?us-ascii?Q?d3zB4kYVJSj8y3VSxjA1+colm5VCah6lA+voJ5TpO28Kmase3RS0wW9KHl4I?=
 =?us-ascii?Q?mv7M0Zt7j8NfVqr3iiAS13GMpp7Vta63ggY+Lc0l7VlNosmRRlqK6lcZkOlN?=
 =?us-ascii?Q?odC8yKeDdEK2LqyKUPhxB1cS3uX48sqhikWSSPZMKQJHVPq7AYLKxHJOEPFJ?=
 =?us-ascii?Q?fzWT2Rhz38EhuYVZI7UdoAkIhrV7Gnzatkcc/0xhsS9VrVVj4w0hROF/F/QT?=
 =?us-ascii?Q?9XuIRApo1FgtBhaa+Oi7p65EXTfNPWLhGqOvdQc3igMKjrxAfC80Vc08iuiu?=
 =?us-ascii?Q?iKfFjUL5wvQgBBXPUChaFT4IAw0xho0EVa0JjsvHg3YPunPBddqpanekP2U7?=
 =?us-ascii?Q?VIll1tacTkAr9CiMoDvSUCE3xFsq0ouyeETnyhhvgnQjwMzNdx8dhR+L2v9N?=
 =?us-ascii?Q?8GHaownCSBAd9U4mbZ9E5H6KR6hyGwvEU5PlCCKKGRzQV96ft0RLcouQDEDq?=
 =?us-ascii?Q?muiDZoykxtPCmKxeZyKpRO8y//PkqSliMcQsgqKSiSXfEqBf3tnW1PXoDn/0?=
 =?us-ascii?Q?bZYKJT/gkhmi4exUtThS2gLoW2P71TC1jQDg9akxViY3m6mKNLQPHKKBLkwl?=
 =?us-ascii?Q?i8ueQMRliCo3E7tIu7w2qQqcqfXvoW39ZMs1XOZCi04dz7BfC5bpGRgNLCwL?=
 =?us-ascii?Q?6rbNQIc/K/FzrbQPjI9b+jsUJdUJiM7N8DqVNKCZBGZZacz3Pa8O+ikWCV9x?=
 =?us-ascii?Q?VN01NZKrZ8lPsjOj2uW592eRhonfsQUk0prYTCva6dFcSqw0cBGEh9ILkdbj?=
 =?us-ascii?Q?SoMNBbp5Wvu5/k3iSsordbxMPIL/0Ex1mvGQI4xJqITHe7H4MRpBQVRkW/E2?=
 =?us-ascii?Q?6B0UpnRRBPaiDQ+0onAc7bfM44j0+lBKSLHLF97Kh0+Xa4nxo1CYG+0FFwfG?=
 =?us-ascii?Q?Z1Ag/yscL/w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?93VewRxUUxH5IqUFVntDCd8VyKV5sS4OVkx99PKI42XSoLNO6nro3AyGarx8?=
 =?us-ascii?Q?YBjZ17DSieP+IMhNBI7SjJpSHeSILvupfqpiXN7sEt5JR4nxhNCGEAZ5Zhas?=
 =?us-ascii?Q?uq0/UIyzHbIUXzDJQsurUJWmHWAfxA6xwRtZpiOo8XOwNemZwZMFFHGTzpF4?=
 =?us-ascii?Q?hwsIBYyKaxjmA0Xw56P613oAG542IzJ0LiP48Q29Q2K1ciN8hAzapJtIYEu3?=
 =?us-ascii?Q?HaT41+Z5R2s74fzjJO0iyCvL6Ar5+TqrXS4MedEZxw+W91z5G4uMMghzKgEb?=
 =?us-ascii?Q?DTiU+zSEcZ2A1HIPsFHkI0TzOMCgPnA9ICtfrVPFJ4GTZHobtY6oeLkgNwpn?=
 =?us-ascii?Q?fJUP+c+URH23NCMwsLDF/iHtTU1/uuJgGxG/2zBJ3fggrNuAY80nUj2zMnws?=
 =?us-ascii?Q?Lz7a0VCtnV/8pEK66ikKsksLMmo8hZk33WeD9hsMO7Us2tONUKjVwxnIcjmm?=
 =?us-ascii?Q?A6s9ivLsoa5e3PMmQIDnLoX4ddmQ/2eae1y/e0oGJmbTYQH+NqA1ZPHH0pfu?=
 =?us-ascii?Q?WGRI3jlTSsxZfQdFPen4GsTWSyZzXMitXP8u0+KR+W84i3xgeLX8b0skOeF9?=
 =?us-ascii?Q?7kUU7pR7cJ7W9gEjTtufgLRqeYhzQa2Z8io7y3au4poLw6J3P5aQG4NQUgDI?=
 =?us-ascii?Q?F8jt5XUXfULXESpf6ihamRQ0bRx93x/cw6pHPlKmw5jyF+CLSQHLAIlH/RAc?=
 =?us-ascii?Q?LXFlrUJ8nfShvOZVsz/id+LTiff98G2PcRZtPuDDHpx1f0DKzWU7D5SQKInj?=
 =?us-ascii?Q?SbZ6nGQfWMeywT94GMxJk3v16shJLaZC/dkcJ/lGgpNBBDglJGjUWiReNygV?=
 =?us-ascii?Q?rv8Q5yS+pH7r8oED8fIVyOXbJWsMXM9MHZvzinRDj5P5PIVQBphdSNaSCzMc?=
 =?us-ascii?Q?ZhBpJC5YWa1ADSQ4cfWreSP21gwByiMobuFu/3nwrVrHRUrtozGjgewnrNvp?=
 =?us-ascii?Q?1Mlzowjw8WwKUUbTzovPIi/tZY8sdMbFWpGwVlAGnFOf+lSMmhCPPqfE0WUX?=
 =?us-ascii?Q?CR5g42JiqV89ybBweZL5PSA7fIvfZYNYa5tUnArr/zqf0glfDU9s4oPEQn7h?=
 =?us-ascii?Q?fiRTX2yrEVvjQav/0CST7+10ysnn+B2XqO9bFkQmlG4SlnrizngiNwHSDFhX?=
 =?us-ascii?Q?dx61jcXuE+n2cJC1mbp8YcNVZIJTsfu0K58/ffKmRahxQ67L02lIYYcgK+ck?=
 =?us-ascii?Q?H8312iCAYhjJ7PYGUtU6z4Sj6YbLt8S1l1Ki5yT8HR6iHOIKVlNbl3Aqx8M3?=
 =?us-ascii?Q?PBE/Dk3Qa+AxZWOZU3LAxSyNkBzKGHf3GWvU+UFJNx0VU7ufIH/q3L3uLVqe?=
 =?us-ascii?Q?R0xYeRgDmIzKOk8Ac0goJkh17m5zFBriCDIGBidYBnY+J+cPdRLIezs0ZxC/?=
 =?us-ascii?Q?2mCbMneXLwPdJ5+CgZ7L9mEAqcibqIIQCBDJeSW3yCyl4oKephKON7tzy9wI?=
 =?us-ascii?Q?Xz0gwf9F9StyuUM98oBZHDGXYEJxOUpSX5C/p/gEtmThXck9g/YSfg0dT0A4?=
 =?us-ascii?Q?pHuYhWRuu6Z9E4mpWauzvImAs3U6CM7FaJ/E2VCLPYhclG2fWbeLBgXhXpZK?=
 =?us-ascii?Q?Ghj2AVlpzOeAnSU+zjOA3l2rZ3W+e5lzcOJW2/XM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264ddc1c-f9d5-410a-9520-08ddb9745a3f
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:25:53.9103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdKaD26g3n4AMVEUr5muaVSOMdi2wVagn1Z1HyKMwEHeeCEKcG0ddBkh5lOrZTD7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344

On 2 Jul 2025, at 6:49, David Hildenbrand wrote:

> Many users (including upcoming ones) don't really need the flags etc,
> and can live with the possible overhead of a function call.
>
> So let's provide a basic, non-inlined folio_pte_batch(), to avoid code
> bloat while still providing a variant that optimizes out all flag
> checks at runtime. folio_pte_batch_flags() will get inlined into
> folio_pte_batch(), optimizing out any conditionals that depend on input=

> flags.
>
> folio_pte_batch() will behave like folio_pte_batch_flags() when no
> flags are specified. It's okay to add new users of
> folio_pte_batch_flags(), but using folio_pte_batch() if applicable is
> preferred.
>
> So, before this change, folio_pte_batch() was inlined into the C file
> optimized by propagating constants within the resulting object file.
>
> With this change, we now also have a folio_pte_batch() that is
> optimized by propagating all constants. But instead of having one insta=
nce
> per object file, we have a single shared one.
>
> In zap_present_ptes(), where we care about performance, the compiler
> already seem to generate a call to a common inlined folio_pte_batch()
> variant, shared with fork() code. So calling the new non-inlined varian=
t
> should not make a difference.
>
> While at it, drop the "addr" parameter that is unused.
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Link: https://lore.kernel.org/linux-mm/20250503182858.5a02729fcffd6d472=
3afcfc2@linux-foundation.org/
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h  | 11 ++++++++---
>  mm/madvise.c   |  4 ++--
>  mm/memory.c    |  8 +++-----
>  mm/mempolicy.c |  3 +--
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  mm/util.c      | 29 +++++++++++++++++++++++++++++
>  8 files changed, 46 insertions(+), 18 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
