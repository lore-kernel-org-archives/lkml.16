Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847ADDDBC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457004; cv=fail; b=ODUDNRbQ+9xOLmiJk3FVR+ROy/GlrDZLG5fmwwOCHOeusV5W+nN8BF5JJgB1gKCmIAa+WU9JtuibTnbEcnvDYspuTZchcVKdGHTIVmAMtuxvB5I5qyB1ngVaUnU4nLFgws4iDSKR+O/tmFE3+1JJ1sWbXiet5vRTRe4ZcJZO3QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457004; c=relaxed/simple;
	bh=sYSZbI+U6s+b6KoyWXUnOmXWfKnXNrpfiqDtd2gfXg8=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PPP+zix4jKsv3/0j0qk9aJwZJ1ZBNlfQg115QTHkMzL4tF9OBpyQDiYnMAslquO9ZD78bl6PELq2SQ1VeWC0A5GEPRkn3M9OOHOh+vrmkT+F2fb9g9MFcteae0MlObufa6xgPuXp6yFWPvUXtlBkVjts9EfY3/u++Fa6NkUWuWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMA7CPMM; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMA7CPMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743457003; x=1774993003;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sYSZbI+U6s+b6KoyWXUnOmXWfKnXNrpfiqDtd2gfXg8=;
  b=CMA7CPMMQA79CraVBiJQCx8T3lzp4Mpd+JqXVHLaxlEmx/Obaqwe6VXh
   bsFVOQp1WhFiUhL/5ZNS85o9eV0TZAdW50l+/XOJwlqynVaIvdrG9KL6c
   2d4KMCbl/mp4crbUcgCJNN+QvfykOOoTz7axhy1E90l1Xk5x7VTWTD9Az
   VOV5s2iFkoMNzrfaG+p6OarjYgv3aAOAabf+pew1j7B6+rcjUEXNt9MB4
   zcvW8VWCC3WqzSHTnLJBQeVyfeoztSBI/TeGhA24R3tdSxHOtvLxvfaYR
   xWpT3UnOom6KPf0/NEtHKeek6hEyLCWyFSfHVM42nyjY6exWznc2US/sM
   Q==;
X-CSE-ConnectionGUID: L/UKGXsrTYu79MGueLrAfg==
X-CSE-MsgGUID: 48HdTv4mQ0CXiExFmusZZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55756544"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55756544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 14:36:42 -0700
X-CSE-ConnectionGUID: objru4fCQ+mNKRGL17dEvA==
X-CSE-MsgGUID: H15B/3f0TICuA5zttkz2rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="130309754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 14:36:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 14:36:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 14:36:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 14:36:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4cRgNiIBsiHgUy6rcSoHwdFA7fhd1uGI6FI41qM4PjQ7qWRpvOz0ZueEVHnb2AJyfqSsjVL9soQLBWmJ4/apNt6i9SseYzKmYnAl/YudHdT/v+MgCfKohFfODLSfLKMurPBAaHmvgp2Brm9nDuVxZiLiNK3OHqX50TSRdABDGi1PuxKYNg27c3Bst/IA48tPpnMPjI+m63mgq8fxztrX4m33gqaZevxwFRViFIjGABH6JFQ9y8gaHS3Oi9fb89lEvoW1avXrTR1uPC7oynyATHWrRzGdC/b0JJfHSryZlQK+/jHU0+sZaVyYTZwIOUeva8y0TaKmliSD+b1qDgtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnvY95+qYK2eDmHhFhYMip3+jKgC6gsuzavsC7hQ8Tw=;
 b=uQbzCnC9ErsoM+cADaZUARa2IIZ3oENQ8VttGC9HdfiuMR4TC9s5t7NuwPTBdA7+D8l+KFXwGlyGVx+zldoJCBLxFusYU+nDSpDKdR9WVTI7t5KLLNkOz4QhoY+SaXGgBA7m5kyKMDsd79c537aObvgBZRE0nshazv2sM6FPs7QKtCtrqCVppfF9iRWr94kXF2ufE5o+CqstRRywBVWTX8lxnGoI/xk06XnX/yBnO4g4+mKJ5qEyY61PjkCxtgfjZgj9c6BE5JR+o6Sc2fILogj8eXaCpLQ7jNNj/aHgmYnrzNCCbRIov4BW+VWICmP8frMzbqwhd8kHRr6BKIlYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 21:36:38 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 21:36:37 +0000
