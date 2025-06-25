Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104EC28726A;
	Wed, 25 Jun 2025 23:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894771; cv=fail; b=eaQvEdPHjNJNUCRkDO+V0jeqWV6ss+Y+d+6G4QXtN785LYGVv6cUhsVq5iqv8eTVVt61gWCgsjpx1rJXC0D4Clx8Jh7XFZ4okavsyV/nRmr00nQzsHaFblIqmM3T4q/osvccMvASHwf4b+KP2B0mYLEPCWPHMXq4w6BfZe46b0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894771; c=relaxed/simple;
	bh=ZDH6Nqq0kt0U2T/DTRk2NY4dSx56WRGqhOeq4ZhLdqI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZN+giO2KFuF3LU6KwIv8kTAPqweZPm0/hkt7xcxevWW/6YN0f92f0rm48IU6Me8QE+eyicnb/9vMyJI1rdzAP3guqaZEYg5f7PeA+bR6+7jn62sQA389Y/fbhRAvmEj/nqFvKzNnBLPD2hLgWadNRdfiWNGw5uPZk0PGth+IeUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkFkxPpH; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkFkxPpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750894770; x=1782430770;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZDH6Nqq0kt0U2T/DTRk2NY4dSx56WRGqhOeq4ZhLdqI=;
  b=YkFkxPpHrQSQ5tl37sLq17uPLm+XA9yIeOOUeu0MQjcrgavTawSpMfJh
   vk7KdjCIhlMidhy8L0gi92cIoY/+VpFHNk3ajjQbeVkyodKobGv+UmFix
   209vKwIoEJ92xxSGi227ODWFoA+74EItHNrG9ZI2pINLXuTNUTpswZJSc
   VYLWguvZpddVcN+912VWj4zpAKJgPKPHEx5d66y8RzmeA6PbZS8ZrcdwV
   tzKYvCqtr3HjKIdaLXTXlgUUFOAst+ss+0MZqnPcDKodSSbiwnqnHQ/rm
   AQfcxrxbCFDGcLSFYbTOuPQcvnS25MN6dMDvi4F/GrTFfaKvQ+Sd/N31+
   w==;
X-CSE-ConnectionGUID: 2YLvMvyiSwm661xxYGQsaQ==
X-CSE-MsgGUID: +vepDeujQweYsOr0eIACeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53277577"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53277577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:39:29 -0700
X-CSE-ConnectionGUID: I88FmuCQQJu9+d12aJisZA==
X-CSE-MsgGUID: AV/Bd85gT6mE8IcPb61IFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="183245269"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:39:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:39:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:39:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPbgqt5fvv4aY4Dtv/oDOpJQ7981kUeSFyxZG5mF3TyoINR7c+G3D4TMi1ggK6pgfqHK6mNC/fKbwW8rYxMTA9NQkrE2VRchMNKwOupXzIvRAsph7AkJu9j9GIRUw6RvAy4UTPHuGgIiDzuO/hw2717dgKV07ak8dzh1OeYlff9C0kfaGsQ2UCGWQxjxiGSZpVLqQOy9EXVuDieqYfJK8VcbFzvOY/jYPaZxDDen2Wrm5A5rklKYE05P6vaifW75Xt89s8U7Z4TuixPYPNidIo0pGveB+laFdi1Xh6lziUnaDbYPo+nl+Wof08xuNW9FTbjgfOvNVxxvID8eMl97Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV1PUXzb6JcMro5UpYMqnTXW4rEX29ivJdKrG3S3uvM=;
 b=sXyrl2u51tfgfIt9K71uc6K3TcBrs5enPI4coDkspgy6NdmSOMu1x7qW+CGdrhKsFX6DVoZu+IWp5XRwsI+CoZWO7OJiVAqRJnpBtlK0cW6HZkbp4Bp1F2TGmrrtBJGS2/d338S9d6d1of3ctzIJZf9t3xpvdsVVnygwB5HHVQCICJGCTGcT7HWHYqexTP/BQF/VkDos4aMKr6BqfsGauIB3S9Kyxbtvi7aVaHpXqRAQWI8eVddJ5O9QXxAvcdgJ5pDwbfZ8qMvkV4KZgfeL9a04hOg6t4F8JCtyhNvmuk0uoa2tqdUmt9s7c929FAhgka2Xjk6ej+DahhcDq3Tbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:39:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:39:22 +0000
