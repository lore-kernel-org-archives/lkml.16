Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2A19995E;
	Wed,  2 Jul 2025 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455557; cv=fail; b=N6rJpBV78DvfsWuJxHNd8NLyQ4ATxQVpLSCZw7B9UW0FH+1XDQy0Zp2NAh6Icd2i9WkfUZ+4J5l2i1kUcEFdn+P29M6rx1+ZavMqIN5cLWUYv/a3iqc5VfWdceCwe1/yJQ4z9neKm8uQ8ybZ09fpHd4TzjmZta3HzX537j7fa60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455557; c=relaxed/simple;
	bh=dhaCVeqE06iPruVyMNMkvkbgZMWfYfrsO7QbqcByhOE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=snpYQGdUwrUzZGKlVaXwzuLjULuewUgtxryiNZ2IJzhEbp8NosAsoTaVZNKwHrD++1+/QfXY/NwcV2R8SWB2tWh0aDe2/PMThCW7RPwqueZiP3CksN58psfvBQSsDp9na4o49NYRu5l0CGIeiIR/h7oI7gn/n7SVYt0RyNZR80s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGcbS53h; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGcbS53h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751455557; x=1782991557;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dhaCVeqE06iPruVyMNMkvkbgZMWfYfrsO7QbqcByhOE=;
  b=iGcbS53hyT+Y8PMxIIZcNEbMyEeBFk/o5PREXFiFdpkj11agb0ulen6f
   0y14eiqBGbf49BOMamQlwj6tyh7/4ZLytJuFNcYxoa7G/NhaQSTlY23se
   VzpNgIB2Ebcc8uizH9BiHGuioAtKOLTLTmjb0Dv7EvCiMoG604xB4r75u
   YiiB+1T/t33SKCujStBh5BHRqAeDuCd9N2cPw9PirBOAD3gbUgPAJPxdf
   +VE7JbAFUqfQrLv7MG50HxwMSQja7mdjwVBzVgaGmpNwEXpBCeSiV5qIX
   9Xbbe8u4/KDyS3/11zNeQcqU/H8j7c0eirb0hu1PRaGn7if2U2ZVOCK+k
   w==;
X-CSE-ConnectionGUID: Jfx0qOq4TluGnxoSJSweUg==
X-CSE-MsgGUID: 1xA0xON3QBC2c7tbviVgdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53460701"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53460701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:25:56 -0700
X-CSE-ConnectionGUID: dMBRioPtQjCtWs1M6uEGeg==
X-CSE-MsgGUID: UpOixAphRI+PT5zJyi6UOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154595276"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:25:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 04:25:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 04:25:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 04:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnIj1xAfwpIuxsren6qX01zFwGANi7jBwOfNPCDWhf1cyaKXcdkvpud5Cr+W94Vl9WRC3EyZPnUrh1z7lNgJ8tGECWOUMvBSltzIvVEuj5tdZhNdDtXRhgXEGEli1qK7LdxHRGjb9L3dgNs07RDEijtMlUdMA4aabPb9LtTsqxopQH6VBmMlL35Dblprz/NjLcl42LY+GpYqWiY8SKMehptkosCBW9ulRnXZ0sbtwt7TSYBEF2+dMGs7nZQVM+mK6kn3+h1+uNMDzHVeQkbgEPBLd6IzVPLI2WsaeJdULUvR3mdLcbBqVMJ17TTiWu8l8iVLpkyJGItwI9K9jACvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpXBuDcmewSiNIUB8D8wHQy8BVjt5WQJcJE07HP2iPk=;
 b=Gqw2Kr9vRNHpvOdwAS9PqoA7rOtfNqaIM/DKewV1WdvmGXp0P0ZgNKjACEsUPvPcZTJX2m8LBuz49hVOAXTVthMea97tYMFi1TTy0jPmyx+cJtjCHEXtPe9y+z5nxjRJzMEayKU6U3LuJDooU2Y1pJLtipDwuKPKi6JNMQ9YI2gdZOcRAAEw2W/2kFdl2AVbnURe7EuAhXw0R8sdmZl1ask+8LL2OGuQGjQvWbfY4/z+8iCRI53q1i3bBrAKJRxXAIxfi0VEyvW95yFl2THAeJt19GL5ceKo7v0gfUrS+qVHkOC0gpFXUjC7Pj1qDQxmCMHk8v8YTXj1r2jFhyfi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.17; Wed, 2 Jul 2025 11:25:51 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 11:25:51 +0000
