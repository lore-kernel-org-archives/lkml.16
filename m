Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A313632B;
	Mon, 16 Jun 2025 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056247; cv=fail; b=nmUdXkAL/H+hgRQTQtCJol7Vo7kXDoy1qnLPGodMYgnKB7gnnt9TvYLS6IESp4JQZ4JAbqyk45WjO+L1Io5lS/LnnRrzyJE44ZgOTLWgRvv5YVaRrackYgj3iBKWaxPQ7FIpxrO/tUoQPGWqbX+hUloggdAbqmD4HK//+900A90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056247; c=relaxed/simple;
	bh=iTjcUp4p0VvYUhvJP8TKTnk55hsXA0sLe3MSCCM6B98=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uHBvUZCY5e4QeRZT1wC/srNnxl+LFLkAue3XGbTAMsKHYTsBMUTShQ+ZnkTVunSni4eQKdrf4F9lKwYAegGQXR06grwhY7ML0nx2xGQuGccT7EcSHebYYTRVkES3rJf5IGxo67Ug82mZXxMBrShYzmZnb8g3Y6hsJFQJ6WyHY5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HWuLlRau; arc=fail smtp.client-ip=40.107.96.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HWuLlRau"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npFxK/g4RbChZRYEvBcgMMBUCoyEyhYM0LPwJzTn5nC1hH2I5eR1lh/Vg6UaD7B0TEoNJ0pNN2mE5TorJkv1HUiSiCcYzyip3JspYJ2tK18emKfhI2e1Mc1ThhMYnVeJ8/frJYeN70VEEX6BR1RrqlqoYTXO9GMYEaWwnS1ZRrTx/iavyjEeAX1nPdV6WouwvEuMerOQUK0ExucbMvXUVwx5PIbHQBlRqUkxhQ9kY06jmyJnn9mw2p9XmaCglgnBqJuZ8CzgzKJtAK+8dkEUHim6SoFO55yf40/WdxtaYbWGS6fbCZ7G1XSHsbCXgWcpGl+nrAAE3Fs20KqHWiK6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTjcUp4p0VvYUhvJP8TKTnk55hsXA0sLe3MSCCM6B98=;
 b=DOztvxb0h7Jx462j4TvoXAQu7kI2z3HjXX0zVv9urIZ36rxSGgh2HLWMNm2kZtXPaI8ymAPBjAZEzSh2YtVP/ypc3q5+QCDPlr3R0kL9qWYRK/x6dwH57GCeFQLcfQYKdBH8kDkCS05kKBKLKDYGOWUDg4avyhqHj68EpyK1UnYRzHECBV9Gk46chlfQTmE+UJhwmIuTbDS8rji4cZV5ALuNphD4mA3+0JrmQIriYh3eRpVaZP5NQ6eSr9YpROlrRh18/iFbwAgvemzXyJnug5EBl9NDR7AtLzbDhCtt3kI6E6x8CPbghWpY3GAwf1zoqQ+rbUf1Ai+8grwhDFqdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTjcUp4p0VvYUhvJP8TKTnk55hsXA0sLe3MSCCM6B98=;
 b=HWuLlRauwuea5osKNFCLnNTGFxlrXnJ/yW/J2fMiD0Ic2HY8k9ezD358pEDAMKVGkvHS6t5rcAo/WPFnh69e9fiCnLlLorG/Gy2VLa2DbTsFn7CcXpoUNKrOqWhfE6o9qsLvpyv1aj+GVMAz3wkhrx+wTf4VCdXdF8XjSaSWaWqnIVVv7ShnPCtp4zjlVBanXueD7w7m3IUNEtTNBFPWVg0sJu+VUJAtixHpxI7RgjDv6kSHGZCoIhKolo/hsXX9vCYzRILltU/EicYgy3DHUgbYdvwUJHKq8cdcTtt+xqnrGMCkpxUU4pCKnPuNYxoYf3k/Dvg66sjZMAcTI48ifA==
