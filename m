Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42323E337;
	Mon,  7 Apr 2025 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032058; cv=fail; b=Ko8J/kOMoYarDtZLSSnRZk5RGxDPd8+rc0/yI6gNZIFw9wN0qm7gVj/atJNG41yeRbZcs3UXv+D/r1/obtCZPrG3p4PdbpBzjM3Z5Ba2WOk0+nNjiy4F1Sbtq9tf8IZLLGgv8nYNeEgD1v+Gqi8FQObEkyTZ/rwYzZePLpEj39U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032058; c=relaxed/simple;
	bh=9saPgsFApkJwDobmerjZ4baG0UWuXogQQpNP1qhirWE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QbM+/aCO1y+Ymoix9X5dtrvcj48wEnrlJ/sHY4Tgb3FBop/L7Z0+YcGWgL1slDetXOb7VTAJ7SIShHBGewkXgMzqFRhR7YeN0oPciUV4rb3NXEN2iW09+rAPCuJ1xcLCNnAWmviyqhtgeKApYkyIXLW8ZFdF/d51jBW65Q776Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oyAcm8bd; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oyAcm8bd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erhoSBzvxbOzqdbGfYIQjLRYEurHetVXfVJ+nGxvFqs4KU5SGbtpwJGPwXgj65Wh1/cvM7NgdmhH28auD/n1GhcWzYHqap5jE8Tud0pLK02DBPttn0aOY2TYeU8CsowTDTNcIkR9DV7ZxLFpfACcQRYhnLdivugH70n4a78cLkzOx10Dn1LYWX0XC3EHS8JbbLSYawqCzFJwdsHbwDdJLbAUm1W7fOhgVsFAAG8lHdfDgc+T26+f5a4uGocH27UEJeTf2Qtp5mvJSbC50a4zJkJVOZs7rtl22v7bkQvTE7CILV28sRxrI+w/baNIuWgfBmgrWfBAjcOgB198QLHJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV/exWGnZopebOnSLHxMJ7NX0MTUeABNpB5ZdGYKhlA=;
 b=QHNME6t+eynMrO9JG7V6eWxDTOh9Ar8dD6a4S61u5hlGgUAVCzLns20KK1mB5EHIELOUkZZoFw1hKiebHnsbyd5DWRGVH3ZfMSEX23vvWpUm02iium8R/5/9DSw2TDphXld7WkVP1IZGl7eJbL1C+kTLjDVjTDN+8DwiiuH++Z0CbbNZ0rhuSmsVFd0eDx5Twciv/d++KIVboqGxOu9nB7+HhZMv3XeqhqBE4ubabW5lMToMC6J3snj3vPULbvXBi4U+iMvlqPMGwY57/6rxX5eFN7fkjWR/611FpFvCRgy94N+WxMo7Hlw7LpxqlOZu3m7Ju1OU0mquNzMMTEWfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV/exWGnZopebOnSLHxMJ7NX0MTUeABNpB5ZdGYKhlA=;
 b=oyAcm8bd/IRkNJsUvUK3xVYgNJiHlVVqNnv1nDCTuXjjBaVe6eN6+RJZF+p0wOoUg4H/8kx97j4ULyoYxYMoQb/IUOP1VKhkMeg1b33YSwUbgK2r+skD68TFTFc2pTphDCpWON34Fqn3be5dWCNaPAYSCdHy8dAPohaGPwy5Sgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 13:20:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 13:20:49 +0000
