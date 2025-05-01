Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514012B9BF
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112110; cv=fail; b=uBw9jN+lkdnejRLFx1rUDqhI5batUh8udX9mZTNVAWWUydGJwps4S64o+DJ4+AYTBRKX2C2s95ONoVFyg7M5lOqJZTOVaEZgy23XF49/Cpv2YpXbb4qXzZl2h7/PSvRP37DTaFDHjQy5GUpybH/bFAtYXBpLw84ArJrBLAD6+cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112110; c=relaxed/simple;
	bh=F7qvRDoXwU1oiCjewIp8/B/r2jFK4n9DDkJ3+Hn9BUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlF6328wOs2i0425TruP7nZGEaoJ2dk4jL3HsKXcd4OKyd8L99ruQDyx4Qc67UsIu/fSvKv5VvuHUDpGO2ajSfZe6W+WwdDO04Oq6nMez3WqhQUWQTWCfKPy6BpvKZJUuU1Y8xyjFc9weqDnKQH8z+5cmqngKyM9Ivfb1Zq2KRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=naXCDcVS; arc=fail smtp.client-ip=40.107.244.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="naXCDcVS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awp61qUb6S1+irCDyPqAjosyNGgCgBYGnmDFZs8UhO1a2dhAdREehtLoBuTLvAkEgftUsjD6kSx9BN4MKGAFC6r/a7eG/wtXEPFoTqGFyoALpNuL9K26cVJssxVzPT7PpUwj4VZ4nAK3UnSQZXJCGOBLgcYlvIbHvgL+3xPJsE7ctJGmvbxUl4pWOnvdQ742SYamcHk9a0g2mOOvxuz9OyB3Du7njcHad3NesGgHzTLuVOlNnavQBGbrk9khWqmOX35mtfQbAyW4Mqdk3djmfA66JA2mR1jMshOZQUn7aBixvdTgywRVFO7ApmCoc0CVo1OOteZxIb6gNX4DiAe1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JabvGgDgWqdR0IDOuU+K9poRDfqL5D22KKKCjXzD/dM=;
 b=E+UUcv8r1OVIQbkqAfcbhK27EYm1840CIX3rlo30RhHxipfbrKgxfFvd4B4wheNGu80zcRf9Gkwu9IbherhViL2K/aqonxdUZMHRTvq8yjNWP1Xb4MWn3RwUztFH3Tuw1UAfSSb/jMmRxXBwCq3VrgCNCnk2MeQ4FnmzjLt621otYvJM1vR78R+HmouDqmlQcbtVu+MEumIxc87xP+hRJ0qhib5+u04qXOAEj0AqSRzUDXyooLFK7vxf9eCq+FndOnBea1vNPFQOy+3jpgkXp94PpGdrnTg0qPBItVa4lphE1huYwxCloIOPlnj6bjwXeZ2+wwL6s+L4ZJDXi9yZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JabvGgDgWqdR0IDOuU+K9poRDfqL5D22KKKCjXzD/dM=;
 b=naXCDcVSyOIba4SG9FG6Zf+1co8G1wqRjweAxL6YGTTV/DsS5GAjVeLYPU/w27LGykfmvgcoMLqEjrCj96E/rKuNesAKlNHhnoV4Kw53gN99BrtoPFDXfAjsjrBalLjVlVJ1OoR+wiNDQ54ZHs/QbtNpcuux1n29LBP9aX2AXgod0MsZmMS3rqwp/0AhYKk/laLCbfGGxw6Nj/DuIysybBkaADdo7PCNsfosCxq10sVA9IlNIHqCtSNWwAPtU9SRKn3QGVIHSSXvrS9ZBWtQI4ItbSfMd7ehShZ14zRxIfLGm/KgHuHziMZdUb6d0aN3RBOJJnlpPSd6j10cwGRfKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 1 May
 2025 15:08:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:08:24 +0000
