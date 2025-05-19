Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA9026D4F6;
	Mon, 19 May 2025 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650016; cv=fail; b=t3bl3j+/2SHu9bSoNN0PM8/4SEH+isZwex01Sfvg5DvzeIOxu/0NKOaGR5ylVLHu/lvjV7gHGzCNno5KgpRyKvAyDD+0TguKhdeyDU7JAPe1YdmL9P0YI0kKOhBFlVDvS4LU6oHlKj5wQt5rqJhlakwA4ujYaBG/AMsrPE6Fe18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650016; c=relaxed/simple;
	bh=1L/YMgKU4MBLocC6OAptXI2PKbB8h4uBPJ5RojLwTjY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J5aDyxNgukZvaKyxOgzM5qC0BUCDbOl0cvOMcXtZ/5ewCuurSY9eyukxt3M2S2CE2mSiYw3Sx4N1HmpCqzggQl7pkicwUq2eYvwTSi9ZJ7LY2wMg5a/aUYmRCBjjz89oxPBQhN1d2Y8kfyB0H+ijz76GS5eRxbugF9wAMo52cZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=SQS01Afz; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="SQS01Afz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ge3Xk+YV5BLgoa0xzA0+Rqwpe+K7cYrKEjsxZ8ohMvzxH8FvWK10QJi34rDNFdbVWjnVL1wk1b2x2W9ZZs0y0s0nRlCxw1IumXpDYrcW22vB3ZEEVqzrk9NFFNGgn+ORQBvvXviXNE1yIBIfig2PmlWX+yAfaYZjfqw8FbhsV2Q4ueLKUR9fklGdyOgODee8kP8WAqfp7x2Gcb2lZkbNvLZcbz+FN2fEdp1vNP3edXgSY0Dbu0uUt3T9WdcFvb/nxJ8OlLsgSIsRRNDsvPR3ZLpoBD07dRdXAIHmpFytfX1eVQYC1b2RSZVq8iZtV+s4g8KLQlNraDBpPshD9QWKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q94UlCEpXR+YNahUBkwVA7WoxqoKfprLPYZIHTnEl70=;
 b=I4G+Me6YulMD/h1uYxldJEMLZ1nTwJnkXPJF4++aoePYDgOzkC+AR4KUOFzW0Y8t+3E1Z/O5OpNb4OmBborC3S2Db2UU74VAmMMxMr4CNHV1KgUgDiL89nZToyAexpHQUWrsfXAXPgN9T8Lw1sisF+ao1Zea92YYhIA++AH4GLSb3w4mdlVaUkQ/S/dvckTWURo5XNUHkV2zqPh2eXMCO79DjY0v/LvA8/PoIF071erEGMrzm9O+C0pYnrgCrYgQ4Tie4BMOOjlcL3orvvTFLBUvnkYngEOUnjJQaqiDprZAka+W40oYREIqFYXw6Jpqw5ZuK4e5NaTneSRzf5bSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q94UlCEpXR+YNahUBkwVA7WoxqoKfprLPYZIHTnEl70=;
 b=SQS01AfzaM1C39Kzv0uoT5BrC+rFVOq1azmKpAMmqSAXeNEJf1aM1Kwi3kBhMQBZIm8nNFjs4UAzf6LkozZRhPDyZ5CqX9eOdO0Gi3eblQBrF2Qo00RD8FF4cioOkas0lGXgOOJhn2KAFvSU97gBm5aLCxGUGvkxXU6eNA+h5Og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 10:20:10 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 10:20:09 +0000
Message-ID: <9b215ab9-cdb5-4567-9e4d-97ee4fdb65aa@cherry.de>
Date: Mon, 19 May 2025 12:20:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Firefly
 ROC-RK3588S-PC
To: Hsun Lai <i@chainsx.cn>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: heiko@sntech.de, andrew@lunn.ch, inindev@gmail.com, jonas@kwiboo.se,
 sfr@canb.auug.org.au, nicolas.frattaroli@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-rockchip@lists.infradead.org
