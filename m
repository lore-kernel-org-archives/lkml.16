Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86161220686;
	Wed, 21 May 2025 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868760; cv=fail; b=eI0cBASVwY3Io4Q576IQygw1tL1icJ2GIva72uW8+j/UeoiYV9C406tTk9suRBoA7C4Z5XhzVAc6qMLh4FNoVjq4yS4cdS4eJ9R8//s5h+DBiK9Gai8DBK3hbhemRxtRs+cWtk0YV5e4dtVheX+BebQc5cWH+UqBdPRsew2CYrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868760; c=relaxed/simple;
	bh=5+1Mc8KysUPpuT9SC5ohDFvg3KuktBdBpbFHa6MLnic=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ORZpdDCTC51SmIwHI6aXX0ZNIWFu8NLDt2X5FJosR5acYGzBAnVgWL+CpctT6OtEl0ENeSGDakKggFGi1pSd2MO/DbCWCUwIPA83cq9C1rnYipT9XNEz1Dz+rKICPViekaTAHzbRW0CqghnCWCaA0V6Gv3mMaInLLQxYH0rTVbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDKg0wx/; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDKg0wx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747868759; x=1779404759;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5+1Mc8KysUPpuT9SC5ohDFvg3KuktBdBpbFHa6MLnic=;
  b=fDKg0wx/jtko/9Ph64G22320LwTC3SZiwh8BdtzyQWchtgJi2s1feQuk
   prZ5skaUSSjrUKyRjBaeyLlYF78Fdd2MzsZiAaKaERCJnF3F8eO8Ez+Bs
   SL08GD8YvSw8XG9sSlgmkuZCvtG3j/S2Q7yaIqSZK3Y4jx0PYJWDhJwzo
   eeeS3GItv2Ke/0ypFfpndidl1CBdbJqPHVF6Kxyxboncn4obZUt06nDje
   FvjCB2iWqgMNU4EIf3eqBPQRDWGcKIosN01nAXXx9IAcmZiwTB0fCXXdS
   oMJiDfdVJooNIBnajcoFUzE641muHzS1ZojrAm4dsKo0HGgJ24Tw6RFIi
   w==;
X-CSE-ConnectionGUID: 0hnoV/zkSCWuY3zsVEQ+9w==
X-CSE-MsgGUID: FDFsiWgNSFO4ijFL/O0/1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49861539"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49861539"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:05:57 -0700
X-CSE-ConnectionGUID: /1fRn4ERSOKyy+j4THRGsQ==
X-CSE-MsgGUID: pD+6igmqRGOB1zwI5NAiww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140062436"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:05:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 16:05:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 16:05:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 16:05:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW5sWVROUYZ17C9bdIuUwonxjQJ3GG4FOVswcRbI1ol9aYpYvs1W9l/6b06XgK4hQf6PrYWJkaQwsU6eVikK7xK6b5KbqywjMECAPU1oqngHO46YAxEOu9j6scCYyjG0gJ7LYIw3o5sbxOwSnCuK9KSRFXszSETlDGP7a5FdjlVkPSWFl+EtEgdOehxlWAPrC4KBtCA6sJcf2d17dZRd5RsSkbw1wYmj/zGIPVfcCfXw0wqMXkZfzyYCnRmWr+DH4EgpHAwRYez2+YFXxlHZW1iN03Hk7AwbADPlsIBVqTSjslx/y7Aqf4rCLxKIy195G7+rHOpLWnVNP3SZYPFxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9SOyS6nqLpcf44ZYEJVTgGTvkQ+haH8qgw1hJJOyZU=;
 b=NRmOXxwpvvZNGvdxTVn003xTtAvflEq445lMONkUxEO00NUDcebTs4X+KCr666O438sde8OLTrMTUMskUQrd2FCRhF9ydBj++4HkO6r+m8W+/Ab5fQsyYG7c9TrfrultW3B5UPb+QBCrcCilr6HX5WNRrppVQXzxI2174tW3yKQVyfa62x86Vs6bDvsVlBfKoy1Vuw0O6D+XYB3S6ej5enEJb+Ye2VgAHPs9HDJz/pEV3cySShE5PhDE0tQsv5RA4ts3EjQPwVzojpM3d+RZOFwoGMUVJHF/KYnI2ARcTfpqX8BODTQPu4pLVlgu1u/Vwuc3KkibrVVJi5CM1eT0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 21 May
 2025 23:05:08 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 23:05:08 +0000
