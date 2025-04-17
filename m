Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E6624CED7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895625; cv=fail; b=VIxrE2QG9ZQtJXqxj7KZ1Xm3OKGD8xsuML4w5sE8tJbeByHdJJaerpInwNz4okQ/TVEtOa9MAHxCAXClsfWWXiZ6Es6K1jzTZZDGMhrHlOnpLUSCdQI8Z9Mbe29Ka4mvAD+RZjrHtKskclqJEVZhoi2A54n4+T1xEasZUrsJPrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895625; c=relaxed/simple;
	bh=Q+2SBRj/D5Y2ulAgGoyPKixyRLnPQsljFplCNAUstYY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ToasTHeVWw0KuJ+c0wFEx87+L+rhp0725ZJCk8oeni5LtqdyTMzoavRBTNklpMo6W2NEDcADi7xlzN6dwd739Y4rulJ+dGMzpjBOamm6u5u9pFrofQc2fE0Rm+HKWEHz9pQbDvceCeAUJgdgbX3oTaLcadQht85XXNZrfH/5K5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLqfeWIl; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLqfeWIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744895623; x=1776431623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+2SBRj/D5Y2ulAgGoyPKixyRLnPQsljFplCNAUstYY=;
  b=iLqfeWIlC4FP0rqCYC0etnDh0AXl/S8gk+kZJ58JR+f5LnJ0knqXIyjM
   sSvDMMbEpcZiAaj5eoDHOgPjf13g5quUCH2ucM8RrBvDwQ6+/tRWAAFwc
   3kyJYxqh8GQRV5g527QgDyySkBk6qj+7v4k9nbnuX1GC0SG+0ADyLU5G7
   u0UvBSJZPOZpdZLuhA2QmcqBaBnxz3GV9WU00LpTbO7iYkbN6SbFo6KUa
   9Jd9vcrHZvzrQCyc7aLT2e1wxR6re88T4yRPI+gnlHvZU8h+8S7czvdof
   4ZeiJciO69e7N/Rn18AbYy8nn6FRDG4+/KJfsTCB0DMDy2RpwsXcjLcCJ
   g==;
X-CSE-ConnectionGUID: 7s/811y0QLeXRLf7XtNwbw==
X-CSE-MsgGUID: CR/Q96pOSk+GBb131tu/vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63890403"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="63890403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:13:43 -0700
X-CSE-ConnectionGUID: uN7ESt2FRcCPLiFmpWhoDQ==
X-CSE-MsgGUID: oU1ybXjyS1eIYBz1ezc//w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130655236"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:13:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 06:13:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 06:13:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 06:13:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Itk+VwmvhJzUXPND2pfrT1QoRlcTvpN+SeRl1GOLxNQ6IC98eeedGGuaJl39zYrFurtOkF44krqb0zjzP3EWBeqP+aXF9ooKj85EMjohdbPOj0v3Gs68FRaLSt9EYKo3MbQuah8ARzd9pdIyaqNNIKRoZs8yTURYtiwr4LmebSbzSVyKFJJYlLDsveMCB2HMCyDpGfKpRPMnpFLg7vt/CV+OYa2zk2VJIoTTpKHMHYiT6rOJJbugIQjZ32ljJYYrUCukDykfzsh/qb4D33lhpFL18LwlbBImXN/VRh3fZdP9dJzYhmsOkDk5neDKC5Q5JT3SzvYWH5IMEADlgyOl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL3VhGhTB3u+WUqsfniVtHmvGM8RMHGCs6IwRd022Ug=;
 b=pSrfMFK23Y5EWDZi9DHEWSOZPCCMEp54I0Yjh4/DrLry7VneTs4faN3XfYf+By9qiHodUeueMZYMOoNdcO77lXnN+dsswlIZjvhN5kkCf/J9o/jrV8OJ9RF1by7tWafFaii2If6hLu+S0NTMzkdIs3wmdJ4aphKp5Ol8dqvN/16V3+MeRxIjDjcUNKRBMhMKpINkQms+1PsU6DUzHX/1PvbZ4bdyPYkqpAjvbCoXoytGRjxBzST7UmbF7DWrQUjbFfHWLNv1hlmRPsrn2P+vUQC8RjF/thMVUSm6FSBslCtagxCcq5+BBkJpop9Zt1upKzpgk+/LMrb8L7Rsb11RFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 13:13:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 13:13:38 +0000
