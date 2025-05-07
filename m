Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023122.outbound.protection.outlook.com [40.93.201.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56879219A7A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656380; cv=fail; b=ebtTL8T3zj8GTAXfW3sgm+DRjMqkE4BiYt49UVMw/gV6k4l8Zjs68lKayHExmocpm+ejbIzg4GiK1+2IytWt528z9tbScDDP6XFm+jECb92BtACcwbwinmbbdY1jeO1VBmGx95n6QfKVxDO/6FRUcGLX1rOxq9byQ2s9x1Sejm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656380; c=relaxed/simple;
	bh=Q0Qx9NsRYtZKSwbHrnQALZvEptKp8CoppNAoU4aFrcI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CpP0/25jaFIlsxyGPISjvV/56OeydN4zeha6zTVqCnr8Yqdqgtr46BNiBNWskSLfNi/Nk9QiXhH+EmONkRm0UoTtAnyCVyMz5+Pia+plfj4G7uRPcAdY3qtz5VKNfrsOccHvE7qeWjT6MvbDcQ3zQpm20QgFMDbCUPQED+mvY6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=PlzEU/ea; arc=fail smtp.client-ip=40.93.201.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="PlzEU/ea"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=badOcFIYdDK9P6LjrgsUeZlpwPd8ZX0iO8/rFxqQZ+0+TZ8sp/B+h+oP5uy0w3gwFKPEKcVL5K0zqEvyNCA9sAlp8k4l4r0+SDFI3LOJWKG94TbbvgZlnk5+hYXYSx0Kl3xu2K6szpWDzyoVA6IANDPTEdNOQc2wkVoszeWqEA0Q2kRj1VIbevWD822B9lRzzNT+IfcljhMa0rAZuV56gEm+o61vWk6rqL1Jt5khLFArdoT8McMflpw6LDct1WqLUbFFaML946GEl/Z0pyU5J/d3zslbT7oHUbj69oBEywyotvauFVJEZtETbjAITvqz7A/tSzESJsk8D3HDVl0rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD804AYftZvn30Oa42cqwHCxhdWm8nrw3+3ig9K9Oo8=;
 b=W7mqPnwHUvA4bRD3nr1IRJCFJlQqEZ5LCRhaK95UnRRzD+Hz5vV6RjjMa7nZqum0BnplC7soTPZot6lOiL7L29DBtSkpdUpCiOmSCRJLJwLpbl9Eh+o5aI4YcLpnJ0HabSlFa76FrKKOfp6OhM/1Ducu9GnDyNwWRhS1yjUthQaRr/IjTS02GrHkPVbBASJvo/94g2NqxFZzN5fZdBlo9Ywn6xFvTmnPwZRiNFb8UXV0FpmK/+GqDznyFwzVlmZDtrkoEryfI+nV61YycBKJitHExd4dA1K5PxQYWrQr8ZJfD3dgBByIaUcqkf0eUpqXlz1pg1RUSybFzjZVT6iWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD804AYftZvn30Oa42cqwHCxhdWm8nrw3+3ig9K9Oo8=;
 b=PlzEU/eaxns6uuhIxVglbDQYmVHkuo4wHE9N4mXiqMcsSH0lsS4DAdsG9xpwXRi6Q1ljNh20RLya2yBV8/E79Pec02cODHOEQVmdQrsaj6WnbTdCRfMm57oTYq7mOe8D1SE1xWESDg747ij4TbWXxPewinvu3EjjKtj+ULKjZJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB6537.prod.exchangelabs.com (2603:10b6:510:76::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Wed, 7 May 2025 22:19:15 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 22:19:15 +0000
Message-ID: <a55bfc6d-d87e-4c43-8843-ac3aaec4bd2b@os.amperecomputing.com>
Date: Wed, 7 May 2025 15:19:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 3/6] arm64: mm: make __create_pgd_mapping() and helpers
 non-void
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <20250304222018.615808-4-yang@os.amperecomputing.com>
 <172bf7a8-4533-4627-83d2-552e4681c360@arm.com>
 <2b715836-b566-4a9e-b344-9401fa4c0feb@os.amperecomputing.com>
 <a7518be7-aa0d-4e2e-bc1b-6ac10328e8fc@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <a7518be7-aa0d-4e2e-bc1b-6ac10328e8fc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2343a6-b302-4d92-b057-08dd8db533c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVg5cW9OTjZza012c1ZlYjd0eVVCaTc1OXIvZFN3aktQbGNTNThrNkk2T2t4?=
 =?utf-8?B?bGpOL1lXeG5ua1c3QnRUZHY3N0g3M1BLZkpKbDY3TGs1MThNUHhFNjVOcElH?=
 =?utf-8?B?NUxwTXdQVFJKbVBBcU1wMUE3QnIvRDNCUVA1Z0wzYmlRV0VzV005TzN2RXo2?=
 =?utf-8?B?TUlYVzFVZVRIdVBaRzNXbzZmUlJWMlZBRHpRUlFKVExUZWVjOUZYSzBzbGRK?=
 =?utf-8?B?bWRlVEtrMW1scmEyL1pzQlFlcEdMeGtsTG1zdGszWVh1TXF0QmJjZ1ZNNlNa?=
 =?utf-8?B?eERyMm95MEN6OHR4dWNDdmJ1dzk2c1EzTFlIVFBCQytjR2JFdTVpNlEyR1Jh?=
 =?utf-8?B?YURkQ2k5S1AzWTg0T0NNQ1JodUorNWV6SnFNM0ZGdVdHQ2liYzVWNHgrOWhp?=
 =?utf-8?B?WGJza1lNSVY4UFhkc204Qyt3MXZ0YWNvQVJxdzdJWG1yVGdyU3c2Y3A0N2sx?=
 =?utf-8?B?SW5WYkRqS2U3aXJQZE1oRkdIbThid2U4V3M5UmFVU25DZ3B6QWV5bWxPV21U?=
 =?utf-8?B?YmRHWm05NHpnUjRXZ2w3MXZ2c1hUTHNBYlZQdzZybGFnYzROUHBBQ0x2UVE4?=
 =?utf-8?B?a0k1OWJLbXM1ZUx4OW5GaHNNYjEybHhneWc1RFo4WVlSaE5yeGVxTUpXWTlR?=
 =?utf-8?B?SG4yOCtPeE9CVXdjTlNXT3dBWjhocXB3ZHg2RkxFWTRGcGJqUWlEUWt0eGN3?=
 =?utf-8?B?anExcTVMMHpMWVRQRU9PeDJsYnQvR1VhbW9IMUNvaWlPbVRuZm5pR1ZuSnEx?=
 =?utf-8?B?VEI4eWZPN1k1dVI1eTRsK1I1ZzBQUWNOSGUrRmk1ZEN1OHdlZGsxTnRGbFlk?=
 =?utf-8?B?RUMzb1JyYUxwcjRFS0RsMTVEK2VGK3BHVWNjVUJOeVM2ME5vL05VSGlUcEF0?=
 =?utf-8?B?ay9pVHhqbDB3Vk0yaG05UTJGUTZoSUFleitTZ3FKeThhbXY2Ui9rUkpyRkM1?=
 =?utf-8?B?dGkza3dTS2w5SHdvVzhlQ1RLQWUwUStyVHBHUlRaWjNTMW1KdFV4ZVlCSUdE?=
 =?utf-8?B?OFRXbXhDOWZ6N2grc2hzTUViV2c0YXF5MUpnZ2pUazBMUzVyYlNrOXFzVndH?=
 =?utf-8?B?ZTRnRERQWEZ1dlIreEM5bFJpNFdiNy90NWlpUkxSZ09HN1hpZFJONkRWSnVa?=
 =?utf-8?B?aWxoelZ4azhpV2MyWDJqVnVORVhVczdwN0hvaFFsbElvT0NkSFhjSjF1UWpG?=
 =?utf-8?B?cTlLWWtoNVpnazlkN3k4bmFPWDRLMHJZWTN2YkZKYjZ1MnRreTJmbmsrRFdo?=
 =?utf-8?B?MUdXeU1Sc3pBeXhMMzVHYlZXMjJ2UVlSdGJSaDkrV0tzeXlDN3loY3pubUNt?=
 =?utf-8?B?ajY1a0gydzhOT2h0SDRXWVQzZWl4WTc2ZHg0UnZaeCtBNVphaitGK3VmQ1d2?=
 =?utf-8?B?bndhRWZhdytCYytpK1JGSW8yOFNuWGUrenNDcmlYLzNOS0ZCV0tQZ2htbC9B?=
 =?utf-8?B?eTBQdFAwTVpPSHZQTU1ySTJjdGFoTXJpWE1XZk1CcmFQWW8zeUF2OTNvOXN0?=
 =?utf-8?B?Rlc0MlFIUDRsSFUrbDh1TjZTcXpFNXhpYVdzd0Jwd2tJZURtSmxUb1VSa2VP?=
 =?utf-8?B?UEZETEQvdkJUT0RteTVyT2JYbkFmaUJvaklBejlTcWJ4TXJiOFBmZlRQREda?=
 =?utf-8?B?Z2ZndTBQNTJka0F5Y3Z6SWEyOWVsQzFTVThmYmdKcUZDdEkyaC9aZzhvdXNw?=
 =?utf-8?B?S1k3dFRiYUdibHhoN0JpWExSZFNqYzVjY0F5RGczYXI4Z3kzbHZWNTdiRndz?=
 =?utf-8?B?eWVZeHdpdWhhVkhlTXhjbXRCVWd0WnMzZStkNUdOWnVNQ29yd0lhVTV2eFo3?=
 =?utf-8?B?UEZlUnY3NUpFNWYyWForblBUaUZlSUtoZjYyMzFoQjVUMXNtZ1FnVW9rcURm?=
 =?utf-8?B?dUxBbjVuMy9sVlMxTFVJL3VFL1JqbkUxbWRnY0VIZ1dzVlhROC80cmFhZTRr?=
 =?utf-8?Q?ogkNHvKtSic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajE1VlFhazlLYUJVeWJkNEdhbGRtOVBsVUF2M1liWW84NVQ4QnJJcWRzcjk5?=
 =?utf-8?B?SCtBN0xvb0s5dFBxb0VmQ3R0VHZzZldyd1dTeGJoWCtGcldLU3ErbW50R1Bn?=
 =?utf-8?B?a1ozZllBZVpjOUphalV4aExJYlpFWnFRR0F4ZC8wWWFMTWxWNy9Yb1IxSWV2?=
 =?utf-8?B?QmtuMTFranhveTBnVzgwNWlrZE53MWo1MmxheWtuZVJyTVEzVFdtT1pJTnp1?=
 =?utf-8?B?K0hPbDJrQ0dQM0s0dndWN3Y2cG5ISmJIUGpQMGVGYnVFZHUvRUFjUDBpV0lU?=
 =?utf-8?B?UzlCdUpYZEhFSnhBeUNaMUZSMFdzSFlIU0dSR2MxcitGZTZKQVRqR09sMmZa?=
 =?utf-8?B?YkVGRlhESXo2YXQrVFdJcWdPdU1BVFdLTm1sNFkybXFycFBUZzBHQ093aHlr?=
 =?utf-8?B?eklYNkg2NnpiaUhnbk54Um45OFlPWGdDV21lTFU0WG5lZjVHR2IycDVHTWY3?=
 =?utf-8?B?T1dzN0VWUU56SVpUTGNYRldVS2FEaFpvaHpDSkErRFBoam5peDBnQ3ZVbU8r?=
 =?utf-8?B?b3lSd21hT2RXV3NGWXErWlFXVmdGS2hBcUJXMDRPQTJJYWxMZEFQQXZsOGx1?=
 =?utf-8?B?WHdUc3pDVUMrV1dEV21WZm5jaUVQOE8wOWZhRFV5S3lkTTc0RzRuWFljZ0cx?=
 =?utf-8?B?UUZ0ZjlENXpPb1hsdFB0dkxSUmJWc0NLa3BrTmZvaVRHeWFMTUpMdnJqSHZ5?=
 =?utf-8?B?QkYrbk8vWGNGckwrRVJsdjV6eklYREd6ZUdMOXB2bGlJQmFEaWxTMTlqZTQ2?=
 =?utf-8?B?TzVwNE5lNkRmS0NyZWcvMTFOazEwSWRDMytvZjUyNnE1SHN1K3UzR3ByZnho?=
 =?utf-8?B?bFljTzhSR2hrNCtIaFlFVGh6Z2E2R2RNQUlmNkVNd29nZEliNll1QjJBYTFL?=
 =?utf-8?B?dDY2aWpwVVpDR1dWbXpwUHd5czVPWS9ZbWZwRE1EbFJhUzBjRmdRdFVwMmIw?=
 =?utf-8?B?aW15czIzY0VIemZhTWFZL3Rka2FUZHNLR0RoaldYZ3p2VUtFa2JMZ0pVaDA2?=
 =?utf-8?B?Q1U0Z1plcldON2svQXp4MkhRTWxPaUpSd29lQnNRWnlVSVVYUmVsVTJaaUtP?=
 =?utf-8?B?SFhvR2tTaHJZVkQvakx6cUsvS2hWdU94TUJHYUVSbjQzUW1kM256SUdKSnMy?=
 =?utf-8?B?SzBMZURHSm1McGNEZ2tYbzFRaVFSKzRrNFRnMGdzQ3FONHVFQkRrZWVqMDY2?=
 =?utf-8?B?Q0J3MU1QTWx1aElILy9GcHFvUnhYRHBtYktNKzdCYlY2MVJMZ2FhVWpVTG1C?=
 =?utf-8?B?TFpSQTFubzdXYkFsanN3RWJwZzh2Z1F1Z0cwb0l3U2VoV08vcDdMV3E0REU3?=
 =?utf-8?B?K0hBY0htMi9aS0JjOXEwcDBPbEJGVEFld0puZm9VaURiL1dEUHowWnFCSWxF?=
 =?utf-8?B?YVh1ZWdjcDdJeitGTm5sSk1vMVFDS2h6aGQ1ZUNZSHN1V3FTTkYwV2NEa0hM?=
 =?utf-8?B?eUVEV01pWVYvamFvd0tEbitxK0tNUnNLTS94Q0NlYUdhSU55OHhWYWthQXYz?=
 =?utf-8?B?TnVZd0JSWVJXc3RxeGpOd0xrZDdzTE8xK1I1Qk5hY2NqWXZmS0VGQVR4SXFD?=
 =?utf-8?B?ODdseUFOQnNwNy9TSmh0emRvWGZ6RTRKK25tZW5EQTlyaUY4NklwQm9vWWdl?=
 =?utf-8?B?OXNBVDVEcDFEcXZzcWRuVUx2ZTRSbUVNNW5UWkdNdXVaMzR4UXdmUDdXUHE3?=
 =?utf-8?B?Nm1QUG9rY3NwaFA0dUhySnM1VHA2d3E4VW94UUpSMG14bGVWb1gyMkRONXdu?=
 =?utf-8?B?aVJ6Q3RldVVUbUJwRWE5VDE4bkYyTjducEhSME9ZZVl2NlFXSkRGSlRmT1Nw?=
 =?utf-8?B?enhuTzJqMzRLZnFraTRxaEsyRytZVm0wMW9udTRLUXg1OVBEcXZxVm91VFM5?=
 =?utf-8?B?NGR6Q0s1QUFCcUhkT3NqcXgwdk8xSEV4blB3L1I3SXBQckFReGlwSkI4RnRW?=
 =?utf-8?B?S2ZRL2djOEthTHRoUU81SVpia3NKcys3K2FwSG5UbHVlZDVnQldvNzBqTnc5?=
 =?utf-8?B?M1lzYVU5aDdJeXFqTk11enEvb0hiUy9ITUNYZTlORndEVEY1N041aEZpRHRm?=
 =?utf-8?B?dDhZSTRZUmFBeTFYMFhYZ0RPbm4vZU5WMzF0aWMrblVQaUorUEdOampLT3pS?=
 =?utf-8?B?ekxqQUxmbFhXNWdTUUdWSlN1V3FBTDNmTC9lQzg5RmRsREg3K2ZlRVRkdC9V?=
 =?utf-8?Q?zdHXW/wbA04bmuB4DF/l5vQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2343a6-b302-4d92-b057-08dd8db533c6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:19:15.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/Ec/0ochGdGTwyWbxTQSobzorsNe8Ma/ZuklyMDLzSDEReIFoIVkCyY/0M61O80d33pqZDI6vAdj3m61/Y2dLQ9GuZlcQetmtAjMiWooX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6537



On 5/7/25 1:18 AM, Ryan Roberts wrote:
> On 17/03/2025 17:53, Yang Shi wrote:
>>
>> On 3/14/25 4:51 AM, Ryan Roberts wrote:
>>> On 04/03/2025 22:19, Yang Shi wrote:
>>>> The later patch will enhance __create_pgd_mapping() and related helpers
>>>> to split kernel linear mapping, it requires have return value.  So make
>>>> __create_pgd_mapping() and helpers non-void functions.
>>>>
>>>> And move the BUG_ON() out of page table alloc helper since failing
>>>> splitting kernel linear mapping is not fatal and can be handled by the
>>>> callers in the later patch.  Have BUG_ON() after
>>>> __create_pgd_mapping_locked() returns to keep the current callers behavior
>>>> intact.
>>>>
>>>> Suggested-by: Ryan Roberts<ryan.roberts@arm.com>
>>>> Signed-off-by: Yang Shi<yang@os.amperecomputing.com>
>>>> ---
>>>>    arch/arm64/mm/mmu.c | 127 ++++++++++++++++++++++++++++++--------------
>>>>    1 file changed, 86 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index b4df5bc5b1b8..dccf0877285b 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -189,11 +189,11 @@ static void init_pte(pte_t *ptep, unsigned long addr,
>>>> unsigned long end,
>>>>        } while (ptep++, addr += PAGE_SIZE, addr != end);
>>>>    }
>>>>    -static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>>> -                unsigned long end, phys_addr_t phys,
>>>> -                pgprot_t prot,
>>>> -                phys_addr_t (*pgtable_alloc)(int),
>>>> -                int flags)
>>>> +static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>>> +                   unsigned long end, phys_addr_t phys,
>>>> +                   pgprot_t prot,
>>>> +                   phys_addr_t (*pgtable_alloc)(int),
>>>> +                   int flags)
>>>>    {
>>>>        unsigned long next;
>>>>        pmd_t pmd = READ_ONCE(*pmdp);
>>>> @@ -208,6 +208,8 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned
>>>> long addr,
>>>>                pmdval |= PMD_TABLE_PXN;
>>>>            BUG_ON(!pgtable_alloc);
>>>>            pte_phys = pgtable_alloc(PAGE_SHIFT);
>>>> +        if (!pte_phys)
>>>> +            return -ENOMEM;
>>> nit: personally I'd prefer to see a "goto out" and funnel all to a single return
>>> statement. You do that in some functions (via loop break), but would be cleaner
>>> if consistent.
>>>
>>> If pgtable_alloc() is modified to return int (see my comment at the bottom),
>>> this becomes:
>>>
>>> ret = pgtable_alloc(PAGE_SHIFT, &pte_phys);
>>> if (ret)
>>>      goto out;
>> OK
>>
>>>>            ptep = pte_set_fixmap(pte_phys);
>>>>            init_clear_pgtable(ptep);
>>>>            ptep += pte_index(addr);
>>>> @@ -239,13 +241,16 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned
>>>> long addr,
>>>>         * walker.
>>>>         */
>>>>        pte_clear_fixmap();
>>>> +
>>>> +    return 0;
>>>>    }
>>>>    -static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>>> -             phys_addr_t phys, pgprot_t prot,
>>>> -             phys_addr_t (*pgtable_alloc)(int), int flags)
>>>> +static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>>> +            phys_addr_t phys, pgprot_t prot,
>>>> +            phys_addr_t (*pgtable_alloc)(int), int flags)
>>>>    {
>>>>        unsigned long next;
>>>> +    int ret = 0;
>>>>          do {
>>>>            pmd_t old_pmd = READ_ONCE(*pmdp);
>>>> @@ -264,22 +269,27 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr,
>>>> unsigned long end,
>>>>                BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
>>>>                                  READ_ONCE(pmd_val(*pmdp))));
>>>>            } else {
>>>> -            alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>>>> +            ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>>>>                            pgtable_alloc, flags);
>>>> +            if (ret)
>>>> +                break;
>>>>                  BUG_ON(pmd_val(old_pmd) != 0 &&
>>>>                       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
>>>>            }
>>>>            phys += next - addr;
>>>>        } while (pmdp++, addr = next, addr != end);
>>>> +
>>>> +    return ret;
>>>>    }
>>>>    -static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>>>> -                unsigned long end, phys_addr_t phys,
>>>> -                pgprot_t prot,
>>>> -                phys_addr_t (*pgtable_alloc)(int), int flags)
>>>> +static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>>>> +                   unsigned long end, phys_addr_t phys,
>>>> +                   pgprot_t prot,
>>>> +                   phys_addr_t (*pgtable_alloc)(int), int flags)
>>>>    {
>>>>        unsigned long next;
>>>> +    int ret = 0;
>>>>        pud_t pud = READ_ONCE(*pudp);
>>>>        pmd_t *pmdp;
>>>>    @@ -295,6 +305,8 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned
>>>> long addr,
>>>>                pudval |= PUD_TABLE_PXN;
>>>>            BUG_ON(!pgtable_alloc);
>>>>            pmd_phys = pgtable_alloc(PMD_SHIFT);
>>>> +        if (!pmd_phys)
>>>> +            return -ENOMEM;
>>>>            pmdp = pmd_set_fixmap(pmd_phys);
>>>>            init_clear_pgtable(pmdp);
>>>>            pmdp += pmd_index(addr);
>>>> @@ -314,21 +326,26 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned
>>>> long addr,
>>>>                (flags & NO_CONT_MAPPINGS) == 0)
>>>>                __prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>>>    -        init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
>>>> +        ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
>>>> +        if (ret)
>>>> +            break;
>>>>              pmdp += pmd_index(next) - pmd_index(addr);
>>>>            phys += next - addr;
>>>>        } while (addr = next, addr != end);
>>>>          pmd_clear_fixmap();
>>>> +
>>>> +    return ret;
>>>>    }
>>>>    -static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long
>>>> end,
>>>> -               phys_addr_t phys, pgprot_t prot,
>>>> -               phys_addr_t (*pgtable_alloc)(int),
>>>> -               int flags)
>>>> +static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>>> +              phys_addr_t phys, pgprot_t prot,
>>>> +              phys_addr_t (*pgtable_alloc)(int),
>>>> +              int flags)
>>>>    {
>>>>        unsigned long next;
>>>> +    int ret = 0;
>>>>        p4d_t p4d = READ_ONCE(*p4dp);
>>>>        pud_t *pudp;
>>>>    @@ -340,6 +357,8 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long
>>>> addr, unsigned long end,
>>>>                p4dval |= P4D_TABLE_PXN;
>>>>            BUG_ON(!pgtable_alloc);
>>>>            pud_phys = pgtable_alloc(PUD_SHIFT);
>>>> +        if (!pud_phys)
>>>> +            return -ENOMEM;
>>>>            pudp = pud_set_fixmap(pud_phys);
>>>>            init_clear_pgtable(pudp);
>>>>            pudp += pud_index(addr);
>>>> @@ -369,8 +388,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long
>>>> addr, unsigned long end,
>>>>                BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
>>>>                                  READ_ONCE(pud_val(*pudp))));
>>>>            } else {
>>>> -            alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>>>> +            ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>>>>                            pgtable_alloc, flags);
>>>> +            if (ret)
>>>> +                break;
>>>>                  BUG_ON(pud_val(old_pud) != 0 &&
>>>>                       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
>>>> @@ -379,14 +400,17 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long
>>>> addr, unsigned long end,
>>>>        } while (pudp++, addr = next, addr != end);
>>>>          pud_clear_fixmap();
>>>> +
>>>> +    return ret;
>>>>    }
>>>>    -static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long
>>>> end,
>>>> -               phys_addr_t phys, pgprot_t prot,
>>>> -               phys_addr_t (*pgtable_alloc)(int),
>>>> -               int flags)
>>>> +static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>>> +              phys_addr_t phys, pgprot_t prot,
>>>> +              phys_addr_t (*pgtable_alloc)(int),
>>>> +              int flags)
>>>>    {
>>>>        unsigned long next;
>>>> +    int ret = 0;
>>>>        pgd_t pgd = READ_ONCE(*pgdp);
>>>>        p4d_t *p4dp;
>>>>    @@ -398,6 +422,8 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long
>>>> addr, unsigned long end,
>>>>                pgdval |= PGD_TABLE_PXN;
>>>>            BUG_ON(!pgtable_alloc);
>>>>            p4d_phys = pgtable_alloc(P4D_SHIFT);
>>>> +        if (!p4d_phys)
>>>> +            return -ENOMEM;
>>>>            p4dp = p4d_set_fixmap(p4d_phys);
>>>>            init_clear_pgtable(p4dp);
>>>>            p4dp += p4d_index(addr);
>>>> @@ -412,8 +438,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long
>>>> addr, unsigned long end,
>>>>              next = p4d_addr_end(addr, end);
>>>>    -        alloc_init_pud(p4dp, addr, next, phys, prot,
>>>> +        ret = alloc_init_pud(p4dp, addr, next, phys, prot,
>>>>                       pgtable_alloc, flags);
>>>> +        if (ret)
>>>> +            break;
>>>>              BUG_ON(p4d_val(old_p4d) != 0 &&
>>>>                   p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
>>>> @@ -422,23 +450,26 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long
>>>> addr, unsigned long end,
>>>>        } while (p4dp++, addr = next, addr != end);
>>>>          p4d_clear_fixmap();
>>>> +
>>>> +    return ret;
>>>>    }
>>>>    -static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>>>> -                    unsigned long virt, phys_addr_t size,
>>>> -                    pgprot_t prot,
>>>> -                    phys_addr_t (*pgtable_alloc)(int),
>>>> -                    int flags)
>>>> +static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>>>> +                       unsigned long virt, phys_addr_t size,
>>>> +                       pgprot_t prot,
>>>> +                       phys_addr_t (*pgtable_alloc)(int),
>>>> +                       int flags)
>>>>    {
>>>>        unsigned long addr, end, next;
>>>>        pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
>>>> +    int ret = 0;
>>>>          /*
>>>>         * If the virtual and physical address don't have the same offset
>>>>         * within a page, we cannot map the region as the caller expects.
>>>>         */
>>>>        if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
>>>> -        return;
>>>> +        return -EINVAL;
>>>>          phys &= PAGE_MASK;
>>>>        addr = virt & PAGE_MASK;
>>>> @@ -446,29 +477,38 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir,
>>>> phys_addr_t phys,
>>>>          do {
>>>>            next = pgd_addr_end(addr, end);
>>>> -        alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>>>> +        ret = alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>>>>                       flags);
>>>> +        if (ret)
>>>> +            break;
>>>>            phys += next - addr;
>>>>        } while (pgdp++, addr = next, addr != end);
>>>> +
>>>> +    return ret;
>>>>    }
>>>>    -static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>>> -                 unsigned long virt, phys_addr_t size,
>>>> -                 pgprot_t prot,
>>>> -                 phys_addr_t (*pgtable_alloc)(int),
>>>> -                 int flags)
>>>> +static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>>> +                unsigned long virt, phys_addr_t size,
>>>> +                pgprot_t prot,
>>>> +                phys_addr_t (*pgtable_alloc)(int),
>>>> +                int flags)
>>>>    {
>>>> +    int ret;
>>>> +
>>>>        mutex_lock(&fixmap_lock);
>>>> -    __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>>>> +    ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>>>>                        pgtable_alloc, flags);
>>>> +    BUG_ON(ret);
>>> This function now returns an error, but also BUGs on ret!=0. For this patch, I'd
>>> suggest keeping this function as void.
>> You mean __create_pgd_mapping(), right?
> Yes.
>
>>> But I believe there is a pre-existing bug in arch_add_memory(). That's called at
>>> runtime so if __create_pgd_mapping() fails and BUGs, it will take down a running
>>> system.
>> Yes, it is the current behavior.
>>
>>> With this foundational patch, we can fix that with an additional patch to pass
>>> along the error code instead of BUGing in that case. arch_add_memory() would
>>> need to unwind whatever __create_pgd_mapping() managed to do before the memory
>>> allocation failure (presumably unmapping and freeing any allocated tables). I'm
>>> happy to do this as a follow up patch.
>> Yes, the allocated page tables need to be freed. Thank you for taking it.
> Given the conversation in the other thread about generalizing to also eventually
> support vmalloc, I'm not sure you need to be able to return errors from this
> walker for your usage now? I think you will only use this walker for the case
> where you need to repaint to page mappings after determining that a secondary
> CPU does not support BBML2? If that fails, the system is dead anyway, so
> continuing to BUG() is probably acceptable?
>
> So perhaps you could drop this patch from your series? If so, then I'll reuse
> the patch to fix the theoretical hotplug bug (when I get to it) and will keep
> your authorship.

