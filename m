Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B1256C93
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311374; cv=fail; b=CxMYU1lRevTUN28e8uqFmgWoRl2Q0K9byT7tE4XiNHRJyrhKq7rCVIIjBnSNkcblwcHidKQzihx2z8GfEXVModxNbApPDqF40HR4NB3KWjxIrXAHHWlz6kuRjue+LpjaCF32phTh5UvR/E6zGFaCpQuJPGumRPOu4n2pntMCGYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311374; c=relaxed/simple;
	bh=7BprlczH08Gf/1DrnOehLNoV+8baZMy4N/1hsKcrQ6g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UThyB1/1x3lRb9/uEL0L8CqASAoZpVwEDmHfxLz/QraX6Gr/Y+n4Rnpj7G3Gug/EHB86DHE9qlWmvg4GP++s0OZgHHNZuusE/lMVbpGMaeBWKM83CLS1ZBuvAUkN0OdskstNQZjHw5yOaDALKWiGi4EqfO1n2QRHSbvBoQv9xds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjgxFLxs; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjgxFLxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745311372; x=1776847372;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=7BprlczH08Gf/1DrnOehLNoV+8baZMy4N/1hsKcrQ6g=;
  b=DjgxFLxsW50eeKboEia2UL1rOy9IrSuZi9l706tm3ukbBfpQIeMlKasI
   Ofwpaviv9DfyJQ0fnQNx1XLz2yE9uMz4hl2Tl3t+AjW9rPdt+FaFgxV4c
   Sohp5+0uTuypy8oBbX477UMfApyzzssR6U8Iu8mKljqCFroYxmKMAqJp3
   8W/Ef4O9+NyiAeSJHFuYpF8A3o/3GJ7vDVrRJnexygglcHaLE730BFn20
   Bg6LuVP8KntQgopBDOa8uWObowD02stIesCJA35KpmsU1YmWGSoyEjCUm
   1Cgpj1nQHiDBszmVYueGCDJgRcptx0q6E4DnrYGEj7EaF9m8XIajm4huG
   Q==;
X-CSE-ConnectionGUID: URLMg6B0SlCSJrjYGBhyEw==
X-CSE-MsgGUID: E6JwugdJSteH7cxQXM4dsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46775261"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="46775261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 01:42:51 -0700
X-CSE-ConnectionGUID: oRh/sNsGQCmJSIVDnfvOAQ==
X-CSE-MsgGUID: 5vlb/pKpQC+fFJ/k9r9j3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="131863589"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 01:42:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 01:42:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 01:42:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 01:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJSLk6dF2P1uQBhljZlhE/tBeT7/lh9BAtkHId4VaFGLzPI+3AJRxK9Ny2rrWP8WY2R4VHFbVqc1XmgYhywAZZtt8BQ+CzBCx4IRiO/rQfqSrXOfol8q3SrrwPF4kTWI2PbWwnXVoky4q5GLWy5oCCJMiRFxx2KVgUKBgXkjzcc0dwiOkRX8xNT6ylBqj/vG14JyWnw/ofiljJOCEY5bLdEZezPslUY8iOXAtvxx45Xdvdnt8pgNLpN9M+mg3PL3fgcgFqwpxW03cPrIS44fDiFTr00223YKFr4KB9i+EpYmTMi6wdBOJuxbzJ/Wl4/IbvHMbz12rKgFCkyjDB99bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZhoX6emx/5uPIvUjum8Jl4GeUU0/Dx3QXRsJJde2xc=;
 b=LN1SgMs7/+XLKNE7ibVMo5jbnLaztOIqVGsGqlkITXVNXNVHyHnCUJEnV9VBRzk5RRc5InjfQfuGMr75nzIMPng4ZvIxxLmhfQGF/hp+CPMr4W3+fplVnyOpDW4k9NYgbVcZjpZGwvjbKlK1d/sp6i3AJCo204Lj76GW8jrKdwAD9oPzcLlfU+Wmzhjy7amoe9DZ5/vFhhTvwmMUGoMBH5zSzrwCU029Xl02BY9Kw4p3Bo+JuGdOBXyimbUFk10woqTUbQ56OD1uB2XovE3zxW/3Tai705BWInONLeePPJlsoSsQ7sgTZMos9qXG5DgOg1yjPPUNVYsbyG0vpIbieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 22 Apr
 2025 08:42:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 08:42:18 +0000
