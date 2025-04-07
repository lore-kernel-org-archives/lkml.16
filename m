Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CDC1CAA92;
	Mon,  7 Apr 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035392; cv=fail; b=UcCdQ0dNe8KpwQMeZXqO1uysYg46katBo0yVrYhR+ixgro21F8EfoZH4e4KShJgsj94hn8WRdlSbw/XH1F10B/Siy6+YlJZ84EW3aLNFHJbgaoRJRdsdkBPPKJtjB5STiHy8Ur+aGJ9RzfKRMizuBjd3W06mh3fF35ZSYcha4Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035392; c=relaxed/simple;
	bh=lLv9COC+Awmg6Ab2eWAGPyBSOh96dvt6Hey6kct6jt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uMgkEomTw4B7+3tY6NMyjM0aVAjQOy7n41fEFT2019own8TJ/PkF31GGnVj951tDKjp3WpW5KVJA14AOmiY3JFkXlcApPKLVTY9ZJknjgVYCCzF3zj65RMDQZPtZWzoQPc6YYMOcBry2bXGgVhXB/OtVtMND+PY+8VPOzBOdcu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fcr+uRMX; arc=fail smtp.client-ip=40.107.95.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fcr+uRMX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpNBbjSuO1BJrLGMKxCkC9t0I0TEeyKYsHLbfNZ6prAyh4HL6Ucglf8b/mh3mSx9Ju8qcj5yb7AXaB18HCo2ozoKdhp41XuefXMXMtLHNN+fAqnhDWoap40jKNMUDogN6QKpY3jGwkSwIX4q+qSd4gZ1ygnjbFTShm9jYaoVwFLuL8Le2bAjBQCvdSEPGGFGLaqsvV2K6UsR93wFicgJA7w+Fn6P8uZ1banJCIPlZa5WrrpKHuXAEKXv5Z1h+XTy9+/lpS6gOO3gjkK30eTdvSAqjMH2T0kO6sJ9TvLHV2RAIHMutQputJte8IBTp1i5jSlx9HFhmAZLnAwDHC/Mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYKRtYa6rjCBCWWN6P6qjRVJnp0ZNhpiYezPQ3vank4=;
 b=f+tyLR9DJIHuPsPk1+Y4alsNqfb1ph+tfvG6FBMX05ESA1qNHbhB+lyJGuMpISG05gPs/KwVQxKPLDfUbuUBtf5mx7Y8gYtT+X7DgXuqOSmiaSpaUnvvMK5mN6zqLXqYip++fouFu9vQumsvStpvYwKa0BfpovZJJnsf99ZTPJsyOB252SlavJKDTpGN5GZZcBSs+K9tZtbScZSAH10oW2y+baOQ2/fYJgaSebZifX6qiIznBmNcxs1/YNHYYVPu38J8BxRVEHMbca4zxp3wj7Sqkawv0e1MaXF3RJmFRzjlLLMYWCyZ/+ymG7LiD1OBQcsd10yHxNJWvBQ8AEOajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYKRtYa6rjCBCWWN6P6qjRVJnp0ZNhpiYezPQ3vank4=;
 b=Fcr+uRMXZy5IiKgnETciZQmTcR84jnJl0kES3SrnAY3pxSQMJ4xHuv5IUywQJqi0gyx983+7RqZRJ/teSgenrWX9fhU3ZDoU2CsjmrSVhvaEPhC0Drh7e/kXWrDLtHrmmn9wVgv9RM4R+NWBNInilLgZL/pqhdjGDJKddFzP7gFN0Gv+34KcrYwpiVccu37d+53m3oUjx9LT6+gwHZ8W4Rr00srpYQsUq2GG0Bwz1Ssl6y/g9JwhM7Rz7jnsYBgFuoR/caSsTQyZZH5a6TTGa0rJpvDjwMiuDOE+ULKJwB0rxrvClAs7HMIOZXYiVVLQroDKE4ULfSXPPijNDi3VOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS5PPFBB8C78349.namprd12.prod.outlook.com (2603:10b6:f:fc00::660) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 14:16:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 14:16:28 +0000
