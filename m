Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF88202C46
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425087; cv=fail; b=cn2AxJ2X1bGTydrwl9GOATP4Iz5pxB5kQvg72mS/0EbMDsRMPcnRCFVPr1dlq1C0fQibWr+WCvoHzjxcWZ7sBLVh/w1wQFGojeAy74z9gPE8RP8X7+wXKV3CHGmvNArzb+riBtPqpPw/qXkt3E1oQT+WBIbOckxo4VAorps7dKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425087; c=relaxed/simple;
	bh=5YtOMaETDaSWNHZHb96tV3gAJwuD5H37p8IxoIWimtw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZqHsyDgrV/qKyM5qKfpVcgHon/PQF1lTC5ddR1UUlkzp5NPFsuC65Aea3R43dbfWuVJTwI8cNjIDPzWidUerOQOQS9wtose54h+0PDd5w4/IBr0e10/cVhKIkm+sDvgsMADaVDzigtwHGwAWdGPXc1bkmCiFY/VInroy2MmPFKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zu+tYPlV; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zu+tYPlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743425083; x=1774961083;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5YtOMaETDaSWNHZHb96tV3gAJwuD5H37p8IxoIWimtw=;
  b=Zu+tYPlVYtXxRmnSfeATf8jnuM0bc3n7xZE67J3Bafq5IpgnilDjt8ID
   9ACJdbTfuY/IcCvFzCyZU0uL1clB5NwXBPbfAkpOf3gu+6GUO/XQBaD6O
   YvuzVKmAuvtSby/2Rcpyu4HTlz8CVGWKw0wj+gbE4rV4mv+bWarFJ/asr
   Eo2XV2SqDxrUtIKoqEVYQLlaBCymSN7J0WaFSuC9f1pJBTBcuRb9psr0H
   WG4kwHJCn5JhhNuuuTE7iAeUVDBK/00yBt2JvEikHyuo31hTRDr01hS9f
   mVaFomxdLSSU/YA6c8X0oTqLY6vhtPZ9fgsHdULsx8mi7loqvdD8fy93h
   g==;
X-CSE-ConnectionGUID: X+vQVHRlToi7M6UkRE7t0g==
X-CSE-MsgGUID: LO/o4VZbQgup2tBR4HCmIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44716576"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44716576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 05:44:42 -0700
X-CSE-ConnectionGUID: +Ob9We98RECNVuPs6QKxng==
X-CSE-MsgGUID: oZ6TTH41SEGZv8J5uawszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="149257608"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 05:44:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 05:44:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 05:44:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 05:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiWrNvVUntpQmqlQIwMGbTcBc6ELJmiraLl9/pQe/BB7blj8+d6hgpmKaHeoE9vfogWqxEHawM7m/5z2NvMAhwJZyQIShN5sBoKvweW6gIigg3dELoY6p70rxbu9Ulwcah+pKQJydUJ8dc3J6r5odub6S0qmNh5t68qBS6OZRPcpTa2RQQCbA7hjbJUy7meIRFeHE1kQw21knlu7nh37oV5dmtOEv4vei/q21YUAVNC8Xr1qHf+4DFeIQa6ZVv7K3TkX2/RdTcpxpi4iNLhZguVH2C+WENtTXPPL1uk4aF39IhBrC2ZFX8gF0vN36GmnM9j6Kiv0TQZdsM4+FuR5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aacnd6h3fTKuwJcvRtPPzarwUIHBqn4TFMK+TXdVF4Y=;
 b=MRcR/GQJJBAUZRI0ot2RUh9EnKw6dQNRlJDsmjignq/8O1EDLx7+qJyr1iUgmcf6quvVqcb0kV1TUZ6CRL94loeeynDHZPdZfveoJgORm5TZRv0pJHCIckFY3XaNUG+TzUGwVdl3EsxYoa6f2V6WW5gINlDxbMA6rZGNfGOmtot2t25bB8o1tLsMQXNCD0jme2W2nxL+dVkdWAY4erkIug9bWvvXk4SiQj9xpXPYkMoh6S5kKIM/lpDm31QLlhiz9vLaaNSvMO7xDk8REb1f5SSFCY7VUVFD6cmJTLRdRQG0TqmV3izIr2R3twv8pWfBi9aGu/lbvXRrYlN3U2C+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:44:35 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 12:44:35 +0000
