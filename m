Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B3201032;
	Tue, 24 Jun 2025 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750806319; cv=fail; b=HlmU/K3wNWEmThoz+8namFHbL0b49OXMBw/D4UCAAkdYynTYUhEFNMxRdK0yj9MvzyvGxTxLVPX77askCUKPlhbv2l0wnxaFvMpIFiLOmFMJwS5XQmwpw+rHHqrBVnD0+l1cQbZG5Yl1wcKSFc6aSWsBDmGJPQNtgTO1jJa9pa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750806319; c=relaxed/simple;
	bh=dO6zG/Al464E+BUdDD2hIVQQZ342lc2umTRogz/nNhI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u1TLlftcmNrQkyab0Jle0gxPQHh1wF/kl80fgVinL7d92EO+4OpUE6g5De3pR8pNaeXWTZ9H4P5C7p8qIUC8pm2yW6dmVVEjNFTH50gGOw2cXuwrHfMYaonj6ZOOCqEO10Gntwz85HQMUQCPezTmG9aZWBsRMq6TR2zqkMIgBOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7WnzEd6; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7WnzEd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750806317; x=1782342317;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dO6zG/Al464E+BUdDD2hIVQQZ342lc2umTRogz/nNhI=;
  b=B7WnzEd6V2t649QKKC0OiNR5BDeIeRZqre/L4+G11D73TCxzO6/grERk
   o2UXKP4j/JXOQhF6qnmvoRHkh3N6G8SqRlrhofW3ByssUfDyQRtf1LOpT
   8xDbbdKNvTckjihv033bno5+eOxByoX4fH4Wt16XqZThlSBh5majq/Dzy
   Mlds/knOMnBt0dIuhD9YM8TN5NqODJkTEBvxJl/fOYSnEBHbsGp3nzU4B
   BUOmo7ZxFtD7ai/p2VMFN5eJ/LGuGky1WYjx40EqslnX74AmFYsKzQHFP
   9PWd6mxkOnn4a8Ayr0s2cr/hO/hibx3nr4T9A5nu8DqbKSD3i3y3cGkNk
   g==;
X-CSE-ConnectionGUID: x19cmpTiS3etoWbRn1tfeA==
X-CSE-MsgGUID: gTUrSK3YTpGMpv+x6aX8AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55691575"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="55691575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:05:15 -0700
X-CSE-ConnectionGUID: wMmtsAxdTWarqTvfwbjz7w==
X-CSE-MsgGUID: 1jcwQX/fSemxL+1IHwdsbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152543372"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:05:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:05:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 16:05:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:05:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geZLHn28Pz6vy+hUL21DP8MhLlDBqfvssxV0IBjlcHyqodaMMpXLcrKFHlpPHouQHsW1jS+FYvkftD6UlCgO86WFq1K9WyJalPud4RhK4MLDrBY2afokvSJJQ81KiGmp0cL9HEqFc4IsaECjHO6mAMEb7XUlQ4D67QfCMwVZ7DQSWqgCSIfJKuzvBjz8CLYsfCwlSGj7udmkor0doxWGMPFJ98g0pVseTRhyED7MuAk6CF3oiDfLzkgbKqAbTXOa8+IDFNd5c01+tPD9KvrsTg2LwbPEGOOtsbKP/hjdkM8cMUjiPBc0MR4UhQrLHo8gdT4p59LdWsf9+TdL6ZfJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLH//9ACS3xLuE9JIG9VqO2zfjYRbYsnZhXrG+dO+Sk=;
 b=EMnbND6nNYzba8VEbajbOVtmuVRfW0U8DbdpLLaJCYruuXlGMf5O1j+kA55UBk+S9kTagnrv9OvbZ2S7ml3tfxcM0DaTkBUxoLXiMtbef1AyznhT5ozf8d8NX1dDa0piyy7Ed+wfpcsRRWOSbz2trnavJGEbOFGgyqsNhnfPo7O5wszBwalAxt5+U1CWzx060QcyXUsmKFFhHFzeyGXQ/kaUkwfQdEJhTOndO0gPkvzCQEJeJwqBNaWx+ltAu8RdkAJu+DJjCcJcqXInXoyHlM3pTFjYJjxzl/22yMbaHp8+6Tu9DZbsNSzsWmBQcXpe2lF2Fxc5MbeS/zhL8nwMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 23:05:09 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 23:05:09 +0000