Date: Mon, 7 Apr 2025 11:16:26 -0300
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
Message-ID: <20250407141626.GB1557073@nvidia.com>
References: <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_KnovvW7F2ZyzhX@kernel.org>
X-ClientProxiedBy: BN0PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:408:141::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS5PPFBB8C78349:EE_
X-MS-Office365-Filtering-Correlation-Id: ab660d04-14c9-4539-34f1-08dd75dec96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NTtPsA3PppeKgzMJfoOMpx9uoEGD0tEvqxL/9QdAUr5yXSn7h1eI9+pi09Gb?=
 =?us-ascii?Q?TicVlggscSJ8xgGT0WWhvFnO2e5JB3N9XpAej37a3LiM1us8u+tQFZA6hntO?=
 =?us-ascii?Q?ihsHjuG70/RHLewmJCQjR5KndFpxUkLiHrIEEeSrC8aTgqm9etT00JcDAkpr?=
 =?us-ascii?Q?Pv73pTaRomlCK7SsZt5KQYmd8+JVekjrcNmkjfcI08bluFhxQSfTjr41/6T5?=
 =?us-ascii?Q?79yN7D2TeMmWFdqQU9u38+imbaU2vp2wiIbqHlvoRovxfgbDOarK6BeIB6e1?=
 =?us-ascii?Q?K8IdscvgrnKuu+vXZtBC5iUq1m9PlqN8TnXL5P95MoFbRyvVDeBYpCs+V3zo?=
 =?us-ascii?Q?kM6h9QW5Ai6z2k5UehzBYx9THStVbI2eaJcLTOje6mMkMwHXLw+HoJrvyJPl?=
 =?us-ascii?Q?/UIu/ea01x+kh+k3/oFhAw+pC7pypPvnrP5UuvsJ9FH0QRZPXBSNP0c0WXgu?=
 =?us-ascii?Q?AxD2QwTK3urseOCANddkEvFlDB485c8ZW72SbFkuWHB+YS+srjDpx6gbzHNE?=
 =?us-ascii?Q?JDfEiPPPc8AP5z2Bg/kFvvBngE3c+76XdKEE7zAKZeQoM8bK/yIl7wjuGyjr?=
 =?us-ascii?Q?5EfKD301P7DJEYvLAESXUFlm5jo45p487+ovTAaoJuX/rYQhLTEZyn+vh7j3?=
 =?us-ascii?Q?4T/InNQhHxrBgoQrnixJ5PW4KJbH+KgyhGiTLoTtev+sqDMHmpB/Yaqy0uMx?=
 =?us-ascii?Q?DPAPruwunfziDSMW1m4ZO5yyN2Vj0BQzl0SWTH90wLQExBOHGfWRW0Tckvt2?=
 =?us-ascii?Q?RtU/eI+G/J90lrjDWhP8EOtD4JrKWoCDG2uAqLu6uXc7qwMQ/jsvo/cM3VOP?=
 =?us-ascii?Q?E+WyRTIIZbqvqFmeKzF1/2KhCb9QxEk8TIbye+eddYRRMMi+WVtVYCaZRztM?=
 =?us-ascii?Q?otEhTb/cVIeTW7f223f5KNi9yAQilnlDbWNaibz6dP+fKR6EKzqZKwmINlAa?=
 =?us-ascii?Q?iA1SnCzIPROHhh6fK2O2f4qZVQ4LNySUz8yUklHxq2LnnKnWQfayKZH+pwUu?=
 =?us-ascii?Q?hAOdUj3PE6POjURfbT/yDIgh65u8VTXOeXle53VQr9A8R2/dw1s+7LnHcXG0?=
 =?us-ascii?Q?u3D+Opjmyp+s9m6TgfRkVS78C+Ya0+zN7KG070iOiaN6ih3/MKskRiMEtZ05?=
 =?us-ascii?Q?Sc18C3JrmO6dzHqpfb5++aAtd/2ISKoiYa57WwbHyZm4kv58wEYnuLk/Y9zX?=
 =?us-ascii?Q?7plhFsAXHj2o50h/2IGzpOPn12C52MEqUhq2jVVCExAjG2tsYh8xUcuYaT8F?=
 =?us-ascii?Q?d5M8SK8nHbgQrBExumIebiRbmXzNg4571jDf2uPSaC2lxU7JX7Ndyy2YBY34?=
 =?us-ascii?Q?8pi3gxUnz2VXWN/iY2dUIzo3J4f/uTrXFshwtCS1OMqgID8NX+u9kKv8Y4Yo?=
 =?us-ascii?Q?cOnWzGVqtg1lK//Q/BlsU+0AVqd5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f58zFYKeA2VEWs2RcQutLP3Nj2rVYlWEFG08qh6usa2VCDPmv5HgxQak4ek5?=
 =?us-ascii?Q?WAHPngoPSSVaMkErib2fFtzYLUeF84TiRC6QSZeIB69TN+2DmE+ry1c/Hoxi?=
 =?us-ascii?Q?klXF7M8ZKSF6izacSGkBmY8ZCNwczCyP/wAccwUCjOFtpGtrPJLhrSWBjWo2?=
 =?us-ascii?Q?lQe6G5xGgRDCGCHV+fhEDbFgKrCaVVfwf0HYHiwr1Rq94iiBUToM64wNAq/M?=
 =?us-ascii?Q?cqbNJMhFAW+l0WZ1ZNEbzC+XbBEmw+7pijxQjtGrxLzmDABQdq1H97tEZXrU?=
 =?us-ascii?Q?zvgVfHVmgVP7C1t6QnS3ScrBvuytBZqr8P+LKQpNsRACu/9/viLIP8A5WPK2?=
 =?us-ascii?Q?QwVmttXsFEfUzoCoyBYUHvX4nOXzvAO0vYCWnI/unasgL2pgcss8rJHB1LHJ?=
 =?us-ascii?Q?LI6q2S5dda/4YHKykOOh7cOixONgb416swDG4tCDpQW87HS8LpaRFp1rnk+X?=
 =?us-ascii?Q?CKvoO/OACLdyYY7voRun/qYG41+Rj1QXXrKdohhAzQIkFFI7zHCSsr9vuUpd?=
 =?us-ascii?Q?+5gmFBsnAejdWfhLdaNcFvQ0R4sEkFgCNd7ZGxSpb4yZI1f536AcpSu5OYav?=
 =?us-ascii?Q?GOc9bqGdSZFhNKFtBVIf4sL0I6dtVeP55nUXRVV7xPLxANAVo93/7S4q9ML6?=
 =?us-ascii?Q?r29DTWThbGKm+PtApwNX4CQ9AZHc+dVP1qdqoLGudTej93JgVkKYnGOCPHfr?=
 =?us-ascii?Q?0C5IrWXC9apczkiskmbwkLASVB4le/0HkXXItWdzpjdvUjUTYk5aHVYSsgHd?=
 =?us-ascii?Q?OtGey8amUSNF19J4t/3wvXZTbr3Zk4Bk5ktl37R9p+xXbhHq8k+jeZ8MeRsF?=
 =?us-ascii?Q?Kj0UZzkGcmg9E3aAyyLfIx8V4nBUwCUyJpKMBptWqKupKwWx8E57U0F83bJR?=
 =?us-ascii?Q?dKt8u829z1IN0AvKLf8s96juLFqiSk5E4HRU4WtlWJB4+6/OlxzlBSR4Vgv7?=
 =?us-ascii?Q?0FVeexVObIoJEIbZ1e2Tj6q9zdn7vwYzVJ+Td/9J1qL6A1owKYkhn4FjopVm?=
 =?us-ascii?Q?6Tltk+at06JHpwIwPHELij8lXr3IIt5BtpTBTYD6c9Inh9EhU7VbIMEcdSlt?=
 =?us-ascii?Q?Ro8Om9qlxKH43QU6DG76Lt4fL21mLMDGNuqIVIswXZpP1wVg9JpUOMP9Amoy?=
 =?us-ascii?Q?xqsUHSDvKdqf0MTLRFrEYkSH7QvOvTTIiP/G7ne7jlSaqhFbha0RB+M7lCfK?=
 =?us-ascii?Q?zqQPd7I5AMt4CMT6OfnXs4HBIJU66FURquDQac69lnqcqM7ioLyFQdgw9H2b?=
 =?us-ascii?Q?sLI6K7BrjKYE94XILXvdUfy/HGChKf6+gjN+b8ti3d7yYR97Bm+eI0fP05s8?=
 =?us-ascii?Q?Cle/Q8Cy0aiQhpBLcY28cBlmHkv8jTpe9u2VfMHPsfHau9cqVYTfjtLi/zOA?=
 =?us-ascii?Q?qpvmKHcx9ANRy3TSU/Sd7LhdwzPWV6IQjzi8M62+sWQ8QLbmmHTrHzLkEjIW?=
 =?us-ascii?Q?MZR3ZfVJR3AiPc7iedg0seQbg5NRvdq2MFAoyMpIWZZ0SssiAN0Q037SaRyN?=
 =?us-ascii?Q?V4qrsOY5pec8j3lT5dxqDxiLRpP340HXdFp1/PYmJRnOcHb1CoBkFMkouRPa?=
 =?us-ascii?Q?vAFf1YQSraA3gOR+d0DrjG78hwM2JPVYokyFTd7D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab660d04-14c9-4539-34f1-08dd75dec96e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:16:28.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40bZOD6eCH9oaxtOuHzfVX//eKXHSyU3CqAJSY7dmBLjcpsqWbKuHNN0Pn+3LxS/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBB8C78349

