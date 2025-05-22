Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF1284B5A;
	Thu, 22 May 2025 22:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953759; cv=fail; b=FF/MPeOP/j99mA5QtPylSD+2ISjVc6FXF4DZlsY04y1bTHjBURWDPojvGeBvu+SEUQ4gp2qq4U+3sH4ZyqmgbR14hUwSm0y1GVnJ30ohvL4AlERUN0rSYTN4V/kSEYPd2aBQdHInEeRpc+WJ/CuDOERjk0sM4qJiDoBqAsNCzvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953759; c=relaxed/simple;
	bh=xxFzCADpw+zkF9umekBlpjxEWsfns0Ce3VM8N3qKQSY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EizRFQf3o46NKkvz0kfjyArnhb9yxPqVluBQyPfXglEhMUBeE8f5pqpbOX4mba8VghukYZmEe6W8UedTryYNOLh9AT4Eb3cVcvErc5PyHJtsivesLrHhMhCIY9IVm4USYOS2cOenSh0EJAAyMqVRd1AL4PAgcsjLHukNNMQX/fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRkWMPIR; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRkWMPIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747953758; x=1779489758;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xxFzCADpw+zkF9umekBlpjxEWsfns0Ce3VM8N3qKQSY=;
  b=HRkWMPIRdhd9hAcyfsfVMUNDaVaS9RR6FJ/J9qWAThjDClVPQN2PaL7k
   gbwkY54b85xtxrWj1Mkt5HdJMbfhS+6NEYxhgJtWg6hdQPstCZOAV7Xcg
   48GsDTeZVW/o/SwsZbchGti0Mptw+V6prcVmiRvoCqFy1SY/dZdURdt4G
   E9HcimyMzMePZweemK1jvKZzApcIj+0XFr4O+I1zMNsaCJs/B0wOByzZ3
   0wlTPUV8hwciKmqRbJaSS3j8X8KuuMjMuBV76MhF51FyP2wcYJDuGbgHB
   FKFULQKPT6ITRWu5yf1RZt4Yi6r4aYZIH8RYRWGxTI3zslZPTY9z+W/TQ
   A==;
X-CSE-ConnectionGUID: +dDaxc3AQIG7AWR3hLIerw==
X-CSE-MsgGUID: LR+yM88gQIWy86iRbaawqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49922779"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49922779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:42:36 -0700
X-CSE-ConnectionGUID: NO3Qs+tSQySJBHxcUxCzVw==
X-CSE-MsgGUID: 0xgMCqSNS8eAoB9ztAtRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="141319722"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:42:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 15:42:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 15:42:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 15:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+I4HnIW3LLooVT4jyMhwV8zmE22IKcfDIwy4SbxdPToMrmM+e9kObBeGfH7DtXbed0rzysNG9GWUF9/bpUr3yiqYvJEkf/f+/4Sxgu5mgBLOeH/LY+74liiMJsCIqXAq8weG9YIiuS5WxBeOmTfXIwaP+YzQmD+WmWZYtyG/BMkD2CLqOSZWvf3VzzCca//4jhhevV2rNaq1LoCZLv/VtwNWKp7hcj2hYvT3MZ2TjozMM7KCzKVNe18lGgGSY6ovPyUprhdUAkwBTwtf5xpbbWbMSBvVoQ70GHGPFks237vXIeW819/Gxd7nb3Nm7UYIHgJ1xeSpMEM0Kk50B2+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkfREcYDmhqvgEoSPigWMo/wvTNZPGTQZro1Ty2kxv4=;
 b=xS24ulwJauUiVLmN/U5wlzz2LvgIbBMXwsOIMzLzAYDs21EAedJwuXPDc2z86So+SDmLQ3xkyU7J8VfgkKh5lmY6qzwzdfZ87pOdZDoLbMnRFag8F2n6YP0pB7OMvgy6qwVSut3+imHkzWhZcZtu348lojFePzkxPknaT3jZX9/YtIw37DWgxSFZMfD3Thy4o4K+Suq+Eizm8AOraR4xEB1gPAJbLFMiPnzmQ1YZEdWCML85T7E9W1/1o3R98l59YcBr10Gb5D67fg18GTGR6zrl9nqcJvy5fj5DqyNK4PPJ83TMazb2ogqcAZO3XOo6bO48AQB3/Vd6xvyNvbLSxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 22:42:00 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 22:41:55 +0000