Message-ID: <84b53541-ce7b-4634-86df-bc0ac9ca4e16@intel.com>
Date: Tue, 24 Jun 2025 16:05:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 12/32] fs/resctrl: Introduce interface to display
 number of assignable counter IDs
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
 <4ad1bac79c6100d347e333b9781b1c76196326fd.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <4ad1bac79c6100d347e333b9781b1c76196326fd.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0220.namprd04.prod.outlook.com
 (2603:10b6:303:87::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d968a30-e6e0-476c-ba50-08ddb3739098
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vi9rNkhkalEvSjBwMi9VTFEyaldoZk00ZmExWmQ4WHdlazJqTGw0UDVRRVd5?=
 =?utf-8?B?cVZKdGFmTnpaK0hBb21UM3JObWJEZjhuWFZ1alRLbWcrT2hULzIrcEpwelph?=
 =?utf-8?B?clhrS3U1TUt4SWpHM0M1S0YxZ2JOclVJakFDakZsK1JYRlNXTFZOU2FaL3FG?=
 =?utf-8?B?bi90TXZoUEpWUkE3M0xrUUVUVDlBV1JWL1Z5NXh5b3A3QUZCOVF6QlVGcERi?=
 =?utf-8?B?Zm9oSUFwaG1FNGtXcjlJbUY0VWNmejlIaEtDSGt6MnZ5WHZ1UkNSdXd1dzhB?=
 =?utf-8?B?Nnp4cDhraVVnS2Q4QTFBa0pQV0kveFYvbWtvODJBTHBrVWZ0endqZWlNQXIv?=
 =?utf-8?B?RG5CMnRkSWlzTFI1OW5xdHMraFBGK0lILy94TUpwWndnc3cyMGZBNURuVjFS?=
 =?utf-8?B?bHAxOFVaZ1VnS3hiY0hxZmhUV3RMaFBTdldGSDNpR1lqcHVidTZlQXdLSllF?=
 =?utf-8?B?ZFA1V2hNeDlXUzEraDZGZUczUWdBY0ZjOWNZU0RKcGxCSmVNWGZSVThqSHJp?=
 =?utf-8?B?YzhJclNEVG40UVNLRzBoWXpjM0NPbERqOEIzS28vU3ZiTXdqWkhYR2o0eU9V?=
 =?utf-8?B?azFsd2dQOW1PeUIxR2RHTjk0ZWpNaWI4V3BWVHRraGJMczdOWnRzSnZBOWhD?=
 =?utf-8?B?TG9qdlp1TFh0MjA3aUNVVXAwaExaN2FxUzZiREFlbm9sc1lBcnA0TnJYQjkv?=
 =?utf-8?B?a25wSEN0b3FCM2NtRVhPemdOcnJSbWJHR3ZINlVhRTZxN1hnOVdGMUkxQWZV?=
 =?utf-8?B?VzZoMmx0b3RvcWtFZEpYUE9RcXdHZFJQTEFCdlUydExTMklVNkNzZmpFZ0F6?=
 =?utf-8?B?a0xKcmpqTUp5eWJ4N051WGp5QnYrQXpzcGJ5RU1tSjdnbnJBYnkzSEp1bFlP?=
 =?utf-8?B?OW5Gb2RwSU5CbXZmOXI1a0V0UUFNcVR5bDhvNDZpdkRYRHkxRndxVGtic29y?=
 =?utf-8?B?aE41RVlHV0wzNm01WVhrQ21nNmhDM0Fod2lVZDVzTTNiaGF4cHhzWGtTZUpm?=
 =?utf-8?B?cVlOOG9PRnE4MGMra2FDVGZDdm1sbE4yZnJhdmxGVEo0TXJPbWpBMGE1aFhC?=
 =?utf-8?B?amt1TWIzSk9Pdm5yK1NYb3NrV1AwWVVTUEt2YS9OYWtTNi9naEFhMk5RODh4?=
 =?utf-8?B?Zlp5dTNoc0tEcTM5THN1NEVueWhKVk5uWkJZUHR1NkV0OWhBSzhaajE0SkhZ?=
 =?utf-8?B?K2dBdDZ6NDJvb1FhRHc4MjNwc3BiNE1ybWJvb2F1RWJ0WDRLNnhNd3dCcHd3?=
 =?utf-8?B?a1ROWUF1MDdkUlJQRUNCNDJCSEY0c2JIcmY0cjdnemgxQ2JFSzNLQkRkRDBs?=
 =?utf-8?B?OGF5NWI5d2JHQ2VITXFsU2ZaZEN5K2wwUm01cjJoMGZoMDh0Nkt6VjNiNnlW?=
 =?utf-8?B?aE56ZXpqaU5CZm9mNmh0cmprNDB5UHZJS2xHYlhHd01VVUNiSzJhN0x3bEIr?=
 =?utf-8?B?N0FZcDFleUt0N3ZYVkZlUG9WOEsxWDZQZHJMZCtnYWRKa0RWcjByQjZIL2Zv?=
 =?utf-8?B?QjVRRFpJN29rVGROU3lDakpWQkNtYjEwdmh3c3JBaVk3RVgwbFFwVlA4ajFq?=
 =?utf-8?B?YlJXUFJWdFJLVS9iTWtZeVp3ejBNMXhjeG84azVxekdidldGRVJHQ3pNUEl1?=
 =?utf-8?B?TzEzL0RUOTVLSDJ5UEY2OWc0ZnFaalNacGxRNWFKZEErSnhEeTJHbXBXNVFw?=
 =?utf-8?B?MDZkRXRCYWZqVXM4bE5qK1N1UjJSblZhdCtzRUVJcWVITzRVcWU1dlliZGN6?=
 =?utf-8?B?ZkhCVWw2TGR5bWc0bTV0S3FMR1pYRWVRYjNRQ0tqd1BOejM4ZmJNOGZQanA5?=
 =?utf-8?B?eEJnMkFzb3QxOXNLL1MvejhOeUN2RzlTVktmVUU5WXRiL3BjRFkyRVA5Vmx3?=
 =?utf-8?B?TnFjWDBaU2hJYUsxczdYc29lYmNqMlBKeGQrRkZwb1JROXRsL2w2VE0vRVI5?=
 =?utf-8?Q?O9028KjRcbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnBYelFzOVNjbVZ5Tlg1anBLei90NUpMdGlrNDBoQjNkQUlsOEt2YmRrd0lL?=
 =?utf-8?B?bXBxYmlVb3VUY0Z5cXpnMjN3SHp2TE5qN0M2Q0lVVGQ0OEhMd1l4Z3ZwWElt?=
 =?utf-8?B?Y3NLNmRYbTNkV0YvLzRHSlMzK1MwNWkwcStGQytrdmI2ZGVPQncyc09PSGFJ?=
 =?utf-8?B?S2tqSHl6RXpCRVVyemd2NThTdFVOanFsaUxRZ01HZUhMMWtBbmhvcmoyOVFw?=
 =?utf-8?B?NWJpcWVRN2hsWGZsYWtvaXRteDkyYVBMVHYwWVRDdk5vYW1EcE4wQ0plMnZp?=
 =?utf-8?B?S1d5bFBCeFZTMk9jaTBGSGw5T0Z0bEtmbXhoTkZETnM1dnU5U2taRC9vZjJX?=
 =?utf-8?B?WHpmOEM1NXU2SUZQU0d6SXJHelRGeWRGU2tWZjJhMkphdjFFYWdqeE52VVZF?=
 =?utf-8?B?emxTZnJGNnpmNmJpKzdiK3F4RnRreXpsUHNmZlRCWnljNmpNK2ErZE1JN0RK?=
 =?utf-8?B?K3VBb011Mkhwb3E0NzEyZEpkVUtEaFhCeUxrbWpIM2lqb0R1TXBGbnlpZnVJ?=
 =?utf-8?B?SkkzQWhBRmhoYkVzbUN2ZFRnYmlySGRhT1Y5SHJ3WWhpcUMxaGJYVHByeTFD?=
 =?utf-8?B?elRvbWtNMWpoWkFUL0VWRU9sak1Yby9WYnZ4UldOVzllU1RzU25IWU5pRys2?=
 =?utf-8?B?bmgyaXA3K2dmYW9JN3pjZ3phYTNpVys1Q0VqY0V5V0NlcTJoMGtLd3hPQzRE?=
 =?utf-8?B?WjRiM0xYNktIY1o3VTg1SjdDbFNpT3cwS1pKekcyd3JjOEdLNHZnMVllZXBF?=
 =?utf-8?B?Q2FwU1lDQ2Jucjhyc1BGU1c0dzIyWUJSOTZXRXQweUQ4bm1JV0pHSVFkOUFC?=
 =?utf-8?B?cFFGUjhvMklqQjJrY2V6L3VjNnJmNFJMM1VVMjB6S1BPVzIxUGpESVpwYk5u?=
 =?utf-8?B?VVhhYnEzTkhnZTJZUldhd2lhSnZYYWRqcEdQSVhUbUFwSUZraWhZRnd1bGRz?=
 =?utf-8?B?NGlWY0d4UEl0Z2NncnRTSGdxUDcvTHFrL0FMdS9sZEw4WHFQWlY5NUpuOGJy?=
 =?utf-8?B?YUtJNjNoSStrRzhTbXNXSHM4bmROS0UyMXA3WE05UURFMWZ1UklERjdHdzVq?=
 =?utf-8?B?cWVqTWxIbkg2YlY1RnRlaTdDVUt3TjBGQ0lnZUVRdkNKRUxNVGN2dG5ZODNr?=
 =?utf-8?B?aTRNRWU5eEZHdnNJbTVoUEEyVEhBOE1MZm9EOXlHYW5PakNSZzRpQ2pkZDlm?=
 =?utf-8?B?ZFpna09vOHpVOWdzU1NYSlVRRW52QVp0TWNseDVPcDJ1VGMrUXJseFdhVU1B?=
 =?utf-8?B?TGQ4dFRLak5pY0dGVStJSFozSjJZMnFLdnpzOVJSYkxaTXBac09oSXlycllq?=
 =?utf-8?B?d1BWLzVlY0tTb2NhT0M4d1VpMGlrdE5Rd0VzZUlRQ3E3S1BuOFFJbHU2SUZu?=
 =?utf-8?B?U1ZmK1Y2QXZ4dTd6czQ3QW5OeWgzRFVROUpzTXQ1d3lVOVpGcHBnb0IvQVdo?=
 =?utf-8?B?dGxHTG56TWJFSW1uNTdEd2p4UjNkU1phbDBrZ2Vubmh6Y05NZFI1WFZxbVZJ?=
 =?utf-8?B?ZEoya3dsYlFiUThpTEJ1TzhEYmtTSDVhT3F4Um5FMnRKSlFraWFaVkNkTGFJ?=
 =?utf-8?B?ak53MDRVTkJMQ1IvekNwK3QvU3E1L3BmTno3UTRUTHlWSEgxRGk4YXVYL1B5?=
 =?utf-8?B?US9DcjNnQ1ZodXpZdUdCRCs5MVJSZ25JTVpJNXo3cVJMRmxYcjVubm8vWGZG?=
 =?utf-8?B?UGJIdlNkeTNLRTRON1FEWDFuVTI5Mk1xdlRFU1BmY3lXYkNzOUY4dDc1OWs0?=
 =?utf-8?B?eEV5eTRMNytpQXdTcVBRYk1pVmYyUGFtVlRyb3lvWVhjM09qVGVPcGlzMmE3?=
 =?utf-8?B?V3BqeUxxTTJ5cmJPRWdRNXZnTkRzdG5mbjVqdk1ZaGxUY1h3RTU1d3ZXNXpt?=
 =?utf-8?B?YlVmL2hyN3lxeDlpU3I0dnd3cDVBL1U0Rzh1Z0lEK1EzSXZlV1BFdmZaWDdv?=
 =?utf-8?B?Vk9lWDQ1YVZURXN4UzZuZFdnVkJWbUJlRGZNdDQzU0d2Tzh2ekZraHp6RUdv?=
 =?utf-8?B?OVBnaU1iM2hTMmVUQTFYemNyNFVyQ1NpOW9ySHlFejQ3NmkvcWlKUVE0cllV?=
 =?utf-8?B?RHY4d1RGL3pyYVZkWEpHdWdVOVkyRkl1WjlWdExQclI3L28vam5xNVNHdHBx?=
 =?utf-8?B?MnRCbVBLUFU5ZU84ajhFOEM4aHZQTGlwWXBmZzRBOTFyNmlma3FPY2ZZRmpH?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d968a30-e6e0-476c-ba50-08ddb3739098
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 23:05:08.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIeSG9pZVg2zFJyNTCqWdEBrULCmcJLXMH39rGsPXbAThIZg35IZKz96w3+VeNHUvNmIbq34W/LHMLuRMc317ohinlEINmM2HLVenxLTo3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
X-OriginatorOrg: intel.com

Hi Babu,

There seems to be many places referring to user space assigning "counter IDs",
as I understand the interface the user has no control over the actual ID of the
counter being assigned. Please correct me if I am wrong.
Considering this, how about:
	fs/resctrl: Add resctrl file to display number of assignable counters

If you agree, please check the whole series as this seems to be an often
copy&pasted term.

On 6/13/25 2:04 PM, Babu Moger wrote:
> The "mbm_event" mode allows users to assign a hardware counter ID to an

"a hardware counter ID" -> "a hardware counter"?

> RMID, event pair and monitor bandwidth usage as long as it is assigned.
> The hardware continues to track the assigned counter until it is
> explicitly unassigned by the user.
> 
> Create 'num_mbm_cntrs' resctrl file that displays the number of counter
> IDs supported in each domain. 'num_mbm_cntrs' is only visible to user

"number of counter IDs" -> "number of counters"?

> space when the system supports "mbm_event" mode.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 11 ++++++++++
>  fs/resctrl/monitor.c                  |  4 ++++
>  fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 4e76e4ac5d3a..801914de0c81 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -288,6 +288,17 @@ with the following files:
>  	result in misleading values or display "Unavailable" if no counter is assigned
>  	to the event.
>  
> +"num_mbm_cntrs":
> +	The maximum number of counter IDs (total of available and assigned counters)

"number of counter IDs" -> "number of counters"

> +	in each domain when the system supports mbm_event mode.
> +
> +	For example, on a system with maximum of 32 memory bandwidth monitoring
> +	counters in each of its L3 domains:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> +	  0=32;1=32
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index dcc6c00eb362..92a87aa97b0f 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -924,6 +924,10 @@ int resctrl_mon_resource_init(void)
>  	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>  		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
>  
> +	if (r->mon.mbm_cntr_assignable)
> +		resctrl_file_fflags_init("num_mbm_cntrs",
> +					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
> +
>  	return 0;
>  }
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index ba7a9a68c5a6..967e4df62a19 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1829,6 +1829,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
> +				      struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +	struct rdt_mon_domain *dom;
> +	bool sep = false;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> +		if (sep)
> +			seq_putc(s, ';');
> +
> +		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
> +		sep = true;
> +	}
> +	seq_putc(s, '\n');
> +
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +	return 0;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -1866,6 +1890,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdt_default_ctrl_show,
>  		.fflags		= RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE,
>  	},
> +	{
> +		.name		= "num_mbm_cntrs",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_num_mbm_cntrs_show,
> +	},
>  	{
>  		.name		= "min_cbm_bits",
>  		.mode		= 0444,

Patch looks good.

Reinette
