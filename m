Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2107.outbound.protection.outlook.com [40.107.241.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30A204F99;
	Mon, 26 May 2025 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268200; cv=fail; b=Lm5J78pmzg2Sj4m7qB9/bvbJw+sZ9ugUGOBJJql5A/ygbSRp/fP4gzIDH8dVZv9Ui9usCppoBhA0tY9pkOP57ou+4/Lgfm++dsZ3yu2+nM+Wzt5QlQRmd9yJGuwidZmQYmxSeTZFnaxBwXFEpKa3P32YoZ0k96BB2DcRx9ApyyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268200; c=relaxed/simple;
	bh=84KjkSncbdpjegpguawHlJi1t+Bbm2mONx5XhggN74w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dal0gubwG/S6EU+VoKgQqpwQ+UaK1/yIocVryeNyLbj6cBJXbmRpgLSuZHHzP7Gs73ygz/sqQ2lYUeQi77l77M+/7E9hotDLXuph6SRkGvFdkGWVH7V+aq6iBA/gEyuSIozoZiA2S50mLbTqCwvnvnS4ksPaeKNTteDScdCqXLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=r9Lg50Xh; arc=fail smtp.client-ip=40.107.241.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="r9Lg50Xh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWITTm/ppYPTyh462kitszaIMuQS85yef4IrGAPBEL3H7FN01AaiNnRpZEQYAyDjr8tADktkcc4GOzSkxQGiWX4J8B0Spvhvyr32jg6zI/hjTbnTmSFu2DdqNLtakBEsPaRG7EuVXy4doA7/XJySMO9d//XlyENpg8TF+JtKgTis1pgBaDi7RlbLFiPf1idB12j67LNAuesUXobDkzb8x4kIGKZzn0GlbnYmDLAuNQ56/qk+qesTjskAvxnW+L7guTy7NEuvniI+aHaBGSVF2XvGzsQVjns+zTsDZUlHj6NM1dzGDdT3NZy246Uwe0s99dudx3CycGVj60rXr2ESEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd7XpHLf0CW72AgAIffk2IVyTpS7tPkSdxzWGyhkfgU=;
 b=mi3kRGjjVuOFoB7xOkycOL09h55Ld5icWsOGmNA35PiUiBE2m5wgFaAQsUG/MxnMb3zasOGMP5IZiNKXhYMhmsaUvUTVLspklgfAjBRmtVZq1YFQoT0Asu5usjVLTEhOBVQTkeXL+v1mZYbeiTXj33SNzhPP0Bcmje9KTPKDQRrc8NGc2MrJ+Sk8umdt7g2OUJFGlPER/GJExoxcUFQv8qj+0W/TLaK/JNF6gLXCueMttIt72ybGNVeEpXxmL6N52Xzz06LCl/JsKsnvz4Sx1FGv6H+JOl9U9IPBWyeFyiYQWNra94c+Cq/filqi9f027iOTtsMV8R9f/W6SBcu0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd7XpHLf0CW72AgAIffk2IVyTpS7tPkSdxzWGyhkfgU=;
 b=r9Lg50XhQmwJjnsGOhvA17ibp3YuaYCKcJHzj1w+JpXt169My1GmCIhKBguTT7XIVNE1w71b1RwNPI8xXVAAEeJ5PK3SetcjUvLkVCYqgxSTkGuikYFkB5c3Llf6tMHKR0nS6iBuStgvRLH6b4EophpHVuXcMPCsbyGyuMQNEIaWvUA4tty+mYa45U22qZKJpwdTPNqIeeOSowgU6sBFhFREsL4nwu6+SH4RnekiyaYnqeEKoB7ofU9RroVzEmZLGYID61fUKykrgmNW77cD1XxwKa13A9HHMPaw1SR78iGZXqbzbEyNtlY5Ka2XVpjk6Sm/9BRplH6U0+k7Y9KSPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by VI1P195MB0512.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:152::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 14:03:11 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 14:03:10 +0000
Message-ID: <eae561e2-a600-4d68-994d-6f619a7c86b6@phytec.de>
Date: Mon, 26 May 2025 17:03:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG
 Ethernet ports
To: Vignesh Raghavendra <vigneshr@ti.com>, nm@ti.com, kristo@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250521053339.1751844-1-w.egorov@phytec.de>
 <4f660adb-1cb4-4bcf-9d1c-c13e62818f07@ti.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <4f660adb-1cb4-4bcf-9d1c-c13e62818f07@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0022.eurprd05.prod.outlook.com
 (2603:10a6:803:1::35) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|VI1P195MB0512:EE_
X-MS-Office365-Filtering-Correlation-Id: b92bc5b4-c5a8-4247-af9d-08dd9c5e0c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3VtR2hXOEtZS2JOcEU5T2p5aHgzZ0hNOENybnowYTJLWjJHMWtlYXhlK0J0?=
 =?utf-8?B?VmQ2dHhXSUwxVzFzajJjRzFLZS9JNXEvSG9MdWZuVHlKUGdDdVpncjg0bkpC?=
 =?utf-8?B?RExTZFIyQlRpajVDdnBLdUQ1ZTY3eDVLU3V3bklPOTc2RHppbGUyZXNydCtj?=
 =?utf-8?B?N3ZpK3JaTE1odWhnWGw4UzhMTTA4ZEhtaytaOHZTbGl6R01rV25ObDh1ZjVv?=
 =?utf-8?B?YzVSRFpBUnR3d1VxU1hRNVQ1RERHUWMyM3NGZ0hlaURrSkZ5WjdkdjNQSkVp?=
 =?utf-8?B?eFdaZXdZczlhVUh6cVZIOFpFNG9IVk1zUTJLWElOT0lmVlNFVjd2SS9GVUhn?=
 =?utf-8?B?Z1hzbm5JNHVuNWFEczU1NU5GMHlxTldkclJYWnZNU2V4T3JYS0lUL2Z1TXhJ?=
 =?utf-8?B?S2lHK283VVZVYlJGNXN5T3U3Y0NScXpmbUhOeTBpNm5VbG1lTDV3NVdyQU9Y?=
 =?utf-8?B?MHZhMzRnOE90b3drYTBSeFRlbjBhNU9RVDdpT1ZPY1RWU1JvSzJuNi9CRUth?=
 =?utf-8?B?cll5ak93dGVMQmdIYzY2aVVHbmFTaDN1SXJuWXV0ZEthZENNZ0k0Q0pWWTBF?=
 =?utf-8?B?WFVmbVBYbGFxeVp2a3pkZEtMNWptSXdYVWwwalJEa09HekY2dnE5b0VucXBp?=
 =?utf-8?B?UGxhRVk2aEVsK0N2dDYzc2M5YXJJdjF3cFIxOEFVUHJ6RjllNTBjVzExaVI3?=
 =?utf-8?B?eFpXYjlkeGN2TkpmaHBTMm1KdS8yTWZPcm5lL1hHejFzdERwU1AzNGFobTlS?=
 =?utf-8?B?L3V1YmFsVUVZbzRQelhZME5EaFJvZm0rWUJiMkJYejBVY0VQck9pbHdqbzZ2?=
 =?utf-8?B?eWduZG1ObnRWOXlaODd0NWpvS01hMU1HVmNDYW14MVNPWmE2VUE4K1AvWmlv?=
 =?utf-8?B?aUtYTEVFN1JrUU5nMThrWEQyenRtUzUxVGN0d1BmdlVxM0lxOGp0TUNPREps?=
 =?utf-8?B?YzVPKzkyM1JVbXRabnZjKzZ4ZGhISVNyeDZFT0ZiSWtIWktpT2JFeVdRNDY3?=
 =?utf-8?B?cEc5YWFyMGdkNTFoUDduUmdrSlF1MnlML1Ezb0xYYmpSa2k5M2Jjbmc0ZWJT?=
 =?utf-8?B?RHZ5b1lqVHZLUTNWMjNKUzROMUszU2pHUTQ1TllGdEhFdWtzaTBUemwydHNu?=
 =?utf-8?B?M2o4OG9zS2IwRmxPNFluSGUva0RoM09memxSNFRtVzRlRDFyejA3L092Q05m?=
 =?utf-8?B?UytpTzBzRG9IZllZUVZwOWFOcWRXVk1LNDFZNlZTbkd2L1dmNU9pT0ZpVi9m?=
 =?utf-8?B?ajcraUM5a2FiVzV5elJLR3dvelczRFhoT2ZZYldkamJjekFVNWdHUENpY3dF?=
 =?utf-8?B?MG1xcTYxNUdscVhLNHBPLzVUL3hTLzZremJlZzZYa1ZTMjV3aEJXUUNwRUFm?=
 =?utf-8?B?UUFkelBpYTFxVjJqbGt3cjdYWVVpNUEwUm1yc1hxUjd6K096aERSZFJvVU5W?=
 =?utf-8?B?MlJXVmhDU3JjRy9mUUUwYlRYVFNreVpVUWFrUHNJN2hxWEZZZk1nb3p3eUUy?=
 =?utf-8?B?dUptSFd4bnVrNmxSTWNvc0IxN1FHVElwVmcyeDZiYnlzYkhUdDdkSVdHbS84?=
 =?utf-8?B?eTFwaVlPS3JScWtvaUdGNG5mNDk1OGFwSVJvcklFSFAya00yUjh3Q0w4VlVO?=
 =?utf-8?B?R05SVnNjQ0hJRklaMnBObDAxb01PVXYra0RncEpoZ0w5VVA0WURtWmFGRlpG?=
 =?utf-8?B?Z1RaaTlwR0RZZFp3M3U1YzV4YkNiNG9Wa2pvZjM0MEpNQzcvN1A2MElNQnJy?=
 =?utf-8?B?Rk5BakJhMUhpVWJscmFnZnpzU0x2Q3orcngyUDkyeEhORWZNRUprVGhPOWlm?=
 =?utf-8?B?ZEgwWW40SHpOWStVN1ptRWo4SnhtcHVlbjBKN3ppUXIrRFVIZGk5eXQrQ3JO?=
 =?utf-8?B?bVFSR21YTitrc3dGb2p5WTFiaU9nYjZVbG5FVS9maTl0MUtMSDJmNjBDSlNH?=
 =?utf-8?Q?DRardiA+6sU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlOZ20vRzhoc3J1ZlJRYWhEczYyTlVpWCtHQlk5WnNISnNpUHI5S1k5WFR3?=
 =?utf-8?B?UWhYT21CTnF1dmo3dU8rbE1mWmV1QzIzMW5VTFliaHdTcHJseURyMWZXM2Nq?=
 =?utf-8?B?eE14RTdoS0twOVgrZGhCSjZ1QVczYm5Bd0p1bTV6eGtrKzg2b3FUZ1FiNTlH?=
 =?utf-8?B?UGg5V2F1ajJMSEt3OFkzTW1hL1pCbTJCT1pJYjlyY3lkak9XN0Z6RmFrdzBi?=
 =?utf-8?B?RHMvS0ZrNzJMVjhlN1NNYU90U0dIOUMvTWhnYU1sQUVvbUFMeEJtclIxZ0ph?=
 =?utf-8?B?c2pnam9WQ0xpaHE4b1NJVkFiSGNLMk1VM2s4NWdObC9oVjVwR2prWW12REky?=
 =?utf-8?B?dUNXQnIzWU80N1dEcjJ3R21hdzFzYm8rSEFBT1pITjkzdW1mRE96K2k5WWp0?=
 =?utf-8?B?OEhKaVQwaEZNWWNmVjlJOERLY0xxTklCeFdyNWthS0dxK2N0ZlpPUkhwczQx?=
 =?utf-8?B?ZU94cGhlcUNsZEJwTHFSa3hlOFJqMjhrSGJESzVJTmdDdzJ4RUs0Uml3Q0RG?=
 =?utf-8?B?YkdjclF0Zmh1VW1aMU55RGhWcDB4NGtocmZWQ2VEVEVYQTVKWU5TZTVLWWg0?=
 =?utf-8?B?WVZ2aEs1YVQ4eWNGTCtpNjAwbkJZVWZUWk9UMG0wN3p5NW9uK2RDNjJ2Rmti?=
 =?utf-8?B?eXp0STN4Z1ZWMzFSdFkrY0tHSkl2WDZlQkVWaC9LTWxZYmtkQVMwdm43SUpm?=
 =?utf-8?B?SWxoV3VkYjJpYmRjVlN1M21CeUtqZElKdFhYeVg5alBDVFBFUE9xVXRzb0gx?=
 =?utf-8?B?cG1jSGtuR1N6UDdFbE9LVThTVzVnYklUVmNISmRhRkU2YTNYUG5vLy9BN0ly?=
 =?utf-8?B?UlJjZWU1MWlqclRvYXdha3VoQ0FOVTNOb2tnQ0pQbGxQTVJoeWgzZ0RtZkNZ?=
 =?utf-8?B?eVdwelM3U3RjTjdPUGxuUU9pRmZieEo1WUZzbzhsNmZrc3ExOUFyT1lrYTF3?=
 =?utf-8?B?VjN0elpSQUZweHNwM2tWbzJ4VjBoWmJ3dEgxdStkalViOGc1SDI2TkphcmQz?=
 =?utf-8?B?NytGek45dXArT3BSWEZlS0FJd2dyN09XL3hOUzUwU1NOaFJnS21LbXFzS3lO?=
 =?utf-8?B?eG1ZRlhaUzdROVY4eGUzRXpvQ2xqd3QrYmlvRkxaNFVNOTR1eFdpN1RZMWNF?=
 =?utf-8?B?aXpPVDRSbVJuclN1YncxODRaN2M5VFE1OVROMGdXNkRqaENDczVva0M1dEQ2?=
 =?utf-8?B?eXVmRkVtRmZrR0lnR3ZsRFo1Mk9Xa09jeThObUtjM0FGcHllS25IT3lPVVhs?=
 =?utf-8?B?cmpmcGFlUmdXRmo1RDJZWE5UZmROOFZQNDJ0U1JKYy9qYm5QWnoreFJzd2po?=
 =?utf-8?B?dzMvMVNQT2YvODlETHBpODUwZkE4emVtczNqaGU2Q1FEV2dabDZIekJaU0p5?=
 =?utf-8?B?YzBKTnNkZE02anU5aW1qUERPV2FmLzlLUWg1aVdkQnJuSTRFU0NQWlEyUGY0?=
 =?utf-8?B?cnJ5RkRqWExhbzEyRnpESWZjdSt1SThST2ZqZVZ3M0oxTWN6d0ZuT0FIcStp?=
 =?utf-8?B?SjV6MW5BMjR5WHUyMnYrMk1WQ0FLOTNrUEwyY3dDenZISGxIT0hGN1Z6MTRm?=
 =?utf-8?B?VVdGbktEa3hleC9Ybit4TDBSdjZ0SURYcXFiYlJPMGgzb1lad0FLRm5VZ3ds?=
 =?utf-8?B?N1cveHNWeWpSQkVsYVhNNVhoT1RaR1h5dlh3YTdyckFtODdJd01QNmRLcE1Q?=
 =?utf-8?B?QlU1bERrcE4wNldvNEtKeDJVRGJxS2U1ZnR1eHdPZUtqUTZsdENGdkg1bmph?=
 =?utf-8?B?TEVTWGRxaUk0Slo1ZHh1b1ZhaDB0T2hBRWlzZFVmSWV1WFhwOFF1Vy9TRndB?=
 =?utf-8?B?NzNlZis3K0F3eUNydkFucExwdElia2xDWFVyWklWT2dMcVJkdEswM3o1Sysr?=
 =?utf-8?B?YVAvVFRCa1I5YU0yZHR6Nm1QNEtyc2xYbC8rd3M0bmpTTWxPcEMySnhrV3JG?=
 =?utf-8?B?ai9tQUx5aEY2NXRGUXJmRGgram85RkVoYS9ISUg0UFB0b3kxd1A5UWhVUm1K?=
 =?utf-8?B?LzU1cnQ2b1RSUDNuME1CYzFJODMvSVYweWdMOXR5Tkpad3BrUWxrU0lrTEYy?=
 =?utf-8?B?b245eTViVzVBeTNMekRTZ2h4V1h2VndVQ1hvNFkrQUlMMEdVNGJVNHVGSjB1?=
 =?utf-8?Q?DhZjkwrfvW9kY/wmIPloGo1R4?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b92bc5b4-c5a8-4247-af9d-08dd9c5e0c59
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:03:10.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbrIcIW6SdYGhSNhRvhbu58eHwSFD2PYU4vgMNeIVqoQvCwwpOWLNpM3Zut+KQGb5ZpsgDOyB23368gKe28GrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0512

Am 26.05.25 um 08:32 schrieb Vignesh Raghavendra:
> 
> 
> On 21/05/25 11:03, Wadim Egorov wrote:
>> For the ICSSG PHYs to operate correctly, a 25 MHz reference clock must
>> be supplied on CLKOUT0. Previously, our bootloader configured this
>> clock, which is why the PRU Ethernet ports appeared to work, but the
>> change never made it into the device tree.
>>
> 
> Should this patch have a Fixes tag then?

Yes,

Fixes: 87adfd1ab03a ("arm64: dts: ti: am642-phyboard-electra: Add 
PRU-ICSSG nodes")

> 
>> Add clock properties to make EXT_REFCLK1.CLKOUT0 output a 25MHz clock.
>>
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
>> index f63c101b7d61..129524eb5b91 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
>> @@ -322,6 +322,8 @@ AM64X_IOPAD(0x0040, PIN_OUTPUT, 7)	/* (U21) GPMC0_AD1.GPIO0_16 */
>>   &icssg0_mdio {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&icssg0_mdio_pins_default &clkout0_pins_default>;
>> +	assigned-clocks = <&k3_clks 157 123>;
>> +	assigned-clock-parents = <&k3_clks 157 125>;
>>   	status = "okay";
>>   
>>   	icssg0_phy1: ethernet-phy@1 {
> 

