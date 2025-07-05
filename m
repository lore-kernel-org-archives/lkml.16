Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674A179BD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751682415; cv=fail; b=abJtnhYajD6m8vKwTj5EZTZdJU8RS6IQv7l8k4FhV+13WKNRDu2P3BBrTpHf6h+I97FgLhNkJ7+SdQXeQOpW2J6Os9+f+AlhabyXpxjEmKbAl1VCEnFjccoWcag3yYNbKrLtUO/dUBvWjn7ROEoNyAd2tMX+HgaF2GhSx3ygcEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751682415; c=relaxed/simple;
	bh=t6gMKFRf3CDoNqND3pl/62Fqq9TiTZ9PiCO1I9kwCTk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g6arwI7W5PLM2sbZhCNqTqVoOgfjCFVBsLatYusj5ElTwHiiPngWKI5deMZf1Aygtv77qQug9pgDgrQ3BEAUW7NCHmTbCohPHO7hNwcGZaTrd05fzkIzEZJCGxwYHhqAO248Ki+ZAEq5N4wbHoLZQzFXovjmToi4CWqkL4OFjuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cixuJwo9; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cixuJwo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751682413; x=1783218413;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t6gMKFRf3CDoNqND3pl/62Fqq9TiTZ9PiCO1I9kwCTk=;
  b=cixuJwo9LdOjScGzFSB8gLHyvAMvrCT6AOSkexsF814MJRNo06xJwbof
   pPkA6BxtnG3TflyC/LEnwY8qwbk8NUIMN7fhFQNcnIZJnXQbGuf9AHXZc
   1zCj1YRtQ+QZ1LYOtA7+4OdkJ3PhcnfbHaG9flX0edLsRCSuLY1BEbmQQ
   YQRGBvMhM6VD3ZsLAhVk+nCfdk16H8JxyJeKZXkO4KnalEiUMrvdCzUvf
   henorg8vD3xlOr6LPPHL1OPeBUt1m5WMu3oKmcttW/6dFhhNABsqpf4ZH
   YicmMq08eas09M5FOXvDCdkA6wL66mzwAK1G6xwjQWhU4CADvYcft/D14
   g==;
X-CSE-ConnectionGUID: jX4197SoT1Gm/ogYYAyMYg==
X-CSE-MsgGUID: rK+5mAZnT4mKCYpYcdAdXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64691170"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="64691170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 19:26:52 -0700
X-CSE-ConnectionGUID: 1Zc/9o75R02/ooVsrYmdhA==
X-CSE-MsgGUID: /QH6zTgDQ/WhlPo5d63/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="155506943"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 19:26:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 19:26:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 19:26:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.77)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 19:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYSNtaN67DUgrIte443rDtRHIQvhj7JEkH6a/HM4MfYw2GCqbuOhrE3XqCMyI1jQEshY13StzeADcIicVWt3oRlAP992Tadzm0d6XJGkdpOFgT6mQiC8BvB4L1CFeX2wMdQu8C0PQv1rIyqPYehBtlCZb5wR9T724T3ufD0sqELVlrdXY9UueXz7gP9EeFX+3772KEN8MMqZ+CIKxcKWi+TWr/nYc/K8F3e7Hm7mqgKWT3eDV+mr/82TX9YAjpVYNXMoDohKQbbvzQXkF6uS+zv9iLys2ixT3CD4zSSXkhUuCrd6Hc91qeYvwsWJSLw16mdmFu+JZv2tGI+w+y99Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9YXImjKOzKybCAnCJnJtZCuPVrDE4VkdCXykpXQSiQ=;
 b=jKFJTGCYDVsu+hyCrZmDdypkj/qIL4br1hMrCN2yIaNKokL2GQOXgHzRavxxWeQETAuA7/X9BEERrtpwLopDG15NvzDg+eX7eg0kmZEj1bNeBmFDo0LaXj4Vkej892Y0BWaK3b4RZwb8nHTo5zXNZRoYcQWBazhsV1Ec1ZPb/w5kVdHQVolW0hSzad12mVnlkVJ66WuNBqTOXlB79IBd9DtZBP4TjHNodbWPUtQXwbDtQ1XiJGtFBfpkbAYdcVkt/yby/YAeMI5ellUwP13IZzktr+NZajysLdFjdikj7MPqE91oGZtv33GybKkI202ZjaBk3LnJY8vLP7gmadP/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.37; Sat, 5 Jul 2025 02:26:43 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Sat, 5 Jul 2025
 02:26:43 +0000
