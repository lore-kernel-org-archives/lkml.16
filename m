Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F59027CCE0;
	Tue,  1 Jul 2025 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387842; cv=fail; b=W2IR4Wo1e17DaSiO9WIonT9xlLoc9N4NXyu4ZMW6dM9mZjA9uHgXamWvwZF4s8b04AvM3ZZngkiUl0RoCt8sY4cXV5AU7FvIIk7ZE6agzxHhf5oz/bmerBzLvtE50XmnpAmT5UsnO62NznJfg+y7MzKhTzsAcVhyKRFlHuvhCd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387842; c=relaxed/simple;
	bh=cyRSMYF1M6pfdONeWyi3JfGDyE0oZq4bdMOuYZ5oGls=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pjIY40aDL2lVUgoT3ToCaoC6JngvYd3kyqNzOpCm552lj5mr5rBxUbjKQOc4LtDmiXUMaUbyCNLfb6FrA/48heQv3u0q4bTO6HUXc1EyUExqNeC66/TkqAVkGLNIGxiFTbqJwAVwsrnXkmUinzjoKs8xJWxG8Wupt4Q74vHNhgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jialNB5z; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jialNB5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751387841; x=1782923841;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cyRSMYF1M6pfdONeWyi3JfGDyE0oZq4bdMOuYZ5oGls=;
  b=jialNB5zEwhn03hPzdIG+CMnNoaV/RBbYGD8wCA3n9Y2aVLlO0N2GvR1
   60ghWxdVdhHVljD8SMQCdyUjINMsye/FMrsZCBWsN45ro1vM3rYLmQcaf
   Ug8HEUZTctlOmp8lTPqVItcKLKXJuHkS3aWQmrZhGB5fBuFgOxZ7LkQZa
   kK2sp0vKPSZTxtEIPNLWF/gUXXHWE9P7M6Rsf4Hhzu53CLroRPvlljuMC
   7p0Pjg1GNH5ZKG6byiXGKGAxNxTpOWfmQs7Cvn16pqzrwH5JTChGmCU+L
   I/9gbs9VUkXG74guYwA4CUs5dEMqgCO/sRFycU/vhbjEu4B0bZOUedhcs
   A==;
X-CSE-ConnectionGUID: VxiNkgD3SJ6BLFtYXuxNuQ==
X-CSE-MsgGUID: aQh8W0C6Tt2Nx9DeoUiTbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53805284"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53805284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:37:19 -0700
X-CSE-ConnectionGUID: Vbguv6BhQnOO7BpesO+iyg==
X-CSE-MsgGUID: SMLyRq+bRtSLGMTIjOpQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153978049"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:37:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:37:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 09:37:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:37:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G38kiSoDH0A+BTiMZrvR6c4ZKwTSeeZ+2AuI/+luBHK0JFgmiD9ENMTuDh6T7SP+Ph3Pd1W/6iE9CRE3QZ/GWGKhICByydyeiX/vErkXFwAZspl2LrineUhxqtZVPra7rz/WvStppFijsiznLezxAvjeggVwFrXje6sX5pHon8bXOK6DQ9i2XgvgnF/aTtoO3q+JhLRn48UUW0I88Rp47sq0HuUGUrAfUEBMDHbl0HXiUc7g23XBA/DrCUpnNZcsJ5uaBd/kcSMd4Resuvh1EMaE5YhWQ9qIHBvDR1nPiv7xWsUrHXnEA/e5cYL3w3rxiyoKZPA1GoLD51r/k+XdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auE+lJQ6bRp0G/7Wm1cI+ke4x76InPpw6toRPgomeFA=;
 b=Op5M9qq5+/cJtmgY0SafaLWzOwYsDFNXqNL06rBfLfR6whYgkjoie+5YgbAkWapIO/d7fB1QV4ipucDLMFwk6R+JYGMKCj286mFMh/bA1CRKP2o8VYu4x6K62CUWvPb1TvE9qnphaBP/jlucu+soUZ7Fr/YckQLzVNuweHyA9sKNTvjUXW5kAIlNlFSBFVhq27e606WumkX19DI6kPM4MU5Eyr3R/tTHsAQEtUmSsaZlovNVRGX0hVariDn9gI/IHOGgg5jCwj7uxUYMc3pxMZziy5ndVqVCe63YsWzakCwOHv2MV1TGSIcB8gHzSEoC5E4GVj0X3h0Bad3bfQKwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 16:37:13 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 1 Jul 2025
 16:37:13 +0000
