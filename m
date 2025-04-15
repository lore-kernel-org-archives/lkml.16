Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C95E571;
	Tue, 15 Apr 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733382; cv=fail; b=Bp9AwEZ7ZtuVtEr2t0/6djP/6/EEOrPBQuwL5LmlTAejWGHrvu1edah1AWfsg8wHHxZGvir8PIU6jBy+DlG+we4DtZcXVtKLISqsVt4hl064UOXfqxL0aFHyjcVC0sebe8QV81RE5tSOQNAO+BKYUaqEXgloT0VU9CGxoCm61EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733382; c=relaxed/simple;
	bh=TRm2/NSygqbOnHYVbKGolh9NJF5INpB1ZWPcvRJNDoM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rxPCySPh/avrWYC+aSeO6TELsQ9BD/94oZMKDXvjZxuFzpyP+Vz7NmZMJCorZ2J+FAfkjflGqNmpBXHmP6Ye4v2J35u/uxIGWs8Ia/Oy7NxLUoaSvRcKdpmbDIGUTQEhZId6Bbk6UgI3UpVZ5T9xEwKwKB5vJt6Nqn/B7Hg75jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYs46EJY; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYs46EJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744733381; x=1776269381;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TRm2/NSygqbOnHYVbKGolh9NJF5INpB1ZWPcvRJNDoM=;
  b=IYs46EJYN/I6yoFosMzQkT+WI/JvcDDM0TTflQSyeHNfO1et99uuaNxB
   S2PYPfhSO8k2xY6maxkladhv1QNYoACebWOYkvHXT4Re90BRHifl2OFQw
   VQMgMAxIV1lkoXO6Dfnkpw1Q77bQi2/EDd//MwS4p5gbqD13X4DRenCgJ
   MwEO/xAWvwmeyHngIrsIrOAqXB6z4wfMoOS78a4Ot2hh/J7wBB5s/yGxu
   hLjELObS9uzsmFKaogsVhGDsP/IvR1b2wvxOyQSIYmzIFNQkL97x3AqRT
   OjBQXzLHwm73zEVsDMW5iWaXTu2zyKxpDOJp0fguiiiGtkHnXFebP41Bp
   Q==;
X-CSE-ConnectionGUID: kslhCwIvSLi3HUxk5oSWzQ==
X-CSE-MsgGUID: EgGP7y3eSuO5h16v2W8bSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57636949"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57636949"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:09:40 -0700
X-CSE-ConnectionGUID: GprlBUIBTiGJqy/cvUNH5A==
X-CSE-MsgGUID: YnjRGSDHRTyvezUTtLoWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161194848"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:09:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 09:09:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 09:09:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 09:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9NCHSyC1nVrP6td88K1p6uWfvk8fFeO2BRZ4cdfU/olpU30bF+lOjnX+IjcucWNPmb0Z2iFCmElTo38+Cn9BGAjLf2FxfPHnZJzr2XAyI7lf63dy9p2DVVdaZXEXbY2rGF7wmk+IWGzBNufexreUzwULD/A6WwDMmCnaTrjqoSWf/6GNio61ZnCy+t+QzvDazc+qiOnArB2S4nFmaLyyqAbz/AP8UF8Smiww/J93mkR4+Hr4ji5Dz8H73NBDkwYOMWfY0dkjSu4K+89QpD6h/X1RILQvZ5rWV/v3m3aYVO7ciuGgDMmrWatWw/T2dRiY+7SKIcWzcgpfzA8MANyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJakquFaYjB5koKVtsMCMGGIPpHZOuCxbd2ojVoBL5I=;
 b=V7MHLHh/6SxSMvl/L4fHnKSnM9QiDBwJisnd/t2F0wJZWek3r70OOaLu0mDsKYKt6Xr1+aAx5ake6BcVP+02ltdU+l+3maukV7XTPlx2AaJf0WNLOt45rgl8YJk7Ys7o60m363DH9uAIjzFBHECVXF24ilq5HnwEer+16PDFZSr9mlWLY93rGsWN5HcG4vkd0cafwlaFuDdc0C2V08WA489cONfK9Qp8QXgBjReDzZZrYP/kh3p/R6yBlG2I6StUXq5rlLUL/FoANXYxPBcRq3sf5EN5mXTT6+gXC8rxrMqHv2BhrKwF8OERsg6N4UzdZniMhhF19qBnJoL2Tj20XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 16:09:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:09:35 +0000
