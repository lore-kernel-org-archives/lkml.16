Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEC2566;
	Tue, 27 May 2025 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368482; cv=fail; b=egXQoMotS+yhH3+VIp765I5VlV5OExvugajxXpoj3vf7FYRoGweWlp0M+56TQ9zM9dLiDzDN3RmrYyeKK8npoM8/KJdNlmIonEZvv/9OtihVo6LNhtnE/9O7rh22YYnH0LcpsJZMahc0K+RX66h8Kd4SktYk0ordRlxP8zh1H2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368482; c=relaxed/simple;
	bh=q+hFCnKvojYHtjINMNB9OF/kPGl/Ctx+fedIkgQqlcE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eEUrqCe47ctQUXGCYKun0us4TosqjuSlUtjfyjUT2WJDtqa67AD9AgMqG+YYevVyrxjtBdrtdzIo8Qqvqx8ZPO0aNSvvxD4m5UGfXlO9H6PfNnzK/oZS2jge2oVEYlgWagUYA8j7JjymB1H3ThBKdtSZDZ6DIJy3MtgKvjIzI1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8fiknj/; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8fiknj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748368480; x=1779904480;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q+hFCnKvojYHtjINMNB9OF/kPGl/Ctx+fedIkgQqlcE=;
  b=b8fiknj/l2oTaVXMfIudJ3U2lvaeng4vyUzA8PwkGLYzuT1EkzV++yWA
   RdLpw2jtqEV4FoPTH3grOX1/z8LFXmRLrtlcXI2pJPWuaf6nIkMmpqwpn
   q46fZVhlXboFY2zo0Q0py9uQsW6hxvO0IKF1OgX3+c+q9H6mxVVTOUotT
   1p3A80qKTUG177VL7xtRb7TuMs5x1a4sifO6Uzy5VtfEN3Fp89bgvuqPl
   moqIhwpJDz6TRuYbvXY43Surqu5vH+BWr1LTsZ4SCZ2ywNCOcdiK1K1aC
   Nj2LCDnIrkBh7WV+z7T3teqtkW8IgHsiU23Z9LnLqSOu3VyCTAlv7ekWl
   Q==;
X-CSE-ConnectionGUID: zVSnySkbTvucw1cRqHn3PA==
X-CSE-MsgGUID: 0pJ1M0qDRCq3K4COOZ7VgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50248795"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50248795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:54:39 -0700
X-CSE-ConnectionGUID: QfdO9SxWSQ+wKRGkJEjoIA==
X-CSE-MsgGUID: hqoIw3f3QyefSNTzCt0jhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147787303"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:54:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 10:54:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 10:54:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 10:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+cLvPg9GlO+mQqQ29A65mLH+0BNHbZF/ztCrLrgbWiOAL0o1RhcvUJ7ZFfr2AzKZOHi1vcWj/VFaW4abQ7I98AY4SVLBEYOjG8ysw1Zjqw1CxnZ0vUIpmIYDsnDOsW9/Xv+f/6fAyvw8/v+YeF7IvaA3p/hhMqXKMY/JgQqcHo2s5pImw1EYyQT6x+2YwRypPlsP81GHkipOtTaZb5PaGM0atLN+PYriLeRnaa1J11ZjDISakS7dRaqdkSBsi6uRl5575pxcW99QJ0fW3nF5e+4VC/7LJ65U9za/u0VzGFkxnHwZVPc01hbCIYSBHVPuLj5UisAeHPAg1XKJXmt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOomMWHp0WQlwiAxP3QRH/gy/wwNzpSMVgweDOiMbpM=;
 b=e+UqDH2ISX3mRdEjPjEObQAijRV5UAf3FjI8focfI09YZQmwKvUb0z17h+PKteTNrpqEhozrCA4anPyTdCAp86jJaeyPwwPq5NwAQLzkmcnvQhWp5opuP7pEQCHiLXmEDT3jE2ZTifh/PlRs/BpYI0mx3wnNkh8Kl1by+dVU5TKmrzwBmicIi4iIc6P0JRv0lLlMsoCfZN3XtOA9aSMG/q+ywuZJsg9hYTLfa2Q2UjKXyW1o9BulybXtl/KuAnsL/kjofZPMbMbd+w54DR1x0FFWeEBxtwwMsqrmuJH70QQd8W95tR7+JLtNRR+4VxgbGtjYWkUBFumdAnDbVYCnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 17:54:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 17:54:35 +0000