Date: Thu, 17 Apr 2025 21:13:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Ingo Molnar <mingo@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Rik van Riel <riel@surriel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <oliver.sang@intel.com>
Subject: [tip:x86/alternatives] [x86/mm]  4873f494bb:
 WARNING:at_arch/x86/mm/tlb.c:#switch_mm_irqs_off
Message-ID: <202504171640.c81d6f67-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 663f35ea-cb48-49ca-e098-08dd7db1aa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zt293jeGBWLWD5cyfhIwqLwT0OZvyHSQM7uVmEgIEObpTzRahslXv7QaVM+8?=
 =?us-ascii?Q?HnQFTVvMeSgEmwbvwc3rKFoM0Bwxz2Yt9Y/zQewz3ZN293/ihHflc9qu5Rk+?=
 =?us-ascii?Q?0Gbc5GQ5n0yIk0ukJbX/jJ2O2vWl0g2YU5V91JeXaTeBW/zk5aS5rDPF1clZ?=
 =?us-ascii?Q?I6XWncvaUuQYatczYxA2LuiGpqgqijiIvJUirjVRzA6X9WJ9FVRpx0L70chf?=
 =?us-ascii?Q?ggktALMTbRLimZLiB7yO9GKvHaArh2o9PbFMOlbUntiMe58vLKGU+AmoVhLp?=
 =?us-ascii?Q?wQRKm5PRg51qpjTLqttUfs96paC3BGcyso7qCj7lKq9x9SQ3EOg/4WIx4SG2?=
 =?us-ascii?Q?AcfAs0gt1uhgshqLl8yQ0tpIZAFrQ5GbNG0lq2ZSRJ+8vz09IGG0ufTKwNZV?=
 =?us-ascii?Q?mii6TDMWI/AQK1XhKC6iiP8EAsn5pBui6qsA9Lw025NunS1YWg51fJitlZsq?=
 =?us-ascii?Q?+MsarYqrxlcuZ7SoQslGkYEs93aYLJh+iJ2xnAZ3AUoHyJGEOg0fPAJW0zqd?=
 =?us-ascii?Q?CmVJqCjCiMVvjEddJERQp4nGU881G3elszKhIQBIMMQ644tG9/tmSwS6sSZZ?=
 =?us-ascii?Q?XMEy6YSnM2DETO70g3RmeuRYc65Rv0H5t+vGWRGlwr8dFDNwkh/+TiVRCN8y?=
 =?us-ascii?Q?jRgYROAO+pbwthNZlbSvHkM1Ll50WpQ+2JAiVKHRbv9V6kdFjPh/IPu2oBaD?=
 =?us-ascii?Q?rAdH4DVSop6qrp/cMH1+7g5tfNcR9wq1v8pl1GBmCYcUzRCRrk1q80o7jRYa?=
 =?us-ascii?Q?6z26nOiKads/Csrd4O5a/rGHkw1GSyv6xM2lPko4EJGqKicnWhUu0c4WC0rC?=
 =?us-ascii?Q?P2Yq5f7Mx+U/r98ZVwQC08N2GaDIMluN/zswD6bq8MpuAGSD99YaC7NLzVkZ?=
 =?us-ascii?Q?Dv2jbYtDRze4VIyQLU6lbH+BYp0akVzNwTs7hGlmPPpT7vjs4uO1SmutTAJA?=
 =?us-ascii?Q?+2Ik92rCEKDiFZqp7N5mwTZVKovyIxAp4V+DW99+CeNy6nPaREOCiNplo6zX?=
 =?us-ascii?Q?kVO5Ttgn88tNQFO2VB/27RjuDjjQo9LPB7kYecSWRSh4VU0mwqqzooN3kT0/?=
 =?us-ascii?Q?1/Pmc80M82QeH3gps5XS3ZZiJVcBy0acaoSmpKUVhD98qTC7trCjbVPCTEEH?=
 =?us-ascii?Q?8tbkk5GwVANjoF2ViJlJOayvtWT1QG1AfRcxyewD4EJGLmka/fxrb+VkchHt?=
 =?us-ascii?Q?q4oFfBeajOywaoa2zXkqBnr6smNrV7YqiQBqqA6d7sMWzs1hH7cctnWHzeVS?=
 =?us-ascii?Q?7Fk5SXTG1eR5OHo9ZLsTBZ46EpJ+68vv7SEPTtoWHId2F6UWAofYe+M4Pbyv?=
 =?us-ascii?Q?uvD6jDjPv3HfvkSwOs+nRu7nxcDnc0Yymda2X8peuoCZvMcriLYdZvQ2dxbP?=
 =?us-ascii?Q?dDiUgN+8jMdT4FvGRWcF/OC6sNz9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLVPHryzrq8TDBdZlI7GkPOz+oFfVRRpVQ2JuVblbZcg+T5Gkbn1+5IClf2q?=
 =?us-ascii?Q?4Jk/MyObmsWVZAiETT3zeYbahvEQ2670eZi3Pj/G5DblWWA7Lh0GZiUVwFIm?=
 =?us-ascii?Q?mfxBE2Jhkfpj3N6wYhTG7F6sLOrwZ62gk53QFOIlqVvs6qsNUnQ3Agsa/EJB?=
 =?us-ascii?Q?gfBuq7wBraJloKWJ300vs5+MJ473NuM6hQfWUyAExyYkpr8ISY1g7J27l7XD?=
 =?us-ascii?Q?Oq8VBLiKv3nNV54Jxyodx1LsTjy0YLorBs2zlmlaE1KZBefYGo+qhV0YP4Yc?=
 =?us-ascii?Q?tbc5wTrwWdYR00xrbREpRGWEgK3WhgyQcR8L5RJNKPiYhhnam8Iz/QPDMbz6?=
 =?us-ascii?Q?0W5QXdKux0SdQm16oIsqy/g2ANKctMs1qdS/Ly3pK+YM8q343FSrkupnCA9/?=
 =?us-ascii?Q?BiS4N1BJtwKDF4ck3hs4AR/ggYwDjAgmDrgwmTk38S43G+OFx4G5Oh3VIC7z?=
 =?us-ascii?Q?Ym/sHh2h8SeWE2KemSRlhe6OKrwrPndFlmuWrtW4dZyv4QoWy1hcgTfC5iv8?=
 =?us-ascii?Q?PA8QLGDWAFos8YpSY+dYV96q4Kc0LAi/GeXNz5HvS8wvC/fY82LgeASXp4Ks?=
 =?us-ascii?Q?A31IpinguO9lzyrrUQ9RpSf+pR3YRSuYp9rLp+9FyHG+zoOt5wImuYaRzkYu?=
 =?us-ascii?Q?upZREbFqRehVEu4QTgBczPHZICotTzUAE2UX5ec/3rzUyvuZEPiV1HJmkrG0?=
 =?us-ascii?Q?xFCt6dR2QtbzGIELjhEfjuy2jSu7nx8Lq70Opj6eyz2UJsyuHO2OQV6QV3Df?=
 =?us-ascii?Q?sctbmdOIilj2QRG34kr05MI1CxMCgF2mLFh7CQwmlSv1AzYeodLs3fnc1K1a?=
 =?us-ascii?Q?+bCwY0P3AeIaAmFuv8C1WG0wklaedXAC4f2ROj1S2fdgxtOSTGoOuMoUpIRK?=
 =?us-ascii?Q?CwMM43hjInk2GJhupYifb1sBHu6kMd0KB4orJ7yz30eODnso/zQDlsH2d82u?=
 =?us-ascii?Q?X/CgsNa/YoQ+p6ehf9frBegKetdgrT1VP30tXP2fX5Vyc4iRyxGytBB9N6wx?=
 =?us-ascii?Q?4f3pBAEO54lInljshNqSwyKjj0huaji1F4MeBH9f6q4MJrCWXBY9MgRzLIgn?=
 =?us-ascii?Q?YY+vm9jN3QNImfD+XZxQMI9e2IMxDhT7vw8FNNVA0n8rkWWd0oqSX8jXeFW+?=
 =?us-ascii?Q?HMSGtcQh3uD/SRUNZ2qDlPWPBCBW+w+ylqcvqmkmhqaiA54g/Vhnw2dnrtqe?=
 =?us-ascii?Q?MViRnFZXZ0Q5hgLyPzCtdieQigyeuZF8fF+CkPlJX0c8fkKR3k+SFuh2pVe+?=
 =?us-ascii?Q?bu9cTqu1OcFkifPD+xt3zSRk1k0A6Sx4Mfkj98nbFSlZF6RLkg4pmLZI1qWN?=
 =?us-ascii?Q?H4uHnpYpMVsyMd00YPOLi7gjVQQkrMltwQoVM+T5nbZSHUvaV1mEbqjLSwhF?=
 =?us-ascii?Q?oAzZj6B9aiIK7Tre99ywBPUkqUy1vJh49i7MAVU9gPrcQ/Lo23RCwFlTfKt1?=
 =?us-ascii?Q?JGxLk7q6cwMDJri6Qz3Xp1dQ5bIVTS3ol9at1UY4iZ9+LPXjvNBbcqR8cHhw?=
 =?us-ascii?Q?HmSc7ue1633g1CB2Boi7rXzke3xsPEBR90ITZYzbnDAyIfr04owrU+QTyW28?=
 =?us-ascii?Q?x9Domi+6jPVFy6FwDjA0WuFikZkLH0DZIqdLZzzjkbLIm3SVtwxS/5AWxjTi?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 663f35ea-cb48-49ca-e098-08dd7db1aa4a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:13:37.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL4v2mQyfBuepQzfEe7H+QCH4mqB/yxwuwaLo4GvJxAfSt19o29ShzTxnUTlnksC4LIfCIZPexvO3pN/vwP17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_arch/x86/mm/tlb.c:#switch_mm_irqs_off" on:

