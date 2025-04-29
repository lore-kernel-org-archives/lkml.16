Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC001D619E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891109; cv=fail; b=l3Rpnt4hYQ383f5NYaNSBjigvVO5KDosGw6XOGAyhAdJ71AVa+ctZjtZF8xO3nIXjFwWRSXrkTy56QBx+Sxdz1fpZt9HxMWu2aBBrLxwcpcmikImTYV1VNTpdDOx4Zyy15j8mJ7DmoKVBM/B9fg7afqIa17c26AJ7GS0CJYqp3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891109; c=relaxed/simple;
	bh=/ROXgfG6tQSpl74dj9lj/0Xl3vYJX78IRS6choG9VR0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XbY2DR5HyVGsSd1XBHvCdpD69988YpyfFFspE4lorZOSfbmhmHRGHtazwQ3iaj1zrAzdXPZZxnh/ONAsgnr5HrDxi5FzLqKaTk5plmSDrL1U75aOgUBhYu26ayeABu2HGUcekwJCcvXeuQQ465St+84fFPM454Fvh6glG5Qm4fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAAKSXC7; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAAKSXC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745891108; x=1777427108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ROXgfG6tQSpl74dj9lj/0Xl3vYJX78IRS6choG9VR0=;
  b=IAAKSXC70VXn4O15lCo0LW5Z5rP3NX+zK9RV6ZfHe036GTS+1DQRBlk1
   a6t3muXCDI9BE9EJJlSHFGRWd4sFYZ9WI2EfSMQ2I1TVLV7J3pndunfkx
   /b4iGgo58j3IGjYzr3kQrht81HAeYMfbFBWBR5bBf5TdwV6f1+5k/vVDp
   eGKYQfh1VjBDZLvxevI2rY/5atzqhXOCK059f/IVsFLk3cS5hXwnWIr68
   Xy6vlvMUebAbT7OBQKm43PVE39dc0C2bZ+N17xyICCYL3m1pfZj6n6cZI
   QJlxi2h2eYh5JIM+tkw+QsVf3kitTs7BZAKFPdz35DTM9lUV57S6HdYhG
   g==;
X-CSE-ConnectionGUID: O558lryGRW+3IFooKpaiAQ==
X-CSE-MsgGUID: OWvp+ztqS5uOtLDkDqhRqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47592294"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="47592294"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:45:07 -0700
X-CSE-ConnectionGUID: OVWkxsE4S8uTA+v1XDPDnw==
X-CSE-MsgGUID: XO+fv2PyT5Kj7dbnLyZhuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="134001719"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:45:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 18:45:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 18:45:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 18:45:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4ph6gITs3wkj5T5S8A3G1MxLR92rnDkqCRoD6jRHRtaAdVt1w8I782H0tgykaf+S02NBHyb3MhpBvH8pDMtLyJQbc/vBDyI3sz+s4vAXwHPMSZxkAX0E9/SuLJh2fV92vQlExLPMmrnzwDSiUlbSUsWOC/sp6sDDm4I4y9b0fcLJlPzUQ+uM0BtmvtNjCJha6/7DSBeP+QaQf5wA+ZWlDHvltPUL1WFce0NZnTqIw5LLY5h5ExWXrGnrQn5wJJ20WcQ+go/OHL/0L+ENSyPHH8tf6nA/PoJJ1pdt0wK4dxSdL0NacrsenuV/oTnNhGyDLXDpZEfmH7yINcHa+Rr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oKmw/r56IPngy7oBlLDRVjUt61vFVCBnYbsdC/w3Rk=;
 b=J+KuDu89OdK5yToMNsoT/QwZgAr5+S1pcFqWLFAc9Xq+J9/UAF+JnwbUDvNFtIsrBFRtp/KONSlFePs1LO3gESigfsTUM8NJaB2jfpvDLZXSzLcIudW8oXlmqG3LZPjV/KDT2D5ra6pm+/zz0psJOHKPbYsE91+GrEk0tSwIbvql4Lkchh4V4PICTT+Zl6aOG/CDGow3RC33jamu305hEbWjfT1QCR8n37to1aMkehvJrcgZC2+SxVm88Lur/x3nRMzrF5FW1hswzEeUWuS7wU2+AA/WZGp6XotCjRQhFC0iNm8CYvcFjmERtnS9XSsUBA5Q1Q2BB0kZZ6fPkinTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 01:45:01 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 01:45:01 +0000
Date: Tue, 29 Apr 2025 09:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Chen-Yu
 Tsai" <wens@csie.org>
Subject: arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb:
 i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match
 '^i2c(@.+|-[a-z0-9]+)?$'
