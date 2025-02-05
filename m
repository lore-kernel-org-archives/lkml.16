Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4892810F2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714789; cv=fail; b=DyF6k1AyodETfVXW3PYIUEAHUqQjlARrOYAZpMzZTxftVFsnHs/1LZdN027QKlRVhnByaZzfGdcWSB0viGEQwhQempfi9kZCL9rwhaEpZx31MWUXq8XIx5i32gOQCICQrvueLB2jNndYa+R4RNTyT34W5ZxzrOs6NJUJvXbuidw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714789; c=relaxed/simple;
	bh=sS3bOQGWVX6P7Va+RvN/0MDT4LKIWazC2CVbHBAmH6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f8ZD3BHAPO5ZHCWDtzh/cOp5+m1+2X/EfY5q/u24mVEXJY/LbMg3E8OqmLR1xVSuqwQMANGNhVCl2ZtSJz8pKqLvzXkUhHgr/8GY24KsRVlrcsuSbJWygt2sGaVa6TBoq3O2zW/hoWpYTQXThkoDUzy2oe/53zvvMBmpAowktgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lqlxCgoU reason="signature verification failed"; arc=fail smtp.client-ip=40.107.212.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lqlxCgoU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNkD2mP3NykeLcDt/tyL+EohhMbiEj7v85Vj8gil3JhGsy1EounzFQxhpzje8Sy7S3QO1R/ZeVKSXtDjWZdaB9RiIaXq8+F3FOvi+HDos+rpufrrTlZwRCwVBwlUl/ZQJ3bo07iNSlotcW5gKseLb/7J7DvkQb93Zq4fCgdOnW6NFiXYPv6bJhw24v2cfwSIGmBFuSJzmCi1jFKwJKO+mikr5o/5Gwjom0o5LdJq4d8tzPbZqNWSk4ET2z7k+dRTvWsI73w+8OTyoOu27Lu+5nB0FrcH0qgmSyVOoxAHYEg5XqhaUKZm6bsPq3MK3TDAml2vowFdT/3cyG3hGEyZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Srzc74yHSbcxIwxi1WpHZaZL9NAw87WUC9u2cj383GI=;
 b=mntsL39miSgGIxQ9jl96KwdnwBcagdzsEg53s6BYUWaSxXWJrwMlNbM8P5HlmjSYi3O68yV3uInvhKvo5HP39JouEpozW+DdKRpFM2QmHL/IdRII4dNiuNMe+Q5nmXsgSJRid+uMl/5xTfTozGtrOtFFdwvUyKNgvY1sBKKmxVVUSd6dMDXlvI5kWFGLhlZ+WEFgxXqGmrU2Q8DIpJdtnptE1L5FYMdBAuwzbKLXIUP0Ovcoa5aI+ArC1d2zpCZSbn0gq5Y7lpJQFu+rEAoiCLGWddYt0gqHLbELTlawpeHExuV8a5hsKVg5LMkWNMwB3ygktObm1HOuTT1asKg+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srzc74yHSbcxIwxi1WpHZaZL9NAw87WUC9u2cj383GI=;
 b=lqlxCgoUkLToNmyHb1dX2OwkzRkWsoWhPqi64nXinx0uAh3OjSBx9dgyCW2wRO2vQs7znX2Ha3+v6CDYcsUp5+24Is4fNSd0uCcuSkBj9hf1ZhFj4nPmPSZjs70VwT+YpL/U6RkIRK4n5qbEKCXTi5Xu+U9ZOUEZWmTF23X/iVLJB75VH47aygUXGnPYE7ROYkvHd4fap5+m0IoRzhDBvDFMmu0BHShq/MYnlhvCLg4/jNcagi29OUlibGVQveJElaoktnPzSWznrpNHbXMDc0gZXdJqYpdgbx4GMUvqgM5jbzTzjfoUdWtCXTLarQT4PbewcGoU3xyPpM2/+iK6KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Wed, 5 Feb 2025 00:19:45 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:19:44 +0000
Date: Wed, 5 Feb 2025 11:19:39 +1100
From: Alistair Popple <apopple@nvidia.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-mm@kvack.org
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
Message-ID: <g2dmtynytclbygcmzaifqrbi64ozw4e5y4mpd2pipsnlwhmhyx@xiy2w5x75fnm>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
 <87frl0snf6.fsf@all.your.base.are.belong.to.us>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frl0snf6.fsf@all.your.base.are.belong.to.us>