Message-ID: <195e5df0-d044-4d7a-afa1-4361c760c1f3@amd.com>
Date: Mon, 7 Apr 2025 08:20:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
To: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
 Christian Heusel <christian@heusel.eu>, Patil Rajesh <Patil.Reddy@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, "linux@frame.work"
 <linux@frame.work>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <ae644428-5bf2-4b30-81ba-0b259ed3449b@heusel.eu>
 <BL1PR12MB5176333ACE3287786831B0749AAA2@BL1PR12MB5176.namprd12.prod.outlook.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <BL1PR12MB5176333ACE3287786831B0749AAA2@BL1PR12MB5176.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:806:20::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d6def4-c634-4ff5-0273-08dd75d70359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmU5bTRSZHY4SzNCTng4MVVBREZnMXVLR2xPVTJrQlZtMUIrQ0pWVHJhOVUw?=
 =?utf-8?B?SHpTOHR6YnJnZEQxVWhWZXVUbkZvRTMyL0NHNXZ0d2hwMm5ERzRWaEdqaVpv?=
 =?utf-8?B?MVBqaWJrY1l2elRCdTFGMkU2VTcrME9JZG12L2RmRmxVbEpUcFFtVUsvUlls?=
 =?utf-8?B?bVRRQzdoN3JhLzB0d0xhdXRyQVFSbXRkbEtJd01jTDNwMFk1WWxrdGtTcVAw?=
 =?utf-8?B?R0l6NHUxaXBpRTRwaW5SYm9BRU12ZStTK1YvM0JiREdRZ3BJYjNISTF2Ylpr?=
 =?utf-8?B?bXpjYXZrYUJwN3pLcERBZ2pXY3RleGUrZWdUQWtiTWY2ZVl0L3NtYUNVaDJq?=
 =?utf-8?B?YWoxRzVUYVA2VkdhcTQ0ek9UYkFlaGkvZmFLc3k0QVR6dmhkVmxodU9QdjVE?=
 =?utf-8?B?SWZJRkFkQzZCWTkvdEs0eUdZN3RzN1FPMGR5OGk5dU9uUUpyNjFlaXAzK2xm?=
 =?utf-8?B?bDFwRjNwWGg1bW5CZVBWK3UrZkFnM3JPM1A4UkZlR2VScC9aSzdiQ1pzSjdn?=
 =?utf-8?B?QWppZzdYU3Z5RlVLdjZJaGsraTFtMDJUQ2htZlNqWVJDQzd5TFVYSWFCZUtS?=
 =?utf-8?B?bDNYMHNVV1FuYW1tdUZOSGk1VjMvTDFqQmVrcmwveklDbEJmYWgydGlzU0Jy?=
 =?utf-8?B?TWhOUFIrRW4vK1JwSVBKaVdSUWtvZ0ZNZFlyV0tBUUgzSmErTHRqeHRKdnhG?=
 =?utf-8?B?c20rbjhod1VqS0g0UGh6MzVEZkQwZmZNd1Q5QTRqT3NBVlAzMXRzc004NTB4?=
 =?utf-8?B?K1FpVE9ITVdQNUdsQ24wYW1hS3l3Zzc5M0w3bC82SXJBMzlWUEQ5Tmk5WnhQ?=
 =?utf-8?B?TTdBcGhpaWppcnExQWozQWZxNm9aRnI3aWVHazlzMWg3M0hhMzRIYWRNNzV0?=
 =?utf-8?B?SlRVWXlKejMzSWE0MTIzbnVtbWlIWnVzeUdQZXQyV3h0Q1kvbDVlSjlveno0?=
 =?utf-8?B?dllhZjI2aU44cUJzU1RxUEZKWkJMclA0eFpsMFdESFpuQ0xvNWZtYmZuVXpJ?=
 =?utf-8?B?QlJ5VGNWaEVQTllndmV1V0F1SW5oSlY5TXBTSWcvVVZUUTdRZWlza0cyQWZz?=
 =?utf-8?B?SXI4S2xSVThkL3MxV2w2WjNtd2kzR2dOdVNiM0FldVJFbW40dnZTSjdNcGxE?=
 =?utf-8?B?eUxIZ3drV0hTTTE2dFF5eHN3aklUTG9mMkRMd2s4dXduOGlTK21BTEtiZmQ5?=
 =?utf-8?B?RzVvTnkrMXEwK3dqRGtNVDZjWDVhUnBFamsySVh2OTZPdnhvZTlGeDVlVW0y?=
 =?utf-8?B?NGd0VTl1Y0Vlczh2cWdHRXhxQzZZQi82ZkNFR2w1ekREMmdKWEZnSXNYQ2hX?=
 =?utf-8?B?VFRyNTNFeGlTakprM3ZzM25vYjU3YXEzMStpNVpmMU05Mkc3Z1RDYjkyUTRl?=
 =?utf-8?B?RXdQOWN1VTRFcnpXMXo0RnhHVjNybituQ0ZMVndOTU5yV0lQTHV2UlIwbGE4?=
 =?utf-8?B?d1dtamlKZkJ4RFYyRmhMNXJqK0hCZlhPeXZSQk42NGpuaGE0cmRZU2I5eUkw?=
 =?utf-8?B?N1BjTEFxbkVhbFJOUnRqZXJnYjNMenU2M2Z4Y3V1U1pqeGt5NnBwK3VLQzZm?=
 =?utf-8?B?eitLVFRlcGRxV0w1S1pxT252TFdsaEF1K2cvbTFBMndPdmF4REpYT015bnY0?=
 =?utf-8?B?V1V1eXByVk9jWGljdTZZL0txK3BXYXNsQTErR0d4cjFIaGM3SmZRZUc0R3B5?=
 =?utf-8?B?dlV2OXhFY1NUUmR5OUdMTTFmaU0vQnBqZXpIckE1Uk1ITFpaVGZsclc1MEhN?=
 =?utf-8?B?N1UrL1d5VUxxaXNSNWg2WFFTQlZJYmFvczZBRnFlcmhuL0orVkVMbHhYU2po?=
 =?utf-8?B?T0pYSHRJWUlOcWJTdWh1MzZPc2dWakNVc3dpSEpKU2ZmKy9nNUFHMzlvZ2h0?=
 =?utf-8?Q?FEtu5YmDCf2kl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2NnWGV0S1ZSOVlrUUFITHRBZ2psQ3pZS0R4anlqSDE0OXdxQnlWOGUwSHh6?=
 =?utf-8?B?U056RHl6NzF6dGNZTmdIcE9LeWRzZkQ5dXN6TTNiUDhaS3lFZlcrUUJVZmFy?=
 =?utf-8?B?bkdKbHQ4TkNCK2hFbTNlN1FYOGlCdFZabEV5MDNiZzNuSHZxbzRRYTBET1ls?=
 =?utf-8?B?NlF1VW1yM05yVDN3dHBCczdFQys5LzFLS3RqbDlrZ0xvelY4UklEWTUxOE41?=
 =?utf-8?B?WitJNk0vUUN3Q295bEhQUkxHSkk3Y2NjTVUydDFkN1Fob2MxRVdMYmpTSzVv?=
 =?utf-8?B?NU8zM0dOOGRKcW02ejF6Y3N1cFRoOWp2OUw5SmNLQ3RVcmM0alo2S2pyZ04y?=
 =?utf-8?B?T09hc255eG5hMkFuVjFKKzNzbGtXa053eHJzUUduenBKcFlMaHhiMktIQW5u?=
 =?utf-8?B?QUxlZDJDN0g3RHB1RHRKNGt6NEpSNWFkeWxLVUpiVDBwOFB3c0RVcHRBRnpT?=
 =?utf-8?B?Si8xNXZpSkVCWXdYQWxJSDV1MFA0WjlJd3ZwdFQvQUZpQVM3c3dzT0VzYnh1?=
 =?utf-8?B?dnQwWUZpRkFWL0JoUnEwby9iTUx1ZXVvb0FiUyt4NUpqRitUK3pYaGRqV2li?=
 =?utf-8?B?MGJXWGlkY0ltZHArb0FqVU1vYzkxSkpGZFlqcVY1TkJiVmJYRC82ZDdFWnFy?=
 =?utf-8?B?K0VBblhyN0dBVU9iVFN3Mkp5blRhZk5ZaVNTZFdHZHRPMkRtYk5SdkMzNW9o?=
 =?utf-8?B?eklFallKTnVmRk1FQm00aVdaK2thTlJldW40cllCUG50dndrSGNIWS82Tm9P?=
 =?utf-8?B?cXhITlB0dERXRXd3QzRHT2lVSWpiSERac2l0SzhBVlA1ZW43bk12N08rKzV2?=
 =?utf-8?B?bGNoUmxrT1RoRlMxV1BObWQ3SkVGK0dNR0pxN29tUCtHUUFXMkdnam5rY0dP?=
 =?utf-8?B?enJPczd3UVk3L216NGhBRFA5QmtsUC96OFpseHh3UUF3RERJQjZPQkFGSDBZ?=
 =?utf-8?B?Wm9VempZZlVKQzJKdDV2MUtDSWM5WjVVdzhXcGhTdjJXdHhDOFhoL0I1aklp?=
 =?utf-8?B?dlFHRE0zZkYzaG1XL0hrOTlLTFZXdURFZ3hhVFhNdk5DeTJaZHZ4K2YvaTgy?=
 =?utf-8?B?bEtOQnBwKzArZU9PNFR6OGZtMFpYaTJVZWJoU0JrUkc2U2trZVdIeEt6aEI0?=
 =?utf-8?B?d25DeVdnQkI0MSs3cXhHSmlvZktHVk9GYUxYdUR1YjJPQnNiMDZCWVNRcmtS?=
 =?utf-8?B?dXJaZXYxc2t6WVhuYVZWQy80ZU00MzUrOVI3d3ZpNS81amFwR1VHcWdxL1Qv?=
 =?utf-8?B?THZQcTU1dWtZTUwyYURHZmszODljb05idW5UWVlKYWpieU05TTNnNktIci9M?=
 =?utf-8?B?WittWnhlbjFPWDE1VTU4QldkcFpiYlpnWVRwT3BoV1hoTHhveXhHcVEvNGpr?=
 =?utf-8?B?VFdDR3hnYllPR1NGK1pobUh5cjFrTFVkejBQRDFkUUFBeHNlazJzM3FTaXlu?=
 =?utf-8?B?dkx1bG4yallkY1JJSldRVldwQmhyMmp2NkIrVmV6Y0lzVVVlOXJrKzZoUHVz?=
 =?utf-8?B?Y25TT2d4aXgxcXZSM3hNb052d205cFEwT0NleWlML2xuNWgxWWRVZEttL2JP?=
 =?utf-8?B?WjZTU1gxZEdTWWI2UVV2K1F5OU9tTkdaeVFzcVBSSDBad1B0R3dBODl5Ymph?=
 =?utf-8?B?TzdidmMwZlVmQmplejljQlZSMk1NeVNETGRSOWU5SFBHUmhXZlJiWXNNdEJl?=
 =?utf-8?B?MDJXN1hON1BudXFFZTJIbnNJcEhYKzAwa0lmNGFLTlJNR1lKYTdZdzFtN3Nt?=
 =?utf-8?B?WjV0d3hmSEdqcmxvbGpIWC80Ny85d2VKd0NwYUZLTlZPS2k3bUo5RTIycmxY?=
 =?utf-8?B?bTNRU0NlYkEzK0dwLzh0clZtQUdVSkdnN0tXVzVUK205RDNXSXZ4Z2tQVTlF?=
 =?utf-8?B?a1FvR29NSU9tak1aL0tHeFRsZTNGWkIyN0lJOXlYdVVuQzVaYmVNY1BoalJP?=
 =?utf-8?B?NlVrbnRwV1Nvc0kzdlZKeXlJVHRESkV1cm9rVDAxT0FqNlhLUVlUQlRtK2Mw?=
 =?utf-8?B?OWF0WUJwK2x6SEIwUWxXVFdseFlwMnhndER4ZktwYTcvNzQrVFgrdHhVcWZq?=
 =?utf-8?B?RUhOdnNqaitnMTZPTG9EaHdVbkgydjFQN1BZTzRQdUY3RHpVZXQrZjdENWtD?=
 =?utf-8?Q?urulTLh0T6OedhN5whzVv8Eei?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d6def4-c634-4ff5-0273-08dd75d70359
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:20:49.3239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk6kQExPk33Ql/iyFFmfW3c8QvhU01VudER7MDzqyqIlrR+cPGuYnn7SVG+TS7rU3o3SGFgjSqbFfTaDIjAFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785