commit: 4873f494bbe4670f353a9b76ce44e6028c811cbb ("x86/mm: Remove 'mm' argument from unuse_temporary_mm() again")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/alternatives

in testcase: boot

config: x86_64-randconfig-161-20250413
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------+------------+------------+
|                                                  | d376972c98 | 4873f494bb |
+--------------------------------------------------+------------+------------+
| WARNING:at_arch/x86/mm/tlb.c:#switch_mm_irqs_off | 0          | 12         |
| RIP:switch_mm_irqs_off                           | 0          | 12         |
+--------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504171640.c81d6f67-lkp@intel.com


[    1.746877][    T9] ------------[ cut here ]------------
[ 1.747460][ T9] WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:913 switch_mm_irqs_off (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/mm/tlb.c:913) 
[    1.748353][    T9] Modules linked in:
[    1.748774][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc1-00055-g4873f494bbe4 #1 PREEMPT(undef)  e8aa378fdd0841698e07350fa58f890f8e93d36c
[    1.749754][    T9] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    1.749754][    T9] Workqueue: events once_deferred
[ 1.749754][ T9] RIP: 0010:switch_mm_irqs_off (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/mm/tlb.c:913) 
[ 1.749754][ T9] Code: 44 8b 6c 24 14 be 08 00 00 00 4c 89 e8 48 c1 e8 06 49 8d bc c4 00 07 00 00 e8 66 1d 6e 00 4d 0f a3 ac 24 00 07 00 00 72 04 90 <0f> 0b 90 48 81 fb 40 af 65 86 74 2f 44 8b 6c 24 14 4c 8d b3 00 07
All code
========
   0:	44 8b 6c 24 14       	mov    0x14(%rsp),%r13d
   5:	be 08 00 00 00       	mov    $0x8,%esi
   a:	4c 89 e8             	mov    %r13,%rax
   d:	48 c1 e8 06          	shr    $0x6,%rax
  11:	49 8d bc c4 00 07 00 	lea    0x700(%r12,%rax,8),%rdi
  18:	00 
  19:	e8 66 1d 6e 00       	call   0x6e1d84
  1e:	4d 0f a3 ac 24 00 07 	bt     %r13,0x700(%r12)
  25:	00 00 
  27:	72 04                	jb     0x2d
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	48 81 fb 40 af 65 86 	cmp    $0xffffffff8665af40,%rbx
  34:	74 2f                	je     0x65
  36:	44 8b 6c 24 14       	mov    0x14(%rsp),%r13d
  3b:	4c                   	rex.WR
  3c:	8d                   	.byte 0x8d
  3d:	b3 00                	mov    $0x0,%bl
  3f:	07                   	(bad)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	48 81 fb 40 af 65 86 	cmp    $0xffffffff8665af40,%rbx
   a:	74 2f                	je     0x3b
   c:	44 8b 6c 24 14       	mov    0x14(%rsp),%r13d
  11:	4c                   	rex.WR
  12:	8d                   	.byte 0x8d
  13:	b3 00                	mov    $0x0,%bl
  15:	07                   	(bad)
