Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B720C003
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891875; cv=fail; b=dD6NLva6jNKVdQTASYSdKR/2leVVRwwoJKJkJR6hqLy7kc3FFu8hKcI9WL8L0LA2kS8g4zySajQN6ghA7MD8LBp65BNqsk0BR3lR3mVWfvR6r94VGUhicq296vd2DOnRgeFiSjpMSZZ+9Z/6eh3fVhpthirBfJ8wRdEg4z/Fr8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891875; c=relaxed/simple;
	bh=6C+csWvidEBoViYJyBl2pzA+YeVGJAkPP22NxQkaKYA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IMrJ3/exVGcFnSMYk709ExrVoihPIQXTdGs38pSQxcztfR1CwLUF5LfHUUGO5oSCWuAc7VX//LzFBKPbDva+vKsfUBzERry62lV9YMjAI3Km+zmHeQJ9dTB2padoeB8WQT1XzYgDqqiuVZCXbBUG+infF8PMGiR+eAKxBGmetEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhlfZj1c; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhlfZj1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745891874; x=1777427874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6C+csWvidEBoViYJyBl2pzA+YeVGJAkPP22NxQkaKYA=;
  b=MhlfZj1c3jagBY/SBzx9GsYD5NCzarkJ+WE00C9t2XfHdQkyg3kAxMpe
   zsWhZnUBAGvgetzYTChtg+TCZkvo6PBpDO4b1ZE4tq9310TQpDJjh/TqV
   S+xhYdG/fcKdG4/IXUQQEVSvQdNqc/TjtuSkC74ESKMmSmI9oAbE5L7R+
   COcXWnPmBfJzONBVKvuopMFcSfIZ9/np5yBwjUnfaPO/uYP/g91AEyo7e
   oX5LsnHnCNEmII+gTdz3Vl0MnbUEOUdytUxeRIA181jCfOeyOGElO/AXM
   eC4ZRafsV0zXfYHtaVTvVGt8s3cLRQk15psy3b2R9lkGbS3BclmclYYb3
   w==;
X-CSE-ConnectionGUID: 7L7aZ6HiSoaaCd7bbwd3ig==
X-CSE-MsgGUID: UmO064noSSChaCRwu/e43Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58152547"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="58152547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:57:53 -0700
X-CSE-ConnectionGUID: NnQlAIdNQMOpS32B8/gKMw==
X-CSE-MsgGUID: U1IrqYYnQ1yjzbUdT0oLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="134641939"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:45:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 18:45:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 18:45:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 18:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRPwEKGl3iiNXyKg2n3pizkSRMo3q0as0K6zhOfQl36W62CF2QIamxWPLZ+T3gBFLJ9pGiyOUokYOuthPjB5wXw4nG9oq1UaouWI3zLd5WLckzav/7vi6+ZvWR3X4bFHOSZ48cSsRijch6Su3U9fsDLxGenzktCuA2VbDOlaf4wnu2f9Vz0uRFDL4/RvaCzNv4kP6Br4MPi7nB6lI2bM71MVXwhrIuiQ4ASKVCSdGrQgpjy0Oq23swh5dD9NsixSPwEK++fOtQyiGqXxGHDVkKhwlhhyKdLJYIux9jDz5G8eYHfZPq9Q7ppek4yAI/vmHv6DEnH8jCILt3Sm1Oiniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SA/T6bLCNWLjlW7xlQCTAiBsK4FHo367Kq8RJRHN4A=;
 b=QIH9aBtdDDdsGLodR6Gh27ZBL0EEoIlLR8PF0+uWKq07AKg2j0HExgPhIeD0xk8SBLHa3OufVicd5xGcWtOJYdnMiAfVtYc/B4JpN26YUHbk5b14+CsZJgzWqAA2U8mvg6sH8lXBvbCdBpJp/unLlWcrag+aOgPFU+wjbHiNmxteZR4CYIqPQjQtOm73ytrC8q00nUPWz37cadMqIpo2iU3qlO2Wbwua7rN9bfGK8mnjZCg4omHaf/bjBIp79glX3vLe/nt4RusMXvgKyRn97sHRgGxagyr7HrHgRDm440c05ipeloT9ZUE7NfD7u2sTQHlnKaEYguycbEMm+YBlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 01:44:40 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 01:44:40 +0000
Date: Tue, 29 Apr 2025 09:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Huacai
 Chen" <chenhuacai@kernel.org>
Subject: arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000
 (loongson,ls2k-pci): i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
