Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12D18A6BA;
	Wed,  5 Feb 2025 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799846; cv=fail; b=f18mDKXGOvOtL3hQe7ImIrtEUd7V9rG1T6vM81Z1bjw7k0ckpp2WIdjyGiU+HQk4Z5nm/K2JAgAEgyAvW8Jq5I5ba6R3aPKR2574DemGVRWAAuPasLCk2QcQhh/vcnkmBO9C5BV/7cqD6EiU8FoKVbjrYEUHAHGJYmAeOI9tZk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799846; c=relaxed/simple;
	bh=6pg5YMqE5/Ck2ZR3Xs2B5NTvlnlryGsKqAyoubESV5Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pyQSEF5tFTsnrImgjfaUcMQo7fKgcY3nRl4/GEMkWYm6rq8eIgAg8vompKuKqOZ8YjWvFC6ntBn0UmpxexmFt9JzA5eKLOA/6uw+rkW65M/ylmClvkoOC75ltxCfJRQqHtI5AJIsc5DFnWiEOK9ym4gmMShtju9NznYRAjD/RWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kym610A7; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kym610A7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738799845; x=1770335845;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6pg5YMqE5/Ck2ZR3Xs2B5NTvlnlryGsKqAyoubESV5Y=;
  b=Kym610A7xWH4dQgOSV+AaKjrAK4GopjntDHuF+OZQLYEAhoNpjvkU8Ew
   fJ0/wh3s2bzplzQ9Q25FN1rOc16kbvrVvyKftSAM5tVg4dkC/EUXX6FNV
   JGBzgW8JBcHwAdC/lIylf7fiklSZQH2sMZ+f5OqTipnWmTWBWVN1/8BKY
   xgwQlzEtBwxj0OmGGPa9BUvWqWm5WIDcU6XXjS9UOan2j92c8EZjb9//y
   1Atf0MT9ne6iDI8GxzpK9XilC9QvIz1iL5kFWQ6iPuSL+TZ8DzaYhRHls
   qx0wuPfPdLdh1/xXKaCmmvCt9O0vm0nOxEgN8yIHNW6FtUipEHuaHddgV
   g==;
X-CSE-ConnectionGUID: +AT0DCfrT/6v+plEYvkEFg==
X-CSE-MsgGUID: wpc74gn3RkKXYkLe+wvUBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61861825"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="61861825"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:57:23 -0800
X-CSE-ConnectionGUID: W7m1E7HeRjCGhbbY1D8WTA==
X-CSE-MsgGUID: x9++QbNmRbGZ/GpCCiW5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111940641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 15:57:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 15:57:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 15:57:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 15:57:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvdlWWH2X92y3SEadZvi0/hYKvPiMb9yfSGZ+fpgu8mJpoDBvvXGlYB268VKmtGidahuNVgaWVaTYgSE1oTP2VROem1UtbEqSFyxJ+j4pwnK8rm/pkYXPXjUPmP+pY90WrZERYgptZnIhWAXpfSHInV+bDWEb7jitFRgjgfx8oL/LY8MLKxV9QQi4OKTPwPPmEj+SRqd9jzZ4hysMCSTG+5co6tx3AeHHjwXi5ym/irVokYOvmo1obtTCpmFZSb49Go1StWUxKduZlRGs1F5mMPbroO50brewC7WMBKIdjcGbEBbqAAr5IQnlFWJR9SuPqflLQrQsP7Ps0VAlBIXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBpCfHrvFeTI9utImezaUuOXkPOPkv5+DHZgYH6JKaI=;
 b=joQQkwx7g2qrPLwCsz0Y5gZYkFvk6n3PD/tZ5hOFaZZy3HHwARQBZ3fhDKHMutcWwi2oH85NopVPAKEooU6TV4yCVYR+qUpZcV+z5fbzfOG8BqvPgNgOFmWFBucTm6amYb1cMBpVT5dWItRklahbZz7c4jOsyYK8Htpj6K7qA1hGfw9fP09GQHOmwnOaODpmI/AKf0E4mhLd1OgA4X6X6jbx8v07I9j9aEEccCfPcIlOhh4A0GOgdo5WxYK8qiuGqQNk2Gzi9e6JvqCqW9tYYdSDHuIjQ9yHBxvCDx2pttk+ohUW6AVoRiKAejdu6nfV4Qj72CKaKnxYTNaHnHvIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 23:57:17 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 23:57:17 +0000
