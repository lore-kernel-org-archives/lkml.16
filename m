Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB99A33993
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124342; cv=fail; b=W2F/pg2DGY0znzeavt2ky6O3aD70i2D2PUBFCOApZrWitv6oiEvfYhQguK33lVivKeIUnN5+OdTP0+IdowX4xfnubU1W7OGFzAYaV3NL7G89bNgPyi7tEc+N6HmomzZPwTl6PxzjH2CxB/GjZACjcv7/pDu3SwufSNeBdoqYZLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124342; c=relaxed/simple;
	bh=Hv3IYUlIw4OWDpu+0Qr8wB4ecFfET34Z6N6kRijZutA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q5l+9/RIBDWUxxKfOSA6pmln7HQHBSBUnLBPdYyVLuiorqKdoP7bYr9s1LPdGM4SKqF06PjfyjK+2fz7+eDfv8MSzV5+AZf7283qQ0C5H8XtkL3OwFCWf+GHl2RoVJHFjYsCSMop+s0K2AEMGpUmvEQZTAAj9cUCXdqhZ0osqVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FBR3BEKo; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBR3BEKo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZAXSbLXyJlFS7Jaa9EK6U8ymAXhfhwCkejidTukdeGyrNqRgfa9S3B/IQ6lg863HUoafuhXN/XZ5fLj8lII6eJV95yOtCHUbactexDEbo3vm/DpftN4QR956fjaM3TmCIlaMhiHs4cafuuvuMrQI2RgzKMkXV8oKMsW6LYT1x9skpGzuADXldOCcb34eTLlofnvjVqKR7wYx3fUMgIZ1u3p3O6N6LWAOH728zqNiDLU/DfPpTAHyTd2Op9rOZJjWRCw3pf5ApoEeI7Rc4S8N2d2ASWbdbcq6K35PLv1m9RtD7N8smy0yhPwW1xLTAyuRH6JwSZl9Od4agYjPy1Gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDCk8RUJFW72w+AVAkTcwgjBdwhivz+XTea76frnTgY=;
 b=zWXSFkT/dRp01nNHJzed9RCmfbQhZNcxqFLWZv5XuDvRa+D/qH0YeCSql57DrTkyI6JFV0EJQFj7P2jnlBOxA48k+VYE/xwKZZWwB664rTAMWZf4rw6rtH6igCzxZ20xOoR7ZEWYEiaGKHQo7YKkaTLxEK0u7CNydKXVF/bOOZ9WSpafBOyqpKsgydGAHJeGVDa/Fv/wfiFVigvse0/EUoWwkR1KLGGPJxMlA4G0luc1db29+CQnpLaYf+9hJuaMzJtxWuPTZMMbwIqD2vF4FwkvtdFAC/NHX3Hy5VIPj1Jo+YadgxIS8i1rWr3A6h9NBEYvJxAEXgEje4bTK7kCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDCk8RUJFW72w+AVAkTcwgjBdwhivz+XTea76frnTgY=;
 b=FBR3BEKoqGT0Vq/j7OZbHkLsN3ViXQCbdKCoQTqGXJv/FQq277xej9N8dselYllHlAQEvaCFjC48E4AYMYqQPL/INZuJeE3lMIEnxNRgltySikdD+/JdnOqbaTfKiyCWSg1g1kIkuvFo+EUsGSokqvL/XgMk80MTMn183kMumYtogML6h37IBZ/KrTX4NR9zTmegr5DOhf92j6S6FmyYa8cyYdotpvC9c3puafLAyw1HRcBunD/gE2JNkqP/ShDorvRtpIhaARhbpa6H9JVCrmi0gkBOZ1+jO6U6V1ZSGUSFmHlmDyFgIZZst50F9Dpm3kJPHZwiCnd5eaDCFUNe8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Tue, 17 Jun 2025 01:38:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 01:38:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Mon, 16 Jun 2025 21:38:52 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <B31AAF03-1997-4449-AAB4-66F4CABEFE57@nvidia.com>
