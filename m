Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA21F76C2;
	Thu, 22 May 2025 20:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947275; cv=fail; b=fxjEEPtgz0hFng/BK3VcQzP+I9zon2wFKP+LqrW+Q+Zagd03MpxesPDrfgRZ8FeoYGtRmvU4hpMS+DbfFYfDqPjf1ObtS/I7agCy3bt2NsfyxrfJNDf8AYBdPY1dzDbRqSRz9UYAf9yuG9GYbhzR1re3qbSKxmvdxckFaoBbhDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947275; c=relaxed/simple;
	bh=ApypBJzqWgVX+XpirKSGSgzqdT01eVsNDiauzgaKfKk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DNzLFrWkYvbcnBEpON4lqpAUtflKKCtbUxg0K+/v8uneqzleEI1dGcmY3Bjs0H7jhPMGpdhYdOuoW0zZ6jKgfcnPm5TrRHZuPwFgnc+Z0pdcrAHh/UMVcXLZpUXabupHJFL/aM8hjUPuSRqQLwU5nLAKvxy/Aq6WRjQlodnbgS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/349P9y; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/349P9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947273; x=1779483273;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ApypBJzqWgVX+XpirKSGSgzqdT01eVsNDiauzgaKfKk=;
  b=l/349P9y8IgxcTR1OWGYoZpsS/xcUG2jEZO0lYuN1IuJLBWQqmsQveUP
   gi9oWx/F1wa6YKVxu6fpa4OCYo+9iNhyujoSY8JJ9ekxVu7ZszIg6EWwI
   ZIELqo8sj32VFFTFlq3L2K2sTHzgn59uQkyDugwCPvjJBGtn/n7hCEMd0
   J/+Gn+7RN9PEMjyjU/pkCcvOyn7d8TDqLJjKfTMW+bQrcHyCpUg3Mdmq4
   sxl1b5HyFgZPU5oEoqQF3wwBqln9kAT9XRTB/m4Hp888h1+ApaEx/LSy1
   r4Z+Hd4o+o93eajs8YwTlMd4SmXv03bK96Nb6BoWjmw+kXYRAZ6lfdyL+
   Q==;
X-CSE-ConnectionGUID: Ykdav4+rRv67qtz/5MK5zQ==
X-CSE-MsgGUID: wbcELIQOSeuuaqqOfa4ugA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49699351"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49699351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:54:33 -0700
X-CSE-ConnectionGUID: 5QU9NH+tQH+AWoPPUtEamQ==
X-CSE-MsgGUID: 9RWe3nf6RqOmRR1IQNQ+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="141720045"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:54:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:54:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:54:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCr3Mg2k/xBard5jIaQZJ/HAPCjETRdJO0umLueXvt0vEoocB2YPmkxnSMZUpWwacUYxQuBh2Gh4Ecgj/PJPq+lP7MXluo0zUQywZcUph+DRdwIC8ikWdAVkHDAp4vXhyMIqsV9DMS6CtXtwuphkOdrT3+Jgv5vn9eWVnx2Z4ayq8F2DtbiEqCAodiquiyzX6GIPxHP6t9BLyhZwcS0tcNy71+43CMDJdSA6sdLuiznfvuhlFb44ynpvbFhnYjws0I5AA4Uu3c7Uu2ayjAoKYzXMo7YoCBBstwZTz8bThBstZBM5iALyfGNVnjYtKuYAsZxGdBFQMZAYsmB5f030LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4PZV8BLBlXYehUWhZdPhkniepj6goMG+DZa3ODWAdA=;
 b=CsezcMSGAtS2BKJihqUlGnqEFp1wg93dPDiW3KaEvdbu9Qc/9x9Y8qNFHg9gPt+Miya8QB6fesbBPLv0D/VindlBB+04qNML4gJWRF0mUNi1QnVbOXzYmmVnOSPqCrGKEIPQRlj/GfQEn8V3LfcEOT3OZegKhebI5cinh5gtqTqUBkSLWRVjw8m7UCbXr73dE2EVH7w2tlEjBgceJfCThgy5od2e8IQ5qgLEPKoVV9xPNG6k3glDDlBObr3fDkxY7vm2fLA7KiR5JsdaFaT9tf5ImKrfGeqN1ZZzk0OVeB2xheT3FyCLCxD6sZ2nJQAegtET4w7qq7SWUhCbQUDBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 20:54:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:54:27 +0000