Message-ID: <b88868e1-52b2-4a66-bec2-e0846394b74b@intel.com>
Date: Wed, 5 Feb 2025 15:57:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/23] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
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
 <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0fd3e9-7fa2-4b24-e326-08dd4640d1ff
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OS9OdFdrM1pwTUlUNDE5cGlqSkJFdCtPMnlLUUpkOG1iQnBJZmpDV3hjeUg4?=
 =?utf-8?B?KzlMWTNsaFVqMHRzekc5bWxXK0l2b2VhOWJKZWI2SXVxbFVZbkhlWHN3Mmp2?=
 =?utf-8?B?NVBqQmVKeXArc0I3ZVBTQ3JaOTZrTTVhSzBZcnczQUtvY1BSanlUNFUyYkZQ?=
 =?utf-8?B?UDZSOGZMaVA1cGtadW9aclhoMDRrSjBycTlXSXNSTlduNEpyMVl6WUdrcVh6?=
 =?utf-8?B?UDZBdG1SNUxsdjVrMkVSMkluZmc1WGlwRDNodUkreXQrYVBUZDZuc212eHk0?=
 =?utf-8?B?Q3VQL3VaQmpMWTgyZ095UjlxbFJDQVk2Y2cwc3Z4WFplMUt5YTJLWjNmeWI4?=
 =?utf-8?B?eEpIakMvVWo4ZVJ4YWptQWFiUXVkN0NjTHozLzNIbHdjRlk5TFhwNjdyWjBW?=
 =?utf-8?B?Z2ZFNStJUklFMVV1dTVteVdEQ25GS2lXNy9BRXJvNHBXMzloWGYxaHJGNDNH?=
 =?utf-8?B?N1QzMXJWSkRpaXRIUnlCU0p6Q1hJQlQ1bjhKSVgrbld2TDdYOVRPcWl6UmdS?=
 =?utf-8?B?WW1xWUcvTHUvUGlvK0I3S3VobEtFNTl5MlQ3ZmVGdjhpL1l4RXZhdWkzeTVI?=
 =?utf-8?B?UEp1N0hhNDErTVU1ZDJWUTFjbnFYZFFXVE1UZTg1Z2c3amlZSDVkM2dwcjBi?=
 =?utf-8?B?YnNGRnNWVU94MVY0RWYrcEpRY3crT0JwQ05sQzgxWFdZN2lsdGFUMjFrTDd4?=
 =?utf-8?B?RUR3dlVzYjZPdkhtczRiaVJ6UWpyK3JXTW5CdHFkUVk2Y1ZyTUVNM1hEcEt4?=
 =?utf-8?B?WkwxRjRxYmpCWmQ1OGVUZldsVFpuRjkwU2xKanoxMXJTY21ZSjNGZnZNc0NM?=
 =?utf-8?B?ZjhWek82TXM2U1JwUE4yMmY3RFd2eUY2RDAxM2VrQXRpNlBXR1VXRlVTSUt1?=
 =?utf-8?B?Myt1cGtvTWlXOU5CZTdMbmZSWHVrQjRES0F1WGgvTzE5YzB6QngzTUlOdTRy?=
 =?utf-8?B?NmdPZE5rUHpNSHFMcEg1dnVXSkF0NFIzVDVFUmZJSjVmSitUQ2dGemJnV0Ry?=
 =?utf-8?B?cnNzZTRrYkp1MjROTDRpZWtLY0RIcEZYNFNJK2NRVnpJdjZXb0R0OHNub1d1?=
 =?utf-8?B?RlZlOG8wcS90WlVTYnlaODdJTlUyNDhhQ2c2VXVDWnU2ZTVKRlJzbk5hc0JQ?=
 =?utf-8?B?MitlQzlXZ3ZnOUZXWWVXUFErVEk0Y3Q0Zmc0TXBMT0N2c3ZudTMzYkRtWkd6?=
 =?utf-8?B?RzF5WXNzdEwxWlNVWEtPT3IydXI0Z3ZOVjJqQnhUNm9keWpzdmZEdlFPWXcw?=
 =?utf-8?B?WFp5ZnJNcEliSS80MDdVTHdLUFhPRlJpVXZkdGJmT01CYmJwSVk0RThRakdj?=
 =?utf-8?B?QmxDalFyTkNtb0JrcTdla2RkN1hzcE9lY2EyVStQaG5sZmduVkE4T3ZWc1p0?=
 =?utf-8?B?SE0xZkdta2NsSVZIRFgzVkoxUWRzaStJN3p3Z2dxb0ppL2xIY3YyQ3hNRkdO?=
 =?utf-8?B?VUR2TTUvSnBDb0U5bVNhencxSE5ScUgvVHF3cXRneXcrV0FQeHh0bnNLanc0?=
 =?utf-8?B?UnhLampxSTBKMEFjSEZiRUhFNlRDcUNvWGZ0RTlJQVNYck5tYnJ3NGlRSkhM?=
 =?utf-8?B?emFKRmplRHFTM2RMSnFGcGtYZm51OW9mV1RjYndQV0JDL0JuZDRxNUVtMkl4?=
 =?utf-8?B?NlJjczRkd2VtM0ozSW5EcnNZWWQ1aGFnSWF5RDk5UjJCNmlEMzE1NWg2emIw?=
 =?utf-8?B?ODN3R0FZV3JFUHlQMDVGRGt2a25IRVlmVlN1eUpJUXpvVW80TVY0MDZxV3VP?=
 =?utf-8?B?elp6U0xNYUFYcUgya1pXaGMvei9BM1JlOUpUdktDcWptNkFyTGhSSDVaZXhN?=
 =?utf-8?B?TWhxNHF4ek9rK2lMeDRZblFxNDdtTnZjZzVMelJMcHV4QmxRVjgyUlAvc0g5?=
 =?utf-8?Q?VWq1ZmWiTxeWh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkkyVmFBdFhQQkllOGEwenh3NDMzVXY0dTl6NEVkTHBlSHZGUjg1Y3FMd0JW?=
 =?utf-8?B?VHNXRXAvbmRJYUIyaVJEYlNPdTF2Q1RUVmszNU5rb0NnMlFmMlpXL3poV1FB?=
 =?utf-8?B?aHNYVTlDMWg1bi9LcGdmSjJGTUQ1SnE0VkJGQ2tZZU4xQmU2d1VOU0FrZ2xa?=
 =?utf-8?B?MnpHeEFKU25PajJmSitNblJlUWhaSFlEWFl0c2dPRnJ2NEc0M3V5QVVVYkhT?=
 =?utf-8?B?emtrRGFGaWIvY3FBazFXdDZmc2MwaFlTMmsrVVRQMU9seEJGZ0szTlRTTXJn?=
 =?utf-8?B?YSt6azlicUtyc0thL3huL29uUGRvMWVDOWk3NGxnMzJDL2pVM3ZGWk85OERu?=
 =?utf-8?B?UkRvb0FmK1dWZ2MzWkQ3cm9aRTJ6b25LWTFGUXp2cWd4WmdXTVpMRnhsN0RP?=
 =?utf-8?B?MzJsUm1WWnZmZVhrMHY2NHoxajRLTG00Y2xrRWdLVHBXQXdYSVA5cmZROTlp?=
 =?utf-8?B?RnR1d24zUFhJd1lpeVIwN0tZdnBiZ2hQcWg4TGxUVHRmNjlLYXd5TWtqMkZF?=
 =?utf-8?B?bkxkTDBWNHZ2T0pKZ3ZqbEFaSkpZYkJra1N0UnhERW4xNTdRVjF1TE8rbjlD?=
 =?utf-8?B?YUlKeFBSSFloZDQ3S0tMWVpBNVRKcG44ZHJlWTdmT1RqL0J6YVhGalE5V0tm?=
 =?utf-8?B?VGFXSUFxNDlyVkxadzkzSWNpamdDN002cUdOcjdGelRBQWl0STdBL0IwSERa?=
 =?utf-8?B?LzgxWG9VcVFWb1pkY0Z0aFZtYVg0eDdJUEpsZ0VTU3FSeWtUUGVjS1FOdDJk?=
 =?utf-8?B?VTQ0RUhSNXhoTXpSNm82N2Mxa1BrdWdkZWFVOURtNVg4WEJWeEYzd2FlZmNH?=
 =?utf-8?B?b1RYNVpQb2R1NEV2Vk9tUnYwWS9ldWlxVldYa1ZGRFQxL2RjS2czSWh5VTkv?=
 =?utf-8?B?U2ZFbm50T3lyMnAxVHZLZW9UUzh3a1N0QzJxUXh4a1lOVktnMGZycmdZVndM?=
 =?utf-8?B?S1ZMb1dCZzlGaXBDSjFxNVpYTUZoUzRZNUpFamd2bnRWWHBTaVNQNlVuSGw5?=
 =?utf-8?B?VUt1WHR3YmIyaHV3Tk5GZS9sNWpLNlNPRlhjZkQxQ0lDY1EwSEtJNCttb0F5?=
 =?utf-8?B?eDU3b3BCTFhBZnFvV1MzVE53Q0xpb1ZBNlNXd2xHYUJMU3lQd0pKRU81Szc4?=
 =?utf-8?B?dUp4eHVpWEwwUlVNQ3N3a2F3S3kxcXg1YjNvMngwS3JHMXlUMXVhaTJwaTVj?=
 =?utf-8?B?UHBiVkJuTGhFR0FJNUxsK2NxenB1NGdYdnJaRVhuZGFIYUZpVE0xSEJZY0tQ?=
 =?utf-8?B?elg1Ym96NVFzdll3elY2cWVkbXBpMFRUdzZ6UkFLMXRETkNsRFJ2K0JMNS90?=
 =?utf-8?B?L29VZWhrRnhtZ2FiRjJzbVhnbXVkK3ZqMGd2TXczUVFvUytMT3RqcjVEc0ti?=
 =?utf-8?B?aWJxK0JSaUVRenVGUmd6dTVjNXRacjhITjdDZENmVVI1eW1YaXBqcVU1dWN1?=
 =?utf-8?B?UGtHK3BnVmNNZmR2N1VFNzk1ejd0VCtJUE13K1cwYVlNOTdXek02cVU2YWJH?=
 =?utf-8?B?NWlhdEd6UFM1Z0w0WXFveTY1WTJGVUFpclcxYlhPb1g3SnZuem5GNis0QkNX?=
 =?utf-8?B?RWFMdU5TaWsyUk5oQzJOdEpRWTZ5NzNCSW9IUTRrS2FEaFI2V3pYYWFMR1dt?=
 =?utf-8?B?K0RjZUdpQmJtOWRDMC9wQ3FERHRna1N6ZjhmOS9LZzV2QW45S3IxQnpWSTVp?=
 =?utf-8?B?UThUM3d1TWJYNHdYM04ySTlDZE5iVnNZL3l3NnE0MUZSMnFFQnYxMHdocVZF?=
 =?utf-8?B?U05CTFJjZmtSQkJJTnlub1BQdVNoVlZGQlpVT3NQZGZqcmZUNEJvbHNvVHM2?=
 =?utf-8?B?RUFNejJvYlpNS08vZXhIeTJjWExJRmxseitoazgxdTlZZU1zbzJGcmdEOHM2?=
 =?utf-8?B?VXhjWG5KVWJLaUxCV254RzJwdENBU0FCOW0xa1JMSmFnZkpmL21EYVoycGpY?=
 =?utf-8?B?OUs1S0t3dWdUWUkxVG1PUTlMS2VVSlZHSTM0ZGtwRlZ2bVhTWkRHa1NLdWdC?=
 =?utf-8?B?TW0yNGZ0VEFBL0x0RGNwWkF4TlhUM0lYYjYzam1NdnByVWpQM1VuOHFMSVlq?=
 =?utf-8?B?b1NXYTBXd1FpeStiZUhQS2JrbkRMZmh5RS8rdzhtLzYyK1FpOUZXS2N3dkhK?=
 =?utf-8?B?R1FsaXQxdStFV2tROC9rNUQrSDAxRXBua1dpb0hiQ015Q3ZqYk9xeGlyOG15?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0fd3e9-7fa2-4b24-e326-08dd4640d1ff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 23:57:17.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHNBsekSR44/gJ89Tij8PLZ+T5fLiiC0sgnAX2zaPWizDycBTcz1/COyU7g0G2FQ03DFLZyL6y2VibShGCv5QCymf6hTpGeVNngral7g41c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
