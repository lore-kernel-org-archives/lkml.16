Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0F1F098F;
	Mon, 19 May 2025 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747630641; cv=fail; b=HCAuAVuDx3uJBJVy42d96/Qt3sfPwjHiIovQGfXcz5Pa+K+atD9hFP00I7ccL0AwIIvdXTaYU5OlGimupCp7IWV3NqVt3L40Z9ezQ20tT7ZTDepmN6Cla2wbOhIjQ/ZwNL4TQ+VfZ43aMxsS4qvR+cP3jGQgAvZqJ7ITj15XXfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747630641; c=relaxed/simple;
	bh=zN+kMmIa4aZtBG/WKokRRpaJ7u3YDV+rGEC/3EGxpkk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DVbzJoiDX1z/R0LQRVD5UdK7QvJv1zWC+tPPLBUrXL8IPxm1WD398GHn3Nla1zzaCh3hpFc1i5hI2hltRo7PwT5sNCrS06g+G8J5PJ32mH6zS5hsqCG9FaLjiXS48wGW0rlHD8JF44jONJFLRZaUoX7wnCcwM0GqEXon+WEQS6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IE3ONbYP; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IE3ONbYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747630638; x=1779166638;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=zN+kMmIa4aZtBG/WKokRRpaJ7u3YDV+rGEC/3EGxpkk=;
  b=IE3ONbYPCFT2qgse3Ec6DoiEWh21iIUHh7r03dnEe9GqE96L7EhtJd5h
   ibdNqN8WkuMvSjLcOHkgN2czqhlVr8z8ogO4ZrMMshxsfikVUWI1jqwl3
   XEjVa1iwU02ZiGovKzKyaG3zEjDxSkeZrZGsKM0Q2eDqp7ROT8gpzR76i
   Uzl9sJ/9KbqJb5ARQf6JSed9cQBMTk834YXwyqfuS0MszneHL/Eus+tB9
   NTDPfD4kL4FTG57Bw46PJYx5gZFcwGClhdl8XwdeCEJFTpykjfApIolde
   jFQeSk2FpTAwvdY5OQa6OZYOiXY5CVSqeZEOe2m8XwKUwql97A4EK7QcG
   g==;
X-CSE-ConnectionGUID: V5AnAitOSDCE37XFXP69LA==
X-CSE-MsgGUID: gbJ/wbR1QVOrUy8ucxo15Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49214716"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49214716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:57:17 -0700
X-CSE-ConnectionGUID: sl0hnUc2S6yZNDUkdfNBCg==
X-CSE-MsgGUID: T0aMpMtOQHS9qiVPjmNA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144124364"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:57:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 21:57:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 21:57:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 21:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soWEayva2h8BlurGTuik7R5R2xBpyShdBQfLQhmoWbKFGh+K4IbDfbA3ANY40QiHsilwkLwbxokVYnaQjEOPjva2BmExn7X4c1kJft3s+SoRzKjJADG1tMVelm09Giry9ye04f6YmghbEQ6CIkeK9rPn0B4L4xheuV8CScm/sbVcbkAWjiWnt5OF8uPBDkdKXbUpTm0z195lz/ql/s0Pk4pg4AMPS8U/OB2WWf9RgOWh2K6UVtTM1NvjJJg1htKTw8kBA4pZpnvHXwFfW0ngLw1TxkbBGWlEyS/5fib2m+HMX0rTLNpfpogBbaFeryYm0fanNzxmmda+wl+TUszUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OywxwIhN/Wj7doh+sIMVHyLg7s6UlJJw5fCOUdgyZdM=;
 b=pNlFSVAvCEFmnyn7ZcCVqufCq1FhrxLtDuzQr4WXyExl/rVO3OTmTXG3kJZCV+psVof4EzlNqASgkeSmnVv1KErnqcY7NHkxs+SEBstNgdgn1to9eWTHv5E9nJXO8liVrEcRc2IF+1l1Q5NY69AN0BcjXMFonZ2WUdBUQADIP39QDECtl4LjU5Z+W+QnInPNjLC5ifhrco1j2B7E8gGjtSThZH2/YKYG2672vigA38vxbiiP+SZBVLTOKVjbNzo5lr/xDiU3v6M7QQeEn4TCSrtX+ctpkl64chHGU3PvlJmEQp9iYCQ8PR4lBETRXCYZTlXR1U8Stwi3A2MEAVwYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 19 May
 2025 04:56:32 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:56:32 +0000
