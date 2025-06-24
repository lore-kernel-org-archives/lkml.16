Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C804F19F480;
	Tue, 24 Jun 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756165; cv=fail; b=i7DMgK+PgC5lsydvvsYY0+aZD+6dXuCTObDmK5R7hDwewyDJi3jPEafYqE9dL80ktEroLPEV2+Rwu9oEayxkOvgPGvZQFsLA9oz53S5gBg0CZqOHvnTuF7yfaqstko9Z3lCl/3pZPa5DyulfqTQY0TISAz4ghctT19Siq9NnadY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756165; c=relaxed/simple;
	bh=ZfxtAHOuYUsoYSKtM4Ymuzt6EYXwxwRGH6b5uaqb8is=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h4cLVqFmZ4YbyPd3oXde69hDRZZ6a53UBc9IFTVxDosqAu5LCFlqMT6QztwDPsp9fPOTRaocHxZEIaJ6a/IwUXV49u7gZ2zobU76yxd5nIfmw8EmycOlv1X2dXK9JOrFYKNnFYhsl57WQE97YGElfJpayFM/chpQQZJ+omqvBmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bgUanysd; arc=fail smtp.client-ip=40.107.212.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bgUanysd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2BHRCFDKMwd0m+aoPHrCj4PDAHVHAeakwFvI/dSnSzOcXrjXbd3gq9d0iW35ITjxUf2mpDpFYhnJhNu0BxqgvBsa4AWSsLncmRTw9t/n86TMnkT2yYDkGRijD7xadrkrSAPFGeyA21EhnKspNszNBxFrEE/4+NpYDuz6yOUCGOkegZe5nPwk/1GLQKa3hqif4BEC2UScy+CcCrVMIQijMflr1v1Y8LpM28PXWmnqoLzySaRCmRqbwbt1E8YtaN37cbbSCtQI0voFFR/n7YGMUKUW5ZHUe+avtoHD1VOP1hK1IPH/DiUvi2Fnst7DBPg3JlfE1r/cC2AfwaMfx1epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfxtAHOuYUsoYSKtM4Ymuzt6EYXwxwRGH6b5uaqb8is=;
 b=AVkUwxCidhMLMpgq3Z1kCmJ0V40c8QoHjDAyLMnHhiGsgLkqG5402uzfBuikPdEDQh3hd9ZYWtK/uR50sY062h0q3RSmg6RSVvFHkPjGIQX3oMkfBTIMWuvpBpNe5pyvpa3m9qrtkV3JXbXSB6kk0Yp3TyqmzPPr9cW7WTVhg1RMFpOiy4vU8HOz0iA0fQ6zhspw2SWA24XTSfQK/V0z+EWEyqvVIVToM/eDBJbHw0g3V4mUF8Nrbs2HRC1rXGilvrdiAQg/D+EtAnGnC2p7WpCiV3LJrjbvuQnsdeTk0+NmvOaTFIC+JoEuyJAj1rFuVJIVf1eIU3ecF06DXQJ39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfxtAHOuYUsoYSKtM4Ymuzt6EYXwxwRGH6b5uaqb8is=;
 b=bgUanysd4ePAoIeUJeWDhlL10IV0ec3ui5wJHPEWYjWj35zZS6Pnd3YZOBaLdjRife4CyzRFfk+7nKemMBUxfjfErFUpam6CHHD/HjMJuCit1+Vy3O6HetOSEXvnFiX0l4R52kBcsWyaAdcgYqsDry6KeL9lv1OA2gWHdbdcTXBfOsfqsJgBfYZtzIYn3dOWbuCQ9ACkMoStt+mOi/0lSg9RK2DoGSbwOLQO4xM8QFAdAWr8DaWtkNFpU4IWdTUXE3rKNAdr0rhL6bekSJxfWkoRMYiyhfaokb1kA9u9GUUe14mwxf3DmzHWV0B3O/YUpeG/tlcqMGVqhTGodoo1zw==
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 09:09:20 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::5303:b2dc:d84b:f3b2]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::5303:b2dc:d84b:f3b2%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:09:20 +0000
From: <Varshini.Rajendran@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <Patrice.Vilchez@microchip.com>
Subject: Re: [PATCH] clk: at91: sam9x7: update pll clk ranges
Thread-Topic: [PATCH] clk: at91: sam9x7: update pll clk ranges
Thread-Index: AQHb2eQAPmUgICPA9EaQfapf002i07QR+LkAgAAi1IA=
Date: Tue, 24 Jun 2025 09:09:20 +0000
Message-ID: <0652df01-13e8-4fb8-a2e0-35820d83ac3d@microchip.com>
References: <20250610084503.69749-1-varshini.rajendran@microchip.com>
 <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
