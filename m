Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763D2253F9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008157; cv=fail; b=XtEGXhxaBANkRNJco8P9pUWf6znvo6IEcJL5gcmaPKNwm0gU/G5PwqoX9eeTkLx3fxkLTq/KqW4dgCdrLCVfKp/95Ot5HlDhvsba3CV96GCkiwQvOHYXCuaqzpT3Empg2HZOr6t86su/+v7aHHkNzzjxqzLDk0J8UiryAcqrixg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008157; c=relaxed/simple;
	bh=Ku+hwVIMHc6+NNLW2z0XXbfao6s6L2QshjCXLaZCgDM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gpyjk1JKe/6sTLZcGRi/csCdA60OMZuSKUMTnGsvPvCNm9U8qDmTRMIeKGYMXKt8H6T7QQXcDLFOXYrkVw+7bBkMrREr9kR/JkmwiJv7Zlu03+pz0KYLYPKKBsllJe73gKLwaejppYj351xTaTDnYbYLKfoGrrFZcqYH8p4q/KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZqltUVI; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZqltUVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744008155; x=1775544155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ku+hwVIMHc6+NNLW2z0XXbfao6s6L2QshjCXLaZCgDM=;
  b=RZqltUVIc9JUw+KgAzloFltfPTLMrovtoD8ynaKpvm6Qz0gSBOfz2dX8
   ZACv6YRJRAU8AskYo/FZ4ohkJORfk7rP6wtL0kAWyrbFZ7vEc1x2gbgPm
   BeTPhrxYRjpfXczfYHfFdkA/ELJ+kXWV48QhT3j38keq0S6pQtGt5sAuK
   pFMpPEYXO6NUl/IB5pt0822GzvLVi+4LXIUKuiVydpC6GX3aFeclOgXbg
   8wfMBt3bzpPzjGpmzQv8Qm35PUGbmB/vut7lUaHzcxuYbyyIPoI7jOEJx
   q/DZEcfPeFFVYB2/5WuUp5nK5AMVXqZTafD9RzTKgouIGDiC5smJAVHTu
   w==;
X-CSE-ConnectionGUID: S+zhNVaqQ2+QQ1d3HfKN6Q==
X-CSE-MsgGUID: YDKFU28ZSfuxAHLfOKIyrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56040725"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="56040725"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 23:42:34 -0700
X-CSE-ConnectionGUID: dr/uFRc4TMmBefT2rkgsMw==
X-CSE-MsgGUID: DnvqAmfIRa2GuDcekhe/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="133074675"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 23:42:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 23:42:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:42:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB0t/jylEQWyREPP0etYpS/Mv4xLLYw6uWJzOgVfEPZ04BvuRecx6pZ4rH8+86ihA+r66r5tJ4dZXeB+zzn79WrsJqud76GHsykcjWdJ5IZTQnsZOQsDEacGzmoIIppJrEFu5TS2dm5dshM3qMPPiuPYCuJCtclKTlhu6PQ4o7tvdxQW3m+shTUGXTKTcR59ZKCRi3fWl2NB/A8R7lJpbXPagYDZqiywZ9noVYueXATA00GJXO2xE1nDGaZmmpdspMsVj0nJVV+bcOZ5HAnLJv431br+uDzRs8+daESi8G8CsWl2njB0XNBzFH0xyneTjkeIg8RiEv1hY541YuueQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvRJqqIJNj9pu7TIw5O7lt+DwKdIxl3sPXd7Lv0byUQ=;
 b=dnvfe+OSupp0XVEv6/2uSdpZokMZZF1xePh1rXxlSMiYJPwxmiJDyMvhp4G9mTi1f6h9Z2R7F/smGaekcFQbuwenHST4CPZYOVqWMUx/xbFnrPUgbUgm43Z0sIf08AdoK2qx1F3MVfScXq+DsJyVjN9Wlytsp3OLwoIYgCqyWRlGiq8M/DyaMdmkyiXkWKtFwlclZgZCzF+uH1zegI96Op+aQyXVzNvxIDjZu4WUtUr3LiHAP5ed/DrHU5SaxR+xt0I+fNBNo//OEhkfktt3cvHmCN/cbqkTLBaAm2H6A061jldyhKekGKhGzt6lQJYha4WTB9CuQzg+YDktbPcV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 06:42:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 06:42:30 +0000