Date: Tue, 22 Apr 2025 16:42:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney"
	<paulmck@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng
	<boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, "Josh
 Triplett" <josh@joshtriplett.org>, Lai jiangshan <jiangshanlai@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mengen Sun
	<mengensun@tencent.com>, Steven Rostedt <rostedt@goodmis.org>, "Uladzislau
 Rezki (Sony)" <urezki@gmail.com>, YueHong Wu <yuehongwu@tencent.com>, Zqiang
	<qiang.zhang1211@gmail.com>, <oliver.sang@intel.com>
Subject: [linus:master] [ucount]  b4dc0bee2a:  stress-ng.set.ops_per_sec 7.5%
 improvement
Message-ID: <202504221604.38512645-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a27c384-18e1-423b-b93b-08dd81799726
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1XNjd1OZ/gDi6EKRg/VQnwarZ/KXRZ1L/qNoFr69QnpKiCmGiekB9LZ4O1?=
 =?iso-8859-1?Q?0r5d2IR/abE5ZMQhyOfvtoAO+wTj4Y1n+0AubkYR7QuqIwLreV9s/UzLFg?=
 =?iso-8859-1?Q?/ghnUfJ7bSEhQbWlRyWEGqcwCmRPf3XJPujT7Fw02zS5/0aWsX3Sdmm0ze?=
 =?iso-8859-1?Q?BPwR07sule9DpS38EIZDtzva04TJ0lk5YNfwgCk/nRE/jTJWjh+pVHemGl?=
 =?iso-8859-1?Q?7gBH+6TozOIZ6InDSTMO3jajetmQi6tcfK+qtFmJZBTp3zQuRa0VAoforQ?=
 =?iso-8859-1?Q?Ful9IOba847seChNje7F9NiMQTRa+48jIwCZyG/Bv7eHaR2guXZrHKRFHr?=
 =?iso-8859-1?Q?+33VOQy0iymPg3DFj22tlycQudFvWtn2OCjbqUgWi0xxmSAXA1hoZi5DUP?=
 =?iso-8859-1?Q?B12C6MfmGDAglGG66WnAiocYEr+V4LgJGXO5ep88sJmUvHXU3xUOAlmDY9?=
 =?iso-8859-1?Q?ToiCkxeWcKee551g04XMcq+NySbDiYWA+q2ZCdCDNEipADLJxgclYmI/eE?=
 =?iso-8859-1?Q?S9HINoBbnJfHtYQFENlmxq0LQxhBsoyDLYqi18LymtwRj5OMVkz7r4LsKt?=
 =?iso-8859-1?Q?UeZ+NLlqgCmGadfdzML0Ur1YwmRi2124DT13QeOVfO2j8RY5yWgTjntcFg?=
 =?iso-8859-1?Q?chLxEDHnJDozVpmDM6Rs1+nTKEo5OMnYZC8C4CV9mhEvWyFsbAR7JRIxq7?=
 =?iso-8859-1?Q?+m7K+wHwNyyrtj6MhYsDRAoUbtl9n9IsjwLiAffmP1IdH1MjhyIj7Vt8kn?=
 =?iso-8859-1?Q?vImVaqs4HfARztBVPhr1nkPCpjdJhiyxlWIbQsjFcUlq2AhAn01X+/VbPG?=
 =?iso-8859-1?Q?b4sFoV6CxRrnZUiJPrmtDRHpON1Y2hv+LCmgWaZFRnL+2885iQJLLxcjNm?=
 =?iso-8859-1?Q?ktcZBeEtSJbaTLI06HQR6RHoIpTKiXqKyBc53fIR26Ky/4SqrK7nMoKb9M?=
 =?iso-8859-1?Q?dnCLoswM75F1DwZH8eu36ttvPV7JJHzRslyx+DTE23wTByXMlO2kWdM8e+?=
 =?iso-8859-1?Q?pxgznu4YJNjwy07u6GqudrR0YC2sflkEo/q/EfQNbqBdMeRIPs4jfJPiAW?=
 =?iso-8859-1?Q?ERJOfIweOsQ0h18DlqvSUSiz8gwoUpXa0Isweqo6cG3AXahzpz1xiisPZY?=
 =?iso-8859-1?Q?szzNEvU0UTk1X49eKTB+zQD7uauJKA7FR/DPSUJzpxJZALDtjBDMVAWW8s?=
 =?iso-8859-1?Q?EmPGGoC3txUfUt/RgFkglviQYwpLXfxnwhBmQ/llG+gC5YGFDklsWbSJ7X?=
 =?iso-8859-1?Q?ZWsKpCgQF8br6/iLtp88XTkTBvdse1S4Gskm9vaZJRfVJvZbNSUEtKWi5t?=
 =?iso-8859-1?Q?5G70F+FkvdxsObMMi/zXtwG+92QZ0iz87FsEeuLXUcOvFkGT3gZh8X55Ba?=
 =?iso-8859-1?Q?O5nrvrvVgt0/B0yhT82Du5xFqYHEUdlGAmYH5YBz33rBDJcvlkPyYtfVYw?=
 =?iso-8859-1?Q?RN2c1zKL4hip54oS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AwmSlIh+f0QoQgwFK4oGipbfJHz3sHlhwVSyrlv7Tl2njXlKAaxHIG3+Wg?=
 =?iso-8859-1?Q?XhnX/ZJqa4FPScmtLaDF1lmZBQ4Ogq+VdJ6JjVKTiL9K3g1o1lI/UMmvS0?=
 =?iso-8859-1?Q?se6dBXlelsLRalEV8vgWClmPNlss/RE2OGp/NdieJHNaH6wpZJ+N6ENl/L?=
 =?iso-8859-1?Q?mNr01uhw3S4pcMO7ZRWsn33n9//fB7SFkI9e8ntInP3WQUUzZrwuemF+72?=
 =?iso-8859-1?Q?Gt8KQevETAqe+aRIfUSyBv1PSRfqyBxM8fm0ioQZNPk4J8fn2zPcDDCWB+?=
 =?iso-8859-1?Q?cK8hMCl7JqIxYJaYwjwCpbXPhF0+XgTM+7uruIUS0+Mh9zn9Tykdfcrfaq?=
 =?iso-8859-1?Q?tsPbnW+HuFQYOXl8432V8CQK5Y3qhvxDyBrGiPVAR6ovLHDNEqb9tm3ZSW?=
 =?iso-8859-1?Q?XLFQNXWPvbnJ9UqkPKTHArtRAzVISWY6VU6qbUV5MjSrLjNHHMB8fpygBr?=
 =?iso-8859-1?Q?CKh6rEnvI/V2Mpb//Es6sIT3A7P5gYosjjpXLm0QogbWNc4E9oeXMVxXtN?=
 =?iso-8859-1?Q?ygMdQ6OJLXYxeZbujkB8svKrbaN1dazaArYdjc46ZxG4j8V1V3TMsZne6W?=
 =?iso-8859-1?Q?Oj/HPxd82UHprkEo3qWCB0IX0WkcK+xsZRaUabZKkgXW2L7X0oEJOKe6IM?=
 =?iso-8859-1?Q?aHRvhWAsTyxvtB1TW63Vb+LfMDIUR4ukcx0wysPrilX+F5AFRP4ETZyjLK?=
 =?iso-8859-1?Q?MS/3cnE0RjnI0zRYY2iEYHcfdmBsJNT+5eCjUaUlP/a1OWPZyNdlajwKz9?=
 =?iso-8859-1?Q?98FgwB0HWDge8ZejM7BmXoEPRZ9F2Nm3Ep+MAlrVr7igF1+wwrRPDrDJov?=
 =?iso-8859-1?Q?EILLZhGzvgj0GjtW39CF87uhDg/fkkeMMYGH2gM8h3AdjmHcp8fDoUPvPY?=
 =?iso-8859-1?Q?PSP+FO+Xl7oo5WPOS1PAGny+0elXN+9bl4shnrPJ72s2o9gRyopX8j1kzN?=
 =?iso-8859-1?Q?hETwMZe6E3yqaJPNH2kI3j2ljkybWeKvPcPfL1a5urj+kRgs0ixyd66XMH?=
 =?iso-8859-1?Q?wYB02obVSJ+yqrEH2wYAa5K7COU02DSSPs3E6diLIAiI09wn/gEWqjErxv?=
 =?iso-8859-1?Q?iYP6mzQecih5nrtu4sdx+u0abvb66jsqyP5bbOdUYE7esHSTe1nJq39/v2?=
 =?iso-8859-1?Q?znWLeijowVlCR6hHt8iqQXFbmB3MKuf2Bk7ToKmd8l8A1tUbF0vikMCUg5?=
 =?iso-8859-1?Q?R5uEiAgu8Z9EqogZANzk/mWijomYFFtJH/fzoCaistYrms5f8UZ4bI58gi?=
 =?iso-8859-1?Q?+eJNdwQ3Juye4xCVI400fkEVlyPHrdZez8ADz2uyVE+6m9n961eEAqv9fM?=
 =?iso-8859-1?Q?xcRrxBhPIdAAiOKq3MDnqspkgf6epKiR9B44hMxherXuCRaXxTqiRGWJR4?=
 =?iso-8859-1?Q?fC2ctBIN2GrQ0KABnqj0lJNl9CBUwmKa+XcHRPaMtf+jpD5tPn2BTWVlnx?=
 =?iso-8859-1?Q?VQXnCBrWLXi/Ji6hF7lXKMVJX23eUUxG5A6U2uPgPTaiAMaqe/kK3iCOjC?=
 =?iso-8859-1?Q?qLqLZA5qkZiMkBzpOSFsQtD9/hQaQZcV/d+MgaCRRGKXID5II/wl3tBclZ?=
 =?iso-8859-1?Q?tepsWV6zqaKQ2y6f5obQoHOdbNIs1YTF46DlJEHIK1GKmJwJZKn/PJnLPF?=
 =?iso-8859-1?Q?5F0wrX3cV011mZG1dE9gA3dPndCCYrDfJhF+BHjgoxMF0VlPSbTBvj5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a27c384-18e1-423b-b93b-08dd81799726
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:42:18.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Axrq8q4L12OeGS1yf/XeTzAtweVG8/c6CMhfzp9GtgwByVVW+xxuWiZR9rxh6ksKoZGNj169FTSu/nydSzYcPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 7.5% improvement of stress-ng.set.ops_per_sec on:


