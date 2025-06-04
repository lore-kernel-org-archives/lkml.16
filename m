Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67A171A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749060408; cv=fail; b=Yva2+aWwxIBfeMKr4jXD2jyCN4bb2/0cEVh3hGKrbW7Kna0gz8pXRwRvP2KmrQ4VBWsCs6Ris0aJg58ey+h7enrEWf30CgO7dwO+nc0RwVTRef1G1IvccWepVtpR8hZigfVDwi4G/BjWVtRqqJvaeXDXrjYfUzOkmJpM2XT7yy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749060408; c=relaxed/simple;
	bh=7+3eir9h3RMaSBG1XreLujQRs0OgJRMrnml0whmiXp4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ECkvKwGYEzllJbmhNDlhhQWS0pdsfyUT2NJqLj9/lf2/6eTk0hOfHybO8WA9E60sThTg4hUM8XEpaPeJaH75lQh3PJFwZKOqBgPjq3ANa5iU//K8g/OO7FRA0JCidekI8anMPWgvWq0FejNtHmyFT1Kxc8AvMkwQP/NqW3zqjY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISJjf76F; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISJjf76F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749060406; x=1780596406;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7+3eir9h3RMaSBG1XreLujQRs0OgJRMrnml0whmiXp4=;
  b=ISJjf76Fr8gezhBuSp8YPERIzFxWOQla3CM+lBkvAM85qSehqhvTjzuD
   omyCnYoxxawDc4G3ZMN5QfFOcvWqh0M+EGBbe1GA7AlWnydb+fsKnq9yx
   WsJorFr49Ho9ZYMh3Klby1M1P4AJYCjQRFq/EhNp5suQs64KeF6tVuFzX
   HrsQ3n9aLX72ED4LKrDYLAdtSI7tpyUJ7mwXTOVA90VP8CXYCV1poETmb
   4e0GvUpaftbhoL1ibvWuSi3RNvWgQJB8Y5cEnSTyHPl7gbZ7pBBitszuK
   f5CEvLL9fgU+Xma1PVrhpnz/TlHF5DokpvSZWn7HZ+4aVEHaenBA5aJ2i
   w==;