References: <20250519075432.2239713-1-i@chainsx.cn>
 <20250519075432.2239713-2-i@chainsx.cn>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250519075432.2239713-2-i@chainsx.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 533be558-9904-410d-62da-08dd96bebbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YllBUlVweEN6R1BOOXV5Y1AvTlM0d3JUZkhQQ1o1MG9UL0pDd0kyNmEySENQ?=
 =?utf-8?B?bnk5c3FHd3VaWlg5ZWxKRU1yb0FlSEJSa2tRSzYrSnZ2MTM2MXhGOGk1UC9D?=
 =?utf-8?B?MTVhUUlpWTdMZU1WWjdtVlNwekN2ai9SVjROOGtBQVFINXhuTXVyNWRxQVpx?=
 =?utf-8?B?Sks0RndZbndxQ1JHWGkrbkViTFFXUzdaRW1LZHlIS2hUNjNFY0Z5eitvSmFr?=
 =?utf-8?B?M2N5TkVvZGJKQzE0WDBic0JsTVhNZTBFWHBReVdQNmxQV1BPb1gvb2wyNm5v?=
 =?utf-8?B?THQrRHFoTGo4ZTV0dDhLVWNLeG5iK1VuN2NCNFF6WUVOZjlad24yRHpqUml0?=
 =?utf-8?B?Y2ErTGZ1aGJhbCtDRXpwUGltVkNFUTE5ajE0RWROOU5maUg5M1RuOVJpREJk?=
 =?utf-8?B?Vkxnclk5N0djam5qSDc2ZTFKa2taVWl1cGF0S0hqQWRTQmRtK2x6ZVZBS1l2?=
 =?utf-8?B?RW5Ua1VtTFE2cHJXMDVMZVhOejU0Q3F3Zmdab2tmNWpQTWdLMVRvNDJYR1FP?=
 =?utf-8?B?Slg3Q3JPRVE2Um4rOU1pRFFYWkdtekFIRXNuMTJqeGtUMlVZdFB0U0dscnRr?=
 =?utf-8?B?T1RiYlpzY3RUQWZENTlCZXduNFNERVNOTWdJTGVVTzBMQTk0bk5idXJtV2xQ?=
 =?utf-8?B?SFowQ3NzbWl2N0xZbVNTa0JoZnZPTjcrcy8zT2JZbWIzWGh2Ujk5N2FUTmVo?=
 =?utf-8?B?MC9seWVDMHdsMEY1VnFxclF4UzdLY2QybVlkNlZwcXpRMzdDWUIzZWR3K2Qz?=
 =?utf-8?B?NmNsR1FmWk1DWk56VU1JdTh1UTRmeWZjeWl2QzFXdHVnRHpEMGMwcW5odmd4?=
 =?utf-8?B?bUZ6dzhBZ2VtaGJ2cGN0OU1zMWdMRk9NNkFNSlZWcWpQNTNFSkgwSUlrR1RE?=
 =?utf-8?B?Qng5QTNyb3pvdVRMdldJMWxRL3dibWhDczdHM0NpbWM2LzFwSHRkSTh5Zmty?=
 =?utf-8?B?cHRiSXRBd0hXbGdNSFoxSjArVnhyaDdNdk5nWGh2bFBjUytQdVNvKzJEcnJX?=
 =?utf-8?B?dVA1ZFBFdE1PRFNFaFVRS215OTFWeFdVMUlzVnlKQWdZbUtSa0daNjMxWGFL?=
 =?utf-8?B?VU9LZDVnRFRXdzJZL1JlWDhOU0U3RHlPV2tMWU1zK0RSU291bHRzUFpNbloy?=
 =?utf-8?B?R1RUbDN4U25iRUh1dGNaM25UYkhUTVljTi9acHkxdkxSWWVGdmVUaEdET3Fy?=
 =?utf-8?B?RDFRdUdnVzZ0WGlFRjZXdmp0RkU4OS9ldEVBTW5NeGVCS3k0WlBsb0VYa1lv?=
 =?utf-8?B?ekx6UlFyQWNXSWxNR09BSThCU0tRVDlmdmcyUVI2MVY2aWZyakpoUkhmaCtV?=
 =?utf-8?B?dDBreEVKL1E5WWU1RnVybHVjalNNM2xBYVJ3d2loTUZMZUo4VzJjWm5uZWFV?=
 =?utf-8?B?Ky9hODE0MTZCQ2U1cTZNVkd6UTdDZGsyREVJNy9XM0RSQWQ2VHF0QmZaTVAx?=
 =?utf-8?B?anJST3RaMUN0YkQzRkNTYm1EcXVkY29teXRtc1p2UXFsK29MblJNSnVHbFg0?=
 =?utf-8?B?YnF3b1pRNHhNTno2OGpSQ0RlWHFVUzlNaEoyejlrRGtmYmdBTXA4SytKVUxW?=
 =?utf-8?B?U2VyMFN0YlZCZk4zQlZyN1dsdWNRbGdzWEYrZ3k5RlhBQ3JrRXQ2RFNLd1FQ?=
 =?utf-8?B?UGtoSlRsRzdDZytRK0hZZFJDMVZxaC9aYmNxRGJCby9JamdGSHljb0ZQTDdk?=
 =?utf-8?B?Y2U3aTVMdzIzcllkSnhYUVNoQjZ5NWtWYUxxU0RjK01PSUlwUFRTYytlNkc3?=
 =?utf-8?B?Sm1WbjVuMXRvcWdzYmZIaWx3MXE5aVhrWUVxbUw1S0Vtd3Zua3I0UWM3TVAx?=
 =?utf-8?Q?1bswDTdd8ULR00mFXq4M3xuVJFibgkucQtSQU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpvTm1rNWh4RFkxTlRRa0xGQldjbjVaaTVOWEdOOXZTRzZwTmNYay8ya1BZ?=
 =?utf-8?B?NnZHMjA0WWpVb2hCR081dUpHMlRaZDVYamVoMWlNVFBqa2V0VElHcUF3TWkx?=
 =?utf-8?B?NXRycHVJaEFYRjVVcXZqU3Z2ZVBIemFjeGZPM1pDZ3VCRlQ4QUs3MWx6bWlM?=
 =?utf-8?B?QjlUb1AyMkVyU01FSVNOanh4UXN5VXp3S1k3ejlZeDJyY3NXNG9tdGw2Y2hE?=
 =?utf-8?B?VmovRjROaVBody9mcXB1cXRTb0xhMURKUTg2Z3JuSGZqM0t5ZTlXSW9GUXVt?=
 =?utf-8?B?L2pjVGRCTzZTSWlaakk4TitsNS9qYUFINncyY3BKODN4Y251dWd0SjdENmo3?=
 =?utf-8?B?RnBlbkJETDhFcERCREJtOU1tQXpwZFdJTHdBVnMwUHdHZXBSUmxoS3k1cDgz?=
 =?utf-8?B?QTRxenp5NFc3OWhXVVlXWHdxY0JUWW5OUDN1MG1Yb25ROWFLK1hVSzZHelJS?=
 =?utf-8?B?OVplaDA2QmdSbjB1UnVtUzNrZDM3S2hEbjNURWtOZEFSZG00VTRVWmZ6MDNh?=
 =?utf-8?B?eW9hNnNiaUM5TWZyTlY5Q1d0UUx2OE9uQWhOMjF3eG00VmNOMkJ1Y21OTm1x?=
 =?utf-8?B?ak5qRTY4ei8wUUFsUjNrR3RhNVVwaHlRc01NdkJjdzR5VytjUndXVHlvWlZh?=
 =?utf-8?B?elgrSDdHb2hMdUh5SjUvY0dmM1N0ZHhqL1VqMTMyY3c4MGYyanJrK283NEdU?=
 =?utf-8?B?TWhseUIvWlRoalFSOVd0U1JNS1lWY0NMaXl6N3dWdzZJZkFsN3kxY1FiWDd4?=
 =?utf-8?B?eXRQQWpiMlFXSklRcXNhZ3lLWEpPSnRJcm14ZzRiTkdQMWt6ckZKcS8vT3VO?=
 =?utf-8?B?Z3l0cThFU2NZZ29YbHhSMVBKVjdjZGFyUkdFQ3FlQkpGaTkrb3MzZlo4bFNv?=
 =?utf-8?B?SjNRU3oxLzJjVHhIMGUzd0MvQ3hhTDlvQkIzVVJ4MWFyc1lLOXhZdU5wSHFO?=
 =?utf-8?B?YU1ETndxSVcyWXJSUkwyZWs2cWRoSWZSWm9xa05oUk9IcVFvV3BKL2pyUXI5?=
 =?utf-8?B?TWJMNkNibm8yMkp4V3IwRnRjcmc4eU9ZZGNkL2F0cjI1UEwxb2xvdVdaZ2xE?=
 =?utf-8?B?dmdGREVyUUJyVW5nZllQeG1nYWxxNWFjNFIzSUg4WWVrYVI0WWJYZ0NKS05i?=
 =?utf-8?B?ZDRyT1JLVktLbUhDSk5hRGUxb3lHWmwwNEZsdU9JZ0kvK2N5SWpwemtlSEN1?=
 =?utf-8?B?QXB0dE42czdiZTJRZTFQUDJscXRISTdneThRV0dLVDZaNURhaVlWb3JXZXZR?=
 =?utf-8?B?TDFHSVVLRTQrdDBocDVTOHN4QWFoSkgyOThLZWh0Z2puNm1HR2ZRcnM4RXZn?=
 =?utf-8?B?d3Iyd2hNTFlYRXVOTEFweW9GVWJma1l2SnBlQmZUS25SMkFvWGNlVjBBMmJn?=
 =?utf-8?B?bVFFQ0RoeFk0V1EwVm1OeFIvYnlrVlZmcENkQWJWZ0I4VXZublg4QUs0UGs3?=
 =?utf-8?B?UTZQd0dpSmltYzQxeE5tM3psWU05RlpsdlNuWUlGUlRNUjJtaUd4OTFrLzJ1?=
 =?utf-8?B?VDEySUpic3J2d0VZY1dkUCtJekk4cTM4OHlTUm5NV0tKZHYvTEtaWUplTmdw?=
 =?utf-8?B?aGJickVieW9IQ3NHem5IQy96Y3p6Q3hValFPUHRBZWszM1pKNCtQbjJaaUg1?=
 =?utf-8?B?L0FUMmFOc1dFNjJtRC9WMlh5Y3Zmd1pjVTBwcWdIcXo4ZE5QRWJ3YmZDQnBK?=
 =?utf-8?B?Z2NIS3cxUlpmZkoxRVQ5eEc0dWQ4ZW9KL3VhbmtJNHlYVTFaYVc3T0RGVEow?=
 =?utf-8?B?dUR3SU1jaG94REhrU3NjeUtZN3ppQWlOWEZHT1FNWVFHdGJQZzlJYUVUeWhk?=
 =?utf-8?B?TlZoUmN6UEpFbG54ZHFVeCsxMi8xaDN0NFBJSHJTYWM4My9vNDBhZHFxZE9C?=
 =?utf-8?B?NG9lcUJ4VWxyRUozTVdCeldIRFpDZHhmYTIvazhkSDU0ODRsRlFXTDFFUUg3?=
 =?utf-8?B?OXB2R0VQNXNnZS9XS05Ha3MyZ1dzUTRRc0VHNThSS2taelJzeTdqL0JBcVpn?=
 =?utf-8?B?UEdxR0pvWkk1ai9MN2dKelNZQzlEUDFacVFEVUZTbEU0YjNTb2FPdTQ5N3JK?=
 =?utf-8?B?NVo0RlpySzE1RVVtVVErVGpjREVkU2R2U1FSREhMT1lPTkJGbjN4cjlPdElL?=
 =?utf-8?B?K1lUd2hzWGRmSUhTZGpJTVlXMXAzeS9TdURTTXlwVDJoM2dvVldXU0tLcVI4?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 533be558-9904-410d-62da-08dd96bebbec
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 10:20:09.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O+InoQefaKMSbOejjBBS25c14y7ulAi9PLV0XYpPtkQzPn05GXoU97T5IInZE4Jgo1dyuraDhcOb9e+AKcMN4FKJWaMCC8abTteDpDQFIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

Hi Hsun Lai,

On 5/19/25 9:54 AM, Hsun Lai wrote:
> [You don't often get email from i@chainsx.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.
> 
> Link: https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Signed-off-by: Hsun Lai <i@chainsx.cn>
> ---
> 
> (no changes since v1)
> 
>   Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 115c3ca43..701d68aca 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -258,6 +258,11 @@ properties:
>             - const: firefly,rk3566-roc-pc
>             - const: rockchip,rk3566
> 
> +      - description: Firefly Station M3
> +        items:
> +          - const: firefly,rk3588s-roc-pc

Interesting that the product seems to have two names :)

But considering the other Firefly RK35xx products do the same, I guess 
it is fine?

So:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Would you know what the actual differences are? For the Station M2 they 
say "Based on ROC-RK3566-PC" which may indicate there are some 
additional things or changes? Same for the Station P2: "Based on 
ROC-RK3568-PC".

Thanks!
Quentin