Message-ID: <9b38056d-c0f3-4e28-87e4-413225fee91e@intel.com>
Date: Thu, 22 May 2025 15:41:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 13/27] x86/resctrl: Add the functionality to assign
 MBM events
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
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
 <690c1af39c9f7d4d9d5a1f2f84e89717bb756f23.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <690c1af39c9f7d4d9d5a1f2f84e89717bb756f23.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c25db0-b911-4892-e984-08dd9981da8a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TERHdFJ4bU9uYkl6cUM0eHlsY3ZQTGc3elBtenZheitnbGRDZFByaEsyR0Z3?=
 =?utf-8?B?R1Jxc2dubTkvOCtJTG53WWd4c1U5R3JiR2NzdU9DRDZtY1Q5ZHRhVTdaMmVQ?=
 =?utf-8?B?Nmt0a2NFTXhZczNwN3JyK3FVLzFkcm5HUmpFcGVaaDI2Q0xKQnNqMGQwT0Vr?=
 =?utf-8?B?LzZRbDh4YytRN1BsN2F2bzJNdnBUT0tmb29XcWdJbW8vYnZCUjhxOUMzWnNL?=
 =?utf-8?B?eFdGWVN4U1ZaSXhvQkRtL3REZ1QwZko0NlhEOWJhcUx0cHF6MWg4bDRxRzF6?=
 =?utf-8?B?b3VLU1pIVE9HR2Nrd0FNTUxNNHRVV3AxUjlyVkhNMnNuaXVST2dNLzJIeXp6?=
 =?utf-8?B?b1ppOHcyNUpmYXd2SDhWTXJxZ3BJM3Q1OVIzMnpUYkttWlg3Q1hCb1lldUIr?=
 =?utf-8?B?TkdUUWx4WFpTZTlIZ2VpWWZISkkxSWpBeDYvMkVwN3BnUDg1SFpGTkJRSDdF?=
 =?utf-8?B?VnczWSsyUFNPT0UzR0lRVHlrNmVMQWl4T3VFTzVGTUl4aEtzMnoxRDJlZHFO?=
 =?utf-8?B?VThGVy9hd2w5ZmhTRWRFMlUxOUFtaUprMEFrWkpBemV1Q0JIQ3ZWeUFQQlRy?=
 =?utf-8?B?TnFPMFpxU2QvNE4xN2U5UC9YZStxRFprVWtKREI5MTFmNXJhYnoza3Urdlli?=
 =?utf-8?B?bXhyVEVKdVNMMVh0N3VMR0ZhNUJ0d0tLYklBNGxvMStpYXJNaVZKSEc2ZmVJ?=
 =?utf-8?B?dTZxbmZyNFVLdzBUZG9mOXBTL1BMLzBjOEUwOGwvQ3F5b3hjcjJRcjl5MHAr?=
 =?utf-8?B?TDRpMnFBeUN4QzljQmo0OFg4WEkvaW51bjNqSEFRVDVnUDJiUThzRXJBUGRJ?=
 =?utf-8?B?V0hXcVNNL1FXcTJ1WkEvandqTms1eFBGQ1JGVjU4ekdjRjl6RitJbDNLQkVz?=
 =?utf-8?B?M1hMa2EzTEVXeElqekd6SVJjYXRQUGlwU3ZocHZKR21SWDkxME1yQWFwdG9i?=
 =?utf-8?B?TWI4ODZPamZlZXE0NTRYZ3VDdndVL241UUlqaFVITGNFTWxQaVkvbTNmTjlT?=
 =?utf-8?B?ZFNRL2RLcUI2blAyMmYzREdLcndHczhIZDhWbk9Ud2FLbUhBV0pKV05DMWhl?=
 =?utf-8?B?Q3BGVDllOW5aTm1jOEMvWkF5YTQwWGQ1aVNXUG5SYjNtaEVJTEZZWm8rOVFM?=
 =?utf-8?B?WEZOZSs5YzhvTkVkSVhDb3F1ckFhNEhFS3Z4WU5Rcy83WGg3eGFZTWcvKzRm?=
 =?utf-8?B?UGw5VWtLSTlyTzk5WVhldzdSKzdwczQ5MXl6SlVmMUJqUlpsSURiak9LM3NI?=
 =?utf-8?B?bXg0ZVVnMTN3aVVXZGRJV2R3Q0NZMzZLZUVnYW9HMFlSVTRrUHFEQzFDN3dW?=
 =?utf-8?B?dzkxWC90VnVMbFhVRkpYVmdNY0c3MTNYTTR1V2J3ZEhNM0hyMjh5aXJwdWFh?=
 =?utf-8?B?Z0FFdXRiTkt5NG43SG4wSWJMWmp3c1dueG1hcUVSVWdFc3I3d2g5dmhIaDZN?=
 =?utf-8?B?aTFnNng0S1h0Q1JSUDBEd3hHTWs3VWxNRHJHSUdjRWt5WUlyV2o1c1cwRExx?=
 =?utf-8?B?Z29uYVpvOHNmWEF6N1ZhSktFakhMOFRZWkJTaTV1K3JOZk54Vm91cXp3VC9F?=
 =?utf-8?B?aGVQalA3aEdFSFlTVUpDb1c2bElJYllnTHI5S1lQWHVxRzl3MFUvM1N5K09t?=
 =?utf-8?B?RWJCNFFVelFnaE8xa0VqalJBd2pSV001YVlNSDh1eURxR3dHakN6UzZqNTdP?=
 =?utf-8?B?dGd3bHJvVnFUUkxEMVlDZExxOXRVQ05raDZ1Y0twSWNpb0pIdjgrdUVMMHdR?=
 =?utf-8?B?VnNHMG5yWVdoc1d2dXVyNlJ2WW5ta3RQVlNHOTRxMHNEZlk0SlBCR0hQeDJJ?=
 =?utf-8?Q?5CWBBn00VwKMkjJ7WyoXHvvzn43PCJJ39DIOc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEVKL29qUnBOOXAwTWtTWVdlemExYXI2eGZnam95S1ZuOURZOXlsTWZBNnBV?=
 =?utf-8?B?Y3NhNnZIWk81aXFhcXZIdXpsQ3FkOTRUUHdMakhqVUJhYndyNkxKc0ZWMlJO?=
 =?utf-8?B?TTdKZ0xFeGZyZ3dEQ2hnYWRpS1ByREtSdFpQM25UUDlMNnh4UlBtMWR1Z1Ez?=
 =?utf-8?B?QkZWb0QwaUxrZkF4Z01JTEpxNkR1WVM3MmtBRzNFdVNaMmV6eHdNb01BaVJx?=
 =?utf-8?B?Uk0zcm1xelg1bkhLZUhZdnA1R2w1ZjFxWUJyMXphU2VnZXpjd3lKNmYzQTdF?=
 =?utf-8?B?UGY3NDk0QUs2cE9aQVpKcmdQZkJ4dEkrVll2Tm5zemFLRTZwNmkrNi9vK3Bt?=
 =?utf-8?B?cEV6WkVSenVZTTdUQTNsUUdTRFp0eVZqL3hLQ005ZWh5K014S2U4TUV3V1JM?=
 =?utf-8?B?VjV2TWdURHIrcGJoa0RML2lCcndFYXpqTUtDc0h1RUxVSTNNd2lFdURvUVhE?=
 =?utf-8?B?T0ZMSHkxeU52YnREZXdLUUprN1Zac3pwZ1VPVVkzdUhzQ3JlZ0RJeEJwei84?=
 =?utf-8?B?ZkRMVmpKangxMWRKNHZEU0NoNm5vWjJUd3lPRlJ6ckRxa2xsbnN5ZVlpRFVj?=
 =?utf-8?B?aTcvTkpDTVVxbE51SEt2TlQza29MWUJyV3VsVGorZ3h5MnVFd0tJQXFqZnQx?=
 =?utf-8?B?ZWtJelgzOXdkRE4xZEtMUjAzajNtNlphYjdYZTA0K1hlYVJHZkF5YVQ3VXNu?=
 =?utf-8?B?ZzFyYTQrcGNkM25mWE53TUpCZFNEZ3JkS3NPa1UxRExlOExoN1JKNlJpVlJF?=
 =?utf-8?B?VjZDMWFwaGw3OGxneDNwY0lnLzZ3Vk5Fd3dUZnlGaExBZjZFT1VTOFo2MFl5?=
 =?utf-8?B?OEppL3BadjduWk9KMWpxZTIrNW05SjlmUmh2K2JJc3d3YzIvakhWMEdRbDFK?=
 =?utf-8?B?V1V4YVhZVDBqbTA1dVNDR2JFZ2MvbkwwaFNEV0FpTW02cW1qSHNxZFpib2V1?=
 =?utf-8?B?UHk4UzFybGFGdlVmcXA3WnhxZ1BPMlJVRGU3Y0NZaXM4NlZPeTZhaDk0NWpp?=
 =?utf-8?B?UTRnOGpQWGpWVG1KZHViNVNUckJiWTJhWHFqcS9sTzAxeXJxVGFOUUppaTJZ?=
 =?utf-8?B?ZWk5elJnNkZzS0tPeFZIN1lLd2ZuZDRna0U1ODVMYzRkTEpiaHlHNWQwVllZ?=
 =?utf-8?B?QldUMm5wV2RIR05nT2hEb0NTSzRHR2RlM0YwS0xRSU5MajdoY0liUytDVlhh?=
 =?utf-8?B?Tkl0a0J1b0pjei9NSzFDSUlTeGxCcXRBakIwVWlnb3U0bEs3VCtUdDA1eWw2?=
 =?utf-8?B?b2poeHl1c2ZLR1d5dTFETlNjMlFSd2k0RlNWSWtOVThSNWZEaGxQQ21zbW50?=
 =?utf-8?B?bGhaZGt0QlZBZ1hlb3IwcHU3bWQ1WmNkSjNNdG5mdkg5YVpOaUlPYXZkeGdC?=
 =?utf-8?B?ZVVLTFNpMkxTY0pWRnNENlc0SGIveHUzUXcxU09iN2pSY1NxZWhsZnZDNk42?=
 =?utf-8?B?RDdQbTBiR0dNWnh6VVJ6YXUvQ3NUcXZxTnIveXpWN085NGM5aUN2QmpCNUIx?=
 =?utf-8?B?NjQ0NXdoWFZ5UWx3d285R2JocEhreGdwVmxMSXd6d2s4elMyUUlzb1MwSko5?=
 =?utf-8?B?T3hmRDQxQk5YVWNzNXVXczRldktaUlpGRlBzaTFOV3hOQ3lzdTdVR2dKOC9a?=
 =?utf-8?B?TW5TMk9BNlRQQXB6T0NCY1Y5eC9wcWZRTTBueUtCY21tRkVZSkVhWkg0ditO?=
 =?utf-8?B?Z2JicXduRzR1K1Q0dnp6R0MyR0I3bGlDTlVCblFrVHRueUFSVVBXR1h5aEJn?=
 =?utf-8?B?TklGaVg3TW5MYlRoNEFkV0ZhOW5qVUJuTWtsN0lORndKZkkvc3BiYmdOWk1M?=
 =?utf-8?B?Mnh0OG8yVkVSc0NZUEFvMU5YTnJ3bDUxZ2Y3WkFtTmowRlV4ZUVqTjQycnQ4?=
 =?utf-8?B?aHRZdm0vL283SFBDQlVTYkI5eUVBOENQWThzWkM3elkwaUkralhDVUNYVDJS?=
 =?utf-8?B?b2JwV1RiTnVyZ0Q1cldlY0loTFp5YVUxMFkvYm9ZU3NHSHg4Q1p1d0w3cFVv?=
 =?utf-8?B?VVNLR21GTG9MbzBqWnJKWE5IVlJuWHdHNTJ4ODFodDNBcC9BeEJFWTZ6RzRD?=
 =?utf-8?B?MnlKeElXYVZFK21US0s0N0ZwbEJvSVVaSjFsT3duWmU0VjFCclRicmo0eGo2?=
 =?utf-8?B?a2pUSDdwWFdrUjlXUlNONVBvUldacTNhSTNzOVZ5SkNoU05kcDVTbmwyT1Q0?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c25db0-b911-4892-e984-08dd9981da8a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:41:55.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTPtEH2Stu+66cw7bvg/NdfdXa/b3OxbI2JOIXeLRmq+c7R0PScA2CIEmsBYpKo8d6NiiHRxXT0VuEEZQQ+E5SWBB4y5Vgo93y5DY30d3qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
