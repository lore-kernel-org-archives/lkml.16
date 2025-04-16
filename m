Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA921D5BE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769339; cv=fail; b=LwGiAEe5hocKxClUlemkom2w1yTHOyatnHIMVqVJEBZFCPn8apsFGAaB1W8JDh3DyZsCv7o37AvqCy97TZNtuDOa1RfXuwiboNc08Q6XL7dRZ4o8InoGWNkAyxSb7DkkKUz30YgVC2EBgwxz1fz/yC6oD6FuJyJSoW2uc1uI0hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769339; c=relaxed/simple;
	bh=XX+NQfKmnN3yjd9Ry/NWGVO+9aebs27xnq66EM62XfU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XzFlt+ZfDTONJdq20tTOE0EzJyVjoDWxJkrN8d+ISPA8DJRCBVbTetPSBS47QvzLbfO2vXJFBRSebFQyrtEWiosJCdz6OacP05yW5daH/xz0NuW2NC8Kd9EytkvRiwVuG1PA5qw7N+48lAvn+THVT2TQTLxuZryGU/zoAHbVU48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbBxcb9d; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbBxcb9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769337; x=1776305337;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XX+NQfKmnN3yjd9Ry/NWGVO+9aebs27xnq66EM62XfU=;
  b=cbBxcb9dOm9OtlXFF1Wws50h3QtVgUxMDQXYEF9fIj7hfUIl3OaS74AE
   2jISUeymyaXLSRz0qBzQk/DI+O56/CQcnxXBh+eFk3fgLz+YbKfMRhcYz
   8rsiItgTMuz4Zuj9oLPyelKzehmVBdpn37jnHzXn+TjwPBzdQn1Qfl33x
   sa3ZTWrQu+pUCotNbnqEBZp6Dm9cZbaK+eTZgTGpqEKjQU+MK3mp63jsz
   9tV8mXsG6LSNCWFkKPpSVI7Tl/1nxZU5u2CKVuoSFonkiUpJJBiF/OUXJ
   6OME8J7yB/gFoSAFz6wdjlC+MuURz7XL/TII6SDi3auRPcbNe7NvUG/ft
   A==;
X-CSE-ConnectionGUID: NaWMUhkuSzWl2/jaTostNQ==
X-CSE-MsgGUID: IWTJel4rTaWE0wlR8sn27Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71694709"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="71694709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:08:56 -0700
X-CSE-ConnectionGUID: 6E1ssgiBQZynhSD1e8lgtA==
X-CSE-MsgGUID: jY+WKm2EQ7q4klPgo6vwaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="131204958"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:08:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 19:08:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 19:08:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 19:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFWsjOGLnzVnB3JYRZH9udHA+PKi5In/N+iHrRe/dIRMJGKjrJbpFTats/SaCnTYUm7e3GZYh9CmhVXHGpxrLLD+cJeHYtaAfKLpGTi5ZgvI6M6qOV4CGgnGWG/siGl3bGjc8bHxebCNS2Kr3clfWdc0zT1QCPzjzzqxi8YS0LZ/fdA0kTgxF2TKpIFXuXNvLBGN7M67ABaOG+Ozyz3vo0hqtIXfF0vAi9DBD+1JCxZnovOho8RXrvculf/CZZS0AgTIUGwRPtWCFZgmfKt8ZfP2os5e8qk6z5PWc3lb9d1cLk7miMlKS2fFiNCi9XQ2lDHcOr/AYpMthufUEJFGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OtjcQfzwTgJXi7DtkWmPd5ugnuNonJU3GNnctMS3Ho=;
 b=qaYwOntd2ysrUlnbVestHAuMKgpqftcBwl5uveiNzlOrNHREYZ/deOVu5IqlCYmfIUA/gL8urisi5frV8jephwPbyeKEDTGldXaGgAMneDQd5o5Sr9oJTrgbwAKo6Fx/O6cIGJbRQrnTLRUO5F5lgbodo1qKP6VG6tLb61XvXsntW3TMdIRm7IV6ZRNOuJBWnvv1ycfOAQHEZ1TWegIwZmS5V5FMIDfUgt+sZQMnMuWuAcGEcC08r4hmg6hLANPwwqQQ5E7I5ICKKYGWQZCfuO75/nVRDKFDJA9kGl5ClDTHSklCPaYDNaivqdpFGhgvlc17AmePEpiX4D5z1UDJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 02:08:47 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 02:08:47 +0000
