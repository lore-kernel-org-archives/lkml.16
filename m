Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78126155C87
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748585364; cv=fail; b=BLeHVuWsYTeggQAFSXd41iywNB36c4/P4o/oH6Q8cSa12S8FGvoAdW5TmVtF5UInpwdFonQixgKY+KEJomK//tu98n/lHkNZQhJzxGk47Kf8qZkwA2T0xM8OVlUbOaxNohwpavXHh1enznT5I1VE4Em9efukc18Nt+LTwBRXFg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748585364; c=relaxed/simple;
	bh=9yzc0Q0n+UNU/O7iubKNfLHQob+Bg+HHqfj1nZljGGQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ugfJQwciMFSNesSiTyV4YFZwkIMZzwCzvAxp0rFLjnhxfeFE7n3VB2k1dK8Kp0ho+eTNjkVKNdyCcLc10dDewTIMBNtqRUTM3y2jHmYdhqGhQ27Gh4kt9NAbogjUK2PqmP1QG/BOe4qtov8klTbaT6ZK+4IDgcpBWPhuVoKwV7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jPhx2F3r; arc=fail smtp.client-ip=40.107.243.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jPhx2F3r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7KbR7VFaRMWnC3pAbGT4sfFZ/+t3KgE7FkiGme6qvSknanl9s6JO3TMgszsDYHSuuPJIVQMf/o5SETQKH+ZXRlr6oLHJlxhlkgFF5QuuKZkJ+KjE1hx7WQuKVD+H3Cg3ZBnvMSsy3Mr/bcKu8mbV1ePN+42bKMUmGU1aHXWm8AP7jJe5SmcFEqcfw61jHgyLMXseWHR/3y+5F6IzBzFvtljN/xh4asqbwkPO//Nh7ZbyoIcUUSyaClyAzHIpPgnJoHcC2xIxL1fGj1Qpb2hz1herS8qQGFHlev3OZfBjp46hgv9mJ6yDQows0fcHJoqD4n0jttFmz26wOzA6AYagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziDhKNc9/qmv1C4fRn4GYrdNzd0boh0Na4jo/m+GljI=;
 b=mkcWTWbhOrwFbR3SFMDgszDZRKboJSFQM2aUbR7YVdhaD7U7ztibIqsRu5xxGBwau2S/NhzYJat8AzygMGuj6BNRW9IJ6Xo3zNrkMJD14Gf9IWnHReRkHTX8matcapK9t4ofFFhBy5GSUVFzixKvPlWbcfnTEGFcbzAvHKt0Fi+XdvgSRZ5b1oq0Cn4IACK95ounAG5JiEosEG78AHTjbdTCd/7St4W+kXqBo+jdwXc4mvUNfUIqLo75GVWbFtTyHLHTTKpUvul9AU3R8x0w5kmilRoOR1pI3Bn9a5VG7/z3ue86/ts7TtqhJIJ8J77oaJGD7heeYJuSQjteoW9+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziDhKNc9/qmv1C4fRn4GYrdNzd0boh0Na4jo/m+GljI=;
 b=jPhx2F3rK8fedbSxjqpBHQ1aAK4fXD3aa4g0wcoElGWd/w3FfxckYhjFXSlpIvWe/84Deu6ux5R8TYqNAoBZ/DvrNbex1UVW1ThYr7yhp/WrBDl6SllCgPPhR9KpUnVnClo5BTHzdotm8Q/6apW5uk3cvzVYFLOr0DQUg6UAqJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by BN7PPFCEE68E7BF.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 30 May
 2025 06:09:20 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8769.022; Fri, 30 May 2025
 06:09:20 +0000
