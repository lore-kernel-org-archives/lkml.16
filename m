Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D186342
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236655; cv=fail; b=Qf4FAPB+DU8poTXWKA6p8AiovROcBl6bQrbZVfuoTWb62YsHDpKdZ9fuI6MysDHmGGeQjiN/cLsOzeWxnbv2bv6JuMHGxMuzXOEPrt01RFt+6IW4JZzISixtw4OXeKubHAUDlFyM4Adb8UY64T5jL/yh7Dv2SWPpWpbcqRfqmWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236655; c=relaxed/simple;
	bh=WfOhH8Oxhxjdm19p3pJ0JKuoX0vGxEO880WpUUPYWT0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T7whMsp94ozALLjs/VvRLcRgN5iOHzIm3fEOZiDPNofRiNFrFzBqa8fUdFWC3OpSo/2iykhH3/PIMilYeJ6CBmUhvtqB9aLfNSii+ZTYDXudKQBQJZtssoU0CW6VSs93en7vFH3ItlKt/K0Xtpxn2XtLjs1m+umOks+4+oz2qvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSPf1xZC; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSPf1xZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747236654; x=1778772654;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WfOhH8Oxhxjdm19p3pJ0JKuoX0vGxEO880WpUUPYWT0=;
  b=CSPf1xZChy2K5RHiqHIuJeLbQXwJv4Rw+oVexYZmiwKU9TZcXN6m6n+P
   zI2Z6STRrdN+JOH6KcJupk7g939YHpW0XvWatDk0WCf00+o4tWnxHkowY
   CMgvsyzsz5td+sk4583KKPyynBwFxr7yVWgpy5PCmm7E0wuzWiDZb9Jf+
   iLpZMpiVILTaMECUzNqKOZZATmaUj5d5iyfxK/bF3FwKPeAf8gE4rER1i
   t6dgVYjqAR7051n3Sa/UYKc0FZUaiMOPLY8t93xFmirrniPx2vNAxdt9T
   6f54Xo0cVRS24MSYSgVuoPy1u3N3osctRtdX3Xt7GmGO9MlWaK78SDYO+
   Q==;
X-CSE-ConnectionGUID: 3fft18W7Sha5WZKc/vXGVw==
X-CSE-MsgGUID: D7sES/nBSDimGnnHfao1+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59366565"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="59366565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:30:54 -0700
X-CSE-ConnectionGUID: yOoAAiMuTGubcbuqiTm7GA==
X-CSE-MsgGUID: 8BlMcyY4QX6IB69slOlidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138128313"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:30:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 08:30:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 08:30:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 08:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObBYJhdi928AkqBwK+3LLjf7+dR0cPkkgFthWxDmbL3f/p9SNADRwMA6wKKH5OIp/tUHmg6EM2l09d9DUTSB0xEv0BTPdSb52JqBnnhdhFqTrp1m/lMFoGF3XE/DSvvaGM6mEw/DSSy5pXp43tZa5WG81LkIKIWFWGbOH7lkPwtCkoAtbw2BGKGc5oPldaQGJjreZzTM16xS0WEsPegvG5l98NovzQzII7eScBqGzAPS/zVo+RCHFKe/CH9aNdq7XJG/tOeoQgmCqjUVgVbXH8L3HVwPX3jEhqtczGta7DfUnrx5K0UQwz59V789SQeRutTigsOsyX1fZsSLrvTRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wyrj8z4qr7dy4z2aQbnpxvb3ZRCh08YjATJ6D1iFJgM=;
 b=LXBjuRQvT1iX/Iu+BiLoemjS2BZltF3AJAlT9GXf030Vi+5Iun02Hg79KAQLghKsF994UD9YuDSZQmG7avR+PsrAkMMcxr3mUr/M8np4laeQvwNlbmFJAdrqWzoci2q5gcWQazZCnjpQ2Ru3Iwrda1NRF85XUcuWC2TK9X1UpxiQ0EC+JYpXM/KawCCzKgZLCEFaEho7NGdaod9JFd9N1rSe1XnFabHhGkhCOjptEw5sC8L/C9CHXFaQCOdKK+9O/3WvBUK1m0XoLvjhPUo7YrcBgEUy0LzjCMHNIkSizQ4SoAYdQecN7G8Ls8gGMhXUJdb5UZXirWxbKGgjvLXgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 15:30:29 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 15:30:29 +0000
