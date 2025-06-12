Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1F4C85;
	Thu, 12 Jun 2025 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749699229; cv=fail; b=dIcIbfvdrFvewpCAqyALSJriR3GUMLKkctRiWZrDeVSisc+Yw/I5Gc0PULirpSkbbUYuBsBbVKB5nWhm1rHyGU0Yp2WMWRLPMBVw2dtbln1EDKFjHjLrqbSnXeiCukEQK7x2eFTD4aZXo3yTPZHiOnuL8e95GhQRgEceJoLYf2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749699229; c=relaxed/simple;
	bh=tAfSgGzYWJCWxtKEsGgQxNDRepYAM1O+8yCVPjiYGC4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QHhfKWEDDn3L5oQnIndw2kYyquVvP19T1oZumWQ/1Iu5dgxhH9TChoHzYnQdodTIeCqKAVQ3FvKWCHpff+mCL/ff1DLeRj3q/jsRjgpd3J3UVickZH2zxpuXzd31vXXuzfkTjpQ95p4FKbBwXKbW9/uScoc0pBSGMdFaruKxmtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JQyUr1YV; arc=fail smtp.client-ip=40.107.95.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JQyUr1YV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaSpdzxczKib4Od5/v4Vb/OfTPC8InIi4vY4gRDtOPSUt5vZ//ccETQqfFYSD+IHDNtnv7MAkNMoVWB4zQT6BsT8jPkeEt23RRv+7sNNnyAiejNOK4tTH3LZYBi3kgN2XT7iF3E101W+x9MzMksGJ3RK1oNbxx++Av59i4mfG67kibEIHvlfxxxchvm/vvNZOgjbuIlq/PCg67HL31uFR4u9ZaiBY4rBV0AmJwtQCTG9lNd18I93drLfXg+N6iWN4eHXGFsMU9cB5OlEsptXuqKte6nPochlkix9B2tIwvyepwbuOrz8GbpRLEOeACfilaT1RPaagE4hM3m1yjcyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAfSgGzYWJCWxtKEsGgQxNDRepYAM1O+8yCVPjiYGC4=;
 b=djfmpdX4HFxz79cQbvEF9EgnJoFGiq+aO0SMGXD0TvxeqUdXrnsi6HkU0XuwH/tPPCbcnVmdSsKNub9+Cypt1O78LgrroD98ICugmMfSR+VLWF/PVcDcdpVmolGbeSWfSMSdmYjDa6F8p+yd9YIXt46hjFO4+xv7NxaWZ4EBNpav3hr20aeYDbc9Uwd2hQvSqlyTH59OQhd9nu04Pqi1GeG5JLtnd7fOkrn11fHJpd2nAoXTc1j7FYAjtL/+ZzJUSAJunSGA1WsbaTKn0Z26OrPJhV2U5DnmUiMpMBdp9E0UViQY+jEns6DAY4HhvIBueTLQ78t1FDj2qAr9WTP0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAfSgGzYWJCWxtKEsGgQxNDRepYAM1O+8yCVPjiYGC4=;
 b=JQyUr1YVBl7JSNHlD3unI6YqWC7y+5xjcWE1LGDG7lApXSn82SeU7h5nI7NNk9kLaX0rNvMOO5+/IX27huLv4O6OxaaRPjgcWWLznJV5FNqgwusOdq2UHTBuxjJEWPcrHncfopfidzotWGnXn4+hovCmWkLI7Ag6nCxS3qq4gh3WjymJEZ8Q3fBK6slZWkJ0zICiKaSbD3uBJYITkL7La7Gz13vaqQ33l/DouHCkSm3Azj7MD5Ch+IaEECxiUWJwiU4c4jkYpJCFFqrttIP+ML4QPjE3+NsF5RzMnG+Kl81W9vkkDXE7xTF72AMixiCUote86JjYguKRHIxxJFfWFA==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by PH7PR11MB5982.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 12 Jun
 2025 03:33:42 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a7eb:da5d:125c:3345]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a7eb:da5d:125c:3345%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 03:33:42 +0000
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
Thread-Index: AQHbyh6Tkpoizvmt60egXf7veFuZgLP6mbsAgAATawCAAwRxgIABT70A
Date: Thu, 12 Jun 2025 03:33:42 +0000
Message-ID: <7c373149-53b9-4488-a8d0-e5560cdee7e0@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
 <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
 <759e4a1e-6af4-4bf9-9a95-01a7f6faaf46@microchip.com>
 <DAJJ1UHCLV0M.2GGHO5PDRWMYH@kernel.org>