Message-ID: <0fad454d-f1a0-4d97-a209-af8ebc86af8f@intel.com>
Date: Wed, 2 Jul 2025 19:25:37 +0800
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
 <b09bd5f9-d029-40a0-a853-2a90ef969854@intel.com>
 <82fb706f-b12d-4340-8f8c-6f949ab82913@oracle.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <82fb706f-b12d-4340-8f8c-6f949ab82913@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) To
 DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e42a40-cb54-4897-7052-08ddb95b339a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTZ1a2hhRVNvdkNycUtwZnBXUDRXR2RhanFFZDJzRE5keFN2N0x4by9mRnVQ?=
 =?utf-8?B?L2gyS1NDN2w5TWVlNjlBenI4MmNTaTR3SnY5Z01ZZmZoNDd3andsYkFLeFFq?=
 =?utf-8?B?dnpGUG9xaWxnK3hYbmlqYTVCQ3U4U1JUOWIxNHhrSDkyL3ZEY3lBTnlQVWww?=
 =?utf-8?B?VUlzOXFMdWRQK1I5U2V0dlNDQVNSVDFrSmRmc3dRWXNPSzZHZ1pmNzBNSlcv?=
 =?utf-8?B?aThTVHRzL0dtQ24ya0psdHg4UW1oNG1ZUzdzWTBqZHZtZ01PWm1qSTA0eUZU?=
 =?utf-8?B?SzZEekR2VlRVaFZjdzJxdWYrWHVJa3I3M1VLbGpoYlp3ZS9kT3hzNWlQQ3dm?=
 =?utf-8?B?OWYvUlVybUtBUHN4b0hNQU5rdExDNWxWSFc0YlNPcDk1UiswMUVCUEU3RHRu?=
 =?utf-8?B?UG9Xd1QvUXZMMHJobGxiYXdnM3JnTEpMSFhYZE1qc3Q3Q29MZDNqbkkxZk5J?=
 =?utf-8?B?UlBEd1BPUThUMitTcjA4aFEwWWhVeDRBa01IVk1ZOUJsRlZPN3RhTFkvYVYr?=
 =?utf-8?B?RHAxdENWajVqdklNYkpFaGZGakNmaFNNaVd6T05VQnJJcjZObTE1ZktnWDVD?=
 =?utf-8?B?d2VDL3VKd0JHdyszRHJJcjA1dFcrcFh0WVhyOXp1RW9lLzE4cjErM1JsazZx?=
 =?utf-8?B?MHFWUE4wTHZBbjI3SURhK0tDenBuWjZLWjRGR1V3b3FENkZlRjdQcHRFb09K?=
 =?utf-8?B?ZGtRT3FBT3VTZzN5RlFCbGU2ZUdNLzdPeXArSnREVmdqdlJOcUlKQm1Zendr?=
 =?utf-8?B?Y0lKOXVPaG9WekcweXNDUldYN2wrSFp2N0o5ejhlc2lkOTlDUkp0NU9pUlhr?=
 =?utf-8?B?bHhORlVHSjZlR2JPeUpIUWFweXBZZi9sQmYwY29sNkVRek16ZHBXS05UcHJr?=
 =?utf-8?B?aVA0RTg5bGREMjBwbk82UFBpamVVdSttTmhHaU5OajlWc3ZTd3VTSzdCUTZl?=
 =?utf-8?B?TDZ4eW52aHFKN1BFQ0Z3VHlrekZSZ1lyTWFJVXFEMVArNGhtd3ZIajFYbTdw?=
 =?utf-8?B?WEMwS0dpcWdSdnJWMGE1b2JHMU1ZZllEUUhzTTlaczF5YXRCODRRYjlNSUt2?=
 =?utf-8?B?WGRQYXVqRUV5dU9LcWU2bXdhSElTOVFaQklsRTlZUTBwV1ZGMlNVWUZPVEc0?=
 =?utf-8?B?RTAwL1loYlFVdEFvVnhYblM0bzJFNDY0ZUZyWXZvWG8wRVBIcXdDL2tuRVFS?=
 =?utf-8?B?T2pUWjh1U0N5YzZPZDRwenBYV280eUtvZTBQT21XcWJqZGNSbDI3V2ZJZit4?=
 =?utf-8?B?NFZ6Zzg2aTVUa2Q1QmRwMS95VktyOHJkblJoL2pRVWVPR1hVaW50SHd3ZFlz?=
 =?utf-8?B?S05xTzBKb2lteGlCalVKNXh4VkUwM0tBR2h5WnY1U0pwM0lZV1dYUkFHekFL?=
 =?utf-8?B?VGFGYU1sRDdCamIzQzNDc3h2WGw1dUpGZ0FvM1dMUEZTSVBYcEVKc25YTVMv?=
 =?utf-8?B?YVh3SEJSZVVmUkFneEc1Y2RFY1VGUy9TS1FrMEx6L3ltL2MrY2xhdGY4VXlD?=
 =?utf-8?B?VWRsS1BvbDlWMkJUSFNmR2lCb2dCTzN3eTRLRVcxTi8xNG1SQ0RwL21YTzVI?=
 =?utf-8?B?bFBUQlQwTG5mMmVrLzI2STgxYmhRbUMwT2draDU5a2phUlUwdzVqU25Ecm1S?=
 =?utf-8?B?elF1Q1U1OXM0bUNZSlZ2cG0vM2kwVEVGZ1lURGFTaE9kREZoWThuc2tGM1Ix?=
 =?utf-8?B?ZVNENUZJem9IV0tzREpndzRML0x2RzVwQzhSOStiRFRKYy9ybms0YnhYVWV0?=
 =?utf-8?B?dUozMXpUWDNPb3Y2Slh2dXNDbEIweGQ4RWNzOUdwR3lnQlFSbWJ2dlBEZStP?=
 =?utf-8?B?RDVxS3V1MGpXWFl1RjVTVDI2cHJyL3g0REdxcS9uNzcvUDNFaWNQazhpS1lm?=
 =?utf-8?B?cEVlekxSMXRzQjlNZ29EYk1WS0g1R24vS1hSZ2FtdVE5UUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhKc3BMMFNVaGV3V1pEOVVCWmwvRENmNGpmWUhERVJJaWxYR1R1cnVRQk1q?=
 =?utf-8?B?Tm8xZjh3WnJYVVp2SmRKeHAwRXJpcjlyWjQwMEt2ckdYUDZ3ajBxanBlNThr?=
 =?utf-8?B?ZzFqNHUyQm40VEw2dWZjZWtqbE9LYU41VUVYZ0I5RVRXUkRva0tCZEVQQk9O?=
 =?utf-8?B?c0dKTEtlTDl4YXVjNS93U2pNakdNMnJGNnpybDlWNkk2bWgyc2VlWEVZd1RF?=
 =?utf-8?B?MUQ4QVJaUTRoSXZYTHRWZEhwNHUvU3hrODBlOEFOeVhKd3I5c215ejZmNkJ5?=
 =?utf-8?B?aUx6dHVMR3A5Mjk2My9NMnRrU0tubHlBV0N5VmVBd1FDMklKMXB2ZzVpWUhQ?=
 =?utf-8?B?aGdRMFBGUG1HZkt0M3lycGFtb1dJaDhrNzdRTExDeUNHdENOSitTb0svUjRT?=
 =?utf-8?B?a2cxRlVEcTRPaWFJVzJnSEhiMHVSUG5LUFh4dWdTN284NFpmK2h4ejlLUDhX?=
 =?utf-8?B?bEllZXk0UUxjNlJpNXRjK1NsU0ZURzYxTDJrdjVTcjRnY1JSQWRQWDNrblhX?=
 =?utf-8?B?NG1OeHg0N2pkUXNib1RFR0FZOHpFSUlqOGNOSWI4dHRFUVRCV01uUXoxWnpq?=
 =?utf-8?B?YWRqa2JuVFhRZUFLQmZjaHdLNG9KbUdVdmRtd2tPWVJuMGNETlU1K3NFcWl6?=
 =?utf-8?B?RjVybkwzbDhwNVhaVW9DNHpLR01HNndjRVZsZVB1TmVlN2VIKzk2emdhdjdL?=
 =?utf-8?B?aWNoa3FRNW1oVlZIQ0xoU0UydUh0c0lKWHpoQm8ra3NCbVMxSnBtLzRCZ2Jr?=
 =?utf-8?B?ZDlrcnNkY25PZCtCZUdhb3NHTHl5NU8yWTkrNHFyNHFFS0VkdW1ZYlk4d2hu?=
 =?utf-8?B?bWE2SDlMRlB4diswSVB5WWZKcEgzdEwvWTRaMXN6MFNjNW9mclJBaVBkUDdY?=
 =?utf-8?B?UXIxTktuR2swRkZqYUljUFU5NEdsNHdCKzlNcTB5cWE4RXpJR0tnQTVHL1dq?=
 =?utf-8?B?bSt1UGJyem9UeGlJR3duK3R0NUVLZDYzc1ZhYlByVUhOSkU4SjhhamRFaFl3?=
 =?utf-8?B?UWt4eFN4VjYyaEgxYmJnTlhnNlZLQ2h5V3hOUktvTnVjdDVLdHEzT1hlY3JU?=
 =?utf-8?B?TGI5RE5SbXNzK1luSkk5TytCL2tvbGNoTTJMbDNyNWRBRjRJMHlsWi91UWwx?=
 =?utf-8?B?Rm4zWGx5MW5nN3lJUXVzT2Y4MG92T2E5TEVHZkEvQmxoMEZkWDRBRmNyUWNo?=
 =?utf-8?B?M2UwSlpsTFBPM0UrOFUweGFXWUQrcVYzcjFDTFBBOHJtcEhYNzcwSjNuVU9T?=
 =?utf-8?B?ZGkrQUVvdUlBc1Z6RE5pZWo3VjJWQ3JZckRGRVFjZW1MM0JpZFlGTGIrNWI3?=
 =?utf-8?B?b2hGWktrNG44dzMyMUQwcUZSQmR1NXZ6YTBqUmdWU282ZUdYYUoveVFyc3k4?=
 =?utf-8?B?WEczMkk5QThVV2NNaW4wRVVQamk3Y2pQYjZYeFVmc1cwbEtQZG5nb0ROTWVh?=
 =?utf-8?B?cjVtSXladFkyb3FvRThxYUtoTmhlekFPaUQvbS9hV1RaYVpjTFAyQnpVdG1N?=
 =?utf-8?B?UEFlWk80cGliZ2Q4aXYvL0ROYzh4d3UwaVVOSWtndmc2bS9kRFpJY1Y0RVh3?=
 =?utf-8?B?dng5V2QrY0hnL1NxdUpCNjVrTEdlWjdXcFJZazBqbmVQd21heUh0RnpKeE5F?=
 =?utf-8?B?bXUyMk9XL0RmUGo0c1pJb0xxdmFIR2JtSkVWUStDdHpiRFdUV2RGMTMyTUJy?=
 =?utf-8?B?K3lkeEtjNzcxR1N4dVl3RHZxYkJySHp4MVdOMUlvbHNWRnZlY3l6V1Z5MWQz?=
 =?utf-8?B?eEM4eFEyM0dmWU5yRVNYYmJ1R3VERzVBcFBqYUF2MGM4Y2JVWjh4QllsTUZI?=
 =?utf-8?B?aUxSV3VycTFDY1JsVE5henczTUlDLzg1aEVhMDhlSzdUdVJuWWVnK09POVQv?=
 =?utf-8?B?RXBHL3haVytoeEQzWUVMNkc4R1p1QzNEaXF4Q3VlTnI1UnMyVEZLeC9DNGVJ?=
 =?utf-8?B?ZVVOdXFQK2dhRFNqVkNyOEp5SUdpcTV2cVZTNjdlYitmWWJDaU15aVRsbm9l?=
 =?utf-8?B?NVo5eUQyalVtM0ZjQ0xEZitvTk5hN3h6dDhFTTIvUmN4N0k2dmZaMHJNcjN0?=
 =?utf-8?B?NTJpUW13WjBSekMzUiswR01odTFkTm1PNmNvSTZ4enJ4dEE4b1AxZzlkWExE?=
 =?utf-8?Q?3kzfHjo23pniKUu/xLA3I033x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e42a40-cb54-4897-7052-08ddb95b339a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:25:51.8752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QegPWNuysjK+3c2bqArQTxPfQK64AzSRADHJH4OX4Srxl03Ib3A4bRsRGr8Oha1Bdn0h5zippuWia/ogOaqE4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-OriginatorOrg: intel.com

