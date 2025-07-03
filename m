Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E32D6401
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535465; cv=fail; b=AO0LCOaYZFI56cZu/gfG6WKqmAxv5mj4I7mJOgu7fnigse+FseGI/oa3UJiDDNnYMA4p6pBqoKsIusL4O5ZD8t6fCFLQsR7lGhKFLGoFxhN33bxp3C78jMO4vfXfEHFaJ8zhmXlOcdDGxOPPdzOq4XQ6RfI9W33Md2IoZaLvd1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535465; c=relaxed/simple;
	bh=0wFIAvjp+I82bJlH7BxDB6R8Sp2+2KWxTv7DSoyfCoU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P2P9WBcffAh6lFrJlWBrhAOy73L5nNfcaxymjJtvdk0EjMam/V//13Re/JNsbRETFSS5G6dVxH3JpJhUGz9eG/bLIgV/SjNtvdjcwiGgtsBwOHuP2eSY7wYgzq2b70y+TsUsDP+/cmUmNG/jiax4JfoNb0vj+GatPN24CeB06ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOOzafiD; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOOzafiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751535463; x=1783071463;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0wFIAvjp+I82bJlH7BxDB6R8Sp2+2KWxTv7DSoyfCoU=;
  b=TOOzafiDq4uSq4llUmbrxb8OyLL7swtzsJ55yC60JFYyzGlogW2tiqoj
   GYBYFUXMPl3q8CluZcOsS/3q7jJKpvhEsBF6BBU1rkECmjJHUQ1/sgJMN
   jlLTJ4VlTCe2XTKpfTyq4G3cJ2y5BreInsYZj5Ys2f5cZdDi79pPriNRa
   iXVtnrVRKHZekc08/Eq+str+M0cWt8fq9lq1aHV7M5SIoSdg2V+zQ1tLp
   BvJSi8rchiExRNVEGaKKLneUemN432NdTEZBNdCVT8ep3WIH20GLVgf9H
   x2LSb/BxUR000D12D9Mp2PSYsTG8tOc+m8gsTzSvb8O6krBlRWSfd+rIQ
   Q==;
X-CSE-ConnectionGUID: n/7vOGH3QimipSYU/tHeLw==
X-CSE-MsgGUID: BbrX6M2eS7ChFMe7ePVfNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57528396"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="57528396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:37:42 -0700
X-CSE-ConnectionGUID: wCFkvqp/R/qrrPswtAKrfg==
X-CSE-MsgGUID: F9jrEBFlTWacAI6x+NowCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158365423"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:37:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 02:37:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 02:37:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 02:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBYtBQEzoDGy9DX5q+lffSp7NNTpHzpBezne08uMSHF+Mo1KXqF/gjPR+zGiGQWE8CfvUNNzNni/4MiimwD49dpQZ5Q2+3J8uGyAUKKbqBrE7y7tpEb8iFOYaldVNUkqHz8+6WY0+ETI6zGCZ/G/miHTCziPnKFtsnJYVt2xCS4EncZ8U+MlPGjtjhYXTPWauqS1aWZyuBox37ZirMUjNZg7ZbfhvckyWfHSDXwZssNZNoI5vElrFRz6vvBtcipy0LaS7Xf9yC3VvqzVX6Phhw7+8PxL0gM0Nt9xhqlkB6RNgG2LAQquugIxDml9nK0y/7fPD9+3/MxD6htTlrRi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RO7BvY7gATn6ZWtQ8RiDseZsm7IvpRNZCXR/rfB1k4I=;
 b=g85k9bjv87xgUXPW/5dRid9zgggkCtHHjeQ2zbkFUtBrP1aJ7RRsKYsvkPNdQekfPdEY3XoMT3pXkNd3LP66ltisV+kFI7K9zj4EXCvVvDvke7sQ4ZJiDO1eXF1d/2r+p/c7tbsVSGH9AyrbaSajED92XuRxEOQIRyGAFPIkvbYYjnB7Y/nfrf8j3lD1hW9595yh1zx5fvbJpJvX+mWIlsaLVFCH2VVx4fh93qZ6uU8hAEjvS6M7+IB2nnPphm1ujqLsmapr3sOsfO6DItjgXQgCE7DA3x6fTtqkn2qT0v4MUt8fHNNtJe5VQRJ38/hXkQQCsJ0rppab3MJjGWsGEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.34; Thu, 3 Jul 2025 09:37:35 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 09:37:35 +0000
