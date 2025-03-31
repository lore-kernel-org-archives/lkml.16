Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3189BA2D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743398752; cv=fail; b=ZlK9kKSUdxLHJwVPZGCl/UU2IJevRrRcR2J1fzrsOhEwjf5nQeKdk2QDxPtxum28dxpWH9kRwWvQ58A+5MurTNtoZOvFDwOU4NzSbLsoYCdDI1vaE4g9n1BXHhH796hN+uO1wh53jXcLFh7j4PhcnGLiiDUpzM2+tQpd27pI/Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743398752; c=relaxed/simple;
	bh=ZH6T2FjlO8K7duvBMdRU3SVFG8jJNf9Kli4LhsIJpdM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XMgZ6SeNkQXEi3YO2mrCSe2oSKHQbv8vnlhkLFECdOJIztmusTjCWN/rHOfSsqyyQHlOgGnyRPvVQo93SFJezv7uBa/nzmDTbBymI81Mh45sXQmrUJvmOcdFGDAi2xG58QGb4MOy8pO+RlW1NLKZu4/elmI01BSNEMuCxDDQDjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH3fdeJ6; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH3fdeJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743398751; x=1774934751;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZH6T2FjlO8K7duvBMdRU3SVFG8jJNf9Kli4LhsIJpdM=;
  b=NH3fdeJ68SUnJPJ1DCgE9U3qFLw15nleRfFOuLTka3U5V7sjozkuc90E
   uKc2U7KTbhF/ZBtzEBbVRkHsipV6j+DX2izVVzr+YPSVYEYeBlAyQDNlE
   otvbdKL182oXXpgFy5dofrih87MPEfCjowxoIZlkOu9TFwH3TkLJO/HXI
   9NlkDydf1Oj9WPM8N3MIZIjIhg+YYfKtgeqNCDGsSZtdju0aEu2b1sTfG
   E8xiQ9tZNLPDxgLuxYTdWETY7WNAdPHmbLUGbkrGvkZd8h3zYxKy+GSx4
   iMJ+tYg8nSjD9hykm2Oiuqk825dvY7tSRGVwpDIAMWgschwjmb1uQ0VHW
   g==;
X-CSE-ConnectionGUID: Gf6GZfzIRTyUU9arTOMYug==
X-CSE-MsgGUID: PrhJnfzdTkKRUBHBjQ5IFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="56048105"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="56048105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 22:25:50 -0700
X-CSE-ConnectionGUID: aKD6NMNNQ1iQKF8T8mDSrg==
X-CSE-MsgGUID: WqxzcqazQ5iElVOUqQrmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126794262"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Mar 2025 22:25:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 30 Mar 2025 22:25:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 30 Mar 2025 22:25:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 30 Mar 2025 22:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIkLNUVUcfkQXOF3O2QtpZdtk+J5bzIaIdKAWO6QOCpkYkMCGri+4jgbApX8Pv3knCVV0WWWbYcW4lXON1TvscSR9H4+J+x1TtFPngqDx17LdEjqfYqB0dWh5gY5zawe/NMSwSEZR+3/eoywmMLtCg5aZxwChRd7RJTuvu99yfhFvaar374X9/kvfhmf7XGA6XuvRNIW1kHLArIBRdlUhudRwX3BInYTetrtAoPCMjlGGwtXshe8i4idivHqrZdML0pCOmqpqd2OH1HlPwj8Q7aqhqNUwLlrtfaOK9zruHfY46jnPmLSl3z0nS5erLQNXdGeHRgVEG9lSXAU6hBBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms28sCBPKpp7JN9fgY2zdXKpMfpxGDtQNS0aJB+CW84=;
 b=uHtXpCSjD9STMwRM9H1SH4MZprU1WCRHA06oS5IXqIYDZYkncZoUKg2Rnd1rhAViSnagMkkyMR0m8GYinKz3U8rYN+JzJf6oXvepN0GaX0RnqD+5M4B4qIfK9F6g8MA0motKURn8tSumXpK5qRmDtqwP7EFsaHZisbg/HJCbn0ElfVeAriWBBRipldurJZkBA3qO1W0GX5o+oqofI0ZDGaQoOxUEZCGdeHjX5itOyun6QDxFXjCftnj3N6Rw0zgmhU4Rz1PsTTO8nRsM13UCaV8P/F+ZmN774KEz6SuyOMXWjOD/PEamlIfsB9jCqF+5oGK69f2xoOxG1VO6bedXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:25:46 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 05:25:46 +0000
