Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58528E3F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838789; cv=fail; b=oVRDN2rWHhCI1TRrptHXcUfLRYCt9suRNYF2znRQYVyenXuj2yqXqYkpWw6HlbOQ1k91lUbL+nfzMPFLDnWGwzZYdSp7DdrtwGY2AdksbVqvF1l+Z0NOBd1g4MZqix0dwXFifFGQYhlXbIv05l9Nzc6p8Lnl2zpZtyZ3iz9z3l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838789; c=relaxed/simple;
	bh=atpiAeX7l1Dy8C0XwCgirNl/049JoI41S2HkS9LIbrQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pUEEpU+HsBbSrhuRa8NLJ35UYi4TQmaM7lEDxa4Ctfcb3jRhk9xzBNsBH/S2lR1UPR6OzJdZ2fXQLp9dA53YlNq+Vpc5u6iOJsH1S/qS6hNkOIGclzoWfgZMEjfLFcpoO4yVXDFF5v5lP2MU0ZpZT/Qe1HnpdYYtgrOwME6LmPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmCFcv+o; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmCFcv+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744838786; x=1776374786;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=atpiAeX7l1Dy8C0XwCgirNl/049JoI41S2HkS9LIbrQ=;
  b=fmCFcv+onNn3459ElajmE2Rs2lRxr2QSvcqZzYJbjH1P2csKKaZKVeka
   ApQT+Y6eSN/0A5754yEltPO8+CDvOBuHhiWg6xs05Pmi1titejq7Qw66o
   O7NiJfSlHgfAEXDQ1X/yD3KK3NtTpCmSI+AkAV5k7tGq5j+5qVtlzvvGp
   zKJ2pwMqbp0N+IaJCZL4PhE9wHm+yKzeroAtsfvPobaC34+phWDh5h1n9
   +o46aHP2nScNE/dpNALQyeTNJlxS9fOxJjGyMHRdXV/BukuZW57GEo6FW
   Ann4k0lex0YFeLH++4eVnM/yjHrZUmqQkJQBTK33s2S+bX5IO3fPV0BJR
   g==;
X-CSE-ConnectionGUID: +wonokD6QUiqjSIi2rGCeg==
X-CSE-MsgGUID: JVbM1/azQMqIBznBFn3a5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50055955"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="50055955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 14:26:26 -0700
X-CSE-ConnectionGUID: zKVJRdfFRhmeUfPOP0ZMPA==
X-CSE-MsgGUID: JfulVe8KRUeEWmbDNf1Wow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="161562393"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 14:26:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 14:26:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 14:26:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 14:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/oFRHiFiNXop1xLbKIOFYrhq+zBuGlJKqlwJznzpS0wys5oO2IC7Oi8XeSPcqEKePBA92ZND0FvDHmxcYHoXskt5MqsEll7G9PY8AKofVNno5E1m9ryphPRzIsaYRlQz2SYffyF4f0jXvkk0YZUk1WEMRplb3EBPALtw7YrnrF1MtOs/Lokna7jQap0aV7lT0CBc6BVMw6ECEoki+RM7wD8wVCZ0JWq8gaBHpRzePkK9mbK5GXGnFg7vczjPl6hN+gp7NMkDln1cz/ZVNMsmLo6q/ADO4rTjOMK00+6Km08eyNEJhxewrb0C/Stq2wgsTohx3lfqqTotasvNr+Xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AboQuMj9SI/2QOmr5Xai7b1gvDPM9emp2eWPnDOH+1A=;
 b=W5V8Qj5YHc3eWbxU1znJCrydlLpGRKxYseRf/mVXOzFCDufspTwKGzWJEMRLBChWnsEcSeIBinsukK+fyJzZvjVo7B9UrIjiR4jzQRxPCMby4sJFGgUz0vadssqFZFyV9rx4ZRtAHB3N52XbYZJCEVwNvpowqdGxVt+y6EWe0GLpWB42hnVleGkwAf5E0Zd51UrKwWRMJw0tZeiJl2KFlttMVehHHbEbrXmhhGCYnYHcHmNhzbgpA5XBwAjigq04yGyjHy9dXOxKFl0p2s/f+4zPKgydW3rQowvB3R+9LEgzstoloDykgGcnTZcyhscN1cjsvwi1+ngy8ADw2OWiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 21:25:52 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 21:25:52 +0000
Date: Wed, 16 Apr 2025 14:25:49 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Naveen N Rao <naveen@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] x86/devmem: Remove duplicate range_is_allowed()
 definition
