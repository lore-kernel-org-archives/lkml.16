Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516FF84A35
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631192; cv=fail; b=Hbx8lhcYWabdECNjss/NjpW+Ft5ADTr45Y63b6jK8WVNbxnwQ6ABhbuEBo+pKiObT3sGOojyYhXP0lU05Pe++qzix2zPISAHO1svRChQ7+8DsuYCvdKO3yYMz/kIaIEmlS/1SmcZr+qSSA1GDHMWr4PvCX/qbypA0Syrm73C3KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631192; c=relaxed/simple;
	bh=Rse2ng6bu4RDJzuQzow9b42intJlqysU/5whj1ijaDE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Vs+IDI78MqmoIxi5G4Ycqua/5tqlVx2uYOk8Q9085nAsC/Gelj3dIYx6SPaCEjeKMvcHYAa+1bshIQjrepr3nGdwwoIppg2In17glo+T83y+g/j23qnCNbBH/mFXf16PEMUTFZRgVnMDWlUC3yXo/g7GUsufFNGpahS/SJqU4Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8MctIQQ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8MctIQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747631190; x=1779167190;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Rse2ng6bu4RDJzuQzow9b42intJlqysU/5whj1ijaDE=;
  b=I8MctIQQM0VHBzdoDfQoOsq+o99TAxgk2sHpElPM3tv9DO+IW/GBqs33
   SSYYZGYF3S9ork/zJXmFAQ2ihs6U/AAyzmWATDFftt6BxFSshB9pbqfCY
   DykU8SQv5k7eOrjHVmkhN1mahrCyY0Ih8f8AqdOkjquMdkzf8sbt/DgGv
   RynxJaMBlNb8vrxWJ1Hmr1I1uJLBl2pQM/Y+23OeIURbZW66VjOqqCcY9
   oOwAXPU7461DKk7YMRaHy2Td/LJp1NP4WczJUiMOMteKECIYCBWBbrkrp
   jX0aoHajCG+4qp0K1vP3/CEM8cCfTBZxfJvuY+h0DYxBglaYFWReKUys4
   g==;
X-CSE-ConnectionGUID: i3Fk0zWASDKB7/wgxgV2Nw==
X-CSE-MsgGUID: /kxDiDIxQHeHKB2DqnT78Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60858916"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60858916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 22:06:30 -0700
X-CSE-ConnectionGUID: dQTibt8hTrCd1YNFqsu/zw==
X-CSE-MsgGUID: SwrbgPfQTPisMwtVd2CyUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140278290"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 22:06:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 22:06:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 22:06:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 22:06:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUuCAif+cjObKFWB4wc7f6bJyCFd52gTbKThvPymZ6bDdCfalMM/1wn6SP0UgeSidrICdAUx7GNPzbqd51y9LmH8c6+m7B6tyV+VVTdC272HUlyo19HRcdqQkvl98StVKaHDBcb/Pub5VbJFM9mPRqjKmRaxbYgNquB24YQpPKjOzFvrpDZZR7nrK+aOtd0hE5V+ATS7NURIxxrkUA2YYr4PCfdpB+IK8Ke9RF/PGz8UD+iM4t4Wv7UA9purQsF8Rx3omf9KSClBDl+fe/YaFHj94kJLJxIjyNtDM1p0syN97WLGQiQvzj4kW7tNiA2hF47EKCZL1rPBo4o3scX+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FazT201bA/wda+10pNQhC3pzqoxYAlWZCHE/nz0IX+Y=;
 b=BEF3B1uE5Kx2pFSlL0zKvgOXABHDOaUpVTUCPBmK91s3uKVCib5mndd5jDb4CgeEL8cfVvnfrSE8m+0D3VYVzd5jx1r8NEFy7JCVLfptDqSxrhmiSK4MOR1yXbu27VfdKxvXTkn76heEF/RdZ2GGwRnvWy8yLkdVcrfoySGeNHjYSe8w9RUnKYpDLdc8dGmwCuBj/PyFA0K7IPKp2uBEufUKdD2hI5E3XNxSUdsvKIP+NIarub9tqR6slmSLIac+GR8RLfBBGonGR35LTLfmtGjGMBZgvYHdm0N0/8wvSpPxNOaapZhoBPq4nAyV5D/u0A/qmoJU+di5CGYvC5dbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 05:06:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 05:06:12 +0000