Message-ID: <1e73a88a-0d49-4ac2-a64e-6d5ff2d7ba19@intel.com>
Date: Mon, 31 Mar 2025 13:25:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Abel Wu <wuyun.abel@bytedance.com>, Peter Zijlstra <peterz@infradead.org>
CC: <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tim.c.chen@linux.intel.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
	<gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<yu.chen.surf@foxmail.com>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <93907416-dab4-4a3a-82b6-e37e4ee334db@bytedance.com>
 <143a63f6-3e1b-42fd-a4c8-8d2f6b7d3583@intel.com>
 <f5f056f1-a698-4660-87f0-63f5753c1679@bytedance.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <f5f056f1-a698-4660-87f0-63f5753c1679@bytedance.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 900a44ba-e10b-43bb-412b-08dd70147d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1h1VnVYcnB5dzZwVlZjRkNHQlFQbHRrQkNTWmhZSDY1OXI3UWw4aThlNDFV?=
 =?utf-8?B?NlJJaVI3bExlN2VyVDU5ZC83cXNpTEJFUE9nTzV6ai9lQkMvZXZHYmhIZEQv?=
 =?utf-8?B?Zm0rK0NaUlBSeDN3dlhrWUhuTjkrRC9GZDkvd2J3Q2ZibjlYc1dOTWRpVXNo?=
 =?utf-8?B?WlRMWnJCSXVxQVQxYUhYUnUwT3hlVjJsZTZ3VEIwVENxVGZtNXMwSkF2OTVk?=
 =?utf-8?B?TXZCZnpDSVl5VmNzN3J4aWpzQjBVai9UUXdWQ09OcWw2ZVZRcnI5SWo1WTRP?=
 =?utf-8?B?QjVhNGM5R2g4Y1BMVk14eTJQRytCMCtpUFFBL0JFd2JrR2dGN1NtaTErZmxl?=
 =?utf-8?B?ekV4QU8zOHYzd1ZJZWwyU3VlQUMwT1BWV0Zhd0ZiamV4U3dqazRyS2xRaWJN?=
 =?utf-8?B?b3Iycjc2MUIycVhabkJTdU1DT3lCQ0lXcFJDcnJuNjJ0Y29wa2ptMTByN1Vv?=
 =?utf-8?B?dm81WlNRREdUWW9pVFY3SXcvWnlLUm1GYURldXNhUUx4dGxrRXc3ZHRXcWFi?=
 =?utf-8?B?ZmUvZXd2LzZFcDM0RkUrYlJ6UGVXWE44QXUyRmhIYzYvVUdzT1lwR2RyU0hM?=
 =?utf-8?B?Y0Q2K2lvcmJSZjQxMnRyblM5cTlISlB4TWErZnpMc0hUeXRBUHJubERUK1Rp?=
 =?utf-8?B?OHllZDF5MEJNeE50UHRsODBQcTVucDJkR0src0VCcGxoNVhzS25jOFRMaXlz?=
 =?utf-8?B?cVpGQVIzY1g0cjk0ODVsRmk4WWJ3QUx5NGlUdnpFZ0ZIOVp4dEs2YzYyOGIv?=
 =?utf-8?B?cmljWXpXUlZjTHFMUTdhK2ZoL2FBY1NsM01rM2tKSURZUzNSL3NWeFFlbkN6?=
 =?utf-8?B?Ui9HSnFzamVvcFkxeHJhOFIxVEJDTit6MHJQRjVOdW5JY3BINkJRN2tvK0cw?=
 =?utf-8?B?QitLang5WHVFWTUvLzVpU3N0emptZzR4cC9BVjNYZkNESHFyVjdqNjJYMThq?=
 =?utf-8?B?Tmc0WTRmZWxYNHRXZkFvR3FJcHY5WnU4T05mOUttWjMxL2dwNzRhQXAreHgx?=
 =?utf-8?B?all1eFlJeWZFQVorNzREb3l5ZFR3cm8rV21TMjMzOHZ1NW44ZzNYREJzUjVq?=
 =?utf-8?B?QW9HWnhoVjZLVmJpSjVLQTIvUGVla1gzWHQ3Wk9yTTZlNXZ6ZWs4L3JpWTE3?=
 =?utf-8?B?M3VpZERkWGZoUTVJV1lRWXkrSWNQREhPRi95MHlVZDRYSWo1VEY0NSs3SWFo?=
 =?utf-8?B?U0dPSENYQ05SS0VFRWR3Mmp3OERoUXNtK2xIZndOVm5SSnA3ejdPb1hYRzhN?=
 =?utf-8?B?R1JCK0Y3Vmkyd2JwR2tKWDJ4bHRCWEtMUE92dDJ1NWJZdm1FeVBHclMwWkRI?=
 =?utf-8?B?aGhkUmhlMWNMYS9FT3dqZ3NWOFVDSGFVU1NIVmQwQkQyQm11SVBvR1daLzd6?=
 =?utf-8?B?c2NvN2F4RHVOZTZHbm1vNHRSVzhjV0Jkbko5LzNvRnAwZ2E2SVZWUXZ1ck1r?=
 =?utf-8?B?QUwzZzJDakVQR3hPa0xUOVB4bEJ1eVFDaW5FdS92d3N1NzlJdGNNbVI3dTFE?=
 =?utf-8?B?U0Nod1ZoWlJJNVFlY3U3UnUrVmVoaCs5RGp1VE1raXpSLzluUFd6VVl3RE9i?=
 =?utf-8?B?V1lsWUdKc1NmeGMzNFc5Y1k0Z2pHNmNPanBILzZzQWZHRFAraU5ORkRpZjhk?=
 =?utf-8?B?Z3B4UkNBQzVrMTZYOFNnVmd0eWFDazhlVStuME5jTmVJRmxlSWZCc3UrT2gw?=
 =?utf-8?B?YStFczRNR1dwc0VGKzB3Zk1CcXZNT2lTYjF0Z3k1THRpbHFrODFvbkY5WGdS?=
 =?utf-8?B?YVpLMVNBUFpFNGdoN1FCQzFqOGpYeVVWL0U4TEN6eUd6YzgxeEk5Mk1QK2Rj?=
 =?utf-8?B?SXJEK3czVmJwK2p4N21zM0JIVmUweXlpdXRYbGVGRXFMYTAyZzhWNHdaTXYx?=
 =?utf-8?Q?3mlGmhoNjIR0S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FKVmxiSS8vTmZoUzhGNVJuQ0gzem5Sbk55cVJkbnFCZWVBeDNzSENQaEwr?=
 =?utf-8?B?UHgxWXZ4dFJKY2gvcldMVnlzYnRGeFc0cjNPblFzWHZVNkNtL0hVVVloOHdr?=
 =?utf-8?B?YWFjNkduNnc3RFQyUHpkMGtjMW5wM0hHaEdWdGd4N09PREdtTG1hV3JkcE15?=
 =?utf-8?B?N0dRZVNhT215ck8zWVRtdzcwVWFtVXFBOGdaTC9Ua0NKZ1lEYzBiZ2YzbVRO?=
 =?utf-8?B?YkhWNlRhSXFweDFkbTNPTFo3eTd4L01SN2V5b0VCYjBua2FTYmdMSG5Rbjla?=
 =?utf-8?B?akZON1dNaTk4NU10dEFTOEpZNGNFL2JTd0gvNUc5VzdOVTFYSXdOaGdld20y?=
 =?utf-8?B?REFkL0pMTGJIZU5aSW5DYUxabVBLK1daZW9wbnNkRkE4cUtaRWtKdmJYSmFj?=
 =?utf-8?B?cHBGT2dZc1kyQjl1YUN4UWdjL2J2NCtJUkl6cHd2SzhHeWVTcWZNaG8yRStE?=
 =?utf-8?B?QUZTTVVvcTZYYUY0VE9JbldXLy9GY0szcXVicWFBbkhOWndLKzF0S2RBcUVU?=
 =?utf-8?B?NmZBS3VmNWNJRktDMkxieDgyMENMeG9aeWFEcW1SVTZLZmg4QjcvQmF4Q0xU?=
 =?utf-8?B?cEo3eXE3QUhOd1VGeFAxbktOeS85VDI0Vy9WUjZFMGtxb0FoVHhJR1F6TndQ?=
 =?utf-8?B?dGFLWmt3SmI2cElHYjdvTytXbElTNjZRbE1YeXdrQkkwMHJiQWdkbnQyYUQ1?=
 =?utf-8?B?THVUR25DOWFSVW1GazVsd3pCVEVkdU5HQnE4YzVaK2RUZTNjRkdsZCtGcUEr?=
 =?utf-8?B?dVFqd2hzRG9mZkNuR3FacjBPZ25EenRRakx3VVRSa3R4ZEYxUm4xOERKV2FJ?=
 =?utf-8?B?eHNuOWhJdHd0N0pwYmNXWnFydkI4a2hIRXFYV0U0anAxMnowaEh0aFJGQjRH?=
 =?utf-8?B?Y25HUC9kMGxXeWtOVStVbEpHbUdwbUhhalhCdXd2cXBrVTlNb1lFMURFaElr?=
 =?utf-8?B?TmhTdlZJRzFjbUxIejJLMk81ODRtbS9EaXNSclNyZFZZL0t5SmM3dERudjFL?=
 =?utf-8?B?bGczRUhhRjhXNDNyc21FZ3VMdnREblYzeTBUTm15WHIyeHladi9UdEdYVkta?=
 =?utf-8?B?bWw3RXpCTkc0bnRtQ202c3JsdnJZUXU4ZGJpdUhRdXZ5OS92Q1Axbk5OUHhi?=
 =?utf-8?B?S1RQTk05QTJKMCtTcHVETmt1dUN5d2xQM1ZpQmhHek13QnRMdmE0bTFpMllp?=
 =?utf-8?B?WDVrc0hQdE5HMFUvSERmWkRKeEcvR2lobCtpb29yZWtpNVdoYlI1MlNpTXBR?=
 =?utf-8?B?QXJLaXcwUUJUeG52VGt0c242ME5nTStTVWZlaFR4UXdkaWdRa2VQRzNxdjYz?=
 =?utf-8?B?ZnZVWUFyVFQ3VGdUU3RKdC9ENUEvTUFyaERTY2xsOE56NGFaTEV0ZXAxMHNJ?=
 =?utf-8?B?TTZVWnp0ZTIwYVloK1hhQVR1VVRzTW5MUHFUVmd3UTk3WHdvanVNdUNGc3RI?=
 =?utf-8?B?MjNGTHQ2dG1OMWpUTkJ2dHpnS0x0UDJQRnhKSG5Kb1ltUkkwakJIb2hKeXhC?=
 =?utf-8?B?ZzRIaFZubkUzOGFZQVBUQ09oMitTcjEvQU9BRCtENnh1TTZ5UnVzRDlpVmhJ?=
 =?utf-8?B?R256Ri91aDlmdTgwcXBWUkV2d1ZTVklHeUlGN2RHajVNZ0NIKzA2R3pneDBz?=
 =?utf-8?B?STNQS3EzRW80SFlUandOMjc4Q0hxTXB6N3JkZDN4OGJiU25Ud2pSaGw0cUsx?=
 =?utf-8?B?RngwN215bEM4Rmh3QzBCZHdwV1h0b0VsM2IrdEZyLzhsQ2tWK0Fhc2MyUWpn?=
 =?utf-8?B?cDl1QkJ6aVFIZFZicXNaSU5welVLMnUvWGZCbWdSODEvMTlqeW5Rb2gzeDNr?=
 =?utf-8?B?Q3E2SnRxMkRZc2xHcWNCL3BUK2hXZ2R2UjZCclBybjEvUi9Qa1RCaUpad2tK?=
 =?utf-8?B?QTcyYWl2T3hwbGlEZlJMaHhKWFlxZjJ6bmJUbXdLdE1EWGNKUzMrSHVTdXhY?=
 =?utf-8?B?aWhHQytUajlic0FlQkZSbUhyZHR4c3NXWFRiYjdiNEFseHlDcFBXNlQ2N05X?=
 =?utf-8?B?alJZWVdCeUVjRzVVZEZoQnRwNW8vcS9TcVRoWkVWaUd5N2toV2h6a2czY1FH?=
 =?utf-8?B?SmN3K0ZLajJ1dUJ1TnMxTTdsVmozZEF6ZHFHUlJkVHl0RmdBUFp1SEFJTW1y?=
 =?utf-8?Q?nW6a093AGI00xv1mu3seKkyzA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 900a44ba-e10b-43bb-412b-08dd70147d25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:25:46.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGEOgO5Lw77K9+QMbHacXODEQ1YKu7noQL2GPU0/Bgfe0uZmbSrYhmy6dRWWAwY+koT6QSPq47y4i4NROkhoaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