Message-ID: <bbd417f4-b165-435a-8bb8-f90e42f0eb16@intel.com>
Date: Mon, 31 Mar 2025 14:36:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] x86/nmi: Improve NMI header documentation
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Kai Huang
	<kai.huang@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>, Jani Nikula
	<jani.nikula@intel.com>, Tony Luck <tony.luck@intel.com>, Xin Li
	<xin@zytor.com>, <linux-kernel@vger.kernel.org>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-8-sohil.mehta@intel.com> <Z-py21rwghagQDEI@gmail.com>
 <4e9bc37b-34a2-4d5d-ab14-904ff2938292@intel.com>
In-Reply-To: <4e9bc37b-34a2-4d5d-ab14-904ff2938292@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e6f90a-34b1-46d9-0503-08dd709c1e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0ZrYjZnMWw2WkFUb25zaHRQTm5Od0l4SUYycDJIVldtWmNac1pZQU5INTBE?=
 =?utf-8?B?eDBncUZEZGJjUm9ERFJ3SkZoZU1Qc1FheWxwcDFCOVlFNG9kcUxIWHRnRGdV?=
 =?utf-8?B?dnRRM2xwcUs4elhDZXlpVzJyUmV1WVFyVTZOTVd0bmMxQ3BKSlhBTVJzcWli?=
 =?utf-8?B?c3NIdzRVWHRGVUdFbk51a0htZnBpY2IvQ2MwZEcwa1Arc1E5Ylc3QkY0VTBQ?=
 =?utf-8?B?MjNyTjVSY08remFvWExTWmVJMlRvbC9QTFRZOXJ0UXBHRlh0dDRrZm8yTytX?=
 =?utf-8?B?dHk3a1k1OUdKWHlXa1hUeUw0eFM5TlAxcE9nWlhlRlU0VzcvSm51UlRKbGxj?=
 =?utf-8?B?bmVEdXA5aHJSWXJEUzlhRDd0ZVNOdzFMV3ZCbjFCOU1oT0NKVkRMWEtyYjZ4?=
 =?utf-8?B?NENncjJQb0F4a0lSWGMwZVZtQnFWbm00Y05mL01Xb09jTGllU0NtbkRIdEw0?=
 =?utf-8?B?SHJEZmJJMmdpemRETEI1RGNRWis5WFN5ankrZHMxR3FORU13NHMwTDlMR2hY?=
 =?utf-8?B?c0xnWUJ1VHFDTVBmMm9FSUxIc0JpV0Q2bml6eHJrUkJsNkVGNTdtYmtNRnZQ?=
 =?utf-8?B?Rm4xd29EanhVV1ZlTWlEWS9jcG8xRzlXWWdGb051aTllUDhLelBwV1NzMnIr?=
 =?utf-8?B?Q1RWUGVlbnloMVh0RjNtWDlNQ2FRY05JOURoSG10ZUN2eU8yN2ozWmY4UHZF?=
 =?utf-8?B?Z1h3aU5XMHlya0VvS2NseFRJWlVvZEpaVUJURnpHNFNNdmpIM0J1L2xQMVF4?=
 =?utf-8?B?bWxqbFZIMTY0cU9KRUdEZGMrTkhCMnFxU3RZMmtPODlnSUhldy9NZGlvWHV5?=
 =?utf-8?B?Z0o2UHJxKzVqOU01dWlmRENLdTE0TDlLOFVvVU9icUExUmtaUTUxQzBiRWJm?=
 =?utf-8?B?ZFlCS2psczlZbWJkZGpnd1RoWTNJaXVlUFVVcnRnR24xb2dzdzFYb1hXcGcw?=
 =?utf-8?B?Yi9Bb2xKZzBMMmlFSmJVOEk4aWZnSDJ6dHB0NCsyd20wM01OZmZWdzNtQTJo?=
 =?utf-8?B?RzdoL0RBOHpMc3JlZDB6TWdOc3k5WXR1RzBZeWpyVGIyRGwyTG5BWkpNTE9p?=
 =?utf-8?B?b3lzT1RnQ0JkL0RXSlFGaDVqNlNXQ2h5d3o4YnJyVlhhUDBWVFlzc3RQKzhh?=
 =?utf-8?B?SmxENmJOSGN5elRPYjNQd1pjSUNReFNoU2U1UEZOZ2pBUnY0UVU5TzU4SWFl?=
 =?utf-8?B?REVHWENJK1JPcTNGVWFYclArNUVvR2tFYm5UMFJiMUFwcVFpRWM0Y1JVOVJz?=
 =?utf-8?B?MmJ6MnhUY1pIUXBONjA3TTFna1VOZzJ2ZEExNSszc2I4ZEZJdDdRekpqWUJC?=
 =?utf-8?B?L2hkVm1Ec0F2UXpTcy8xYm44bDFjUEVHN3VkVWtXMWhtTkhOcVV2SEI5L0tW?=
 =?utf-8?B?YjdMM0Q2KzllQmdnMlVOQUZ4RUFTc0Y4TlY1MDRod0V6TmRyVHJjWVJkcDhj?=
 =?utf-8?B?MFVJVFBsZjZ3V0EvMWxKYStwclBLYXFDNmhGd2FoZ0RDSklDMkRBUXAvU0NC?=
 =?utf-8?B?L1U2ckp3Q0U5SnpVR1drV3h2aHZvVUVEOCswQ0Q3RmVIYXM0eGxBeFA0akxw?=
 =?utf-8?B?MW0wa29JcEtoaTNicXIrSTRvUEh0RWxPTzFJWHBqbUZSei91bUIwYUdCVER1?=
 =?utf-8?B?WWtOUUw2VHNVcW0reFFBdUVQeU9BQ0Rhd284MUorczFpOEQralg3My9zL3ZF?=
 =?utf-8?B?d3ZGblBDOGdHazNSWThZVkhxdUROdUFIbHBic3hmVWM2SDUzZDR4YVVNT2l0?=
 =?utf-8?B?TDYyY2lMcmY1TVJDRkF1RHBtbXgrV3dVSGRPc28wWStleFBuZmUvYXlUKzJT?=
 =?utf-8?B?OEg3MU1CUXNUWWsza1g2WTlhcTZqN1R0enZMdmRaaGRaZFJPUWlja3NBN29N?=
 =?utf-8?Q?s15En05GTVYEu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWY1MnpZeEhydDRrTnZpTjdQZUxPZ0FSUTdwOHRzT1lTNGltMkxoVEFjMzEw?=
 =?utf-8?B?QUNqYVc2cS92aHN5Wjh1dUdsV3VDcHp4SUxIcDdXOE9RNTQ3WFpFODd0bTQv?=
 =?utf-8?B?bm5jUWRIeE9wTENUN1hQdlMrVGJEY2cwWXBRbW1nTlFCUkQwK0l6VmRGTFhx?=
 =?utf-8?B?QUR1QmRuZjQyYVJPSllpOHcwSWY0RjVicmN3Mm9DYkRxM0VaTXVCTWNEUWQ3?=
 =?utf-8?B?czc1YlFNKys4TzhrVDdjMVRWRjIxS2tMd1NCWFhtNVV5LzhVL2ZBU1NaMU81?=
 =?utf-8?B?dytONnQyZE5ac3pRRWF5MlNCUXpQdnZDdGxvT0V4RWZZYVpycXVpQkIyNjV5?=
 =?utf-8?B?MXpvQXc5UDFpQWcxME81TVhvd2t4M0VpQWVwKzN1eno0UUcyVG04Nmw4ZFRT?=
 =?utf-8?B?SnhKbmQ1bVltVHlSR1pzUmRiK3J0a2ROWkRDallGcFZjeVRVK0EyRUhiSXFQ?=
 =?utf-8?B?UlFsdVNzTGRrc1BUZE9wYVZ2YkhqVUpvZmVqWHIvM2lxbGx1TVlRRzhRRjZu?=
 =?utf-8?B?amp5bnVISy96bzVXTlpQYlA4NHZmcUdlRU5MZE10Zm5QcHIxN1hRbTFVSU9D?=
 =?utf-8?B?aFROVEMySEQ5Lzh0UWVGV1NMTFhMMis1K2I2QlkyRi9xVTNTaElTN0k0cFVj?=
 =?utf-8?B?cFRuNFNxaHhtSjNmamsxcEpSbU1zY2RCU0Y4WXJSWUQrMGZLWk45c0x6RGtH?=
 =?utf-8?B?YzV2YWh2ckJLelpNSmRya2tWckRQc241THIra3FEWDNPekQvdC9QVUhkNis2?=
 =?utf-8?B?U092YkFDcnFsb2tqcG1FYnZMcE43RFg5ZERzUTA4b0loeVM4V0RmSXdVOFNh?=
 =?utf-8?B?Z2tZd2k0Q2xYT3ZGMmx0SU5EWmY1eldVekg2NWFTR1hzRzhpazVLd0twblI0?=
 =?utf-8?B?ZkhxNUpQcnJBbmJTMFJHSG1ZaU5VNzZHWnl0ZWhncFdNb1ZINXZScXcybkVp?=
 =?utf-8?B?bzRuM292VDMxQ3V2WnBSUHNYSERsKytlR0g0Qi9EazNyVis4OVY2WXA1VzA2?=
 =?utf-8?B?U3l1bmpPVXZ5RTBaMW9LSnRHanRQM0dWSjhqQnFlWXNOd1BBRkJmTVIrWTBi?=
 =?utf-8?B?Q0JtUXR1QVFUL0pyRmtrTzZZTmRTZmhzbko2cW5qUllKNmM4Z0RGaFp5Ymhh?=
 =?utf-8?B?cXljR0JubUFxZDAzbU41bUFwOWZrZ2VXV0NaYnpISWsrQlNrNzNMQXlCZWt2?=
 =?utf-8?B?VkxtcGF2UGtYNXZMMnYxNys5ZWlxSzBYL3Z2TTJPRC9VUW9zNWFVa2h0bElK?=
 =?utf-8?B?WW9EZUo5amxHTlk5bXE5OWIwNm50V3gvNURiSmVmTXRmL2d5QXR5S01qRGht?=
 =?utf-8?B?ZFhlSWR2cUQvTUM5eG81T1pQSjNsNVdZcllnMElqVmdyNVlPUElkd0VnbnJG?=
 =?utf-8?B?MjFCQVlKL3JoMWJJZ3ptUUxnbGhUWnpNODZvcTZ6Ni8wTi9UQmRnckNoYS96?=
 =?utf-8?B?SHlraHM0T3dkaGRzdGtjRUowZE9wVHVOSnMwM0d5TlRTUEpPZm4yWDMrazRZ?=
 =?utf-8?B?ZHkzUzZCSWJocFNxZGFWei9xRWdoVVlJdDFLVnc4STRlVVcyNUI4MUVCdHhS?=
 =?utf-8?B?QWh5eEVyUUVFejk1ZDluUFBxcjRiWTRadkNXa1BqTjRqek4wL2tpQVdzMXpH?=
 =?utf-8?B?WVRUUjhEWktyMWczZTdzQ1VjR1ppeFIrT1BnYmxqQ1B0OWEwUW9RdmtqM3BN?=
 =?utf-8?B?VGhuTXdERGVkRU9oY3JHczBBMlhPc0dFN3RkY3JPMXVXM1lOVUViOW0rQzNi?=
 =?utf-8?B?MVhETTlYWnNEYStnM2EvV3BSbHhodWpYYXQvV3ZvSk5KN1FEMElrMDJiN2d3?=
 =?utf-8?B?SWdQYlczdk50ZmdLdng1b3RmeUJuZVQ1Szhta2t1N1Myd0dXcDhCOTlvZjlh?=
 =?utf-8?B?a0x2clY4MFdDc1lXSk8vVzFUQXdSM2pHbzNFanpSMjJZWmN0MGJDN245bmZk?=
 =?utf-8?B?Q1FOaXdwRFJEYnN0VnJzd2VydWtiVnNhN3BZZ1FzYzNkejdiUmQxQjl6dTFL?=
 =?utf-8?B?YWx0MGRHN0ZmeXE5MDZBQ282S2ZWYXVxaEcxbkliZmRpTUZIbTZSL0JmdHN1?=
 =?utf-8?B?cFliejhhNUFiWjRzdFg1dW9WemdhUnFvM3JCS1hIOHVBSFE5WFFzR0QwY3VY?=
 =?utf-8?Q?GK8BkY2+4d/Ecr9INO/9BsBeB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e6f90a-34b1-46d9-0503-08dd709c1e08
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:36:37.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UwOTIVqdMJWfhOfw8koqFdmzEZsIkP8XdQJeUtvajNXsZlIk23LTvFWJqNnjNX1yNJ/YcJ3y1NkwLcQ96wf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-OriginatorOrg: intel.com

