Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E434E1BC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501077; cv=fail; b=Oh7GTktzyC/eWs79745cortz2LA+vnI0I7ScS1P22IRoOREKm/PjjCf+HeS2IbOVsNDFusPDqjN7jvxN4rYFXgkc2QabMqQudl+ZZ9uAmBsqz4EdM3DAk1vEcAaORVjTjrxMxdSr8BzWr18FSg3+i3Byx9A+xTJJ8TCADA+dT1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501077; c=relaxed/simple;
	bh=blSyBtILWeG9Lp3+woeB1gbGxLpSuqTWghLf9OSs0O4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Xx9PHx0AP8jxFNfULXdtKDFAB2h0Lk4nJqNV+JZKlI6uj/VZk9xWLv4VwIlkSe1QnzUsB//+JAOzivtlMeLTTqitx0ePTtxjf5qujliqa/v1d2caiKvvmbU85Me2jgzo2frSI64egdBpRLmfdf+SK2IoqaxoUm7w01K3tyAPdb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqLdR0cH; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqLdR0cH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746501076; x=1778037076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blSyBtILWeG9Lp3+woeB1gbGxLpSuqTWghLf9OSs0O4=;
  b=TqLdR0cHmQHP0B7GezEQAylU3a++iNP70rKzj64xYgNRVWUYKLflKfki
   8329RQ7mKrvYcBTZVAqQggxCajaS8PqWE6k3pvNu2w3qid1H23UYx885s
   OChGuRMKDO9wJTAkVa7S0pEJcz8D5sFncecOy8+lp1KDfojaUTJw3V60r
   2f3Pd5k7JA5URVBWxzd+tzFg11h65eQnSnXzZZSBQ/4X0lV5227zqxPq/
   pRHhTkUplFapEua7wF6ENstqt+eCFxoRKkzTgIDVW60DCmzKZx58SKTwo
   EaJEqVvQhSMDOpzykhU2Fgf1O93Jc2+vUl/n/ghRcLIrt35xPQMnjQwbM
   w==;
X-CSE-ConnectionGUID: ulpietKUQM6aTdo9D4aQKg==
X-CSE-MsgGUID: I/0MZni7RbOaFlbqMhSg1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47401752"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="47401752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:11:03 -0700
X-CSE-ConnectionGUID: f4vxrMvEQNinKkOaBm1kYg==
X-CSE-MsgGUID: ei9UAA4JTXuXsG92N87Lrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="166382751"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:11:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 20:11:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 20:11:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 20:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBlmXvvJYeVAWDpAIEzwn8Gm09PPoU8CAdSZ61n3sLAR73Kwi5BaNbwHcQi1Czu7hVkMUUSX9fXu/pwe+x2XgDcMN+WIbLypXMskmj1ivpNIW9ZeO54ilzUZ8apuULi1DtE12poKscpScsOmu8gcENhG/jojJAt0g0nNJO3joRFHyxKOMRu8WJ2cVoD/tJ+gJUZn2xHsdWVOjaKUTho5CdpaxayWi7lA7TzjrYl/00WPjPI+FbZu11LZtJr6/J/2RySR69Ajfo81a47tyo8LXcU088mNHhCI16lra/i3a691+ezflb+uJT2KWQsm6PBTGLp5EldGibd5t2H09MMx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmAW62tP/ZSui+3EKz4BZ2fzBLEwHMPrEeOjdM+L5M0=;
 b=CvbeCdUYZTZa2gvJXfIl03HmxEd1IFYxFJVt7LU/2rKZYbdV8BlEWP63EIlLBhkhp1sWdTmm1vwUfirQlr8ruIIMrSuwtsl6tKTrxhAlzTRrzHlk996bAWd9UcNGdvgiVdnBepUJcNj/EDeSyyPhgRjwHMqTSB4OXtMJs281FnKDNVeRPbDxsQjkACe/fMnJmYX2Aieuq4m19EQ73+noIHiZ0avebO7QjiJxEANh/tP4kXLBs4n0FZWdbk5vB+rc/bEPvyW6UBQsnCfQV3E2H92LQhCAjiWxVGdWgcmBAl7AEsPzn6kEme9Vc/5C1kqS2QQjYP9BjINKrHgRSGTmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DM3PPF777B3455C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 03:10:47 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Tue, 6 May 2025
 03:10:47 +0000
