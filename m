Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFA7189F39;
	Thu,  6 Feb 2025 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864920; cv=fail; b=hY6iEfYz5m6aLrwadGk1Ton6wc/UIALxDrWm0QPJtARj6BvhAVHjZW2H6vJxQU7A0gIEVlaDOA7xZrEYWNTPNWa/ushtoyVhV4S6kcxdk+n8Z0XR6SX4sx2H+g4b0mRHx1ymQILYKXB9ijSapkn2yqeN5W6o1yCDXPsYyrQ0ZaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864920; c=relaxed/simple;
	bh=W/8Bzov5Fp0g7u8boBbzrIci/E9bICVZ/+lyKdG3png=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nbQpf0tr+VCtUEBI0F3Qe2lnBRpiJCUukFnUrT8su1G5rtA1uKYM7vYu+75kZUc9W/SRFQ8MhqtWfYAtQkRC8OjaTg+cXTDBnrvOiPU5eWVLoZpPuRIpX+ZgUQUg41Xh5V9x2AcqYNIbzilYodlm2JzesHT7TC2gEiU/G2Cj1dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIBQnobM; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIBQnobM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738864918; x=1770400918;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W/8Bzov5Fp0g7u8boBbzrIci/E9bICVZ/+lyKdG3png=;
  b=XIBQnobMlpz87CRDQVoYQJJi4JVnGA72HDo2KxWO9zqmg82vcL4uylH/
   OsVoF0ig5aM/eu+8POXxr5/WwpRg0qLbKMU11pLu4J5hpZIVEhJHiJNK9
   pD/K8dE5Ff2y88PXeZgk5qlv+XG8cJkwNheMzN9IiMyi/Kj+v3EbKyBVW
   z3C4QEdxDv77bMb350D0uZJOYIg5TOxC7wvgsTaO5GMFgrB/np2W/FOO3
   bkY+RNllZ0MjB1dU4ghKxFsXcv9i2kJLQBPf/lZJHp6HFiy6Pzd45xa3t
   /mmKGt9TXRi+Y9Cm6RxsXJDIHPIQTdwCqCgdgYrs/AuoQHS6om1z0AsfF
   Q==;
X-CSE-ConnectionGUID: sygmVspYTDe+skFdMhi2kg==
X-CSE-MsgGUID: W+IwwV3lQmiQ/ZpP4dVyVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39755853"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39755853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:01:57 -0800
X-CSE-ConnectionGUID: CEm8iE5rT+mJgFPopblNjQ==
X-CSE-MsgGUID: pWd0MkFiSIaEHbi7WJBOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111140197"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 10:01:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:01:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:01:56 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPqNkzui43uYXllZUIl5yJ5UMg/rgp3OU2IceIOA6W9/nDlrzmbRSpe89BU7F4FLWqRo8eXWDHO/EobcLCMMVMy996XNKLcxJHtV9A35lXJ65CaN9sQz3uXHG4E4rnShJqqOv7HQKUXmxl8D/eSEAemM9DfFo2P0BgC3i/yzDX1H8roTlBn+EBq1SkV39DKedGNHuboDIrOOLaxMRxjlSs/K3mo6iLPAltwxae5Ctz9t/ZYdAbIkpPjINEgb9XPIKXEHLrD0ZN6CHwS2T9OdXCRCAZBSAqhtZCvh/F2rVfJs2VYMr2pfckzkdNACRp5dTdpMhQCuCDchafRl9jXQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB5tBLGFZWn+nfLX/cYRsFzf+rRFYWwFH1gqFt2Ih0M=;
 b=FVha4S3CNanv95A5uIUfxfaFGu+MMl93tHI9wlpQoB2Qg8ffmbNu8YoXrF2oSoz5kjaaGT1z32D+7opJOgX82E3S/iYnrjzpNMyfrO7pn7wxbh+G/cas7+jCTpOpl4XXFbC5JSeZ15h/Fp0L6UmMACQeIxu06zo1GffmPEZRdkjkZgcuNbziUeZCckFKYFhdVln7FHdhdCzrRH1t80QUoU7JWiS7Fk149L2qWY2yIc7KLDV3HHruOsdQivd28kGbd6jLYhKH426Lzttfnym+eooBOHezW8k7p69mZmPj29UPWUmk6GP6BA1BCUkWbljjQX9T72x1kk5TA/d4OgiSAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 18:01:53 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 18:01:52 +0000
