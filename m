Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3E1DA53;
	Fri,  4 Apr 2025 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770856; cv=fail; b=NRfxFH35AR/daoujrJ1nTa6lPOHmDKwk4WgCsAAhIR3uSCQF33A63CkcBeXzF7zuCWZ5s4C3gB7aKSGn/D8/P/7tmfjch2yVX7W8tOxCh2/eVguO0IfXYRoRKUcLbv3ckq8G9iY7kDynZb8SRpYA3Cp52/m/92FbuCMS9J3wwUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770856; c=relaxed/simple;
	bh=cHyJpWPVPHcB2ScRImVUG7Ggj0y0WtmfpxyVRvkj6tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lvI5jTPWxKPK4Z0pmGRkgCz5FERE5MoaLxKAwOvsE/BYq3/FJmOTfsFM9hjN7L166PXQl5OThhpcPG2kyAMOYZ196e7azydV0wNBN2S1+pDe9p5s7Uwj29xg46bx8DUu/uEKmluGxzk3JJ//gauU67WvS7kYAIir8ezcq9wGX9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=huLp0a29; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="huLp0a29"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYpQEZrgo2jm7/6WXEduJXSJgOVmFYxbL3pXlzSjzOgL4WeVOABQ5snHYqeWq2RNqpsQbfRGWutUo66XjqM4YJSSOMVVfpPKergV5lw6YBdXyYoGs752NJVmOQL1Zzu6m/EQ7CVe0C4Z83rtFkfmSWPPjvlA6z1fwMPHFOeHDSxnlUqeA7/4ql3nfaA7LP6MZMmZqbGKHgLAjdoEADkXO9mhKpLLiapzzJ8FdeIlUX3U7DlCkQIs4dZ8fH+jXlCybqz5zWASMtYP4WBe6ZhITMKggm5b/nBYBzLJlnuPvwhLmiRLH+txXxb7Auo43+JdJi0kuxPgdokeJhtXq1tRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GffY/P7Us8yWO8wuVk/IhGQoVQp2CxhFAYZa2+LmXhA=;
 b=xaPLaVQrGJgovYJ/LFBZncr7Bb9wqktpBt2/dsVN/LsmiDUSaGyzy6BUL+aTcU+9HNuQ8mpnV87hS3PzobQsNwZ9dL+Zp5ckSj6xtPOWCsaJacL28LrSijmK300+G8ruw6pwWX7NILBtKnwvdToGis2C6krne9Z0SzNCf0pwa3tSXjZuRyrA81G3eEKt3niqb620X1LizU7zo52sGdXP5ck9vAppX4Mymk5ZFmSNKzrDfKrGRXpO8ezQq2xfe7SmqpKuh8oHDSjH8gNtt3E9HY8priJzv67dlVvbakpm3cmLrWIJxccH50hXG/9UvXniMDnlZMpWz73N8rB94HMbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GffY/P7Us8yWO8wuVk/IhGQoVQp2CxhFAYZa2+LmXhA=;
 b=huLp0a294OB0jpOUgN97K/AqEsDK7SyKEfTquaba3/uy/NRcyTBVxMaN8HYMw9l9ovWrbg1Ch8anJyiRGeTHuW652qgry+kfidQvMrTaeg6UQhwn/9vK/DJPByPGZHCqVAF+sIZW8PrSWJDEtekdtHZwX7OtjyqLuEXR1Ywis0OfPyQM09uQ3v3sbqf0/V77iqtNJDAfkyVAvsYG+DEGw5zhERLmodEaUjSs9itwuuHdlkAeVG89wUUoK0Jcf58ro/cue97bFHlZLHG3H2tSVCl4RG4eEcRhfFAxY3z0oUI0e7JXhmgOXzKJzQezPSlM2ybhZnwWxvcqoaYjDldQBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.54; Fri, 4 Apr 2025 12:47:30 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 12:47:30 +0000
