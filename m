Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40C2745C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743039862; cv=fail; b=nxijQoHEZUoy3GNDBQC0MOIGAJOlavVNv+AQIRjlxgsdqq2QZU89CgrQKeIlkGhSsri+tjMPG7WfeAzVgPevKwBEilRBKu+YYaFc0Rzn6Vo5tin8nW8Fd8FyTryU8vm5mD5pCZHLrZ23qhVWulGa8bSyKOiUjKrIokHuk2g4Jl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743039862; c=relaxed/simple;
	bh=j5qwB+vrYY4Y6SnJg8REbgCJJsd2faRz9YFUHK7gHkU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XRGtqnJBSQHuccgaTpNUvAJcXLMfasPSCaAEP+blS22jQEBpOyZn/2VjAT57tLMjih+aLh6U+7ayjBuktwXoUNflQdvN1mBtHynWN4VZmqofaXzGlH8bDFh5BR4LW75NNIADlnf/DeSjkSojHtO8UkOiuVpi6a6/maNJ/krX5sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvOHGntN; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvOHGntN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743039860; x=1774575860;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=j5qwB+vrYY4Y6SnJg8REbgCJJsd2faRz9YFUHK7gHkU=;
  b=BvOHGntNLNMCTUo0bHMAiNO0bpu2T7m5EOo0RrncebxlhpH/szWA+MRt
   q4YN2rNSTRsCFMdm1eyxxjoAZf60UO131seqNQtslJDtyfkQbGR9aqnIg
   cc3UaN4b4sEc2i1/VX8VxJN7pPE/zFL+tfPDkKjFI1Fo9eo+mEnM2FadT
   fv0kobAl/GGZlP9fFiBjIbPNwEfzWJkeT0ns8DNmISmh8j+OBrhn5I/mH
   uxi6mm7TO/nH1azElBEKszLby7+6oUIYbiz2F9y76QY0otgqeFcJiLral
   IxUYE9UXC2Jrqr3/f97N4x8CkJCKO+NrrixInPYICa/XHop0rmQjM23J8
   w==;
X-CSE-ConnectionGUID: 9mVMhYqJQDq9e6HusHL5Zw==
X-CSE-MsgGUID: +2L1b+/mSWqo2CAtlCaYTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55721203"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55721203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 18:44:20 -0700
X-CSE-ConnectionGUID: luvOevf5Qs68iHc4m5SQ8w==
X-CSE-MsgGUID: 4gYlMoAZTwGTiMwXj61xLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129837405"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 18:44:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 18:44:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 18:44:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 18:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7avN9vpCS8Y74iWRLr8x0jfnCURou5jFbS1z95GnFVxjQDpadHtLZr8nNmdRIi/9Xkp49KdgIf5lF5iff+62PvBCZJ/hxEvtZxkmAvf6tBBtMqSXWVM42te5Y7hjh6fapv0i7PyKDyoRqmZj/m5H+Z/kW2l+327QvrsKMByZ/AupN9TE7/qbuN0JSm9VjoV31WE4538NBmY4frwZEjKcI2dFzqkK88epxTODu31KAeWU81S6qJyizu2gky5TfR0ii1WzaCy8uZoABdtOqm4k0aUaiHvFQxRsy4D/yToltmA9AZ28G10NCsZofEZZhej7jjZwFOxZ0s6uEM4RGaVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNNinnln659K4L93Kezte47eyhQFu4eZNlSrBDv/r84=;
 b=vEr0QA1x7IMyu/fka+8EnC9n91Y2TbbtrcZa1gyKYQTopZ/FNBjaONuU6EqVB8xvTrfZEbIcFumaBgQ5dkCO6DiPDLjW2hHcRHcX0SzHvn0ypgvgOSp1rm8uXAFda6m/Ls7BmHgitKbeGeIKaN/2XOuxNNqhJnoZCazIeXl9TLK6j5T4FuamlDggVu9hJ+GLmzobOp6MSpdM7njobq7ESuEW97WRs/KLH0AgfytVsGDPoooweceTGb7kDOUkC7dOMK/tUXb7A9aqYwpGmJyYjjAAHiotCdIsRgs36KmVO93cARr0RGC7bc86OMBU7rfm2EP/Ziuv2d958V01QNQxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 01:44:15 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 01:44:15 +0000
