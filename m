Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDA9255E25;
	Tue, 11 Feb 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291572; cv=fail; b=X37Pm6OBXcpj6Dg87DibVOy4IMN43vyIMUttdlkPPnhcNTyk2BQHbaiKS9v2q66wSROAuZK7jLRweWwxxK1PyG2Tnonjfq4y02j3VM/MSyEUL2ybPLfg2Sa8ZPsuaCzumCABIvX+jv7HufNG0SAuZd5nkLe09b3jC0uXbhUWSg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291572; c=relaxed/simple;
	bh=DDNo9MZe6+cjtUUqLPBDjf7pW/KsoM8Nh6SS0aYsghM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qfH07sl4HDD1jKvS6PxVAYe74Dw93Fqb//+FteOP2tW7hUmwWpJ9psu+Wv7R/KDD5aLN+fYmFvE59/pYR9KLmgSiMBvtZoafEK5ccZ+QC+Qi3j/H5GCySNPGDc4pE+qlwCZxLgBq/w0GaEtf2b2P1cW+fBmtSNA0lLE59kMew0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=h48tVuBV; arc=fail smtp.client-ip=40.107.21.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="h48tVuBV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJlhJRbRxuFta+eBcAzjfY+Cobw3JhFaJo4qCgrEOfMj2bB92bcwtMLDZWPSi9AIm7QRj9kQWzZorrqqp9RiOX1eC3aoRMtPVbwWLkAJmQhHTw5C2OoaspuN0L9YBvhQMVLqfeeyr0DUKNn7OF9jSO0GoahotnCghPZrxKI7YC8W79+pok8IZLt4E9XDQU5NWUv1M4CwURD5T1PBhkts3Ktocnp2q+gakUqrFtILpiVR/XMtqrvxESD95zKfNQeu6EKhjZ5VJ50Imh5SroerZCy0FVd/jtFa5UEWba3EfPd7B+FNWe8CIbtOVuL96/QtSts4BcwS+Ssi1KuMzZ0FSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSFQyrsuJwvUl30TTuZwYRXoa3kODf1M+IrOewrrdX4=;
 b=pWkrQy5mwZhwTDTm6m/+nbIJUdhjnuv120otkrWxvY0YTXaDHTU40uI1JulhrQNptCqz+miCVjszhfZwZdORZk+9vPQDhVTHsyBSiip1+miRfYELN4FFsFE46k96opzodxloO/ndbAWYtBuBJdASJQxWUTQR2V1A/La56/OQVVzf++6tYUS4/tJQal8tMK/vhKZ14uFNGmYWxX4XHOWawj8FLKxCN5QUiZP5zYi16wB6emjLFMPM/SC0+YEVfo/esgW1Jw0yhf5wOyaUuGDMnuP8Z0LdfCZEJcNEZxm84BqZpfMtcNgr35HE2/r4OajpDU+2cvxRf95+WX2r1jviuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSFQyrsuJwvUl30TTuZwYRXoa3kODf1M+IrOewrrdX4=;
 b=h48tVuBVdjF0/gsnhFK0c3YX4KLFmSOIioek2lAGtY9gOy7iSYT52DCLXkGjDowitAsbyVvZpKT7PWke/Fn4NWBOZs6le5FZr89V1mSNCtMsJzPJhNTmcoAO/onr/6EjVzHv5D93z7ZXnGgPFa7wODLRD5lZvthvi7nDOqKcHuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 16:32:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 16:32:44 +0000
