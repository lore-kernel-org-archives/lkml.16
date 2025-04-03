Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1945A24EF7B;
	Thu,  3 Apr 2025 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696610; cv=fail; b=tj39aCHurkAXaLrNHUfFOpPSnFwEmhiN7vPqWra0lrjlSLNIAJ3Y1UXronNp8zgDRsYERAhpxwOiMyqKE1ol4cSa3wQiVnPJ7GJttQJahXNIAHLB7u0cet/FFEowKBDqrDV6NS8yyV1hmANmKNfl5NP6flRIAKt2YaH3up7MzUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696610; c=relaxed/simple;
	bh=GzlnfSFGNXx635THC1eDk2107NvKxeprJ5dcO0eBJcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m7eX/ZCOT1eIIoT8GuSuioGbNo0txObb1aQDI28Mkb5W64jZfbOoXrTT/cpVANWCBc83UIUQ5uZ6FJeaKi6s8LOTqBYjuCc73BiubOto1XoPe4uBubw/A/tUsrvGmfdXmdOQznKOUO5gp9nh5BQC4fGGiXppOtS64rApUTYuxis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K+9U3XOx; arc=fail smtp.client-ip=40.107.102.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K+9U3XOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYLIpGboifHlJ4FUIOVaQemr5j/YhWeU8MBsBY7NM9BoXu/N3NCcyJZW4reXLsgc4G9GM8KmgypwF8pgITCySoGl7OsQ4hVDJPmNxdb1/s5/X5b7/wyuLVtVIPMXCYFcvt1AfI3q2LouR2/mRAAask2Je02M1059VJfp543UmdxDCjcI9qqEriES8+16IyxWvLrrliSOXGScW+J8QbGE+VY0xSXPZIGx0Cu+Nmg4NR0OsWkjkajxlyJCDXksATdhLHvL4JfJVLcfEmi7OHI0yYpccgA1xHNz3HFB2k2a42S3RJIZOFM0lh1RcduLhHJUylZ/9KD/JalIryahpEkgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy8Ws2qvwF9s55c8ff5LGR1nvZuXfJj+iEpUvr3iHP8=;
 b=OCMQS+B2YbCDEu6+awANYI0k7MSAiadpqmBAYH8xCLS5y4hZkLSg9D8el18dr2GKDXFGWQFspHwJQmsllXkP+zAjh6BAYJhFSKF8N3kJkrBAXbItilFsf4g88EA9i4uoLloIN5/bXlUUFf+Hs6+RI5Te28V764RdvbBwTCWuzYGn4HEy2cwL553d8Pnb/KdHHbB3W4DDpRFNjNmNzC5n4giWwqsISFkyel3BqXb0EsPX086jceVBKnXQIv2Dy7f2RQHHFUU87x96lOt+XhlwSZi4FGV3aIMvLeYU+1fOAdvPmswTPaIq6OFUOVGX6Pm2nuAgJ73Cr6nYQYzUj3qu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy8Ws2qvwF9s55c8ff5LGR1nvZuXfJj+iEpUvr3iHP8=;
 b=K+9U3XOxJQAtXib9UDfN3h9WU6WSBdjRQeu5p+LsPlPdqaKYaqoP1cRZKmChrwIW1Tlwpl5J18pdgL7xevx2FWAz4gZupsME09ey03WXfDRJZOKRHVlKqT1/hfNP1zSLIfBp0VJ1HDUeSVFyMbAJJwm4mCTeX9trhGqyysW7jv2G1D/uFsL0xGPv7A39mWh+2YZz5lrA975FYWvRMS/BS59ljbRfFY1j/UvPPgxWILW6ciqw2YwXCrU4L9zJPEm9TF8T6EmsSj5eZbXaVvJQnawnv8GqMTT5FHEGIk41g2BrhB9LR0jtii0FsZSaiBiPK2r/HW5qgzF8IwKS3kNbNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB9253.namprd12.prod.outlook.com (2603:10b6:510:30d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 16:10:04 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 16:10:04 +0000
Date: Thu, 3 Apr 2025 13:10:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, rppt@kernel.org,
	mark.rutland@arm.com, pbonzini@redhat.com,
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org,
	robh+dt@kernel.org, robh@kernel.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org,
	tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <20250403161001.GG342109@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs01pu9qm6r.fsf@amazon.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs01pu9qm6r.fsf@amazon.de>
X-ClientProxiedBy: MN2PR19CA0022.namprd19.prod.outlook.com
 (2603:10b6:208:178::35) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: c45ff6f4-1ee4-405c-40b0-08dd72c9fe05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6xYbAqi6Aw8/7SB4Og7F26++lyFBodEmTy+7/tGEfbe/i7QTlNUB2LWNBT8o?=
 =?us-ascii?Q?TrK/wFTar7zwoyxAK7vhI1sbae4ib0kq/fPzWd/Cnwx4fdG1XVxxiuEJY5uo?=
 =?us-ascii?Q?N7kLjNPI9rXkWr8WoIqeBQV7OKKTBMtaV8Xr++kRPWfIAk91niaZPY8ky24T?=
 =?us-ascii?Q?3rDPbsZVrjlkbiYtSu/M0W1gwpvrjokTJRw9gVNIS6Huv/M0J8BvenuS4eE0?=
 =?us-ascii?Q?TpYLvOdxV1YnwqxlPpTlw4ItKaeHCWv3VMe/SwkgpNFGG5cfxWw472aFpuJL?=
 =?us-ascii?Q?rvG8UtEPmF30Bx3rV+jmqlWwm0jLIZJohyZay3DObJKYZkSqi8WV7Mv6tviS?=
 =?us-ascii?Q?dXuZKEoWt/giS01sAnUbDMgKn6kNM+vqrz5LH/p5xRZtH/nA4I5C0zDqGuoI?=
 =?us-ascii?Q?ol9HcWNjqKROlfgAz3wbHhUPdsd5GXr3YelKjrTVyJXcJB4/pDrhJChSuYBu?=
 =?us-ascii?Q?DLDZBOi63Vt7BZ6W5jrMIAOAT9/0XUN1Drbl7RtNuBegEurJOmHOzA3txXgR?=
 =?us-ascii?Q?BS4xUGD5C/i12CwB5mYUoYH/SI0lmVZUyzfvWLfXD3aqvYZ/RHy8oVNeddpZ?=
 =?us-ascii?Q?cSLSMgA9ZHz0X7CSWc8k7x8t2Qn2ux/Q3nmE4SOb7QJuIKlLeiYK0pJo7uU/?=
 =?us-ascii?Q?neGeA0gIDedJqyoUvzFhLAbefyNU80qT+KwvH6Ria7TMVY1QwbH9PeCQfmWV?=
 =?us-ascii?Q?g3Z2/BhoMVAI+n1qM1m2DW5kPPd/AC1OYxZZSumQZ8RjL3P/srtyS5N9G5cl?=
 =?us-ascii?Q?Gnx4BjKAqSnbiFZyzmygv+Zt/WB+d8ENf4uJzgodOCGcvf7MqPhSxo2J0y53?=
 =?us-ascii?Q?szHYxyg7P1jkg5uZFdrBHxGE4OQyJVnSAsXcJBXgjF+iFM4GTVIGBlKtdfJn?=
 =?us-ascii?Q?CPhEHo7lbd6NxoolJ3YbBmlDyv9vYTddfBigSBtjls/hmBcUca3p4wziRRaH?=
 =?us-ascii?Q?T8Ciy1yTsezMbYwxL/6cy4r3F19u8bTJPrWnAmuonFSNQ1ZDykZRjL/ZrID5?=
 =?us-ascii?Q?F6uszrNaJrwqALNJEfy5dNfLxOw7aLHzSbj2iONKmmWbW2g7c+6I2eyUmWDe?=
 =?us-ascii?Q?bvJyAVvoR4ejN1zULR9u6mVQ3Xr/TtVN7Zkmmp7x54UfbgZxKa3dcQvcBWvo?=
 =?us-ascii?Q?HPc5H74UIxnFTtxD5VUf2joGXhvls9CnaTyR5LAdyp1SHtgZlI6PakHmitfZ?=
 =?us-ascii?Q?QIsbK7eK/HpRaGh10G18SqBV7HX4Der1UUcsmyebM0tFldYJ/5MyhHHjaj7r?=
 =?us-ascii?Q?Q/l62VqSFHa7O1Uhza0PdKTpaMK5gceSrGOKZpN8WOSP/n497jFTPk3J14kA?=
 =?us-ascii?Q?onR8sfARLArUcGLNqG84gIP/AmwBkYYB5dpAZ+T7LOpvAJiN2cZcYIcTl2aq?=
 =?us-ascii?Q?NhMIo3OZrPn0JETeugZd+I10KHsV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MhN+ZW5cu9F6EVNfOLuqD3jAKfHNAcEZens0RUrzBdSemNMUBTMryuVFnsoP?=
 =?us-ascii?Q?UDsQb2WvTXQs4HEoMXkJe6ORH/qtv9lr3BUba4FpCU6vKYNykVBORTw6cGS3?=
 =?us-ascii?Q?+DigSrxuLr48VnZdAoybPoBxjAHBfE732QUklL6xlBHAOdLvlphfGdiMQXc2?=
 =?us-ascii?Q?+eC430cgbiPBfxIzEDY0GT9F+rnFoW7qdaGta0UrC9n98sPekQWMBXGhwM0l?=
 =?us-ascii?Q?RLJ5a+2Ek50c/ZO22XmkfrSyLi3f4gQhCW/20ohpIcrcH5KhbRdSpEXhUdja?=
 =?us-ascii?Q?e3LjxUbJoJx8zFEWwUlCzIaox387x9+AwQcLurC+oMkiqrzQmKkmEClsclV1?=
 =?us-ascii?Q?scFiJ177+aLc9XVPTsnySVeCXoMuOEXM6dWC6HV/aXX9c2vlDpv/QmbnhYyi?=
 =?us-ascii?Q?uCwCbctyKNMaYcHkPytoqOeteOOcSV0wb5QXVxjvcRXc4o1ophOM6yNr4QTn?=
 =?us-ascii?Q?TtWEFU8cqaj+bNi707YqeMf0R6rkF84PSzXDV6uWUwfef/H+sd684Lq0QNRz?=
 =?us-ascii?Q?qJEoLgpeU8OpKb4r6X3JBqrDuvceaZowRBxQtshskNL+hyUFaDZHSkR096p/?=
 =?us-ascii?Q?i9S2/Y0/DdW0eezH4DZXbTG1b5wA+2EHnh/DTGmb5Dx/ag5CY4tgTNlKhsg+?=
 =?us-ascii?Q?t8nrS1hG9nAYSpKpuJ7tSxINyQTMVoUAez74rKgKXth+hqvJo55v41+gGj7j?=
 =?us-ascii?Q?hOkS8Os9BVM/7EStzeoqjtZ1nCJl9RXRrO9OvknFmxccnZRNyO5gP7jfVng/?=
 =?us-ascii?Q?xkkrMDZp8yTqOjlYBgnxOzzXXSI9iegVIN0t8lEfnIKBO6Z1NlnOxLKTliY5?=
 =?us-ascii?Q?oiPBPOzI9XaWfR38mwmrDzBFB+rBV6OSOnl/zyK7J+bvl5wvdKZC6ScuBBsn?=
 =?us-ascii?Q?+NHzDT55YP29V7057CBh4c7DCqsKefOM54LgitbrG+Y+0Gtkup8vrY3gLTCO?=
 =?us-ascii?Q?xbGnuOEVNlf+9367yWuCRg7YTSddwMiPav2O0wwG600UTyMkIP5aO/FuPm/C?=
 =?us-ascii?Q?aReb0OM8GTYfGlTM2FfZA5C0YXLgxntSDHzoCKAQlWOh2r6gotmEYvhq4ZKS?=
 =?us-ascii?Q?72h/ECt9o1zu4G5SQ9gqF7qMdfBroOm7H28Mi1kSdu/QTKi+LfKhmuzYqQ0z?=
 =?us-ascii?Q?hbnyTN1tZ39elgzt5wfil8Nh7bBODZlcUkV9cfN4tzFlS8gozTe/CRAgLqk0?=
 =?us-ascii?Q?ZYLNX42kZVh0hxwtB1PtL6IqG1XA6bxmpCLGE+rhffpF5dqjwXhCiW8G021k?=
 =?us-ascii?Q?c7O1vrnWjrZ3ENE3QFe/5+Ss1CCxYxVh1wvB75RE6+YLgXw7+RpKwsQ54JE8?=
 =?us-ascii?Q?plbs2yoeQgV6ymP+M8/QmHi44ERT7XgtZg+g/QKaGUeBTzVA46btHgoUmV+r?=
 =?us-ascii?Q?qNWldBYSeUZtc6s5GJDHAzAnhIgeA/K/mOAsuPXsUc+FTUdi7bb7E60ssi6t?=
 =?us-ascii?Q?LZtGGBLOM3UMaU35PZZBQm+g1OFV3A7YXANdLtOJ7JFdpfjB2y2lPKq+aYrp?=
 =?us-ascii?Q?kT9+nV6j5ihaz8UiC+GKptNnzH4ipWd8strHi8nSxS/XxrqAspfToThX73IB?=
 =?us-ascii?Q?URPxwK9X4TpenK1/zNYtGL3y/+16zKtbccJD6vR3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45ff6f4-1ee4-405c-40b0-08dd72c9fe05
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 16:10:03.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF0FzqNwgju18Mi95WatwKVID/UAXTW9yg765RHFZWEEAIvTbVZjMcODIfuHXaPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9253

On Thu, Apr 03, 2025 at 03:50:04PM +0000, Pratyush Yadav wrote:

> The patch currently has a limitation where it does not free any of the
> empty tables after a unpreserve operation. But Changyuan's patch also
> doesn't do it so at least it is not any worse off.

We do we even have unpreserve? Just discard the entire KHO operation
in a bulk.

> When working on this patch, I realized that kho_mem_deserialize() is
> currently _very_ slow. It takes over 2 seconds to make memblock
> reservations for 48 GiB of 0-order pages. I suppose this can later be
> optimized by teaching memblock_free_all() to skip preserved pages
> instead of making memblock reservations.

Yes, this was my prior point of not having actual data to know what
the actual hot spots are.. This saves a few ms on an operation that
takes over 2 seconds :)

