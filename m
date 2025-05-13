Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ABAEEA6;
	Tue, 13 May 2025 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747099164; cv=fail; b=k++qxNhz+ylb+0MXfBdri2MH/ctbrB03r33O0MeA826H8jGzOZ9YObigL2JhlN7xh8cf167Wp7dctEl3cnsq0AGLfMYnjrq4jWI+G35r5d2MyJgNLdG3kJuLyq1cWMxjayua9jMeWFpV6wrNRCOW6iQdFi7Cs5eKFiRJUXSN7Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747099164; c=relaxed/simple;
	bh=JMIv2xtP7zD4vAJyj42hLgbFCl+FGHDXbr7CEgZ98ks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MaPNAJywtl9YLJFusWo/EmUTbKleMdXg3yhtEjL3gqUe5nHv/4qhVyjpljS/7A16Vmq8l4F3cTtT3sJvCTdWvqPou38eO5opDwYjbEFV8Lj0rAMjF+SOkwohJxPFMbVxvGGn5hshMLI8qKLtRYyUu9LPQfy4RKbTIOx9uut2XbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ye+DqVEO; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ye+DqVEO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wowrh88Ax9cZgTSiqNljESF6l5Hbog3f4T3DSK0TC+/Rlb59+hnki0CXq3uuBuiOejvpDdEMta6ss1S+geC1LY2cpZxSM70BPaQiLf6uX5NL8CepzgN+eUhw5lo157m2v+BeQE1egLUUw7Eaqaht+dNOrLqajco0idd1dImXr+ErevbFt2qX6cLI+dGpbbwn+ZR6VOxyk63E4145SwxgVrxLZvX5P9dk31OjmrB8HKb++v4BJSfHdb2W0phMUyzXJ+sFMCFwmTXTavMFzMq2dMHXFE5/Tz74/4GOUgZBh5yid6Vl63OYMZRzXw8WXVyEWyNK9nSTXKoPjvxSndMNeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awQNwAmdL4WHCv2st55MJHf8IAqlQ6WqG++gUb4jjqk=;
 b=ipRQBaMeGx68Dq8dEw8x/MvIXrp5LYJeQunEY4VxnqKibyYLWurIn1AcFReO50Qvm56irYCcxjwjnM2KwabZpILhAhmDuoUOPp7XmCWy2EAGoeJ4sEy1s9LQZc42FikbgpO/Zdb8pfhlNVmuMZ1jEasjqUco04tT3+CgTWhK9ozU/ohtzTxRULQYmjC4Bi1ZEDzscBv/vRl19A6aS35kHMG22GSHi/JJaFRTG5/n3FfaMF7yjI2qEMbbUNa+tygVjRSy/UW/2isxPSh9V7cpSkbOt6bsCKhgnenxsh9ZpNQ6CPFtgO8lv6fQJ4cy7CWCQs8+bCoCFLReGismFXEbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awQNwAmdL4WHCv2st55MJHf8IAqlQ6WqG++gUb4jjqk=;
 b=Ye+DqVEO5BhP9S59Ts0poZhMY/No30x2DScY8PyMCWsTp3ZYJE2NVh6VEZAUzspeXmhqOguA4d9GOrj5ck7kgI7utb3d2v42hHuS+B5H3wdUmHRjBo3i6+jakuHl3ktWCk7qZ5a53Dilcex0LvMjtHnLwq8U4KyLftyfvKORGSi7hM6SJ2qFn9U4I+jx9FL8xf37zGWbz/Gm76JL1Lmj9kuv7BIBQPN+W4bWDPPY2dMpDGFRZJHuYCSab1yj4T7g5tC0ZzNsUYj7YUS+EWvSbzj5tHBaQMDMI3l9ap8VUeQrKi5agVLzd44v0MjFlusUKbs4GmAZmzsO1j6YmbKupw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0878.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 01:19:10 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 01:19:10 +0000
