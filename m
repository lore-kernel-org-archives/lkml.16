Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE2D189F43;
	Fri,  6 Jun 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198329; cv=fail; b=LJ0nP8Rd8oSBsOhfolUWIW6zoKHCi+qe8BC9dU7FDX5M8xGSGikI9m8QWUFRRvFY39dXBnbB682lJm9q9P/vMBy8J2YD5BCrBluejwB60GuaBf26MgBSV3XjyiESzulpAoZUUeKr52OFX53niXsM3WYZvd/L6jnmdSWzGRKs88k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198329; c=relaxed/simple;
	bh=Zz7tfc65JQmXllDwbdqInWmnvMGhihtCEJqzmvSFqks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iK0MxI9uPPNQR6Gc/6Xgy9HKG9deRGUCkX1odh8tmhM5j1KG9BU2o/PP0es4MopEm2FOnhs2iz74vugd39J0lRDZ4fPY38kx4zx3khMLoUlAgO3/AhyFJ9YaDFKZ+vA7ZzMZyFzk9Vb9RiMV7NKi8+673HzqiO9hEk5iJP4qHs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Xh0FvoCV; arc=fail smtp.client-ip=52.101.84.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Xh0FvoCV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9b7xrjLql3pPSqR2c3jB19i26WvEMCzOWkVEx3RvNCoTo0KuiuG7mLlTOHdAJq4/UdvLcIa4pMDIDy8jAIlIF8EXz4tpvggaaCtlFy45LINVAq1NH/WL6rVLnI9Hj9pBf7NQUIIAugqsswcY458IWoKcmXfI8kiDT6NYEY11nCS2hKVcpsOZ5kIhZou7hwkCL46DR6/mfhXbLr/49tBhokNA6A8Xf8SSwE+I5jfXkYdIeHEcN/F+IxqX50Lt6licQZfKwxuBPb26f5HCo0N/1qu0grjMNj0uE1z1S/tunLiTZEmeR1W2EbeorjRqYeoH4AFF9O1s7+Xh3pczkCtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPcRIRAEq49vhvtSZzrnpSxqIL6gZ0RoTJdtil73Idw=;
 b=G7Yn5vCWBQW2QiwkZSIKnMcYYCnTLFEF9Gv2+VAZk4297e9RI+8u1SpQjZ73Kuyp46sfke6qX9FA4Cz9bsWePyxtgGlumlTuzR2UWeqzamy+9XAma8ajQPWm83wR4gsqx/LxDw+J7U2ZaZWbvyy4+uWzooaYvU8j8tk0RbrJ5RAhysDrl+XshLerNCExBhClRokzTvQIXCIe9Bn6OpNE61kzODGLOFgnhsdLTIiuXFsnQWdS7LGqM4me5t7nn1ri+q+13TX9tueWyMyta7C2Q5TGvsBRNpE6QP3p5ZPtQqFRQUyqnpcpPYYqAtYjdvDZHqdHyxhBGvaI8C+xbwnR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPcRIRAEq49vhvtSZzrnpSxqIL6gZ0RoTJdtil73Idw=;
 b=Xh0FvoCVxJZLogiUhwl/Shu0ITsU/dbPtNpD2glhS752i29d6dGaBygn5v8hbCxCM71dolnOcOSvLkMtilTLP0zqMa09pMcUYlitv3ReOo5zZWqjGqcU0k8zT7oaDHYOeszU5IRRMyDmNHYTcdPGSDEUtZf/1stji8j6Xc8Sg2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAWPR04MB9986.eurprd04.prod.outlook.com (2603:10a6:102:380::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 6 Jun
 2025 08:25:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 08:25:21 +0000
Message-ID: <4187f107-fef0-4482-b563-1c3d3e7ecec8@cherry.de>
Date: Fri, 6 Jun 2025 10:25:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset method
To: Rob Herring <robh@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
 <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
 <2577051.irdbgypaU6@workhorse> <20250605194159.GA3039863-robh@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250605194159.GA3039863-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA3P292CA0032.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAWPR04MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2a23c1-e609-4e7f-9749-08dda4d3ad50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGkzSi9iV2x1TEFzTTUyMUhLVDc4QU1laXU5d3lvOXBVNk1ZNHBuN3NKeHFi?=
 =?utf-8?B?RzUwc3JrenZzMmNQR0RLbkgwbEpURlpQZWNLRkhJcmdRclRmV0VMVy93SUEr?=
 =?utf-8?B?SjZhYkFKMytMOUowaXQwZWZEOXpjK1JyMWZVdlQzUVRnU3ljNnF5ajIyTTZy?=
 =?utf-8?B?akNndTlpOXRJSHhOVllYQkh4b2lhZjFEVEZsQnRNSFBRUDY4cEpDWVpGNGJz?=
 =?utf-8?B?QjdKTk96M1hNVjRIU2dUSDN2OTVKS2lHTkVWWDF3NlNaSHpsSDJXQ1NpRXJG?=
 =?utf-8?B?dG50ZllFNHF4V2JjMElqZGNxMVRKZEUxbGxkN0pyWEVsQ0phOUhJVlNEdG5o?=
 =?utf-8?B?OFFBc3dnNUtGaUtvY1V6cTY4TVB2VURkRGl3TEFEYktLQjU0ckJyWXdPZnp0?=
 =?utf-8?B?VzVtZXBERFpyRkJHTTV1emFjUVZXbnlCNnQ2Ujc3dDRKTUZ1SVB4Ynp5VWIx?=
 =?utf-8?B?bU84cHE4T3JzenZZa0RLbktpb0FkVG1qMElZWEpyRnNNcUl3SHZBbnREN05p?=
 =?utf-8?B?azhKWWxnSStYc1BGbzFtdkROSFpoZElPcmR5ZFR0R0RIaHhPZVFLSExzbFRU?=
 =?utf-8?B?SHpTMG83YXVTMklHVVR6d1NCdFhySzBRZjJTQ2VZdGkybHF6bUVhYitSekk0?=
 =?utf-8?B?bXlVZnJBNHlXMnpiU2Y5UGRZT2MxNSs4azNtS3ZMb1daL0F0U3h6aHJZL2tR?=
 =?utf-8?B?RUR2U1NBcS9ibnhtaDRWSU9oSXRPM3lvNzIzOENzUm8xamR1ZkltQ2Z6SGdC?=
 =?utf-8?B?RVZtMmlOMnNCTUROQjFDbUYyWXN3ekRNSG5ldEZQdmo0by9UbkEybmVud2tZ?=
 =?utf-8?B?T3gwRi83Si9ENzh2MjhCZkZ0dEJSOHgySEVaS1lGT0tjWk45RVBFVC9ab1Nt?=
 =?utf-8?B?TGR1Zk5Cd043UWo4ZVovb29QNVByV0RPdHJOQWpSY2w1NkdXUUJqVjlZdldK?=
 =?utf-8?B?Z2dUUnpHWmVjYmt2eTlWQ1NPL2g4dk5KRVdBZmV5dll2anl4eEFlNWhBTWI5?=
 =?utf-8?B?Zi8yc3lvaXIwQmR6OCs5MDE3aS9YVGJkaWJGTGVZYjhSUmp1c2pqMGltdEcx?=
 =?utf-8?B?eG1INlJhelJNUjNNYjluNGpDeDNmWU9hRHdaRTNVM0I2cE5BMzByK3djQ2ZJ?=
 =?utf-8?B?WUpEU3RCZFlYNFNWaGxCQ0NIRmZTeVBwVFFxV0ZPWTJJYTkwalBHSXRKaFlE?=
 =?utf-8?B?Z09ueVVVODNxMTFJMEpzQkI5ZXhqOWRROE9nYTFvWVVpQUVrSGE1cENOSk05?=
 =?utf-8?B?WGNvaWErVTNZRGNtS2RHSnd2SSthVkJaZ0NXbDhjK3FMOTAxMFZSdTVTVEJP?=
 =?utf-8?B?YXhsYzdSTEtPdGJaSmVDTkNUVHJmTzRuTnFHVndId2NxQXF2Q09CWHM1SHlV?=
 =?utf-8?B?RmZrWmw3T3Q5cFRMNVQ0M2FvblN0K2V4YWNyMXVoNmtFWlU3ZFNndWFzYXk0?=
 =?utf-8?B?RUtGT3Zkck9DQ1V0a1ZxbzJiWmo5R2JyNzNIWmwrU1ZMaXFlVDlBYVAwVjFa?=
 =?utf-8?B?QXNkMndKWXVuZ2pzWVAxYk10VnBKL0x6K2NJelZBa0hodFlqdHZWb3BxNmxu?=
 =?utf-8?B?bm01U2Q4cFpMcHRpTDlNU0t3M2FLTnRhTjFRVlJRWnVrbmhGcUNpTWVkTWlV?=
 =?utf-8?B?RXQ0aExDdXduOEorcFQ2TDEzMXk2N0NNVXdka2ZmWmlSZVdJQ0ZuRnRueENY?=
 =?utf-8?B?dzZOQnVKeWZDS1Q1K2lEdUJ0aXU3enprSFBGaEZGMmdWcnVaR0oxSjA1UUNu?=
 =?utf-8?B?cTdmcmdrQ3YvVWJXQzVtMyt1U1JiNWl4TU9nMlFOZHZET2FQclUvSUFyWFhY?=
 =?utf-8?Q?AXcpn0CI4i7nhL7EpEeFrq0s8LPbWHpGUxwyU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmQwUzJhYjRCdVgrc2ZEU29VT2hoeGp4VktzeGppOW5tOWtiakxvZjZJWWZL?=
 =?utf-8?B?WFFGdTRHLzJ1UG55d2xiZWIvd3B0cVUxOHFJVWJ6SENIL0pQakZnN0U0QkFU?=
 =?utf-8?B?aWNjSXRqbmVsUmtEMGV4QlozNHp4cHMzaUY5NG9XenlyU3oxK2phRTc4NmF5?=
 =?utf-8?B?UEcxcFdEbnhEK1VQc0EvR2JHRkNVM2dyY2Y3UEFORXkrQ2o5d1Y5cllCcUJy?=
 =?utf-8?B?cWFuQ0d1S216MzFFQVF4dFlOUXJkR3AxeUVpeDRDZWt6Z25kOGE2RXprYzhE?=
 =?utf-8?B?T2QwOUVGMEZGbnhGMlk2Um00ZnU1ZE1QVFdSNS83S1owWWYwV0M1cG9VTWRR?=
 =?utf-8?B?WjBNZTZZdnNjUThrM21Od2x0SlFyMFQ4aVJBeDA1eXdrWnQ5VjdUbjAvMVBZ?=
 =?utf-8?B?dzMyb0xZTWxPUGFMQkp5aDFlYTZhRXlrM0EwZ3N5L1dvVG1EZk9GWWhtUXVR?=
 =?utf-8?B?RW5NV001aXQ4VUlSS21kTHFWSEx1QmUwWmhQaC9DU1U2KytDQmF3b1lWU0VO?=
 =?utf-8?B?akZxT29rYmV6RitSbmVWdGFnWTNhTXViM0JUcDR5VitXVWJTeXMyd2Q1MzhN?=
 =?utf-8?B?bmc3eWVNcjNCN3FvOTJoamdXemZSUEgxQWFqNnpMN3pFbmlkMjA5SENPaEFP?=
 =?utf-8?B?bzFkdStidmxTOHBCYUswK3pPM1Voc3pxT2thVWZSZCt2T2xhTWVUUFRuS0F6?=
 =?utf-8?B?eGl3M1p5MFZIeTgvOC9icVBYUDNJMEx3c1dKMjlsZXhkK29rYnlveVVvVzlJ?=
 =?utf-8?B?N3phS2FLMkUwcWJXQStHcWZ4SVk1MklQRThqalRtdXExUFRtYkxGam9kMnkz?=
 =?utf-8?B?OTlkdjNQYisrdVFmQ1JrYjg2MDFGSE9Ta3QvazZZQWIyczg3ckFHeDFoeXdu?=
 =?utf-8?B?UFpaRXNVV0JqWmNXdzVtN1BVU2dvcU9Wa05aRTU4c25MOUlkQUxVdDU5cUMx?=
 =?utf-8?B?bGI1Q1hyaVhHNm1ibUsrZUF0bWtic3kxL2FnOTdFQVhiZnBSYlJsay91c2dZ?=
 =?utf-8?B?S1RSc1NiWGpTakJ0MUR6UEE4bG1kdEZwSFpISkxicG1xZG43WUN6amVRT3BK?=
 =?utf-8?B?L0hnUDNnUllVR3NvMnR1Ny9ZTlJGMVZucmFxcmk4L0tXUzUvd3RSbkkrcysy?=
 =?utf-8?B?VlhCOTZkM2JqZklGNGYwL3NaWU43S0w2UkdaL0ZxVGVVaEhrVWpFWjJ6ZWsy?=
 =?utf-8?B?WWlqeFNjeXRMamJwbnZsUDVxZ3lTaVZtQmhLUElEVitWcDF1T1plQTByeUM1?=
 =?utf-8?B?dlBVWXlKVUZxdUM0dExNdmtpUlZhbnBZRVJ0aGZWTUlYRmowWWo2T1dGbkky?=
 =?utf-8?B?TW5XTTRPazd6YU1WTTFkV0hncmVxVURkbmtMVXJLVGpNeERIbkdOaEdPeVc3?=
 =?utf-8?B?TktBSVc2Y2dPZmlBNHRYNFlSMGM3ZXpVbDFpSjF1UVNTWnBVaEZMbk5tdTgv?=
 =?utf-8?B?MFNwcm5BbjFhbHJJMmxpQ1g4OEZJK2RvN0RTUTNwV1FOUEIvS3JNK01wMVJX?=
 =?utf-8?B?Yk5YbW5XVnB1SHZRMyt1aEE0TXZFUDJtM1A2OXhPSFZHOVkva09PN3NIY1JX?=
 =?utf-8?B?QVFvLzlCNDd5UzBnRzF5NHJFdHM0THNvS2tCL01aVGJYY0VpMkV4UFNSZDNx?=
 =?utf-8?B?WUFNcjJtcTVpYW9PTmhTanJlVGxGVG1hdVRqdjZESDRXZWdNSmI2RU4xbDFX?=
 =?utf-8?B?YVdpbDlTK1lLU1B0MGV2NG81ZGJvSGhneFc0WTVIT0xKTDlETnJnV1BKUmZa?=
 =?utf-8?B?UGFWYjZ3aXFkeDdNMGxEYXBtVGZlbW9wMmh3QjN2SHp1dHlXWWlJZlBhcWc4?=
 =?utf-8?B?SVdaVE9hSW0rZWNqbmswUFA4WjN1bFJwNkk4NDBualEyMkZpUGo1YXdJNkts?=
 =?utf-8?B?ZDNnMWR3WHV6SDhYK01JeGc5cXBYV0dhQXZGQ0k2bHo4UUtPWC9aMkZwVHNV?=
 =?utf-8?B?VEx6YzVHZVN0b0laQ05XMFdLU3ZMYzNkdDcvU1NFRHpEVzdjVlNwVk0vbnVE?=
 =?utf-8?B?K1ZTTmFQSTZ5MlV1NjV3V0FJeXM2bGxZOU9MblBDNEtlSkFTTGZuVzdqSjNY?=
 =?utf-8?B?ZjQrR2xtTmJPd1BTcEJBdEFiekd3WmdpNmVVWFEwaE90eWtYZ1FwUnB3Sk5O?=
 =?utf-8?B?clRyeWVYRXBVei9LcmMvSzd6b2c3anNrRVpGUFR4bldtR3c1TENiZnFaQmhC?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2a23c1-e609-4e7f-9749-08dda4d3ad50
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 08:25:21.0988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLLpygvlQqANJ0syrMDK/9qegzUhuml3cBAhDb1BjRYDrX2Emnj+4iRKcc46l5b2Vof2InscJqHsP/nOfZ9kgsGqQqxgto1SgYm+1lerZAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9986

Hi Rob,

On 6/5/25 9:41 PM, Rob Herring wrote:
> On Tue, May 27, 2025 at 01:18:20PM +0200, Nicolas Frattaroli wrote:
>> Hi Quentin,
>>
>> On Tuesday, 27 May 2025 11:26:49 Central European Summer Time Quentin Schulz wrote:
>>> Hi Krzysztof,
>>>
>>> On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
>>>> On 27/05/2025 10:48, Quentin Schulz wrote:
>>> [...]
>>>>>
>>>>> likely a purpose to it. Especially if they also change the
>>>>> silicon-default in their own downstream fork AND provide you with a way
>>>>> to change their new default from Device Tree.
>>>>>
>>>>> We can hardcode the change in the driver without using DT, but I wager
>>>>> we're going to see a revert in a few releases because it broke some
>>>>> devices. It may break in subtle ways as well, for example our boards
>>>>> seem to be working just fine except that because the PMIC doesn't
>>>>> entirely reset the power rails, our companion microcontroller doesn't
>>>>> detect the reboot.
>>>>>
>>>>> If it's deemed a SW policy by the DT binding people, is there a way to
>>>>> customize this without having it hardcoded to the same value for all
>>>>> users of RK806 and without relying on module params?
>>>>
>>>> sysfs, reboot mode etc. I don't know what is the right here, because you
>>>> did not explain the actual hardware issue being fixed here. You only
>>>> described that bootloader does something, so you want to write something
>>>> else there.
>>>>
>>>
>>> We have a companion microcontroller on the PCB of both products which
>>> needs to detect if the board was reset. When the board is reset, the MCU
>>> FW does a few things, like essentially resetting its internal logic such
>>> as the PWM controller (so the beeper stops beeping), watchdogs and
>>> reinit most user-exposed registers so that it's like "fresh" out of
>>> reset (even though it actually wasn't reset since it's continuously
>>> powered, not from the PMIC).
>>>
>>> To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3
>>> on our boards) from the PMIC. This power rail is only "restarted" when
>>> RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.
>>>
>>> I assume it is possible other boards do not want this (all?) power rail
>>> to be quickly interrupted when rebooting? But that I do not know.
>>
>> I agree that this sounds like a pretty big change in behavior, yes. I am
>> somewhat suspicious of any silent mainline difference from silicon defaults
>> as being the result of cargo-culting from downstream hacks to make things
>> work, and are unresolved technical debt in need of cleanup.
>>
>> On the RK3576 board I'm currently working on, where an RK806 is used as
>> well, then DCDC8 cutting out would wreak havoc on warm reboots I'd wager
>> as it's used for a lot of 1.8V IO voltage supply things, including one
>> instance where the DCDC8 rail going low would feed into a downstream
>> regulator that's being kept enabled as long as a different supply is on.
>>
>> If you don't want to deal with DT bindings people (sysfs for reset
>> behaviour? What?) a workaround for this could be to add the necessary
>> register write to your bootloader's (probably u-boot?) board init code.
>>
>> I do think however that "what does this board hardware expect to happen to
>> power rails on reset" is a pretty strongly board specific non-enumerable
>> hardware difference that belongs in DT as a declarative property, but
>> perhaps in a different form than the bare register contents for this, so
>> that it can hopefully be used as a more generic (even if vendor) property
>> for future PMICs going forward. Think regulator-always-on but for this
>> specific case.
> 
> I don't have an issue with this being in DT as it would seem to me to
> be based on how the board is wired. However, how does reset work before
> you run something that parses the DT? Seems to me it needs to be
> initialized early (or power on in the right state).
> 

