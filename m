Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253EA249EB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467947; cv=fail; b=PMPcTGihR6aP18sahPYWAycbckkJsbnzG+6xJLx9L8lqY7tif6/R1JpGeTaJ4mdpBt4gllmQZ6FwwjA3uXHzh9sbZTbQ0KA8l1f8R1mVgY8dVRSLRzNCdLB+fulFUu8EvN6RRkVVh1mNapL60OASuDZTvF6xR2fL6EhXP5zHy78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467947; c=relaxed/simple;
	bh=385pIDAOSIr2PCFhqOrlyx4j1s+hpHpeiL8OTX1oU1E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g0CmgF8Khqbcax2j/7HvnlY74QpkJa24WbUD+Udm28RVJqfDjDNUnc2BTroZaf+qkskysGzBTh7sQ0Hup+UAf3q+gBb6h0F1s2dgyQCGnTnWi/3GvmD3nqHiwiUd8LUuoAsyeBFMmImTraicgQpeLLSXPnHVPocMNg8ZqA86Gmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbwXkO+q; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbwXkO+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743467945; x=1775003945;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=385pIDAOSIr2PCFhqOrlyx4j1s+hpHpeiL8OTX1oU1E=;
  b=gbwXkO+q8+8fzLKOewRE1JrGLEbiJMKZJc7QFZZobZeT5PzYfydizvGL
   yQq/AZTc5033Cx7OIL3TPA+MlcWWyDx5Ee711ll5WoKzFtBuVexb2cvAI
   qc4rAwlmUohOGZmCFP9/NRS4fl1v85Q/aGL/fm6ySWlzfpf5X1PppjKQ9
   flYi11fc4+We+iTUDqsRmb2Z/jXpkpUetxcQOhOuk41C5ktKf96NQqaul
   hJMIRFIwjzgl/oS9+ubN2moUH/Ef/z5Cf2pJ6ZNrxJ3hdaMWUw8rTZPsl
   s7hPwu4b0dsu6oaBRHyX+gJ6tbftSSFQogKhByroEm6UvNatHzWWhgHQh
   g==;
X-CSE-ConnectionGUID: M+paaobKQQSNKwSWkSbEtQ==
X-CSE-MsgGUID: 0Ihquzg9TFu+OaDOdUMB6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43922968"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="43922968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:39:04 -0700
X-CSE-ConnectionGUID: quTt9Fk1SaiRiFAkEAlVDg==
X-CSE-MsgGUID: 49Pq+FhDTSK5H1nLU4dGRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="149421671"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:39:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 17:39:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 17:39:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 17:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhvtYhQDeOYPSEjjCsJix2P2VTSnoXU8ba21c84xDjEpMz96r8CQaTdLbA2ULhQOnyiB7KjtHjEq01zqaGAOFMQZcsJdBAXDkYbWsawQ9stqmdjNJS2O9Fr0B6uegSm93mAQApNF1Mt2fXTv3lb0rhDfwVBO2rMtB1u1SbQIWhh686g6bfTi5MbVFzZaFRCupXvIt1pr+9r0JjpiRIRj4P+c4WAfg69z58XKJX9Uzkd0vLyROFHPA1/lpBYclVCGeZP+VAXXzMF3b2SBnViwOcRO86uXmntvOLrEeVEgEbNDzA3akpYzDcIgftiwPhwdnxLu4ky8iJeop0JL+yQsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqlGbwibAKgjqN4uCzIdSUdGbb14LTQJ+XeIPwYW3ag=;
 b=Ustbf21qdCWL2hpGtvmaNF8DI+7aEH2A0sbhnAPYAcHgXdiB55yrh1IifJbSCdtpWTUe7VFWqgS4t9ve8BMSEoR7MyujLxSaoNabCMsj7bD9P79BaC5m7Gid+PgDR0yEqlZLgWZprY6YwYqlwCsBYDDAXH9i24gs8VK/LzTTNkH1eWrr+n3xZhae3X5XVib3LOgU44wv2f/KXn8Q/LNa+hXL30HcbWG+qIyE7hB1zR7/yM3s03pSIP4y6oMkbQE8YgouFCTOFPAlhbPoroiaNDXMEHQwhDLKHRhP+jPv3Q5FRDgY7lSYEPXs/nSHN87KtLDzuogOHNgOXdcp5gTffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 00:38:19 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 00:38:19 +0000
