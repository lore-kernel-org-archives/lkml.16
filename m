Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702D25A625;
	Wed,  9 Apr 2025 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203401; cv=fail; b=WMaGDiXMjEit0AFoBlfsCbRpy6bFp9/PXF3SE8mI3sKHUKEuslKEFGaLM3/p9ePnb9706aOkneJvCoUMoQahEvt6H9gTluBnepl67VBgfOmcoUFdDc+ObFfpgRLUmrNqgm1iug3pEWdpbHQl6oXbIm+kKqLk1NqiQ2HI66QlHPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203401; c=relaxed/simple;
	bh=NqZQi4zjAjeDjbR1+b+lLyi4bjIMGJsLmPEIrDjDh9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RifUOsGdC8jbVpVSXZpASUuxp4V0R9k147vG4nWYbJjg+iS8dcDSYVgYbJVsrOMmllQMp8W4a8Lai5gmWXULRpRvaQTxgmz7P1zzNqd9asVI/+mqiIt5ApfOXqNo1cORa4J7UM/0yOsZjX3L13oReS4+71BTwmYMR6E9UsyDO9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Md6s7K9p; arc=fail smtp.client-ip=40.107.95.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Md6s7K9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6lDo0doX9+kyNP84ZNQngZE/8oQq/jH4HNgAiBwX/+4XzzW4WLgvq14/Cqk7qkqUNubAE6V+eNgHHhASZiPuLtr/Y9+i6HcleumxXlxKkYmE+bJgWXMj/KQOW/2Pc5+ISR3BMIiI3DHQ+7+TBQDeVfTj1eskESF2XTTK1xvha08kko2M6bbDMFgACvQjc2ro0syKoUWrGAb4+sfp03l7UWTixGDTBYih1fOhKJhRsJy79GxV7gbGQUFvRZMuvtK/3IABZz/7DBvHPC9Mvu/5c43M3Xy5tc/6ztS6zN019BxvhdxeCpWm1Ntjp43FGatBMcHxVVnXDUwL7Wq3m9T+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqZQi4zjAjeDjbR1+b+lLyi4bjIMGJsLmPEIrDjDh9U=;
 b=akljG02WZwdcI77J14tvkhK5IhyI1Aha4GLAeUB2en0mWG1hpucF921jlAIq8xIl3I+Z/LnvZnXhFeC2orqgsuVsQHg6kypbjDmYISyvFO34XYHRR61GzPUbgJKESUWIK45LVo8V22XzyAzxqcR2xT3yYAevWIovxEg2cE/MxeSn15FJhCC8TxrSEVQ/ss98jRBS8U3Uk4WYvnrRSDKJ4zbUV5dgsENGd2Rxm5sxDkh99laPhyf+PH36sCMyMIgZY8A7y74hR6UnlKBUG8JORzVw0+H+hq1BL3VCBZijelXLyX9hVd6dKNOx27B40PzEFokVIipV0AOdJcJpvBb89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqZQi4zjAjeDjbR1+b+lLyi4bjIMGJsLmPEIrDjDh9U=;
 b=Md6s7K9pNr4lMEmpm6i9opqCDT4MWKtrKHxwOqWm14olTJWjE28VO7hAAC1P2NIwwNKg84BZprKGcJgYY+PiaTndxuzdRPF6nnQ46xYoWTbobZht9kx3DOUNR0lhddsJ2sZQp+BXlmew2/2SgLSsvBTNBLeMgTt+e4H1ypghinKufsFPC0pN0+XWG7118WQUdlepkCYt4l8MdKizceFuLWyCT2CBmwFPzFA/yYGNfBYhcII3UPSyd2J0MaIVoGl+yyy/Lu/kSFuK9qdwuZdfJFcfvzyN7UtO3qzfEkUvhrsRGPBUomtVK7J4UCBpinNnB8AQzHo+BIIw+p3u+NzAmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 12:56:32 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 12:56:32 +0000