In-Reply-To: <DAJJ1UHCLV0M.2GGHO5PDRWMYH@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|PH7PR11MB5982:EE_
x-ms-office365-filtering-correlation-id: f411d2dd-5551-4a59-1f9d-08dda961edbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NDlPRkpROSs1cUh4UHZyM1JYY1dPM29pSkEySkMzWU9Fd0lBQkE5WGhQRFcw?=
 =?utf-8?B?dlpoVVYwYStWRy93dnlxaVF6UGcwdzdXZmV5SFVzdGNFVkczNVJSZW00M1I1?=
 =?utf-8?B?YzJqWlpEbEFrdTZqdUhIRFdDZkdnUnQ0a0V2TE9xK2dZUldWSHNadk5WR0xK?=
 =?utf-8?B?ZjBVb0xZVVdMWU4wUTM4WmRFSFkyVXVSc2xDUFJqNDZxbWdvYkJSU2xURWV4?=
 =?utf-8?B?OHgxellEd2h2R2pRNG9hMTZQTFg5VklvdWlRdmhhMnpMQVBtYVY4QW9RYVpI?=
 =?utf-8?B?cHJ1ZFk5bkpGRUFFMHdkR1VuSWxZcnNpK1J5VEEyaDJ2eDZSd0xsV09QeDQx?=
 =?utf-8?B?ZXBiZ1JYdFZTVGJTMTlOVTF0T3Fqdk8yalZIQnoxVUtSMC8rZ0cwWHlWLzVj?=
 =?utf-8?B?WUVaRnRsdnhnampOSVczdTBxbEgyZWRqbzNPb0lBemVDakJYazQyY0FSMlE1?=
 =?utf-8?B?b0phM3NQRzN3YjEzdWZsSWFkN0ZZZjcxOWk4ZU9RejJoN2F2YUpwOUVGNTNk?=
 =?utf-8?B?d0hIbXJ1dFAycFp5T0U0N0dVekRvNjdwZ3lyRExha2JCUUVBN3JtcDhWS0Q4?=
 =?utf-8?B?LzUyNkFBUEh3MzB1QzRHZzc4ZUQ5bUhKRWJ4ajAvMVBESVMwbk9nSDhTcGts?=
 =?utf-8?B?YlVSK1ZPVnpiaGdJVFF6d0hXdkdqeCswbmNZelEySTlhVWVuaGNiempqZW5k?=
 =?utf-8?B?UlZBbW02UmhrcjkzU2wyak5UV01wUVhmeGVKc1lEZDZmaFZ2bDBuMytoUHdN?=
 =?utf-8?B?Snovdkljeis1Qk5WTittd0tOOVY5cUYxR2N2NU5UTjdRdVhGVFNKQitJUDU0?=
 =?utf-8?B?UUdGUGMvK1hyellQNlIzbTlNbWFjMFdWUUM3V3IvMjJZbE5qV2JUalI0dnBq?=
 =?utf-8?B?OTd4NTR5d0k3TlNGMFF2VTVIcmZqcjZBdjBNZVhFdWV6bHNKbkVpcEU4QUo4?=
 =?utf-8?B?R2dUS20rQkdLZ1NtN0s3bWlCS1IwbmRJZ0xtMWNFcktZUld0cDR0eXAzN0RE?=
 =?utf-8?B?RkQwRVI3b2w0OGlzcnJUS1RnRVFqZG1ybDhWZE1hTTcwMzI5US9VSkR2MkE4?=
 =?utf-8?B?SHBiNnV2YlZEQldiWmdNRUp3RjhQRWJndnhTSVY5dlBDd1BBMlZFNGVFZi9W?=
 =?utf-8?B?RngyVy9ISFFoVWdEMkw5Sk8zWEczNVFwNTliRTdLdHBSRmlpOGFTZlpoN2kw?=
 =?utf-8?B?eU9oNHhHQUZsUVg1VW12UVdxZGlGUDl2MTVIYXRsQWxhSWtzOFVsKytCTzZh?=
 =?utf-8?B?SWJZWVdIQUtDZTZzTSszUE1RMGNuaU1HVFhjRGdxN05UVHI5V3MwdUhtaERK?=
 =?utf-8?B?eUdNNFlTRGRwalhXY0ZyTUZETVUyT1VLVzJodDZnTFRMU2ZReXVGbW9iV2Qx?=
 =?utf-8?B?dEkzaUl6Q0VJdXFkdEsrWU5Dc1h3N3BaM3hMMGpJMFdnN1hHaWJEOUZ3NGRR?=
 =?utf-8?B?ZHVBRW5ncmE5dG0yL2Y0OXlBUkRzbnpGTWtDem5SakhQdEtQeXU2bjdZUFE0?=
 =?utf-8?B?WG9HSWorQ2RLN09hWjl2UlhIa2pPNWgzNXhVTDNDelh2NHk5SnZiZHZvK2Nq?=
 =?utf-8?B?SWRxTEY4SU94K3BFQ2JQOXlySkNEbEhPQkt6UFFSamFZQkZFSDhFN0lJTE1I?=
 =?utf-8?B?NjRSOEo0aFBYWWE5aUIyalVkaEhyUEptWlRYM1F4RVFuRjJHNU5Lbng1ZE4x?=
 =?utf-8?B?ZlNObEpJY2RUemdsaG10Z0p5SDVOSVFvQUo2eVByejJHdG5idGJmTlp3Wkp2?=
 =?utf-8?B?SHRvaFJ2RXdyV1MvRGFsTzdUc2Fsb05tNmlPQ212U2UxOWMrY3FrOXR4WnpV?=
 =?utf-8?B?L1gvN254T1VaclJTRVNFemhGVGJtZElZbC94ZUt3SUlDeWRMZ2IxMGNFNDJ0?=
 =?utf-8?B?V0VRUFJHYVN1QUlFU2MzdEY3K0pQK1pIMG91Q3dvT2R2ZHNDVzFuc24ydGVo?=
 =?utf-8?Q?8dTxjlLM6/GMPMerF+h0npy3ob1t+jUo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTMyNVU0Z2dPdmpRblFBYUxDT255dEFoa2syOTdaRFBMaEF2N3RZOWNZdGlR?=
 =?utf-8?B?L2hEWE1UTXhZWXphWnNoMTNHWm4xTnU3dmNOekhaRHBOczJQeWZQQThvQ1Z5?=
 =?utf-8?B?THBuU0pFMFZyckk2c3lFQ3NNbGFKSEJxUlpSWmtYNGN2MEtBR3pNUlhramxu?=
 =?utf-8?B?S3BGTUM2ODZ6Tm9IVnA4OTQwSjVYc1pUY2J1dEwwWm9LOXpFakpSRCtNNUZi?=
 =?utf-8?B?TzQyamEzb1lFdWlQaE16dU1xcm5jZFhmUUQvcDFiY0l1SEVTQXMzQUdkWHRB?=
 =?utf-8?B?eFR0cEVQQ2kyVlJ5dnEvNGswUExmeGNrb3RTemxhN3lUdjFxYkdoN0RGN1R4?=
 =?utf-8?B?azFMd2twb09rS3d0eklHQ0pWOSs2OEExM2hYQ0hudGpJVzU2NmtYb2IwR3M5?=
 =?utf-8?B?WGVkQk9aSGVhTzV1TGNlMmI1dHhrR1d5SHM3WlV3MGxCdk1tL25wQm9DeDM5?=
 =?utf-8?B?YnRoZ2E1aGRPalgxYVEyM3U4L2xJemg3T2svQktyUkFSaXVQSWN1bDduME5H?=
 =?utf-8?B?cGVIUEh1Uzc0VkdDcDZsWktESmVpMHJuRGtrL3ovTVRCOHJyVnVhaXh3SVNB?=
 =?utf-8?B?NXpsT0d5dG1hYzRZNHhJWkJoOUcyVnNSUk4zWWx0R2o0ZlNNb2haandRTy9N?=
 =?utf-8?B?TlNJYzlobFgwSWllejdzL21WRjBvRlVobG1HTHhGVEo5eDlDOUYxRHBFdFpv?=
 =?utf-8?B?WUVuS3BzZlM1SHVWRGNpb3ZxdUF0ZytVVUhEVnJSNk9JUVJoZUVGZHBPQlRv?=
 =?utf-8?B?Y1k0N1RoM1FWMGN3eW1QMlhwMjkrQTQ0VkI5NjNmb2tLamVkMUlpVEtWcXJ4?=
 =?utf-8?B?elRPRXF5dlpXWnc0clBPbEI1Zlpia2VEY211OXNYUk1GRnNBckdGVGZBWVY4?=
 =?utf-8?B?SWw2VW5iQ3F1emdENXZLTHVCRTludzQySUlpMDNvSnNoQUZ2bHQ4T0FUbGxY?=
 =?utf-8?B?dUZYQ3VzL2VCZHVDdGpwSkJNTTJaazRUTUJRcnlsUTgyN21BbDQvdGcvN1ZQ?=
 =?utf-8?B?UlVRblYzTGNHeWtlUkxxcFdKaUlqeGlHLzdFU1NOV2xpbHFydFQyTTNUd3lU?=
 =?utf-8?B?WEFlNkxEZVpkdXJWWlE5d2xuQzk1eFZJUXBWODlHTlpNZW1XRDJzandVRjZM?=
 =?utf-8?B?VC9iWEFEVDNjZEpyeG56RndXN1BSZ2hmZW9XTHF4Y0s3VnFpL1NmRXorNEwv?=
 =?utf-8?B?WDVGaDlWbUIxdzFZOEllM1N1ck9RU1BOaW9jSzVzNHYrRFNYd2V1ZjlURUhv?=
 =?utf-8?B?VG1oU3U2MHlCd0c1RUJ3ekZUN2NPZlFjWDdqTjVocDJYU0dMY0gwWThHSHhR?=
 =?utf-8?B?S1VpNEhmc2JFYmI4c3ZFS2hLd3NzYU9WQndDRWY3K1pROThDL2JzcWxqV3pJ?=
 =?utf-8?B?ME1lUTk5SEkzTlNyQklXcGxMblFvWEkxMy9BYjQvcE81am9MU1B2YkloekNt?=
 =?utf-8?B?MExXcm5ma3VRV2pFUjlQYkRvZG1LRkpLM3p6azY4YTJlNU1RR25VV1VVem11?=
 =?utf-8?B?UFJaWUxLOFdsS3kzTTMrYjJ5WGZvaXVRbTlqVzlJd3hJdHprbTVnOGU5TStM?=
 =?utf-8?B?Ynhlb09MUWpqQ0o4NUw3UU1DZUVDU2tRYmpUdFZ2WjcyZWRQRlQ0NlNUQ2JC?=
 =?utf-8?B?emNhbU5yK252dG53SG5FUUsxdWZuVWpqU2d6cGVGRWw5K1o3bmI0aDRoY0hC?=
 =?utf-8?B?WGFUK3QzUVB5K0hvNXZEL0NrVVhnY2dwakpCbC81aHJWdzM5Y010TTdydGlt?=
 =?utf-8?B?OElxWTkzdTVGUEcrNE1MMDVDaXVwclR1TUpDRDFheXBBaHZER1luZjJudlRZ?=
 =?utf-8?B?RmtvRjcvK255NFVjQ1hyY3Y2bFlvcXBHcFhzMFNXanF0eGhmRXBYd2gvSnB2?=
 =?utf-8?B?SWc2MFdsWThQS3AvTlFFNmRVdngvQUl3WmI4Z09YaTRXUlROSzRQbk0yc2Uw?=
 =?utf-8?B?dVNnWDg5b2dIY1F6QUtpeW9xMzduaWxiYllpcmhOdHYzZHZwbTRzSWJyZSsx?=
 =?utf-8?B?ZGJJZUkzZU04V0VpeDFzeGRBWWFPOFFpQk9kc3hjOUdORVZNaEpkaVVuMDZN?=
 =?utf-8?B?RUJ3UnZVN1RPOXc5NHJEZ0JvOFNuSGtPQ0FRdlpWSDJsR2dHVmx3Tlpqamdw?=
 =?utf-8?Q?blLH8K4fkgVmgKDhHThRSuu6J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2736C2860A0D974B8B62525B95DA1814@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f411d2dd-5551-4a59-1f9d-08dda961edbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 03:33:42.1445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyuAZxbGpH784WCtfSejV1lDOKVOcWCNn/iCHzVDkVz/+FMR9fm0y/fvy8Xe+e2LxmDXk9quJWfL373jANlxRQeL82eLgxEB149+Mxc4YXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982