Message-ID: <aBAvFnO5QkL7Xdsm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7e2a2d-92d3-4bf3-773f-08dd86bf7480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9/p7O4nQAqAq0GqJjXphwHfpT4+3ITQJLXzUC92/MjJ2IIVGT7P+paRSJFgZ?=
 =?us-ascii?Q?5gPnpfwfTD8Va1+cJiSvwRWY97WAX9ubYPfGOBEaTivnMingz8YZzkiIGNx0?=
 =?us-ascii?Q?7fjXqdtz/dBBBAz/4QjZkeZ1VXdhMnRqalU9TkWpQcZBSP98sFVt1kEJX/4M?=
 =?us-ascii?Q?o1YIL508h42pIE2QOlAMi26ZKshxgrB6oaLxKoutXCFqh3H70NiVPkVJRMAp?=
 =?us-ascii?Q?nKbgQgR8HfKA1zUMc9Qk2uF0/obRx+yyI1nyToO8hV7r6YTo0bOH0jOgoQQA?=
 =?us-ascii?Q?fkZnB6ecq7RrTOGszkajVL79vC+XZgtdRJ8Ll/vMBDlV+hq5uNBsIVRxxMpc?=
 =?us-ascii?Q?EPAr4ehEvPfNgyOE4v6U8vEgrPdWtBs11cPlXpFd17e0G+zcSeiNCOuUbuXO?=
 =?us-ascii?Q?7MmlO070YZ1xzZTH2+xA+f1o0C2uu86pPsbWXZn4qYV1+ToJY0HjNb+wokFY?=
 =?us-ascii?Q?ZsnzvQubMrvKiqUQXvrVoTTod+Xr7KUPv4hBIYCUXQVh3vb6vOcH9zzRE0Uf?=
 =?us-ascii?Q?CwcggDvPDt96K5yhPgTEKJsUgETEmwCdNNeKcSU1oVrvwgjkuS9YCWH/QGro?=
 =?us-ascii?Q?mviEBlFCQJKDGaFqDE6fr3OySZaobIQ7uJpsCXCRBMjMarbm1KW0t50SB8FS?=
 =?us-ascii?Q?02pwIpDABT4DTSZyQybT1PYQRsr9/EcqbhfaB46hYJgR5tmFEGlM6IyibFTb?=
 =?us-ascii?Q?mJ2nHdJmqoXngNjC+YSjMLljUHDYe2qPbvazfCLKg/+mjOpA5eybbtrwpG45?=
 =?us-ascii?Q?UZ8z4jttlQctNJ0YsBUwLxFo2paiP61K2v6Atvm2vW20U6O0ffVlViMsUq2+?=
 =?us-ascii?Q?wGqOVQ6p//ptUkznHAhKQIN4vue37ier0Vgenaz9RNU90YOcU6T3iFZaxK4R?=
 =?us-ascii?Q?g81ItdQNDTPhSmDhHxJyTZA1YMcluJ4DK/KvKA9qHJkmYrxWs9DL+gIb3oP0?=
 =?us-ascii?Q?pLAtOZ9JUrXGO3nuTIDmds0ivx7nuszzgAxMC9LwSLriD6znwJEWWR9c2lZu?=
 =?us-ascii?Q?vaYhH0PqZaVNPFEVKiHxW4g06X+rIWvxGOfVrppwYGEDIQjUk8AxwiUNOHpZ?=
 =?us-ascii?Q?dMV+F/yGNcGYe6b9XXl+jeZ8lXjQad+pnzJPZ3NbPsqOnJYxHl27NMDRY5CX?=
 =?us-ascii?Q?2iuSws5865ngWAocgaJ/qrtC49UNk2vNSy6sQxbR39iziBgzUM/4jTamvikx?=
 =?us-ascii?Q?xRnyf1Nm5SNJjRw/4hX+dcRfQ3rTGddTCVyZZTGax+5Qd9p72wcsLnzJk1ij?=
 =?us-ascii?Q?m1sHzwA7Fv+zO2ZNGXgiNkL1wqF3Rd6vQvMGRKE6jZ9v92e1qaq9vZDrlC2l?=
 =?us-ascii?Q?H8hjuT1t8DrNCBKji2TCJNJRIomqaeIennNYPJDDEZpqcswfyx8RII1/LViH?=
 =?us-ascii?Q?NkATypVx5SPuDRPkPBbrTMiGpdM1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5/dDY2fZfGJjN6CFLj2U4ip2qSR/rU8jBbfSEmKlMUbwoYyGl5z6l8NvhO5o?=
 =?us-ascii?Q?a8J0nTW73l2SmfGlaDIIZTyTM2ruXIAocSHB4yO9NrHu1r4ECdZMUO7j1MgH?=
 =?us-ascii?Q?R8q2PUcsuZydyP7VW8jNiAzNljOmWaPE8OiO+IpV9cuuuDZUV0Dup9vexelD?=
 =?us-ascii?Q?uCzcgeW+qRdC9pLGUnLJZydzIKjIvvuM4V+IY+zHTJ22HcHKXo/b55I0jTvy?=
 =?us-ascii?Q?zPb0SqIDp8dF6XZLyHULTrN2q3F9piGS7m0HIjk0R/tXRXpdPfPCbA139+lF?=
 =?us-ascii?Q?RKDqPUD6VkafLAiUaz74mk5wMDwHxEWu4m2r8/ZHHPtqt0UVmM1Et5llzSSn?=
 =?us-ascii?Q?ALzMMP93fq1ryZjh34SIcQgKUKzB4+TtWdcvyFN507Tf7EMrkDyPknUh48kK?=
 =?us-ascii?Q?67fkBtHY3Bc46ek+ngfI9VH9StGH7/cRhJrVBpkvW3D4R6YeM/tLdjxKwAY5?=
 =?us-ascii?Q?xa1R2Nr86bEuI2nfPzvMcz4IDVmF7waGB2iLzgjALPd6d2vxvvIaR3gffnuc?=
 =?us-ascii?Q?6zwwD+WkajNS8bcWfkNUixYP69vruRhzJ4rA6caklgr8nzxLbF7exH5yx6sY?=
 =?us-ascii?Q?99fBCQDscm2vMpf92wTHE5Er1EtDK4mW5Zj4LGYOi/CR/k5YmnlYwwUqi4Am?=
 =?us-ascii?Q?ZfRYjRkmBuNZ7HHhl/sSNZ1uXnFYWUDJOamFhpmml4BFaMJB1OXi2HUkPdjh?=
 =?us-ascii?Q?M2lVTF6VZdSQSXtnUnFN+b+spN/FVMceHa0NYPyfnsYUu952csb3AbfjVLs0?=
 =?us-ascii?Q?3OPeHoYaWD03E0T2vEGgP9RjzlhceWROVsW8Dw19GjtdzB9e5fSlrD7Q+mk9?=
 =?us-ascii?Q?ylmMwe8xAd6rzrVrtgTI5ALmajYMP9HiGfEosywfY/IhRQ7p6sgxL1zWYcEM?=
 =?us-ascii?Q?K7fqaAy0vbKXJrkvUT6UJ6scMPCax5Vqe6wgbvu2Br540cEBILqOy3M5WsTG?=
 =?us-ascii?Q?0W4ygDTTJWXuVOc6uucXA+zIbFNGddMDEntDlZPOPAuqcThfx+o9shOKkNWc?=
 =?us-ascii?Q?e6SREUD389ifcBFhSrWIKsLPu7Qy1xE4uBh3y9Gg0QrWTFTwQ9g5kdqU1ynP?=
 =?us-ascii?Q?xWSgyA2CcHDHDtwaj8poY1Y2fGd2h0QUAiO8/7nebE25TEbdZu8iregm14hW?=
 =?us-ascii?Q?S9GhWRd5FPmXqf1bfsGu/QzW9BZnWZ0AnvzgykEQiCOZl75S9mtc8ScyoZLV?=
 =?us-ascii?Q?6M0NeX2+n6oR4XiDr1QxrS+yrRfkxdF3P+Tb0S+2Hs0vMHM3fnPF5qvty4ra?=
 =?us-ascii?Q?fy3yXO8b9bIUnPN+6OMu3yr3Rc7Z/HoHQdzCp3uO1ZNVkKftCosxtJTs5p+9?=
 =?us-ascii?Q?6uMAG2e/8uVT3siiXSOPzsLDV6Yz3KKIsbqMxLD/azne9ftRnHwG+4weQeEr?=
 =?us-ascii?Q?/U5oqUcDybcRXzVkHT5dE9doJySZ7Av32Jtasw/hxFHWiWwo7D3gzNEhFwav?=
 =?us-ascii?Q?+IJcAWpLFtCr1+CPY2q1igcSUP+faUaTjD2RBdg8v8iaZFpz4mKs/5wWFNpp?=
 =?us-ascii?Q?QoYK1CW++dF/TTRHKXDX/lEmQrYUG4JvK38f2cUvKsTWjoCQf3f5QD/1UDVC?=
 =?us-ascii?Q?FqY+RrTtTHhS4egpayXsM8Tgx5+Z0Q3Dp9uPhagkre7/+5bEI8tIfuLQxFtL?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7e2a2d-92d3-4bf3-773f-08dd86bf7480
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 01:45:01.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0wSnwwM/yY9KApA8UVTScuTDS4R7v+6k//dB4Tyocj9X4D+O0qs+hx9iIpYFeISum0VdPNrkCLAMXD50VfkwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 0ce1d34678e5d214746ee4887f9f7714c39e331f riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290246.GOpYV0HH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290246.GOpYV0HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290246.GOpYV0HH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: syscon@3000000 (allwinner,sun20i-d1-system-control): 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@54' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

