Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D322417EF;
	Thu,  6 Feb 2025 23:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885329; cv=fail; b=B1KCdZmMSeIx3u0rJL3u4qCXBxOss4sCS/lV6PPTFQt5vRs+BteKmbbMgT9oKb9gWM6Bzsd2mUPOMGk5wGO4vzzwbeT+xaAqdyUfG11L0VEhMKQqqBKgmohqcsbzsf4f6CJMIyqXOpsDTKHKUp/YnB1F5R0oUEiPQQpcQdbOm48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885329; c=relaxed/simple;
	bh=XvXOueZU0ZGoZs1SC+m3T9Vgfz/0QY+Qc1vi18TNoIo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i9ArbRbXhwELHiri0rrTqxiXBWcWv3aveEkZRPAqJlEXwhFGtykKbdGIcfvFtwE/BeGA5O10ks0BJNURf5uUJJvLqwd1sJn1R+avGDowhQIomSSXTVrZ3st3tPhAs8uAp3nKpKJ35bk89FRYp+mMN1DX6uqYbm8b5GVtvA0UwQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JwAftXKc; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JwAftXKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW5J71LNHdhV42aGUaGg1mflF8jUhZcykcvdv88rQlyacOYjMZKtt1SF2VR/1LJG8I7o39/UvCpeYBxFxpaHRXKPB+rkCgCOLHeUUnqmiS/2qrQMKt/rcP4oKnRINRU/wOna55nI3wlXhJec9LawqcXsxJGh3iNz2G3jBrUH/FooaOq3fCyMCdd+SBiIJCyHQjHnCQ8QXDq+A0eYgWd7w6WRidY7v3hojJimuRKRvnweVGmH73NN0K7Rpc7wghWGgHHc38nNvFFEOwnwNvJVwS+hbZDpCNxFcOyLddaXF78btEb9ml2Gn5BCZuZVjJViYIVbCq/Oj+FpbDJZCbrijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HN12Af3aATEvO7LXScO8aQtnvFKkbK7D9oQ/Q8x8YqI=;
 b=onJatvAR5qTFSJBMo/heqIL44bjYRXu0Tir1O3nVCqWh+Gojp879fk5wZKbLNcSK9Taip+oaUH1H4RHYxr6cvC4jq9spuibKrmC/m6o2pI5wTWxSmmZ2m1nLSirNf0+pSC4xwXC9xR6mXO1FCtb1pr51kppuMJQY27pmjgpxKhp2/8J+cV4Kf9VFPNtGQaB0lqsqvP9XEuNW0d1CWVLpyyhetz7yrkQaeNQJO3CKqU7VVwRo0wL8XvBsKo0H+mCZEAGMxUwCvUQQeII+AOdIDkhDSmPIujygTk0qSpHZYnIK/PxOxKOXhLKk/e2FeDWSS9cKTEHwu/AMcSsntz3VDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HN12Af3aATEvO7LXScO8aQtnvFKkbK7D9oQ/Q8x8YqI=;
 b=JwAftXKccvhqXINyXGDWTUoupv+/4iIV5wZOTXogzpBeD3JtkzW9Vd9Uu4u10/N+oXTH0E3+g4N8LauNXm4os7b2j3fq3xvDw5vELy1swGPlCtWu9qEFFUl9qCpHPYNandwkA8mk1RbwPLG2XOt0BeImE2t0kfSq6SXl+l0Jmf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 23:42:05 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 23:42:05 +0000
