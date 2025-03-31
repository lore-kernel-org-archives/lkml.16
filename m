Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EDF1CF96
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743389895; cv=fail; b=SlnmatEU6NxgFEqOs0rQt6kPrqI20dKB0HlnTB0QxBYFcRUB3WnE4HIa15ZB3KBSL2sXSd3aPFtPytUlI7cVDshVI57GHfiVuSkMEsH9oG11Y2pyi5kJwkE5OaBR5/JTBxmolyxgi3pRFOg76vzds+rQvc/iK54bezuddlFZOsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743389895; c=relaxed/simple;
	bh=j36HwmXJU7aFblRvRVSEObBwhNYFTS+1UWA7b376mb8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pz/R8A5xmbKNU6Ck06K+D+uDVG3EM3tfA6HpGYUoEw3/NH5rAvvw2RbjlQ+2qamA1VevDsUz1wHaeBk1sFz079YdXfMUa1oMwGyAyInDZpDarjEww0Y2J5z/Kwdu62PiTs2Dag0GRYgRqkSgSKegbb33jSl6x6CfZCgt1pxX4uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crV6eQMq; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crV6eQMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743389893; x=1774925893;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=j36HwmXJU7aFblRvRVSEObBwhNYFTS+1UWA7b376mb8=;
  b=crV6eQMq2GPfvr1aqy8HUQ+UQclhD2WGAAN4BBiwzM3SfiM+qo9qD0cq
   SL16od24iictLrOyaezAfeUa5yfmoDz6LFf0XjvJ7zOwIz0FYUfyGVD24
   bsjg6ntPALK0GORHT3JmhBFWiKQM7Ep1tnn1BFUend5Ezcrzngsit5aMw
   JmWjBaNXk6XDrfuHhswh0C85oALOYeLGIWUtq1YOBBBe2r9OyqxBrUq0m
   cQ9kR69i7IkifrY7/F4bRf7hPjJsRtYs4y29QfJivuYJk17v7cYRC3QDx
   sd9auPQhREXVobYErMlajriI7z2oRYNB5HtcmPLuH75nIdFcn7rpZfhxr
   w==;
X-CSE-ConnectionGUID: CK7KHFDFS5eF02AHgmYCDQ==
X-CSE-MsgGUID: 2avknppsTJu9raSG8WjHSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48453860"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="48453860"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 19:58:13 -0700
X-CSE-ConnectionGUID: KtrFISD9T9meA7zDVasHgw==
X-CSE-MsgGUID: 0GX+eAWWTPq9o3LfVvOzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="126774630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 19:58:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 30 Mar 2025 19:58:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 30 Mar 2025 19:58:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 30 Mar 2025 19:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU7aHupRptf5Qq200Ctdj6NIqUmFyV/D3T4Vh9u3VLV7tD4mMwwawSRaaLCyTP2pQaknpZII+tIyCar+sCegVAbGrTMsVXZ7kDxfsLivehI/CwIRBI2dhplwUiJeRkWeV/L1JpHqlB45+3pWfzn054vrmCYDi3V2PFBRqwTcpoFaMPURFRgTxR8rJH4HLz67GjCUcl/7JgvdlZZofufbUNpVuvlq0SX6sDmqJuftWjo9w4D19fr5/xK3uJz04ByacTTW0COxUS+muL+DZBONnCC91Y2TkPsglxOADxVtL4WnsA4DHbniY7J9nHa/NpqliaupnmrPhAwRGvltV/em0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw9ErBc1OOufHSHijGVS93PVaxCU69vemvq1byY/MkA=;
 b=kk1rhdN0xezeNoKwBAHTa8Av/WZAS3O3Js7vvAEjcS+JRKgBCAgB4DoQQmXTbRHoHyg19sXATWfI9ZAUbGg04dQgkZzfSF1SBqIxKfXpIgk0Usk7WPJalcJhn25DTgUx3YdUimfCsoRS4XvSsYX5V+n/BGE3iYuUfBndhV7S/3ifpuXaYYMjRaSsTuGJgCeqAbaJNj5mfwh5mxZ0LZAHBvqmdMrypcOLWen2O2Y9TJUr9JF+nm40yJiMpujLJtWDvqa2YPq6vyvWfdfJuTYicMts+u/1Vj429+lxdpEXhmJ+rL7fe7d4d0BgX3qQRA2+eTK6Yq4WRaEYOn5prlftYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 02:57:54 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 02:57:54 +0000