Message-ID: <bedd1ddc-d1de-48bb-926d-074fe6f6c253@intel.com>
Date: Thu, 22 May 2025 13:54:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/27] x86/resctrl: Detect Assignable Bandwidth
 Monitoring feature details
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
 <a4e2388b708883874adcd621f50f773484945489.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a4e2388b708883874adcd621f50f773484945489.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:610:52::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: b8565c6e-1f52-4632-ef5f-08dd9972d72a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0JtRm9OWGpSMnRTQktBemMvaGovd3dZMUdtR2tyNkZWOUcxQ3l5OUE0M2xC?=
 =?utf-8?B?U3FCZE1sYVp6RzVwU3kyVFRpNkJKZ3VzK0YyWUVWYSt5Nm5wV2RyMlVRRmY1?=
 =?utf-8?B?TjR2SGE2SWQrVFF4eGtVUnVabm1JSEprQlN0aTB6MEtDWDNjclhreDdmNUNL?=
 =?utf-8?B?cWxGSE05S3ZwZzBMemlhWkgrZ0g4RVczelZML1BvclVWTm5RcE1za1U1Y3Rm?=
 =?utf-8?B?L0JSZWhkUkdYS2NsVXZFS2Y3VHMrclpuelZYd1hsMjJwcks1ckFEY05nR25w?=
 =?utf-8?B?MTlJaW1HQlpWYmdwRys3MW9iNUdzd2RCMTAvbFVGUDlFYldITi9JSWVJN1VB?=
 =?utf-8?B?Z0grRHBaZEsyVmZtVEpVZUFRcCtvbHY5c2dlWS81ZG1YcmhZWU1RR2JpVFhq?=
 =?utf-8?B?dEkyRVowN0g1ZlFLekVNazZLQlpsT29JOEk1dGh4ZlpBVkFBWHA0b2wrcjcy?=
 =?utf-8?B?aWFQbnRtSzV2NVpySmpmTXdTM2gxcDRrQXJielBHMXdTR2dKeWdmeGo1dzhp?=
 =?utf-8?B?U09tN1JzQWhxYytxZmEzQkdSbTFvQ1VzMjVoeGErMUoyNUJybE1oOHdHQkNH?=
 =?utf-8?B?b01MTmJjTDBsNUMybDRDZE9CMy9NMHhVZC9Zd2NwYmw0bkd3VjNxdndTY1hi?=
 =?utf-8?B?eFhVcmtHVjlCRzlQZVR4alc2d0xUVFNHWGxUSlpEaXRJQ0xBREU3T0ZjOXlC?=
 =?utf-8?B?S0VlRld6cmhyanRmT2dDLzlmWWExdUdldWk2WTN4RVNSQ2M5Y25SS3hwVzk5?=
 =?utf-8?B?MkpuZUo4RmdXSEhnQTYxMHFBWWpyUFNkZWkzenRyQlZzejN2UjlkUGZRZVRB?=
 =?utf-8?B?T0NLWURvUkpaNC84UmNMTjAzYzRWZXBlWkUwM0MrdDZlQ2o2bkxSUUhONUkz?=
 =?utf-8?B?N1VhWEdJdGc4TWlUMG0yczJaSysrT092Z0ZZNlhMSXpWemhLb0lHV3NTRUZu?=
 =?utf-8?B?clNpNFdrNExOT1h4Qk9GQWFpUWVnLzh1MSs1NFYzTHpzUVBtejYwZ1dhaTkw?=
 =?utf-8?B?SGZZbmxucEZOM0VOWHdTbldTckRnanpIU3Ewa1VTdHJhaHVwYUJUTURjSllx?=
 =?utf-8?B?RUc0MjI4a1Q0NlIrU0NNVVpMaEFvZ1NKVTlzZkZYKy81U1ZBb0s1SVRhRk5x?=
 =?utf-8?B?czdOVFk2V3IwK3RmVVB3NjFaSmhOalgzUmtkN0JjYTNnRGJuYWRJaUN4Mm1s?=
 =?utf-8?B?UGlHQVBHLzc1UUJmNmFOQnY2ajB5Q1dycHRiVnNVYUxPM3p3Q2VjRlNDZU94?=
 =?utf-8?B?aTFMOC94MnJPOTU5bFJCMFNocENTU2F0ZVdxSjFQV3FJcEt6Vk9YQjZmR0Rp?=
 =?utf-8?B?a0t6RzRYandmeC9nRCtTbElrSStBRGo0SHFpVEJSeTRhRU8xRytta0IreU4y?=
 =?utf-8?B?OXFFcFNUNDA0K3lZUGpkS3kweVM1cTBRMXhYblpScU5IMXpIREZQaDhuSU8x?=
 =?utf-8?B?MjllYm02aWozU2JGSGdodFRqMEF0SjkzK2hzaG5jQzdiMzhleC9US3l2T0Vn?=
 =?utf-8?B?MG93K0h4MjgwS3gvMmFPQjc5TDYzSE5MWFVNeS9xQXpFaVVvdGpldndkaGg1?=
 =?utf-8?B?M2JuOTRUeTdyN2xXYjZWUm8vODJYYksrSncwVzlEck9kZ2dZcmgrYUNLZXRT?=
 =?utf-8?B?bTU3UjljWi8yY3R6cmI4Z2ZRc3ZPRGVBZzlXLzJRRkJlV1VwOStncUZDR1cz?=
 =?utf-8?B?NXFuMTVReXdJVWRNRlBxalJ0cXRwcUlqcEwvNEdTWlNmd0NtV0hXVEtMZE1K?=
 =?utf-8?B?NkdjK0dyTXRBNVBsWjhzODZ5eG5ST3ZPZkdRSnZudmFhaDhuTkUwRTlLZitT?=
 =?utf-8?Q?83oFtKym9TeoYp8dRJgB27dME2NkR+R9LNjl0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm1SbHVPVXdTeHhKdWh1Tk9FWUlWS2JWbkQza0JhUmVFNjViVjVhUXRNN25w?=
 =?utf-8?B?ajI1bVN5OVJtTFQxL2hGN2YxSllCaUpOTGsyTHNvTTNaWGFPdWZQMkt5ejFU?=
 =?utf-8?B?c0dOUTFRRWJWR0VYUmVpdE9BUnZVejVjMkxSeFF0cHdjREpWUFFBd29wanQw?=
 =?utf-8?B?ZU95NTdsWDJ3U09GSW9xUlRJNWZsWXd3d0ZXZmcyVXRCSUtIdEMxNkxMak5H?=
 =?utf-8?B?ZmdSVjJnakRDd0ExRVN2emYwOVdLUEswQmVZOVRBbHRmM0t1SnB5b1JyWlRL?=
 =?utf-8?B?T09RTFB2ekVpaFpVZlRieW1LYU9Fc0NyR0VUM2EwTzdIVW90NEZ0UGpYMUh4?=
 =?utf-8?B?cUJvaVBlbFVKMm9ER1V6ODFnOTU1clNVdUlPYXR0OWJBbFpwdksvcHJ6L2RV?=
 =?utf-8?B?a2tMQTdpck1JZmgzYVlabjA4MnJkL1NGbXlpYktkYmovY1VVZkp3SnlqenJZ?=
 =?utf-8?B?eW9JRWJTS0NVeGtPVjl5eWFndllPaUpjRjgvZC93eW9FMHZpYWE5NDNSUVV0?=
 =?utf-8?B?YVc1Mk1vc3pqKzE4TTdUWUNVNHFGM0E4VnlxeEFqWGZ6ckxuclllUWhaTnJR?=
 =?utf-8?B?eU83TVVPMWMyeE9SS0NwTjhjVnVIYWpWZ1REajFxUkp6MUpLZjlCcVBZZk5m?=
 =?utf-8?B?bjErT2Jidm85L1pvRUZaVVAxcnR2YmxzbUk0UVJpNGg1aHczVVljcmxqS01W?=
 =?utf-8?B?MVVRVjZwMjNyV3crMXRqclRERzcraXQrU1FvMWxDb3JtM3EvbXdVSUU3MmNt?=
 =?utf-8?B?MEt3QndacGlGRVlBamdpQTd0NTRYNEMwQjc5ZUM4TmpoSllua05aM3VlVVBy?=
 =?utf-8?B?SmdtbHlWMG1WRCsxcGlFRGExS2c4YzV5bm9seGpzU3ZheW9xWi9IYzBtbVAw?=
 =?utf-8?B?clpWN1VTR3A0OFEyM0EzNzBpbWxYcjdEdHp0bk5oOE1jdmoyNms1cHRDV2dH?=
 =?utf-8?B?a3Jsd0Q1UnhIQjY4V3ByODJyMTFwdTFMc3ZsNmdDNUhaZHBuZTg1eHZBNkdS?=
 =?utf-8?B?Q0kzTExISEQrUTJBY3lNRG9UbHduUDk2a1p3aFNXRVd3ejYwR2NvbUlQS1Fz?=
 =?utf-8?B?MDMyMy9UVVp0bXBVb0Vyc1BNSmRqTThNQkRzOGNBMW1YVUwrRFh0ZW4ydzk3?=
 =?utf-8?B?dzhhTjMvWVVyenZoQ0RPVWlpa2d0YVNEYVdaUmdkVWMra09sa3hYbUJ3Wmxm?=
 =?utf-8?B?Z3RTRzhKQjMwMTVpdm1CTTE2Q29wbmFWd2tBZFBPM3ZXNm5PYmJ1bTJzaVhV?=
 =?utf-8?B?Nlp0Q1VpSGlSR3R2VmRudFRiMTN5ekM2UmFrTytsdGQ0c01LRkNPdm4rMjlH?=
 =?utf-8?B?bVBVcDJnalFwcnFVbFVjZ3AwcUhCOFkvTFdQZGpHTWRnMXNBbFpYUlVXRXZB?=
 =?utf-8?B?WHluTmNUVUJwak5ITURSTlRZQXhFdUVNYSt6ci9GaXVUU1hxR1F5QTVVdWU0?=
 =?utf-8?B?SlY4NkV6TTdIR3JxUHJpM1U0aERqblZKbjFoU3JEc2lFU0IwcU9ZZ0R4WEQ2?=
 =?utf-8?B?UTVCYlEvd3B4dDBJbXRvWkN6dS9QblNicVJFNVFEdStwUFRSN2NicVBUVUps?=
 =?utf-8?B?Vnd1MElHVDdQc3JHT3FTY3dhdGsyaGlXb3lwT2hGR1hKdllFcHZhcVN5SW1s?=
 =?utf-8?B?Q2xGQ0RvbVhXUnhmMkx3aFVISDdFQW9DN2wzTnVReHhBR1BIYmxscmlIS2dU?=
 =?utf-8?B?ZXNhUXRPd0p3YURxR1kzdzlIbGF1cFJzTnRSRVhySkFXZ0dMVTNLbUVlQjJH?=
 =?utf-8?B?YmNpaENjYy8rUG1oOWNZK3FKQXRaVU9FMis1YzdGR0tVUFFpQVkwUE1vVzFm?=
 =?utf-8?B?YjA4SC83ampXR3dtbVoyOG83NmVsOW41UzZUVXZPNGRuNFFMd0VpcDZKWjBl?=
 =?utf-8?B?L3RDTE45U1c4Zk55RmJZT21HMWVlUjlQZ05iVXZBZ0pQSUxwVW1kbnd5WTZt?=
 =?utf-8?B?YUVnWlBQaitrc1puaU5RcEFkSEtkVVZKckFUcDJBcjZPdFYvVTE3OHBORVJ2?=
 =?utf-8?B?K0VmdWY0ZFpRa0RBNUJrQjFLUi9KdW9udTlVNGlDc0RiWXlhRkxkSCtTR2c4?=
 =?utf-8?B?amt2SGxacVRaVklWOXBwdVl1ek5GSXZCZGgrdEVKa0FhYUY4K0MxMjJ1SHE2?=
 =?utf-8?B?d1ZaSDZTTEhsbW1hL3h4elNGdlgrdG5pWjJwTVRsNGVVdmNuWHo1bVVQQUZq?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8565c6e-1f52-4632-ef5f-08dd9972d72a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:54:27.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wzKMZH4d54b62NXNypOq6cYkfZqxAK3cxe4HARe8GGMEk3jjyaPOERNO/vxZCiUEMLftvwURVauCHZ4H3l1PrcOym1XybzYle4kaPjhAPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
