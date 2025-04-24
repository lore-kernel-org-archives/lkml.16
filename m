Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE854F81
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503955; cv=fail; b=DKvOMRfoZj/gR0My0ibdIruqN2hszDZXpB14yZiIlIKEDHXfcmFotLXoVIUgEhmf37xGGYivnxTBRdNFqlnu7thMen+onKbZVU/tC6u77Gg1D/EU5O2xxSBv+CUxcYMrBKY7T+aeGun4nlGpAp69a6sJzUcIKl6cWxEwPnNL7b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503955; c=relaxed/simple;
	bh=ngAbmyKHKR2FKxUAnkDHHc4V4/cIzTFDcVazc1nDs94=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A+okP9EaNgTvHBHXX3C8xN5xqVJgB4gYka/uS45mLTf2eekuSKouvaOf/H5BSJNJ0UbBjDyH/BTrFJ6uu6MQmXIHC3SD18nHx6XFfM1GdY4odl3j7UuPE7ClPzgCchvPMJDnS7nZr6G2uWZUUBZFRzuz+GqN22K7Qk0yrvo98zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWjAdjZh; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWjAdjZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745503954; x=1777039954;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ngAbmyKHKR2FKxUAnkDHHc4V4/cIzTFDcVazc1nDs94=;
  b=aWjAdjZhuA/zfoPDsnAYjsqQfoSUOF8eSm/UkKw7S2+aV8Z8cuduONSa
   Fe1LJ50t7Vz4BtvIbgpe0L9O2Qg/yR8z6WcLS3WEKmaptPCYw+NYl+N8F
   RihF+vXc+6U61u/L3p6o5rR+Hu89gBXEt470gH6oyhZe9kMPyRPMA4mTW
   YQCE7/1hCirG/gW4Qh3kY2QShSB/rKg17PnOT9W+7PeNiJ1rEsJ7gVJYP
   hnVfDBeNRz/psPI5+peKP1/5GQD7arI/qt8esPnwXS9da4th6vgtSs15a
   wPixGPWEo3Fhs2ZYzCuQtZwwOKAEZjdRdLPUJsnoHlxERdMnN21l9841p
   w==;
X-CSE-ConnectionGUID: H4LjWKGlQcen0Kpvs6miSA==
X-CSE-MsgGUID: z3kKnRGbThSDrwVyyuuEuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34761701"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="34761701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:12:33 -0700
X-CSE-ConnectionGUID: jg5pZ9UfREu5rxxu6hpTjw==
X-CSE-MsgGUID: Jz9n0mLERYK/naav1hQwMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132610502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:12:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 07:12:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 07:12:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 07:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcB0kZwpAjR6c32Hf/rlkugqLuJqlNqU8vO7WCZUXdAM3vz/IYnRQmdvo/ZByvXRfnrPyKbQnWwiYk+0/a75I2THU2CqGbB6c3e1U8nlqOXz7ecBolFp97VLVey2FZYsLLigsEEy2SqT3LBN7OBGLp4p61OKUclNyzUOoLSS9GL77v0Ob6WmH3Xaqg7r4Qh8ima9ToSolOkDGfNlLDFNrzkJSRWXusZfJZJkUFAjh3mJJhEvEYKmFKE1DkU1BOBKU6/pGtpQzMlfoSO39QfKk5feEQ9Dum4jlIUK/Z58QGm4Cai+W+KXgmgHG5ghFrUz9SlocjqiXfqaEU5d/lqpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Si6tkeVD/6l7ZWCcChbhGBNhVUO5TI9PVKoyvO/UnA=;
 b=ivPnt8OMYnWjXHmu3hi32MPkEawBRrVjmJ8l8Q/mjc9jGFhQU6aHDP0kEWCS3Kh2HUHgkPSjWRG7bgTzSIPU8N+cr1ZF932X7/i/EM3dmuiOp8U1JEFUope5kQ1MQXu2mm4UyLI5Jr/D5kJIGPPreUNI6i5UY28hvvW/s/UWiQMvaR43VYkn8vTmO+8wxnBw5nSfVrtaxoT3WX99roeZN4OZolsBqplNCgROnS4ty47n0Np7mle05mgQKbw+u0TYPqCMH7QIuJAUpWBgxOQM/D7Yfcubqdi3wL+7e9BSF66M/gcTDATZUY8ts9drYwnFAZN1Ij2nyh4Bb2i+pTGScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.39; Thu, 24 Apr
 2025 14:12:00 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8632.030; Thu, 24 Apr 2025
 14:12:00 +0000