Message-ID: <5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com>
Date: Tue, 27 May 2025 10:54:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
 <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
 <6cd9873c-1add-4d19-8d08-a7c3a514bfea@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <6cd9873c-1add-4d19-8d08-a7c3a514bfea@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 111f936f-c9d7-46f4-d5e5-08dd9d478a81
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmV3R3pnY0dGMzZhWUUyb3FDdXU2R045dDd4SUVISzIxWU05ZXB4RFAyTmJU?=
 =?utf-8?B?ZnM3bTFOQ1dleENQWElVUEJOWFc1VklibnZsUXZHbGtHbTdUZVVGenY0OUVW?=
 =?utf-8?B?YWdtUVBmY0RVS2g4NG5wQXZoQUw5b0I5RVRoNG1mUTdxN2NwR0d0R2FrbWdL?=
 =?utf-8?B?VGJSY0daODVaMStKUzdSb2ZyZ3I3RENjeGI4dzJGWkFXeG8vS2paa0ZmaEFZ?=
 =?utf-8?B?U2ZIMURKTjA4NUpLbXY0bVZ6RnArRjM0MFBoZUllVG9sYjVoWWZWd2FGZStF?=
 =?utf-8?B?dGpsaGVlT3gvUTFaZUNmZkJjMDFxM2JvaEFjMkR4OEd5YlhCRnh4M0hQbExC?=
 =?utf-8?B?UjJKeFJ3cG4wZTFkaVJmT2hNSkdxWVZ2YU5iSS9XdEVEMktwOHVCMFNzRXkv?=
 =?utf-8?B?S3dpMUlWVGFScEIzeWo0KzdLZFFjSG9TREhjaW8rN1VxSjQxUU5Zc2hWdEhz?=
 =?utf-8?B?NjRtUWthaVZJd2I2VHdyckFBUXRTQXltVmVhQVZZZnlrZWNBSzRCbmZNQzND?=
 =?utf-8?B?cllOSmJGZEhYL3dhTE9tUzh0VjhWSkgzODBCOE1hZGh6NS9MUE9vSUdUdU9U?=
 =?utf-8?B?RjUrS2NRZHlUNkZWczhzUGxxMWZadHYwY0NxUUZaMFRIaGgwc20vTEtTbUth?=
 =?utf-8?B?ZDJFSGJvZ2ZDcUVNTCs0aFJrOEtoQ2ZXU3drOFFaM1l6V2d2MmkzcGs1T0VB?=
 =?utf-8?B?V0dhU0orUFJwWEdld3NPMkMrUUVUTWp1L25iU1RkMERieWdPWVJqclFMWUFE?=
 =?utf-8?B?Q2pCSXRqVTl3d003UEhqdkdLaG5ZYlNTQlNGeXR6QmJ3VnkxOEdmcDZrb1pZ?=
 =?utf-8?B?T0wwaG00RmpobndCQUxuQ0w2dGtyTHlxR21zNVdUQnNjSllsaDd6ZVFDZkx4?=
 =?utf-8?B?em85RE1Cc3RFd2cxRXJDeGZwZDFvRjNxZjlmQk45SGpsRjE1R1h1UVBGdFRU?=
 =?utf-8?B?TTVQdkswL2RJQS9LdjlVemdtR08zT0tiL2hTMWRRMm12aGowcW5oZEI5dFdZ?=
 =?utf-8?B?ZVBVakJRTlpqcllUUVFnK0w3NG1zR0FHT2srUHM1bFBKc2tJMmRCNi9oVkls?=
 =?utf-8?B?SHpFc1B5alpsRHBDMWxyVTJ4R2RYYnpyM25WeWxkcUdvQlhHUGNpWTZXeERj?=
 =?utf-8?B?TUE5WnpsWjVncktGOEtocmd5M3lwRjJZR1dEc2ZYbzI3Y2NpazhQTnlnY3BX?=
 =?utf-8?B?MHFocHBvNm9CVkhjbTlUWU5wUTd1SHoxVzNoV1JRSkNZdWlkT3RuS01IS0M5?=
 =?utf-8?B?dE9aejdFbVdlbnJyemFqQlhBSXJWT04vYnllSGNEY0tGd3JnZU85RTBWbEJu?=
 =?utf-8?B?Y1QrSldRdWdrMzdtOHhwRm9zbUJ4WjhFQ3hTdWdobHVJTXh2Z2ErZWdteGdQ?=
 =?utf-8?B?NWVNdWcxUXBNMWg5dVY5eUc4QXdYaU5GcXZ0em4zY1lNNkhvUDZBMHluVnBH?=
 =?utf-8?B?Wm81anVXSkVyOHc3WGhSMWdWaEVNcFg2ZWV3a001OUhNK0ZVeCtuK2Mzc0Nh?=
 =?utf-8?B?bjVsSFNYcm5ndUUyR1ZLaTNLTm1mKy95Y2lvdUJHUHdGRHJ5Y09PZVAwNzUw?=
 =?utf-8?B?dnh3TFBOdHlKcGowL2paeTRGdHdtbjJYZDZkUGw2ZlRyWnE5dEk1U3h6dkhE?=
 =?utf-8?B?R3QwNmcvUjZOZnIxYTB4ZFZlWktoZkxXZ09HNEllZUUvYkh1T282MHBVS04x?=
 =?utf-8?B?dnVCR2dNYmxjOW5JNEh0WFYxbldQdEo5OEVuMjJidXorMzFtc3VxRG8vUmFP?=
 =?utf-8?B?UmtDdjhtN1RWNlp6Y1lTRlFYd3lyS0ViMEN4OHliNUVTTEU5N3MyU2tRcTJj?=
 =?utf-8?B?dm5zTzIzbE42dlpnbDVJcFV1Kzh1Q3dJQ0RHWmswRmNlZ21JaXByQXNmQnZV?=
 =?utf-8?B?QlhvS3lBa1JwM2NHK0FLTTNyNWxSRFpheU84N3JROU5hRzQ2RjI2WjNMWmFl?=
 =?utf-8?Q?SwBlgCcHcmc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkJRcE9hM2F4V0M0b0VHcWNPbFVRSUZaUXV0K1NSbEl5dDFIak5rUkQ4YS92?=
 =?utf-8?B?MWRSRGx4Q280bEJYbUhRcHUrV1N0ZW9hcVpSc3NTWTdDT0VzN2dPU0V5Mlcy?=
 =?utf-8?B?REF2dzRsOEJmK2RxVWk3aURkWWpWN2NtNko3cW8vT1RNcm50OS96amNCempG?=
 =?utf-8?B?NWFIR25tSnZyV2dOTlVmTFJPb2QxMnJIQVNTMlpOTDAraXJRVkhuOWxSSC81?=
 =?utf-8?B?S1hpWlpCbW5RcDh0czhrQnBtd2Faa0t6RUN3N0xTb2VxdFpia1FZR3V0VWVJ?=
 =?utf-8?B?YndQdWxzRzAzR3BnWEFaMUFrWGIzem9MWFFaWHZqVy9FcVYrSzFGaDJFY1Fz?=
 =?utf-8?B?ZWwyeDIwaklCMTRKOVVUcUVzWmRjWCs2WFp2SzQ0WW5MMGRxS0Q4ckxuNVRB?=
 =?utf-8?B?VVk0R2xtNmN2MjRDSGx5K0xjZGo1MDRkblJPS0lNdk50cnRNYlBjdmJIQTkr?=
 =?utf-8?B?RzgrM2NuVXpiNnZiTGFLZ0dVMGk1aEpWUHI2SGhHZk4wRVBEQzRXVG5tcHZB?=
 =?utf-8?B?UXJ0Y3ZPWG9idXphUWdaVFpXR1d1Tkt4aDVhNUtSZFpiSDVKcm1icXJjUWtQ?=
 =?utf-8?B?RTBORTA5RXNzV2VjY2lhanFaejBkNSt3TDZMY2FRYjFKN3cvcERzdWxLcUlZ?=
 =?utf-8?B?ZC9keUh5VW9kVG9QZkhhM2x0cm0yY3J0RmNaVUJzQmNPTmMwbXkxOCt1MmJT?=
 =?utf-8?B?OGN3Nk5ENzVLQndXWEx2K056TmhGMFVVaUdOdVRqaEVDUGtlaXZNd2t3ZkN1?=
 =?utf-8?B?bFNWemttbDJQcXNMbElLTTg3QUR3Y085Y0tiTDA0eUkzbEtKZEliYko3aUZv?=
 =?utf-8?B?aVljSE5rQ1o5VHAyTHdtV1dXN2M3dFp1c2gzZ0F0b3htL3U5YlkrckF0aHVP?=
 =?utf-8?B?eS9MdWkvRFVYNUhjMktGVVN2V05kUlorSGVxczJHWnNKV0lnQnZmUzh3NEhN?=
 =?utf-8?B?Wk5JbEhGbXlMMys3VVhjRVdlM01zU3lYNWloVG9HU2pGais0RHFjV3dHbTEz?=
 =?utf-8?B?akVoUGVMdm8yaUJEWlppRE12QlRCLzA2N3NWTS83eWJIR1dhd1hOTkdDLy80?=
 =?utf-8?B?cysvbUFZcmo2QzYwb2FNbU5PQklaWVplRThiazZOakJVRnJITlh0blc2QlYy?=
 =?utf-8?B?VVJwUUx4RmhuS2FqOEI0MjFxZEllcnNVeUdkQWxDcG5XakFWOSt5bkI1RGxY?=
 =?utf-8?B?V0F3aXN0TW1Yb0JEN0h0Mk5VeHJ3OFYrSzFlOGdiT2huNVo1bGdtN2VOQ01R?=
 =?utf-8?B?eE9IaFhQZWx4ajBwTmVncnJFNzlqMHpvSC9YaVB5eW5ybTlYbmt1d3lEYzlQ?=
 =?utf-8?B?YmRJVTkyeGJ6a3ZobFFwSVZ0dHZPb2ZFVWlkaUxiOVR1WHJVdkVmOTI2aFNR?=
 =?utf-8?B?TDZWVkhhRnk3NE9maVU4WG5abFBJSVpsd1c0bzJyUkVNQW92aVlqYUd2N3Bo?=
 =?utf-8?B?c1d4cUkzdVRzYkJqMkZZTTNUdkdBUjVieDNJeG9WaXI3ckRPRWpRUCtibmt5?=
 =?utf-8?B?TVBoUk45bFZQbDRzYzhlOVVaa3RQQnI4bnQwbjNZS3F0d2xoUTIwYTNkenFQ?=
 =?utf-8?B?VFNzaURWbFdOdXhWM2ZGRkE5MEdkRGd1SkRSb28zM3MyR01MaUNrdytVSEN1?=
 =?utf-8?B?c0JqMUxoZGUrTTJvLzUvQmNiVHc1S0RGeFR2YVdvUS8xbUVaYlVoTGhMeHBO?=
 =?utf-8?B?VVdJaEpjaktEUUlhUlRXeWdrYnhGYkNBVThQd3JSaVdVTnZkdWIzc05wKzRP?=
 =?utf-8?B?NStYWEdkcXRxbVhCWGdlYzNGSW5Cbm52emVWRHdpdjhCVEpGR0ExNzBsbEli?=
 =?utf-8?B?clp1cXA3U2JscWp1eWRHNVBOendiVXpjWU5sWGZkNEdKMDF1V2NDQzFtWmtY?=
 =?utf-8?B?eTYvRnp4MFZGQ08xZytneVRMWjBUQ0JTajIyYStZSXJva0hVSFVOUm0yWDdZ?=
 =?utf-8?B?blJMNVR3KzZWUVM5SE1vU3YreEZlY0NNaXFrYXpnbjR0L2NIR0lER0U0c1hM?=
 =?utf-8?B?dE0xMzRiSGtKYXhieEJYT1RPZ21vSmJ5V2lsRTJGVFJoc2h5UGdRRDR4T1JD?=
 =?utf-8?B?WjRBVzZhTDcxSWJNS3g1YlliVm1ySEtRZnMxTUFXZGVpNjczQWtOT0hZZGUv?=
 =?utf-8?B?bEhCS3NvWWs2c0RUQ3pDZTVtSWd3UmNPeEFtOWZ6SnNCeVZBMGxaOUZUcXFQ?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 111f936f-c9d7-46f4-d5e5-08dd9d478a81
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:54:35.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUuOIkPhVbYZ+0sE/RIf75dfHdftLsisMyYXi4NcAl55JXlWIotMSbbaU1bEfWQY+4gtWcxgR/T2mF0Ve4a5pYUnzrcFa8PVJT4lhsBRIjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com

