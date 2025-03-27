Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A601C760A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063024; cv=fail; b=fi9UVWl22flV5So7Hq5y2GhZw8gAhFWyNfhivgVv3mfpA1rwAkTI1pDVxRsPOyrl2ur2YkdzF5bt7xK4k9/HJffsQnbyP2C6A9SCiZdX4mXiqZh0zJk2ketOdPXu1nQ4eFK6YIuDI6vKQgt+3xgdoCXGJVrsOGXLX/hTEp78KzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063024; c=relaxed/simple;
	bh=iFJCdQhrVh0tWBn92TRl3lRD6JkcPKlSc7i/63gtv+U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KVljayh/9CmLMiNVatVv/eFGmBzrh3aIixH5GhGQLWvYfdjSPzk8HOW213G1enfRFk9vudTHGU+f/fegiCt3Vi0YXdmrvm8ukH0F3+YsAHviQFBqnPk+I21b9RfYy2aQB9/1JzyS9L87GaPTPyGcuk6EK1h5DBikYYGHSWRlOBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3SQKIOE; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3SQKIOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743063022; x=1774599022;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iFJCdQhrVh0tWBn92TRl3lRD6JkcPKlSc7i/63gtv+U=;
  b=f3SQKIOE9UleoFKgF3KKGuQcx9ZyJLHKpvdlaG9u8rQRidYCBCSoUaSD
   teJdNa7QrRux3qqMW80wNzxEKvPA0+itmSgmOHBn6ItsBy/9etUgACaT0
   alnxRML9JsyGQIA7mOc+Dp4WJOjiB3a1QyZqsWBSMMEzPA9s+TuxDKFP+
   /SYmI442yghQrSVNkllWVJKJBrwRI43zFDwi/BRNI/QzXaZNQYjqu3dBz
   Oqg36T3RTpwrNIkrHPjRRU1C5ijIOnimGogyBfWLqhVFnwH3+D7Cn+21l
   naz6DdnG8V9wRI0l1CQFonmx4XrgTFTO3dRG4xX2Rqfd1JaQTBYOStsBB
   w==;
X-CSE-ConnectionGUID: F/yrHKCaTSS6tTk285pCNg==
X-CSE-MsgGUID: ZO0mXN5KRMOglaQtmbcAqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55381540"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="55381540"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 01:10:20 -0700
X-CSE-ConnectionGUID: Z7Ljpgl9RJu9BYX6DnOnsg==
X-CSE-MsgGUID: DiNu6SpqQcCnUaOm+cQm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="156056675"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2025 01:10:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 01:10:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 01:10:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 01:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCYTcIqHoNURNh1O0fJNJ/0zBCJng80/K8AjPUaATekxrKwmzrbNzbw/kWpEWyFdtnaZh7ylqf6GXW87SzUaOHcHWe3G1gY3UZvbTpGPYt6g9/DAYEtYmwK3Ft1xLoZLLcZ+VOeBcZ8+SWh2U//Tm33IQfFtsSyXI3rXwfek++0pELKZ4vHGTBqt8zdFPlH99fltjF1S3b+Z01yQ1nwgt4hvUlYNdDrc4s6tBMLu40uXt6iFA+N9YndaZ1HHNI9caEdo/tkrKc5HMyrDoVD5wTGKVedhMMvPtGZUwwIzRQSHSDBv7cJAx5FxdrsEgubBOzXD8p9Q94oTI+QF25WoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPbWiCTl7s4bDWmbD/ROaRnqbrMAurN+slTA2/UA+1s=;
 b=X6+sTNY+Vz3/3uX5RTIu5dbJBj92ICDXpi60X5oRC50a6Xl6msdPFZDy9rdKUJV2DJ0JLVdTWEg0heLTD0/Tn1U4PqaaLp0Qb3fpL0UHqN5MmQK9aYFYan1prjEjUF1K+063fcIFfNy0UROzTg9DPfHZTMMLfBa+mgFUlBBhRVfyGit9xDDp5oXHFKc2rrDCE+KUF1yUCVAVQKuN5qTlFUIdo/m7lxjMCzntLUdTIlf0+vP5LelZKtHWWhNZ5amPYzoKOmpcPdrVHw5Rt7VYpyrS3YUitOxoEmtPHzkVaKY0RWwa7U2AQxHqEW7c9jBphSSxiafFBvjMU/+lJ4wPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 08:10:16 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:10:16 +0000