In-Reply-To: <20250616183755.16fbdd5e867752db14e321cc@linux-foundation.org>
References: <20250616121019.1925851-1-ziy@nvidia.com>
 <20250616183755.16fbdd5e867752db14e321cc@linux-foundation.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:408:f9::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 094d29f6-e490-4226-adb4-08ddad3fb8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3mZN9SB5kKxQ2QhN4gPO1rtkJTalQr0aLjA6G9SNByHPsgbf6j3w4RXjULl?=
 =?us-ascii?Q?BiEJxwJ0yFcuj9M9IWcHK5w170IJsSm1D6EFuYd5F/27D8GJtgZsUFDf/+Ma?=
 =?us-ascii?Q?8+B0fBIZfGXObv/jBt5rFPZyCJzy/ddZVza+krveroztqxIm/Pg9kqGE7i3d?=
 =?us-ascii?Q?K4D0wyno8HQCc4bTG/RhPC5894Gdkr83jYHj18hz9Lg+bAsko5a9lkzQ7/uf?=
 =?us-ascii?Q?W/67dd/utBBnK6aRAIC1JwWc9H+CWYFU37tMt0zSaIpODQKoYJwcxeIQvdof?=
 =?us-ascii?Q?/ZNa0A5vGs1cuzVkPWhhLCG3E144yj/ZW4Lcl+YdBlorleXDRy7JKcRpMEQR?=
 =?us-ascii?Q?S8Z5tMRWP80FRzM4/FB1b7BTuK3QaGaWIMO+foGFkEkbPlaofVRxYNCHuG3L?=
 =?us-ascii?Q?u3RJR7cE1ShnfE5s/NlK35jgHsujRzhq2lHseSdU0YQEFmvqeVejMmSjRWQG?=
 =?us-ascii?Q?u+foNC4+eCqD+VpFw5hg/v8HNOn3oHgkeDEiEcgwq8pZ8A8S5Pwrq0ve6COu?=
 =?us-ascii?Q?0IoV+1xh4d4HZ7T+L+m36CLZ0MWz1ndNvKEZNUFqzuKxFMbnisY4dfPfVciP?=
 =?us-ascii?Q?RAy/Av2/rVWQem8L5w/Y5cix8ZYjRVr9nm8eAtzr+XtTTU8g8W/tJteltVOu?=
 =?us-ascii?Q?xbGRvBVRlo/k0Zzfuwe+5gGb1HR0u9dGYqRz9ts+zOOLujhINV+EviqcXwMx?=
 =?us-ascii?Q?OJMSQE75QJMXAtHDJNcboeIzjzERYOIWy4OYQDBJYpBPTca9O7B/IZEUV7zM?=
 =?us-ascii?Q?CSUx2RtvbxfMt5cj658J3y6VLcNpnTYPV+SVuY1Xf5bsYxYJ3rnc/vC1Ocp+?=
 =?us-ascii?Q?fIHekvRlEccTdGxKQBX5rt4NWszl++VADjFr1+LfHa5gjNxeKiM3QqSXLL+W?=
 =?us-ascii?Q?9kDsYGJ+ypwf4DEjhmzn45RKk4dWfGqVARWt6IgsLgaq/02dtd3J2/s7744r?=
 =?us-ascii?Q?h/rUZo0K3Vh+xRX1b63xAREA0BYVhGSTm3RMZK5koHYwipKUQ35mE6KFnsl6?=
 =?us-ascii?Q?3AJHlctCf9KUxmixXl9ViSigJZMmBLrVM0VMOLUaIP2w9uMMLq5jX+g1WUQ0?=
 =?us-ascii?Q?i4YhsJbAm0tJ6Gud0ioHE5nKDtah1+v0Hxt4MjzhdgiyHuNAUi4yYMXanpPv?=
 =?us-ascii?Q?Rz2mQqvA+Q8yfy7oqYhliBqe48ZU2Zcx9e7UNy6y88ovFkSEswlUqjXrSDsL?=
 =?us-ascii?Q?KQW5i/wjQR8XrfNVVQI8QSi9i3ei1rO9lSZ03mqPHsY8LBkJbKaFcrtOsI6H?=
 =?us-ascii?Q?hwpkEpzwuLXKT8zvSBqqvLhFu/i3M/uKajMbQNRM+TRsy9ld36PqrglumksC?=
 =?us-ascii?Q?ecFiAxijsrkuD376JQszmIJ23sSoGvfiApHWPXovmfWJnn9h/dF4zG/OwM1Y?=
 =?us-ascii?Q?ClWUgZY3ntG9isxTR5f+v2V+odfSMfHh4xU7Ve4mm7eohoCHSqP6a1pHJBQy?=
 =?us-ascii?Q?3TPd3jH5afA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gx1e+tprzRCeZPn1MkVt+M/Egz8HiU2eMUUmDtlQkNMdUhfc3NIqPsv2DyDV?=
 =?us-ascii?Q?tEMkXuEK8IxOg4k1EvXYJ3BrVfKyBXxpNh5RDgf5DxEa+UI9rDdtHXbgA5pa?=
 =?us-ascii?Q?LuoO+TnOwrUscW0safqLo1dajq2Qn5DOXFvQ3raUWX7FOyiLXoFQOPtxcwK/?=
 =?us-ascii?Q?Cq8reBnYhrRdqYx4v41pdXV8OMjhG8eWQR3dyo6YoaXanKqxfYPlf1B3vezf?=
 =?us-ascii?Q?PZrcfqFtspUBLByJA81uSa/QdIEy91HbCWEj+iZV21Qy7zT0azWeF/658k/F?=
 =?us-ascii?Q?xbVXJPeC7C1jr6TQ9Jq0a9sq1DZzzDoWmg4ppSFjL0n3pQqAEg68QJZWfHfu?=
 =?us-ascii?Q?AQ7al8w90UoFcgtCncH3c1kv/mRJ7D55CVSeqMWJ19KLHY1td9B6/I/PGVrD?=
 =?us-ascii?Q?71q9zBtYdKZWSEhvKn2TriBYPAl6xUMIupvQyHPr8SIloXNfTzAixR/e+XSG?=
 =?us-ascii?Q?QJZkFP18eh7yAsLEN5QxPjxikdu2AFwaiFYP3VCJ1qxDzfGpyBFWLemaIrJP?=
 =?us-ascii?Q?L3zvDpUKnmuMuyygGxzqy7ZrvAgBHRcZv4vcPwKzsD+yS5/GOp0+zq+HaNJO?=
 =?us-ascii?Q?N4jH4yr9xpOxgCCUwYX+fjXjGISYDnS2Bh9G+qOluo5CxaYy2IEpByXFJCUQ?=
 =?us-ascii?Q?mu+XRumWxbouIRmOLEyAXkrec/7CoINo9ZtL2J+udOqfq5DPcsqlTZDcOGoq?=
 =?us-ascii?Q?1A7wZiJ0o+FIwydNYxUMFyuyKu0oyJpUAszt+H9q3KFGTDg1YzM8XGJ+FZ9J?=
 =?us-ascii?Q?TCfdc7kjsmI0Oc2aWqcg4Rf9ybFa/PNX4LvISqiQ7pk0PbL9ohKid5vR71Nf?=
 =?us-ascii?Q?UjiERoqbCL1ZpKPaf8OpZq4YJKcAddrJqRvrWO8CynQ2Kyn4gIrOLAsEF2ZZ?=
 =?us-ascii?Q?d06d1KfPyf2s2DTTiv5UYeWWzh4AXFtXLj/yVxukvTTZdQtzzVtMMLm2nIye?=
 =?us-ascii?Q?VB2JqzBinkKAXtHk5X+Wrv4/dNHgai7GyB9EaebWP+mCh53Wpo/igCpstUo6?=
 =?us-ascii?Q?KdpLNO+2ImhCUAIIsmXaIj7SPSoIJrPNhtvbBiUHxtWLFGzJQWoYdEUR5c1d?=
 =?us-ascii?Q?P2NzLFaDZ2P+gFNbchg/lhjTwmNv6mvq7L1qBu9s2fxBuWlsZV93+FYe/TXB?=
 =?us-ascii?Q?4hYW5oF2/4hNpP1B7imOxUZUCjp1KD78+YYnJxwa0W4sxxOYAIRfu4KAq9Xt?=
 =?us-ascii?Q?F/ehlCvcGKVhr4CIMYLel8oq0l9uiqhRqf3SyuLVxVmFrGumD99wWK7aE6Rz?=
 =?us-ascii?Q?i4d/rVlKRqD2KHnMow2ZbLzi77/8eX+6bd0bNdqdNKqvOJvhFTOJWje1eDPx?=
 =?us-ascii?Q?gkH9u0jAizJb+dZJVz8RyyecAcK2UtYvjyRgV6r9oUivwK0a/EpAo1is7Zo2?=
 =?us-ascii?Q?GWGGjwjermvOna9yaY8wzvsdztArLXTKOkQSk8PHP2IsEDxPGHxdZJJhbQlG?=
 =?us-ascii?Q?otxQKzm+STUwFeYQAEYX7VQBfw6bGAqXvKurVbWqEK1dTHXE4ULSowHPbMyA?=
 =?us-ascii?Q?EOG/wOc1n1nizWjza/hlV3Gni/+FcS0rVHVyibcS9zP5paIpxm+gyphBX75L?=
 =?us-ascii?Q?gVRgPkbJSk7TyzgeA4ygJSK1AE5DYXjVVF69BOUk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094d29f6-e490-4226-adb4-08ddad3fb8fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 01:38:55.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubXMj4qFN7qy8UW7vjZwhZX/E9Tvv5GkzlpiFNbMXcnTTO62nXMOrC55Bb6ybZ5A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744