Date: Tue, 6 May 2025 11:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Herbert
 Xu" <herbert@gondor.apana.org.au>, Conor Dooley <conor.dooley@microchip.com>
Subject: arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: sham@0 (ti,omap4-sham):
 'ti,hwmods' is a required property
Message-ID: <aBl9r4JSGPocGsLt@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DM3PPF777B3455C:EE_
X-MS-Office365-Filtering-Correlation-Id: aee6d84f-98ed-472a-acb7-08dd8c4b98d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KhILIhphA1Q3YcsQJNBx21wB+xfI0js8Nvuq7rJpcrmT6QT4AJNESAbMJPqZ?=
 =?us-ascii?Q?0aosqafP8aAxGdYorB0D9wyEoudO2dwWbOLD7vwHlqdNBQaeq8KMzkicNoXN?=
 =?us-ascii?Q?Y3lomi4JM/wp4l6guGWyYu2F/lSi3QlGDf9yai8FnUk/kE1U88mSpNuNaZ7U?=
 =?us-ascii?Q?Ao74HHugz9sloPo2AxaXHTEMMAarvlqIie9MprFOceDN4mUezWmfCP4APuiH?=
 =?us-ascii?Q?t6j2AiiTyrytzXkwbrYbMquLOx4PG1T5FzHjmn+hh8B4yz05NC5K85Lhex5L?=
 =?us-ascii?Q?t/erk58Y6u7uFoAkRMwrLnAUNEMlAvSUH6noNNxR690jWk1kBluIoHw14IkO?=
 =?us-ascii?Q?jw8sRGVJV27yazFiAaBPjA2H3g2RzjvFhyQ84c/I2JFTGBdS0NVEQULX9Ex0?=
 =?us-ascii?Q?b42HClhNjqrcw5F1OXXDzo9cojl6iDWuw/A4C31gzd3Yqun6VYzsOpYnEzh5?=
 =?us-ascii?Q?yCqUHBNVVFd3J7YEUDykCSGqy4bGDjWGvxd3BUPX29rAHA5WdKsE+Mgi2HDy?=
 =?us-ascii?Q?3fM71i488rxJFpYaTRMAQkPHvhWjMK1TXw4XbD7oX5cJ5kKE7Izxe9P6BJqm?=
 =?us-ascii?Q?hx9oEJSStiigJK0simiJsCPcXxIS75D51MpLCTtSK+7vCtrpNj9/v3IMcU5n?=
 =?us-ascii?Q?kTmskN36NLey/tEzhMUGNVVGKbxDIOR38J7Va7ZPP2qNtJYJdACdcj3vQmSe?=
 =?us-ascii?Q?6sHbn2IHWli/cHMApHan1RGi+7VYx2MGAFb2Xk1swvUzqlVIqRgToHYzOeyU?=
 =?us-ascii?Q?QCmcdXVyouTzOtWWLs/7d93QuoYSSHLxV2yqWKWY6nWBA9MW/4nZU6siPFYC?=
 =?us-ascii?Q?jQnHnByhdbG9F3Kj1QImDKH72rRwCI6q2jdXcmv8cYWwdb027o5/H9jlxFvm?=
 =?us-ascii?Q?vsHuB6PRI179QvLojVXSo3P/59m6e60bkSYAtH6vt66+1OMz0ENiqrQMtrdf?=
 =?us-ascii?Q?O/zckbhG9a6Ajqto72ZeMNWWAiSmiJ84KubMZ+MykOwlTuxHDw+5PyX/4L9H?=
 =?us-ascii?Q?94KA4PkEEh16eHkznJC2W48M8nK7EHV38tFx+ZODIUPDOHENpiO3q/9+M4j+?=
 =?us-ascii?Q?y+vn+q1aKD2R5Nxy7FEnLlZ6ERxvEPQ+CRF1iuGVvK6feHEMLMOs+PLGM9hL?=
 =?us-ascii?Q?xOS3KZiWDU/sV0RFgptU8fc/3m7f0cabkwBbkdJwJ7k4EC+uGEmiGZIjvEg5?=
 =?us-ascii?Q?ooSiGA7FEnERy7T71q5j/L47bktCrJTcaBFU/n8L1hod6zV3/8w55amhxf2d?=
 =?us-ascii?Q?9KYOzTXT62bhfRKbdknHY5TSavLpZihiTYAeOw4/oPKou8Owuxhdp+pFT3b9?=
 =?us-ascii?Q?qtz+7fLeEIthdhF1WjKMq1OsDEQKaU6tnBx0I7UkIVPjzNfWuAQNEEAh/7nU?=
 =?us-ascii?Q?1MOviHBxKWINW8qfVmoxWATTK2QZ2gQ+cYl9Ih9nKpEiqkqt43BcolJ05Lqb?=
 =?us-ascii?Q?BkkqwBXgY+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZgI+oPkD79RkeuE2bOO63U0BRpe08nmtEC9rFrZLorCpZgK0Q3ACeIIXr5W?=
 =?us-ascii?Q?J9+UAzAYthooXCLa4tGsHFZz2la11kwNj04Jd77pZFnqNH2q6r9vmA4Yyewn?=
 =?us-ascii?Q?Nc3+gMLLdTY3YtNDXSEPBULjkh64F7WMYm7jO5qhhc8lp/nF5yuUa6a3Kdeo?=
 =?us-ascii?Q?+f7Buv/O4ltnbRKcugs3eetbBJ/P5LQB6llvqVtCmyGO0K7Fc5wqnQQXcNlZ?=
 =?us-ascii?Q?ncc21sGuIT87BX39gKC45LjGVhP//HXpRKy80eXjwQVfD6O5wMcgdrQwIHSh?=
 =?us-ascii?Q?LpmXfYtLNx7WTB6xHLEE2W9kE6xi/rEcIDx+Q0gOb05ZQOostAVwwTwMenst?=
 =?us-ascii?Q?np2N1oPYsRrPDjjW9mW5p2ycn07+lezimVDi5I+mgjmPt//elW5Bz4amqPrK?=
 =?us-ascii?Q?Vbeqx8m5xriKXTdrb5z1Z+Ay2Gnnt9TllbvALFEkU5hclBlk5YpnjQqqv9gY?=
 =?us-ascii?Q?uli9EfTM/7ryd6MiVGfOuE4R2lM0hO5xCyTCXriLmTi9abdDBMP7ryPrW+PD?=
 =?us-ascii?Q?bbOxqMzP3N2h0tIB+8506xy2+iieS9btOKeuOhqge0ISdtfhTJWTOJ/hvkdT?=
 =?us-ascii?Q?8l16LGJe0X1ouXSrMvoje2jYMU5sO72sREarbRi6kb3RQYzXRWLAonXsYdab?=
 =?us-ascii?Q?cJb6yeMO3fEetQY6ZKmkCsfoj5wOh7LOzn6eiCupwOpTMMA6MKp2czbAbPsk?=
 =?us-ascii?Q?L5YK4PqANs4wQUNB3PgKaKKJOB04qDqatOws0t0V0k6fsyQyV6Pcfnncm9aw?=
 =?us-ascii?Q?x8R6Kw3VIeuV1dzrktG96m80CheoVBz0n34OdaFhZ5fZ1Hu84UUBLWrNn8p7?=
 =?us-ascii?Q?dEYDBh/NoaKiOkWPvRiT6aK/YaSeMKmJ3dmRveqF/GsA86W6P7tL3iqErVua?=
 =?us-ascii?Q?i33u9ph2M3vnO0ZGtMkwkwlAxAnf6/RF4qcvCIFutfvoRwfpJV5eD7gL8DOs?=
 =?us-ascii?Q?rCMArTv6Ip9oxkjbfbX6RbzCMeDXxdg2nRV0oyce+JE3j+YSoCnJ8RYsywWg?=
 =?us-ascii?Q?Y8sDoBQPWAF3xH1iPQUqFheArnyD+5YrQHco3PJjrV4nG22Quiz1/ad2hXU9?=
 =?us-ascii?Q?tIl4bdE5LeJF6Yfs5aIyUHXTrWXiX4A9Z36HBkfls8oXb6I3QDWPpdlJ5DaS?=
 =?us-ascii?Q?p6lhQlFxJnzqWrOKdMYyIRmrDuxlkTSCcwz/LUb1hZPGc7veU7P5VDKArRBs?=
 =?us-ascii?Q?KEXSWDcekaskvcDK8Gz3Wn2yO1d+7RQxw/AwWopmpt/zN0FXKwj6zL+r1EAi?=
 =?us-ascii?Q?Fect/PVrZ2d0wkqLKt7IUUUeDvXexl8k2CInP9nv7EiWfCidp6ZckhcKQdCI?=
 =?us-ascii?Q?FKVDViB72rujOnTApL5uOmdPnw0mRqHw/ewcXVQEUi/Z46BGcXUE6/KEii3c?=
 =?us-ascii?Q?nVxxHPBQ1/VYg8/H/PfmcLARjw4uFL2jusDwibu/hPorOr9GJugbJNoKdxrH?=
 =?us-ascii?Q?T8lMtqtI9YXbLOeser1uwgtwKO/I40AQIthz7OqsFAHcCuRJqFxkEJvzuBUs?=
 =?us-ascii?Q?hZdY377gHbGPQgw/wjuYhmLH28WinSfFCOiLl+SG2v+nlYdAi0FmMHI6P43x?=
 =?us-ascii?Q?EcDIokFNqF8KrZn9dsM0VyGRM5q6GZDHUKIRPoALzfwopwip9pH8WAyF+ogh?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aee6d84f-98ed-472a-acb7-08dd8c4b98d8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 03:10:47.4031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7XMjl2KNevFqdATDAXUokp+td8RsI2IvvJcJm+xbZPOY9kbaD87BiBlL+3Qq/8J4AFZ2mGu0JtdKjrgoRQmYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF777B3455C
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6ea1680d0ac0e45157a819c41b46565f4616186
commit: a00dce05ba31fbea58ca64158e0601cdc99d8929 dt-bindings: crypto: ti,omap-sham: Convert to dtschema
date:   1 year, 1 month ago
:::::: branch date: 25 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250501/202505011344.6XVlNviI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011344.6XVlNviI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505011344.6XVlNviI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-cm-t54.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']
--
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-igep0050.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']
--
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']
--
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,omap4-iommu']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4d000000/emif@0: failed to match any schema with compatible: ['ti,emif-4d5']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: emif@0 (ti,emif-4d5): '#phy-cells' is a dependency of 'phy-type'
   	from schema $id: http://devicetree.org/schemas/phy/phy-provider.yaml#
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4b501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@4b701000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,omap5430-bandgap']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0: failed to match any schema with compatible: ['ti,omap5-dss']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@1000/dispc@0: failed to match any schema with compatible: ['ti,omap5-dispc']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@2000/encoder@0: failed to match any schema with compatible: ['ti,omap5-rfbi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@4000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@9000/encoder@0: failed to match any schema with compatible: ['ti,omap5-dsi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/target-module@58000000/dss@0/target-module@40000/encoder@0: failed to match any schema with compatible: ['ti,omap5-hdmi']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v2']
   arch/arm/boot/dts/ti/omap/omap5-uevm.dtb: /ocp/regulator-abb-mm: failed to match any schema with compatible: ['ti,abb-v2']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

