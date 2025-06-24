Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286A219E0;
	Tue, 24 Jun 2025 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808403; cv=fail; b=dCFGoMiCJCEDycbMtO2t32lU6y54ctThX3ESos8bPsf02CewanbvANQta4PUK54a2Q8k+RBJ950t4dBRJ5fdFlBblYNluGNeuIVsw3lTtAIOQvQO7CRi2GJwAsOwOU0t2k8Dznn2cuG8q0gTdOLIU0665I9Ily/udy/UCU9xp08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808403; c=relaxed/simple;
	bh=mTjskPNUynPRDj0LO5WkVsR3e5u4qEKXhamnmnW61+w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ioul3UuBBOC1B9oANyPUpfJ624YNsqi7SqC28mjTy2qUN1G7/642k+EeM+BpqkVrn1FslkJ4iPAIHnsfF+0FJK2iv+5FGibztFVvgb1duXgKVYP3oZN6JBkCyV99vUUr17MgTh55p9Hu/BlRIm4r/ebI87uXGO8rl9GduWk2GW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKpOlKxN; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKpOlKxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750808401; x=1782344401;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mTjskPNUynPRDj0LO5WkVsR3e5u4qEKXhamnmnW61+w=;
  b=OKpOlKxNLh3eEmNf6DRi5b3T665pxTlBhDqFVRK9DMrj9SySw50yBwvB
   bTL8scfBfw7ruA/OeKtc7HLFe9Ad6dDO2C1MJ19ylgiAaws7RFzC1pCK5
   Y4YnVzm2iALMkBvcFjymoQjsYXNOWpq4NIbvjU1CNrA+1cGpYv40QaNvc
   8zcrp0r2qmbMMxEsCCsOur6sJ8IdQCWk4CfPg7cibiDC8S+hXQVGFJHFc
   BKIJszKue9WAjPdaAJoJTnQ0EKdLbTrbIUW+8Oj8Xyw06NzngkFpjlnlG
   ihryidK65PYfUt0oAOOm6A33U4faKA/j/79823xlU9brVIht9uJ1b6I6I
   Q==;
