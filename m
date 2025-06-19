Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E617BD3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311095; cv=fail; b=WPlt7AYqX4mWDnz5wz7QsS3h4tjxWOnAQZUTX8bE8gmQZsi627X13wjZkxbWtkQfua6w7aAIXYAQZmEql0eYGtNZtJqy3apN+oR9ZCcAL2+5p+ReLk4jht9hRYPY5ruOKUiMgw1Fn7BzNYpkaP5fRgE8nRaLLWTYNQX8Pt/yNeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311095; c=relaxed/simple;
	bh=Zi0p2jxr1SCPF+jb+5ldwdKwcAvMmHZX1lfQhFEg4OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mp1inhRjShldJAfrppLKBoG8UAcKgnqyAVM2o3Y4QuRZZO+VCGnFGpmUuE16Zk9/ug/iejquGZ0QQPc51wUwytj+5GsZOYhVuFhdYnLczYPPh/ajr6Q5OZQp2S9cn/KEVT1kP7fmNaLByC3BZiE0UvhYrrPT9BqgKG2qdbsTFI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i5d9UUK/; arc=fail smtp.client-ip=40.107.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i5d9UUK/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PryopEZCbMo4i1JjZSDH/UkgZp7Y21RQAs9iNGnhKi0aiFdzSo6LWD1AQk7hjoyg3nKNEU9nVCFRafdYCP3xRhYaZEvEOpfOOXUV5tb1OPadBgeZxNNdJo/KImHq4hr9VCcoSwx4P2gZaxJXNtzfPj+2625cL/ZCsh1ccJps3/r5Ax5rvzAKNlWA0UQ7cQF5H3YGTKgo0+NijmCUSklyerQc7nF0X+Y/6yu3ByRrYRuyKbRE1f1PAw4T9nRIiIprZcmUNqHvfWZnR/fG6XdZalYVI2Mo2KyWHXvAlvZST2GntfvlJfGZFlAofat4WFymdH30ISqKcRllT02mcDu2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sy2B+D+Zg77XetFOz03S9va0d/9wXz73csZyN7shss=;
 b=IrFhy1JdjGNOzTfE26V6I6dRxUYSK+BXmuEx1qkCA41N7a89bXhVvvKlE7tkOqmabkEJ50heiWDmFKH4VaL61BSP5irIywzz66eK2Epszdl66df2zgWtHIzE+PkBTEstfDChknAg/whyaKYb+ZMZyeueAvgTP0pF9U4XvuDEdxV6d6AKam37blHmhSXfvMoYQUaeafC9yG4k3vrsyF+d/rsWTrjOAfGsHM+Fac1A5c57NS8AkiKFQJVwNP7OSYxOnf19n2u623WxSTUOB8XWce3irQSKiRWB90UWVZaw7dlLO7yxNDLM1Pby1KpeOUjHztCLTW10UmYK3QRKeo9N9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sy2B+D+Zg77XetFOz03S9va0d/9wXz73csZyN7shss=;
 b=i5d9UUK/cEAFpiTzcmheeTmFGEm2ThpWQFc0yzZcWmqLUmtmb5Q8uq0JbPvO9ct2rKO75kVtCIgncjG4xQVbgfWWySqX7cJoqgLn9uY6JZ6qmN2G9a7KUEItrZWNKd0/eSIofSCgbbDEqoWctUcAKgF2jJ5JHO9Ka1krsTH0i4Sqzf1PLXqTMIHM1nP1f9cCgX9ftTaFRY5k1T1f/U6L74l2JANsJZtpg0K7ufzYGZHhx+sJB5iPOTiSMpZuRvEF6qNNMwLUWNVKl2wrYR4AiHSa/e59o73XKXU/hgEe3qnhFRIBdpUJwn1f0EkpsnfxWvWU0Y3PSrky3y0lS0rGrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 05:31:29 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 05:31:28 +0000
Date: Thu, 19 Jun 2025 15:31:24 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <qhh4b4kgi6smhmakh7wevnriwu27lmkapym3gmpqrhvqd3hj3z@bapjanj7x3vb>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
 <103db35e-0b7e-425c-95ca-90be6c574312@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <103db35e-0b7e-425c-95ca-90be6c574312@lucifer.local>
