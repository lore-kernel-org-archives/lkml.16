Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCEC7E107
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743402353; cv=fail; b=QG5WeGobHblfncqyOpZHEuCPQNhjT8WfTfVes0vccXcyePVld8wdiBBq5Qgia7A7LpaPDSuz8saDFKZwosOz5cWsu7pBVFf5mL2PDjOWzj9HmWmtbuwTSSBwTaUPBJMvdmoCjxdUawVtpyv+fbVNhIAYD0PjqK/t01jlxU+yMeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743402353; c=relaxed/simple;
	bh=SRaNmUPgkNffRVnTjwTdOSzBcPRRfTOPuMGh9yLLS7o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BoZeD/rSrPMSfjJAoWzLJxdwKyr2H0MzCu0A+o2qrjue77DP1XTkcbxTGVTHsffgLjuYOwGRaXYG+Jx5oRqv5AYUgtl7gdpLfoLVE2PWEVQlNjaxPNZnvaWM22NtEyCUFw1SraaTfJSPCAofXmnNdE+Njt6voLGwZbMbEK7FUp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJefIYnA; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJefIYnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743402351; x=1774938351;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SRaNmUPgkNffRVnTjwTdOSzBcPRRfTOPuMGh9yLLS7o=;
  b=IJefIYnAzmAEfpa99dj/8CtR2QTP1uEoPwV3Yn7mI0Sq53UeqW3lkVok
   RumlsAy1CLOuxCkDREK3N0m0zWxCJlMIZUK2/bJVq8Qd/S2X2bD5rQI7I
   tzHZwkV+ATDrB7RjWpBe3i/gOYZ8QuTDpEKeumkruofXIG9sbh3L9n+Ko
   tn2QAcUoqYDyMxc4IOlxdMiC364xPyRj+FO8o4ufY5hSgtQr+mqxQdo1b
   xAXbWji9j1ubFzECwmimNdvyEUNpq+CjotY/UEjzH4VNXXoXpegT6sM/9
   veKunI3sSSP6vieVdSP1qZTr2Ih825FLpp6rlz5IM1SmXGM87yJGyGur+
   w==;
X-CSE-ConnectionGUID: 03EzGQR1RQuvLc35pNjnnw==
X-CSE-MsgGUID: DF7LPae6SOeoCIBFy1D1mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44563078"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44563078"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 23:25:50 -0700
X-CSE-ConnectionGUID: jWPQRHRrRUaGfab6q4tdlg==
X-CSE-MsgGUID: dfoskD8ASLSyZPa59p5aRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="149179164"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Mar 2025 23:25:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 30 Mar 2025 23:25:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 30 Mar 2025 23:25:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 30 Mar 2025 23:25:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKLQa7O/qa9aZsPlw/c19/1ZaH7cHRC/Rhma3x9e0m9S3Zhy8HEhWdjdo6zZpuligeORX3QfgRpqPdnYqHDP42O8rjD5pOyMNNldTHNkpU+8umSnXo22ttTJMaBt7wQ9rtt4XUjHL6Td/r4lM3FVV3mnScdQcbr/dzqXq/xA+25T5iL8QStaRrFhbZZ5YWAd7uAhvPe3aPoLUfLc8/8n+ttEbismPVdlCfgi3ita6wcMuTsVuHnNm0ohGQjdQNyT1Jw1TfDhF8RW8XvBsKY9iyEmGEHPA+UGasv8h+pSMnpwxlg3mcNbBGCbbiOXtOLC9fWcnlVO9wxKbbR+TdOCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MqQVZmbMmfGPaXFahFXyKb66QzRUyK/45ZoAhCO5Qs=;
 b=UYV1DPWoSSeFxya14CWYZwB9hAW5IVtWLj9qBG+xKJbrCHm3YoJkvCKPq1woXLJPa4C6yWL8auu1PUekc0ncaF9Z3TTonyM8i4PKTYmqn24TnbHhMkmzwKTnKJM+Qsps3rpmDoNRyEL7foYEuGLlNWX8YVFPsrSThbWhrc4y5l0LTqGj95XM+km4V95bN8S6P8nFdMUmIwgx60bGIWykgHZJ+zy+fPo7o0eiN0d5oymgt4iCWAfFVjOuCr893PiI0VZI8arm7GRiZYHpv4pIGXLzXricw3rCdaeVQZwsRkeDOzONTtAq1M2bcPBamFx6s2wUOsz3lcZuul4yAvU36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Mon, 31 Mar 2025 06:25:42 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 06:25:41 +0000