Received: from IA3PR11MB9109.namprd11.prod.outlook.com (2603:10b6:208:572::18)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:43:59 +0000
Received: from IA3PR11MB9109.namprd11.prod.outlook.com
 ([fe80::5e4:a133:5224:f6f4]) by IA3PR11MB9109.namprd11.prod.outlook.com
 ([fe80::5e4:a133:5224:f6f4%4]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 06:43:59 +0000
From: <Manikandan.M@microchip.com>
To: <mwalle@kernel.org>, <tudor.ambarus@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Topic: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Index:
 AQHbyh6Tkpoizvmt60egXf7veFuZgLP6mbsAgAATawCAAwRxgIABT70AgAAtyoCABlC1AA==
Date: Mon, 16 Jun 2025 06:43:59 +0000
Message-ID: <a9eea961-9dd5-4026-a15a-ff5635cda268@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
 <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
 <759e4a1e-6af4-4bf9-9a95-01a7f6faaf46@microchip.com>
 <DAJJ1UHCLV0M.2GGHO5PDRWMYH@kernel.org>
 <7c373149-53b9-4488-a8d0-e5560cdee7e0@microchip.com>
 <DAKC3DIYRP6K.1G9HTSVXDJOLB@kernel.org>
In-Reply-To: <DAKC3DIYRP6K.1G9HTSVXDJOLB@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9109:EE_|CO1PR11MB4786:EE_
x-ms-office365-filtering-correlation-id: 505e6b67-e6ae-48e7-6733-08ddaca12c83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVlFYk9ZUXdvWVpjVGdnbVhsWmRJMWMxNUo3emhHekZXNGlpMWpXdWpoZjNH?=
 =?utf-8?B?UERWR0djaU1NbHZGbXc5cllEajQ1Q0FPZ1BMa0ZjdnVnSHYzMW1ZdTJPQ2dI?=
 =?utf-8?B?QlN2ZnpiUVRFd3pWcHRHTkR6bDVVQUMvOUsrUC95MnA4akdkc0xRdHQ3aFBj?=
 =?utf-8?B?cEtUMXRtQjc3Q0ZYRmNDWXV2dm9FTWhwRC9Uak50eWZZVitGK2hwVWFsWTBi?=
 =?utf-8?B?cVBoQTZTNDUwMTBQZXJucSt6MytFcHJTczJDNkN6Tk5wUysrMTJIclZZbmNs?=
 =?utf-8?B?K3NrNWVEMGNudVZESmQ5UTBPS2lNVFNTdnN5TDVVUjZMbU1LcVdTUWEveU5w?=
 =?utf-8?B?cDZzSHZ4L3RWUDBzVFRFb1MvbzRGN01POVBpQkFXSU5sY1BKbFJXQ0doWTYr?=
 =?utf-8?B?NUJxcGxNNllVUjhDeUprYVA3MEFjc2F2YWNvaVBFZm1BZkhnL3ZLR1pHSjQ4?=
 =?utf-8?B?VDhPM0ZORWM3d1pLT05XR0Q5WURQTWJ3Rm8yQ1ZRM0YraGUwV1JTb1pQQlQw?=
 =?utf-8?B?di9LVVRKQUNLSHNOOXpmZHB3MFV1TXVXalJ6Qkovb0hXUmpJZHAvb1FJbFdN?=
 =?utf-8?B?RkxiU0EvZHFTcXQwWGEzb2JYcmUxWG5tWFhmbC9Ca3pIaEVSK1REZGNYdCs1?=
 =?utf-8?B?ZFVNZTE3OHNtM2pqbnhubmJSU3d0MFU4dWhFak96WjhnVkNpMk4rZCt1MytP?=
 =?utf-8?B?amdXcElYS1A0aVIwQjkybWRhcS9DT1JBSEpzWlNycC9FdHNuM25kUUwySDNU?=
 =?utf-8?B?eUd6dEhpcy9LeU9wTThhZC9kNmR1UFpMMUtXMEllaWYzVERnamFCWm9yOHVE?=
 =?utf-8?B?elFXVXFlaEU2TmFzdFhWc1NqWVRJWS9lTjZGSm42bncxcmVKOTRyNExCQnB4?=
 =?utf-8?B?Y1FIbklVajByd21OR0ZIS3U5RjNQYUxubzhBZmVSbm1XNVhxZ29jamRwVWYy?=
 =?utf-8?B?UDdpKzRHL2JmL2VIZ1JkUmFFSXV4eTdyYWNVOUEvazA1UW9KZlJVUFpvQkdt?=
 =?utf-8?B?cnk1MDVNRnJLOWo3enJCVU9JVko5SWtiR3Y3TzNLZ2xFTVJoM1d3dEUzeU5Q?=
 =?utf-8?B?MVQ5M0VIWGVzdEQrNFptZFdNc1JUNXViTmI0bVlEWi9XaW50cEUvZWVmcDFh?=
 =?utf-8?B?MlA4NGNFMi9LUmxKUWhWVzhHOCtXM0JCbE9QOTl1c0V2a05TRmJVcDRXYklB?=
 =?utf-8?B?TTI1K0lDbzBpcGpwNkpiMFkwT0dONkdzaEQwSldMMnc2MHVNUmN0cnljZlFs?=
 =?utf-8?B?STJLSmlxMDRZd0Fid0t5V0ZZdytwaEQvRUlRazAvTmdEOFYwa1VkUlZ4YWQy?=
 =?utf-8?B?YVRKNzlMbmxZZElrZDZMd05rQlByckhRdVN2bjhwZGlMQXlIR2lYdTlXb25t?=
 =?utf-8?B?RWRnT2VSTU5KTldNdEVEUFBRNWs3T1ZEVVRxc3ZIT0JYL0duQytmU3pZN05V?=
 =?utf-8?B?RUwzbUNHa2plc29PU1NVQUtjdnYweG9zcmZ2eS9mZklQWHY0QjFzblYza3Zq?=
 =?utf-8?B?ZzlWNkJzZ201SEJrV2JQa2JYaEtjeWp4eGtXY2MxMzJVV1JSbkxCSWxubUVz?=
 =?utf-8?B?ZUNNZjhnTmYyRlNkVlZpMUZMV0k1eDRHMmR1emxNK09ld1RZRkRuYzBjaHhC?=
 =?utf-8?B?S0lvOGdCRnNtcVc1UVdqaERhVHNhUFdLNE1zcHBSQzVWUURZWjd6dTJQRXc0?=
 =?utf-8?B?V3h6aHYram9QS004OTRseWF6Vm4zTHZHSHNQN2dwSkV1Y04yYnl2OC9UOHFW?=
 =?utf-8?B?ek40V2F3ekV4eWpVTjhuZzBobHNmWWpwUktnVHBhYlN2WHVrNjZpT0REcFRy?=
 =?utf-8?B?emgvcXhDSS9XVmRac1JKNHN1MStibC9aSnptWFJ6SHc3T1ZOWTkzdG9zSTQv?=
 =?utf-8?B?VlBHUTN6Wm56S2RwblJVVFIrWDFiUVpMZGhmS21pakpLaDFGOWRCd3U4NkpI?=
 =?utf-8?B?OHg4bUltcUFtL2dBNUZVY2Zpai9iYUVaaUtScDJCVEtPNk5PZk9IL2xUYmdZ?=
 =?utf-8?B?VVkzM1c4T2psUVF5cXFBVisxcXoyOUowZ29uczZlWnhmbno0bStsNUdxaTV0?=
 =?utf-8?Q?OxBkt0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9109.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3dlUkdrMGZUY0s3WkFjLzkwbHpSWVkxN2I4UzRmazFwNmtGOVo1VXVjWTFL?=
 =?utf-8?B?ZjIvYzJra1BPVnNidnRQR0QzanhncThhMy9KSGNKUFVwVFVOUjI1VE43eTJj?=
 =?utf-8?B?RWQ0b2Y3TDU2MVZ3Tjk5bjNuVUx2MGdwMFJuVndjYjNQWWVBa1FXYXJyaHJS?=
 =?utf-8?B?S3RDVUxRbWNXSzI1T2ZYT1hLQkRkd0JEUDZaZnRCODRmVGpTc2JMMmVVZTR5?=
 =?utf-8?B?ZkVHa2tUdkw0bkQyUjlEaHBzTkRwNUJqaHQ1NGFjMTdUVUJqVUloTWxsVEx3?=
 =?utf-8?B?dlJvZnhvbjJzWUZoZXZ6emlPTUFRVTB2cGRRZkxVS2RJZVJQaHdqYVdQV3FK?=
 =?utf-8?B?MEx5U0l3dGZqS3ZSaTBxeElJTGR6c0dGTmcxeGdzR2M2d2xZMTA3dVovZkNM?=
 =?utf-8?B?Rng5eWxEdlN5d24vajJwT0VCQVVxQkpoemY0MGs1S3dvWWlRM0hBY0EwWWN0?=
 =?utf-8?B?MGFXODVRN1RYblA4b25kT2Z2OTYyWmZvemdZZGZ3aXIrTlZSbExrM2NYNDFq?=
 =?utf-8?B?aUxWM1E0Z3ArQ3ZBb3ZjQStpMWJGQ24zanJEVHZ3Ny8ya1lLbFVEWXZabHJS?=
 =?utf-8?B?SEZpMSs5dlBZSjVvWE1sWjlQR1hqdUlNV2J2Q0NzUlFtQ0ZlYTN2QmZYMUs4?=
 =?utf-8?B?WG50WE0vdStXMVVLbm5zTVA5NEFZN2ttaXdmeHZwS0pMZGVUZTZ5WGRYUWd1?=
 =?utf-8?B?eHIrTk9CSGVLTGQwNVN3VXhqdTJWLzBXS3c0VTVsdUpxZjBvMmNTbzdPUGxj?=
 =?utf-8?B?NVk3R1lRNlhJR00rL3lPZHowWml6ZjVheTVVa1dJMmd0S2FIQU9zWG1FQjRa?=
 =?utf-8?B?MTM5ZnBrck5DcmY4eUpTZThRMWpMT21HeVVETEh4dGZzZ2ExNmN4TTRQcVEz?=
 =?utf-8?B?dlIrSHdWMEM5OGxEQkxra1I4Y1NaaUFpa3JEWjZHR3FFVDNqU2txY3dTSkJQ?=
 =?utf-8?B?Wm0wenNQc3l0ZUU1V0NEUVZyUURERjRiMWZNOTZIU0NoYk1rY3haU01hblR4?=
 =?utf-8?B?dTZ3T092Qk40bk5BMGptZytET1pTRDNaQ0FYQWZ2T25PNjl6d3JjRGFLVXhl?=
 =?utf-8?B?RHUvV01qSlI0M05SQmEwdzlrbmMrTXkwTDF4NTJJWi9pVVFUU3Nrd2txUWZZ?=
 =?utf-8?B?SUhZREsvOHdYVXEybFdTM0dHQmZWVGloSXZWcVBxMGtNVjFGdUJzcit2dHJF?=
 =?utf-8?B?Qm1MVDYxTzIzSG5ySkludDVXNFRnekpUTlBoN1NoN1IvaVJ6SmkveUpzVzFx?=
 =?utf-8?B?NWF6d3hHN1RyaHRsTU5IQ3MyL1JadENHaSs3ekFNZlBzalIzY2pVNURpaTMy?=
 =?utf-8?B?Q0JnTHhNT2U4R2R0VlpHN0ZaeVRqai9WQnZYN0I4UGkvOWNhUjJ3RFpHY0JC?=
 =?utf-8?B?WDBkcDNjSWZhOEdyQkhSS1MvM0VVRUZKZFJic3ovSXhkMnhGZFJpMXlmVW1J?=
 =?utf-8?B?YzdVZitWWFJqR1M1cHZBM0tuUms3UFV0Ukx6cFM1TjdGQmNsckZ5Mzlmd2V2?=
 =?utf-8?B?a3Y4Rnl2K1FHNCtJZERCa0NIVllZL3RMbFV2b2MzbTB2Nkc4ekgzSFpRb01j?=
 =?utf-8?B?NmlaRG5IblRnVU1zK2puK1BZRGZJcm1lUW1qVkNDSWduc3pIUEhFY1gyaUVU?=
 =?utf-8?B?QmtkOXlwZDBmZkxHWFNWZXdBYTFKRkR0MGlwOHczQ2hsNm5FdnNTTTV1c1B1?=
 =?utf-8?B?KzQ4eGVaZVgweVpNOHlDVVZsWE5lQ0ZnQTEyQU5vYVZiMFkrNjlsc2dXaFR0?=
 =?utf-8?B?a2hTdXNCQU5HRkpKYzZvRGF0alBwb3FlOUZLMEpWS1RrcUxyVzl4NW1YZ0VP?=
 =?utf-8?B?MnRGU29JREV3Z1JZYSttbXgvRXV4SjNWZU1EanhtK2lTTGZRRHdxcUpsQy9o?=
 =?utf-8?B?QWloYWFwdXdOK2JTaHhJRjlyMlloTGVCc2FPL0ttRldMUERUQzk5Ly9JOER5?=
 =?utf-8?B?MlJmdUxoMTNNcmFlcHI5Mlc4czg3SFcybWxzcVlZbkNyOWJESnppdEt5R2ZP?=
 =?utf-8?B?aTBxUUJsU0FoZER2czg1MW45a3lyWjR0R2ZiaG1HRlhTZkNDT2VCRTRLeW5Y?=
 =?utf-8?B?WFNnTjZkc05hRXpVWHBudEZwWWhqM2J1a3doK3l6QXBQK3E0RS9kR2MyV0wv?=
 =?utf-8?Q?3f9E1JD00k2xuYy9vDawRYsD1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCC5419D239873428EB80B792311EC6B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9109.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505e6b67-e6ae-48e7-6733-08ddaca12c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 06:43:59.2566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CT9k/q8YG9PeRfEO+f2PHvHzpVERXvJRwfIylAWqyEBV82yoZo+nFMhCFQVco5674zdJTtpLd7kWj3mE5YVJc5iFZZ29Yl42ZwRhnD1b2Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786

SGkgTWljaGFlbCwNCg0KT24gMTIvMDYvMjUgMTE6NDcgYW0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6
DQo+IEhpLA0KPiANCj4+Pj4+PiBBZGQgbnZtZW0tbGF5b3V0IGluIFFTUEkgdG8gcmVhZCB0aGUg
RVVJNDggTWFjIGFkZHJlc3MgYnkgdGhlDQo+Pj4+Pj4gbmV0IGRyaXZlcnMgdXNpbmcgdGhlIG52
bWVtIHByb3BlcnR5LlRoZSBvZmZzZXQgaXMgc2V0IHRvIDB4MA0KPj4+Pj4+IHNpbmNlIHRoZSBm
YWN0b3J5IHByb2dyYW1tZWQgYWRkcmVzcyBpcyBhdmFpbGFibGUgaW4gdGhlDQo+Pj4+Pj4gcmVz
b3VyY2UgbWFuYWdlZCBzcGFjZSBhbmQgdGhlIHNpemUgZGV0ZXJtaW5lIGlmIHRoZSByZXF1ZXN0
ZWQNCj4+Pj4+PiBhZGRyZXNzIGlzIG9mIEVVSTQ4ICgweDYpIG9yIEVVSS02NCAoMHg4KSB0eXBl
Lg0KPj4+Pj4+IFRoaXMgaXMgdXNlZnVsIGZvciBjYXNlcyB3aGVyZSBVLUJvb3QgaXMgc2tpcHBl
ZCBhbmQgdGhlIEV0aGVybmV0DQo+Pj4+Pj4gTUFDIGFkZHJlc3MgaXMgbmVlZGVkIHRvIGJlIGNv
bmZpZ3VyZWQgYnkgdGhlIGtlcm5lbA0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFu
aWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4+Pj4+
IC0tLQ0KPj4+Pj4+ICAgICAuLi4vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xz
b20xLmR0c2kgICAgfCAxMyArKysrKysrKysrKysrDQo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xzb20xLmR0c2kgYi9hcmNoL2FybS9i
b290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQyN193bHNvbTEuZHRzaQ0KPj4+Pj4+IGluZGV4
IGIzNGM1MDcyNDI1YS4uYmUwNmRmMWI3ZDY2IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL21pY3JvY2hpcC9hdDkxLXNhbWE1ZDI3X3dsc29tMS5kdHNpDQo+Pj4+Pj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xzb20xLmR0c2kN
Cj4+Pj4+PiBAQCAtMjEwLDYgKzIxMCw5IEBAICZtYWNiMCB7DQo+Pj4+Pj4gICAgICAgICAgI3Np
emUtY2VsbHMgPSA8MD47DQo+Pj4+Pj4gICAgICAgICAgcGh5LW1vZGUgPSAicm1paSI7DQo+Pj4+
Pj4NCj4+Pj4+PiArICAgICBudm1lbS1jZWxscyA9IDwmbWFjX2FkZHJlc3NfZXVpNDg+Ow0KPj4+
Pj4+ICsgICAgIG52bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJlc3MiOw0KPj4+Pj4+ICsNCj4+
Pj4+PiAgICAgICAgICBldGhlcm5ldC1waHlAMCB7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwPjsNCj4+Pj4+PiAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8
JnBpb0E+Ow0KPj4+Pj4+IEBAIC0yMzgsNiArMjQxLDE2IEBAIHFzcGkxX2ZsYXNoOiBmbGFzaEAw
IHsNCj4+Pj4+PiAgICAgICAgICAgICAgICAgIG0yNXAsZmFzdC1yZWFkOw0KPj4+Pj4+ICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4+Pj4+Pg0KPj4+Pj4+ICsgICAgICAg
ICAgICAgbnZtZW0tbGF5b3V0IHsNCj4+Pg0KPj4+IElNSE8gdGhpcyBzaG91bGQgYmUgInNmZHAg
eyIuDQo+Pj4NCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhl
ZC1sYXlvdXQiOw0KPj4+DQo+Pj4gUGxlYXNlIHJlYWQgbXkgZmVlZGJhY2sgb24gdGhlIGZpcnN0
IHZlcnNpb24gYWdhaW4uLg0KPj4+DQo+Pj4gRm9yIHRoZSBEVCBtYWludGFpbmVycy4gVGhlIFNG
RFAgaXMgYSBzbWFsbCB0YWJsZSBiYXNlZCBjb250ZW50IHRoYXQNCj4+PiBwcm92aWRlIGJhc2lj
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBmbGFzaC4gVGhlcmUgYXJlIHN0YW5kYXJkIHRhYmxlcw0K
Pj4+IHdoaWNoIGFyZSBzcGVjaWZpZWQgYnkgdGhlIEpFREVDIHN0YW5kYXJkIGFuZCB0aGVyZSBh
cmUgdmVuZG9yDQo+Pj4gdGFibGVzLCBtb3N0IG9mIHRoZSB0aW1lIHdpdGhvdXQgcHJvcGVyIGRv
Y3VtZW50YXRpb24gKG9yIG5vbmUgYXQNCj4+PiBhbGwpLg0KPj4+DQo+Pj4gU29tZWhvdyB3ZSBu
ZWVkIHRvIHNwZWNpZnkgYXQgd2hhdCB0YWJsZSB3ZSB3YW50IHRvIGxvb2sgYXQuIEknZA0KPj4+
IGxpa2UgdG8gc2VlIGEgYmluZGluZyB3aGljaCBjYW4gcG90ZW50aWFsbHkgZXhwb3NlIGFueXRo
aW5nIGluc2lkZQ0KPj4+IHRoZSBTRkRQLg0KPj4+DQo+Pj4gU28gSSd2ZSBzdWdnZXN0ZWQgdG8g
dXNlICJjb21wYXRpYmxlID0gamVkZWMsc2ZkcC12ZW5kb3ItdGFibGUtTk5OTiINCj4+PiB3aGVy
ZSBOTk5OIGlzIHRoZSB0YWJsZSBwYXJhbWV0ZXIgaWQuIEFkZGl0aW9uYWxseSwgdGhlIHN0YW5k
YXJkIGlkcw0KPj4+IGNvdWxkIGhhdmUgbmFtZXMgbGlrZSAiamVkZWMsc2ZkcC1iZnB0IiAoYmFz
aWMgZmxhc2ggcGFyYW1ldGVyIHRhYmxlKS4NCj4+Pg0KPj4+IFNvIGluIHlvdXIgY2FzZSB0aGF0
IHdvdWxkIGJlOg0KPj4+DQo+Pj4gZmxhc2ggew0KPj4+IAlzZmRwIHsNCj4+PiAJCW1hY19hZGRy
ZXNzOiB0YWJsZS0xIHsNCj4+PiAJCQljb21wYXRpYmxlID0gImplZGVjLHNmZHAtaWROTk5OIjsN
Cj4+PiAJCX07DQo+Pj4gCX07DQo+Pg0KPj4gU2hvdWxkIHRoZSBudm1lbS1sYXlvdXQgYmUgaW5j
bHVkZWQgYXMgYSBjaGlsZCBub2RlIHVuZGVyIHNmZHAge30sIG9yDQo+PiBzaG91bGQgaXQgYmUg
aW1wbGVtZW50ZWQgYXMgYSBzZXBhcmF0ZSB2ZW5kb3Itc3BlY2lmaWMgZHJpdmVyIHRvIGhhbmRs
ZQ0KPj4gdGhlIGNoYW5nZXMgaW50cm9kdWNlZCBpbiBwYXRjaCAxLzMgPw0KPiANCj4gVGhlcmUg
aXMgbm8gbnZtZW0tbGF5b3V0IGludm9sdmVkIGhlcmUuDQo+IA0KPiBCdXQgYW5vdGhlciBwb3Nz
aWJpbGl0eSBpcyB0byBtYWtlIGl0IG9uZS4gVGhlbiB5b3UgaGF2ZSB0bw0KPiAgICgxKSBleHBv
c2UgdGhlICplbnRpcmUqIHNmcGQgYXMgYSBudm1lbSBkZXZpY2UNCj4gICAoMmEpIHdyaXRlIGFu
IG52bWVtLWxheW91dHMgZHJpdmVyIChpbiBkcml2ZXJzL252bWVtL2xheW91dHMvKQ0KPiAgICgy
YikgY29tZSB1cCB3aXRoIGEgRFQgYmluZGluZyB0aGF0IGlzIGdlbmVyaWMgZW5vdWdoIHRvIGV4
cG9zZQ0KPiAgICAgICAgdmFyaW91cyBwYXJhbWV0ZXJzIG9mIHRoZSBTRkRQLCBub3QganVzdCBh
IG9uZS1vZmYgZm9yIHRoZQ0KPiAgICAgICAgTUFDIGFkZHJlc3MgdXNlIGNhc2UuDQo+IA0KPiBN
YXliZSB0aGF0IGlzIGV2ZW4gYSBiZXR0ZXIgZml0Lg0KPiANCj4+PiB9Ow0KPj4+DQo+Pj4gSSBk
b24ndCBrbm93IHdoYXQgTk5OTiBpcy4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIGEgZHVtcCBv
ZiB0aGUNCj4+PiBzZmRwIG9mIHlvdXIgZmxhc2guDQo+Pg0KPj4gUGxlYXNlIGZpbmQgdGhlIGVu
dGlyZSBTRkRQIGRhdGEgb2YgU1NUMjZWRjA2NEJFVUkgZmxhc2ggaW4gVGFibGUgMTEuMQ0KPj4g
b2YgMTEuMCBBUFBFTkRJWA0KPiANCj4gUGxlYXNlIGR1bXAgaXQgYWNjb3JkaW5nIHRvIFsxXSwg
c28gd2UgaGF2ZSBpdCBpbiBhIG1hY2hpbmUgcmVhZGFibGUNCj4gZm9ybWF0Lg0KDQpIZXJlIGlz
IHRoZSBkdW1wIG9mIHNmZHAgYXMgcGVyIFsxXSwNCg0KW3Jvb3RAc2FtYTUgfl0kIHh4ZCAtcCAv
c3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkyLjAvc3BpLW5vci9zZmRwDQo1MzQ2NDQ1MDA2MDEwMmZm
MDAwNjAxMTAzMDAwMDBmZjgxMDAwMTA2MDAwMTAwZmZiZjAwMDIxYzAwMDINCjAwMDFmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZkMjBmMWZmZmZmZmZmMDM0NGViMDg2Yg0KMDgzYjgw
YmJmZWZmZmZmZmZmZmYwMGZmZmZmZjQ0MGIwYzIwMGRkODBmZDgxMGQ4MjA5MTQ4MjQ4MDZmDQox
ZDgxZWQwZjc3MzgzMGIwMzBiMGY3ZmZmZmZmMjljMjVjZmZmMDMwYzA4MGZmZmZmZmZmZmZmZmZm
ZmYNCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZg0KZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmDQpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmYNCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZjAwMDRmZmYzN2YwMDAwZjU3ZjAwMDBmOWZmDQo3ZDAwZjU3ZjAwMDBmMzdmMDAwMGZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYNCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmDQpmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYNCmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
DQpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmYNCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZg0KZmZmZmJmMjY0M2ZmYjk1ZmZkZmYzMGYyNjBmMzMyZmYwYTEyMjM0NmZmMGYx
OTMyMGYxOTE5ZmZmZmZmDQpmZmZmZmZmZjAwNjY5OTM4ZmYwNTAxMzUwNjA0MDIzMmIwMzA3MjQy
OGRlODk4ODhhNTg1YzA5ZmFmNWENCmZmZmYwNmVjMDYwYzAwMDMwODBiZmZmZmZmZmZmZjA3ZmZm
ZjAyMDJmZjA2MDMwMGZkZmQwNDA3MDBmYw0KMDMwMGZlZmUwMjAyMDcwZTMwMDQ5MTYyNDVhMDky
NDAwMDFlYzAwMDAwMDVhMDkyDQoNCg0KPiANCj4gLW1pY2hhZWwNCj4gDQo+IFsxXSBodHRwczov
L2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL210ZC9zcGktbm9yLmh0bWwNCj4gDQo+IA0KPj4+
IE9uIE1vbiBKdW4gOSwgMjAyNSBhdCAxMToyNyBBTSBDRVNULCBNYW5pa2FuZGFuLk0gd3JvdGU6
DQo+IA0KPj4NCj4+IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2FlbURvY3Vt
ZW50cy9kb2N1bWVudHMvTVBEL1Byb2R1Y3REb2N1bWVudHMvRGF0YVNoZWV0cy9TU1QyNlZGMDY0
QkVVSS1EYXRhLVNoZWV0LURTMjAwMDYxMzgucGRmDQo+Pg0KPj4NCj4+IFRoZSB2ZW5kb3IgcGFy
YW1ldGVyIElEIGlzICdCRicgaWYgSSBhbSBub3Qgd3JvbmcuDQo+Pj4NCj4+PiAtbWljaGFlbA0K
Pj4+DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4+Pj4+PiAr
DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIG1hY19hZGRyZXNzX2V1aTQ4OiBtYWMtYWRk
cmVzc0AwIHsNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgw
IDB4Nj47DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIH07DQo+Pj4+Pg0KPj4+Pj4gSG93
IHdvdWxkIHRoaXMgd29yayBpZiBpbiB0aGUgZnV0dXJlIHRoZSBtY2hwIHZlbmRvciB0YWJsZSBh
ZGRzIHNvbWUNCj4+Pj4+IG90aGVyIGluZm8gdGhhdCBuZWVkcyB0byBiZSByZWZlcmVuY2VkIGFz
IG52bWVtPyBIb3cgZG8geW91IGRpc3Rpbmd1aXNoDQo+Pj4+PiB0aGUgaW5mbyBmcm9tIHRoZSB0
YWJsZT8NCj4+Pj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhhdmUgc29tZSBraW5kIG9mIGFk
ZHJlc3MgYW5kIHNpemUgdG8gcmVmZXJlbmNlDQo+Pj4+PiB0aGUgU0ZEUD8NCj4+Pj4NCj4+Pj4g
SSB3YXMgcHJldmlvdXNseSBhZHZpc2VkIG5vdCB0byBoYXJkY29kZSB0aGUgb2Zmc2V0IGluIHRo
ZSBEZXZpY2UgVHJlZQ0KPj4+PiBbMV0uIEluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIChw
YXRjaCAxLzMpLCB0aGUgcmVhZCBjYWxsYmFjayBmb3INCj4+Pj4gdGhlIE1DSFAgdmVuZG9yIHRh
YmxlIGRpc3Rpbmd1aXNoZXMgYmV0d2VlbiBFVUktNDggYW5kIEVVSS02NCBNQUMNCj4+Pj4gYWRk
cmVzc2VzIGJhc2VkIG9uIHRoZSBudm1lbSBzaXplLCB3aGljaCBjb3JyZXNwb25kcyB0byB0aGUg
c2l6ZSBvZiB0aGUNCj4+Pj4gcmVzcGVjdGl2ZSBNQUMgYWRkcmVzcy4NCj4+Pj4NCj4+Pj4gWzFd
IC0tPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0Q4ODlIWkY5N0g4VS4xVVVYNTRCQVZM
QUMzQGtlcm5lbC5vcmcvDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4+ICsgICAgICAgICAgICAgfTsNCj4+
Pj4+PiArDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICBwYXJ0aXRpb25zIHsNCj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsNCj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+Pj4+
Pg0KPj4+DQo+IA0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