On 16 Jun 2025, at 21:37, Andrew Morton wrote:

> On Mon, 16 Jun 2025 08:10:13 -0400 Zi Yan <ziy@nvidia.com> wrote:
>
>> Hi all,
>>
>> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
>> being overwritten during pageblock isolation process. Currently,
>> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h=
),
>> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
>> migratetype. This causes pageblock migratetype loss during
>> alloc_contig_range() and memory offline, especially when the process
>> fails due to a failed pageblock isolation and the code tries to undo t=
he
>> finished pageblock isolations.
>>
>> It is on top of mm-everything-2025-06-15-23-48.
>
> mm-new would be a better target.  mm-new is not (yet) included in
> linux-next, hence it is not in mm-everything.
>
> I hit a few issues (x86_64 allmodconfig):
>
> In file included from ./include/linux/slab.h:16,
>                  from ./include/linux/irq.h:21,
>                  from ./include/linux/of_irq.h:7,
>                  from drivers/gpu/drm/msm/hdmi/hdmi.c:9:
> ./include/linux/gfp.h:428:25: error: expected identifier before '(' tok=
en
>   428 | #define ACR_NONE        ((__force acr_flags_t)0)        // ordi=
nary allocation request
>       |                         ^
> drivers/gpu/drm/msm/generated/hdmi.xml.h:71:9: note: in expansion of ma=
cro 'ACR_NONE'
>    71 |         ACR_NONE =3D 0,
>       |         ^~~~~~~~
>
>
>
> And this was needed:
>
> kernel/kexec_handover.c uses set_pageblock_migratetype()
>
> --- a/include/linux/page-isolation.h~mm-page_isolation-remove-migratety=
pe-from-move_freepages_block_isolate-fix
> +++ a/include/linux/page-isolation.h
> @@ -45,6 +45,8 @@ void __meminit init_pageblock_migratetyp
>  					  enum migratetype migratetype,
>  					  bool isolate);
>
> +void set_pageblock_migratetype(struct page *page, enum migratetype mig=
ratetype);
> +
>  bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct p=
age *page);
>  bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct=
 page *page);
>
> --- a/mm/page_alloc.c~mm-page_isolation-remove-migratetype-from-move_fr=
eepages_block_isolate-fix
> +++ a/mm/page_alloc.c
> @@ -525,8 +525,7 @@ void clear_pfnblock_bit(const struct pag
>   * @page: The page within the block of interest
>   * @migratetype: migratetype to set
>   */
> -static void set_pageblock_migratetype(struct page *page,
> -				      enum migratetype migratetype)
> +void set_pageblock_migratetype(struct page *page, enum migratetype mig=
ratetype)
>  {
>  	if (unlikely(page_group_by_mobility_disabled &&
>  		     migratetype < MIGRATE_PCPTYPES))
> _

Got it. Let me rebase and resend it.

Best Regards,
Yan, Zi