Message-ID: <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
Date: Fri, 30 May 2025 11:39:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: Jianyong Wu <jianyong.wu@outlook.com>, Jianyong Wu <wujianyong@hygon.cn>,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::8) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|BN7PPFCEE68E7BF:EE_
X-MS-Office365-Filtering-Correlation-Id: be05b1b4-26a9-4bb0-eaf3-08dd9f4083e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1VxY1VUNmU4ZFZ2Nkh4U1Rma1pzczhZRm5iM0U3TlhXek4rU3dwSnk0Wjdi?=
 =?utf-8?B?NU1XYUpwTUJ5L3ZJZitHNzRxeFArNWxUSEx2Tk9oN3VmeGdzam52SURUT3ZC?=
 =?utf-8?B?TTB3QzV5L2tocHF6SzY5Z25HeXdxWVFDWXJUSW4ybHBOd0M0RnZNUGpUVlh4?=
 =?utf-8?B?VXlvUmw5eFp6UFhTWnM4U1FvSmxXSWg1TExvSzE0djZkSUV5cUVYTDBqZ2dt?=
 =?utf-8?B?VFo4dlVURURpSlR2NGh6U3dCRWh4WkwzZWVFSThoSjE0SFZTZXVIbmRtQTMv?=
 =?utf-8?B?ZjFTaGFBVWFyRktEMmRhWWV2WFZ6MktUdmRWUHpZUlpIRTAwT3BTU0lOSmxn?=
 =?utf-8?B?YURsVlRBTk8xTVpPRVVxUGpwUmhIaWQyNC9menNRQ3ZUY1pMV2FZMDVyTnAx?=
 =?utf-8?B?RTZIelpPUUxOSzZjQ0pta3F6RjdtWHJHM3N2b0xaTmRTYXpJUXlhcjVTcm1N?=
 =?utf-8?B?Ly9xc2h4a2w2NXNQZjJ4VkpxL2ZvaFIrWWU2VG94bjZ5U3ZtWm5mekpjN0xw?=
 =?utf-8?B?Yy8xajh2SmxuSjBkZXpuell6V2dmNzFscVl2YXQ3ZWtrRm5hYXlhQ2owZTFm?=
 =?utf-8?B?ay84dUx6dFhRU3NVdnlDNHVORTlwYUowcGtQZC90eHNQWjBoeFVzWUUyaFVU?=
 =?utf-8?B?UTgrZ1c2M2twK3daVi9wRU5HLzVwYjhpUFNmeCtOVk5UTitaejBLSHNoVVdI?=
 =?utf-8?B?bnpaOTNEYjVhUHpHQlFMbldRZjdCRVFRMWMxTkJvSFZ2RnhkYmJySjlZdXBy?=
 =?utf-8?B?WTNJUE4zdCtZZVZVUlJaYmlXSDU0RkxlTzFqVVNYSXJtcnRvdFBNcmR6elhp?=
 =?utf-8?B?czRTMkFLQVpMdjVLM2pieWMydmNlMCswMU9kQTJCNkdzRlJjVm5GSy9qV3dt?=
 =?utf-8?B?UG1oVFJDT1ZzbkNZK3Z0aitZbjVpcG43MnM1eGo2UFc0eDZta1U2QnVacGl5?=
 =?utf-8?B?eHlDWGgzNFRtTlJlSnlQdEZ5NmdJOUsycnJUNHB6eXhwbG9GSVNINnhEVUVM?=
 =?utf-8?B?c0dLa0FON2dhWGZVYlczNE4wRnFiWjI0NXdYdkYrN2g5cmVSTDB3QVI1MjdF?=
 =?utf-8?B?alZhbGhIdEJNTitySVJKV0xPRTR2QVRMajY5OGsvNUtCdFJ6blFjVGVzSjUz?=
 =?utf-8?B?RHNybHQ3WHE4aHBhT1NtOUpOd1NramUraVVMVi9LQzJubXpSbG42ZWpXMU5K?=
 =?utf-8?B?QllSU1hlakkwTm1VZHRRdC9MQXg1c0tyK2NyYU5xc3pZcExWV0MxL3FZR2tq?=
 =?utf-8?B?RHBCQjVmVnJlZXNGNGxzVEh0cUxxa2JFcVJ1RDhESG5ySS9FR0FMblhYWjZi?=
 =?utf-8?B?cHBZOXNmYnZ1dzRPaTNnQ3F5ZHhTSzArZW5qQWI1NVllYUhGcHZvbTEvekFz?=
 =?utf-8?B?WjlBTEhnWjg5VUF2WE9QN2dpSkg0Tnd0OWNBOXB6RXZFQW8wODhwSGVCZXR2?=
 =?utf-8?B?NGRzbDIrRnZDckk1ZVNBQ3M5NXNENkRaOTdaUWYyTzcxOENnc2RyZ2l5U2Zv?=
 =?utf-8?B?aDg5ZTRyMC83eW1XKzRlNERXN1lEeDhhdnJQSjZWMFozSzU3NHhLZU9MSk9V?=
 =?utf-8?B?T3M2TVpXUU56eGJhalF4MENpTGNWb1RIRlJ5RlNSZ09PL1I0YSs0TDZVU0dp?=
 =?utf-8?B?RDc5UUJ2VDFBd2llUVp3MW45SkIxSUg5M3RSanJnR3pkTE1rcE1aMk81NGl5?=
 =?utf-8?B?MFdPMVZEbE1FT245YUk1ZFJFYjF5VFpWWG5EK1dETkQzSlBzWHI4U0I3Q2w2?=
 =?utf-8?B?TGtVNEcxZVEzT2tQdStYTVVBdHBZY3R4Z0lIc0NkYVUwV2V2czBOdVF6U0ZQ?=
 =?utf-8?B?cWxUbGlwbWdQa0dCZkJhMDNLTW8wd2pmUXFJeVNrclFGK1g3UllIdXkra0Zx?=
 =?utf-8?B?RUN3ZWpaQlIvMWNQZ0RqTitXTTNIZ2NjenRDWlIzSnFNWUZnMFdFbHNWaTB1?=
 =?utf-8?Q?wWPunpU5AAU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGtWNSt6SHRrUjBPRVZkU0NoQ3lxb0x6UGk0cU0zK09kTTJ6Z0Z3dy9pN1hw?=
 =?utf-8?B?eGNJckVYdzBkeWdiZGk4akppbGRYVTRUcnF3TmFBbHhTT2hwa213UEhLT1lB?=
 =?utf-8?B?SVJGNm9HNjlGTDlJSjBPK0pxa2YxZnNDUWFVL3NaQnBXZnhpMnJsb3JnT3hO?=
 =?utf-8?B?L2VIaDJjOUo2TGJlSUthVHFVb2RlYUUwMzVqbHZUNGhNZzYxYlphakhCcGJK?=
 =?utf-8?B?VklFMjZQdHI0M0ZsbHJIYStHZjdycGtJbnJOS1ZHWGp1WFdsVDdlZ2FiMnhy?=
 =?utf-8?B?cmw1ZU9QSHE2QWtRekN0QzlZTy9RWHNKWEFpSXZ5aXh6UDEwWWNIOXpWSkJa?=
 =?utf-8?B?dVBsRG1zZml2eElFUDAyZTFDWXNCMVZxbVdycmpEOU5nYUxEd0xsMlNycnF1?=
 =?utf-8?B?MlQxTWlITmZyTWNJWml2YjJmVFNraWFQa2dIMWxOTVdqaVZiUVZhdDdma1N3?=
 =?utf-8?B?SXhhSmJPZDZTem9ERFYrKzYxVm9CSHFzOFU3cFpzYlB5aDV1NHFxZjl5SVYv?=
 =?utf-8?B?WnRyY3ljeTh1cVIvVkRKanZLL002TytzckFOc1Y5TVFSTllQNnNyYk9YTkIz?=
 =?utf-8?B?QjFjdTVrU0N1ZlpHclF1Mk5FYjM1NnlFbmxWbW5GRFlUQWZTMTgzVXVhMDRP?=
 =?utf-8?B?VTdlUjV5WVAxT3FOUnpRRUhmcTdBUVRhUXNOQjBCYzlUeWU3QzkzdDBGdWxR?=
 =?utf-8?B?cVZXZWF4cGhtRGV5Vk9tVWV2RkUyZ0RNVDdqRnhud0hTZW93UFo0SzczMnpk?=
 =?utf-8?B?T3RFWHNoSXBkcmxNSFQxNWl0WmRBYTJJb3dHYjYyRFJxMW9xa1lWNVNUNFlo?=
 =?utf-8?B?aUFqUG1xVTJDaE9RUThFbmRhc3RKT0hEVUdheENRdjFCdk1Ya2FxWW9LMlhQ?=
 =?utf-8?B?QlQrYnBvR045WndBSWpaQzJhS3NlRXFLWG1TblJzZVpUWUJJS3VWcFR3Q1pF?=
 =?utf-8?B?dzgrWVF0Si9sTkJPNHBGS1FZQzliaWg3NVl4OUwwaWxMeWZwVEJFUEptODlu?=
 =?utf-8?B?Z1dHVXpPTk5xRU1tNHBKSUVxU0c5bXoxSERVTjZJdkFvWWZFV3d5WjFqREF6?=
 =?utf-8?B?YUdzY2pLZGkxQ3kzNzh0YTNEQ1F3WTF2WE5ySXo4QUw3TEkxc0Qyd3RRWlZJ?=
 =?utf-8?B?eFRBb1BXN0hXRUhhOEJ0ZldNTi9IN1E0aHN3RTNMdzVoZnRTWDdoc0lvQU1p?=
 =?utf-8?B?OFU5ekg0a280M2dmRnoyU3dMelhXOUNvNlA5NktibSsvZEx0TnFQVWlSZllZ?=
 =?utf-8?B?ZCtkMXVSMnB4T0RhRjRpNGI2SnBxMUlITEdhVm9iVWJPWC9xSzRQVGxwZlZi?=
 =?utf-8?B?Y3hORXpnWWpRNFBjVzJlYzBreFZSZFRTQVdhNkJiWGhvb1FUblJVclM1TUVt?=
 =?utf-8?B?ZTArY0JxUjF5NEVIaHZVL2lxdTVOTWZxNE12eDcvQU9CV3lQTjgxRU04M3pY?=
 =?utf-8?B?OWdXRks5Q2JkMU5WTGp5VmxyTlZFM2FKV2x3QTNzS0o0STdQSjdVQmhlbXky?=
 =?utf-8?B?ajRra1k4Yk9xWDhrUk4vTnp4blM2akRkbnMwMzA1TERabGdQZ2hDbC9YOWhH?=
 =?utf-8?B?SHU5NERvWVhZeVdWY25vMzlIYmNPOFN1bnFGSnB2d0h4WVlhNlZ3R1kxVUtG?=
 =?utf-8?B?WGVKdEg0SXd3SjlqWWpHSmlCeUZFK0FFSHJpSUs3WVd1dWVoVXZIWlhFZm1y?=
 =?utf-8?B?dVpiNnZiQmRwalhtWVI4QWdFUWpuRlNNS1pNTkg2TzJIRkVJN2tvS25IRmd1?=
 =?utf-8?B?bDkyN09Fd3JuL3cvemNqcnFkTStxSnk0ZXNDMnM2RnIxN2hBUTBTMThNVzQ1?=
 =?utf-8?B?ZjZtNEJ5bjc0bmFWNmgvVDZDUXZ1OTdPUVBGRGplK21wS01SRzRSUmVxVjNj?=
 =?utf-8?B?MmFsTHZBTmtuOHAvclNYemdTeTZKMExNUkVBNjUxNy9vUjdHM2MzRVZUMFds?=
 =?utf-8?B?ZXc1c2gyZnRwdnhXV1ZkY2FTTG5VeDJoYUVPMkZVYmFadFFTbDNwV2lodmJF?=
 =?utf-8?B?L1BQbzBKdzAza1FPczlrK2VydHdxODNha2l1RHdPZjBVTjdOL1o4YXBxUi9q?=
 =?utf-8?B?cGNTcjVUdFpLVFVlemNHNzh2blZwdWU0N0dqcXNjNUpSczRVNCtkSGZXZ2pa?=
 =?utf-8?Q?aM6/ovmzclEoLJfdWUh7Nb9S7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be05b1b4-26a9-4bb0-eaf3-08dd9f4083e9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:09:20.0345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIuue1iZJ+qp24t9K4Jk8urrdkf36ZfS/dbUYqQui41zx7jUIR2OCZPfSTWEyPkOtgZbv5Nb7QJJWy5YU1XEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCEE68E7BF