Date: Fri, 4 Apr 2025 09:47:29 -0300
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
Message-ID: <20250404124729.GH342109@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--sUYCvP3Q8nT8e@kernel.org>
X-ClientProxiedBy: BL1P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: e649293f-07a4-4483-6bea-08dd7376dccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A+fVYUpokg5VW4Fke7MWlqxOAzMatzFWg4rOw3KyxeuFz8yURoAMp5Wwx6Jk?=
 =?us-ascii?Q?cINS9cVvFqpGo80CqpVyxDcJ2UB9gIQFxe88hw/icn4yVcV8ALMRY3GNBDmF?=
 =?us-ascii?Q?XfwSfRMGgg1u6xJuqB9HG17lA7N7KuimfYMwEhjXoU2DczO4uzSbQIeRuDKC?=
 =?us-ascii?Q?dlgIcMDbDwe3szODF5Vb1tKVfcHYJvrkO+RDY/OZXA4QAKrIh7OWZfA6Fnci?=
 =?us-ascii?Q?YiPIdK2z9sqyA4R/1hrBheMN1nbEUXoLUaai6PPXambo3EJX0oq7+Z5OaIPU?=
 =?us-ascii?Q?Kr9fkZCr9MdCTSRmd8YHWBDS7n9IPBdETlNm1A7lheRdPpbv5Gz87WnsRXI4?=
 =?us-ascii?Q?rQPMUhMWY9DlMfRfDw57nIYbqN6QWrMHgx89ZsNPtMl12N0uvjCHLeQcp5VM?=
 =?us-ascii?Q?FhU389v6sm2IriVReG4HxG9IsIn5duBFML6DLcZUjnVI9CjsFNbLBstt427X?=
 =?us-ascii?Q?nLZg5hEacnKRZ0wzHq+hqBLbsIXtjse4IqCf1WVFKqdd67Yqs6r/cj0e6yPP?=
 =?us-ascii?Q?Pan/w9tGIcpTQMkmn6jwq62OoGB12bEZrL2WWAduvms3RjaFlNpha1ANfb46?=
 =?us-ascii?Q?52VnMCrWrbx39sh9HEU3FnwZvhIvARbYxGCniXXPU8Q4QksrsMQlLRQNyZvI?=
 =?us-ascii?Q?2fbyVDq9Vn9ApjyFzsCIzDYJiZI/CaVX26iPKKNKe4Mts9z3LwmiNFdJ+Bdb?=
 =?us-ascii?Q?M1caCbJEc8DKUjX4HZWjCE0Krb4HtIlKpIlPqyTb3QCNJefXUxauT4tcr+Sj?=
 =?us-ascii?Q?zAaeFdzZ3MsZtz0Pa+8/oLQyK/n8tV+8usijiWqq2SflwLsBXn8uJJbydn45?=
 =?us-ascii?Q?uTzxWWvtZ6Q835HFXbV1N3AFq9tlW5rDzFcKXoKHJFrSkUxbUTfKib/1Qr9P?=
 =?us-ascii?Q?RTrIivFbE/S9WikhhozJkHS7UpJ824k+gzUmuTPnKgIbwkdK6kAiBx87uv9I?=
 =?us-ascii?Q?P8B9qurZ9MV94EgkTKlFGORrCSNz9R7QT+sUDeRlrTyZmXqzfrZgS9loLQmq?=
 =?us-ascii?Q?/C9CrfGeVrHoeQGV0tvccbrsYWl5mcpyB8ZCsto+If+G6STAX9PM03X9zGSZ?=
 =?us-ascii?Q?ppKRQ/I0oKzgsgWS5CchX2AtWpnqKthTrp5Ip6K/kToMlBrqabqglL7je1OA?=
 =?us-ascii?Q?+kE5O9teZC4DJTcanRqHIH4mjUurJS7ZUvlXOTYN2cHmsnAAgTMiUppWSd/z?=
 =?us-ascii?Q?GpkJPk8Eg6g3g/iV91ePA+APLPXuv5XNN2eqtg+pwYzN+GroAAWjJW1KpU6h?=
 =?us-ascii?Q?jQju++d6NM7rloQGvBANMmQzy36GNqoOIAd+nv1YdK00+x6tOMTOCrb8WAw6?=
 =?us-ascii?Q?umf5FlC9PdS5pxv7NT1ATq6DzJyVz/Gyeuf8HM7ZTZSpNwW/LKDbmCzcEBK+?=
 =?us-ascii?Q?I5Y5dZV+q8Xj0vdECGEJMvS0hni8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1C25djG/vW3MRuH1xhXciRmPXVX2rwQ5YGrf6ds8D6pkBT2F710qrkfMyCw?=
 =?us-ascii?Q?B+Ibkj9aKht9KAEosFvaP2Vv/4HQZSJwQGOEMRsLB500jka0NVfgsi6zno82?=
 =?us-ascii?Q?+rd/11UfLfyk7sYCvnBEZQb6G79xU3pSpbjeLfE5FCIoTjLeyBFMoGvF/PyW?=
 =?us-ascii?Q?qz0mfTNkOYmRooDUjO1ZIBo0ewo5gZgL+CLH4NR+yilFN/+lRBOIY0U12nRl?=
 =?us-ascii?Q?VOpqEeFZCOWaXWkXYoF6bvqdta7Jhgw9D8mBtcqjtHS8yYZ3ZEOetzKLa/JD?=
 =?us-ascii?Q?EJVn8OM8+QSrRdne0J3vRCbV3CaK9YMGFE6xyNF+VC752dexB/1H4gq+h/KI?=
 =?us-ascii?Q?GDKPVFtu4AS10KdO6Eb4QwEjxrn9J79XGw5wSgk49WcZ2DzYGseNeu+okt+I?=
 =?us-ascii?Q?eCXBl3ZQOXxAFqt8KfzlF78HxekpBJD4F36F/lp/mlpBn9W8Y2Rr4iCmJ8xl?=
 =?us-ascii?Q?+x/eOSPf7TD5duITqOWO/cmPppc5hdX+RTOpqfKQK8SabawqQAzhqxiwk8xp?=
 =?us-ascii?Q?0LuUsBiwUTWcPZSL9SXNQyT4dLxLImB7TWsJLWV4e27SEkPVgwe8d1860pdk?=
 =?us-ascii?Q?wn9IAZY8zE1qFau9lb63Ti6GZaYdBAWZvJvjkhqun5juLFztTDgQgJryhGAU?=
 =?us-ascii?Q?p+8GErKspqq1SEBTUJPVihxA+dzIRHuxNd8/33ciM3UsV4VCVOa+4cx95yVB?=
 =?us-ascii?Q?wAxQVbnOC9uL737SY8TlIadebGETckj3JYmR7qwF+U+icVdHnv/JX+Qbbrjt?=
 =?us-ascii?Q?doNLwUljMCBKjBjFBR1smI6aVbhTtkqLHG+cr3FThKR5cf5/N6JGfZAC2WQ8?=
 =?us-ascii?Q?D5k4rLNCsfK8KzAyHlc5Wa5eDo4rq0RlP12KKLgmfQ2B3fFYIkCBJY1Z5200?=
 =?us-ascii?Q?nc5s3YYBZC7k7kj4LvEBMeRclYEVBnZMLhE0ikME/aI5vDurBfLNpSSDvi5I?=
 =?us-ascii?Q?WZn8yz3SrR6gDNSGaKrJ8SpYTrlnndXKsksReOs50pJUIjoPkrwM2oHDcIfj?=
 =?us-ascii?Q?KU24eYdeEyu8dm5PWiwyFw/OZBA/AcwJsIL9hI76AwJAqMErly9egcTqzU5c?=
 =?us-ascii?Q?KHPOSLQRdVntUF4YDJ/Pb1eR0QGJoHB4gAk9qLXu2Y8uh9mfzH65/JfQb8yX?=
 =?us-ascii?Q?Y5D3YDTT4Kc8BpPxw4kTDWQZ8+8X6kD4TWO55UvRmwM2U2TcPtQuRFc/9EiC?=
 =?us-ascii?Q?bVkIV+x/WN1urCFPwpB428umPBvy6Pl4K13oy+ZrrzCGHx3jeTDUrR6xpj3z?=
 =?us-ascii?Q?7Lj2EcQNqMc+9S1Bv3tLWQTg2X3cpgrCTIjASdhJz0IVOEND5FZOztLW6In3?=
 =?us-ascii?Q?hrC4F+zcl/zvfVWAnk82FdyIIZJBqV26YL0U9cva3rUgJ+d/y1gJyBcV/J8u?=
 =?us-ascii?Q?b9rs1ai+QoKo3ztfUT0prfELBocmpnLR0BkfcT6Q5jRg3Nm5+YPMJLq+w/Zk?=
 =?us-ascii?Q?3BYANk8rhYihaQIORGE7mLNrNyHJs6IrOVnjFBpMCE8JP13RFZ4kpwN5RO2D?=
 =?us-ascii?Q?/8KAOyYV7qxs2XccC6IN/D1DVEjQGtf/UETGcey7GOxKbXWa9QXPBEAXkKhy?=
 =?us-ascii?Q?6eE8Stv5UpPSKYMecvxVpdvfxIKL0tl+VnuFwzB5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e649293f-07a4-4483-6bea-08dd7376dccf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 12:47:30.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8/H6OsIHMFLa2blvRzv6Bimcefl81oOxP3d7M6Lc3JINGFruL4qMm8IyxcwpVHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133

