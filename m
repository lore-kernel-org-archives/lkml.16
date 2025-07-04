Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95A2F2C6E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620165; cv=fail; b=T0g4flFTudWyn6yuSRMsrayJKJkFta/V+gakGY6chX5dL2niZolbi0fkkuz02wTYY9Eub8/v1UZjcBcdnCdaPkJWTq4HOJYlRu8uP/NvBN5TP136z1mVESqdOo1xVzwmNXSxSztIfmcLeE6A/DbeosFqJqb3GtAHPTpEPOYcl74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620165; c=relaxed/simple;
	bh=9895AwmXhJj+rzpuw/RiDfqIHwXa/ksOKajT1UmmBas=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Txeg+R8UtugbSoqxI0mvd3NkudErGAJ4AS4de6eYJm5o/BFCO30gNukYSDYASkTMWlwtVHM7GSxc0DmSHjYCL15b0HyR1VGkQKL9Mw/sc0V4J+MEzEKdqIxSZTMfowMAS9y3hoS2tXV1WO+A78pra4Fslt3Uc+XcAcyN4GPaWt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z6DM60XB; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z6DM60XB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+MNZT4VTyvgM1nngwst9E4TTzKLHQQ6VcmHm87fkWVIqRcfRIxzVJvsbFMlPuub3S2AD0vkY2XKelM2xHtiq90tD0JMiHhC3jUEiX0SBsAmFfIYqF2fyy5/C/m19kPjlA0eIRCdE5S9CfhgoIRnzwP++0c+6aTz+C3A/TrhR5+9hup/w01HwH5ImUkmpCiDIM+sEjxPeyHo1NNxnT+N944XYbXumrf9OCF8N9Qs4DlegtBqAEPI+xybRuuuslivCmn3FkotifWToEkXXE/jXpbb+afKU0FkXJPTNQ7Q5fzYlpwJJhaT0oWtD6bqh/9Mxmrhe5Jxaw0i9cYPqNSWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMaw2YaK2D7XJIXp6y44hOCA1CNmtK54TOieDJ0Z/Bs=;
 b=DlHsoYQ+aBsfaNnuAPe5tHyb5e/4pYTPr4YEwtxbKDrDakVagUWfbV6ZJ6k6+fse7RieezZr0DlrxN2gMVeueWQGF757+rvsvcO84F8jpEV6p17n3eLUKjMZx/glgYDPlTkCNeuaEol0a6B7aQBV/0M4h7H0T5tNIC87a9D7L4f7JBhs/WkuyFl/e5FbXMhjOHJWwUtv0yCALaZGXC2/T2/QF2dY2CVMPp+C1UMINU9Ou13jLVvo6IaFaQVE84dQwiZ7jot4Pnj7mItVItsdVRWiqx+hiAUuJM4ff77MYoS40h309aH4otE2cpWhCpYjJWAL/L3BJ2tZPunReBzV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMaw2YaK2D7XJIXp6y44hOCA1CNmtK54TOieDJ0Z/Bs=;
 b=z6DM60XB7T32c12JUzGPD7lbaRy/KWI3UzZa8GOqvPwM1v25bK5KIgMwcmSiC5VX1KG3lxil9f8FwC8MctJcBS3EovQuxOtlDiX/vE+ymed4NKU+2japGefaI5GWNxqYc991Z0gXTVFwymJTso62P16g3E0cYEC7bO6EeZnCpk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:09:18 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 09:09:18 +0000