Message-ID: <3c753f3c-e91b-4cfe-983d-efe8ff07b750@intel.com>
Date: Wed, 25 Jun 2025 16:39:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 30/32] fs/resctrl: Hide the BMEC related files when
 mbm_event mode is enabled
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0166.namprd04.prod.outlook.com
 (2603:10b6:303:85::21) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: b81c0fae-3042-477d-af1e-08ddb4418330
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTZzd2FxaVRkU09KL3d1cmRTUjdUWnBwODJMWmlHY0hlTXJiVW5oMmxUOGhB?=
 =?utf-8?B?cGxOTG1jZW02QVUra0dOeUplWW1Ra3ZVRXBqY1FpSEdLeHRUVVdXNnRVeENh?=
 =?utf-8?B?MUUwV051dzUvenVCeVB1cmg4ZDBSNzBiSCsvYXBGZ21LR0NickJsYVRsNk9K?=
 =?utf-8?B?SDRya2Zpc0hVQ2hJTHE1S1AwYWlPdjhNQU91OXhkWmNtZDRhUTdtR3N6T3h5?=
 =?utf-8?B?WFpYelhrVlgyQVhjdkFFZnBjY0k3SDNXSWN5QVQyeld2ZUdIZkNCdjVJMmk4?=
 =?utf-8?B?S2lDTGFEbXI3bTR6YnE4cVVNSXE1T002bGpDcE1vZHhLK1BXWXFsVHNiKzVB?=
 =?utf-8?B?RHdRcCtUTTNMVC9oK2JhMEkyeXJVYlcvZ3FuUkEraVZtOVJGRWVCcGp1bWlu?=
 =?utf-8?B?VEJwbnRPN1hsQ0dSYyttUUJYU2VQUjlLc0V6Z2ZqUnJWdHdyOFlqV1pxUndM?=
 =?utf-8?B?M2Z4eFZZSGx6ZlAyRGtCaGppMWdXUXF1RFZTOXZVZmVoanNZT2FMRS9abjQ3?=
 =?utf-8?B?Sk5nQldWZ3NiNVloTzBZZVp3REVSNVBBcWdiNUkrdy93ejdScks3elZSd3Jn?=
 =?utf-8?B?WEN5R0RvaXNYbkVQNW5oOHFHZk42bUMzTU5RbWxxZG1jRWRaQUZkbEFiMndY?=
 =?utf-8?B?Mkd5VUFmTCs2TFZ3RW9adUt5dG5KcUhhcjBoT0oxbDJ3eFQ3LzJXTzF5VTlT?=
 =?utf-8?B?ZVlsNDVXd1l4WHVIQU1HK29haWZFK0JpdThBUWlMakQ2U3J0cUtUem95akRj?=
 =?utf-8?B?N0Vkb0krMkN2QlB6MThSNHRnWTRISFBWZUViVFpseXpOMEMyd29iSXV4cGZ0?=
 =?utf-8?B?RTZJZXg5U2ZJQW4zQ052Z1lYbGhvNU9EaGZLZUJGaTlHK00vbkJlK09YQkhn?=
 =?utf-8?B?UFNPSkdxMFYyUUpIcU5QanJVeE5SWVJ6RnZGVWJOOWRwQ0dVa092VGlaMTBH?=
 =?utf-8?B?TUZjRktST2VGUWlYMkZIZXVXbVQwWmxQUWxhaW5TU0VxdnJqVmpaUk1IL1Fa?=
 =?utf-8?B?TElzcFo1V0k5NTQ2cUFMUEg1V0tua2dFdUVlb0pnaWZmOHZPTTFuTWZtTVRU?=
 =?utf-8?B?NkpSMk9iSkMrcG41L0lwdTJZYldYc0RsZ1RiOXpoMytUcVgwLzh5THp6MmdG?=
 =?utf-8?B?S0VFSzBwWDZpdVBZMG5Tb2xKQ1lMaThZRFUzMXErMExJMXZHd3V6STZIRlNK?=
 =?utf-8?B?RDQwY0J4bllBNDh2VXlGQTQrQmhhc2dVT1BYY05KZ0tkS3dtMlNLQlUvQ1RL?=
 =?utf-8?B?VVVhQlV4aUxheFlKWkJ4WU5KVW5pdG5DZk5hVGpxOUhQcUgvaFdndlhjTVFN?=
 =?utf-8?B?MVBaT0xyOW8xZ1lPOGJpRlZrTXlyNXJUL3lQQ0tvWWZnK1NBZGVPWlNadHhk?=
 =?utf-8?B?Wkl0TjN0anRiUmpOT3hjZ285NUVnNmR5U0c4ZlZReS9JVXczSXBwK0d6SlpD?=
 =?utf-8?B?YW9HUkJGeGNXOHFHN1kzekFNdXpoT2s0N3ozZ3NGRXZLcmVHRXkxM2dLQ210?=
 =?utf-8?B?SUpGdFJudWY5VW9KbURqenVza3RsM0NxVGFtUVJQVGg0ZFlmdzE0N0xPbHVL?=
 =?utf-8?B?ZEJQZ1g4dnFmYmtJdkZPQlljQ2hjOFRwUHlVeWNRTUthbzJ3bUdxamI4WUs3?=
 =?utf-8?B?amJFSDNacGx4N3JUWEtFNjB1K2ozendnRU1rQ2VSb3MzRzZ2bllySlZIaTZx?=
 =?utf-8?B?UHJQUzB3QmQydXhrUmpXWVZDc0FUVlJZSmFsNkRub1Jtd0tCQlFyUWFsWEUr?=
 =?utf-8?B?L3hrdUhzcjZGWDNzdnlaS001b0NMY21GWjZyZFRocU85ZEtHWWJnNUFGais1?=
 =?utf-8?B?VkEzOHh1UUg2aW5jL2x1RDh3RVBlcHlWRUkzQTNBa2xvclZabHN4cHI0MTZZ?=
 =?utf-8?B?cTNwUFVmYzlpMkdzK2JFZURaVGdkSm5rVTRRdFAyQlBwOUdPKytVWk9aRS9V?=
 =?utf-8?Q?4Hxz0nUd938=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3hLRHJFekd0TktRY21EQ1AzVFhWNFpITVZvR2d1ZkxmWG5SMnh6Z08xY0Mz?=
 =?utf-8?B?RnhaZDVQR3krb2s4dndTVmx0ajF6TzJhaWdxbkdaUkhNK0RvcWdYcTdiTi85?=
 =?utf-8?B?SUZ5YzJIT0Z5SnRWaWZFR0lsNlhNaUhPNzllY2hpOVlaZEh6Z1hVeTF6Q3V6?=
 =?utf-8?B?UXl2UzBIbXEwUkZXRUd6RHR5KzdyOS9La2FIMVJlV2tQYUg4OEhPRkJyS3FD?=
 =?utf-8?B?U0xZQXFaRnpXSFRveGp3WlJGa0p4bktBZDNYeTVxQWJqSTFXTkFmbk80ellk?=
 =?utf-8?B?a25zUUV0U0lpU3M4SCtoK1JOeVVwWVFEblA3a0M5TjJZZHpFeFZlYW9hVFlw?=
 =?utf-8?B?L1llVHdPK2toaFZ1YmVjVmZTVUFtS2dTRkZHdjIyR2FzcnViU0YzZi9yY3dm?=
 =?utf-8?B?SElFbnZFTUdDOXlDUkV4SFZ4Yi8zTXdadnRmTTd5Yjk3dFdIWFZENWp5bTRo?=
 =?utf-8?B?YlVhcHl0Si9LUVNRY0l0N3QxL0p0c3ZDYWtVLzNMM3RJTmpmUVFVNmFoWlBW?=
 =?utf-8?B?MFI3cUV2anFNa080OW9yZEhJYURJVllJcC9EZXFGUDBNTHJ5Z1M5cWRGMzB5?=
 =?utf-8?B?bHhEdGpwVXI5b1R0Sm1jMTNub201SWZSaW5ubElFL2VMRGtWc1JFV0hrWCtq?=
 =?utf-8?B?QW5sR0JFTWhCVWt6d1RVNWpVd3NWaVRjN01CTEFNRnlaQmY2WXVvemFRQjhY?=
 =?utf-8?B?d0ZjRGlaSlJ5NFFuWDNYcnBCY3RiSWJtSGd2NFhMN3NWV1E2ZUJXelJrZFAr?=
 =?utf-8?B?S2dOQThvVEZDVEZELzJ3M0Y1bXY1T3pLMUw4VXQrd2pqN3ZsUTkyNmJGRzA5?=
 =?utf-8?B?bHBpQ0VMaUZFalUwektjbTE2SDRDNnFyWjBOM2plOS9Vc0lIWW5CQ3RjWFRM?=
 =?utf-8?B?bmxwWlVhaGdzZ01lMVhCSG8rNlpiNTNFK1g3aWhOUTM5T1lUd2x3MERrM21Z?=
 =?utf-8?B?SStZTzFGQi9XV2RxUjQwZjJyaDVrSDRKRHlSSTF1Q2hZdXdFN1N2aFdmMGJo?=
 =?utf-8?B?YUl6MXhUQjhJdGpFc3FOY29ia0cxcW4xZ0F0a2p5UWdsSHFiTzBWU0Vld1FP?=
 =?utf-8?B?dDZxUU1Rd1A5Ly9LZmI3K1cvWml2OWZUQ1B6UDJkcmZ4NXBuQnFBQW1ScGJ6?=
 =?utf-8?B?OWRNTG8zVTBwRDQzU2U3bmJ3c1p0NzNtT0N3aEFiWk5zMjBxUGpTZzlEVVhs?=
 =?utf-8?B?VEtLN2VHSWdZZlNqRnQ0Tkp4eGZxQ2l5T1FYcm1wWFhrSGQwQVlpTzNSZTJI?=
 =?utf-8?B?WG03cFdBN3EvNDJyRVFJQ21jVHJNbTBhdEJhRHZaZXdia3YwSzYwaWRBMzZs?=
 =?utf-8?B?L0xaeW1ILzh2Yk1VejVKNGxyNjBSd0ZldG0ycEJ1b1BERnlvSVk1VFFTOUJH?=
 =?utf-8?B?dS9CeXgrbnZhb3FsM1dGVGxsczJXOFd6eFJtYlVnTk9ad2Z6bXNtVkJyc2E2?=
 =?utf-8?B?QWZKZjlPYjVLaDE3Nm9kVEtBaDQ2MzY4U2c0Q1Z5WTY1WEoyNzFHQ0d4N2c0?=
 =?utf-8?B?MUdkQnlRZmgyUHhlWGJLTWVWSXBvakpEUEZkbzMvTmpKODlEaVFLUWNYR0lq?=
 =?utf-8?B?cXpoNG1ic2ZRS2ZnOFpRK3l3S2tibnRnVlB4RzkyMjR6SzNqeEZ3RW5xZXVF?=
 =?utf-8?B?MWNmWFZwYTFhM2VtVHNNUG1aYUpydFZ0dWQwb3p0aWtEUVVsS21sRVEwbWd6?=
 =?utf-8?B?blhBRGpPU1hkRGNycW9JcGpwMXFTSjhRUE8wUjc3ZTJNVWtpa0FqMkZLdTZJ?=
 =?utf-8?B?Z2szZjBGeFVPNDBLT2hpTUViR1V1cjcwSUlubnFwczdMQzMyd2NLT2pWbHZ2?=
 =?utf-8?B?Q2JDZy9CR3ZiRTRiNEJFYUJabnVKL2FaZXB3WjNXeWJjNjB2SW4vSWcyMlIv?=
 =?utf-8?B?a3pVYWRVdUpXa1ZiYmc2OVJUZ2hnTUlsbWJkbWYvUXpwTXVwbGtCVk94RWxw?=
 =?utf-8?B?cEd0a2VrMDBnNjZjOFJHZ0VKNXphMTZYSG9SUFlZVVNEUjZZejdHOVZoZnpL?=
 =?utf-8?B?SFlvYVhFSVBCN054clFLOXZSVmF5R2FIWXBhaWZCU2VSQmJ1bXEvenRYV0dv?=
 =?utf-8?B?Z2ZMT3pPN1l6TmJnakdKV2tkU0ZkUWZhQWpFYjVCN3pieHZLNHl2dlU4SEU1?=
 =?utf-8?B?Mlc4R1JsbHpJNHNidWx5NEFnc1RXQkdlOHNXdzloRld5dkdXajlVTldWVWpz?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81c0fae-3042-477d-af1e-08ddb4418330
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:39:22.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddpwe4U/Af81cRFGE2PhsRUh+CIK/R0vxmT5hIgwmDk5fZ1jFtldqch6tdbXxqTsrY+a7kOlgaYIM3y88oww9bdDe8aDiY/QTFLe8C/X9qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> BMEC (Bandwidth Monitoring Event Configuration) and mbm_event mode do not
> work simultaneously.