Message-ID:
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 09:19:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0178.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::9) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <647bed5c-5975-456e-9f6d-1f5254a0d3e7@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0878:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ef368b-6bfd-46ca-d768-08dd91bc2a3b
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEteH+k42xtHTXGeBa7LhuX3YNWWVWQakGWpbhF5G703YptIxRwYwTsUwXQB6bVwY65qeIFeKEYQ4znXyvkEBMZRnaL1d42gCPKTSxuPnOGO/R92kGhw2AykyH0TOG0dhNIVSYmnfXngCgWH8973I6ki4w+biZMRFgwPuNlXLtZYbf5m47s9yMZTgXeM58ScgGMTQPIKqYC7ZMo0J/CTWyw4ia8BibuDK245hUDfn1X9gBGiyIpYt/gnK7Wbp0C4dDArtWYLeaJT/nxMPY7V7wvySvlv7DMkXr4ZBiKGfLrp3749Gq5NRiJwULL0Z1wxgt0jioGaUtuBe4/0nK/KesmsUve8/sJ5T6K8qY3SSssJznxGW+HXVd09qLGmgMwNdkF4o+15cAU7ZxY4avSvKiUFLR1CAr9ceftajpme5daYGI/AHJcka5Jk/1egHhGBXw4MTKBZfXChxupWDLMSLOdzxrN9zNB95p+EOpvziA3BozrivHEpyhrl4wNbxXtz8YxvldPqfnxd1iq+vHu8X25ApbvGOYpI0V3bKGQmtOSazwUvykezh5wx5P5eALG2T/yWT8VDH+1TLbNbdtT2e53xlqC6/12SRqu4xry82q+KjmnRM4ZKcmtXh7O+yJMAn+8E7jkLkXgbNb1d/heHVj0bgzJ8d0mmhhSowjk9UgKkPKlUARIr8c24qCFhUnF4RyiOethCXfLNnNZ5puG6X4LjDfH3OkydhMZvWg7CYr7Arc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|8060799009|5072599009|19110799006|15080799009|6090799003|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXN0dHYzUUNocDQrVnRsWHVvZThHZGFMcFB4SDJHK09uMmNIVzg5dGN2eXFx?=
 =?utf-8?B?UWdJb2M2azgxRkpzQk5teXhLR3VOV1Q0VGQ3clFnOFc3TmhsdGtMRkQ3TnBN?=
 =?utf-8?B?YU40ZkhvOGE4MTlWb0lHblpleSs3RytyUk5mY1FJZTlqMjMwc2dtSzUwRzJP?=
 =?utf-8?B?dlQ4NlFWNUJGT0VVNGozU3V0SE9hNWQ0eEV2ZlFlL1lHYmFaYm8wNmhrK0Vo?=
 =?utf-8?B?clc5UkI3QmY0QXEyd3J0NkhuYU50SkVYYzZzd241V0dPZ281N280K0ZKMkVB?=
 =?utf-8?B?aUQ5aFgrZWhFVVZLQ0I2RWVCVEZRMVVUNDMzMDNzTEpYYXhRRUErSVFnOUwz?=
 =?utf-8?B?UVNud0lCenRtVnFDeDRCR3FxVE55V0NIRmEram1tWEVGRjIxakpWU3FYcndq?=
 =?utf-8?B?R29JMGVySXBQZ0xQbW1nTWlKeU5rMlE0YkhZam8yaUZQamFpc0ZUcmRKeHU3?=
 =?utf-8?B?OTljbzI0ZTlxWlVxQXRtdFZzazI5S0h0UTVaM1NHTDZ6Z09sNW0yWmJtR3VX?=
 =?utf-8?B?K1FQYmlVUlFjaFBFNC9kS1owcDZsOXIrYTlPTnFaQjJRRUtQeVd1aTk2QW9Z?=
 =?utf-8?B?Slg2K0V2WWVnek1FZHZoaVV5bnNqQWRjRFRIckN5alJhTlgvaUh4MlNDdzVM?=
 =?utf-8?B?dWluRDdyQUZ6NnRjZER4S3FvY1JYRlZDL1U3S0QvTThnR2pzSkR3VDBkTldh?=
 =?utf-8?B?azk3U0NhV2JxdHFlbUZ4aERSTEdUcFZuSjNJK0dLKzFOZXN6RzJCazg5RHVh?=
 =?utf-8?B?OUozNzZFajZ0aUl5V1h6NDcrSXd4aTU4amJCdU1VdW03QndVKy9vTGtoUkNl?=
 =?utf-8?B?bi9kUnNPd29zVmRWK1l4aVV4L3RBUmtsQ2dSM3NyQzBDTTRrbG9EV052dFhx?=
 =?utf-8?B?RWdHWUY2WnRKZ3NoRy9MNjRhUEp0TzkzZHpXdHBXWjJ5ekdmOUlyaXlYNnBM?=
 =?utf-8?B?M3BHeFV1VzUraEl1WkJlc2ZxZmdoWDF2MVNRaSt4Nmw5d1lOdENOVmhEOFBX?=
 =?utf-8?B?cGFKVkNlQk15c3J4RzRwREp1ZTd0M1IwYkxVTmZKQzNWWTNURFd6TE52K0Jx?=
 =?utf-8?B?RGdJT3IrazIyaGRBcC9td25VRmpDNFNwNmMvU0dKb0FFU1JSNUJMeXYwU0ow?=
 =?utf-8?B?ZDZDZExJZWxEVTM1RWw4eDVkenA2dE9tM3VrdTQ3bkR6NmQvekFqL2ZnQnIr?=
 =?utf-8?B?Q2R4WGphZVQ2VzNCKy94cGRpV0orWFlSVjdhSWIvRFUvYnJETnJyZU1ZdDcy?=
 =?utf-8?B?UHppRjF2YVBGa0FPcG9EZG4rZEdPZ1pDNjhOamY3QjdrQ1JRV0ZyRVJaQTdS?=
 =?utf-8?B?czZBS2pkQlhBeWk3THN3NG12UXhvandkUkJiWVNSQVZUdFQzYlBCVTVXclhI?=
 =?utf-8?B?MHBxbVZMT3VoWUc2ZWxlQVFuRGhZOGd1aFpjaGdnY2dscjVHMno3QXkrREt1?=
 =?utf-8?B?K0ZnN1NybFBtQ1NkcDI1RkdpeTZiTmZQWHo5QXh6MWI3UmR3RStDVjd4T29J?=
 =?utf-8?B?bkJpZ3pOc2pQZnEzRjFwQmJ1Wm1ydFhVSFg5WW5PU3hRZjllN0hVN2VJKytq?=
 =?utf-8?B?K2FWdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REJVcURERDZvSEU4OHJyekwxejU1c3hnY2ZIeFQ3QXpKckoyTUFubStrS3lr?=
 =?utf-8?B?a09OcmJBeFY3VW9aU1dVRFUyNklCdktjWkVDNXlQSFVsQVVkNUZkbkRZK04z?=
 =?utf-8?B?RnQvRDV1eHVVK0VvQUtoYy9DQWd6Z3dqZnFqNisvNEliaHJjSGM2eS9oeXE3?=
 =?utf-8?B?V0plQldhTEdKTjJMOXNGVnlPU1RDditkQ3ZBakM4UjAzS2pXRXNESFFlZnNB?=
 =?utf-8?B?S3NKZGU4amwvcTVGcjRndUh0cit4SHhUMm9EcVpXZkpsY3dTRG9LeW9yWERO?=
 =?utf-8?B?MDI2MGJQWTJ2bTI0SDFJc2tuQUVadjA0MTQ3b3pCU2g3N2duNUJoYTJ1VHJw?=
 =?utf-8?B?S29mUml0MlJtTUdXUVVLUkhZNjh3QUZTN3lVckxsM3lSVitjUlpabzJRL05Q?=
 =?utf-8?B?SWhhejNhRGdzdERlQnhYNnRiTU1hL2psMVVCcFVsSlBZWk5pMk9VMW5DNzhr?=
 =?utf-8?B?MHBoalcwOUxOdmJJb3M3cDZMTVk0K3N1VklYUkhnSytBVEJab0krLzc3K29n?=
 =?utf-8?B?RmcybWpvL040Tk1ZNkM0WnpHS3h1THZmcUptRzV3T3Arb1pqd3lvcTd5UCth?=
 =?utf-8?B?aExxa09FR29TNWt5UTdzaXcrazdxV05WZE5PV0FONmtYRmNJSmw1VnQ4REhY?=
 =?utf-8?B?SGNuZWlpQXFoUFhIYmEvTkdwTHFFRFpCZUVYS290YnhBMThOUWNDakRYK0V6?=
 =?utf-8?B?dThxdEhTOXdwMFVYWnhRQ3FUbHNkZ3lrOXhlMHQvaE1EaTBvRDgwTzlSWUMy?=
 =?utf-8?B?dzNRdnVaQTNWVVNENlR1WWRpdW1YZlppNHFiK0JwcGFoa25HNFhVZmpCd004?=
 =?utf-8?B?cHNOTVNPM0JYZHZIMTRmbGdyMGtTanY3SHVDY0pabVhvck9UZGZSQWN6VEFR?=
 =?utf-8?B?YVNTaTd1V2ZzQTVpL2J1OWdYTmtESENrY2o2VmgvelZueCszNFRQcHhCVktY?=
 =?utf-8?B?akFsR1lGaFltQ1phV2ZlWFZ5M3NMTVRvdnpvQS9BanM1UEg4SjZ6OUZ1a0Fn?=
 =?utf-8?B?MUUrYXNZeGxXeUM4QzN4eUh5ZGRpeTVYYTRieU1ZSzZzMk91UjMrZDd0VWhZ?=
 =?utf-8?B?dUlhTStqRXZzc3BrT0VxRjZJeFp6eDdmSDFMWjh4WWpHbmJHQ3hLZWlVNDZB?=
 =?utf-8?B?QWVMa0ZqZHZTQVhXMWJHS3ErMUhiRy9pV1JRR0lvZGZlOWxWVGtTNEF4S1ZH?=
 =?utf-8?B?Zm5JbmlxaU05RVN3SzlxZWtPdlYrZkNpaXdUNjVtM281aE9IQzZBamtoUUdQ?=
 =?utf-8?B?WXZmUEQvdnMvV0RMc3UwcnlRK3QrQm9ITjFMd3JJZE1YVWsxb3NpL0V1TE5X?=
 =?utf-8?B?Z2NjSVRlM0kzaDJadEl6M2loUnFuMzcwaFo0QS83RVVYVDI0ZTFYcGtGUk5a?=
 =?utf-8?B?eU5yY2VVMUFpMXh1UUlUOGFqeVN5ZTZvdHhXM3l3cHk2dFJvazlkOTBwaDlO?=
 =?utf-8?B?VGc1UEFMSEJEdVlUMFN6WXVORnNwN3VwaEIyekRuVm5VbGs0cjZUVU96WnRB?=
 =?utf-8?B?YkFiQnoxeGppQlkyOW1nOUl4QldoNU1yTzBhT3N4Wk9sWVhMWVZ2UlhtS1Zn?=
 =?utf-8?B?UVVoeFV1b0k1N05LUDdUZ2ZWRG5WelJodjBIb3A5eG0wYTB6d21jTWVTaldG?=
 =?utf-8?B?ZWRib3FqNHRQSGtNT1lrNVF3M2M4cVhKWWUvYWJIY0VTREh0R0kyNU8rMFY2?=
 =?utf-8?B?V1k0T2V2RUtOQkNXaG92VjcwTmNRamUwZDFhTjNvaUNNTmdXOTB6TUtWYkdx?=
 =?utf-8?Q?MR3Rzc4s8uous0E60pWVCLje3Bq9DCAhvKceHNa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ef368b-6bfd-46ca-d768-08dd91bc2a3b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 01:19:10.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0878