Message-ID: <31aec24f-b3df-4a8a-910d-6df175962e84@intel.com>
Date: Wed, 21 May 2025 16:05:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Peter Newman <peternewman@google.com>
CC: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<tony.luck@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <james.morse@arm.com>,
	<dave.martin@arm.com>, <fenghuay@nvidia.com>, <x86@kernel.org>,
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
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCgtcz6tZnmeH8v4r2=HRVh7qEDZgraLU+Euhq3qLkRZhA@mail.gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <CALPaoCgtcz6tZnmeH8v4r2=HRVh7qEDZgraLU+Euhq3qLkRZhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: e2425ff6-b20b-407f-ab53-08dd98bbee1e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmUvSGlpQy9HMlRraklJZlZvc2pxemdIaHNuZ2h0QmlXQnpWZDRIRTFucTZq?=
 =?utf-8?B?T0dydU8wQXdQMDQyUlBjNlk4cC8yTjdJeEVuc2I4bWhkaU4wRnNBTGVydFRo?=
 =?utf-8?B?aVhIWDNwcGt4MUMzdGdLa0N0R28yYTdkTVpiSCtZTEZRKzdGOVh4Z1FLOGYz?=
 =?utf-8?B?bDVEaHhzK2dhWE1DTWJCaGNRWlBpRjl1WnQ1dW9nYUgrYmRTaU9jQUxTaTZi?=
 =?utf-8?B?aUs2M2ovcW96NWcyMVBVekFyN2luT05IWVkxVURsMHh3TEVXTis5TmJnd3hO?=
 =?utf-8?B?S0loNGpMUC9NRkRjN2w2TlhuSDNnQ0lCNUZLUjNEQkw4aUJQZGxaQWZXclJY?=
 =?utf-8?B?Yi93ZlNaYXBtcWt2N2ZLZDVzbkNTQ3dBdTV0NWdxOGIrcTBodEtrVUJhLzZI?=
 =?utf-8?B?ZWV2SWVxL2dOSm85SkNrbE0vbUNJRnhHY1MxSkJGRjN1RG1TWEpwTVpmS1B3?=
 =?utf-8?B?MDUrd3ZnZDdCc0RNNU02T1NQbGluVTJvUGJmT0t0a1g3eVBhb2FWZERydW5h?=
 =?utf-8?B?NUF5Zi80SmhVbld6N21HL0R6aCtnNVlvL0VVTkRGdjkrZ0ZrK1lRcGhhQytK?=
 =?utf-8?B?QjhqWTA4NEpLTitSNVRVaE9CbWpic1ZXZFBkaHpLMzdLcUF6cXlZODNMdEht?=
 =?utf-8?B?UmYyUHQwUHBLZWJ1MklhM1VVVEhIS0hQMU1xc1l5L090Zi9EZElHdUZWVEhD?=
 =?utf-8?B?bitnZitxSTB2VHZDanNnc1ZIZG8zZ3Z2WGVjeW1CN1R3WGJOaks4T3JFd3di?=
 =?utf-8?B?NlpYUTZ0dzhldkYrMUtjdndObUIxamZmY2ZmK1dIQ0NMNFQwazVHZit4WDF1?=
 =?utf-8?B?OVN1cTRFK2sxcHNqR0Z3WGZkNjBQd1ZvZzJ5NnJUS3B6aUIzWUlGN2RrcVlS?=
 =?utf-8?B?NGZDOU9TNG4zODRXRHpmRy9Rc1piM1Vpb0RtaWdpM0Q1UUorV2REa0kwL3ZW?=
 =?utf-8?B?TmFNTDJHd2FwSnkwb3NKQ2xsNWpSYnBvQTZtK0d0Vm9id0FhZldLaEUrVWNQ?=
 =?utf-8?B?U3ZlbE5YSjlqVVc0VTlSeVJoYzF5RWVtTkZyZko5SllHN1NXSkJTQlB0eHA5?=
 =?utf-8?B?SDdxVXFna3JYbjkrVERIY2g0eWNjTzZmbGZUaHV1dXZ2dlllSzJWTmJ5RUI5?=
 =?utf-8?B?eEx4d3ZmRkZqQ0s2RVlsWGRTaHcvai9TbnM4V2dvMDlMSHRBZUVPK3p3T2xp?=
 =?utf-8?B?UU4wTjI5emFrSDlWdC94R0QvL2JPQW43ZjJCZnFBSDBCSDBTSG9YcGYvU0ZB?=
 =?utf-8?B?ck12bmpHdk4yNnVVTVpHcmNqNVJ3RlJCUTNVUXBVL0ZObW1kTVhTSjFSL0Fz?=
 =?utf-8?B?VWhrb1dad2dwZkRGbTFicGxGMHdURzduMklIQndOV3NSU25HRlg3NTZOSG5z?=
 =?utf-8?B?clhnemNiMDZqN2d2N1Byck1pNmcvcnFYbXVxL1d3MmtPMkhYRDlGRUtqMGpE?=
 =?utf-8?B?SFVmTlgvVHV1R0NWT01SdFBEYTBiOEZYT2N3TlBKZ0o3RUFScWtIVGVEOThZ?=
 =?utf-8?B?REJCZStXUnByckZrR2NXWGZObE5Ed0RqbXJScFBsNWN4RHhIWUhBYkhwdzJB?=
 =?utf-8?B?YmpQcUIwQ001aDVvRzN3RmQ5ekRNMHhkandCWmxCV2FsRVZZOVFxTzNJTStu?=
 =?utf-8?B?a0J2eEU4OVlhM1lCOVlEK290OEdDOGJlRzdGaWpCTWUycDU3SER3VWFrMEs1?=
 =?utf-8?B?REUxVGxTR2xCQ2crK0ltNGM3MXFrODZqaEhDbE9RQy8wYVV4TEpPT09hR0tR?=
 =?utf-8?B?d20ybm1JLzFBMGYvbE9zeit3eGY1U0dUSFRRNXJseURZWng0YkZsbWlQc0xC?=
 =?utf-8?B?dzRFVy9vb2dtbzFhWklkZEhySmJLZU14QXpORTBaYjZZSXcvb2Q5UWM0ajc5?=
 =?utf-8?Q?eYvWfuE0H7E2/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkZkTmROc1ozWWVlNVdnc1BjalVQNHlmWCt5cWM1SGJjc29MVGtVbC9qaFhZ?=
 =?utf-8?B?cXJTRXJrcXdwdm45TlpycFhPTzF6UlBMVXNvMmdmc0MzMEtBcTJyUEF5bVBs?=
 =?utf-8?B?eTViMUFSQ3F2dmpXZGxRS0VSRm9xS3d5aEVKVXpCRThGVSthaHdyOVVGZVVJ?=
 =?utf-8?B?bVhRWFlMcGZNZTB6SDBaRWlyb0M0ZHVhNWtBNnNGbHJtR3M2WVFEVDArTkJ3?=
 =?utf-8?B?MDArbVpOaWJaMUYvQmVNSmY1MzVUTEJxYnlFdWN4ZmxpZ1MwU2Z4bjF6VktF?=
 =?utf-8?B?bzFMVEFsTzFSaWpMYUwvbnVyM2VUYjljUkI2Zy9QWkl3clBjellEVzZheE5i?=
 =?utf-8?B?TWEyY1NCNTB4VWN6d3RwTklPSnJHY1YxdXlwMHFFQThucFE5Zmw3eVNEUnlK?=
 =?utf-8?B?U0xyTVBXQ3hGeXpaRmdEZllrR0E1K0IrdWJFam5aY3lSejNqTnVBbE9VWkt1?=
 =?utf-8?B?a29YdTQraGpVRnVpOFV3QW13NXJsOWlSTzJycnBEOEpYZDJyRFdxL3FlV0VD?=
 =?utf-8?B?WWw1QndtUnhnUWpkSHBoV3YrQ2lLZmtOY3g5bWxzOUJiMUlJdGdjNEExZE1n?=
 =?utf-8?B?TzBDeUNBcUVnYjhIQkM4MWRrQWE3bFBPQkxDU2JKc3ZCS1h3TjJ1cGdzWEh3?=
 =?utf-8?B?eTd5Z2w0VTRtY0Jiak1GMFhkYWJKa0NCdWQ1d0tJYmZyQ2RXRGdkVzVacGZ1?=
 =?utf-8?B?d0hDVTlTb1ZiSHFrUWFRQ1ovelVuUFhUa3pramZkaklESzY1cVo2NElLTTNX?=
 =?utf-8?B?UEhNYjlhZHVwZ0pNQXphTXNhMFR1dFVQK2t1WnFQNGd6TXZaeXRYbXhpanE0?=
 =?utf-8?B?cmdOcVNVMFlQbmp0bEJnYjhTTW1XU0x0aWthMWhUTzRsY2JWOVZVYXdJN3Jn?=
 =?utf-8?B?cWhJWElMVVBPbmtGL1d4RitWZnI0STU0T3YwK2ExZjl5MHhrVnNLaXoxeUlU?=
 =?utf-8?B?bWlZZVhlMzhmQk5OVXpFUE1IWGpWUFJaVHhTckRWV0ZUTDdEZFdqbHVKdkJI?=
 =?utf-8?B?djIyVjdZVVpJb3NGcVRTeUZUUnc0dzBlOFQwc0g5RDFtYTNMK1V0alVKR3g5?=
 =?utf-8?B?dFJYd2pSSlhRdmJjOG45OFlJNk9Oei9yUUpkV3h5L0JiSW41VFlWeDIvUXpU?=
 =?utf-8?B?bStrSnluSVc0UW43MTllZG4wT25GNEF6eDdJV05VSEZBTTVlZ3BMM2VHZzlo?=
 =?utf-8?B?d2RKZ3NRSGRuTnRkR1owVlozWTRPVUdXaUFWVHVqaDIycVFZQjczWk5zYkY3?=
 =?utf-8?B?U25yYVhRSVlJbGp4R2c2Um5WUDR6MFNIemNrTm5HYXBlQXNlaXl6ekx2TWJ2?=
 =?utf-8?B?eU13ZFJCMUsxQjdiN2N1UStWNzJXTktDWUVwWldZV3BlS0xSRENuMUhJM3l0?=
 =?utf-8?B?LzJVcXROcjlrQzFpZ2NieG90dDhTWGFWK25XWVloUXU3OThyc3UySlByb2hs?=
 =?utf-8?B?UFhDRUt5U1d4Z1R1ZmEvN1BBd3VzZFd0eWpSM2VuUkZaWlVHSDk3bnR1WnJM?=
 =?utf-8?B?VXRod2pheHNYcEJmQ0NjNHRiZ1VkbUdnaUVkQ0E5am13QmZ2b2RoemJmTndl?=
 =?utf-8?B?aWFBQitHZkVHNjJ6ZVdpdlNPMzQ3akxBWE52Qy8yMlJDYnJOaUhYOFJWdm1C?=
 =?utf-8?B?VTdJd0l5SGo3dkN1NGtkU25NUGx6UThMeExyTWFGdFdFSUppMnVsck8wYUJ2?=
 =?utf-8?B?UkYrUDBFby9tZ0czSVdZdFJEK1dSdU8xaFE0bGlCd0hRU0l6ajNNeE5HbVdU?=
 =?utf-8?B?QWFYb2NGYkhocldSRVlmRDRyREUrK2dtRU1nK3p2NEg3WUllaEphMFNTOUk4?=
 =?utf-8?B?R051ZmhvRmJzZjhvTHlWaHAwK055MWFxK3lxOGtGaHU2UzVvcG9iSWhxcjcz?=
 =?utf-8?B?NkNKNWVYUkFFN2tzQnJlQkZ1R0F2UDhhQVBMRTBkSUM5VzY2bDE1VUc5Ump5?=
 =?utf-8?B?UzJ5ZFBtSWkwaGMxNnV3cytDYm9sbFl5WGdmeks3YlhIb0Irc1Nyd1duTms0?=
 =?utf-8?B?NTlGQTRtRFUzOVpPd3pSdlVPVEIyYmowNCtkUlhiT2ZNNTVORWlWZG1GSDkw?=
 =?utf-8?B?OG1vMWJaYXVvc0hkeFlrRHFtcjlCVlFLdXdXOFVsNjFZQkExUUVMZzd2QnRn?=
 =?utf-8?B?d3EwUlBsa2JsVEZwTjZDMDZKa0N4dHBBeXhSUm5FdjEvdWRmNEFNcEpjRW5t?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2425ff6-b20b-407f-ab53-08dd98bbee1e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 23:05:07.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ov76Xn0/Tg3NHKoasIxSDLwgfK0T5JJdMu0DDG19FYlNkrz/VOaal1sYtqObx/RSP3IBb0gQTwrtVbYRc6E4NU+aJ3AvtlXb5bsIpGIC/I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
