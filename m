Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA317AE11
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749011224; cv=fail; b=n9JLXnN1fvW0ax4uNKjfIvTtiUyhxpGueowIBZcQk0QRbu4jSQQg3QHLX8IRNcpd4XhAv8UUXJZDs2rBu4Zdnev/gVZrTWLp5uG42V8SqoHtQpJHRGLONcnJN3U9SFRseUDYYGZyscCXZl8WIEIIDM5D/WStUibnNgoBy37GAjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749011224; c=relaxed/simple;
	bh=Gw3lSA4WXOavm2Lzj1UzlFr8/xbTFcAuQNmdTqMLMVo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ne+TuhzSjyFUCthDzuiKL3uyWd5I8FTpprTj0JXbrITPZBluuKgKggIuZU14RnYbHu2zIhITLbbTHdNMQVb3AKkGXjZq4stGz3h3UNx8ziLWaVrKWQMicHfWtllLBDS2Y8LPGBTcXmRBjnadHQmc6pdUfZQc3ctYXrPJ8IdJA9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHmnqRJr; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHmnqRJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749011223; x=1780547223;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gw3lSA4WXOavm2Lzj1UzlFr8/xbTFcAuQNmdTqMLMVo=;
  b=YHmnqRJrv8ikHBVZmygGm1z/1Eh56jlbbKq5P8kZqVEyql8BkhhDf/ke
   J4ZlNjRqhqpXi5hNv+B8ncpqo4tfNCl8zq4bTieZE1rpyl10+Vya7TLjD
   rEUmJJhTRGnXVYg5tUmoEzOUQxNyIpXjvtHrpoFOQ1F9FWgzh+bmKj3dq
   fKRJfYHK3xUPwuSI6dc0ou0OXqrV2J6/2YslzDC4AEFnzwnEXNd6cPsr0
   nCg3QoN7a5c62G3zVhwOg8DV4Gb5ittejYvdsO4VudzcJ6UEpYRfQW8Ix
   Q9X6VFnu9eWsm9pom0MvBsqEtNEIH27f4CU0LSOTxODd9UmZ25d1AQ48f
   w==;
X-CSE-ConnectionGUID: O0BZ9R0vTFS3whYgzhBiLA==
X-CSE-MsgGUID: 6GpB13QQTUKKBTNE5XTuuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51072617"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="51072617"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 21:27:03 -0700
X-CSE-ConnectionGUID: C9Xnm7GTToSREEaOpo55xA==
X-CSE-MsgGUID: Q8+G26O6S8iXPdh9gp5jiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="145022681"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 21:27:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 21:27:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 21:27:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 21:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT6YDXmjWwRSICOdn/uxAr/e7boa2BJ9m5IR/oMIp6PwKUsJxYO9r+93k6RyxeCxa0au/L/kfAqRU7VA/Tg7UAFRT9VeCCjmX26+uOwSvVgE7xp8iZ2OH/dy09psWo0djIsWwVsVSRhCDBYJafrbr5Qd3ptXiea9ao3PLxZNBkynaOW4eBoFSqQUUd75TATNR5Ps49aAkr6omRmPJm+lX0NqjdTbU8IJHenFDg/bPDhAdEIjXPt6C0HO++KPJ8xm6aEj1+ToeQCGmx3rhId+Y//9DpabvjsprH7TlzLdt/vlEFLQUB5fRyQWY2iuO+PMcfDBkT+DuqNOU+Tov8YFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ2A0zzigtBPHOuABfdxky+HhnhQh3IxoDO2/7hKbiM=;
 b=ZDfOGNgCjiy39fTrP4Lw6AqGxjC84pDVYnp9dyu9nKuEkbxXTTmzDTCUDzXqXBwjqkmwtECKJdXUnKtvNSB3TE6j0jFapAnJHKiSlYqqsz31cHL84Tb/mzgbTiXUGvzNtcJXNM464PPt2OurQHZDnOeU3DgpPMYV7yHXiJa/RklIpBHPE2NN1tNreq3R6uMl8FJTeB6ImKIj+4mvq0dXFcez0E+QFK1fvOxM8fnz+ME3DmfWnLRGuDBCgg0qC+2+G1f34PJUSrJGhKRTAgV8VcKqhCtBXYAFQeramlRV6ldnhsuuu/tIttMpymKuKPs2LGsLntzfVLS+MyLeaqIWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Wed, 4 Jun 2025 04:26:32 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 04:26:31 +0000