Message-ID: <f2dcafff-1be7-461f-baab-020f8a06b351@amd.com>
Date: Fri, 4 Jul 2025 14:39:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
To: urezki@gmail.com
Cc: akpm@linux-foundation.org, urezki@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Dev Jain <dev.jain@arm.com>
References: <20250702064319.885-1-raghavendra.kt@amd.com>
 <8adf60ed-91ed-4469-86ae-59e8e30bc6ed@arm.com>
 <1ffe2e4d-88f2-4e2f-8888-8cb278f1cc28@amd.com>
 <980a1569-cdae-4343-bd94-4fb2ea6e247b@arm.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <980a1569-cdae-4343-bd94-4fb2ea6e247b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::9) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5f8aac-cd06-4bbc-efe0-08ddbada7477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTNYaXg4UWlIUlR2N1BmWHd1elV4cmViOVNhd3JTZThac2JBWDBsSnRWOGdS?=
 =?utf-8?B?bVBXVDYvUVFQQWdMd1JiVUVzM056QmhUeFZaSVJ5MDhkYlEvZUFhSTR6RVpj?=
 =?utf-8?B?UHdkaWRuOFNRT0VUYnNiWHkwYnZXTUE1c3cxdmY4SmhZcUpyNklsZWU5NWZQ?=
 =?utf-8?B?dTFxOGxwT1FFaUxQUzYyeitWWnQ0THhubDk5T0VjaTkrTVZOK2RmbjNVam85?=
 =?utf-8?B?VW9Ld2lDcUhMTFhENTNlaTRXSEdUZ0NhcERwODY3Zk1IMk1qRDZZK1hkNFZ3?=
 =?utf-8?B?cVVlbGpzMGtNdktaVC9qaGFBWEZRU0ErM1B2WThVUlJ3VTV0TkFpTm5xcXN3?=
 =?utf-8?B?N05FajI2QTFDbVk5OXBDc0hpblBUTUVRMEVkdldLYTh2ZlpFOXo3Q3JpYlE3?=
 =?utf-8?B?Q3FmVmZLeUlYemQ5Um9zT1k4eXY4V2c3M0pReHFIak42NFNUVEppTWhob25p?=
 =?utf-8?B?QmNRaFNJSmo0OU9jZFByOUE0TWc3VVFnditLZE01OWdlamlLRU5iSFc5dzhJ?=
 =?utf-8?B?REdWZ0txRFhJMnBLUTlBQUJjN013VDYxRHBpeDkyVUNMWms2eGpOZWRuWXVB?=
 =?utf-8?B?V1EyVC85R0dnMHowZDIyZnJIOG9tSlpUMTUwbDhOWHZvTVdSNVRJVDZkM0Mw?=
 =?utf-8?B?QkNvOFNjVHRiSjFKSjNwMGRobVBWdFdZL3Y4bDE3S1ptTlBURDU0Q1d6WlZh?=
 =?utf-8?B?RmM5bi9RVkIxSkMwSHhzQzhzVmp0NWErT1RsTy94dU1DK25XbUYrckJsUTZh?=
 =?utf-8?B?VitjdDVPMEw3QVlwUlRhMWtydWZaUURKRUhvUFl5VUhmZ21idyt6ZlI1Ymgz?=
 =?utf-8?B?c0o5RXQwc0xRbHVKVXMzN3FIZ2g0TGRuV0VyZ2Z4RmhwUXFRQWxjK1RUU1Np?=
 =?utf-8?B?UVdYNVRiNDllR0UrNmFPeUtLTXc0Qk01R0tvTFRVVHJBcmNNS0loTW04eWVU?=
 =?utf-8?B?VnpCVmpuS1B5RHZzZzZ2WGRac1JMUGZNeGZLZmNBTlVKV0Q4VTIvd2VQYkgy?=
 =?utf-8?B?NXZnSHdaY2lVOHArdlhrRitINzVXb2FRTml2Q3JLMWVKSUZydW5ReGZidFR1?=
 =?utf-8?B?T3lrUzY0TFo0WEx4VjNEWmlkM1FWWTNXQlFiMlJtVjVOYW83SjZGcU4ybTc5?=
 =?utf-8?B?Umw1aHo4bGxJa2FXM3FqK2xEb0xNMWppZWhFRExmMUJnLzB1c2JtRjVBVmpY?=
 =?utf-8?B?L2hVVUhjb2VQeGFyd0VpdFc0NTNHNlFnaitCcUQ2ZHFBbEkwK2NMeG5FV21n?=
 =?utf-8?B?MkZsUmNBb1Jwa3F1dUpWRmtBNDFZL1BGeFRmaXdqaWFzM3VTRE9LRStzcTFV?=
 =?utf-8?B?cmxTbG1rMWh5b0svR2djelZIbitVbkVxbW5FYlQ5TGVZdTBnRjZEOURpbVhj?=
 =?utf-8?B?RFduaTZOcVNQTkttUE16bHNGdjVPNFdGRUtFaWVndUdWTnpWQzhGdmk0cXVs?=
 =?utf-8?B?SGNWemNnSG5WNGV1eHgyOHh0ME0vVGMwL1lsQWk3d011eVlzNXV3Zlc1QWZh?=
 =?utf-8?B?dnFoSytyVWVqUWFTcFp5dkdaVXRTRVhvT09sc29BUldGYjNWOE5qemxKN0p2?=
 =?utf-8?B?Sno3LzVRN2U3T0FCMUtmalE2ZE94OWpYa1VKU2hrMGQ2K3lUd0dmeUd0TTAx?=
 =?utf-8?B?MlJVdy93b3NPQm81NGU5Nkp1cDVhd0JMdHB4TENBdmc5djZhTDV3MEpRQmlu?=
 =?utf-8?B?RnhMZVIwWnArUldBZ0h0U1lGT2hpZGhyUkZOTitDMlVJR1ZVYVo1ZXVhNWYx?=
 =?utf-8?B?dEV5cklBYjhNUFQvTU52ZlY0U1pRejFJZ3FDZFBRN2FNcXBMQlI0WTFodnZD?=
 =?utf-8?B?bWFIT2lOdVNkVjlwOTRvVTg5N0NKOC9ZeGdyYWZ6RlVPdldjcTB1bC9GN01k?=
 =?utf-8?B?Tm1YRkdJV0pPY3VMdWNCZnZJUTF5NEZseVJ6UFlzd05EaXFjTUE0MGdEUVcz?=
 =?utf-8?Q?xTzwS/zZG4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VURWM200QXBPZHp1ZEs5S1Z2cTREVlAvTXhWbXpuajJKbmpLTGVrS1pLUHor?=
 =?utf-8?B?MllCTTFTUS9hZE55MnIyT2JuRUFBcnRFY2NQeUJ0SkY5Y1Fsa0NGYzJrd0RE?=
 =?utf-8?B?SGRNU0srMXF2aE12Tjc1UFhaVU9iVlNsRDFQaWNvVDFjaTl5bEsyTDJWVDhs?=
 =?utf-8?B?SXpubFVjSUdGMjJvaTBkRThtd0Z6RzJxU1pyUk5leklEK1RUWXZqUys2V1B5?=
 =?utf-8?B?RDRzS0FoY2Z4Y3djcTBLYU0ya1cxYlRnYkZGMFhWaDJBV3JXcjJPZ0xzeGZD?=
 =?utf-8?B?c2Y1cTA2QTgzQUFPZkhCaU1LL25BTE9mUUFjb3R6VDVWYkpkdlBvZFlLZjlp?=
 =?utf-8?B?UGJ1bDZJZ1VnOUVlRU80L1pnMlA3L1Fwd2tkTUJYYlRKaytERlN4OVlsN1Q5?=
 =?utf-8?B?UTF3dERRWms0dEVWblpxVUpQY2VUQ0JBNEd4ckxNMjQwYVVUaTg0NUNNaFdx?=
 =?utf-8?B?VUhsc094a001WHFiNmNvamcyVGJaVHJ6STh6MXNJQ21HRWNHeFRmZytmVDVk?=
 =?utf-8?B?SkFFdmZIVU5QTE0rMStGQW5nSWhTcytoRWNpYjlDbU8vRFdPeWwyK0hOTG1R?=
 =?utf-8?B?L2xjUlZ4N3oyNnRxdjdFaXZ3aWpXYnVmaVBMZ1RicEVDWTROUkpiSm12UGRz?=
 =?utf-8?B?UWRNRzVhcElrbGZNaVduaFFwdFFpVmhPS0xoeDBkbmxJS2cwWmVXQ0d3VUFx?=
 =?utf-8?B?MUJjRnk2Q3NqeHBxZURSaTJsV2JmaGZ6VlRYZ0lMUzQ3M0ZyamJNQ01CdmRn?=
 =?utf-8?B?SWNsd3FORVI2Sy9zOUhHczk2M0tpc1k1MFU1eGFXKzcyV2VkVGR0dUJ1V3hB?=
 =?utf-8?B?K3ZZTkpiaGFFYlRabEtCaUx1WFpXL1c0MXBuN25waVYrWUpMeHZEUFN1RjE5?=
 =?utf-8?B?YVhWK1Jpbktqa1M2cENISUV1ZFN6ZUd5RzUvcjFsbW96a2UzcU40SWJSU0Qv?=
 =?utf-8?B?YTZYSWxneWJsR2l3WkgrcXl0SGhUQmNkdFFLZE0wWkgzV1ZhMEhXYTN6M1Ur?=
 =?utf-8?B?N010bjM4NVhqbWRZM2dkblROZjIybHduTVB6SGJidlg2Wk4rdTRnb0podzNE?=
 =?utf-8?B?TDZkWnpDYnlTUDR2NzR2RGNUamtHNGlRZ2ZvTUExOEp0RVB5R3dCa0JvUVlV?=
 =?utf-8?B?TE5yYy9yUm5ncTFRZ3NpVDgrdVVnb0c5TEdYcDNBd0h3enZmaFpLN3NYcmYv?=
 =?utf-8?B?VkVzN0d0eVJ4UTV4a3dxbWxEbXE1VEg5MUVBMi9td2dGL1MwWlQzRFZ0QjVY?=
 =?utf-8?B?S0tLVHFFdVRDV1E0RUpUb1NJR0kySktQZFBmSUdhNW1WN0FDZkNmVDIvZnV5?=
 =?utf-8?B?MS9zVE1VNWlpQ09qZ3NkaUhWWjI3RzI1eS83NWx5WG92cFJuTFRDTjNaaE5Q?=
 =?utf-8?B?TllmU3ovY29iTzJrMWZ6b2NseEVDbUVnU2p5TDdHakdjLzdYMmhaU1NLb1Nk?=
 =?utf-8?B?eU4yTFVRbUVYaFUweE41MmdIWW1IRnN3UHF2cFZ0MllnZitBcVJOL3NPc2pp?=
 =?utf-8?B?S1VHZEZkMkZlak9lN0FCMXpUcFlCSkF3K1RjZ1NPcnF1N3NocGhCRXdWWHNw?=
 =?utf-8?B?d3l2TzFJT25aUkRSRTVqTitrYkJKMlRBYXc0UFpsOWpBdTVTb0l6RURJb3dk?=
 =?utf-8?B?eHV6dGN0enl1UTQvTjRTYWRIdStSK0hCTEF0cHBzdWpXekxBZTZsQVo5WG5I?=
 =?utf-8?B?OEpuK0pPQlh2NWI0aFZaZGxMZGhMZVFFZjIrV0hoYXJuemxUMkJlcjlDakRQ?=
 =?utf-8?B?UC9hd3pManZzRFVFY2ZXWWRpcnZodSsrQzhTL2hPcHNmTWJZZGdwUys0c0ZQ?=
 =?utf-8?B?V3l5ZnhaS1RvTzBSOVR2eVZ5NVBCcHkycytWalo5OFRqU3VzNTM0Nnp3SlJY?=
 =?utf-8?B?R2tUUWFONlh2Y3lnWHQvT3lVZkxHaHpobzJmbnVsTnlDckVpektyTTFaRWpT?=
 =?utf-8?B?N1lHSVFKbTFlMUYrdXhTQ3NpVGM4TkYwSStGK2orMUxRS2JCWjJpZW1rcmFu?=
 =?utf-8?B?TGdkR2loVTFzWE1sM25LVmRKQnNwMnpDNUVrcW9GRlVQd0dEU2xYb2h3U0d0?=
 =?utf-8?B?cTVRZ1BwcURsT3FOcnVVd2d5clZPWDdrc2Vwc2RiWFVyeTJtSkNPZlJSL3lU?=
 =?utf-8?Q?u33o6xBbAc4JZ/lfUfgf1nICS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5f8aac-cd06-4bbc-efe0-08ddbada7477
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:09:18.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKSEX7VIerJRjkFZBg6JoDa81FT8pKeSSj/AYfsusDG6rkcBrp1p6md+QJTJLmOHCNSy2NCqRFphNw+gXYdH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472