Message-ID: <48cbfb23-aa4d-4e05-9a63-388a6ed6d9df@intel.com>
Date: Thu, 27 Mar 2025 16:10:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tim.c.chen@linux.intel.com>, <tglx@linutronix.de>, <len.brown@intel.com>,
	<gautham.shenoy@amd.com>, <mingo@kernel.org>, <yu.chen.surf@foxmail.com>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <4cd8ba54-8b9e-4563-8fbc-1d6cd6699e81@intel.com>
 <20250325184429.GA31413@noisy.programming.kicks-ass.net>
 <17d0e2be-6130-496f-9a80-49a67a749d01@amd.com>
 <78508c06-e552-4022-8a4e-f777c15c7a90@intel.com>
 <20250326094242.GD25239@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250326094242.GD25239@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: f9518094-cf49-4624-a1cd-08dd6d06ce75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1R6UWFMQ1I3M2FMVlBwNERwWG9DeDhTSiszYWRnN1NqdjNyZzBMR1FzeW1J?=
 =?utf-8?B?cVNkU2tYLzhzeDhQaU1ZVExQcERJY2N3amwwR1NNeGd2YlZObGVPSG04MDE5?=
 =?utf-8?B?RGYrZ3ZVMFBqemFONmx0N095UmZ6cHIyN2RlTkREcU5malZ1eW4rLzdUU3lz?=
 =?utf-8?B?QUJEL2JLampRVVZJVGNGYzErT1BTeU9qS0cranpGZTRvN3VQc0VuSk9vV3FE?=
 =?utf-8?B?TFcyOExVR3kwOFhSN2lNZDVsOFdFZjlScDg5UmREVEpISzhWOTEvTHJrUWxY?=
 =?utf-8?B?RlBJUXYzOFRabGd4MmM5QjMzc0ZjN1lJMndlZ3VVYkZjdFVNcHhhZ0loRWtr?=
 =?utf-8?B?dWNZa1Z1dHVLeXdyWWhFS0thMlgxZkFnN3RFZytPU2llWXBYcGNxS1g5eVBC?=
 =?utf-8?B?UjNCbThsdERnK2Z2OW51T2tpTWpZNUxjZnhRb1VSNndLeXJjZDVhMzBoeEw0?=
 =?utf-8?B?YmdjMUdrWXdwUTJBemY0Y05GZkZlYmdlMm9kU3ArV0ZQSStCWEV4S1lGelEv?=
 =?utf-8?B?dVhQbk1zWTZvbnRnSVdLY1Q3UmpMVFN6WmVsYnlQU2p0SVRxOUVTalp1TExH?=
 =?utf-8?B?YWRXczQwWVowWE9yMUhTNGY0RkdzdDdKTWhuTDZmcEVraG95MVFtbi9pU2VB?=
 =?utf-8?B?YnI0NkxXSVh0cTM0Y21udGkxTGluMm85aUpES05rb0xkTS8vMWJkZkhJViti?=
 =?utf-8?B?dlJHUGJkQlZBSXUyUkRjdmlFSlZma1RlbXVYMGIrbFU2NUgvWU1XV3IwVW1T?=
 =?utf-8?B?ekRweDdmTUlvMG9OVmN6Q3FiaW0xUk1jKzlSaGhreitHeGkrZzMwKytyUFJR?=
 =?utf-8?B?Yy82L2ZTNStGL29TOGhhb05kWWhWajd0cUt5WWg5ZUdmU2p5OTJwQmdtVHFp?=
 =?utf-8?B?d3VJY0pGNUc1VXRmVXlDY2pwZVNGQVYydGY1QnMrOEVlR3FBZEJzVVdtRVRH?=
 =?utf-8?B?dWQ3N1ZyalBESExrWlpsVE9kNDVWNnRBUmpqN1hKa2ViRG42dlNSSTI4NVBH?=
 =?utf-8?B?czhwRnRxcnVIMTZ4cjRiTk5RUngyWVVrQmdiOC95dTh5amdCV2J1aWFEb3ZN?=
 =?utf-8?B?SGdscWxqVFBob3VDbTdLVENwUU1iczR5bk55QnFrUlJDYzNKeVhMY0o2eE1y?=
 =?utf-8?B?bzIxdGhSWVBpVTNlaWVtZUZYdUFiSVZSek9UenpjYUM3TlcwUFpEOVVJc3dn?=
 =?utf-8?B?OWcxYXJFWjRZT2t1dXMyVE9NY2tkdDBKMTBRaUpPdXQ0bnpFSzJMaTJlUnN5?=
 =?utf-8?B?Vk1SQ013OVN2NmlRN3UyalJRdzBEaXBnRkx5M1dpVUh4dUcra0ppQU01TEZO?=
 =?utf-8?B?Vy9kcDQvdGp5ZE9aTjFlQzlvSVVMNXJWNnlyQlJ0QkxBRk5MSXB3ZkszQjFq?=
 =?utf-8?B?dXZPQXA5Rkxxakh2aWJjNVZjSHp2RUFlY2dBODdScXNJV0lKaGtGcUZOcTdm?=
 =?utf-8?B?eXFMTldKaUZoVHp3a21lQWRUWU03b2U2YkxDc25UR0lDOWQ3c3V4TjZpN2Rp?=
 =?utf-8?B?ZVorSzVTN0pTWm5xMmRzMGRvQmxRMHNjS3V1aHZ4a0tyclZaSkNrUGN5M3JP?=
 =?utf-8?B?eHE2Nk40NFhya0V3MWorWGk1M0pTcXZjTTNlR0ZUY1dzM2ROeHlUMlM3Kzly?=
 =?utf-8?B?dEhzMnV2RFhiZFNVVEdvY0lQelhYWEk4KzU3ZXQ1emdhOTc5cVF4aDQyQjZX?=
 =?utf-8?B?em9NWmNPaVFHeVhvekh1Z0d1NERpQVNHTVVDUE02OVVlMU9mS0ROUjZIcU03?=
 =?utf-8?B?QmQ5VFVoUHhxTElLOUdXWjBwaGxWaENCajFReHpFYW44RVVoZE9QUHdZa3c5?=
 =?utf-8?B?b3hvNlk0K2s3Vmtoelc2SEM1cUJ1V1BaYXRpTTJEamNzN2lNRjVtaEszaU4r?=
 =?utf-8?Q?MKSJc0XKZufhe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXdrdGs5NG9Odi9mcG5WVGhNQmhoY3RoMzRaVWJJb2h2TWtEdjVSM2JKRFli?=
 =?utf-8?B?b2FabXpjZVVOM3BZVTNYUUtmWFU2RUJESTUyMHdNUFhnVThTMGU0WXJvanZ0?=
 =?utf-8?B?cFhLMmhJS3FJaHlsZ01oWlJYV3Z2QVFwcUc3SFZuazBRMEh1Vmpxb3pDeGow?=
 =?utf-8?B?STJTMHRFMUVuYmhIUW5rVTMwZ09vMkVlN04wdldLZW1nZlRJR1IvemRSeFpI?=
 =?utf-8?B?SUVuaFZDd1BGN3p5MWFTWnJwV1ZiK2NvSlVQTXQ3bmFQVlJVK3ArTWEwVlpw?=
 =?utf-8?B?VHN3YmhOYUNCdVVnankyVnlqQWx4Q0JzV2Y5YzgySG5sREZCRU9JWjhPRkJK?=
 =?utf-8?B?L3pqZVkzUmhvMFBaRXd1SDFVNElHc2JZVktkZ0RXRUdIZ3JEUVNMSXZObE1l?=
 =?utf-8?B?Q2F3WDd1N254eFJ2WVN0UEdWbStHcVBMN2hpVnZEZE9CSlBVbHVxVWxJYmFF?=
 =?utf-8?B?Um1ML1FlSE5ZMkxIZ045bStybk1lRlpoeHB5eVpDazRxaG83SHYvbGh2TjNP?=
 =?utf-8?B?RmszaTI2WDBHVVNjT0hEa3o5bDdmVDBCNTJSakhENUpIcjRFUTd6U2VLTEVM?=
 =?utf-8?B?SzhGSHRycThIZlJWeGVzQ0FOQjNUVS9zRDhCcDVENWJFdnpqSW12dis3NElu?=
 =?utf-8?B?VEpVempob05yUGVvVlJqZjhiZ2NSc3gyditJQWVIT1lDWXRkU1J1TEJKRStp?=
 =?utf-8?B?MDZXZGdmTEZUVzlvV0ZZKzhNOFVza295UlV1YjBXU2FoYVJNMEphNmlBTkE0?=
 =?utf-8?B?VnZud0hrc3oxSjVDNU5KdENlbjRsVnBDQVM1cE1qaEFaa0R5K0dBamhFbVZY?=
 =?utf-8?B?SjJ0ZmRzMElGcTRsOUpKaWRKZU5TZ2JFZ2RITDFHc1EwbDcxYnlRa2ZVdk93?=
 =?utf-8?B?emxmTXRBWWsra21TWUNhb3FpaEVXenYzQXIvbjJOeHNMZFpPRnhKL3ZMTFNt?=
 =?utf-8?B?QmJLY1AyZThheUxDdWVMQnNOQk50YzhGa2hpNmFiclUwV1g3L3g5WVJzbnpE?=
 =?utf-8?B?ZVhYR2Z4WFFDYmdPeGw5UEhyZ2Q1SFc2OTZKVmpUTlFIRHZldzBnWUM5dW05?=
 =?utf-8?B?Yjlua0FDbi9yZ3NrYWhrYnJ5VnYvaEJFZkZmRUt0M1MzdStrOUgxVHBETUpE?=
 =?utf-8?B?N3BHQll1STdTd1pxdlprSE1nZVNWM0lhOHdodHFwSXZiaDI0UXFOWmlnaTVk?=
 =?utf-8?B?WFB5cERaSWI1NnVibW00dFlxY1E5MGJ5M1M4b0REUjY0dk1IZEpsMHJpOXZO?=
 =?utf-8?B?UTB1aStSV0pKUXBibHloU0g0SW1ReFZ0VzFtb2RXVDI4T0hMdTZNNkhtNDRO?=
 =?utf-8?B?Z1N1RTF0RE9pcnhSV1ZVRlh5OTdJMjc4N2U3RXhqdmJVS2l1Y1JQdFUycTBn?=
 =?utf-8?B?NDFoNzQwNEludHI2aTkzRnlJc05KTHBJaFdPVGpCNDdadEhSamJnRE4zV0g3?=
 =?utf-8?B?OXFqamJWOFVsNkxvaWo0amdOeUcrdUZvZEtQY0dtVDh1ZEc5UG5BSlc3Z2hK?=
 =?utf-8?B?bVEyVENzeTJoQis4b0tIUDhvOWNYeTcxY24yeDIxUHlGMXJBYkI0Y2NWNkpo?=
 =?utf-8?B?elVXM1BWcU9IRURvOTF3ZDhyYS9aMit5cHo4U3hZa0IyUGJHR3MraHpkMEZD?=
 =?utf-8?B?T1F2N0MySUxsNHROcm1hK1JlRVdMbWFSUldSTUNOUWRsd3YxYWtVMENkSlJp?=
 =?utf-8?B?WmhWS2hNYXFtN1ZiVzBPeWJmWFpJQ3NhUTIwdkh2ZTZwN21BZXRKYjRreG45?=
 =?utf-8?B?Y1Z2S1hrRUpXNGdWUU1kUGR1bVI5Z1QrTVE3d0hrOXU1Z1ZLbk1FUDJvRWR6?=
 =?utf-8?B?OUExZDdrUTNmTHYzakFMTjFjRHVneWI0cmdmTWNCdjVta0tDR3VTVVR4cm5o?=
 =?utf-8?B?czcvOG4yT3NIWFI5T2FwN1A1UnlrS2V2Z1ZvOXk3WnlCYUpDZjB0b050SDda?=
 =?utf-8?B?R0taMkhQaHpxVldTZCtJOVRrc0lBdnlaM0d6TERaM2xhZThOSFJnTXJzbjQ3?=
 =?utf-8?B?aVlRR2ZpS2hXNGVUUjRnQlBmQmpMbExRcXJsUWtZZTRWT3ZpRHI1WVhaV3Mw?=
 =?utf-8?B?dTRHcmljMTUvTUF0VnV4MjVvS0tPZUZZUU5YYTJlMzZKNVV5R3E2K0lWWUdj?=
 =?utf-8?Q?lDHOzk6e/80RyhSiHPY3EYse3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9518094-cf49-4624-a1cd-08dd6d06ce75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:10:16.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaHVJXPPjG0Ix+lljt2tvLtRJfJz88garX9KhKi7bGtg0WopJ2p2oWHB7T97YGJ+Iy+noI6oOIngc6BPvS59AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
X-OriginatorOrg: intel.com

On 3/26/2025 5:42 PM, Peter Zijlstra wrote:
> On Wed, Mar 26, 2025 at 05:15:24PM +0800, Chen, Yu C wrote:
>> Thanks for running the test. I think hackbenc/schbench would be the good
>> benchmarks to start with. I remember that you and Gautham mentioned that
>> schbench prefers to be aggregated in a single LLC in LPC2021 or 2022. I ran
>> a schbench test using mmtests on a Xeon server which has 4 NUMA nodes. Each
>> node has 80 cores (with SMT disabled). The numa=off option was appended to
>> the boot commandline, so there are 4 "LLCs" within each node.
> 
> We really should look at getting the SnC topology even without SnC being
> in use.
> 


I agree, unfortunately it seems that with SNC disabled there is no 
information exposed to the OS that can be used to divide the large LLC 
into smaller pieces.

thanks,
Chenyu

> The sheer size of these LLCs is untenable.
