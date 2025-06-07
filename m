Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E98D2FF
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749257266; cv=fail; b=TZkDDmFyFbNLmb6SbVgWd5B6V8nXnOjtq0gtshPinmqRd0CAx850N0XKDegJQcjLG+xJuW6cVEkuipp8C85HhLPnlbMWWcZ3A+4i1Z6ddGOAEXjfF3XuiwYXVC7b2+UscB2+oLwoyYotclYkOiy1YTBnSVqRKvbJ8mRr7lT64bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749257266; c=relaxed/simple;
	bh=2va6wLJ8Y+EiOi/kbzBfJzrAD5FD6snlIpF4efYUpLE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eFjnH/ckRaB4lr/YjvzTkIBGwEFQQIrV8fFIrYx+FLmq+W9MhEjR/4jpcbxTo2sGKvuJvUmMaPynBAdSB/GTxu5sZZoggRuPkzX3TRoDMY46V9GNHR2+P+CIlyA8mjqlxKYpgh3VwvEDfw/KJWQW2LF5DwjbMOkShP2sTTTTdnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqqlxsc3; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqqlxsc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749257264; x=1780793264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2va6wLJ8Y+EiOi/kbzBfJzrAD5FD6snlIpF4efYUpLE=;
  b=dqqlxsc32YHsjUjReEdj4b9AyftR5s6n7idIGap/h5UySI8JPlzqxvGl
   l4hHD8Ah4gyxpzJHoC5giOqfh4OEPiBEwBXCtukENl28hR5bKW1uqkGGg
   3Be2OCgfxmY0QGmsaSyJl0rG6tCv+mLM6YERuqBK17pYwJIxzSvbjL1zy
   ANw3xIipVViTjQv4Wv6cIdMNR0AvQdGcb9DAGwZabRFHrX4dw81f+9l1+
   fKtbalYIoSaPQdgy3vFwzOvN3UYxbeJQwO6TviLRw85ZfWJaxKVNG0XR3
   YKwMYQ3XW3cAL4nJeHDpsT/JfAWtd/BraGzA+q8DfrIA9BCWppKbNHphq
   w==;
X-CSE-ConnectionGUID: QrT2ptirRcm2VjXOoqKHkg==
X-CSE-MsgGUID: HAH74+0PTY+pVXqiL8cqeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54044363"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="54044363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:47:43 -0700
X-CSE-ConnectionGUID: zCy/WvJoRZinbT3TaosUEg==
X-CSE-MsgGUID: Nj/fHiplRFGbAvnEq3FccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="146911678"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:47:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:47:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:47:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/hNbkeqo5d3rDhGtC3NBCUbhc75p0OurJY7b1vsccW/y9Aq0wPjs9+x1bdMXXjyx10VhxGOLvFLUPJDe6SrP1az9HIZjHybWVJNg2cnYvXZ+HOz2eScSbW6cATrSgb9fgt56wMCDOLHwh6IYrAC4CUl5KdorM7/1H6mctOtS5GTlHYOaJPMCzN9hNEH/ZyKZtUZ+ZTb0gQMMljSb3AwHWptKOISw01jtuELcb6NvfHo1trONwYVoeYIybTwW6KyJEamb6fqACacUjoUEjHkhA8Mpi/1CFaoSE0RDJM1jvN9m4/vh7d9vE8zOwxytuQ2U+5gpY/u1Mc4/yiAOsHC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlgGA3N6PCyuprIlyboELsvuUAYzHOJKTtwVfkhwb3o=;
 b=d4AJt808tDJogWzpeqfJE8+6mTh+Bcs9M8HogDzGhNWkzCTFkQgs1R3eoZbtEK2flVR80oyvXflv/Aoo8lOQ9lqU1jQ9L5Q1YW3YFog4wKor3dT0qQuvlnEWg8P4RKWHNUT3ykJj/TWGnA1QNpOmbwf6haqIrvRdeXs3/wvYS9020M7P9rKxS4qDBHPmIp15d0LtSv6I6yxYhYchBoYOmvCm6zQxJNu7mO5P4u5Ddd6DVRLlKkvMTdxz/IMPhwgM/ok221aqrKAPy1vy7AE4Rm5E1anCbzOf80XX8rZec5sMrUL/0aw1TsCG1UZ0eZbOuFGLsioHnEg80KjVlMT6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sat, 7 Jun
 2025 00:47:32 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8813.021; Sat, 7 Jun 2025
 00:47:32 +0000