On 7/2/2025 1:43 PM, Dev Jain wrote:
> 
> On 02/07/25 1:38 pm, Raghavendra K T wrote:
>>
>>
>> On 7/2/2025 12:18 PM, Dev Jain wrote:
>>>
>>> On 02/07/25 12:13 pm, Raghavendra K T wrote:
>>>> The test align_shift_alloc_test is expected to fail.
>>>> Reporting the test as fail confuses to be a genuine failure.
>>>> Introduce widely used xfail sematics to address the issue.
>>>>
>>>> Note: a warn_alloc dump similar to below is still expected:
>>>>
>>>>   Call Trace:
>>>>    <TASK>
>>>>    dump_stack_lvl+0x64/0x80
>>>>    warn_alloc+0x137/0x1b0
>>>>    ? __get_vm_area_node+0x134/0x140
>>>>
>>>> Snippet of dmesg after change:
>>>>
>>>> Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>>>> Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
>>>> Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..
>>>>
>>>> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
>>>> ---
>>>
>>> Thanks for doing this, been thinking about this for so long but
>>> I'm lazy : )
>>
>> :)
>>
>>>
>>>>   lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
>>>>   1 file changed, 21 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
>>>> index 1b0b59549aaf..649f352e2046 100644
>>>> --- a/lib/test_vmalloc.c
>>>> +++ b/lib/test_vmalloc.c
>>>> @@ -396,25 +396,27 @@ vm_map_ram_test(void)
>>>>   struct test_case_desc {
>>>>       const char *test_name;
>>>>       int (*test_func)(void);
>>>> +    bool xfail;
>>>>   };
>>>>   static struct test_case_desc test_case_array[] = {
>>>> -    { "fix_size_alloc_test", fix_size_alloc_test },
>>>> -    { "full_fit_alloc_test", full_fit_alloc_test },
>>>> -    { "long_busy_list_alloc_test", long_busy_list_alloc_test },
>>>> -    { "random_size_alloc_test", random_size_alloc_test },
>>>> -    { "fix_align_alloc_test", fix_align_alloc_test },
>>>> -    { "random_size_align_alloc_test", random_size_align_alloc_test },
>>>> -    { "align_shift_alloc_test", align_shift_alloc_test },
>>>> -    { "pcpu_alloc_test", pcpu_alloc_test },
>>>> -    { "kvfree_rcu_1_arg_vmalloc_test", 
>>>> kvfree_rcu_1_arg_vmalloc_test },
>>>> -    { "kvfree_rcu_2_arg_vmalloc_test", 
>>>> kvfree_rcu_2_arg_vmalloc_test },
>>>> -    { "vm_map_ram_test", vm_map_ram_test },
>>>> +    { "fix_size_alloc_test", fix_size_alloc_test, },
>>>> +    { "full_fit_alloc_test", full_fit_alloc_test, },
>>>> +    { "long_busy_list_alloc_test", long_busy_list_alloc_test, },
>>>> +    { "random_size_alloc_test", random_size_alloc_test, },
>>>> +    { "fix_align_alloc_test", fix_align_alloc_test, },
>>>> +    { "random_size_align_alloc_test", random_size_align_alloc_test, },
>>>> +    { "align_shift_alloc_test", align_shift_alloc_test, true },
>>>> +    { "pcpu_alloc_test", pcpu_alloc_test, },
>>>> +    { "kvfree_rcu_1_arg_vmalloc_test", 
>>>> kvfree_rcu_1_arg_vmalloc_test, },
>>>> +    { "kvfree_rcu_2_arg_vmalloc_test", 
>>>> kvfree_rcu_2_arg_vmalloc_test, },
>>>> +    { "vm_map_ram_test", vm_map_ram_test, },
>>>>       /* Add a new test case here. */
>>>>   };
>>>
>>> Why this change?
>>
>> Perhaps not entirely necessary except for align_shift_alloc_test line,
>> still updated the field since one more bool field added. But let me know
>> if you are okay with current state OR need a respin for that?
> 
> Oh now I saw the "true", I thought you were adding commas for no reason.
> 
> I think that's fine then, but will let Uladzislau decide.
> 
> 

Uladzislau,

Do you think this patch would be useful? and above change is okay?

Thanks and regards
- Raghu

