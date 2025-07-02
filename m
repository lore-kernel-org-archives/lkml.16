Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7F610F2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443718; cv=fail; b=CVbr00bp4RvK4cJNd99TKZwxZaEhdq4y41CXG+4V5cpaPDAue4SmwKJXZMuNf1lanZ/Ue/83uhMOlOJ8dwTgg+QI8/G4Mi+qFvZcZAweYPVjs5AilHIiTf8CP6cNa6FO/Fz6T0cBaLPrtquan5kvVdd38+GWDIECqVGsPQKpf2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443718; c=relaxed/simple;
	bh=s+ViNfJfmTC3hHHCSV/BTxmYI4jIStwYSYX0aZY7XRs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LeIqXhUFUj10Yw1PHoEB6oVm+d38rCAFstaOGeaN+tdWVCwe0Bb8bRk+UeyacSXocMBeShN1541WJLvp+tVHilvnnE6K8QNxS2tZk+3j4zEgPhzrvlM1LSpk3wee+KEM1DJw2VXG4i/Hv7Iu11pszRAz2UOJtdF+6pJovU9S+9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xj8EFQMA; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xj8EFQMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXMvf2RwaZrA9S9HfcaU/zZ1ev20oUI1+sY+stkbZsIisfh43w1b47FNsxgyuRpyaIry2uWLhkVldCIPq6MUrpC1zVdUMqKX4C0lzps86TvXAgUtbNCU7EC0Yv3NCqogk86eeKuYMEyFNdMONaS16U+4fQ5OIwxVP47bZHVYCIJ1gXjQrvoGx99v3gyQIpwDT98F/cw/ESxm0s39Iz6gXL5fYQPDgJwlLj7FBpHXwdV4sdipEn4xLgr+PHKHigd3ybwhymiPVg1Gg2Tt7ss+K2aa4l0nz0DEXc1Ol43ALsodgWVcvDqfCUsUyP6ya6l9X/ja4+BYbFLzYUplp68TXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvifZ3JphbrhjNapjLbKY+G/GpxmyabR7NZbunUSbhs=;
 b=n2DA9oJU+C42ev5aekfkPJO3EjJeog0foCD76bj/cRjSO2QKHeR9C0aKAxzYWlzfxNxFDW1DfUZfEqD/40B63D+zE+kHsNE7L3PJ3a+JulNv77pBUZ6OtbkROg1shLFnp88zr0o7MQA+hlFvQPZ6dgQ8JO8eJbheNwv4rdQxV2ZwtoLrOuYiRg/8LSGa4LehsDGphRNUj72/rbOZt/qg4uoN1kZNuf4HeNZ+8QsRstjDMs/Sq1Zk6uhjR4PUeZvELNUaj9RvPmo4MbF+XI/EqgC5WuUTenSEIprCS2Bw+dJ+MYi4G9Htlofg60y8MKN8Rp7GtJfK3LLQ1NJI1V+nFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvifZ3JphbrhjNapjLbKY+G/GpxmyabR7NZbunUSbhs=;
 b=xj8EFQMAYaeuAJyASAodK2FFmZBjVy8sAHsjCFAPe+oS+iYJiptSA/Ew2yZU2cqoQCQTaIxcJRN3OHfCIdTxapZYdCGozSP1ZvYiC/rvRqIHODDwJ5fIaF54LNtxGlips3/zw3t1Rlm9MfklSSOd+nqQDoPapzoewyc3boAlk4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Wed, 2 Jul
 2025 08:08:33 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 08:08:32 +0000