> +typedef unsigned long khomem_desc_t;

This should be more like:

union {
      void *table;
      phys_addr_t table_phys;
};

Since we are not using the low bits right now and it is alot cheaper
to convert from va to phys only once during the final step. __va is
not exactly fast.

> +#define PTRS_PER_LEVEL		(PAGE_SIZE / sizeof(unsigned long))
> +#define KHOMEM_L1_BITS		(PAGE_SIZE * BITS_PER_BYTE)
> +#define KHOMEM_L1_MASK		((1 << ilog2(KHOMEM_L1_BITS)) - 1)
> +#define KHOMEM_L1_SHIFT		(PAGE_SHIFT)
> +#define KHOMEM_L2_SHIFT		(KHOMEM_L1_SHIFT + ilog2(KHOMEM_L1_BITS))
> +#define KHOMEM_L3_SHIFT		(KHOMEM_L2_SHIFT + ilog2(PTRS_PER_LEVEL))
> +#define KHOMEM_L4_SHIFT		(KHOMEM_L3_SHIFT + ilog2(PTRS_PER_LEVEL))
> +#define KHOMEM_PFN_MASK		PAGE_MASK

This all works better if you just use GENMASK and FIELD_GET

> +static int __khomem_table_alloc(khomem_desc_t *desc)
> +{
> +	if (khomem_desc_none(*desc)) {

Needs READ_ONCE

> +struct kho_mem_track {
> +	/* Points to L4 KHOMEM descriptor, each order gets its own table. */
> +	struct xarray orders;
> +};

I think it would be easy to add a 5th level and just use bits 63:57 as
a 6 bit order. Then you don't need all this stuff either.

> +int kho_preserve_folio(struct folio *folio)
> +{
> +	unsigned long pfn = folio_pfn(folio);
> +	unsigned int order = folio_order(folio);
> +	int err;
> +
> +	if (!kho_enable)
> +		return -EOPNOTSUPP;
> +
> +	down_read(&kho_out.tree_lock);

This lock still needs to go away

> +static void kho_mem_serialize(void)
> +{
> +	struct kho_mem_track *tracker = &kho_mem_track;
> +	khomem_desc_t *desc;
> +	unsigned long order;
> +
> +	xa_for_each(&tracker->orders, order, desc) {
> +		if (WARN_ON(order >= NR_PAGE_ORDERS))
> +			break;
> +		kho_out.mem_tables[order] = *desc;

Missing the virt_to_phys?

> +	nr_tables = min_t(unsigned int, len / sizeof(*tables), NR_PAGE_ORDERS);
> +	for (order = 0; order < nr_tables; order++)
> +		khomem_walk_preserved((khomem_desc_t *)&tables[order], order,

Missing phys_to_virt

Please dont' remove the KHOSER stuff, and do use it with proper
structs and types. It is part of keeping this stuff understandable.

Jason
