Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ABAC2FB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748569862; cv=fail; b=jOKVsuADSmiFAHayPS1NaIFjmUOXAWgIpL3sNWst8vhuP5BVIvUBrNlbMq5J2DmK4b5jROaF8Zjizs7gE1/0mHb/VOQvvw/TU0lEhAHUxQHNMtdDVIlqQTBWT0hJk3rNp62bJUSZfLQmEPYXYkvqSW2b5JRo6HXE601abPG0jKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748569862; c=relaxed/simple;
	bh=CH1ZCfDJte7SV3/ibDGyUhQSnQhgYMs54rNP7P0zkus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fZ/SNMppei/EcW3vgxu/GURZUUHcArDyryBJjDSmrsc2c0xV0G5xuaTRxN1JmI9Gem1bzMJbvFbkpUHcNPigBgWhvyFE9WgW6xlhk1XGneIZWw2m6V8hJzQYgir7YfplWyHUFVBHuK0SYxfzQB5zZTpKa8SeVlcsOQ68WSrB4/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aSucvwQO; arc=fail smtp.client-ip=40.107.95.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aSucvwQO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVk7nyNeO9d33I+xuO3f/JUOoYUJKUH/KGPSMydGTRMnQCLHF3Iw11ieNWgQm2xbG1cbEeVzYPS88TQ8FtOss6LL9fEaPyCVR0O415jLnOD3FOJYjp1f/Si0fI9bPfr9Q4cRX4X4U1P7gHXqMZMo778G5dwaY6u8FSR0UWP92r7iRG8uHE2VSM+KLk5Kwx17g9flksxYnIwR0S8XSLihIJattfn8mSseu6i1j6Olm/q6PYfvH686Z9W6SXLH+acGxDvYkK+hoKbC+t+SMAQC7+ef+iv9F90x2dPtd9aXQ6SriAHn2at5zaMcSmALHXh/90lZo58Em9RW/YEpjuPndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkY62Dg/4ReU6jB+NgGkFzjky845RTiKblMVNFngUHw=;
 b=oS8Y3U1khLt8aE8HNFAgdPa/11pkf5tpWDcwlAdKxF8iOKR+Bm5nPFqOYXjwPsDUkgRt+ak6ZudcKEdLYYNZiswOcdTKyweW+KfI1ZUXuSUHsZXGBI5DschAkKO4f4dlbC/mF2Qc2Ei0ElvRvmHdTaEckE7uPxtEmo3fvcSgOWYFbjHo2tPr7Jw+rTaVip2WzjDIHEwdjeJj6yHKTD/o1A+BY7mt3dw8+On+XossRXHBgXyGU21byawESFyN4/Ao1rIH4wLJnMyo1FA8eCcEM2849jEiREcdHVXFDy3DaAOlfFOs+voPYOTm5eKX5WWQpKAUtFNMAnHOEp4CmPbfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkY62Dg/4ReU6jB+NgGkFzjky845RTiKblMVNFngUHw=;
 b=aSucvwQODhVhQSJJMu6IZSHUnI/B2S+XOmKYomBQMrATZxpR6Cbgw+yOWxUBJtRHZ/Cx/M3utXiPA2aIrfOPU2h+h02XKkrzAUIRA/WW3PsJtGfuf7sKmK7DUjH+ZNRyiekQVlJ6Q/17D3G0ARVsFKqxpdtlIHqT4zKE3ViOb0UXPT5JFXHQEvEcsouhSFnYubfhwV0stRF7qN7v5xmW80JLjSemYXSJe040yhG/PHVwzwpzn2D1wG67Q/5nkXRh2iMqOhUi++jZCLZbOHVUBcXGuoOaWiXDJ6oKcmTW2kHXlifb/Cz2sFDHye4Tbul5W3+FavJ4g0+Np56FYVQV3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 01:50:58 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 01:50:58 +0000
Date: Fri, 30 May 2025 11:50:54 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <ssanq4tzavyiev6svl7xuf7iazqjvhgddhmtax7lsssbyn5dfb@y4u4kdlfm2g5>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
 <xuk53vslmg2lserkjew6rudlgrjipmoiybsu5swhoxcdbiaken@pnv3dsuhfoef>
 <449f6faa-d858-4ce1-955d-021005677f1a@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <449f6faa-d858-4ce1-955d-021005677f1a@lucifer.local>
