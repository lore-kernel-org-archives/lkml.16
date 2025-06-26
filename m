Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9642153C7;
	Thu, 26 Jun 2025 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950338; cv=fail; b=ngBzNOPhocdoC1FNa0o1Ays9EKX7MQJEBVGT9qlxJ325fgcZP4UtOv+Ha8nrQ05ojp28gNMzBqIyH/nJraWgOVEiRK9jyMa5NDkl+vu99LSkYiS0a49M36AD0XvYuZQ6xKiLcFGXPTYUUyxoTTh4KNi+2K8tCwiYA8zvikHg2E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950338; c=relaxed/simple;
	bh=kaq805beHPrO3uk1tZo8lqY9oTfdD6so7eyvEqevZ5g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XTz69jTqtjFCMUvFVYsQ1GuQzzhXjnLktPimWj3c7RQVPhrTI1mIsGbGpLrHUElLCYKX23MWWvTPFWDpebS2R+NPi7rILl45V2tTANgml7ShRjbvQo4hF92UixZQP2RNjqc87nWdlzzra8bzmwyIlQZLvl5ZVXPktVyx6SVAwtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwEDa21f; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwEDa21f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750950337; x=1782486337;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kaq805beHPrO3uk1tZo8lqY9oTfdD6so7eyvEqevZ5g=;
  b=XwEDa21fC/x0FfI0o5/oanM85/kSs5j40MrczJ53sVGtFcCfynOy+W9Z
   9Qatdyb0YsukKt8bK8cBnAo8E4EWd/J7Ss1go+8PDkcH4VmpPvf0+BZhi
   XNAPkxkoegxqjkjRdRDydX3TsT0D4ECP9LaVwWHoC0drf2Ld/8x2UwSEu
   7vYbV3ZScwsQeHtx9NDs2uO/9W1jBqNW7PrivbV5ncih8niJZnmKYQ9Rz
   WOVJGawXgUZ/RLZ727JdlgGzWg7i5zOocLNBmpNivb89g+QQftvtVpY10
   YUzqA/Un3vmQAyWlJVz//OxflXbo7t6oGtxBxigqZBl0HvQVj0kvyCAt4
   A==;
X-CSE-ConnectionGUID: 0lGIydLcTCK6SpToy9tq6w==
X-CSE-MsgGUID: jb92KMIbRquXX0xLje9sig==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57057761"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="57057761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:05:15 -0700
X-CSE-ConnectionGUID: 0KvbUrK+TWmsBdsJFAYx1w==
X-CSE-MsgGUID: vrIozGNTSIOeEoyw3Z0cwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="158041305"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:05:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:05:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 08:05:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.76) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhvukCTDNgiAAUcu7W8K6q//7RKMcIkBudJWYXcRsi20sSXcKq/i8kbDFvk4N/2mEHwADSj8/tfhRtYGnwA8ir+MgjBO0H/tcV3oCAmSVFVTuhX1/08JvxsjKafLlRbuNH88jCs4lVS6czQPjARb9aAMRH2gZ1Tsgfy/RU2jmUmd1UKRY4GTtgOXcW1wFgs/2h0uGxWmHYaZiTTmsd9wIxADEp/1cjZwmR7ga2wtlrQijlXuqXHG+/NuEWNjJ1QC06opBVVklHWJFzKpNn6Pg3pboL7e/yNdbIWrgz8U/rbsmXUuU2xxOqJVRwcFt+GYntmAdZldR7YbEONbW4X+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSB4MR6FWm4EngDsyt3OSbIE6Qblbqpl6FN/KpwMcOA=;
 b=bI6Aj+0rUe81BLqiqNZU4SUmCPT8/sogDEOw2M0TSA2y4VxlwfsYL8aULIupt2ETg+5g2ZcSaMc+rty9CKsdWzRlpsLGDdzv1rs99TdjZHrEqEWsspGjDq4kX+V4venFAYsYbNyLDSeto7huEHbphqoGIhSSHhyxDfG0fwcV07+0zD2Q/HwYKAe8rDZqg2J94vqiuteIKtBAhk6c7LB4uYaDh+v838A8fJYuZwrJjb/bEWH5O+dBeKbhb3h+/NeJ5gA+Xbj1TCBfocGyOUelaQz1GLPGXmvti/V99FGhiyyQtWIIgv1nEgWfYjsgoofyHs9hNGr9pQI08GopbdIgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 15:05:09 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Thu, 26 Jun 2025
 15:05:09 +0000