Message-ID: <60cf0948-f344-47b7-88b3-8cab57a52cbd@intel.com>
Date: Wed, 14 May 2025 08:30:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250513171547.15194-1-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1acdec-cc66-49df-3cc6-08dd92fc41c0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU5iNUdUaXVzT1ZOY1ZSV2t2ZENETUxZcExjeGN6T1p1cjJuQUY2YXU4bWNz?=
 =?utf-8?B?WWtJcEhMSDc4UnhHMmxUVDNoY016eWFDL2psKzZaa0kyQlNVbDduSVpnN20v?=
 =?utf-8?B?SUlRaXJWVnJxejBMV29KKzRzMVkxZEVlZ3ZLRllpZTdEWUVpRDZKdVNheUVN?=
 =?utf-8?B?VlR6eVBtV3N0Zk1XckZkM1JReDIrMTZ0QXhJNkNtanVOVk8zWm5tak1RbnUw?=
 =?utf-8?B?ZENQcTFzY1ZYem1jTHBDR2JBM3BTczdjVlJQWjZTRXVtWUdGOEUrb1BjL1V4?=
 =?utf-8?B?RFFod1lUMkZBU3hJeTBtaG83cVliMjZGTThrLzhNQ0pidzd2UU1GZldLY0RR?=
 =?utf-8?B?V2NtSmpEWUlTWjkzdjZ5NTlJUWIzR1kvRWpoZFAvTXVjZUFsTUR2L09LcDd6?=
 =?utf-8?B?cFYzODFjYnhmZkg3TFhQZy81Z2hNS3p0VmFCVFpOLzNCRWhRL0oraGQrZ1Vv?=
 =?utf-8?B?aGVJRmZlYnBPcmRQNCtSb1hjOUNvZ0ZRQUlVMUZtTHdyWExVRll1aTBHbmx1?=
 =?utf-8?B?d1FtTldBLzNWMWpIaFEzZFh6TlFORGgvanltcHl6R1NUazRvRGFtb1BSTnd5?=
 =?utf-8?B?ck1lWlBGcDlBZEEwdFRpcjRlWU9aMW41UFJIa1Z0UllKQU05TG5LVkdoUGJy?=
 =?utf-8?B?QnRuSUQ3bUhqUktSWnhVTGVMei9BWm53ZFowNVd0aDZOUGlXODE3QWdRZlJt?=
 =?utf-8?B?bll5RkdwSktnUzZUQklXdm15YTVhV2tnaVludCtyN3pHZkhiaWpzeVM2MGh3?=
 =?utf-8?B?K0pZbU0veGNicFg0ZjBwYjFOaDl4YlBUSjlhZzNrZG9wT2w5b1dXVmczZFhR?=
 =?utf-8?B?ekJIWUN1b3BEVHRTUXBCUEhwbDk5QmR0bWw5S1lBWExYNVZIM2h6Yk9MVXBD?=
 =?utf-8?B?WENjMU9Eb2pPL2VCWWlQOHN0akZtN3JDdTZYeXJNSDRYSkdTT21PWDBjSWFG?=
 =?utf-8?B?bGRIamhNMUlzQVZKYU1sZ1NUZWNjaDlkb2UycWdiaHkzYm1heXBRWUl6VWhx?=
 =?utf-8?B?ZnRBZW9FZUhTRDJkYU1WTVlBVmw2RDQyaWRON2FodDV1MUd4cjdma0VwTEJR?=
 =?utf-8?B?R3RjOUQxZktPZHg2TTU1UWo5ZDVFY24xUHA2WXllZE1ZMkJCNXZ2bnloTEgw?=
 =?utf-8?B?TjNYeVdNajBvR2J5U21RNk5sV1BPcnB5R2gwamlzVTRXUHZPT3hPNWhlcm5K?=
 =?utf-8?B?N0ZLWVdPbUlsQ04zK1lLNUJwc0ZSUGtURW9WNmRXbms0YlJTMGNvK3A4RjVL?=
 =?utf-8?B?K0hMTnJxNXlpNGhZcHVKVElvOGhmNm8ybXF6djJSUDl3TGZiYXpGamxIaG0y?=
 =?utf-8?B?bUl6ZTdUWUQvMzRqdUljZTNDT3NBdjZzRElCTlgzM0J0bi84TGhvN04vMUNH?=
 =?utf-8?B?VXprMnBCd3VzYlpOTyt4Yys5d0hNWTdiemJVMHpJRGJMY0o3c004R0o5V1Yw?=
 =?utf-8?B?Yy8wVU04QmxEL1ZpRllnL3ZUNGRVZzF6WUpDTTJaOE5MQXJzdFlWMFRBL2N0?=
 =?utf-8?B?bVh4aTVMRk9zcXFaNVppM2FGRWFBeDE2QzYxTWhxejVMc3I0Y2xOWXNIMW16?=
 =?utf-8?B?Vzh4SC9sYk53WFhXSTFmRUtmLy9EcnFzUS96ZDBrdnV3RU1GNnRyWDY5dWdq?=
 =?utf-8?B?TXJMUjRrUnZIeHEzbjlvZUliODdzQ2dVQll0dUdDcU1QRWlPUGx1VVNvNVZs?=
 =?utf-8?B?Yml5QWU1VDlIMlN2VGU0aTlrZnozK0ZzQzFwQzI5N3hpRDd5QS8vL3ZhcWZi?=
 =?utf-8?B?dytUcmk1cWlhejIxYzVtTkRSaFB1ZjI2b2FZN0Q0V0JMc0NpTW9qd3Q1aDNl?=
 =?utf-8?B?aDdVZ2FXVFBjV3FvMVdTVUhUbjc1aFYxbTB1L0daYjZsWU1sN2hEU1ZhZ0Ur?=
 =?utf-8?B?Nk0yVmNhY1hjbkhUdTEzSTh2SllqVWk1NHdlcTBqTzEzajdXb0hacVV0aGFX?=
 =?utf-8?Q?h22jg0z3stg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmcwQTZpd2RPSjVVaHpLbjdLSnoybVNZekpSTnNVQTFYeHBWamgyZHFRSTF1?=
 =?utf-8?B?QzlWRnE2aXBsTVZqOFlsK054MURWODBiWmk0aWh5VTVlOFFXWmQzWVJuNkc4?=
 =?utf-8?B?MGJ6KytIVllyQkdjVTkzUFU2TjZ2ZmhaK25kTFVkRHZrVksrMWZWeUwrMmV4?=
 =?utf-8?B?dmw2aVpIdjBRTlFDVGxYK3R5dXo2eis3MnJGQi8wd29PQjM5MWFDVSszbUV3?=
 =?utf-8?B?dXZ3S1dKcnRla01FdWxUczgydVBUSGlxN3dkM2tpNWlWcXVUc3FiZXhwendS?=
 =?utf-8?B?WFJYRXk5UnJMU1d2WTdoVEhycW9uMm84MVVVVEFCakJCYk5Gc21pS0xxZ08z?=
 =?utf-8?B?dnI3OXFGa0ZwY2FYTHBFRXBVYUJvaHZUM2hlM2JOYTl6NEdZdVZrWnJHTkVq?=
 =?utf-8?B?V24wTzJyb082czI1RVhOa1kzNjFpZWNxNVE0TWdCeDFSU3FpWXdFQjlIb2tH?=
 =?utf-8?B?dW41M3lDeHIwSXJEajJWdG1RaHBsc2Zud2o2L1lSNmVUMTExVXVva25GR3RI?=
 =?utf-8?B?N0ZnRU1oYTJURGZYbGpOVVVzc3lqcmppNS9pNGlNbEJiNGhCeXducnpwT01J?=
 =?utf-8?B?d2w4MzBRcWxaa3p5SXM2RFJNNG1FdWJvT1B4ZFBEaHJxa2F6MVBjUmRaU2JV?=
 =?utf-8?B?bkVuWHVOVGk1SDFYMkNyc1Z1cURpODQvZUpEWjRYMENMK1h1K0Z3cTdaVjdE?=
 =?utf-8?B?WXBYQzRoTnJySmVyNmN1S200RjNxN3Q1OGNUK091U0NQS3NHbVJFZ0w4U0k2?=
 =?utf-8?B?N1FOYkxYbkJLSjJMUEpkOW4yMlgvTitwV0VybTVYVEpZc1plVkZiZW9oNm9a?=
 =?utf-8?B?VzZ6RGNvaEY2azY2eEZ1aTYxQVN1MTJUK05ZbDQ4OERBMVByUWNoMnhvOUUx?=
 =?utf-8?B?OW1yMWxoM0VtdWMxRjE0dEdWRTRCQ0JSZ0srQVREYkxMVHZIMFZMWGZ2RUZH?=
 =?utf-8?B?cXNkVzgwd05GTndudy9MUVJEK09FTDZiQmtiN3JJWmszdWljblFsQWJsNFp4?=
 =?utf-8?B?NHBuTUNWeEZuaUk2WktTM1htK3VvM2tnUXBmdFJVeHN5QzlGMnlPRlpxUDlt?=
 =?utf-8?B?Z1hiamxyVXg2L3VyWXV1WVAyWVg4cms2R291SmFJd1Mrai9FeDNKMzh1SnUz?=
 =?utf-8?B?dXQwNzQ3UjdmdWE5MEhUSjdoZ1JxQjdiNDM4VEJmN0ZnOUpkUlAyMWNQdmto?=
 =?utf-8?B?OFQ2NGtzcDlxNHE3YkEwUUxMdTdKOGl4WW1DanhDM244eHhoYnZyNUNxNkhy?=
 =?utf-8?B?dTAwUlZwRVB3WUdsRkdmZHhSTDZ1bEovdFk4d1F6SXhjQmlDRnpNbU1yVkFn?=
 =?utf-8?B?Ym1ac3dvU2c1Q1YzV09SRG9mU3ZDbjlaYllyZUxpaTdURTc0V2crNHdmQ1pP?=
 =?utf-8?B?dzBCcmMweHdnK3IxNm90dmhVTi8zRk9ZS0VJY1IwTVdoQUIzY2Z3Rk92bERs?=
 =?utf-8?B?QW9iKytSUFJlYWJjdFdNNU9aemVXa3EveGNiVnQyTHJFT2RrQlI2Vm5TQzNW?=
 =?utf-8?B?aHlwTUhqbDVGU0NsUUFwOFlmajNSRHEyTkVnOUdGVmcrcWIyZVhIbTAzZUlR?=
 =?utf-8?B?cHRMK3d6Y2lpWlBxN0xwYktLaFNiT1QrK2x0MW80c0ZCOEJJZU0rNCtyN2My?=
 =?utf-8?B?dU9zQ3FkNmJTYW1tRzQ1UEtyelV5VkJIZUc1RWowT3ZEemJnUmR3NWxRV2NU?=
 =?utf-8?B?SWNYYXV2c0c2bll0MEgwc0pKdlBmUVNydDNwTHNBMm1RTXBFS3pMY2ZPa1o3?=
 =?utf-8?B?V1Z4Mk1qNnJFTlB0cmxIaGRFM3hWWXlqYzVyVXFtaGVSQytLZ2pkWm4razg5?=
 =?utf-8?B?NTM1OWcwM0FYUFFia0thZWRlaUhKQi9vWHpGTmhvbFBlY1JHYmFjOHFIRTho?=
 =?utf-8?B?ZGl4YUs4Tm85MFlXSXdZTmpDRFpKUkx3V3l4c0tBb2paTlBNMmE1ZmU3UGsy?=
 =?utf-8?B?Y2xIclVDUnB2Yy9pS0wwZ2VUUmRWaS9VSnBva2JzbTBDb2h4TElkd2JRTXdQ?=
 =?utf-8?B?TXdRM01FM1hWRWh6REg3NDBWbEpxdUdvQmxRVEg5d1BIVDlkVEdGaFJaaUZG?=
 =?utf-8?B?b1VDaXBoUkpEc3hSK0dXUmpFODg3ZEFrc25SaTRSUlJRdlg1bGs5ZEZwUjhx?=
 =?utf-8?B?Y2NPdmw1ck80cEpXeGU3NWJ4ZXltYzgvSEM0MzYxbHpNelp0bXJMT3JyQ3dF?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1acdec-cc66-49df-3cc6-08dd92fc41c0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:30:29.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOpcUVLP9N/WDOL5u7qnhFKawBVJsm2/z2l5HaIjv50w78dvjSxJKxza7dTEcO0eUy28QmNsT/C4dPbXskeuhU2AJISKUWmpR+XDdGQOu5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
X-OriginatorOrg: intel.com

Hi James,

On 5/13/25 10:15 AM, James Morse wrote:
> 
> I can also post the 'final' version to be picked up if that is less work.
> 

Could you please go ahead and post the "final" version? Boris confirmed
that this would work best with the tip processes and the series will be
considered if it can be ready soon.

Thank you very much.

Reinette