X-OriginatorOrg: intel.com

Hi Peter,

On 5/21/25 7:27 AM, Peter Newman wrote:
> On Wed, May 21, 2025 at 1:44 AM Reinette Chatre
> <reinette.chatre@intel.com> wrote:
>> On 5/20/25 4:25 PM, Moger, Babu wrote:

...
>>>
>>> Here’s my current understanding of soft-ABMC. Peter may have a more in-depth perspective on this.
>>>
>>> Soft-ABMC:
>>> a. num_mbm_cntrs: This is a software-defined limit based on the number of active RMIDs that can be supported. The value can be obtained using the code referenced in [4].
>>>
>>> b. Assignments: No hardware configuration is required. We simply need to ensure that no more than num_mbm_cntrs RMIDs are active at any given time.
>>>
>>> c. Configuration: Controlled via /info/L3_MON/mbm_total_bytes_config and mbm_local_bytes_config.
>>>
>>> d. Events: Only two events can be assigned(local and total).
>>>
>>> ABMC:
>>> a. num_mbm_cntrs: This is defined by the hardware.
>>> b. Assignments: Requires special MSR writes to assign counters.
>>> c. Configuration: Comes from /info/L3_MON/counter_configs/.
>>> d. Events: More than two events can be assigned to a group (currently up to 2).
>>>
>>> Commonalities:
>>> a. Assignments can be either exclusive or shared in both these modes.
>>>
>>> Given these, I believe we can easily accommodate soft-ABMC in this interface.
>>
>> This is not so obvious to me. It looks to me as though the user is forced to interpret
>> the content of resctrl files differently based on soft-ABMC vs ABMC making the interface
>> inconsistent and user thus needing to know details of implementations. This is what the previous
>> discussion I linked to aimed to address. It sounds to me as though you believe that this is no longer
>> an issue. Could you please show examples of what a user can expect from the interfaces and how a user
>> will interact with the interfaces on both a non-ABMC and ABMC system?
> 
> At the interface level, I think mbm_L3_assignments on a non-ABMC
> system would only need to contain a single line:
> 
> 0=s;1=s;...;31=s