Message-ID: <e21ad30b-b6d0-476b-8090-f58a20264fe6@intel.com>
Date: Thu, 26 Jun 2025 08:05:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters per domain
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
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
 <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
 <887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com>
 <58d214b6-9bd0-42dc-a00d-cc80bccc8fdd@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <58d214b6-9bd0-42dc-a00d-cc80bccc8fdd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:303:6b::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: c8460961-2095-4d3f-fd94-08ddb4c2d772
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnNvQ2wrUEhGMUh1SFJsTjF6eFhNZjhaYU56ME43b2tjcUpVMVlkUk9lbkdE?=
 =?utf-8?B?clkwWWcrUXVXRXpKblFucGhhRDJqcVMxVUZ3SXZnb3BEck9ZWFpDS0UyY2VQ?=
 =?utf-8?B?YkhxdURYRGt5WVl3cGNYNlVvZjR1eUl5NmVIaktlbU5TRGZEcG5qOXVHWWcz?=
 =?utf-8?B?NVRPT1FVdkZ1N3oyaUVIZEVjeXR2TWRscW9jWDFGVVY5WEhuRzY5aUpJZXR1?=
 =?utf-8?B?UTR5c3BqeDhPMFppT3BHanZLdFFwSmpmZ25aRWVlT1NKMkY5MTZHNE13dURW?=
 =?utf-8?B?WHpDanREcE9oTEFmMVFlSkxoazBOVC9GSDFVY2tySUNJMzg4QmpoNVFlODVK?=
 =?utf-8?B?b2xRc1QyMWEyM2sxS2RlRkdqVUdESmhpSFVnZlFydDVDRXMxa2syQ3VkSlVO?=
 =?utf-8?B?WURxTjBqSlRkQ1E4TmR1R3J4cmRaNmE1eFZtVnNFMzZwQ04yY01QMEhRK2Qv?=
 =?utf-8?B?Y1NDamducUVvek51a3REZXBXYW9DaFhBTzM0cS9rcGRtMWIveTgvbzlVb2RX?=
 =?utf-8?B?dVlkdUVRcERLL0RXUW94RkJldnpxYmZ6RWRJR3VZNUJ2Vmh4Yjg2L3Q5V0NS?=
 =?utf-8?B?Y0JlQXFqNmhvOUJpNk12SHJGWVFxU0xVZlFFNDNndGR0bUwySTl4V2NLV05Z?=
 =?utf-8?B?WHZnaUIvMUJBY041VEphdit5Rkc1enZIdkpYV1MvV05Zd0J2TFdFVzQ3cUlr?=
 =?utf-8?B?R1BOMXg1dGJmQWN5cjh2MFc2bzFXY081cHlSWS9vTFhXSDMyL1ZYUTBMYVYw?=
 =?utf-8?B?ZTlWcy9aZ2ZCQVBSc0pibnBrQXo1dlNteXllaTJtTzFHWEZsQ0Y2UVVkUXVK?=
 =?utf-8?B?RkpqZ2lwZG5hQmNNYkhCYUJqZ1N3alZFempLdDVEL25lVDU4aTBVSnZHVVNz?=
 =?utf-8?B?L1JCUHhNR2ZMOG5ld05VTDRIbmVCT3cwN0VYeWFaZTZyU0k4UHFaYlV0MlVr?=
 =?utf-8?B?K2xPb2JGR0l0M2Y1V3NrVThVTXlmU2gveEZtcjRTd2lTbFpTMWNRZXJQcTlL?=
 =?utf-8?B?dHhybWRvZ1N5UzBoZnN3RFU3UEZVNndxV01ZRWFiVFNZU0R2RmhZWDFtZjgy?=
 =?utf-8?B?K3FjVE5zanA2dlpzaU5hL0NlSDlrUjJNcHErdHJVUG9EeHVlank2UzhNaytp?=
 =?utf-8?B?QmdjVlZHWVl1R3NXQUZGcGRSdldackhjWWQvWUhjK05iVnJ3a0EwU1hJcFYz?=
 =?utf-8?B?bFA4OVNSdlVsd3BLajMrNEoxUUp1K01IdTlqbUxGWk9VbUJGM0hiVEFhWlRh?=
 =?utf-8?B?RFVvMWN5OVgzRlFHMGNwWFVOMUZmTGU2YnRXUEdhMFJwbDZEWTE0NFhqYlBC?=
 =?utf-8?B?WUNWVzdpb2prYXVPTFNGakpiV1BrUmlBVHc3N2g4SXppMlBVVTlDSS8wZmkv?=
 =?utf-8?B?TXNRS0t3eTJxM2R0NkF0TUN6dzZJQUV3NzhlRkkycUNBRUNHd1ZNdVg0b3ps?=
 =?utf-8?B?WTJtZnhhUWRodHN4QTh1bThmcjNMSEhteVpZaVJOWE1pOHZwZnZ5RHYxRk9Q?=
 =?utf-8?B?VVFVb0R1NnZoeU1uSzFTVjBvTkFGOTd2M2xhL1AvQnREUjRYOTNtV2ZjK1NI?=
 =?utf-8?B?YTM1bnZscGc4VnJJcFk0Z2NhZG1VR1hUSmdxTUxPMXdXY1hGNGZZR0htaGFG?=
 =?utf-8?B?UGhzN3R6RUxuUUhmMmVRS0phRDF4eVNiZXF0V0Mzd3U0d05aV0hJemV2K1gx?=
 =?utf-8?B?MEk3SFl4TkdER1FOWDhjUXdyMVU5ZDZ3Rm54cDB6Q0hVR2JUUGxpQkI0ODdJ?=
 =?utf-8?B?UFlMK1hEVGhaZGI3YytHakFxaXliajJpMzlhWmNjaUpYck5QTyt6Zi9SL3do?=
 =?utf-8?B?bGdNNjJ0OFhWSzl4aWhkTjc2R1Y1T0o3bnJEbUUwRWhxZWE4ZzBiOEdxMm1t?=
 =?utf-8?B?bWVENFFieEorV0dTbi9YUStZY3U4QmhrZWc4OWFucURqa2NBbmFlZzdqRC80?=
 =?utf-8?B?cHNpYWk3dlRHNWpMWDgrY05xMVhSSHFWL3hQdVVLdFhxN2QyaU04VUc1TUE1?=
 =?utf-8?B?NjYwV0Q2NGRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTRXRnFBNXdEYVlpd1hqczB6aFN3K0lUREVPcy8wN256bFZSSTNBZ0grMlo5?=
 =?utf-8?B?Z0ljZ0ZJQzVucU9LNmZIbVZXaUVzT2svYjlRWkM0K2s2Zkh6RDhFUzR6Yy9r?=
 =?utf-8?B?b2RvbDBaMUlFL1FONXdUY2RZbnNzSFNKNmRCODJ6a29xOE5POTlQVnVkOWZ5?=
 =?utf-8?B?bndPQkNQK3FOL2JlaEFra05ZWitFcStpSkNOQUlsQ1VUdldKRXhacTJkRFpz?=
 =?utf-8?B?M0Z5NmlmdVhDRDNCQ01qeWVIRXNHQ3lOQlJJdkRnaUFQa1Q4UkI0Z092Y2NG?=
 =?utf-8?B?ZlFDcnk0N0orZDVreTlERGpFb2swbVJFT21DQ0l4WEV4UTM1RVppZmlhMlhD?=
 =?utf-8?B?VC90aGNnMzdBeWIzZGFoSGxlRUZjZTZobHBMQWdDd3VhWnZPNW9uc3JzWUdI?=
 =?utf-8?B?dFl6emJBY3FtRmRDdGNJYjl1WWhNOHZYRlRGWThhbzh3dGpmZlNFNkJwSjNS?=
 =?utf-8?B?RDVsdjJxVDdJRWNaR0swL01iVU5VL21LS1hGRnd5RXVzMGpNWFBFb1BzMENU?=
 =?utf-8?B?Zk96YUQ1OFFYaU5aTkE3ek1LY0hudndpbjErbjA3b3ZYYlBYU21VZWNhUDZm?=
 =?utf-8?B?VlBkaGhBaU5uUDhTY0haZm5VZlBNSWhINXBzb3BVOEhMZDRHdnZLcHo5anpy?=
 =?utf-8?B?RTBJRWMyLytMNW5PeGR2T1JSUnp2ZjBOQkRLSzlBUVVxNkdUTTlmanVBRFpQ?=
 =?utf-8?B?cXl0eWVsNUxuQlpZL1NoQnRNYVkyQlF0MkRUZFF1Znp0LzVIY2pFVXE0Ulhp?=
 =?utf-8?B?b2VXTEFwNWdHV3FBVm9XOU9HUEtKQ2VaOEpQMTF6M0ZTT2lZZzZzenFLMDhq?=
 =?utf-8?B?ek9TeWp0VVdLdnJZTGNONFZablhKcjlDY2JWVlkyaUk5SmpBN3FRRUV4TDZs?=
 =?utf-8?B?dnhsKzgwNkNWU0U1SEhIVmdJVVBaZzlhL3lnMVJMODhBVXJCUGx6MEluRExm?=
 =?utf-8?B?aTF4N3dlcWRxb1BYdEIyMXBFTFhmZ0xxaDFUdmhSY0U0VVdEbzZHaUVORmUw?=
 =?utf-8?B?ZjdSRFNJUkxlT1hjVDgxUWxnbVZEYmJEVWtKOGZJdDI5SjhSeUdzYmY1L0VF?=
 =?utf-8?B?MStJeVo0c3lTcVFVTFF0L0kyVjdwV2h2WXFOcmlJd0k5VTNTMzI3Wnh5amFI?=
 =?utf-8?B?L1NzTUF5UHE5TmVSdGFQZVdpN2xja1VKeFNoYVA0RldRYTczbUUyallQak1P?=
 =?utf-8?B?dmR5U0hPZjc4QXpDVlEzaVM3bDhWdTFYdVQwak56bTE2T015TW10RU9FWEx6?=
 =?utf-8?B?Smg2anFKMHpDSGMyWnlmeVd3cmxIZFpmN0Ivd2JPdzlSaHBjenZMSjF2WE9l?=
 =?utf-8?B?d2VoUjdTcnlveitYME1XNVRsZGU3SmJENmh1amV5QXNFRmNwRThYR0loWkk5?=
 =?utf-8?B?VGlhOGRVU0R4VUhUOWhacWZLV0dITkhyTm5Rd2pncFVQMURmU3h2cDArRXZW?=
 =?utf-8?B?b2laVXBLbDVOZVpWUjNjVkZyRW5JSlh4djFMS2RON3RGdFJMMjNncEdEcnAw?=
 =?utf-8?B?QnB5ZEtPYk1lQ2VxYUJHWC9xVUtJaGVaTGZOY09TbW5nYStzY0dNS1NTeG90?=
 =?utf-8?B?eXVUaDdDOFR1Z1Yvc1BnVERpUnMyd1V4aCtIc2NzeWRvZXFNM0htYzg5UHlq?=
 =?utf-8?B?NDN1QTZMc0l5cTkrV1Q0RHB4aSsxOG9kOFZQdmp6UXdtbVhOVkRKak9Eelhi?=
 =?utf-8?B?OVdIYUtzYUFGeTIySEpSVHk3WWhBb3paS3BFeUtXc3I4Y0x3VVB3NWFiS1kr?=
 =?utf-8?B?bGUyZURza1R6a2dVSERkT2tuTUtGUXJVakoycTk4dXFtUGpNOWlmNm1uMjFX?=
 =?utf-8?B?YXZabWRYZFRJSitTTDE1N1N2MkJiRVd2U0F5QnZmbWpPZ3RhcjViaGdGU2Ix?=
 =?utf-8?B?MGlubWVJUDdUQXdWd0hmRk5UYzZWM2R1RElQaXZMUFNqWHMrY21KUGNndERG?=
 =?utf-8?B?RlFaR3NVVVZ3N2ZPRjRSTWo1N1k5TkhkNnVTWEVHMlMzN3BBT016Q1N3cnU5?=
 =?utf-8?B?RXdlQ01WK0p4VWhTdkV3RitteXg2Y0JqNHpab0xiWW5PTmtibEIvekFkN3dl?=
 =?utf-8?B?VjIyU2VVQU5WK3NiMFdubzJNQkFzL1FqRHFvdnlaMEwraTUyWTBwaE5wTVBa?=
 =?utf-8?B?YUNTYUNVTkppRktnRWEyMVNPRUZnOXpjNkd3YlJMMnVtZzcwcUJFblBLWWpq?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8460961-2095-4d3f-fd94-08ddb4c2d772
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:05:08.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZQkVWn3O8oCpSBty9XOmRM820rPPSoMSTnHHxZ77t8Iwh55oAumALio54Lgv0+vccFanxJvpB7pt/a8viqr4UhF3jIVKTl1dpEeE8pFDkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
X-OriginatorOrg: intel.com

