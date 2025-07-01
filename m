Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0E275103;
	Tue,  1 Jul 2025 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387828; cv=fail; b=S+1ygjtcaxhDZs2DKYF1Z8e38J+ii8+x2Lf091SoWxbPvUARZYhJFZzH5QhuNo0aSs2wu9v3EOXdG/nEQw4W53Y0ApMWA0ZWkPLHd2myuqrUdEUlnEuSsQzj58ps6eb22UN59d3q4EATHx8f1/hPQwMW+x7GX1uRzpLtPhD85wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387828; c=relaxed/simple;
	bh=jHH0yOy3Zr5Mim9a0VKB/a9daLnd5O05PLISp62h0jA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t9eg7O7qs07GsjZ8fqnVIPtPG17BKZBZin4b9QNpL4flnHtYPFl8DtSJWvWg86lCmw9gApSZtMvHBTLi/lJdpg1Kb0ZZ8xrkSeLIgzgYlo2mrzagvO2L80QCYZ6SLbmxsDji66ISK3or3dZ/4QEyv0aSStAE10Xs8SSQgNyJzZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAfVAbBY; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAfVAbBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751387826; x=1782923826;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jHH0yOy3Zr5Mim9a0VKB/a9daLnd5O05PLISp62h0jA=;
  b=aAfVAbBYRgvGH4RWIkYPqDB2AW6dejrXtPbwet2Uet8qjc1g2ahw5V0b
   uh8l8KWX2iDZ1WbWY1DRqRdxos9DUtI2jHWOtscCrz5WCJOmAextqJGfi
   cwcXBi6sGmgkABG38JNo4KJHUJfLIdgqi+ajtQvudTwi4k1jA/+gVUaUD
   jxl5TrjUxLbGVLQDFP66X9ZGxKvG/GL6uTOhoLdsXGQHX0cqqdLF2AQ9K
   wrSkIjhrrceKLQ8LGdGSImCeSfJi7L7juFhEHNvxOvXvOoA+awRKhiG2R
   nEqC52SRob6RxIf1CiMfUSGkJF0XYxMhGIs90tYWNzqV1vkVUjfOasqOG
   g==;
X-CSE-ConnectionGUID: dAxKS29aRqC9YnsSyE7AfA==
X-CSE-MsgGUID: BwRDm5xZQQi0ir4qQUc7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64358932"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64358932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:37:04 -0700
X-CSE-ConnectionGUID: a3sO7r1+THy+WlJYA53eMg==
X-CSE-MsgGUID: vUzNahdeQeieYE7U8qO2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184865448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:37:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:37:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 09:37:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:37:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbqKofkc+MFT1p5GJy+7sqJCRdXluEWBaNvJ7mxe0vvmXcXhgaMpNYoGODUQKhucdAVnp+5PNl4lydFkxK/FF5U8Zd2TD46SxKJcylTfzco3F5qKECnvSsMl8IqMOyOb0keS2jqpfpxKyyowph2WOn5C64D0cVd+Pui5sSpxZgHXT7hyMgKKzH/7fhKCw9bB5tVFPz0jqkQMevQw24OWMZFrJJLkVAYsvL0OiBMxZ76wwD8O8WuuegsoiR4R4zR+uzTmALl4g1pndWQGa+h9Hvc190k3bXMuSEoHLNuFy8lhNB3UhAUp4UPczwUb4I5o+sOOv8Efk/xA1e/7ASukRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgN3D+p6BNBUkp4P/knOMqZCdTNo5ZErDMyZKU+rKe8=;
 b=kKZiDZ/v74Vff/KXnKgq9uSnyHzA85/gA0v9jYw5kfHHQfne8+mpdbpKxdrRpIIOcTAgu2L2ZvRFfbAgrH6FkfUrqDkm6SG71Su7jO3LUavV/nAwWIyDO0h6B9kQpY9h72LzBLF2RQfyc2t5fnwYjHUn2c12J8H001PpwlYXIGfDJjpcM0CAEbnwrWqNds+xrSXfJzhb7xtlnuWj9Bqe9mSE7uARez8yEVF8b4szMmm1K5qk1NmFg23c7CT73u2tihRi+1QVu3p6TV7rwlWaHmcMA+4NvydHgG99bwFRxl97OErmmshaEutaZycba85IeMY/3kutbeFl6wlvwlSeMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 16:37:00 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 16:37:00 +0000