On Sun, Apr 06, 2025 at 07:11:14PM +0300, Mike Rapoport wrote:
> > > > We know what the future use case is for the folio preservation, all
> > > > the drivers and the iommu are going to rely on this.
> > > 
> > > We don't know how much of the preservation will be based on folios.
> > 
> > I think almost all of it. Where else does memory come from for drivers?
> 
> alloc_pages()? vmalloc()?

alloc_pages is a 0 order "folio". vmalloc is an array of 0 order
folios (?)

> These don't use struct folio unless there's __GFP_COMP in alloc_pages()
> call, and in my mind "folio" is memory described by struct folio.

I understand Matthew wants to get rid of non __GFP_COMP usage.

> > > Most drivers do not use folios
> > 
> > Yes they do, either through kmalloc or through alloc_page/etc. "folio"
> > here is just some generic word meaning memory from the buddy allocator.
> 
> How about we find some less ambiguous term? Using "folio" for memory
> returned from kmalloc is really confusing. And even alloc_pages() does not
> treat all memory it returns as folios.
> 
> How about we call them ranges? ;-)

memdescs if you want to be forward looking. It is not ranges.

The point very much is that they are well defined allocations from the
buddy allocator that can be freed back to the buddy allocator. We
provide an API sort of like alloc_pages/folio_alloc to get the pointer
back out and that is the only way to use it.