Could you please elaborate why they do not work simultaneously?

> 
> When mbm_event mode is enabled, hide BMEC-related files to avoid confusion
> and update the mon_features display accordingly.
> 
> The files /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config and
> /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config will not be visible
> when mbm_event mode is enabled.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v14: Updated the changelog for change in mbm_assign_modes.
>      Added check in rdt_mon_features_show to hide bmec related feature.
> 
> v13: New patch to hide BMEC related files.
> ---
>  fs/resctrl/rdtgroup.c | 42 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 92bb8f3adfae..8c67e0897f25 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1164,7 +1164,8 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
>  		if (mevt->rid != r->rid || !mevt->enabled)
>  			continue;
>  		seq_printf(seq, "%s\n", mevt->name);
> -		if (mevt->configurable)
> +		if (mevt->configurable &&
> +		    !resctrl_arch_mbm_cntr_assign_enabled(r))
>  			seq_printf(seq, "%s_config\n", mevt->name);
>  	}
>  
> @@ -1813,6 +1814,38 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +/**
> + * resctrl_bmec_files_show() — Controls the visibility of BMEC-related resctrl
> + * files. When @show is true, the files are displayed; when false, the files
> + * are hidden.
> + */
> +static void resctrl_bmec_files_show(struct rdt_resource *r, bool show)
> +{
> +	struct kernfs_node *kn_config, *l3_mon_kn;
> +	char name[32];
> +
> +	sprintf(name, "%s_MON", r->name);
> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);