Date: Thu, 27 Mar 2025 09:44:06 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<colinmitchell@google.com>
Subject: Re: [PATCH v2a 3/6] x86/microcode/intel: Establish staging control
 logic
Message-ID: <Z+StZt9u+p0GjZHR@intel.com>
References: <20250320234104.8288-4-chang.seok.bae@intel.com>
 <20250321211853.13909-1-chang.seok.bae@intel.com>
 <Z+OuPbNGC6mOCHZ1@intel.com>
 <97d77c5f-eb99-4c82-9b58-9783060c2810@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <97d77c5f-eb99-4c82-9b58-9783060c2810@intel.com>
X-ClientProxiedBy: SG2PR02CA0081.apcprd02.prod.outlook.com
 (2603:1096:4:90::21) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 772d7619-330c-43c3-9b30-08dd6cd0e1a7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uaOCxysgZLnuf8BkfOAYKpipstc12OZ4vv4+jl6g5P3edJkzkV7LtY+UVn9P?=
 =?us-ascii?Q?pwFdfWZLKfyv916k+P1Wv80ceemthHEj1M6ttH4aXktSbXFGCgk5jDhHo5g3?=
 =?us-ascii?Q?e6bQpqzTykrkMkRd5nGP12CGXuZwFy682+/lD70n5vCYF0EHw1B0sR47Pho3?=
 =?us-ascii?Q?DsOKzIPy8M0l8uDiTVQq0XGK3Kn6d/3mDaNwsPT1C6E1ltBS8TpPKjrz4AGa?=
 =?us-ascii?Q?8fm17Jqq74cib8JD37S7krHcEZgF94KAtyFte2MBo0xLtmQnN7jMOQpWnNvN?=
 =?us-ascii?Q?P3ObwHNGe0Xr8iJokbKRA/Vy8i/5C/fckxGKjF4JPSZNDD2junRgocGvG/s3?=
 =?us-ascii?Q?PScwk3mUziJAgD9RGeIeBTazkT4YlmmfWnSopT7b4AAlIKuCeNa8bmotFeyd?=
 =?us-ascii?Q?fR/wfrO+wHou97TYCfOnLYLbbLywjUxpOlXSxZa1HcWX1y8/NWVi6Vu0kOjt?=
 =?us-ascii?Q?P9mOJNffUSmaWqFRIXACSpEBgPV7RONs5zDqVDkWH971Qs9mtz7mBg4phkxj?=
 =?us-ascii?Q?SIInw9/3gCup9y5HcgOyuKVOaZHqBY6K2YHP+uMjz5a4inhoirOKSlz9fv2N?=
 =?us-ascii?Q?3RheonZjkXNQDx1r68tj0UuNRcyegIn7qsrFJyCblfISxKrbHE4RVczO+n1K?=
 =?us-ascii?Q?N4WbOGHpQ+n6IFe2YM75kJm1WroGQvOt5rCMR0QOI3EkmJf23u2omvByJy63?=
 =?us-ascii?Q?Uz01qJa/mlMewa4YcW4zk7oIJaYFgVSMGdZGvGtgSaLWynNXJQrNURad4pHc?=
 =?us-ascii?Q?DbyYSA+01HYH83J2cwYbn0NsDKZRezyEaJOVF/3Nk/FCVn4QH02T4yvztSz1?=
 =?us-ascii?Q?J6S+vj1XzhkRADvqIVMtI/HajkvIy33QQY18iswIVx57lSmTQCUt1LhUIAi5?=
 =?us-ascii?Q?DeV/jmq4sEMPjKtfpmsfExtz43nV5SF5Q9jKMEoLCyT0WS0OEwjO0VcYXA7K?=
 =?us-ascii?Q?FDuUl1q46glYynQ/xNrxGSy2P+BuAPCiT8NjiHkK26MSmuKp/5RKxc3GX8Rk?=
 =?us-ascii?Q?pGestPKp9P4IhZFUDQovg6BIM8+yowT+PplxcmAIMLn4iYQ1fp4sYY8WTdNt?=
 =?us-ascii?Q?O+M8YKWZh0rvRcKsfbNgO+g1p6GWG51wl21M7EwHUlpfexrsXO7ZDjBLMKBA?=
 =?us-ascii?Q?FfOBK1axciH+apA4r/tuwIjJmGujcoHHIs4Ygxuuk0xJ15rRtgaLX1/L1iVV?=
 =?us-ascii?Q?gHaEh3S31c5EEufKmxzYBCtho2CE8xd/LHmXck/F+82DqNYxxRqxGdHMDTAw?=
 =?us-ascii?Q?ChMfEnLpSBdyHUvdtktDcTrksOwSROA4nGjWCXcmztRo3Wy0URhJSBSbKQKb?=
 =?us-ascii?Q?Ga9CNHw6ZYrK7MoIb1IEDxnaGnbvCzmNpIV7vaongvjnGlimoDTKfVVdhlPM?=
 =?us-ascii?Q?DMIMjUa62MLroVcfzCqJzk2os9Hp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9srAE7rB1xuxBzV+9tnphQIV6u5MRyGQzZH2NUQMiXLlUtTw2C86YpC6otVR?=
 =?us-ascii?Q?QGL9RK+hukdrjJcf7s+A6IYt2FCQbA5jl4ozSjOHlrm/dGUS2X6zqtd9zG0R?=
 =?us-ascii?Q?Yw3sKqkmna2uixyskNADx0UiZX7YvmCJbeoia0ruZDBhcyHRwZBAwt/Utj/f?=
 =?us-ascii?Q?VwyXWYA7ND8h2WOzCOGad0WkDwtQSSzwtApjBg9s704qmpEV6zFb763HaEvL?=
 =?us-ascii?Q?50v9Wzxy4hnwButxPVFck70oiXs1JLOV7fDSXbo59yRv9CxkaMv6qpSnvsob?=
 =?us-ascii?Q?PHClOm6gl+54kXRyCR5c7td9HYBd5dl85ZAkLzNOA+oFTIag2gjsF39zkFQj?=
 =?us-ascii?Q?Iqf/dFUsdTj2ac8E1mtfYdI5Gigbn93paz8zZ96GYGxWiV2tIwHW09bf8hnx?=
 =?us-ascii?Q?vYcM1nOs+sLnzDoADn8AHnecwh9TPuun4LwfgsdVCfquJqNA2J7/Lli8LPIO?=
 =?us-ascii?Q?cxMwQOqXY4QLE+cOjxIfc2OdRnpsn9xLxOKQikd+onRY9PYeIKy9yXrykRkb?=
 =?us-ascii?Q?8b/wMJm8xYOcVwFh0Uyc6I6Dp5cNZt1SuvIR9Kxt88PIVKrDEwG/Sw61dyUT?=
 =?us-ascii?Q?mQPLKsWPQ7L00YzBAtlO7bagPefFaMVIiiudvnlrFHEhmjI6kc9vHNIzQA5h?=
 =?us-ascii?Q?UQJ/VQpsDZv/E8OJiTcnYZXc0rNqMY0PdJT5jpKmmwFPVyulWNGuSsY/DV7H?=
 =?us-ascii?Q?gdZZby2BW8i1jzac/iRMG/K32SLSP7oZmNZJkfDIleMWTq6M48pDK1O3C2cI?=
 =?us-ascii?Q?wKCwqOXNYduC8ZUfe5FA/0iRgxY9F94e4QCJkiteEnUCjHBgjIOx/5gxThdt?=
 =?us-ascii?Q?EdlbkFnUc6hbVutWcfoUKug3+z8L1ct6OhgispdAfOzSknymtXZfaZYxye5p?=
 =?us-ascii?Q?dz3oxAY5eFkB5KEsLttcUXUqeKSpItQFXeOE6SENeFUGX8jzcDojyerMogOl?=
 =?us-ascii?Q?hBIYqQWFf7WkxTGktAK1cbE3uGVjiAXpF/Crg3pIBMDoX80CAr5fU3+j947K?=
 =?us-ascii?Q?agMMc7akhuudCFctU/z6DQ1gruhvZxp8VbXFs9h9ulSmCsX1w11O+N5hZrr3?=
 =?us-ascii?Q?cdYGEGg6o1JN47REAkOaTqzQ2lVKqsiuznewn7C/xne245zpSYYP9WF0CqOM?=
 =?us-ascii?Q?R7WUGCIwyjhEGeL6Pku+yUkw1/prrxDHQ6jRZizaxOtqenwD/LJTP5v8l3TA?=
 =?us-ascii?Q?q/kRwI4EgCDr+D3/STNB4WhEHcdaIco7E8DMrpA/U7GwGFIhbw46hCQCCiSX?=
 =?us-ascii?Q?otI0KaIg3Gc+pkBjdHZ8ZYv2pC2z/jbyeSssuF66wOoGfCbVKnR4yGw6tyaU?=
 =?us-ascii?Q?blwAZoGwiovdLgDdDPMkbfOWT5ohoBMxL+1jwdqbryhP/CGJTQV3xN4xHyU+?=
 =?us-ascii?Q?efW88WtTM3/XcagJv2KSjiaJ5NkmXnST+KDjSOfbr248SwxfJKpWll4K9LvT?=
 =?us-ascii?Q?bhjJXOZoTico6NriZdrF+dAtu/ePPp1+yJ2IdxyU+T0LEYx70iccQyz7IQ0V?=
 =?us-ascii?Q?ZDGuMphD1WEzQQbK7IhcH5pAoEoKz7oWG6NmrHmt5kR51TuZJrjMmgYxrt9s?=
 =?us-ascii?Q?7kbCpw3MZQVsAJCGQr0ZQcXjztayXtbevwh0HQVt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d7619-330c-43c3-9b30-08dd6cd0e1a7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 01:44:15.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i7Q0HT7yHGE75SBDV1yxUiC4bZYGO8TY6gieTOja5Alpdf/AwLn1OUC9SoYAt4LcFtNZPePmArSEF3Kr/wBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