Date: Mon, 19 May 2025 13:06:03 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<oliver.sang@intel.com>
Subject: [tip:locking/futex] [futex]  b04b8f3032:  perf-bench-futex.ops/s
 3.9% regression
Message-ID: <202505191048.c1220460-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b3a8b2-3b2c-49a1-e38a-08dd9692dfee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HlQMHTNR1fDF6HFQQhXDPFJ7I0mWV+QHawEC2VF24PCzt67hBTCMQdcCe7?=
 =?iso-8859-1?Q?nAqMh3WEWtdO2SgSidaZTSUl5VVxuEm8bG+wVo9FVhmzeag6yvPXRKqTfy?=
 =?iso-8859-1?Q?F4wCZJSy5Pz11fWl9l8t9riBfepLqAwdYMtIA629mFmHo3mWNDjCtqmgcB?=
 =?iso-8859-1?Q?L7jCsiS33fJWIHT0TfWlvc+gt5AkyLfNKnT49qXHc+dOFiMy5kgKidhkVR?=
 =?iso-8859-1?Q?SlKU0X0fQjtvKpN5yUZC96KtGaEnR/4aTYZoyZA2H6nJv2Md+SLQRsb+C7?=
 =?iso-8859-1?Q?ntenwH21BQXuE1fFi1o7fMxSNuLrt4B+7qgzMMxWbqjJmS0Xu88yd7Ab4u?=
 =?iso-8859-1?Q?8dVQyqb75QLfi167LvVYAQVq28Hw7rasnb+jK0hHbVnEJCTYWmWavDD3il?=
 =?iso-8859-1?Q?3WQOuZ8jmjI2X8PYhMNtYkOtx3Ug3U+O0dcdvhg66wsxOWTVepoJs7N1D5?=
 =?iso-8859-1?Q?hUeSlcFPP4ajjtjA4W1kLKdalNoxTqcc/MvRyCoFRf+MCBD9tu9Tk3TFRI?=
 =?iso-8859-1?Q?gM+nrNGTqtAJiKflFW5la61hY7c7spAt4d7a7LyKhw3F1j34gPWl7yEL5l?=
 =?iso-8859-1?Q?N4csdkVCAjV3PHQ6loIfpgLbUar0eS/oDvQwhPUmdo3cUbM2cVWDaJ2PVI?=
 =?iso-8859-1?Q?h0MNxfSH8OcsJSOP3SbESIHQ7WULpbbaJN0n3+6VhPQMVa8nqkmXXZpssk?=
 =?iso-8859-1?Q?v6ZCdEqjhUQatDDsEF0SdN6ZSTbsXU5NsPRybh1ajPMuG9JA7mq3Cg4S0T?=
 =?iso-8859-1?Q?MVWZqQT/aE2xqG6cGBrwq2guyEvx41CJhCn2asAu5Bota9eYqAAzphkf+T?=
 =?iso-8859-1?Q?RhxyP6Fnb2UAZD0YIxN5J8jKQCYHH05P1xIGa4lpT7QZMHHvdxlj/FKxVu?=
 =?iso-8859-1?Q?T97jxCm6eYrCwuo2kcPm3hirkX5k6g+aetQoMx69CCih/G+u7swwCQyo60?=
 =?iso-8859-1?Q?ok6ZwaYapMVKMTGjHM4qkodO6+McqNsKeHkEHSiETFUrb8D7NjaKtplzF7?=
 =?iso-8859-1?Q?TwoLMT+vxQdp5dKFAl3jwwiFrrVa2U2qszS8dWMhTsX0uxVOWNLMHnuanq?=
 =?iso-8859-1?Q?VtSH0pLUODf+3kIoI0xuIRWc1I7tjYINbz2ZXpzUaZS70HgfpFDQv2H5gu?=
 =?iso-8859-1?Q?A3ohi/7FdF8G0EsFMhr4aBAoCSOtkzToyC+xniDlIKZvBMEuGllavGzcon?=
 =?iso-8859-1?Q?SiwiTT24n4008MYxa/KmhGg7B1dVb9uMRIsEjVTgNeub4uVaRXDCbDSFtG?=
 =?iso-8859-1?Q?+KjT6G2a2KLomQzEPhZnWVqVjW0JM/yzSukCyMPvlP5EQbDO51kvMxmRmt?=
 =?iso-8859-1?Q?AaY3OI+2Ko61FPN4/fIXyFjegyxdCcSwZ+eH7AkMVDBDAUFnMHdeDjiXW2?=
 =?iso-8859-1?Q?+T/vJx6I4lqWnHbDTTuCOW0E31+AaSCEbqGlKe8+PpXnO3Ovt8Ek2qngQU?=
 =?iso-8859-1?Q?7Fnj20Cv6cTeTEYk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1+JREFyMYURwUBu7e8uUCNLEZq8t0S14g/o6wnSMBAbiT9kVkQ5BOs8AP0?=
 =?iso-8859-1?Q?K3ao7nVVVn7JG8+C94i5lNKnXgR0S/zSt7Ce5xZi7IX+euv1BYT7JmvEw7?=
 =?iso-8859-1?Q?xu1q0w0lJApsI0I3tQRo+fPkGieYqZTGmmxbOVX2I6OtvVR63IIt2h2o8x?=
 =?iso-8859-1?Q?W7MHP8zR1IN/SDli5fWER2xFAminYFwQvdOJLfzkX31Km0iIG41diT9naR?=
 =?iso-8859-1?Q?MopHh5i97gvgErTfReQPHcHn1NdzDH50uOpulKEBGkahuQ2pDzk9hmIgqO?=
 =?iso-8859-1?Q?OIU7s5Stx9LoyljXwjIiFEt+TBfKpikxIif5lRlCqPCnthymJudHD4/Prr?=
 =?iso-8859-1?Q?/C68Dp4PP0kqaDxsRiA1VP9H1fHZmZfnHyuqK4TLpA4RKL4vt1MCy0cdAX?=
 =?iso-8859-1?Q?cyGhdFl9WyTK/g06WUJXDnbAwvOUkC/7m32mq9U0l+vyzF9aJ75C6VTmV6?=
 =?iso-8859-1?Q?X3bcjQcJVpvzEquJUKD3KPn/YSCGtd/jgcdqBUjTEF8tidqibn87FpK5F+?=
 =?iso-8859-1?Q?K+GwAsHbfAjR3lHdNdg7fc632zpJ6JjIalBcKkwBsRm28VIBq5PXuAgLdc?=
 =?iso-8859-1?Q?lYLoD078dYj8fRob5cd8bl/gO5ekbqxQuFcZ4GyfLylkSQmM7B+2RIYhBR?=
 =?iso-8859-1?Q?jaEDYQKWCQUb4pSe6J95x/gCGUevozVwB2/+3foHTjh02rWX8cPwZLsggy?=
 =?iso-8859-1?Q?qnaI5ndJHnCAut7CI+gJDHVtxyzhQsGBR9umowKi6K8QrL2evHdjy3M1Po?=
 =?iso-8859-1?Q?+XivxdRvuAunwDfrJCC4ibSYal3UIdFf2qu0XgHr/WvaGOfN8loTD+Cq82?=
 =?iso-8859-1?Q?nu85WEgYpAhuI0E6XgH4aEJWwwUkRb0ZkOtcwsdcr99ZbXQLOa4Ks4ZVKl?=
 =?iso-8859-1?Q?x6DQNkqdb9baCTPqonMPhUC4YmnLwhVStT+ei5aIuo0SBhunwih1E9zKT2?=
 =?iso-8859-1?Q?3bBBytYMQxzM77GVrmZXo7xWBdichRnd8UpLOwyWvXdXAGnCfc6uER+NEY?=
 =?iso-8859-1?Q?qLPiaVAFYljYpCn60qciUj0A/zstrDGm3cldF9JTfqjw9XQZ5tkUQ1dIRd?=
 =?iso-8859-1?Q?5/JwTnu8j746SVCl+X5eSrEIu8Wl5j+HoNgt9RD5HEsBELIMclyxRvhWPw?=
 =?iso-8859-1?Q?yd/xcxjkYN3PZOxWOzuC2uLu9qfbm6aH2lCNCIKFP9BLRovIN6jQEheUDy?=
 =?iso-8859-1?Q?K5UdxF+UFcQEkE4ZbyQyJGcoJ+HPty9yBeQptad7ZmJcJNmlNv9rN9RePl?=
 =?iso-8859-1?Q?adsAIGXxOA7/7ntwrawMWL0g+qi8QxB71uFtFmvNCdV3KcVa8+iQczuaAN?=
 =?iso-8859-1?Q?i7u6VfDWpsLyjaVa3m9/dhbXoVa7wjDHQhz2bv1L3337tYw+PPNzLCTy2x?=
 =?iso-8859-1?Q?LKZttuyC9QCIB02v1bO97inElZMfj04E0tpLGZG6oiyMdkzRvbMKfH9Ife?=
 =?iso-8859-1?Q?fUAEj+ml9fBvrITfdSqOCrQIzZrR3ZA9L74+PUTV1picF4mepYz7NXKvq4?=
 =?iso-8859-1?Q?LKbY8XG/07er0T/Fes89roNh1T7+Qu8R7uVQQFvNMUukOTRPCud3EOQp4U?=
 =?iso-8859-1?Q?u9ukvszprpHuaxymtQ3AyL+yMKywZ8k80TIy/ZW5nqv3AyLLnKxAwqfBD2?=
 =?iso-8859-1?Q?j2YtPmYsRw9rkBzBXXJFJOJB320nX2/+qOML3GAFzs5+4ciZ7YcFiwLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b3a8b2-3b2c-49a1-e38a-08dd9692dfee
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 05:06:12.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpWLkvWGpmO5d1XG7pw7BmOGjNXKz5jIG68E8B5hz/OieyPc7dO8AnkbiprQjh47zh5wdUTXT+4u7XonOVYaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.9% regression of perf-bench-futex.ops/s on:


commit: b04b8f3032aae6121303bfa324c768faba032242 ("futex: Introduce futex_q_lockptr_lock()")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/futex

[test failed on linux-next/master 484803582c77061b470ac64a634f25f89715be3f]

testcase: perf-bench-futex
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: hash
	shared: shared
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505191048.c1220460-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250519/202505191048.c1220460-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/shared/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/300s/shared/lkp-srf-2sp2/hash/perf-bench-futex

commit: 
  fe00e88d21 ("futex: Decrease the waiter count before the unlock operation")
  b04b8f3032 ("futex: Introduce futex_q_lockptr_lock()")

fe00e88d217a7bf7 b04b8f3032aae6121303bfa324c 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     17199 ±  8%      -9.4%      15577 ±  4%  numa-meminfo.node1.KernelStack
      4350 ± 14%     -16.1%       3649 ± 13%  numa-meminfo.node1.PageTables
     17199 ±  8%      -9.4%      15574 ±  4%  numa-vmstat.node1.nr_kernel_stack
      1088 ± 14%     -16.1%     913.51 ± 13%  numa-vmstat.node1.nr_page_table_pages
   2389657            -3.9%    2296088        perf-bench-futex.ops/s
      7000            -4.9%       6658        perf-bench-futex.time.user_time
    339.33 ± 19%     +45.8%     494.61 ± 19%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1991 ± 26%     +93.3%       3850 ±  6%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    339.33 ± 19%     +45.8%     494.60 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1991 ± 26%     +93.3%       3850 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.39            +1.7%       0.39        perf-stat.i.MPKI
 9.267e+10            -3.9%  8.904e+10        perf-stat.i.branch-instructions
 2.172e+08            -4.1%  2.082e+08        perf-stat.i.cache-misses
 5.278e+08            -3.7%  5.084e+08        perf-stat.i.cache-references
      1.09            +6.1%       1.15        perf-stat.i.cpi
      2814            +4.3%       2935        perf-stat.i.cycles-between-cache-misses
 5.631e+11            -5.8%  5.305e+11        perf-stat.i.instructions
      0.92            -5.8%       0.87        perf-stat.i.ipc
      0.39            +1.7%       0.39        perf-stat.overall.MPKI
      1.09            +6.1%       1.15        perf-stat.overall.cpi
      2815            +4.3%       2936        perf-stat.overall.cycles-between-cache-misses
      0.92            -5.8%       0.87        perf-stat.overall.ipc
 9.236e+10            -3.9%  8.875e+10        perf-stat.ps.branch-instructions
 2.165e+08            -4.1%  2.075e+08        perf-stat.ps.cache-misses
  5.26e+08            -3.7%  5.067e+08        perf-stat.ps.cache-references
 5.612e+11            -5.8%  5.288e+11        perf-stat.ps.instructions
 1.689e+14            -5.8%  1.592e+14        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

