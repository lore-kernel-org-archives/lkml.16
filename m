Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5286195980;
	Fri,  7 Feb 2025 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738954805; cv=fail; b=n3usgG8UiQebhEnmtLxxzwkv3nM58Fzov6s4W1CPH3moy9/z/QUljVsBuJfDJMNUcwj9YFxEHzrfA0VfAPwfIOPtELEsMV3hBEBoIuyJC0mrTUKgwwbd1X26LL9wR2BnbFwmlgD+Z7rXRr0veEGmI0TX2ISpg01qKSnvFpeey54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738954805; c=relaxed/simple;
	bh=TFZdAQJ6lNFcuSgB4uMAfRyDgGVsaP8zjundsl93yaI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mRW3bzJjvSuScjzGwAY4dHcHFXn/jCxQNLEcOEGRpkCglxrQ8WLwci1AClORJ4xHeW3CfgVi1Yn6wFkF7RCJbm3tX08Nu/0W7FWOHljCgX9yS1soDmrdS+QGj0ccxHVtfr/334torI85iMbLGSH3G2j8uwRGG8H9rg9IsBtMWlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tlzRUUYk; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tlzRUUYk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBafCykeVnpijmEv2wldRqZWlA4achRkTdoAR3OljpOl3LhCBCET70HKd75TsAKxnIsLxh2/HZxEufjqhnfc5Qn1s8Jm8XRzXrJg0I+ilOtJ2nw76GZk//z1sCEzQR48bdgf4Dx2tZzolmeCl/1WDMdFBegqNuzGtP+vr8dx1oK2HdJiKCRybOw+UtkAMkImUtuBwUDrdMuUB8/h6sUiVQ7vyMz0+4nLkfckPAnbN3GOS9jy1zYwbtamQNC0MVmJLr4ZpTPY58wIr/BvQ2CpgqW6CKJZZ8kI3ZrkhlPYkm9tEPCoPPnet2W1YGl/eO+hmGyTtFSmdGLBIEKOm3jSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Zx4UHd6ewZVPi67WrTod8ksPXAX56Fm31DcbxuqVRU=;
 b=ofM5c+JxCscVSHmIQkDu4azKFNeVJLwzSGLKVnTMJIYZRHtzWXbET+osfJEwDOetOC4x4dNWNDdhXy9i+pJJp8gVeDUJaXZ/DeSaNzzEYh5ghpDCTgRRQgLn6bZXP4Cx1OXEGyOc5GgKYz+WuUCoJY+WsCxCHYBf/lRc4Mv9zDa3hPkHWOULo2ahtY22q/4U8elctmn7gobb+vbeNG9nOhoMDmjzZaWD5mJ6Jz8hTrXXEiCWVeTdO4L05fDGmwclbxMIVb88FFeFH9zXvFzZv0gOO0DScUApXpsu1txfbDwZ6cNwbLc7RP8XPSigfSkzEc6mQ9nSBSdXtl8NO8YwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Zx4UHd6ewZVPi67WrTod8ksPXAX56Fm31DcbxuqVRU=;
 b=tlzRUUYkmFvgc7cGTXWknRcSBVoYzrTc6GZouzQsaI28Jlmeg2jRjsP8ZquDCWmEcZ08U1rsu9d3Q3aqhuA2sFNdG4FlwkqOpbs2zl++X60AUTh60DnwTXbReSxQKawN/dt/Bag5MHm6POXeHm+sYsM+o+t4+5yQdX5VZHn/D9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 18:59:59 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 18:59:59 +0000