Hi Babu,

On 6/25/25 6:31 PM, Moger, Babu wrote:
> On 6/24/2025 6:31 PM, Reinette Chatre wrote:
>> On 6/13/25 2:04 PM, Babu Moger wrote:

>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>> index f078ef24a8ad..468a4ebabc64 100644
>>> --- a/include/linux/resctrl.h
>>> +++ b/include/linux/resctrl.h
>>> @@ -156,6 +156,22 @@ struct rdt_ctrl_domain {
>>>       u32                *mbps_val;
>>>   };
>>>   +/**
>>> + * struct mbm_cntr_cfg - Assignable counter configuration.
>>> + * @evtid:        MBM event to which the counter is assigned. Only valid
>>> + *            if @rdtgroup is not NULL.
>>> + * @evt_cfg:        Event configuration created using the READS_TO_LOCAL_MEM,
>>> + *            READS_TO_REMOTE_MEM, etc. bits that represent the memory
>>> + *            transactions being counted.
>>> + * @rdtgrp:        resctrl group assigned to the counter. NULL if the
>>> + *            counter is free.
>>> + */
>>> +struct mbm_cntr_cfg {
>>> +    enum resctrl_event_id    evtid;
>>> +    u32            evt_cfg;
>>
>> It is not clear to me why the event configuration needs to be duplicated
>> between mbm_cntr_cfg::evt_cfg and mon_evt::evt_cfg (done in patch #16).
>> I think there should be only one "source of truth" and mon_evt::evt_cfg
>> seems most appropriate since then it can be shared with BMEC.
>>
>> It also seems unnecessary to make so many copies of the event configuration
>> if it can just be determined from the event ID.
>>
>> Looking ahead at how this is used, for example in event_filter_write()
>> introduced in patch #25:
>>     ret = resctrl_process_configs(buf, &evt_cfg);
>>     if (!ret && mevt->evt_cfg != evt_cfg) {
>>         mevt->evt_cfg = evt_cfg;
>>         resctrl_assign_cntr_allrdtgrp(r, mevt);
>>     }
>>
>> After user provides new event configuration the mon_evt::evt_cfg is
>> updated. Since there is this initial check to determine if counters need
>> to be updated I think it is unnecessary to have a second copy of mbm_cntr_cfg::evt_cfg
>> that needs to be checked again. The functions called by resctrl_assign_cntr_allrdtgrp(r, mevt)
>> should just update the counters without any additional comparison.
>>
>> For example, rdtgroup_assign_cntr() can be simplified to:
>>     rdtgroup_assign_cntr() {
>>         ...
>>         list_for_each_entry(d, &r->mon_domains, hdr.list) {
>>             cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
>>             if (cntr_id >= 0)
>>                 resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
>>                              rdtgrp->closid, cntr_id, true);
>>         }
>>     }
>>
>>
> 
> Actually, this interaction works as intended.
> 
> It serves as an optimization for cases where the user repeatedly tries to assign the same event to a group. Since we have no way of knowing whether the event is up-to-date, this mechanism helps us avoid unnecessary MSR writes.
> 
> For example:
> mbm_L3_assignments_write() → resctrl_assign_cntr_event() → resctrl_alloc_config_cntr() → resctrl_config_cntr() → resctrl_arch_config_cntr()
> 
> 
> resctrl_alloc_config_cntr()
> 
> {
> ..
> 
> /*
>  * Skip reconfiguration if the event setup is current; otherwise,
>  * update and apply the new configuration to the domain.
>  */
>  if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
>      d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
>      resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
>                                 rdtgrp->closid, cntr_id, true);
>    }
> }

This ties in with the feedback to patch #18 where this snippet is
introduced. Please see 
https://lore.kernel.org/lkml/77ce3646-2213-4987-a438-a69f6d7c6cfd@intel.com/

It is not clear to me that this reconfiguration should be done, if the
counter is assigned to a group then it should be up to date, no? If there
was any change in configuration after assignment then event_filter_write()
will ensure that all resource groups are updated.

If a user repeatedly assigns the same event to a group then mbm_cntr_get()
will return a valid counter and resctrl_alloc_config_cntr() in above flow
can just return success without doing a reconfigure.

Reinette