X-OriginatorOrg: intel.com

On 3/30/2025 4:46 PM, Abel Wu wrote:
> On 3/29/25 11:06 PM, Chen, Yu C wrote:
>> On 3/28/2025 9:57 PM, Abel Wu wrote:
>>>
>>> IIUC this work updates stats for the whole mm and seems not
>>> necessary for each task of the process to repeat same thing.
>>> Hence would be better move this work to mm_struct.
>>>
>>
>> It seems that the per task cache_work is used to avoid
>> duplicated task_cache_work() in task->task_works queue, see
>> task_tick_cache()'s check
>>   if (work->next == work)
>>      task_work_add()
> 
> Yes, this check avoids task_works being corrupt caused by double
> adding the work, no matter this work is task- or mm-specific. So
> if moving to mm_struct, this check become false once any task takes
> this work, and other tasks can not do the same job until that task
> finishes by setting work->next to work.

I see. What I previous thought was that, checking work->next == work
can not avoid two tasks doing the same statistic calculation
in task_cache_work(), because work->next = work is invoked
at the beginning of task_cache_work() - maybe need to put
this at the end of task_cache_work()?

> 
> BTW, moving to mm_struct will save some memory footprint?
> Yes, this would help.

>>
>> To do exclusive task_cache_work() and only allow 1 task
>> in the process to do the calculation, maybe introducing similar 
>> mechanism like task_numa_work(), something like this:
>>
>> if (!try_cmpxchg(&mm->cache_next_scan, &calc, next_scan))
>>      return;
> 
> Yes, this looks good to me. While Peter used epoch to regulate
> the frequency of this work, which is a ligher way but allows some
> inaccuracy which is further fixed by a double check after holding
> mm->mm_sched_lock.
> 
> I plan to use trylock on mm->mm_sched_lock first. If trylock fails
> then someone is adding the work and we can skip early.
> 
> static void task_tick_cache(struct rq *rq, struct task_struct *p)
> {
>      ...
> 
>      if (mm->mm_sched_epoch == rq->cpu_epoch)
>          return;
> 
>      guard(raw_spinlock)(&mm->mm_sched_lock);  <-- trylock
> 
>      ...
> }
> 