X-ClientProxiedBy: SY5PR01CA0116.ausprd01.prod.outlook.com
 (2603:10c6:10:246::6) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fa4483-d653-4603-127b-08dd9f1c6c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HHk3BRSynSBGLmUN2iicWTajk2a/wsfQUhUXz2Ja0V8atW8QodIsq2eLq1+t?=
 =?us-ascii?Q?UYpta9SVknC+W7GBrBFZbJt6QwqDXm/3x98kHtbK2FLkpjh5ewGr6BfTqnTG?=
 =?us-ascii?Q?vaDmJ4riS9JTS7n1bB6jYOugHqGDYIEkBygCVcw40iXrFQV/yUr4AnnLovcl?=
 =?us-ascii?Q?jjyySb8J7Jc+Vf24kj8lJKyIWQWyiY+FDVJCy/5pqrIjhTJTMI6kM+6j9vmS?=
 =?us-ascii?Q?+aR1a1WxeIBN6n33rp3Q/3OoG+2FWBJDUXjkFRPzKiUKKZs2L7i/RUVrYkGn?=
 =?us-ascii?Q?yYm7uQI+VpQxoD/kKOvSwVGTgruN6d2OBjmn5saDVD5D/8WSnOebgyzlavUK?=
 =?us-ascii?Q?J78aDp38bWIoud9RBj86uNKiSdnH2PqCRAQmp9VLP0kqZMHoW56sd6d19mBv?=
 =?us-ascii?Q?Zv2zM9GrOy2uyxmfrMdED5avNmP4MF3COQQXWZQp4dGZAbBAL0DoxpFpP50L?=
 =?us-ascii?Q?b8a9brKN1QbQLnETVDKPGq0gyi/uFV0OT2vZQQkB8WZcRDmNISRjvQS5mAl0?=
 =?us-ascii?Q?7j7RR5Zy/g08gqPKX/a+eRF7sPf3eK5A+kVn4PngyzRoIuJbrWlf3lLiXlZj?=
 =?us-ascii?Q?D2dRWoBVK0QKkXjTNcClw61mayhxfdKoOQFrfq4ThYgyII3yeI3k9BltfIVc?=
 =?us-ascii?Q?hqzduxAkpqVdZZ2ap8TahVr6dcEO1oJqNN7A0EYqgUJAc+WK23qBQkeAaG54?=
 =?us-ascii?Q?k+JvtHiUpI4nENM6qaXsftNenbZUS5xQ6pWPPJZGhZUIdfUzFCSEqWagZ7AI?=
 =?us-ascii?Q?juXEfUjj02fg5D/OizbDSjqeqh+GZOYNELbt8hXUXatj1yDxJ86KrkdEoPf3?=
 =?us-ascii?Q?Dlrh0k4oavRCpvRC+NOdtmBMndY2gqAwHaoDmG3XNue5ICfpA43uF7jXy3y9?=
 =?us-ascii?Q?4zH2cpmsWyA993nA8e2sCOmsIbym0IGeRSZ1DGN1HTXWJs2GX9n3503G2aMo?=
 =?us-ascii?Q?uOUxl+jR9kxYJvWI8umbyyhIb83awy40t5kOk+J038e8pJKIwbEyZlmRNsKC?=
 =?us-ascii?Q?I4AHBr0jOSkxKA02h3jcXO/j45AMiS8WHPJyZFwCGs56Y62HbFvI6I6gYPUz?=
 =?us-ascii?Q?ba/xLoggMlyQ37Usk2rSYF5laaMBw3b64K/za9/c+AP3fW/qa2GJeyzWDQfb?=
 =?us-ascii?Q?8pKV30+n71MfqUsA1u9EhgZIXGcpupidgYliiZuZfivojcycrdQfTAx0XA/X?=
 =?us-ascii?Q?NaIhcbtw486km8qy3YMj4NgYxclpsCBg6ZHtGlSiUOAol7jhm9G/AG2Le8hn?=
 =?us-ascii?Q?12iiUEW6Oe/pkpwalSrsQvM35C3RBfBjpsi1Zv4lCCh8w47YKOsKdeb6ZoLU?=
 =?us-ascii?Q?EGd8ksDKyTmOOGwpyqiRe6et3GQBWFDQr02z9UrUU7UfVc99qIVYcghznqsn?=
 =?us-ascii?Q?MLjWce+XpH1S0Q86H++4MfBp0KVHhccZ25OvE0lXOUQcYychlcR7RCp02oXk?=
 =?us-ascii?Q?8zQZ12EcvZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/EAcwe7Cy3kYhFtNDu5W62AArE+a1eNDBJA1kKEW7NCgjUZQlhqiXwzNaLYQ?=
 =?us-ascii?Q?xUKBQyzcXWgYArLRq3izCIdMW8OUfxEZzBhaOQ+2NIvt15eKk9MntN7Rj80U?=
 =?us-ascii?Q?Qv3HrRyIqmQIybCMsV9drU490sV89DmOBjMvs9eaCN0sTp9xUjqthAAOyuQl?=
 =?us-ascii?Q?ULBnpEY9yTp9wQgXOx5X9OEpkz6gPqAUicncWRVu11Z7/7HVAyJ1iLit0x9f?=
 =?us-ascii?Q?/3atQEllfql4anapkxfzhgSYmcng8Mt5m/XW+uLxwK+9arE+RM/SyTaRXpsM?=
 =?us-ascii?Q?vnSj6fhcKutxtFo14oiDSuP3nnRgLt3RQKd7Day3e2nAtsK8srIaJmbMQ3r6?=
 =?us-ascii?Q?poFO7On2D/IL9Cvl+YAKECb9HjJa1L8u/41/nbOfvSOzuKGmSwZF4/I/8HFT?=
 =?us-ascii?Q?8jPqeowo8QkWc5uJ7JZixvWZKLVqRahiSJIMV5DjCxVj+24ddSV/W3ly+Heg?=
 =?us-ascii?Q?mTJvcc308H0BnTT3MA2MlHCfO2VZl609NgPqKjHWa/08/79xg9KybqksqAZh?=
 =?us-ascii?Q?Y079s6YKE8+XdAEJse2IBXY4zOzg4gGiwexk7Y2ssfD+Xkiktr+ldZKZsWUb?=
 =?us-ascii?Q?u//0J7b7xQqO8AmLC8wpRo3owWnLi7NWEOyA2D/Mw9dnnth/WHoZNzrmbKXS?=
 =?us-ascii?Q?iPp6UxK5L8BAElAilkjfbbHOw10T2sl3DlgYC9GAEFslm6OSc0H3g/dvysui?=
 =?us-ascii?Q?qxvo8a1fqoHPvVScFpFDmCV/IsAj91bzajcrmLJYiU1JBtTrUS882J6ZWGwm?=
 =?us-ascii?Q?iiLwxruIdwVdgr2Rt0X0XsYqtnEEKPTRD3nY7O61FpLT9RDxzJisnQRCtUNp?=
 =?us-ascii?Q?3pqsGKrSCGdS/ss+cCKUxBrp4N1v4y4wP9qGHjhzsfoBkHcy/rQPF9UksGQ4?=
 =?us-ascii?Q?BtMmiyhNUt78IqD3uoJFLRUYh4FKN4HO4XBM65Us60jsP4YqAxs1WvVnExU2?=
 =?us-ascii?Q?3j4ay+bSRz9REcVUBokm5x7Q0UW4a0WfAn2ydzQ1mEbtUWeMzwf1/351allR?=
 =?us-ascii?Q?zzIzQfBevOE8aPzBNjSlVAFT8M646m1+D6jOnLZAFr1x/Op6wI7DvMkuSGyT?=
 =?us-ascii?Q?CjCsrDJf4j8QxTPrh7Kp5HFDPg7g3ay6kaCd2HNZOuHsTImsYrYKK1SCj8En?=
 =?us-ascii?Q?MuDJa7IkGgX1yNk8NQJppoKqrg7uPal4D7Up7CD/1xB8TUHHVoxPLFymSQEF?=
 =?us-ascii?Q?q6tyVEVKoFMX1GUfkeiDn5tbeAnMp9KE36QuH1C8GGQo4D6xK6thM7TjWLqk?=
 =?us-ascii?Q?1s53I4nXXatEkRwPox7IuMRSt6rbWggUwzgWZkk2vS/kHNs4j/0P63ZqQzOl?=
 =?us-ascii?Q?ysPBegBJNneSA0HmsQuAfgL74jJsKZPGIPgCebpPk1kaYUkIpLU2mNN3NCO/?=
 =?us-ascii?Q?ZHViKC7RFkUiy1I5LLdsBGaqzIpLf/wEtgOQ7P+JUdw14CJx4S6QgF84lOIR?=
 =?us-ascii?Q?lZ+Ki7C2o/GwkJOVdHmgqkRcqjr6zozS7nL7YqTvCbUAPOgDIr75qqQFwYLG?=
 =?us-ascii?Q?nCo2fRYtJiZqDAe7UlifhsYY3qnoWZmBXlMiJ4X08P899Ksuh3l+ubYWiWlQ?=
 =?us-ascii?Q?kkjCJHa9H7VucOcjny9u61knkXwO4hGRGR/7Unu4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fa4483-d653-4603-127b-08dd9f1c6c2c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 01:50:58.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmHllxF10wfZCv1U4DDdjveL4TeL/88sf9EQC6RDwFXHMKqwuQ8ZRpER/SfKhrTl2utvnZKVX7bhL2jFH0aWiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959