Hello Jianyong,

On 5/29/2025 4:02 PM, Jianyong Wu wrote:
> 
> This will happen even when 2 task are located in a cpuset of 16 cpus that shares an LLC. I don't think that it's overloaded for this case.

But if they are located on 2 different CPUs, sched_balance_find_src_rq()
should not return any CPU right? Probably just a timing thing with some
system noise that causes the CPU running the server / client to be
temporarily overloaded.

> 
>   I've only seen
>> this happen when a noise like kworker comes in. What exactly is
>> causing these migrations in your case and is it actually that bad
>> for iperf?
> 
> I think it's the nohz idle balance that pulls these 2 iperf apart. But the root cause is that load balance doesn't permit even a slight imbalance among LLCs.
> 
> Exactly. It's easy to reproduce in those multi-LLCs NUMA system like some AMD servers.
> 
>>
>>>
>>> Our solution: Permit controlled load imbalance between LLCs on the same
>>> NUMA node, prioritizing communication affinity over strict balance.
>>>
>>> Impact: In a virtual machine with one socket, multiple NUMA nodes (each
>>> with 4 LLCs), unpatched systems suffered 3,000+ LLC migrations in 200
>>> seconds as tasks cycled through all four LLCs. With the patch, migrations
>>> stabilize at ≤10 instances, largely suppressing the NUMA-local LLC
>>> thrashing.
>>
>> Is there any improvement in iperf numbers with these changes?
>>
> I observe a bit of improvement with this patch in my test.