Date: Mon, 31 Mar 2025 20:44:25 +0800
From: Philip Li <philip.li@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Ingo Molnar <mingo@kernel.org>, <lkp@intel.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z+qOKZ2xNK+hUP6x@rli9-mobl>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
 <20250331123649.GCZ-qMYfyI9gZWwFRm@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250331123649.GCZ-qMYfyI9gZWwFRm@fat_crate.local>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd72eec-162b-4377-4c04-08dd7051caa8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UAOdEBzVkJXG8sTwbj55+r/YKSrUadTkQjcsBt/vQVhKJ01nteH1iYVMrawU?=
 =?us-ascii?Q?+kc8krvZ2qPFcu1WEQ7BvIIxf2lo8IWCTlVmcVy8dwjiZJ7dE9EHx1AF/NMe?=
 =?us-ascii?Q?PPZ3sLoQHuw9qCOncGAzjAISkMPke3Jx0FyZxMqAQyb1gX1gKjhXefxcV4BT?=
 =?us-ascii?Q?nRqScA/t+ggj7/jRoZXHN+Dr6J90Jp+GviWDxuMdtmJ5ZbESLl3UJCUoLbyW?=
 =?us-ascii?Q?npmvfm2qiHN3gDoC6Qli9JaN+JRktlgCWWeofmZNzg6X6xMwbV9s1nHdO56J?=
 =?us-ascii?Q?aqKNvplznj/lPiTe2EXi9NEjvz5c2AnI4NlZkvo2aPfibnpTXVfXXaAL1/If?=
 =?us-ascii?Q?Gq2cNcrhHwYbqluQtIuUA3S6sXVUG800GvymBDB7jLt6HTS4miHWy536o+fV?=
 =?us-ascii?Q?bolHjK0XvODuXT4puHTyDxX5XdnUyiXfFE2BPlPAt1prMQg/UFt8fe2uVoyA?=
 =?us-ascii?Q?uQzKAJvqRH87h2AydEl28AYmBHh1uFkA3G1ydOjq5prVK6TdKGU4rxVO8DBR?=
 =?us-ascii?Q?7meNwhQr34/ou3O1fN7dBypVCMMvhEELJFOR1uko3NRjp8qbhaoajuChO8mg?=
 =?us-ascii?Q?Ob3NSrG2jHTKyMuKGqFH/49oXhxghiLjv1DEGEDheAQlBI0n0qCGWKdSU2Vi?=
 =?us-ascii?Q?ny/09hwStgumbXanSzKCAKO+FDSAaI2Z2SzoufE6PLUtmgsqNIsc329fQu/x?=
 =?us-ascii?Q?gmsepyCW26XLckXfzsXAcK0mS2AQbK2bIwTqHuyYgQM3h4W8NA09aGxYQyed?=
 =?us-ascii?Q?fdShUNqrJuBTf3qhOjRa3QdwPHZ07JSxSAW8PHrEqaWSlg2IngHHAfajxW3Q?=
 =?us-ascii?Q?LHnc1WrkyzGa/ROL0g0kJIFu2b6reBBzziBBvl4C33oz/qOseNdnT6xAldkn?=
 =?us-ascii?Q?wlioRsVdvIAoocKbR2bGL6P4+cCzSauuaInFNv4JfG63StA0PPWi4T6qsrEf?=
 =?us-ascii?Q?z77xvSzqbk22BcBezXeGTCBL+zQKIdmWoNyd/sqM7u1vcfLwkvldceZOX17t?=
 =?us-ascii?Q?eeMOyNEZiCJRFLNkRyLt7S0WWDlEzLMaGqdefEy/nUYMGYNecD4IjntiNaLB?=
 =?us-ascii?Q?bJDKiEOIH0SNtIKFeTF3ZeUG48dbla5MLzRz4Egy6PF8goKoU3GVpyWezeqX?=
 =?us-ascii?Q?7n3EpQ7dzkw6TmwWrT839wi/sNtWUGBJi0pXD2MxrLHKBeisy3inxl04fpnj?=
 =?us-ascii?Q?WsPlfEhY0dIZ/wmFBubD/draDfagqP0yax8ABFn9MucJ6crBBd2KPmZM2c+z?=
 =?us-ascii?Q?HUMIxDXOq94cAjZhhxUFp+EuOptAnyUJN3QKVsktNV7AM2aUcVGnC6d812uJ?=
 =?us-ascii?Q?vkjM81G1K0KlaAMmLp6Y4mn7XTSwmIHrEFKZzYSoeJNZYeS2oG0ZRkSHMXMA?=
 =?us-ascii?Q?EUQAqefTNVrS8rXyqOUBW000etSh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qzl3ZMIfQomy+XESUtn9SUjN7n5V6f8v7A926bVdhhiIzt9nvJ/ZkqDedGdC?=
 =?us-ascii?Q?9+fOKbnrNKgGi8aWPnkRRGkPkUU0hSW4ckB0O7/WHAYsaY8iB8f9hxpeBG7G?=
 =?us-ascii?Q?anPG1aKseTYvVV+hapi6BSSJXHd6CxRt21vjSWn3caa3Y3I31ziaHI7XweN3?=
 =?us-ascii?Q?9F5YRexDY1qW03n/VzSV/gI0HaopEafpL1FH9REyteWyFrlouqqaIedX6MqO?=
 =?us-ascii?Q?V/02BdhiSywKDodUuyeiZtSn6gS1EZBGQldI05Jk4J7sS5pkb3uxxl0qn1hy?=
 =?us-ascii?Q?ALKSPmOO9cFDAt4rmQHubSuKtwngDUaqEdkeBVzB/0Zq7bmoPZS2VS3qrm3H?=
 =?us-ascii?Q?8cceSJQR5nhiIo3KounsB7DLrbBx7yai3Fzt5QieiADFrtkLLEXZw6dCxN3c?=
 =?us-ascii?Q?DnzLHEqDMvk/ufHrf8UOHgldvW2e8Cbd6ogUKlm94EETGRk2ldQ9mtZ9nh0x?=
 =?us-ascii?Q?oimM7wok/eEaQSw29QnR6oe7dVnDwDuz3Cw6lUKZu0QFXjwvu5OfSJrKVG3z?=
 =?us-ascii?Q?CxpQHLi2hZdbcvElk4r7ercI+2pt4qnxiUbO7hzla3Vk/8BSeZyx+OQ290wi?=
 =?us-ascii?Q?s1HGr0UliCIJXPEjgDpNEDDFRHoQIMj0X4lNeJ5MGk80084ZYGWVvXg9ck/i?=
 =?us-ascii?Q?VLUyv9C0l9lcuKnvcXbhk4Cef20MF/x/Oe0E0bOaicPlsdffMsqULgWv5OAq?=
 =?us-ascii?Q?W6easGDAzfaPLw8SFseLRconLhSsgr5kTCriDdkU3Nj3iy1eL5kmzjBsx0pV?=
 =?us-ascii?Q?rH3G39pbbguRh0fmPhpZmc5Df4wtrlVIHaEZzxnevRiPJyRTN6HXd+Ck2UDQ?=
 =?us-ascii?Q?h3go2TnpV2kfwLrLNeoeJ5F1VkekVdGWxSEKhN+0PaNoIOiVGC4NwvTHwA7h?=
 =?us-ascii?Q?8rR6yPQW51ruZL1w7MomCkYlJFHJW3Y9yC2eDMdu0sUxmrlssLB7yzLn040K?=
 =?us-ascii?Q?cBDD6ZMKbJ42uDw0ilk47pRO1cLkMVCOYKCCVtT9C+Yq76GiGxhM2ybRCH6m?=
 =?us-ascii?Q?54fbb+DZTtPypa5riNJ6aSkSfJlOeo79Yijk7b6rodWg3OT8hVSno3TV6+GI?=
 =?us-ascii?Q?ejrZtVtKetQ37HUPa8cji8iyAeM6AUyf5PhSYqsIGyJ6Vbw+6IqKUh6s9lUW?=
 =?us-ascii?Q?vFLLnJZhcU/0wzc8p2+/rV8X+EyK6OzlQHyMSMLgEkvZbOmByfEkWtFKDsxF?=
 =?us-ascii?Q?PVGI2rtTNPq+ETU3exvMZSlXi05NqY87GF15s/S4z/TNi6ffxgwRXFR9Yvnd?=
 =?us-ascii?Q?mJZreQDVXIs3/72PJ3NtfLZ3PIBXsgRyAdsqenh44nsUVSzn3Jx5Iin2c0Ao?=
 =?us-ascii?Q?6duchT8r6SM+GrY5A/NjqoVNPs6zboSlkZGNuj+F28oJkiPwqtkEUZPeY2mw?=
 =?us-ascii?Q?/MrElhGD01yUgYldhcU5FoCu0WbCxDnnrwRia2KmQ6l/Q+0rCy03qpg2xVSP?=
 =?us-ascii?Q?ZM09LwxTGK6sXe604gA3DsQpGxtdMqzmFDw/avTkKuGvEDvb3XoZEXIgNIUw?=
 =?us-ascii?Q?NqA2Emyxmpdvwo0QSIDvKjSy7m7CAGsTdFMkeN/7MebPWQQ14+e0CujfrfnA?=
 =?us-ascii?Q?/9ZWNcVZhy15usXJPJK9x14TFwesRSfnUAj8s/C+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd72eec-162b-4377-4c04-08dd7051caa8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:44:35.4247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYOI1e+6qM7JjNpkCnXapZVpmchRsGTaxJEXHh/eEM6zQSKNoO5Y1zt1FPxc6Sq5fqfEOY34KrCvmorQzxNRzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com