Message-ID: <dc736f74-ea47-455c-b27e-254277aa4022@intel.com>
Date: Tue, 15 Apr 2025 09:09:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/26] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
 <74255838-47dd-4e18-b458-f9488b38b9e2@intel.com>
 <44c82df0-30e7-44d1-8759-c8f3df68e538@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <44c82df0-30e7-44d1-8759-c8f3df68e538@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: c551baeb-6f6c-4cf4-03eb-08dd7c37ea4e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9EaVgzOUh3SFhlc1JzTHR4NWd0S2gyalV2ZU8xNmhpWHRPTUIvdlFkQ0Iv?=
 =?utf-8?B?MnBtS0tFOEtRSVNMVmhhZU5xdW9HMjk5d0NOT2lwdDZVSFFRQ3BTQlRzSy9E?=
 =?utf-8?B?R1JYNVpQVDVZUkM4SHk2b1FyK1VXSG9zUjZrNWNxZEpYYW5scVBrNFJUN1dL?=
 =?utf-8?B?T2s5NE9GdHp4bVlEQmNEeHBQc0VXYXc4SFM4UXBRNEtudG95empIMCtYTjJE?=
 =?utf-8?B?bGUvbGM1YnRNd3E1YXdzK1p4WGhUL1NqTnNETEJLTzhmc3hVdXg1QW5aaTVh?=
 =?utf-8?B?NnE4YnVLRVpyVHI1ZXU5NzVEdFRFNXpjRlA1cE50SzNzVm5sUXBLRGQxVlFW?=
 =?utf-8?B?STIzVVR3Z2VnMlRlcjRVZjFDbERRbWhvaDlCUGdhRjc4eTgxVktmVWQwYW5D?=
 =?utf-8?B?YWFnSHhkWkNVYmJpSkFKLzNwY0pkUDYxTWFjNXFwM3VzbE9SZGJTZXFMVXhC?=
 =?utf-8?B?Y09aQi9TK3dKYUExOUV0cm9ESVVuNjZpSDFmL3VZbGM1S21FRzIzeGpPRFl4?=
 =?utf-8?B?UXJ4WUNyU09aVlFLTnc4bHU3UnpML25mL0FxYTJoOGoyeWJzMEFsSTl2Y1FJ?=
 =?utf-8?B?N25ESThSZTUvZUpnYmVBQlJYZldRYVcrNFlLcGJ5SXFjZmtUN081TjRZWjNl?=
 =?utf-8?B?OWdMd3pCRWZqUnU3a0VYT0tzd254bHE5VHhkcHduZ0o0ZUlzWjUyQlM4YzRk?=
 =?utf-8?B?SjM2aVN2OHpIT3VYNzdrWDRyS0NsV2NocXBtMEI3NUxER01UbWcvZ0V5TEph?=
 =?utf-8?B?MFNwZVFiWXI1bWMyVC8xZ3hqMlU4UUwvTlVjRkxSYUV1K1VTTUxOTlZyWGhT?=
 =?utf-8?B?MmQzb0p2Z0hSKzJBVEhKbjhpdTkyMklaMWFVYVk4Qm1LbGtKYWc2K3BWaDFL?=
 =?utf-8?B?QllNMzZHRnIrTUZLT01wWDhxbFRGNWxpdVpEWFl2Sy9xYThycjdWUnNjbHFw?=
 =?utf-8?B?Vk5Ob21NSGQxZ1JIRTFydjY5NkEvR2NUOTZSUE5FTEdyUUhNQ1ZBYnVCdFdE?=
 =?utf-8?B?OHhNcmRvREhUNUJ1UnpaOWNxbEFaRGNRUG96VDk0UG5ZbzdxOFlrMlJWazRR?=
 =?utf-8?B?bnh4NlZzWVlSZi83Mlp2RW9oaS9DSUV4RmdxcE4zck1qZytOeFZLZ3FsUE5C?=
 =?utf-8?B?QnZMSkEvWlNkeS9MNzdpZ3h6aE02ZVpvRjVLSll2VEF4cWNHN3hYM0Zrd21M?=
 =?utf-8?B?UXN1RzBzYUNEQ0E1cDUyZXFYZHZ0dlVNYnhtdVA0a1E3cEM3Y05FZjJzU2tz?=
 =?utf-8?B?YkxUalRFcnRncTA3R29jRHVab1RUbHBmQW9jK0QrOGR2enFmdWRvMnpzY0xC?=
 =?utf-8?B?U0RyT0xLV2QrMnhtaGI5dnlhRlR4Ym03ZlVtZjJIbVBramZFMXdBS2J1enV6?=
 =?utf-8?B?UjFRWm1JRGpxSGlmblh6SGNvd1cxSVY4ZjhnS0JLOU9wc0cvdUMwQm1GT3li?=
 =?utf-8?B?NlR1b2dUS3k4cy9rK2poSVI0MmhnRWZjUXJNUFZFeTdYeDFnVVJNMnhZN2tI?=
 =?utf-8?B?a0xBN2JCQ3UxSnJvNVlJK3NGQkthRGRiZVlZUHcyT3drVDVBTTlQdit3QVRT?=
 =?utf-8?B?a2FvVUhsRVBrdG1Hd3JVUXpTQ0tweXlRemF5eWhDTzZ1NG4rS3RoWTJqOXRW?=
 =?utf-8?B?L2gwNUxCTmpXMzZRWnB3R2RGdC9IU1lLYnhGMzliejE1VmlBZjY5aW9oOEFR?=
 =?utf-8?B?NkJRRVp0VDR4UUVVMDZpclZOdVk5em9hcEVPbUp4WjV3Mld4WTdsdmNWWUl0?=
 =?utf-8?B?Y2w4Y0ExS3Q0NHdJM3A5R29CS1FLNUFSZkp4UHBhNUptd2s1ZlBVTHRWOUJ5?=
 =?utf-8?B?ejR2WGtsc1I5ZE1UK3haUWRZQkNPK28wdUJGRGNMeTR3WTdWaUU5Q3Y2U1E5?=
 =?utf-8?B?ZmgycCtnUWF6TFpqOWszc1NiWkk3MGRQL0p3U0w5SUxMQTVkRjBHSzFNZ01s?=
 =?utf-8?Q?9gUzRZ8Q2GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHppZklZdVNqdE1CYVhwL0JGRUpKOVQyYnJpNHJPM3JOVlk5NUVnbUV6cVBh?=
 =?utf-8?B?d25MS2VaSWF6RkRBUDk0b09BVnFWMEhaMCsyVU9RUksva1NsQVc0NVNPbEhs?=
 =?utf-8?B?NkgyNXBCelljZHh2b25xMnFxWldCSDdmMngwWTN4c3laMDE5MmFzZ1d2bERB?=
 =?utf-8?B?MDRIRHFIRW5DWlBUeGkvOFVWckg0a1NHalNiWVBhYkRSMkplTng3QWJOazdS?=
 =?utf-8?B?cG5kVGE0Z3o4RnlxQldLNFRVUGJkRXJrUHhGSUp1TnBlNHZIMWFuTm16QlZ6?=
 =?utf-8?B?YVhDdTZDRUxyS1NHWGVPZm5mN0VLSmJPYzhDc3BSMER5ZkNFMXhrajNnQldh?=
 =?utf-8?B?clcyc3lESzRsOEZhZVE2dHdaQmJGNnF6ODF4ZW1CTnlxZEJ6QXRkcldVNWdZ?=
 =?utf-8?B?SjlXcDNCblltY3ZXeGJ6S2NsbjBMd0NHOFIxL01UR0UzNVJzMlVKS1FSQkp4?=
 =?utf-8?B?eW4xZCsrbGRocVNyK0ZzU3VtbVduRmFmNUZ2eE05c3E1aWxtNHZ0T0psbmty?=
 =?utf-8?B?c3QraDFuRVMxanQ2UzVncmhzLytid1VNSWJMcUIvMHY4OURZdTdLeDl0b2Na?=
 =?utf-8?B?bnlGS2crYWdpRzZqYWl0S3FqVWxZRFd6Z0piVjB2SmZJa2taSGtrRXY2d1Yy?=
 =?utf-8?B?TTIvRlNNQ0d4YXZtbWlibEVoRGE4clIwTlVQNzBDTDdwVm5uZWN4OWlhZE8r?=
 =?utf-8?B?ajI4b1RvZlJ0V0p4OHQ3MU5KNGhJc3M2cFE4N1UrRmEvc0xBV21meldQUVZI?=
 =?utf-8?B?Tm1FQWxOVzJiUC9VM08yVDJIaHYvM3BCRmN5Z2p4Vm83WlEyMWdwRENSaER1?=
 =?utf-8?B?ckkzL2dDQW9DeERQRzB6NmROY09sMlZZVDVReDRYd3JRNzFVZi9RbjJ4YjFE?=
 =?utf-8?B?VmM3S0ZLYVNicllFdnNDL1NESEROSDZJYnFwSUVqWWFBU0dJTmF4UXFYc2pJ?=
 =?utf-8?B?MC9UaGFZT1RHdnlQN29JNGc3c3pOeUF4MUxJd2o4T2djbTFETi9lNVlDMXk0?=
 =?utf-8?B?OGVsc00vSUh1eWdXS090c3BlbXg5Z3BoSmNWUzM1YTNWTEhUZ0Vta2lLUGFj?=
 =?utf-8?B?c1dYeis3Q3VvRGxEZmtTQjFMRG03QXFSU2x2Uk1kRmVvZ1c2RFlncGdjL3Qw?=
 =?utf-8?B?aXE0blpUSFdsc1E4U0x4MnpIaEhIMit2dm8xMGhSNDhyNU4zVU11cDZBTjMw?=
 =?utf-8?B?aSsvNG9JcnJhdWtlZmR1czU5SVRVZmlrRStYdmlOQ2V2bWY0aTJtNzAwc2ZX?=
 =?utf-8?B?WVkvQ2tEOXlaajBMQmVzTllIS3d5Z0JsQUZndWN5WStHNjh6YjdhWHM5NG9s?=
 =?utf-8?B?a3pJTUxCOWFWd2sxS01wUDJkdzZoS3F0dS9TaEpwTm02RlhObzVKcVZCNUdI?=
 =?utf-8?B?Yk5TNUVnUlc5b2g4WDlTL3lRYXZtaVdlanpWdjlpOHdENndrV1hLNWNTWlFy?=
 =?utf-8?B?OFUwVjQxbldrTU0veW55WkozVEVtaE51RUZOSDdLSGxpWm1BSWh6VXYycmdr?=
 =?utf-8?B?NnR3cjJINXVEemFndk8rbER4ZytLUXlzZGZsdVZyR0oyVlljSHNMNU5OUUZ6?=
 =?utf-8?B?aW5WaHVLQTd2S0U0bTVnbktENS9MdmJoNGIvc20ybzFHQXcwZDd1dkswT3ht?=
 =?utf-8?B?U1pFSm5zVDVqNGZXUEQzaTBuUHh0eWpMaytkZEM2Rkh6VHJxMHhCWFE4SDBQ?=
 =?utf-8?B?TFQvOW9hSjJTNGR0b1ZFMm43Q1JldmtpK2k3N0JEL3V2OHRDZXRKZHhzVnBI?=
 =?utf-8?B?WEhmc3lDalFRZFpnY0M2LzY1RnlNaVNmSVFaVlk3NHZCdU1saG1hSzdTczZm?=
 =?utf-8?B?a1ZRMzY1VmcvWWhsbHByS1ZBSjVNWC9ONWdSL0dPc204UnFYbGIrTXV6Lzcw?=
 =?utf-8?B?OUtRcEJzek5pOW9RaVVTam04cHlGMFFFRk1ONWJESVhkT3Y4N0lvaS9NbitK?=
 =?utf-8?B?d3k4MVJBbDVSTmRGWVpsSGljV2RweFgxd3lwRVFnQ0hmRHJCY2R6VUtJK0lP?=
 =?utf-8?B?UkNTdDZ1TkRHeGprU0JMQWdzQ1dCZnRxQlo1ajI2bHlxSGhYUkYvZm5XQnpJ?=
 =?utf-8?B?S2k5bStEUVpWNjJHNWM3bDB6MmVCQ3ZOTmtKNlpXLy8zQ3V1THluN3V6cmpm?=
 =?utf-8?B?SVdFMDN6dmZNNC9PV3BFaXEzTEFCTW9wdTdUdmdQSDhYTWJ4WTNuMm9CVUQr?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c551baeb-6f6c-4cf4-03eb-08dd7c37ea4e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:09:35.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnj3W4l0/gm1vEJDXWU+lFL0QYtofpiRFKbroSF/iVhEoNhKEg3ESa8WC7Ve6kQpHPt7VeP8euejGyyn836Ums/TwLqqhjj+OURqrZFfRA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