I'll also give this series a spin on my end to see if it helps.

> 
>>>
>>> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
>>> ---
>>>   kernel/sched/fair.c | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 0fb9bf995a47..749210e6316b 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -11203,6 +11203,22 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>>>           }
>>>   #endif
>>> +        /* Allow imbalance between LLCs within a single NUMA node */
>>> +        if (env->sd->child && env->sd->child->flags & SD_SHARE_LLC && env->sd->parent
>>> +                && env->sd->parent->flags & SD_NUMA) {
>>
>> This does not imply multiple LLC in package. SD_SHARE_LLC is
>> SDF_SHARED_CHILD and will be set from SMT domain onwards. This condition
>> will be true on Intel with SNC enabled despite not having multiple LLC
>> and llc_nr will be number of cores there.
>>
>> Perhaps multiple LLCs can be detected using:
>>
>>      !((sd->child->flags ^ sd->flags) & SD_SHARE_LLC)

This should have been just

     (sd->child->flags ^ sd->flags) & SD_SHARE_LLC

to find the LLC boundary. Not sure why I prefixed that "!". You also
have to ensure sd itself is not a NUMA domain which is possible with L3
as NUMA option EPYC platforms and Intel with SNC.

> 
> Great! Thanks!>
>>> +            int child_weight = env->sd->child->span_weight;
>>> +            int llc_nr = env->sd->span_weight / child_weight;
>>> +            int imb_nr, min;
>>> +
>>> +            if (llc_nr > 1) {
>>> +                /* Let the imbalance not be greater than half of child_weight */
>>> +                min = child_weight >= 4 ? 2 : 1;
>>> +                imb_nr = max_t(int, min, child_weight >> 2);
>>
>> Isn't this just max_t(int, child_weight >> 2, 1)?
> 
> I expect that imb_nr can be 2 when child_weight is 4, as I observe that the cpu number of LLC starts from 4 in the multi-LLCs NUMA system.
> However, this may cause the LLCs a bit overload. I'm not sure if it's a good idea.

My bad. I interpreted ">> 2" as "/ 2" here. Couple of brain stopped
working moments.

-- 
Thanks and Regards,
Prateek