In-Reply-To: <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR11MB4719:EE_|SJ1PR11MB6227:EE_
x-ms-office365-filtering-correlation-id: 37e9bfe7-ad9c-42a0-d7f6-08ddb2fece0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SlMzWlk4ZCtLcGlFMklscCtDUDBZenV3dHJXZ3BEV2xxU2p6aW41M1hITGc5?=
 =?utf-8?B?dmlDMzVQdVlDUitnTHpBdThpUkphNS82cWFpZEhZcDVHbzUremh4aExaWVZy?=
 =?utf-8?B?RSthSzFhclZxUmE1OWJYSU8xUkI1OGVwSmVlQkNqNm9XQmNsQUZSbUovMVU5?=
 =?utf-8?B?MXhhSFh5cEtKZWdCa0psTmVvNjFXR1kvN0p2RDNSdEhBME1WMTZtMVNESXNV?=
 =?utf-8?B?d3o0UEFEdjdTUVpIcUxXc0dvZE5HbjFUUTM3UElGRTF1ektTNjhXSGlvN2xJ?=
 =?utf-8?B?eTJyOTlZTlNyMURPWG5BUWRQeTREdVJkUmVkcVNtcklVd1c3QTRoZ3hlaGJY?=
 =?utf-8?B?TVQzYVJaUGozM0hlOUpnZk84TGkrSDQ2UFBHTDNnTng4WnFoSWlHWWNKcjY1?=
 =?utf-8?B?b3lQQkNkZHNEYUxaTkYrNmxIQ2FkdkowbWp2S3Q3N0ZaK3ZoUi9FUXBNMnJS?=
 =?utf-8?B?U3RJQk1pS0czQUVPS3JJVHkzUWR6ZXJzRE1hRTlnV1RIVVg0TE8yd1VteWRn?=
 =?utf-8?B?MGVMVG5SMjBDQXFOb0wzR3NUUVEwWlRWYjFscVh1OS9LdE1wN0JuUFlROU0v?=
 =?utf-8?B?K3FxMlZKSnBmL2pSWEpUbktMa1pJRCsxTFlrT1pPSCszdjBkQmM1RGZwZDVj?=
 =?utf-8?B?WjFsQTZpV3BwSUd3a3ZuQmovbkJJRDBZMzJhUXlSMGc2RW9rME9iMnZUakF5?=
 =?utf-8?B?OW5EYlNlL2c5UjBkZGdXYXlsYmxBai9ZRVYxQ0pNVjg2QThaL2VLclBQeGYv?=
 =?utf-8?B?dnI5cHRWa3NjcTR0UkVxalJ0bUdVTFVRSnVSdHBKUVpZUTlMN0NMOVBvaVdq?=
 =?utf-8?B?YWVCNXJEYWlJQk4xNm1SaUpEeWk5OEVHaC96M2pFZHUya2pya3lVR21ibElB?=
 =?utf-8?B?NXNnbFMweWEySmdMdXdCMlNwR0ZkTEo1bUJPTE5uRE9oWktEK3Vtdk5tMU1i?=
 =?utf-8?B?WnNKWEdsY2lZNGFqUnB3N2JaM0loVnUwbWYwNmpLVmFTWmkvaXo2MVlselhy?=
 =?utf-8?B?RG1lQlM4cTBSc2xYVHkxUlNKQzdtczZiV3hKNHdZWlBFajBPUG1UMXRZMklM?=
 =?utf-8?B?cUxWMHJNeFlmV056QSt0VEQ4dzl5N3VBVmRMUGtnenRSZ1RRZSsxWnJremp6?=
 =?utf-8?B?TC8rSWM4SVh2Y3JXU1podWhkYWY0ajR6bFlYUnZES2xuM2prMFVqaFVJdXc5?=
 =?utf-8?B?YXhSczVLcnNEZXg0ems0a0p1MG9HVElabzZieklXR1lVRmpNTlRia3d6MHk2?=
 =?utf-8?B?bEVzRHVUYzdBRDJIRFNUdU90bHk3MFRjLzV4a21XYzhyTytUaFJoMUNRZzkr?=
 =?utf-8?B?bEZOS1FBQ3A0ZlppZ3dTTnFTUGRLWXphOUZvL2pJWWt1NmtTUVMvOTQ4S0Jw?=
 =?utf-8?B?SDlkdC94VU1pSHhDYkw2by9NZDhPNVpsQjM5Rnc4THVOVkFUZGJjMEttMWRq?=
 =?utf-8?B?UEZ0NGpiSmQySXZFRVd6cGNhVjhjYWFVL2F4RlNVNzRDQy9rUWdVQ1hPQ1hL?=
 =?utf-8?B?Y2UzV204VzNyRFIxVmtDZEhqcWJXendlQklid3l4ZmU4RTdFamNJaXIwR2RB?=
 =?utf-8?B?b2V6NUw2cE54OEZMcWh4SGJsaDZVY0ozQllxTSsxSzdhWGFPVHE5VkVKTXJR?=
 =?utf-8?B?VlFYbUN4V1FrY0JidEVWaGVRSzhRek9QWUJQbnVGZTNMTDhWT2J0SjhYQzdM?=
 =?utf-8?B?MGlydmJzMEd2YXhsZHpaOHdYeGtnSldTaWpXVVpIOU5BamNJUDdFR1h5SkJJ?=
 =?utf-8?B?UG9QWkxSeU9lYVRoTjZEc293eUFiVmQzVnJuUkt6OGJvSlNiZnNqODNOWlhK?=
 =?utf-8?B?OG4rMnc3WEdhYXMzaXdNZFkvenAwZEc3cXgrdWIzQm1YYmViSDZwQzg3S0N4?=
 =?utf-8?B?SFN3R3BYTDQ3b0hoNmt6NWJkV0ltK2ZpZUlUR0lvalhUMGFFWERhZkVWclZ6?=
 =?utf-8?B?Q1EzaEdTeGw5V3lMY1pzaEIzUTlJY0JOR0NUYWlKSzZFNW9GRk14VVZrelYw?=
 =?utf-8?B?OXVtTXVBQ1J3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXF1RjUwWHRjV0xIeFNlcjNPZlVPSlpZYjhLNHNyaVZDK1RrZDRlNHhNVkto?=
 =?utf-8?B?bkpEYWtzRDN0NmFKcU9DSEZQVlN2R3N6N0pFL0hIKzNaaXhqS1NnZmpaT0hJ?=
 =?utf-8?B?Uys5M1N5eWY2OWhURDFnRFBGeWc4UGhYVXBxMklqZGs2MFk3Y3hDSWRxeGVM?=
 =?utf-8?B?RGRmMi9IeXkvOGo5TUlRV1NjWXM0MHAveGRsWEEzWUsrT245M1I0Ymt5S2Ru?=
 =?utf-8?B?S1l1bDA3VURjc1htdDZjcDd1R0NOY3p6QmJUaWR6KzY5VGRhdWc1cVRtUHU3?=
 =?utf-8?B?T3dodXhET2creUxPV0lQMzBBSVhXNlZPZWM1bTRkRlh5bGI0OFNReEdiTk1E?=
 =?utf-8?B?TDZ0SndJN0dBMGVrc2NjMzJKZHE1U1M3YlVWV0hlMkh1MitLYm1GMHBKRGpp?=
 =?utf-8?B?OGNUeEVaL2FqOUpXVmQybW9SU0lVZmJUYUUwRFlSVVdmVWZScEl2OG5ZUUM0?=
 =?utf-8?B?bHFtSHJlYlFKU1REeU4reUE2akcwRHVlUFd0WFdaaFlLYktOMlZxTkVVbDNZ?=
 =?utf-8?B?Tm42cmJlNWVTRnBzK0dxdGlVd2FlT0h5S29MODk3Z05FY0Y4UENZVkZoTy82?=
 =?utf-8?B?M0F3dkhUcFNKQlNxN2YrQXMwZ1pIWlYyYkJxeVdjaDM2WFpocTFpN3llWTA5?=
 =?utf-8?B?cllFRW1rMXRtQzE4aVFJL1c3UlBqZmExb21xc2JwSFFDTC9XM1o0T3FTSEMr?=
 =?utf-8?B?eFRENkxyQ245U0VQOFRWL1gwYkx0Y1dqTWlSczdSMnFRSUlaZWl5dS90YXdU?=
 =?utf-8?B?K0NUSGdtc0NrY0xmOTRzZjY3ZTROVzcvTFNmbFpPUllnOS9TVmR3S24yalV1?=
 =?utf-8?B?dFh1NTdSUDFFOFlOa1JEUU5ZY2ZTdGFuem9ja2ZpalM2RllPVkJvYnU0Znhh?=
 =?utf-8?B?VTlFMmJuNDl1WHV4VGlLSGtHeUFJYm1JcjZRRVJZSlBJRVVzRU9MMDMzSWRZ?=
 =?utf-8?B?ZXVtNDdpc2FRenlVL3pGdjdrWnp2Q2RNcmpka1VGU0c0eGlRNGdKUTh2aktt?=
 =?utf-8?B?amQrYldwRm5RaW45b0xYbWdLNTljRlNMYUZnbERUSytkbzl4RVFRMWhXRy8x?=
 =?utf-8?B?RnBtKzBscUhQMEJ6SXE5d294MDVMamxORGt6ZHhOdkxRV2tNUzlWZVNvcmw2?=
 =?utf-8?B?Z29hQVhpdTdiUXVNc0xjNjJJeG1acW1GVFMwN2prSSszYk5CZUx6eWNqZTh3?=
 =?utf-8?B?allSblIyNkJLV2dXTnRTSWZNNENBemtybkVoS0NGZFJvUitjbTNXT3JRTHNY?=
 =?utf-8?B?K0tiNGhSS1VKdXdlS0VwQkQyVEs2Y2UvWDc3UHhyQWVpN0pSUjViRE1TaGg0?=
 =?utf-8?B?Tkd4M2dMNjF4cnVDQTk5aHVsTm93c3lJMDYwS2RkN3M5dlJNS2pYYUdlU3RV?=
 =?utf-8?B?dGxkV0RxMVBodFIzeWE1b3RYRy92NDhHdWpIYjlqR3JDU3k0OHd2U3I1ZzRq?=
 =?utf-8?B?NmhMK3RHVUhTaUZuUW1LUCt2aVY5TGZqUjE3Z1BSOC9ndCtyU2JmS0Q2YTRT?=
 =?utf-8?B?NC94WHFWWjRYWk1MaUVPVmRQQncvY3R3SmxXNlNwbXM0L0NPWlZhVDJRZm5L?=
 =?utf-8?B?cU1OZW9meHBPbjUvakpoNVRaTy82THFzeUNaRXFLV2syRVZ2N3FRU1ZTRFlh?=
 =?utf-8?B?TVRqRWV0cFptM0tnQS9kYlFqVmhNMGxXR29ITjVEQWtKbmkvQU1PY2dOcWlk?=
 =?utf-8?B?OE1JS0NzTTdSTThhUytYMEdXeEM3eHhjVjVuSU9ua1hmQU5kaVhNOUJEMlZo?=
 =?utf-8?B?Q0dweHRvWE45OFlHanFIN1hsMklzTW9XWWErMDVaM3Z2MTNXRFRPUWUrTEVX?=
 =?utf-8?B?OWwwV3daWGNPU1ZHaVJseEdlcm5ucEIxUU9IYWZ2bjJVZTgrV2RsdVR2Sk9X?=
 =?utf-8?B?T3FEdmJSZXVob0JtTWtRRFNmMjBONmJaakIrRXFZblkveXZ1c3pBMklIMzc0?=
 =?utf-8?B?eDlhVnpRUzBzWXVxM1d2RUVPRytaSDVUaXpvdVRQQVZLZHpOcXhRaFVOSDAz?=
 =?utf-8?B?SmNhbEQ4WTFmRE9KWlBvNjl6ZXo4aDJsL1RQVE5YVzAvbTM0L1F6SlpBT0RL?=
 =?utf-8?B?eCtaWU1IT3d3ZTg1NEsrb2ptVjZXaDc4Vkd0aG5WZWsyRGcrQXZ2VThpWG8z?=
 =?utf-8?B?dWl1VG1pV00vbGcyNzNrTmVNRmsvaTQwRmtuTXVpSThvNDRISWFzL2RCMVk3?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B154F8AB91A454A88E2D1574CB00B69@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e9bfe7-ad9c-42a0-d7f6-08ddb2fece0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:09:20.4829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLcgGic7RsFOSirtsggKW7oNrsbl3WXS4m4WYSRJhjBcRutqocuyq70xi+MAHa+BVcqc+M3brH/dtOXceupVyq4538VICevhBOvVIAG871ch4tXVx6X9qpH7vBVFfXQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227