> > > and for preserving memfd* and hugetlb we'd need to have some dance
> > > around that memory anyway.
> > 
> > memfd is all folios - what do you mean?
> 
> memfd is struct folios indeed, but some of them are hugetlb and even for
> those that are not I'm not sure that kho_preserve_folio(struct *folio)
> kho_restore_folio(some token?) will be enough. I totally might be wrong
> here.

Well, that is the point, we want it to be enough and we need to make
it work. Ranges is the wrong place to fall back on to if there are
problems.

> > hugetlb is moving toward folios.. eg guestmemfd is supposed to be
> > taking the hugetlb special stuff and turning it into folios.
> 
> At some point yes. But I really hope KHO can happen faster than hugetlb and
> guestmemfd convergence.

Regardless, it is still representable as a near-folio thing since
there are struct pages backing hugetlbfs.

> > > So I think kho_preserve_folio() would be a part of the fdbox or
> > > whatever that functionality will be called.
> > 
> > It is part of KHO. Preserving the folios has to be sequenced with
> > starting the buddy allocator, and that is KHO's entire responsibility.
> 
> So if you call "folio" any memory range that comes from page allocator, I
> do agree.

Yes

> But since it's not necessarily struct folio, and struct folio is
> mostly used with file descriptors, the kho_preserve_folio(struct folio *)
> API can be a part of fdbox.