Date: Sat, 7 Jun 2025 08:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 870780), and 'i32 1' from vmlinux.a(mballoc.o at 901800)
Message-ID: <aEOMHCHD62EaNZb5@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb2dc9a-88fa-4acc-8620-08dda55ce320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oFtW26fk8tvVElm4eCkHBZXL+3u+qi0Aj3NAkv8PChahecKn3+3gn0G0Jrd8?=
 =?us-ascii?Q?Hmt87zv3EQAGb6wFN94vDQuvB4+iGdSRwHAr2mCKlWwY0FB8g442NWG46Di1?=
 =?us-ascii?Q?RNeO5Aqag/KWFNgtNCND7rcejI4CkACR+Ov7OdjOlsVhDgfnHXbwwreLpleP?=
 =?us-ascii?Q?tXOy6eMKpLj7TrorloWui8kSdyh4dGtTy+mUtIkaEJs1zlSxHyXKDM9vH1vh?=
 =?us-ascii?Q?nOV7tSL3iPrAf6JVnLb5dZjjGmqeu04SVx4kfl/XhrTkifQ8kU/D/8ek1AAS?=
 =?us-ascii?Q?ZBVAGGfeKba5+QSI8ppvU3OzQPm3xPEQPHLa8L8zd6jhJHTmlFnMgD7yUDof?=
 =?us-ascii?Q?7/TtSW3eViIs+e4UgOuJ0DYGeNPLRxiKalFOxJjjeWEnnz0houMtyRwrQc2s?=
 =?us-ascii?Q?LRUMgbZw24AOr99pDwQX5SgMQNc8gpToQP0959LnhUi67I3AUiqkwkrvSfp6?=
 =?us-ascii?Q?HnSgw6spsVZjaGZF7fOdej2DD4MA7LPVksvYdy9y7eAvlAODkTSEC1Et5sTW?=
 =?us-ascii?Q?9yp5AYkfz3wf5ELD2U/ekWRA7UXdyGXNL8SpnHyGzLVds6QJZ2u/5sNTOtSg?=
 =?us-ascii?Q?LgUtXju1vjPFygl4prt9GtI8SJpnlR0TpgJoo/WMPEMZ39iYMRJYZGaKGkwB?=
 =?us-ascii?Q?iTifFQC/uf67m1W+OD6laEf+utNYY1Cibpz9jV8WJLiEW4NpKidewtt0bIdc?=
 =?us-ascii?Q?QKkmTMOQbaoz3bWACZ0Vp7hB/9pQyLAe75rKacwFySYLtB/vO/Yn2SZhNLW3?=
 =?us-ascii?Q?evTu0LY2ex6uiAFs3iPgJRqhlj0y9QvaqATkGwHvdBbKXL6NKWzdDKWbc/D9?=
 =?us-ascii?Q?xB+Ivamj6tr2sml/VW3J6eOMXoXEiPWDhtYz8h4BbpH/wao1GPkLaDUJM1f2?=
 =?us-ascii?Q?9kJz9Wx465CWxZZ9h2BN/SOWdMBayn+k4jbd+SAmXChKFV8r4zEs8v+qWS+D?=
 =?us-ascii?Q?8btAW/WPY6/BNmZ2fKW8cuT0y1nYnU+zHPthOKcyo/lIwFI6g7sl8O+dIcJ4?=
 =?us-ascii?Q?kM6ak9y4dGHjm/b5SmDkLb8VF/kkXDE6nVbw7tc6zrwpmnL/L1lrl3bln0dv?=
 =?us-ascii?Q?HeCIWAdAYNE9PdAAF5DiHq1UFQY6rmcYDer821jkPXWtbSjG+KLhUqqbnoRv?=
 =?us-ascii?Q?aRG61We/HPPB5KBpNPfuP4XwxSDo15ST52Pm3q7gwbZ/MbWKscxnXwJ9pXnY?=
 =?us-ascii?Q?+rEGL3ZvM9Jgf1e+qPHKN6z3eMb4D7oUMVNxuxzbNdMDhE8DYt1MH3/byJ2x?=
 =?us-ascii?Q?wMCCEf4jHRJv04vsQ8Zyu/ooVYwf/PoCuqzDmljLIzCEcb/8QPiO+RwMgVdJ?=
 =?us-ascii?Q?BXkB8VXpgHOhXdPZZiYHsR0Y4jpTUcVaR5iNZuUZPQ+mrVm1R7OGzxpG9Bt8?=
 =?us-ascii?Q?k2us7FxPEH2Jd+X+3vzjULI4+6hE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BF/FZOotXUpP2xqoTU2KZXCmVKPOWF1bSFQuVCz0vGUxQWEYFhtjgpVwUMBq?=
 =?us-ascii?Q?hC+jXmtcTp/Wgn4TX36/rQj94XdrlQHlPeCg0n3GM+banPoowy+A2xJsELsr?=
 =?us-ascii?Q?SfIEbRSqknmflhwmi5b4AMkfcDanCtVuyAp85p0FUIOiQIu+aDu+bIV9Px4H?=
 =?us-ascii?Q?jGAlHP568m4C53jlmxoqufEnuENpiSaZbZCd0rbLoUrFhDQwP69kl+6Ao/YY?=
 =?us-ascii?Q?L4UyBCCz47xNoIAPgW579L3BqeNbM+PgHsNcoigNZEpgS0zukgWZZ28y2fGn?=
 =?us-ascii?Q?o+W1nPIZRd6D3JnQ9UrOYL7vR6hdcTjMSrEkSB4quHG03UsAkpf5aswAB6WQ?=
 =?us-ascii?Q?GluykrgfIeS8j/jcm5dnkKhb/2EnbqufUbKCtNvrj1IS/G4Gru49ahWM7Zvk?=
 =?us-ascii?Q?TFkxpFKkGoljo7eZXHS/7CwcpH6nAQZ/qmUqtgMqBHV8I8RlZu4kfXozuCeP?=
 =?us-ascii?Q?p+/ljVlkNKP1/SVq5e0iBh90jdInRWLP8217idgSxSne9YfQVPf2ZzWdegaN?=
 =?us-ascii?Q?HjRxMGSqOehUDSC/mpyO0vXMycFOWXSX5oDJbEXzLzCVEicSp9S4Tz89Nqq0?=
 =?us-ascii?Q?rBzbWdBu2MGdloQZ8CoZ8ojEG4ymGG4w05TllaK2eNFY0Td5jUv5s5Rvw7C1?=
 =?us-ascii?Q?NtWfhcpaBy3rpI2JaqVAYMz6e0oeUz95v35ieU6w3BORb5kvEtC0BoDViPvM?=
 =?us-ascii?Q?wZKEAnzPRTMzcd8OCIc6U4bBA3P+Z6DqwpVlzkrUsLQHNMk2puS0wZFLyXjx?=
 =?us-ascii?Q?5YQhbeicxwRdoNBEqMyIWXUoHgIMPJVDHuwjC3G7U57E4eDBEuiyox65D0d5?=
 =?us-ascii?Q?tiR1InqF7xy3akxYYwkSuFAjWAYFBLstfG9BjgV7m+umT+bvNLhy4X8ZqcM6?=
 =?us-ascii?Q?IaCn8Y8tSscsdVTec6O+EJelBO2x8zgh4JSuiLdWtSc8EudCSKuowxCX45ha?=
 =?us-ascii?Q?7HoXHz3zRy51pDkkd3uh03vvzkE8BAs4gVwnKwhGeG2uVmBeSyxFE7SR0iSK?=
 =?us-ascii?Q?MIstqfki/EKyggZQsMNF1c8D/5zbUvR0inGB3iXCKpfz/Os5n6dt2WX0UeMW?=
 =?us-ascii?Q?lyDFk35RyvT/F4tCRMRKZ6dJPF8vnkw9Zf4E8l/0EJ9cU6T30VXYd5K5FWkI?=
 =?us-ascii?Q?SS0RR15tbG+5afz9Xdxj69sq7wHxJxi0/sdLIGI/u50v7CEHspzhVlU2iA/t?=
 =?us-ascii?Q?dmDCdyYouNEIHTyxX5xwUTlr52J3VHc7FPnpkwjG0jnHTH7oFp8AGIHGUK7P?=
 =?us-ascii?Q?f+qMVR+tjrX9yESOfA/27L24I+FMERZqkbGiJJT9oLHr21HOcLayLWqS2gag?=
 =?us-ascii?Q?lbSzvWAfVxitBdnsCoCN+DmrEYqvphXXem3fuYLh/t3g3GEUBX27CKITrZKB?=
 =?us-ascii?Q?mivw34SzfR5sSZ1/Io6xGKZonfkSB1deULfQqP+BDW6cjz7XCpaTLrtEKrlU?=
 =?us-ascii?Q?NwQQDlHgsKZj9bWIa9U4y9IujLek/MbPLkCyR49jz5jiSFi8UipsfLjBX/MF?=
 =?us-ascii?Q?ZLykoyLblvBW5ZGYQqNLGELzotnj4x+2f4cytAa9skl65s+4yBKRauSl2bgy?=
 =?us-ascii?Q?IVegj5UeaqWYuAjBJ4OF5If3Vj9bYUkb0pqMHuux6wulPHmEGHcb1GQ16XnA?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb2dc9a-88fa-4acc-8620-08dda55ce320
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:47:32.6313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4XdR9K71RMj/w9FaOB6dohTicZu9HTwHQvZvABPNPYLiztWZfGHMrBUlr+MpgFnw2qJnm9XoOTelprlBqUimA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
X-OriginatorOrg: intel.com

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0c9379f235df33a12ceae94370ad80c5278324d
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070617.O7yPB5MW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070617.O7yPB5MW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070617.O7yPB5MW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(e1000_main.o at 975540)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(net-traces.o at 999960)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(hugetlb.o at 890520)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(trace.o at 881700)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(tcp.o at 1003740)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(skbuff.o at 997800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(core.o at 973860)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(syscall.o at 883920)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(slub.o at 890400)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(super.o at 912660)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(filter.o at 998880)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(mballoc.o at 901800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(page_alloc.o at 890100)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(core.o at 886860)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(vmscan.o at 888060)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(volumes.o at 913800)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(af_packet.o at 1009260)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(ring_buffer.o at 881640)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(inode.o at 913260)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 870780), and 'i32 1' from vmlinux.a(core.o at 883860)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