Message-ID: <99c296f4-35bf-4427-95e8-0cdcc423f999@intel.com>
Date: Sat, 5 Jul 2025 10:26:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 14/20] sched: Introduce update_llc_busiest() to
 deal with groups having preferred LLC tasks
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <e5b77a2e33a6a98de0468c999e8c94d226b8e6d3.1750268218.git.tim.c.chen@linux.intel.com>
 <736d41f0-1eb4-4420-ab67-e88fc7e31bda@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <736d41f0-1eb4-4420-ab67-e88fc7e31bda@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS7PR11MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 6360a10b-fd40-4674-666d-08ddbb6b617c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzM1bkN3RlVabTRaSTl3VVRJOTB3M21SU1ZreEN3bEJydDRxaFc3U2pRaXpU?=
 =?utf-8?B?bzdlbzZBVTdXT1UydG1IR3ZMK0FyOVVBcjBNa1pGNUZsMXZoV2xHb2Z0Tms1?=
 =?utf-8?B?WnJWbjJZMjdGcVhqTERPaUpsUUhSTlFnNzZLMGw2Y3VBNTd4QTd5UkFIcDVi?=
 =?utf-8?B?REtmd0orRXFudFdqKzVwdS9oMEJiaE5xL0YvZnp6b1pXL1lMYjJyYTUwWUwz?=
 =?utf-8?B?ZFdDUy9MTjVWRWw0eGZ4b1RyOEl1UmZ1aHZBcm5nbHExcnA5Y3NXcm10Qksx?=
 =?utf-8?B?ZjdMdXB4Nk44a1kwSU9SZWhmMUxPWWF1TElVdjkwdm9mQU1NelBNRHFRRjBi?=
 =?utf-8?B?TlVXNUNscWtvRHlqcUVxU1hxcGVIY0oxOFFIWGFCSnFSMmxJOFVBVHV5VXR4?=
 =?utf-8?B?N0FNOG9teUZmdGdZSWx3NjNKUjJaTFdvK3ViZmQrSi9adjlLcE92Mmx5Uk4w?=
 =?utf-8?B?QnRLZ25UVzRVRXRTMkdjVlhtSzFjSkdnWVdOSkMvSUcvZ1A5YjlTVForVUhD?=
 =?utf-8?B?ZklFRnFsbngwMWJVOW43c3N6N2d3WTNyUkNIbW8wRmRtcmJMZUFYdnJpOGxP?=
 =?utf-8?B?cVpTcU9nMUxNY3owbE9BeFV6ZSt2dWlacGtZSVUwbHU5b1FYRGwwbmd5eU0y?=
 =?utf-8?B?R25nWWlmRE1yYm5GOW9YV1IxVnFoNHU0bmRBVzZMWjhlZDFDSzN1UExLZ0NC?=
 =?utf-8?B?d21RMjd2TzJrbEt6T2U1Q0podnZRSHFwalcrVjk1TmEvaGdmU2RHeGNLcUNC?=
 =?utf-8?B?aDRzTnBnR0VsNkJ5MjF0bG5YMURDNGNJc2dvWC8vOVR0YithK1FVQjRCMTJT?=
 =?utf-8?B?K3EzZ29TcWVYSWxDMEYrN0hHekltbUpNb1hTUm1BaVlXY2w2ZnRqZjVMMWZY?=
 =?utf-8?B?SGN0UkNodFZYWHdiTUV3Y2hDcnNNNUw3VERUTnM5VjZKTDhuak9rbm9VVW5Z?=
 =?utf-8?B?TzRJTUNJZDA1VU9EQ0ZBK3QwWFp3YkIzMFJ2VktIOXcxN1R3RFFNM1hSK2xz?=
 =?utf-8?B?dVRzZ1JYZTBPdDhYK29IRm9SNnY2NDdmQTRWUFgzTlRRSVE1b1dMay9Zakpl?=
 =?utf-8?B?QzhFcWlvVWhOTmlCM0ZFa3NCckhxZ2dGNkZMY1ZVWWtRN3dLb0pSOWdFdG1x?=
 =?utf-8?B?NGsrMGk5RGxmSDhSbkJrUSs1SkhkZXRQd1RBV1RKSmkvd3dXOHdEUEEvdlph?=
 =?utf-8?B?d2Q2ZTZrMmxuZExUaHozeDhUOFNyaFR3SE5CUXhPUCtFbDJNZjE5VzNaVmFn?=
 =?utf-8?B?eFlxZXVETDJxaGRNR0hWcjBhUmtmQTQxUmNBQXRTem9vQlhnNHg0WnFrNmxK?=
 =?utf-8?B?d29PT3lCOVRnamFwUXUzbzV3VVRvdFZ6VkM1eEF6RXpMOWFnUldpb1ZtVU9l?=
 =?utf-8?B?eEh6MUltTCtLay9nb3dacHh2SVRYTGsrR3VoY3hNYkpKWnkya1UzZkx4T2pP?=
 =?utf-8?B?dHEvMFNkdCtnQk5uVkZnUDBrUlpSV3BlQk05Yjd6UXdZQUYyMkhXcXFqQ0Vu?=
 =?utf-8?B?RGxTM1QwaEJXVVlZcWY5NktNcXp0SlZxai9pekg1VE9nVmI1ekxveXc0MjNV?=
 =?utf-8?B?ZzE0OWx2aGlGWkY4cUxWUWVGTDc5SFVTZEg4Skp1VTcwWkpTSUkxTlFBR2hv?=
 =?utf-8?B?b3E5NUw1eTZsbUUxOFdXVTZnZGgwdnAzT001VHJoYUM5TVBvN2ZVY2tlcHZG?=
 =?utf-8?B?MGdkYWJmb241OGJaUnVxbGdrNy95Y1ljMUdzSElpdFhPdlU3ZFpoZmJpNFNO?=
 =?utf-8?B?NUtkUmd1RnBVb3pKMEI3QmVJTUYydmE5Z2pNdGkzMUNwbUxJSnpHcTRnQzY0?=
 =?utf-8?B?RGd4Y1ZkNjk1WVpQbm1pUStuUG41UWF0aTVTS00zdHdaaUNKbTZzU3pYVVEv?=
 =?utf-8?B?VkFkM0NhbWVscit0ejVUVFV6Q2k3K01za21QYjduUEV5M3RtNHMrSUVqZ3hs?=
 =?utf-8?Q?B1PwFm5fN8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elRyN3JPbWI2WjVKdWFXM2lkRlB1cGRrVnpZcUZ4UnRsaEpQWHc3Q3c2ZFRK?=
 =?utf-8?B?THB5N2ViK1kxRGl0ZzdxTUNaR1dPcTl6aFJIeUxXaVE3dXhTSjBvNEk1dCts?=
 =?utf-8?B?dFduZ2ZEbFUyYkl4MGdyeXY5M2kzaWV1eVdDbzdFVmxYRU50Yzc3akhKVDRV?=
 =?utf-8?B?SzlHejZHRXkwNHM2UDNidHIzM3BNVTFZaDJoWldPQTBENk1nUkI4QmJqV3U5?=
 =?utf-8?B?YVZuRmJhOXpRa0VKUUZydGxzVC9lcjZmNmZFWkc3U0lZYVZtVG56Y2FxSlcv?=
 =?utf-8?B?eDFBVUhia3d2QmZlZzBrNGFQREhjdkxqZkRFYmFNbU9EazRvVmZXYWx3NHlw?=
 =?utf-8?B?UkJRbXBkM0lNUEZZWFY2amRXdTlaN256a0NZUWJHeFVjRnpFYW90MDQxZDVK?=
 =?utf-8?B?enRNS2FDQjJmWFpRVWRMR2ZjQjU2dGFHWXRuWWdPSGtuWEZrUmRZYzFubkxp?=
 =?utf-8?B?MHBRZ2ZKcDRvY1J1M0dsUFZwbWxkUEMwTUJ3dEJoQVNpU0pWTG9jMzl2S0VV?=
 =?utf-8?B?YzZwNjQ2ZXhZWEdpWEs1WTJHdXhmWXBicElybkg1ZWgxVU5YMGZ4ajdZQkQx?=
 =?utf-8?B?dUdFdmRBTVhiKzVxUXJVZGZBYzVBMUNZTnpvVWU3U21sOE91dFhZL1lvdCtV?=
 =?utf-8?B?UDF3RzFDWEJML3dDZzUrMVEvKzd6UkVsY3dmaDBicVZjazJEOHo3WjN0dFk5?=
 =?utf-8?B?V05yQlkraDJTaEJpNURIdUN4NVJZWWt3M2FlZ0NWMHZUMWYxcmFTcmRSV1RL?=
 =?utf-8?B?amFQOUxDK2N3NTFmcnVjVzhsbHJSak1ETmxBUWd1eFE5TEtnQkRPOWRUbDQ1?=
 =?utf-8?B?cXBHck9oR0UydFY1eEhJZWlVMnNVM2NGdWdwOWU1cTIrRS9RcWJ2SDJxdlI0?=
 =?utf-8?B?bUxmQjJRV1AxRXJiQTZyeFNmUDFYcHpvYy9NZ2d6WDQwTlBndVhralhXN2lw?=
 =?utf-8?B?WW5sQ0tqWWZxMlVXbDA0YUZjQjVOb3BBM0UrZi8ra2wzQ0wxd1VmbjBoRTRH?=
 =?utf-8?B?YlMzS1Vpc0FMQTQxZFJHWnhVYjNVRkJjT0ZrSUp3T3FjRTRmUkZPUTZFUm9n?=
 =?utf-8?B?OEZqUi9ZV05UY2syOUlySlAxS2cwR2NBS2RQT0tETHMzY05vdzE2ZzEvclJH?=
 =?utf-8?B?Vk1UZ21SMms3QlpqbEkrcE5vY0Y5bjlSNGU4QTUyQnRCRmdpTnNvL0F5a2ho?=
 =?utf-8?B?RVJPeXd0Z2ZQR1pCU0FhYWFaWUhPZnNxak9JOXVqckdOYVcwOGlnNWJjbHR0?=
 =?utf-8?B?QzhjQ3hmK1ZwL3dsMlc3bElNQVhhTnpXd1A3M0dHS2hwUHZLbk05NVVMTzdB?=
 =?utf-8?B?TzhiK211MVhhMUMraXc1aldrZTl6ZTZPOUFpWHl2dEd6OERyZjFmUUNQTGJC?=
 =?utf-8?B?ZHp1aG13dUl5ZXM0UldQTmQ2NW41bE5nWXg5Y2ppZU83UmF4OHJBN1VYcExT?=
 =?utf-8?B?aUJNVkZpWG1tR0M3MlFndGFCQmNwWWhzK0RlcTUwQTFzQmhacmFDTFJSTEp4?=
 =?utf-8?B?aGZxVmxmdXh1bUloeVVIUDZrTzdJa0xxWFpPNlRPcFZQL1IrSFNwSmQ0Ynox?=
 =?utf-8?B?WHdLdEZPZDdHNnhhK1RxY3k5Wk9XaUQ5UTdSVTRqRkcrQld1NVB4LzQzRC8v?=
 =?utf-8?B?aXNQaXNJWnFuTGVUc2dDclo1V3NGcTBUWTloM1h3T1dNc21TU3krZE9OSFJi?=
 =?utf-8?B?UkVJQUxkQTVFZFRyOEozOHlIeEFqSVEvVnBYTk1xWEwvQTdMNjJZZlJyS3Nm?=
 =?utf-8?B?WVFDRGJJRERnaHpUc3M3TnlIblErRkNpNnZidW9TRTAwWUN5NFF2Q1V0c0hz?=
 =?utf-8?B?clJqTVFnNGQ1eENVZXdZakdlRjM1UDAydTE2Rmc2SnYveEVmZ0dzZXNPOTE2?=
 =?utf-8?B?c1FEanJ5S1VRK05Qc2N1aW1wZmltaWozaTRyNkZEYjE2d0xZYlVuWGFrZHNr?=
 =?utf-8?B?YUxjUXlUcmVmdjlNcWZWSUlkc1BSR3BvN2VGMXpqWVlhMWpmWFQ3K0UwUkZp?=
 =?utf-8?B?bVNQbW9Cc0hkaDRjeGVaRGZDelF4MzdaNEtPM0twL3ZQNUNIWUpET3U1UWFE?=
 =?utf-8?B?QU1ieWZ3K2ptRkdERGRuSWpwS3hUeVNWbmhVMS9RSlo2MHNJTHQ3YVFQQXBH?=
 =?utf-8?Q?CHkwwA5nWswOWo2DHl2nDYnjM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6360a10b-fd40-4674-666d-08ddbb6b617c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 02:26:42.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnhVhclSiMKSgXsfp3BKzWXDXdFeVqTrUtAsIpkLzZdR+rofBZRVtwU3UfSxKKPMY5e0IKjYRQIa2W0Zr0u3Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