FYI, v2 sent yesterday: 
https://lore.kernel.org/linux-rockchip/20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de/T/#t

I don't mind the discussion continuing on v1 though.

The silicon default according to the datasheet is 0b00 (restart PMU). I 
know that Allwinner/X-Powers PMIC/regulators sometimes have different 
silicon versions or EEPROMs or bootstrapping pins that can modify the 
default but I am not aware of such a thing on the RK806.
So silicon default (0b00) is what's used until something changes it 
programmatically....

which, unfortunately due to some U-Boot contributor's (me) mistake, is 
set to 0b11 (soon 0b10 but that won't change anything), aka reset + 
notify on RESETB line. I cannot change the default as boards now 
technically rely on this (either by mistake (they could then now fix 
this by using the DT property) or intently (in which case they wouldn't 
change anything)).

The plan is to have this in the official DT so that U-Boot can read it 
and pick that mode instead of the current default of 0b10/0b11.

If one wants to do that without DT support in some U-Boot phase they 
would have to change it by hand in their board file or some other way 
(e.g. via a custom TF-A/OP-TEE if they want though that doesn't make a 
lot of sense :) ).

Why support this also in the kernel?
One, the DT is not kernel specific so I would like it there even if used 
only in U-Boot since it now is using DT based on upstream Linux kernel's 
(via devicetree-rebasing git repo) for most Rockchip boards/SoCs.
Two, because I cannot force users to patch their U-Boot that contains my 
mistake, so at least the behavior would be fine after booting the kernel.

Cheers,
Quentin