Message-ID: <6d215925-ee84-4b39-b002-9e3b66c015b0@intel.com>
Date: Thu, 6 Feb 2025 10:01:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/23] x86/resctrl: Introduce the interface to display
 monitor mode
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
 <b298391d4db5806c145ba0b92d79e02a4df8d8c5.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b298391d4db5806c145ba0b92d79e02a4df8d8c5.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:303:6b::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: fd52f748-cdfd-4648-9623-08dd46d855aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW05V04vQ0dydjBIcDQ2Tk1IajgyRjBtMHAyTlhiY1Q2ZjV0dWVaVEJnZVdu?=
 =?utf-8?B?UCtBRndGekw3V2dVWTE3Mkh3NHE0a3RnSC8vUm9tWkFrZVpXUGJFTGRMQXB5?=
 =?utf-8?B?N2QzSWdicm9YS2xVcmkzUzVhWFU2MjE4OWZBMlZNakd4UEY3U1ZzME5XTzVV?=
 =?utf-8?B?UnNxOU9lSFlsMDZqbk9saU5yUlJISWFHUEVFSExtS1NJazcwWHVTekZ3a09C?=
 =?utf-8?B?YnRMV0JGQlRja3lKd3BpbVdIcVJlMkxHRm83K2pQNFZtQXFiRnJZUHRCYTBL?=
 =?utf-8?B?a0ZTLytIZVJpa0xIMGpVa1dUaURnSmxjczMwcHhOTzNISzBVWm53MmZVWGZJ?=
 =?utf-8?B?Wkhib3JMVTV0bGVuWFJPNmprdHVIc1o1U1VPajVSVGh1aldHYXFSYXJTZzJt?=
 =?utf-8?B?Y2FmcmRZbWFJNTZWckhZWGZpQVJtbU1PNXpCQXh1MjhLakNqSkZaSmVwQTV4?=
 =?utf-8?B?YmdyVXlUYitUSGMyQXYxbVZjNyt4Z1RoOHdEdm1Qa2JQc2pFMFpjcFd4MW52?=
 =?utf-8?B?YVZGaDhiOWdrWERFQi9JTFdPTDJHZE5TalI2MW12KzNVSkp1b1FXd0Q0Tldq?=
 =?utf-8?B?RjJlYzlaeS80SzI5d0ZnbXFtS0ZtM1BSTW9teHFWaE9KZjEveFVPb1VXMWlB?=
 =?utf-8?B?Q091L0ZKSTdTSU43TVVZMk1OZE5GT0o5OG5OczJrMFp1b3A0eWZXdWZlWDd1?=
 =?utf-8?B?NXoxaG9ua2xaTFJNYjZiQXVlaEJuSWI5aTUvSVhaajBodjRSdE5qRThORlBo?=
 =?utf-8?B?MnJORCt4S1c2QmpLWjNVdlVFdlh0TzZDYlh2RmdrdGp3WkQzbE8zN0NRUHd4?=
 =?utf-8?B?NW9JRngzQnRMK2owTTNxZ2ltb2R6OHl2NmFHY2ZlYWRXU1VjdWpYNGhUL1Ns?=
 =?utf-8?B?aDV3SEtiL21Bd0xCSG5Nd2tZK2RoWGZXeTRMRjB0YStKb2tDbWJ2S3hlelN6?=
 =?utf-8?B?Qkw5NllaeU9heXFuSXBBWTh4SWwzakt1Sjh5Y3VYS0p4MUFwaUNFL3lGT0U3?=
 =?utf-8?B?YTRFMW5MTUVvSzVEMlpuQlNId0dHenJJbTcyZXNVVlM3MTFINnJ2Z0VYTmxo?=
 =?utf-8?B?a1plZ2FSaXhWeFBrVWE3V2c5OC83RG1Gdmh4U3VSZWl0bnozNHl2VE9qbjZU?=
 =?utf-8?B?U0FCWEZ4L0NDY0J0b2EzQ29BQXlxS2V1NEN6OUVaelk2NmFGbi9qbUZxS2lj?=
 =?utf-8?B?b2gzb3lZVGdNdmFEQkZNR20wTnJqMHM0a1QwV09rYmlqaFVqaWxGa21CaVVP?=
 =?utf-8?B?V2pTL3BLVGhrMGZYRHFBc3l5UmtsWFpObERWS0hXZHJZb0pPdkRnMFRaM090?=
 =?utf-8?B?YU5PalJaZmI1TkRYSVRTVzZKaWh3aGRjWE1UeEhkSjk1eFQ1TG5adXFPbkEx?=
 =?utf-8?B?MGhMRzJCUGZSQjBaWW5hcEJnN3ZqVDlnWXhJKzQ2OStDaUlKWEJ3SXVjaEo5?=
 =?utf-8?B?anhyUmU4OFNuMllaais5anJ1cll3VjN0akgwTmZtOTA1NjFmTG84WG9RVTl4?=
 =?utf-8?B?ZUU1V2psKytGbWpNdnA3N2RNOWVqTi91aXJPVm5Id2RYL0hVZ1VMU0ZOeXpD?=
 =?utf-8?B?cW5yVllkUE0rdFdKcWFwbVZKNnlidjRPNGhJNlRHQXVhUXlwZ291MExvWEh1?=
 =?utf-8?B?enA4UEJtb1lmc01SK2I4VlErenprOGx0Sk1Nc002MnpCdkhsd2UwaG1RQzRi?=
 =?utf-8?B?cUR0ZVIzQTJPUnowa2hRTUFlcXgwOHJnUEQydzRBYjJLaHlkdUFhbGNiYWgv?=
 =?utf-8?B?cEJ3NHNJYkRwR3lXM3dlbFJBM1pad3JUR3RpVGNhOTlBMy9Zbi9LZHFWWlNl?=
 =?utf-8?B?TFFrMTJEc0NjN2pHQVNqTEErcFc4QllhemhpN0I4N2FqTTNobnM2ZFZwSzVK?=
 =?utf-8?Q?qsuwycwaVV3KG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Unl2UEFHU3NCZWdGSi9YQlFkVitPblpiYTFpUEhIRUltRGlueW41enRYVm1Y?=
 =?utf-8?B?NkZnMkZxVjJMSDlNVkR6dW5ZbFo2dG85VHVoaDg1bjlES0tiNHBxdkZabnVY?=
 =?utf-8?B?RWExeWZoNUdmRyt5VlBHcFVQS1hkb2NLejhEa25mY3h4bGkrR0hWaEhBcjl0?=
 =?utf-8?B?SFdvbDcvR0NGWkdJU1l1ZnJOMTFrVjZxWXpKS0FqdlZQWjJtcC9ITnhsU3JU?=
 =?utf-8?B?OFYxSnZmRG5EQlRPR05hb0tYQThBNTUvMDJtZ2E0OEZVTTNZSU5WN085a1hK?=
 =?utf-8?B?MEY2K0J3eC8zdHdNNkttdTc0QW9IYTRZZ01xclpKNFdaa1l5MFhFTSthZXha?=
 =?utf-8?B?ZG5STG9rTXdNdHZicTFFQ0Nzb2xuK2RydnNsMlRnSUh0bDZCQVZEeXJ1RE5v?=
 =?utf-8?B?T3M0eE02MEk2TXhZKzlOWFZqTnAwanhDbEdwZDJmWTRCdGk0c2VoSFZVWkN6?=
 =?utf-8?B?YnZKQ0JSVGFYMjdzdG1kczVmcjZZdEFKMGQ5bkNWRW05NHZOd3JyeUFJRk5U?=
 =?utf-8?B?ZkhDaVVrRVdvMlRDTjRsdW84TFQvRmxRazNTWER2K2lxbEZQaUJvK2FqSlhp?=
 =?utf-8?B?azJUd3NPcXVLQ3JkU2xRVUwvMWpnYXdpblJWT3JsR1oza1ZzbVMvc2p1b2dS?=
 =?utf-8?B?NjhBZEVFU0FWUU5TUWhBUC9PT0p6RTByc2NPUlRWcG5kd1ZtODFPT2NMd2xF?=
 =?utf-8?B?T1FtREN4MDZRQjRZN2hYUzhVcXNLQXJXN1ArREpIQUxiVmlvVzFpRVRBOXRl?=
 =?utf-8?B?azd2SFBGOWxFZnhWNGVUY3poa3lMZWtnNzVWMnVpZXpVWmpvc3hzN3p5Wmsr?=
 =?utf-8?B?QXlXQ0Nsb0RDQXJFME5VZEhKTjh4S0hpdXlObU83NnlHa09tWGhka1ZTWm5r?=
 =?utf-8?B?OUowYjE0TkUwN1VXRFh6ZzhqTUpWcm1rWnFqa2VlRkl4QmMzYXhzMlJWWDlq?=
 =?utf-8?B?cmt2amoxYmNMVHlGSHFoMGRCeERQSzVaYzBPNXRPTVI4aG5Vb3ZoY1FSMkN3?=
 =?utf-8?B?UUNwZ3pwN0tEc0Z2Qy9SaXZqYzdqYm53dzhMcXpYTUd6d2ZYazlGTVFlZUhX?=
 =?utf-8?B?cDA5bExlR3Y4Tjd1MUQrWXgxV1BGWlByYWNDUVcyenhTZDZGV2FWVk5Ub3d6?=
 =?utf-8?B?eWtvSnA1SW5ERTEyUjkwN3hXS1JQUVFHZEthRmU4MEE3Q3F0QWlTY3g1ZkVn?=
 =?utf-8?B?YnRGZy85ZGJhME9OeU5NTU1DK2xDSmZTN0ZtYlNKdzFtZDYrem5MTy9vZ2U5?=
 =?utf-8?B?UEQ5akFFVEwwM29BVHRJTzQ2NExOaWJmMjJudVZGUG1pcENhQW5LQ1pwNHRJ?=
 =?utf-8?B?N0dBSVJNSGZJTFJJMENBUkQzbkduOGMyS1NncDFZQWpaMURxa0ZMRysweU5x?=
 =?utf-8?B?clkvNkZNMVBYSi9CemJVcUZYZVB5SWpSZ09GUVA4QnU1WW4yNjRlbk1URTcx?=
 =?utf-8?B?TkdCU0xzeWJJRUhkSUExamJ2a2FRTkowZkVadUUxWnFxRElHRVA2Z2l3WkFp?=
 =?utf-8?B?MGV3cEVFdUVFZVJ5b0x2dDVRQjdHK1FTd0F0alFQZGZhZWl0NEVmUDlFbTJq?=
 =?utf-8?B?TzdVQkJMY0lLVnU3cWtDaHFJSXdWSmp0NFUzUGdvenp5YThOQ1VPOHRBNTNt?=
 =?utf-8?B?eXE3MGVwUDJjZkhvSDI0bStlNE9BcjUrVDlKeUJHVnJUUVJWLzk4M2g2Rlda?=
 =?utf-8?B?VGJJTE82NEkrakQxT2VWdCt6Mk0ycXZCbjc3RU5pa2lRVkMxYndTdWdEN3Ex?=
 =?utf-8?B?YW9Mekx6cEtsczdINnoyWVlXVHkrem5HZW1vS3BFNDhOcWl4Q1FEeGpBV1J3?=
 =?utf-8?B?b09jNCt2b0NxQ3B0UEgxeXp2UndFS3lRUE1HT3pNUkxCd0tQWnpRYS85cUdE?=
 =?utf-8?B?YWlFTGdNM0RSVkcvTWRxRmZ6NUpzaEU0RXlzSlRZSDRmOEVTSWhEQUlOQ0Yr?=
 =?utf-8?B?dC9yZ3k1aXdpV0k1ZG1aTjVuVzhxaEdUUzlJWGovcFdPaERIWWpwWHpieWJQ?=
 =?utf-8?B?TlNsVjh3bTMyNHVpYjJxeEx0Zk94dkc3R29pcHJZM055ZmlZSXJ6UnkveFZp?=
 =?utf-8?B?NUZvaUZ2aW5TRWZQdjRSV2tuUGptZ1hnZmd3UnhXejRiZE9obmtXUDkvRDlV?=
 =?utf-8?B?cGdlSFVEVXh2ZCttK1B0NTduUFVQNGJXOVhWdmVaeWE2b21aQ3ZIZG9GQ0ZD?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd52f748-cdfd-4648-9623-08dd46d855aa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:01:52.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7gkExdn83pmLJQ0r48a2BCCjbOFRSeZAI0GWt1QmLAY0tbFUzVD/+QRVysKO3yTIFrZB7GS/eL8rqgrHHv8dSPoEH8KDwY5oDlzy3GOy9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> Introduce the interface file "mbm_assign_mode" to list monitor modes