Message-ID: <b6b9e035-5227-4aab-a0cb-0ab6e4d57f9a@intel.com>
Date: Thu, 3 Jul 2025 17:37:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Michal Hocko <mhocko@suse.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Tim Chen <tim.c.chen@intel.com>,
	<linux-kernel@vger.kernel.org>, Jirka Hladky <jhladky@redhat.com>, "Srikanth
 Aithal" <Srikanth.Aithal@amd.com>, Suneeth D <Suneeth.D@amd.com>, Libo Chen
	<libo.chen@oracle.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <aGYutwftSAPgPzf-@tiehlicka>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <aGYutwftSAPgPzf-@tiehlicka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::21)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 5981db56-aabd-4fe8-f8ad-08ddba153d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFUwZStyK2h2S3YyeGxsNGpJM2VJaUFBQkQ3enY0WnMrZUxWWTB3cVp1NWRt?=
 =?utf-8?B?dDVmK2JhZUdnbDUzeEYvVStDZUozbWxKVGxwc3NES01MUTZUY0wwM2RzcGdP?=
 =?utf-8?B?SmtSaGs0eVNzZnNSSk5YQXVOVmVwKzRpeVlUT1FRNTNZOHYzMlN1K3h4Z1Ft?=
 =?utf-8?B?NTNVYWNVbEF3aWJ0ZTRnWVZ1YVpockZ3R0FMczB6aU9SSDc5RkFEbmVYMENj?=
 =?utf-8?B?OUxhYXp6OU1OZ2t3RXZLaEJEZzJ4YnBHZ3AyOTZOemplZWN4a1dDUENBK3RJ?=
 =?utf-8?B?VktVaDVHVnhYSVY1MmVrUHdmMElXMy9XY0kxN1ZZcU9Pa2pVSVF6MVkyYUZW?=
 =?utf-8?B?eWcycjZxOWp1cXhaaWFIQXByZVIzZ1kzUGhXNnNEeXV4RUk0cGdoV1NWSFZV?=
 =?utf-8?B?TmQrTnFkWEl0bVc4TUs1Y3MrcUJOL0ZIamh0WFRRQ3A3SGlZNXdGMkxGUjg2?=
 =?utf-8?B?a1NWemQ2UE1jcWxKUXMrNmwwT2dTUEdvQnRZZVdhQ1M1UEk3eXRwTUhOdjh4?=
 =?utf-8?B?dW1aWkdLT01SYjZ4ZXcwTHdHdk9YSHVTeTdQMWVhci93Z1FLUWhRRnZzMzhC?=
 =?utf-8?B?TnlVRjJlTkx6KzJyaUVXbDk4aHIzK3BpZ2dmSzlKbEc4NTZ0UjVVNXRnaW1L?=
 =?utf-8?B?Vm5FOWhBbmVpRDdtZVp0aWMvdW0vYUd3T216WE5xZDhBZkhCNEtxaWlWR0h0?=
 =?utf-8?B?QWN0c0hZVWo3dVlucWdqQ3FGK1pmcDNKZVVtK3IxbnoweVdZK29hYzFQUTJ5?=
 =?utf-8?B?RTVQbS9wZXM4eWpEVTF6Z0lJak9sY2cybkhiVGYxaEVVOTYvVkJBdzJybTdU?=
 =?utf-8?B?ZTJRdEM3NWRLUktJTmdRZm01YUlHRS8wckd1clV4WHpUSDVpZkwzeHkrRkVt?=
 =?utf-8?B?QXRlTlprWWRXR2ZNemg2bDl0bTkrT0ZpWlc3T0tTYURGcUlrZE55UEVERmdz?=
 =?utf-8?B?VFEvWE9sdGZGQWJNVlNOOGpOUHJZOVdkVVJSYW8waG9yWG9NblhqSGwwTTFM?=
 =?utf-8?B?MFZPcWRRd3N4dDBwSzdCc3puY2M0cVpxSGtwLzJmNGkwUGhMc0lxOHMyVmFv?=
 =?utf-8?B?ck1YdE9GMGVaaXhoYzdvRHA0YkhxRkpCbnNKVUROdnZKUWNWTkNnalZ0VVdt?=
 =?utf-8?B?Um5xd0gydm45ZndKK2x4SGJ5bzRyYmVmUUZCUDJWa0F6M254SGsrbHVEY3RB?=
 =?utf-8?B?bTBEbjNoTmtZS3cxQ1lDSy91dmlQZXl3QXFQMEN5N2lkYzJuZ2RXK3czcFg3?=
 =?utf-8?B?Y29xcmRsZmV3U2kwREJUUHQ0WG9GV2l3VHNCQ2FLRFdqbFRBaE9OZUpGUXZ4?=
 =?utf-8?B?NzZXTkhpdTUwM3crMWd1V0NPbXdHdTNCaXJQL0hzeGRxLzhGVit5TEw3MjYv?=
 =?utf-8?B?VFJHMjhGVmpEV2Y5UEFrbHNIRE5lMVlQNG0zMnp2VFFTTjhYMWRwNlR6RSth?=
 =?utf-8?B?b3BjMEhSNHJlZTZiNDVBQjQzQW5WMVMrb1AwSDBJNW9URW9xSmd5N3hnYjk0?=
 =?utf-8?B?Wit1OWRBOXhlYUdTNkdBRld2N0FLSVlDOEhCR28zSW1JeG5kY1BxN2NjYVUx?=
 =?utf-8?B?bzBnZEVTOW9aeklFNDJQWjl2UzBZT1hsd2h4dENXNjJOdnc1a2tPK3RYdEV4?=
 =?utf-8?B?Q3o5SEt1VjM4M2l0Z1RIcWNISU5tME5KSWIxWDRNZk9UOUxkVVd3NUNZNjI4?=
 =?utf-8?B?dWZqcmNTODlncHVDYTg3RTJPMjBpMVJKQmwwY1kzRmdEejRkTGRzMnE3bG0z?=
 =?utf-8?B?VFlYOXVBNGU3Tkg3QzBHRWRSUlFDcHVJVnE4WDhBT1E5Rzc0dm4zMHZpMDlS?=
 =?utf-8?B?VnZaVEdINGltQVdkZW1xc3oxZWxMNnhiTnU2YzhzOUtQVnhzRzJFMVNESlM4?=
 =?utf-8?B?YXIvWUVRL1Z6VjF4ZWF3TStlbE42SHMwWUluNXVCYWEzaUZkYzVIUHk3M2Jm?=
 =?utf-8?Q?dCaX6pxXhfU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitxdzYwQ1ZWaFNaWGVRblp6WE1JQlZ3TGJMdHNUZmllUnBqVFRrMkxqclFo?=
 =?utf-8?B?RGs3NUlOZHBmbTV4MXBicmxUVzVnSi9hdTBUNnRGNk4raXNJbGVYZThGRktw?=
 =?utf-8?B?eFhFaHlkc0FpQk1FZ3hteW5mcUdSYVlKdVp0TExCU2hBSGJmSHgwS2RBaFBa?=
 =?utf-8?B?T2VnVDhYM1E3a1ROMmZHNGM3UHVicjNUbFczNU1OTElRV0Qyc1hJYWdDN0Jh?=
 =?utf-8?B?NUUzU3NnQ3JWci8wS3NjSS9MbGVHRjJ5R0IyY3pDeVhTWml3Y1pPZ2Q3dGRt?=
 =?utf-8?B?NHphSklsN1lHM3NRSXFCc2t4WDhZUjNoQURKeC85Ymozc25SdnFXaXZvNWpZ?=
 =?utf-8?B?M2NkeVlkN2Y3UTFnTGMwUmRTVEZ3d0NnSDIrZ2lyS0kzUGRYeGtxcWpBWU1B?=
 =?utf-8?B?clpnWG9HZVkweWpmVHFVaWM2S3dwUkxYVldHejJub3VOV0cyalNJU0IzQUpJ?=
 =?utf-8?B?VEdTRjZDSjBBaGYvSTNwYmtkbGVweWFtaGoyK0dKa1VmZE16Q0lNSnMrY0E0?=
 =?utf-8?B?a0FyS3NaOFVhTlBXcnJHcG9oZnJNbktyc2dtcXU1SWV5WkY5TlA2K3lQZGRy?=
 =?utf-8?B?ajdDOVhiN0ZoempFOW52WkV5eXYzdG5DUEU0eWVNZlZNZU0ySCtPZTdENXVT?=
 =?utf-8?B?SE9BcWpjeHRnSHNqbXVYaWwyazBDUlVXbmhuMGRuYTJFR2paaS9oNEFWZHE4?=
 =?utf-8?B?b2tXeGJQNGppdlBTRXRWZ0hQQ3JwanhNZG1QTW8rZ2JmMGJaOFhyYTlmVExG?=
 =?utf-8?B?b29PVzM0SjRFeHNxTVlidDFINEdrZ1QwMC9QR2FneFdXRFpyV1p5RGkyaVdm?=
 =?utf-8?B?OVhuKzI0V1J1NXhqKzFyWEhNcitTS3RTLzh6YmZINStIZFgxdytITkdtMm8v?=
 =?utf-8?B?YlI1QlJoMytqL0NjYlNrSTdteWk4RUdLSFJqMVVFRjFOVC9TVzEySnQ1NVN5?=
 =?utf-8?B?OFZuajM4QVlJTHh4aTRRZmx4Y0N2ZkcvY1M5bE1ocmZuZ1hITHFXcWZoRkts?=
 =?utf-8?B?dlFEdktiT1N2OFhjbmplOGN3VU1Ia001S29FZTBzT0E3bG9pUlhMT0JvWkRl?=
 =?utf-8?B?clg5V29RQUVDU1RET3p6RkFvR25rMTlrMG5wdlJpN0xSNHJhL015VVJ2TG5O?=
 =?utf-8?B?dXFVMUo5bzN2Q1dOTkpUeld6M24zbjlhU1ZtcEovdllKZ1hVZWpLRmtqb2cz?=
 =?utf-8?B?enMwSmoxcVVFN2x4cWszRG83TG0vY1h1L0hNU0ZRT0Ewa05XQVc1UEJFK0Va?=
 =?utf-8?B?aWVqRkVmNHAvK1dhVlcrK1dHZEJuQnhKOVhOQ3JtZDRxMDQvYS9lTno1NDRR?=
 =?utf-8?B?NHQ1V2tjM2JTdnB3WDRKdk4vYXg4dUJkVlh0WFl4S1lPaDJBUkVMeEtuV3dF?=
 =?utf-8?B?MFhmNG1ncytQRmRuYmRIQmZsMjg3TlFnSllaNXJLVWk5WU94dVVMTmxScUpR?=
 =?utf-8?B?aW5WRTl4WGxIVUwrY3R0MXJ2UUMzRFJiVFNobFVEemljVi9MMVFYZXZ0VWFG?=
 =?utf-8?B?Z3JGU2V0a2tvakd1ekdFRnJ3MklnbDByZHNIOWpLWWhlbExWcFNwVDJadzBP?=
 =?utf-8?B?a2dqSlZBM1pxQ3FoVTZZSTBQR1grOCtkaUVkc3pYNkdGZUpuUkJqaVZuNnZr?=
 =?utf-8?B?WmxvUnR0V0g3cklsTEkyQis2ak9ZMHZ6QVRwZ1h3K0xjYkx5YndjeVZEZDhN?=
 =?utf-8?B?WjREQlVjalFTOERnOW5SWDhYMVRZS3hPMjNxSjZzbkF3ZE9CWVB4WDdML0Y2?=
 =?utf-8?B?Um5sR3FBTnNqWTdFRkxXOFhMK1daNG0zUU5OR2RXbTlCSHpMUjh2cEowZzFH?=
 =?utf-8?B?MStETWZyblhmWXgwYnVkQ0tGa1FwMGlKWm1yVFYycWFnaHRIaWdiZlRpVER4?=
 =?utf-8?B?YXU0TSt4aFpyYTYrYWRjRGNsT1E0SWlWZ1JoMWNkb2NmZWluTjE5bnI2aGo2?=
 =?utf-8?B?S0FZaHpzVW45Uy8yRFdWQ2ZlZGc2SzN4c1FaMG5wUnJ1cXRENVhIdUY4MTlE?=
 =?utf-8?B?TzZ3aEpiVUJad2VOZ3ppa2EzQ2xXZDF6b1dEOTlQYTBXQzhzUEI5VDYwQktp?=
 =?utf-8?B?ckJkU0pwWXRhK2xHUjVFZ1JtUTV6UndVMStIb1NrK1NROExobG5MV09uTW85?=
 =?utf-8?Q?EhZGCEK5ZrvF5/KGHBL8BnXYR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5981db56-aabd-4fe8-f8ad-08ddba153d81
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:37:34.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dd4eLHBufvfU1LJ99aelUHthBT7MCDUe4vrY+c8r+4kIIZBHOglTURUm/czzgzECbaeSV/IC3DMxRg7WOAVFrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
X-OriginatorOrg: intel.com

