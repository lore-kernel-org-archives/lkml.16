Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D51ADC93;
	Thu, 10 Apr 2025 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306291; cv=fail; b=sP5vHQqXY9bAcAm3FIgppGMWM+TijFLHnrktd/KknFlLrssJiyqEhYrLsZNhr5APJ1qDojmYWkmUmNRhyH54RVa97NnN4jT937/C1YN4rBPag/LqIhQgWFKn18PQL+isBiKUBSFft7gLVfluizBaMz/8VYI50zq75K/xr2aK4a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306291; c=relaxed/simple;
	bh=xUH2IAflMuLkqIMoGPSKMo8q4tM8qeExSLdSSRdpLrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GRN/byK222IszhdFG2m+JrD1aXZ1JJhc2wNMsOgf/W5MWFghq02Ib7pZ67u0HhRaunW44rtYX5Vij+D5+B6X+IlRTs/VvtIAeBBQwU7PQ9MytPFsM5W7UKB7yJcwSM2p8bXsu4Im0GTMC1GZ/BMYu9a5F+qxRmqhPHdZvvUZKmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bdf2ny/I; arc=fail smtp.client-ip=40.107.101.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bdf2ny/I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ58L1fOrHgDchugkxoGqF/vtLQafqaQ1UB2lkaouC11ogAScouEGXMOwKxxvCORuAvx3dkvXPI2xHLMh1vb71IqxkJqgKRxpz8t+lW7N3iWiwJD36oHxhB6SPxO0XgVoRyWfkuiZY1Y9wQn4Hg40p8oUG0iDBkC+j8/cRBhCP3wzvR1CFu2IAGTHyV1vdPVSIctVRTvc6V4vWaXGFv685AnR4YOUyM3EKmotlHyc7pirWskcOCiK7VhZE2Vpii3j8eOqttpCxta5l17mPceIywJtuUgjYzNQsrM342pz1uJWZLloc9nKw9xpmq5vjHFN3Sq5fiKh7gO9xbFu1kgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYONiAGkTkBGWoWJJk0A8omSuAFUeAl9g1ESBwPrYBY=;
 b=cwTmRMK9Tg5RJgM099rReyyX4ITffDXuIbirHhQLaMw4ia0coqQdudOPkfT5QplY5s9vpYQqM8HYDUxyntCV7QA0ixdHArbJZOIj8mBiGTb9FQJgMbsqW3SA/tfIUZ4xcsa4Fg74Ab0+OxI4LUJAZ3tlxmK8o7BL0P0FRMGwHckq0fNiKwWdFHEiImPAwoV8ZyJcjsSdSmO8P9BUnhRZmYTzRtC3pgFNBQf4ztrl9etRmef0ZhkEVkQpOpB/Ef0+w5gxddP3aUUUtgHpiaHeza2AjVDVj2eEmCQG38GmjmkvCZlU1cY7tiS5dwiL3FVAg2ClU1vvM/ZdJufDiROfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYONiAGkTkBGWoWJJk0A8omSuAFUeAl9g1ESBwPrYBY=;
 b=bdf2ny/It7Ewi7QZJtZkD/aXSUnp/GjZVtMwdsvU+LCHGkywIt3CTD8H4nKe7LOeOspjKG6oIj2BYdc6KvNwtjxCCtBuIoWpfj/PFq0Rhp/8oVc3a6qx+9X9i5kP2XxXv/Qggk5labrXdgPzCQ90iIrcvX4Y1Bdd1Qf9HiGAjCpH/Onxe8GOrTFZyw38iyvDHD1mPwYIiH9uRxW5h88X0e3+ZVi109ZTygHApA25Us/JNHtQtilVYtcsE4Syqr7WCBUEeC92ZmM+ra9TjIqf0wUPOD6rgIsrtY2pXR5A/o4B8cqR59BGdy7ZcO/XG5qNi0Py3tMjS+VivQht9rf5TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY5PR12MB6203.namprd12.prod.outlook.com (2603:10b6:930:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 17:31:26 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Thu, 10 Apr 2025
 17:31:26 +0000
Date: Thu, 10 Apr 2025 14:31:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <ptyadav@amazon.de>,
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
Message-ID: <20250410173125.GA5121@nvidia.com>
References: <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
 <20250409125630.GI1778492@nvidia.com>
 <Z_Z8-BLWMkiWpaDY@kernel.org>
 <20250409153714.GK1778492@nvidia.com>
 <Z_aeEn7hKqGOG3Cf@kernel.org>
 <20250409162837.GN1778492@nvidia.com>
 <Z_f3Jyac_o308ws-@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_f3Jyac_o308ws-@casper.infradead.org>
X-ClientProxiedBy: BN9PR03CA0569.namprd03.prod.outlook.com
 (2603:10b6:408:138::34) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY5PR12MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 147ac8da-7d0a-4020-fdb5-08dd78558564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o4GLPGFx4V66knVi7LRDGimd/NLZfp3nBUbmUdahNTcszRfpr2N0Gd0CDclE?=
 =?us-ascii?Q?bGVqapDO3tHlgCT3vVqcC0ism8jEUWJzOcMiMXIW3cGOY2r3+IivQ3MyXyk3?=
 =?us-ascii?Q?yz3uLOS/liwwqrLpblJujnYeMfN4TjVxD61mUP44na7MnWrPWAw5WnaMQ3Ms?=
 =?us-ascii?Q?9UGKVDD/avuO+6bXgiocM64fXGICD40lN/7TIMqChPkAB7BjbebJSCnQmYXn?=
 =?us-ascii?Q?hJma1ZmoDQ5PxAkSkyguKsxjYdojku1XDUvnk52pNg5+2AE9Tr2WEkbUCwvJ?=
 =?us-ascii?Q?1sToyPhnuGiEQxYIyE2hJBbs02HYFQ9E0K5/xSQe202FzUooBFjYG0RxWUkY?=
 =?us-ascii?Q?u0i4wf/TAKlCGIk9UNuxSlRreUvRagF2JWOPSYb4tvMRzvTGB6hN0fWle+Ra?=
 =?us-ascii?Q?7dg3Mkk+1hqHMYzs0y4kjeKXhKHoh6bAMk65WAVWaXxzEp9Op/srwf6zEQi7?=
 =?us-ascii?Q?Co9w/CB2QTBanYDX4DT0OETuYGamKWZOuPnry3dj5f2fkSqKucqp7kPTUyEp?=
 =?us-ascii?Q?Uw9Ff8bGJiIAG8l3aIxsvfuXPq7/3e1/Ig5vjc9IoP+/XubnOH6euuatbpYA?=
 =?us-ascii?Q?WNp8+1Vtk68Gvayag9rcAWs280w6K9xrfNyPWAYFuEuF2HKzG6Xi5vwIIQM8?=
 =?us-ascii?Q?JxFQt0n0JC9ZihYoSXOcotGNl+RcQ6ZMRCa0Ga+s58BouR1fKKg10bv1UARv?=
 =?us-ascii?Q?4r3f6JBB3BN/GXbWPhveNVPmjEOj/mI1oPY0ezQ4QEHvCtPiydvcO9Cghyyi?=
 =?us-ascii?Q?GckJ+yrq9dPb9iVcNZMHboQL4FVqjW2x3RoCBWeBgW22gD1T75cEuozNqr67?=
 =?us-ascii?Q?JTpXJLe/6eK/BUAXbBt3l59oSompdHHf0vOQ+xAoWqMboYzDFczCGw+aVkmi?=
 =?us-ascii?Q?MpSLFlRFC3aFGIDjwkJyntU+YuDkYniJXcG+ojsVi6+AR6W1SKqVtxoyjuXP?=
 =?us-ascii?Q?UiDyB8uEeBK/6zkXVHFaUJrQv3N5RcZfx2Fmk03JG8F3OovLLoDG/Kbpyilb?=
 =?us-ascii?Q?NpvcYCzfKn1fqHalsLRna9CPHaL9WTXgFpduCWNjkPtlBCOvDmVdk9a2Plx7?=
 =?us-ascii?Q?REOIibmOisS0HTS/jBoe6Op7mBj1WrmaO4A6rXhkLkWSp1P4kXyfhtA9/LBD?=
 =?us-ascii?Q?I1PrGsVsE1xkyAFR9OEQ54u4iiegRLTNAYfJNKeY0z9cEkM3rLXZOzfeJPJS?=
 =?us-ascii?Q?qFKi9hMYJD4DQI/vp0W9F91CzxkoWMrAR1FPz7I2P1Ho+NUDBnIwgq4rk101?=
 =?us-ascii?Q?Otj8eFS1cDbgXs/AA8+bJEH7w2zjb3kz4rwYQZoUEtANHFiiYMyVg7uAnFId?=
 =?us-ascii?Q?+LEry/rrRSV5sEmJTHHA3ybTaq09ZESDynkA1pIs3UN95+iabXlyxejkpZ7V?=
 =?us-ascii?Q?uMatU1TQ6emLgjaYQu+kHNXgmpb0VGU7i7vt8iTIJWAK3K9gbvvxDiVgBPcN?=
 =?us-ascii?Q?wH1JujHDo2A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B5KI3BZiaxJjPGcU15DIb40oHbim0MZMh6y5x14+Jt3RlZo0kNN3Fe8DBJL3?=
 =?us-ascii?Q?Oijd/9+rPTabZDAVTDZaI6KY3AwDAVRfkL82dGF+1yI+gGkF8ErDCpkxH6Qu?=
 =?us-ascii?Q?ntcf2K7cuRcYVOWDHFS9Luql70ja+dmOQXJiniVJkYfijQJ/Wx3mKCTtFx+F?=
 =?us-ascii?Q?FfuJ1woZbXlOFfsFwrMazjgUTJcXlCKVSCHTb5hREk784G8dIlq7NFphu4Wa?=
 =?us-ascii?Q?JeI/8Cojmf5BoddXIXSOAvEL+a/k0T3jlxSnf9bC3icemwTUDQDWMVtA0CtO?=
 =?us-ascii?Q?6H1WU28KsgTra44GVSwnfex1a6KzszUqr9EOBlTXUGZYZOHBsyQDBtCbtGg7?=
 =?us-ascii?Q?nc/bJypbl9sOqy3WzT/QOUcuI/4Eobi+eUXlzL9MPtUMzkCB7MfW/p/vJVfg?=
 =?us-ascii?Q?J5lCq4VmvE0JwYHOZB/yCxAyqcoJJ21Y0tXUyYcHyJPehGYlaqbKUTd7FNpA?=
 =?us-ascii?Q?k0Rk3ZeNJji7WHQP82Uq0WQ+ZhFRZcEJxx+omWIPXmOexS4wGgswDM7lPYiY?=
 =?us-ascii?Q?IooVRLgv/YqEh9DHt2mCtWwVs7St9I6z0k9Mj04aOqTXOpI6xY/FiAIOKQJq?=
 =?us-ascii?Q?4GzRnpIJtRe2PvpJRUEHMK43CpOOi5fkP24qlsGjB2N96iyoy7EsWmMMUS8q?=
 =?us-ascii?Q?t4G3yBybITr6rUKdax+PkR4xfLMcbObm6IFSF4hXITbvvt0tZ4vNiREPCWBA?=
 =?us-ascii?Q?OubbERncBJWvG6eicnRqsXQ49EhO9glOWFHAHA2WQxyJIP8umDO2no+Vb3gQ?=
 =?us-ascii?Q?fH5zap307O599y1LgBBffSyzg966n9gPn3BGwhr6xuaeqoB7KI9YRDvEvigN?=
 =?us-ascii?Q?GAsm5p4uXL5wztHHycdf5msH2SpAC4Lg1AsSHO+ypDbgSdvwnyadTfr4IdbP?=
 =?us-ascii?Q?IjmYeIFsBQ18wakbZSHV383JdZAvExpYnQ9Clb5RSeqZuhziIPgPuSAog3Y1?=
 =?us-ascii?Q?f9MSjSCVtB29+lclEml0YRLxD85dSfN/HUvdJNLCpvQP/T3Llum3dC5XW1Sq?=
 =?us-ascii?Q?mTqbiov58aOrdMQiXoTmYXFdMc2+UiWArw/Z6GlIRJ3yC36fktDQiqx64tsA?=
 =?us-ascii?Q?bJn/5u0R2LTQLQvyvgd8t811ywlUw8bLPcl8XBrhANq2SV1uwW6+b6kC93nf?=
 =?us-ascii?Q?p2znYWR2PGDpf3s8FtuYY809mWgsOr+STWJXut/jCRgrtKCA1Jj3TRNzOKwc?=
 =?us-ascii?Q?tV+5PHv+cfyhw6ULWLKLu/aSNBjbUG0fD9+xeobqWbi4WBaHZTaoYf5YSjQv?=
 =?us-ascii?Q?2pQAXF2hLwBXxtAhSTpB0Wji/I6WWqDvngIrdG+0avNgUlkXj0/I0MqBP8XA?=
 =?us-ascii?Q?mrXKYwIWnzQTE2zjcjmKlWQFe1GzN5zF/TaGBgidXhyzGwir24UJTebYKnEW?=
 =?us-ascii?Q?Jd5AGQ7dmcw+e0r8Z7U+Max3m1wIN+6bKYtv2MlbOlIZT55zEvOfgNO714wm?=
 =?us-ascii?Q?TGrSek9cIUeK2/MnRsbUrr/ptZGFmE4lpx83aSDwLvEwh56dTgB03KQW2hDI?=
 =?us-ascii?Q?YPp7peEkbFg+Ma1FPRDBbPODiLXLKP+5x6Qknr8bAmRsMuW8aNHD4XsQL6f8?=
 =?us-ascii?Q?uBNTq0pHyLh92czgXMzX/QURNUZ8wJfKz96I4k0B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147ac8da-7d0a-4020-fdb5-08dd78558564
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 17:31:26.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgrG/qf8QuIb0KP87a8a/OYSG0OUOeqpMjyoQ2mbBeWrEcO7uxtgURymQxEBDc65
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6203

On Thu, Apr 10, 2025 at 05:51:51PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 09, 2025 at 01:28:37PM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 09, 2025 at 07:19:30PM +0300, Mike Rapoport wrote:
> > > But we have memdesc today, it's struct page.
> > 
> > No, I don't think it is. struct page seems to be turning into
> > something legacy that indicates the code has not been converted to the
> > new stuff yet.
> 
> No, struct page will be with us for a while.  Possibly forever.  I have
> started reluctantly talking about a future in which there aren't struct
> pages, but it's really premature at this point.  That's a 2030 kind
> of future.

I was trying to say that code that uses struct page type might be
thought of as 'old code' and maybe in drivers that have been updated
to use KHO we can also insist they be modernized away from struct
page?

> For 2025-2029, we will still have alloc_page(s)().  It's just that
> the size of struct page will be gradually shrinking over that time.

For instance while we still have alloc_pages(), yes, but we could say
that KHO enabled drivers should not use it and be migrated to
folio_alloc or slab instead.

> > I don't want some weird KHO interface that doesn't align with using
> > __folio_alloc_node() and folio_put() as the lowest level allocator
> > interface.
> 
> I think it's fine to say "the KHO interface doesn't support bare pages;
> you must have a memdesc".  But I'm not sure that's the right approach.

The KHO interface needs to know how to initialize the memdesc. So if
the very lowest allocator function is:

        page = alloc_page_desc(gfp, order, MEMDESC_TYPE_FOLIO(folio));

Then we need a KHO 'restore' version of that that also accepts the
MEMDESC_TYPE_XX() too.

Bare pages would be built on top of that layering and supply a memdesc
that is equivalent to whatever a normal allocation of a a bare page
would get, so that normal freeing of a bare page works properly.

IOW the KHO preserve/restore APIs should mirror alloc/free APIs.

 struct folio *folio = folio_alloc()
 kho_folio_preserve(folio)
 folio = kho_folio_restore()
 folio_put()

 void *vmem = kvmalloc(PAGE_SIZE * N);
 kho_vmalloc_preserve(vmem)
 vmem = kho_vmalloc_restore()
 kvfree(vmem)

 void *mem = kmalloc(PAGE_SIZE)
 kho_slab_preserve(mem)
 mem = kho_slab_restore()
 kfree(mem)

The point of the restore function being to put everything back so that
the matching free function works.

I'm guessing if we imagine the above 3 options, then in a memdesc
world they will all be implemented under the covers by doing some
internal kho_restore_page_desc() which will be the lowest level
primitive.

So, I'm not sure what the API should be for bare pages (ie not use of
the memdesc). kmalloc(PAGE_SIZE) would certainly be nice if we can
make it work.

Jason