X-OriginatorOrg: intel.com

Hi Babu,

On 4/14/25 10:48 AM, Moger, Babu wrote:

> Here is my proposal to handle this case. This can be separate patch.
> 
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index d10cf1e5b914..772f2f77faee 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1370,7 +1370,7 @@ static int rdt_mon_features_show(struct
> kernfs_open_file *of,
> 
>         list_for_each_entry(mevt, &r->mon.evt_list, list) {
>                 seq_printf(seq, "%s\n", mevt->name);
> -               if (mevt->configurable)
> +               if (mevt->configurable &&
> !resctrl_arch_mbm_cntr_assign_enabled(r))
>                         seq_printf(seq, "%s_config\n", mevt->name);
>         }
> 
> @@ -1846,6 +1846,11 @@ static int mbm_config_show(struct seq_file *s,
> struct rdt_resource *r, u32 evtid
>         cpus_read_lock();
>         mutex_lock(&rdtgroup_mutex);
> 
> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
> with mbm_cntr_assign mode\n");
> +               return -EINVAL;
> +       }
> +
>         list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>                 if (sep)
>                         seq_puts(s, ";");
> @@ -1865,21 +1870,24 @@ static int mbm_config_show(struct seq_file *s,
> struct rdt_resource *r, u32 evtid
>  static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
>                                        struct seq_file *seq, void *v)
>  {
> +       int ret;
>         struct rdt_resource *r = of->kn->parent->priv;
> 
> -       mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
> 
> -       return 0;
> +       return ret;
>  }
> 
>  static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>                                        struct seq_file *seq, void *v)
>  {
> +       int ret;
> +
>         struct rdt_resource *r = of->kn->parent->priv;
> 
> -       mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
> 
> -       return 0;
> +       return ret;
>  }
> 
>  static void mbm_config_write_domain(struct rdt_resource *r,
> @@ -1932,6 +1940,11 @@ static int mon_config_write(struct rdt_resource *r,
> char *tok, u32 evtid)
>         /* Walking r->domains, ensure it can't race with cpuhp */
>         lockdep_assert_cpus_held();
> 
> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
> with mbm_cntr_assign mode\n");
> +               return -EINVAL;
> +       }
> +
>  next:
>         if (!tok || tok[0] == '\0')
>                 return 0;
> 

Instead of chasing every call that may involve BMEC I think it will be simpler to
disable BMEC support during initialization when ABMC is detected. Specifically,
on systems that support both BMEC and ABMC rdt_cpu_has(X86_FEATURE_BMEC) returns
false. 

I would also like to consider enhancing mevt->configurable to handle all different
ways in which events can be configured. For example, making mevt->configurable an
enum that captures how event can be configured instead of keeping mevt->configurable
a boolean for BMEC support and handling ABMC completely separately. I hope this
may become clearer when using struct mon_evt for ABMC also.

Reinette