This lock is intended to protect that no two tasks enqueuing the same 
per-mm_struct work at the same time, right? And for the task work 
execution phase, maybe we also need to put work->next = work at the end 
of task_cache_work()?

>>
>>>> +
>>>> +static inline
>>>> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 
>>>> delta_exec)
>>>> +{
>>>> +    struct mm_struct *mm = p->mm;
>>>> +    struct mm_sched *pcpu_sched;
>>>> +    unsigned long epoch;
>>>> +
>>>> +    /*
>>>> +     * init_task and kthreads don't be having no mm
>>>> +     */
>>>> +    if (!mm || !mm->pcpu_sched)
>>>> +        return;
>>>> +
>>>> +    pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
>>>> +
>>>> +    scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
>>>> +        __update_mm_sched(rq, pcpu_sched);
>>>> +        pcpu_sched->runtime += delta_exec;
>>>> +        rq->cpu_runtime += delta_exec;
>>>> +        epoch = rq->cpu_epoch;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * If this task hasn't hit task_cache_work() for a while, 
>>>> invalidate
>>>> +     * it's preferred state.
>>>> +     */
>>>> +    if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
>>>> +        mm->mm_sched_cpu = -1;
>>>> +        pcpu_sched->occ = -1;
>>>> +    }
>>>
>>> This seems too late. account_mm_sched() is called when p is runnable,
>>> so if the whole process sleeps for a while before woken up, ttwu will
>>> take the out-dated value.
>>>
>>
>> Yup, there seems to be a problem. It would be better if we could reset 
>> the mm_sched_cpu to -1 after the last thread of the process falls 
>> asleep. But considering that all threads are sleeping, even if the 
>> ttwu tries to enqueue the first newly-woken thread to an out-dated 
>> idle mm_sched_cpu, does it matter? I guess it would not be a serious 
>> problem, because all the cache of the process might have been evicted 
>> due to long sleep.
> 
> Yes, it seems not a big deal if mm_sched_cpu not overwrites any better
> choice.
> 
>>
>>>> +
>>>> +static void task_cache_work(struct callback_head *work)
>>>> +{
>>>> +    struct task_struct *p = current;
>>>> +    struct mm_struct *mm = p->mm;
>>>> +    unsigned long m_a_occ = 0;
>>>> +    int cpu, m_a_cpu = -1;
>>>> +    cpumask_var_t cpus;
>>>> +
>>>> +    WARN_ON_ONCE(work != &p->cache_work);
>>>> +
>>>> +    work->next = work;
>>>> +
>>>> +    if (p->flags & PF_EXITING)
>>>> +        return;
>>>> +
>>>> +    if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>>>> +        return;
>>>> +
>>>> +    scoped_guard (cpus_read_lock) {
>>>> +        cpumask_copy(cpus, cpu_online_mask);
>>>> +
>>>> +        for_each_cpu(cpu, cpus) {
>>>> +            /* XXX sched_cluster_active */
>>>> +            struct sched_domain *sd = per_cpu(sd_llc, cpu);
>>>> +            unsigned long occ, m_occ = 0, a_occ = 0;
>>>> +            int m_cpu = -1, nr = 0, i;
>>>> +
>>>> +            for_each_cpu(i, sched_domain_span(sd)) {
>>>> +                occ = fraction_mm_sched(cpu_rq(i),
>>>> +                            per_cpu_ptr(mm->pcpu_sched, i));
>>>> +                a_occ += occ;
>>>> +                if (occ > m_occ) {
>>>> +                    m_occ = occ;
>>>> +                    m_cpu = i;
>>>> +                }
>>>
>>> It would be possible to cause task stacking on this hint cpu
>>> due to its less frequently updated compared to wakeup.
>>>
>>
>> The SIS would overwrite the prev CPU with this hint(cached) CPU, and 
>> use that cached CPU as a hint to search for an idle CPU, so ideally it 
>> should not cause task stacking. But there is a race condition that 
>> multiple wakeup path might find the same cached "idle" CPU and queue 
>> wakees on it, this usually happens when there is frequent context 
>> switch(wakeup)+short duration tasks.
> 
> Ideally mm_sched_cpu is updated every EPOCH_PERIOD which is default
> to 10ms, so I'm afraid the race window is not small.
> 
OK, understood. My thought was that, if many wakers start searching for 
idle CPU from the same mm_sched_cpu(because mm_sched_cpu has not been 
changed for 10ms), if waker1 succeeds to enqueue a long-running wakee1 
on that mm_sched_cpu, other wakers might stop choosing that mm_sched_cpu 
in SIS. But if all the wakees are short-duration ones and doing frequent 
context switches, many wakers would think that they find an "idle" 
mm_sched_cpu, but actually it is heavily contended by many wakers.

thanks,
Chenyu

>>
>>
>>> And although the occupancy heuristic looks reasonable, IMHO it
>>> doesn't make much sense to compare between cpus as they share
>>> the LLC, and a non-hint cpu with warmer L1/L2$ in same LLC with
>>> the hint cpu seems more preferred.
>>>
>>> Do you think it's appropriate or not to only hint on the hottest
>>> LLC? So the tasks can hopefully wokenup on 'right' LLC on the
>>> premise that wouldn't cause much imbalance between LLCs.
>>>
>>  > I will do some tests and return with more feedback.
>>  >
>>
>> Find an idle CPU in the wakee's hostest LLC seems to be plausible.
>> The benchmark data might indicate a proper way.
>>
>> thanks,
>> Chenyu
>>
>>
