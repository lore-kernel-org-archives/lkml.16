Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD21F7569
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447298; cv=fail; b=p2FEQlexTm8ReYu+aJeEo/WV6pcri3qi2BfH0rICt1whPThuuAx7WGOqkitX232PZSnCymI3icrNuCy1HP0uRhlw0USQHNbTcEadffiZw1/GG/POKbXXju6NDcAH0AEkz+B9x0lfEHPy/4zOv44xVMIVrljq9inPr6C8jySBuv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447298; c=relaxed/simple;
	bh=+B7tuzD7zfTzIwMuo8froqKHRhGwzxet+3LZFmcb0/I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=H45f/8U484W8b7SYT3CfR5djThYY9riAxzamF6tomTK636N3BRIc1QzWlH/dTfaq79v4C4DcJqqOcflaMG22zX9h+5G0IPtPbphUDdCSqMkXII3N6L8fec3VVY/rlmltgYWJjnVe0iV9x0QbJ7aufpzlb5gtX7ba7PsjPrh+iUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpKjgMdt; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpKjgMdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751447297; x=1782983297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+B7tuzD7zfTzIwMuo8froqKHRhGwzxet+3LZFmcb0/I=;
  b=CpKjgMdtzJzerKEk4g1Nl1BLmnMwkFjqrjVn6Q/9L3qsSNGZEgF6D6f1
   5OeJO/Yv1gwWCUvMvRR8aYfMe3/U1wV+F1asEBRAgRt6qOlK86Sa9m1/G
   K/XmESdbiBNA8pngTqaNwLbDp5uLrY0q2S+hEW0vSvOk8bN4iagw5WLkg
   exQSXcdCzwzQF/TDt76ojREMwkoHqo76Ez2PtY1a4ye44QCzaXuzBNR4H
   gZoOuHAidmB0mDNMQg2EfCOv3MEchkrdKDX1Mi0cUQXqZq8lqyNHrqRxN
   j2BJRBSnU/HoGZL5Sjt8OQEa3cAEHpwwnj211XgZtWT76AwVBhBgAEwgk
   Q==;
X-CSE-ConnectionGUID: r+pLCGQwQ5iL9rdQ2vc1gA==
X-CSE-MsgGUID: dKF4JT9GSwK7/Yh5XeaTyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64780948"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64780948"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:08:16 -0700
X-CSE-ConnectionGUID: xXH7KREbTt+lQFqtCRrbIQ==
X-CSE-MsgGUID: fN0oJHKhTIeHwCOKMDPGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154172425"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:08:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:08:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 02:08:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EP3nDrdg4Du4f1Ekl4hRKRvP9xW+jcWluqS6lk1Ny3dJpFiILx0K3io4sb5Ds9Do64oa1fugyvVlnHhur51LwtdVB7zg8egd5k3ltSMSczYMdlF2EZa3EIK6wfa+/v8ihlGcWfQMlr4qiD0InH/pKdGXbcsIcaUkANok/CKYCrgbbiK5Fkf8haF5uk9E4f2cnvOdMk3iz+CymJPr8CcLvY/q+O10bGjKTl0YZXxOmwAKV90YiPnlT0bqsguaaTIKYetgX0E7DaRDjtSLss+qhLVQwaBVyEZevleatIMbYUNYpN+HWo1wGrW+9EyHJfY2M4Sazfhfecb18qwnLm094Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6txC1qr0CEz9MHfIEQSgtLm8jiboiH2/deHAJUn7mOo=;
 b=My152mPCdtG/elAxDqBAyiettYyTCF2Y0LNqIx3MauTuVgNKb03Vm0D76OFGazcXV3BCeMGRai4XmfOX1+YmoejAftV7lwpwbNgusqNIwqTsAj1u8WpCO/uuqAZdq1JLEPQG2NTle6CM+DuujW1i7sV6Uk0uvZY7s99bwoP/D+XzlhyJtdVuLo+pKGRXECc/aOoDEh1Ccpm2Jofue96ep642gNvS52KnjK4jmEmYkDoXtTp0+/nd9W3GazDgRdqZN6hxRExSaOwDV0GKwFPkn9y1Q4Vuh0lkQdWFaP6Hs6G07AuziuNkO9OzvcyrocE126SpNVqdBNe8yzG5LUetkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 09:07:32 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 2 Jul 2025
 09:07:32 +0000
