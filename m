Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18B81CAA65;
	Wed, 25 Jun 2025 02:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750819963; cv=fail; b=cXkCqZOKY9G18aJMyGpmbbxCGxzd9pSGz1k3+KXWp47CJwAqX1J5ClSCpZsory1+RgrcZUEKKeIS3CvT1ZWme+JNaRhpecdx7ZlSYQ9QIBr+d190cKQRHVmEvPwncO1Mm6JFgFQhqm3g9fe3I2LGcvxrj49gT/TqKHuNk0b5+9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750819963; c=relaxed/simple;
	bh=0c4ge6dPBDqf7TT2eBn3sAjFdUI5bg0T/elz/UOFpV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cTJ+ngil5LkaHXUInGaV87PbivrhwmWLDWWB7W9FhrVsZrvNvXV2SbVYl7nK+CelAnBFN0Fvb1Eh0fIgZTABsULaUW3Uw4bxRp00kb4ZFOtMK/Eqg6xnOzjx8aWRABXVykksNb2DA2cxxrHC0VKKx5d334ij+7ap+i858257OYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=qYHseYVL; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="qYHseYVL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJgYxtJrWY1vNvaFLoj+w9HbifA1wyudoDFnlk5HX6062w07zGORI9WrRoSaVJkcCYgIwCLszbjPOBCvqR5LPxdEGL1bn96G4KYC6Ap627qZYsxbNLVBej3M+L/DeU7FzIqJ6o1BLmyjoOCuphxHmLTiOEqvzaDVlPLCcujN4eC/5Eq6xUm92Hwa0qBpg16LatQRSzoC8KUm/P7CGXHmIDdnLAd6vp7gE7rIlpSyoOvcfFjGofms4LNNU61k7rDgAVJ8IkScnyf/uVKfDje7sxIxNav9hMzZwVbkhME+zpMM4GlLz2np/DM975bqjcTJaL1Gr26nYsRLApX6vT+0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/L9T9iRxIbXj/WXg6p7Vrd8Zf5wWiODiWIIwMLUn60=;
 b=kLgLj17aRJpQqJQs8GZnIqNuzp194gUOECq+5bZ82j5IhIRV3dBcJH3enyftm28D/MAEJX33aL4zY/T3IfqbjViLjBlYcsY9LjQMOyXtTlxePGBaaCmOOAc/kJfsyCx+S448phWI3vYBQrArPXZuJlF9vVJx7KGfn/06AZNNRC6Y/kt0KOFTvCYp0+QlphYQsF89uVvklyj0hNYF7+UQ6LHVcwmatAQsk0XWvHHd02bosq9iVrcORdKtOddSxmy5JDx0bF0eAv+cdg+qq96LPpcXlDinGIWwk9FNZVuDhC7nbLmZXFLwTB7cxTQH23IsYwAFioNcnKzlwPGQ9mxA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/L9T9iRxIbXj/WXg6p7Vrd8Zf5wWiODiWIIwMLUn60=;
 b=qYHseYVLwSu+5xXblAS3QI44Sha5DxhND7n9nVe6DuCODfrlEeZqPccniCYWUaorfeNHHZqmX+TEmHSWLndae8Z7ZOOtI7ruFH+Dd04lGoQB3YBQxR7grrjUxJHqIwlY2KumnbDM0x9vslensw7QgW+SCYq4ogoJaVuCvLUiTnpMWAidFjKAoVxsBI9GM/Jud4u1e8Hvan94u1cl+0W1t4NWPuWqPB8v+o128Z9GbkluF3l0Fnqv/hwYl3i9f1apOvn1M6oGinYoaf3+ZDHArQYCa/C6stvBlNzfhpcXhUKRPGXBGkPNg4ETJYOMj+FF36HSD70C27pBQiMxVwXbvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SG2PR03MB7279.apcprd03.prod.outlook.com (2603:1096:4:1d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 25 Jun
 2025 02:52:37 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:52:36 +0000
Message-ID: <22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com>
Date: Wed, 25 Jun 2025 10:52:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-5-jian.hu@amlogic.com>
 <1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
 <4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
 <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SG2PR03MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b07f18-070f-409b-daf0-08ddb3935762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWgzL0lqcWZFR0hRSmVVMldSNys2QUVtdG91MVdpWGtpZkszWnJUSjltZEZO?=
 =?utf-8?B?Rk5FdUJUajMxbURqdmlnNGtnRFB0bDE2RVg4Mi9COHduQytmUC9sM2VSTU1o?=
 =?utf-8?B?YzZZSGFnb1o5V3NUTzhIbUpSVTdmNW96R1ZVdXAwWnZPVHF2QmlweUd4OVdE?=
 =?utf-8?B?YnZGcGZqSTVkRHM0ZlZnQjJBTUNhalJYUjJOMDRlUG5ocVRzaUtDbi9OWVV0?=
 =?utf-8?B?eDNEclBBNzFoVjRpQ1VFRFlsWXpjell5dFV2U1NpZ0lIZ1F1aDlxa09IQlFZ?=
 =?utf-8?B?YVNZcFhRaTFrcGVCL2RDM3VPeE5IWnpPS2NDUFNHVFRWM3ZQSHFseG41LzI5?=
 =?utf-8?B?Snd4bjIreEdxZmk5elM0SFE0UEp2SThMYUpOQzNFQVdzNG1vOTU5ckNRVkc3?=
 =?utf-8?B?Y1pqM05Nbm54TFQ5L2h2UjJNZEFjZjU4bjhSRWZKZm4wY1U2eHFrbjRYZkpI?=
 =?utf-8?B?SjQ3UEtUQXp1OCtHMENxcFhLY0o4dU51MGRiaUdHMkh2bjR6STEzOEdxbE8x?=
 =?utf-8?B?cWpBUHZqVm1pbXBEMXkraGswTmlnTi9kMGZGTWgyNFZQT3pSMGF3aC8yYVdL?=
 =?utf-8?B?ZGRPai9YTXdKYXRJWTFja3RwZnpaZXUxTjlmeEl0YXdURm8yZjRyK3dDZEdx?=
 =?utf-8?B?RE9iVWQ0NGY5QzhVYmVLT0dHM3NlRWx5RjNMQTRlM3RQY29LWE9RLzJQWGpp?=
 =?utf-8?B?TGg5SU80TTQ1NlQ3bzV5NTRzbENVWjVOVENpcGZCbU5yaU1KbkJBR2o5ekFC?=
 =?utf-8?B?WUFXRUJocU1USGwvNThJZE4vSEdERWdUV2ZaN3NJNVQ1em9RaTZkQVdWQmZp?=
 =?utf-8?B?dUdzMXVWU3Rqd055T0o1L1NBMmxEZWZKZ1hZZkxHZ1Z3L1dRdzBaa3ZzRmZi?=
 =?utf-8?B?aGpmOHorVFVjNWtlWkRKZGQyZ2hwb0hieU9OdzhTQlBYWFg0amZ6RDdRL0Za?=
 =?utf-8?B?UzMvaDFnRjZMWE1uOXpQdXV3dnVESWJqOVBQcHhMZldra1AxcFB1VFZhRWNI?=
 =?utf-8?B?dThEbTFEaW05Snc4SU1HS1lDWnRHRUhYQUtTczVQaXdMQTMydTZpcnVCWjVs?=
 =?utf-8?B?SjUyNGJCWFBQL2RSQnhHdUNJSE9kM2ZBSC9ab2NpaWhxWVFpaC9rcUZyYkNZ?=
 =?utf-8?B?dXV5WGhYNi9DY2wzL0dKQVJhT0NwQTg5MEMrcUxBZkhhNzgvdHpnRzF1Rlk4?=
 =?utf-8?B?cTc1R3pXbm16ckxETWV3ZDlaUnNyVEQrREV4dUlYZ2tmU2RCQzdSL1A3aGpH?=
 =?utf-8?B?SmJMaEtXWjRYaVYxTW43M2N0R2YxdVliNGIwYjV3dXVSQkV0cW1ndEcyMDV0?=
 =?utf-8?B?V1k3MnFGa05VYmVsRTd4OW5kdDg4bXRtVnY2bEhFTHFUWWxYMWo0MExoMnQy?=
 =?utf-8?B?V2ZaZ2xNalVRVWNaM1NFZThYMWRlQk0wT3EwdXNaMkxlYnZaV1Irc1RDbkx2?=
 =?utf-8?B?RkpoZUVOaGNrNUhJK2dEWTJUSWNXU3NCQklha1ZwVEdrVkVLWUZwQ1ZTUXpP?=
 =?utf-8?B?bEVZQkVGM3M4Y0RUbXRnMEdpZmZXQzBCelpZOVZrT3BKdFBXMkZQV1lDUnNh?=
 =?utf-8?B?QkM2OGorcWdOOGMvTzE2TEFLS2FWRHBjc0xBZDBvMHp1dWVqRDNqcTVyWktH?=
 =?utf-8?B?blhhY0NtZk1vM0dyejdEaW9ZNVA2Q3VoMTR6NEx6dEVWeUk3Mkp4dklzRElV?=
 =?utf-8?B?YnBwdUpYbG16K3U4MndhVk1tZzR4a24zSGs0TEVOeWZBQktONDg5RXMrcVVz?=
 =?utf-8?B?c2xIekIyOWwyL2ZiakNDSW1OS21EekFZcEV3NjZvZzl4MmNCcU5WUlFReG81?=
 =?utf-8?B?ZHRtZlRuN3dXRGpzdDU3ck4wUjhNTzVQWDFsWXlvSFlPeTZObTB6UERjM3Ju?=
 =?utf-8?B?elNxR2NBdkdNRVNsclBOcnRCQXBYSXJkMUJFTFhaNGJ0MU1GejhxbHQ5UG9m?=
 =?utf-8?Q?s4BR5c4qLtk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djgxTS9ZYko1eThtQ2s0cS80UlZhUmo5aGo1K2RDdmNzOEt5WnZlMFd5WmpM?=
 =?utf-8?B?U2hlZ3BlVUI2SWFxd3REYmVpMWpTY0RsQk0wbHVyUitYK1RyaG44ekkxZjg5?=
 =?utf-8?B?dmNCZ29obHh1RTU0MllrNUFzNTRmUXJnMk9oQkVFTkh1eWpweFVFcURrTlA3?=
 =?utf-8?B?NThDeXMrcS9SamdTaUxjTkRka3dab2RoKzZzZkRIYVdBRkRXZnFmWGRvSW11?=
 =?utf-8?B?NnRsWEozeEZDNEdhVnBoNUdPMFFEeGRjY041cFd0dCtFSVdKRG5leTVEektU?=
 =?utf-8?B?Y1J5NTVXOUxseDFOZ3E2a3BoQTFrbzFvc3YvVnY0Wnp3M2hVTzZkMHF5SHk4?=
 =?utf-8?B?KzFyN2RuVUdaSkVpQmc5Sm9oV042YlJCUkVNaER1ZjBad3VqcWc1TzJxSW1m?=
 =?utf-8?B?MmJXeE0vMkRNa0wzZ2RVbUpudWhXSTVQOHc1KzJLdWo0UDJSS25LZCtoU3hj?=
 =?utf-8?B?UDBTU2NkY1BMaVhsSnczVllTN3N2SVdocHo2UkIvWDd2L2ErVy8vK0dUa09x?=
 =?utf-8?B?aUkwUTdYYzhReFgxM3JvK1lkNXNNRkFMNlYydmpGd3M1WnZCcTA0d3V0RERJ?=
 =?utf-8?B?V0ZLcHVWR216SEpaWWswMUVYWWhINUhuU01idFcxaUFxM1Jxb1NObm8zMmhX?=
 =?utf-8?B?MHc0bDVKeWNCOXR4YmJYUklIaE81ZzNHdGtFVXhDeWMvTXlTeUtpQS9jSTVJ?=
 =?utf-8?B?YjU2THVTTjhRVzVJYm9tOXc2ei9XRjNuaXdpUzFMM2dhNmFRaEVPb3U0NTI4?=
 =?utf-8?B?L3FDOCtOUnhLVCtXN1VGZlR1VHdDTW5uL2NSaHM4WGpUMlhRYnp3Tzd1KzE0?=
 =?utf-8?B?dDd2c0ErQnRwdDMyd09xM2tpUUhwSnk1cUljbTNUckFQNEwxUlo3RjlrM3c1?=
 =?utf-8?B?WTdKVEdJL08zZzBTaUFxckJiMGlJTkMrdDA2eUdjaEg5TUl0WDErRGJEd0hR?=
 =?utf-8?B?TkNwNUtPSGpzU3VtTlpneHY1QVNaNnR5V3pJalkveWZjNFQwMTJqanV4UjBP?=
 =?utf-8?B?cVExYW0wd2VuNkFYUmk0SFVqbVFsbzVhaHlOS1FCc01MdmZMN2l5VFNCZnE2?=
 =?utf-8?B?Ymc2d0psRmVMQlpPcHM2RzJkTUxMUkZFMGRlTWwvQndoZG13VG0ybEozVGNY?=
 =?utf-8?B?Vks2dXVYelBLekNrWE5nVEE3ZEVmYnFHYTJFckJwMkdXUHA0bXlpUFg3d1Vu?=
 =?utf-8?B?cWoyV0p6emdFK05sa0M1dlBYbCtacklsaG1DZE9XTG5Pc0Frb3U0NHZta2x4?=
 =?utf-8?B?UGM1OEhFZWFFeWlCVlZ3WTZTMy90VkYvVzRWa3ZqZDZVaXdjdmY2Y1NjL3cv?=
 =?utf-8?B?UUNQbjRkRGlQTmF1aXZ6czNqMDZaOTc1cWNSeWlCaWRsbUJJVkpqa0VYMzQr?=
 =?utf-8?B?T3JsZVZZemtRT2ZXdCtUUklYVHZrTHovQnBBOHVONU5FcFdzN1VMMGVBN3k3?=
 =?utf-8?B?bGVCOEwzcXVUNWRoWWVwNURpc3ArY2I3cTZiVXlzL3g5MHNQajg1Z2xhei8w?=
 =?utf-8?B?OVNoRlBnTXpWczBGc0lZcFhyTHIrY1YxTGx4azFXcUlia21wWUVheU1STXJK?=
 =?utf-8?B?TDhMKzZoL2VBTlJOakx1RlRydU1YbEhBSW1QK1BOUUdGZTFxT0ZQdDdwcnVh?=
 =?utf-8?B?MVpyZm9JNWZCRG45V0JHL2orSUd5VisyTzlaMitXS1JpMi84K1VkUEZtTXdZ?=
 =?utf-8?B?T1RjYWgwekVIN2hSQUdBcDdZVEtGN01VQkFpbyt2bFV0amZ4OXpDTDhaTHY4?=
 =?utf-8?B?aXEyL2RkaDBqUnp2UnFvbzB5cmFRSWFsTDR5bmNnaVJ6L3h1NTFCZ0lqSmlB?=
 =?utf-8?B?UjJRc2VISmR5RUdoY0RZU2kwTFlTRWFOOW01MGdOU2ZFTWlvVkdsQWpQbG5r?=
 =?utf-8?B?dk1sWGtiZkxncTEvSWNZbEQwNW8yalBYVTNja1lCbWRUdUFTV1pVSm1sUEk1?=
 =?utf-8?B?NmFna1ozbGNIYmlyMkRRTEJWRVMrbkpPdjFVRWRZMkFPVGZ1RkF3Tng1bHhq?=
 =?utf-8?B?Z2d3Q1UxN1JWK2JSVHVmQ3hNbFROQkhkckpZOUk0cXhyVVJIVm5WSEwweTNG?=
 =?utf-8?B?eEVyUXZpcitITjFpaEVVNVRMTll4ZjhFWGpGTlJuOTdLOElCbWN6eDl6ZTcv?=
 =?utf-8?Q?AdSn2l8YwcOnoBd2VMgDAgSF1?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b07f18-070f-409b-daf0-08ddb3935762
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:52:36.5720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6PyNy4kXnYMPkxyfKwzti+VoTLLQ9qbYpjsZBCuXyjaTYqJErIxIdOYGqu1TMFuPlNFx6r1BU001r1iZ8Wclw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB7279


On 2025/6/17 0:27, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu 12 Jun 2025 at 21:02, Jian Hu <jian.hu@amlogic.com> wrote:
>
>>>> +
>>>> +static struct clk_regmap t7_pcie_pll_od = {
>>>> +     .data = &(struct clk_regmap_div_data){
>>>> +             .offset = ANACTRL_PCIEPLL_CTRL0,
>>>> +             .shift = 16,
>>>> +             .width = 5,
>>>> +             .flags = CLK_DIVIDER_ONE_BASED |
>>>> +                      CLK_DIVIDER_ALLOW_ZERO,
>>> What's the behaviour of the divider on zero then ?
>>
>> If there is no CLK_DIVDER_ALLOW_ZERO, there is a warning when registering
>> t7_pcie_pll_od.
>>
>> like this:
>>
>>    ------------[ cut here ]------------
>>    WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:140
>> divider_recalc_rate+0xfc/0x100
>>    pcie_pll_od: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
>>    Modules linked in:
>>   CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>> 5.4.283-09976-ga803e94eed88-dirty #91
>>    Hardware name: tm2_t962e2_ab311 (DT)
>>   Call trace:
>>    [ffffffc020003750+  64][<ffffffc0100e3e3c>] dump_backtrace+0x0/0x1e4
>>    [ffffffc020003790+  32][<ffffffc0100e4044>] show_stack+0x24/0x34
>>    [ffffffc0200037b0+  96][<ffffffc01130a2e8>] dump_stack+0xbc/0x108
>>   [ffffffc020003810+ 144][<ffffffc01010c484>] __warn+0xf4/0x1b8
>>    [ffffffc0200038a0+  64][<ffffffc01010c5f4>] warn_slowpath_fmt+0xac/0xc8
>>   [ffffffc0200038e0+  64][<ffffffc01061d364>] divider_recalc_rate+0xfc/0x100
>>   [ffffffc020003920+  80][<ffffffc010624e84>]
>> clk_regmap_div_recalc_rate+0x74/0x88
>>    [ffffffc020003970+  96][<ffffffc010616a54>] __clk_register+0x62c/0xb78
>>
>> so add it to avoid the warning.
> That does not really answer my question


Sorry, I did not get you before.

I have set OD to 0.  And measure pcie frequency,  It is 37.5Mhz.

4800Mhz/2/32/2=37.5Mhz, and the OD equal zero means divided by 32 in fact.

Here is the test result:

devm 0xfe008140 32

0xD40C04C8

cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep pcie

[16] pcie_clk_inp      37500000  +/1 3125HZ


the OD divider is N crossover. it is one based.

and It's possible to go from 1 to 31 crossovers.