Date: Wed, 9 Apr 2025 09:56:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <20250409125630.GI1778492@nvidia.com>
References: <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Y4k4rDO-BbMjqs@kernel.org>
X-ClientProxiedBy: BL1PR13CA0387.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: f25ecdc7-cb7a-4312-374f-08dd7765f3a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AQ6ARALcPZzHKEopKML0MlKzoSGCiS7Ah3QQebv8Wdr66yfB+ICkEQcf/Tdi?=
 =?us-ascii?Q?PJ8n6dELFS8CXHvA57j5ojZpmTqIsj1xdAhDsUTFvm4Jn1oVJEnYTShYmIjb?=
 =?us-ascii?Q?zwm/uJDDXTCfsoDr5z0OcRcey8vtL1nw2Zt4I46PwfBvTsuzcvF/QcYlGQko?=
 =?us-ascii?Q?rMllwrY4iSSZTG27PIeV/7YuDwkzYVTStE01VpO+m62uallOaesH6TLI+ZsN?=
 =?us-ascii?Q?BRwSTREim8yakAdYu0I+G11x1Fd4j43YHnF23FgG23uHuQqk3XuGzA9+bDcR?=
 =?us-ascii?Q?BV8GuJiMajrCrsN4Qw6+mVm3PJVPkC+2kBovRyhj0W43/9QhzCbNVKicRK49?=
 =?us-ascii?Q?iQp3C6TD9mzpe5pEEWG59D+hMiiPXrhF8rmHS0X1yvIrD7INN3KL7rYz8470?=
 =?us-ascii?Q?kvoUSTonqvm/yPtsytrYUCN6fiKt7mBph5KJpDMf3yatjQ532/EUuJHTY1QX?=
 =?us-ascii?Q?8HHs+P7HS4ZdbTXIYXubz/0QNvenmjKjE/YeiBZnW4bVPBb4k2G3uH7Fqd60?=
 =?us-ascii?Q?OMXNHEcbv/r9UC5zhtuVeNns121oQTKCraHhFRmXdrkX2xSGMijDeuFXCvii?=
 =?us-ascii?Q?HSMZsSRg9PrZpqwLzrYpWuyX9X/9yM9p2XAWl9HKH4Yfth43J7i+a+RbmHGY?=
 =?us-ascii?Q?dYQsgzZFJ2HlhmR72e/L36eNQRmR3Az8HBOv9G9ICo7CdclILGFgUyMnCnDA?=
 =?us-ascii?Q?o8ndNwlLOZg3+X5Y3Ovyv13kH/bthwNb42EcSQlHq47R20xV6AZ6F/5TzcVL?=
 =?us-ascii?Q?/NQya6zjZzeKfp2BvGEy7QL8KHGPnHi2VcZnubxsOJTckX6bSTwTVnTdlOO/?=
 =?us-ascii?Q?JLb6rJjxA+zjS2s/XiIiPILRgQzdo7WcH5HX7RwQXxrW1I4+lhqEBE4rj6po?=
 =?us-ascii?Q?ypY3gsHvv1dRVaglmF4ss0Ml6lCgJRin79YE2LquQuUD4rq43KzhlWQI3Uec?=
 =?us-ascii?Q?7dVWBz8uq3MmAzXnWwNKkTD+qD/Gz/g7u8AA+bo8xVPPZkN3qksqQk6294aq?=
 =?us-ascii?Q?zzT9jHgekM7ZK37faVGwTVcNTlsxvrg1wNBh9phkZoCc37C9bj+wsjPs/e+N?=
 =?us-ascii?Q?Wb0DNXUgw11uxQMIc8LuHM5ouwOAH+qxCVeIVhwAeyWkfkT3BVwbjZ0jmaIm?=
 =?us-ascii?Q?2sQozStDbAmL7tKG86L5wBsMeEUcLSO0TuJ/S78e18AoIN90q3ecyjuqMdIO?=
 =?us-ascii?Q?gQMPAs9QjtrNIRs1MpTnLOzYeAN35WiSoZ6CYYXXsNS45OTF44ZHlgxUyAxV?=
 =?us-ascii?Q?9Vz8IrZdKLfX1VP5NvwGrMfTPu4Nq7FyaqvRGcUB3uDcpxDFWR3XoZbGEPU8?=
 =?us-ascii?Q?4rUEldsh5QkLoDx7ProBuw/ZDvsHaoP3I8y9qN7aNk+Hce1kfT1x4bB9hSdp?=
 =?us-ascii?Q?h1w3QwvVRsiTnAawLLDB6E69zII/9s4CwdNMznHCqc2yg12amJwn21nn4bFT?=
 =?us-ascii?Q?bdFJfhv6JHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?32L52kGFBne3725fgGoyYWGJD9us64HSHHBCH9ST9WSgkLkRgJkY1cJk/ExX?=
 =?us-ascii?Q?svvRQ+atxrwnQr8ywVOMGYHMvCZU7sJjEBcexpLwHp6nLu3puHTh07aKHTiq?=
 =?us-ascii?Q?dHTeh5qRptKhuRa5+2LBC9VuMbn6uxnO0xKnn1/eZXs92R5Pxbo+cwRxLBaa?=
 =?us-ascii?Q?ETPhJnJZImcicACA0Zj7TLq5poZ7OEEljlpxuk2OUXHEdvR414psi9vT4cP9?=
 =?us-ascii?Q?i0T1jwbPtdnmZZAhRz6yJJ1BnZ1Zoiln7J9bbORqIoirC4BPcHSzHl8hCrXG?=
 =?us-ascii?Q?wgukTTJdpYr83g4fmrmPoCVJTMCXXJK/iBna2kf/vJ9imGYOghimc/mkuz6e?=
 =?us-ascii?Q?sL3MszwW3riJWvyIdtAvwGWwfD1NeEneH+9wMM7uVmZ50qgR1BzilaoW+TUV?=
 =?us-ascii?Q?aGrcsor2p+RYsfjK9jnMlaUd83sgW6nIk6s7wrau8+5TRS0VcsDR3VXthMjr?=
 =?us-ascii?Q?qFK1MTVV2flPlj0Lw6QbPuWiR+cTAv8TWXQm7vAxjwEUa543eEPq961NrFyi?=
 =?us-ascii?Q?KOH8zrVYUT3qY0T2GAjjy4WapXbEZ8YSwOpXv0KsqE+fPnc+szGKekIZTLhL?=
 =?us-ascii?Q?zlrcQYH71ps9Jj23GbJsxE1WYzgVi2879euGtF72nz8oMFlFjbN0rg8Osgvi?=
 =?us-ascii?Q?qcQ5F5A1r0XrFTd7q9igxaClVqK3zrHSjfdPiZf84TyotzEPCs2klt/QQ1Xz?=
 =?us-ascii?Q?rISHNZLnElofE/EzSOOPbC5C2sf/oBPZ77kzzjX0afsk1CujX1cOYCVUy6pu?=
 =?us-ascii?Q?5QmfQOGwkvLG1EzIvKzvfb51TM2bOJCr9822WZTUlyddMXPByp6sGyp7psqk?=
 =?us-ascii?Q?wLlhaZSln0L85Zv9jc6A7qt0cQvRbExZMLlQHjU1jeMhjQhVbxAig++03rcT?=
 =?us-ascii?Q?Qbym2xy7Yb1qhBaITQcODXrDehJLkc+ULS4zRboqZNDebdi1aq7qC8S/hH+p?=
 =?us-ascii?Q?ko15NbRTlSOorHXUT9zn0hrMqJQFQgN3Z2krMY7jG+Y6BfBvL3AV6oM/CWOU?=
 =?us-ascii?Q?TbD7N04gkcvXw14IvQ8k/DKgGZMX5QQnKuUVZd0QxSc/LY7U6r6c6lk2M4lN?=
 =?us-ascii?Q?eepXyN8QdNqCfGPXYvCubFCuSkNVvhg4sBWo4FHBNZCylmsX0M+LDnLz2/e+?=
 =?us-ascii?Q?NyLjmEfkF9op0HnDPM1YKfbZpp0012j3hTOHsT8pLDuZOI5ILhkSPxs91FaV?=
 =?us-ascii?Q?V5+pXKtArN/O9Kurh5foZCewU+4Bj4GCu/jQFStMru6i9FbRuMFLRMSdQYbr?=
 =?us-ascii?Q?+lCXuiY6Ved/ATId3Rf8s6wBY1P+QB7EM/iSqIQqtMmgWCaqvnET8ip/ohRr?=
 =?us-ascii?Q?MuR4ZMzYJp5quWOrs1DYzjgdC9wIIn35Pd3r+7Y1DjltFCPfLTxxAx05NnWr?=
 =?us-ascii?Q?u6kOXFGu60e7vO6iM3o6IBYy2LNDo0h4qpGaxPOWKIdMsMc4zfDlh8fb+E8a?=
 =?us-ascii?Q?2/C9NJFrTbV+IAlekfxPS6GIUYTYMkHBBgTPZ35ZLXYY8GC4SsB8O+V4Idfe?=
 =?us-ascii?Q?ZN0+gWX4c1YVDo95HWnH4EvDfnGFdPrUMj9KT9RhWzoK22cmOTCTAphsxrJH?=
 =?us-ascii?Q?MgUdwNDD6V7JRhyXMAoVhKwwG/IvuDtnhuTmxSrJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25ecdc7-cb7a-4312-374f-08dd7765f3a1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:56:32.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns8NgL+vzLxfXj/NonFUv2JXVbqk/whMMexzTsADjMXQHWovugM+j42CnrutHO4Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484