SGkgQ2xhdWRpdSwNCg0KT24gMjQvMDYvMjUgMTI6MzQgcG0sIENsYXVkaXUgQmV6bmVhIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLCBWYXJzaGlu
aSwNCj4gDQo+IE9uIDEwLjA2LjIwMjUgMTE6NDUsIFZhcnNoaW5pIFJhamVuZHJhbiB3cm90ZToN
Cj4+IFVwZGF0ZSB0aGUgbWluLCBtYXggcmFuZ2VzIG9mIHRoZSBQTEwgY2xvY2tzIGFjY29yZGlu
ZyB0byB0aGUgbGF0ZXN0DQo+PiBkYXRhc2hlZXQgdG8gYmUgY29oZXJlbnQgaW4gdGhlIGRyaXZl
ci4gVGhpcyBwYXRjaCBhcHBhcmVudGx5IHNvbHZlcw0KPj4gaXNzdWVzIGluIG9idGFpbmluZyB0
aGUgcmlnaHQgc2RpbyBmcmVxdWVuY3kuDQo+Pg0KPj4gRml4ZXM6IDMzMDEzYjQzZTI3MSAoImNs
azogYXQ5MTogc2FtOXg3OiBhZGQgc2FtOXg3IHBtYyBkcml2ZXIiKQ0KPj4gU3VnZ2VzdGVkLWJ5
OiBQYXRyaWNlIFZpbGNoZXogPFBhdHJpY2UuVmlsY2hlekBtaWNyb2NoaXAuY29tPg0KPj4gU2ln
bmVkLW9mZi1ieTogVmFyc2hpbmkgUmFqZW5kcmFuIDx2YXJzaGluaS5yYWplbmRyYW5AbWljcm9j
aGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2Nsay9hdDkxL3NhbTl4Ny5jIHwgMjAgKysr
KysrKysrKy0tLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9hdDkxL3Nh
bTl4Ny5jIGIvZHJpdmVycy9jbGsvYXQ5MS9zYW05eDcuYw0KPj4gaW5kZXggY2JiOGIyMjBmMTZi
Li5mZmFiMzJiMDQ3YTAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2Nsay9hdDkxL3NhbTl4Ny5j
DQo+PiArKysgYi9kcml2ZXJzL2Nsay9hdDkxL3NhbTl4Ny5jDQo+PiBAQCAtNjEsNDQgKzYxLDQ0
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX21hc3Rlcl9sYXlvdXQgc2FtOXg3X21hc3Rlcl9s
YXlvdXQgPSB7DQo+Pg0KPj4gICAvKiBGcmFjdGlvbmFsIFBMTCBjb3JlIG91dHB1dCByYW5nZS4g
Ki8NCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcmFuZ2UgcGxsYV9jb3JlX291dHB1dHNb
XSA9IHsNCj4+IC0gICAgIHsgLm1pbiA9IDM3NTAwMDAwMCwgLm1heCA9IDE2MDAwMDAwMDAgfSwN
Cj4+ICsgICAgIHsgLm1pbiA9IDgwMDAwMDAwMCwgLm1heCA9IDE2MDAwMDAwMDAgfSwNCj4+ICAg
fTsNCj4+DQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3JhbmdlIHVwbGxfY29yZV9vdXRw
dXRzW10gPSB7DQo+PiAtICAgICB7IC5taW4gPSA2MDAwMDAwMDAsIC5tYXggPSAxMjAwMDAwMDAw
IH0sDQo+PiArICAgICB7IC5taW4gPSA2MDAwMDAwMDAsIC5tYXggPSA5NjAwMDAwMDAgfSwNCj4+
ICAgfTsNCj4+DQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3JhbmdlIGx2ZHNwbGxfY29y
ZV9vdXRwdXRzW10gPSB7DQo+PiAtICAgICB7IC5taW4gPSA0MDAwMDAwMDAsIC5tYXggPSA4MDAw
MDAwMDAgfSwNCj4+ICsgICAgIHsgLm1pbiA9IDYwMDAwMDAwMCwgLm1heCA9IDEyMDAwMDAwMDAg
fSwNCj4+ICAgfTsNCj4+DQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3JhbmdlIGF1ZGlv
cGxsX2NvcmVfb3V0cHV0c1tdID0gew0KPj4gLSAgICAgeyAubWluID0gNDAwMDAwMDAwLCAubWF4
ID0gODAwMDAwMDAwIH0sDQo+PiArICAgICB7IC5taW4gPSA2MDAwMDAwMDAsIC5tYXggPSAxMjAw
MDAwMDAwIH0sDQo+PiAgIH07DQo+Pg0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19yYW5n
ZSBwbGxhZGl2Ml9jb3JlX291dHB1dHNbXSA9IHsNCj4+IC0gICAgIHsgLm1pbiA9IDM3NTAwMDAw
MCwgLm1heCA9IDE2MDAwMDAwMDAgfSwNCj4+ICsgICAgIHsgLm1pbiA9IDgwMDAwMDAwMCwgLm1h
eCA9IDE2MDAwMDAwMDAgfSwNCj4+ICAgfTsNCj4+DQo+PiAgIC8qIEZyYWN0aW9uYWwgUExMIG91
dHB1dCByYW5nZS4gKi8NCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcmFuZ2UgcGxsYV9v
dXRwdXRzW10gPSB7DQo+PiAtICAgICB7IC5taW4gPSA3MzI0MjEsIC5tYXggPSA4MDAwMDAwMDAg
fSwNCj4+ICsgICAgIHsgLm1pbiA9IDQwMDAwMDAwMCwgLm1heCA9IDgwMDAwMDAwMCB9LA0KPj4g
ICB9Ow0KPj4NCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcmFuZ2UgdXBsbF9vdXRwdXRz
W10gPSB7DQo+PiAtICAgICB7IC5taW4gPSAzMDAwMDAwMDAsIC5tYXggPSA2MDAwMDAwMDAgfSwN
Cj4+ICsgICAgIHsgLm1pbiA9IDMwMDAwMDAwMCwgLm1heCA9IDQ4MDAwMDAwMCB9LA0KPj4gICB9
Ow0KPj4NCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcmFuZ2UgbHZkc3BsbF9vdXRwdXRz
W10gPSB7DQo+PiAtICAgICB7IC5taW4gPSAxMDAwMDAwMCwgLm1heCA9IDgwMDAwMDAwMCB9LA0K
Pj4gKyAgICAgeyAubWluID0gMTc1MDAwMDAwLCAubWF4ID0gNTUwMDAwMDAwIH0sDQo+PiAgIH07
DQo+Pg0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19yYW5nZSBhdWRpb3BsbF9vdXRwdXRz
W10gPSB7DQo+PiAtICAgICB7IC5taW4gPSAxMDAwMDAwMCwgLm1heCA9IDgwMDAwMDAwMCB9LA0K
Pj4gKyAgICAgeyAubWluID0gMCwgLm1heCA9IDMwMDAwMDAwMCB9LA0KPiANCj4gSXMgdGhpcyBt
aW4gdmFsdWUgc29tZXRoaW5nIHZhbGlkPw0KDQpZZXMuIFRoaXMgaXMgYSB2YWxpZCB2YWx1ZSBt
ZW50aW9uZWQgaW4gdGhlIGRhdGFzaGVldC4gVGhpcyBpcyB0aGUgcmFuZ2UgDQp0aGF0IGZpeGVz
IHRoZSBpc3N1ZSBvZiBub3QgYmVpbmcgYWJsZSB0byBzZXQgbG93IGZyZXF1ZW5jeSB2YWx1ZXMg
Zm9yIA0KdGhlIFNESU8gaW50ZXJmYWNlIGZvciBpbnN0YW5jZS4NCj4gDQo+IFRoYW5rIHlvdSwN
Cj4gQ2xhdWRpdQ0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNClZhcnNoaW5pIFJhamVuZHJh
bi4NCg==