Date: Mon, 19 May 2025 12:56:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>, Josh Poimboeuf
	<jpoimboe@kernel.org>, Alexandre Chartre <alexandre.chartre@oracle.com>,
	<linux-doc@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [x86/its]  f4818881c4:  aim7.jobs-per-min 1.2%
 regression
Message-ID: <202505191021.9e9f0ba2-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0063.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e3c23f-d499-4ac1-9ee8-08dd96918621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vHaljkhr33mvuOzKaHQR/FE6UCu7ZTWLIlzYZkMKVJ2A3vSO2BThunPJnc?=
 =?iso-8859-1?Q?VJOPbzJPrVN6Og89+JIix+XZE6YsEca3uGhpOD30cMYTRR4XYizD9Ohl3u?=
 =?iso-8859-1?Q?27syYE8NlPgXUK+BM3FuCM1uK3kU3qI8LR+fM8AHYi1Lb64Fn/1qQSPG57?=
 =?iso-8859-1?Q?1oGbC74fW5FjIwZMkh6E1+w7tnOeRgt2S9r2R/uQKMW2SGrvdhWi8qAQFf?=
 =?iso-8859-1?Q?hQW0shYMZ9cX/sHfs6ytsXOr9jJBGu5kuLRqakoV9ML6XRuktotnpWfM4H?=
 =?iso-8859-1?Q?BWSIShBrOW9mW5t+npNrL6Yqxhm5DAIjVuMYi4FWIlmahW2D6shHh97Tav?=
 =?iso-8859-1?Q?+7dedtIwpnGgO9MrTDDVECiG+PnMV4fmCUGZ9FCp2SoYybrWymgJo6ORIj?=
 =?iso-8859-1?Q?+trRewpOr9Gl6qxuKf6DpyX0BBxOiGmO7LGfdWlHBkc7yN9ylIipVHdbR1?=
 =?iso-8859-1?Q?R3PKiXSWJCjn3104kDVGasKEW/sCRNd4RDS5Z80mKOx/od2HQo6ofgMDrM?=
 =?iso-8859-1?Q?4WXYBzCl5OGWWOWsKhVDd8NWsnrWZVAPJkQH3yY8nfQ0J69/nFcC65NPYl?=
 =?iso-8859-1?Q?j17IZpqvGkw8E0vIiCztz9+L2cPKabFn+AijEPSH7f1cIb4JMDdyL9CMkk?=
 =?iso-8859-1?Q?lpPoFd816AjQNMNPkdEWLQV/IlQDoda4WVTIYVUNAgJNpTtm21diaG+S7t?=
 =?iso-8859-1?Q?1mWm8GPVo/bs+cOjbxOZU9j9a16SWKcyRym+YEIxWkk+ZzTJAe9vGUKXgd?=
 =?iso-8859-1?Q?PzfAh0PyIklxvFM/57wk/o6ZI62tT8lKGt78vsPr4+EwVsLn/GH00P0E/i?=
 =?iso-8859-1?Q?mSufwt39QcB2OkT4zeJIkOkV2TnMQagcyWscoQJqjcIelwrl/p3e+IG50U?=
 =?iso-8859-1?Q?JGdI9MtnGueTbF7FENuTRTjSyujcqjPVHoWR9v8GW3Y7u0DpZ0t4rNOLPs?=
 =?iso-8859-1?Q?ck4ZcRM7u54vF6YWmum6WKQph2dPP9LhRGkBjnmlbuq3gJnTJxFEiI5jOx?=
 =?iso-8859-1?Q?KmeRTfDkZMzBHoOgRHXDDvTnKagplxIXSbCdkdv+1fHvh/tXSu9l7jTnBX?=
 =?iso-8859-1?Q?9gb1oskLrixOoCR8RkhDyqKg2RjDqH2cUGlKKeZs7cbKcV05x9Vd1Ba1iG?=
 =?iso-8859-1?Q?DSgyJjfCkgDMK4kgvRDQzcVQufGBFNYkgTz2BSlKFBJGm7Sc3RL65tAV57?=
 =?iso-8859-1?Q?uAMRI8XJD1/tXADwkmUtQo3P6Armct7JpRQMHFzph+wweuGLmQx836tm+e?=
 =?iso-8859-1?Q?EihcPSWs4pGy9j/UeyqjXPUEM7oMwQ13tAA05rWPnvA0ppIGO64nPEUfwd?=
 =?iso-8859-1?Q?1RkyW0Y6luVu9w/OLR/1FxFY/aki2PM9oBYK9V9O9yEyvKBnXe9+frKuJg?=
 =?iso-8859-1?Q?3NqR0QIN0ED+7rtUzFwT9Zm19MPCTyGslJMWdUm8WdlKQGtpxPzU1OCkvh?=
 =?iso-8859-1?Q?hYzdcgWfKxJkMeie?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kxBNt3gWFhPCk7Qyz6vke6fM4tptWjyVGQ/Vv9aoOt5rEl0WB8QWLz7qdb?=
 =?iso-8859-1?Q?TS3Bd3njK3/jwyqTIeVxh5n5NnMsat5OSOjL/Ei6HxCgdNpDwp88exUvAI?=
 =?iso-8859-1?Q?D1n7k/2BzfRdtYJnugiRxNxf7TDf/STy2Zkbh77gd9XvAJr4L+ON+E/biu?=
 =?iso-8859-1?Q?D9R1KI1a6TbFtLVQ6Vi3WfwrRcFfugA1klYXszSgt9NgPZrPnviwIS+eBN?=
 =?iso-8859-1?Q?Hdl9wAIyhJmJY9xzFdadrPHT+FYmBBX8EMiKGZO97GNYT7X3Irr1KslFha?=
 =?iso-8859-1?Q?4XUVuLjn+epOoGICRhv8LpqQTJYA/9T8VAHlgkCUmYlBb6VflLIGiySsHO?=
 =?iso-8859-1?Q?kW17JyaPyHK0CDIu7VJEUQCiD5zYgN+ap4bo5fwdjZ+ThKXENal8BdJ5Wb?=
 =?iso-8859-1?Q?ASmXSAPlUNp5qqE1bV+cF4a3s8/KyE0MRtWQdOCndmBgDyznowNZBmpygF?=
 =?iso-8859-1?Q?RT+UOjA2cZDMfb100GI2WHnsM99HTz1aN/+3Fzb3PjhbqTb/fSD3J9K5c1?=
 =?iso-8859-1?Q?zwI8inst+zLiHi+XAEvgeUQ0Bjb+t76oDx3po0CiZWCRA5XzdRZdySwoni?=
 =?iso-8859-1?Q?sxOgs/W9rl2ipHDl5pUXnrHq5akIjbpCx40Z4Gq6NK+N5Hw3khGaaQocYO?=
 =?iso-8859-1?Q?8G843Vj7DIbPT1HqxMua5g1LqwNyrnv6XrlAfcbbMYuxfyI2Bz+TKd3wFM?=
 =?iso-8859-1?Q?qyFlMYlfSjXbiHBvN0x9C8GjHo9UTZ+UMl9LXuM6l08VFpkdgfjlDgPM5w?=
 =?iso-8859-1?Q?tF50/MQ/6fDXkOGy8xeceDfTfABPTD2epOYThJDJKhoD4SeADydfZ96C7i?=
 =?iso-8859-1?Q?Y9OmjjcoWPt8ol64vPltJTixSJTi/FfemXMT/UPEUaYEdQbfHduIsVrgda?=
 =?iso-8859-1?Q?YJBT+iJu5BsUfvTRORAvpApPwf/+7Ex6Kk51ItAy+/c28FjAfN1zIpN+Wa?=
 =?iso-8859-1?Q?yUR7YCI7lsMJvDIsEIuZy/2LadAlYdB5ckzxp4lHN9MaGm0DWOvcJZf1pT?=
 =?iso-8859-1?Q?a1GiPY+tI6Y1KAZ9Uck4cDPIsKH4Q0gsdUjE9n/d54ys58zw9QgyUcVt6X?=
 =?iso-8859-1?Q?bgNPVslnprznNVq8AYuuLaSlaGJup3ccMIoTxFWFDH/Omm5S4GO14k24rf?=
 =?iso-8859-1?Q?6hWxdfvzDLIt2U+RWoV2zJ3ZCjNimnLzAe0UnkUOayhH8ZOxAtx7iYOrs5?=
 =?iso-8859-1?Q?d1VXQIMzZ+vYXnuLnG+OfGLxnLx/Ebf7GGAwBkS8IYN9B97dXopGUfnuEz?=
 =?iso-8859-1?Q?kYWjYw2cvNNn39nm8tnHw5VOB1ODQAEXCbCbfSM3zCkv8eVVM64zOT7yRp?=
 =?iso-8859-1?Q?GDLyeVBy/qp0o0lLtPfWj3obn/ZeBycFey7/KT9VF4wPtycEqbjHSyHIBq?=
 =?iso-8859-1?Q?GCtLxeRFPYT234ZrLLBsWERZcNgAeUT9ziWwBZRIxmevB3vR8KNRFMH0LZ?=
 =?iso-8859-1?Q?3W9ZALbezULCnrtugf6JpfTCF9l28zagsxyO7cpRmODvEVlvD6x2O2klEc?=
 =?iso-8859-1?Q?+ReF1gG+BSYHbHlFz+X7jRcalQGfssavA9C1nsGxq2WZnIDpsqARTXC4Bc?=
 =?iso-8859-1?Q?OATSusyXCgQFMTu/sR6LsynWuEKXT2RytcaTcY1Dhcc2dZY0PoaO0kaYQC?=
 =?iso-8859-1?Q?EZrP3jkcwvfurHKpBoLvnwVW351/ep850EUPaEFWkKsS2uTcjXAvOPUA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e3c23f-d499-4ac1-9ee8-08dd96918621
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 04:56:32.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpm2aJQ0dXdBzrbc6cf01PYyVT/COJvIFbtBQTVWb+P+C7IWWVDIVqxBwvIF5K7lB8Kk+UuS1j9Pp5vpo7kIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 1.2% regression of aim7.jobs-per-min on:


