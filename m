Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E272EA158;
	Fri, 27 Jun 2025 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040641; cv=fail; b=e1htW0hLtPK/Qae2HFjspvk3Xu+6DopDDDp6LAPXbMKZ/3p2NwN4hDkLCZ6qbnWxV5ng3Kq7NI/hjWGO808I/EJ+4UFl3hn6J9Nt93FImBfXeZQdWuF7tW+u2PRUVKDPi0pFrTV9STpOukk11N8oDBU15CIrKf9dD/y0lwmnLBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040641; c=relaxed/simple;
	bh=ZNf/XLU1xtXjT8cN+8GLjjsqqwjfEi9Jf5QIPy/d0TM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bMf7kuIxxrgpi3noZKY2/mnn+zfA06OQRERx86ZM7BXMtITHcHa9Nl0EUGakXPmS2cCl8h6dFN3Mnqbubd2HgsY36F624W6MMwuWOEvTzUEaaD5LslRUgBRBvnL/fZDSiKd7g1yK+TNRAiAWZmtVsR7adzbgKlyScc1Z1kkBHok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=I28HWF7G; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="I28HWF7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FML2eITx+gpAuu7VOeA0GhQe9u7t3hHQCVLQocLAhz4cbu9g4Udy3sSN8ZwB0+MMv+VfYiMP+jxYg/MWfzUJlaexgon1KBZwwNOqz7SYjQv+JSeEoEP3PtTKUFGOMOioAOv0aZk0lcJNTbbCbrhaJY+qOjKNWrFSbrPdP3LmPMh9zD0jK7AM3m6tWUyoF0zsi5pgo+wlAx+afQKMSPgBF+HEi2URs5+z10qLQr/yfusZgZqL2CsOBI1Qdr/18HtVkW1spUeW1CwJajRBlZs8H1IkNJYK7yaX9DdFXbahN+vCXWZ5XJcXYCHgavdnGVFWh6G4lJr0KIOAt2GmxEhYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iWQ0IUzMmAmnZqCF42sy3SPdl0255YmRxdRT+U19qA=;
 b=rVDaT0EpowJ2JzaAhS56wmQTY3DDw+dNECm51LkFE9Nh4luAOvU7IGp0XYdLaFuD50iRDOrGk0CVPK18AR8wieRRAtWk4Hnhtmgoak+h8JWepvCG08b5G9VLLbQO7YMpiYNhnRlo6ljIj3qCCBeVXQrFoO80JVLFY/D7VKIWS1+zdTQIAsAZKfiZPujyHzPL0zXv1pqI1urcmM/Zma+1nmatf7oFx7oaEQqSXX2qQudhr8J0j9SX61k+55W7OCPOLjf3NB0vxHJQ6v7p5n8op+Fu4P8OaC/dmfq94w+cQ8S/3onm4dplSUKSKmv+EBKfF5gUwdu+jON9l7Kh87GaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iWQ0IUzMmAmnZqCF42sy3SPdl0255YmRxdRT+U19qA=;
 b=I28HWF7G0MFi949c+KeiHujrdkR+6/1eKKSVRZpl3BYrccl/X+P8v5GyXmP9eNWz1+SALRtub7thoeZ0vSHlv5PYz5xQ4lMONMNe6Nv8Sn3ne6W85+TGz9j36AbCbUFUumgv9VNMfZLhpDsI6TOzOGuVVZWRT/5RxGRml7iW/JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7493.eurprd04.prod.outlook.com (2603:10a6:20b:293::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 16:10:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 16:10:32 +0000
Message-ID: <b1c789bf-1369-42ec-8bb3-d7a45c92abf0@cherry.de>
Date: Fri, 27 Jun 2025 18:10:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250627152645.740981-1-didi.debian@cknow.org>
 <20250627152645.740981-3-didi.debian@cknow.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250627152645.740981-3-didi.debian@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0026.eurprd05.prod.outlook.com
 (2603:10a6:803:1::39) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fbc504-b44e-4a10-a5a2-08ddb5952496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkR2UUNEQ1dwdDZ2enlHcFNYOUNPcWpJbjNvN2NQaUNMV09qTmNDVTc1djVP?=
 =?utf-8?B?K21HbVF0ak1FcGd6RnNVQ1N3TjZKYm9CZm0yK1NSWkpHMUMrczFtNlEyVVNl?=
 =?utf-8?B?RHQ0dlZkSmtKazBTRGJ0b1VORlQwYjNhZDVHdmNjTGdZdEF6eGJJWEJ6NDlw?=
 =?utf-8?B?QWlMVWNiTEQ5L2lGOE1YL3ZiaTNraERTVFFXY0hVN0ZaZmZIT2Q1QVhrUUVu?=
 =?utf-8?B?WFBlZ0FyQUxqR0V4NlF0SmhHdmorQ2dpc3pJczc0MHVZODNJeDN3UlowZ2h3?=
 =?utf-8?B?bGZtMzAzRGdYekU3T1hkWDRMUnk5QlNrMHYrS0xyZEJpTUNCdmNWSTduSGN2?=
 =?utf-8?B?aklvUnhGbi8vU3gxbi9DSnZQRmYydkphVTdHL3VLVEIvSU5sRzQyZC8rUDhK?=
 =?utf-8?B?RE1uOEdpVCtmUlhnaXhEQkVac0dNNEhBQ2pPTkxKU1Y1NzZzdWkrdXhPczVQ?=
 =?utf-8?B?VG9GT0Ewd3ArR214ZjJHSmgxeGRsSEF4cmxaRXY0aW51S3JVMFUzNjB3MDQw?=
 =?utf-8?B?cmRnR0JkNEk2OFVRVFpEZEQzY2llV1VTVUJqTmNZWFpXWVFSUDEybGVJMWpz?=
 =?utf-8?B?SVFlUmpUWUs4QXhRTlNGL1JnNmdZMW5Vc1B4V0E5eGZFZlJFTmU1K25ScUxM?=
 =?utf-8?B?OFAzZm4vd1pUY0NUVUdGUUxIT0ovQncvTDErSDZhSGJLT3hRY0VSQ2IrRmts?=
 =?utf-8?B?Wk5MYVNjWjhGQjl4czZuWU1FcVR4NFZiVXMxMDRMcW5OYUlXNnQ0dEhxTTkv?=
 =?utf-8?B?Tm5vYUVmTUVBeVdpelBoTmZKc0FuN0M5ZEgzTmgxUGtxMWZFV1phVjZtYWx0?=
 =?utf-8?B?SVhWTy8zRTVLMG1wVy9LcC94NFBhb09aWFJQRml0M1VUWkVvMWhUNjNNQ3VO?=
 =?utf-8?B?b1o1blRncHQrcjNsK2NHTHNMYVdqZ0VBbkI3ZXByWGJvUXJtU1kyODNqbG5N?=
 =?utf-8?B?NnI4Y2pLSlcyY3ZqNVk0VDFhaGpub0NENUR1S21VeC9vM0J1WmYrZEpuaU40?=
 =?utf-8?B?aEM3RFZQMTVKU01kUTFtNkprUVRnT3dkVGRsaktqTkpLOWlJeE1HNmNNaHN6?=
 =?utf-8?B?MklkL1JIK1RtQUYvam1rdXI3OUtVdTFxSUpIdFFHV1ZmaEhuL3Zrekdlejky?=
 =?utf-8?B?UUtuS0h1Wkw2Vmh5Q21aM05QNk52ZWloNWwzTWFNaHBQVTBJYTRCQmk2T1BS?=
 =?utf-8?B?R1IzSFVZdGtMdFFiYTA1NWJUdjRUcnRwdDBJYUYxdi9LNzl2Wi84bGw5RjIr?=
 =?utf-8?B?RnFkbGp1Y2o0SjlTV3ZwK3FrVGYrbG9GRWpEcUxGdXNnL3FOSHJ1MlkxUFli?=
 =?utf-8?B?Y2FJbzArMFQ2U0V5bUd5U0Zxbm52Q0syWG5pVm53TjB6R2tlbSttWGZzckQ4?=
 =?utf-8?B?K2pVbkhSZm5WdG5KVkVBU0l3N2lSeitoWHoxWklZM1VUdGFmV2o5SXR0Kyt2?=
 =?utf-8?B?SDNYeFpYTER1SUdqZjFUVVFMUE1RQkk2d3JsR3VaQ3BTSjg5UWYrZHIydXls?=
 =?utf-8?B?cGorOUplMDRWVWh0OW16cTNuRENSK3RTUUZKR0ZDRFJlZG5OTEdObXBmQUE5?=
 =?utf-8?B?cGJvenhaU0h0ZXR4VkM0T2JNTDBLM0NqQ0V4R1p5QkZrMEdiS3JsZEpiNXNT?=
 =?utf-8?B?VmZGUnNwMjk1Z1ZvNzNPMUFSSUhQeEZqTG9BL3FuRTRleFAzVnFRa1UxSHMx?=
 =?utf-8?B?aTdXVGVYVEY0b2R6dlBxYXNIdXJqV0taT3VBL1Z4Z0pVcUk1akIrWDhYbVFv?=
 =?utf-8?B?djE1cGVLMmxra3FVUHp6ejV2UlY0TTFnSnZTRTFtcFI0ZXJZdTBpdHA1NDdU?=
 =?utf-8?B?VWhrOWl2S3ZCL1FNMjVGMnV4Vnp2N1lpd2Q5b2J5MFZSaG9iWk1mc3B3a2F1?=
 =?utf-8?B?b0dSTURFNWlEU1NMRjBONXZvdFhGTlJlaEJKT2Z4aEh0eWY4dWpwWDdCK1B4?=
 =?utf-8?Q?kxrG9CFjV2E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmRYb05VS3VxSTZrSTJqNnR5Z2xub2FTQ2xYM2FHeVVQeWFQMVg2T3U0NmM5?=
 =?utf-8?B?OG5FUDN6MjdxRFhhMnpOMysxaC9VMFNhOG9IREtJbVI4cXdVS1E4dDAyL0VN?=
 =?utf-8?B?MVhwUG5BSUtFcStSSHRHYnlJK0Zpc0NNQmZzRDVINXVDVEVPMmR2UkEzbjFn?=
 =?utf-8?B?ZlVPdjl4bXJ0WGpKWldVSTUyeDdEakdVSjYvUmNncHpnRmZac3dabTNHcXZs?=
 =?utf-8?B?Z0dOSExmYUgxTDhBbTRKQjFoNm1QUDB3U0hJU0VPd21YVXNmSTZRR1ZPK0xr?=
 =?utf-8?B?TUpyNTVoSjBIWGxSRVRjNnpONjN3emZiYkYvUFJIeWhNbDFXWnRIUDBhbHRM?=
 =?utf-8?B?UEVhd1cwN2RvckF5TVliTGxZeTB5OHp0dFJsS29QanFLV3cyNHU4M3lMOXFt?=
 =?utf-8?B?dXpXS2RBZUJKRWVqYkFhWVRQbHl1RkFVOWVzTUpXa2Z6Njd1RE5ualZ0MFQw?=
 =?utf-8?B?d2ZnL2ZJd0FEQnN3RzhmK1p4SDROMUFMcjE4YlhLZXRnVm12Z0txblRTbTZC?=
 =?utf-8?B?c3VxdGttN0VyRXBLV3d6RDJWM2pKKzFtUjhOemZOWmNOK05QbE9uY3NEaUpQ?=
 =?utf-8?B?bWtDVTJocnlDZmJpVUNuKzh0bkF6aC9sYUtURjl4cHZEaWJsODU1aHZ4WHZW?=
 =?utf-8?B?UUl1TjU4Nys0cklRcmVZZVZLeW1nUFBrRExkd3JBbS9nTWNaRFc2eS9KdHpQ?=
 =?utf-8?B?N0JaSm5tYkpLODVrZ1FMMXdidG80djRBcG5iRjBoUjlIZHltbEN3ZkJvUVk2?=
 =?utf-8?B?U3NFdFJiejZpZFBMbnVwVFBRWmJrdGw2SnlzUVlFRnBINkpmaHlBb25pOVJF?=
 =?utf-8?B?aC9hNEJRVksyVU43YXdTaGhycklnUkdmZ3hMbGh6ZEJYRGg2dEZxVi9HQmJw?=
 =?utf-8?B?QUh2ei9MZzFoY21ZYlpHdXN4bzBUeHp0UUhMR3Q5Wk5LZEM2VHY5YksvOWhD?=
 =?utf-8?B?VFp6T3ZxSGRDQmFENVV4SkdhK09pazhrSXZNWkxLUHhOT0lSaCtzWUhFQ2R6?=
 =?utf-8?B?YmlweFlBN2M1T2xpYjVJT2Fjbys2UTErdVZ1d1pGaWJEcE90VFR6WDlicnNQ?=
 =?utf-8?B?QVFIc29IRnFoa3dvbWNuT1FvaUpJcEd5THRqSHVwWFlVWlJnODZmampoVWFZ?=
 =?utf-8?B?Wng2eDdlRXdxN3gzU1R6TVJPcDR2RVUvaExBZXdzclpoRDZPU2NrRGExRWRn?=
 =?utf-8?B?MEdBZi9QTlh2RkpnT2pwTEtUZzlYNmpoa1VmM0JiZ3FSVlN0SkI0cSs3MUN2?=
 =?utf-8?B?VGhORlgzZUx4U1NJOW1kSFpYSVRvLzNMZW4yZ3UzOVNYNkdsSjhHb1IvL0hB?=
 =?utf-8?B?Z3ZFZ2lXY2FlejRhN2FlZ05yb2JPUVdMMXlicUFWcDBHMnhrbzREUFRCWWNY?=
 =?utf-8?B?WWk0RUhiKzJ1SUFQRktFczMxQk10RWJzNVpjSW5JZ2dvODQ2a1ZXSTd3dStx?=
 =?utf-8?B?Z0FWOS9qM2R4NVkyc2pFTHlMV2hzLzlsZ2E1SUZxcVB4ZHh2N1d4dXJkL0pE?=
 =?utf-8?B?VFlpYlBTbDdNZE5HU0czQUlXRnJLTGNDQ044TjZXdnBjbEZWemU4SGJLcytp?=
 =?utf-8?B?K3hKSVQ5Zlh3VmpySVBCcmQ3WDVNRWRSUnh5S3NvTlAxOFgrZHdScEJ2NUFX?=
 =?utf-8?B?cGFxMkY2eE1vT2xGclF0L2ZndjJqdTkwZGY2SXNXV3VMcHZMdXhMNkZqSEJO?=
 =?utf-8?B?cEFWb2JKaFhtT1Z0L21uLzkrbzhMYVYzV3lOY3RZUWV4OEhtUzBuQkhKcUI1?=
 =?utf-8?B?RWloZXJrcEJWempITll3ZGowSFVRU3p0VlZXQVUweVludWxwcTV0ekpuWFRt?=
 =?utf-8?B?R3JtK0IwaUh5ZE9NMTBkTm0rQXNnVzQwZFlxQkJxN2VmcHVUOFUxS2Y5cTky?=
 =?utf-8?B?YngwZThJdWVORmlOek8vWGVpejNHNnZ6TnpPK2ZVOFJTVWVOSmtHZDQxREtI?=
 =?utf-8?B?K3FyTEpwQjhmdU9YaHNNclBNK0QzVVNhZDExTkpDbTZHUXN2MHZrQWgzZVRx?=
 =?utf-8?B?QUN5b1U5bUpmVHZuQjl1NE9FS2tvQkNHQjBiR2t0L2FYOWtUWnU3RkJGQkJ3?=
 =?utf-8?B?QkRWbVgrMWVPS2M1Y1RkL0p5WWNDVDQ5OU03cmJsaStQZjlCWTRYQWcyVEtO?=
 =?utf-8?B?b2Z3bk4wQWZJMWRSeC9PMXVvM0RLdXhIaXBLeGpUT29QRkE5UDFvS0YzbHBs?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fbc504-b44e-4a10-a5a2-08ddb5952496
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 16:10:32.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmFayoARmmGnDCrzzg1RODNAFrptoXNZY7m4xsoG3tWMDLYK3GOuQX0378C6oHde4Jnfc4qLhrQhzqnz7Sq54tUQH8FZKHRetCnBq92L+Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7493

Hi Diederik,

On 6/27/25 5:16 PM, Diederik de Haas wrote:
> The #address-cells and #size-cells properties are not useful on the DSI
> controller nodes; they are only useful/required on ports and panel(s).
> So remove them from the controller node and add them where actually
> needed on the various rk3399 based boards.
> 
> Next to that, there were several (exact) redefinitions of nodes which
> are already present in rk3399-base.dtsi to add a mipi_out endpoint.
> Simplify that by referencing the mipi_out phandle and add the endpoint
> to that, which allows the removeal of the ports redefinition.
> 
> And fix 1 instance where the mipi_out referenced node was not sorted
> correctly.
> 
> This fixes the following DTB validation warnings:
> 
>    unnecessary #address-cells/#size-cells without "ranges",
>    "dma-ranges" or child "reg" property
> 

Too many unrelated changes in this commit, please split into multiple 
commits.

I could identify:

- moving address-cells/size-cells from SoC.dtsi to board dts(i)s,
- reordering properties to better match DT coding style 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node
- use phandle to directly access ports,
- reorder DT node to better match DT coding style 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-nodes

The change for RK3399 Puma Haikou Video Demo DTSO is fine for me.

Cheers,
Quentin