X-OriginatorOrg: intel.com

On 7/4/2025 3:52 AM, Shrikanth Hegde wrote:
> 
> 
> On 6/18/25 23:58, Tim Chen wrote:
>> The load balancer attempts to identify the busiest sched_group with
>> the highest load and migrates some tasks to a less busy sched_group
>> to distribute the load across different CPUs.
>>
>> When cache-aware scheduling is enabled, the busiest sched_group is
>> defined as the one with the highest number of tasks preferring to run
>> on the destination LLC. If the busiest group has llc_balance tag,
>> the cache aware load balance will be launched.
>>
>> Introduce the helper function update_llc_busiest() to identify
>> such sched group with most tasks preferring the destination LLC.
>>
>> Co-developed-by: Chen Yu <yu.c.chen@intel.com>
>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>> ---
>>   kernel/sched/fair.c | 36 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 48a090c6e885..ab3d1239d6e4 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -10848,12 +10848,36 @@ static inline bool llc_balance(struct lb_env 
>> *env, struct sg_lb_stats *sgs,
>>       return false;
>>   }
>> +
>> +static bool update_llc_busiest(struct lb_env *env,
>> +                   struct sg_lb_stats *busiest,
>> +                   struct sg_lb_stats *sgs)
>> +{
>> +    int idx;
>> +
>> +    /* Only the candidate with llc_balance need to be taken care of */
>> +    if (!sgs->group_llc_balance)
>> +        return false;
>> +
>> +    /*
>> +     * There are more tasks that want to run on dst_cpu's LLC.
>> +     */
>> +    idx = llc_idx(env->dst_cpu);
>> +    return sgs->nr_pref_llc[idx] > busiest->nr_pref_llc[idx];
>> +}
>>   #else
>>   static inline bool llc_balance(struct lb_env *env, struct 
>> sg_lb_stats *sgs,
>>                      struct sched_group *group)
>>   {
>>       return false;
>>   }
>> +
>> +static bool update_llc_busiest(struct lb_env *env,
>> +                   struct sg_lb_stats *busiest,
>> +                   struct sg_lb_stats *sgs)
>> +{
>> +    return false;
>> +}
>>   #endif
>>   static inline long sibling_imbalance(struct lb_env *env,
>> @@ -11085,6 +11109,14 @@ static bool update_sd_pick_busiest(struct 
>> lb_env *env,
>>            sds->local_stat.group_type != group_has_spare))
>>           return false;
>> +    /* deal with prefer LLC load balance, if failed, fall into normal 
>> load balance */
>> +    if (update_llc_busiest(env, busiest, sgs))
>> +        return true;
>> +
>> +    /* if there is already a busy group, skip the normal load balance */
>> +    if (busiest->group_llc_balance)
>> +        return false;
>> +
> 
> If you had a group which was group_overloaded but it could have 
> group_llc_balance right?