X-OriginatorOrg: intel.com

On Wed, Mar 26, 2025 at 11:43:58AM -0700, Chang S. Bae wrote:
>On 3/26/2025 12:35 AM, Chao Gao wrote:
>> > +	for_each_cpu(cpu, cpu_online_mask) {
>> 
>> for_each_online_cpu(cpu)?
>
>Yes, it looks equivalent but shorter.
>
>> So, how about:
>> 
>> 		if (cpu != cpumask_first(topology_core_cpumask(cpu)))
>> 			continue;
>> 
>> and dropping the pkg_id?
>
>No, the pkg_id check is intentional to prevent duplicate staging within a
>package. As noted in the comment: "The MMIO address is unique per package."

The check I suggested can also achieve the goal and is simpler, right?

>
>> > +		rdmsrl_on_cpu(cpu, MSR_IA32_MCU_STAGING_MBOX_ADDR, &mmio_pa);
>> 
>> Note rdmsrl_on_cpu() may return an error. please consider adding
>> error-handling. Is it possible that somehow one package doesn't support
>> this staging feature while others do?
>
>rdmsrl_on_cpu() -> smp_call_function_single() -> generic_exec_single():
>
>        if ((unsigned)cpu >= nr_cpu_ids || !cpu_online(cpu)) {
>                csd_unlock(csd);
>                return -ENXIO;
>        }
>
>This error condition applies to an invalid cpu, but since the function is
>guarded by cpu_online_mask, it should not occur.

Ok. I misread rdmsrl_on_cpu(). I thought it would return an error if the
MSR doesn't exist on that CPU. But that's not the case.

>
>That said though, ignoring the return value may appear to be incorrect.
>Perhaps,
>
>  err = rdmsrl_on_cpu(cpu, MSR_IA32_MCU_STAGING_MBOX_ADDR, &mmio_pa);
>  if (WARN_ON_ONCE(err))
>        return;

Looks good.