Message-ID: <09ba5932-a256-4cdd-94dc-4f2b6569c855@intel.com>
Date: Mon, 31 Mar 2025 14:25:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Hillf Danton <hdanton@sina.com>
CC: <vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>,
	<kprateek.nayak@amd.com>, <yu.chen.surf@foxmail.com>, Peter Zijlstra
	<peterz@infradead.org>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <4cd8ba54-8b9e-4563-8fbc-1d6cd6699e81@intel.com>
 <20250326093841.GC25239@noisy.programming.kicks-ass.net>
 <20250326102553.GA12071@noisy.programming.kicks-ass.net>
 <20250327112059.3661-1-hdanton@sina.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250327112059.3661-1-hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH8PR11MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 3780c820-1341-452e-f6a7-08dd701cdc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2ltbTdnbnpYOXAwRXp1aW8zakZJZkx2dWFENFIxWHhvSjk5YXVCc1VVeExN?=
 =?utf-8?B?T2F6c2Z6eFZ1OUhLRGloaVB0c0NaSFBrNEI2dUJqbkJwcDJDMDhBNnR5TVdQ?=
 =?utf-8?B?NTY5aUdYS0d4U2VycDBMOERNRXJ3allZdk9WMmxCMnJwVTVzUGJqVzZaYmQy?=
 =?utf-8?B?MzFma0s3NUJnbzJXQXZPMjM2RkRDMmdoSS9aR3lla1k0aEJxb1NmR0ZoMXRw?=
 =?utf-8?B?aWhxTU1kcGdIWlliV3JYTWxCTXpCa0lPbEVDYXBtS3ZGUWo2ZnVIT0kybkh2?=
 =?utf-8?B?eVM2SzBYUHhieGl6VHBJR3UyN1lWMXpJL2VzbENtMDVNV1hNVEtsT1hTUVdm?=
 =?utf-8?B?b282UkJCQXVjZTBVMW0zZzA0bFBZMFJveGUyTkVSWC9MSlRGNE5rdzd6aUxW?=
 =?utf-8?B?dU9NSGRuRm9WL0JqTmdiZ2Zxa3FxaG1uUmhRNWpMSW00YkUzMG1teUlTYlE5?=
 =?utf-8?B?bmV0NjYwa3Y3V0oxY2ZHM2haUC9mTi9TN2RUVDhzcit5UmlHRjVlQ09MMWd5?=
 =?utf-8?B?MnRGalhXZFMwK3FPSktDcEVEVTBYQndMbXM5RVYvbmFHYU9YK09sYThiWExB?=
 =?utf-8?B?elpxWlBBQWhpdWVPL0pSOEFRcmdJcm4yMlQ2TjlvMUROMEFhYWd0dlNaYU4x?=
 =?utf-8?B?WUdmclZUclZzVG16bVcvdUxSR1hlRnF1U3ViQ1BFNGR3OHZJYVN5b0ZRaDI2?=
 =?utf-8?B?M3dpaHlXZ3lMYjc5S3ZqVTR0V0g3VXVoM09KYmhaNEE1V3AyRURWbmxjTi9h?=
 =?utf-8?B?cFp2aU9aWU9MM2QrSGRiUWlKWjQzYkdmMjc2dkQvSDJRL1NrQmNpVCtITVFv?=
 =?utf-8?B?RHdocGgxVFFHb001bFdoamdtdDBYWUI1NmtXRDgvbE1RcDZWVjBZMTlJWFIr?=
 =?utf-8?B?cHNUUy93MWFBU0NNQndBV0EzNU5QWlFrTVJLNksxQ0l0eTcwUXZpRzRZdnRz?=
 =?utf-8?B?UENGUzVBRVBHR21iQkdGdmpxcVptUHJhTlUwQnJEK0xGQmtEWUxnZkFYdmlB?=
 =?utf-8?B?MEd5TlVxVlVMQzBiMHhTZkczV2RyQVpGdjE4dWZvdzRYSDVsVVB6VytCcCtG?=
 =?utf-8?B?UEMySzNMK1NHWXU3NGVmQlpoU3Bsc296TUZQUVJUL0dMaDhDSkltVmtiV1hx?=
 =?utf-8?B?SzJPWkhaRlZLa0lneWY2cHJoT1BsakhXSGI5VmVMTE5OdkkvQi9TZ1JrR2Ev?=
 =?utf-8?B?OS9kWm5KazdHaEg5VFVZcXlaVE93Qjh3L0syMzdPYkNMaXVKRE1TZ1RmdXBW?=
 =?utf-8?B?amFiNGtnbldmTzF6S2d4Y1hvcTdKMHRkZkhwS044RVdJVnlHajhnbStCYU00?=
 =?utf-8?B?eGJiY3E0Wng2L1h3Y2VHV1NobmxPRUpPY1c4YmtHK0M2SEtsVnF6WjVERm5F?=
 =?utf-8?B?RUtlV0o0dHZSUEJKc1ZGMmE3cEV6Q3ZENDlFcWJTZzcwMFhnQyt2cHlIdlJr?=
 =?utf-8?B?YUJlZkVyY1JONWt1TFlMRE15MC9uN1FWYjJqUGZZSmlPQXlHaWoyWms5UVNq?=
 =?utf-8?B?WlhLZ0dCMllWdVFVVSt1bkFMejJRVlcrOXNFakxVaEtYTXJTM0R2REVyZEpD?=
 =?utf-8?B?VTdzbzkxVXdSN1p1dHNxcXVuZURSZGM5a1ZGYXVNbGpTaFhxMkZaNTlrOWZZ?=
 =?utf-8?B?eDkvV1VFMkg1NThxRHJrTnlSRzdzdHZqY0Q0aCtqazg1YUlOT0d0WmdoRk0v?=
 =?utf-8?B?cVZhL29iNDIrUEZjellzMUZCdkFQWjhaYXF3M2Z4N3FkM0c1U1dicGllQXNj?=
 =?utf-8?B?ZnRnMkdEUTViQTh2QjZWejRFT0tWY082UGxtVldPaU1FVERwYjArWXliVTFs?=
 =?utf-8?B?OVdMNkRhcW1lK2N2QkdkQjBWUmpXWmdUa1RFQURYMExDR0lxWndha0tjcGY5?=
 =?utf-8?Q?npya4rZw5uIqY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1ZjYStqM3BGZlRwRVJXNDNkd25LaDFoUXZlZXdNZUpDWmR3cnZmTHcydWNS?=
 =?utf-8?B?VktwS2tzTEUrSlBIa1g1VURHdlk0RjIya2c5TnVRaGEwb3dmRnpDYkhHT0N5?=
 =?utf-8?B?R3RiVW94Y1lMR2tHV1MwZEp6M2FwZUFINWJtY2dpaUdIRHdBeWxsS0lMZmNP?=
 =?utf-8?B?UmtsWW1vMEw2cWdKZUloUVlJdnF4SUI5dE1NOUVSWTdTQk9hMVRGNzFvbnhr?=
 =?utf-8?B?VU1vN3F3cHlNN3J6ZFpmSEUzbnM3Rm5MTG0xcVhZM0ZXYXp1NlNyNWRoZEVv?=
 =?utf-8?B?THQ1ZHFIcE5VKzRZcVErKzE0Mks1N2Nrc0M5eVBHbnA1WmlRM05JV0ErMlhr?=
 =?utf-8?B?TkxMVDRYbUkvcWsvOG1yQjZ5YnpuUFVybzR5SDZJaWdUME8xcWt2RXZnWGhZ?=
 =?utf-8?B?c0lvZ1YyMjFxdENvL0hReW1BbEFvVEVqZ3h6UFlkYmZUQzNEd1BYSjFIcGYx?=
 =?utf-8?B?V1pqTm9QV1NzNHdmcU56S2JUMVRNaTQxYXQ0NjhOREdLZko3MnN1anNaT21T?=
 =?utf-8?B?b2MwUWJkL3BDZ1Z1WGVnSm9Vd29LT2pBV0YwQWpYMnpLMVlRcXBGSUE2TGox?=
 =?utf-8?B?bzhTTVlMdmZoYjRUSG1tdkFETy90Rk5xK3hXVTFrRGFkOWdKZzREbjVHZGlR?=
 =?utf-8?B?ZGlqQm5scjdpcEhNUy9xZ1FuN0hUblBSMk9vS0UreDdOdjNjUWcxbDJKSXdh?=
 =?utf-8?B?UXVqMzBpVlpaM21RR2RlWi9zY2NwZFB6VjJkaVJzT2hTM2NEQ0tHUUtPRUJm?=
 =?utf-8?B?SXhhUGhsc1hGNWxvT3BKYzN3ZVR5ejREU0x0ZTJqQ2YvZ2RNaUdtblhDVFpK?=
 =?utf-8?B?QXRoS0M1d2lFMjErbndXTGZOV2NiK3FEUnliOE5iR3ArSFNJT2V6OWFPUEUw?=
 =?utf-8?B?MlJ4eEtraGFZbWk4N2lzQWIyN0JLMDRIUXA5WGhud1ZPUnh1OHppTmtUTWFN?=
 =?utf-8?B?NFBUUFJJK2d2YWhvaHVSSlpsbE9iTS96TUN6K3huVlJMNXdra2lwakhqQUlD?=
 =?utf-8?B?VHpBanIrYXpkOGxUN0VreUJuQjJraXZCN3F2K2p6NlFzSytUZy9QVFUybkQy?=
 =?utf-8?B?TkEzcWFFTjc2T0hYTlcxZU1qd0wrbEdjVkN4alRkcFpsQS9uOUxLdmJNZE5n?=
 =?utf-8?B?RWlKNnNoTGQyK0R5OUtaWVpCaG5aUlQxSkQ4cXkxTEpCd0lYVE11VlgzN1dT?=
 =?utf-8?B?RG5adDEvRk11NmJvVjAzamNwV1E1Q1hHeUlNSXhrNTFEWHV5dWh2aUw4R0lh?=
 =?utf-8?B?YVJaVm4yY1VsYkxhSUZ0a1RjWTJrRERqcjVGKzRpODlzeDdYcHNqbEZPY1Nh?=
 =?utf-8?B?cmNadmk0cnZFLzR0dFlFYjRnNEpJMHNqLzlzeDc3cDQrbWFQVjJlQ3hERk1J?=
 =?utf-8?B?YjNWVkd6dWJnRldoQnJUNHc5TXhyRHpqNWU3MTlodWN2YVVIcUh3ZjlyQlk1?=
 =?utf-8?B?Vmh4ZWduSnZ6RFF1WFppUk43TnBTNXVnZE9FT294RW54SXB6cU00K09WT2Vq?=
 =?utf-8?B?WDd3dWJKVStFU0ZsL2hvd2JPallPdU4vQ3Q0R1VuQXBUdytQVDllMVVpT1V3?=
 =?utf-8?B?UlFqSjBvK0NLcnIwYUtxMzN5b0tqR2lRbjVVR0Q1eVhybzZibTR2a20yRlBm?=
 =?utf-8?B?bUZaaWhodStkUFFNcXNHTmhuYzBmRTR4ZnhTS09XaHV6RzlaWFluWE1PUzNt?=
 =?utf-8?B?anFYSUpqZGE2ckowTkxRUGlHTUhSdXRDR3ZNZ3Q4S3VyaXVQcUQyRkdOVFFI?=
 =?utf-8?B?ekdGWDh3aExLSTlLaWgrWGJsdzIzS2dTY3ZmR1gzb0draHQwN1J2WFJIekRT?=
 =?utf-8?B?akw0Q2U4bElaaTNvcDlaTngzTk8vWFdFQjRuem1vMjFpbGM0K25QZHB1emgw?=
 =?utf-8?B?WlZnbHdmSHFvY2gzYXowZmVrNG9ydmM1NnVnMll1anRDd3YzajVhM0NUUHFt?=
 =?utf-8?B?QW04V0hQSkY4V2h0ejFEem9iMnNVQ1RMZEVOUFNBS3lZZGlsMmpGbTVPUmsx?=
 =?utf-8?B?blc2OXh5bnFxMVQzNDBBWklUUUZwb1BFV1JOc3FESTkwZ2ZSZnd2dFpXSnlT?=
 =?utf-8?B?cUhUNVJHVmpIRXJPdFlRU1ViYXloN1lUYkp4bktra1BCd0NXQ2hSMUd2ZXRF?=
 =?utf-8?Q?ZNTp2oA5Uz53YGzPXyOzmt8ah?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3780c820-1341-452e-f6a7-08dd701cdc80
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 06:25:41.8351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkOyA567J8qlqYabtozWrkZMwEW9wwurL6OTNDHgp7GGON0OP0QSd55YYUdHzZDmR9SPWh2lNUtp1CJHrluPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
X-OriginatorOrg: intel.com