X-ClientProxiedBy: CH3P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::35) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 686dbb6c-05b8-401b-c7f6-08ddaef28a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d1czaBNX2l2jWCSQhObBaPNsq1U71y3YPdbbIC/TE2LTwH38cWc97J0zyh/x?=
 =?us-ascii?Q?5IlFZce1ikWTY1ncS9pLHaJ+8sfY37HjtaFST6WysrgCCTYtAi7JNWjY8oJE?=
 =?us-ascii?Q?8fA+HP60HFw/pxK8SbrPKov+sGoraKAqi8dG5PZrfkGcwz/LgeaOLaoT9hGl?=
 =?us-ascii?Q?wG6IljjDZYcmd7agspD4ZZ2yHRsbSJ6QpBayyAJm7EYp+NSd74DT29MKeVoS?=
 =?us-ascii?Q?Sn1yNkwHf2yt2G63M5r0ejH3rvxAGmaLX1oSNrWfQ6UCIguzjFKALorzXei8?=
 =?us-ascii?Q?mSqOv6R5ZAoMqWttdQUzr7GBlS/bF1g75X5jRypBzWDb71fPKfOpsNNaQew6?=
 =?us-ascii?Q?o9/90YfX8wHlCYZCHidrgJEBvVFdE5IrFefFmlXPEXhfuolJsNxh2Wr2epDm?=
 =?us-ascii?Q?DzsEOubB6/ya9UmSjs16c0ey//VMzeRFehGXMkExpyGHRs+KXBNlt7ERJVg3?=
 =?us-ascii?Q?IbzOk7XQ2DxJ/ATNYZ0tBGAsihVRp3zFBfqkoS18LPr1XF6y5QpLPgA/WVJf?=
 =?us-ascii?Q?ME3HPWxDnxL/7IQbGuuc1cDju1IM1FapOZzP8WgmBhYBP0eP7kxDWNDZa8ye?=
 =?us-ascii?Q?GvDaOAG8RUK7ifVfVGeWPY1N5gXKQoW4/Z1oI7rAd34sJBPabxMa6mfywEjN?=
 =?us-ascii?Q?73hoQUCASzNodFGheopvyQWcdAPBvSxp3AAt42mLpVDqjP3OAIgmM3aHlcuj?=
 =?us-ascii?Q?4vwWHPM+v7E4xenxFlRdoz+WP5vi9J2zGgJSDYPTPFWRR3imBmKJii8gszd3?=
 =?us-ascii?Q?WiONTLBmRdo52ZFhwNqSJGSMcyE+rqTfGYNvr/JNX4+G7/X3mr8FD3qPdzeL?=
 =?us-ascii?Q?cdV9NqlDTSBAU/zZWW5Sw5xFcckU3OZwM3cImST+t69igN8Rk5UtiJw7a3UR?=
 =?us-ascii?Q?SaVUSFOFt+aw2S4g4Qe3fVvrnDd2OrUxYpX9qGZbP69QihIRTS8Q6wJN+HOT?=
 =?us-ascii?Q?DrdRfdhnu1r+Z1323C8hvcDBUErbWTQ5nIvCBrKBtWEVmgcX62wrj5gmddhk?=
 =?us-ascii?Q?7qn8Z6r8QVMLRdeXz/NEoDrhfErmH3Fwi8WbO9dT2vlOOzIquz8X37HT1s32?=
 =?us-ascii?Q?U/Uchqe5Aa4LqmZVUMMidxRkiWCU8hWTegsEABPVjBUUdXPK/kjsCatsglJ5?=
 =?us-ascii?Q?tWwhRUxuJG+3xi5WVUlMDiP3rZXAwCFfOGDyGhgyZHheqcju8bgFmqSUCZjW?=
 =?us-ascii?Q?D+TY0XAVv3tDL8c9QHk2l9WVEfczI51B5YRM7qw9pJWea3UnJMcx7rNvAtox?=
 =?us-ascii?Q?39BodcDOwhjQjskzNQhWexpLWKtGT/LJTIzRvXxn+z5UyClpFTUiVqLxdoCd?=
 =?us-ascii?Q?XeeO+ELx1BqMeQpF5TheczxvPp6wnqLfWXLbItjrrMDu83SS3+omoAmbhyVO?=
 =?us-ascii?Q?Crgypfq0A5E6Gd9aJtZJL6DEKgNqZ2W4GRtsqO3cpvIQI8S/eRc+vGzDdzGm?=
 =?us-ascii?Q?jbqSlyUhqz8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hz+DEUeOEQJDvoJCO7CcHVYKfJiADhjb4ATt30c8DQQkhGzuqEFuMS7eGNek?=
 =?us-ascii?Q?AaVNnlLNvXnw7czX1hfZ8hkQ5U2XevqpqiIC/Q8EiPEtxNIRG/KQwHFqIYBy?=
 =?us-ascii?Q?0xy+XFwgzp1eJu2YHZntpcGWk3Aox5oaIa5RcmtRvQz6nP7kh52k30cro1zE?=
 =?us-ascii?Q?9+3OE7NhoFlcJ28NIu8KCIYaFAYLoo6kV/wXw8b8SPg0ZOQKakdlOgT2Vehg?=
 =?us-ascii?Q?qyy1vgd4ehMIzfL+bUFVQNLGWB8mIy0FWlBxi0/K1h8Zgs2PMT/3d6UexYxn?=
 =?us-ascii?Q?q2nkjlrCvd3kdTxshwQZ9DEUiLIvDfG+Hzjt3W1PCYA019labwtu6qvUvEIQ?=
 =?us-ascii?Q?TZpFT4RQrP2K9XN1hCKUrhex8Cn3iyW6QbaEc1VZScCnBF8Ah/fUqsAc/K/w?=
 =?us-ascii?Q?4EK2uZ6pv0j3alyrrJCCSQQjVkHrCqPRMfp47HEupkUgTJ0qOg4jKvRSUn/f?=
 =?us-ascii?Q?YXBich1NBga0Q8F0htCil0K49KcWD90ayJC5ju0KqPNSrMjsLxpfNf+PGhw7?=
 =?us-ascii?Q?b9fCBQbdeZhzfrgXPTXufjLUxnr3LugSEj7ebDWYmShilymk8Mc0C1nI1wLA?=
 =?us-ascii?Q?rbwIB8UnzXQUQemaCzs1Gpw6+mGhdC6yR/BQg1SvE76sHj2iUanP7eDul9Ti?=
 =?us-ascii?Q?J+eO2aEqjW4ix8HaIvzxpjp0AZTb/OQ+mFZCEhNa+buNjfMHPsM1Wj2cUJOK?=
 =?us-ascii?Q?+SEWDOnjoivYcm4n99WK7LOzfsgU0yDAqWbxqiEnhn2789Kis3q5ZR7SgfgL?=
 =?us-ascii?Q?fUl3V9ugwxTM8TJ+KliNgN7F29q7ASDgd1VxpJX9ny+D6CvyoFB8tcB61IpN?=
 =?us-ascii?Q?231+UMC6X2UUSxMONzW0OHb/rcF9PM5cedsWvfq+WZ6v32kAl2sl2gPbtXHK?=
 =?us-ascii?Q?/vrqNG0zK8d36fpilfQc/hYnPwIXzRz+KmGMRYASs78xXuiU1hnr3rPQuJww?=
 =?us-ascii?Q?SAkAdcH3li4S3eblnU7wSjaxIcKELKI7QJR4KSyy2q3R7BWahltdd+KS7lFW?=
 =?us-ascii?Q?V4OjizgghCIB6VaXEBG7IJurWeBJpgYvgZF3XNcvuSyzPRVS1FoknNlvfQtI?=
 =?us-ascii?Q?1ItAb8r7Sj5KJrHkowCTMGCqR0p6pIUxDFvlY10/Gzj3kxrH+F0MIA2DmDGl?=
 =?us-ascii?Q?vdcqKLSFJU5sl8s8icoMgE3k6GtrnaIWVf4PTiWzO41FjymbGpsdUKkLcFaA?=
 =?us-ascii?Q?plg0WGvOgAWFXVioadZWFumbgmiVpROSPUN9kc2o800/NT1GAMtxL3DZQ4yG?=
 =?us-ascii?Q?gkI8xDHIZpv8moAg9Ey2QCGXydP89n8+tH0sAYegz5U82K3STrk8P5yp1492?=
 =?us-ascii?Q?n9Guneo2hdRIDof2V5IdGeq4NrMAva5wj7M0/K3duCIEyFosKN+f+iaBeRd0?=
 =?us-ascii?Q?ZVz7FjoTuaUUask6GVXQ+mpwy1FXws/225+zUwt3BHPwSKJn0oQR4GqAL/en?=
 =?us-ascii?Q?apNwuMgwhNfK7v0IajOwQALzA6+sjAwg1Lt5bY7EYMNTA2gBSso5A9tK6Wqc?=
 =?us-ascii?Q?F2mk5alaDRvs1zPV1Ov606vl+LAqPoQI8ybk1pPvOdGriGN5M4jVio+rdPIB?=
 =?us-ascii?Q?eTTe1bLLXsFcSITkoFzowPDTI//hdUNCkJrFuLav?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686dbb6c-05b8-401b-c7f6-08ddaef28a76
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:31:28.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BbqSHeFv1FcB9eIEAwe4+yJiTRDQ1Mm2SDrwaa5yC54ZESNDMskldPZMs5LiTMylL1uQlC7M8CcaPcHUPSK3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642