Message-ID: <d221a260-51d5-4dec-8c08-37d27dd80145@intel.com>
Date: Thu, 24 Apr 2025 22:11:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the
 preferred LLC is over aggregated
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>, Juri Lelli <juri.lelli@redhat.com>, "Dietmar
 Eggemann" <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, "Vincent
 Guittot" <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
	"Abel Wu" <wuyun.abel@bytedance.com>, Hillf Danton <hdanton@sina.com>,
	<linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>, Chen Yu
	<yu.chen.surf@foxmail.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
 <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
 <cd6065dc-837f-474a-a4f5-0faa607da73a@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <cd6065dc-837f-474a-a4f5-0faa607da73a@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: f3926435-c0bc-43e2-1657-08dd8339fab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3h1ZC9GS2czQ1JueHZsN2taQWxUbmVhM3RFY1oySGdWeGlQWW9PSVNqZ0JD?=
 =?utf-8?B?OE9Odm14dCtQM2R1TVZYTTR2SjdpSTRmcUkxMm9IWkduQVVTVFkyNURsYVVQ?=
 =?utf-8?B?c2NmL2lKcS9CN2x3bFhIcFZ4S05ISkg4VWZKQjlzNXpncmpBNDNqMS9uRXhh?=
 =?utf-8?B?WUtIOEQ3eGVjOU9NZGRjUWxnRXYrclo2REFSVXhoZXV4NXVIb05Kbnd0dGU4?=
 =?utf-8?B?b0tueFRxVUhJQWZ3dEpabEVCeWQ3bElmODdxWUZzRURsdWs3M2xuZDZORGZ2?=
 =?utf-8?B?TlRyeGE4bGtCcTY2c0w1bWJSdndtdjNXWXZsdXdqRHlQajlRTktQdzlkSUx3?=
 =?utf-8?B?cVFrS2VaRDY5cGxIcjc1Q0twMUo5N1pMdkpoMnRpYXRaeE8vOTNDOGRDWTE3?=
 =?utf-8?B?WjBNTHk1RVJHTmhTQWZ4SklidVBzTnQydEdQd1dnUXlRa3lOMXpuaXlpOVVG?=
 =?utf-8?B?ZUE2em1NOHJEQW9GbU53RVNzdmRuTFBnQ0phTW5UeWdBSVR0dkk2SklTc1ZL?=
 =?utf-8?B?Snc5SmpLTmVJUjB3cjVBSGZqOWs3VzhTblVqS0w0b1NBbWZMampVY3F4bklP?=
 =?utf-8?B?dGhCT2wrOXBkcFRUY2ZlNzJnZTh5eStGbUpCTGxRVmVYSG1JUlBud3BYRDdn?=
 =?utf-8?B?Y2E5UE5XSG5BM3dsMEhlVmVzU2lFOXhqa3dCS05KMkR2bnptVzhQV2RwRm9i?=
 =?utf-8?B?bFZQZVRFS2N1VUhEVTA4dmU3M0cxV051a0ZFcEliaEROUWVNMDJNajA0RXFn?=
 =?utf-8?B?YW5UUmJGUVVhRW85ajhnR0Q0RTNuVEJmRHl0WVhPU2hjeHpjNUFwTnp0RXJO?=
 =?utf-8?B?d245TS9TUzBrZUc5dWp6QktwU0puVW9ST05ubG1kb1VyTWZna2xEL05yQklz?=
 =?utf-8?B?dmFhRmZXQVVUNmIrTFBOUFpFY25wWmIrVFowd3FXUE1FVWI0MW9BV29ZL2VS?=
 =?utf-8?B?a0k1NEJqOWswQXF2cFFidnU5c3J6ME9jajV3N0RFWThuSnI0a1I4QmZNTThI?=
 =?utf-8?B?c0h3RmN6UkxQNlJhREtRQllJTVFNbzJPR0UwanlJNjFZQVBVbnFXZTZjOGlQ?=
 =?utf-8?B?Ym4vSW0rT2lqT042MEcyeWxSdUcvSHdkMnpXQUFqZzV4NHdXVEFlcVVRYm1Q?=
 =?utf-8?B?UVFDSk9oL3VTVWJLYWl4SVJCNU1ITXgreTd1ZkRLRHlTbVFLRVRTNkEyUDJD?=
 =?utf-8?B?blJyQmtnM2dzK20yUWFQbjdKcG1LZVMzcU5PckozZVp4YzJmK2dXZnZuUGlN?=
 =?utf-8?B?R3NKUmpITzFqenVXSnRrZHdPVHVwcHZIb3IyVy9Ob3lQK0huQXQ3d0R3NTdt?=
 =?utf-8?B?bHVyWnhRRXBwYzdtR3F4cDhveE5zVmpxamljd0hwSFo2a0ZnaGRvR1cwOFJ4?=
 =?utf-8?B?WGFkcldMcVRlOTBhSDkxQ1IrenJDUmRVYXNteSt3MHdqMmRUSnVwa0xWWmdl?=
 =?utf-8?B?UWdvTlUxTHVOWVdad1NlNklBcGZXQzNxcEEvdHZsUmd0TTB3ekdzM0tEL0JC?=
 =?utf-8?B?SEpTR3JmZzlqWUJ0Y2JOQ2JMeUJjdDNPcnMrcEZzVitUaU8wVjRYZUdVV0VO?=
 =?utf-8?B?N0NMaGQ5RG1UbzZVUGlid3pLNnB0SVJkbkUxOUphK25iaWJhNG5Rc2NiQ09G?=
 =?utf-8?B?M2dTS3U4dUlSNC92ZFdQSVYxZTFuRzJYT2x2MEpNYjlvTEFHLzNqRXZZM2Ji?=
 =?utf-8?B?UjROMUh5MVN2d09TaFNWQ3IxalducG12TXNxeklzUEEzZXhwaldPbFlGalgv?=
 =?utf-8?B?cnlDa1E5TlJTTm9ESnpxUTdLRkRYbVIzT2t2RFlTYktqOVVmRTN2VFpHQUJY?=
 =?utf-8?B?VGh5SWgwQmpVM01TRUwvTEgwUkRlbS81RjVLbUdnSHZWNHllNDRpbExMSS90?=
 =?utf-8?B?NGJadkNHNlNFMXV5U0w5Y2lyb3FXMEZrV0RRbEQ4angrV2RDTW55M1phWnBN?=
 =?utf-8?Q?vL3q3Una3i4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBpbTVzMk04WDFyd1hFcC9GK1RDeEZ6cGVsbTFCRWNYNUpMazR5Lzh0YUFZ?=
 =?utf-8?B?QjBzbzI5TUVyOGtFY28zVWsrSFhsWnhtVnFUWk53SlFQSHFHdTB0eEJHQjVs?=
 =?utf-8?B?RDcvbUMwZG5hSDNZN3VKZ29ZMjk0UzZIZGtwNkpTb0I2R09sUGVsRDhUVHdp?=
 =?utf-8?B?WVBia0NRRzhJNitTRTlaTDZFd2IrWHRXTEhTcCtoNXZBOFgvNSt1SllPNEZR?=
 =?utf-8?B?MktsR29BZ1ZIYit0bS9oTmR5ckgvMXQ3VDVEU1Qxc3FjQkpXdm5zZWpzN1Uy?=
 =?utf-8?B?S1MwMDRiRy91SzVNZUdaaUpobTk5b1FNVjVYU1pOa2N1QnkrUGdCYzU3RGdv?=
 =?utf-8?B?R3l5djI1eVE4bGpLSDJybnlBUmtIU3BWNjl4V2l6NWhLc1R2cy9lbmJQTFFk?=
 =?utf-8?B?ZGtVU1lTSTdUQkUya290cUJIOXpDUXREcHYrWTdpcE5wR2RrWXlPR3VMeDJB?=
 =?utf-8?B?RXlKajhxbkVrMUQ1OS9nWUVXMVVWcWtuNldVY3RWWmh3Y3RvY3VvYWhOSGtk?=
 =?utf-8?B?SjJkT24rL1ZOTFViUHF5Ym5vblgvVUNvd3hzaXFIaDhnYnZPUlI0aE5EbDZu?=
 =?utf-8?B?RUF5YmJOaHZ6NS8vY0JuNlYrbi9hc2xEWStyZ2VSZUtNR0JkM3d2T2VjNExl?=
 =?utf-8?B?L0RpS0lreW4rUWt1NlVxam9uYW1jUjBsSEFVeTlXbldtR1lZMzNRaHF1TnBV?=
 =?utf-8?B?WnVOUndaTGduL3VJUWlLbzJSNjN3RW5jTWg0eW1vVDN0VTI0dnNUOWJIR3Uy?=
 =?utf-8?B?Sm1aUHQzWEVWY3p0cWRXTzVGMUU5RS9qaitFWWtFZWc5YllOTlFNbG9hbDBK?=
 =?utf-8?B?RmdiWlhKY1pnWVF1TnZMNktSckltbUhIOXY3d0gyTHU3eEt6eFgxaHZpUEFH?=
 =?utf-8?B?ZjFIWnZRVmw1S3QrS3M5dHpodnl3QVoxMGQyVkt4TFhWNko4cEUxdU9idzgr?=
 =?utf-8?B?VmZMR0VkY0lBOFdGTGZmUU81eW1iK292bW82TjhmNVBUOVJkempoMXI1UFBs?=
 =?utf-8?B?ZVRCbDArWWR6VWZVeXVQeWtoU2tybmhzY3lTVmtTZTBveExYWTNwbFRxVTFD?=
 =?utf-8?B?WVIwbGIwcWJMcVMzUXBSSnRIZytWaGRCZE1kWTJSZGZEcGY2TDJQM2FiazNK?=
 =?utf-8?B?dVpRR1BEeFJVbTJIUmVFYzhZa3FXVXpRK09KQ002VktJRWlpSXdHMSs5elkv?=
 =?utf-8?B?VzJwcWNRNU5vVkh4NkM4TWl4ajJiZTVJL0dVN2UzUUdOWmpTVlNLR2Vacmg1?=
 =?utf-8?B?dzVTRmJnZWxhSU1nRkNhU1lubWFLb1ovenM3eXJ2YnZIdCtoSU1hY21UOVFF?=
 =?utf-8?B?VTVPS1E3N1lwZ1FDNStienRhOVlmVHRPTmlCMVB2M2NJRHlKYXM1WXNBdkxj?=
 =?utf-8?B?OG9YVTFmcjJDT0wyRVovbG9VWUVzTkZkNDBiM3VQZFFXVzVXdEJxYXZoRHUw?=
 =?utf-8?B?bFF6UDdJNGxsNkIwVHdMUC9ic3ZhMXFCMW44QXE0SFN4WDYyOXdRKzdXNlBZ?=
 =?utf-8?B?Qis2SHk0SVN1YnpSNVlzYS9lUEJucDRWSkNUTjkrOEFKS3ZxTlJqNzlSVjFs?=
 =?utf-8?B?MU9OQlRERG56SWtxSm9PSXEwMDl0akRCZGQvOVNEaVg0OVFZZEg4Y0Q5aEpp?=
 =?utf-8?B?L1hoVW42QTAxeTZLcmJtK3FtenIzNWhLV1hrTzZiYm92M1V5Z0graERSdHIz?=
 =?utf-8?B?Y0h0bkZOR24zUVZSRzBKN3dhUHNCRXZyMmtSZFovSFoyQndvVlVPM0diZHNV?=
 =?utf-8?B?ZTJLYzdmcU9jZHBXZDhQa3kzK0Z4ZFU5d2tFSFRTcFJaUmM2c1VSQlNGc2Nm?=
 =?utf-8?B?WlhUVk5kbHdBZE9UUHYwOXJxNm1wcFRFRGluclZMVm16V3RETFNZUDZUaG9N?=
 =?utf-8?B?aUl2bWZhQkUxYWNSRjhwcU5Bc0h3bFJ3UDRjRzh1ZlRRZDRtaTVuMU9OQ3ZN?=
 =?utf-8?B?YWtJUmUxQkVDc3pGZXpPTTY5QjhSd0cxRXpwQ0JON244ZTVhYmVWd1Nydkp1?=
 =?utf-8?B?dDJYNmdjaFRmU0QySk00M2dLU1E5ZktMVnVnVWRHbllnS2ZpQS9ST2hld1V1?=
 =?utf-8?B?OHN4NjBhbEN1NlVRSldwQk9SSGVhUnZwTEJveCtNZ1VvTmkzOHBoRVIzVjht?=
 =?utf-8?Q?OjYbbp0ygqA+VGDCljZMynSP+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3926435-c0bc-43e2-1657-08dd8339fab8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 14:12:00.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igq//6SLMid/pCOrU/tVACxcyQ6//GRAu2eKaVRfv4T0nG8UQHVqwSsGn4dSwV27KSDnTPbjHKDZY8lzYYVjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