Date: Tue, 1 Apr 2025 08:38:09 +0800
From: Philip Li <philip.li@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	<lkp@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z+s1ceHFa0L1GMrn@rli9-mobl>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
 <Z-q-hYllyb7yAiBP@gmail.com>
 <rqwvk5a2ziu2hoklq45nrnw6n3k6akbd3k4tb5i2he4vty5dxt@gj4w2tsnj55o>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rqwvk5a2ziu2hoklq45nrnw6n3k6akbd3k4tb5i2he4vty5dxt@gj4w2tsnj55o>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d735afe-6be5-43cb-b162-08dd70b57fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?11uqdUM9PmfOH1lg6Bo1x26+4icu9wQhoCXAygF/LdJGEh4kOSpoeeyMOsUe?=
 =?us-ascii?Q?qqhlBfVd39ZOgmQyMV7k3vU5dMV632Wxpv3i0vg5XkAh2XF4MWDY+VGen3n+?=
 =?us-ascii?Q?prffEI22lQAku4Bqd3UNpUPsXrfpzT9VHbFDMQ1kqi+H3Bk6lrJlmiDwJX6d?=
 =?us-ascii?Q?bkfvRfOAsJu6553IYmTyKCRqiEIAJNjvDSZghOoYbx8M8/FJpAhTywCRpajs?=
 =?us-ascii?Q?NeaxHl2ys0SiOxI5Or5VmD/HgNvOwk6M5SIRTEgmLpOg/GuSnEodJgDEQCEf?=
 =?us-ascii?Q?Ym19rwHp/IAE7T1f/eXFOU423dflyMp+DRuhz2gcm/lDWHM8EicA2VHlK+Wr?=
 =?us-ascii?Q?4G7Kx+wFf1nsKdosADSz+UPCl8Y2soNjqOAVNCw/LE/5/X/y2Oi4VieT0OnV?=
 =?us-ascii?Q?B+WVtQUKnKG900gYXi/p+Sb5hCokO5FBvCpVMmv94+Tpc+8+wVRSWm8DO99s?=
 =?us-ascii?Q?088b6wsleMG8qXtpaqzD1tYUhhlS4aLSGr4ssAZQ1fRZPf5zY6kFBOSBVqQT?=
 =?us-ascii?Q?TgJW5NmekkLQVqQQGBeF/dhTIUWc2scI1OF2VwAU7I/XWe3CZUeBxpyLuEsm?=
 =?us-ascii?Q?YgIal+Rnf1kjuX7sCU+ntrlt8a7utLGgjRr2kzDPZan9qaeWYX+N6u2O+Ecb?=
 =?us-ascii?Q?AY/DV0Ua/B/kv2h7ddAGJROHGswflwkgo3ca9/t1VIpW7orykAWHJh63BkmH?=
 =?us-ascii?Q?QGa4sTSozKFNVmF+IbZMXqEKSajCT/9Ef2rVD/m28XD+GsdukPxd4iCyJ95w?=
 =?us-ascii?Q?kpJU+Y4iFbO0FRxf1NX56S0LKRelcCCI9p8cInvZyYPEdZudp32fqTyS04xE?=
 =?us-ascii?Q?wLDKc97v6YZX+3XuyyY3Kf8H3p29M2bCk1WESapp9CUIcQ07qvYdAIRP5eMb?=
 =?us-ascii?Q?IDeOPo6yWlyZoLi2R+j/7P24hDG0P6CBw7GHGoVmKdsN3j5HnYQV2O116URR?=
 =?us-ascii?Q?2Afj4c3k8vX2Z9vNRNC43MIQRbOx5kzmwF3ylgSICgD4xzZzogqNP9blHZnf?=
 =?us-ascii?Q?6z3hEB7Cbzr5vt0i8+awG0I2GhwmjaiIb6udiuB6Iq2jvSA+kwiQGpGfFqPe?=
 =?us-ascii?Q?6p4l2M5v7EDYI2oQROWM4pZqA+hJAekkJWZFSYBe6+IxYPgIfLIDwKlNHmgJ?=
 =?us-ascii?Q?Pec9DrM1IrR0wjTx5x6Ub4RtFn1MVvhy2UjDDc9V1RGWTaMBz3vUd7vCYA0I?=
 =?us-ascii?Q?PKH42ei0ul2qd22Z0fIusxYcCzKec4FMljvEZPUQflYNxw+Fn4kqdZ+FW2n3?=
 =?us-ascii?Q?0AvuKUIe/lKBbGsm9mqfOahEbUUz2LjSFDMKIa1LlZw40iBH/3jvyl1hXfzb?=
 =?us-ascii?Q?WX+z0xVfiJhEcQ08aXlgEvyCO09mQFyVm+6sdLK51KcekIgWLTpitoh1+NUD?=
 =?us-ascii?Q?idfggpwhNLMzsDGsTPU6xZq33AFN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?82UY5cmA9acca87WDhvigIr3W3rHR6MwdwoHaV30cfGCSbEDvv2ejklomYbl?=
 =?us-ascii?Q?rvBIo9+wbWf2mjG/bJDkyLdwwBOwJHwDALXC0gKJaJF96OTzQq4dHJbmlkli?=
 =?us-ascii?Q?XAR5mLa065P2jTzU6bvqDDYnFJ4lMAifbrJawv/V0Qh+fw1a19cG/A6N6M7G?=
 =?us-ascii?Q?WwhK38ufYpUeO+KGEmvygOBY60yjxonFyiGw30Ah9R4U20KfGx5VvDHciyJi?=
 =?us-ascii?Q?84NDzeacrwr4Lv0sq4iOm8O775IfmFRSnOE8jHBK4kr6yrHuEpma3+GdhiQv?=
 =?us-ascii?Q?B6lUviKmTBGu/v+mHBEEao79x6/KOMaEIkeQKWQipDO6PsSrf4YI2EZrEP9a?=
 =?us-ascii?Q?PeNlVVop10M9r6b5WZFfkOehX6bOVjWdmb/FQgjw+kYwau6+s659cQ7ZqmdR?=
 =?us-ascii?Q?S9Viokp6vXDIitlcF/vpfthEWJsDL8Hu3aUW719RXqNm0lx8JEHO9eBd0Znw?=
 =?us-ascii?Q?eeA/pXWPDNQ3hFaNorvvKxHm3++93zqmLGyjXr3fJRWzG1RPeLVQelKwLUkY?=
 =?us-ascii?Q?WcftNdGv6PXvWiWDgjYafBxpDkzJLzHq6T0Yf74PDxDKtLqcyooY/K9CvtuI?=
 =?us-ascii?Q?ExfobgVbTB+LsdlMKOyidZ9/J/jJyOq1Tt7yecu/vWhHoY/B3bvlAdofvPCW?=
 =?us-ascii?Q?DpFtQnZNMjC0Z32fpg/0tzP80VqBmVyycUB9IkplHF4GD4kbhp4gJ7qF5tWy?=
 =?us-ascii?Q?nFs7/+WmNdHIp7QnTKjFrj+R5VC2+5hkM37pcoJZNJViZ6oMrbynjEpcNpqJ?=
 =?us-ascii?Q?uwsIXKXgh7DGbsKrZ9KwPcAYl9+yB8owRj4a6qc1KBQzDB3PsVCiPp0NWcqf?=
 =?us-ascii?Q?th6+RbrhcDuv3kX3cdFGBCSVWY0RKvJ7quMt8/ucl+G9/ivtzSoDCQ3WAW1x?=
 =?us-ascii?Q?N3oj/b1N/FPaUE9qmOzVW758sVaSgLYrCPaPbk/snwyXUxHEPBCFwWeT3k6t?=
 =?us-ascii?Q?z4hEjVXK4h6Reb/Hdmn33mFFTr6q6NcPPLUCd0k4vC+LegdeIdGGRX1U71d0?=
 =?us-ascii?Q?DS6pjTIZsQKZ7FTg44eifZ8PnWT8vETzYQxR2Rcv7nNmPDB5cHQp3D5e+Osq?=
 =?us-ascii?Q?rL/Fw0CwE3vdLy6uKIBmrAQ2oECRuxaYhuMjCbGkZm85NYQweN4CQyzoDGKb?=
 =?us-ascii?Q?0vf3ueXzMko7AnGrnwuA88Vkipc0RJob7TE36S10UsCtMKzzFRRhjwEF42CO?=
 =?us-ascii?Q?GZouMom5RUY8R33GnDVAVvkGQd7N5F/iD7fbewSTXNhu5Ro+SW88Ke6QxDKn?=
 =?us-ascii?Q?mpHz/FVL9XgJu6z6ckAQ/nblT7HHTLUignmXoBTsx/NqRAecS9AaEmJRDJ5c?=
 =?us-ascii?Q?2gAfcoKEvmdyqf6NhAC2Te+X9+iVtkOiZ55ZQFtqYPkvKoFIlxIPFND6P25I?=
 =?us-ascii?Q?w6gQV22cWqMjnZ4lgYwQMlzAHWC5Iua3rNQ4AyGQr4eKZjhJ8GpPB6c1i3+T?=
 =?us-ascii?Q?d97kTSulP9AzlTXxVXB5yD+5DEoXFug8GfuFpG+OSyjQNpwfj1ZBh2UVTMM9?=
 =?us-ascii?Q?GbEK25Od1iozgppwTom2kbSV1zHJ4fxVfPlt0OjYXjQYKxNmcikx+DOEKZPY?=
 =?us-ascii?Q?9WQnDskMoCcCsuGsT8oN9+fQJeLetg9ZeBYCDVdH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d735afe-6be5-43cb-b162-08dd70b57fcd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:38:19.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vTDiYrBWnpYP/VUuXl5vKEu3p6pAVqrpjkgntNo9dU+72xljdtYytbUGKAR6dDVxzX6q3GIvnsbZUIkL6uYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
