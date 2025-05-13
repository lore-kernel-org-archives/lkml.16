Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524F241665;
	Tue, 13 May 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130376; cv=fail; b=X90+nIS8XXHQ4uYGV3GNMsEL5lN89g1owLwaiWXJR9QoFJaten5ZK51uw/V4j9BN3fflNlX/fZ/uNIX9TE5XBvNfHU+NH2fEclKSZbVxSUkyCyequTx3ZbbWbFda5lggIIDEueJojTXTYANyf5fV9VHHhJL2NWVy+n//c+o4l9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130376; c=relaxed/simple;
	bh=T3Z8tJxUkZYiooR3ra5FEDltMnN6sBngZFEatGT/3KM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EDcDTJjxxejcFjnHA9L8SPkWJBZu0npHG62uOBKG1oRTMif1FHVNJBMADHIIWJbjT902xtQCkvL77FKIDNa6HdlGAWU96OOm1pGPtrA8OpaMo1zfGo5bFjJknX/LOyu9GF1YFbl5aKAe8moGx7nHnpPzglZXw3G7EedUYB4ffO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YZRyJke0; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YZRyJke0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSuhugHdgY7btZBXVOpKbDOX1Kmp26r7IP6FJF+Yvuz2NmZJunyK81j9oBWmhcwqr2xIbZz+BtEDBqYCNOdTBrd1in6MhGmCMReqDt66tVd42LKGAoIYN8Y3x4SRPJ7GFTuM0WFyfMGc4Dhq1lk8uoQXPl7EKIL2PH0wyBSGn0sU9CZP0YBCs+yvBQ9y2Dcr5hLFlKPeMWPYStIOIITLv9KEnx+EqRzxvx6F6SeNBiERw6bdv3ilRmGK9BtXyvIKf8mVdWifqFHY+Kx/g501FwU+ZbaCDGGErNe8wCT3IMyl0118YgRbNnW8vvlhDgvqO1IaD83idaVwxrR7kwRI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E8MvLMr2SfoOmNkHW64wbmwEJbY5tlcCW2mXjci+40=;
 b=foaag2//ljCO41rLTlIDr4YsT3F7eAovLek7uaNniywIgun+9FjDOnfHfIc7jNAn4mI8WUzX5hFYE0ZNQfHagTpuHHO2mU66iT2rXBncoDmDk4AOrjoohtlV6Uvb+P2yFxEw+fLjoPzegY9f35DQjx8j5z01crhXGsD8D+ykTpmY6S4ccYZvoPv+FOPqXCLQIBFdqfpz22CZTfEzoxDphhcwiQzIDSacXUuxCwuRuUy1EGj6T7fKphDJff37OXbRsRv5PXFDyDCtqkU4sBvSlpirY6yIQWNZDPYujPNQVMBl+9ShUKxulu6Scqi2/dFjj5gqxUNB958eU62XgxqdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E8MvLMr2SfoOmNkHW64wbmwEJbY5tlcCW2mXjci+40=;
 b=YZRyJke0BDgofrOHfizA6oiLxDXYZ6UVdPhTFui7oSp1UqOsqxlvb55h20TiWnV4kgrbrLF05ss8GsCepvwnt1Hvnp0n4theIPI2IIi3LZzexeSEGsWKUMYnq2xrfdbdMDMYw8/DSK3ptMuLONJBG5XL+lWqGA+OfGjlSqVlqWJvpnyVOLQUtvwvZ5olyggboUjuoyuCpB/2N2rHzy1UM6f4sCtNPg273UE9ee7LArMkhtei+9m/ytmT7eyNuyLaqWQWC69B3aZ+AG4hPbPSDNC5gxddhvUm/0pLfizYh/W1sKgoJSsDbRL/HY5L34vwBNU07PoeujER8PEhmHFM5Q==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB1381.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 09:59:27 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:59:26 +0000
Message-ID:
 <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 17:59:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
To: Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
 <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <29f9d65d-9c93-4fa0-8e47-e62cff7be0ed@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB1381:EE_