X-CSE-ConnectionGUID: GAPkUW0MRaa+RMgGIoxsRw==
X-CSE-MsgGUID: G4ye9xygRSec/DXfogciNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51077104"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51077104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 11:06:31 -0700
X-CSE-ConnectionGUID: C4zsDFfpR229aTGuutfOiw==
X-CSE-MsgGUID: f2VJ8ybzSK21xNMDcTfcaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145220576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 11:06:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 11:06:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 11:06:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 11:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7WYKuPT7zPg31ZaE+CPtW2/wOw9nqgR9GRSGtk5xrR9q0bNJnd9KRHeKg1gT+8L91g7pIHcaTCj9FY//2fQFuMZWBZZPHqEbaYcghwGgU+iuq1aLGuNLifPFZmj9lS/pBnB1QTZbYXRnRLmnfzlxAvOW8nUodH1EFyKV8HtyIm1QG/8FawyO38xomvVSW1aCEhRSJsrwTCQ1Lz/GJbTN3MzIAWD7jGYp+rJV8jrO1Gi0qzKocao8A2dTZkYl8ONufHB27Uluf/MboSF9VETv5MMDeq//SToVmroQC4MuoTJih3ryahkrTvYnm0h08Bv5qEG+NB2OVnnO83aPPUAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7dOgyBs2VcnYZ8oOOL4JKDd/pU9Begthap7EjXTG1A=;
 b=hRbX21TTXmzXgyGw+IvTELxnGJhnCRpNBTt1c/8vVYqIJZMsBBxl55JuEG/YGAdaY0lfSqRXBhl0PeED1asaqaTYA01Wf06N6qAK7qcCnM9MC/JGyYpniotJiyKFTGLzN8MwbpzfsrRom0tMh6bYWbhI7rZWyohmruO5bnkUp0m/V2GEKQx9U+3xQq0cJWwqK/sta4lI6JHUT6RYgCI37laf5vZgymu2Jc8KMMe8SQzjLAFQHedvlpN85mWRJuH77VSZPzV88ShR8n+9HWToY01e2oRmAmwrh+G3F6zDbCy9Ch4CfDmGHgIZnXYejk78xGkz1i6cM94TlMe8nqB2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB8018.namprd11.prod.outlook.com (2603:10b6:8:116::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Wed, 4 Jun
 2025 18:06:28 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 18:06:28 +0000
Message-ID: <de0da633-5d8d-4343-8d23-2c88cb06c1f4@intel.com>
Date: Wed, 4 Jun 2025 11:06:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Restore the rdt_last_cmd_clear() calls
 after acquiring rdtgroup_mutex
To: Zeng Heng <zengheng4@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <fenghuay@nvidia.com>, <bp@alien8.de>,
	<james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250603125828.1590067-1-zengheng4@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250603125828.1590067-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f399d3a-9298-4d96-1f39-08dda39286d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm1zSStUeGw1aldoS0d3Q20rSGVqM2JOK2N1MXJ5WVBzc0x4VWtkbEhMMWdx?=
 =?utf-8?B?TjFRb2UyaWN6WWk3clhkRHMrczkwRXo1U0NrZnFpdjVaaXlOQ2oxaUFaNzlp?=
 =?utf-8?B?azEzR285UkFTd3JBd3Q4dXV2MnhqRWJ1MWE5T04xc2xJQUpJSE5zRE9FeGRa?=
 =?utf-8?B?NmFBbEVnc2ZyWjV5VkpjVktJeHFjc3JQUWZXZWJoQ25LWHN2bHBKYlg5MTFh?=
 =?utf-8?B?RFY2enh1QUhWLzc1aE5saTQ1SlFkTm9MZ1VtYUtjeFlwYTdUYUkwV3ZPdTla?=
 =?utf-8?B?TUMxWVA2aXdhUWFrejBSMUFHVTEwL2lPQWg2cjEraTR0eEMwQVVKTGswU0hp?=
 =?utf-8?B?ak0wRlg4VlJxTmlLSzJ5N2dvSUhUM2hQREl6SzBvUlNzQ1hwejIvKzdmbDN1?=
 =?utf-8?B?bE5WZWt4OGlpeCtkSjMxbmtTVzhJZWFaMWJKWWZ6dWpxdGVHYVozWWtoTTMr?=
 =?utf-8?B?bXkxNmxHQ0RpMDVaUDNzVlIwOE96SitLdlZvVTVERXFkSXNyd05seUhVRmtY?=
 =?utf-8?B?S1AyTytOOUFZbmxjNGlRT2N0SURpQVcyU2EwMFZTQ1ZIeEZ2YldaS3BvRUlV?=
 =?utf-8?B?bXFvdkZyUE1HN1A1eXg1YnJHSWFjMEpyOUt0S0ZWRDRaWmFDNk9POGh1RDFa?=
 =?utf-8?B?ZzVmdFBDVVo4K01HOXoyNFBUVVBLVGNlNndhUjNwMHl6VEgyemVHcHBTUEtZ?=
 =?utf-8?B?bFJscTFPVURiVUFrOEpSQ1Nrc1FvY1NBbkUyMGdYU25kVWhXei9jTTJiNGQ1?=
 =?utf-8?B?M1piMmtIWTM3OC9MaFIxSWVqMW9XNllpTmI0L0F0eEpmYVp3Uk15M3M1ZE4v?=
 =?utf-8?B?SXE0YnZlWXMxMVc0Y1E5RkFFbWEvK1ZFby9WNFVSV3ZNbVp4Szk5cnplaUoz?=
 =?utf-8?B?UDgweTJnSVhpek5UZnFoL3ZzOTdDa1k4TCtReGtHWElERWV0WEQ2bUVvaStq?=
 =?utf-8?B?Y1Y0QWJ0S3pib0MyQzNvRWxsSC85Q3Q5Rzl1N2psK0dKYXZMZ3owRW5TbmFR?=
 =?utf-8?B?SjhTaXVvUS9Jb1VEMytMRk1lOHJrOEhIeGFZZFcwMTBGc0tPOUEyZUVDbk5M?=
 =?utf-8?B?aVBZUmZWUzVoYjZwMklwN0JDY2lnazVhc2x3RUhNZnMwRWNzWlFjWFhaZ3Yv?=
 =?utf-8?B?R2x6UW8wYmVvTW9YcFNBVExmeUdtNG9oOHRyTEpuQ0VEZVVQVHpqL0lVc0dN?=
 =?utf-8?B?aDcwTElwYXZFWWR3bHZJeUcvbk4rbWtkYmd2bGQ3OTRGNXVnbGNFdG1TeDNh?=
 =?utf-8?B?SVZDTnVZYlJoRVUzRG5DanJmK2NHK2FPWjN1cmE4RS9HK012VGRFaGVMSDR2?=
 =?utf-8?B?UURYa1JIOXJLUHhld3NzMjg1NlRFQlFnVEg1YXFMbGVLZkxmQ3J6TFNVZnlW?=
 =?utf-8?B?OHBoNkRJUmJRcHkzb1FKSHZ4NmhTVkdub1Yxa29VSGRRVnlwaXpIUHZEczdp?=
 =?utf-8?B?ejB6eEFDN2Nxd1JLU3VPUUkwbTlHMlZTdlliaU4vcmw4eHQxYmxqc214RWVL?=
 =?utf-8?B?Wi9xTzFncC9jUm5zNS9KUlBHTTc2a2ZzbVQvTHpLU3FxalU3VlJoeTlSZ3k3?=
 =?utf-8?B?eVZZV0JyOFZIckxVTzlDdFNlRHpRZmNRN2Ivb2tETDNlQmwyU1pjVFp2eFhj?=
 =?utf-8?B?WmozVWtmbzhMWU9hRHczYlZkNlJGY1VBbkJoZXF6eEU1cjJNc3lUNVUxR1FE?=
 =?utf-8?B?NXlaa25IckxRTU4vQnZJSlVDLzdZOTUrU1FxVzRRV3VJNS9hWlg3a0tJVmVQ?=
 =?utf-8?B?WlZrWjZuZlY3OVRwK3ZsNFpmbVlPSVl0MkNGemRqSXZBd3hGdHo3RFkwcElu?=
 =?utf-8?B?L1dzZGtsb3Q1cTVacU55dTQwcjZ4amVvdlBpTDAwL1ZxbEo2WDN2b0h6SmdD?=
 =?utf-8?B?aDRVTzNXSUJRQnRVQXE0aFBjOE5wOGgrVDUzVmp0a3RxajdHQUR5U0dqMVFN?=
 =?utf-8?Q?O5JQZXYAaSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2w5VjZ0L2VqZ2R2V2RyTkpUVitWUVdLU1M1UkdmVFFXYzhpK3lJZERBN0R6?=
 =?utf-8?B?SWNGUzUrNEhkU2ZnTTBaNkNxNS8wOXJXRXJpWGRrM0RqMGxrN2JKVkk0T2lo?=
 =?utf-8?B?OVo5UHFUZmFTVGduT1p3K0xBRHBFREZNamJndXZkK2NpV2NqTk51NGxva2xm?=
 =?utf-8?B?QTE5aGI2YmM0dVJrWDUwK1YwazZHNVVma2MzQVdJL2VLWXRzV3U3OXA4ZG8v?=
 =?utf-8?B?UUtMZTF5SHp2Wi8vdTNoK05ITVFUY0t5bnFJWjc3SDh6RUhXUmVybUJTcklJ?=
 =?utf-8?B?aXdWV2NDM3ROa1AvZnlFQk9KWnJLQXZteVBFODNET0ZnamQ1MHpiS0JNMm1U?=
 =?utf-8?B?ZDFkVE5VTjlYVWdQMkRRaUpEUEM4MjJhSGgxbEp3c1Nxa3NMM29uTWhnRDFS?=
 =?utf-8?B?VkswQWZINnBLK1R3clRLaGNXOElHYjA3d29CZWdBcFdmM09wM25GK1BnbU9k?=
 =?utf-8?B?WEd3Q3AxMDAzZDJFRjlEZ0RUS2VVeFZCMG55VGkrclBZa0JTZHV4TzljdU45?=
 =?utf-8?B?ZEptanp5Z0xuL29RNUdNRG1pNlcxT2RRZ1ZQcm8rbi9rRjd5bGhEaldFQXIy?=
 =?utf-8?B?NkVpM1FtejlQMHdPLy9XRVBNNmlER0h0WE5EWTM5RGg0bkk1UlYwQ09OYmNH?=
 =?utf-8?B?U1NGRUNVVkt1VFZVMTk4SzI3WldSdnA3RG1IWm9iK1BPdzJ0Q0ZPaDlMRWI2?=
 =?utf-8?B?VmN3SjRNZUpSN3I5ZjhXd3VsZTdvMkFBMVpBbEpPc2ZjV3JSalZoakJmZldm?=
 =?utf-8?B?SDJKRndLelhWS0NUOVY2TkNEOGJqSFh3REV3d2NWRFFCUXB1MDhmSWp6Ymw5?=
 =?utf-8?B?RFJjUWRCOFQwbjV2VDJjaEVWUHgzaGNIdm5VK2RXNUhUTDZhWVFsSzdkRGpG?=
 =?utf-8?B?am1ySlRVck5HU1ZmNzVNeXlYS21MaWpOUmw5Ymk2aGxQZ1g4YnNibEQ0QStm?=
 =?utf-8?B?MExlam90cHZsOWFRVDAxZDQyV2FwUm5Od3ZDQTZYZS9oRnROSFBpTHpCN1F0?=
 =?utf-8?B?Q0VqMkdEQ3dKTFM5MS9jbUN0dkJIZUJuMjh3QkpPNXBCMFY0S0FaL1Nxa0I2?=
 =?utf-8?B?TksrN1BueGdxUXdaL21OT25NN2FlSVpSRnNQQXU4RFRab0Z4TERHTysxWEVs?=
 =?utf-8?B?Y0wrU21NMlNTSms5QWczRDdqNEtNL3hXMEJweUtwRkp4NEova0x5N1k1d0Jl?=
 =?utf-8?B?ZURncHAybmxZSFFWRUhpM0NRdURkVlc0NjZMRTdYbjlGYitCRCtMMkhQRXpn?=
 =?utf-8?B?cXJ6czZ1WHVqWmpULzBTYkN3bkZRdi9lWEYyWHB0M1pPeUE0MzRxR2p5eCs5?=
 =?utf-8?B?dThpZlo5NTFyRDJVbjlPMTl5UFFCbzFTNmpCZDN0endlaGJRVllKT3FNY1FR?=
 =?utf-8?B?U0tHS3MvUEVVRFVxbDVKZDBMdGdTRy93d3ZkZHdoRCtDZU1NSkRWTndiYXZw?=
 =?utf-8?B?eVJVKy83cWlKS3hqb0dHNXBKazJ3QVdrbUxwd3hrRzd3TC9DSEpoL3V1T1h3?=
 =?utf-8?B?Q0dnd0FlS3RnRE5IYmtMUVZLcGtZeU92Wm9RWEdMd0l0UXZET0NxZ1dJVC9Y?=
 =?utf-8?B?WHY0OFFmVGJJYlZqRDVlTmVQYlpJbTBwZWFaUVozbkNaeFg1Tm5idFNNZXd0?=
 =?utf-8?B?VDZpdGtNMnY5d2RvSEp4aStPVDNKdmplTCtFN3oyYzVUSUJYellvbUZ1aDJV?=
 =?utf-8?B?NXBxRjJqSVBjK21wdHRVQWVqSHFWMjBNYkdVUVlDYmVhM0pVUTh5QmorL0VJ?=
 =?utf-8?B?VDN6UHBvZFQ2b1JuTkJCMEoyd0pTUEZmdU9QQmVYcEoyZ0dnK0lYc0dHeU5B?=
 =?utf-8?B?Q2xENGNYNldBcXdhdG10Zmg3TjJlS2cxczB2eEZ3RE5pa2k0RGNORWpPTSty?=
 =?utf-8?B?c011OFMzN2pRa0dISmpYNFdDdGlRZ2Z5d2Z1RmVqdjRjRmtQVDBBU2xmVEo0?=
 =?utf-8?B?dXdDU1NZRXkwZU9GUXBEWlhBOTJNQzI3VWc2emU1TW5BUUI3WWl5SnNnSm15?=
 =?utf-8?B?T1JlL1ROVkR6eGpvV1l3TEExWSthanQwQnBrajZsYjFSV0swdzBZVzZRMUxJ?=
 =?utf-8?B?RDVhNjgvSVA5a1BodTk1ODBXZERIZGJqNGxuYzIydUhTdXJHWUVjSmpDd0lB?=
 =?utf-8?B?VVowRUF6MVJvQUwvc1E0enh0TGZ2U0oyWVpwd1ZZWUJtQXdNRTBPbURuempr?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f399d3a-9298-4d96-1f39-08dda39286d4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 18:06:28.3241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMpV3D9stwGYBdVmIaDDXlwM0m5EiXzYxYduXTcg+qOdTGj6eYiElme4GGadPuCi7bkYFvkV0ufuLgsYkPbrmP5Bj0UJOczQD5duJT4QIQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8018
X-OriginatorOrg: intel.com

Hi Zeng Heng,

On 6/3/25 5:58 AM, Zeng Heng wrote:
> A lockdep fix removed two rdt_last_cmd_clear() calls that were used
> to clear the last_cmd_status buffer but called without holding the
> required rdtgroup_mutex. The impacted resctrl commands are:
> writing to the cpus or cpus_list files and creating a new monitor
> or control group. With stale data in the last_cmd_status buffer the
> impacted resctrl commands report the stale error on success, or append
> its own failure message to the stale error on failure.
> 
> Consequently, restore the rdt_last_cmd_clear() calls after acquiring
> rdtgroup_mutex.
> 
> Fixes: c8eafe149530 ("x86/resctrl: Fix potential lockdep warning")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