Message-ID: <2e02d3a1-4e7d-4a54-8368-31f94603538b@intel.com>
Date: Tue, 15 Apr 2025 19:08:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/21] x86/resctrl: Relax some asm #includes
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-16-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250411164229.23413-16-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:303:b5::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eeb5498-d06f-42c2-fd94-08dd7c8b9f48
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFg3NnFydkRvOWU1LzhqQnFsbURyR2tXaWhsUzB4ZTZkdkZWeUdrTVhwUVhq?=
 =?utf-8?B?MnA2aEJyVjNEK01iYm9GcFRYdmxQTktuT29kWlowNkN3OHJOREYvTzU5bzhs?=
 =?utf-8?B?cW9HQVhmU0tvOXRYcFRnNW4rUGtKdFpaek8yWHJoQ21LQmp5UDdRVEdCWmR5?=
 =?utf-8?B?L3ZSYWVXU3lnMmhCTE9sbFRMdHFmUnFRaklNNThGUzBudE02S0hES1I2QkRo?=
 =?utf-8?B?a0hzTGhOUkc1bE5qdXlNRUgyM1pqdmdwdDF5dlB4eGJNNWpHd2RXVERJczNW?=
 =?utf-8?B?ejJxeHNFNjFwNXJtRmlPUHZXc3I1UmNRSnJVMzlOa2VJQVJNTlQxQkJnL1VR?=
 =?utf-8?B?ZndMdXlmMEFjZjgveWlTKy9lT21VMU1Lanl2NWcySGlGSGFmRUU4VGJrdGp2?=
 =?utf-8?B?TDNPOXR3ZnRaM1lRM1NKMVlMSXpMT1orVHVydFMyWkpXUUxPYWhFb0E0TDVD?=
 =?utf-8?B?dUo5Ull1WC9aLzNndTVPdHVOeEFTbEZCKzNEL2hacC9yTCtTcTlxV0pLUW1v?=
 =?utf-8?B?dzVnY25wd3g1NzF2YVRwSkZienR3eTdpN2Jlak1TL2d5SXlTVWlJWGlTeWhw?=
 =?utf-8?B?NVVYdUU4M3o3RW03R0xpams2SWJJVkZVWDNaRVIwbWU4MS9zbmQ1Y3poNjFO?=
 =?utf-8?B?ZEZDaGV1ZkdCT1JKcUd2elNlMVZIQjJ3Mml2cWVadzZmUE40elZPQlhGbVoz?=
 =?utf-8?B?ZXdjd1NQcE8xYks4R0l3TEEvK1VEZ0p1N091MVFKM20wZ3YyMGVnTm44dEkr?=
 =?utf-8?B?bkRTUFl3RFVmR09yQTZuRFQrQllMbzhRZ1FDenRWZGN2WEtJNkNRYk1LM1BC?=
 =?utf-8?B?U1BBTHRFekFWNUJTQ0hReUQrNmNXdTAzQXRtRGxiZEFOUVVsNjlMVUNVVjdo?=
 =?utf-8?B?Y0tqak9VSExYZU9iQmVqL216Y0lSMGROZzg2ZmZSL2pwR3Q2OFdxdEhCb2VP?=
 =?utf-8?B?eWx1aFQyVnJvUEZlUWJZcTgwUnFvMG9VbS84M09odlFxNGo0ZFdTM2ZyL3hQ?=
 =?utf-8?B?c2hIU3JmWjBCQmFiUFJqKytiOXN1MERmbUV1eGk3TFoyc3dnUnpjYk9kZVAr?=
 =?utf-8?B?enpGK1JDQnRscUFEM0V0bmltNUpIdnZEaTVaRFI0S1NBWm9WREVWZ3p3WE5x?=
 =?utf-8?B?aUY1blNKZzFrYWFRNDA4OUlmWWFEMkZ1NjJ5OFVuRTFLRVJVRnhmQ0dLUE5C?=
 =?utf-8?B?WlBwN2FhNE9BUVFGREdvTnZBRlZEOFZIcjdEK2NJWXhZd1pzYTl2cllqN1BH?=
 =?utf-8?B?ZVN1ZEI1QW9pRXNEU3RISkV1MGVsR09DbEhndFd6TmpKQ0w4dmtlc2gyNFor?=
 =?utf-8?B?THZKcWhtMFdVT0Z4YzVOUjRmRERxTk5LZ3lJTDNYZHhMK0Y0VU5tUnpacllN?=
 =?utf-8?B?NjhPRDA0TjF1VXJqdVFDNmk5VXdwTy90VWZzbWZJd3hCSmtVZmg2L3Y3V0dD?=
 =?utf-8?B?dVFSTDZyTVdWOGM4UWw4Y1dSa0J3SEFBaVhRMEVzRnN3M3krb1hSeTNYei9i?=
 =?utf-8?B?ZVFMeDljc0N1eHl5Tktja1RwMzJ2Y3hjdnZCYk1DT1hUWS9LY2JJRW9TRkRB?=
 =?utf-8?B?ODJCSm8yK2xwbDcyYktRUlZOMnhhelUxUW1FWXdSUngvRnlBd1lhdnJhZFo3?=
 =?utf-8?B?MVlzVlErTTZOZC9IemZEcTdGQTkrWmhYR2ZlNWxOZzBXWVFTa3dRQTV3TkFr?=
 =?utf-8?B?QTJkNW10cS9qVUZDRzRXbjlJTU9vNEVCNm5OeDE4YTVYaW9BeFVSVFdZUFlM?=
 =?utf-8?B?QktOQVpHSnBkQVA3aVVGVzIrVW5Eem1VeWhQaHl4R1ZsMHpyN3lDb1NNeFhr?=
 =?utf-8?B?ejh4SkVFVHkvdU10b2llSXNCTytTT081NWFQUVhqcGN1bU12RktwazB0c21a?=
 =?utf-8?B?S05iVm0vbGVIR0lxdGptcGZCaCtaZG9TWHU3cmkwL1NSSmg3RE16UVRTbVpq?=
 =?utf-8?Q?zAzu2jhdczc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWorUzBpTFp1Yk0zbElON1ZRR0wySFphalhaMDJqUVJUZ29kTGZTTXFkYXNK?=
 =?utf-8?B?R01wRDhyK21KR2N0R212dVRsaUpRNldoWWRvM3dnYVNqKzBWK0Q5MGJHSHR6?=
 =?utf-8?B?MjA0aXlpNXZwUzdoeFJ4QzZPZmpMZkNqNWJNWXhpVzJENmdaY081VVJvVFRZ?=
 =?utf-8?B?dStOR2prWS9tQ2hzSUg5Q1p4OE9talBrS2lZQnBnZDNSTFJaNUYzVXlGaENh?=
 =?utf-8?B?WDV6bHJYcW9NQTEva0Y3anZ5Qit5ZEZQMmdoMVVNeExMOEdTQUNyYVJmcTVz?=
 =?utf-8?B?RmpUSjlyYmR0azZJOHpVaVNPdUY5cEJIVWJSTHJWbXIzYlB5blNiRllIQVhI?=
 =?utf-8?B?bkx2UFBYSHdLcW9FWFg4OXZ4ZnJyZnZqbEZaNERhb2ZRYTdaQmZnY1FrQld2?=
 =?utf-8?B?bm0zS1plZWZhbHRhMC8rWWt5YmZROEZiRStncWt0UnRNcC8vNXJ2TU1RTzRt?=
 =?utf-8?B?S1NiVmVaNUpQNkZRWkljeUZhby9UY3JLVVlYc04vc2VJYzJtd0Qyc1BOeWZ4?=
 =?utf-8?B?SEU0SE9jYjIyYk9xUGM5SGlBZjVSZUMxWFdHaFlybkJVM3lQQ2ZmRVJzN21k?=
 =?utf-8?B?SHl1Q3pWWm1xdUhxY21Kc29XWE44RGFSQWZnbzNtSEJ5MW9tdzhUU3BFdW16?=
 =?utf-8?B?ejY2RjVqWTZBbHJHcEozUTZiZ2Q5T2JFSmFKSHhvTUo2VkV1T0hPM05jTE4r?=
 =?utf-8?B?VXY1cEVPalUvekFmMmk1aWF1N2ZhMXIvYktudTZVNERoRWpoOUI3VGtnbHI3?=
 =?utf-8?B?TjFPN0NJS1o0eitxaVVkSHg5UjdtMWVZQUh2L0tCbW1McllIQkZzaFczWEE0?=
 =?utf-8?B?bDVxWDMzNzZ6YWFPMjhXbXNhVGtYOTRCK0pTSWtrbmRaanYzaFMxSm5UaUxz?=
 =?utf-8?B?UXA3SUJMYVVFa3RTcTdxVDJQNnVtenhHWGxpZkRhc2RWM0VZRjl4VGdycDRi?=
 =?utf-8?B?dnN3aS9QMVlWSW44eXp5Ym1tVmQ3aytHaXlGYWxyeUkyb1hKK1lGUEdrSlZF?=
 =?utf-8?B?QTNKVXFQRHAramNMV1BLbnFHNStKeFZTUzRCL3B1R1hqYlBFdGJ5UE5vY3BB?=
 =?utf-8?B?MCtTMmRBUFQ0bVlhNCtwVnY2WmtVbHFLbGkwTHpON3U2emhzMXFmcVJUQ1pJ?=
 =?utf-8?B?bkhtankzTE1oN2tYWWRzZlp0NFhBd3NCNXpXbG1UZGVkTWs3SSt3blNNUVhy?=
 =?utf-8?B?TGdZeGFRcXkzclYvQVVjOHpzM09RVW94dURkL2syelMrenBvSEx5TXJTV3hE?=
 =?utf-8?B?UFFacVRwY0p3VkVUTXgrSXByM0MrekN5K1NGYTh1d2tNY240cnhOdWFGZzdT?=
 =?utf-8?B?ckg3TFV1YXgyWEgvNzZsYmtJK2J0V212cE5tK1FOQklPNDA1bllHUUZlVU8z?=
 =?utf-8?B?WFE3K0t3M1lCYXJkUjJ6WkwwQnNqQVU5NWFGY3FhYklEYkduL3lQSjRnY3VJ?=
 =?utf-8?B?L3JuWWpQNmdvYW1iYVJiV1Y2Z2tzRFUzTHRmT1h4akZwZytIcGpUSEpSSzRP?=
 =?utf-8?B?WXIxZkROUjFYQ1dDdDRBMTBwK2RrWTVPaWZGWEd5dGVPeFJJMnorakxpbE5z?=
 =?utf-8?B?ek5paDk2WlE1QkNOOEdWc2tUOXp6WXQ1MFhLekptMzVMemJMQjJNRE5mNkZu?=
 =?utf-8?B?eWpZMldOSjFURklYNm1aMytnT1VBZXhIeW1tRGlFYkNSdDE0YUpzNXpIMkRu?=
 =?utf-8?B?dDRWeHhkQzJiTjdLSHRsTkQ1NWg3elYrckdzQis4c2JUUUVjbGNEcm1xMkN5?=
 =?utf-8?B?Wk5LWHFuRVlJYWtpQ3NJdTFkaVd6WWlCVFEvczVvaUEvZkkrUFRvL2NCNDZZ?=
 =?utf-8?B?ei9SRytqS2diZXY5MkkzSUkrK2gxS2lRSEFTWnM5UXVveWlkY3NEcW53UEEz?=
 =?utf-8?B?STJRaERSeGd6QXozcE5JR0MrYUU5aHNCaUUvbnJySWRsS2M2VXY1Snkwakxy?=
 =?utf-8?B?N3pjMU1BYTRkOEgwT0NhdnJyMkQxRnI4dDF6QWwzeG1TOW15WlFRVjZiNzYw?=
 =?utf-8?B?Z3JWdE9BbWZLdGR3UE01T25RMCsrc01KUlA4MTRUMG51V09oYlRDMEVPcnVH?=
 =?utf-8?B?cFROa0JTS0ZCSGtiVDhTZzhyYkVjQlBpV2ZUNkhvdWN5b0dMa1FXMnBzdW40?=
 =?utf-8?B?WWZRclAzaVpUOVNqeGxzWVVqdFNNYjJqR3F5ZWR3TmxEUmNNcVlzV1o5QzFl?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeb5498-d06f-42c2-fd94-08dd7c8b9f48
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 02:08:47.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc491oGPgF62WJm5vXhqswATFnbh7qatujs3VrT93YwCOh4MGGibl3dgeQjn3GEaRPOD8zORbOcaT9Vuye33aiSmUfT2TQ2imNR2RGm0vWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:
> From: Dave Martin <Dave.Martin@arm.com>
> 
> checkpatch.pl identifies some direct #includes of asm headers that
> can be satisfied by including the corresponding <linux/...> header
> instead.
> 
> Fix them.
> 
> No intentional functional change.
> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