From: Zi Yan <ziy@nvidia.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] driver/base: Remove unused functions
Date: Thu, 01 May 2025 11:08:22 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <0EBDDF27-E05A-43D2-834D-987D6228A516@nvidia.com>
In-Reply-To: <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:408:f8::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f51e386-0a51-45c7-2eba-08dd88c2050d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZVkeupJs5T9hzupWw11qTu72ETFUZ6MJmM86x6AdjXJ1xVITbWyFuVy0Smkq?=
 =?us-ascii?Q?23Bq4NNX/mC1AlFbGA2xXofNq//BBO5GznmJMnueDOw7EBeugBo3y1oaHwEG?=
 =?us-ascii?Q?1dn+mveJ9g4+kNTGQ6cN/D3LL4xkT1OoPVSGuxia8EfHaDLhKbXsUHxL7FgW?=
 =?us-ascii?Q?5jEQYQ6LYZ3JC64S9a8/KJRkXlHCvd0ueipOQP7zD30AA1Ji33cYKAltnzLD?=
 =?us-ascii?Q?MBo3d/czdWvMmg7C3X7KxfrdzeUnbv2ZiwgNsB39zVp0YClpVByF+ZZ0ku1s?=
 =?us-ascii?Q?xN/Gt+Cd924hi8Kg8T1DaDK+eODOGP1ydnW1DhiXSnuc9SS8GvaKFowyRY1M?=
 =?us-ascii?Q?xFpa0KIgxAdkbwzsD673ngEK+qwhZoIdvuf8LU1MJZMIcYc40Msa4pdJi8oX?=
 =?us-ascii?Q?bzKtahZMxxDtI0W5P+0NwNo4hfyLAqySQlpaohyBFaiLog4F9IqAjcRZlXM7?=
 =?us-ascii?Q?11thGF+u6yXqov1/7qQUKWoxzeRBodb8qTLH3Y9nJQNRpMV8EFvrEQAQN9Nw?=
 =?us-ascii?Q?g7vD0DrVAQSnixCfqTfKqUMyivnD19fd3RupFqjlc71FnpaHjaLaiV62i69w?=
 =?us-ascii?Q?I3ZIQrlNRsZFU7ysOyRrTeTN4kDu+Ef/TcPqOCFv94oYau+LTB8p9HTEiA54?=
 =?us-ascii?Q?54a9S8SIOEms6zR6+30NwMSrupWpOPApXv/lmaixzdBf2x+FJJ5U/MHww4EZ?=
 =?us-ascii?Q?HQiQMaku5zsy8QcyOVpicY/gTgfslq/Jt4/FgzL7Pl+HzYAXdteHEo3jlHis?=
 =?us-ascii?Q?omlJ99iJFRrn8H7rPEl7/8wXJB/FtS3YPByMfExlRMQP1fxmwOpHMJH+p/BI?=
 =?us-ascii?Q?46e8bYhnlS3nG4EYbjA3FbzgsKeFlL+kf1Bq1LHMmugqRi10UNF2Ruo04uK5?=
 =?us-ascii?Q?0BgRn9TQZufJlL7IgYCZlXTXvI9a7WNn919omAxdO4qT2fRL71JBx90erI6I?=
 =?us-ascii?Q?oGDmt8S504YZtvucG2vgsUow3aiX6nZSUSJr5ektaR8EOv9ZBeM469Vji3wD?=
 =?us-ascii?Q?1j/8WQfpGRn+4UOkpSCxVNbCUn2Ch35yor1bdhpsgMIjeIvNz7vu4vTG+1jU?=
 =?us-ascii?Q?E61qwnBa3mUgS0GLW2UBjQhLnVADYSY38Yb6/HlOm1ZWwPW/h7N8YS4E6SCI?=
 =?us-ascii?Q?8XMtwWOSeu8lVMhdKUOS2FUQ2dTBvJK8ambqtPD7iGy15aEeryirGCBGcllG?=
 =?us-ascii?Q?+CitpPY7g+9hywWL3PptrB6EGQf2HudHbeL05purmLsUqN520H7Hcz0bGQiu?=
 =?us-ascii?Q?aJHFTwUzxZ1Y/RNKUmP2oj/vaIrvyeRerkRpi7YnQaT3qbGhlOrQaFZAeIz5?=
 =?us-ascii?Q?SWaYrpvTs4xIVJBeTNebSSZQKc+31LHOn3ZVNbA/2QkqAbBBupv3MEiv2NIF?=
 =?us-ascii?Q?L07iHnwXhFndyXc+HceE+1RBIJAv4UAjGW1Z43u4mbon6calkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9+4XYLUh+iuOgMXKQFf+32IMRt7ux4i3Lbpchr90xmGZ4Aol8r/uWtyhdEdl?=
 =?us-ascii?Q?LX04I40FGJdQ/SkZGuHmVS15CPRBi0L8wNCdyahay3uABlwQqCX1w0260GfE?=
 =?us-ascii?Q?Y0LPTIdE1zXkg6Tci8swGxnQFW9kSUAYDPb+ZmekYUzAwFKOghQnxk17iUzc?=
 =?us-ascii?Q?p5dXQln1kIJRuMCh9rRp9P0m9NydLOCU4OszcNz0M5yLgZlSOYDRUOYoeFqY?=
 =?us-ascii?Q?RR8wgCtgu5i0aiACix7zIkmgwJE2qc9tYcI/yRoKXBshojNy2Ut/RNp+S7wl?=
 =?us-ascii?Q?af2jcL1aJdAAqU0HZP0oJrLMkDFJsYgMUorVVAq0rJyX1MXIchj+Cdppku6K?=
 =?us-ascii?Q?wDbcHlX8iHILqFl7PJgGZdKBb+ekil74YNPsUfg2sHBDyeC15pnxNn2woss2?=
 =?us-ascii?Q?s+IQWlmaNupFuQJ/qsNfkT9tQSpew1odP8dIjmYSat5MKNg6PJvz/1IXDyXh?=
 =?us-ascii?Q?RsamEB049Uy+3rrP+1zErbx/3AKAzPHRQviQ5PxON/6Nh8s5nqEIdRWzrEwY?=
 =?us-ascii?Q?z1WKJ93Qt8p7eQENYdZwEzL749z3lh41Bmb69afabmKlQyGLvchbCyFzks39?=
 =?us-ascii?Q?OTYn7FHHK9Joj5BRJDOr9cBiaAa9QoBYhVR/VIlpnBKRl+vpJ9f3PWhBDJSp?=
 =?us-ascii?Q?vmDppo8jomXaze5oNSTIUbrrwEUvGzMeBkvUVZ7PFohq/Vh0AsbYj09bqpr2?=
 =?us-ascii?Q?IoiCUnHsZjakfMbTDxZJ2ITOK71iGRaEdIBzR22n7tGwXc8cbao8MsTxNxfu?=
 =?us-ascii?Q?DAm25XG5TB607Tzm5PaRGqAfuRibsMf/uuR78aJj3Po42b68f3HmPOyE53u5?=
 =?us-ascii?Q?Vnuq49A0UxYaAfs0TuTh1FchSL8JNXgCWNf0BngLUC+ath3faJs8fmYnjU2w?=
 =?us-ascii?Q?odRPRAvLCZ4mG1jPSelHAwR+DGqTFDqTlVLZkESMweUrvvt3YLtVBMwqjkX0?=
 =?us-ascii?Q?4sQ2R1poBHBL5UHJNLB194ACGMPgBWaTS8iFUJsw9ZOJM/+YQ8qxXqnYQSi5?=
 =?us-ascii?Q?8yRytTwlvo45crlJla2YyhGT53qbcEOWBuIwebp8kbGDj1Wk+aXZnQAnfNhg?=
 =?us-ascii?Q?uKqnXqKDsYFNp+e8QrUOJ9hjycvSPk2JrtihmzQHwetDi42STodOJmQ5YkrY?=
 =?us-ascii?Q?QWlGwGSD2iQvyOlU3K3fRwMfMBY/7/ci/uTYw78M+6Ul/5Jb4GjqJEkadeKj?=
 =?us-ascii?Q?4KjT2JWNgtlAjxRUr69y115BRqw1kBJGR2l2AnMtCNM8GL/jqZEO18kPCS5w?=
 =?us-ascii?Q?QJcia4zTAuM/eYBGwZLvpJSJBHoE6k8JQ6M8wsDNw39+2v3VzWjERXU07D1t?=
 =?us-ascii?Q?aYVS++OERtJ7EMY1QYke/DgfOGjuPhE4qNsvMSGSjyKAY+imWgBtlyN9D9h4?=
 =?us-ascii?Q?qRm0hCggyP7XPmh/25bfIY2ni+m2QepS87GN5mJ2bkL7LTSRjUSAQgzXGxqO?=
 =?us-ascii?Q?XmqN805T8YvnPj5MpI70VF9xh1M52hp/Ic9SzGNNJlcW+N3FpK/4UYbir+Vh?=
 =?us-ascii?Q?S2CXjb2bBUF7X8ktHrVWHX9XN0m9kxflcXJBqv5/kVaxBSaMlsI/8qAJvLjw?=
 =?us-ascii?Q?AQLp5Pw2NiRp6g+oh5W7NGWaINp9aB0pKvuZSyTG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f51e386-0a51-45c7-2eba-08dd88c2050d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:08:24.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyKN7664+ezgUYzqEopBfV0FZdheVTn+L+p2oGqjFvgLVSQwc6zfL2ZnXqRaHcxx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214