For repainting the linear map, if it is failed, I agree it should just 
BUG(). But it is used by changing linear map permission too when 
vmalloc. BUG() is not the expected behavior, it should return an error 
to tell vmalloc (i.e. module loading) the failure and propagate the 
error back to userspace.

>
>>>>        mutex_unlock(&fixmap_lock);
>>>> +
>>>> +    return ret;
>>>>    }
>>>>      #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>>>>    extern __alias(__create_pgd_mapping_locked)
>>>> -void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long
>>>> virt,
>>>> -                 phys_addr_t size, pgprot_t prot,
>>>> -                 phys_addr_t (*pgtable_alloc)(int), int flags);
>>>> +int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>>>> +                phys_addr_t size, pgprot_t prot,
>>>> +                phys_addr_t (*pgtable_alloc)(int), int flags);
>>> create_kpti_ng_temp_pgd() now returns error instead of BUGing on allocation
>>> failure, but I don't see a change to handle that error. You'll want to update
>>> __kpti_install_ng_mappings() to BUG on error.
>> Yes, I missed that. It should BUG on error.
>>
>>>>    #endif
>>>>      static phys_addr_t __pgd_pgtable_alloc(int shift)
>>>> @@ -476,13 +516,17 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
>>>>        /* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>>>>        void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
>>>>    -    BUG_ON(!ptr);
>>>> +    if (!ptr)
>>>> +        return 0;
>>> 0 is a valid (though unlikely) physical address. I guess you could technically
>>> encode like ERR_PTR(), but since you are returning phys_addr_t and not a
>>> pointer, then perhaps it will be clearer to make this return int and accept a
>>> pointer to a phys_addr_t, which it will populate on success?
>> Actually I did something similar in the first place, but just returned the virt
>> address. Then did something if it returns NULL. That made the code a little more
>> messy since we need convert the virt address to phys address because
>> __create_pgd_mapping() and the helpers require phys address, and changed the
>> functions definition.
>>
>> But I noticed 0 should be not a valid phys address if I remember correctly.
> 0 is definitely a valid physical address. We even have examples of real Arm
> boards that have RAM at physical address 0. See [1].
>
> [1] https://lore.kernel.org/lkml/ad8ed3ba-12e8-3031-7c66-035b6d9ad6cd@arm.com/
>
>> I
>> also noticed early_pgtable_alloc() calls memblock_phys_alloc_range(), it returns
>> 0 on failure. If 0 is valid phys address, then it should not do that, right?
> Well perhaps memblock will just refuse to give you RAM at address 0. That's a
> bad design choice in my opinion. But the buddy will definitely give out page 0
> if it is RAM. -1 would be a better choice for an error sentinel.

If 0 is not valid in memblock, can it be valid in buddy? If I remember 
correctly, just the valid memblock will be added in buddy. But I'm not 
100% sure.

>
>> And
>> I also noticed the memblock range 0 - memstart_addr is actually removed from
>> memblock (see arm64_memblock_init()), so IIUC 0 should be not valid phys
>> address. So the patch ended up being as is.
> But memstart_addr could be 0, so in that case you don't actually remove anything?

Yeah, it could be 0.

>
>> If this assumption doesn't stand, I think your suggestion makes sense.
> Perhaps the simpler approach is to return -1 on error. That's never going to be
> valid because the maximum number of address bits on the physical bus is 56.

Sounds fine to me. We just need to know whether the allocation is failed 
or not. A non-ambiguous error code is good enough.

>
>>>> +
>>>>        return __pa(ptr);
>>>>    }
>>>>      static phys_addr_t pgd_pgtable_alloc(int shift)
>>>>    {
>>>>        phys_addr_t pa = __pgd_pgtable_alloc(shift);
>>>> +    if (!pa)
>>>> +        goto out;
>>> This would obviously need to be fixed up as per above.
>>>
>>>>        struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
>>>>          /*
>>>> @@ -498,6 +542,7 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>>>>        else if (shift == PMD_SHIFT)
>>>>            BUG_ON(!pagetable_pmd_ctor(ptdesc));
>>>>    +out:
>>>>        return pa;
>>>>    }
>>>>    
>>> You have left early_pgtable_alloc() to panic() on allocation failure. Given we
>>> can now unwind the stack with error code, I think it would be more consistent to
>>> also allow early_pgtable_alloc() to return error.
>> The early_pgtable_alloc() is just used for painting linear mapping at early boot
>> stage, if it fails I don't think unwinding the stack is feasible and worth it.
>> Did I miss something?
> Personally I'd just prefer it all to be consistent. But I agree there is no big
> benefit. Anyway, like I said above, I'm not sure you need to worry about
> unwinding the stack at all given the approach we agreed in the other thread?

As I said above, I need to propagate the error code back to userspace. 
For example, when loading a module, if changing linear map permission 
fails due to page table allocation failure when splitting page table, 
-ENOMEM needs to be propagated to insmod so that insmod returns failure 
to user.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>> Thanks,
>>> Ryan
>>>

