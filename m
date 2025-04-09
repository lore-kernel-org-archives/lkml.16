Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2C7224F6;
	Wed,  9 Apr 2025 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223550; cv=fail; b=aDxuOXV3whwGixsldMCt+On2ZSIBJ6/pe7OL/PnMybSYn4X0zdMD9GN44+cCfN3L9uaCGt2h2jVAqmyYgYi7D6nAxi9qOtQ0Ic8K45DEMG/6iI6ixsef5+THrWfPDf1m6kQ8NNa+zkZH5DzMtqYt6KgcoZMQT7pVdwgL5yayp68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223550; c=relaxed/simple;
	bh=mnvj2L0Ypy//uNyKO1fCt0VyTcSULDFJ7Pw9z92hLRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QxnQT33536xBDpDttGWYIn2ZAACQJdOokWNYQO403hVuqom9/irxDDqVGnzgwPiKzuAFh+yH0ajzOZZ5+i8NsH7wnFBaObwaY99gItWLn27KhHT3rIvA8NBwK3t1OkPzpU0o6XOxv6TPm5unfc+cArnZDGiQg3BxgRlv/49Im2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CjharNqy; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CjharNqy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+J18TsLXJoXVO1zdHkJVkVHedgeMdjEB22MwGdZP7LAViUHO/V3BlY+2Z93+yIMXyLiekHI7y6oCOlmHmfTRDXYl62JZDMvaV4gy9d5Q0ScPv7Bk1RDs4nqjnUA+O7ywdCEtt0kdt7ju4l4dYK7sH1uqbBxiXF2arjPpi/wrqCey0wI+uCVxJLGFo3h5lDj+/VmH0Fc1Bij0p4zPwpB2iTVsydZ0IwKk6M5UYvqsm1B8wqs7x/gmKWksdv7iXANKiEyqOGRxzqpDF09ZwhcLb72+Xv2VwPkuNnQXvo5YD+e3NyeNDb5uKXYzBA7kpuL5r79+RgmSA5HJgbPZSvkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uP0xL9MTbG/uQBky3IVPl9Qpz8fGiHTi4UuVvja5pA=;
 b=MwqiGByxFFxuRq/wnkGSKHug6mJNpVvDA+9FPZJo5aXOWVY5orK6aoJRuUzS1Dejxzf+Lcw1m2S4EpfAeVmy1WKVdtsIUbjLUq3DM9RAG0XWdfpYEyUDiJYQrxvrIoMHcOWK2z1hPBQNA8ciurWiTXWZ2sfE9d2LIR4/Auey71hotUyjoC8tyFcAGwgThRFnEJSpWT3GHn0mZqk2XRBZjNyI68KoR3nmesi0T9/ltyXUGZKqw9fLNhHH6c1c57mLqaFdzzfpykZuSKwfhOC5dWi71vuf7nKDlGEVZ1efgouOW9zJ2UkPe/WxXgnXP5IfuYg0e70bX1nvgMRhlIjXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uP0xL9MTbG/uQBky3IVPl9Qpz8fGiHTi4UuVvja5pA=;
 b=CjharNqyoIgtES8v67X8WIWkza3lzmm4AMTef5gHa0yfFYtw6AZbXeEf0J2YeEoV49InBKGUnKOGUykWVgJp3bWfctdMdoCfuLTe0FJRdwNEb8/CLIXvUjAupR+4A+kbL0rxJT3wAFxzoj393IhEinUAhW0NyQJ+AzUo1CVDV/jD7LYKrGS3TOri6dzH+YnV4N8eDpF9Gveu5DfGZB9qULam72ie2iSNy2AbPGXEMPkZmFWg+Kxa7dg+vtV6SvHd4RuACGS/+l17vEZWsqF0yaKjNqUzzHFffHwaXHlj5JfGCsXMG3bL4l2eRcg6ehMVhRSTtXpxRD2GCvcnjUKjUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 18:32:24 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 18:32:24 +0000