Yes.

> In this case the priorities based on group_type is not followed no?
> 

Currently, group_llc_balance appears to take precedence over the
normal group_type. The setting of group_llc_balance is determined by
_get_migrate_hint(). We've made efforts to set this flag carefully to
avoid disrupting the normal load balancing.

For example, group_llc_balance won't be enabled when both the destination
LLC and source LLC surpass 50% of the average utilization. As for
group_overloaded, its threshold is set at 85% utilization 
(imbalance_pct=117).
So in this case, the group_overloaded would be honored.

>>       if (sgs->group_type > busiest->group_type)
>>           return true;
>> @@ -11991,9 +12023,11 @@ static struct sched_group 
>> *sched_balance_find_src_group(struct lb_env *env)
>>       /*
>>        * Try to move all excess tasks to a sibling domain of the busiest
>>        * group's child domain.
>> +     * Also do so if we can move some tasks that prefer the local LLC.
>>        */
>>       if (sds.prefer_sibling && local->group_type == group_has_spare &&
>> -        sibling_imbalance(env, &sds, busiest, local) > 1)
>> +        (busiest->group_llc_balance ||
>> +        sibling_imbalance(env, &sds, busiest, local) > 1))
>>           goto force_balance;
>>       if (busiest->group_type != group_overloaded) {
> 
> Also, This load balancing happening due to llc could be very tricky to 
> debug.
> Any stats added to schedstat or sched/debug?

OK, we can add some in the next version.

Thanks,
Chenyu