X-OriginatorOrg: intel.com

On Mon, Mar 31, 2025 at 03:17:51PM -0700, Josh Poimboeuf wrote:
> On Mon, Mar 31, 2025 at 06:10:45PM +0200, Ingo Molnar wrote:
> > > > This can be seen in the full report:
> > > > 
> > > >   https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> > > > 
> > > >   All warnings (new ones prefixed by >>):
> > > > 
> > > >      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
> > > >      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> > > >   >> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)
> > > > 
> > > > Note how '>>' is the new warning - the summary line added recently that 
> > > > suggests that there's more warnings. It appears to me the test-bot 
> > > > considers the other warnings old regressions, but I couldn't find any 
> > > > trace of them being reported before. Maybe they weren't Cc:-ed to lkml.
> > > > 
> > > > Or maybe these *are* all new warnings. I've Cc:-ed the LKP folks.
> > > 
> > > Hi Ingo and all, sorry for confusion, here only the line with >> is considered
> > > as new warning, due to the commit 0a7fb6f07e3a you mentioned.
> > 
> > Oh, so the loongson 'stack state mismatch' warnings started sometime in 
> > the past, but were never reported by the bot? Or were they reported 
> > somewhere? I'd like to discover the timeline of those warnings, if 
> > that's possible.
> 
> I believe those warnings were introduced a year ago with:
> 
>   cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> 
> but I wasn't able to find the original report.

Hi Ingo and Josh, for this cb8a2ef0848c commit, the bot has reported at [1]
but with a different randconfig and a different issue pattern. And the bot
didn't report new ones as it considered the bad commit was already reported.

	tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
	commit: cb8a2ef0848ca80d67d6d56e2df757cfdf6b3355 LoongArch: Add ORC stack unwinder support
	config: loongarch-randconfig-002-20240812 
(https://download.01.org/0day-ci/archive/20240812/202408120955.qls5oNQY-lkp@intel.com/config)

	WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
	>> ERROR: modpost: "kvm_restore_lsx" [arch/loongarch/kvm/kvm.ko] undefined!
	>> ERROR: modpost: "kvm_restore_lasx" [arch/loongarch/kvm/kvm.ko] undefined!

Later, there's fix at [2], but seems it doesn't solve all possible issues since
the bot didn't report out explicitly.

[1] https://lore.kernel.org/oe-kbuild-all/202408120955.qls5oNQY-lkp@intel.com/
[2] https://lore.kernel.org/all/20240604150741.30252-1-xry111@xry111.site/

Thanks

> 
> -- 
> Josh