On 4/7/2025 1:36 AM, S-k, Shyam-sundar wrote:
> [Public]
> 
> Hi,
> 
> The file "f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin" is missing from the "/lib/firmware/amdtee" folder, which is causing the issue. This is because there have been some last-minute modifications to the TA firmware, and as a result, the firmware has not yet been updated. I will inform you once the updated TA firmware is available, so you can provide your feedback at that time.
> 
> Thanks,
> Shyam
> 

FWIW - this below error is noisy but should be totally harmless on the 
Framework desktop as well.  AFAIK - BIOS on FW desktop doesn't contain 
any PMF policies in the first place.

> -----Original Message-----
> From: Christian Heusel <christian@heusel.eu>
> Sent: Saturday, April 5, 2025 00:50
> To: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; Patil Rajesh <Patil.Reddy@amd.com>; Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>; linux@frame.work; platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; regressions@lists.linux.dev
> Subject: [REGRESSION][BISECTED] Firmware load error for TEE on Framework Desktop
> 
> Hello everyone,
> 
> I have recently noticed an issue on the Framework Desktop where the following error pops up in dmesg after upgrading to any version beyond
> v6.14:
> 
> [   12.136102] tee tee0: Direct firmware load for /amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin failed with error -2
> [   12.141252] input: HD-Audio Generic HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.1/0000:c1:00.1/sound/card0/input8
> [   12.141601] failed to load firmware /amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
> [   12.141843] input: HD-Audio Generic HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:08.1/0000:c1:00.1/sound/card0/input9
> [   12.142005] failed to copy TA binary
> [   12.185200] Failed to open TEE session err:0x0, rc:-12
> [   12.185202] amd-pmf AMDI0105:00: Failed to open TA session (-12)
> 
> I have subsequently bisected the issue within the mainline kernel tree to the following commit:
> 
>      376a8c2a1443 ("platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA")
> 
> The error is still present in the latest mainline release 6.14 and sadly testing a revert is not trivially possible due to conflicts.
> 
> I also noticed that there is a commit with a fixes tag for the one we have bisected to, but it's included in the same release and therefore does not seem to fix the issue at hand:
> 
>      5b1122fc4995 ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
> 
> I have attached a dmesg output from a good boot and one from the 6.14 where the failure occurs. I'm happy to test any debug patches or provide more information if needed.
> 
> Greeting,
> Chris
> 
> ---
> 
> #regzbot introduced: 376a8c2a1443
> #regzbot title: x86/amd/pmf: Error on firmware load for TEE