KHO needs to provide a way to give back an allocated struct page/folio
that can be freed back to the buddy alloactor, of the proper
order. Whatever you call that function it belongs to KHO as it is
KHO's primary responsibility to manage the buddy allocator and the
struct pages.

Today initializing the folio is the work required to do that.
 
> Preserving struct folio is one of several case where we'd want to preserve
> ranges. There's simplistic memblock case that does not care about any
> memdesc, there's memory returned from alloc_pages() without __GFP_COMP,
> there's vmalloc() and of course there's memory with struct folio.

non-struct page memory is fundamentally different from struct-page
memory, we don't even start up the buddy allocator on non-struct page
memory, and we don't allocate struct pages for them.

This should be a completely different flow.

Buddy allocator memory should start up in the next kernel as allocate
multi-order "folios", with allocated struct pages, with a working
folio_put()/etc to free them.

> I can't say I understand what do you mean by "neutral struct folio", but we
> can't really use struct folio for memory that wasn't struct folio at the
> first place. There's a ton of checks for flags etc in mm core that could
> blow up if we use a wrong memdesc.

For instance go look at how slab gets memory from the allocator:

        folio = (struct folio *)alloc_frozen_pages(flags, order);
	slab = folio_slab(folio);
        __folio_set_slab(folio);

I know the naming is tortured, but this is how it works right now. You
allocate "netrual" folios, then you change them into your memdesc
specific subtype. And somehow we simultaneously call this thing page,
folio and slab memdesc :\

So for preservation it makes complete sense that you'd have a
'kho_restore_frozen_folios/pages()' that returns a struct page/struct
folio in the exact same state as though it was newly allocated.

> "folio" as "some generic word meaning memory from the buddy allocator" and
> range are quite the same thing.

Not quite, folios are constrained to be aligned powers of two and we
expect the order to round trip through the system.

'ranges' are just ranges, no implied alingment, no round tripping of
the order.

> > > Preserving folio orders with it is really straighforward and until we see
> > > some real data of how the entire KHO machinery is used, I'd prefer simple
> > > over anything else.
> > 
> > mapletree may not even work as it has a very high bound on memory
> > usage if the preservation workload is small and fragmented. This is
> > why I didn't want to use list of ranges in the first place.
> 
> But aren't "vast, vast amounts of memory will be high order and
> contiguous."? ;-)

Yes, if you have a 500GB host most likely something like 480GB will be
high order contiguous, then you have 20GB that has to be random
layout. That is still alot of memory to eat up in a discontinuous
maple tree.

> > It also doesn't work so well if you need to preserve the order too :\
> 
> It does. In the example I've sent there's an unsigned long to store
> "kho_mem_info_t", which definitely can contain order.

It mucks up the combining logic since you can't combine maple tree
nodes with different orders, and now you have defeated the main
argument of using ranges :\

> > Until we know the workload(s) and cost how much memory the maple tree
> > version will use I don't think it is a good general starting point.
>  
> I did and experiment with preserving 8G of memory allocated with randomly
> chosen order. For each order (0 to 10) I've got roughly 1000 "folios". I
> measured time kho_mem_deserialize() takes with xarrays + bitmaps vs maple
> tree based implementation. The maple tree outperformed by factor of 10 and
> it's serialized data used 6 times less memory.

That seems like it means most of your memory ended up contiguous and
the maple tree didn't split nodes to preserve order. :\ Also the
bitmap scanning to optimize the memblock reserve isn't implemented for
xarray.. I don't think this is representative..

Jason