Message-ID: <7fcdb142-b188-4f8d-ab26-391e0b9cec8e@intel.com>
Date: Tue, 1 Jul 2025 09:37:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/32] fs/resctrl: Introduce mbm_assign_on_mkdir to
 enable assignments on mkdir
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <a44e9063c26c2c33701816d09f488cec522f2530.1749848715.git.babu.moger@amd.com>
 <dd4a1021-b996-438e-941c-69dfcea5f22a@intel.com>
 <2cb7cba2-616d-407d-a9e6-82d738a4c029@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <2cb7cba2-616d-407d-a9e6-82d738a4c029@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0017.namprd21.prod.outlook.com
 (2603:10b6:302:1::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 9231f7c9-1adc-4c8d-0a44-08ddb8bd885d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnRZazY5TXVvTkRpclJGK2tLVjhFTDc2Q2o1V2UrZFBiMFM0YkZwaTR0V0xR?=
 =?utf-8?B?Sm15WTFIbWluY000ZlJLSXAvaGtkcWxnYXoxQWZGb3ZxZkN1UmZValptMVgw?=
 =?utf-8?B?elVNemtrbEtnQlpPa3E0aytxVEY3S21ZZnlXOVlBUWN1WHRraFVwQ0tpelhr?=
 =?utf-8?B?SzNkaEF2enVlOTV3Mlh0TWdPenNYV2ZhR01aWURQSEZ0ejZSQnp0d2kxU3pN?=
 =?utf-8?B?cTZ6VjBJYTBHZkZGeThsdklsM3VYOTdkQy9rVU9rTnNPNU9FMG1lTTZ3RDdZ?=
 =?utf-8?B?ZmVac1Jsc1lJaGUrOEJBbHBtVVF4TmFuRkQ5NWxEN25sNGJWZGNvQkNxL1Fm?=
 =?utf-8?B?c3k0VjVxL2RUbnhydERlUGh5MXZrWXIweXVqYVdNelBsQ2I0elVsK3U4cC92?=
 =?utf-8?B?L2VhWGEzc1lGczdkWStzZ1VNSTJMTUo1ZkZWOThIeVdMK2NnTkJrWFU2VG8w?=
 =?utf-8?B?SmErZUt6RkFmMXZQaDFKQUVMcjhpTnkzc1NHRk0zdnlxMi9WOTFGZWFnR3Vh?=
 =?utf-8?B?MDk5MTRYN3k2NDk5V1pPbTRwTG9FK1hrS1pyTngxRHU5cE1sS1dYblViL3RB?=
 =?utf-8?B?bkpzR3dkcHZ2VnAweEg3TXlMTmxsYXhMUFJMUkQzUmdHd0g3L25NZm9FNjBX?=
 =?utf-8?B?eHpHVnc5MDArbC9LRk1RSkVJWEQxWkhoSDlHUVFFSDZITndLS1ltOWY1b0NJ?=
 =?utf-8?B?dzA1ZGU2QWtCNXR4Q294WmVpMTZuUVJHQitGcXYzcFA4eVh5UEJLYXJaTXlk?=
 =?utf-8?B?SnF1cTNEZDIrOFFUaWVMcjdzR3dRTWJFVjJZLzFCcVFWYzVqbUU2eTQ3UEM5?=
 =?utf-8?B?MnB4STBhVER3WHJHcGhhWHlHVmRRUWFxcXFEcEwxTFptV2NjTUdIa05xcnZ2?=
 =?utf-8?B?U2JrVkVKTWdubEt4c21nNFp6SGZTdXhqbmQzVUwwSjlrTjQ5THpVQ3l6WGw2?=
 =?utf-8?B?MldYbSs0MWNGcllzTHpqdTJ5WWx6ZUJnZ1k5NlNiT1d2d21va2h3QWl2dll2?=
 =?utf-8?B?ZDUrZm1hTk5OZjBjamRqSjVoeHdrMksyMEhCdlhhZHYrTVRacVFwcHNhcWEy?=
 =?utf-8?B?NDZ3d2NTamtVSytoSkMxdEg1anZkWk14ZFFoN2VPR1QrNVN2Rm03YWZPZmpy?=
 =?utf-8?B?d2d2MkR6b0VFYW1sUGRTV2JIOC9oQnl6RlZjd2o1bkEwdUtMV2EycHcwZ005?=
 =?utf-8?B?RnJ0RjBWY3RsQklEK3RadUxDWHhteGtOVm1VVXpZekk1TEc1TWE4OWhmTExh?=
 =?utf-8?B?Vm4rdEswaW5MUktvMHYrVjVadCtDSHU4TlVDOWJNTlkvcTJyekJ0Nm9rbXhX?=
 =?utf-8?B?T1RxMDd0SEIzSnFRYnJuVmorcktwcnZtZ0NpYTZ2RmwxS2tHdTRoVnBzRGhT?=
 =?utf-8?B?QTZ2M25XcERxZ3hlRXBJdUlLWjI3dGQ0UEhFb1JwTnUyZXRyZ2RxUlJnWHF5?=
 =?utf-8?B?UXVSSW41M1g5U09JMytCQWpNN3k5VlBEbzk4TmRYVXFTVTdVY1R5cUdhK3cv?=
 =?utf-8?B?bU94Q0VLVHcyM0NqK2FvNk1ydkh6OVFMR3J2Mng0ZEZvdjBqUTc3cnAvcG9K?=
 =?utf-8?B?OElpQmFoTHVxK0YvVkVkUGFadnRoL0FDM3BMWW9wY015MFdrcFBTcFlBMEVr?=
 =?utf-8?B?UktKUzJaQ0ZMNlMxdURaSmFNK0RsY0E1bzk1djRlMExQUkttMnpPckJmMGh3?=
 =?utf-8?B?M0NaN1YyaWthOS9wRkJXalQ4SjlZcEZzb3JwZWhuUCtGSTJDOXBnclF6K0ky?=
 =?utf-8?B?a250S1NHbXluaTN2enAyTFg0WFJZclRIamVEUy9WZHV3VWpBbDh5SWhWZGgx?=
 =?utf-8?B?TDJBR0U3eXRqcFpsUFF3SjFRZFI5bDBPOVV2dkJ0TUZYM1llN3pxWE1IaFpE?=
 =?utf-8?B?bG8vY0x3dVlVVUtka0MxV0xlbm5GWWxKTElUVURoTDRJVnNYTS9oOXNsQUMy?=
 =?utf-8?Q?EY5DrzsbZt4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3NzVjZNejRMdlNjbE1oaWdXbFE0RCt3WG16eHF0TVcvQnFOVVFaK3QyeE1m?=
 =?utf-8?B?d29aTGpJRmYyb2ZkcWZSNVRaWGg4SC8zZ2ozeDBBemtqU01vbzkzTHVKTHNG?=
 =?utf-8?B?MmZJSEI5MTlxT082NzByM3p4dG42RnFxRXcyUlpjdDAwVFg1OEVKZ2tPdjJD?=
 =?utf-8?B?M3V3T3o5UkZ3eVVOMVJaNm5DMlluMWdpWXlXc2l3OVdESFFxYVFUNTE0Q1JX?=
 =?utf-8?B?eU93SVd3WCtya0hMV3c2RVNvWml1dS9aMzJZL1d2dnpHZmROVDBCV3ZpZ3M3?=
 =?utf-8?B?NUhUOVdCNVMwMzNBUEtIRDFkL2RveXAweXNxaVlIV3hkUUhCMTYwVitvU010?=
 =?utf-8?B?TGpoWVdhWURzazQ1SFhJRitGbVJSVndHcGRCZHA4T25ha05YWTdqb0h3a25P?=
 =?utf-8?B?bnJwTHBVV1oxM0NwV1d5cStBdG1HV3o2S05CMzJKVXpqUlZvcVBZb29XSFdI?=
 =?utf-8?B?WmF2N0V1Y1FwWC9uZDNnTDFOeThCc0daRnkyWTY1WjhiYzU3YlkveTVwMUo0?=
 =?utf-8?B?dDNjVWRtb0lpSVNVaW92aUxrZFBIcVZSV1ZoUDFnMm9pVHFxblN6QzlJUzEv?=
 =?utf-8?B?bDZ0bnZSdzI0UlhaWEtiUkJqcjBHVDhMM3lDRWFtUUgvc0R6VmxuMndPdkRZ?=
 =?utf-8?B?V1R3ZnNINEk4VmpOaHU5bDJ0YWRYYWJyVjhDTThjWXc5TkxIYUtuY00xSGlJ?=
 =?utf-8?B?UkVhd1ZzbnQzMXdWV2RzeFhCeE5POTdGMjhVNkJsUHBvR3lwYlUraER2YS8v?=
 =?utf-8?B?b0hxVnZwUWM4TU9BRVRZQlFVRkMvb1c5TCtpOTJxUXVHd3lSRXlRRzAvRE9r?=
 =?utf-8?B?TGtHb0s1ckhiYVZWZzBQcXVJd0dBK3hnVW9SeWMrdG50Mkg3QWg2VXBOSHI4?=
 =?utf-8?B?ZWxubW1hQTR4a3hRWFE0RW5FVkFpQUR5dEhDYmNIWG9ra0FHWjB3MFloeE43?=
 =?utf-8?B?c2pMYTFiMm41UzdSWXFlV1pCbjEwTGR6dkg0dXFaL0U1eGpGeGJBOUM1V3Vs?=
 =?utf-8?B?SkVnQWV5czkrc2t5Mis1bVc3RnVaMSs4S09yNHovYVEyK1g0TEM2SjA5VFhr?=
 =?utf-8?B?bTB5RXNTZEY5YVVjNzhyR1Y0MUNXR29oeS9TRW1xTTAyd3orY3ZlaHgxQnF6?=
 =?utf-8?B?UjNBUWRwa2I3NmdQalZSK2Y1YW82dVBZTVlmTHIzZ3lLNFVMSW9zdnBHZ1BW?=
 =?utf-8?B?MzFyTXdkK2hLOXZHQkZqenJJdTlSWVMvUytDZGkvUTNpT01IZno3RjdmYnQ2?=
 =?utf-8?B?ZlNnRk9FSFYrYU5BM25rUlpYUnpqTUhTNCsrbjhjZDRPdFpQTW8zK0pVTXlY?=
 =?utf-8?B?eE5Gb21jaVJaL1h0cE1GU05ROTNKdnVrVi9uNU9mV05vT1hzZGRZRGRxaGpr?=
 =?utf-8?B?dzhKZjd1Z1p6dGZKZFhpbnUxWU9qenc5R1UyY2FwcDhWMEJySU1weEZLbWxj?=
 =?utf-8?B?TFBCRzY4dERpazNRSzBrKzhIaXdJd2VwYW9Ic3lxR0hkMmZ0UitDOFNDR05j?=
 =?utf-8?B?V3VSd0ptaUM1TTVSTVd4MHY5N25JUmc1Tmk5bHdmeFMvWlM1ckVYSWlMdE9N?=
 =?utf-8?B?ODJ2aFlhcVc0N3QwbzFlbTZaVWFpTWs0ZlRLZ2JlOXZieU1CcmZHc2JFYjV2?=
 =?utf-8?B?aEhCZkFQN2JLL00vUitKTi91VFhENlArMkRWaFN6aXVLdnFHY3RWUEtDOG0r?=
 =?utf-8?B?ZlBiY2cvQTZtK2wwb054aUF2SnVBUXIyTU1VWE90NDlvRnFGbVE4b2MyMzkw?=
 =?utf-8?B?OFZPSU5pUGo0NzI5NS9YRWVjbVVhc2ZadW4wMGJMMnpKZUhUb3F0K0xPWThS?=
 =?utf-8?B?K0F5SGt6WitpSzc0N01oSTEySjl5a3FjaG5IU3N4dnFHRU9vbm5qNTRST3VG?=
 =?utf-8?B?VEhVR3BVUy9yZU1ISEZNYUc5QlljQm1tYTF3MEo0T3dHRE9ac0hYT1VRKzJv?=
 =?utf-8?B?MitGSmtucG11enBla0lZWStWaVh1QUhBaDNTWVVmMDgrRlZZeSt1R1ZwQitm?=
 =?utf-8?B?ZnhmbUF4VkwrZDlHaER6Wmo1UzJ0em9mQUo3bTFMaUhoMDBVRVFrWHhkRjJ4?=
 =?utf-8?B?Qy8zdStVeUhjN3JLSk9ab0dXazc0OWhOYS9WMHJoY29pUWRNWUFBbGtvT2tF?=
 =?utf-8?B?RDdvc0xhREFZazgxNFdMNGpFeXJwZCtxblBUV3NUMlM4WWJGTVJ4K1ZSNkZF?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9231f7c9-1adc-4c8d-0a44-08ddb8bd885d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:37:13.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lCNd3wC+W8OjLtnlHNvzM14i7fBLBCKiZUtvMOeIX9wWkczHCL1HjSWJigrjOiBQ4Uwl0I14GtMdUkoNVd5J89vyBNC29UKyvm8aTxTymw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
X-OriginatorOrg: intel.com

Hi Babu,

On 7/1/25 9:23 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 6/25/25 18:24, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>>> +						 char *buf, size_t nbytes, loff_t off)
>>> +{
>>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>>> +	bool value;
>>> +	int ret;
>>> +
>>> +	ret = kstrtobool(buf, &value);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	mutex_lock(&rdtgroup_mutex);
>>> +	rdt_last_cmd_clear();
>>> +
>>> +	r->mon.mbm_assign_on_mkdir = value;
>>> +
>>> +	mutex_unlock(&rdtgroup_mutex);
>>> +
>>> +	return ret ?: nbytes;
>>
>> The static checker I tried complained here that ret can only be zero here.
>>
> 
> It should be
> 
>   return 0;
> 

hmmm ... I think it should be "return nbytes"

Reinette