Message-ID: <811b0f54-4c59-43fd-a551-3485b242e20d@amd.com>
Date: Fri, 7 Feb 2025 12:59:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/23] x86/resctrl: Introduce interface to display
 number of free counters
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
 <f60eced8c7b81267b0067b0c41a4ddbc263ded5b.1737577229.git.babu.moger@amd.com>
 <bc963e40-46cd-42a2-95f0-a2e1a35cbc25@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <bc963e40-46cd-42a2-95f0-a2e1a35cbc25@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0009.namprd18.prod.outlook.com
 (2603:10b6:806:f3::17) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 9990ffc4-b16f-4fc5-db5d-08dd47a99ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzgyRFU1eEg3dmZYcmVkSWUrL001OXB5MmUwcFZUQzJCVnE1RE1ZV21HR1U5?=
 =?utf-8?B?UTVna2Q3VjEzR2Ezdm1lOXp1TTlrUXZNSU5DRjBDQmpDeXF5cXAxUGJkMW1D?=
 =?utf-8?B?SEVUbDVlM3NYMURubkE0ZWNMUlZJVmpsMEJkV3BiRFg5ZzhVT2ZyU3NFSnBJ?=
 =?utf-8?B?VWhiZGJ0VkwvOExtdi81OTZhTVR3ejBrN2prRkxORVo2VnZUUzh2NTVHcThl?=
 =?utf-8?B?MkVuUVBDZko2bU1uS2NBbTNTS3NiRjhTbmpLYmhmQ05uekM3NkM2ZDlETnMw?=
 =?utf-8?B?am5Xcll2U01HanVDS05adWZvMXFqTTQ0ZG9mYkZTT3dNUVVQZUl3S25vV3g3?=
 =?utf-8?B?UEpybEJ4ZXNLZjZ6NFdXemZ4THBkaDBVTk9mcVhzbUExVUxjVWNxQjdwbmpp?=
 =?utf-8?B?Y2JzMStHcHc1d0prRU45bDBoT1J2QkVsajVtdFovWFlITmFXQ1JrVWhjRVhS?=
 =?utf-8?B?dUp1RjZPS2ZaQmUramJhZFJNSnJHMXN0WGYxWFY4RUlzVC9rMFJXK3pTb2Z3?=
 =?utf-8?B?SkJ6VlFGMmM4Q09NYnhzMnNJN1RoNXZwM2RaRHdobTFBcVF4TlJ4M1ZYMUR2?=
 =?utf-8?B?TE5yZUpMdlhOMEc5azVacm5uMGkwUzlPSXF4RWpoUUdDajV3aEZXVnZvZVpT?=
 =?utf-8?B?c0ozVVVoMHltOXYrWXVHZmNlb3pMTWFTKzZ0Zkt4MDVLaTlUelJ0MU1EQzdP?=
 =?utf-8?B?OC9LZHh2SGhTOHppK2l4SjVTa09GbHpacExrRGFadytlaEEyS0x3LzNDTGd1?=
 =?utf-8?B?SVBIRFJYeDgzR0RQZXhVYjhlZzgxSlIxMkk2OHJQRGxpTzhNcXprSlNmcm9F?=
 =?utf-8?B?N2FZcFFadW1PTGpweE5FTGhRdTBjdk8xVC94VmdEaTI5MC8raG5OTmk2cFgv?=
 =?utf-8?B?SG1MdmtvcE1oNW9rVGlHZis3VjJaVmg2UThydWoxNkNlOE8vNUFzTGc1ZGU2?=
 =?utf-8?B?OU5RVm9PQ3dqY1YvNkcyeTY2L1BodDBxc0g0SDBzUlM4VVZwU0lCVFFheFFZ?=
 =?utf-8?B?M09jRGt2WnFhVmEyZXFNanYwTlZhMlBEeEVwZHRXZUEyUmJCOVY3K3ZFZzVO?=
 =?utf-8?B?OGdLcUEySGxERGhRTllKbXVHdFk5Z2g3MXUwNVR0S3BUanhrWk9qSFQ0Vm9o?=
 =?utf-8?B?VGJJSTI3ajEvbkdUdHhLcEFmdjRWb0l5ZnVZU0xvTVFVSnN4dUI5ZEdzZ2Zr?=
 =?utf-8?B?TmMzcXVJVUpONG12N0V4bmNCeGFOWmVrcWozODhVVDdQWHIvNnIwVXRMK2wx?=
 =?utf-8?B?cis5L1RRSjFXOW9IRXBVcFNXWDNJRHV4K0dsNUhWRTlyNzhiL0lUSmRTWU81?=
 =?utf-8?B?eFRSd1k0NnB3eDNCQ2JtRy9GM2VDODVFbkRxa2huay9jRmtRQVlFYkVReno2?=
 =?utf-8?B?aUdOcUtGRnI1NlJRV2pkSEFUOTZnVnFRSHFpYkd1YmdWbVNGMzBGZnZJUGtq?=
 =?utf-8?B?RzY0b1N2VlovL3dVZ1dFSnM4bE9peUc3NWlMUWNiUlpYSTJ1OXlzTXVlSlBh?=
 =?utf-8?B?c05CTnlGUUhqSWRWRVdVN1F1Mk10YnN1akk0R3c4SEE5c0xhR1B5TEdMYmkz?=
 =?utf-8?B?Qlc1UjRhYVRvbkFIQ3kvMW9sbjhOU05YaGpNVzI1OFFJZjRyd0djN2pkalpp?=
 =?utf-8?B?eW9JMHJNR3V1Ym1MRkdEb09DNGtNN0hJZmNFbVF5WVpJc2xzaDZsTUUyWUNZ?=
 =?utf-8?B?WTZsb2ptSGc3KzV5SWFubGpBZnNjSllMRXducnhsdUZ6aTVTNmQ0R1p0RzJQ?=
 =?utf-8?B?VGhkR2dwNjIvdVgzUzVoa1g0TDdJbGhwVUVPam9TZ2l1WERVQ2FMSDlLQzZp?=
 =?utf-8?B?c1pSd2RTN2lwc3FyZk1vVTJ5Q1N1Y0EzbXBBWCswdEZsUSt2YThZb3BSWW5J?=
 =?utf-8?Q?5VkYIzGyl/ZjK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkE4Ry9sazVHRXY0b3c5cHN0R0VrTG5oZ09NRXpxR212WUJETUpwWGxlZ0FG?=
 =?utf-8?B?VjJ4ZUNXRm90VGJPNzE2QlphTU1Wa3pxanZkMEtGaXcwUWd6TVhoSXh3QkFZ?=
 =?utf-8?B?bFU5ekdQUysvNU00NWJ1eDdHZzJCMWprcWFZNlZHdWJOUDVjZ3dCdnRnb1pP?=
 =?utf-8?B?OXVHdTVNTVZ5QkpzM0F6amJ0YkVGN3pjZUhjK0tsQlBVUkloNnQxSmdSbW8y?=
 =?utf-8?B?WlJwSGpPQUNGL0dDSnhhVjBzVFFjSURwWXZuSFY1S1BEWjFVenQ3KzdlejJQ?=
 =?utf-8?B?a2Nic25pdnNkbTBObitGdWhraDNHVUJSTS9KTXdPaFVweFgvMlVLLzZxTlh4?=
 =?utf-8?B?bm8rWE5iZ0hSV1pmekZOdjFCN2xZc2JZMUFiQXV4MHdibVRSTFBtbnYrZWJS?=
 =?utf-8?B?TDdLMnEweTZ2R2pqc3FuWWNtaWhlVGp2ZWdWZjBoRjVQQ0s1Z01uUXRwbVVx?=
 =?utf-8?B?L2cwVlF0Z0JLUzkwR1VVVi9ZbnkwWXNYbDZuU25LU09lRTUyeWwwbTlILy95?=
 =?utf-8?B?MDVOdGoxMWd2UDI4b1AyZmxFOGhNbnlkRWdidFdZMDlZcHBtVUVQS3BHYWUy?=
 =?utf-8?B?NmxGZ1FxR3JySG9CWDBWTzhlTUhCS2JnQkRmYWswUnV0aXJTb05PaTUrSUwr?=
 =?utf-8?B?YUlyUmUwL2pYby8xS3FDUGJYQzNGYlBBeTBtRFJTbVRlZ2Nob2RpbVRZb0hm?=
 =?utf-8?B?VUtPRUxSMFY0RDRzZ3M3a0pOUmx3M2tPa2NuMmF5SC96MTZLRGRGM3NsUVJR?=
 =?utf-8?B?NG5UUlAyOXYrUWYvdlIraE01TVJwMXBaYlJBdy9OU3JRZjREMVhJMjBRUlBY?=
 =?utf-8?B?VW9ZTFNsaElubm90dmtSTW9CLzVweXcrbG1XTExDZUVOY3NNWi9GTlBsT0J2?=
 =?utf-8?B?bUVkZmZtREtiVUppQjJiYkUyTmlSS0kxU25uU1hBT0ptTW56QVYzQlIrOEt5?=
 =?utf-8?B?Y2ljVGdjK2NaYldXN0Q5TjB6dnRKT0hSQlMybHRqUkpDZHdqNnIxZ2FrYldx?=
 =?utf-8?B?R1VOZm1QcUJXNTJtS2VpMnhQOWpjcGtheTFlMkpiU1pGbkNXTFFSSUxGVzRR?=
 =?utf-8?B?dFI5WXY3aXZ2YzhXQ3R0VG8wSThqZ0NiUklOVCs1WC9Kckt3Yzk4eWcvZWFN?=
 =?utf-8?B?TzVUV3VmZHR6cG9OQW5HbDFFTHN0akZCcWlteVZnMFljbFVaV3BiNklid0p2?=
 =?utf-8?B?V1orME1DbDcyYWw2SWs3R1V2dUVxQ3lXeUN3ZzlVdEJUZk41V2JtWHlZZ2M1?=
 =?utf-8?B?ZzFJcGtYS2Z6UXhCS2pDbFR6R2kwd1pyY2Y5UnhuUHo3YStzL0FIS1doR2Nt?=
 =?utf-8?B?czgrbGkrOTlPV2lYUVFld2JsM1A5WU5zZE5lTXlWV0hUSUlIOS9RVGl5bnVt?=
 =?utf-8?B?UGU2eXNXQ2FudjE4ZnlDMS9La3l1QjdTUlppS1FnYUZiVUJXYThKMFE3VDQr?=
 =?utf-8?B?eWV1R2xrTkRDbjhheUtPaHlNMkNwaVZmQjNjZVZSakt1K1BmUUVPVHdTN1Fk?=
 =?utf-8?B?UTQwa0c2MmptQzRpZ3JaMHJsc1JlcnU1SUlzM2NCTC9XQ3I4c1RYVms1MUNa?=
 =?utf-8?B?WklWTUdYSzR4UWgvNEpFV0VWOTJuSmZ4eUtySEtmOHg4THVpckh5U1B4Zmw1?=
 =?utf-8?B?ZE5yMnl2SVVsa2pnckFpTVlucGhFcUEvNFl6RytJamgxN3V6MlN4K3kzZ1Bj?=
 =?utf-8?B?ZGl4eitpaWFQbUw0TUk2NEpQc21wZVQrNm9TbEZiSHVPRFAxcEJlL0RlKy9M?=
 =?utf-8?B?elRZVlVIS3NKRTF1ejhCcElXMmpNZHE1a240czJDbDJISy9ac1ZDckloWUwy?=
 =?utf-8?B?VlRtSU43b0FSclJucU9IVmRETHNpZ09QYzBuOUFuNEhUaHFMa0g5Y0NNRHdO?=
 =?utf-8?B?RVp0ZW9RWEdkZnlyTG0wYnN3TDB5VjZoeTN0emZhaHFvamp1UHlGOWtSdVhR?=
 =?utf-8?B?b0srdHFzeTkyQWh0Ly94eVZ0YWRnQkVEWXpvVUFpcVZwVDZRUStPZ0NRcENN?=
 =?utf-8?B?RVRsNUVSblg0VHJNZCtObFFoelVvQkhlWk5nd1dON05sbFZwbEx2TDhoUVVN?=
 =?utf-8?B?U1dmTDBSMy9HS2pWZG5zeW1SYnJCUjVOZTNpVVkrQkplMjVJNGtBSTUzMlhO?=
 =?utf-8?Q?jCSK74roWFeYILzZ/PwGYJzJL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9990ffc4-b16f-4fc5-db5d-08dd47a99ec7
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:59:59.6809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTaTWSMIJFtlIISApcO//j0Xk5mv2zbFNUm7swOtKF4Rri6qdsP/jgxj7PUJMzzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785