On Fri, Apr 04, 2025 at 12:54:25PM +0300, Mike Rapoport wrote:
> > IMHO it should not call kho_preserve_phys() at all.
> 
> Do you mean that for preserving large physical ranges we need something
> entirely different?

If they don't use the buddy allocator, then yes?

> Then we don't need the bitmaps at this point, as we don't have any users
> for kho_preserve_folio() and we should not worry ourself with orders and
> restoration of high order folios until then ;-)

Arguably yes :\

Maybe change the reserved regions code to put the region list in a
folio and preserve the folio instead of using FDT as a "demo" for the
functionality.

> The xarrays + bitmaps do have the limitation that we cannot store any
> information about the folio except its order and if we are anyway need
> something else to preserve physical ranges, I suggest starting with
> preserving ranges and then adding optimizations for the folio case.

Why? What is the use case for physical ranges that isn't handled
entirely by reserved_mem_add()?

We know what the future use case is for the folio preservation, all
the drivers and the iommu are going to rely on this.

> Here's something that implements preservation of ranges (compile tested
> only) and adding folios with their orders and maybe other information would
> be quite easy.

But folios and their orders is the *whole point*, again I don't see
any use case for preserving ranges, beyond it being a way to optimize
the memblock reserve path. But that path should be fixed up to just
use the bitmap directly..

Jason
