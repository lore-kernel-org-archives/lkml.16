Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA924BD03
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626560; cv=fail; b=a5+nPKQ4s4xFF01F7fS+OpXQQfzPC96ORNT13T/TRFd66us2Y6sphh2EWn8qahe8Ik6l8eLvrHG1J9y77OUndDy88EKF8yTNBgulKY7uX1h2dC/vyu203KKtrKtvhnzSDFXXUa5QzbEvm5Dq+F3BcURHtYqR5pr4qwJ5zWfhtwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626560; c=relaxed/simple;
	bh=tPQ4aB1ODNn8l2QQng/YYO/BfN4DOVGtyBJ0M6vX/t4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o6diAU7F/HebJKyBYjmHUqoFvVDHCbFHjKy9QlgPD3FD5rarX8rF5OlifvSlslxMgQkhdE0Inq0q9GTFOcLF/HSy8PyujcQv+cqw4bFjhO1w4vXjNoH9R9kxgVgQNwxCpb3jms+0MW0XETe/MoQlAcST7pIFqI94TL1Gk1xWaac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D890uOFC; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D890uOFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748626559; x=1780162559;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tPQ4aB1ODNn8l2QQng/YYO/BfN4DOVGtyBJ0M6vX/t4=;
  b=D890uOFCOmnhZvLMe72VGCJUH6h/8Ffgkq8i9AO2yrYPR6CwrGLoWzyC
   AyA9L7Bo6R+opgBYJULiN8GhpRBE3NLy90UEWzFe/XrFtHGnOf7bLecui
   cX1b/wkic7SO2BRvwrk6q7jRa2jEKa3MmNDkUbyNgpi4QLCqskXTpTHTC
   QpE/aIOFANhvWpnhhXtZHC4MvivliGFXOQy5Tbd9ck4XHfrVZyfq/Wv+y
   ebdxHv40hsyZ0yJbkHgRnn/njewXpKOqEXw0Cj22fLtTqUAobZRRsLZcM
   yRW0nBTf2/VWvILckaee8EicEriUJR2XaW13H3Zl/OnsTa/qHlsj+CE0s
   w==;
X-CSE-ConnectionGUID: YNu8sZbYQgarde9wFbJjsw==
X-CSE-MsgGUID: Eovm7YauSleSzUH4jtRXhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61352320"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="61352320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:35:58 -0700
X-CSE-ConnectionGUID: 8QAcTiP4QsuuryabcZdlHw==
X-CSE-MsgGUID: Zs7ruAqlTLegzTy2qDwv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="148723413"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:35:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 10:35:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 10:35:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 10:35:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0nSTpAXyqDx75fydbWbo7oi90KeD2xgWXFHDkEvuFIc3Ue85W38hLwBRWjJigMjh1RiFnHx9Fw68EiWs3zdnXSFlH/NNghlGHEwlv4e/MsNzLL1OiSgWsgeJ5uxyq1PApejgDIPs+Td9pOpVUjezXVKCo0h9uTAvS2sGWDRh4IjjHHoU7mZ/oaWEOTVvO7wJWfJyDTELaUvYdrcBEphaKsIDvyjOXsqMmQ8ffdLF9WB6Uo4V6dpxeLQ1l7H8CQc5aEiYme4gQE6gTVHtmZhuwhkAskl/Vg3nzG2hKgsgjv2QYBXoLRguUYOX5ZA261z64R92/QWMZUFCPgAhRKibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYWI4+n0oWsbnWES0G0ipCxFInK9TRMfh/qfZCwg/XQ=;
 b=ljcLiKnRL7NIK3aj2ea+K3VzZ76zw/t0kiLGwhvYrJDCZjwXP9mvjp0xHwQ/+1u9SzohX2PHoZq0NcnLVFH8/3k1u5XJlkLWa44KTXT6cHqv9aBXgv7U69yYg3pbTwwNkS62RA5cA8ktLVMwEYzUehsnDhrVPYLgeobstwp1TQhgB+II9E4wnu9+kFixCL1sbmqFb3dsG9QR6sDjJw7eqas2/YPbHUPb2g8sVTzuVmjqVpeYGUqXkAEPT3QrxaXwphGor9wHPcUeD/ZtxsomL9hwQxn5ZA3qTAtCiIKAaqvQivFHDNZ+EQQETDXEgp4KLzIhDrTJdsV9yNd3u+B/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 30 May
 2025 17:35:39 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Fri, 30 May 2025
 17:35:39 +0000