Message-ID: <1ffe2e4d-88f2-4e2f-8888-8cb278f1cc28@amd.com>
Date: Wed, 2 Jul 2025 13:38:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250702064319.885-1-raghavendra.kt@amd.com>
 <8adf60ed-91ed-4469-86ae-59e8e30bc6ed@arm.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <8adf60ed-91ed-4469-86ae-59e8e30bc6ed@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::10) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: bb723172-e545-4cbc-0430-08ddb93fa30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDhyUGhKK1RRdThYOWlsSDdyUW9kak5HRVVQWmJqamlyeWdNSWxQdFk0V2V1?=
 =?utf-8?B?dVA2N0phV2dtSGtEcWJtMmZRNFN0M1F4ZHFGK01JTGtGa2U2dHd3cGUvOGtW?=
 =?utf-8?B?NGVLc0JrMDhuUGljcW42eUpKRkh1dHZlY2E5QzlVb2ZZaG9CcjBzQTN6TTMy?=
 =?utf-8?B?MGl2RllqcTBabGZhY1c2ZjM2UDJUY1FVK0hQQlpwTmRsR3Z4VnZDdUxHM1I2?=
 =?utf-8?B?V0Fhd0NKZzNHSWQ4aHREZGtvUmFDZUtiNk1qTXArNGNiaEJSWWlZNnJhU0Vi?=
 =?utf-8?B?K2ViUldQYzFRenZUcnFnZUF3VDhRNTd2YjEwc2tHeGIvVWIxYnRKaEI5OUVM?=
 =?utf-8?B?a0loUkZnNFlsTG94VXhpNFdoelN5c3dhQyt0VWY3ckxUREFUVzc4SGFkSUFx?=
 =?utf-8?B?S1NlRTNBc0E4ZXBJbDBsZUlvQ3pXbGRiWFp4UVYzdFZQOVhiQkZCUWsyWVFG?=
 =?utf-8?B?OGNOWVEzZFk2MUZ4L0FZdUVLRjFJWHNZSHlGQ1JCUjNmbVF4cWhvRGtoZGpP?=
 =?utf-8?B?TjZiUTVrdVVrSnFnNVQzVk1qZkdRVlZIcWtFTlBIU1RQaS9xRDhjc1JMeHhD?=
 =?utf-8?B?NkphUjd5ejBPR1h3U293VW83bzlORnBUNFU0K2RxOGpQZWhqTEZSRUdLQ2My?=
 =?utf-8?B?OG4wT3I3UzFrWFh5YTVrcnFTVHBjMjRudi9Wa015RzRYMDZSanRSa3VyL3hC?=
 =?utf-8?B?WVk3L2dZS1grQzJqa2ZyZmpYSnNYVW5iT3N1TTlLSFBMQjRkNFBCdlRGNUdE?=
 =?utf-8?B?L0I4N3RPV1ZkdGl6Y3U5VkhGSHFjNTViQmtyTUoyYlB3Y3l1VGNiMk5oR1dU?=
 =?utf-8?B?YVFkQnNsc1ZxSUIvYXpXdmptQ084VWQwZStYckxCTURoRVFiZVI2UXJENDVu?=
 =?utf-8?B?ZHlRSkhFTmZrSHFWa2lNaEpnbVgwRTU3Q3FuM0wveHpsbTUzbFptYUdvVmtM?=
 =?utf-8?B?RUJlSVl5akdQY3dGWHdIZ2U5YmxnckEzMEpDMlJDa1BpcGVrSWMySXJvU3Rn?=
 =?utf-8?B?Q0JPMDAwUGdWc0h3dW1MZkxFWGFaallMWGFWZVcvZG5sK2YvTWd2MjVLWkdz?=
 =?utf-8?B?RFR1QTVxVzVPUThndnFlTXNTUkQ0SFB5aW04N0JGRFZuSjFZQWQ3UkxjT0JR?=
 =?utf-8?B?U2dEUjRCdGFUbGwwRmZVdi9mcWdjNjFJOTB6aEJkUndqbkdNVFczTUVYaHAx?=
 =?utf-8?B?ZGdubFNOVHp2VHRrNnkrVWlndEttNmZpSHU4aWJWWVZUMHRYTEM3WGVzZExh?=
 =?utf-8?B?SHVPNis4Y1ptL3RMb0xwR0o0ZkY3RkhWMmk1S3UvaFNOK21qU2NyQnNpaUxF?=
 =?utf-8?B?bzNSb2FXZXU3aWdtN1I4cWhTODhqc1hpMDRyY0QvNXhiYWxwZU1nd0U2QnlY?=
 =?utf-8?B?T0MyVGt3eS82cUxQQ2dYSnhkN0U0bEVoR3gzWGdpaUNiVXprZ1NpT01oLzZJ?=
 =?utf-8?B?dS8xejJsdVg1ZmdDZE5BdEJXU0l4WTBNWXlCY2xnY29HUnFwY2tJY0F3NHh5?=
 =?utf-8?B?T3hsRjBaanZlRnZpdnYwdWtQOTFoaC93cENTNHh6S3FobzZjR2J2N3F2b29j?=
 =?utf-8?B?NU9KOWtObDNEV2xxY1FLY1pVSTJsTGFlR2JIZENQaW9MUTB2dUszN2taZXhi?=
 =?utf-8?B?VVFSSnMvOTVJWlZmZkM1V2QxSXVvUVMvTGkranA1cmF3VWVaUjhwK2k0WUJj?=
 =?utf-8?B?c2FVcHlZd2dMcFBncDRtd1ZmblVCdjR6OThNZTRtVWJjUXl4cnpjZzZ0Nysy?=
 =?utf-8?B?cTV6SDI0MEs3TkNqNWlWdFFiTVNjVnVOd1BnK1BGOVNWbkdhdnFSUkMweEMy?=
 =?utf-8?B?YStKbjBOWTYrUnlsMFhRK3lOWkZDaXhTNUU0Q0tFUVFaOW96SU9lSEQvSWxt?=
 =?utf-8?B?YTVFMEhQUGY3K05mSEVwTzBPa004SzhWSlJSazFib1dxQldldC9xUDNzdDYw?=
 =?utf-8?Q?7VcNWGGpU5A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUpla1JYbGlEZTIya1UwanZUajRiTk83Qk5pcExrS2l0S3NZMzFOQlNoUzVH?=
 =?utf-8?B?d0lzVEpHbnJ6T3BzRmdNY0QxZHRNT29sc2R6bnBQSnBGT1k5ZHRDMlpGcXFX?=
 =?utf-8?B?emsvd0UxMElLZ0NoaXdRMVZ2Z3hsS0FXSkdYbllOTC9GWWgxcG5USGJmVkR5?=
 =?utf-8?B?TDg2NWxpdy85STdxQkxOS0NsbXhXTnU3TkNORmo4Y08xa05teXpLa3dWQS9Q?=
 =?utf-8?B?c2hLOExGK09qTXFNa3laL29YVGlrNktOcU02VHpUQVhHYjdBS29hRDg0bVg2?=
 =?utf-8?B?Wld4Qlp5STdsSVVPUlZkMkh4RlI1Vit1TmhmTmFDaVk2UjUvY3U4bUV5YXJQ?=
 =?utf-8?B?b3ZVam9SUE12OEMvOEFsWEN2dllWeFZqd1J1dkFzN0owRUpqZkoyODdxVHpS?=
 =?utf-8?B?L1podDdtVkc5QTA1WTkzejRiTzMvTDVhZ0dsL0NLZ04rOW1hekh2TjlLVHZZ?=
 =?utf-8?B?VHl6a1NhSEorMjlGb3ZONHhDYlNpemNoUlpPa213RFBJYWdQUWVtSldCcnNY?=
 =?utf-8?B?ZjNKam9NeXBrVEp2cmRVQnlOcDJ2bTNOMGFUQjlxbVRSTzFQaHFaOVhZSXB1?=
 =?utf-8?B?SXkxeDI1Tmw0azJGK2x4RUpkdUdiWVk1aWg2TFkvZ0NUdFRkWU1WUU9PV0h5?=
 =?utf-8?B?NjFxU2d6WWtuNHRaZ0JTc0p1NWdodEpGdlkvN2l1L2V2VU1ONEwxcUExbS9p?=
 =?utf-8?B?ODNHSVp1bnJxeElVejI5dWljVGNwTXFjVVBMT1hWL1BKOGwra250OW1ONWZV?=
 =?utf-8?B?SnFId2N4R0ZzV3NvaDlzbU94RmxsSk9tbk1Ha3VoeEF1eS9aeHRtalJoaVlC?=
 =?utf-8?B?MFd3TGE1SEpWcjc1bk5pc3JyZFlseVg2QTRKYnBEUnZaeTJId1p3UjFwbS9I?=
 =?utf-8?B?YTN6Yzk2Y0lFVDIyVXg3ZVlIVkkvVCtTSTNBa3ovcDlwakRDK3ZONTNneDFj?=
 =?utf-8?B?K2hvZDhkSnFJc1VKeUNLemV3WDNvd0FraVorb3BPZENiZll5Ykg3cmFxMXRi?=
 =?utf-8?B?NS9YVUphYUVyL21EamwzMHYvQjFQWm1aeTRuVkdpTnlETURjRkhwcUFpaWRL?=
 =?utf-8?B?dVZMdTlqaDdjcGR3MW01eVl4aVJOdkJpcUFXTzh5WFBjV05IZzZCWVAxWXJv?=
 =?utf-8?B?RVhhRkF3a1k3RWYxeStXZ1VGNFZLcEhuTEE4YXNjTTZBR3lVd1B0NmdUK3FY?=
 =?utf-8?B?QWsyVVJWWjZ2ankwRGs2YmtpN0dScFd6d2hPcCtuVml4VGtjb3FJby9aWGtQ?=
 =?utf-8?B?M3hUSm5icWdrZytGNGRxaElXODA2K2RIZGI5OVlvRXljc0tvcW1qbjdWa1lI?=
 =?utf-8?B?a0RwSjY0RktEdzk1aUxuSWc4MUNWNjdhUzNoNVdrVnpXMDlmWEVyWlMzS2ZB?=
 =?utf-8?B?ZWRHa0VsMkM0TDQrOFluSTd1RDJGYlBwNWRiOSs4b08wOGFaTEdXQkJWMWRr?=
 =?utf-8?B?RnJZcWgzZk5GMzUrYkZIcnA5a1BzYjhmcUUwdWpWS2RieWNEcDlmZ005YXlh?=
 =?utf-8?B?SGljOTZkb0V1cjM1dVh1TTd5UUE0ZEU3cC91a25Kb01OSlVmN282dXFzTG9Y?=
 =?utf-8?B?NFppQkF1MTdPUHh2b0NyVkZEN3g5aHgxNmZRWC9QZHFodmFWN0c0UzR5ODhI?=
 =?utf-8?B?eTJJalJob3c3TjJPSGFaWFdTb0YwbExyaXVWdVA3SkQ5V0J0NFlFRDczSGxP?=
 =?utf-8?B?S1M4cDcra2lxTHVWc2daYStHdUpCcFhYOGFiOXBqcUk2bkRJY3EyZXJ4Z2xZ?=
 =?utf-8?B?Z2dGKzVWVnhxWHlNOVJndFBnSVMwMHNDcm41MTVnZ1Q1K1NzUFRnMkFIU0xq?=
 =?utf-8?B?YWNndWFPdlI4VTNtSmtnQnE2T0xNUHU2OGJIODY4cjVCcDNOczVJSHFydmY2?=
 =?utf-8?B?SWYyOGtXdjQvbW9hS091MjFFZmtwMWdyMzFOa3EwQ081REZqY0hzaUlMZUl0?=
 =?utf-8?B?M2V2Ky9OVWRlb1lVeWxFUkp0T29hQVJDclhRRC9rK2FCd3k3dkNYOTE2U2R5?=
 =?utf-8?B?M0tUeXNoNjNwNDBFMTFDcXczeWhHQ0U4YXd0d3ZqQ0VHc2xqQzlUTU50eE1R?=
 =?utf-8?B?amJEU1JiWG5nclNSTitqOXV2cVF0bGNQZWVkTlNRbWpsV25PY29WVXJCeHQx?=
 =?utf-8?Q?blyEgqUs+ckNuMgY6JJ9nAgIa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb723172-e545-4cbc-0430-08ddb93fa30a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:08:32.8714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjQ8YxRat8U2m5d9tfmZPsQPx9yb5R1uKMpPwKUWaeAay+3SF6kt/k77iLPF4V0LOWpMcfxge4wrWqqeCNNKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041