On 28 Apr 2025, at 13:03, Donet Tom wrote:

> The functions register_mem_block_under_node_early and get_nid_for_pfn
> are not used, as register_memory_blocks_under_node_early is now used
> to register memory blocks during early boot. Therefore, these unused
> functions have been removed.
>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  drivers/base/node.c | 54 +--------------------------------------------=

>  1 file changed, 1 insertion(+), 53 deletions(-)
>
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 4869333d366d..59ec507fc97d 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, un=
signed int nid)
>  }
>
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -static int __ref get_nid_for_pfn(unsigned long pfn)
> -{
> -#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> -	if (system_state < SYSTEM_RUNNING)
> -		return early_pfn_to_nid(pfn);
> -#endif
> -	return pfn_to_nid(pfn);
> -}
> -
>  static void do_register_memory_block_under_node(int nid,
>  						struct memory_block *mem_blk,
>  						enum meminit_context context)
> @@ -783,46 +774,6 @@ static void do_register_memory_block_under_node(in=
t nid,
>  				    ret);
>  }
>
> -/* register memory section under specified node if it spans that node =
*/
> -static int register_mem_block_under_node_early(struct memory_block *me=
m_blk,
> -					       void *arg)
> -{
> -	unsigned long memory_block_pfns =3D memory_block_size_bytes() / PAGE_=
SIZE;
> -	unsigned long start_pfn =3D section_nr_to_pfn(mem_blk->start_section_=
nr);
> -	unsigned long end_pfn =3D start_pfn + memory_block_pfns - 1;
> -	int nid =3D *(int *)arg;
> -	unsigned long pfn;
> -
> -	for (pfn =3D start_pfn; pfn <=3D end_pfn; pfn++) {
> -		int page_nid;
> -
> -		/*
> -		 * memory block could have several absent sections from start.
> -		 * skip pfn range from absent section
> -		 */
> -		if (!pfn_in_present_section(pfn)) {
> -			pfn =3D round_down(pfn + PAGES_PER_SECTION,
> -					 PAGES_PER_SECTION) - 1;
> -			continue;
> -		}
> -
> -		/*
> -		 * We need to check if page belongs to nid only at the boot
> -		 * case because node's ranges can be interleaved.
> -		 */
> -		page_nid =3D get_nid_for_pfn(pfn);
> -		if (page_nid < 0)
> -			continue;
> -		if (page_nid !=3D nid)
> -			continue;
> -
> -		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
> -		return 0;
> -	}
> -	/* mem section does not span the specified node */
> -	return 0;
> -}
> -
>  /*
>   * During hotplug we know that all pages in the memory block belong to=
 the same
>   * node.
> @@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, un=
signed long start_pfn,
>  {

Should this function be renamed to register_memory_blocks_under_node_hotp=
lug
to reflect its current implementation?

>  	walk_memory_blocks_func_t func;
>
> -	if (context =3D=3D MEMINIT_HOTPLUG)
> -		func =3D register_mem_block_under_node_hotplug;
> -	else
> -		func =3D register_mem_block_under_node_early;
> +	func =3D register_mem_block_under_node_hotplug;
>
>  	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn)=
,
>  			   (void *)&nid, func);
> -- =

> 2.48.1


--
Best Regards,
Yan, Zi