Hi Michal,

On 7/3/2025 3:18 PM, Michal Hocko wrote:
> On Thu 03-07-25 00:32:47, Chen Yu wrote:
>> It was reported that after Commit ad6b26b6a0a7
>> ("sched/numa: add statistics of numa balance task"),
>> a NULL pointer exception[1] occurs when accessing
>> p->mm. The following race condition was found to
>> trigger this bug: After a swap task candidate is
>> chosen during NUMA balancing, its mm_struct is
>> released due to task exit. Later, when the task
>> swapping is performed, p->mm is NULL, which causes
>> the problem:
>>
>> CPU0                                   CPU1
>> :
>> ...
>> task_numa_migrate
>>     task_numa_find_cpu
>>      task_numa_compare
>>        # a normal task p is chosen
>>        env->best_task = p
>>
>>                                          # p exit:
>>                                          exit_signals(p);
>>                                             p->flags |= PF_EXITING
>>                                          exit_mm
>>                                             p->mm = NULL;
>>
>>      migrate_swap_stop
>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>
>> Fix this issue by checking if the task has the PF_EXITING
>> flag set in migrate_swap_stop(). If it does, skip updating
>> the memcg events. Additionally, log a warning if p->mm is
>> NULL to facilitate future debugging.
>>
>> Fixes: ad6b26b6a0a7 ("sched/numa: add statistics of numa balance task")
>> Reported-by: Jirka Hladky <jhladky@redhat.com>
>> Closes: https://lore.kernel.org/all/CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com/
>> Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
>> Reported-by: Suneeth D <Suneeth.D@amd.com>
>> Suggested-by: Libo Chen <libo.chen@oracle.com>
>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>> ---
>>   kernel/sched/core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..4e06bb955dad 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>>   {
>>   	__schedstat_inc(p->stats.numa_task_swapped);
>>   	count_vm_numa_event(NUMA_TASK_SWAP);
>> -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +	/* exiting task has NULL mm */
>> +	if (!(p->flags & PF_EXITING)) {
>> +		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
>> +			  p->pid, p->comm, p->flags);
> 
> As Andrew already said this is not really acceptable because this is
> very likely too easy to trigger and a) you do not want logs flooded with
> warnings and also there are setups with panic_on_warn configured and for
> those this would be a fatal situation without any good reason.
> 

OK, got it, thanks for pointing it out.

>> +
>> +		if (p->mm)
>> +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +	}
> 
> Why are you testing for p->mm here? Isn't PF_EXITING test sufficient?
> A robust way to guarantee non-NULL mm against races when a task is
> exiting is find_lock_task_mm. Probably too heavy weight for this path.

I suppose we might only need to grab task_lock(p), check if its mm
pointer is NULL. If yes, we skip the update of memcg event without
scanning for a non-NULL mm within the process(as find_lock_task_mm()
does)? If the mm is non-NULL, we update the memcg event with task_lock(p)
hold and releases it later.

thanks,
Chenyu

>>   
>>   	if (task_on_rq_queued(p)) {
>>   		struct rq *src_rq, *dst_rq;
>> -- 
>> 2.25.1
>>
> 