On Thu, May 29, 2025 at 01:14:27PM +0100, Lorenzo Stoakes wrote:
> On Thu, May 29, 2025 at 03:54:58PM +1000, Alistair Popple wrote:
> > On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> > > As part of the ongoing efforts to sub-divide memory management
> > > maintainership and reviewership, establish a section for memory policy and
> > > migration and add appropriate maintainers and reviewers.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > >
> > > REVIEWERS NOTES:
> > >
> > > I took a look through git blame, past commits, etc. and came up with what
> > > seems to be a reasonable list of people here, if you don't feel you ought
> > > to be here, or if you feel anybody is missing (including yourself!) let me
> > > know :)
> > >
> > > David has kindly already agreed to be co-maintainer for this section.
> > >
> > >  MAINTAINERS | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 80aa09f2e735..29d73593038c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
> > >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > >  F:	mm/gup.c
> > >
> > > +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> > > +M:	Andrew Morton <akpm@linux-foundation.org>
> > > +M:	David Hildenbrand <david@redhat.com>
> > > +R:	Zi Yan <ziy@nvidia.com>
> > > +R:	Alistair Popple <apopple@nvidia.com>
> >
> > I'm particularly familiar with mm/migrate.c and mm/migrate_device.c so:
> >
> > Acked-by: Alistair Popple <apopple@nvidia.com>
> 
> Ah sorry Alistair, I ended up having to leave you off as you hadn't got
> back in time and I couldn't send this upstream without your ack.

No worries. This landed in my inbox while I was away so it took me a while to
work through the resulting trash fire.

> You can send a patch adding yourself and cc'ing people here and I'll
> happily ack, or I can send one for you with this ack attached, let me know
> which you prefer!

Have just sent a patch. Thanks!

> Cheers, Lorenzo
> 
> >
> > > +R:	Matthew Brost <matthew.brost@intel.com>
> > > +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> > > +R:	Rakie Kim <rakie.kim@sk.com>
> > > +L:	linux-mm@kvack.org
> > > +S:	Maintained
> > > +W:	http://www.linux-mm.org
> > > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > +F:	include/linux/mempolicy.h
> > > +F:	include/linux/migrate.h
> > > +F:	mm/mempolicy.c
> > > +F:	mm/migrate.c
> > > +F:	mm/migrate_device.c
> > >  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
> > >  M:	Andrew Morton <akpm@linux-foundation.org>
> > >  M:	Mike Rapoport <rppt@kernel.org>
> > > --
> > > 2.49.0