Message-ID: <6800205d86e73_71fe294e4@dwillia2-xfh.jf.intel.com.notmuch>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>
 <s6fek3k3zsgf74yuppzckhcnud67pgfitz66n6uwkky7gvjcpc@rp4pxvie2dpb>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s6fek3k3zsgf74yuppzckhcnud67pgfitz66n6uwkky7gvjcpc@rp4pxvie2dpb>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 487b67ec-d42d-4b74-11ce-08dd7d2d442d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d5VPxOu01025lidPqDXBN4E3tREmSV2phjFattLZhsNs52SQNa0Vrfo87F4s?=
 =?us-ascii?Q?NKv+CpcWW4YhISRdyu+I2J28tfARMAb4u0BAUgwsH/ZfGlr4Y9ZPjn0uB+t7?=
 =?us-ascii?Q?fUmROR1Gb8tiOZ/4v23BhxyfWybyhGCGChCvHtr6PudEpfwSJ0JiUSl9j2Eb?=
 =?us-ascii?Q?z7t6Bt9O28Bo+r2k0mXpqpokp+7T9Sh3vT+hn1Y945lpwm7nMHxpggi7xmkI?=
 =?us-ascii?Q?99Kx7EhQH1Js19u6//guU3egXM8zs20e8u3pZCkTjwa9lHLtyH+N2VkblnZN?=
 =?us-ascii?Q?DgsY4uIwXKC6xNogSw1iSxtWbjTooGIKvCfv4/+OHXtoHvE//GI2ygQbDVRs?=
 =?us-ascii?Q?/N1zUd2riiO2QsW85nUpbKzFv6n1eid635CoXuR1LjF/pWNNUeb6KlXHi2n+?=
 =?us-ascii?Q?hvr9CpSpKqmX3vUcr2ZiVVkGBNvDfFdaL+5FbROW5eCRGiOOBd/N1mBZybDl?=
 =?us-ascii?Q?vyfAhmovFqtGs4/QahhNplKVLkpvvza0+Bx3t6sUuoGmP9eRUTVfLhpI7Koe?=
 =?us-ascii?Q?tWUiErj4HtncnJu2Wv2yZNbV0qjPcFKkjBbXqcSyXX07+w1Tj1uqzw/fnVnx?=
 =?us-ascii?Q?V+CDrWOm+peDpyJgpsEiynjs5j5/TsVpzry0IU1ORfNN2fRfat6de2shFUFZ?=
 =?us-ascii?Q?b0S6cnKS4s37hxnPj4enVm0jVnyp3+aXtP2cHZU3aLmDPjh6SeHW56Duhg8f?=
 =?us-ascii?Q?zTrPVkaAiqDzCB7ZfPs+90erWL9cEIhE8vy5j8pH9DlMxHSQpRTm+fZl/ex4?=
 =?us-ascii?Q?bHtlvLAY3u2wmn3GQZnZmzQtmBrPFhiTt2MnRKleXffXcMscbmCCuN+N1xGd?=
 =?us-ascii?Q?CGs/JjCvXN+OrLzQ1WEhHBfo3MMGzqNnne88Vy5mhyRNyLiYInDAa8e+3fbG?=
 =?us-ascii?Q?6/46Nn/wnAVw9U3el9loCG9rgFJounpRPiORry1p6Sx/D36yKaw+b+1OsEVM?=
 =?us-ascii?Q?HeLbJPhjtsht/+UOQAz+hZWOgfcF1hwNfU0GLO6fvqvZkJe4gVFVxCyVqvm5?=
 =?us-ascii?Q?npYEhiGRri9Oq64OfUGR6/7MY36RIxuh7ZnHdRQE/rLm/P9guooj7O/pYZQn?=
 =?us-ascii?Q?5rLxLAQvOStRjjOkKi7e5TBtCdUDsI23FvB9+Vj05PDu9Ia8bpNrLgS3FVK8?=
 =?us-ascii?Q?TBIGATbaRl13UK2MHW7RKcDCgGZ6cHvoOQdNxzsrbMt7T8YVif1hCQricnco?=
 =?us-ascii?Q?zgX9ykPG20pZdtBud7gEELGBuAXhsQh6kWHpp/zxmUPwqj8kHVHC+u82cQKE?=
 =?us-ascii?Q?EjP/IYNdxgwTAyL4OUUXdPfT2giq35W6WowZ8JodaFHeLQBRv7LpX283C+YB?=
 =?us-ascii?Q?rGMEhoFjRqx/6DfH+OhL7AnF76M48SEcRozUP/4k+HiGzQmxu5dBC9IitiKK?=
 =?us-ascii?Q?4trTbGhGQGhHlOpR2BTdC19F8No5W4rST7pSvnlaM7rPIi7ewfm7SM7W+1Di?=
 =?us-ascii?Q?wIKuCJdnsok=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u8rSLaHGNxT3LFsYUbOJ7A3BJGY5EsEgLGelZ/fIoUVNDbUUkbNL3ihUNPx0?=
 =?us-ascii?Q?1Yr4gLmoGi2R6dR5J5zh0fdlHydjBBWNz2hRfXRLOImmJQNKLYp7V1SEun/R?=
 =?us-ascii?Q?5qxaEagX08Ku9CmA3eNaujTvhi/RNfun/x0bJmfKOYfdbIpskSJ5b1qaY8EX?=
 =?us-ascii?Q?b0hL9r/Lvqm3CDMAOSo1YjVA4hrPGBsZ0DuW+ok0Et6NBoza8luIbsSo1oIV?=
 =?us-ascii?Q?P+qUQ/RcRgbMjdBkoM+ugbr8J9mbxfKUHvQ74SOp59MzZWK5juGZOzyEd+c3?=
 =?us-ascii?Q?lMIVhg626+gNf8Fjg4gm7CuJflmQ0yMFe7dhYBGRL3BktYFBi6npMAqRVURT?=
 =?us-ascii?Q?bYzJCso0rdC9vE3vGigqjNz8a6ax/SVKbBoE0/Y5Bobc1L0vjY/Ds3wNQ8Qt?=
 =?us-ascii?Q?F7cMlzCRQJsufC0ews+rTO4OIXaJIr9Et1GfwaiMgAAVbDW2oaaPxj0BNLOA?=
 =?us-ascii?Q?yvaZbd/WNLBNWn7i+N/9uCaJYCdUpXjr4xjwOpOxFG01fxmxterKhJqozenP?=
 =?us-ascii?Q?n5VXSbbXP1YWvz4TEb6VcCUZH5C/UqaEpAZnEUMyfeANP7HnRkhT4yR5O6hs?=
 =?us-ascii?Q?Z53YjNUT0ze73qTADK2OI3yTurAl/HvfwPjIqKrwXX3Zokia25XC229O4KMp?=
 =?us-ascii?Q?3QezGAHEbCL09vdfjvA4gcLLxOhVK57dgT0AdMwbkAXCkHGSmqooG/6qICbl?=
 =?us-ascii?Q?PgKF8fTdXAKA9h6YcjuBOu8BCIDk81pqztIGlMNDfWYdXEjqQe0S+nq4jL9r?=
 =?us-ascii?Q?Tti/jnXOShjpk1LeRbCjFfVaCSyIQj0A6We8Pd7PaV/BanfYeiAKFgpgHfyF?=
 =?us-ascii?Q?HwB7wUVm+NMXKTp97ugZWgVwm0UBr17kD1L5Ei/0yfuw9Y18BieV/8qQ9GBF?=
 =?us-ascii?Q?LC0Fv5XWaM575ZoP8o5VK0ELG13MQEkBgCK3YLefeNLZCmLhCa70X1F3+tDW?=
 =?us-ascii?Q?ij86wKB1iDuTdCm6YiH8VeGwcDs/3cTwcZPHVl/6EUp6DkkO/2i5tELS7b+X?=
 =?us-ascii?Q?YZpQelCyJoffiB4FnMp57M2KqNwVNFw3VqHPb+jLNHLYZIIIMyraMQaczOHT?=
 =?us-ascii?Q?ezSL3Ecjig3UVnCaYinQMEOdLhBB/joerD15Al/8owQQfIMhJ9aVWdryZrQt?=
 =?us-ascii?Q?jIAzU2SSv37dj/EdlLZCvY+/UKpddaO40YmcVy+Sdusz//0JR+ZBT5QMgglT?=
 =?us-ascii?Q?UAFWOVxZCLRUCIBIJlTozz8N474FUWdrrsUxsf0esjUVRpqb2pwGfYKKynjv?=
 =?us-ascii?Q?tNrkD6ULqTVaMiHaeAUWV+rnfHM1AxC3P2MBRz20J5OH3oit9q6x2+m/P3pW?=
 =?us-ascii?Q?IohjEc3+XlVS8X0yJcNBj05o5xi9u+6lDawj6CtkivNzxDoGYLsq+xT+qP2R?=
 =?us-ascii?Q?INVSf97zg60fRVu+/CNpuLusHMgeunmx+DwiV9vJprkBSGbXkEUT4OqAZILg?=
 =?us-ascii?Q?jsQ6drH9ZvwiUEf04pqg01XddvfxMvyLMMuWYcTnl8R0NBiI0K75FSrzJA7t?=
 =?us-ascii?Q?x0E6nb509OszvPM0CETWM6tGajihzpt1JxeC3W/D6kRlSnMJA+zKyE+TF/3N?=
 =?us-ascii?Q?2wkQslORfr8EqRL+yh/z13Cn2qo+UNqtTmhhxu/+luz2b7+vC+31ZKlKrGjP?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 487b67ec-d42d-4b74-11ce-08dd7d2d442d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:25:52.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/yD//tV2YOtDcETSQgo2NZjrYjsWEX7K31TzsgWBbeZPRA0ao22hkV4qL4YcBNplayEbYiTGuaQ2y9q5sc3clMl1wIALkglFeA4guGbIAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com

