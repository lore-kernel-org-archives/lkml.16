Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F54181E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763681; cv=fail; b=TffCGxFfgjtdqe4dPtlNjrSK3VBvGZUpDvIY83N6KLLz2PS8ysKS69KTH8Me6Oopy8qkszgKKyINRX/yEUWv38F4lqCQgrl5XYaKQ8zk1JlIl3zwLL1Wd7eq/TGR1yTUL8yH/xMvL0+hQbGmdjKnLVfjfIcMoEm/KC3Q5U2jywM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763681; c=relaxed/simple;
	bh=3ywPcuDZH/S9vN8WBSRDZLfBZPkUa8T8fbdj48uxGw8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iLKANRbfN2NDERZvvT0aPL9xlikydhEp84wi66E2Fm/DYR+zqK5NzHuabP8Qd3Z+KMF4CpfPfCBheb6IGzQ6LaDz+8AgCnL6yQWQsLVz01R7jOsutM+6amPL0XBwMfle99btJTfmqOngV4KCRqefoVvZ/5PuakVdflmJWt5Izs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOZqfkvV; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOZqfkvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744763679; x=1776299679;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3ywPcuDZH/S9vN8WBSRDZLfBZPkUa8T8fbdj48uxGw8=;
  b=OOZqfkvV1JMJhfB0AWsKDCAvUMvRGV6Yd7eRZ1iQM0KfoK03OzEBdUlf
   a8eqw2RVOh/9zmNY5zkXSkGc45a/84D3c6gnRcwLvvFMAlNJlI1iqHvbx
   r/Ulsi3JyKBB5U8gJiiGr1CmJTAYGI8quTlkWVe40N7soum3a3RIVpmJ8
   d1KoniOcdkdi8/OJxeXSva+fQ1QFACYvBGglDc1F0Di0aNfKTH25N+vuY
   p3oBwbwgIROIutrx+bnOe4/Uq1qiGQUtkNrcp72q8xPYzXp4p3NmBmqKZ
   pA97Oql94nKsHu1OmnDXCf5GRZosWO+tdoniuh29rMfxJzaQQeMnaf2i8
   g==;