commit: f4818881c47fd91fcb6d62373c57c7844e3de1c0 ("x86/its: Enable Indirect Target Selection mitigation")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      fee3e843b309444f48157e2188efa6818bae85cf]
[still regression on linux-next/master 484803582c77061b470ac64a634f25f89715be3f]

testcase: aim7
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
parameters:

	disk: 4BRD_12G
	md: RAID1
	fs: xfs
	test: disk_src
	load: 3000
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+--------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps  1.8% regression                                          |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory |
| test parameters  | cluster=cs-localhost                                                                       |
|                  | cpufreq_governor=performance                                                               |
|                  | ip=ipv4                                                                                    |
|                  | nr_threads=200%                                                                            |
|                  | runtime=300s                                                                               |
|                  | test=UDP_STREAM                                                                            |
+------------------+--------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505191021.9e9f0ba2-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250519/202505191021.9e9f0ba2-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/testcase:
  gcc-12/performance/4BRD_12G/xfs/x86_64-rhel-9.4/3000/RAID1/debian-12-x86_64-20240206.cgz/lkp-csl-2sp3/disk_src/aim7

commit: 
  a75bf27fe4 ("x86/its: Add support for ITS-safe return thunk")
  f4818881c4 ("x86/its: Enable Indirect Target Selection mitigation")