Date: Mon, 7 Apr 2025 14:42:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Alessandro Carminati <acarmina@redhat.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter
	<dan.carpenter@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, "Arthur
 Grillo" <arthurgrillo@riseup.net>, Brendan Higgins
	<brendan.higgins@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
	Charlie Jenkins <charlie@rivosinc.com>, Daniel Diaz <daniel.diaz@linaro.org>,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, David Gow
	<davidgow@google.com>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller
	<deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Jani Nikula
	<jani.nikula@intel.com>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, Kees Cook <keescook@chromium.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, =?iso-8859-1?Q?Ma=EDra?=
 Canal <mcanal@igalia.com>, Maxime Ripard <mripard@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, "Rae Moar" <rmoar@google.com>, Rich Felker
	<dalias@libc.org>, Simon Horman <horms@kernel.org>, Thomas Zimemrmann
	<tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>, Ville Syrjala
	<ville.syrjala@linux.intel.com>, "Will Deacon" <will@kernel.org>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [x86]  61aa5e5dd7:
 WARNING:possible_circular_locking_dependency_detected_trinity-main_is_trying_to_acquire_lock:at:__perf_event_task_sched_out_but_task_is_already_holding_lock:at:rq_lock
Message-ID: <202504071333.8dfe7122-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0098.apcprd02.prod.outlook.com
 (2603:1096:4:92::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cd85a0-71eb-48f9-a85b-08dd759f5e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4e/k5yXgx9b9RyoaO9PxjpyVMRgrYOsqe5D5eXAwY0EjVLNZaEidoSfOIG0R?=
 =?us-ascii?Q?Mdks2ssYiiz8ts7oRpf5lVHJu7OAZPQlWYvXk6oVEkoAUjqo//6HO11twrQ2?=
 =?us-ascii?Q?F0iclfM0RWANgI3k7l9lxSmG6WXLws0labu8Y/1nVM/YmJyeHh6scplcJwQf?=
 =?us-ascii?Q?52TAB3bXunnUIk73C1ykWpOIv488rJaLMK7L7R9TngobRrbxf+vZ0DxpYtlY?=
 =?us-ascii?Q?YCykxt8NHbdZoFSre2n632ScBRNl5Tx+ede+0QVnxrVlvQxiK1vda3lgVBQj?=
 =?us-ascii?Q?+4Bn9c/G1k8/tYRGcjjKck+3Ybyg1IzwOG5gPpnDjuKClnYSPAfZTTULHRCJ?=
 =?us-ascii?Q?H0PY/o7sLCM8+kEV/Crn+vgOBAEd48BpNJI8DitJRxz1uq9d1Aw6yehwcjBq?=
 =?us-ascii?Q?/LIuXtqN0oPalZbEOHgEMS6+Jo5x7Zt+UO1GnH2W7HVBxC/VyuwM4gkxoub4?=
 =?us-ascii?Q?2/4VwXZFMlTYsSQUnN799ZWIt2KSoca2R0jQc2qIfYSbRQiIcPgos7S7cofs?=
 =?us-ascii?Q?j+Q672/LXBDWKJP+2ulZN0y4+Hbclb2t4rWJPhYElByeWo4rZPz1TKuzEz+L?=
 =?us-ascii?Q?OB9kCDcwMbukgIA+ko46af8T/HVXdiI4PX77kkMtIAU0atfv+5Imk6np1819?=
 =?us-ascii?Q?/9LSXPmKClpajPzig/nRbNjrzCTi9JN9L82wrkP+aLMBiK+EslhNRAAEi7Gh?=
 =?us-ascii?Q?S1+uaMXme+Zy5tq94yMJ/ocifJVc4c3WXSbA4y8wiFRece8nrPrg7IXrPJa6?=
 =?us-ascii?Q?lwp+HT87rkRYs/BsUNg99TOt0emEpb3VKaViTAW2+fn6rTOgZUFTN3IXJA6+?=
 =?us-ascii?Q?dT/VqRSm4xjahEqzzoa1nNWsNniqeb+tWTIQpb3AEf4nFPIZCI6rQp4eFwD0?=
 =?us-ascii?Q?bp1wnU5UaXL8APCJsEx7d2iFNjPE44/kAzrirQmh5PxTwysGndLK5LhFljmP?=
 =?us-ascii?Q?SlIgk91N2zuj2cO2MFer0U+L+0GFh+lgXmBaRzabnuz/D7cdpHgEuXYYqlGu?=
 =?us-ascii?Q?GKkmhkw27uCFQ22GoZkSFlUxl0gNKnArkq7UPqqor6DVsMRXZ+0379IeqC+n?=
 =?us-ascii?Q?vjJZiePolofngOKeoaP4rmSzVsh1YVLjjQHyE3negwWst4XkB1OET0+HgSsP?=
 =?us-ascii?Q?0uAhQ3WiXaDXkCK4DYZG3hFwmYuyKZfsCW3F2CkBpbYYJzopv8VkQ+6N6C/W?=
 =?us-ascii?Q?Hfe0+adYYEgdB6kjTTkP3iORVCFrz4ic9YhyUVN4CB269f0byveZjnhy+AEu?=
 =?us-ascii?Q?DAq0kfI8/V5x7pUoNlGi/f83j6L3KuCcVST9l1IoO56I0AfabQuE8mUDQ3mD?=
 =?us-ascii?Q?BNh28tUYTcK0G/Awwi3rg4VbDhmxz5xghfaHoZ32TKjS3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJ8eSglp1yyIII1beK/nHgWUaV/BUQYDvaxy2tP1pR3t8nRh48nh+gIOZ0UV?=
 =?us-ascii?Q?irxCp7QL118UhlePlN38KWPwhZ0IGSh31QSS/z9Uj7BiVDlBKe0N8e1dlB0w?=
 =?us-ascii?Q?YWpuUWcJt1vmnjy+42sPKR70nJskKH887VOTUwgdDEVpGpXyS9aADyYWZI+e?=
 =?us-ascii?Q?2XPo8LwrPR9I8stXJSikk9kmmw0gsY1nFdMNO3vleOFQ2GsKzrCF02+a5ZJE?=
 =?us-ascii?Q?Wo0w5gmizD2xyIfgq5m92Ukb8Z+tQOu2LjbZTq9HCa5uMmRE9gnoPqf/g9DR?=
 =?us-ascii?Q?vRgx3gEeVsuquqGyQyPh8daNuGptK0Pa44hjt4qd86D4HDpCFuHCLmaRaIi3?=
 =?us-ascii?Q?/uDCD1nDXnjA2E+/Ms8NCG6agS5xQEikJp7GnzFBXXlYK6LU4mr0pJ1XFhqi?=
 =?us-ascii?Q?XGm0ZQxDuMb1iq7UAtnwFYDMbas6bAfKXLMT8mKsvvFW52/DLtZxP5JAG4NS?=
 =?us-ascii?Q?H46iAi6fBdn8TsZu4Tru3+hN7utormykNZ07RnmTZPIB0A01dya0qbi7rHEo?=
 =?us-ascii?Q?MRHAZiceIlChoWhBDsQhWtke87rj8U3+FQOTT4aYATRY4yTtT9qwAk6XRZ3X?=
 =?us-ascii?Q?sXy/RQvB2z0x5ltmaAP8AyDB9GCB2Bbfs5bJ860GCW6BABIDMDrmqCJEkher?=
 =?us-ascii?Q?BLAyvELe4oGxW2BD/cgjATbmrIHvrQjGv0wPr/igZWuNK66kq+EJ9FjLaWn1?=
 =?us-ascii?Q?ZPSYjfBC53RM3RJ8woVtlWfV837N9ZjZVm311SPlX+ahKhNJVKmrhmpHgnd9?=
 =?us-ascii?Q?lFDgTi+O5L0A5NgcuJ5r2CDu9k/5rhRoLQqccEW7aLWdVHo8BusyLAo20Xa5?=
 =?us-ascii?Q?q8WdcmXEff7/VPa99qeVJ9rmXFr9I6qvZt2JwTi5sk6z65w0+2JnURIfOjdb?=
 =?us-ascii?Q?iLA28mIi3UQBSqJCLHmypf6g8py+nkVfpfefKAQ5mxh3T4g4w4JV1kOXixbx?=
 =?us-ascii?Q?vOg+LkUQHoAVvK9u74xiZHiigQEYx9Hew9LwUxlH7zd+Ktx+9V83nBJ9F4nk?=
 =?us-ascii?Q?S+ATEkAbbreKrTHSB6itmCf4WnBOnSBGwbH0dfk9KMWznWUArE2pi+IA64gy?=
 =?us-ascii?Q?cbZI4Izvc+7h3tvXRvd1EGxClD4YhBda9KxlPCszCUcYD5Cz0aaM7uHumE8D?=
 =?us-ascii?Q?ZPllgwep1DjxkX0AUvW+Sq5rfwAeaXEW+MpXlrwMRnXI108/10YyI89D617M?=
 =?us-ascii?Q?9mUYhwtvOqb5U9GilblDfLqrR4NNp/JOFFRwBS5Qjk/7zZYl7KFxzja+vLnj?=
 =?us-ascii?Q?HLSrwdilg/by73qFA8/vFhIXBtqFKogeMvCrhoXWID75wPS3kAtvbxzlhk8L?=
 =?us-ascii?Q?q1VxOmMQYPjNiFIlseSs97S5Mpa2jHD4VmO5eQa9ayXpDXTBlmz19ofCjhai?=
 =?us-ascii?Q?gsQv2gAvmZyfhGpIjMeHGsHzDOYP02OItBwIH1X+hhrrVpbSGXj0ivCN75G9?=
 =?us-ascii?Q?/zQPMgpRalE1rwV/JlTG0eRfS9xFbR+QYToZFPSP4M29KEufJSd6ohMn+DXF?=
 =?us-ascii?Q?FhbcFkqlXIUBBnntJR6PSoJleoFFsmU8AmrSdWy6QeGgih5dOuYCgQTbdCN0?=
 =?us-ascii?Q?UcArIF/z3vU8ZlKEY535hZiSqFdVIZmeelC/uagOBHwO7c37WlpBTMhOKkqc?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cd85a0-71eb-48f9-a85b-08dd759f5e93
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:42:30.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F829eFI9FzzNMCy0inih5JA3jZPhZP6NfaFJyTwBcUK7QwNyZrkzY3EN3DhEqTyOZ5my9YX40vhPnCz1deAgdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
X-OriginatorOrg: intel.com


hi, Guenter Roeck and all,


this report is just FYI that we noticed a WARNING in our tests. it seems the
WARNING detail stat has changed due to this commit. in case it can supply any
hint to solve any real issues.


b6632ab0d524b989 61aa5e5dd770fab2eecb38e21f7
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          6:6         -100%            :6     dmesg.WARNING:possible_circular_locking_dependency_detected_trinity-main_is_trying_to_acquire_lock:at:__perf_event_task_sched_out_but_task_is_already_holding_lock:at:__schedule
           :6          100%           6:6     dmesg.WARNING:possible_circular_locking_dependency_detected_trinity-main_is_trying_to_acquire_lock:at:__perf_event_task_sched_out_but_task_is_already_holding_lock:at:rq_lock



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected_trinity-main_is_trying_to_acquire_lock:at:__perf_event_task_sched_out_but_task_is_already_holding_lock:at:rq_lock" on:

commit: 61aa5e5dd770fab2eecb38e21f71ca17f5b54401 ("x86: add support for suppressing warning backtraces")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master a4cda136f021ad44b8b52286aafd613030a6db5f]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5