Naveen N Rao wrote:
> On Thu, Apr 10, 2025 at 06:22:23PM -0700, Dan Williams wrote:
> > It looks like x86 has a local re-implementation of range_is_allowed()
> > just to add a pat_enabled() check for the strong symbol override of
> > phys_mem_access_prot_allowed() from drivers/char/mem.c.
> > 
> > In preparation for updating range_is_allowed() logic, arrange for there
> > to be only one shared instance of "range_is_allowed()" in the kernel by
> > moving a common helper to include/linux/io.h.
> > 
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >  arch/x86/mm/pat/memtype.c |   31 ++++---------------------------
> >  drivers/char/mem.c        |   18 ------------------
> >  include/linux/io.h        |   21 +++++++++++++++++++++
> >  3 files changed, 25 insertions(+), 45 deletions(-)
> > 
> > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > index 72d8cbc61158..c97b6598f187 100644
> > --- a/arch/x86/mm/pat/memtype.c
> > +++ b/arch/x86/mm/pat/memtype.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/pfn_t.h>
> >  #include <linux/slab.h>
> > +#include <linux/io.h>
> >  #include <linux/mm.h>
> >  #include <linux/highmem.h>
> >  #include <linux/fs.h>
> > @@ -773,38 +774,14 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
> >  	return vma_prot;
> >  }
> >  
> > -#ifdef CONFIG_STRICT_DEVMEM
> > -/* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
> > -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> > -{
> > -	return 1;
> > -}
> 
> It looks like no checks were done here if CONFIG_STRICT_DEVMEM was set, 
> so this patch changes that.

Yes, but this still matches the historical intent, and the historical
intent is a tad messy.

The pat_enabled check was originally added as a *bypass* of additional
logic in phys_mem_access_prot_allowed() [1] to validate that /dev/mem was
establishing compatible mappings of "System-RAM" via /dev/mem. This
patch maintains that expectation that phys_mem_access_prot_allowed()
returns immediately when there is no potential cache conflict.

However, the point is moot in current code because [2] and [3] removed
all cache type validation from phys_mem_access_prot_allowed() in favor
track_pfn_remap().

According to:
Commit 9e41bff2708e ("x86: fix /dev/mem mmap breakage when PAT is disabled") [1]
Commit 1886297ce0c8 ("x86/mm/pat: Fix BUG_ON() in mmap_mem() on QEMU/i386") [2]
Commit 0c3c8a18361a ("x86, PAT: Remove duplicate memtype reserve in devmem mmap") [3]

> > -#else
> > -/* This check is needed to avoid cache aliasing when PAT is enabled */
> > -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> > -{
> > -	u64 from = ((u64)pfn) << PAGE_SHIFT;
> > -	u64 to = from + size;
> > -	u64 cursor = from;
> > -
> > -	if (!pat_enabled())
> > -		return 1;
> > -
> > -	while (cursor < to) {
> > -		if (!devmem_is_allowed(pfn))
> > -			return 0;
> > -		cursor += PAGE_SIZE;
> > -		pfn++;
> > -	}
> > -	return 1;
> > -}
> > -#endif /* CONFIG_STRICT_DEVMEM */
> > -
> >  int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
> >  				unsigned long size, pgprot_t *vma_prot)
> >  {
> >  	enum page_cache_mode pcm = _PAGE_CACHE_MODE_WB;
> >  
> > +	if (!pat_enabled())
> > +		return 1;
> > +
> 
> Shouldn't this test for pat_enabled() (perhaps only if 
> CONFIG_STRICT_DEVMEM is set) and continue with the rest of the function 
> otherwise?

No because, per above, the check is here to short-circuit the rest of
phys_mem_access_prot_allowed() when PAT is disabled.

I will add some notes to the changelog to save the next person from
needing to find the history here.

I found it interesting that Venki suggested that the duplicated
"range_is_allowed()" be cleaned up back in 2008 [4], so this is a
cleanup 17 years (almost to the day) in the making:

Commit 0124cecfc85a ("x86, PAT: disable /dev/mem mmap RAM with PAT") [4]