Message-ID: <d8ce8db2-1717-40f8-b53e-24cc71a758c9@cherry.de>
Date: Tue, 11 Feb 2025 17:32:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] arm64: dts: rockchip: Add OPP data for CPU cores
 on RK3588j
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dragan Simic <dsimic@manjaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Chen-Yu Tsai <wens@kernel.org>, Diederik de Haas <didi.debian@cknow.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <20240617-rk-dts-additions-v5-7-c1f5f3267f1e@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240617-rk-dts-additions-v5-7-c1f5f3267f1e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0164.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fd91a0-a7b9-4218-3253-08dd4ab9b655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y01FcEF0eWU0YWs0eStvQ1hma3JxVTZKY01Wd1MrN0U5V2lzRU1XanMwaWR4?=
 =?utf-8?B?K0xSTGw0bTJYajhtZnhiVjRQU1hlVHY3blBSS0hqR0hDUGUwQTBNRnp3bFNl?=
 =?utf-8?B?TDRmQkZHc1lSb290dHRMZXUwV3NVQ1dZdFR4aStaY3pEVExSVUVDV0swb1RY?=
 =?utf-8?B?Q0xLMkZtL1pNcjV0SWY4L2h1OERQZVlCdjB3NGNnNktiWVVCa1pkUUd6U1Ux?=
 =?utf-8?B?ZytzMFRGMGhuYTBHRlJvUG9yU2F3akNyVGtIbld2V2dDZ3NPaWt2MEh2VUFQ?=
 =?utf-8?B?L3VnaWJRT1NCM1dpL3lHL2ZvaUo5RG1KSVRJczBhZTlLMEtENFFvd0JzU05q?=
 =?utf-8?B?Y1hVTkNqR1pibExuQXpUaGhENFZOOXBXM003N21VVDcyNUQwanV2VTlqYVUz?=
 =?utf-8?B?UTh0QkFFRUNnS0huUmVzdzhsd0EraFJyK1d0ZkRpNFhvNGFqbmhzcFo1WHcr?=
 =?utf-8?B?VmtYdFFRTFZkeXVXTmZuUWI2VFd0bDBMSnV2QTE1NmU5aTRlMC92SlhKVzU3?=
 =?utf-8?B?U3VxK3pFNTEvOXlIQlVGdklKc0xuWktveEUrTUVTNm5Ld1hyYnpxUE5vY1Bn?=
 =?utf-8?B?WU5FWXpVSXM5MUxWa0FoemZzUXhZZFU1bEg2MFJ2M1RwNEJWL2RjY3g0T1po?=
 =?utf-8?B?REQvT2gzaDFybTh2WGkvdnJCa1NDTUpkVnYwU1o1RkM2dFJXUDVTa3NURkxl?=
 =?utf-8?B?RVZKN0dJV0lBWmhqODcyMzhKVWRScXJCc0Y0MXJKM051ODRqaFFZcWdhMDlK?=
 =?utf-8?B?WWZaYU1sSjVhWG1SWis5dDg3bkhZRlg3bC81K08vL2RGRU4rTlQvU3hNZzRE?=
 =?utf-8?B?YlFDNmhXNW9kU04xQzRmbTNGM1Fod2U4ZVN6Zkh6eHlKVSsrQnpweHdkbVF4?=
 =?utf-8?B?S1hKNjlrbHMyUUZaMFRnUlFLeXdMTTR3OVRSSUxJdEQxZnUvaU13T3VYSGZZ?=
 =?utf-8?B?aERSVnR3ZFo5R2tsUG5tMGl0RGpjQncxVTA5cWd1K09TS2xQdmNJaUZtckZ6?=
 =?utf-8?B?RmtjVGFlWS9rS1NHdVpVWGZWWlBJNDBneDR0SmdpeXhXUk1lUjdlUzFRNUNT?=
 =?utf-8?B?bTgwaFhOaU1SZExtZ1A1OWNTOFZxUTE2K0RXVmdVdTF2Tk1wOVJXRlZhWXpo?=
 =?utf-8?B?VFJKTjZzUWdreVFqMGlLUk5iQXd2cGwvdENGam5CWE9YSFB4dGNtaXJGaUdi?=
 =?utf-8?B?bUV5ZGtqb3FubzNjUFlGYkhPT3lUZmIwMDBQR280VXNETWVnUXExRURONG1Q?=
 =?utf-8?B?N3BaWWN3QWJDenZhQ2tJUXVVdUdoR0VVZGVIYW1PbGhhMVJQVWFnWWFDOExT?=
 =?utf-8?B?NHcrbUJidUpHVE5nK3FkRHpQVWJhdm81a1lpaHUwKytYS2pzOEZ6TDRpN2tJ?=
 =?utf-8?B?UTRjT0o1WWoxQ0FzZXJ1eTFxTis3TERSZzFlU3dyNjRPWjkzUGphZWZWVXZ3?=
 =?utf-8?B?YUZkNklxdXE1MCs5UDFFbGdEbkltRXlDYU1Da0ZLYWFnY1YxeDEyQmZ3OHBw?=
 =?utf-8?B?M2RGbnc1blZockpaMkFEZ2VwTFRKL291U3daeWFiN3VPeGhudTUyWHh5dTJU?=
 =?utf-8?B?VXkyazJnWWplWlZ6VE4rRHlCRDJrMUpkNWVpSkgwc3l4ckNOVTZheXR1OVpW?=
 =?utf-8?B?QUM5emxJU1JjaDFMRHp0YTVHVEtZQmI5K0d1bFZ0QU8rU0hjb3hTbzAxc21y?=
 =?utf-8?B?NjJnWmpDNUxoQzBVRGwwNk5JVEtZMmVralNlMmxTSzZMaUFKRTFzMXBwSDYr?=
 =?utf-8?B?bXBOYnAyRk5udnp5RGd2dUtyRzF5MDRpTDNwR1Vpa2F5eUowb1VuZUxad28w?=
 =?utf-8?B?VVRieVZBRTVUMWROUTZ5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDcvcUdGMHJOV1dKQmxtQThtdDFseHppMUYrNXFKS08vNFJ3a1FtdVNzV2hs?=
 =?utf-8?B?aTV1UE1IZ3krTWQ4OE81SFU3Y1lyYzRqb09rZU0wem0wemowUmRvVFZzRXNj?=
 =?utf-8?B?amN2eHJMdzUwaWtCdHkzaitjYlhOT1k3SFNaSkl1ZW00bUNvOGF5b0tTem5x?=
 =?utf-8?B?dFcxRm0xUlZGa0VEdDFFRFZiM3NPUUFaVEIvUlJqMzIzc0VFZjh4S2JVbXF4?=
 =?utf-8?B?eTF2eEZxU2U4dUZhcGNyWEIvTVBQS1g1VVkydlVYd3BWWUQ5TzFvNmRsZGRo?=
 =?utf-8?B?aXdjTWwzNGN4QmJhSVc3K0hRem1CaDNueHE4Nk5KMEZCUkorR0hIS3ZZdjVU?=
 =?utf-8?B?dTFCemt5eXlBZUN5anZOWit3dTJpQzNOTnhFMk9sUGoyaWdQNzZCaHhKZVNN?=
 =?utf-8?B?NEp6YUh0c1M1NFQ0SXpoMmZ6LzV3RzF1RkVmakIxZGVLZ0gyejJSa2JMS1Qv?=
 =?utf-8?B?b0hhZ2RUZVI4cW1jNGQ3dE9XRFNaWGVORVpFc3RJRmw1NzJUeGFGamV4SDh5?=
 =?utf-8?B?WVh1UHl5UmNWRXpIL3lscW82cWlseUQyU0NVR0pKY2FrcGl3UnMrZDh3MEsr?=
 =?utf-8?B?b3gvemxnSXI1VGRoVkRmOE05ZWFBOWNSaDlaVHFUQ09DYS9QWks4L3plN1pW?=
 =?utf-8?B?SzJPdFdSZlBFVzJ1VGZUQW1NV29QRnJUcG9RR1dNZFRaVnk1MWxRczFTWmsz?=
 =?utf-8?B?bHgxWmQ0dk1FUVI1QzU5dnpjVjkrMVZPblkxcTV5bURPYlNtNnpmRWNxQWVB?=
 =?utf-8?B?aENSWWxnM1o5TVNLSWVVd3RNWlA4MVpPd2ZoZUFvTnkxODExcW02T1dXMmh1?=
 =?utf-8?B?OVlvNHBCa2NDOU9lWXRnOEluYmQ4Q0ZERS9DVElrYS9COHVxQzBtYXpFcDdv?=
 =?utf-8?B?QUNnSVBZYlVkMnVSUDNJcXd2NW92N3NQb3ZCVGJERWZsa1ZxUFZlMktNQjU3?=
 =?utf-8?B?MStnYndua3BvS2JQdVRtRjYvOEpSSTlBZ3g1bmp2bUJ4bE1Ca3cybFJBOVpN?=
 =?utf-8?B?NXdkTWdUWnJ2TTVraDdVTGlLaEQrM3YybEp3MExmTHZEZDVmSGMxdEdCTVZo?=
 =?utf-8?B?WXlKdE1nYnk2WVB2dE1xNDUxNHRnVUlKNzB0bGRxRjFFYTBKbHhvVlBuUUk1?=
 =?utf-8?B?VjBtOUo4SHRtWlVHSUZmV1k2cmZyZEZOOCsyTDRyczJLcTd6UWxYQngxNGpR?=
 =?utf-8?B?NVg5QlFneUFvY2p4ZTRBcTd6MHJMN2NYd1J1TCs4RDAwQUVuczdxS2pSTVli?=
 =?utf-8?B?Nk8yWGs0TDJZUkJPdXNnMy9KNjFRM0R1R2FRcFNjYkl5TE1rdDJDd0NVYm55?=
 =?utf-8?B?TXRBbW5zd09ib0hkRDgwVEZWWWordG41UkpHa0xWVlNsa1RHencvM3hHMlBE?=
 =?utf-8?B?aElhNUhDWWRuVzdRaTBMNEtZUk9YM2QxdXlGTW02RHQwb2hLTzBLOVRrcWZ4?=
 =?utf-8?B?Q1I4eHdXajBuWm0zT3czeTBXNUo2d2JTOGlkSGJWcGdxb2UzbVRCdEhoM2lG?=
 =?utf-8?B?YnhGSmQxbklPcEZ4WFFEMnhjekdnSnVqWEV4VzRWandVQ2FMMHFjOTA3ZHlI?=
 =?utf-8?B?WkkxdWl5ZVVKMWR4VDAwNEJiOXJyR1NVajd6d293Y1ZQZSthUnNScEhRamtR?=
 =?utf-8?B?TjVhQW9KNnBCVWt3SE5RdEZzeFU2UWZjUVhFRXl6cWJFM0VlT2hmdzhXNTdY?=
 =?utf-8?B?S1VkMVpmTWNXT0RVbGdBUTdTZ3E2TWxsUkFyKzlKRXZ3TkhGNlpzQ2RNVWdP?=
 =?utf-8?B?dTZmOWJ3c3lYNnA5bGdYNCtMV0hNd2VTSFdtK1lCU1dkZDBhZWhoWXA4VzlW?=
 =?utf-8?B?QVVhL0p6clBWTnIzb1loS3BhdWZMM0RVRFhhU0RIOHl2TFhybWRyZVRuV01r?=
 =?utf-8?B?MFBwdXBtTGJOR1plRkp0SU5sUmVDRWoyeHlESUFUMGFIMW1lVFlkcERqMEov?=
 =?utf-8?B?eCtwVWxmeENJWGJmNVM2ZVZFTzRzc3QrM2dPVGp3MTNEVW8zTEZHd3pnMHdq?=
 =?utf-8?B?djNvOUxaSktmOW9wb2gwZjhYMWFNZTZoWDgra2d3UjJIa21IZTdZQ05LUmdk?=
 =?utf-8?B?T1p3RGQzcVpqY29lb0x1bjFoU2JlV3Y0aDRjaVVxNHpEajNTUTNPUkgvWFdx?=
 =?utf-8?B?Sld1YnFwT29lWjkvME85d2NUd2dCWGVBR3YxN2ZCRjZUUjRlRUdwckJJdE4v?=
 =?utf-8?Q?IjED2YfjuvD2X87nimmJ9HQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fd91a0-a7b9-4218-3253-08dd4ab9b655
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:32:44.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMmxFFk72wOqgGPyXoEloGJUW5hYZ1DwSDyqRLZYURr4z0ahoA+h134X8oQopJZPpcj82bbxyFJgIwln6fClC5VWbs+hySAJlyLezf7OigY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686