On 7/2/2025 12:18 PM, Dev Jain wrote:
> 
> On 02/07/25 12:13 pm, Raghavendra K T wrote:
>> The test align_shift_alloc_test is expected to fail.
>> Reporting the test as fail confuses to be a genuine failure.
>> Introduce widely used xfail sematics to address the issue.
>>
>> Note: a warn_alloc dump similar to below is still expected:
>>
>>   Call Trace:
>>    <TASK>
>>    dump_stack_lvl+0x64/0x80
>>    warn_alloc+0x137/0x1b0
>>    ? __get_vm_area_node+0x134/0x140
>>
>> Snippet of dmesg after change:
>>
>> Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>> Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
>> Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>>
>> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
>> ---
> 
> Thanks for doing this, been thinking about this for so long but
> I'm lazy : )

:)

> 
>>   lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
>>   1 file changed, 21 insertions(+), 15 deletions(-)
>>
>> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
>> index 1b0b59549aaf..649f352e2046 100644
>> --- a/lib/test_vmalloc.c
>> +++ b/lib/test_vmalloc.c
>> @@ -396,25 +396,27 @@ vm_map_ram_test(void)
>>   struct test_case_desc {
>>       const char *test_name;
>>       int (*test_func)(void);
>> +    bool xfail;
>>   };
>>   static struct test_case_desc test_case_array[] = {
>> -    { "fix_size_alloc_test", fix_size_alloc_test },
>> -    { "full_fit_alloc_test", full_fit_alloc_test },
>> -    { "long_busy_list_alloc_test", long_busy_list_alloc_test },
>> -    { "random_size_alloc_test", random_size_alloc_test },
>> -    { "fix_align_alloc_test", fix_align_alloc_test },
>> -    { "random_size_align_alloc_test", random_size_align_alloc_test },
>> -    { "align_shift_alloc_test", align_shift_alloc_test },
>> -    { "pcpu_alloc_test", pcpu_alloc_test },
>> -    { "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test },
>> -    { "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test },
>> -    { "vm_map_ram_test", vm_map_ram_test },
>> +    { "fix_size_alloc_test", fix_size_alloc_test, },
>> +    { "full_fit_alloc_test", full_fit_alloc_test, },
>> +    { "long_busy_list_alloc_test", long_busy_list_alloc_test, },
>> +    { "random_size_alloc_test", random_size_alloc_test, },
>> +    { "fix_align_alloc_test", fix_align_alloc_test, },
>> +    { "random_size_align_alloc_test", random_size_align_alloc_test, },
>> +    { "align_shift_alloc_test", align_shift_alloc_test, true },
>> +    { "pcpu_alloc_test", pcpu_alloc_test, },
>> +    { "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test, },
>> +    { "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test, },
>> +    { "vm_map_ram_test", vm_map_ram_test, },
>>       /* Add a new test case here. */
>>   };
> 
> Why this change?

Perhaps not entirely necessary except for align_shift_alloc_test line,
still updated the field since one more bool field added. But let me know
if you are okay with current state OR need a respin for that?

[...]