Hi Babu,

On 5/27/25 10:23 AM, Moger, Babu wrote:
> On 5/22/25 15:51, Reinette Chatre wrote:
>> On 5/15/25 3:51 PM, Babu Moger wrote:

>>> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
>>> index a2fbea0be535..2f54831e04e5 100644
>>> --- a/arch/x86/kernel/cpu/cpuid-deps.c
>>> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
>>> @@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>>>  	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
>>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>
>> Is this dependency still accurate now that the implementation switched to the 
>> "extended event ID" variant of ABMC that no longer uses the event IDs associated
>> with X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL?
> 
> That's a good question. Unfortunately, we may need to retain this
> dependency for now, as a significant portion of the code relies on
> functions like resctrl_is_mbm_event(), resctrl_is_mbm_enabled(),
> resctrl_arch_is_mbm_total_enabled(), and others.
> 

Avoiding needing to change code is not a valid reason. 

I think that without this dependency the code will
still rely on "functions like resctrl_is_mbm_event(),
resctrl_is_mbm_enabled(), resctrl_arch_is_mbm_total_enabled(),
and others." though.

The core shift is to stop thinking about QOS_L3_MBM_TOTAL_EVENT_ID
to mean the same as X86_FEATURE_CQM_MBM_TOTAL, similarly to stop
thinking about QOS_L3_MBM_LOCAL_EVENT_ID to mean the same as
X86_FEATURE_CQM_MBM_LOCAL.

I expected that for backwards compatibility ABMC will start by
enabling QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID 
as part of its initialization, configuring them with the current
defaults for which memory transactions are expected to be monitored
by each. With these events enabled the existing flows using, for
example, resctrl_is_mbm_event(), will continue to work as expected, no?

This would require more familiarity with L3 monitoring enumeration
on AMD since it will still be required to determine the number of
RMIDs etc. but if ABMC does not actually depend on these CQM features
then the current enumeration would need to be re-worked anyway.

Reinette