X-MS-Office365-Filtering-Correlation-Id: 12252802-92ed-4ea8-c82d-08dd9204d85e
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEt+26GliOreA2ldnvtxRZskCdP6YSQ1AozMCvwcSgaYKVxRW9imP6zeE4toyOeQM5KuTIrEj8mJeKjE7Fp+mBxkp3rggEN/7LyOeY/LwvlNbbzfUWfb3XaLD0C+JgZre6Zqou6yjIWhOyvwg9qZZU6VBPxEvbzcfH7fCH+aT8zKOvzCOaeIaZUqRAU/riHfuFfVZLhm5lmDhqhR3nVo/f2GuiFrBuy1FcbnVATTSOT+oFFnZ1J97DEPHMx6UA/tFWoEn1lGwsFyDVzJnRfBGK0S+0JubAXmf+WbnEbvn3Gw4X7a3EZpG+TNs5QyolNuapaQg03gcW8l+qIeETPPZrwYJv0f5AMa2pGRFC8t13NkFNWfLKiNeRbR+ltQM5zlzy2fc15nzstFh6+ySH01gPAIuAQ/u5CS2yOK4Xg0X/MYqIKw+/v25YAhvoQg3tzAjoxd9zALajb059Ytv7liOuN6P0f4lXNk1EPTjm4M+ejgM4kHEF+phVSMt1jIzyFpYq7ydBm0BZVMjJTKqxKmSdHV//pIZ7fbHOp4q3CZlhbjLNSS1rPWuNwW0+T1adq4yHeAsyWo2bDbePTw/BGvyBGQGLGrS9bFojO6XCIt/Gc1IRydLWoR2A8EtiA7qCoNiMy2scYglKcyRLycSRuOCiV5mCE1fuAxGkeoHvVTC3EcR+qnOu3cSBUoVrPMY5CTLtoOjBPxZUV8boSkVNEeSmff2dEfXMWbl/x8yxztl9nJ2E=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|461199028|6090799003|7092599006|8060799009|19110799006|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VklUOFVGR1BpV2huUEIwbm02S0pzbE5FbFVNVFdVcGltS3hicGpjQ1E4bmhL?=
 =?utf-8?B?cXNMMjBMNmdtRVFlbFdWQU5PbnhjdWVwK3dTb2k1eHpmWEliY1ZDMjhmNTdK?=
 =?utf-8?B?bWVTRnRXU2xDM3YyMDhFSW1abjd1V2tlUDNSYkVKNHFUUmZVLzg3NXpnYmlw?=
 =?utf-8?B?TkdnalFqaHo3NU55QytpL1liZXlBU2RWbktUSE9JZmZsQlcxZEtzN2J6RmJr?=
 =?utf-8?B?ZXZWRVc4ZVZnam5zd0poZXVuY2kyTUJWL2lzb1FDTCsyRGJsODI2RUJVOEVt?=
 =?utf-8?B?K0ZEQ1lkQzZwUktROVRyWXBOMXUzMFd0SUpuVUxLcVRHUDRzMFZXS0N3VXE2?=
 =?utf-8?B?YWc2K0dEdEFIZWdFYkVjYTNSWE16ejRkeUZPSTRtVkdVTU5mWENteVdtaERY?=
 =?utf-8?B?dEorbDFRZzU5aGFsYWtvLzgrZGg2MXk1TDA2ckZCMTZMQmQ4RFFmMmJUZTU0?=
 =?utf-8?B?UGVWL0dlNlFVUWRQNkcvelVuaUJldkN2OWxydlkrWmUzcm91N0dqWlNnUVY1?=
 =?utf-8?B?UmRDT1U2NHAwUlBSOXNaMk5oL2JsaE1Zc2pMeXlpZkk2WkxhbU9pQ2hrQXhw?=
 =?utf-8?B?QllJK3RCaXZiQzZpNTloaU5XME84Y0tJVVZkbkJtR0oxaG9JS2tGeE5SWnkw?=
 =?utf-8?B?U3REeUhPb0RucVgwTFBDNGNWOFhxWGVuMEtVNFlJVlBtNWNLdDk0eW1GOG83?=
 =?utf-8?B?MlRBbytvc1U2Q3lDWnMwcDhJRUVFYmNFaWRqOFc1WURTVlhRRXU0UlBMRHVO?=
 =?utf-8?B?bUx5NzRaaXRwczlEVEpqamRQRDhxVkFoWGFyRFpZQ09GSkxhS3pFbWdISUxu?=
 =?utf-8?B?T25jSUZwa3FnZ2FyWE1XcjF2OHBuWUhLd1ZGMHZ4Wmk5M1FGM3VYaUk1Ry9V?=
 =?utf-8?B?MUQvSEROQXNtWWVuRjZSQUN6c0lQbThCa2lKZ3N1N2RkdTU3LzlHZHNBcmI5?=
 =?utf-8?B?U0ZyV3RrMitvaXIwdXdMOVpER3ZSME5RNEdickFtZFpsd3p5SHo4RGw4U3hD?=
 =?utf-8?B?cC83a3plWkROTmUrNEQ3RytybHZtT2hSSEEzQ0hONldXcG14Rm5ZY09KR2VR?=
 =?utf-8?B?S2NLTmV0ZGFxd09PWUxwUlhOSjRjTEpxRjA3dTVDaER4KzdPTlZoU2poNDMz?=
 =?utf-8?B?OGlDSnI0TWlNaXNpbVBUYmVVNGhnQjRtaTJhK2lrbVplVzFCQmdCek5OOGcw?=
 =?utf-8?B?R2tMQzJXVEZOeGxvaGo4SXhXSHZxQWxlQ3N1amxvRHFxTThmb1VXYnA3d1BH?=
 =?utf-8?B?bFJNSittYUV6aE1VZm5XWGgrWm03SWd5a1lFdWtkTHhPQ29ob3laamQ3d2NF?=
 =?utf-8?B?NTVGQVNleVV2bGRWYW01K1ZYUkFyS0phcWNPaHZsVGc0dWRoU3F0MnRadDBV?=
 =?utf-8?B?WHRpd2M5VG9YMnlNOVlKeDdzVkNXOVVmTVQrSzA4Ymlnc0ZQUjdsalFxNXhu?=
 =?utf-8?B?L2hMTG04dkN1ZkVYb0VnT2czN3JQMUthUUlONExYOXlKZldxVlpSVHhETkw5?=
 =?utf-8?B?R3pwTEdVbVRrZlpsNTM4UjJUQVVrSzNodWUyVmh2dVZUOXRjQ2RGbGtVaGdz?=
 =?utf-8?B?a3d4QT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlFucnJFZm1ybUljTjNSS2VYWE5oVCtHVHVpVWRNRFlrTG1ULzAwZnRtVkFK?=
 =?utf-8?B?c0xEQlhtR3czcmU0SGFHUi9iaXdnSWhsUFptd2ZhM3YzK05oNmVUS3U1NnFH?=
 =?utf-8?B?M3RzVlE4MlVxNlhXbE1uYnFVanRQaVZXekMrYzBqOHIxdGluaEt5bmoxN2Vy?=
 =?utf-8?B?RzF3a0R2WWVUeGlSQm1SZlFOQlF5MTlycHduelhUTE94QTBoTmJqWHNzTDJJ?=
 =?utf-8?B?REZsUUNQTmFEbkRYRlFtWFpZSWo1WWNRcW1zVVhic1VhRGxIbFNFeDRCdU9y?=
 =?utf-8?B?S05kaGxENDZVWnNqRmk3NnBIMDZxdVZUYTBhT1FSZGdFZDNFVUgyTGFtWDRV?=
 =?utf-8?B?b0FoeFlraXB2V3YwNksvYmVBWVhKQUFRQU94L1JSRkVWSFRlTXVzK29nc3JH?=
 =?utf-8?B?YUxjV2xMemVRSWthb01haUVTaWU0U2k1a1lYbXJ2UDhXVFl1S096SmFxZVVu?=
 =?utf-8?B?TFFrbEdnN2ZiM0w5dTBMNHZMc2JZMUEyUEd1QUZ2TnVUTDc2b1VtZlJMc3Bz?=
 =?utf-8?B?QkFuaC9uRzBjY2JtUXRteTdrZ2RuK3ZKLytwcjRUZTNuWDlFQTh6UWorM0dy?=
 =?utf-8?B?R2xUZ0lZQkE4UG8vSDM2em9nRWxwbGt4VWZycmhnZjZkOUVndllLelU4WThY?=
 =?utf-8?B?RlFVZ1A2NUNBNDgwa3BuSHM1djY1eVJLbUlGQitNZkpRb2lNMG96RmphY00x?=
 =?utf-8?B?ejVPaU0yMU4zdWFPZEw2OVpEaFRUd2ZPQktyWUVLbkY0LzcvNkt1OVlLaGRK?=
 =?utf-8?B?b2c1M0lmUEg2QVRsZHZOOERXZkU3cnMvUEE3ZHM0VnRiMTlPRFZ0VnBOdEtz?=
 =?utf-8?B?ZFFrSytSYlN1c0VVeEJxOW4vbHF0VVFRRWZ0YjkwU05pY3pqcituOUY3OUNx?=
 =?utf-8?B?blh1YTJHQlBkYWhaVThkSzdPNGpDOGNPWGluQ3hGcnlkOVRPOHBTWlQxWkMx?=
 =?utf-8?B?OFdYS2tmazZSeFdkSkUwZnRjSjBTWSt1b3FhY3VscytZSUZKa3Q3RzFvN29J?=
 =?utf-8?B?TlFtdm0wUy9sN0ZZSDJXNVRsUkowOE01N292bi9LdjkyYUd2RWZqNmpFZStD?=
 =?utf-8?B?SWNiTWw2ZlE1dlFESVo5ZjU1RkJiQmxGNnYzdlFhaFhLMmcrUmlqZ1NMbjBZ?=
 =?utf-8?B?TVRBb0xtczRTeE9wWldISGlvYm5DY0VYbVdtaVpnR0kzcjFaYS9jMjlyczds?=
 =?utf-8?B?cGpRS1M5Q3BpdklmdVJiYWJGR0loNS9rbDJaSmZBNzVaVnJ5TEN3RVRlY2pQ?=
 =?utf-8?B?Nk91VzEyNDRBSzhkblMxamRqREwyQXRKV3o5aitWUGdwMmV6VDl0SWhobnl6?=
 =?utf-8?B?T09DUjJzUGY2SU55U3FDK0V3UytVUnV0a3dxQVludW9FODIxc1l0WnJsWUpN?=
 =?utf-8?B?OGxiZUVSV3IzTTBOMXI3NHJIRGZWOHp6bmNOc0JuMFRSdG56TzRSVkhqZXE0?=
 =?utf-8?B?dldlT0gwb0R3S3hCVTJDTTk1cUp0cjNQQnhKTTI4dkhZM1dtTnkvUjhVZTNs?=
 =?utf-8?B?OERnT1FuNllhN1JwSzQxdHh3WTJCdmFjMU41ampGSzhuR3ZoR1NvQkZQaUJu?=
 =?utf-8?B?S1FRK2R2OTV6bEhyZzhRV2FyMGdMNWkzQXQ4MThOWTVGZHpKT2hLWHpHMEZ1?=
 =?utf-8?B?azlZNlNzTTdYdG1JbGU1NkV6WVdBemwrTVlLV0JuR0lWWllBVUM0eG8rcHdE?=
 =?utf-8?B?ZjRYeHFtNDVSNXlPUjVGcnAxdVlzMlFIUVhsbCtjQ0tqUnRIaEZYeGRYcEIv?=
 =?utf-8?Q?8H73jM0rUzpBarwgwLbNVU9hHIkBBrx+UYxweKs?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12252802-92ed-4ea8-c82d-08dd9204d85e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 09:59:26.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1381


On 2025/5/13 17:49, Inochi Amaoto wrote:
> On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
>> I hope it is sg2042-x8evb.
>>
>> Sophgo is also making EVB boards for sg2044.
>>
>> I think a distinction needs to be made here.
>>
> SG2044 evb has a formal name like srd3-10, but I think it should
> have a sg2044 prefix. as the name printing on the board has a
> sg2042 prefix.
sg2042 prefix? :)
>
> But there is something needed to be checked, like whether the "x8evb"
> should be "evb-1.0" and "x4evb" should be "evb-2.0".
>
> Regards,
> Inochi

Agreed. To avoid confusion, it is best not to define the official 
product name yourself, but to confirm with the vendor (here is sophgo) 
or have them provide it, just like "srd3-10", we contacted sophgo's 
marketing staff and they provided it.

Chen