Hi Reinette,

On 2/5/2025 6:19 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> Provide the interface to display the number of monitoring counters
>> available for assignment in each domain when mbm_cntr_assign is enabled.
> 
> "when mbm_cntr_assign is enabled" -> "when mbm_cntr_assign mode is enabled"?

Sure.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> 
>> ---
>>   Documentation/arch/x86/resctrl.rst     |  8 +++++
>>   arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 46 ++++++++++++++++++++++++++
>>   3 files changed, 55 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 31ff764deeeb..99cae75559b0 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -299,6 +299,14 @@ with the following files:
>>   	memory bandwidth tracking to a single memory bandwidth event per
>>   	monitoring group.
>>   
>> +"available_mbm_cntrs":
>> +	The number of monitoring counters available for assignment in each
>> +	domain when mbm_cntr_assign mode is enabled on the system.
>> +	::
>> +
> 
> Documentation jumps in with some hardcoded values that may cause confusion.
> It looks to be missing something like (and looking back this also applies
> to "num_mbm_cntrs"):
> "For example, on a system with 30 available monitoring/(hardware?) counters in
> each of its L3 domains:"

Sure.

> 
> 
>> +	 # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>> +	 0=30;1=30
>> +
> 
> 
>>   "max_threshold_occupancy":
>>   		Read/write file provides the largest value (in
>>   		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 6fe9e610e9a0..f2bf5b13465d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1234,6 +1234,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>   			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>>   			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>>   			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
>> +			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
>>   		}
>>   	}
>>   
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 75a3b56996ca..2b86124c336b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -888,6 +888,46 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>> +					    struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +	struct rdt_mon_domain *dom;
>> +	bool sep = false;
>> +	u32 cntrs, i;
>> +	int ret = 0;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
> 
> Missing rdt_last_cmd_clear()?