> supported.
> 
> The "mbm_cntr_assign" mode provides the option to assign a counter to
> an RMID, event pair and monitor the bandwidth as long as it is assigned.
> 
> On AMD systems "mbm_cntr_assign" is backed by the ABMC (Assignable

""mbm_cntr_assign" is backed" -> ""mbm_cntr_assign" mode is backed"?

> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
> 
> The "default" mode is the existing monitoring mode that works without the
> explicit counter assignment, instead relying on dynamic counter assignment
> by hardware that may result in hardware not dedicating a counter resulting
> in monitoring data reads returning "Unavailable".
> 
> Provide an interface to display the monitor mode on the system.
> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_cntr_assign]
> default
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---


> ---
>  Documentation/arch/x86/resctrl.rst     | 26 +++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 31 ++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index fb90f08e564e..b5defc5bce0e 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -257,6 +257,32 @@ with the following files:
>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>  	    0=0x30;1=0x30;3=0x15;4=0x15
>  
> +"mbm_assign_mode":
> +	Reports the list of monitoring modes supported. The enclosed brackets
> +	indicate which mode is enabled.
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +	  [mbm_cntr_assign]
> +	  default
> +
> +	"mbm_cntr_assign":
> +
> +	In mbm_cntr_assign, monitoring event can only accumulate data while

"In mbm_cntr_assign, monitoring event" -> "In mbm_cntr_assign mode, a monitoring event"?

> +	it is backed by a hardware counter. The user-space is able to specify
> +	which of the events in CTRL_MON or MON groups should have a counter
> +	assigned using the "mbm_assign_control" file. The number of counters
> +	available is described in the "num_mbm_cntrs" file. Changing the mode
> +	may cause all counters on a resource to reset.
> +
> +	"default":
> +
> +	In default mode, resctrl assumes there is a hardware counter for each
> +	event within every CTRL_MON and MON group. On AMD platforms, it is
> +	recommended to use mbm_cntr_assign mode if supported, because reading
> +	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if

Reinette