Message-ID: <b09bd5f9-d029-40a0-a853-2a90ef969854@intel.com>
Date: Wed, 2 Jul 2025 00:36:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
To: Libo Chen <libo.chen@oracle.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Phil Auld <pauld@redhat.com>, Tejun Heo
	<tj@kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Aubrey Li
	<aubrey.li@intel.com>, Tim Chen <tim.c.chen@intel.com>, "Huang, Ying"
	<ying.huang@linux.alibaba.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, Jonathan Corbet
	<corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, Peter Zijlstra
	<peterz@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250625102337.3128193-1-yu.c.chen@intel.com>
 <706c24a8-125c-4902-bae8-82eea16ee2bf@oracle.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <706c24a8-125c-4902-bae8-82eea16ee2bf@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0101.apcprd02.prod.outlook.com
 (2603:1096:4:92::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aaf6e38-63de-448b-3240-08ddb8bd8046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGxsTWVaaE95eCtkTDYrNW5jd0VpdHd5UGZmd1pOWFo2MVhsTW5hWFBMWGxD?=
 =?utf-8?B?VEhZYmhQaGZvMlNoVWozSi9SajZXK3kxbUl5dENwK2Q1bVlRTHE0NlpDbm9s?=
 =?utf-8?B?Z21NRFNXRjkzd1liT05rR0J0dkxlSnlqSFFBL0ZYTjlkRXA4OVNxOFBuSERv?=
 =?utf-8?B?aVFDeHRuLzQ5M2YwVU95eTZ4V3l0cXMxNmRYQ01XUkh1b1lCdzhBNHBtYVlK?=
 =?utf-8?B?RDN1eGk1S0V5R2lsVzBrM1hTQXYzdVdpY0ZLV3VZMjhtSDNsc0piNUFjbnV0?=
 =?utf-8?B?eW8zT1V0SE5sYnNFM2U0RWkrZCs5RS8yZ000VE1XVEFCV3FtRkM4L09CODVY?=
 =?utf-8?B?c1JPZnZNTVlsckh3eEdMNjZSUTU4RXByOGs5MEhqaDlJMC95c0lyZU5pOFcv?=
 =?utf-8?B?TVVLQVZsUVlIQkdqaVRYRE5FV29VQ0ZvQy9IcmsxNk13aG5DTWxlSUhWeXV0?=
 =?utf-8?B?Mjl6K0xRbUZzY2lWTEdsNUl4NWJ3WlcweEZpUHJhWFYramhKZDVVeGRyNEJx?=
 =?utf-8?B?MUhSSkJNVEh4N0svb1hCNWF6Y2VqSUZ2cWllUUlYOXRLbjU0eGlKakJuOEtB?=
 =?utf-8?B?WjJLTkUwc1BmK2VpU3E1cllYNzZDV0NnVVhRUkZURkFrMnJwZGM3KzRzSzNq?=
 =?utf-8?B?VFNzaDB3bjFlT2ZXMndGNmxZR1pWcHJONVlVdlFTOXhpN0IvUi9xcjZNOUdQ?=
 =?utf-8?B?QThnbmpoVGpERENXdE9tdjNZcVdpR1pXRFVScTBYd3AxWDZra3lTNFdGMTdV?=
 =?utf-8?B?TUhMdnYxKzd5bHQ4NWxraUJFTDAweWF2V0tpcjF3dU9JMmt3Z1R0ckJjaUMw?=
 =?utf-8?B?NmVyRjFqY05hbDM2cytWTFJRY2VEWHJ6VmthM0YrOEE0Wkt3b3g3SVJsRzk2?=
 =?utf-8?B?b05TRTFQZ1JPMVZwdVovR2FoaHdNR2d5T25TNk9CbTRIa1B3YXpOMytaYTM1?=
 =?utf-8?B?ZFR1MXByT0RuQWRPWmZPRXY3VHRDWTFxWWQ5TmppSjMzZkVhU0FkZnVQTlZ5?=
 =?utf-8?B?NnI4QzBtN0lwLy9CNDFwcFVXRzhraXE3SWFGZ1FxUWhLSW96cWloYW00WEo3?=
 =?utf-8?B?RVhuU1NMRmZ5WWdaZHRyVld0U2p4K2IvSlBqdUxVTUR0TG5nTEVwL2M3dE83?=
 =?utf-8?B?RHZTZTJ2M2FTZXZxZFYrV3V0cUk2MmtVbmU2cGNXUTdvWGR5U3dkbjNFTDg0?=
 =?utf-8?B?WXRtWFM1K3MxVS9vazNkZjlrQmFZY3puRlp4SjJ1YzZkQVQ3M2lkM0J6ZFNX?=
 =?utf-8?B?YndKUi9ncVlzUmNJdTlRSTFLbUplbFBOUld3QVlDOEF0ZG5YbUJZUEJYMXBS?=
 =?utf-8?B?ZnBZOU9LOHkzTldYZ3JwSUNLKzNlaHpOcnNQWjdKVFg2bUZWL20rNFhMOVg0?=
 =?utf-8?B?VDM2Ni9pOVZRSkx3WjZSNWx6OXpkQ1E2VUYyQVZJV09ZcGcyKzllY3VUNWJi?=
 =?utf-8?B?M016a2JKTjdCTjBEbTl4NHdZazlaMlV0YTVHOHlGT2JiVUsxVVVBY3MzL2VH?=
 =?utf-8?B?QklvMm56S21OL0FIMDJFRGtERFdpNjVKNWJUalZmT2h6aXcrQ3Q2QnE1Tmxl?=
 =?utf-8?B?RkhnRkxVZ1FkbSthRU9NWGRleVlJdkdqQUFDVkgzTGwxTnBZaVR4Umxna0dN?=
 =?utf-8?B?OEhOTmtocWlBWVh5bUFSM1ZpeEhGMHJyZjdsd3dyWUdRVHIyeS92WDI3WkVD?=
 =?utf-8?B?dStEemZVbFMzNWdHUnRLOVdSQnBXRFFDWFJuRUJPamFMek8zR0Y0a3lzL3BH?=
 =?utf-8?B?KzZFTXlCeVpQcFBWL3VmTk1RM2FlYjA0Mk5rVTVsMFZaYlBCb1NZN0J2alZa?=
 =?utf-8?B?NDZlMjdXMW5lWkpKREtmYUJXZ3ovQjNLU0ZoeXJKMSs1L200d2Z4aElsbzk2?=
 =?utf-8?B?VlM0V01kUHp0Wm5ZZDZpZW9sczV3czgxamN2Tkx3b2hvU2ZvRXFNRlZJRFU5?=
 =?utf-8?Q?f748xAx+hzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW5rcXhBTElHRVdqbVlSRERqWS9jWHhOYkNBaERsMjE4WDlxK1UvL3k2d1pj?=
 =?utf-8?B?alNLeXhBTTZaZVliZUFibzEycWF4OG1aWkV2MFZURGJxUGJVanZoc1ExMFU5?=
 =?utf-8?B?U3VVcUVXeWppL014Rklkdkd3aldzTERwTEk4Ukl0ZjM0dGlEd0VMdEw1d0t0?=
 =?utf-8?B?L1Qzb1l4WDdNUDJNdG5lZEVMaWR0WGJ4Tjl2T0hGMTBoQTRFVFVCcDcxUHhX?=
 =?utf-8?B?azMvSVJrNkJnYzY4Ulg5OGtFaGYrZytpNlFZelExOElDQWE1Y1paWnpSV2FH?=
 =?utf-8?B?Zy9xaktoOU1iMXNXaWtlOGp4SE5wa3ZsTHNjSVp6eVhDcUdzUTFyOXZuZU9Z?=
 =?utf-8?B?MzZDOVdHVUZqVFRVR0dXWmMwdXoybHlmcCtZZlFLZWN0amR0Q0lWeGZkNm4v?=
 =?utf-8?B?Zk9LTHlQSWZ3Snlzelh1aXRDUW90MnliMGJ2M3kzM1dUeGtlejF2UDFlUFA1?=
 =?utf-8?B?c3hFYVZKTzQzY2JuekxRN1ZmNVBBY01uSjdRckFvQnFTV0tXaWxHRWl1V25X?=
 =?utf-8?B?Syt2Vm1rNnBMUjlmaFN5WW02QXA5WEkyakQ4Y01kOXhJRXVoSFRLekxCMDR0?=
 =?utf-8?B?ZlprUGM4N1pLSjdTaE85RnZodHFiZG0zSzRYWnhGaEIyZDkzdlBSN0djOWlQ?=
 =?utf-8?B?aXhoY1hYNEVHMnJWWVdkZ2VIYU1oRjNZSjZ1U25meHB6dTZHakVpdTd6N3dt?=
 =?utf-8?B?R2F0cTgxcy9CRFVGeXN6azgvcWN4UU9rbk85NnVXL3IrL3VVS2ZDeXowUWlp?=
 =?utf-8?B?SGFvY1BKSmZjbWhkT1RMVVNmR09Fc2JYRFo0eVhLMTVKUEhBSTlrQVRJcE9v?=
 =?utf-8?B?eURaZjllUzFxdUgxMkZ5SksvNWZGWlpxRFdYRjQ5TWkzZUpyN3daOUNGc0h1?=
 =?utf-8?B?NnBBUEdGckkxM1hrS205dW1SV00wMk1tampzOHk1KzJicXBjT0grSmQvNm1m?=
 =?utf-8?B?U1kzTnZTUkJFVVdpYVo0TDZGL3B5d0Rod3B3alY3MGo2Z1cycnlvZk0zWGN4?=
 =?utf-8?B?a2U1ODhDN3FTdEU0L1NLZENlSFNJeXFDcnJGMVllZzNzKzUvYnZsNncxNUVi?=
 =?utf-8?B?WFN2cVU5c3ZaVlZ0cmdpTUlrNG5OMmZHRU55MFJXK1U5WFhJQnVBemxySWVm?=
 =?utf-8?B?RmlySVA4Y0R2bkJDeXlYWCtFb1hKa3d2b0NwTTdlZUdSL2phK0hWbzl1emE5?=
 =?utf-8?B?VHJzVStJbC9lNWhVVmZMeEZlNzJKOVhxSzZCMUxXQjhKUDNhZnducGdRTGd5?=
 =?utf-8?B?Tm5kM1NmSzNETjBJOVVJNjA3bGJkYXJmeXNMelFQcE1LLyt0OHk2NHNEanpp?=
 =?utf-8?B?RFNObWxEN3BFd3pRdGk1OFE1bUFvR1h0T2RPRS9tMjVzVUJZcjNKdTE0dDRs?=
 =?utf-8?B?Ump1NDFXUzhHc0tIUGl0MU9ZVC8zdU1sa1VXeThJeHJlQVhCSWtTQS9YVDVL?=
 =?utf-8?B?UDRKKzZ5NTlDVWJ5akJ1QXBQdDJ4VFQ1UERsVG5FOEwzTW02Tkl5b2NhamhY?=
 =?utf-8?B?MGI0SU9WS1RsVUhuRHRqVkNOTitQMnl1MGlIQnZmTDdGS2daK0lxRlV1blNp?=
 =?utf-8?B?UDdjaTc1ZmRFNWFWc3kvZHQzZVFBWFhpR0VITWdDZmRHSUxtRmNkYjk3UjZN?=
 =?utf-8?B?UENVZm1VQVJHSHFQRkdWR2J6S09MdHM3cWZkQTM1ZHJKUER5VFE1NU9HWmRW?=
 =?utf-8?B?emQ3SmZsK3pydlh6dWpsK0xuSEovZGFiOFBxYm9mZGc1WHVuU1NqTjBnMG5m?=
 =?utf-8?B?cUNRcTNuYWtZZnMyeWQ1MUU3V0c1WGRlZzUxM3V0TERaQ3QvdXJESlBqRHFD?=
 =?utf-8?B?ajhwYmMwZC9xNjNka0IzUlF1N0k4bURpL1ZPZXlPMC9PSUhsRFh1Ly91U1RF?=
 =?utf-8?B?dUtodFp3Q1RJckdzLzJ6eXVONDY5VCsxd2pMTEVzWi9SZjBZbGtrcUlrV1Q3?=
 =?utf-8?B?SmVhVDh6VUZxV3lWSmd1TlpaU0Z1SXU0SnNQbHZ2d0xRakQrZ0piL2hPR0Rx?=
 =?utf-8?B?eTk0cG10TmtEdkRiQ0I1dVcvd3FhbUpHdHdmaElHUDJZSEtJelNzbHQxMXFD?=
 =?utf-8?B?WDcyWGtkVHpaOUtzREphVUNDeHB1UEhibzY3WG5SL0pDK3VFb09jZTJBYUo3?=
 =?utf-8?Q?bqXXJoEyaclLOMblttPAmgXVb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aaf6e38-63de-448b-3240-08ddb8bd8046
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:37:00.0710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5fbKX3nsGKdddh+FpHNM3O9vPTn1Vt+5sWp1l6yy+rGr6evkxZ9ti/DQ+KprmvHFRJACRbS7waTcGBcCcM5Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
X-OriginatorOrg: intel.com

Hi Libo,

On 7/1/2025 4:25 PM, Libo Chen wrote:
> Hi Chenyu,
> 
> Thanks for the patch. See my comments below.
> 
> On 6/25/25 03:23, Chen Yu wrote:
>> [Problem Statement]
>> Currently, NUMA balancing is configured system-wide.
>> However, in some production environments, different
>> cgroups may have varying requirements for NUMA balancing.
>> Some cgroups are CPU-intensive, while others are
>> memory-intensive. Some do not benefit from NUMA balancing
>> due to the overhead associated with VMA scanning, while
>> others prefer NUMA balancing as it helps improve memory
>> locality. In this case, system-wide NUMA balancing is
>> usually disabled to avoid causing regressions.
>>
>> [Proposal]
>> Introduce a per-cgroup interface to enable NUMA balancing
>> for specific cgroups. This interface is associated with
>> the CPU subsystem, which does not support threaded subtrees,
>> and close to CPU bandwidth control. The system administrator
>> needs to set the NUMA balancing mode to
>> NUMA_BALANCING_CGROUP=4 to enable this feature. When the
>> system is in NUMA_BALANCING_CGROUP mode, NUMA balancing
>> for all cgroups is disabled by default. After the
>> administrator enables this feature for a specific cgroup,
>> NUMA balancing for that cgroup is enabled.
>>
>> A simple example to show how to use per-cgroup NUMA balancing:
>>
>> Step1
>> //switch on per cgroup Numa balancing.
>> //All cgroup's NUMA balance is disabled by default.
>> echo 4 > /proc/sys/kernel/numa_balancing
>>
>> Step2
>> //created a cgroup named mytest, enable its NUMA balancing
>> echo 1 > /sys/fs/cgroup/mytest/cpu.numa_load_balance
>>
>> [Benchmark]
>> Tested on Xeon Sapphire Rapids, with 4 Numa nodes. Created
>> a cgroup mytest and launched autonumabench NUMA01_THREADLOCAL.
>> Each test runs 6 cycles.
>>
>> baseline:
>> 29360.56user 16280.68system 3:33.29elapsed
>> 29788.41user 16060.31system 3:34.38elapsed
>> 28307.51user 17043.45system 3:33.03elapsed
>> 29552.49user 16307.65system 3:34.20elapsed
>> 29847.41user 15966.15system 3:34.65elapsed
>> 29111.10user 16532.78system 3:33.19elapsed
>>
>> per cgroup NUMA balance:
>> 7589.78user 16494.90system 1:53.18elapsed
>> 7795.54user 16537.65system 1:54.11elapsed
>> 8295.66user 16391.21system 1:55.98elapsed
>> 7836.34user 17312.31system 1:55.71elapsed
>> 7773.26user 16856.19system 1:54.08elapsed
>> 7534.43user 17604.58system 1:55.01elapsed
>>
>> The user time has been reduced to 33% of the
>> original, and the elapsed time has dropped to
>> 45% of the original (lower values are better).
>>
>> cat /sys/fs/cgroup/mytest/memory.stat | grep numa
>> numa_pages_migrated 10238503
>> numa_pte_updates 24378124
>> numa_hint_faults 16921590
>> numa_task_migrated 253
>> numa_task_swapped 4
>>
>> to-do:
>> Per-cgroup NUMA balancing should consider the
>> hierarchy of the cgroup. Initially, NUMA balancing
>> is disabled for the root cgroup. A cgroup that has
>> NUMA balancing enabled should have all its parents
>> enabled. For example, suppose cgroup A is the parent
>> of cgroup B; if A.numa_load_balance is 0, even if
>> B.numa_load_balance is 1, NUMA balancing for B is
>> disabled. This idea is derived from
>> commit e39925734909 ("mm/memcontrol: respect
>> zswap.writeback setting from parent cgroup too").
>>
>> Suggested-by: Tim Chen <tim.c.chen@intel.com>
>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>> ---
>> v1->v2:
>>
>> Add documentation in Documentation/admin-guide/sysctl/kernel.rst.
>>
>> Add comments in tg_numa_balance_enabled() to explain that
>> the newly introduced NUMA balancing mode is naturally
>> exclusive of existing NUMA balancing modes. (Tim)
>> ---
>>   Documentation/admin-guide/sysctl/kernel.rst |  6 ++++
>>   include/linux/sched/sysctl.h                |  1 +
>>   kernel/sched/core.c                         | 31 +++++++++++++++++++++
>>   kernel/sched/fair.c                         | 28 +++++++++++++++++++
>>   kernel/sched/sched.h                        |  3 ++
>>   mm/mprotect.c                               |  5 ++--
>>   6 files changed, 72 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>> index dd49a89a62d3..ff88d1153c19 100644
>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> @@ -709,6 +709,7 @@ The value to set can be the result of ORing the following:
>>   0 NUMA_BALANCING_DISABLED
>>   1 NUMA_BALANCING_NORMAL
>>   2 NUMA_BALANCING_MEMORY_TIERING
>> +4 NUMA_BALANCING_CGROUP
>>   = =================================
>>   
>>   Or NUMA_BALANCING_NORMAL to optimize page placement among different
>> @@ -729,6 +730,11 @@ different types of memory (represented as different NUMA nodes) to
>>   place the hot pages in the fast memory.  This is implemented based on
>>   unmapping and page fault too.
>>   
>> +Or NUMA_BALANCING_CGROUP to enable the per cgroup NUMA balancing.
>> +This new behavior can be opted-in/out on a per-cgroup basis via a new
>> +cgroup CPU subsystem file named numa_load_balance. By default, per
>> +cgroup NUMA balancing for each cgroup is enabled.
>> +
>>   numa_balancing_promote_rate_limit_MBps
>>   ======================================
>>   
>> diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
>> index 5a64582b086b..1e4d5a9ddb26 100644
>> --- a/include/linux/sched/sysctl.h
>> +++ b/include/linux/sched/sysctl.h
>> @@ -22,6 +22,7 @@ enum sched_tunable_scaling {
>>   #define NUMA_BALANCING_DISABLED		0x0
>>   #define NUMA_BALANCING_NORMAL		0x1
>>   #define NUMA_BALANCING_MEMORY_TIERING	0x2
>> +#define NUMA_BALANCING_CGROUP		0x4
>>   
>>   #ifdef CONFIG_NUMA_BALANCING
>>   extern int sysctl_numa_balancing_mode;
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..8e9aa59193df 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -10078,6 +10078,30 @@ static ssize_t cpu_max_write(struct kernfs_open_file *of,
>>   }
>>   #endif
>>   
>> +#ifdef CONFIG_NUMA_BALANCING
>> +static int numa_balance_write_u64(struct cgroup_subsys_state *css,
>> +				  struct cftype *cftype, u64 enable)
>> +{
>> +	struct task_group *tg;
>> +	bool was_enabled;
>> +
>> +	tg = css_tg(css);
>> +	was_enabled = READ_ONCE(tg->nlb_enabled);
>> +	if (was_enabled == enable)
>> +		return 0;
>> +
>> +	WRITE_ONCE(tg->nlb_enabled, enable);
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 numa_balance_read_u64(struct cgroup_subsys_state *css,
>> +				 struct cftype *cft)
>> +{
>> +	return READ_ONCE(css_tg(css)->nlb_enabled);
>> +}
>> +#endif /* CONFIG_NUMA_BALANCING */
>> +
>>   static struct cftype cpu_files[] = {
>>   #ifdef CONFIG_GROUP_SCHED_WEIGHT
>>   	{
>> @@ -10126,6 +10150,13 @@ static struct cftype cpu_files[] = {
>>   		.seq_show = cpu_uclamp_max_show,
>>   		.write = cpu_uclamp_max_write,
>>   	},
>> +#endif
>> +#ifdef CONFIG_NUMA_BALANCING
>> +	{
>> +		.name = "numa_load_balance",
>> +		.read_u64 = numa_balance_read_u64,
>> +		.write_u64 = numa_balance_write_u64,
>> +	},
>>   #endif
>>   	{ }	/* terminate */
>>   };
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 7a14da5396fb..dcdee3bf9960 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -3161,6 +3161,29 @@ void task_numa_free(struct task_struct *p, bool final)
>>   	}
>>   }
>>   
>> +/*
>> + * Return true if the NUMA balance is allowed for
>> + * the task in a task group.
>> + */
>> +static bool tg_numa_balance_enabled(struct task_struct *p)
>> +{
>> +	/*
>> +	 * The min/max of sysctl_numa_balancing_mode ranges
>> +	 * from SYSCTL_ONE to SYSCTL_FOUR, so it is safe to
>> +	 * only check NUMA_BALANCING_CGROUP because it is
>> +	 * impossible to have both NUMA_BALANCING_CGROUP and
>> +	 * NUMA_BALANCING_NORMAL/NUMA_BALANCING_MEMORY_TIERING
>> +	 * set.
>> +	 */
>> +	struct task_group *tg = task_group(p);
>> +
>> +	if (tg && (sysctl_numa_balancing_mode & NUMA_BALANCING_CGROUP) &&
>> +	    !READ_ONCE(tg->nlb_enabled))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   /*
>>    * Got a PROT_NONE fault for a page on @node.
>>    */
>> @@ -3189,6 +3212,9 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
>>   	     !cpupid_valid(last_cpupid)))
>>   		return;
>>   
>> +	if (!tg_numa_balance_enabled(p))
>> +		return;
>> +
> 
> I think this one may be redundant when you already have it in task_numa_work().  Without the
> scanning, there won't be any hinting page faults on that task, so neither do_numa_page() nor
> do_huge_pmd_numa_page() will be called. Though it's a minor issue if tg_numa_balance_enabled(p)
> is fast.
> 

Previously I was thinking of the following sequence:
1. the NUMA balancing is enabled and task_numa_work() is invoked,
    pages are scanned and PROT_NONE is set.
2. cgroup NUMA balancing is disabled by the user
3. do_numa_page() is triggered and PROT_NONE is cleared.
    We don't want to do further task migration and
    task_numa_fault() bails out.(page migration is still
    allowed as we mainly want to control the behavior of
    the task)

> Overall this is good. But more generally, I am thinking something finer-grained, like per-task
> numab control with numab tunnables at task-level (if possible), that will be so much more useful
> at least for us. There are use cases for controlling numa balancing at task level as applications
> tuned for NUMA (that don't want numab mess with their tsk/mem placements) such as databases can
> be in the same cgroup with other untuned applications, or not in a cgroup at all. Right now we
> have to turn off numab globally but that's not really optimal in a lot of cases. I do understand
> your use cases for per-cgroup control, but I wonder if there is a way to nicely combine them.
> Per-task control should cover per-cgroup control functionality-wise, but it's an inconvenient
> interface as one has to set for all tasks of the same cgroup, 

OK. Michal has also suggested using the per-task interface
(prctl()/sched_setattr()) for NUMA balancing instead of per-cgroup
control. In theory, I think it is doable. In a cloud environment,
users can set the attribute (enable NUMA balancing) for the first
process of a cgroup, and later child processes will inherit this
attribute. But yes, when the admin decides to change this attribute,
each process of the cgroup has to be iterated.

> I haven't thought too hard about
> it yet, just want to bring it out and see if we can work out something together.
> 

Sure, let me have a try on this per-task version and we can
discuss/co-work on that.

thanks,
Chenyu

> Thanks,
> Libo
> 
>>   	/* Allocate buffer to track faults on a per-node basis */
>>   	if (unlikely(!p->numa_faults)) {
>>   		int size = sizeof(*p->numa_faults) *
>> @@ -3330,6 +3356,8 @@ static void task_numa_work(struct callback_head *work)
>>   	if (p->flags & PF_EXITING)
>>   		return;
>>   
>> +	if (!tg_numa_balance_enabled(p))
>> +		return;
>>   	/*
>>   	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
>>   	 * no page can be migrated.
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 475bb5998295..4b0dc656688e 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -485,6 +485,9 @@ struct task_group {
>>   	/* Effective clamp values used for a task group */
>>   	struct uclamp_se	uclamp[UCLAMP_CNT];
>>   #endif
>> +#ifdef CONFIG_NUMA_BALANCING
>> +	u64			nlb_enabled;
>> +#endif
>>   
>>   };
>>   
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88608d0dc2c2..c288ffb92bfc 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -155,10 +155,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				toptier = node_is_toptier(nid);
>>   
>>   				/*
>> -				 * Skip scanning top tier node if normal numa
>> +				 * Skip scanning top tier node if normal and cgroup numa
>>   				 * balancing is disabled
>>   				 */
>> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>> +				if (!(sysctl_numa_balancing_mode &
>> +				    (NUMA_BALANCING_CGROUP | NUMA_BALANCING_NORMAL)) &&
>>   				    toptier)
>>   					continue;
>>   				if (folio_use_access_time(folio))
> 