On Mon, Mar 31, 2025 at 02:36:49PM +0200, Borislav Petkov wrote:
> On Mon, Mar 31, 2025 at 08:31:08PM +0800, Philip Li wrote:
> > For 0a7fb6f07e3a, the bot only reported 2 times on x86 [1][2]. For this
> > loongarch report, the bisection is wrong and is a false positive, I will
> > further check. Meanwhile, the bot will ignore the bisection of this new
> > objtool message as it is not really a new kernel issue.
> 
> Can you guys get a human being to double-check and vet those reports?! Please!

Really sorry, we will add more strict check of objtool warnings. We have
logic to detect the low confidence one and send to https://lore.kernel.org/oe-kbuild/
for manual check before sending out. But there's still case that we fail to
detect.

> 
> Because we kinda trust them but
> 
> 1. they're not really helpful and hard to understand what you're reporting
> 
> 2. that summary thing is especially useless:
> 
> "Error/Warning ids grouped by kconfigs:
> 
> recent_errors
> `-- loongarch-randconfig-001-20250328
>     `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)"
> 
> When I see this, I need to go look for the original reports and somehow
> scratch them together. And you have all that info, why don't you simply dump
> a URL with the bug materials so that one can inspect them?

I will also check this as it is designed to have link together with reported
error in the summary. It is another bug that the bot should be fixed.

> 
> 3. Last but not least, if this doesn't change I will start ignoring them.
>    Because they're not really helping - on the contrary - they're actively
>    interfering.

Apologize again, we will continue improving the bot to make it really useful.

> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