On Tue, Jun 17, 2025 at 04:26:42PM +0100, Lorenzo Stoakes wrote:
> On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> > On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > > There are a number of files which don't quite belong anywhere else, so
> > > place them in the core section. If we determine in future they belong
> > > elsewhere we can update incrementally but it is preferable that we assign
> > > each file to a section as best we can.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > > this. even if they are not quite best placed a 'best effort' is still
> > > worthwhile so we establish a place to put all mm files, we can always
> > > incrementally update these later.
> > >
> > >   MAINTAINERS | 28 ++++++++++++++++++++++++----
> > >   1 file changed, 24 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 4523a6409186..a61d56bd7aa4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> > >   F:	include/linux/memory-tiers.h
> > >   F:	include/linux/mempolicy.h
> > >   F:	include/linux/mempool.h
> > > -F:	include/linux/memremap.h
> > > -F:	include/linux/mmzone.h
> > > -F:	include/linux/mmu_notifier.h
> > > -F:	include/linux/pagewalk.h
> > >   F:	include/trace/events/ksm.h
> > >   F:	mm/
> > >   F:	tools/mm/
> >
> > Probably better to have some section than none ... was just briefly
> > wondering if "CORE" is the right section for some of that. Some of that
> > might be better of in a "MM MISC" section, maybe.
> 
> Responded in thread elsewhere on this but yes defo!
> 
> >
> > > @@ -15764,16 +15760,40 @@ S:	Maintained
> > >   W:	http://www.linux-mm.org
> > >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > >   F:	include/linux/memory.h
> > > +F:	include/linux/memremap.h
> > >   F:	include/linux/mm.h
> > >   F:	include/linux/mm_*.h
> > >   F:	include/linux/mmdebug.h
> > > +F:	include/linux/mmu_notifier.h
> > > +F:	include/linux/mmzone.h
> > >   F:	include/linux/pagewalk.h
> > >   F:	kernel/fork.c
> > >   F:	mm/Kconfig
> > >   F:	mm/debug.c
> > > +F:	mm/debug_page_ref.c
> > > +F:	mm/debug_vm_pgtable.c
> >
> > Wondering if there should be a MM DEBUG section. But then, no idea who in
> > their right mind would be willing to maintain that ;)
> 
> Thanks for volunteering! :P
> 
> Yeah I did think about this. But given the above it's maybe better to put in mm
> misc until we a brave soul steps up? :)
> 
> I have a few other new sections that are possibly ones we should add:
> 
> CMA
> DMA pool
> statistics (e.g. vmpressure.c, vmstat.c)
> 
> But these could go to misc for the time being also.
> 
> Of these 3 possibly statistics is the one that makes the best case I think.
> 
> >
> > > +F:	mm/folio-compat.c
> > > +F:	mm/highmem.c
> > >   F:	mm/init-mm.c
> > > +F:	mm/internal.h
> > > +F:	mm/interval_tree.c
> > > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> > > +F:	mm/list_lru.c
> >
> > Smells like reclaim/memcg.
> >
> > > +F:	mm/maccess.c
> > > +F:	mm/mapping_dirty_helpers.c
> > >   F:	mm/memory.c
> >+F:	mm/memremap.c
> >
> > memory hotplug related. Well, one could argue that it's just a memory
> > hotplug user. It's mostly ZONE_DEVICE handling. Wonder if that would be
> > worth a separate section ...
> 
> Hm not sure? Again maybe best for misc for now until we decide :)

It seems relatively small, but if we decide it needs it's own section feel free
to put my name down.

> >
> > > +F:	mm/mmu_notifier.c
> > > +F:	mm/mmzone.c
> > > +F:	mm/oom_kill.c
> >
> > This contains quite some meat. I wonder if a OOM section would be
> > appropriate (Michal, I'm looking at you :) )
> 
> As Shakeel points out that's already done (see [0]).
> 
> [0]: https://lore.kernel.org/linux-mm/20250617085819.355838-1-mhocko@kernel.org/
> 
> >
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
> 