On 7/2/2025 1:58 AM, Libo Chen wrote:
> Hi Chenyu
> 
> On 7/1/25 09:36, Chen, Yu C wrote:
>>>> +
>>>>    /*
>>>>     * Got a PROT_NONE fault for a page on @node.
>>>>     */
>>>> @@ -3189,6 +3212,9 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
>>>>             !cpupid_valid(last_cpupid)))
>>>>            return;
>>>>    +    if (!tg_numa_balance_enabled(p))
>>>> +        return;
>>>> +
>>>
>>> I think this one may be redundant when you already have it in task_numa_work().  Without the
>>> scanning, there won't be any hinting page faults on that task, so neither do_numa_page() nor
>>> do_huge_pmd_numa_page() will be called. Though it's a minor issue if tg_numa_balance_enabled(p)
>>> is fast.
>>>
>>
>> Previously I was thinking of the following sequence:
>> 1. the NUMA balancing is enabled and task_numa_work() is invoked,
>>     pages are scanned and PROT_NONE is set.
>> 2. cgroup NUMA balancing is disabled by the user
>> 3. do_numa_page() is triggered and PROT_NONE is cleared.
>>     We don't want to do further task migration and
>>     task_numa_fault() bails out.(page migration is still
>>     allowed as we mainly want to control the behavior of
>>     the task)
>>
> 
> Ah right, that makes sense. Does that fall under unlikely()? The timing window seems to be
> quite small to me.
> 

Yup, and I guess that depends on how often the task access the
"invalid" address - it might take quite some time after the
page been set invalid and then the task access it to trigger
a page fault.

Thanks,
Chenyu

