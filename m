Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ECB1F4184;
	Thu,  6 Feb 2025 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858675; cv=fail; b=Il6DqxdCIoSnsqu67Ut4n96muRU1lwkT9xyVmFprpqJGHDlnbhRYhnYbb8ZlsS008EGgzKvtuNEyYM+EpqmAhARlLv45zQmW8tcd17dOuzOD9c4Gy2i0wAEUTdS+2w0Q83WNEqvaxuQT63TXErJ5+RF3XFsPnklCC9Il7EityI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858675; c=relaxed/simple;
	bh=fLjXJITCLdJah+9Lg4OAyIMvCWN0ZjvZBlYzyHwtoCE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kyMDMt+rL9WJd9PspnCLDv5Nbn8ya/mRwxGufqqGmLJL0ioIs4nJSENV5J6nbCxUjq0khzc62WGjCE3HowJJTVqlBaNWqxOqYuKrPT+a4hFSh4tVdX0ZDHjsZsPZpk8mVWtXcKm1UAGU2KXmWk4Fws/+OL1B2+AEVcHvjGN00JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1tpWUT4; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1tpWUT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738858674; x=1770394674;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fLjXJITCLdJah+9Lg4OAyIMvCWN0ZjvZBlYzyHwtoCE=;
  b=U1tpWUT42/wZN06qN9CtY8w2puCnDMuaLPOI5bCkA/JyNXcM4AHq3xHO
   HbXTd/7RbSF8aiHLXMMy/RabLAov65UMfTIpfYqiSo/gtkAAw92ukTDHL
   0LQzTaPCDcCN+7C0jUSnsD6oHnxXg213fF1XCF98ZETroBtlGG/Ohw9As
   vkHBgjflgcb29c4LVnklStMocpP2Eqm7jNgq3yJ+mQOl5BSO2JuH62a5w
   hD8mCiYu0SjR2LSsOulCl+9+kFLS/O54gaGpAWkLAUQne+eR3tNcwswUA
   4C7E33ns1SIjQhkl5hRDrisNj99efdfbbdt47W9ucrVAwy7+cow6MEH11
   A==;
X-CSE-ConnectionGUID: LyigS8eSQrCCb2g/A3x6Gw==
X-CSE-MsgGUID: 9tsi5vbUSOK/iOeAkoC8YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56889527"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="56889527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 08:17:52 -0800
X-CSE-ConnectionGUID: toCZxbWjS8+e+Cn1n7vD8A==
X-CSE-MsgGUID: VXhz40SFSm2rc0W4t3Xi4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116207372"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 08:17:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 08:17:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 08:17:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 08:17:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pntv356UX7T2OrhYuCJwe5MNXNxb7NJboRNzD78HOkjAX7g4Q3BSxeVegC6gW/dauWgOli8NQneHnLOCXfqo6ObPfEkRADd0mbyXXGVYTr3ZnULKRC6C4jjCGc174RSKuaJTOfkYHWR4LAX+52E8bRC6+JE20NauHgbkBVx+vSJXJpjCEXSEpMyGDp9eGeTC3GiTx8UMbLLwzWnYu4B/6iIPIbbwnjs7jAxW3xu3SlvUkskAO3zTFRLMxO4O9XK2G7Nke79rRb0fOtHY1pz/SM22qtFGdqJoFm2a4C7TPcqeqhaMd0PByV7vdYb4opuoNFdG9mmVjtlVqmx8xwlbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CINiJw4mEgJaN1i9SwC1QtUFiPaxRwPpxw4E+ILlHw4=;
 b=rgSRtb29rOAP2dfIi6qNfHbWtXjanDm111DENS7fjSQZ/+lw6BNz/BdHvzAUzD7yHb/c8t01SQeORdZd6zW90zakSt5CHX2UN1RgcBMQEILv8nqVFvdRilVnTUaH7hExwBqSg3gQH0LaoPeJpeoqOnNIPWkk99N+VgtbY9Wv1Fila1CbVnJE46Xr2Y9Hu9OUO4vrnCQG1cp62ARy9qCS83WiXUAdhh5JqXtVZcks6Z/FBx4sDAxWKZz5IBoxiSQit2PhfOe0SbisHLi082wlzfZ3WUPb7kS8kQZTE9ykH+wfGHazQwIqBFjXHAmjBnaa75L1Zsw2hjVaNgOMBc7uWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 16:17:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:17:44 +0000