> MBM event of a monitor group. Hardware counters are assigned/unassigned
> at monitoring domain level.
> 
> Manage a monitoring domain's hardware counters using a per monitoring
> domain array of struct mbm_cntr_cfg that is indexed by the hardware
> counter	ID. A hardware counter's configuration contains the MBM event

Something strange in this changelog with a few random \t in the text.

> ID and points to the monitoring group that it is assigned to, with a
> NULL pointer meaning that the hardware counter is available for assignment.
> 
> There is no direct way to determine which hardware counters are	assigned

... another \t above 

> to a particular monitoring group. Check every entry of every hardware
> counter	configuration array in every monitoring domain to query which

... one more \t above

> MBM events of a monitoring group is tracked by hardware. Such queries
> are acceptable because of a very small number of assignable counters.

It is not obvious what "very small number" means. Is it possible to give
a range to help reader understand the motivation?

> 
> Suggested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 11 +++++++++++
>  include/linux/resctrl.h                | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 18110a1afb6d..75a3b56996ca 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -4009,6 +4009,7 @@ static void __init rdtgroup_setup_default(void)
>  
>  static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>  {
> +	kfree(d->cntr_cfg);
>  	bitmap_free(d->rmid_busy_llc);
>  	kfree(d->mbm_total);
>  	kfree(d->mbm_local);
> @@ -4082,6 +4083,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>  			return -ENOMEM;
>  		}
>  	}
> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> +		tsize = sizeof(*d->cntr_cfg);
> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
> +		if (!d->cntr_cfg) {
> +			bitmap_free(d->rmid_busy_llc);
> +			kfree(d->mbm_total);
> +			kfree(d->mbm_local);
> +			return -ENOMEM;
> +		}
> +	}
>  
>  	return 0;
>  }
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 511cfce8fc21..9a54e307d340 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -94,6 +94,18 @@ struct rdt_ctrl_domain {
>  	u32				*mbps_val;
>  };
>  
> +/**
> + * struct mbm_cntr_cfg - assignable counter configuration
> + * @evtid:		 MBM event to which the counter is assigned. Only valid
> + *			 if @rdtgroup is not NULL.
> + * @rdtgroup:		 resctrl group assigned to the counter. NULL if the
> + *			 counter is free.
> + */
> +struct mbm_cntr_cfg {
> +	enum resctrl_event_id	evtid;
> +	struct rdtgroup		*rdtgrp;
> +};
> +

$ scripts/kernel-doc -v -none include/linux/resctrl.h                           
...                                                                             
include/linux/resctrl.h:107: warning: Function parameter or struct member 'rdtgrp' not described in 'mbm_cntr_cfg'
include/linux/resctrl.h:107: warning: Excess struct member 'rdtgroup' description in 'mbm_cntr_cfg'
...                                            

>  /**
>   * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>   * @hdr:		common header for different domain types
> @@ -105,6 +117,7 @@ struct rdt_ctrl_domain {
>   * @cqm_limbo:		worker to periodically read CQM h/w counters
>   * @mbm_work_cpu:	worker CPU for MBM h/w counters
>   * @cqm_work_cpu:	worker CPU for CQM h/w counters
> + * @cntr_cfg:		assignable counters configuration
>   */
>  struct rdt_mon_domain {
>  	struct rdt_domain_hdr		hdr;
> @@ -116,6 +129,7 @@ struct rdt_mon_domain {
>  	struct delayed_work		cqm_limbo;
>  	int				mbm_work_cpu;
>  	int				cqm_work_cpu;
> +	struct mbm_cntr_cfg		*cntr_cfg;
>  };
>  
>  /**

Reinette