a75bf27fe41abe65 f4818881c47fd91fcb6d62373c5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     75730            -1.2%      74795        aim7.jobs-per-min
    494.88            +2.2%     505.76        aim7.time.system_time
    170491            -1.5%     167881        proc-vmstat.nr_shmem
   1436502            +1.8%    1463032        proc-vmstat.pgfree
      0.01 ± 26%     -54.5%       0.01 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.getname_flags.part.0
      3221 ± 10%     +24.6%       4014 ± 13%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      9.35 ± 54%     -52.2%       4.47 ± 61%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_noprof.security_inode_init_security.xfs_generic_create.lookup_open
      8.92 ± 36%     -48.6%       4.58 ± 54%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.xlog_cil_commit
      3221 ± 10%     +24.6%       4014 ± 13%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
 1.542e+09            +4.1%  1.606e+09        perf-stat.i.branch-instructions
      1.87            -0.1        1.77        perf-stat.i.branch-miss-rate%
     31.54            -0.4       31.16        perf-stat.i.cache-miss-rate%
      1.63            +1.3%       1.65        perf-stat.i.cpi
      0.63            -1.4%       0.62        perf-stat.i.ipc
      1.94            -0.1        1.82        perf-stat.overall.branch-miss-rate%
     31.70            -0.3       31.45        perf-stat.overall.cache-miss-rate%
      1.59            +1.1%       1.61        perf-stat.overall.cpi
      0.63            -1.1%       0.62        perf-stat.overall.ipc
 1.536e+09            +4.1%  1.599e+09        perf-stat.ps.branch-instructions
    987.24            -1.0%     977.35        perf-stat.ps.cpu-migrations
      8224 ± 10%     +28.5%      10566        sched_debug.cfs_rq:/.avg_vruntime.min
      8224 ± 10%     +28.5%      10566        sched_debug.cfs_rq:/.min_vruntime.min
    144919 ±  7%     +17.0%     169577        sched_debug.cpu.clock.avg
    144939 ±  7%     +17.0%     169596        sched_debug.cpu.clock.max
    144898 ±  7%     +17.0%     169556        sched_debug.cpu.clock.min
    144346 ±  7%     +17.0%     168892        sched_debug.cpu.clock_task.avg
    144557 ±  7%     +17.0%     169113        sched_debug.cpu.clock_task.max
    136847 ±  7%     +17.8%     161242        sched_debug.cpu.clock_task.min
     13899 ±  6%     +13.9%      15831 ±  5%  sched_debug.cpu.nr_switches.stddev
    144899 ±  7%     +17.0%     169556        sched_debug.cpu_clk
    144339 ±  7%     +17.1%     168996        sched_debug.ktime
    145461 ±  7%     +17.0%     170148        sched_debug.sched_clk
     56.39            -0.8       55.60        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     46.66            -0.7       45.97        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      5.72            -0.3        5.46 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.64 ±  3%      -0.0        0.60 ±  2%  perf-profile.calltrace.cycles-pp.xfs_buf_item_release.xlog_cil_commit.__xfs_trans_commit.xfs_trans_commit.xfs_create
      1.10 ±  2%      +0.1        1.17        perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      1.22 ±  3%      +0.1        1.29        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      1.18 ±  2%      +0.1        1.26        perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      4.92            -0.2        4.71 ±  2%  perf-profile.children.cycles-pp.intel_idle_irq
     10.59            -0.2       10.41        perf-profile.children.cycles-pp.__xfs_trans_commit
     10.65            -0.2       10.47        perf-profile.children.cycles-pp.xfs_trans_commit
      9.36            -0.1        9.23        perf-profile.children.cycles-pp.xlog_cil_commit
      0.22 ±  7%      -0.0        0.18 ±  6%  perf-profile.children.cycles-pp.xlog_ticket_alloc
      0.15 ±  3%      -0.0        0.13 ±  2%  perf-profile.children.cycles-pp.xfs_buf_rele_cached
      0.24 ±  5%      +0.0        0.28 ±  9%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      1.13            +0.0        1.18 ±  2%  perf-profile.children.cycles-pp.try_to_block_task
      1.40 ±  3%      +0.1        1.48        perf-profile.children.cycles-pp.enqueue_task_fair
      1.66 ±  2%      +0.1        1.75        perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.7        0.70 ±  2%  perf-profile.children.cycles-pp.its_return_thunk
      4.37            -0.2        4.13 ±  2%  perf-profile.self.cycles-pp.intel_idle_irq
      0.14 ±  5%      -0.0        0.12 ±  6%  perf-profile.self.cycles-pp.xfs_trans_precommit_sort
      0.06 ±  7%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.09 ±  4%      +0.0        0.11 ±  8%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.70 ±  4%      +0.0        0.74 ±  2%  perf-profile.self.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.00            +0.6        0.56 ±  2%  perf-profile.self.cycles-pp.its_return_thunk