Message-ID: <aBAvAEeYFFH82HuT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
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
X-MS-Office365-Filtering-Correlation-Id: 1df87d4b-94ad-46a4-da75-08dd86bf681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ydBXX8NQigRcQ7KyW0Dl7aPf/Vz2ZD2Tec5RPRFarlOQgRcZbYPSTZXYwigS?=
 =?us-ascii?Q?xxW9ayyGJGfNYdfN+EKH/bm7Qg8bhi2QF1lGN4TqqzVgK23c1bFuyEsEz8YA?=
 =?us-ascii?Q?O41XHQv3yzRvBFqJFXNUOsGkZzm41rqrQ8ESkTkw1FVKIGeeqEXmLsGUMcD+?=
 =?us-ascii?Q?m/HdLLlBQ0m9/6n+nkGE+6Ibq+naayDbLJBOm+8mbXn55LQC3rLWjombYxGH?=
 =?us-ascii?Q?Jk5c8e1z+wyqr8k9ELf0OXYJLl3d1WN8GVtBh1CQtyjbKMI1m5lzv1BYgW5H?=
 =?us-ascii?Q?2PyRV6wap4WiwXCPMKGpZxkbRhAStBinp1vqDF6ugFuVzE713pdUMFA2PUXs?=
 =?us-ascii?Q?vIREqR6L7V9EZCMFYP6Gyr/7OfvGWO1IiSIe7kLHQlcAFJ0xFeXiZgBIgGNr?=
 =?us-ascii?Q?iSNISED7oUodcQa+U9g2cyw7aTYbbGRsCvKezjnk8yfc3+TjWlKMl0SFeQNP?=
 =?us-ascii?Q?lsjIeOTBswOVYydue9PHmPBC/njEFd45gU4JTkcNFcXj64VvErZ+9TZsavX8?=
 =?us-ascii?Q?zu12jzUPCzYR0gpSjHWKSZc2lobbUFVpmORBlAOfhN+Ma5zgrQJm69RlhbJE?=
 =?us-ascii?Q?F3Re6+XyYg8uKXATLhV78XyCLPGjXvPj7sCA73CAyziaceV6txD5dtLSa5Ce?=
 =?us-ascii?Q?GNFLinB+SwP+lNjcIir8Pi5FkhEXASqakdVDoPsI3AOFc88EJhmVHEHCkzNO?=
 =?us-ascii?Q?tydsPLFi8+PZPjzyJO34ODziO34eu/nWOtC5CdlKeMbHNjPH7DMQslvvuIUf?=
 =?us-ascii?Q?xYuLhCyXsi25pvkKoytp93iTbabz6NGi6mAChNW+m9oPCUsBYPF/soSIWlhi?=
 =?us-ascii?Q?nsJUKXrWEdgdYN6LbI+lHe1ykEUr0xbI5fGfquvkzafmGiXH5xlbPqLyrI/j?=
 =?us-ascii?Q?ifeMdKfz/hhZ5q0kgAYhdavIhTYBQM25Ei5bdhU6BEtJ2/3RjqffSkMd2A15?=
 =?us-ascii?Q?h2pN1F8m2ObVzZwDeEwAEeGZ+sTgEHOXUwRbVqPLmDchfInRor5xR+zWwj/c?=
 =?us-ascii?Q?uD2H0BKIfSpdDGR+O/XKFT213WUYQ4vNgFurnOFTSFIdk16MV+pQacuf7xvo?=
 =?us-ascii?Q?XmwQ89B+U2O0zZJrDQj+mu1e8kT+Ai5vIdmkoLegfz4/J6XlFGeJym+oTnrL?=
 =?us-ascii?Q?CEYzvdVsnMoQjVqHvxcuCgQjTC53BPIZyVDL+f//6NlDsK8+Vpy5FgQgRNZz?=
 =?us-ascii?Q?e1O9mv4Su6/s1ld7pLrX8XKklh7kMC7rn/RGQX5HGgsNyseHrySS/Tk9N5lj?=
 =?us-ascii?Q?4u/6xI/MuoZMR/A/8YgBT+AuSvsAjRDMhIEDf3ysHWFwFG86YW2NrbKjq69K?=
 =?us-ascii?Q?l8ZHbOL8nxo5kE0ZZ9H2xB0mjnkLSZY6vpvE19PtwqHAbzZgf09MRJ2iG/Le?=
 =?us-ascii?Q?jtn2LhS4KS0Js0GwgqiXLIhInf1X2aFUn5JpPa/NY1eUkRO8ccEUf6y/8Pwh?=
 =?us-ascii?Q?+E4ny9cXZMU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8W16/O9UV8JGN+Vl8ps2vb9DnMWxBFNmEtMMoUYdp5G2GDIFYvZvdfWsx8+?=
 =?us-ascii?Q?6NtR2P/xUzv83/u7sn5WXbgcfwPGVtJnV0oUR76UrKJAQ7p+2JHGnTvWtsLf?=
 =?us-ascii?Q?yqxKrTeAneMyffDp5c0121AOy59dwOlSWAOig3L7hEY4IhRVlIztSvUzskJ+?=
 =?us-ascii?Q?Dajpc8LR5ctCRdbqxQZIUFLwkZgqmeuxNXJ+nyDeQaR0N9q26ckucjyTup1g?=
 =?us-ascii?Q?59niU9mZsYm4DSU5Sk8N3nZkvR8pHi2HoNsERFcQ3DKzl2T8Rj+F2AdDKnZH?=
 =?us-ascii?Q?7vaV5M7cT57d86WMhv/ZYrgPcgTvD0a4j0ohORt41PXJ7lvGgFQ4Ctb12twH?=
 =?us-ascii?Q?DZqGughZJt02/eLMT3XJcLMBuRyc1ND5IZSvrhiKQQhkJk8YjBHgH9tuBeJs?=
 =?us-ascii?Q?g3/pyOMjFLIgPrqZOgi25D5B4/qBohDOphwX7WKP0+0g3wFUt/u2aRtvi/2O?=
 =?us-ascii?Q?MYysQzQCvV9a5lG+uKq0JktfDq3tjwpEV2FVGv5uACjVa1dMMkb+NgdthQ2o?=
 =?us-ascii?Q?RFRyqbiaOGb3deM6cUnGW7MUOBP2iDU0O8TWjw+WHeDG2NFC+pltFcKj2YHf?=
 =?us-ascii?Q?HY94ZUBggb4BSjpvXlqWZTLRK7vjMLafj0BT30GvLHsqIPRqlWM/OsZqVNil?=
 =?us-ascii?Q?7YGclaTVrM7X/Or6qh5Xp996oOTVsS8VtAz37aPhRtPPkrUIX4TwBRgTUUxJ?=
 =?us-ascii?Q?PWJEU3jhmgbAODml82GizycsWoahJkpiqA5LYisEWMg5nUsB20WnoiQBs6v5?=
 =?us-ascii?Q?Cci/SZAKnbrBCRbO1GLPPxVMQDnq9gjvM3EP9xWGu3E0nkNRNjBmYhKK3k7U?=
 =?us-ascii?Q?tMv3TYxia3ndixr+MoOIasbYdarqPiFL35XPgrke7OmJ4T4dJI6e2JfM3TQ3?=
 =?us-ascii?Q?vBoGBGsZYuSwIFvb5qYH3QvspOBs/ALU+ldVPFI1dB4suna8RvrZybZ32nHY?=
 =?us-ascii?Q?apvqhIhBcU4tsxZvogHVheiiUz29Jp16XUL+dI9vJh1dmnDqUlbZxPg9oLya?=
 =?us-ascii?Q?SeNpeMVGtV+1Uek/DkCO+DiMaidIYH08irOvVE/0Z8MkZxqqqmTUhk3Kkkus?=
 =?us-ascii?Q?EMdFJZdORZr56pu3FAZFoAJiwa5rBi6nWBPPReXx5OXEkF1yfOY+oJyt9UJu?=
 =?us-ascii?Q?W3KTLv1lX2/AqJLblWJbYiX/4h52X73DnDWxbMdN3/6WgR8tWgonM7JAoLqr?=
 =?us-ascii?Q?WNYvjClluF/HfFq6nxoa5bdjTfR9+XsqrFGD8z2RbPVhNKBrW5WuAT9/FgAa?=
 =?us-ascii?Q?z+/qmVwbBPkxTMQgO8xCXAu43TlyOtQlr8fsoNr/BRGpatutB0Tx64MLsglJ?=
 =?us-ascii?Q?lt0PhzdSLvRVJnwEW3gqx9A1WFLh8iR/Cz3ozWCeKaGeLvmxmv/QcJW8Q+AR?=
 =?us-ascii?Q?oFMeYmYdJltFkl8/HYnEaiYVtmuX7XKA/R3YiclTJ0ImvY5ErseFQACJ8qO6?=
 =?us-ascii?Q?yC57aZ/dyGoN2Do0bBhCY3anKzhZ5unf8wA4vTVEWPyMBjX1+xmH673Behzs?=
 =?us-ascii?Q?4Vku6zODtJ3RiOrGdSDA8v16iOI1rSCeADSKpr+QkLqKPOwM0Ry17QKJ48XZ?=
 =?us-ascii?Q?00qFlROHEe/2d9cCFenO5KnOhtuBa0IXXlZMlWxwGb1I7T/60AswAEGb8X3Q?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df87d4b-94ad-46a4-da75-08dd86bf681e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 01:44:40.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxN9jo7/2niTL0netVgCR6YNRrRPI6WXY+O+rdgJRVrnFNIfHYVVxUItwsudcIGTrW6Oekph4tEOOg4BKLTXJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 900f6267e9e39f9f601f5eaf0ea32d620b9130d2 LoongArch: dts: Add I2S support to Loongson-2K2000
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290259.1kSRQIjn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290259.1kSRQIjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290259.1kSRQIjn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0: [78, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts: [[78, 4], [79, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'display@6,1', 'ethernet@3,0', 'ethernet@3,1', 'ethernet@3,2', 'i2s@7,0', 'msi-parent', 'pcie@10,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'usb@19,0', 'usb@4,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
--
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@4,0:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): usb@19,0:interrupts:0: [22, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): display@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0:0: 78 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts:0: [78, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): i2s@7,0:interrupts: [[78, 4], [79, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