Hi，Han,

I tested with this patch and the machine can bootup. But I find when I 
run "cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb", it print 
nothing, though I expect to see 128.

Do you know why?

Regards,

Chen

On 2025/5/10 6:11, Han Gao wrote:
> The sg2042 SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
>   1 file changed, 128 insertions(+), 64 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index b136b6c4128c..927e0260acbd 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -260,7 +260,8 @@ cpu0: cpu@0 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <0>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -285,7 +286,8 @@ cpu1: cpu@1 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <1>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -310,7 +312,8 @@ cpu2: cpu@2 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <2>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -335,7 +338,8 @@ cpu3: cpu@3 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <3>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -360,7 +364,8 @@ cpu4: cpu@4 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <4>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -385,7 +390,8 @@ cpu5: cpu@5 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <5>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -410,7 +416,8 @@ cpu6: cpu@6 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <6>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -435,7 +442,8 @@ cpu7: cpu@7 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <7>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -460,7 +468,8 @@ cpu8: cpu@8 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <8>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -485,7 +494,8 @@ cpu9: cpu@9 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <9>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -510,7 +520,8 @@ cpu10: cpu@10 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <10>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -535,7 +546,8 @@ cpu11: cpu@11 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <11>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -560,7 +572,8 @@ cpu12: cpu@12 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <12>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -585,7 +598,8 @@ cpu13: cpu@13 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <13>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -610,7 +624,8 @@ cpu14: cpu@14 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <14>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -635,7 +650,8 @@ cpu15: cpu@15 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <15>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -660,7 +676,8 @@ cpu16: cpu@16 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <16>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -685,7 +702,8 @@ cpu17: cpu@17 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <17>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -710,7 +728,8 @@ cpu18: cpu@18 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <18>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -735,7 +754,8 @@ cpu19: cpu@19 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <19>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -760,7 +780,8 @@ cpu20: cpu@20 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <20>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -785,7 +806,8 @@ cpu21: cpu@21 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <21>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -810,7 +832,8 @@ cpu22: cpu@22 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <22>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -835,7 +858,8 @@ cpu23: cpu@23 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <23>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -860,7 +884,8 @@ cpu24: cpu@24 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <24>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -885,7 +910,8 @@ cpu25: cpu@25 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <25>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -910,7 +936,8 @@ cpu26: cpu@26 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <26>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -935,7 +962,8 @@ cpu27: cpu@27 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <27>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -960,7 +988,8 @@ cpu28: cpu@28 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <28>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -985,7 +1014,8 @@ cpu29: cpu@29 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <29>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <30>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <31>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <32>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <33>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <34>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <35>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <36>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <37>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <38>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <39>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <40>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <41>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <42>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <43>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <44>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <45>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <46>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <47>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <48>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <49>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <50>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <51>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <52>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <53>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <54>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <55>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <56>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <57>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <58>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <59>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <60>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <61>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <62>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
> @@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>   					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>   			reg = <63>;
>   			i-cache-block-size = <64>;
>   			i-cache-size = <65536>;
