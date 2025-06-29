Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2104.outbound.protection.outlook.com [40.92.23.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121715227
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751214231; cv=fail; b=Ljo62tJYBStlUtC+DglRYWIXJyoavuBmzgfs6vfxj7qUcKrGRYLd/YEbEItr/lggyP5FdWxbtpYB9w9oaxVZxJBqZS5bAu2WYR3pAk8laxLqiertz6NNEzPOQri9s0WabQzv0Z+FxUhKr0PcCG8JY+s8rATJhL4qzW41JSHgH+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751214231; c=relaxed/simple;
	bh=nPU+XCiHjznKQPuwq3Kq/+id9rE3S1vctGx+hjjr600=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=hCmsLAtwDEp6ov4BI1JUAtNPUJ27PoXKvDg61adJpz5dPNX6ZI881ok2CabDgccqV6QYu/Z7b9ZB+qd39j1q4Co52lT+SA2fNIxWCqyaLRcncB5qIPe/HIl9x4WVvljFAED1TcOJ0179tkhvyYon3Fz+jsGxxWWLXm/1b7M/itw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=N6MMILYX; arc=fail smtp.client-ip=40.92.23.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="N6MMILYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riOEgKQxv4bMkYvCfRpR02zJfTF1N3GOQMFiXa7niqVjYOxZM4Z1AcdPH2ZWy6420OVVrma73vU+FbfKA1t/ChYQAyUYUUik/Ydu+wA+Fec/vCsFB5sR+vgGJ/z6GXBqYJBu+9pKu7KhiCRcaRBEHiPvz1SXq2ZQVjbdt9qNhHFzkTdz3DD2CKlVwuk8UfVWUWoHJ0EM+7quaAv3YmrhNJdenSmtSVZVGkGc2C8zQgFr8wC85rPJpCWD7olGGPwTBYsBkEG24PJPg3SyI36M3KDFDMnRS1LfBRFcdebt47Sz4szgQQGlzywGB183BFZCW8kFJYQC4zGJmTJh9I8ZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWqX5kGEeltDD7rGBNOp9Clz9IYPQGnML/twwVbWMno=;
 b=yAY7LcJiUjNODpWkNuPyx1D9jUMsvWbeCFbrBYJKq+PI2AYRHN/FBZJXDCjfiOFBMkjN5K+SQlSViopZTGpx5mslb0TNzzbrnpLdPzdLamcvuJvZq+nJhw+uPVt+BbKFXSEtxV+1MurxXJZkXv8G5JmayQcr0bQIaejSDJ98atRGqo3h63InhJawne9PixpZodhKu8RoDneRfCgaQ0wyunkpSl+L0JpXlQ/nAPMJRZ6p4CQdmWd6bEyKaw8ypPUg5Rk4WRrfKGvVSOGopAY1YNKsO+Wj23/yS5oN1kC/mPGzq7rPaRHoF67bUL8fyljjbBuPiE0Jyji37h7tEWOBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWqX5kGEeltDD7rGBNOp9Clz9IYPQGnML/twwVbWMno=;
 b=N6MMILYX+JSO7JdcxpYbOIwL+syf3r/Gk8H7XMtpwpswAvCL3c3wMW1hYrE7ddvhXH7xdYV1cbzrAsQWFclLS2F1ZcxrMfiVa/tkeU0aRDiH2QDek4oTIkFKZRPhw/ruiXcQ64+B9HnE8L2ECLdaZqsn58WBrWQub0YLeRS43Sg78Mv5XqX7sNHlSOvrO801vhFYCbcJIswJWcY1IyJAoWssF3rb7W2clEfjnF4uaucR4Df+BCUEex14Q58s7jd1qnnTOBlhhS57Bac61c7kI44ba+upjqWJR+PvBcHa05W8O+pCC5q5IuntSN9nFX2HclN143omcUw4Nv6RhWJwNw==
Received: from DM6PR06MB5611.namprd06.prod.outlook.com (2603:10b6:5:11a::24)
 by SJ2PR06MB9543.namprd06.prod.outlook.com (2603:10b6:a03:554::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Sun, 29 Jun
 2025 16:23:47 +0000
Received: from DM6PR06MB5611.namprd06.prod.outlook.com
 ([fe80::c8d:e215:300b:3ccf]) by DM6PR06MB5611.namprd06.prod.outlook.com
 ([fe80::c8d:e215:300b:3ccf%5]) with mapi id 15.20.8857.026; Sun, 29 Jun 2025
 16:23:47 +0000
Message-ID:
 <DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com>
Date: Sun, 29 Jun 2025 12:23:45 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tim.j.wilkinson@gmail.com
From: Jean-Marc Ranger <jmranger@hotmail.com>
Subject: [bug] spi-nor not unlocking on Ubiquiti XW and WA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::22) To DM6PR06MB5611.namprd06.prod.outlook.com
 (2603:10b6:5:11a::24)
X-Microsoft-Original-Message-ID:
 <f890d26b-becd-487f-9e85-de83774c341e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR06MB5611:EE_|SJ2PR06MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: a39d7094-60d7-4a78-21cb-08ddb72952fe
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBvsNaXt/Bpj/0zkJZybXdcFBUadlOEttPssaUxsQGUvnTh4ckQYZ3Lk+bZD8jZMF8QugTiAKtUcVE0kBJD7RHDyv2QbFd6EhE1kmkk22CM792azWx143TaVDOx/0xr1YFrz3TBsKJsqufT9QPZ1MD0cQqmxRYC3nUJZmTQ5dgQOcjFLklGCxvO9AcXpGABQ06UZ7SDUA+Q1Ev0FvxPkRHJg2uMvhnqO/s5cRyTBWnRMFjV01YHO2Nw2VvofDFJ4n+4fiI9Ws0J1b7ZzGSOgH94UZsz1z4i25QjZ9Z7aG8P10MgzYI6BqTvBCVXl3I5TJp5seQXditx86tppp+y5oGjBRBJZWwo3CdXpLBys5QZsyInbaxoqDL7FYsbCqBR3zZO/faBfTCFp+G3ayIV3+ZmwXr3s0VlVBVl+6SE9OVlSXiS6jFh6Q+loGC1c3y1/C9LYYCvq54nwhnum3hf5xur3zApIthfMAkQiJsYw+PO5j6loPuHRQpIvEX10p8Z8j0fDbAneiMpzCBTY6Lholg4SS5NBn5iL4+PguioxcIzDwP4oAPG6gXBMytUD8NGHhcefXh63usEXvf9e+I5U6H0Ft1iB+3hoToPxHHIbnoEv9NpGc0Hs6Z+FN3rsG2DTGu8dEJK/I7EZcGuKRzsx15pS/u7wJgzLRzOd5GFJdPyrFF5LnWbtQWbuihLv8HfH5MTLkgNxLkaNCZ5q5rYtK2S9lfUOMLbx3SPQFIh3RsupwHLxHjecUV2Jc2GDhcYMUS+7oMgg3Or8Wrll+HvAcwvJ
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8060799009|19110799006|461199028|15080799009|5062599005|7092599006|5072599009|41001999006|40105399003|51005399003|440099028|3412199025|39105399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z053d3VzZU1MYUJJOEh1eUtEaVJIRXVjbWlsR2JzS25iS1FzTWgxS2pWRHBy?=
 =?utf-8?B?RStUNUpxK3NkNXUxVjc2S3FuRVlzTlVoTVFNN1JhT1B0TWhGR2dZbmVaUytI?=
 =?utf-8?B?QmdraDA3VzdsdzZON05BRDhTTkcydzNwVEIxZ1BXWENCR2c3MDlTR0FRY0E3?=
 =?utf-8?B?NFk3NG05YzkzTTNWejl1azc2VGF1OXpYblFHM2R0bzlob2p4WnpmdCtKR3N2?=
 =?utf-8?B?UUtQUWFENUhhTkd5UlZjTGFXM0dwWXRXWWJTLzVaS0s5UG00OERtc3NKa2sx?=
 =?utf-8?B?Tmd3SHVBUGFpcnBOSWdBRDF5UFhoYWk0YzViajhjTHNja1FzNDJFTmU1NkdW?=
 =?utf-8?B?YzE3OSt6T0p6aHExVmhIc1hobUttQVkvb2VMVHdsN2N1S2dubXZXSHo1MFJQ?=
 =?utf-8?B?blMrbUNGMStqVGpHbHllNHBNSGpVS084R0R3M0pHT0dSaW5kd3pwcStwUEJk?=
 =?utf-8?B?NjhTczUrTjVoUHYzV3M2d3Byd0lxT01kaFd6QkNZd2prZHZEZTFaV2l0TExj?=
 =?utf-8?B?Mk1XcjkvTmh2SzdmS3NvS0V2blFtcG9pQUVKcU5pdEdyZmJnQmM0dzNFbG8v?=
 =?utf-8?B?RS9wa3ZNblgwSjYweVNYYlFjUzlVRDJ4U2s2NEU4dGQwK0N3M0NlS3VFaE0x?=
 =?utf-8?B?eFFIYmVPcEh4WXpIZXd4MUhGOFZoRlBHTmtTVjZiVWJoUERKRGhNQ1M2QmNy?=
 =?utf-8?B?dkdnZHVzU2Fmd2t0U2NWbElCd1ZWQW5VMmk3VFh6MXhjV3IwNTRQYlNseDFm?=
 =?utf-8?B?dTE1aklwV3F2TkcwMXhCdGRxckpTbGJreSsvRzliSks1bnNsWGI4QVNIWVNX?=
 =?utf-8?B?VzUzM01MOEVTd3ZiaGlhM3Jac2VDL3pES1o5T0ZZMCt1ZHU5enJDOEhZZStj?=
 =?utf-8?B?TjdaV1Z5ZHJNcXlvQ0FUTzdjeWxsVlh6c2pSWUlxRVFiSHI4WFc0bTBpY3la?=
 =?utf-8?B?MWc3OHFSZWxYTmtSazVzR0FoZFpWeHdVQUE3eDNtZy9jcGJCd05yMDVrdW9q?=
 =?utf-8?B?dzhHNmZJMUNCNlRoNElSdnFBajdnMWlRT2hVbnluVGJJOUFUdEZDSnE4N0Ur?=
 =?utf-8?B?V0U3R01KakdiSExGcEt0eTJRSVI4VnlMSVR5cmxwamdLWENzZ2Z1Z2h2R2ZI?=
 =?utf-8?B?QTNLYW5pQUhTRHhsTlE5Mnp5TGZDSFRYeHhaOFkycStSOERCbVV1ZXhsaDF6?=
 =?utf-8?B?YkhLMk5tV2xaN2dQMVdHejRYRUJvU2lRZjc3RzlySFFoYjhmVVNPc21ILzZ2?=
 =?utf-8?B?cC95djI4dHhZdGd3dTgzck1Vak1rQlUrZnowRkIwSTQyaDF1c0sveDJVZEVo?=
 =?utf-8?B?YkFneDVFVkk2T1VaZWE2OFFlNnBaVmgxcVd3bk5XVDZzTmlxWmdDV3lDSUFU?=
 =?utf-8?B?ZlczRW9yQlJPTjVDRHBtZENuMHBiKzNUQVcvNnJFRHQrOGhLaWYvenhXUG1I?=
 =?utf-8?B?NE9ZODZUVjJibk41eklWMUZHcW5DUUtSL0xHSmpiQ1ZBQUNNT3gwb0owd3NM?=
 =?utf-8?B?UzBLVGdJdjVpMzdVOWlRUnRZMFZ6cnQ1RGxEQjJvOHJURzRKZ1d2c3RJTTJs?=
 =?utf-8?B?VWJmV0YrRUt1UmpuWTE5Q2ZOVm1SR0FoMk5KdWttNktmU2MyYTBraEU2SWJi?=
 =?utf-8?B?elVFd3pyZ0MyTWQ3bWFtWloyb21zUHU5aW1McGY2Z1VELzUwTXVHcmdqYjdR?=
 =?utf-8?B?UEdXUGtHWkRMbDh6Z3QyL1RLYTZxUzB2QU1YS1dyYnYzaEJNUDRDeWdDV2F2?=
 =?utf-8?Q?sJtTVVkep4tgbeR60k4MMwc3ZuvaMwkcMV4TCsi?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFd0MGhrM1BJdVNaZUpPK0ZXbWRLN1VkRjZuWm0wU21nSHhRNzRsQ3VJYS9E?=
 =?utf-8?B?RTdYNVNGS25SdWhaMm1QM2xzai90UElBQnJzNkJuL1V1QTIwbVFvYWpDME1P?=
 =?utf-8?B?Nk9zcDlWbUpvSUpnSVBjZjhlbGdMdVUrbmVBQ0lEbytMVUx3dzMxYU12eDJP?=
 =?utf-8?B?YzJzdUNZdzZnNG1uTlhmaTVZYlJkZVFqS0gvc0pNckNYUzJvZXpCeEN6SGpD?=
 =?utf-8?B?bFU3blFDSnJnK2NoQmlTeVdwN1VhWXdETjFOYlhMQW9NckowZUNvLzZpWFV1?=
 =?utf-8?B?QXo0bEU2MlpUbUNmZFBqRGpQbU5DVGh0QTY5M1RDTGtIUytwWWtUSS8zOVFN?=
 =?utf-8?B?bm9OMkN6azFjcDdqQTFhaTV1RUtKL3lMbkZuWWhmcUd2YVVOZURPMXVic2pD?=
 =?utf-8?B?NDladW9sanJycHc3R2xGRmF0Q0VkRS85K0FwQU5qSGFOWHFtZlNFQ2MvQkVl?=
 =?utf-8?B?YjdZUFk4YWFPLzAxbEVKaHFUeEY4R1FlT1ZpOHdIRHN6Yzg2eEZOQ3JRNVVN?=
 =?utf-8?B?M1c1djdKLzJ3aUtqbzhod09tUkdVazlMTURqMFJWM3lUM1hJMzY1UmthWHJs?=
 =?utf-8?B?dXgybEdWNXllUHB6R29xeW56UXl3VXlTbXNaSFltY29QN1pVUGFUcTFodXFu?=
 =?utf-8?B?aFJYOVE2T0xBUENJYi8wbzVsdVZVUmxtVGUraDN3eU1GaWdiaG56STFraDZT?=
 =?utf-8?B?eUpyUTBnSlVJaTM0UWsvNjkrUzNuc2xZb2dqQ1lzTmRUYmYyTW1tbHE0ZDR1?=
 =?utf-8?B?cTJic1Fta1grU0Znd0lFSlJLbXlZTmo1ZVZMZVlRaDRTdktpUXdSRDlhQUlR?=
 =?utf-8?B?KzliNk56aGZYVXU5YUgwV25aWEVjSXJDN0NWRHp0N3l4d3B5YkFpd3NIejdz?=
 =?utf-8?B?QWlKNGlabnhZbElWb1ZkM1A4SkNEZkhxN1VnTTkwdGhVOFdHSDl0YzU3Rktl?=
 =?utf-8?B?Rzd4SURFcWpQcXlDcXlBdVV4UTBpZGlwL2lET2JRWlA1OXNPMmV3UTZtcENX?=
 =?utf-8?B?T0NYeWtuazJ2dHR6Q3lmOFMyN1JXcjJhVDFvUlhoRWUrbVdaRGJWNWphVEhi?=
 =?utf-8?B?MDg1RnAzSjZ0L3dybzU1QWhPWjJFYjZlYnpNRzR6TEs5V3RxYVZhSCtOSXFj?=
 =?utf-8?B?OFQ5Y3NuMjdLcEJoZTRRaFdTa2Q3QjB3UTVZeXEvdHl3dXMxNkVwQkFDYlpK?=
 =?utf-8?B?emVpVncvM3JKdG9lOWlVVWNDcnFmN3dJSzVzZ1l0SFQ3Sy9yVklhUEJTeUJR?=
 =?utf-8?B?dVBwNVp1R0J6eWcrU1RSbjNtbXEvdW5kc0EySVQ2eVUwWjNEY3FKZHRtN0Jq?=
 =?utf-8?B?cjZ4aDUyWXZIazNHREV1SzRvRDVXNFdHMkxoam1qMHFIcVNxdTg4V0lFOHNy?=
 =?utf-8?B?d24vNUxSRWFMU3dBQU9QM1pmS3pZcWZrSzR5US9XYWFqaEtWQ2dkTEpCNzYy?=
 =?utf-8?B?dHUxclBLT0xlOVpCTThCREk1Znk0b1Y4cU5oWXU1eTR3a3ZDZm1EcEQxYXph?=
 =?utf-8?B?T0ViU1puUUVEZ3B1YTJIbStPYTFEUkZLbzhzemtMaDljdllpR1FXa09hcFE1?=
 =?utf-8?B?eG1pclVmZUt1anVHOTFCWktORFJabm10cWhXVXRNVHpyNDBhZVpEbVFWZFBI?=
 =?utf-8?Q?NMDkwhg4SPaW9xJl7I6rhsF1TduNqSN02ezxoj88rLeM=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-a1430.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a39d7094-60d7-4a78-21cb-08ddb72952fe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5611.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2025 16:23:47.2810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR06MB9543

Hello,

I'm reporting this as an user of OpenWRT 23.05 on an Ubiquiti 
Nanostation AC, who hopes to upgrade to 24.10. Currently, upgrading 
results in a device where no configuration can be saved. Recovery 
requires physical presence, on devices often installed outdoor.

The issue has an explanation and a patch (for kernel 6.6) has been 
available since late 2024 [1, attached below][2, which merges multiple 
fixes]. It has been used by others [3] and myself. However, its author 
believes that it doesn't have the correct approach to be upstreamed [4]. 
OpenWRT maintainers are waiting for an ACK or better from upstream 
before applying [5].

Is there a way to "unlock" this (pun intended) ?

For reference, OpenWRT configures those devices with 
CONFIG_MTD_SPI_NOR_SWP_DISABLE [6].

I'm available to test, but:
- the only device I can use is a production one
- OpenWRT is still working on upgrading ath79 from 6.6 to 6.12 [7], so 
I'd be limited to testing on 6.6

Let me know how I can help.

Thanks!

Jean-Marc


[1] 
https://github.com/openwrt/openwrt/pull/17287/commits/c98a55f95268f109911c5fddf5a153cfe3565b74
[2] https://github.com/aredn/aredn/blob/main/patches/006-flash-fixes.patch
[3] https://github.com/openwrt/openwrt/issues/17285#issuecomment-2946978832
[4] https://github.com/openwrt/openwrt/pull/17287#issuecomment-2558569582
[5] https://github.com/openwrt/openwrt/pull/17287#issuecomment-2558502454
[6] 
https://github.com/openwrt/openwrt/blob/bb59922007043c0a0813d62b0d9f6e801caff9df/target/linux/ath79/generic/config-default
[7] https://github.com/openwrt/openwrt/issues/16569


 From c98a55f95268f109911c5fddf5a153cfe3565b74 Mon Sep 17 00:00:00 2001
From: Tim Wilkinson <tim.j.wilkinson@gmail.com>
Date: Mon, 16 Dec 2024 09:37:34 -0800
Subject: [PATCH] kernel: Fix setup of flash chips which must be unlocked
  before use.

Setup the mtd information for spi nor flash before calling running
the nor setup.

The current code assumes the nor setup doesnt make reference to the mtd
information. There's even a comment to this effect. However, at least
when flash chips must be unlocked, this isn't true.  Consequently, the
unlock code will fail because it makes reference to uninitialized mtd
information. This failure is silent because the bad mtd information
claims the flash is 0 bytes long, and so there is nothing to unlock.

This patch moves the mtd initialization before the nor setup, so the
mtd info is available.

This fix has been tested on two different Ubiquiti devices - the
Rocket AC Lite and the Rocket M5 XW. These use the mx25l12805d and
mx25l6405d Macronix flash chips respectively.  Previously these devices
had failed to operate correctly as it was not possible for any
persistent changes to be made once the factory build had been installed.
With this change these devices behave correctly.

Signed-off-by: Tim Wilkinson <tim.j.wilkinson@gmail.com>
---
  .../436-mtd-spi-earlier-mtd-setup.patch       | 20 +++++++++++++++++++
  1 file changed, 20 insertions(+)
  create mode 100644 
target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch

diff --git 
a/target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch 
b/target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch
new file mode 100644
index 00000000000000..da75e9f7abfe96
--- /dev/null
+++ b/target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch
@@ -0,0 +1,20 @@
+--- a/drivers/mtd/spi-nor/core.c
++++ b/drivers/mtd/spi-nor/core.c
+@@ -3540,14 +3540,14 @@
+ 	if (ret)
+ 		return ret;
+
++	/* No mtd_info fields should be used up to this point. */
++	spi_nor_set_mtd_info(nor);
++
+ 	/* Send all the required SPI flash commands to initialize device */
+ 	ret = spi_nor_init(nor);
+ 	if (ret)
+ 		return ret;
+
+-	/* No mtd_info fields should be used up to this point. */
+-	spi_nor_set_mtd_info(nor);
+-
+ 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
+ 			(long long)mtd->size >> 10);
+