X-CSE-ConnectionGUID: wU02IOuVSMKBdvLVMLNCuA==
X-CSE-MsgGUID: W4/+mZE1QCSImoG5ZEhCAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53133909"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53133909"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:40:00 -0700
X-CSE-ConnectionGUID: v5aYjxa/S+uEFl7CQEAqww==
X-CSE-MsgGUID: Z9oQXuWjSg6ZqLUusUu+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="156082859"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:40:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:39:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 16:39:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:39:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLELLjm1tok8+lutmvX1TZkZKw5g04BqcuR1zdnYsgloJguPRIc1Yvui9qYLwUkdC3I+zakyvrG+MSln0+o/X+5xAISxk3Ioy7HUSF5seZiwbAplMfRVyAMdj1p0cjECH870h+DX6my2QXuxRKnzZUqdz1LkHCLXpElG4mcrz0PVt1cJMAHvvG0K2a48tdQN4RvlOO9kqYb9sL18zMdCItQ3ZaE5aajCUH0nK1YdHt5gSm+IWJMFWWzCMCySevyQPg7Eyypyaj5HL/QZmJursdgO437W6QGg2++AqhyGkimC3A1iaZ26Xh+r5Q4ciZLT4pQkoSp+arQd19JS6K8LzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6MQ2o3/rufFOQxMlxGt4hArP9RmZP6dTeUSp3bOUgk=;
 b=QLufg9qarOY/5uXrSoqcikB5NSNNS3HR5Z9w471XSmTJsa6uMKsLTlU0MsuGgnjMbEflu/7USdddXDHjd/or+4o4VAnf3+3nKNz+gdn313aXbo6nT+gCLkUScA0zTj8n77lVXR1fVycZLvt5ZsH0tcvoY4tKFlZeedZ/0jpfJeMGZZ7bBNg9Nu8BNA8HX4ZjkCyooDe5wxucQD91VTC9goC0j8iutNuDXO9fRSG/RryqljD87/+YTlq1dDyaIlSs9loC6GwbFS891JUDJDO0zBYdg87MNEWN/TFceeEyLlocn7707IRukR5JpfX8sGnyqTKoaC0p+jaGjPzr0Chahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB7676.namprd11.prod.outlook.com (2603:10b6:610:127::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 23:39:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 23:39:55 +0000
Message-ID: <dee2c51a-5fb3-4aac-b8e4-a1ec87d76545@intel.com>
Date: Tue, 24 Jun 2025 16:39:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 14/32] fs/resctrl: Introduce interface to display
 number of free MBM counters
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
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
 <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b6d6a4-c86d-4d88-03d9-08ddb3786c58
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFgvM3ZLdFlDUDQ5dzN5Ny9hMlRTU2dabVZXbFl4SVpXaE5iYUlpMzlmYjZh?=
 =?utf-8?B?NGpRTEQzeVpEbXlnRTIxcmxDclJNcFNwWGF3LzVPSDlTMDhpdER0VnRaYlVW?=
 =?utf-8?B?eHJSWHQwb3lNWkc0SjFWTjBxaWIxenVDMnNtSlZZSEhhMFZzMzNkSWVnMktC?=
 =?utf-8?B?R3M0NFhFZ0M2MFoxVmRBcktVWWhiNjNLOFNuaEg4UG5ISXd3WXdrNmY2akc5?=
 =?utf-8?B?NElEckp3RVdONGN2Z2RWeitlMkROOU9DU1Vub3VVbFpNZ3k0SDllckRUOWVZ?=
 =?utf-8?B?MFZTZyszR0k3SkVHcWpPQ2ZVM2pvSFBGbERwRFRBdTJlcjNwSjY0WDlXbHpi?=
 =?utf-8?B?MHVCYVQzOURVUW1TczhaeDc5MkNlWjVWcXVTRmlXMEZIakMyY3FydmROVEJP?=
 =?utf-8?B?bHYvWVRDeng0OEhCMWwwcWxoNVAyUWJvcFhZem1zdTBrR2pRdGxZallnbXZO?=
 =?utf-8?B?ZTFtcXAyT1JNcldnNFlXTDNsUkJKOGxkaGoyLy9iNlc4K1hoaE4xV1NRakpM?=
 =?utf-8?B?eFREUi9hYzVFREdqbDR2dnhBWEUwM3pBZC9UaGlaYlZZZDVxWElsZlREbTRR?=
 =?utf-8?B?YXY1N0dQdURNTVQ0U0ZsWWRRUE9pYUZxUi83R1hVb09IdmJxTTV2bmRra29l?=
 =?utf-8?B?aG45ckJFNlhtaWYvZnZuWTN3RmNrb2pSQU5EU3hWYXRKbnkwM2hYaWRBN1ly?=
 =?utf-8?B?V0JuQ3VXQ3JKV3pmUEdyQndMQ3hMaUFycE1KakRhL3dXY0Y1anlMSWFFT0Jj?=
 =?utf-8?B?WVZEdC9HU0VzajhhTGxsaFB0aU9wTHdFaXU2SHEzUGJwZXhNdG1DcGtxMHc1?=
 =?utf-8?B?eU9lTWZjcUNaN0Y5M21lWTFreE9vbDFzb2dmYnBWNzhsS3pZa2E4S1pXdmx0?=
 =?utf-8?B?R1U1bGlhb2Zna1o4cmFpczluY0Vjakx0Q2pxcWoxbGdGRXR2Z2NtVWkremdv?=
 =?utf-8?B?YkhRcmU4SjJLNi84WlAySjFGMWVBT0o1a2svTXpKWkpYZS9sbXczNEZpWjA4?=
 =?utf-8?B?ZVN1dEo2aFlBdHVUZFdGamROYzJtbHFKTmFBU0haa1VXS01BQXk1dExXREpE?=
 =?utf-8?B?RjF1TU1LNWdSdkw4TXd4dHE4NkRaSnJ6UXpjOE5TN3Q2UGUwaGlYTmVGZWJq?=
 =?utf-8?B?NFRObUxkWVB5STkzVW10aXdxUThIbUcrNm5PWlNVd1loRFRqSFF0NGpCTGxh?=
 =?utf-8?B?N3RFOWYvN1ZzaFZoMFJkOTd3aHQ2TTlUOUVLOWFMWStTYVMvZnUwSlZjWXFj?=
 =?utf-8?B?RGl6a1ZlYU96eHRScU83MGFiQlN5VlZuL2lKU2RKN3dTSnlvNVVtelN5YnY1?=
 =?utf-8?B?ZHUvUGVzWTRKVXpJbnh3dHdNU2swNVhqRktDMmszRW9Hb2kyalVCM1hCQ0Nr?=
 =?utf-8?B?LzlyVVNEWWRreTVVOHhFTkdqS3JWSU9Uc0U4ZEdvMmlHL0l6eEJPOGxOdVQ3?=
 =?utf-8?B?aFRkb2FuSlFaU2JhRW9UcGFQdUV2QmpaNjB2RTlyNjdXbm4vVU9JUFoyOE5J?=
 =?utf-8?B?b3pVeDgrQm0xTDFIQ1lEazVTYkdscFRLbm52V3paaHhuVFlIZmYyUmh5OVE2?=
 =?utf-8?B?U0xMc0thVnp6bUx5UjNSM3JudVVpRjlqanpQelVTalRyaHZETytpZ3dTdVJV?=
 =?utf-8?B?SHlvem9kZGp5c2l4aUM4bTF2S2NDR0hkMTlCKzJxSzVNV3VySS9CNFh3MGVa?=
 =?utf-8?B?Znh5MkRPQTE0eHRRNGluSE1TWVdpd2RoMTBwN1ZZWVlXZXJaV0FtVThhMlQ1?=
 =?utf-8?B?UEFhV05nbk15UktLZmRGTE04TGcreHZGbnhBVU12YVFmS2NHV0REUmdqenRB?=
 =?utf-8?B?cmFHWTRwNFdOS01nR2wvcTVsekMrRm9GYzlGL3drZjV4Sm50NWxCRnBWOXZD?=
 =?utf-8?B?OVRWdVZ2OTd6T0ZoRnNYMjM0NHJ0eE9JdmJ4eWdiMjcvdzBqekNSVDdIckx1?=
 =?utf-8?Q?txm4L2TLUKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGJucXR2a1ZSNHBQMEVoOWR5ZEtFZ1lZYlNCVW1XOXdORGdaR1liK3gyeUpT?=
 =?utf-8?B?WlBsNXpualQzOFoxQVkwbHNQdWdFMldHU1BIQTcybHM0aWk5V0JJOGdzR0ZH?=
 =?utf-8?B?Ni9qeW9zSldFcHNLVER2UEJoV04vSmlXS3RROW95Ry9MQnRyUmF2SDJCcmlv?=
 =?utf-8?B?bXNuVlpNcnUxdkdDYUVVSE5vWGVkc3BZWGRKT3BsSDYyNU5sTyt3MlRMVmNY?=
 =?utf-8?B?aEMvYmxMSTVnOGNndnpPa1RRaTFPaXVWeVhsUTkrckpwN2txaWozVC9pZnZS?=
 =?utf-8?B?dG80OGM1OUZlTGlCSHZOb2xyd1RJRmxzcWsvanYzK2RabmxyTTJWVzB2bFhV?=
 =?utf-8?B?LytHNTZpaUZBeVA4ZjA0UG1ROXR0bnQwU2lyaGhWbHBaZW5yWk9Pek1FM2x6?=
 =?utf-8?B?SVErZ1VkT1drak91UGlxNTdIRitETXNMaWhTU0syZmUzVUhKUVNmRWxjbnVU?=
 =?utf-8?B?NFE3R0pIWSs1T3huZ095ckxmTy9uU3pZWW5OdWRxamVUc0Z1NVRmOStNMUVs?=
 =?utf-8?B?NWUzdlJWUE5SOS93T3pvOXdSTVBIa2dCWWtRcXVQcHBSWTg0OW9nVkNhTnlO?=
 =?utf-8?B?WFFXN3Fnazh3eGtvaHZiQWcrTGt4RFJoRHZuYmg3T2tQbGdiaklwMGxKcERT?=
 =?utf-8?B?UzJNOGo2Y2pscER2RDdCM2xZdnpoSnBrcnAzeko3RFJuUFhUcC9jQU5iQ2FY?=
 =?utf-8?B?RjU2bmh4TFJxV2UwNWJZMkZSYStEQjZmWTE0RHYrelZDNk9qaTkwOEh5bjVw?=
 =?utf-8?B?UWpaR1JIc3IwbU1pdnVIbGIxZHU3Y2dmd2hpY3U0UGFCSG1UWU0rZldEZENo?=
 =?utf-8?B?aUlGcUY5QnhicnF3cWlTL2dHaG5LakJVdDFTMWQ2Q2tqWWNBbU5UNzU1YTJP?=
 =?utf-8?B?a0JnQ1NpYjluendUZWNGQ2poNWFzWFFKTFlxUkFJR2VGVjdGUHpqUFB5T3Ix?=
 =?utf-8?B?cm00SjdhSjlKbWEzUy95NWw3bWd0ZXpMcXdiV0lRRWhWenNKeUU4bmlLOW13?=
 =?utf-8?B?UkV4ZkhUSFB0RDlNa0k2L1M3WG02eUpwdDJ0STVBalBhWm5LUWh2VDd3cUFK?=
 =?utf-8?B?UE80aUhTSnVsZHBPK0VCT0dFYldnOUZwalFXczhDN2xOSExvNTZweS8xSnNU?=
 =?utf-8?B?UG03RVhobFZQZ01Ud0NVdEFibVQvMTlxSlE5MWc3aGphV3BrVWRpaTlJaXo3?=
 =?utf-8?B?bmY2WU5ib0JDb0NhelRjakgwbEU0WW4xcUIzOHVvM09JUXdYUEJIOFpOa1Ev?=
 =?utf-8?B?eWJNcHhXMmZuWTZkbUswMHluZC9kOWFqUkJMSDZoL21tUUZzZFJWUm5FTHRL?=
 =?utf-8?B?bTdZZVlvRUR6VjQ0OEwva0xJWkRYcDBnTzRiZzFhSzZPRTVqb0F0MmJ2MEJj?=
 =?utf-8?B?TUVreFhQbEk3WDZpREtDVHlwc1E2dVFsYUV3VWkyQmRWNTNtOHNmcHh5b2k1?=
 =?utf-8?B?ZVVnaVNYQXVGK0ZLYzN0Q1laNVJlc0Z5SE5oOVIzakJnUjh6YkZXN1JkWUVJ?=
 =?utf-8?B?K3lTdEdWRjhNcWdZM0NkMFFLYkx4YmVGWGFBbDRyaUF5WkxnRGZzeEZ0UUhG?=
 =?utf-8?B?eTIwUnpWNFdnNG1oeTd0K1FiK085c1ZPSklVenF0OXJibGxVTmtwbGVJOG9h?=
 =?utf-8?B?aVp6SHRYLzlZSW1BWHB0cHB5U3pmM1JXaHhKNnVzZWRXYUpmOEw4Sy8zb1RG?=
 =?utf-8?B?aVIraVM4UHprdWdPcGpsOG04b1dMS3NiN2FZdXFXZERhMG5tb0hhSVEvQ2FJ?=
 =?utf-8?B?dklwSHN6dVpxNzZnbXo4L0ZpdmRXYUxTL3lCaGt1V0VpeDRGNG03U1R6cGdk?=
 =?utf-8?B?TWxqblQ2RjdoTzNmRUpQN1UyVVVjWFJVWTFQZGNsb25zL1RyZXdyRHJwSTdh?=
 =?utf-8?B?QjdHZWFDaWo5V3dxQ0RLYUVUUTc1bFd1VkltN2FvZkxBYzJWN3FKUVNiMU1L?=
 =?utf-8?B?WDgyaXFLREJ1YlZMQ2RJWnNTODJ3MytPUUdHVzNKU1h2eFczaENUOUE1MXNw?=
 =?utf-8?B?a3pMNWdMczB0dUZZRWFwNHNwTjNjZjZrTlhWSnV3YlE5SXBwZmxZMm1oUWx5?=
 =?utf-8?B?RFovd0trVEhlNlNMeUQ5cHUva28rSi9FZ1VCMnVucFJNZXNINmV3TnQ5dlc1?=
 =?utf-8?B?TEFoN21wbmIrb0dtcG9HbU5tR1lTK1ZRRkxFNVZvK0lHeWF5Z040RWx4bzF4?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b6d6a4-c86d-4d88-03d9-08ddb3786c58
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 23:39:55.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lQa5uuG8U538cWr3CGj79IdsonsGSP2ynUGn+fzMatE75O3yz/cu/sbYdEhBr1N2Db4NhB3aI+7R2SOqNRI5n3Y5zH/H4ms8rRXbYjpezE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> Provide the interface to display the number of counters IDs available for