Message-ID: <cb96c017-eed1-4875-bf82-2b38630468d3@intel.com>
Date: Fri, 30 May 2025 10:35:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Restore the missing rdt_last_cmd_clear()
To: Zeng Heng <zengheng4@huawei.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<Dave.Martin@arm.com>, <tony.luck@intel.com>, <xiaochen.shen@intel.com>,
	<bp@suse.de>, <fenghua.yu@intel.com>, <james.morse@arm.com>
References: <20250529113353.3275066-1-zengheng4@huawei.com>
 <44a4f211-6723-4fde-822c-d739fa2d603d@intel.com>
 <c94b97ea-4dd4-7575-2144-81e4272c8fee@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c94b97ea-4dd4-7575-2144-81e4272c8fee@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bde9076-94d0-46b9-1524-08dd9fa064da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFM5eGdjdVIzYnB5Y0llT0srUStIS2dkcG93ME1OVGlyYjYycWFkd1B4VWNR?=
 =?utf-8?B?OGxER3hWU2ltTXAvTk9oMlN6dHhwNUdvdlpBYUpaVjUrcW9xTWZ3Wmh3czda?=
 =?utf-8?B?ajkwd2hWSU1ZZkhuUnBLR01YaUxTaTZPVEVBTHhLNWJMTm1zVFNIZ2dVUlR3?=
 =?utf-8?B?eUdiWnZQS3krSEQ0WmxFZjFXMXR6aTFlWWI2UUNVNjR0OGgxTTdobklDY0lK?=
 =?utf-8?B?V3lMT202MTNmUFJaMTQvcUlFQURwbE9qVDY0eXdlVk9Qc0lQSDdjdGE5dFZL?=
 =?utf-8?B?SXhFUVhYTU9LKzN2S3V3VFRlcmZtMnA2ZVFJSkMwUkhqbW9vWU9jamd4ODFB?=
 =?utf-8?B?Ly9qTTdFRmRaTDd1VjhZekVGU1RYSmdoRFZKUncra0hHdXovQXYrRy9Gb3Rh?=
 =?utf-8?B?NDFDMXFMblgvSFlYKy9Denp1TGpzUlNOcmQ1bC9LNnUvWE5zZGVaMmJIWjBK?=
 =?utf-8?B?bHAvZTF1V3BRdVUwMUtidkphY29mdS9ZL3NiTDRMdlo0MWk4UnNkdTRWdGRz?=
 =?utf-8?B?L00rcnpBQVVsUHIvdjFvTjNKV2VQSEpxalJ1eFpRendJOW1lcjFoV3hSN3My?=
 =?utf-8?B?N1B5d3ppQ0JSUUdQMkNOMC9Uc2VtMzJ0TS9sYTJLbFF0ZjdldEozKzZKMnJ2?=
 =?utf-8?B?ZDJMdWdQbUFsSHQxU1RieHdkZldqTXROMnhoS0Jhc0JDRzJBVFlpZjJEdHFY?=
 =?utf-8?B?U2MxY2Uxa3NFZGhNZVp0cTRFNk9NN0xURDdiR3lyKyttbXNoTmx6ZjFyRzdW?=
 =?utf-8?B?NEVqVVRYR1owNmd3cVhiZzh0NnRBMG9LZHIyRnRXb1NwVUZVcFg5ME1odXVU?=
 =?utf-8?B?SVJOQmN6ODdPVGhqU3IwT3BGVDFPdWpZdFNoRXFUeGFWaWIvOXovV0pwZ0ZL?=
 =?utf-8?B?NnBhM0R0VVFmUVhRQzEwaGxsYmcwL2RKaDdXdDZxUWV6a2E2NWlKOGc3N1Ba?=
 =?utf-8?B?ODZqa3orSE1ScnRPbWNKWUt6V0w2RjFmZXROSGU5RFJoRFIzTEVBOHhzTjRV?=
 =?utf-8?B?d1pFYXFJa3hLaC9hbVV4a0tEeWd5bmtKRmcxajN5THd4eGxzZm9pYXdLTXBh?=
 =?utf-8?B?dVBsa21QTXVKaU1JZmxNUm9uTGZDa0NnZkVocTVmMTVJV2szTUw0U3k2eloz?=
 =?utf-8?B?Rmd3VE5nOHFOcUVPS3ZDcDRCRGE2M2VNcE80ck1USnJ6QmtTc21nVE15OVFB?=
 =?utf-8?B?RGZTTm40NmdZUFJqVUM3TXFaZnYrWUEwMXMwMXQrdkhqWWZ0UVJveGRpSDFP?=
 =?utf-8?B?VkJWS0JHaXZyR0RLcTZNNHdkeVRWWDA5ZVNnZWpOczVlWmsxdTJaZzN1c0w3?=
 =?utf-8?B?b1NBbFBiRXBPRGdmQXB5TFltMi9UcFdDWTByNXh3aGZaY0IxT1Y5T3A2RkQ2?=
 =?utf-8?B?c0JMWWtvME9BamVlU1ZxTDRxaTNCMHFvMDBGWWVPWjB0TTFYdmRma2VpTmNF?=
 =?utf-8?B?Y0hzb0dEaUE1SnYwWk9IcFRIc2tzZXREK0NDdHZQeWxPWm90bmN0ZVNLMml5?=
 =?utf-8?B?QlVzd3JjNzZrNmx5MWxtb0RiOFBNdFc1NVdMSWZkOVlISy84d0tBcTdXTFE3?=
 =?utf-8?B?eEc2ZEdaTXFRS2ZnNHlPaDB6Q1hjWXU0dEJpQU9YWHVZSTZTL0EyNUlvYWV6?=
 =?utf-8?B?OVdSSTkydllYMWVxTkFJcUJKWW40NXhlUFR6TnZrSnJxS2ovZitNeEtxZ0JF?=
 =?utf-8?B?YU9Ld3A4c0xKbDdia1dTKzR1RW9WT2F5cWF2VVRFdmZJU29IZ3Qzell1R3A5?=
 =?utf-8?B?OHNVcUtqTjY2RW03SUw1Q05yUUVCMTRULzY4MFlFbkVpNEYrYXJlL0FYazll?=
 =?utf-8?B?S0hpMVkwVk1nYU45YzR4UEpQdGNTaVYrRUNndWVreVFPeFhSeEJHdVJwVnlX?=
 =?utf-8?B?QklJa0hmKzM3S0hRMWhaRmFQbU9SbE5Ea3NxN0dPZ1lHYjloYWJFZzFncEhM?=
 =?utf-8?Q?UqUGnyrY6T8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzgvaXdwejZtL0p1QVc5TGhBRFpzai96NzJURTMyOEN1ZWhGaTlrckdGdmRC?=
 =?utf-8?B?UndXTzNsTEVXWEcrS0kzdmhkZEs4cHJEeC8yTGpzcHBQYmhXUGZuS1ErS2Uw?=
 =?utf-8?B?dXdZdmJBVnpkN0pRaS9MNmo1WUt0ODU1aEtwQml2RjcyMnlmdFhScmdiSXB0?=
 =?utf-8?B?cklNYk1DWnlTWktDVnpYeHd0M0V1TGpGdkVOSS9XVlpyTUltbG1MZmZwTEVs?=
 =?utf-8?B?d2VWUi9KNnBRdjNXK1N6V0M5ZlhNTlpBYnZaR3RmZ3B2K01qaWo5UWpkMUdS?=
 =?utf-8?B?b0hPdjNOY2RWZHg4TzFQTWdoU09pdE44M0VEcFlRZ244NCs1SGFtZ2cvSVI4?=
 =?utf-8?B?bkxVR3ZvZDVZY3VyWGxyaFZWTUpveFlBMG5KcncvREozSTJYaWpiVXZHZ0Nj?=
 =?utf-8?B?WU1ZNm5lam9tTzNKc3c2SmhxMXd2T1k2V3dhdzVIRjNRc3FKaVZ3M2luUFhH?=
 =?utf-8?B?RWd6aUdMYzJYN3NLTTg1UytRVmFDb3pORVFxTElIYVgzOGV3ektFK1dxT1py?=
 =?utf-8?B?b0NFMjVLMWpvd1VCdWNRaDR2NVM4ellFaUp6N3M0Z1ZpUUpFcWxCL24xckFF?=
 =?utf-8?B?OVBTdlhyUllIWUxBRTBXb1pZVUp6UWl1VERtWk52ZDZIeWhjaTJHbmU5a3Vw?=
 =?utf-8?B?b0JsK3ZybkRLMkVqempoMXk4TWxEd1VOVGVVd212MURKREJteWFONVZmdUc3?=
 =?utf-8?B?Rjc0aG84SkN1M1FwL1d6ZythcE1oRjRXKzlsT09VUkdCVHROYzFSSlo3N2pk?=
 =?utf-8?B?TUgzQ3Fzc2ZEZUFJNzJZRG5CTUIxV1d1c1FZUzZ3QnpCK1l4djJvK3VPSnhO?=
 =?utf-8?B?Mi9UcFRxL0VNVS96Vkx0RFl1TWtpdVM1TkZFTTlaZi9NZ1BrZ1l4K052MWVB?=
 =?utf-8?B?a2tBelQ3aGFyZUUxK2RNWDZOclY0NEF0TUVCM25oNG1LVzVaamRQRHdRam03?=
 =?utf-8?B?M2lXSXJWVklaQWhnN0Q0a3NkdExDNkRiMVlqc3NWbmVFd29NeS84dHpWSzZq?=
 =?utf-8?B?K2l1T0s5UUxrWktuVU8wai90Qlh0NVYxbnNlZWJnUkNJdmNWRUpoTXR3TjVV?=
 =?utf-8?B?Ykh5NksybDJqMFRSbHlZdDJFOFRvU3VkVkJXZXE2NkhROGNFRERwUWRJM0dl?=
 =?utf-8?B?T3NSRnNHYzZkcmpwdGZhNlhiZUdhUTRMandZU3lKbUxCdFU2ZFYxaGZSd1Jl?=
 =?utf-8?B?Vm9NTTZvQjY1SFFveTFkUTVQd3U2RitLSGFrU2c4TVRQWVFkZHBSWFBpSm9s?=
 =?utf-8?B?K2V5L0EydlB1ZklESEZXdGVXQkIrSDRWUHhrbHRjZFcxamxzbDFiQjM0MDhH?=
 =?utf-8?B?ZTlHbmQ0QkYzLzIvOWJyR3Z1cEZMd3g1SzJLRzRFSHU4NkxVZXREL2tRQm9S?=
 =?utf-8?B?a0U4ZytYK0pNSXRnN2hWbDR5Z0Q1SUtVc0ZvYmJia1hCalhCcTdIVW1LcG5O?=
 =?utf-8?B?ODJpc2J5Z0YxcFlFQmZJaXRxK0pkLzBLVStuUXA2Z2xwV0NkanY1eWxGUFVj?=
 =?utf-8?B?TGNtS1U5VXpNWURnWk5pcFd0UFY3bmQ1eEk2MVRXQVQ1N1ZMWHZZN2pMZFpx?=
 =?utf-8?B?dFpUQ2p2R20yTDQ3M1ZDS0ZaSG5JMCtVajVoVmxHSDIxVGNVVU0wZXZSeU8z?=
 =?utf-8?B?RFQwaWkza0FSSjdtTGVPRzByYWRtS2Nwbk00YUh3RG82MGY3d1VmSXlidFpI?=
 =?utf-8?B?RWxFUmRpbmpoKzkrWVB4UHN1WDFyY0kybDU3V3hwMlBjdTMrbFRieFhEYkp4?=
 =?utf-8?B?b3RBNzBTRVNjVE9ZUENSb1Mxcm1UZVJndHBlQ0JzTDN6T3d6dTNaa0xodE5a?=
 =?utf-8?B?VzJvemVWNS9LcFYvMVc4bytIMzZ3Vm9sL0pGaWRjUE1Pay9WVVo0bVdGNFlQ?=
 =?utf-8?B?OG1ySzQvWTRhS3FvbzAxT2lVclJJSWJHOEttK1MwQ3VwRE84am1YOFUwR3Ir?=
 =?utf-8?B?L1hiRkNNb0NoT2ZibWdJMXd1NUc4dzJtTGsyYjhYZVE0Y0VjWFV4ZSs5M2g0?=
 =?utf-8?B?WU1GRWw0VCtlVFMvVURZUUpuVkhHODdwNllWV29uYjNNM2lBR2w1TTJPb2FD?=
 =?utf-8?B?WkxnQldJVUxmR3pmVjRPQ2pzblpVN2pFcldhYm13bW9NZ1ZTeXNPNlNKZnFm?=
 =?utf-8?B?N295ZHlsWUd4MEYySDFFaHkyTUtBME9TUE9GbEw2MnhWWDNBREsweWI2aGNL?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bde9076-94d0-46b9-1524-08dd9fa064da
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:35:39.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAUx5ldDZiksWpqX3+QoHmOOy0rlX2Mu0LyJpA2/hIfSGBMAUcT6eQ0mkCO3FnK6s4NqPZ138mWjMHdkVtQesyfgfoEJRE82+BF60y6O3lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
X-OriginatorOrg: intel.com

Hi Zeng Heng,

On 5/30/25 2:34 AM, Zeng Heng wrote:
> 
> The patch will be corrected in version v2. Thank you again.
> 

I did not notice the outdated email addresses it until I received 
the mail bounces. Here are some updated email addresses for the
next version:
fenghua.yu@intel.com	-> fenghuay@nvidia.com
bp@suse.de		-> bp@alien8.de

Please drop Xiaochen Shen from next submission.
Please include x86 maintainers in next submission: x86@kernel.org

Thank you

Reinette

