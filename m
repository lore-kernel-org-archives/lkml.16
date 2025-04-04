Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B172E62B6;
	Fri,  4 Apr 2025 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771269; cv=fail; b=qHq1Auq9//sMc5Y0VJ9B+j2i8+4QIMoImFKVxTj1YsifHjpCPNSDzzInQZcnS4hKaODWyoe982WnZrLbY723zo2IYffEv/yApfL2wQMjcUOleP9WIwUuOBH6TvKZZFZ4ziiOK6PUOleQVdopFWr3puT8KmnZkK7icz/yrak/I/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771269; c=relaxed/simple;
	bh=mU7zVLx1hYTypcTxLpMnYsqA/LxWAhlYZhq80HRy/H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wa2nTHH/z3HLkdpDD9BDpMHHgBnZfvBIFp6kt15Bzb9/g+WeU+BEKSygLchs1KFtD/0ViyxKQie38mC/8m6BqY3CK95mUM534/Jn6Qipg5ZiErj+mjWkmkvr6bNzNXi93EgYqw3alG9kCN5Ya9pnSzvIW1Oi4DJHoxqxAhBsyaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PiCjin02; arc=fail smtp.client-ip=40.107.223.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PiCjin02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXOeefSqz/0bhAGhT/gpyqRoPdjgZnExFTgD8h1qZZwUyVP3htt6IQTVFYgg38ck/w/3CDw6G6B9145q2Jn+aJe/lgjgKBAuTw1LS3hjKtKrLPSczr4+0BuDMoY3Xz//XcH22wGBVPYeJS9o9v3dTtkODgYM0G9XKWFDp1dA6L3OOQo/Atu+yEIyTxWyeZ806X3Zc4C0WpkoTnCz9rViombrhfD1y4FJZGKfkfxtSUH3BnZlCKMLtEGP7CaMzX6mdZMf4E3bDZpyzQAzZQqh/iuE/qLcMcIxRs4Rm1RGlvUu/nEwNt4wTnXUKgFioq99wpyNFqyrytTWv/aw705dwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aqgfgDKLwqxawkJsxmoe0Deof9pf/7i9srUiwp5mDY=;
 b=VfyyE7VehrEtGqC1eithfsEZKpA74MuMUwV7dI4jmzojc4ZMN/jEiZEfLbM5H3wbs07ZcxfW3pdIAyq8qUmM82CN7E10bpPEC3k8o+3duLTLOcaXQKuaWPBOSP1vi8yTdm8tVBTdqSZjUh1cYebEaRh0RSdHo6EKrMaw1KE6elpW4dGVeP/8nU3MSF5mU9zMJo4DFbJGatJ/V4BiJtpkQn11ICEdx0IfObwlOpS7TcAg5U06Jmji1B2TMmw7whtHhNWJvbMj0x1RK7Fpz/DCgVgXhA+10P84OH8RrDvZ7sQsuMcmk0hdDvLDiMazsNFTeXVqafDy0qW4wDFNIdrBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aqgfgDKLwqxawkJsxmoe0Deof9pf/7i9srUiwp5mDY=;
 b=PiCjin02jE4++HzvvMq/TPkWqGklnelRPq5hu1zWfKPXebo3RjTHOBy6cKvh1WAqGlCaWB/hVXqTBSs0DGl1XchAjGyWEg2zFKspCXwAmUxIrS8hYUzhLd+IWQgyQheeIohop+GbUCGk+0jjHuOvILwFdmd8TFx+n/ew+bR/U72O2YjZLnsW0y7CBZe/aDWYM+/UUhKSRG5dwuCgyi32bI7yPr/xO+TpO4URg5rBdvOgeGe3+bIl9hD545gVWDqGpq6jK0N9xTuhnEpi0b/YLe7P43qIKMpCFHVUXNKD0SCZNFIWa6ebHfbbptmE3hJ3Eb2P7aPYaa0vSRo7WZ4paQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 12:54:22 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 12:54:22 +0000