X-OriginatorOrg: intel.com

Hi Madadi,

On 4/24/2025 5:22 PM, Madadi Vineeth Reddy wrote:
> Hi Chen Yu,
> 
> On 21/04/25 08:55, Chen Yu wrote:
>> It is found that when the process's preferred LLC gets saturated by too many
>> threads, task contention is very frequent and causes performance regression.
>>
>> Save the per LLC statistics calculated by periodic load balance. The statistics
>> include the average utilization and the average number of runnable tasks.
>> The task wakeup path for cache aware scheduling manipulates these statistics
>> to inhibit cache aware scheduling to avoid performance regression. When either
>> the average utilization of the preferred LLC has reached 25%, or the average
>> number of runnable tasks has exceeded 1/3 of the LLC weight, the cache aware
>> wakeup is disabled. Only when the process has more threads than the LLC weight
>> will this restriction be enabled.
>>
>> Running schbench via mmtests on a Xeon platform, which has 2 sockets, each socket
>> has 60 Cores/120 CPUs. The DRAM interleave is enabled across NUMA nodes via BIOS,
>> so there are 2 "LLCs" in 1 NUMA node.
>>
>> compare-mmtests.pl --directory work/log --benchmark schbench --names baseline,sched_cache
>>                                      baselin             sched_cach
>>                                     baseline            sched_cache
>> Lat 50.0th-qrtle-1          6.00 (   0.00%)        6.00 (   0.00%)
>> Lat 90.0th-qrtle-1         10.00 (   0.00%)        9.00 (  10.00%)
>> Lat 99.0th-qrtle-1         29.00 (   0.00%)       13.00 (  55.17%)
>> Lat 99.9th-qrtle-1         35.00 (   0.00%)       21.00 (  40.00%)
>> Lat 20.0th-qrtle-1        266.00 (   0.00%)      266.00 (   0.00%)
>> Lat 50.0th-qrtle-2          8.00 (   0.00%)        6.00 (  25.00%)
>> Lat 90.0th-qrtle-2         10.00 (   0.00%)       10.00 (   0.00%)
>> Lat 99.0th-qrtle-2         19.00 (   0.00%)       18.00 (   5.26%)
>> Lat 99.9th-qrtle-2         27.00 (   0.00%)       29.00 (  -7.41%)
>> Lat 20.0th-qrtle-2        533.00 (   0.00%)      507.00 (   4.88%)
>> Lat 50.0th-qrtle-4          6.00 (   0.00%)        5.00 (  16.67%)
>> Lat 90.0th-qrtle-4          8.00 (   0.00%)        5.00 (  37.50%)
>> Lat 99.0th-qrtle-4         14.00 (   0.00%)        9.00 (  35.71%)
>> Lat 99.9th-qrtle-4         22.00 (   0.00%)       14.00 (  36.36%)
>> Lat 20.0th-qrtle-4       1070.00 (   0.00%)      995.00 (   7.01%)
>> Lat 50.0th-qrtle-8          5.00 (   0.00%)        5.00 (   0.00%)
>> Lat 90.0th-qrtle-8          7.00 (   0.00%)        5.00 (  28.57%)
>> Lat 99.0th-qrtle-8         12.00 (   0.00%)       11.00 (   8.33%)
>> Lat 99.9th-qrtle-8         19.00 (   0.00%)       16.00 (  15.79%)
>> Lat 20.0th-qrtle-8       2140.00 (   0.00%)     2140.00 (   0.00%)
>> Lat 50.0th-qrtle-16         6.00 (   0.00%)        5.00 (  16.67%)
>> Lat 90.0th-qrtle-16         7.00 (   0.00%)        5.00 (  28.57%)
>> Lat 99.0th-qrtle-16        12.00 (   0.00%)       10.00 (  16.67%)
>> Lat 99.9th-qrtle-16        17.00 (   0.00%)       14.00 (  17.65%)
>> Lat 20.0th-qrtle-16      4296.00 (   0.00%)     4200.00 (   2.23%)
>> Lat 50.0th-qrtle-32         6.00 (   0.00%)        5.00 (  16.67%)
>> Lat 90.0th-qrtle-32         8.00 (   0.00%)        6.00 (  25.00%)
>> Lat 99.0th-qrtle-32        12.00 (   0.00%)       10.00 (  16.67%)
>> Lat 99.9th-qrtle-32        17.00 (   0.00%)       14.00 (  17.65%)
>> Lat 20.0th-qrtle-32      8496.00 (   0.00%)     8528.00 (  -0.38%)
>> Lat 50.0th-qrtle-64         6.00 (   0.00%)        5.00 (  16.67%)
>> Lat 90.0th-qrtle-64         8.00 (   0.00%)        8.00 (   0.00%)
>> Lat 99.0th-qrtle-64        12.00 (   0.00%)       12.00 (   0.00%)
>> Lat 99.9th-qrtle-64        17.00 (   0.00%)       17.00 (   0.00%)
>> Lat 20.0th-qrtle-64     17120.00 (   0.00%)    17120.00 (   0.00%)
>> Lat 50.0th-qrtle-128        7.00 (   0.00%)        7.00 (   0.00%)
>> Lat 90.0th-qrtle-128        9.00 (   0.00%)        9.00 (   0.00%)
>> Lat 99.0th-qrtle-128       13.00 (   0.00%)       14.00 (  -7.69%)
>> Lat 99.9th-qrtle-128       20.00 (   0.00%)       20.00 (   0.00%)
>> Lat 20.0th-qrtle-128    31776.00 (   0.00%)    30496.00 (   4.03%)
>> Lat 50.0th-qrtle-239        9.00 (   0.00%)        9.00 (   0.00%)
>> Lat 90.0th-qrtle-239       14.00 (   0.00%)       18.00 ( -28.57%)
>> Lat 99.0th-qrtle-239       43.00 (   0.00%)       56.00 ( -30.23%)
>> Lat 99.9th-qrtle-239      106.00 (   0.00%)      483.00 (-355.66%)
>> Lat 20.0th-qrtle-239    30176.00 (   0.00%)    29984.00 (   0.64%)
>>
>> We can see overall latency improvement and some throughput degradation
>> when the system gets saturated.
>>
>> Also, we run schbench (old version) on an EPYC 7543 system, which has
>> 4 NUMA nodes, and each node has 4 LLCs. Monitor the 99.0th latency:
>>
>> case                    load            baseline(std%)  compare%( std%)
>> normal                  4-mthreads-1-workers     1.00 (  6.47)   +9.02 (  4.68)
>> normal                  4-mthreads-2-workers     1.00 (  3.25)  +28.03 (  8.76)
>> normal                  4-mthreads-4-workers     1.00 (  6.67)   -4.32 (  2.58)
>> normal                  4-mthreads-8-workers     1.00 (  2.38)   +1.27 (  2.41)
>> normal                  4-mthreads-16-workers    1.00 (  5.61)   -8.48 (  4.39)
>> normal                  4-mthreads-31-workers    1.00 (  9.31)   -0.22 (  9.77)
>>
>> When the LLC is underloaded, the latency improvement is observed. When the LLC
>> gets saturated, we observe some degradation.
>>
> 
> [..snip..]
> 
>> +static bool valid_target_cpu(int cpu, struct task_struct *p)
>> +{
>> +	int nr_running, llc_weight;
>> +	unsigned long util, llc_cap;
>> +
>> +	if (!get_llc_stats(cpu, &nr_running, &llc_weight,
>> +			   &util))
>> +		return false;
>> +
>> +	llc_cap = llc_weight * SCHED_CAPACITY_SCALE;
>> +
>> +	/*
>> +	 * If this process has many threads, be careful to avoid
>> +	 * task stacking on the preferred LLC, by checking the system's
>> +	 * utilization and runnable tasks. Otherwise, if this
>> +	 * process does not have many threads, honor the cache
>> +	 * aware wakeup.
>> +	 */
>> +	if (get_nr_threads(p) < llc_weight)
>> +		return true;
> 
> IIUC, there might be scenarios were llc might be already overloaded with
> threads of other process. In that case, we will be returning true for p in
> above condition and don't check the below conditions. Shouldn't we check
> the below two conditions either way?

The reason why get_nr_threads() was used is that we don't know if the 
following threshold is suitable for different workloads. We chose 25% 
and 33% because we found that it worked well for workload A, but was too 
low for workload B. Workload B requires the cache-aware scheduling to be 
enabled in any case, and the number of threads in B is smaller than the 
llc_weight. Therefore, we use the above check to meet the requirements 
of B. What you said is correct. We can remove the above checks on 
nr_thread and make the combination of utilization and nr_running a 
mandatory check, and then conduct further tuning.>
> Tested this patch with real life workload Daytrader, didn't see any regression.

Good to know the regression is gone.

> It spawns lot of threads and is CPU intensive. So, I think it's not impacted
> due to the below conditions.
> 
> Also, in schbench numbers provided by you, there is a degradation in saturated
> case. Is it due to the overhead in computing the preferred llc which is not
> being used due to below conditions?

Yes, the overhead of preferred LLC calculation could be one part, and we 
also suspect that the degradation might be tied to the task migrations. 
We still observed more task migrations than the baseline, even when the 
system was saturated (in theory, after 25% is exceeded, we should 
fallback to the generic task wakeup path). We haven't dug into that yet, 
and we can conduct an investigation in the following days.

thanks,
Chenyu>
> Thanks,
> Madadi Vineeth Reddy
> 
>> +
>> +	/*
>> +	 * Check if it exceeded 25% of average utiliazation,
>> +	 * or if it exceeded 33% of CPUs. This is a magic number
>> +	 * that did not cause heavy cache contention on Xeon or
>> +	 * Zen.
>> +	 */
>> +	if (util * 4 >= llc_cap)
>> +		return false;
>> +
>> +	if (nr_running * 3 >= llc_weight)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
> 
> [..snip..]
> 