Date: Wed, 9 Apr 2025 15:32:23 -0300
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
Message-ID: <20250409183223.GO1778492@nvidia.com>
References: <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_agP1ohC3sVZrM7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_agP1ohC3sVZrM7@kernel.org>
X-ClientProxiedBy: BLAPR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:208:32d::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 391d2020-5828-4bb7-ccfc-08dd7794df34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dRuGXJsKh0EBs01MgQnHJcdIWmZQaOZXdQTT2URCgnOlOQt1IHGQdAUjDwqT?=
 =?us-ascii?Q?U6hfL86RyGOM+T1oGgGOX3rVGDVwFlXW4aeI/Ac0pPXVsUQMhz41yPm5hhMS?=
 =?us-ascii?Q?yhtmJhxLaQSvi5zb+8WP2EiEOaI/nJk2tKDpY3OS4ErlPBTff3DikO3ko8Zt?=
 =?us-ascii?Q?6sInoiviomj2Y3pxPkzGKiXWuD63Mccc3HUOqWYHbgzn9maKQ4NYxBpK/1v1?=
 =?us-ascii?Q?1bPgFwMduU3NgxA4KvKc325JIzoLwid1J6j5AN3ynmNESMl6diNGemz/iTLz?=
 =?us-ascii?Q?gUPBuLlGvGv/eWSzhVb8Tla2Gtu6SzBQPeh5rXMW//z64CmK+aRzk6iFPOzH?=
 =?us-ascii?Q?F/99JuDh1XV2Zt8FLw/+c6xj4z3Cu9BRvdPvNQSa0CqpgkPjjXBDVVM35/CH?=
 =?us-ascii?Q?E3GzWHqbzPmchMCz+GfxTPXxmFoGeCwX9cYS2xW9wg40WLQpuW17FeETWKzm?=
 =?us-ascii?Q?EOzKCGn9TX/EcDN4bCdJ/idJPaVQGrCxLSeVz6ASSMxGv9AziDZT+ShpQpzY?=
 =?us-ascii?Q?FlVLtnEhNO8YaNl6wcbQZnKZv8tD7oqN9qVznz2N6q9G76O/U0x9PiAyWkkc?=
 =?us-ascii?Q?etmoyHsUVg6wQ/DGh87CzSg0RRf2j+DQTDXyKZPdRBBJmzy4V2CYWi7OJwY/?=
 =?us-ascii?Q?2n1yFcWojROP9qDEDik3LDvzOcC05JVTcR6b03z9bXwWMicCuA6/cjWUuMJa?=
 =?us-ascii?Q?X2RbCvAQcXU1bU+IT0sKXQv898VWG9Ffc+jdDKwUPyuLmmOhiySojlPN/2N1?=
 =?us-ascii?Q?XB/5781OnASZAZj/dlkN8V4KRsHr5owYmXLpSGo9zQXtMMdIjdvS8TOpIIvh?=
 =?us-ascii?Q?qAqdreRNT3N80/e29srs7ANTvDSZTkOVQZel2BiXJ122BspNqexMhgXKDE9S?=
 =?us-ascii?Q?eF57uB9gSd3+7d/KuRldjGt21bR5yK6a/X8Xpki5izxTWL6ZHETueSKkFIMV?=
 =?us-ascii?Q?S+fd4QVDaNsNVIumf2/bZgUmVy8Ta8p1CP3rFsb4yPLwiQdo60amNSiM/VjV?=
 =?us-ascii?Q?MXY5uV+vij7+OfkxFMXYUb+LTiudSo6RraZKFbWw57LfXC0iZ9Xq2aqm2iNz?=
 =?us-ascii?Q?sS4dKl0n3ONN9+vCNR2Pvqx3FoVNwa6i1Arz4xcSf8Rbu5mR0MCS7ZrGw0ve?=
 =?us-ascii?Q?bOPG0TalHl5KnJ9qixt1vbLIMDCyv8TlbPBCmx3C5025FX6KIJnf/VNRGvYd?=
 =?us-ascii?Q?iouqNSDXxMHOCKKZ0ip6evdjCNZ96CUdiIwsWYgSZZKSRV2roN+AT0DjjXFz?=
 =?us-ascii?Q?u/kbKEWb/1GloUh1V4GCQGUk/whZ05YLISfAuiLQLTVdfkR+MEyF8K4pUhMb?=
 =?us-ascii?Q?B3t7Fzpn/1Kw4ExJY854n7ublvMjSRtfMn8WcQwH9IawsZWVFj5qd1EqzFN9?=
 =?us-ascii?Q?0ODcEhWCjWOdOtVw/brcyYemrrD1yPeGZfmc7/jmTAoIO+qPyXdBY+UwEijO?=
 =?us-ascii?Q?eObtGmcThD4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T0bx5PM7RsCFiS3opX6qQ28nmTZJZ7hxolBEwUDfD/JXnW1vSLG5F/Wn+dz/?=
 =?us-ascii?Q?9vZQ2tN36wAUe1xml6I3Tg1QmzZ+4q4sJvU3OVQ+BR715DroPk1YnBryzKlO?=
 =?us-ascii?Q?XURWcXTDv/GZtzRGdW34v05DKu6cDVtWWyAqBOvN5MEtd1IBJQWbXtCY2vx3?=
 =?us-ascii?Q?KR58EoUQQETHVaO5R6p+csR4yngHV7LEN8tjm1VeYYWSr4FkjpzmWcoCDl0L?=
 =?us-ascii?Q?YFY5IJSAhJyACyzRK9LT0JmyGZIzjzyxfB++zSzL0elNFgaQFJj9N0w/bC1r?=
 =?us-ascii?Q?Qut7nvx8JMX6oypkJFRcVHLn4af4YKkzkG116dWtNuvAyf0QVWHmybTZBP12?=
 =?us-ascii?Q?vikD68CASvFZWGsFfuXsWX2isXArVcLzx0VwRh/YJH1vlHPLfOb5DbEF1oqs?=
 =?us-ascii?Q?R4QGpYSWNgVxQv/C99P1kSjKTMw4A5egoWNOTfoNrpyMMm2mlwoznTGtM37Z?=
 =?us-ascii?Q?oLFKPtef/fbspF1DAS/RBCyNa5UcDbxLmpKrFqMzlyY9iik61e2ySal2/HG9?=
 =?us-ascii?Q?d0XDLBc7Uu9QIp9yEvh4vLtzusBi6YJJa3XJ1SWuf973fqn7MrqRArC0BU41?=
 =?us-ascii?Q?xDyd38ll6W9HTHj34H5xOTk4n9/7Fj9XYuHlTheF/xdrxFBf7uX43hys/x/8?=
 =?us-ascii?Q?Kh5PIVcKpVeu8tN/dL/V6JVfu28j7+HIOYbFBTIeYMyf7auTQz0TZDEY1V/y?=
 =?us-ascii?Q?RczVq6NIT3Oo+5Gd4DiqdqXMnHaUlY8QF59EkS/ecs1JQVDdqIMqL5v4h7dQ?=
 =?us-ascii?Q?9MdbUXdA97prlzvSypanjFN4kZsY03xVt4zmLfx691v9RwLjI3R7+x1eDEGn?=
 =?us-ascii?Q?d9MXs1yf6GFxIAYPvRdYYJAVpvldBVXLd55XAdjqf35H9zUqX/R7n+7s3ZJ1?=
 =?us-ascii?Q?JttN5VYl3+ObP+xJg6RcEg/7L7XpwFq4imA9GzSD7WhPMcDvqYT2KHbDl2GI?=
 =?us-ascii?Q?S+OWaZ6dODpjyh5/oxUmyhgNtnhA8xeBWE2HDrqNwASRkrgBOqgLzi20pbT0?=
 =?us-ascii?Q?CQqJWgSmNz2/LfOL8pO7hxmhxx5V4vmMy0CSomsfA0m+XSRCWT43jZ3HRTmI?=
 =?us-ascii?Q?XByfpTMF8wVypT5U6UhhwJI2txWFMXf7SYza3MtnyWzLbK30ZAkO4/kX7OlU?=
 =?us-ascii?Q?cyDcA8lOYr0j/GJ9+BmQZ8HVYNlYLdjuNZxJ/kLNfO3mw5qhFTJM/RASnARg?=
 =?us-ascii?Q?sX14JdV5weZpSy+IEbCD1ObBhI5KsFxozMsV/YaV8KWF/p+Kls6EQNTYIjUq?=
 =?us-ascii?Q?kmy9nGPKID0f1Wyn5Lp60hmR17R6afNKoizzBIE+27ppQAr+RyEJ2ACrEv9u?=
 =?us-ascii?Q?hO0cT6dzUBGM7X+RDPukSdbqco36hr3EP1XTtjCJPIkJB3iVcyJyg4l7qMhU?=
 =?us-ascii?Q?HGnGRJk9j3tTWGnC+3ognvlV6r6WRehIWm8mFeRg+49K5cQmn8YUmrfJFdgI?=
 =?us-ascii?Q?0T5IcgQZpFNgQqSbLbl9nQKyJdUzwzzQcCTf8uLdvCCbZgeILXkoI9q8ok14?=
 =?us-ascii?Q?x9m9TSprHWoYxnGZyHEBtfbMyiVtk1m7Y26BSQuOkN+uYbwA3aBV6owBGGU2?=
 =?us-ascii?Q?rMT94SIqC45uaY0x4b2MF5JGLQ20AWzGViQXFyks?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391d2020-5828-4bb7-ccfc-08dd7794df34
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 18:32:24.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enbfoA0BsyZHTG0k9WwmYnhX1Zbdpjv5IaBPmWyAXsdxiXJ/Hthr3skW8EwlmqRE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