On 3/31/2025 9:04 AM, Sohil Mehta wrote:
> On 3/31/2025 3:47 AM, Ingo Molnar wrote:
>>
>> * Sohil Mehta <sohil.mehta@intel.com> wrote:
>>
>>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
>>> index 213cf5379a5a..36698cc9fb44 100644
>>> --- a/arch/x86/include/asm/x86_init.h
>>> +++ b/arch/x86/include/asm/x86_init.h
>>> @@ -292,6 +292,7 @@ struct x86_hyper_runtime {
>>>   * @set_wallclock:		set time back to HW clock
>>>   * @is_untracked_pat_range	exclude from PAT logic
>>>   * @nmi_init			enable NMI on cpus
>>> + * @get_nmi_reason		get the reason an NMI was received
>>>   * @save_sched_clock_state:	save state for sched_clock() on suspend
>>>   * @restore_sched_clock_state:	restore state for sched_clock() on resume
>>>   * @apic_post_init:		adjust apic if needed
>>
>> Note that I've split off this second half into a separate commit:
>>
>>   x86/nmi: Add missing description x86_hyper_runtime::get_nmi_reason to <asm/x86_init.h>
>>

Upon closer inspection, I realized that the commit title for the new
patch is incorrect.
s/x86_hyper_runtime/x86_platform_ops

The git diff context shown above is misleading. We are modifying the
struct x86_platform_ops documentation and not struct x86_hyper_runtime.

/**
 * struct x86_platform_ops - platform specific runtime functions
 * @calibrate_cpu:		calibrate CPU
 * @calibrate_tsc:		calibrate TSC, if different from CPU
 * @get_wallclock:		get time from HW clock like RTC etc.
 * @set_wallclock:		set time back to HW clock
 * @is_untracked_pat_range	exclude from PAT logic
 * @nmi_init			enable NMI on cpus
 * @get_nmi_reason		get the reason an NMI was received
 * @save_sched_clock_state:	save state for sched_clock() on suspend
 * @restore_sched_clock_state:	restore state for sched_clock() on resu

>> as it's basically an independent KernelDoc bugfix AFAICS.
>>
> 
> That's fine with me. I did consider it for a moment but choose otherwise
> to avoid micro-patches. Here is my sign-off if you need one.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>

Sohil