Message-ID: <7b1765c8-9944-44db-9a0b-fddd102f156b@amd.com>
Date: Thu, 6 Feb 2025 17:41:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/23] x86/resctrl: Introduce the interface to display
 monitor mode
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <b298391d4db5806c145ba0b92d79e02a4df8d8c5.1737577229.git.babu.moger@amd.com>
 <6d215925-ee84-4b39-b002-9e3b66c015b0@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <6d215925-ee84-4b39-b002-9e3b66c015b0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR19CA0011.namprd19.prod.outlook.com
 (2603:10b6:610:4d::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4f4a3b-3e4b-4272-88ae-08dd4707dce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXBUOXhoaWJoaHkvWDJTQjBmcTdaODg2RmZxOGVXcWdGcmNwejRHTGdxTWdP?=
 =?utf-8?B?OXhHbnI1UThPa3dNaTFVeE9FTHpDNmZxR3N6endCakt2ZDJKZ0RnQjVQd2dL?=
 =?utf-8?B?UmhpaFV2dzN3VTRPRDBzNUFERkYxU2txK09hK3d5Z1NQaFhTY0VNNWtrMHpQ?=
 =?utf-8?B?MmVBTHljSFRoMzU2M2xVN2Nva2xWL0U4RVdldzhZMHlKYndBd1BJSTV6RWVU?=
 =?utf-8?B?TDFTOHhzczVvV1dvQ0lvY0VvRFdJTzZkbXJWMDRYQ2toVnFZZWVQV1VvSTFQ?=
 =?utf-8?B?cnVNNkY3SXNOR0Fac2M4UWVEd2hmOS9qaVR5TEZ0MG5GeGhqR2UyMmdxUGxo?=
 =?utf-8?B?NTNsT2t4bHdCVXNibHQxSUYzbHRNVjQ1eUxBM0daQWVCOEFkME94dmpXSzY5?=
 =?utf-8?B?N29ScVc0UTRtLzRxUkJLeStWZjM3c3JnVU9oSUtHd1dKOUZ3aVd3emVUMmRx?=
 =?utf-8?B?ZUFYSDhIeGNKNGFKZ1hWamlmM2tqTitBc1BUelVQZlgxZXpiSlRsOGhIOTVE?=
 =?utf-8?B?R3NhSFFrVkNaeTJ5RXZ4VjJ2di81b0J2MGVvRFBKS09PK0lSeHhBcTRFV25p?=
 =?utf-8?B?elkxMG92N3VPZFQ5NERWZTRYT0h0OGNIcG8zQmdDUEpqeGJ2c2I0cG85cm0z?=
 =?utf-8?B?bEJBcUpWMHBMSG1sc3hVT1ZxVEZoVE4yMGRZOHBDNnJkcTVhWXR2ODIxcS9Y?=
 =?utf-8?B?MjVCcmNyclJCUzhCNDVPcmhKNW1uTXVTN2pTdjJQTGk1ZStwS21lZjZ6Nm9R?=
 =?utf-8?B?ZjZkYU1RUUtaNXNQRVFiZEhkTXdiYkZ5UDUza1BoNFJCZTBzMWtlU1VZWm0r?=
 =?utf-8?B?dzF2ZUVjVGZlc2tGOGpVYWVocit5aEp6dHJ4STF3eG1hRUxvWnhvNnpMTWg3?=
 =?utf-8?B?S2c2Z3NDQ1ByU2RlZ0lJczk1NWNTb0RjWDJNdmdUQUh5alhCQW12NUVQY29J?=
 =?utf-8?B?Y29JZ3crVWt1eVFwVVZDN1VOV1BsaGRWdTZaT0V2WVR0SmxjakovQlZndVNt?=
 =?utf-8?B?ZElhWUxBTUVzZ0NYb3RqVURJa1NWK2wyVmRBY2RuN3g2dEQ2VGlzRDhGUTgv?=
 =?utf-8?B?OXdjRHU3VHVGUW14cWFYM0N5YnJqR2hsckRqN3hzSlpRYXM1b1Bld0lkZFVK?=
 =?utf-8?B?ZW1FemhQTGkvU1lCdDlZZEs4MWhtenNoMUVzSmw4UlExSjVMQjkxN3FtNEFh?=
 =?utf-8?B?R1phT0VoRldlYkZQYzVvZUJtVko3VVRYdE9ENFQ0QkJwWVNtcHpxbytOcUhX?=
 =?utf-8?B?NnhjN3dkb2p5T1JidnNmTHFOaU9tTlBjckkyKy92UFlkeUZ1UmxRNjNoc1RF?=
 =?utf-8?B?N1AwQlRrWkNCZ3ZWTUlMMzY5K2tXYnhscmdqZmIySkhMRFplRjRidHl4KytK?=
 =?utf-8?B?UTQxcVZVRFJuNWhGQWdwZmtuMGlwR3dKZjJWV0dCTnRnbDlUY2kwdFJ1SjZu?=
 =?utf-8?B?NWhjdHJ0U3V0T0R2RUExOUZGZnJ0MkdoaW1Hd0hyY3dNL3MyczFPVDAwRkd2?=
 =?utf-8?B?TnJEL3I0OURzUVAyMlFFakRWdHVzQ1RjSFVJbUFxZS9lYTRJV2Z1R3JQaWhq?=
 =?utf-8?B?cmc1YWh1T05OTFMyRUkzcXBBcmNMZHl5SWNEb0lZdkM4aWZRbnpvQmJPL1Z4?=
 =?utf-8?B?N3R4dTN4RUxRRTdsd29tUHJMc2YrVWwvOGZNTU1TTU9IUlErcHg2RGZJQjJn?=
 =?utf-8?B?YmlOVGxxbzhmVC9UYTFTcFRadzY2bkh3T2RnVUxnZHBLUGZybTZHYlcwSWVJ?=
 =?utf-8?B?NXBOclViZGZlUlEwRGpPd216VmtPdjBYNEE0Y3MvdktsVU4rZUx1N1B2bGtI?=
 =?utf-8?B?UmFlNWtBanJnUnBuanNBSk9FQ0UvdmNaWTVOZ3dmWGlDQnRLY3loR2ZqZG5W?=
 =?utf-8?Q?mSE2AvXFDVY62?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldnSENKWjVRUm1QWXppQlhmWUoyeWtNREY0WDlvN3d1ek9pM0krYXVNSUpV?=
 =?utf-8?B?ZnVOOEdiL21uWXhuMms0djBPVFN2YWhIdXhIbG5yUUY1UVB2azRLNUpZcThH?=
 =?utf-8?B?di9rWFZRQTMxWndIZGlPb2RnNkM5UHdZa2dkcTVkUTZMRjRTcnoycGJSdXNX?=
 =?utf-8?B?bDBBVXI3UG5seTRXdVBnNTZUWWF1aWhFc2tMMG5PSjBBQ1hCYmFUT3JWUDVQ?=
 =?utf-8?B?UWpPWEM4Q0xLOHFyOHcvU3JUbGNqaGtEc3c1K3VwR2lYQmQ4b2s4d25Hek1q?=
 =?utf-8?B?emh3dDEyejkwV3UvNU9odmRYaUF1UmVLMXpRMWQrS3BtNHI0Z3ZIaStxOW9S?=
 =?utf-8?B?RW1rRmVaM09jKzZIeXBxZ1RlMmZNL1Vkc2pza2JNZW9GL1pJT1NSZktGSUNi?=
 =?utf-8?B?dEl6aW8rc2tyVjUreThVNkpGUGw0ZmQ3a29aOEpVMkk3bFdJWnFhci9LQkt6?=
 =?utf-8?B?cVM1SmtzaHNsSDFJaEJ1VE9XSVdCcTdDVmNyTHg1TTE0U3VFVkJrNzc0VGdk?=
 =?utf-8?B?ZGlTTTYzVWdYbWJ3d3UxUU5zd29nUEFCYi9nQlF3Q2VGOUFDK2gwOHcxQzZC?=
 =?utf-8?B?dHd3UWVWS01QTCtxd1ZFUVhlMFBseENaME1HQVlSTDNxYjRDSzZnSHh6cDFW?=
 =?utf-8?B?ZXY4elZEZnJKaXd2Z0hyNVFCT1Z5SzJzcXhSaDZzRFJBay8wTzQvS3ZkUVFU?=
 =?utf-8?B?MW42eXF3ci9nZHZNMVBBeVRBemxPVzFGTlV5L09yUlJzTUR2a2JXanU3T2U5?=
 =?utf-8?B?N2ZKVDlOc21zSTE1WmJpN0YxQjJ6TUVhUGdHa0FxWTZDMWxSNWR5TWVXSUdH?=
 =?utf-8?B?MmRaZ3RTcVExOW5MNU9EUFBKWCt6TFduNGRtLzZRQ1pUVnpPTWY3VndTQXZD?=
 =?utf-8?B?OVMxODRiMnBhOVlTRUlETU1aaW1wTlYyc3V3aFhYMkQwbXY5UHY2RnJtdmhE?=
 =?utf-8?B?eFJhV05QelVTU2E5T3J1NkU0b2x6dTJ0cG0xQ044VEFibS9GajJhV0tyNDcv?=
 =?utf-8?B?V0VIRk5NMzFJNEo4alMzbzRIUHRuSVhNMm9LNWRHOUk5QlpuWERERDAySFJk?=
 =?utf-8?B?d2tTVUZCQStQQlBKRDRsT0krOXNIa2hsR2hlcHQyMVBtTXkzUVI5azhPL2ZY?=
 =?utf-8?B?bTRubmphLytXSGhuQ3ZCWjZrRzZNY3BObkRaV0RFZHlJamNJSkNMR0tUWWJl?=
 =?utf-8?B?cUtwOFZvU2pCNXUwZEI0UnZTcm9yUXUxc0ZIdUNyUlFmQ2hXMytkVU5PenBM?=
 =?utf-8?B?ZnV6MmFKV08xeUNHeUV1Y250K3BvbXl4UjhoTjE4aFl0RnYzNjRJSUNOUXVI?=
 =?utf-8?B?YVNKWlFJajVoU295WE1NVU01OTRwK3N2YThxL2VXU1hvUWh2ZmRvdlpjVFJB?=
 =?utf-8?B?MnFTQUpyRjZDSlZjNG9pT0hTTGwzaEpQc2NEM05CS2NMcVhJL1pqZCtPNUlR?=
 =?utf-8?B?UVRLUUJSN3psckRCa1hjRjJQejY4VEwxTnhqMksxYXNzVnBwTTRYU0hTdngy?=
 =?utf-8?B?c0RUTjgwdmVmekxnMHZGelM5RUtsTHpma2ZNUlN2VUFNRExEMzluK3J2dm5p?=
 =?utf-8?B?UEdRdmVSWXo5ejhiYlpQYytrQmtoMXBiMnEydWhGcUxSQ2pqczkrZmdyU1Yw?=
 =?utf-8?B?QmlaL1RhQmtPcnNxOEpCR2NtOSt2YWhpcHdDZXVQYW5MK2c3dCs0N0p0TlZz?=
 =?utf-8?B?cW1yalEwb2hMMkRETzhtTktFdXo0bmhURU1aeUtwMXY4a0VjY21MTUx2NnhK?=
 =?utf-8?B?UU1PMTJpNGdva3FZdDlvNG1TWDJZSmJ4TzIxY0J6MFo4Q2FnWlN2ZE5MTU5x?=
 =?utf-8?B?cy9veFZHS2ptaERTVktwbnVGejJCdUJLT1NQSjFGY0pyNmFOWHRZU0JUZHpm?=
 =?utf-8?B?Ym95cEkreXNqK2I5TUMwZ09WTVJjWVRSUStxV3ZaTE5kelJaUlhOTVRWZVcz?=
 =?utf-8?B?dWE3Slc2Z0VsNEJ6SW9XZVVxbFJkdko3OWJMM3JVMmkrUURBYk4zbFFGcXpx?=
 =?utf-8?B?OTBTTlk0aXVhK05ZK3JHWkJ3U3l3WU9WZFlFTWJ1REY1b2RjVzhvclZSOEUx?=
 =?utf-8?B?TUVDZURPVG9hcXJWdExkQjA5QmFVdzNJa2N2UitmVk5JWEpNdGdtSHlwTWtJ?=
 =?utf-8?Q?6xjiOtK3Lvwe5yHVPqSZocR/A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4f4a3b-3e4b-4272-88ae-08dd4707dce2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 23:42:05.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlJeJBHlRjH+HCQeSrAFIyXv5bMhAaW7THNzsdy4jwC3QJnZ1QCF6o95cBX0F3my
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492

Hi Reinette,

On 2/6/2025 12:01 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> Introduce the interface file "mbm_assign_mode" to list monitor modes
>> supported.
>>
>> The "mbm_cntr_assign" mode provides the option to assign a counter to
>> an RMID, event pair and monitor the bandwidth as long as it is assigned.
>>
>> On AMD systems "mbm_cntr_assign" is backed by the ABMC (Assignable
> 
> ""mbm_cntr_assign" is backed" -> ""mbm_cntr_assign" mode is backed"?

Sure.
> 
>> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
>>
>> The "default" mode is the existing monitoring mode that works without the
>> explicit counter assignment, instead relying on dynamic counter assignment
>> by hardware that may result in hardware not dedicating a counter resulting
>> in monitoring data reads returning "Unavailable".
>>
>> Provide an interface to display the monitor mode on the system.
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_cntr_assign]
>> default
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> 
>> ---
>>   Documentation/arch/x86/resctrl.rst     | 26 +++++++++++++++++++++
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 31 ++++++++++++++++++++++++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index fb90f08e564e..b5defc5bce0e 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -257,6 +257,32 @@ with the following files:
>>   	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>   	    0=0x30;1=0x30;3=0x15;4=0x15
>>   
>> +"mbm_assign_mode":
>> +	Reports the list of monitoring modes supported. The enclosed brackets
>> +	indicate which mode is enabled.
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +	  [mbm_cntr_assign]
>> +	  default
>> +
>> +	"mbm_cntr_assign":
>> +
>> +	In mbm_cntr_assign, monitoring event can only accumulate data while
> 
> "In mbm_cntr_assign, monitoring event" -> "In mbm_cntr_assign mode, a monitoring event"?

Sure.

> 
>> +	it is backed by a hardware counter. The user-space is able to specify
>> +	which of the events in CTRL_MON or MON groups should have a counter
>> +	assigned using the "mbm_assign_control" file. The number of counters
>> +	available is described in the "num_mbm_cntrs" file. Changing the mode
>> +	may cause all counters on a resource to reset.
>> +
>> +	"default":
>> +
>> +	In default mode, resctrl assumes there is a hardware counter for each
>> +	event within every CTRL_MON and MON group. On AMD platforms, it is
>> +	recommended to use mbm_cntr_assign mode if supported, because reading
>> +	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
> 
> Reinette
> 

Thanks
Babu