X-CSE-ConnectionGUID: ESLJC8AATOOOhAsHE0pjeg==
X-CSE-MsgGUID: hm7RIye8RuGb5ASTsihWLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56932115"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="56932115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 17:34:38 -0700
X-CSE-ConnectionGUID: LhIU8sPTS3aZRA4QotY4Dg==
X-CSE-MsgGUID: il26THC+TaGBU8yqRLLG7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="167442128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 17:34:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 17:34:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 17:34:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 17:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNqJM2eeSTtMrw/LkreruCg+QGwRLw1Qbs9bHukeu1Zyz9GWZ5LBx6jfdr7YmZlFEgjsYk+m23fAkUCUzofCVndPPz/jBjfY8b0HIqnGw3lMQVl/z89POcLc9df/dJ+Ri/4xB76b0p8T68cWSAxCfBZ/171W0WMw8R/Zeg2S3X2UXj5HMVToxjPKRomaFIEY7Adg00WSlddMv0YuzdC50pUajsrS4PHJts6leIcrhGhjpNCoACp+Ayofi8MPeHAlwlshSiaZf37VFVsGuuhMORfQYeB10M1UZMI+4PjjIjKFrMkwL+cTsD5n0g6YZeDf9NCkeysQWPxOI6a4Mt84NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UQQIzeh71uEQeijnuHSFTYri3O36TBtcc6vy5Zwz3A=;
 b=y75VqcMav8bskvEMvk20DMmEre/v45YrVtcub0gt6Grqyf4B1FjoackFJVcC7YclspsHor8hFr5dvBTmUQpltsaBclKnutpTUYCuENLVC1MFCKn9E3HQ7kOVZwrUzU17+8sBtg2ViTiV+Vqu88P7Qel7UnEq4fkoUyz0OktKNd2eXzyDcTuwkVr+XjG1TfCwztjaNMlLueVBgi+MsfHW3HdjibeqrNmqWd/nj81ftkZJXumZQMZhTpc3dTsO8j25PyakQVw3kghXhc6+9qpnUtwxnPFWihQocew06T1ix+EBJVeACfRrGxJyT3RYfYQ8vCBUPyVRFkcbzQs9Rv84cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV1PR11MB8851.namprd11.prod.outlook.com (2603:10b6:408:2b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 00:34:34 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 00:34:34 +0000
Message-ID: <26402d7f-3da8-4e6d-8503-04e7161e6a5d@intel.com>
Date: Tue, 15 Apr 2025 17:34:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Tony Luck
	<tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-9-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250411164229.23413-9-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV1PR11MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 413436a0-6630-4027-b4ea-08dd7c7e760e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjdwYnZ3VktmeEZuZGFZaENhRW4xNHBYaFdEejhWUEVwQ2UvdUt0bTk5UGE5?=
 =?utf-8?B?cHRiekhLU0FiMzgwQ1duZ0pFVzdFSVJUdkZSYkxZbVJONHdTYlpmTStoTWtK?=
 =?utf-8?B?TnB6UlcwTG1SYmg0MHZKWjRBWStDWXBZU09zZHVSMGVLSU50SnhydTk5WFVk?=
 =?utf-8?B?b1Y2dkxkWVREMWwxcHJHeWg4cEhORHVKSEZhQXFWc1RCOGsxM0M1SjFxU1d0?=
 =?utf-8?B?TUZxdUUvbjVmTUdlRTlkV0FFankwQllmeldnc2swdytLMTYyclRDMFU4NXl3?=
 =?utf-8?B?MDA1ZHRYR0IvWHFZNVZaeGpoeFRTb090YkVyb3Fna1V5N0U4eWpJOVhXRE1a?=
 =?utf-8?B?WFZZODk1Q3JIOXVFakNHVUxkYTYyYUtJR2QwS0tDY2x3azczSVl6cWhDdHlz?=
 =?utf-8?B?VEdwOVk5bGxkOWRFWUlicXVZa3dyOVFmWEltb2w0UFhhaXo3RWFQbHIvRFVn?=
 =?utf-8?B?dlNxSmVTZGppRjdrbEQzM2RydXBPNkcrSWMybWJhVmNnV1NLNktiRk5FYUNE?=
 =?utf-8?B?aUFjYjdmNEhCTTZoWGRya0lEYVVneThQK3JmbERrdEhPano3OStQaXNXTWVm?=
 =?utf-8?B?N2grNFM3bUZacnk1WlB5Ujd2L3A2dEtmc1U4VnFiTlJRZE1uY2MvNmRYMWha?=
 =?utf-8?B?YllUbjN5eU13ZTVoYUZDTXhWU0dsUEZEVWV1WUZuSWRSU2VvUnBvN1dSdTMr?=
 =?utf-8?B?c3h3TFBCcW9pdUJGSDZ1V2ZZUnFwMUdkSzZNbXBKcCtmUjQ5UXpjK0ZuZ0FC?=
 =?utf-8?B?cExvbUovb1M5aHdpb296c0t4bXlLbzZicUpTem0ySFArN0hHbmNURGRlUXMv?=
 =?utf-8?B?VGtXNHB6UWJtNERuREZMakJ4ZHkyMFhnZGpCY0xZdkVYRjBTUG1takRUYlFH?=
 =?utf-8?B?aHJnZjRIcEJJdm9EOXBMZ2lGOHA4VlEvYzJBOFVOVFlnSG4weDhvVWFvbExl?=
 =?utf-8?B?N2xlY0NUUHZHSFgydnFYZFN2bTlIVFE3N3NPbDdUdjQ0OUNpZVduSHVPczlx?=
 =?utf-8?B?RjhXZGhkaUpIVkVSQW1wSWhjVFFtZnp5bnM3ZmhKNDR4SElaN3NGOHpCWDRu?=
 =?utf-8?B?SHhaSVZpNmFqTDFMQi81Z3lETDdIY2dUeUJBczR2dXBONzQ0UHMvSTFpdC9k?=
 =?utf-8?B?WnU5OUU3Q0RraTZxQWM3bTFjRFVweDhDQVoraUxzRlVZbVVqd0ozWFRIalVN?=
 =?utf-8?B?dlBjeVVGRzgzNlFDTWcxNjdURWg0TlVTMjI5d2QrNlNka1NWU281dk84bWZv?=
 =?utf-8?B?RC9ub0NyOU9oR2JsRlpHMFlteWhEczlLT2J4Nnl4VVZ0L0NTTW0zTU4yYXk2?=
 =?utf-8?B?MEhOK0xqU1FjK1o1T1JiOVZHT3B1UEVwZVU1MDZ2S2h6ajZMdGdEZ212M0RU?=
 =?utf-8?B?UjdCYm5DWm5rVkR1T2VuZzN4OGQ2ZHorbmo3TmV3dTZtbjYxdDVPTklTQjl0?=
 =?utf-8?B?QWRUcE5PL2U5Z1p2RExlckg4eWp2V2hhRXF1T3Q1OWRZeFdYSyt2M0dBVWMr?=
 =?utf-8?B?eDNZVjl3d05iL2lyaWUzeEdKaXN5VlA2TThQSlJoSHdWbWdnT2wxWjQxS1c4?=
 =?utf-8?B?QWRvS0F3aEVNYUxHd21xV0tHTVpnam5uZjZDWDQ1VEw2SUx5L1VKWTFiaFdw?=
 =?utf-8?B?N3J5Q3ZaUWIrcnZLaHIwOG0zUTJ5MVd6QjFwdkxxOCtZbWN5RW1nRjR0bE9J?=
 =?utf-8?B?eWxua0tsYmJVTko1cis4emJRS3UxSjNEeWN3WEordjhpTGRwMHh5SVZxeTM4?=
 =?utf-8?B?aHZENUxXOXJMbnBsaDBmQ1lTVTJCRGliajRwd1RPRXNESTdMRFFXYmdJbmxZ?=
 =?utf-8?B?MkhGTS9VR0NFaGdQQ1dzNHYyY3kxNHk3YXNScVl2R2kzTjhYY3BJbXJvZTQ1?=
 =?utf-8?B?dkhKOWxXS0g3bEwxWDNFN014M3N6U0c1RlVsUnhpbFBVK3JmaC9ZTDBUb0xB?=
 =?utf-8?Q?shfQGRoGfno=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBWL3FkTlFHTmNaMlJ4aVpWZnJjUkNFYkZMOXEzQ2p3Q3E1RStYL2ZwT3Bw?=
 =?utf-8?B?V0hESTh1SG9qVUxKVGFOeStEOHczU3VsMSt6OWptc2NzWGFLWDhPeXM3YUMx?=
 =?utf-8?B?N1ByMkRnZmkyNnJoVnRxVEo4Sm1pR3JvMmJvaUh3NWxqNE4wTTdkZGV3UVlB?=
 =?utf-8?B?UkVNc3BNZEhIa3FnTVMxLzEvMklMc1FoeW11cWR1VFdPSUJuL2dTWDlpd2Yz?=
 =?utf-8?B?RGhoMk82amJqZWY4cDYzSUVBdXZ5anJZREIrRkZtbDFGejEyNDk3WmwyeFV6?=
 =?utf-8?B?WjNuNXdadm1Db0xWWGdhZlJRRWxlSHFydHV0VjVYc1RUTHU4RnpEWGE5bTlV?=
 =?utf-8?B?SmdZQzUyWVorMnFHZkxUUEJnSGxTUUZKTWMyNnVlVXVGemswTVIvZXpCeFRz?=
 =?utf-8?B?K0lXWHIxZGlzRThpc0lOUUlkVjlBejRFZnRyQzRTZnNKTkNQN3dHQXNJcFdP?=
 =?utf-8?B?NXdzb2E5M1lsd3pYcVZWL2lHQzhORkQwNU5tcnVqTUI1c3Z4b2J0K0tkUWhP?=
 =?utf-8?B?NUNTd2ZkVDNmbFpPUDhwMXJKZURhWGllajJtSVlxL3NOMFlJb1R0Vk9RL0sr?=
 =?utf-8?B?Z0pjblVCZlJFUmdJTGFSTVpCdFRyYk50a1Njb2NTZFNyQ1U3Tk5jZEIwcXhs?=
 =?utf-8?B?NDBucEFyR0E2N2VjSElqbmJ2STFsUjJkcFFiOW1DNWptS0p4Ri9FS1h3WWVz?=
 =?utf-8?B?bFhUcnZ1ZytoaUdkR0VxN0xSVU1SRjk2a2tLdFhBSVhEQ05GR0VCdG43NFBr?=
 =?utf-8?B?NElpT0FXV1NaR3dPaUNxeWZQK3owV3NuWGYwTzNZZTNrWUpFdk0yd05qR3h5?=
 =?utf-8?B?a2VDZVRGbE5vTFBzaVBGSmRMUENnWUNRTEFQc25DQ1J4SFMrSWY1R3BhNi91?=
 =?utf-8?B?SGN1MnJyU3JzQnRxL2lZMm0vaVVPMVc2OElGNFhLSWprM2NXa0hxRmhIZ2s3?=
 =?utf-8?B?T2krVitLVFdFL1dSZW5xR0hzNndibUxMMDUvQ0Y1eW83SWZibjZJWjdsVEY1?=
 =?utf-8?B?UVZNQTJtUHJCNFFNOUdBdW1LRlVsTVhGbHArNW5jYmRRMWV4NzdvL3g3eU1t?=
 =?utf-8?B?MFZOdEo2RWxvdXNob2dUQUxxTFkxSFlYenEvQll2VjNJdnlERDBJRktQd253?=
 =?utf-8?B?dm1LK3dPQzBDN1RrT0V1bTI4QmhWbmVtQUJidi84WUE1NjkybmNBYVV2S0dk?=
 =?utf-8?B?Rkk2YXpRcFV5VXEzWksvQmIzeDdqU1JmRE5QZjlSWW5zUUgzdWRSTlZYQkdZ?=
 =?utf-8?B?MzQrdHI4ZVhLcnl6U1BZcUNqTjJuR2VzemxJbDhYVFZ3c2t5bjlwZDB6VUVO?=
 =?utf-8?B?ZUhjUjNIVEk3N1A0N2h5Z1h0dUoxcEQyb1FzRVR3aExyRjNXbGp1REp6Tnpq?=
 =?utf-8?B?bUxkeHVWcTNvVERsdjFGRjFtTkI1REtmQnJSblR4MlhkZjVQTWJDK1R0amox?=
 =?utf-8?B?VGViY1kyNEsxWXZpMTFjZitBUStLNmJ6OFdmZWdRWnRTOFdreWg0Rkp1bnBk?=
 =?utf-8?B?ZFdBaGpMVEFaaWgvK2xSQlowWWhKVTRWK05wTTdYK2NyeEdsKzl5NTZiZDRa?=
 =?utf-8?B?akVwYW5hZnFsbklqYnpZU0JyeUZ3VWI4bnZUendxN2JlVWg1czRvelNhN1pP?=
 =?utf-8?B?WktpMVB6NjEvbTg5THBLZ3l5ZVQ4SVV0NWUzaXg4Z3dCRFludk5sMWs3RzE2?=
 =?utf-8?B?QzZSTnR1aGNJZzZ4Ri9iYStBRDA1K016emx1QnRMdE9qcCs4RWsxMlk2OXcz?=
 =?utf-8?B?UDNrSEZFbXJHdDVWYXBCclhtK3BkNDNUc0I3T0hrRjhhSGFRbkJrMGVKbGor?=
 =?utf-8?B?OEN3dGhvQllBOGZmVnA4NXRtR0lVdDh4ZmV1QUNFeXdXbm9PdVROVUtUQXhU?=
 =?utf-8?B?YzNmeVZtR2pLY3VENUF3dVlaNGdxcUNVN25HNWk1bUl5OUlJdGNDMDNCTWY5?=
 =?utf-8?B?aTFmelN0NWtJWDRoSXdveWs2Z2c3UGo3b3NucGs2NE9pdFpKbkZjcm5BdG9v?=
 =?utf-8?B?ZTRhZ2czd2h0WWlGZjFuQnZTUFhCSjl0bzM5QlBTRW5FazA3L3FpcDRCUmNj?=
 =?utf-8?B?ZjVNVzVOaDNBSGU3SWJXV1ByNlVJYjlsTDJtY1R3RlpsS2licVdRaFc1aXFr?=
 =?utf-8?B?L1M4b1c1ajJZUytqSEFVSyszcllhNTcyZ2FEZEhCaHdSYmhvRXh1Y3pUYTdj?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 413436a0-6630-4027-b4ea-08dd7c7e760e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 00:34:34.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOnCs2Vs9obmxcWxIgOLyHTi5y749MswKNBmpCLwaZuMoF1zOkkVXaQEwh6fihidHD4g36osgKite5KHjxsV1hb8QhsZnDkd1rn8G4pUaJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8851
X-OriginatorOrg: intel.com

Hi James,

There is no occurence of "dom_id" in patch other than subject.

On 4/11/25 9:42 AM, James Morse wrote:
> MPAM platforms retrieve the cache-id property from the ACPI PPTT table.
> The cache-id field is 32 bits wide. Under resctrl, the cache-id becomes
> the domain-id, and is packed into the mon_data_bits union bitfield.
> The width of cache-id in this field is 14 bits.
> 
> Expanding the union would break 32bit x86 platforms as this union is
> stored as the kernfs kn->priv pointer. This saved allocating memory
> for the priv data storage.
> 
> The firmware on MPAM platforms have used the PPTT cache-id field to
> expose the interconnect's id for the cache, which is sparse and uses
> more than 14 bits. Use of this id is to enable PCIe direct cache
> injection hints. Using this feature with VFIO means the value provided
> by the ACPI table should be exposed to user-space.
> 
> To support cache-id values greater than 14 bits, convert the
> mon_data_bits union to a structure. These are shared between control
> and monitor groups, and are allocated on first use. The list of
> allocated struct mon_data is free'd when the filesystem is umount()ed.
> 
> Co-developed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Previously the MPAM tree repainted the cache-id to compact them,
> argue-ing there was no other user. With VFIO use of this PCIe feature,
> this is no longer an option.
> 
> Changes since v7:
>  * Replaced with Tony Luck's list based version.
> 
> Changes since v6:
>  * Added the get/put helpers.
>  * Special case the creation of the mondata files for the default control
>    group.
>  * Removed wording about files living longer than expected, the corresponding
>    error handling is wrapped in WARN_ON_ONCE() as this indicates a bug.
> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 19 ++++--
>  arch/x86/kernel/cpu/resctrl/internal.h    | 39 ++++++------
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 78 +++++++++++++++++++++--
>  3 files changed, 102 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 0a0ac5f6112e..159972c3fe73 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -667,7 +667,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  	u32 resid, evtid, domid;
>  	struct rdtgroup *rdtgrp;
>  	struct rdt_resource *r;
> -	union mon_data_bits md;
> +	struct mon_data *md;
>  	int ret = 0;
>  
>  	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> @@ -676,17 +676,22 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  		goto out;
>  	}
>  
> -	md.priv = of->kn->priv;
> -	resid = md.u.rid;
> -	domid = md.u.domid;
> -	evtid = md.u.evtid;
> +	md = of->kn->priv;
> +	if (WARN_ON_ONCE(!md)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	resid = md->rid;
> +	domid = md->domid;
> +	evtid = md->evtid;

What is not visible in this hunk is the types of these variables, which is:
	u32 resid, evtid, domid;

These types support the previously used bitfields well but now that the
data is provided via a struct it should be possible to use appropriate
types and avoid this unnecessary switch between types (more below).


>  	r = resctrl_arch_get_resource(resid);
>  
> -	if (md.u.sum) {
> +	if (md->sum) {
>  		/*
>  		 * This file requires summing across all domains that share
>  		 * the L3 cache id that was provided in the "domid" field of the
> -		 * mon_data_bits union. Search all domains in the resource for
> +		 * struct mon_data. Search all domains in the resource for
>  		 * one that matches this cache id.
>  		 */
>  		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 36a862a4832f..d932dd1eaa74 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -103,27 +103,26 @@ struct mon_evt {
>  };
>  
>  /**
> - * union mon_data_bits - Monitoring details for each event file.
> - * @priv:              Used to store monitoring event data in @u
> - *                     as kernfs private data.
> - * @u.rid:             Resource id associated with the event file.
> - * @u.evtid:           Event id associated with the event file.
> - * @u.sum:             Set when event must be summed across multiple
> - *                     domains.
> - * @u.domid:           When @u.sum is zero this is the domain to which
> - *                     the event file belongs. When @sum is one this
> - *                     is the id of the L3 cache that all domains to be
> - *                     summed share.
> - * @u:                 Name of the bit fields struct.
> + * struct mon_data - Monitoring details for each event file.
> + * @list:            Member of list of all allocated structures.

To help readers this can mention the name of the list. Can simply be
	@list:          Entry in @listname.

> + * @rid:             Resource id associated with the event file.
> + * @evtid:           Event id associated with the event file.
> + * @sum:             Set when event must be summed across multiple
> + *                   domains.
> + * @domid:           When @sum is zero this is the domain to which
> + *                   the event file belongs. When @sum is one this
> + *                   is the id of the L3 cache that all domains to be
> + *                   summed share.
> + *
> + * Stored in the kernfs kn->priv field, readers and writers must hold
> + * rdtgroup_mutex.

"Stored in the kernfs kn->priv field" can be made more specific with, for example,
"Pointed to by kernfs kn->priv field of monitoring event file"

>   */
> -union mon_data_bits {
> -	void *priv;
> -	struct {
> -		unsigned int rid		: 10;
> -		enum resctrl_event_id evtid	: 7;
> -		unsigned int sum		: 1;
> -		unsigned int domid		: 14;
> -	} u;
> +struct mon_data {
> +	struct list_head list;
> +	unsigned int rid;
> +	enum resctrl_event_id evtid;
> +	unsigned int sum;
> +	unsigned int domid;
>  };

The usage of the unsigned int was in support for the bitfield, but now
the most appropriate types can be used instead? rid can be int, or even enum
resctrl_res_level, domid can be int, and sum can be bool.

Also, every struct in this file follows the custom as documented in
maintainer-tip.rst: "Struct declarations should align the struct member
names in a tabular fashion". This struct should follow custom.

>  
>  /**
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index c69ed978aa50..aa0bc57e1c7f 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);
>  /* list of entries for the schemata file */
>  LIST_HEAD(resctrl_schema_all);
>  
> +/*
> + * List of struct mon_data 'priv' structures for rdtgroup_mondata_show().

"struct mon_data 'priv' structures" seems redundant use of struct/structures?

How about:
"List of struct mon_data containing private data of event files for use by rdtgroup_mondata_show()."

> + * Protected by rdtgroup_mutex.
> + */
> +static LIST_HEAD(kn_priv_list);

Considering all the different "kn" involved in resctrl I find this name
very generic for a global variable. I am not sure if something like
"mon_data_kn_priv_list" would be considered too long? Open to recommendations.

> +
>  /* The filesystem can only be mounted once. */
>  bool resctrl_mounted;
>  
> @@ -3089,6 +3095,62 @@ static void rmdir_all_sub(void)
>  	kernfs_remove(kn_mondata);
>  }
>  
> +/**
> + * mon_get_kn_priv() - Get the mon_data priv data for this event.
> + *
> + * The same values are used in multiple directories. Keep a list

"The same values are used in multiple directories." is vague.
How about "The same values are used across the mon_data directories
of all control and monitor groups." Please feel free to improve.

> + * of allocated structures and re-use an existing one with the same
> + * list of values for rid, domain, etc.

"list of values" -> "values"?

Also, if using "rid", which is parameter name, why use "domain" instead
of "domid"? If using parameter names the kernel-doc "@" can be used
for highlighting.

With the many usages of "event type being created" below the above description
will be helpful if it could define what is meant with an "event type".

> + *
> + * @rid:    The resource id for the event type being created.
> + * @domid:  The domain id for the event type being created.
> + * @mevt:   The event type being created.
> + * @do_sum: Whether SNC summing monitors are being created.
> + */
> +static struct mon_data *mon_get_kn_priv(int rid, int domid,
> +					struct mon_evt *mevt,
> +					bool do_sum)
> +{
> +	struct mon_data *priv;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry(priv, &kn_priv_list, list) {
> +		if (priv->rid == rid && priv->domid == domid &&
> +		    priv->sum == do_sum && priv->evtid == mevt->evtid)
> +			return priv;
> +	}
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return NULL;
> +
> +	priv->rid = rid;
> +	priv->domid = domid;
> +	priv->sum = do_sum;
> +	priv->evtid = mevt->evtid;
> +	list_add_tail(&priv->list, &kn_priv_list);
> +
> +	return priv;
> +}
> +
> +/**
> + * mon_put_kn_priv() - Free all allocated mon_data structures.
> + *
> + * Called when resctrl file system is unmounted.
> + */
> +static void mon_put_kn_priv(void)
> +{
> +	struct mon_data *priv, *tmp;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry_safe(priv, tmp, &kn_priv_list, list) {
> +		list_del(&priv->list);
> +		kfree(priv);
> +	}
> +}
> +
>  static void resctrl_fs_teardown(void)
>  {
>  	lockdep_assert_held(&rdtgroup_mutex);
> @@ -3098,6 +3160,7 @@ static void resctrl_fs_teardown(void)
>  		return;
>  
>  	rmdir_all_sub();
> +	mon_put_kn_priv();
>  	rdt_pseudo_lock_release();
>  	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
>  	closid_exit();
> @@ -3204,19 +3267,20 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
>  			     bool do_sum)
>  {
>  	struct rmid_read rr = {0};
> -	union mon_data_bits priv;
> +	struct mon_data *priv;
>  	struct mon_evt *mevt;
> -	int ret;
> +	int ret, domid;
>  
>  	if (WARN_ON(list_empty(&r->evt_list)))
>  		return -EPERM;
>  
> -	priv.u.rid = r->rid;
> -	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
> -	priv.u.sum = do_sum;
>  	list_for_each_entry(mevt, &r->evt_list, list) {
> -		priv.u.evtid = mevt->evtid;
> -		ret = mon_addfile(kn, mevt->name, priv.priv);
> +		domid = do_sum ? d->ci->id : d->hdr.id;
> +		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
> +		if (WARN_ON_ONCE(!priv))
> +			return -EINVAL;
> +
> +		ret = mon_addfile(kn, mevt->name, priv);
>  		if (ret)
>  			return ret;
>  

Reinette