SGkgTWljaGFlbCwNCg0KT24gMTEvMDYvMjUgMTowMSBwbSwgTWljaGFlbCBXYWxsZSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBPbiBNb24gSnVuIDksIDIwMjUgYXQgMTE6MjcgQU0gQ0VTVCwgTWFuaWth
bmRhbi5NIHdyb3RlOg0KPj4+PiBBZGQgbnZtZW0tbGF5b3V0IGluIFFTUEkgdG8gcmVhZCB0aGUg
RVVJNDggTWFjIGFkZHJlc3MgYnkgdGhlDQo+Pj4+IG5ldCBkcml2ZXJzIHVzaW5nIHRoZSBudm1l
bSBwcm9wZXJ0eS5UaGUgb2Zmc2V0IGlzIHNldCB0byAweDANCj4+Pj4gc2luY2UgdGhlIGZhY3Rv
cnkgcHJvZ3JhbW1lZCBhZGRyZXNzIGlzIGF2YWlsYWJsZSBpbiB0aGUNCj4+Pj4gcmVzb3VyY2Ug
bWFuYWdlZCBzcGFjZSBhbmQgdGhlIHNpemUgZGV0ZXJtaW5lIGlmIHRoZSByZXF1ZXN0ZWQNCj4+
Pj4gYWRkcmVzcyBpcyBvZiBFVUk0OCAoMHg2KSBvciBFVUktNjQgKDB4OCkgdHlwZS4NCj4+Pj4g
VGhpcyBpcyB1c2VmdWwgZm9yIGNhc2VzIHdoZXJlIFUtQm9vdCBpcyBza2lwcGVkIGFuZCB0aGUg
RXRoZXJuZXQNCj4+Pj4gTUFDIGFkZHJlc3MgaXMgbmVlZGVkIHRvIGJlIGNvbmZpZ3VyZWQgYnkg
dGhlIGtlcm5lbA0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRo
YXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgICAuLi4v
Ym9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xzb20xLmR0c2kgICAgfCAxMyArKysr
KysrKysrKysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+Pj4+
DQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1h
NWQyN193bHNvbTEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9hdDkxLXNhbWE1
ZDI3X3dsc29tMS5kdHNpDQo+Pj4+IGluZGV4IGIzNGM1MDcyNDI1YS4uYmUwNmRmMWI3ZDY2IDEw
MDY0NA0KPj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQy
N193bHNvbTEuZHRzaQ0KPj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5
MS1zYW1hNWQyN193bHNvbTEuZHRzaQ0KPj4+PiBAQCAtMjEwLDYgKzIxMCw5IEBAICZtYWNiMCB7
DQo+Pj4+ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+Pj4+ICAgICAgICAgcGh5LW1vZGUg
PSAicm1paSI7DQo+Pj4+DQo+Pj4+ICsgICAgIG52bWVtLWNlbGxzID0gPCZtYWNfYWRkcmVzc19l
dWk0OD47DQo+Pj4+ICsgICAgIG52bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJlc3MiOw0KPj4+
PiArDQo+Pj4+ICAgICAgICAgZXRoZXJuZXQtcGh5QDAgew0KPj4+PiAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MD47DQo+Pj4+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZw
aW9BPjsNCj4+Pj4gQEAgLTIzOCw2ICsyNDEsMTYgQEAgcXNwaTFfZmxhc2g6IGZsYXNoQDAgew0K
Pj4+PiAgICAgICAgICAgICAgICAgbTI1cCxmYXN0LXJlYWQ7DQo+Pj4+ICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPj4+Pg0KPj4+PiArICAgICAgICAgICAgIG52bWVtLWxh
eW91dCB7DQo+IA0KPiBJTUhPIHRoaXMgc2hvdWxkIGJlICJzZmRwIHsiLg0KPiANCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtbGF5b3V0IjsNCj4gDQo+IFBs
ZWFzZSByZWFkIG15IGZlZWRiYWNrIG9uIHRoZSBmaXJzdCB2ZXJzaW9uIGFnYWluLi4NCj4gDQo+
IEZvciB0aGUgRFQgbWFpbnRhaW5lcnMuIFRoZSBTRkRQIGlzIGEgc21hbGwgdGFibGUgYmFzZWQg
Y29udGVudCB0aGF0DQo+IHByb3ZpZGUgYmFzaWMgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGZsYXNo
LiBUaGVyZSBhcmUgc3RhbmRhcmQgdGFibGVzDQo+IHdoaWNoIGFyZSBzcGVjaWZpZWQgYnkgdGhl
IEpFREVDIHN0YW5kYXJkIGFuZCB0aGVyZSBhcmUgdmVuZG9yDQo+IHRhYmxlcywgbW9zdCBvZiB0
aGUgdGltZSB3aXRob3V0IHByb3BlciBkb2N1bWVudGF0aW9uIChvciBub25lIGF0DQo+IGFsbCku
DQo+IA0KPiBTb21laG93IHdlIG5lZWQgdG8gc3BlY2lmeSBhdCB3aGF0IHRhYmxlIHdlIHdhbnQg
dG8gbG9vayBhdC4gSSdkDQo+IGxpa2UgdG8gc2VlIGEgYmluZGluZyB3aGljaCBjYW4gcG90ZW50
aWFsbHkgZXhwb3NlIGFueXRoaW5nIGluc2lkZQ0KPiB0aGUgU0ZEUC4NCj4gDQo+IFNvIEkndmUg
c3VnZ2VzdGVkIHRvIHVzZSAiY29tcGF0aWJsZSA9IGplZGVjLHNmZHAtdmVuZG9yLXRhYmxlLU5O
Tk4iDQo+IHdoZXJlIE5OTk4gaXMgdGhlIHRhYmxlIHBhcmFtZXRlciBpZC4gQWRkaXRpb25hbGx5
LCB0aGUgc3RhbmRhcmQgaWRzDQo+IGNvdWxkIGhhdmUgbmFtZXMgbGlrZSAiamVkZWMsc2ZkcC1i
ZnB0IiAoYmFzaWMgZmxhc2ggcGFyYW1ldGVyIHRhYmxlKS4NCj4gDQo+IFNvIGluIHlvdXIgY2Fz
ZSB0aGF0IHdvdWxkIGJlOg0KPiANCj4gZmxhc2ggew0KPiAJc2ZkcCB7DQo+IAkJbWFjX2FkZHJl
c3M6IHRhYmxlLTEgew0KPiAJCQljb21wYXRpYmxlID0gImplZGVjLHNmZHAtaWROTk5OIjsNCj4g
CQl9Ow0KPiAJfTsNCg0KU2hvdWxkIHRoZSBudm1lbS1sYXlvdXQgYmUgaW5jbHVkZWQgYXMgYSBj
aGlsZCBub2RlIHVuZGVyIHNmZHAge30sIG9yIA0Kc2hvdWxkIGl0IGJlIGltcGxlbWVudGVkIGFz
IGEgc2VwYXJhdGUgdmVuZG9yLXNwZWNpZmljIGRyaXZlciB0byBoYW5kbGUgDQp0aGUgY2hhbmdl
cyBpbnRyb2R1Y2VkIGluIHBhdGNoIDEvMyA/DQoNCj4gfTsNCj4gDQo+IEkgZG9uJ3Qga25vdyB3
aGF0IE5OTk4gaXMuIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBhIGR1bXAgb2YgdGhlDQo+IHNm
ZHAgb2YgeW91ciBmbGFzaC4NCg0KUGxlYXNlIGZpbmQgdGhlIGVudGlyZSBTRkRQIGRhdGEgb2Yg
U1NUMjZWRjA2NEJFVUkgZmxhc2ggaW4gVGFibGUgMTEuMSANCm9mIDExLjAgQVBQRU5ESVgNCg0K
aHR0cHM6Ly93dzEubWljcm9jaGlwLmNvbS9kb3dubG9hZHMvYWVtRG9jdW1lbnRzL2RvY3VtZW50
cy9NUEQvUHJvZHVjdERvY3VtZW50cy9EYXRhU2hlZXRzL1NTVDI2VkYwNjRCRVVJLURhdGEtU2hl
ZXQtRFMyMDAwNjEzOC5wZGYNCg0KDQpUaGUgdmVuZG9yIHBhcmFtZXRlciBJRCBpcyAnQkYnIGlm
IEkgYW0gbm90IHdyb25nLg0KPiANCj4gLW1pY2hhZWwNCj4gDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDE+Ow0KPj4+PiArDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBt
YWNfYWRkcmVzc19ldWk0ODogbWFjLWFkZHJlc3NAMCB7DQo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg2PjsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IH07DQo+Pj4NCj4+PiBIb3cgd291bGQgdGhpcyB3b3JrIGlmIGluIHRoZSBmdXR1cmUgdGhlIG1j
aHAgdmVuZG9yIHRhYmxlIGFkZHMgc29tZQ0KPj4+IG90aGVyIGluZm8gdGhhdCBuZWVkcyB0byBi
ZSByZWZlcmVuY2VkIGFzIG52bWVtPyBIb3cgZG8geW91IGRpc3Rpbmd1aXNoDQo+Pj4gdGhlIGlu
Zm8gZnJvbSB0aGUgdGFibGU/DQo+Pj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gaGF2ZSBzb21l
IGtpbmQgb2YgYWRkcmVzcyBhbmQgc2l6ZSB0byByZWZlcmVuY2UNCj4+PiB0aGUgU0ZEUD8NCj4+
DQo+PiBJIHdhcyBwcmV2aW91c2x5IGFkdmlzZWQgbm90IHRvIGhhcmRjb2RlIHRoZSBvZmZzZXQg
aW4gdGhlIERldmljZSBUcmVlDQo+PiBbMV0uIEluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IChwYXRjaCAxLzMpLCB0aGUgcmVhZCBjYWxsYmFjayBmb3INCj4+IHRoZSBNQ0hQIHZlbmRvciB0
YWJsZSBkaXN0aW5ndWlzaGVzIGJldHdlZW4gRVVJLTQ4IGFuZCBFVUktNjQgTUFDDQo+PiBhZGRy
ZXNzZXMgYmFzZWQgb24gdGhlIG52bWVtIHNpemUsIHdoaWNoIGNvcnJlc3BvbmRzIHRvIHRoZSBz
aXplIG9mIHRoZQ0KPj4gcmVzcGVjdGl2ZSBNQUMgYWRkcmVzcy4NCj4+DQo+PiBbMV0gLS0+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvRDg4OUhaRjk3SDhVLjFVVVg1NEJBVkxBQzNAa2Vy
bmVsLm9yZy8NCj4+DQo+Pj4NCj4+Pj4gKyAgICAgICAgICAgICB9Ow0KPj4+PiArDQo+Pj4+ICAg
ICAgICAgICAgICAgICBwYXJ0aXRpb25zIHsNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsNCj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+Pj4NCj4gDQoNCi0tIA0KVGhhbmtzIGFuZCBS
ZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=