***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-9.4/200%/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp2/UDP_STREAM/netperf

commit: 
  a75bf27fe4 ("x86/its: Add support for ITS-safe return thunk")
  f4818881c4 ("x86/its: Enable Indirect Target Selection mitigation")

a75bf27fe41abe65 f4818881c47fd91fcb6d62373c5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      2058 ±  4%     +11.7%       2298 ±  6%  perf-c2c.HITM.local
   7436735            -3.0%    7213042        vmstat.system.cs
      5.72 ± 49%   +3259.9%     192.19 ±185%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      5.72 ± 49%   +3259.9%     192.19 ±185%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
 3.223e+09            -1.7%   3.17e+09        proc-vmstat.numa_hit
 3.222e+09            -1.6%  3.169e+09        proc-vmstat.numa_local
 2.574e+10            -1.6%  2.532e+10        proc-vmstat.pgalloc_normal
 2.574e+10            -1.6%  2.532e+10        proc-vmstat.pgfree
     29701            -2.1%      29079        netperf.ThroughputBoth_Mbps
   7574004            -2.0%    7425040        netperf.ThroughputBoth_total_Mbps
      8150            -2.9%       7916        netperf.ThroughputRecv_Mbps
     21551            -1.8%      21162        netperf.Throughput_Mbps
   5495563            -1.7%    5403562        netperf.Throughput_total_Mbps
 1.142e+09            -3.1%  1.107e+09        netperf.time.involuntary_context_switches
 4.336e+09            -2.0%  4.251e+09        netperf.workload
  2.52e+10            +3.4%  2.605e+10        perf-stat.i.branch-instructions
      0.88            -0.0        0.83        perf-stat.i.branch-miss-rate%
 2.196e+08            -2.2%  2.148e+08        perf-stat.i.branch-misses
   7497258            -3.1%    7265561        perf-stat.i.context-switches
     58.57            -3.1%      56.76        perf-stat.i.metric.K/sec
      0.87            -0.0        0.82        perf-stat.overall.branch-miss-rate%
      2.19            +1.1%       2.21        perf-stat.overall.cpi
 2.511e+10            +3.4%  2.596e+10        perf-stat.ps.branch-instructions
 2.189e+08            -2.2%  2.141e+08        perf-stat.ps.branch-misses
   7471654            -3.1%    7240223        perf-stat.ps.context-switches





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