It should be obvious to user space how to interpret the fields. When there is
thus a single "mbm_cntr_assign" mode used for ABMC and soft-ABMC a single
line like this would be difficult to parse since that would imply/require
that user space knows whether it is running on ABMC or soft-ABMC system,
which we should avoid.

If there are different modes, for example "mbm_cntr_event_assign" and
"mbm_cntr_group_assign" then this could be used by user space to distinguish
how to interact with mbm_L3_assignments making something like this possible.

> 
> But maybe for consistency we would synthesize a single, unmodifiable
> counter configuration to reflect that allocating an RMID in a domain
> results in assignment to all events and deallocating the RMID
> unassigns all events. We could call it "group" to say it's assigning
> at the group level, or perhaps just '*':
> 
> *:0=s;1=s;...;31=s
> 
> I'm not sure about allowing a '*' on ABMC hardware, because it could
> be interpreted as allocating a lot of counters when a large number of
> event configurations exist.
> 
> *:0=s;1=s;...;31=s
> 

Either could work also. Whether it is "group" or "*" ABMC systems could
respond with "not supported". Will think about this more but would
like to hear your opinion about the flexibility that distinguishing between
a "mbm_cntr_event_assign" and "mbm_cntr_group_assign" mode provides.

Reinette

> -Peter
> 
> 
>>
>> Thank you
>>
>> Reinette
>>
>>>
>>>>>>
>>>>>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/
>>>>>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/
>>>>>
>>>>
>>>>
>>>
>>