> can be assigned to RMID, event pair and monitor the bandwidth as long

"RMID, event pairs"? (assuming at this point in new version it will be
obvious what is meant by "event").

> as it is assigned.
> 
> Add the functionality to allocate and assign a counter to am RMID, event

"am" -> "an"

> pair in the domain.
> 
> If all the counters are in use, kernel will log the error message "Unable
> to allocate counter in domain" in /sys/fs/resctrl/info/last_cmd_status
> when a new assignment is requested. Exit on the first failure when
> assigning counters across all the domains.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  fs/resctrl/internal.h |   3 +
>  fs/resctrl/monitor.c  | 134 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 0fae374559ba..ce4fcac91937 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -377,6 +377,9 @@ bool closid_allocated(unsigned int closid);
>  
>  int resctrl_find_cleanest_closid(void);
>  
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
> +
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 8e403587a02f..d76fd0840946 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -934,3 +934,137 @@ void resctrl_mon_resource_exit(void)
>  
>  	dom_data_exit(r);
>  }
> +
> +/*
> + * Configure the counter for the event, RMID pair for the domain. Reset the
> + * non-architectural state to clear all the event counters.

clear *all* the event counters?

"Reset the non-architectural state to clear all the event counters." ->
"Reset the associated non-architectural state."?

Also, please see https://lore.kernel.org/lkml/20250429003359.375508-3-tony.luck@intel.com/

> + */
> +static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +				u32 cntr_id, u32 evt_cfg, bool assign)
> +{
> +	struct mbm_state *m;
> +
> +	resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, evt_cfg, assign);
> +
> +	m = get_mbm_state(d, closid, rmid, evtid);
> +	if (m)
> +		memset(m, 0, sizeof(struct mbm_state));
> +}
> +
> +/*
> + * mbm_cntr_get() - Return the cntr_id for the matching evtid and rdtgrp in
> + *		    cntr_cfg array.

Please prefix parameter names with @ in description to make obvious what is
refered to. Although "cntr_id" is a local variable so may be easier to parse
if cntr_id is replaced with actual "counter ID" term while keeping rest as
actual parameters. That makes cntr_cfg unneeded.

If intending to explain function context then failure return should also
be documented. Even better would be to follow typical style of kernel-doc
(even if not using /** start) and not mix and match so randomly.

> + */
> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{

A subtle issue here is only evident from later patches, for example patch #17,
that calls mbm_cntr_get() with a non MBM event ID from __mon_event_count().

If this usage is expected then these utilities needs extra checks to
ensure they are only called with valid MBM event IDs.

> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			return cntr_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/*
> + * mbm_cntr_alloc() - Return the first free entry in cntr_cfg array.

"Return the first ...array."  -> "Initilialize and return ID of a new counter, return -ENOSPC on failure." ?
This is still an awkward use of kernel-doc ... better to be properly formatted.

> + */
> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> +			d->cntr_cfg[cntr_id].evtid = evtid;
> +			return cntr_id;
> +		}
> +	}
> +
> +	return -ENOSPC;
> +}
> +
> +/*
> + * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
> + */
> +static struct mon_evt *mbm_get_mon_event(struct rdt_resource *r,
> +					 enum resctrl_event_id evtid)
> +{
> +	struct mon_evt *mevt;
> +
> +	list_for_each_entry(mevt, &r->mon.evt_list, list) {
> +		if (mevt->evtid == evtid)
> +			return mevt;
> +	}

With changes from  telemetry series this becomes an array lookup.

> +
> +	return NULL;
> +}
> +
> +/*
> + * Allocate a fresh counter and configure the event if not assigned already.
> + */
> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	struct mon_evt *mevt;
> +	int cntr_id;
> +
> +	/* No need to allocate a new counter if it is already assigned */
> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +	if (cntr_id >= 0)
> +		goto cntr_configure;
> +
> +	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
> +	if (cntr_id <  0) {
> +		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
> +				    d->hdr.id);
> +		return cntr_id;
> +	}
> +
> +cntr_configure:
> +	mevt = mbm_get_mon_event(r, evtid);
> +	if (!mevt) {
> +		rdt_last_cmd_printf("Invalid event id %d\n", evtid);

Difficult to see at this point but it seems that this is in kernel bug territory since
user space provided text that is translated to event ID and here translated back to
monitor event. This must succeed. Could this be simplified and back-and-forth avoided
by passing the mon_evt instead of event ID?

> +		return -EINVAL;
> +	}



> +
> +	/*
> +	 * Skip reconfiguration if the event setup is current; otherwise,
> +	 * update and apply the new configuration to the domain.
> +	 */
> +	if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {

Lost me. Previous patch silently created mon_event::evt_cfg without initializing it.
Here it is compared and treated as the "source of truth" ... where does its value
come from?

> +		d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
> +		resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
> +				    cntr_id, mevt->evt_cfg, true);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Assign a hardware counter to event @evtid of group @rdtgrp.
> + * Assign counters to all domains if @d is NULL; otherwise, assign the
> + * counter to the specified domain @d.

Can add here what is mentioned in changelog that this exits on first failure
and so highlight that this can have partial assignment when exit on such failure.

> + */
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int ret = 0;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
> +	}
> +
> +	return ret;
> +}

Reinette