Message-ID: <ffb74a45-ca63-46a4-9047-d55c9f51375a@intel.com>
Date: Thu, 6 Feb 2025 08:17:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
To: Xin Li <xin@zytor.com>, Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
 <ead5a097-44f7-4eaa-8e98-08450b4d51f6@zytor.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ead5a097-44f7-4eaa-8e98-08450b4d51f6@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0248.namprd04.prod.outlook.com
 (2603:10b6:303:88::13) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a77e537-da66-459e-2476-08dd46c9c9d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkVnT1dyQUNKTENSZ1lGdWRNYTN4bjhMbW8yT2MrWWJJblF6QUJSeWUxQ3A5?=
 =?utf-8?B?SEEyNitCV1pnUWdRbFp1ZVVpeEU4OEtoQU4xSFk2cHRpQjBTR0Z5ak93WjR2?=
 =?utf-8?B?T282YWNEUVkrSnpIaXpTd1NzNVBEWDN3bVdaRGlaODBmRE1WL3puY3RBQ0tt?=
 =?utf-8?B?bGk1NVFyQThsRk1XZS94dTVvVXpYeVFMU3VtanBqNzFQU3hWWVdocGZyZEwy?=
 =?utf-8?B?bHRmV05MbFVkaGFiNS9NM05JVndvWFFhemFlOEpGU1MzVzdQMG1VK2xPS2pn?=
 =?utf-8?B?UUN5NmxDTWdBZzFuMG96ekNqR2tKcytuck1CTnRZS0o0d2o4S2VlakpXNmhU?=
 =?utf-8?B?OGRyUm9wclBkU3U5eDZtYUhJTU5ldkI3YUpncjJZZjNOTGZpRzNRb2lNSDNu?=
 =?utf-8?B?U0ZHR2VBQnkwK0pFUnRScll0WHFNT05Nakx4N2Z4bDZDZmsxM1UxeFlOenBR?=
 =?utf-8?B?cVg3a1dBN0dzd3AzWlNTejJiUzhxdmY4TFJaMy9PRGFWakErTjJ1TVBXUzhT?=
 =?utf-8?B?aGh3ajNWbUVrTmkwZkRlYXA0TjRIVjZGR3UvUHRPK0lja0lFaEZVNkhKL0xN?=
 =?utf-8?B?ZHlMRFRXajg4TVFZK2o3WnJ2SlJvVzlYTnpNV2I2L29ObGVDL1ZoelRwMjJt?=
 =?utf-8?B?UktVeTc3TEkwclIybnhsM3ArSUZIRitsRGl4UXExV0I0RVZzVlYybllPMzk4?=
 =?utf-8?B?aXRWTzc5RDZtSnR1RzBzNDA0bGR5SkhROEdFNzRkdmliOWtjb2NFdU1lcUpC?=
 =?utf-8?B?blRYUlBPNitBY0hxWnlWUUsyZHFzc2t5NDRIYXNNbHZtdHZtRGJBeHJvNGhP?=
 =?utf-8?B?aWNCclVabHZnSVg1MXA2Y09wMDhYcXA4Z3c3ZjRLTXFWdDZoSTVYU0FpUjRn?=
 =?utf-8?B?SktUTE1Dd21CTHJZTzNWUWF4RCttdnpPdDYzN3JCNEJ4anpxNlhiV3R1OXNt?=
 =?utf-8?B?NDhBeVdXaE10eThSRUFtUWpMZkIyaW96WjNJWlVCVzFBNEtaU1FmTHltcUpj?=
 =?utf-8?B?TnhrcTJqZlQ2NUhnYit5bk1qMmpBaVdmMlFhSVA5M1FKVWxIbkp4bHFuY0Mv?=
 =?utf-8?B?VWRhMU9OQ0UxT0hCUGdpZnhaaitUU2xDczZmYndFcTVqTEZNVEowdnpQRDNO?=
 =?utf-8?B?Unplb0IrSWlacktkbTNTVWpBR1B2cEVmQUhFaFFJaHRLcmJSMmozd0Zpa0dh?=
 =?utf-8?B?YVVIVGdaK0dnUWFQYU1WcU5lWCtJL0VKdkV6bm8rdTNPb2w2bXJDRndmR0VB?=
 =?utf-8?B?RjdJSDdXWXY0NGhvNWdSaTI1ZTJYTEhXK2FtbS9pWlFHeXNaNGlKZGVsSUgr?=
 =?utf-8?B?RnVTYzFwbU1mSjJlajExdHZtbHVXNUJUNFlMZnovUUNKakRGOG9Db1NFaUFI?=
 =?utf-8?B?c2VyN3lxL2s2Q1JwWnFsSTZEMnFnS1VaUDExWW1CdUhmZ001eUhVSHBFL2RW?=
 =?utf-8?B?OWV4QVY1c0M4S0p6Y2VmRWZSNjBLeEUwMkhmTzFRU2EyUWREb2g3c1RGWXYw?=
 =?utf-8?B?OVJaV2ozdWc2RDA3eHh5UVhDVWZ6LzU1di9zTFpPdGpyMlZETWZ0VnVtSVNs?=
 =?utf-8?B?MGZmbE00aTFxTUpXdVdOSEpVMVk3L1NEeTllRjRGcktDRkxzTGI4ZnEwUVNY?=
 =?utf-8?B?RUxvZkU0dFhDOXIwckx5MEFjeGIrOGpEbVphbmJlYnQyKzh0N01nYnFTUGI2?=
 =?utf-8?B?a1EyNnhSNFFXVzkwdjlvOG52eWRNVVpaYUwrcUdPS3JYdjNHQjkyR3BaSmhn?=
 =?utf-8?B?RHA0b1BHVXdraTlwYTlMbEcxTHRleHA1Ty9pRGN1Zi9EMjFLWUdOUjdWRjNn?=
 =?utf-8?B?eGdTMndvbTV4NzRMWCt0YUN3T0F2QkFQS1VIbk1Mc21CMTRIY2oxMjIwWDBN?=
 =?utf-8?Q?YK1wlxdcL1GUe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlU4Z2JkZVIybjdHMXpRZi9abDRFZVpLSFJMcHNqbWl5eGN6YkZvR2M0QXdG?=
 =?utf-8?B?M3ZYdmZqaFlOdDg2Wnl4dDUrZVY4UTR1cnBqWXVsVGNuamkvaUd2MmJISTN4?=
 =?utf-8?B?cHkzdnNwMnBROFoxeitJSXRlZUN4MFB0RlpmUEtyUGtHVXE1dG84UmdGbWg3?=
 =?utf-8?B?NlZpeU5rNEo0RHZEbjE4S1llU1BDdXNNbXB2UlZnN0NuRnFzUW0rZzV5Mmdy?=
 =?utf-8?B?NUZhOWQra1k0SDRCSTJrelU1ak5NaTR0eUEySTlEVTh2MmQwdzVSRUtpbjFU?=
 =?utf-8?B?N0dnSml4NFB0L0pWY0VUQ0ZvYjg0Y3EydmtnUjQ2THRZQldwU2tFdksyWldy?=
 =?utf-8?B?MnNnVEU2SlBVQTlqOWVKYjMrQ09adGk2M3YrbHladEpSWjc0dGdMcG8vUFhQ?=
 =?utf-8?B?b05VMWdaV1Vza3Z2ZjBkcXNNd0F5SDBpSjA1Vm0xOVhYZzBVVjlhamhSM0hW?=
 =?utf-8?B?OWhhWHAvOUNUSndBaDFmbmVnUTBLMWROZGhsZkxKRC9SWGNoaWd0VHJTQ244?=
 =?utf-8?B?UnJOVDJCZjVPMVRYSEUyZnNCcldZQlFZUEZMT21Gb3czWnpjbUpuTm5aWVFL?=
 =?utf-8?B?WFlZZkVZRWVycW5EVTZsMXV2Q2hra2Y5eVdsKzliQWZkalVrL2VDa3Z0NlpE?=
 =?utf-8?B?cGJUOUJzNUdIUERlb2FHRGFkU2dIZG80RVNnZnVBb0RGSjlkR1pqUzZlZVRs?=
 =?utf-8?B?N0NjTDdzL1J6WnlNSTkybUpUdC9lVSs4NHhNa3pkNlArdTFTbWFHNWkya0dp?=
 =?utf-8?B?OG1adGdrYmQwamh3ajM3dS9WTFlOVUErT1RoVUNUc3ZDcGovQ2pld0lFUGlP?=
 =?utf-8?B?WG1QTzdJZWpUYWFDWm4yTFd6NmV5TDRJUkxubThJUHdLNElLWk9JZDJiNEh0?=
 =?utf-8?B?MlU3WStHcU1iVjV0eEVKQ1RFTHRMaTZ2MXZWNGVHSUdpSTdkTWlxOUQzR1kx?=
 =?utf-8?B?S1pKMnNvL0JQeUxrNnZWSUhvaDN0Q1VGbzcyc095ZmVTcFQwcU1lb1psajJ2?=
 =?utf-8?B?cjhGRXE5SWpVMExEcDk5eFAzYVY3UC8rWWJqMVJJczUwdkhFbi9aZkZpWmFy?=
 =?utf-8?B?L002ZDJIS2FvWFhBS1dRVUkwKzllRW5TT3FabGw5NWZKM1d0NXNRWEdRUzl2?=
 =?utf-8?B?ZS8xd29rVDNJcXRBQVZZVDFNZXM1QVNSZkE0OURmbUxyelBPTDJFMG03UWlB?=
 =?utf-8?B?a1NZajRJZUs0ZzNHSHhnNHVUYTIwaXlKaXhyd2NiV00yalpLTUxqcVJNYjU5?=
 =?utf-8?B?R2ZSZGR4UXZyVXF1dlN4Q09sZGRqVHBHYzJNdWUvSlIwaXp1bHF1emw5Umxq?=
 =?utf-8?B?TzI1U0VGQm0yeDZrdml4Q1RxY2FlbXM2OHlVdHdUQmN5dG1NRzg0T0xIMWNT?=
 =?utf-8?B?M1VyVUY2ZFdpb1kySDNrbXhNc1JtY0pYNGhDZ3dqOXliSVU0aEtaRm9vL29T?=
 =?utf-8?B?Tm1PQmpYcENseklPN1ljNk1JWWdmaXRWcjlIZnp4OTVEUUVBUnZyTlQzVXNw?=
 =?utf-8?B?WjIyZ2dreDkwRFJWdm9PYllkNHFySk1ZOVh2YWJYbzhVN2pYRXdGVG85NWNG?=
 =?utf-8?B?cFZrSVhwcUNZM0FGbkJFK1NJREszSmRZMTRsNXlNU0lWNVhlbjVQSWU0ekgv?=
 =?utf-8?B?dlR0Y3Z1L1hyb3djaDlZN2JjTDNMWmZKZCs1OXloenQxamhRbUplL25EWUhV?=
 =?utf-8?B?THc4Z3lOUlFpeVRnSXpoSndRMDR3bDBZU2F3QnYxZi81VGF1SHdjWGwxbnVl?=
 =?utf-8?B?aG80b3A4Z2dCSXNNNm8wVzhkVnF2YUc3T0NURi9NWG9ZKy9waFl5MDhFek5z?=
 =?utf-8?B?dWQ2TVZoK3pnL1Z0Z0ZyQTJ2Z2J0eVM4L1E0Ry8yd293MlkwN0Q1dGRHS1NK?=
 =?utf-8?B?YUlxdmNjK1pORmM4T0RJazZORXBPUkk5Z2ZOY3gxQTc0YW9tU2NtcE1Kc05R?=
 =?utf-8?B?NGQvMERiR08zNTFnbURZaXhEYUhKUzZKMk1lQ3BGdVd0c2pqdEVnR3VTUGZm?=
 =?utf-8?B?ODFvbzdQZjlRVlZXUkZidGZlWWJzM1BZWEFuRlN2MXl6Ym1GY1JpL2lYdDZB?=
 =?utf-8?B?aTZMYlVvd3dvYTQ4dXpGUmM1emNZVDdtYzZVOVR3bUF2dVg4NGsrYWZReGNL?=
 =?utf-8?B?Y0RYSkxEWms3eHUvZEZqV2xiakdCWWI1a0tUR04wb0gwYWhNMDZrbndVa2tC?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a77e537-da66-459e-2476-08dd46c9c9d9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:17:44.7360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51sYfpeFbg2v9rEUSG/U1MPZMeFZsETo91bSoSZkm6X5lCTerolSiPubbgBb1taD9Pv8Gpf4kehFCXbPK+RDI6lowrUFZTAOd4mNJTa1SsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
