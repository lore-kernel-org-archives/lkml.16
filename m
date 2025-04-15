Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E360E23D2A1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744208; cv=fail; b=qJ50ZbkdzAuz9IEl0YFqRA6HyalKxmF74a6zbXT3UAeb7F4KcubuJeNPxf89Vqya3cfFBcKGQ0nvRO8ulnIGijC82GlKMLww0tCmgXAwPuGpZdXvjMjz/OxuCwAu52SNfzB6myt79FJ4KE5qAXHeUILGdTH5pnrzk5pLcdyRGdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744208; c=relaxed/simple;
	bh=EAMEYmp9hz3zJLrI3PEjpT464ILIkSFLhr7QboEtQR0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K+lSXeMPTU5jHZIue7N6ne23SqcWMWKALSa5a77n2eqcCj8qJ4YNSGBCzG1EvQdPkgMDOIRuN8fnrEttdCQkH6ru/P8fv5xaWTmv5xa9I0rakTR1kw24TILmE3X/v7Zo6mWacj8fTi+3ZiT4wgcPN28XKqybxS4RYDZyjLYjuXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rW805vjR; arc=fail smtp.client-ip=40.107.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rW805vjR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbbiKrKCTUgKb6e6a31dx1JjTd8QIFNWGcXo7czfzoFTjd15PggI0C1Rf04Ebgl6v2662q0AmTS1Np0rk4hzQ4o4nEV5SoFw9nWjaB+17rPRC9jiyvu4c837qaCguIFZJEnzg8IV05gYWlaGGhs+0MDWiY9dBBhIGDC5uvg6zf8/PZ5XWIdtt1Djv1LVEz/g7KfySnuPUqhswGxcvkDHO0Mjz9WGR/RKF8SBKCnwBP3TTt8IsC0ATblqshh/GP8j3hYvZhjTcCXWD5BL1x4iwFjcBULOR/EM+Me9QmsFvfPC9qr1REEqq9oE/ZNbwO1xSdN7WLY5YTbtaCb8ZAmRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKV99IJPGWtCLg9CwDW4HwElLn0b/QkR1SjY5hGMNW4=;
 b=OnvpWaFvEzWT3uCcnrbjvnRqUjn5r69aPCBsMZhAhjFii4GxmVGUIp1zzm1VgzZDjEzjEB9sA+7S+sgHK3ZUO3HzqWa+SpzdqRItIk8NJ9XGaVaBn/7FyksCj0O/vidMfMjV187sB09qKqTMEl68Rp1ArzqxV+vxOTzPRA4TS0OfSexDClG02A4YKhxNX3WuriY0cL9KNaC1yHDFj8uld7lp7q+1tFxjOtIgHAunDh5mynp0k4Q0D1KGmlBv3QyHCAXElB4Z3qWyoEywGaGryf1GX0bwuu6b0E/O9Dhz1TDEoBWrgkg+HFgpvCuZ0yLdSecvq/kbY5lE14VuXa7CBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKV99IJPGWtCLg9CwDW4HwElLn0b/QkR1SjY5hGMNW4=;
 b=rW805vjRaeBbHnat+7QvmNtsA9gdkCVo19tEhk17PGCHat3aurUZjAsf3lQ0LzaxJ5yvc9dTjQdhnE46ixB4YwRyjLbEVUk8yrCda+1m4z4pwHeZA4juZRdzytUvxraAkFftlJ/m+sSfq6il5W7bAgxQ1LI4TWBMBAz/NVCF+eY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by PH0PR12MB8776.namprd12.prod.outlook.com (2603:10b6:510:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Tue, 15 Apr
 2025 19:10:01 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:10:01 +0000
Message-ID: <a19f409d-3507-459c-ab1f-b28dc0cb021d@amd.com>
Date: Wed, 16 Apr 2025 00:39:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm/vmalloc.c: find the vmap of vmap_nodes in reverse
 order
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-3-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250415023952.27850-3-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::10) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|PH0PR12MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: b92c03cf-b0c0-4311-ebbe-08dd7c511ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEdwV0xheE41NUNKOGJSSnArSnVQVE14Rm1OMS9sTG14YWZxbC9QRU8welJL?=
 =?utf-8?B?VHVBOXU3QnZnTml5U0NQOFB3alJKdVdxaVJNaFN1aHZGR3BYcmVvb0FwRXpo?=
 =?utf-8?B?ck45UXZqdzZIVHNUM1hncXNhR3lBMng2S1pKbFFSakhjY1BDVVkwdTRuNndk?=
 =?utf-8?B?Y0FlRGN0ZGdkOUJaTW5pU0xqZno0enh1Y0RaUzlTVGg2dkgzNWxZRE5oVGlz?=
 =?utf-8?B?aHZidzhxV3JzSTRzWGhjVlFOTm1vSFhjRTZDOUVZUC9jc0VDNXJmVm81UVdM?=
 =?utf-8?B?aWtQQjNncmw4aGZ1ZUdGMU5RVHArNzJOUnFMcjhYd25vY2ExWXZHcDM0SEN6?=
 =?utf-8?B?Rlh6WGJNNUdhTng1aVFYaGdZRjBWRzBXTGNibUpjU3NibXBoUFlTYm1xREtr?=
 =?utf-8?B?eVgza2U1dEJnbGQ4SHIvTVFIbW9VZUhpMmFnM0dhdDIxTTZyem1pMjF6RFlL?=
 =?utf-8?B?V28zeloyWi8vWmE3aXB3YWNjb2hERlBjMFRGcjR0Smdsczdjd0hudnBKQ0dj?=
 =?utf-8?B?cWVyalEreFZiZDA5SGxGU2plV3Yvc2h5THJydGF0ZXJpZTR3UkliZy8xMDQ3?=
 =?utf-8?B?T2JGb3BWQThlMnZLZm41UERlNjVDRGlLTFB2bjRHd05WWUtZMXhsZWtHaGNO?=
 =?utf-8?B?RjR6VHM3STdxSlNSNzQ4b3lyWkMybDFGK043WnJuTFp4ak9WbEJaaC9lTFpl?=
 =?utf-8?B?Z01CZkRsdEZCSFZSa0tXSHFhWVJWSzE5eWhkejJwbUdoTW1wRG9aRGx5bVlG?=
 =?utf-8?B?WDE1NGdLN0tXTzdoUkNCSFVaVmM0TVlZWmpwNVdZL3EzRmNEWGM2WHRzTmEz?=
 =?utf-8?B?ei95MWFWMGNaeUFUbjEvTGIrV0JlN3ZlV1dWTTJVdGNjN3JDc0ZvZXpJdE9V?=
 =?utf-8?B?Wkg1Y212RCsrZG5qcXZ3bmJiZVcwOTZjZzBpY3Z3YW5Ic3VJbllONXRrRW55?=
 =?utf-8?B?Y1J6c0dnUTJGSU8xTkhKLy9IcktyZG5ycmhzSEcvUTd5U2EwUW5SdmZBT2dP?=
 =?utf-8?B?Z1hoeE14Vi94SjJ4K0Y3a05hTndSRisyUi9pa3J4TjFDRGhlQmFNUk8zS2li?=
 =?utf-8?B?UXRsRGNIaFFabndUMzlVU3QyeG1Qbi9sTGYzS285c282YXlRTkhGN3J3SzRi?=
 =?utf-8?B?eE5sR1JkNFJveGptZEtMV01SUFBzVzZJSmlnOEVUeTk0MERLRG5hamJ0bkF2?=
 =?utf-8?B?WllObnFUTWFHaVcwNlQ1Qi94bnhmNGtiQVQwcTBEdHFGOTVYaGlvaVUzVXgy?=
 =?utf-8?B?RHU2bjRvWHF3ODhsSzlESzM2Z2t5WFRpZDRJTURmeGdSMmVkbTBGb0tUN1JN?=
 =?utf-8?B?ZWFGZG5GL1RkTkNTY2JSamx6c2VoSnFmc3lUNW45M2NzVmtHdGFvdU5BcW5J?=
 =?utf-8?B?K2RDVzhzQWtqOGM3STVpZEtZaG55TFE1M0tMOXFycklxVnF4bk5RMnpBbjRN?=
 =?utf-8?B?UnZDeCsxcUdOUWIvbSs2d3l3RCtNMk5zSGNiaWhjVUUwcllpSG5hNUFQb1Zw?=
 =?utf-8?B?Uk55YXpEVFU5MWlRUGRxS0I5cDlGR0V0S2trZ3dBQWJESG81VWFLWEQ3MkRk?=
 =?utf-8?B?NVI2aFF2cmN0N3d0bTFHQ1orMXI5dFBsNGNYa0hqa2pjclRPMlBJZ0pFMzZh?=
 =?utf-8?B?c1B6OHJKdUZxTkoyNDFBNHRzcXJBRm9zNjRVMmpZQ2RWUXlNRFlVaXcxT1Ns?=
 =?utf-8?B?NDJmNWNvbnd6WFJzZlVwcDdhVGZrVnRCWDRWREZlQzFkVmg0ajVkVGZaZVl6?=
 =?utf-8?B?Q1ZrTlpxQmRoNXFqYWo0RjFFWVllVU1heGJSUndKdnNyTFVxZW94dXoxNEVr?=
 =?utf-8?B?VWMzQWg0UUdOdlJNK1JCUiswRDZRa0ZaWCtxQ3pyakNKRE02NjI0a2pPREZu?=
 =?utf-8?B?M200S1NHWEFoYUh5Uk1HM01aNXJib0J0bG4zd3ljMGFERW9CODRXQTRqWVh6?=
 =?utf-8?Q?fyyDHCYrvHY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnIwa1BsaU4rN29ROW9vdkFFbm5nSlNCUEZWT3I2WU1VYkNJTHZPY3IzVEd2?=
 =?utf-8?B?MDFHeHg3M3hiVHYxUlJ0ZlJCZHd6Skt4ZEJydFdidUhKbXhXVFRFNVVPOUc5?=
 =?utf-8?B?SVM5WHFOcUVtMUFZSU45NFlHQ2xBeklhZWppSG5FUU1xZGtUNUc1ek9ib0pU?=
 =?utf-8?B?blNvS2l5alBtbVI1NmgwV0xzVlZ2UWhHVEhxTFE2NmdWT1l6ZEp2T0R0UGZk?=
 =?utf-8?B?c0VIWkNBU0RZaUF0ZkI4UXluOGpxeUM2N2dLc2JmSGZ4OVhkam5xM3NSNk9N?=
 =?utf-8?B?VlV6N2ZVa3RoSUdpalpGWUl0b3NXMHFlRmxHT0NWUCtzNUhGaUpxcWpQN290?=
 =?utf-8?B?UFdtam5JS3pLbDFTVkRXeW15bWFNMlJZODFHZnl3TmV6dGs2SGJpTVFycnBS?=
 =?utf-8?B?L0FhSjZ1bTFjNC9SK3BMME1rV2VqLy9VQWppN0J6VklqUE83ZENzTklacXFt?=
 =?utf-8?B?TFRmd1dRWWRaUlZpaUF2OTVMclBBcGVyZmxRempUdE1xNkVqekJlUCs4elR3?=
 =?utf-8?B?WWN1ZjY3OCs0bEtmbzJzRUttUXJ1MjkzWS9zUmJMVk1LTC96Y0dWV25GTE5X?=
 =?utf-8?B?SzlXS3ZWcVQwK0NuUjUwU3lBVHp0d1JJT0R2dHg1ZklqNVBkMEl5eWFLRnZj?=
 =?utf-8?B?MHcxUjRuL3VaUFhoZEkxRU85cWZxT25FTytleWVDSWNUUmRua3ZFazMzOGlG?=
 =?utf-8?B?RUdCbXNWUmVOa3puNFJJc2tHKzN5ak1kK1g4bkIvMUgxYzNmY2gvWTZRQ0lm?=
 =?utf-8?B?Y0hXQ2Q4Rmg1RkxZQ2E1RUVEUWhaQVp4dmhULzRLMVFYNy9NaXlNVVhCTlVY?=
 =?utf-8?B?WGJhbXBBdzlrcWFUMVBGT1JjRWNFMnhLOGRjUzN0K0VibVNVMXBGbjBCRHNL?=
 =?utf-8?B?NWFTSGFyQ1lQSS85Mng1ZVhOUzZ3SjNZcW9OTlRrQldJOHdGRTJydk1oSFAx?=
 =?utf-8?B?SmFBTHZUL1I0UHRQWHlxQmlncUFkSlN2L0VSR0UzRzVoaUZFeHM1WmRFVFFn?=
 =?utf-8?B?YmRpTzdEa3puNWZHR0hyMTNBRmd3Wi9xRUNZM251YzMvSDZTdGZHM1hSYWpw?=
 =?utf-8?B?ZytJN2Z0dEV2Y3lqVzB6RHlUZEc3cDVsUmptazB0SkNmaHpGTG5YMHVWa2Iv?=
 =?utf-8?B?Z1E2VStIcUhxUy9aWWtyMnFLZFg0Wk1iMWxDWmxUWEswSFlnK3hlUnJXU1dS?=
 =?utf-8?B?alp5aFB4anVvMS9FMWJieFlxWHhFOTFPM09rbU5Xa0E5c2JGNGFwS21MZzdL?=
 =?utf-8?B?K0NkcEo2K1IyN2pCdDhpOXprVWcwZ09ZTUswZlRIYVhOMFlZdVZ6RXZ3d1cv?=
 =?utf-8?B?a3U4TkNVNzhUd2JXNm9BVXlKRGwxNklGb1BDdGVkamJNTVg1Mmg2WXpiaVh6?=
 =?utf-8?B?d3FBVDJFWlY5ekw2Wnh1T2p4bWJ3NUFOL2I0YkJDSjZ2ZS9Db1pFZnBRb0to?=
 =?utf-8?B?VW5waWhlYnRwSnhlMGYzN1V0c2x5d0p5b0JwamVuREUzbWhpcXlCN1VBVmRl?=
 =?utf-8?B?Q0g3ZVZFU0hDcjdvb2JvM3MwclM0dm5vamdubUxPNm1BM3F3ck5PNTFiU0ll?=
 =?utf-8?B?dklCNkE4M1pScEMycWRONjBiS3VCbCttdHNRTzlYRHNDcVc5UnFGSEdkd1hG?=
 =?utf-8?B?aS9scWhCeVpYZmRqQ05tYWNCSU10WnFkdmlZL216QjRoeTI0K3BlRUZjci8x?=
 =?utf-8?B?bE82TDgzdGFYQ0I1bDVlMTByQmRuM1MxYjhxZmp5SjRKaHpXSXNRNjRCVWJl?=
 =?utf-8?B?VHE4Z1lzckFJejlMQ0N3dDExZUh3eHFDSlhzd3lvZVJUS0txa0g4ZGdPSzVC?=
 =?utf-8?B?b1NZSHVPcFhYRUt0N0xsTFRIZTVRWXpoVkF3QlhiOFQxejNWOFJVRXJkN3Rj?=
 =?utf-8?B?TXpjdXFrNzlac095aENGcldadi9XQUZZZjJ4dm9lM2tWOUtCT3dWbUYwVHBQ?=
 =?utf-8?B?NzJEaE04djZyTVBHNG1IZTBVV1dSY3I3TVpab2hLZ21lTzV4TDJWM0cwTDMw?=
 =?utf-8?B?a0MrNDFyb1J3SG1uTEJFL3d1ckJEbnRUcllIS3k3TXZvaGFXU2cwczZWSVZI?=
 =?utf-8?B?OU5nTVNuQmxscEFrc0xQdC8vcklrTzVlcXIyVEU0aWRVWlhmam04MFg3MjNY?=
 =?utf-8?Q?9+TZF0kgU0AjfO2nF7GFHXY3H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92c03cf-b0c0-4311-ebbe-08dd7c511ef0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:10:01.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2w52v6SrlhpG1VTdROyAsfO0pR9w1dr1xCgZfnIm0LiO7kKvKJ6rnT1c22mOPLDxlKTwj+kP042mybu99SZQgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8776