[    1.749754][    T9] RSP: 0000:ffff888103e779f8 EFLAGS: 00010046
[    1.749754][    T9] RAX: 0000000000000001 RBX: ffffffff8665af40 RCX: 0000000000000000
[    1.749754][    T9] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    1.749754][    T9] RBP: 1ffff110207cef42 R08: 0000000000000000 R09: 0000000000000000
[    1.749754][    T9] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888100058040
[    1.749754][    T9] R13: 0000000000000000 R14: 0000000000000000 R15: ffff888103e68490
[    1.749754][    T9] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    1.749754][    T9] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.749754][    T9] CR2: ffff88843ffff000 CR3: 000000010005c000 CR4: 00000000000406f0
[    1.749754][    T9] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    1.749754][    T9] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    1.749754][    T9] Call Trace:
[    1.749754][    T9]  <TASK>
[ 1.749754][ T9] ? cr4_update_pce (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/mm/tlb.c:778) 
[ 1.749754][ T9] unuse_temporary_mm (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/include/asm/debugreg.h:115 (discriminator 31) kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/mm/tlb.c:1034 (discriminator 31)) 
[ 1.749754][ T9] ? serial8250_isa_init_ports (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/include/asm/jump_label.h:46 kbuild/obj/consumer/x86_64-randconfig-161-20250413/drivers/tty/serial/8250/8250_platform.c:104) 
[ 1.749754][ T9] __text_poke (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/alternative.c:2221) 
[ 1.749754][ T9] ? add_nop (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/alternative.c:2119) 
[ 1.749754][ T9] ? optimize_nops (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/alternative.c:2132) 
[ 1.749754][ T9] ? serial8250_isa_init_ports (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/include/asm/jump_label.h:46 kbuild/obj/consumer/x86_64-randconfig-161-20250413/drivers/tty/serial/8250/8250_platform.c:104) 
[ 1.749754][ T9] smp_text_poke_batch_finish (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/alternative.c:2563 (discriminator 3)) 
[ 1.749754][ T9] ? mutex_trylock (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/locking/mutex.c:901) 
[ 1.749754][ T9] ? mutex_lock_io_nested (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/locking/mutex.c:745) 
[ 1.749754][ T9] ? smp_text_poke_sync_each_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/alternative.c:2527) 
[ 1.749754][ T9] arch_jump_label_transform_apply (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/jump_label.c:147) 
[ 1.749754][ T9] static_key_disable_cpuslocked (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/jump_label.c:32 kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/jump_label.c:241) 
[ 1.749754][ T9] once_deferred (kbuild/obj/consumer/x86_64-randconfig-161-20250413/lib/once.c:21 (discriminator 5)) 
[ 1.749754][ T9] process_one_work (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:3243) 
[ 1.749754][ T9] ? process_one_work (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:3245) 
[ 1.749754][ T9] ? show_cpu_pools_hogs (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:3140) 
[ 1.749754][ T9] ? assign_work (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:1200) 
[ 1.749754][ T9] worker_thread (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:3313 kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:3400) 
[ 1.749754][ T9] ? rescuer_thread (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/workqueue.c:3346) 
[ 1.749754][ T9] kthread (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/kthread.c:464) 
[ 1.749754][ T9] ? local_clock_noinstr (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/sched/clock.c:270 kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/sched/clock.c:306) 
[ 1.749754][ T9] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/kthread.c:413) 
[ 1.749754][ T9] ? ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/process.c:152) 
[ 1.749754][ T9] ? lockdep_hardirqs_on_prepare (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/locking/lockdep.c:472 kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/locking/lockdep.c:4412) 
[ 1.749754][ T9] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/kthread.c:413) 
[ 1.749754][ T9] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/process.c:159) 
[ 1.749754][ T9] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/kthread.c:413) 
[ 1.749754][ T9] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/entry/entry_64.S:258) 
[    1.749754][    T9]  </TASK>
[    1.749754][    T9] irq event stamp: 68
[ 1.749754][ T9] hardirqs last enabled at (67): _raw_spin_unlock_irq (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/include/asm/paravirt.h:686 kbuild/obj/consumer/x86_64-randconfig-161-20250413/include/linux/spinlock_api_smp.h:159 kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/locking/spinlock.c:202) 
[ 1.749754][ T9] hardirqs last disabled at (68): __text_poke (kbuild/obj/consumer/x86_64-randconfig-161-20250413/arch/x86/kernel/alternative.c:2179 (discriminator 1)) 
[ 1.749754][ T9] softirqs last enabled at (0): copy_process (kbuild/obj/consumer/x86_64-randconfig-161-20250413/kernel/fork.c:2375) 
[ 1.749754][ T9] softirqs last disabled at (0): 0x0 
[    1.749754][    T9] ---[ end trace 0000000000000000 ]---
[    1.754021][    T1] Performance Events: unsupported CPU family 6 model 42 no PMU driver, software events only.


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250417/202504171640.c81d6f67-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