Message-ID: <b38301cb-6d8a-40c5-a84b-c59711ea1548@intel.com>
Date: Wed, 4 Jun 2025 12:26:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Tim Chen <tim.c.chen@linux.intel.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>, Doug Nelson
	<doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0213.apcprd06.prod.outlook.com
 (2603:1096:4:68::21) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DM4PR11MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: e53d9d81-5d5d-4616-1454-08dda31ffb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2gzSnlBWmxrdUoyV0tnOVE2MGFQRVVydE1KQ0hhd3VpTFFKcWZjdnlVZUpj?=
 =?utf-8?B?QkFiZi9EdFBYZzA0RGRaQnJwNXVDaG0rQzBZMGZTR1F6ZkYzUHp2VzJsSllv?=
 =?utf-8?B?akc1ckhHTEIraDBWZlFYNEtvRE83VE1RY1J5OWQ0RENjd3pRaXA5SnRTTXRD?=
 =?utf-8?B?ZlZZZ3dsRFE1N0RoVG9ib1NtTTgxbXF6Vk5SWTNIWGZTcEd3Tk9IblZiSFhx?=
 =?utf-8?B?dXl3WFhtYkN1SnlOQW5haTN4Zkdwbnp1UWk0QUNpck41Qm8wbmlxNUpWZFR3?=
 =?utf-8?B?TGd4NkFJQ1JxSTQyUHUrTzYvNUJiRkRveUxvQXR6T0RGdGRreFRtaHhLWnVB?=
 =?utf-8?B?WU9KNUpqcG1Dc3RFOWR2R0pQNk1GTnNKU3hmblVtVU5tUHZ5eEJaV292RTVa?=
 =?utf-8?B?RGZxand3bm4wZlI1WmUzMGFzTmQwTGxEMGZHb2RURyswaTZCc0pKenBFTm9U?=
 =?utf-8?B?c2ErUmZUSkpwbFJGZTFiWjllc25IVkMrMENxK2d3VXVCa3R1WFlzQWZmY1dJ?=
 =?utf-8?B?eHJqdUdQS2JzM2ZEUGx4TWtRVG5NZWhlVHNQM2pEZ21lZG1JMnVBMWR1ZS9l?=
 =?utf-8?B?ekpNNksxdjMrMTJKemM1UXFENlMvTnFLWnhaRU1YV3hYeXc1eU55aUtQU3k5?=
 =?utf-8?B?SmZ4bVZxMDJ3S1ErNURyVE8xNDVjV1I3Zy82MjlVTzE0d0prK2VwM0h1Tk1D?=
 =?utf-8?B?YnBrS2lxYWhPZndJWFYyKzBBSFFWRDRQdTR1VWIzTUJQMFZ5VEtyVGI0SHVE?=
 =?utf-8?B?YXRVREhhdHVjR2d6Y1lCWjlxU3lUL21DVmt6NjFnb0RidEUzRml3NHBwaDNQ?=
 =?utf-8?B?aExzVS8xLy9kMnZSZkhaRkk3K25sRjg1YmhmK0tZakxNeVFtNjYzeGFuTERp?=
 =?utf-8?B?a3FKU2tob2gycS94VmNZSjY0TExEYlFkRlpMQnVMaVRDbFdEY0g0d0IzTHFn?=
 =?utf-8?B?T3d2M0tjRnZSUTBuaUdmK29UNHlIbFpkWXl0ejFmbW52allUZ2ptaFlBczBE?=
 =?utf-8?B?REE5RjRRWXpMN0h2RW90VkpNVEdnSHV6YkU3UTBJblBmYjIvOERiSFpKN2F4?=
 =?utf-8?B?R01zNlBoQXJFTlcvM2xpcjZDYkJ4cHlKaTdXVFBBUUNwaGo0TmJtMG1mN3FL?=
 =?utf-8?B?SWZKVU9FTVdtdVo5ckxGZll6MkNVTjViOGk5U2RlZUV6SHhQdTNEUGM1dVNr?=
 =?utf-8?B?bkdWZFZNOVNRQWtEZUtUTU1Gd3pDR2hrcUtqR0F5Y29SRFNaOUNlRFJ2ckNC?=
 =?utf-8?B?anlabzdWd2RmVVVyL2tWNXdVb0EzVkRST2F5OXZ0SkVia1Nmd2lmTlBOczdv?=
 =?utf-8?B?MWMvK3hRYnN0bW13UUJteHNXUkI3R2M3aDN5c3k1dUdoT1JlUFNKMUo0Wm0r?=
 =?utf-8?B?Zmg5UU82cDliTVRsSFg0QTMvMWVIZ0luenJxdFZEakV3L2tFSVZCY2I1eW5v?=
 =?utf-8?B?Ly9wUlBuTWxPMDlrT2pxSnBoa25icTFmMWtkYkt3ZitFMERlS3orcU9yNVRJ?=
 =?utf-8?B?QVovNzNocjBqZjRuRC9sK2dWSEhvMEY5MzlvczZJRHFWcUdwMEluM1NsWmQw?=
 =?utf-8?B?cGNmaS9qUTNyektwK3pNWmkzZDNSQ2syQUI2QjB5aTJaMGRaTWJ2RGRZTHpW?=
 =?utf-8?B?Ti9lVVdPbzRmWEZHT3NKUkkvQ1BLVlJhdnRkS1pUbkdsYlM3OWp6L3BRSFZz?=
 =?utf-8?B?T2dGY1ZPMUhDQzZSTFhLcnl2eHoyNDBuZzZMZVNNZ2JzTUNmaXY0M0tWN3p0?=
 =?utf-8?B?QTBaMXV5OVpURGJqa1Z2bGN6NTNDd25ubjJJNXgvR1FVOHZ5T2tHV090SE1p?=
 =?utf-8?B?QnRpdjdycnkrbndFVm13TVBFQko1d0lQYWVKVTM1b2l2akZBQUR5bkNtaTI0?=
 =?utf-8?B?RE5TRHBHYittVnVKSlJGQUZ3N05kc3gyM2k0d1FLRTdubnZOQi9lSVRjeDJk?=
 =?utf-8?Q?kkpjpov1eno=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1zR2hReWRZT2ZIcUh5MXkwdXpETDVCRUxaWllXNmtsY0FOZHFwSFpoOHVm?=
 =?utf-8?B?N3NqdVZrcDhkZWZYNWVSUHdham00WjNKUDZkNlZVODFRalBtZDVydmc3TW9m?=
 =?utf-8?B?U2Y5S3Qzbm52NlNVQWJJZmhTRHA5RmdSZ1RvektkU0VOT3RrMlFaNnFjamNB?=
 =?utf-8?B?WmRaVDh6anBqeSthU2RWM2daUmdicFhHQUo0UWRtbnU2VDhqUS9HZVlsUmQw?=
 =?utf-8?B?RVVlb2RrbnlFaFUrbTZHbnZtcnU0VnAxUm8yYklicEE4QjhLaDgrdmVId2lp?=
 =?utf-8?B?ZjBST1QyMlAzMnFMNG9uZkF6L3RvM1NwTHhqVnNQMnpiamZJSjlaelFhaExp?=
 =?utf-8?B?V3psbkMvbHhPTEhQN3MxcnR1ZEVDd0lhRURWWEZJZjUvbW1hTW1iQUhxZjR0?=
 =?utf-8?B?TXlSOThHS1R6ZW83ZjVSdTNGdU04TCtmTE5DK0NwS2xUNndjTzhSUFA1aGp2?=
 =?utf-8?B?QVJoR2t1bldCMS9ibTBjOUo5ajBvNmlLZWJTZ0JUMUVveFc2aFBKeEw1cmpL?=
 =?utf-8?B?Q2hrRjQwYjR6aEExb21GeDhQQjZHaFdtOHlQL3YrbmdzVkdlVEhNWUl3UE4v?=
 =?utf-8?B?MUpkZzhLMFR6VVhaeUhSaHRCRStrWXBEQlZZalp6aFNjZklGTlFPRWMwc3ky?=
 =?utf-8?B?SDIvczhta09wSlRXbkFiUldwYmFMalVXRE1DYmpIeFJNQzBuV2ppUzEwODZx?=
 =?utf-8?B?Q1VZOFg1eWFJakEvcm91bTdYUXBVZ2Z4MlNnMEZwSm14OG1ZVDIxL2pmQ05E?=
 =?utf-8?B?V085RVUzSWMwVlpCTDBNVS9QTlFJdXVYeUFTd1NUbFhQbWh3c1RMM3JFNyti?=
 =?utf-8?B?NUhidnFMb3BkQUhQTG9mQkxrTDRZK1duandrUG4zNU90bm52QW5CQ3FTRWw5?=
 =?utf-8?B?S1RqdHhKTHRQMitVdnBZclJGRmU4YUtJRVdiN3hWcExHK3NkcVlQbG1Xc0l6?=
 =?utf-8?B?a0VSeVllU3gyRDhWSVVwaDFETGRXTTBBVE80aDBrSmJkMVdvYkNGaDhhait2?=
 =?utf-8?B?a2RLZE8ra1hDNWppTVdrUldhTGZKcHY1NjIyZnRhL2Z0Nm9ZcnpIZ0VldnI3?=
 =?utf-8?B?Q0lXMkxxVE9XVHNGcWFZVnFiWEppK3NTajVldTdVL2xJSVVna3BDV1RRNEIr?=
 =?utf-8?B?SGhLZWJHRFR1cDJ1Y3JJL2I3dTVDNng3N2MvOERZRXJveVZmaG0xMVBBRzBa?=
 =?utf-8?B?VUJBYmNWY2REYUN5TXBvb1pob1pBTzFjNVdqYi9IUXJIdnZsekV6eWxMQVl5?=
 =?utf-8?B?Sld6M2ptT3VBTUpTcS95ZExvdFd3RW1FRTJ5TWh3NHlraTlXUENYd0NVbjVG?=
 =?utf-8?B?cGhRQXVrNGc5cGNVQ2UvbnlrZ1poSENCL1doRzYzSzNMVjhtM0JWR3E3QkVR?=
 =?utf-8?B?cDhNWkFhNlNnVTkvRGMxeDBzRlNsaW11aFJjZ0ZlMTB1RmtoYnV4OW5JTzI4?=
 =?utf-8?B?VUpkWVpCOEhDaEppK21ITXdxajEwTE1vWTRIVTVQMTlnOGxVODYwcDNlcWpp?=
 =?utf-8?B?YkNmQkZDYzVMY29pY1Uyc0FBZlRJVHhhVzBnaFB2bnFmMFJkWlRLQW9xZzhV?=
 =?utf-8?B?OUxYMTJCQ0UyU2hrQVJWR1Y2dFpMeWZWa2NBT3FRZTJUVkpUN3MxVlJGc0E1?=
 =?utf-8?B?bzRQQnJrVUN0TkNmb2JyeGRlNitKZnFuT050dG90a3lzamhqWDhCTHFMcVp1?=
 =?utf-8?B?SUprb3hpc0FuNzhWSEVTdjNtdjFiZVJsSUEwd1hkTmUxQlRHSUY4L05XRzM5?=
 =?utf-8?B?Rjd2MEFiM0tUbGFUNGxjUWZrNGJKY3BpRTFobEpMRG41R0dMZjBrSTV3V3ZN?=
 =?utf-8?B?ZzJDSE9lRTNMY0NEem5sU0lDbVczejFESHplSFk4ajdtQ3F3d2RHUWhhNXQ2?=
 =?utf-8?B?dXh2N0FRb0RiU0d1bDNic3FRQ0VRbUdhWWRVMm81eWdYMUx1NEhDOVY5U0do?=
 =?utf-8?B?a1FRMUlUSU9zbFhRQ3ZvOS9RYjNaNUpZZ2hDWFlzczRoRStlQzNxdmRoVXI4?=
 =?utf-8?B?anFNRG51UmJoWitwUFg1TUxTV2tFK0JPY09iY3QyQ3BxdjY4RVdvRG9oOU5y?=
 =?utf-8?B?UFZLZVB2amdteWdtcnFzazJWN2FDUzN6VW1LNkFSWVA4azBxaGlFOGJxM1VM?=
 =?utf-8?Q?A/2NiN0c+SrwjVg1Wqd2LeAoO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e53d9d81-5d5d-4616-1454-08dda31ffb63
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 04:26:31.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCOFxSWV0QUYJnfpgzBc6jv/unmYO0vYBUWkjbQG+F0t8pdnHiuQ+4qa59rJjJUEJYzKcSaXZsg4MmlELbpe7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
X-OriginatorOrg: intel.com

On 4/16/2025 11:58 AM, Tim Chen wrote:
> At load balance time, balance of last level cache domains and
> above needs to be serialized. The scheduler checks the atomic var
> sched_balance_running first and then see if time is due for a load
> balance. This is an expensive operation as multiple CPUs can attempt
> sched_balance_running acquisition at the same time.
> 
> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> sched_balance_running.  Most of the time, a balance attempt is aborted
> immediately after acquiring sched_balance_running as load balance time
> is not due.
> 
> Instead, check balance due time first before acquiring
> sched_balance_running. This skips many useless acquisitions
> of sched_balance_running and knocks the 7.6% CPU overhead on
> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
> improved by 11%.
> 
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
> ---

This change is straightforward(simple enough) to mitigate the
costly atomic operation, it looks good from my understanding, so:

Reviewed-by: Chen Yu yu.c.chen@intel.com


thanks,
Chenyu