On 3/27/2025 7:20 PM, Hillf Danton wrote:
> On Wed, Mar 26, 2025 at 11:25:53AM +0100, Peter Zijlstra wrote:
>> On Wed, Mar 26, 2025 at 10:38:41AM +0100, Peter Zijlstra wrote:
>>
>>> Nah, the saner thing to do is to preserve the topology averages and look
>>> at those instead of the per-cpu values.
>>>
>>> Eg. have task_cache_work() compute and store averages in the
>>> sched_domain structure and then use those.
>>
>> A little something like so perhaps ?
>>
> My $.02 followup with the assumption that l2 cache temperature can not
> make sense without comparing. Just for idea show.
> 
> 	Hillf
> 
> --- m/include/linux/sched.h
> +++ n/include/linux/sched.h
> @@ -1355,6 +1355,11 @@ struct task_struct {
>   	unsigned long			numa_pages_migrated;
>   #endif /* CONFIG_NUMA_BALANCING */
>   
> +#ifdef CONFIG_SCHED_CACHE
> +#define LXC_SIZE 64 /* should be setup by parsing topology */
> +	unsigned long lxc_temp[LXC_SIZE]; /* x > 1, l2 cache temperature for instance */
> +#endif
> +
>   #ifdef CONFIG_RSEQ
>   	struct rseq __user *rseq;
>   	u32 rseq_len;
> --- m/kernel/sched/fair.c
> +++ n/kernel/sched/fair.c
> @@ -7953,6 +7953,22 @@ static int select_idle_sibling(struct ta
>   	if ((unsigned)i < nr_cpumask_bits)
>   		return i;
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	/*
> +	 * 2, lxc temp can not make sense without comparing
> +	 *
> +	 * target can be any cpu if lxc is cold
> +	 */
> +	if ((unsigned int)prev_aff < nr_cpumask_bits)
> +		if (p->lxc_temp[per_cpu(sd_share_id, (unsigned int)prev_aff)] >
> +		    p->lxc_temp[per_cpu(sd_share_id, target)])
> +			target = prev_aff;
> +	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> +		if (p->lxc_temp[per_cpu(sd_share_id, (unsigned int)recent_used_cpu)] >
> +		    p->lxc_temp[per_cpu(sd_share_id, target)])
> +			target = recent_used_cpu;
> +	p->lxc_temp[per_cpu(sd_share_id, target)] += 1;
> +#else
>   	/*
>   	 * For cluster machines which have lower sharing cache like L2 or
>   	 * LLC Tag, we tend to find an idle CPU in the target's cluster
> @@ -7963,6 +7979,7 @@ static int select_idle_sibling(struct ta
>   		return prev_aff;
>   	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
>   		return recent_used_cpu;
> +#endif
>   
>   	return target;
>   }
> @@ -13059,6 +13076,13 @@ static void task_tick_fair(struct rq *rq
>   	if (static_branch_unlikely(&sched_numa_balancing))
>   		task_tick_numa(rq, curr);
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	/*
> +	 * 0, lxc is defined cold after 2-second nap
> +	 * 1, task migrate across NUMA node makes lxc cold
> +	 */
> +	curr->lxc_temp[per_cpu(sd_share_id, rq->cpu)] += 5;

If lxc_temp is per task, this might be of another direction that to 
track each task's activity rather than the whole process activity.
The idea I think it is applicable to overwrite target to other CPU
if the latter is in a hot LLC, so select_idle_cpu() can search for
an idle CPU in cache hot LLC.

thanks,
Chenyu