On 4/15/2025 8:09 AM, Baoquan He wrote:
> When finding VA in vn->busy, if VA spans several zones and the passed
> addr is not the same as va->va_start, we should scan the vn in reverse
> odrdr because the starting address of VA must be smaller than the passed
> addr if it really resides in the VA.
> 
> E.g on a system nr_vmap_nodes=100,
> 
>      <----va---->
>  -|-----|-----|-----|-----|-----|-----|-----|-----|-----|-
>     ...   n-1   n    n+1   n+2   ...   100     0     1
> 
> VA resides in node 'n' whereas it spans 'n', 'n+1' and 'n+2'. If passed
> addr is within 'n+2', we should try nodes backwards on 'n+1' and 'n',
> then succeed very soon.
> 
> Meanwhile we still need loop around because VA could spans node from 'n'
> to node 100, node 0, node 1.
> 
> Anyway, changing to find in reverse order can improve efficiency on
> many CPUs system.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index aca1905d3397..488d69b56765 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2436,7 +2436,7 @@ struct vmap_area *find_vmap_area(unsigned long addr)
>  
>  		if (va)
>  			return va;
> -	} while ((i = (i + 1) % nr_vmap_nodes) != j);
> +	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
>  
>  	return NULL;
>  }
> @@ -2462,7 +2462,7 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
>  
>  		if (va)
>  			return va;
> -	} while ((i = (i + 1) % nr_vmap_nodes) != j);
> +	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
>  
>  	return NULL;
>  }

Reviewed-by: Shivank Garg <shivankg@amd.com>
Tested-by: Shivank Garg <shivankg@amd.com>

Thanks,
Shivank