Hi all,

On 6/17/24 8:28 PM, Alexey Charkov wrote:
> RK3588j is the 'industrial' variant of RK3588, and it uses a different
> set of OPPs both in terms of allowed frequencies and in terms of
> applicable voltages at each frequency setpoint.
> 
> Add the OPPs that apply to RK3588j (and apparently RK3588m too) to
> enable dynamic CPU frequency scaling.
> 
> OPP values are derived from Rockchip downstream sources [1] by taking
> only those OPPs which have the highest frequency for a given voltage
> level and dropping the rest (if they are included, the kernel complains
> at boot time about them being inefficient)
> 
> [1] https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> 

Funny stuff actually. Rockchip have their own downstream cpufreq driver 
which autodetects at runtime the SoC variant and filter out OPPs based 
on that info. And this patch is based on those values and filters.

However, they also decided that maybe this isn't the best way to do it 
and they decided to have an rk3588j.dtsi where they remove some of those 
OPPs instead of just updating the mask/filter in their base dtsi 
(rk3588s.dtsi downstream). See 
https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588j.dtsi

So...

> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588j.dtsi | 108 ++++++++++++++++++++++++++++++
>   1 file changed, 108 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> index 0bbeee399a63..b7e69553857b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> @@ -5,3 +5,111 @@
>    */
>   
>   #include "rk3588-extra.dtsi"
> +
> +/ {
> +	cluster0_opp_table: opp-table-cluster0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <750000 750000 950000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <887500 887500 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1704000000 {
> +			opp-hz = /bits/ 64 <1704000000>;
> +			opp-microvolt = <937500 937500 950000>;
> +			clock-latency-ns = <40000>;
> +		};

None of those are valid according to Rockchip, we should have

		opp-1296000000 {
			opp-hz = /bits/ 64 <1296000000>;
			opp-microvolt = <750000 750000 950000>;
			clock-latency-ns = <40000>;
			opp-suspend;
		};

instead?

and...

> +	};
> +
> +	cluster1_opp_table: opp-table-cluster1 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <750000 750000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <787500 787500 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <875000 875000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <950000 950000 950000>;
> +			clock-latency-ns = <40000>;
> +		};

opp-1800000000 and opp-2016000000 should be removed.

and...

> +	};
> +
> +	cluster2_opp_table: opp-table-cluster2 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <750000 750000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <787500 787500 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <875000 875000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <950000 950000 950000>;
> +			clock-latency-ns = <40000>;
> +		};

opp-1800000000 and opp-2016000000 should be removed as well.

Did I misunderstand what Rockchip did here? Adding Kever in Cc at least 
for awareness on Rockchip side :)

I guess another option could be to mark those above as

turbo-mode;

though no clue what this would entail. From a glance at cpufreq, it 
seems that for Rockchip since we use the default cpufreq-dt, it would 
mark those as unusable, so essentially a no-op, so better remove them 
entirely?

Cheers,
Quentin