X-OriginatorOrg: intel.com

Hi Xin,

On 2/5/25 10:24 PM, Xin Li wrote:
> On 1/22/2025 12:20 PM, Babu Moger wrote:
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 8917c7261680..6fe9e610e9a0 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1324,3 +1324,49 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>>         return 0;
>>   }
>> +
>> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>> +                      enum resctrl_event_id eventid)
>> +{
>> +    struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> +
>> +    switch (eventid) {
>> +    case QOS_L3_OCCUP_EVENT_ID:
>> +        break;
>> +    case QOS_L3_MBM_TOTAL_EVENT_ID:
>> +        return hw_dom->mbm_total_cfg;
>> +    case QOS_L3_MBM_LOCAL_EVENT_ID:
>> +        return hw_dom->mbm_local_cfg;
>> +    }
>> +
>> +    /* Never expect to get here */
>> +    WARN_ON_ONCE(1);
>> +
>> +    return INVALID_CONFIG_VALUE;
>> +}
>> +
>> +void resctrl_arch_mon_event_config_set(void *info)
>> +{
>> +    struct mon_config_info *mon_info = info;
>> +    struct rdt_hw_mon_domain *hw_dom;
>> +    unsigned int index;
>> +
>> +    index = mon_event_config_index_get(mon_info->evtid);
>> +    if (index == INVALID_CONFIG_INDEX)
>> +        return;
>> +
>> +    wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
> 
> This is the existing code, however it would be better to use wrmsrl()
> when the higher 32-bit are all 0s:
> 
>     wrmsrl(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config);
> 

Could you please elaborate what makes this change better?

Thank you!

Reinette