Similar to comment about resctrl_mkdir_counter_configs() (resctrl_mkdir_event_configs())
I think this can be avoided by calling resctrl_bmec_files_show() from 
rdtgroup_mkdir_info_resdir().

> +	if (!l3_mon_kn)
> +		return;
> +
> +	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_total_bytes_config");
> +	if (kn_config) {
> +		kernfs_get(kn_config);

Be careful ... kernfs_find_and_get() already took a reference. Additional
kernfs_get() is not needed.

> +		kernfs_show(kn_config, show);
> +		kernfs_put(kn_config);
> +	}
> +
> +	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_local_bytes_config");
> +	if (kn_config) {
> +		kernfs_get(kn_config);
> +		kernfs_show(kn_config, show);
> +		kernfs_put(kn_config);
> +	}
> +
> +	kernfs_put(l3_mon_kn);
> +}
> +
>  static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>  					struct seq_file *s, void *v)
>  {
> @@ -2808,6 +2841,13 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>  			ret = resctrl_mkdir_counter_configs(r, name);
>  			if (ret)
>  				goto out_destroy;
> +
> +			/*
> +			 * Hide BMEC related files if mbm_event mode
> +			 * is enabled.
> +			 */
> +			if (resctrl_arch_mbm_cntr_assign_enabled(r))
> +				resctrl_bmec_files_show(r, false);
>  		}
>  	}
>  

Reinette