Date: Fri, 4 Apr 2025 09:54:21 -0300
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
Message-ID: <20250404125421.GI342109@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs01pu9qm6r.fsf@amazon.de>
 <20250403161001.GG342109@nvidia.com>
 <mafs0tt75p2nx.fsf@amazon.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0tt75p2nx.fsf@amazon.de>
X-ClientProxiedBy: BN9PR03CA0793.namprd03.prod.outlook.com
 (2603:10b6:408:13f::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0f128d-076a-4efd-d68c-08dd7377d273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EgOagnqjRNmVpspjXG/oYobxaPhBO+X1QUPiMnNf9fzQR8gGqPTtlAM8kP7J?=
 =?us-ascii?Q?WDffXDWrEy5pJELW5sPzXjvdHrUQ55bmmYxJKT2vQSWQnKmM9tm6ktf+5jly?=
 =?us-ascii?Q?b4n2OlNepJax+1i9zXSzpqmqOaKcO19+inpiycjM1rT2oxL95lbyxDTIORBK?=
 =?us-ascii?Q?EzqFmhZZBhG7/GMBNxP5OhRD7kxfrzqbR9QwMzesd82Q/sbJwBi8eI2PpIqB?=
 =?us-ascii?Q?aayzO/U5WnTYUXxZLPE5BSSZT3jIlN+7D0uzP3yVZPjcoB7ByrXahnOp7XQm?=
 =?us-ascii?Q?ftm9RwED4oY5WcLcxDbc4Nq0M0OzFf35PhaXte8kv/XCafEDetRDTKAnx/I4?=
 =?us-ascii?Q?VRg7WwhodwGmlz2nKGZqAraqEIGiikZDQwv6gWPx+V9GcdMkbjgK8XqQVTCk?=
 =?us-ascii?Q?wbYJz1+JKEBFWY0pmpVr+6hOLQTyPGaX/MlgNHw3XZQtMN/K4X7svbfkdWAO?=
 =?us-ascii?Q?pWh4X0jZfUguw4Lx+rfBx+xnERD5W9Nui6lwqTV8BQq/IysUAeDdmiMuGVdR?=
 =?us-ascii?Q?qrb/myUcRd3+fh3lAGjQDAuHCWBxnkDEQiW8hbJmAbW5gug8yTcBWc66qFV9?=
 =?us-ascii?Q?zRFcPVtQ2RssEYCh4Ua7Cz6MnTfzAQ+/iokdXEE7LjGVwR/+FGTGtMw1h1rD?=
 =?us-ascii?Q?c/dmHX9WE4b4OZac+mmu2XEGe5cbHgDZVO0s3WtcXbptrtkVk8OLYS4E4afZ?=
 =?us-ascii?Q?BgKqOlVXFgZ8nyAPs2YFqAhQq3EiY3rOFaSOtub/Ros4tCWtW98SB9Z4PMjC?=
 =?us-ascii?Q?F7bGkem1krckd53nXK1jGRkjpeQ7bGnU3FtuTXNeH9nLW83E20FDDjdsY/uo?=
 =?us-ascii?Q?WbNCYWTYth90u417klLHNtTQaHvwb4QGI0oLQTqRCeSt7/Sn98esKB772VQr?=
 =?us-ascii?Q?4ff6JbcJTbbNk9e/ezRWLr/ytisuM+Z+W5b5xGjjl78l9cBggoedP+tavLoF?=
 =?us-ascii?Q?Ox6NEHuzSCxjyBX6JCIe3V6HCQmiWE7+g7IpdGeqqhD40ehWDQXTsen4BwHa?=
 =?us-ascii?Q?r8ClXf2YzVShMBwPcPpsisnOmbKHNGu77xYP3WMQSdVdAh55b87CyruMMJq1?=
 =?us-ascii?Q?W/FwyHrQKvDZdphNjfv9m2ZkMW555/VIUeOt4zsg0XZ5Q6AxFjY8CmTx8tsO?=
 =?us-ascii?Q?7XZmeigQs8pQODgVai6X2ZyY/zZiG2dl4OIE5gdZZeK7HxwDGw952LDrB564?=
 =?us-ascii?Q?2ShAmAWi7Gy9NrbvaS6bpaKiQIL6AbLia60pnTvJecgQ1xFPa5b+GI4yrdYs?=
 =?us-ascii?Q?QJdDDwqIEp93ukPYy1JKuzgJz5vcZMoevPruljigK5pQu95vEHkGPqAsbf4V?=
 =?us-ascii?Q?p3H1AjOO9HWIvED7w/h9f0FbLHVUlJpgw4sW26jtESZtn4kEjQkyKdYaAFzj?=
 =?us-ascii?Q?IBlRR5De07Xgmd4hIQ7yfaBeZu8c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?znh2DhQsl/alrerFNBhuxbo24U7atutmcd4cJ9JQ4BcJcNaQgLcjFjgkYykh?=
 =?us-ascii?Q?y4XKqXnS7gYf26ADUhFKvPk+cYTWPmiZ0qZFle8SsU9KAwP8SEe1LgT+C3Wh?=
 =?us-ascii?Q?/AFhAIhJH29mtT1L98RhMCB5dSzmpn2c5YrEEJ/mkNcPCzD70qVS0v3P5dql?=
 =?us-ascii?Q?zBtLnzRHJwFMupV89c6CQpKC34kAdt/sgzRNA5UpdMRcMO1vpqnqkvIPkMzH?=
 =?us-ascii?Q?7zSKFBC106T5d+hoRsOw9WO7FCA4klT19smpjQtRCkISkGmWV9+gXZ6G/bam?=
 =?us-ascii?Q?rFUsx/N9qa9jlVBdu+6Ho9vpOcWnTKPLowJE4TdJax+M+ko6Nx4/yHa4szku?=
 =?us-ascii?Q?Pu2i51YnOgv+ybkScqV/tvZcNKk2ZBeusIvghy7h0qbTOVU3VSyT07JhDDrp?=
 =?us-ascii?Q?97BHFVhSr4jyD1Bva7L3vuQ2C0/XeVkikirYmtaIldAG/hxYmrcKV4mkw9R2?=
 =?us-ascii?Q?GwA4i+ihNMhuj4zaHT6idCGt/8ZuBTO02PwwMWmuDJgPvjN78FK7YBE+AtzU?=
 =?us-ascii?Q?VwdVdsA0Itsa+aZYW58K2N9OjpPgWAizg2iopWfajdxq6LuzsWcrAxarqGnk?=
 =?us-ascii?Q?e2nXsV6HcEwIqVEj3eaxjtVCXzU+AlJd7fGCRoqbi3rbzQEf8m76Mb7Cj7Tk?=
 =?us-ascii?Q?OozSOfU0AB+W42Z9EN1zK86OGJJgRYyBIIgqRyPEXqrjOsGGjxmEt/bR6l5U?=
 =?us-ascii?Q?Pc5y989i+Kmkt/3j/0C9JKXnBI8gZnWV2ntsEI58Podm01faMNwxKb89xW1h?=
 =?us-ascii?Q?NucuQ2lPYcV/pI51ODSETiDehHHxeL7upC0gMmY8vx1bwbWPCUiAwx+a48Fi?=
 =?us-ascii?Q?Fe5McV9KVkIlaQz8b2IdsUTTYyTb4ovtoHz62nmulyPsgVAgBm/9zcVPa8TJ?=
 =?us-ascii?Q?a0+Ovcfnc7qCKjzezxMOxEEAXQY5r7LoWAUkNdEkUYhWEehrA7Nz2yOaDrcZ?=
 =?us-ascii?Q?hodEI9r8nudh8/sW6/5KHu0QsL7u2UchPt2YfI4pm96U4lmMI5vmPhI+dG00?=
 =?us-ascii?Q?mh0GC6eLqNOZnvXQRPe2/87Ggwwai/64WymbbPwHp3tTxoCycNsbJAzcLJ6n?=
 =?us-ascii?Q?f6FIgRvK1IgJCPSfkm1rWPr2nx1VofugPPcyRg66Hh/5LZ6sEdHaZjL7kH8j?=
 =?us-ascii?Q?3r4dI1JH/mrodrNVxIPM0FIcn0raHFcHEmWX0Rh+1lUBeAjSAWxXfaS+GGln?=
 =?us-ascii?Q?EOATQHmNMDPDf6RBSv0Q+foEh7O5VdkuHmCyOQHYh9ZhwQUvpNXXRj3Ve+L/?=
 =?us-ascii?Q?3oSy6o/2FcA6Wy2bxN3zwByb5wI9M/onh62amjV+/YnT2iCfQ1nkwWHpCpOe?=
 =?us-ascii?Q?GHisuYo0tmCTNDOaXZRiLXx+UF9HkGmR3c+lu55jF6itVHimfVwy/bDCt26y?=
 =?us-ascii?Q?RUZRmdL73V8/OR0XO6VInq9erfFmziBs+owmUa4rqi0pEPnqObD7uDfuNbc+?=
 =?us-ascii?Q?Rx4yygI3USntfNDgf61tSrKLoFvfxQk6c5XUoZ+N6BOgPRu+5z5sK3/53rOL?=
 =?us-ascii?Q?b9ed/fvu7KadFyL7vGYICCNET1JI1O1d4TH46c87oTsI4oLDAojon3f3piSs?=
 =?us-ascii?Q?x48fgRdxmUNA4pjmciXewvBQaC82Lo6F8iDy7TEs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0f128d-076a-4efd-d68c-08dd7377d273
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 12:54:22.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFzpucZH7b669QPfUJgc1nyAUJFCP4lqkyTYeOcoPxqhUZrMqQBb7OXFNzbAKqoi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617

On Thu, Apr 03, 2025 at 05:37:06PM +0000, Pratyush Yadav wrote:

> And I think this will help make the 2 seconds much smaller as well later
> down the line since we can now find out if a given page is reserved in a
> few operations, and do it in parallel.

Yes, most certainly
 
> > This should be more like:
> >
> > union {
> >       void *table;
> >       phys_addr_t table_phys;
> > };
> >
> > Since we are not using the low bits right now and it is alot cheaper
> > to convert from va to phys only once during the final step. __va is
> > not exactly fast.
> 
> The descriptor is used on _every_ level of the table, not just the
> top.

Yes

> So if we use virtual addresses, at serialize time we would have to walk
> the whole table and covert all addresses to physical.

Yes

> And __va() does
> not seem to be doing too much. On x86, it expands to:
> 
>     #define __va(x)			((void *)((unsigned long)(x)+PAGE_OFFSET))
> 
> and on ARM64 to:
> 
>     #define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
>     #define __phys_to_virt(x)	((unsigned long)((x) - PHYS_OFFSET) | PAGE_OFFSET)

Hmm, I was sure sparsemem added a bunch of stuff to this path, maybe
I'm thinking of page_to_phys

> >> +struct kho_mem_track {
> >> +	/* Points to L4 KHOMEM descriptor, each order gets its own table. */
> >> +	struct xarray orders;
> >> +};
> >
> > I think it would be easy to add a 5th level and just use bits 63:57 as
> > a 6 bit order. Then you don't need all this stuff either.
> 
> I am guessing you mean to store the order in the table descriptor
> itself, instead of having a different table for each order.

Not quite, I mean to index the per-order sub trees by using the high
order bits. You still end up with N seperate bitmap trees, but instead
of using an xarray to hold their top pointers you hold them in a 5th
level.

> Though now that I think of it, it is probably much simpler to just use
> khomem_desc_t orders[NR_PAGE_ORDERS] instead of the xarray.

Which is basically this, but encoding the index to orders in the address

Jason