On Wed, Apr 09, 2025 at 07:28:47PM +0300, Mike Rapoport wrote:
> On Mon, Apr 07, 2025 at 11:16:26AM -0300, Jason Gunthorpe wrote:
> > On Sun, Apr 06, 2025 at 07:11:14PM +0300, Mike Rapoport wrote:
> > 
> > KHO needs to provide a way to give back an allocated struct page/folio
> > that can be freed back to the buddy alloactor, of the proper
> > order. Whatever you call that function it belongs to KHO as it is
> > KHO's primary responsibility to manage the buddy allocator and the
> > struct pages.
> 
> If order is only important for freeing memory back to page allocator, you
> don't really need it. Freeing contiguous power-of-two number of pages with
> proper alignment will give the same result, just a tad slower.

What I'm asking for is transparency for the driver.

iommu going to be doing:

  folio = __folio_alloc_node(order >= 0)
  [.. init struct ioptdesc that is overlayed with struct folio ]
  folio_put(folio);

As that is how you make memdescs work today. So when we add KHO, I
want to see:

  folio = __folio_alloc_node(order >= 0);
  [.. init struct ioptdesc that is overlayed with struct folio ]
  kho_preserve_folio(folio);

  // kexec

  folio = kho_restore_folio(phys);
  [.. init struct ioptdesc that is overlayed with struct folio ]

  folio_put(folio);

Working fully.

I do not want to mess with the existing folio_put() code just because
KHO can't preserve __folio_alloc_node().

Tomorrow someday I think we will switch to a flow more like

   memory = memdesc_alloc(&ioptdesc, order >= 0);
   [.. init struct ioptdesc that is a new allocation]
   kho_preserve_memdesc(ioptdesc)

   // kexec

   memory = kho_restore_memdesc(phys, &ioptdesc)
   [.. init struct ioptdesc that is a new allocation]
   memdesc_free(memory, ioptdesc);

Jason