Yes.

> 
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto unlock_cntrs_show;
>> +	}
>> +
>> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>> +		if (sep)
>> +			seq_puts(s, ";");
> 
> The one character prints can be simplified with a seq_putc().

Sure.
     seq_putc(s, ';');

> 
>> +
>> +		cntrs = 0;
>> +		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
>> +			if (!dom->cntr_cfg[i].rdtgrp)
>> +				cntrs++;
>> +		}
>> +
>> +		seq_printf(s, "%d=%d", dom->hdr.id, cntrs);
> 
> I expect cntrs to need %u?

Sure.

> 
>> +		sep = true;
>> +	}
>> +	seq_puts(s, "\n");
>> +
>> +unlock_cntrs_show:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret;
>> +}
>> +
>>   #ifdef CONFIG_PROC_CPU_RESCTRL
>>   
>>   /*
>> @@ -1916,6 +1956,12 @@ static struct rftype res_common_files[] = {
>>   		.kf_ops		= &rdtgroup_kf_single_ops,
>>   		.seq_show	= resctrl_num_mbm_cntrs_show,
>>   	},
>> +	{
>> +		.name		= "available_mbm_cntrs",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_available_mbm_cntrs_show,
>> +	},
>>   	{
>>   		.name		= "cpus",
>>   		.mode		= 0644,
> 
> Reinette
> 

Thanks
Babu