On Wed, Apr 09, 2025 at 12:06:27PM +0300, Mike Rapoport wrote:

> Now we've settled with terminology, and given that currently memdesc ==
> struct page, I think we need kho_preserve_folio(struct *folio) for actual
> struct folios and, apparently other high order allocations, and
> kho_preserve_pages(struct page *, int nr) for memblock, vmalloc and
> alloc_pages_exact.

I'm not sure that is consistent with what Matthew is trying to build,
I think we are trying to remove 'struct page' usage, especially for
compound pages. Right now, though it is confusing, folio is the right
word to encompass both page cache memory and random memdescs from
other subsystems.

Maybe next year we will get a memdesc API that will clarify this
substantially.

> On the restore path kho_restore_folio() will recreate multi-order thingy by
> doing parts of what prep_new_page() does. And kho_restore_pages() will
> recreate order-0 pages as if they were allocated from buddy.

I don't see we need two functions, folio should handle 0 order pages
just fine, and callers should generally be either not using struct
page at all or using their own memdesc/folio.

If we need a second function it would be a void * function that is for
things that need memory but have no interest in the memdesc. Arguably
this should be slab preservation. There is a corner case of preserving
slab allocations >= PAGE_SIZE that is much simpler than general slab
preservation, maybe that would be interesting..

I think we still don't really know what will be needed, so I'd stick
with folio only as that allows building the memfd and a potential slab
preservation system.

Then we can see where we get to with further patches doing
serialization of actual things.

Jason
