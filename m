Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012018.outbound.protection.outlook.com [52.101.71.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C116419;
	Tue, 27 May 2025 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338019; cv=fail; b=C4TD0Zgk3XcItrMs1A++cYtIV0D5LVp1hGmf1Rwaai8p4I3E4Mnu748r8Y/N+AeEFdxMvWaCJDoUyPL7Yo+3QPpbkHomIx/OYjR/JtjfLB3bBh0xYL4cs4yhyj6bxIn5fBH4Y7mAoNKIyzt7xD8apcm2jIbsgcXi0d9EJeRPkNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338019; c=relaxed/simple;
	bh=OoOU72WUw/dw/S+e/VoFV3IrYN/4nCy8Bs/LjngZazE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GCTmxUvxBLF0sNQJW1x45wuArTsFOs9DPRruOYqAk5rkCEEWb+/sCwd9ItAucm566MJvE1CUoxpwts7dj28+CShKeRQJ02YkubvHwJMTGeg/5YiJPRSOUgn5UC4H0AdH9OPEvGUX3TfpAm250kVjl9qnAChAoEnOvFI3gfUCqGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Kxd/FpGK; arc=fail smtp.client-ip=52.101.71.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Kxd/FpGK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTFz0wjWdhdolFzjK/FcIcKinzNaBD0Dqd4y+AGd/cdz4ozB/KG+VYfV/0YOm6wPS+XFS/Iv6OXZjb59A6LKoyCvD5gLGJUxvP491V8bd+Mp1a7THd7yJ8yZH4MCuoUBTpgMLIriSyatZG21dkkSowvT8E4siCiOMUYwWKkQa1BALbTzN5XpA0/Icuhy5vva3giuv9xiPyAHPjMSIMCrBNV8Uy1m70Mya84agwqb12nCWlKDudITvvgF3pIwc6+OK5BDJFANAmpDbUQ+NU29EZROYRSxXZGMYyJtVL/4vPXg0riUl33X8Mh0UG/ERQt6/hSllERfkwZev4ftkkrWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQHcJf7nCDfUSLx234WNWw5c/3cTPBdKZAjfwL4EUJM=;
 b=vtPINbXshXO3qCDjl1k8u2XbHWWSnl2Lyu/w+03Gm0aGstT7783a8iSn4ZGD/bBQtrW9pzidk94UoEEFUTg9ae9fPBpA0Vv5X1h3Ei6qN87mo4SvAyV0yTfeMl3n4lik48tOyeDVsZFYehM88S9SwI0GJ/BZ/PY/0yzDg1TfooFWTZZ4zqOvUWWmHylPaVIaD55VCoG4fXosYosfSh1ZuH+OoJRFELtW7kND5Ux7MmThSrMF30uGgrwZCLwKdaX5gc9iyWVDJP8xqdpBEE6+PlBrwQBcgNSnZk3VJHKFXhFm/zzPPebghvzmAgHh0PT1j0utPF/j1kqMNxUq3M7Obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQHcJf7nCDfUSLx234WNWw5c/3cTPBdKZAjfwL4EUJM=;
 b=Kxd/FpGKvEkWs+LNGNCu2iQYG+AVq0xnv8oKKvejLpDVvlakZf6pduo3F6UYSTgkL/x/jFlG3QCcyoaIrt2z6llOBBY//3U0HSrE7EThjJxMvTtUdSc62oo49JS53fFPKmuJSYKXaITk3KmDvYsO7pAblTx/Ei455rycShBMW0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11001.eurprd04.prod.outlook.com (2603:10a6:800:27d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 09:26:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 09:26:50 +0000
Message-ID: <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
Date: Tue, 27 May 2025 11:26:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset method
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <20250526-rk8xx-rst-fun-v1-1-ea894d9474e0@cherry.de>
 <79903ad6-0228-41a3-b733-415cc43ec786@kernel.org>
 <d1fab35d-a4e7-449d-9666-0c651e44929a@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0050.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: b2325560-2cdd-4f21-c94b-08dd9d009c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2hmRGRkQllwWGVITFZodnNwTzFvb01raHNuQWdjZUQzSzg4eEEzS1dCQ1ZJ?=
 =?utf-8?B?bTRPY040ek13NXlkdW03Q25zNThLNmoyZnVYWm1peDVBbGdxTE5UdVFPcHdw?=
 =?utf-8?B?djZnQ3k4dkREY3lTSmpXM2FVS2cxQkEzMjJBN3JWNHVITjN3ZklZek1tZzRD?=
 =?utf-8?B?SlVINEQybmtYbHc2TnhLLzZLTjF1a0RjcmxBbTN6SU5iR2pkbnNONW1MRmlB?=
 =?utf-8?B?cE1TRlV1Ky8wL29MRmpyZldiRmZjSkwzQkpRVkZmRlY3Tm1TNkpPUXd4OHZz?=
 =?utf-8?B?SUcwY0l0U3RBOEpaYW51YmpYaTdxLzZUZjUyUWRjcXJHMm1QblczdEN6Rk1P?=
 =?utf-8?B?NjFXU3c3Sld6RUxJZ1ZHWjRtU3piMFB6MUJKNnc3M05CQWtBNU1ka3FuVTdP?=
 =?utf-8?B?aE01aU5ZUU1kTno5bzRCdDVESTFzVW1lNnhpZEd0MG9peHF5eWRRVjV6N3c5?=
 =?utf-8?B?MXl3WjlwRWhkT3Z2MVVqc1lzYXpJZDVidkx0QzcyaDRpQisxYTFLWHNVOWxP?=
 =?utf-8?B?SEt2Y2Y1bHZyV1BUT0cvZk5LdGszYm43cjYrd0NiOXFPLzJXTDVDZWJhQlJ4?=
 =?utf-8?B?T0JieFBZSFNLeGRlYlE2eTF2RTFpL1g2WW5IV05FKzllbU9OdG83OFdka0Rl?=
 =?utf-8?B?dko2NUVTazdaWWl4T0RQTHZEWGwvVEJlM2dvWE5EclFjcXlEcmNTZ2I4M0lR?=
 =?utf-8?B?SFVjVFh5aXBlT0VXc3I2UlJaUXRqc0YwdXk5MEdzUkd4Q3JBd3FNcmNHNlpo?=
 =?utf-8?B?V2lPZnB4VVhjV1ZIUjRNRlJ1aUxtYlpBaUROWWhKSlZWU0FRNWtMT08xaDcx?=
 =?utf-8?B?M1F4ZmFDd2tnTmFmUWhjdHFEcTJDNjJ5T3E2MzBHTGV5dGkxaWpZdGRHRW1S?=
 =?utf-8?B?T2hmMk9kN2FKeGo0QWJpeGExbU5ZUXRCOWR0VmIwcjc4Wk94RnVOWFRDUCtp?=
 =?utf-8?B?T3gvOHJ4ODg2VnR3NUNHaEo5T0VUVUtzVEo3NUpid2J1WGdNN0xCREtlNlNw?=
 =?utf-8?B?Ukg5ZVZaY2dlN0Z0cWk5MVNlQ1dsaDNmZWw0WkFHaHRzcjZHWkhPVHpiak93?=
 =?utf-8?B?WEEyRHNzZlVlYzVHVjJtcUhweEhDMU5NWmcxWkxVQ21JWlNhMktCM3JjMmkz?=
 =?utf-8?B?cjJVMGFQelhWdjczVUNQMld3am1QZXFiSmVlYU9iOHEwNlBaMEU4bFhKNXNv?=
 =?utf-8?B?Y1piQ0NlVWxhYTNpdlZsSXBwbTIzNHJrSWNMK2hoUHBPYVR0Q0ZQVFRubUNa?=
 =?utf-8?B?dmo0TFpzbkt3RG9WVVd1YzJESmJJRGhnYzJvV3dnRk1IWVRidmtITnkvTFA3?=
 =?utf-8?B?b09uanVnWERDQXplc0xBbEdNRkpNUlFtWTlUcnUvYVQ2TXY0ejNpamRXUGo2?=
 =?utf-8?B?VVl4ZE1YN01QYXFnejBwWFFiVWpZL3o4ZmxIL3VHRk9JR3R6RGVxakhneGIr?=
 =?utf-8?B?WS8xOGhmM1M3NkovQWtLSGxhVjlHZ3V6TllOdktnUCt2cWRWUXVVQ1Azald3?=
 =?utf-8?B?STl6YUpIWXZDRWJZeTFjWnRlUDFzM21ZRFRmNW9qbG0vYVd3V2o4TUh6c1hh?=
 =?utf-8?B?eFRDRGM3WXh3N05TNklBM3pYVzF0cGNudStxT3k1K3hmVVM3NnRSclM1TUlX?=
 =?utf-8?B?K1BRSmhydU5kcU9ad1hKeHRUN29hcllpOWpFakFlcUdSR1VXN0FIY3NQMTFp?=
 =?utf-8?B?RVQ3TVd6VFp1U1FYM2g1anRoM29EVDNqSDFEVkd6aG9oSWFBT0RNcGFOaC9l?=
 =?utf-8?B?MUlTajNKajhwa0cxRlFsQ3RqNkE2K2orM05yWmtFWi9hUnpxOXF6ZmpjS0hk?=
 =?utf-8?B?Yms5djgvRGJGaHRYTXBpTTRyK3dzb0xSdENjbDRMTXVMbk1FKzNrcGNCV2Fx?=
 =?utf-8?B?bkxwd25kV3pCVHRWdllUem1meTlvTFM5aXRzNTRtcUcyOGdOa2Vzbis1eUwz?=
 =?utf-8?Q?HYWVxXEkWxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0NKSHByZTJrZ3ZaUG1NL0ZxdXNNMHlzZ0pwWU1yK0lIMFhvWDNkZnNTa0RS?=
 =?utf-8?B?cXFqZ1d5QnF0S2FmRmg1ZlJWRDczWnpFb0dlSkVkaU9KQUtMajNmazk0a0ts?=
 =?utf-8?B?TG1rd3RralNuVFNMWS8vT3d3amt2RnpyYUFXVFhCTmpVRzk5R3VRUzlYZlBE?=
 =?utf-8?B?cTFEZmt1akVGVlptVWpURGg0K1BmR2d4ajgxUHUxTWZwVVZ5ODgxTXBVY09X?=
 =?utf-8?B?b1Vob002YUozeVhtMGw5bXpWRVFobVZyKzJTNzBoR2UvUlQycndYYWJwRndn?=
 =?utf-8?B?NXpjZjhoSFYyeWk1ZWdOVDNDRGkrcE85Mnp5TC9WYW5HV3o5L1VjbzZPSHFw?=
 =?utf-8?B?eHBqZGhiYVFwSVZnSSt0MTJ5MmxQUHI1NTVRaDNacUhnNGFLOWZQZDJ2cUE0?=
 =?utf-8?B?cnNhdTlSSmpBQlc2S1dxRWFQdytXNUh5bHhSdXV1U1phZ1l5T1hxM1c0Z0Yv?=
 =?utf-8?B?WXlqZ0g0NU9QeGNQakU5UXVuWjl1ZSsrNEM3MWZndmxvN0ZEOTF1UUZXTXpv?=
 =?utf-8?B?YVdOaE41OVgxbVFkeDNQR3RrVEtwVnpPTzZ0VlV6S01mSmFZc3dkTzhjQ09v?=
 =?utf-8?B?R3JJbHJIbEVYL3p5TlZPTlo0c2owV0Qydm83QWM1RGx6dEJERHdBNlpXYTdM?=
 =?utf-8?B?K3h0dGxTTlF0U056amJzR2U4MjFFSmFNbnBLenlIdHVDdW9kZnFpZ3ZvaGxI?=
 =?utf-8?B?aG9meC9ORktodCtGTStwNnBwOVFLYm5LZkUzVEFCUVEzNHhTVllDYjdSMEJn?=
 =?utf-8?B?ZTJLd2xvQmVhS1BSWXJ6Ty9MWHJXTm5XMitOWkxVVlIwNGpDK3F0aVJYU3px?=
 =?utf-8?B?VXR3SGhnejRRSDVRb0plejBqS0hjY1JwUDZ0Z1hoVng5SENJbHRKdFdyekND?=
 =?utf-8?B?VkVPT0RGelYzL25XTUNzQlFTRTdiUERjWHlpc1FqN09ObDdYTjJQSHV4YmJ5?=
 =?utf-8?B?amd5QTZKamZmR0VyOURUdlg5SFZuMXFka1B6dDhFc0ZsdldvZENqRUc5WG5B?=
 =?utf-8?B?bkRpTDl5dWZuKzFudXUrRG9ML3N4OVd0enpMZUhOcVpWOTZjMFhjY3NpUVIy?=
 =?utf-8?B?U3VsM0kzQ3N1c0FkYnF5NEdmNXhtVDdabkJHOXdGZVE5WGphWGZvenZNYjZU?=
 =?utf-8?B?Z0VpQTdSWGJ5RnVpNHRKQ2lvbHhRbzlHUVFZNzlISVJRQTh5Vmt2MmRPWkxP?=
 =?utf-8?B?Zm51RnpMWlh5bDlVN0Y2NVFSeGY2V1pmUnhFRXZpRGlTdHpna2x3Si9SUE1F?=
 =?utf-8?B?MnlyNlcwZkNJZDk2RTZ0Z0hFbjc4SDlVamZJWENaeUlPb3RxNUdsajJpL25K?=
 =?utf-8?B?NVFHVWhmY2NUVzdmYmRzT25hbC9aL09VQStFVnZrRlFXM3ZRd1N0eFZGTTNp?=
 =?utf-8?B?ZVU5VU5iaVZjcnpkeC9KaUlPRTNaeXcyZ0NuRy9jK2ZmdXh5aVNJVS94TlBK?=
 =?utf-8?B?QVMyR0R6aThCcklWaThlVEt1RXhQVHZ0clVUN1BKYWtXVm13RzhSZmhXWVNH?=
 =?utf-8?B?WjhtbDljYjBobDJYeXMvZ0doem1hVkxsOWlrTDk3eklsSzZ5aXM5a25xNm94?=
 =?utf-8?B?MFNOa3puYzZFOWovZzcvT0VqQS9nWm4wY3AvR2Z4cllQcWxsc0dDbysxS1JR?=
 =?utf-8?B?T2xWVzZMVTBYWW5kNEpHK0FRY0Q2cTZHcjdzZldZYUdCMDhwTVhnMFZTRTB5?=
 =?utf-8?B?ZXJJZ2R2enMxMTlpV0loZ1RrbnBqam9kNlh2U0tiTjgyVXo4aU1RYndvRjBH?=
 =?utf-8?B?TTNoQzBzTzQ5QzBISk5nZG5IRDdiRW95WTh0SWxaL0JrcHBVdXdWTkdKZEVP?=
 =?utf-8?B?ek5QLzYvYThmV1NFNURaTndyd3EvTnBnRHY4OGxwZFg5TGhpV3AvQzZJdmxL?=
 =?utf-8?B?THNiMURsV3pnYjlScm1ZeDhxNVJYUnYzVEZSQVM4UHk3N0VHNGxHOXorOUxO?=
 =?utf-8?B?TVpGamtmei83UW5veGxLOVdGcTh5YTRCTWlCcnNBSThrOUt4MmZMTjFOR2tp?=
 =?utf-8?B?cE56Z0pkVmxyZEhNU0gycjhGcTlBdVYzWk12TEVwd3hYNzlrdFZjOXlETFBZ?=
 =?utf-8?B?ZTlpVTEzL3RuMkUxWU45SnJJd0FaSXVmNVBEM0ZycGhsWXBSbGdXdTl3aHdG?=
 =?utf-8?B?dGZJUDlJczc5ZllrWmFPQjJuc2JvbU1WTGduTGprSUYvVUQ0RmwyQ1phWE1m?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b2325560-2cdd-4f21-c94b-08dd9d009c49
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 09:26:50.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1f6JCrVigr51DRvTpjO8jR9oocx0vyVW/BLjHcY+F/dbiO5YTiQQ29tu2h9qvKOWpW7zfW+sgBgOJbHfb6FsobZAQjOaJKjeeTXy/TcRbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11001

Hi Krzysztof,

On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
> On 27/05/2025 10:48, Quentin Schulz wrote:
>> Hi Krzysztof,
>>
>> On 5/27/25 10:25 AM, Krzysztof Kozlowski wrote:
>>> On 26/05/2025 19:05, Quentin Schulz wrote:
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
>>>> bitfield for configuring the restart/reset behavior (which I assume
>>>> Rockchip calls "function") whenever the PMIC is reset (at least by
>>>> software; c.f. DEV_RST in the datasheet).
>>>>
>>>> For RK806, the following values are possible for RST_FUN:
>>>>
>>>> 0b00 means "restart PMU"
>>>> 0b01 means "Reset all the power off reset registers, forcing
>>>>               the state to switch to ACTIVE mode"
>>>> 0b10 means "Reset all the power off reset registers, forcing
>>>>               the state to switch to ACTIVE mode, and simultaneously
>>>>               pull down the RESETB PIN for 5mS before releasing"
>>>> 0b11 means the same as for 0b10 just above.
>>>>
>>>> I don't believe this is suitable for a subsystem-generic property hence
>>>> let's make it a vendor property called rockchip,rst-fun.
>>>>
>>>> The first few sentences in the description of the property are
>>>> voluntarily generic so they could be copied to the DT binding for
>>>> RK809/RK817 whenever someone wants to implement that for those PMIC.
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>>    .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 24 ++++++++++++++++++++++
>>>>    1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>>>> index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..0f931a6da93f7596eac89c5f0deb8ee3bd934c31 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>>>> @@ -31,6 +31,30 @@ properties:
>>>>    
>>>>      system-power-controller: true
>>>>    
>>>> +  rockchip,rst-fun:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [0, 1, 2, 3]
>>>> +    description:
>>>> +      RST_FUN value to set for the PMIC.
>>>> +
>>>> +      This is the value in the RST_FUN bitfield according to the
>>>> +      datasheet. I.e. if RST_FUN is bits 6 and 7 and the desired value
>>>> +      of RST_FUN is 1, this property needs to be set to 1 (and not 64,
>>>> +      0x40, or BIT(6)).
>>>> +
>>>> +      The meaning of this value is specific to the PMIC and is
>>>> +      explained in the datasheet.
>>>
>>> And why would that be exactly board-level configuration? IOW, I expect
>>> all boards to be reset in the same - correct and optimal - way. Looks
>>> close to SW policy.
>>>
>>
>> All RK3588 boards except ours in downstream kernel have their RST_FUN
>> set to 1, we need 0 and I cannot talk for what's the actual expected
>> behavior for other vendors' boards. I do not feel confident
>> indiscriminately changing the PMIC reset behavior for all boards using
>> RK806 (which also includes RK3576 boards). Hence why I made that a property.
>>
>> Additionally, if all boards were "to be reset in the same - correct and
> 
> I don't know if they have to, but that's what I would assume in general.
> Unless you say there is some specific hardware aspect of your boards,
> but so far you just described the register.
> 

The cover letter

>> optimal - way", why would Rockchip even have a register for that in the
>> PMIC? It's not an IP they bought (as far as I could tell), so there's
> 
> To allow SW to make a choice. Just like 1000 other registers for every
> other device which we do not add to DT.
> 
>> likely a purpose to it. Especially if they also change the
>> silicon-default in their own downstream fork AND provide you with a way
>> to change their new default from Device Tree.
>>
>> We can hardcode the change in the driver without using DT, but I wager
>> we're going to see a revert in a few releases because it broke some
>> devices. It may break in subtle ways as well, for example our boards
>> seem to be working just fine except that because the PMIC doesn't
>> entirely reset the power rails, our companion microcontroller doesn't
>> detect the reboot.
>>
>> If it's deemed a SW policy by the DT binding people, is there a way to
>> customize this without having it hardcoded to the same value for all
>> users of RK806 and without relying on module params?
> 
> sysfs, reboot mode etc. I don't know what is the right here, because you
> did not explain the actual hardware issue being fixed here. You only
> described that bootloader does something, so you want to write something
> else there.
> 

We have a companion microcontroller on the PCB of both products which 
needs to detect if the board was reset. When the board is reset, the MCU 
FW does a few things, like essentially resetting its internal logic such 
as the PWM controller (so the beeper stops beeping), watchdogs and 
reinit most user-exposed registers so that it's like "fresh" out of 
reset (even though it actually wasn't reset since it's continuously 
powered, not from the PMIC).

To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3 
on our boards) from the PMIC. This power rail is only "restarted" when 
RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.

I assume it is possible other boards do not want this (all?) power rail 
to be quickly interrupted when rebooting? But that I do not know.

Cheers,
Quentin