commit: b4dc0bee2a749083028afba346910e198653f42a ("ucount: use rcuref_t for reference counting")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: set
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250422/202504221604.38512645-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-r02/set/stress-ng/60s

commit: 
  5f01a22c5b ("ucount: use RCU for ucounts lookups")
  b4dc0bee2a ("ucount: use rcuref_t for reference counting")

5f01a22c5b231dd5 b4dc0bee2a749083028afba3469 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     10.78            -1.6        9.22        mpstat.cpu.all.soft%
    150.17 ±  5%     -54.4%      68.50 ± 11%  perf-c2c.DRAM.local
     14.70 ± 13%     -18.0%      12.05 ±  8%  vmstat.procs.r
    235759            +7.0%     252328        vmstat.system.cs
    229993            -1.6%     226301        vmstat.system.in
      1456 ±  3%     -40.2%     870.70 ± 59%  sched_debug.cfs_rq:/.avg_vruntime.min
     56228 ±133%     -81.2%      10577 ± 72%  sched_debug.cfs_rq:/.load.avg
    605295 ±186%     -89.2%      65458 ± 51%  sched_debug.cfs_rq:/.load.stddev
      1456 ±  3%     -40.2%     870.70 ± 59%  sched_debug.cfs_rq:/.min_vruntime.min
    259.95 ± 14%     -33.5%     172.79 ± 21%  sched_debug.cpu.curr->pid.avg
      1122 ±  7%     -22.0%     874.99 ± 15%  sched_debug.cpu.curr->pid.stddev
   7692146            +7.5%    8265701        stress-ng.set.ops
    128199            +7.5%     137758        stress-ng.set.ops_per_sec
     28263 ±  2%     -34.1%      18622 ±  2%  stress-ng.time.involuntary_context_switches
     77524            -1.7%      76216        stress-ng.time.minor_page_faults
    750.50            -3.0%     728.33        stress-ng.time.percent_of_cpu_this_job_got
    416.18            -3.8%     400.28        stress-ng.time.system_time
   7083512            +8.2%    7667679        stress-ng.time.voluntary_context_switches
    141813            +4.2%     147721        proc-vmstat.nr_shmem
   1695593            +2.9%    1745184        proc-vmstat.numa_hit
   1462962            +3.4%    1512676        proc-vmstat.numa_local
     99906 ±  9%     -23.1%      76793 ± 17%  proc-vmstat.numa_pages_migrated
    321573 ± 14%     -32.0%     218744 ± 22%  proc-vmstat.numa_pte_updates
   2547220            +3.5%    2636020        proc-vmstat.pgalloc_normal
   2441293            +3.4%    2524816        proc-vmstat.pgfree
     99906 ±  9%     -23.1%      76793 ± 17%  proc-vmstat.pgmigrate_success
      0.19 ±143%     -96.6%       0.01 ± 49%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.32 ±133%     -72.7%       0.09 ± 16%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.39 ±135%     -98.1%       0.01 ± 52%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    240.34 ±217%     -98.5%       3.55 ±  6%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ±  8%     -19.4%       0.01 ±  8%  perf-sched.total_sch_delay.average.ms
      3.02            -9.3%       2.74        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.__do_sys_newuname
    114.29 ±  2%     +18.6%     135.51 ±  2%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    128.00 ±  4%     +14.1%     146.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
     18816 ±  2%     -16.6%      15697 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     99.29 ±187%     -98.1%       1.85 ±117%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      3.01            -9.3%       2.73        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.__do_sys_newuname
    114.18 ±  2%     +18.6%     135.41 ±  2%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    195.32 ±189%     -98.6%       2.64 ±124%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      2.37            -1.8%       2.33        perf-stat.i.MPKI
 2.841e+09            +3.2%  2.932e+09        perf-stat.i.branch-instructions
      1.47            -0.1        1.40        perf-stat.i.branch-miss-rate%
     26.62            +1.0       27.64        perf-stat.i.cache-miss-rate%
 1.193e+08            -2.5%  1.163e+08        perf-stat.i.cache-references
    243399            +7.3%     261109        perf-stat.i.context-switches
      7.74           -13.1%       6.73        perf-stat.i.cpi
 1.006e+11           -10.6%  8.988e+10        perf-stat.i.cpu-cycles
      4164            -7.0%       3871        perf-stat.i.cpu-migrations
      3253           -11.7%       2872        perf-stat.i.cycles-between-cache-misses
 1.378e+10            +3.1%  1.421e+10        perf-stat.i.instructions
      0.15           +15.3%       0.17        perf-stat.i.ipc
      1.03           +10.3%       1.13        perf-stat.i.metric.K/sec
      2.29            -1.9%       2.25        perf-stat.overall.MPKI
      1.65            -0.1        1.58        perf-stat.overall.branch-miss-rate%
     26.43            +1.0       27.43        perf-stat.overall.cache-miss-rate%
      7.30           -13.3%       6.33        perf-stat.overall.cpi
      3189           -11.6%       2818        perf-stat.overall.cycles-between-cache-misses
      0.14           +15.4%       0.16        perf-stat.overall.ipc
 2.794e+09            +3.2%  2.883e+09        perf-stat.ps.branch-instructions
 1.174e+08            -2.6%  1.144e+08        perf-stat.ps.cache-references
    239347            +7.3%     256763        perf-stat.ps.context-switches
 9.894e+10           -10.6%  8.843e+10        perf-stat.ps.cpu-cycles
      4096            -7.0%       3808        perf-stat.ps.cpu-migrations
 1.355e+10            +3.1%  1.398e+10        perf-stat.ps.instructions
  8.25e+11            +3.2%  8.511e+11        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