config: x86_64-randconfig-102-20250402
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504071333.8dfe7122-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250407/202504071333.8dfe7122-lkp@intel.com


[  165.999666][ T3622] ======================================================
[  166.000259][ T3622] WARNING: possible circular locking dependency detected
[  166.000873][ T3622] 6.14.0-12166-g61aa5e5dd770 #1 Not tainted
[  166.001389][ T3622] ------------------------------------------------------
[  166.001976][ T3622] trinity-main/3622 is trying to acquire lock:
[  166.002468][ T3622] ffff88818f8d2018 (&ctx->lock){....}-{2:2}, at: __perf_event_task_sched_out+0x43b/0x580
[  166.003273][ T3622] 
[  166.003273][ T3622] but task is already holding lock:
[  166.003862][ T3622] ffff8883aee349d8 (&rq->__lock){-.-.}-{2:2}, at: rq_lock+0x130/0x2b0
[  166.004586][ T3622] 
[  166.004586][ T3622] which lock already depends on the new lock.
[  166.004586][ T3622] 
[  166.005480][ T3622] 
[  166.005480][ T3622] the existing dependency chain (in reverse order) is:
[  166.006251][ T3622] 
[  166.006251][ T3622] -> #5 (&rq->__lock){-.-.}-{2:2}:
[  166.006909][ T3622]        _raw_spin_lock_nested+0x2e/0x40
[  166.007382][ T3622]        __task_rq_lock+0x1e4/0x590
[  166.007822][ T3622]        wake_up_new_task+0x544/0xb30
[  166.008447][ T3622]        kernel_clone+0x28d/0x490
[  166.009638][ T3622]        user_mode_thread+0x5f/0x80
[  166.010918][ T3622]        rest_init+0x23/0x250
[  166.011334][ T3622]        start_kernel+0x38d/0x3f0
[  166.011782][ T3622]        x86_64_start_reservations+0x2a/0x30
[  166.012327][ T3622]        x86_64_start_kernel+0x66/0x70
[  166.012615][ T3622]        common_startup_64+0x129/0x137
[  166.012941][ T3622] 
[  166.012941][ T3622] -> #4 (&p->pi_lock){-.-.}-{2:2}:
[  166.013317][ T3622]        _raw_spin_lock_irqsave+0x51/0x70
[  166.013614][ T3622]        try_to_wake_up+0x5e/0x1140
[  166.013869][ T3622]        __wake_up_common_lock+0x13c/0x1f0
[  166.014156][ T3622]        tty_port_default_wakeup+0x8b/0xc0
[  166.014442][ T3622]        serial8250_tx_chars+0x2e2/0x8d0
[  166.014716][ T3622]        serial8250_handle_irq+0x3d7/0x850
[  166.015000][ T3622]        serial8250_interrupt+0x88/0x110
[  166.015274][ T3622]        __handle_irq_event_percpu+0x1e2/0x540
[  166.015574][ T3622]        handle_irq_event+0x8b/0x1c0
[  166.015836][ T3622]        handle_edge_irq+0x1f7/0x940
[  166.016098][ T3622]        __common_interrupt+0xbd/0x160
[  166.016637][ T3622]        common_interrupt+0x7c/0x90
[  166.017043][ T3622]        asm_common_interrupt+0x26/0x40
[  166.017313][ T3622]        default_idle+0x16/0x20
[  166.017552][ T3622]        default_idle_call+0x7b/0xc0
[  166.017915][ T3622]        do_idle+0x107/0x2e0
[  166.018296][ T3622]        cpu_startup_entry+0x49/0x70
[  166.018728][ T3622]        start_secondary+0x101/0x110
[  166.019151][ T3622]        common_startup_64+0x129/0x137
[  166.019518][ T3622] 
[  166.019518][ T3622] -> #3 (&tty->write_wait){-.-.}-{3:3}:
[  166.019897][ T3622]        _raw_spin_lock_irqsave+0x51/0x70
[  166.020174][ T3622]        __wake_up_common_lock+0x34/0x1f0
[  166.020486][ T3622]        tty_port_default_wakeup+0x8b/0xc0
[  166.020786][ T3622]        serial8250_tx_chars+0x2e2/0x8d0
[  166.021071][ T3622]        serial8250_handle_irq+0x3d7/0x850
[  166.021373][ T3622]        serial8250_interrupt+0x88/0x110
[  166.021648][ T3622]        __handle_irq_event_percpu+0x1e2/0x540
[  166.021950][ T3622]        handle_irq_event+0x8b/0x1c0
[  166.022207][ T3622]        handle_edge_irq+0x1f7/0x940
[  166.022469][ T3622]        __common_interrupt+0xbd/0x160
[  166.022734][ T3622]        common_interrupt+0x7c/0x90
[  166.022989][ T3622]        asm_common_interrupt+0x26/0x40
[  166.023342][ T3622]        _raw_spin_unlock_irqrestore+0x3d/0x50
[  166.023866][ T3622]        uart_write+0x411/0x9c0
[  166.024318][ T3622]        do_output_char+0x44d/0x7f0
[  166.024782][ T3622]        n_tty_write+0xd6c/0x1060
[  166.025209][ T3622]        file_tty_write+0x4a9/0x860
[  166.025654][ T3622]        do_iter_readv_writev+0x378/0x520
[  166.026136][ T3622]        vfs_writev+0x23a/0x7f0
[  166.026537][ T3622]        do_writev+0xad/0x130
[  166.026947][ T3622]        __do_fast_syscall_32+0xcf/0x110
[  166.027418][ T3622]        do_fast_syscall_32+0x34/0x80
[  166.027846][ T3622]        entry_SYSENTER_compat_after_hwframe+0x83/0x8d
[  166.028419][ T3622] 
[  166.028419][ T3622] -> #2 (&port_lock_key){-.-.}-{3:3}:
[  166.029069][ T3622]        _raw_spin_lock_irqsave+0x51/0x70
[  166.029560][ T3622]        serial8250_console_write+0xc4/0x1560
[  166.030043][ T3622]        console_flush_all+0x483/0x870
[  166.030500][ T3622]        console_unlock+0x76/0x180
[  166.030932][ T3622]        vprintk_emit+0x44f/0x670
[  166.031337][ T3622]        _printk+0x6c/0x80
[  166.031726][ T3622]        register_console+0x6b5/0xcc0
[  166.032177][ T3622]        univ8250_console_init+0x3f/0x80
[  166.032676][ T3622]        console_init+0x138/0x2c0
[  166.033133][ T3622]        start_kernel+0x25f/0x3f0
[  166.033592][ T3622]        x86_64_start_reservations+0x2a/0x30
[  166.034131][ T3622]        x86_64_start_kernel+0x66/0x70
[  166.034629][ T3622]        common_startup_64+0x129/0x137
[  166.035118][ T3622] 
[  166.035118][ T3622] -> #1 (console_owner){-.-.}-{0:0}:
[  166.035793][ T3622]        console_flush_all+0x426/0x870
[  166.036295][ T3622]        console_unlock+0x76/0x180
[  166.036743][ T3622]        vprintk_emit+0x44f/0x670
[  166.037179][ T3622]        _printk+0x6c/0x80
[  166.037567][ T3622]        ubsan_prologue+0x24/0x50
[  166.038003][ T3622]        handle_overflow+0xcd/0x120
[  166.038471][ T3622]        visit_groups_merge+0x1719/0x1770
[  166.038976][ T3622]        __pmu_ctx_sched_in+0x91/0xb0
[  166.039446][ T3622]        ctx_sched_in+0x322/0x430
[  166.039895][ T3622]        ctx_resched+0x37f/0x630
[  166.040337][ T3622]        __perf_install_in_context+0x645/0x880
[  166.040865][ T3622]        remote_function+0xd3/0x150
[  166.041306][ T3622]        generic_exec_single+0x10e/0x2e0
[  166.041787][ T3622]        smp_call_function_single+0xdf/0x260
[  166.042316][ T3622]        perf_install_in_context+0x3c7/0x610
[  166.042851][ T3622]        __se_sys_perf_event_open+0xe3d/0x1540
[  166.043401][ T3622]        __do_fast_syscall_32+0xcf/0x110
[  166.043883][ T3622]        do_fast_syscall_32+0x34/0x80
[  166.044374][ T3622]        entry_SYSENTER_compat_after_hwframe+0x83/0x8d
[  166.044982][ T3622] 
[  166.044982][ T3622] -> #0 (&ctx->lock){....}-{2:2}:
[  166.045632][ T3622]        __lock_acquire+0x19bb/0x3010
[  166.046075][ T3622]        lock_acquire+0xe3/0x200
[  166.046492][ T3622]        _raw_spin_lock+0x30/0x40
[  166.046920][ T3622]        __perf_event_task_sched_out+0x43b/0x580
[  166.047448][ T3622]        __schedule+0x1a09/0x4350
[  166.047868][ T3622]        schedule+0x16d/0x370
[  166.048279][ T3622]        syscall_exit_to_user_mode+0x66/0xf0
[  166.048786][ T3622]        __do_fast_syscall_32+0xdb/0x110
[  166.049282][ T3622]        do_fast_syscall_32+0x34/0x80
[  166.049741][ T3622]        entry_SYSENTER_compat_after_hwframe+0x83/0x8d
[  166.050331][ T3622] 
[  166.050331][ T3622] other info that might help us debug this:
[  166.050331][ T3622] 
[  166.051200][ T3622] Chain exists of:
[  166.051200][ T3622]   &ctx->lock --> &p->pi_lock --> &rq->__lock
[  166.051200][ T3622] 
[  166.052211][ T3622]  Possible unsafe locking scenario:
[  166.052211][ T3622] 
[  166.052817][ T3622]        CPU0                    CPU1
[  166.053259][ T3622]        ----                    ----
[  166.053705][ T3622]   lock(&rq->__lock);
[  166.054057][ T3622]                                lock(&p->pi_lock);
[  166.054587][ T3622]                                lock(&rq->__lock);
[  166.055116][ T3622]   lock(&ctx->lock);
[  166.055448][ T3622] 
[  166.055448][ T3622]  *** DEADLOCK ***
[  166.055448][ T3622] 
[  166.056101][ T3622] 1 lock held by trinity-main/3622:
[  166.056546][ T3622]  #0: ffff8883aee349d8 (&rq->__lock){-.-.}-{2:2}, at: rq_lock+0x130/0x2b0
[  166.057288][ T3622] 
[  166.057288][ T3622] stack backtrace:
[  166.057796][ T3622] CPU: 0 UID: 65534 PID: 3622 Comm: trinity-main Not tainted 6.14.0-12166-g61aa5e5dd770 #1 PREEMPT(undef) 
[  166.057804][ T3622] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  166.057808][ T3622] Call Trace:
[  166.057813][ T3622]  <TASK>
[  166.057818][ T3622]  dump_stack_lvl+0x69/0x90
[  166.057829][ T3622]  print_circular_bug+0x2ed/0x300
[  166.057841][ T3622]  check_noncircular+0x115/0x130
[  166.057851][ T3622]  __lock_acquire+0x19bb/0x3010
[  166.057859][ T3622]  ? __update_load_avg_se+0x7cb/0xcc0
[  166.057873][ T3622]  ? update_load_avg+0x54d/0x17b0
[  166.057880][ T3622]  lock_acquire+0xe3/0x200
[  166.057886][ T3622]  ? __perf_event_task_sched_out+0x43b/0x580
[  166.057898][ T3622]  _raw_spin_lock+0x30/0x40
[  166.057906][ T3622]  ? __perf_event_task_sched_out+0x43b/0x580
[  166.057911][ T3622]  __perf_event_task_sched_out+0x43b/0x580
[  166.057919][ T3622]  ? lock_is_held_type+0x8a/0x120
[  166.057930][ T3622]  __schedule+0x1a09/0x4350
[  166.057938][ T3622]  ? schedule+0x16d/0x370
[  166.057944][ T3622]  ? __se_sys_perf_event_open+0xf79/0x1540
[  166.057956][ T3622]  schedule+0x16d/0x370
[  166.057963][ T3622]  syscall_exit_to_user_mode+0x66/0xf0
[  166.057970][ T3622]  __do_fast_syscall_32+0xdb/0x110
[  166.057976][ T3622]  ? __se_sys_perf_event_open+0x4e/0x1540
[  166.057982][ T3622]  ? __do_fast_syscall_32+0xdb/0x110
[  166.057989][ T3622]  ? syscall_exit_to_user_mode+0xc1/0xf0
[  166.057998][ T3622]  ? __do_fast_syscall_32+0xdb/0x110
[  166.058004][ T3622]  ? __do_fast_syscall_32+0xdb/0x110
[  166.058008][ T3622]  ? __do_fast_syscall_32+0xdb/0x110
[  166.058016][ T3622]  do_fast_syscall_32+0x34/0x80
[  166.058021][ T3622]  entry_SYSENTER_compat_after_hwframe+0x83/0x8d
[  166.058028][ T3622] RIP: 0023:0xf7f19539
[  166.058035][ T3622] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[  166.058040][ T3622] RSP: 002b:00000000ffcfef6c EFLAGS: 00000206 ORIG_RAX: 0000000000000150
[  166.058046][ T3622] RAX: 000000000000011b RBX: 0000000057146ae0 RCX: 0000000000000e26
[  166.058050][ T3622] RDX: 00000000ffffffff RSI: 00000000ffffffff RDI: 0000000000000002
[  166.058052][ T3622] RBP: 00000000f7d3f525 R08: 0000000000000000 R09: 0000000000000000
[  166.058055][ T3622] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  166.058058][ T3622] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  166.058067][ T3622]  </TASK>
[  166.143279][ T3622] UDPLite: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
[  166.157355][ T3622] UDPLite6: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