Date: Mon, 31 Mar 2025 10:57:45 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Christian Brauner <brauner@kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [wait]  84654c7f47:  reaim.jobs_per_min 3.0%
 regression
Message-ID: <202503311019.7d50fa1b-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 16921056-58b6-499c-39b5-08dd6fffd520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o5QBRvegQSXPL+Ig25kLH5JJKfYKGFTZoQPkzjmfxOHQ7A1KoYIS4F2k0R?=
 =?iso-8859-1?Q?jVnqHvIiwhpAX2hu/1rG6V6HUMQjUA/bFEcOYKBdyyhBIKfouim0HMjNg7?=
 =?iso-8859-1?Q?8aqJALvGY5YLfDmzI/7L8i32mVkbxihggsvSZkI2y9vxQDPyQNsLqsXpoa?=
 =?iso-8859-1?Q?WZR9B3wNVYRVxDg0WO7HGmS+CfgdM4bMtMNbYurI0m5P/fCcYSxvBX+MlF?=
 =?iso-8859-1?Q?AKkJEUHAvGNV01EZQ0ZznYCP3gKlLG62kc7sQ94zX5uXtUe2Fwk/vdOaTM?=
 =?iso-8859-1?Q?a19X17qJX4aAPSSgGXsqJ8fPEYORMSeZ83yK5R1o+okYKgPWuS1tlC/cnn?=
 =?iso-8859-1?Q?mFXQrUiCgLSAnwAa7B4XodD/YBqcuEdCa8oqzCQazg0YJvMOvsyV+OIZnY?=
 =?iso-8859-1?Q?A5i2rbwr+9qCP+vxCo+JZ8MLoLcv9pqc6IlIWXcoANhrP+Cf1w7OKFgSGz?=
 =?iso-8859-1?Q?VhEbdlgh1NvypyLP8XGnsxqc6X/g0m+JsnZIgvXAS/kmDE9R2tel6XGKPp?=
 =?iso-8859-1?Q?jBgMDppD9rRHoM4SpTY8NcAGBS5wHb/iDkI2XfT1jxdbW+i6Bz89tbQE+l?=
 =?iso-8859-1?Q?DEXxz+lVCna7JwDbhwe7w0aSwGCe3TnWSFzAbiqz9VvP5/Me2haVeWmF0j?=
 =?iso-8859-1?Q?jwOkp3yWcmRlXNs0C1njcgfBzlmL+wV2vWQGOTFCEerlNFYSFyRaUD4OBg?=
 =?iso-8859-1?Q?d9gyDqFwe0tAJg2+Ly3VpPGTe8GhOshwZk+eN9R/yV1EbaIQhGyt6rYbSf?=
 =?iso-8859-1?Q?MmtrM+PvWGrh28fSj+U3iT2+F+xFiVmP+VBP+E3a4UJOEQwTxPPx3H8CV9?=
 =?iso-8859-1?Q?Cqd2S5iPcfhE63by3jS2ucO8aeZ60e5+yhRdLXwj+737wmUJANOJBnKk/J?=
 =?iso-8859-1?Q?8kO79i5AFTQYgRes1F3OMrsVhgHWhg9/9GVSZbnhiUUBRHNqBjiTc/OSBD?=
 =?iso-8859-1?Q?NwLsME6XRdrEMY4YSeIW/vsy1BIoPrpHyDvpdMjPOw/+8QTmEpbYjNwMo9?=
 =?iso-8859-1?Q?k2+3fbRl8BVuNQWjIX4nnWPf+QcAAYqJH6fltUkGsmBNmaZ4BQFsx/NDPg?=
 =?iso-8859-1?Q?e8TVFk4DsEXUCfU/VDDIUJwCOnBTIk5KWs1mm3vnG1cb2OvBHOcVPO/6wr?=
 =?iso-8859-1?Q?xRssLYFevhkip3/RXtpzO4vij8PeWbK9pzcGreXcm2F5MXa/nKkT3rKYPm?=
 =?iso-8859-1?Q?uQOVGCB6rtQQGAd0CsoE+VeRQUcgJyA6ZYXCDmPhE6jXBMsCW39RV0KHHr?=
 =?iso-8859-1?Q?uXAAL1+WGydTJ6Zp0gXEJWOHoXn/TLYwtQr42gdl2ZjS+5YWDsB4yFzZPN?=
 =?iso-8859-1?Q?brLRFytTauMQ69jzkGMTT3LvGESncwgegFBFQgYMTmprPfyTisfAFvWtCs?=
 =?iso-8859-1?Q?VgmVjWvbM0AEfGrObru4GfQWHgMP9Bdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kew+mcv1C+t4E6SP13fetM6Zdk7N9rCbqsL5AH65uTkOdYhBokJ3k5jd1S?=
 =?iso-8859-1?Q?dXjNnMvXto5tXHWo5x0X/zssLomC35NfFxsyyQH04AuGX6lrd8hTQ4tpM9?=
 =?iso-8859-1?Q?PHOz2zBde27hReetNZ6zkMzbNHKigceed8UTlA4E542MMa7kUNmbOJnquo?=
 =?iso-8859-1?Q?RySINBc7yvBjEr7IWN4o0MFKQjxMpVw7mCYl0toJS6CFQ1a3xllmSME64+?=
 =?iso-8859-1?Q?EUlf/cg3skr0/5G1GIO4PNNWVm2HFE318yyAXr5CPKG8wr2U28rdLficgg?=
 =?iso-8859-1?Q?T+AUGOhzIg1CA1jRQxrMYUzAxgTD0VFF5HVQyMdLCR6tQ8hlJ7zXWAHPgH?=
 =?iso-8859-1?Q?fjjXUEiPtWs5HlwANX38W0kanoc+M6g7Pq0uCYw8xQebcSj63vlQWdlVnK?=
 =?iso-8859-1?Q?3FYxyiBK1bIwexlt5vTfU4Rvh+mbJbxnjwhnSiGq7vD3SLj1vdVXl4CB8D?=
 =?iso-8859-1?Q?wHVjAyoE8bW0Ztd0qqRdwoz3+0biV08NgGVEylToOhnWqgrJHKTbIuqV4j?=
 =?iso-8859-1?Q?effBo6wNfPOJ2H5KpHz+LvczG+slfWOUy4vWpFOTcFGz4hSFV//daj5zeX?=
 =?iso-8859-1?Q?GPp4H6g64DCuX9HKepQ2nkJbnbxy28QXYl49m82brkf6FL4/J55zJUcpnC?=
 =?iso-8859-1?Q?etHjZudnY5sh0Ri6D35nGFEoywhcaEnoqoHamg0z7HuCQdPUWwPTJQ4y2e?=
 =?iso-8859-1?Q?+jccCuUnNGIhgAUJ/p3VCs1HnvcPoThQMh3ZtM3BvuONFOmruc17DDj3oq?=
 =?iso-8859-1?Q?GHic5t2msm3+dEInslZcjHHW1ck5usUvgOiMfAc5NfGJzpVv5stun7ujU4?=
 =?iso-8859-1?Q?fGB7Qs4aKEu75zyp8Lg7DVhXtODYpCk0hgS+WsFFwzhC48A5kLcob21VZi?=
 =?iso-8859-1?Q?vhB7n2uQPse7khEpQ7RjI+fFL9jANGTIiHtyEKSPiSwahSOapLk9XS0nQH?=
 =?iso-8859-1?Q?8nSXn3uPJDqxwRGYG+cpXK00qde0qlMtFYn/TAl3BndzPKZRQ+2hdDwG6Q?=
 =?iso-8859-1?Q?Qgc1BMG0KM9w/7fcE1leXmD0uXJGHLzawlLFO2WyAY6+QxIqbODkcIalJB?=
 =?iso-8859-1?Q?i2TLguZRTqphX2f6+L9hcnuL7ryiL7auZDPQwc9M54cp4c/SU5IMrsDCbQ?=
 =?iso-8859-1?Q?lVMPf7Z3FxOgMEG3a5iYIM4ElSz49ugwEOVAHuAtDwNAzGJNyStWbWDZqK?=
 =?iso-8859-1?Q?1qdGeqkAgaSve6b76TThEwBb3BebZ4u0Nd3QyJkavFVfk7N48S+ua+3LkW?=
 =?iso-8859-1?Q?xVqEcl0c9vfJfyfAW5glD+QTUXHeImEUFmAztJESB1JzxROdJizWXfGPoU?=
 =?iso-8859-1?Q?9JryVpny9YpdU9BVoEpgYs3N64AtvOw7qVjMrxChP0nz7taOAx++ID7U8O?=
 =?iso-8859-1?Q?iG67GHJxK9nPFxEJO046BVo7p+oT1W9vw4iZ6zLxzqDtJeaJ1UD1xwI4lA?=
 =?iso-8859-1?Q?tOKest5xzm0v5pSOozNaC5uziKBL27JRX6RnkIB9m3JdIPFtXMucui4mMP?=
 =?iso-8859-1?Q?H4ZAQhihfSNXRnJHKobX2hzOJ6mA1E09nRK2XshpdE1P3adNAMKjmN815r?=
 =?iso-8859-1?Q?Lb5gD0pN5SYmqZ63X0Fu7vlnGrcx/P6Ju6orT2MNjXtHy8sTg/ZRTsgMf7?=
 =?iso-8859-1?Q?9Nalesl0Zbn5bII7a0hUsg3INXAOalLQMF3IjTp+8w4cNXgnTcUeXz/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16921056-58b6-499c-39b5-08dd6fffd520
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 02:57:54.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9JpPsBEQu8h5oKf3HQvNkyAYeVjmdq6E8runyBrTm08h8EyQTd2Id4zHDR5ksy1Ro5RJgMyP74HJgEJWOnldA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.0% regression of reaim.jobs_per_min on:


commit: 84654c7f47307692d47ea914d01287c8c54b3532 ("wait: avoid spurious calls to prepare_to_wait_event() in ___wait_event()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95]
[still regreasion on linux-next/master db8da9da41bced445077925f8a886c776a47440c]

testcase: reaim
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
parameters:

	runtime: 300s
	nr_task: 100%
	disk: 1SSD
	fs: ext4
	test: disk
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503311019.7d50fa1b-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503311019.7d50fa1b-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/1SSD/ext4/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/300s/igk-spr-2sp4/disk/reaim

commit: 
  46af8e2406 ("pipe: cache 2 pages instead of 1")
  84654c7f47 ("wait: avoid spurious calls to prepare_to_wait_event() in ___wait_event()")

46af8e2406c27cc2 84654c7f47307692d47ea914d01 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     20.32 ±  2%      -3.2       17.17        mpstat.cpu.all.sys%
     54.24 ±  2%     -11.8%      47.82 ±  3%  mpstat.max_utilization_pct
    178465 ± 12%     +26.3%     225351 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.stddev
    178465 ± 12%     +26.3%     225351 ± 10%  sched_debug.cfs_rq:/.min_vruntime.stddev
     10320 ± 15%     +36.8%      14113 ±  6%  sched_debug.cpu.nr_switches.stddev
     75.63            +4.3%      78.87        iostat.cpu.idle
      2.05            -2.9%       1.99        iostat.cpu.iowait
     21.28 ±  2%     -14.8%      18.12        iostat.cpu.system
      1.04            -2.7%       1.01        iostat.cpu.user
      7205            -1.5%       7100        vmstat.io.bi
     42.24 ±  4%     -10.1%      37.99 ±  5%  vmstat.procs.r
    268438            -4.9%     255319        vmstat.system.cs
    176126            -3.0%     170917        vmstat.system.in
    463695            +5.7%     490115 ±  2%  proc-vmstat.nr_active_anon
   1309918            +2.1%    1337119        proc-vmstat.nr_file_pages
    269292            +9.9%     296064 ±  4%  proc-vmstat.nr_shmem
     65965            +1.0%      66627        proc-vmstat.nr_slab_reclaimable
    463695            +5.7%     490115 ±  2%  proc-vmstat.nr_zone_active_anon
 2.171e+08            -1.7%  2.134e+08        proc-vmstat.pgfault
    151.15 ±  2%     -14.3%     129.47        reaim.child_systime
      6.80            +2.2%       6.95        reaim.child_utime
    606391            -3.0%     588044        reaim.jobs_per_min
      3158            -3.0%       3062        reaim.jobs_per_min_child
    628950            -2.7%     611916        reaim.max_jobs_per_min
      1.90            +3.1%       1.96        reaim.parent_time
  50558551            -1.7%   49692848        reaim.time.file_system_outputs
   2051317            -8.8%    1871021        reaim.time.involuntary_context_switches
    164148            -8.4%     150417        reaim.time.major_page_faults
 2.155e+08            -1.7%  2.119e+08        reaim.time.minor_page_faults
      4004           -14.9%       3407        reaim.time.percent_of_cpu_this_job_got
     11615           -15.8%       9783        reaim.time.system_time
  34429088            -5.5%   32518423        reaim.time.voluntary_context_switches
 8.196e+09            -8.7%  7.481e+09        perf-stat.i.branch-instructions
      1.69 ±  2%      +0.1        1.78        perf-stat.i.branch-miss-rate%
 1.442e+08            -2.5%  1.405e+08        perf-stat.i.branch-misses
 1.015e+08            -2.3%   99100519        perf-stat.i.cache-misses
 5.171e+08            -3.6%  4.984e+08        perf-stat.i.cache-references
    272535            -5.0%     258840        perf-stat.i.context-switches
      3.31            -4.5%       3.16        perf-stat.i.cpi
 1.314e+11 ±  2%     -13.7%  1.134e+11        perf-stat.i.cpu-cycles
     31541           -11.9%      27772        perf-stat.i.cpu-migrations
      1274            -8.7%       1163        perf-stat.i.cycles-between-cache-misses
 3.997e+10            -8.6%  3.655e+10        perf-stat.i.instructions
      0.34            +4.0%       0.36        perf-stat.i.ipc
    542.30            -8.3%     497.24        perf-stat.i.major-faults
      8.47            -2.4%       8.27        perf-stat.i.metric.K/sec
    696934            -1.6%     685700        perf-stat.i.minor-faults
    697476            -1.6%     686197        perf-stat.i.page-faults
      0.02 ±  4%     -13.1%       0.01 ±  4%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.02 ±  6%     -25.2%       0.02 ± 13%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.02 ± 17%     -47.2%       0.01 ± 24%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.01 ± 38%    +134.3%       0.02 ± 29%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.do_unlinkat
      0.01 ± 19%     +71.6%       0.01 ± 21%  perf-sched.sch_delay.avg.ms.wait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__journal_start
      0.24 ± 38%    +558.1%       1.55 ± 98%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.42 ± 34%    +513.4%       8.72 ± 59%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.44 ±213%    +966.4%      26.02 ± 31%  perf-sched.sch_delay.max.ms.io_schedule.bit_wait_io.__wait_on_bit.out_of_line_wait_on_bit
      1.23 ±186%    +833.2%      11.51 ± 74%  perf-sched.sch_delay.max.ms.io_schedule.bit_wait_io.__wait_on_bit_lock.out_of_line_wait_on_bit_lock
      2.54 ±196%    +700.3%      20.32 ± 25%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.77 ± 78%   +1333.4%      10.99 ± 43%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.sync_bdevs
      2.42 ±235%   +1056.6%      27.94 ± 23%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
      3.76 ±217%    +668.9%      28.92 ± 23%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2.76 ±210%    +925.0%      28.30 ± 30%  perf-sched.sch_delay.max.ms.wait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__journal_start
      5.73 ±  4%     +16.7%       6.68 ±  3%  perf-sched.total_wait_and_delay.average.ms
    541419 ±  3%     +26.2%     683124 ±  7%  perf-sched.total_wait_and_delay.count.ms
      5.72 ±  4%     +16.6%       6.67 ±  3%  perf-sched.total_wait_time.average.ms
      0.02 ±  3%     -12.8%       0.02 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.09 ±  6%     -17.4%       0.07 ±  4%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1.54 ±  7%     +33.8%       2.06 ±  4%  perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      1.55 ±  8%     +53.9%       2.39 ±  7%  perf-sched.wait_and_delay.avg.ms.jbd2_log_wait_commit.ext4_sync_fs.iterate_supers.ksys_sync
    290.01 ± 17%     -64.0%     104.50 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    182.38 ±  3%     +14.6%     208.99 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.66 ± 23%     +34.4%       0.89 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_sb_inodes
      4.16 ±  8%     +21.2%       5.04 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.do_unlinkat
     19.47 ±  8%     -25.2%      14.56 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
      2.50 ±  8%     +55.9%       3.89 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_workqueue.ext4_sync_fs
     30.55 ± 20%     +37.9%      42.14        perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    146.67 ± 34%    +157.6%     377.82 ± 18%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     18593           +25.0%      23245 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    379.25 ± 13%     -46.4%     203.09        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     38979           +34.8%      52534 ±  6%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     38945           +34.4%      52357 ±  6%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20923 ±  2%     +12.5%      23539 ±  6%  perf-sched.wait_and_delay.count.io_schedule.bit_wait_io.__wait_on_bit.out_of_line_wait_on_bit
      3951 ±  3%     +17.1%       4627 ±  8%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
     35593 ±  2%     +40.6%      50040 ±  5%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
    170.83 ± 45%     +51.1%     258.09 ± 10%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
     33097           +34.0%      44350 ±  6%  perf-sched.wait_and_delay.count.jbd2_log_wait_commit.ext4_sync_fs.iterate_supers.ksys_sync
    113.50 ±  6%     +68.1%     190.82 ±  6%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      8426 ±  3%     +85.5%      15629 ±  7%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.__mutex_lock.constprop.0.sync_bdevs
     16359 ±  2%     +43.7%      23512 ±  6%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_sb_inodes
     12226 ±  2%     +22.8%      15015 ±  8%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.do_unlinkat
      9463 ±  2%     +65.4%      15654 ±  8%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
      8482 ±  4%     +28.0%      10855 ±  7%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.__flush_workqueue.ext4_sync_fs
     38705           +34.4%      52015 ±  6%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     43408           +33.0%      57748 ±  6%  perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.iomap_dio_rw
     33465           +18.7%      39708 ±  7%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     11081 ±  5%     +82.6%      20239 ±  7%  perf-sched.wait_and_delay.count.wait_transaction_locked.add_transaction_credits.start_this_handle.jbd2__journal_start
    422.12 ±133%    +241.6%       1441 ± 63%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1513 ± 17%     +55.5%       2352        perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2101 ± 23%    +104.6%       4299 ±  3%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.80 ± 27%     +61.0%       4.50 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.flush_delayed_work.dquot_writeback_dquots.ext4_sync_fs.iterate_supers
      2.79 ±  7%     +75.9%       4.90 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.super_lock.iterate_supers.ksys_sync.__x64_sys_sync
      0.09 ±  6%     -17.4%       0.07 ±  4%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1.53 ±  7%     +33.8%       2.05 ±  4%  perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.72 ±  6%     -43.3%       0.41 ± 22%  perf-sched.wait_time.avg.ms.jbd2_journal_wait_updates.jbd2_journal_commit_transaction.kjournald2.kthread
      1.54 ±  8%     +53.9%       2.37 ±  7%  perf-sched.wait_time.avg.ms.jbd2_log_wait_commit.ext4_sync_fs.iterate_supers.ksys_sync
    289.99 ± 17%     -64.0%     104.49 ±  6%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    182.35 ±  3%     +14.6%     208.96 ±  6%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.65 ± 23%     +34.7%       0.87 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_sb_inodes
      4.15 ±  8%     +21.0%       5.02 ±  5%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.do_unlinkat
     19.46 ±  8%     -25.3%      14.53 ±  5%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
      2.49 ±  8%     +55.9%       3.88 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_workqueue.ext4_sync_fs
      6.06 ±  2%      -8.9%       5.52 ±  4%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     30.51 ± 20%     +37.9%      42.09        perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     17.78 ± 15%    +523.0%     110.77 ±253%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
    422.09 ±133%    +241.6%       1441 ± 63%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     17.56 ±  8%     +37.2%      24.09 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.super_lock.iterate_supers.ksys_sync.__x64_sys_sync
      1513 ± 17%     +55.5%       2352        perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2101 ± 23%    +104.6%       4299 ±  3%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