"Introduce the "available_mbm_cntrs" resctrl file to display the number of
counters available ..."

> assignment in each domain when "mbm_event" mode is enabled.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  Documentation/filesystems/resctrl.rst | 11 ++++++
>  fs/resctrl/monitor.c                  |  5 ++-
>  fs/resctrl/rdtgroup.c                 | 48 +++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 801914de0c81..8a2050098091 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -299,6 +299,17 @@ with the following files:
>  	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>  	  0=32;1=32
>  
> +"available_mbm_cntrs":
> +	The number of assignable counters available in each domain when

"The number of counters available for assignment in each domain ..."

> +	mbm_event mode is enabled on the system.
> +
> +	For example, on a system with 30 available [hardware] assignable counters
> +	in each of its L3 domains:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
> +	  0=30;1=30
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 92a87aa97b0f..2893da994f3c 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -924,9 +924,12 @@ int resctrl_mon_resource_init(void)
>  	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>  		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
>  
> -	if (r->mon.mbm_cntr_assignable)
> +	if (r->mon.mbm_cntr_assignable) {
>  		resctrl_file_fflags_init("num_mbm_cntrs",
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
> +		resctrl_file_fflags_init("available_mbm_cntrs",
> +					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
> +	}
>  
>  	return 0;
>  }
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 90b52593ef29..08bcca9bd8b6 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1853,6 +1853,48 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
> +					    struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +	struct rdt_mon_domain *dom;
> +	bool sep = false;
> +	u32 cntrs, i;
> +	int ret = 0;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
> +		ret = -EINVAL;
> +		goto unlock_cntrs_show;

unlock_cntrs_show -> out_unlock (to be consistent with rest of resctrl)

Reinette