Date: Wed, 2 Jul 2025 17:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: ld.lld: error: unrecognized instruction for 6_X relocation: 0x4000
Message-ID: <aGT2zT8tlCWykKeT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 25702198-8f89-48e5-9172-08ddb947e09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yTyhOQjR07nEj1gcONO6IeHzlmkovOLPuraGtA9O2S8WX1z1OqRzHy/Smrde?=
 =?us-ascii?Q?PQdkGWg7OI32+YWal4hxRxy5jYWsfZWWkQYhLJDCahTUjt/gTOfsSyjt3l1G?=
 =?us-ascii?Q?Ym7Rlp9Uk0wyvKKQ7900aH3tdsC9eoTME9e4ISO2SADNoR18XW4hIx1jKSGM?=
 =?us-ascii?Q?3Q7CTp7wgoQM++LOUP/OYU/+Z6TRy9U5q+IK8PQEa1eCExmyF5fu9SHu92RK?=
 =?us-ascii?Q?IK4yr3puqByiXZVP49ceHgjUcDXrjWnZBRYjXsaSwAY9RqDMYqKYKfEZ9pb6?=
 =?us-ascii?Q?wR1Ge0/KVQ+b1jjqyo63Dcyoc3LiNTESDITS1w/XVOBJsLlzw8S9fMATBkbM?=
 =?us-ascii?Q?y2dEhRjDqWSe2cpYdZG0IJo95fLFT4uiNB+pyQs3oYQ925IODr9qkqeDiVJw?=
 =?us-ascii?Q?ya/aGfyMe9vsv5LiV4Fa74SEH4y+zjD8nB/kDgz9hTmkR/FPUbG9UfmT3WXw?=
 =?us-ascii?Q?5Iw1i4vuL7Sgql0R0M7aGDNH+nJ0dNbZ4Ht+oErOmeDH9ZHruaHNXJfrHvnl?=
 =?us-ascii?Q?x1EbNhph4MjlgTiGK//FKvF6xfQ3Hss/2ED83D5NnQaodWki7SAmxOVryXWX?=
 =?us-ascii?Q?wPQ1/Roy8tlwUCuTmBspOPSQ4MtPHk0U3hqybhnixSE78H82UUc2J+KNdcig?=
 =?us-ascii?Q?qut9kWukAIvJuBUsZ7ucMDIfBpJBXcVySeHIotS09QYEqXw9D+JZjvborYCE?=
 =?us-ascii?Q?6w89dASw/jwIakGNU6IVx1qVv8QkMWy2FD0zTu4E5BAXdPQNnxuT35aq+fwz?=
 =?us-ascii?Q?W8IPbp2zDFbiqQHQK6gfduAI3IMQNZ7Lo0CZN6rlnApNO6Sz+6+WiLk/3OSR?=
 =?us-ascii?Q?UdpEGtuMF3lhagW3UfstdBV56Oq0DJ5fUGBbNND/UhcDi8Flr+ORMI1PZwgl?=
 =?us-ascii?Q?JQ0JFC0JwqhMs7jGPbgScE7mxTh6b404+w2PRsNOGncD7UOY/jJ80GdOAeLH?=
 =?us-ascii?Q?hvItI6d0kNkV5CsJ6LIwe47xbkvb+nXnVlW9GRFr7YPcqzVu3KHk+h32JWea?=
 =?us-ascii?Q?FNzkNxYyQsOtUcWjPoQqnNxmF6mAZIyaRWChmvCu7AWGsB4SDzf1A0wtNjB9?=
 =?us-ascii?Q?bTE39debHrjtSgXW1WhyBJ+Zfv0iIb7+6GCSSAWAesQ4lqYh4KKKE1qEIfKi?=
 =?us-ascii?Q?Rk3y30LojuTZV8t0J12hAbc7BoI9nhMASUkwhaPxwCekgU3634SCRbEu5gY9?=
 =?us-ascii?Q?bZYUmsnBIM7QbdpWC5fnbmOyYE0dwhPyw6L6GFINt/10jv7oVeTeZcCTHqvx?=
 =?us-ascii?Q?LCay/8LIRczgN8bp/gVJnCk77ZWtVisKRJPMNdk3Aoc3mbiA/3XTx7EG+K6I?=
 =?us-ascii?Q?D3V/zU847GGzIeQQpiR10345V491HCYNkk/zkRmz9EnoX84fAQScDYW/lrES?=
 =?us-ascii?Q?ZElhoNPi7Co7u6dqZsEAYmxXOrr+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cNcyO65PYzhEm9GH1tPH5q7SL1SbFmEtp/HuJnC+wyrMz/wI75IWwRtqDlqR?=
 =?us-ascii?Q?FabnJacHClTZz557FX6D3tgqMeOraC9bih4dX0Ei/TQAk9PyW8/eakhrN3ue?=
 =?us-ascii?Q?mTq8QzsboOlyvxmPNkrjTuh/5+c3fQW8BIdiDhMJ0vGgcPrip8jaCcYQxROj?=
 =?us-ascii?Q?3WKfd8HWfCwFhlLAsbB12uSV/Ssj68YlAyWycXOUQ+IVLkNUStC1rZm5DTQE?=
 =?us-ascii?Q?GjU9x0ythbRLrMQIT2BiP9Ytdp/q8jOAr0dtGaxHZmRpHRgtWpLFMwrCcwkX?=
 =?us-ascii?Q?i40qcdAqMxtUxrU7EMaBV4ceg4jkaph12551RApTpDocVlhXRcjOhbaILqie?=
 =?us-ascii?Q?WdZDGa0T1xyazmEO30vDeLOsthOe421TVyS9N9pf77YINtJQ6wJBNkkuU854?=
 =?us-ascii?Q?06jt9wYQXRhZrWGYcE2PmQvmumAChi68AGEti8QqUzbbN3dpYVI/n9pWIK/t?=
 =?us-ascii?Q?TO8xiIMJt7ZTGqhE/qnkLeJvKD/of6UTxFGNcbRfucwqEzZs3Q1KHv2457MW?=
 =?us-ascii?Q?mnhNqdBUhJ7YfTMKV+EtiRDdKmZj9Rd8gw3IaLcrUgRQIQT7hwflHaC8cELu?=
 =?us-ascii?Q?UHHbdFPYvOpRhFuJ/D62RfVv37y4K7IemzYT/gvw3R0JNWqQgKE6EKWM7w0H?=
 =?us-ascii?Q?5Mk0vM1ozRzc/VRMIdC5cqm+xFIdmWGaEphbOwZ0ElSQy2sZb1+xakE8cx4Y?=
 =?us-ascii?Q?pEQXZtIXLMlcmwotcrcTd/+7S2I+vTaugkrb7J4aZJA2Uh2m9JrW3jIixGgb?=
 =?us-ascii?Q?auIElCMBYtXczsiekCjGfyajNHOX7uftMcN8EMxy8hhrFel2Vwe9B5oN+Vw2?=
 =?us-ascii?Q?ENfKIbHllrj0gPGIR9UEA8NyBuKbrpMC60BDzIitYRmu4GANI8kojFJf+DLi?=
 =?us-ascii?Q?RPUvt7usBPc+JXD5BzFmT5qsxAU6NwCmDCJyBiV19ektjn4Vm4LR9Zf0Kjsd?=
 =?us-ascii?Q?iyG/DzqqvJ5RqzChMfXuK0afVYyLv1227LEu3aBtNJdy8QDn6Zz9YYZt1hbV?=
 =?us-ascii?Q?OXE0j0zy7DAcBNGIoyM5zegwb9OQKIcGohjWwvi+nIbBJut+64bkQur0CgMd?=
 =?us-ascii?Q?s60aIlW9K5kSSRVmxvKPk7g9QorhraC9loXtEUwT9o5NPfsSPPxp3XgUXI1O?=
 =?us-ascii?Q?mARVDCmFkyKZZgKe1rjubPzS1EyQh6r7AT8a10dMJ0qeVJcxVYRz0d2LJfWx?=
 =?us-ascii?Q?Uk1tcg6lKpLKcnQ8xDlxi8rTkUx1VjMAizV4FnqtMy4Bv5Ft62thNSwY43mn?=
 =?us-ascii?Q?Iz7P3hDszh27/7eVVmY7OYIw07DcrWCqxXnKMvYLxKp+RQOzq/TOObXKWRLd?=
 =?us-ascii?Q?6jluu0UdWsaRtoFG+MBfW09zWNCIkKsQlxKGYYmWFhGfYlIgcxCK2tMkysWI?=
 =?us-ascii?Q?RvTZ8fiugZ1hbbCk1P+ASQazKjfP6xJYGruyQ+cmjKpC3yfDwsNthzjVwC5b?=
 =?us-ascii?Q?THZF1AqnugqVtLCxgHifOfIyYwnEAQ/2igAtDP8Bur4fUjJluF6NVamln9tj?=
 =?us-ascii?Q?X6bU9DwGPNJmN8gmba+HhXYF5q98ktI8jwZeTYePLBM/LtrCIbJ71u6wA4rQ?=
 =?us-ascii?Q?oMk0WXCl3/FubwvOpJu/SjQvbpkprrVEZziYxTszR1L3EfCLLxY51jI78BVm?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25702198-8f89-48e5-9172-08ddb947e09b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:07:32.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL0e+T/jByB9gA46dtqfvk3s0Qm2sO7nf6anYJB4qxJA3OsMHk8FFV56KTxfoYbmmCrPkjkrOVuMSaFoqpJthQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66701750d5565c574af42bef0b789ce0203e3071
commit: 84ffc79bfbf70c779e60218563f2f3ad45288671 kbuild: Add '-fno-builtin-wcslen'
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250702/202507021345.YPA17Mfu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021345.YPA17Mfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507021345.YPA17Mfu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unrecognized instruction for 6_X relocation: 0x4000
>> ld.lld: error: unrecognized instruction for 6_X relocation: 0x4000

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