X-ClientProxiedBy: SY5P282CA0093.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA1PR12MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb54c93-76b3-4e81-a754-08dd457aca7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?tPR6Tz1fpolZvF/Ny5ViX8yj3DQbjLglTOUgokLaEdt1YQzE7df4ekDUap?=
 =?iso-8859-1?Q?y3889LQQ6ietdns2yy849UyVsxAVTvvEoIVoXhEUMSbIgh1vcTtwTZcg9u?=
 =?iso-8859-1?Q?lqOCtcxgaR1VUgkfRwosfs1/9iCBU9q0ZCH2fJ6EO6FEBIo0A5VDeRsJqV?=
 =?iso-8859-1?Q?9gYr8wzJFM+ecnJS53NjoB40DBVxzKZEQypLd52foW7IT+kRRDpZ8t5j4Q?=
 =?iso-8859-1?Q?OfP1XQ36gNMkSHTnZLBWYpwOQ4PqsXTPuubGPmnvnwzlSNM1JurK1AycnZ?=
 =?iso-8859-1?Q?VeA1UHU1KshD9j3PcSTHZHwlzNY66wFvxVGBo1k7Ps3gi6eUTWCq40A9oS?=
 =?iso-8859-1?Q?JqmzqxUeY2mjqd2eGaE2oPqr9dXYijN7t3ZNgs6pkkI6AegDK19pN9QWPI?=
 =?iso-8859-1?Q?6uN5PrOzD34JDJQFmz+dBsCfYuL4m1TuImixS2ybAWqXqATGsysIqDEVdP?=
 =?iso-8859-1?Q?H6eQfLG03+AXQNWu8Z/TaGom/TlKNlPoklUnQ6SUewtExp+kNR1fYLmMkZ?=
 =?iso-8859-1?Q?goytBlJLVYnChcRu2a2ee2Jw4VhoIONykRMDwUDiN12kOwoWKPS3vI/vQD?=
 =?iso-8859-1?Q?7Ml5msCXf6bmnimHSMSLhwyc7nuAjHXoG+CTucKU5ZKTqo7ZWifkDEY2eR?=
 =?iso-8859-1?Q?iZTeJUa9VAhd8VaZqy2eF+bYw4EJXZYSSH8EfimH8nLipphvVW5yLp9pjd?=
 =?iso-8859-1?Q?C+InqDbOJcVQcLaIQUwJtqwL2u5wTjiid3JnM7WW3neX9nJHAPRZn0LGP1?=
 =?iso-8859-1?Q?Y8VXhvR3tZLN+iJeWgPPQHUFq6aA5pELASp9ZsxIdfi/HcO9J8YAIK/dHP?=
 =?iso-8859-1?Q?o1ZPEOmcW1TVyCwfDlCbM4AT/niKPe3TN1ytlKkQwotciV1qi7K4DdywKF?=
 =?iso-8859-1?Q?+V6Wu6BPuknU9SW4u0GD1b83vPMzQ7WI62hQx877abZY4NaAHhgpuwFXwa?=
 =?iso-8859-1?Q?mOSTotme/dsJDOGnRNLHJSPyF7kHTkUYS0lM8XZxBPnQy2ecpvZ22t8gRH?=
 =?iso-8859-1?Q?gBkPMHGkAfpKscQxR0ER4qwLFEDeMr0rCznxLuWcFg3uzxzN4ZNO1ZyVbu?=
 =?iso-8859-1?Q?Vb4MeUJ0tXPTmT8/XaNyMnYgJDkCPZQvUgRp/vTKoLdnfp3KQixawOVxJ7?=
 =?iso-8859-1?Q?oDMgQ/DQd988u5qq33PEqrSUgppd6jxiuBq7NS+f28DsipBxG+T8NfEQtx?=
 =?iso-8859-1?Q?AV3YEs/U/uIbOUzeQzrdpIQr/y4EsPvyixX3fr3H82eDHr0U/e3KtnzFP/?=
 =?iso-8859-1?Q?MkbHqod1AHuFNhkc1bW/jmMsd//lhaEifa2m0a3q+UQnv5DK9ZCAyB41WX?=
 =?iso-8859-1?Q?0TqwZMalG0gDQLtgDrgMk0Mni/eGpa+Nrw0L2jOz40JdTraP3/o9fi5ZTJ?=
 =?iso-8859-1?Q?iCktdXyJAF35ATvlEPBd/Y5RwxQ6SwKaoqfw8DjhBifazalajEIZLcsnQx?=
 =?iso-8859-1?Q?U4hYA0pxcslXetvh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4gPoDfyxx70TF3x/XUuJq3bnp87ghGW1PHj1g9Yyi3pnkLqebQUlMxAr3S?=
 =?iso-8859-1?Q?+txEvXUT4UxHUDHw3jvOof6SwnVuj+R/+mVD5syzBTZjfHjTrA/sKhdsXP?=
 =?iso-8859-1?Q?L6DvosKzV80gSsnhhzuLG1fGs1fgAN9CtYvcU0I3PKxCg6q4a/XF+fkL4y?=
 =?iso-8859-1?Q?F2ynM5rUTzAZliV4ZOnYC7sKb8faVIy7N5Hx0E4RGQR1DDOmAKrVvTLrt2?=
 =?iso-8859-1?Q?W4Rbpj4WSnSzTGeGW5H9C/uQ5L9x+3Cc0UrtG1AasFnrFCjw3o4uQ4r4wx?=
 =?iso-8859-1?Q?YMy9ocHrF/C1xLnhCvj+rKOs/0GO+KmAbAeHhebqpdOr3HiYEx4NFxYwmE?=
 =?iso-8859-1?Q?66GfOEb5iJEW0sNku9oo4HJeU8VKIDX2lMccO0/2O3MFQd6aDpUG4sa+eF?=
 =?iso-8859-1?Q?e1g93HMkql9Lc4s5Uussh9KsaE58CH+K6B8+z54Wd7ensUtRNkMNTK+JqU?=
 =?iso-8859-1?Q?Xi5hp2D9b71mKhG++KzVavBHxT7pCTu7pcGGzuMH3TEZa5GFGkY9H0+KDj?=
 =?iso-8859-1?Q?QYdFlUzvcXh+KCvR0KEdb073HS9ryYKNBC9dDIfYK7C3sj2uoFCFEzxSJZ?=
 =?iso-8859-1?Q?tNMr7FMBk1CS2zAJ96NFg0AR/Hg3w57wIqSF2idlQ8jfTpHLqrqF+P6quH?=
 =?iso-8859-1?Q?5UjYGzF3j3V+SngB39uqc75gwh78dOYk4ul/s/hsXj02j2ehcOKPP5fl2T?=
 =?iso-8859-1?Q?RokWq8vLouPFMryqchNnqdpysfhkGPWQaMrTymoGz4rKvhbuhAbtVxlsTG?=
 =?iso-8859-1?Q?LHWpFHAmguUhrTciMecm30OPqqdFbh0kOGUU+GYG4RUv2D9iBrZM4fWF/R?=
 =?iso-8859-1?Q?HZllipKprMZHUPHRMIqx/XFjKr9BynpNeWzNFVyuv7VqGrb04BbPjhIFdw?=
 =?iso-8859-1?Q?GnolV4cCz7SjQPHGYSKgzFvdfQogesuObWmwKZP5fSA40Pnldu5ouk0SL6?=
 =?iso-8859-1?Q?hfL5yZHpB6huyWqC4Y3reAxedS6+BgTgQ8ui1vQP7XwNKvcIm0WNfr5voE?=
 =?iso-8859-1?Q?1EHOb27g7uqWd/lSQFIrhgHTiERjQv+hYAzZzlULi3T6Ug7pvRcZnuDP42?=
 =?iso-8859-1?Q?6ZweK+f3g+Jcx9DcQVJfOwwaPZK4VpAXSriYaEff4Eus/EvAf4eWmbxvSQ?=
 =?iso-8859-1?Q?9xHkI2X7nN1xmjNtJfdMEI+4m88gs/m1szAg2dERQwCIXbr74pmOikRP/7?=
 =?iso-8859-1?Q?7LbeGZXxsKKYvMPhX2aVcATMYupAy/30fHLaHN4ITfixwDBZTJK0KW2SsI?=
 =?iso-8859-1?Q?TlGZm0tBpA7taTALnm9rXC+OfzNHDmZsM3+UaHEUoLG5Bv/crntQvXAid0?=
 =?iso-8859-1?Q?sUgg+SeG6ybeZyBiZkzR3xxIeGSCA0dlsfu272mAyw1lJ67K9C0VR5lcPN?=
 =?iso-8859-1?Q?gfCpTuBsoo9ROTSQO1BGgkSm+VggGRh4emLMiSIurMvh3vWogwANbwUwzB?=
 =?iso-8859-1?Q?kpdjSig/G+Y2WfAYMjgz7Wvh8mbrWAEvvP+OO2JmPxG3jozX5Lp7dLRbEU?=
 =?iso-8859-1?Q?f7H77evechl5foQ3c8Ej4/0wVjhvt56LW0gTfEDL490kwqig4qMaTJ0FUw?=
 =?iso-8859-1?Q?dXAOuVhOy7A2g99tZh9O32/ViO4m+0zW2pSy5i//Gzexxdm3j2xAhAUBNL?=
 =?iso-8859-1?Q?uiyJDNe0nAXK0LD3UtyXs6W9PNNYY+xeiD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb54c93-76b3-4e81-a754-08dd457aca7e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:19:44.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVYTGY6dp+wtfKgyqPVA25vcN/SeVkxoqTlRklbRYl98AXgFNFpEutSKT0+SqHfbxRU35Q9Bnds8bXnvF7N8nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843

On Thu, Jan 30, 2025 at 09:42:21AM +0100, Björn Töpel wrote:
> Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:
> 
> > The PTE bit(9) on RISC-V is reserved for software, it is used by devmap
> > now which has to be disabled if we want to use bit(9) for other features,
> > since there's no more free PTE bit on RISC-V now.
> >
> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
> > the build condition of devmap definitions.
> 
> Heads-up: It seems like Alistair's series [1] that removes the devmap
> PTE bit will most likely land in 6.15.
 
That is indeed the plan/hope. I just reposted the series based on v6.14-rc1.
Note that I didn't include the devmap PTE change in the repost as I plan on
posting that as a separate followup series but I'm hoping both will make it
for v6.15.

 - Alistair

> Björn
> 
> [1] https://lore.kernel.org/linux-mm/cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com/