> Bits Description
> 15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
>      Monitoring Counter ID + 1
> 
> The feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Detect the feature and number of assignable monitoring counters supported.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++--
>  include/linux/resctrl.h               | 4 ++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index aeb2a9283069..fd2761d9f3f7 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -345,6 +345,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>  	unsigned int threshold;
> +	u32 eax, ebx, ecx, edx;
>  
>  	snc_nodes_per_l3_cache = snc_get_config();
>  
> @@ -375,13 +376,17 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
>  
>  	if (rdt_cpu_has(X86_FEATURE_BMEC)) {
> -		u32 eax, ebx, ecx, edx;
> -
>  		/* Detect list of bandwidth sources that can be tracked */
>  		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
>  		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
>  	}
>  
> +	if (rdt_cpu_has(X86_FEATURE_ABMC)) {
> +		r->mon.mbm_cntr_assignable = true;
> +		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
> +		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
> +	}
> +

Shouldn't ABMC detection also include enumeration of which configurations
are supported? From what I can tell, looking ahead patch #18 hardcodes definitions
of all known "bandwidth types" (which term to use TBD) and then patch #20 allows
*any* of these types to be configured irrespective of whether system
supports it.
AMD spec mentions "The types of L3 transactions that ABMC can track are
configurable and identified by CPUID Fn8000_0020_ECX_x3."  It thus looks
like the enumeration of r->mon.mbm_cfg_mask when BMEC is enabled is
required for ABMC also and used by this implementation.

>  	r->mon_capable = true;
>  
>  	return 0;
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 2a8fa454d3e6..065fb6e38933 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -260,11 +260,15 @@ enum resctrl_schema_fmt {
>   * @num_rmid:		Number of RMIDs available
>   * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
>   *			monitoring events can be configured.
> + * @num_mbm_cntrs:	Number of assignable monitoring counters
> + * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?

"monitor assignment" has not been used so far, was this intended to be
"counter assignment"?

Reinette
