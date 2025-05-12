Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2462980B9;
	Mon, 12 May 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747078708; cv=fail; b=JjLEa6hrVc4uXQB0sZQcA1F8SHz3stMPFfk2pGCur28IL3hIKY2GvqCvLV1Er66Qnoeqd2EO+F+HwmBCKSJraPWm7NwIDTD12BO5dTAPQGcRVriA487GKTD6ha/614viSQYJx5MJOrm/W3vEQYFfloqhcnvAmLMzbJFqQognECE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747078708; c=relaxed/simple;
	bh=KH+Lni9am8yG4MdZG5pioAZf/QCO/gOvgS8J7FAVgio=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U5JUrD/N1vwf2/qAKKbaXFGhfUVYi+yiUPYGwGmxixk0MrVz6cel04NESaoVZNLRRU9Y9zDX1UuvhpOW1xgrx+d8zCK9d+MYCRIHNclgAc+AZtlKPJWT2tKQ2w3DE9yinFKZmfKKaFDLilCn3wOCnQX3ntR8DeYveOPLznQpY70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=rdYoBeur; arc=fail smtp.client-ip=40.107.101.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rdYoBeur"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjVoWLGnWAORhosym0jOm86S0xxu8UNsEiUnCg3ECVoPpbfZJymfE7LjUteHz8mS9DFeFj1pkyzBW0+jrco4L1UtbrWQOppBSIjV6SztipAVgPFzvOdb1UTaBd2ge8zSIt5KyjNbnJmANg1c0xDMmwAbTkT5B2YxPyMabZcZiz2ZK39Z2qoM/5MK+ikmUn2inFaF7Qka4tDsIjeUyO+wMelbdIyIvr/u6CLy48AsvTUqzr2zWvYxPo5E67qsK1ZKpsg1mvGnD9WjVpaNexQ1ck1aJl44m8/VD9tNRnSjzuVyBYycrL6HIFPx80o8+0ZHhMiEqR7TIEIfQy7JW8iVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH+Lni9am8yG4MdZG5pioAZf/QCO/gOvgS8J7FAVgio=;
 b=dbsBosS1Xxl91mXasabGRO9uutdDzGuEEpFSv+ZA3r5tjfqrIhuZsDIznUzeG9aEVJ5s/C+sD4lHCxJVlk/wk5p/lnurW70brT7ZWQM2F/jGrrryptvjxy62Dy/8sTMaPImRrrqVqfQdufDAAMoX3DA+6tao+W8YOosiX4jdGM60wLOrmX4Z+45bFkS3LO2cnDlfv/jLQRqKOyc6juYgEKFRKh+BobfCnwP/94kYyZoL2E6qvm1XQPt1LT76r55tmW+C8pAw0G7K9+v+xuMihnItY19z4TiHonMODpC+QUz+S7CuKpzhLDOGfGIaYobNvTcwuI9xlxhxdWucCWUvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH+Lni9am8yG4MdZG5pioAZf/QCO/gOvgS8J7FAVgio=;
 b=rdYoBeur+iy5TdyBftlBnoP9XV8JdEQFC+I1MkjG9dA/FQIpjr80MCxn74MYoHq/it9jVpjzyamixD8+oyxCcr/K3QQHdbR9a9q1U4jVk0cEOJ1SApTeYb+YAf2zjytquN2augHHYTomCxoteIgj0ZBm8aVU7AhvmF9FvtZtMXx9fnES6+murOxXEgdyT0RN+WPzK/t61CLzkhsUJD/UPsfJeuTR5SybJEKXml3c4WnWi5XDuP5KMIcmTrXUNKQ5Zm6ad8CD7kjmm1pwcd1uqmAXPmIDhNHgdUfgZ8sROy3EVpf6Ofy6VZwX0rhsivbRYyrTF1XMENFTyMxss3UvYQ==
Received: from CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7)
 by DS7PR11MB6101.namprd11.prod.outlook.com (2603:10b6:8:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Mon, 12 May
 2025 19:38:21 +0000
Received: from CY8PR11MB7034.namprd11.prod.outlook.com
 ([fe80::b284:ae0b:19ad:6b8a]) by CY8PR11MB7034.namprd11.prod.outlook.com
 ([fe80::b284:ae0b:19ad:6b8a%6]) with mapi id 15.20.8699.024; Mon, 12 May 2025
 19:38:21 +0000
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
Thread-Topic: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
Thread-Index: AQHbvsIzG2QBwYkUNkCezo/UcDAowLPPG/0AgABRUwA=
Date: Mon, 12 May 2025 19:38:20 +0000
Message-ID: <df84e472-958a-4b68-8932-af7a0e476338@microchip.com>
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
 <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
 <bcf3089b-04d3-40ad-8673-db0e727fa72e@tuxon.dev>
In-Reply-To: <bcf3089b-04d3-40ad-8673-db0e727fa72e@tuxon.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7034:EE_|DS7PR11MB6101:EE_
x-ms-office365-filtering-correlation-id: 1d9db56e-8ab5-48c4-4cd4-08dd918c8d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?STAzQ1huSXJTdjFEV09oWjF3dzc1ZmFlSE1UbWEwZTdnWW9kNHlrL2l2aU1T?=
 =?utf-8?B?ZG5yT21tMWFkWi93UnlNb1ZEQ2ZoV2lMSnJ4R1IzcnByaXBWbmhPMER0cGVn?=
 =?utf-8?B?OXU5RnZ2c0JlTWhKU3I0MER0Q2NRb3Mvd3VkZGJlNGo0TlJtY2dyS3VTYVYr?=
 =?utf-8?B?V2cxbGRvUjFTNW5ybUdzNUpUYTdsOWEwdno2YjBrclFGN3h0YWlaS2NvUFFH?=
 =?utf-8?B?WWZwcndCWm1CeU1hYkdCczlKZXBTNDIrRHhPRDhlYTNscDBNbTJrVlNNbUU3?=
 =?utf-8?B?d1NEOThUNDBUSTBZV2M0SVQvYlRCVXhYeVBKcDBrakV2MitVYlR6aXNCNGY2?=
 =?utf-8?B?TFBiK1d5clFqdWx1WktLSmJqU2RLK1oxd3IydDFrc0g3NUZNK0FMVklibXVT?=
 =?utf-8?B?RWY3Nk9vYnFIUHdMNG9GTHdockp0ZG1adlphRmNOME9WRVhOdGY1am54c0ts?=
 =?utf-8?B?cW5CUGswQTc5SlhjTXZ4SEZ2eE4xRVdMekdkYVQ5eUE4aFNoc0RtR3hLUWg1?=
 =?utf-8?B?d3AwMWRJb0xjbzZIbUNqUFR3c0tKdExTRmo2eVBXeDk3WXFleng2QkVSeGsy?=
 =?utf-8?B?UThDOWZJTkNlUmd5VzBJSGN6SGpRbjhSNjc2cEdFMG5HTStQdmZTQ0UzT2hL?=
 =?utf-8?B?UkxEZHZReVpwUHVzMVZ4MVV6VXB4UG04aVV1ZDVjWWVsaXhjTUp5THVSQkVM?=
 =?utf-8?B?UStacHVsTG51ZUNUcXNHTlR2SVc1VWNMOVZhN0t1NmowREcrbGxya0Jtam5D?=
 =?utf-8?B?dGtJSHR1QUNmS1daemR2Mit6RFhuU2EzWkkyUXhOOHBmcm42bU5jbUM1cW0w?=
 =?utf-8?B?dzdMbXNHdWNkYzRiUU1HSTNOZFV4TjBXeWZDSDlGWkdlYzNBZ1Ivc21vc2ZK?=
 =?utf-8?B?QXZBMzU1Zi9qUUdnRVEyMEFnVmY4bUkrbXk5YUJhWng1ZmEvbHc5V09DK1l6?=
 =?utf-8?B?V1JZUU9WeU9XUjdOYlJINmF5QSsxaHlBVkhMdklDdWdZWTErUndsdThBRTRq?=
 =?utf-8?B?YmhZWjJrQmhKOXZacXBHOG13WE9sZ1FPaXRpRUZ4MnNGdHFUTlh5M3I5djlj?=
 =?utf-8?B?Vm1jVnVuVnhNaVV6SFVvaFlycW5ITThhTVRqRmk4RldNNVhsYlIzVEgvWjlj?=
 =?utf-8?B?OHdQNjdJL25qVm5jR1BudnpPQXhmWmRlUDBKWTJaN1VsSHBkU0tpWElBWktj?=
 =?utf-8?B?VHJGQkkyNlFBcW9rYkRFaDkxeWloUGZJUkdlL3FxRGx1ZDZvRXczbFRVWFhi?=
 =?utf-8?B?QW95TGNjNHFETUpJSjRONFdXNzR6UHl1SjJoSnN1bS8reG9RNmVSSVFHQnJE?=
 =?utf-8?B?anM3WkdVNTZId3ZVTmhkSUNLQ1lOY29KTWZUMVByK01jVXVCbnBLMkIvdFRo?=
 =?utf-8?B?dE5uQmptZ3JoWkdGMlQ1NnNqTEZjSnpmUW9yZG5SVVBzdmk0Unlkc2FUUUlr?=
 =?utf-8?B?ZitsWTh1R3ZpU3ZGNHdTak0zWmJxem5XM1YvVDZsRjNVNFlCa2RSZEJXWWFS?=
 =?utf-8?B?bjRBNDl6ZEFBUDZ5YXBJOWkxbDAwYXNSbjJqRmtrbko2YkthbHV1Y0h6dWpm?=
 =?utf-8?B?ZVJYQU9EbUdiNTdOc3g3K3RiYjJydllxSm40Y3FmM1pMb0FHcEQ5a1U4bG1K?=
 =?utf-8?B?K09pNkgzaG96SzdtTEFETlJOemZQZHVSWVUzbTJsWjZJL2I0bGFxeGgrYVl2?=
 =?utf-8?B?TzBXc1lUUWlEZlRjbWFJazA0OTJzNXNCbi9UamNldkZYZG9DY09jb0RrbHIy?=
 =?utf-8?B?aGlVQXpVOVdKR1c0NUdIUEZRWGs4SEVzWFM2TmFVWU1iaXIyaDYwREN0Q2pp?=
 =?utf-8?B?T29HaFFPS1NFNWRVekt0ODJDTDdkVUhGdnVpUUFpWmxPT0FNTlpLQzdvYVpE?=
 =?utf-8?B?YUxSWUN5VGhsdys3TEZkeDljR2FqcnEzQnBlR21NTmhWakZmazBiWnV3S3Bv?=
 =?utf-8?B?dUtRTWhoak1MMmZleWQ2dVV6clJMWkJTVFpCM0RpL2NDaEFXSmQra29TNHhw?=
 =?utf-8?Q?x3Fwuh6YfTaUz5DPikc0cp0gzkjyIw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7034.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUxqRnh0cnNaRUMvV1NqSEdQRU8rSHB4SEwxMXZwMTFiWnpmUzl1dUVSR1FP?=
 =?utf-8?B?TmhIQzQwM1NVQnljRGpiL2tRalpVc1BTM0VxVVRDVU9MemRZMFBSdHhPeVNH?=
 =?utf-8?B?SHdibVl5NVMrTVFLNVd4NStrOXhqWmJneTNTZGorRzN3YWRIQld6VUJVLzBB?=
 =?utf-8?B?MTBxU2JzUFVvcFJRQm1QTitEQ3FZbVZWc0JpbUg4NHgySGxCVm81SGxXRlJG?=
 =?utf-8?B?bGVEcERvaG9kVi9PRzc0Z1BKcVlzb05LTklySXNES3hsYnpJR1ErUzdRaEo3?=
 =?utf-8?B?QnBid1BER1pFRmJYd1p5bGtoNHlkNC9RSTR4NXk4alJkNElTWTlsTWg5ZWFw?=
 =?utf-8?B?MXN6RGhJNlVWK3BNcFdJQityNWVMMllDQkRsc1oxNVJ6S1NTN0FMNCt4V0V3?=
 =?utf-8?B?N3JsNDRONXBWZGlhL1l0TWc3ZDRMcDl0ME9TbXN3TkR5NldBOHJPVEJTUzFv?=
 =?utf-8?B?T21VdXpqeXJVSitYd3h6b00yRHl5cnJKWnVkNUxHZWZaREYwK2pOZmY2bTBD?=
 =?utf-8?B?Z1JLZnFBTnAzdU5GclhpcyswZ1pvekd2M3dmU0ptMllmSlhZVkRmZXpqeVFB?=
 =?utf-8?B?UmNxcXhzOFArSUxRU2Rpb0dmNElNMTQ1UjRBdG84emg1MWV0WUhxaE9VdXZU?=
 =?utf-8?B?NTRyZWlOVC95a0NHeVlIbzRwOHZjck5seUxLOXNOK2w0UnAxRFAzWFN6ZXlD?=
 =?utf-8?B?ejFBVVMxZkVERW1wSGtYTS9VVU8xeFBLRU5CZlA1akNBTDJVQUc1aWFwMEwx?=
 =?utf-8?B?SXhNc3paTzh0aDNPYnRUZ3V2V1JpZWZ4M3E2bk9LcFNNd0MyYTNLbDdXc2Zs?=
 =?utf-8?B?TVRqNUx4cFAySmlRaisrUjM3dE9ISnF0NXQwNDJaMGlmazhkc2Z1Wmlld3NL?=
 =?utf-8?B?SGduVUtmNXJ4Smh5MkZIVXB2eVQ0NEVBdk45dlZuMXlNR0owaWxLM2dVVW1O?=
 =?utf-8?B?TnVzWkQ4QnhWdDRFUEtpQVlac3R4MTc0R1czdDU0bGF6WDBuUVNjeEg0MkNr?=
 =?utf-8?B?ejZ3VWYxVzRkYW1GcExWVVFnVW44NUx4akE2bFFrV2lvNHBkV0dzdzJOWHpn?=
 =?utf-8?B?ZVEzcnEyNDBUaXpJTStBMWhkdGpSamlKTDdkOTl6R1oyY3J1RmJ0ajJ2RVVI?=
 =?utf-8?B?VUNUZ3dUWnhMWUpScFU2Wk8yL2hDVVp3Ly9pekNXUFFnWHBpdnh2LzI4b3Fv?=
 =?utf-8?B?RmJjOGh5WkUvOUt0Q3Y4NTlteHErcFFKcUNMTVk2MUZuOFdaemkxS0c1Ym8x?=
 =?utf-8?B?YUhyVGdIMUR0VFZsd0Z6UlJmUkFXL3ZjcUR6c2ZHZkhnWlB3b0U0QmllaG1B?=
 =?utf-8?B?NzhKZUsrSjJLcVd0R1FRNFhLczNYVzY2NG5jMEhCMUUwWk55R1kxY2thZldx?=
 =?utf-8?B?R1c1TGNQUWNRVnRYR3E1YkFCV0ZpR2Q2WjZGSWhTVlpVaG1KU2VVNm15dzlG?=
 =?utf-8?B?SjJ0NVRadXN1U0YzeXFJUWFJN21OMitOMnVveXlkYnBIWjZHa1pFTEt6WWhs?=
 =?utf-8?B?aHRoU2xBM004cGtmd3dhL1J4K1BVL3pQY3FPZlVZbVJXYy9nRVZaYUFRbXNl?=
 =?utf-8?B?SzlWaDRVNTQ1MDRBZUlDNUdDUjRENnZ0Tll3QUFuK2NtQnlkVEIxQlk1M0xM?=
 =?utf-8?B?bzFnUDU3aGxMRE1IbUN2dUpFNUlOSXd0SjJ4RmVhclNFOGVSTC9DTjZRcDR6?=
 =?utf-8?B?MWpabGNQWDRXQklaclZQdFNiajdCNHZPUG9TbFhZU2FoS3c2TDdXSTdSV01O?=
 =?utf-8?B?cE5JaGVKMVEvZjRBc29HZGp0TFJjbEd3SXd5N1E1emdSNnQ3QUl1R3lEd3Vv?=
 =?utf-8?B?VklicXMwd0tLdlFGdVo0bmtQc2kxWFg1b1dwOE1XeVhTdGRENk5DS0hZTFN3?=
 =?utf-8?B?MFljUWdxTmp1d29iMTFRTVlHUzdycTRocldjbHlDRWliOC9ta3RmRTJ4ZG1S?=
 =?utf-8?B?S3RRN1NtQzY4VkFkTXpRUmhpbmVESFg0cWNoMytDemIydzRGVzZXaWU0TkZm?=
 =?utf-8?B?bmQwdHF0WkRoM3NiczlLUG5HajlyeXNJYXJPTitkeG5ZWUpUMzdNUjZ5WnJE?=
 =?utf-8?B?MGJwY3JFaTJNemVoWnNlNkRQWVNqUDFIS2xFZkhzU1pXTG5CYlIzWFcydEhM?=
 =?utf-8?Q?gKwwuTzNk6oTa6QBh2BFzyNSX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <475C98CEB7D55F4E96A62240838D5012@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9db56e-8ab5-48c4-4cd4-08dd918c8d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 19:38:20.9545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8glAIN9KTC6E8/MEReXxXie8zC9l3yuepiNAU7F4Q2MJq9CvqdKLsNinHIiwX0mBzvXy7wpdTBcilvK+jPSm560dD8mve2Y5RDuf8w6bLFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6101

SGkgQ2xhdWRpdSwNCg0KT24gNS8xMi8yNSAwNzo0NywgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGksIFJ5YW4sDQo+IA0K
PiBPbiAwNi4wNS4yMDI1IDIzOjA0LCBSeWFuLldhbm5lckBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
Pj4gRnJvbTogUnlhbiBXYW5uZXIgPFJ5YW4uV2FubmVyQG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4g
VGhlIG1haW5feHRhbCBjbGtfaHcgc3RydWN0IGlzIG5vdCBwYXNzZWQgaW50byBwYXJlbnRfZGF0
YS5odyBjYXVzaW5nDQo+PiB0aGUgbWFpbl9vc2MgdG8gbm90IGhhdmUgYSBwYXJlbnQgY2F1c2lu
ZyBhIGNvcnJ1cHRlZCBjbG9jayB0cmVlLg0KPj4gUGFzc2luZyB0aGUgbWFpbl94dGFsIHN0cnVj
dCBpbnRvIHRoZSBwYXJlbnRfZGF0YSBzdHJ1Y3Qgd2lsbA0KPj4gZW5zdXJlIHRoZSBjb3JyZWN0
IHBhcmVudCBzdHJ1Y3R1cmUgZm9yIG1haW5fb3NjIGFuZCBhIGNvcnJlY3QgY2xvY2sNCj4+IHRy
ZWUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUnlhbiBXYW5uZXIgPFJ5YW4uV2FubmVyQG1pY3Jv
Y2hpcC5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2Nsay9hdDkxL3NhbWE3ZDY1LmMgfCAzICsr
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvYXQ5MS9zYW1hN2Q2NS5jIGIvZHJpdmVycy9j
bGsvYXQ5MS9zYW1hN2Q2NS5jDQo+PiBpbmRleCBhNWQ0MGRmOGIyZjIuLjFlOWQzYzM5Mzg4MyAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvY2xrL2F0OTEvc2FtYTdkNjUuYw0KPj4gKysrIGIvZHJp
dmVycy9jbGsvYXQ5MS9zYW1hN2Q2NS5jDQo+PiBAQCAtMTEwMCw3ICsxMTAwLDcgQEAgc3RhdGlj
IHZvaWQgX19pbml0IHNhbWE3ZDY1X3BtY19zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0K
Pj4gICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPj4gICAgICAgc3RydWN0IGNsa19odyAq
aHcsICptYWluX3JjX2h3LCAqbWFpbl9vc2NfaHcsICptYWluX3h0YWxfaHc7DQo+PiAgICAgICBz
dHJ1Y3QgY2xrX2h3ICp0ZF9zbGNrX2h3LCAqbWRfc2xja19odzsNCj4+IC0gICAgIHN0YXRpYyBz
dHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHBhcmVudF9kYXRhOw0KPj4gKyAgICAgc3RhdGljIHN0cnVj
dCBjbGtfcGFyZW50X2RhdGEgcGFyZW50X2RhdGEgPSB7MH07DQo+PiAgICAgICBzdHJ1Y3QgY2xr
X2h3ICpwYXJlbnRfaHdzWzEwXTsNCj4+ICAgICAgIGJvb2wgYnlwYXNzOw0KPj4gICAgICAgaW50
IGksIGo7DQo+PiBAQCAtMTEzOCw2ICsxMTM4LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNhbWE3
ZDY1X3BtY19zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPj4NCj4+ICAgICAgIHBhcmVu
dF9kYXRhLm5hbWUgPSBtYWluX3h0YWxfbmFtZTsNCj4+ICAgICAgIHBhcmVudF9kYXRhLmZ3X25h
bWUgPSBtYWluX3h0YWxfbmFtZTsNCj4+ICsgICAgIHBhcmVudF9kYXRhLmh3ID0gbWFpbl94dGFs
X2h3Ow0KPiANCj4gSXMgdGhpcyBsaW5lIHN0aWxsIG5lZWRlZCB3aXRoIHRoZSBpbml0aWFsaXph
dGlvbiBvZiBwYXJlbnQgZGF0YSBhYm92ZToNCg0KWWVzIGl0IGlzIHN0aWxsIG5lZWRlZCBiZWNh
dXNlIHRoZSBjbGtfaHcgc3RydWN0IHN0aWxsIG5lZWRzIHRvIGJlDQpwYXNzZWQgaW50byB0aGUg
cGFyZW50X2RhdGEgc3RydWN0LiBJZiBub3QgdGhlIHdyb25nIHBhcmVudCB3aWxsIGJlIHNldC4N
Cj4gDQo+ICAgICAgICAgc3RhdGljIHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgcGFyZW50X2RhdGEg
PSB7MH07DQo+IA0KPj4gICAgICAgbWFpbl9vc2NfaHcgPSBhdDkxX2Nsa19yZWdpc3Rlcl9tYWlu
X29zYyhyZWdtYXAsICJtYWluX29zYyIsIE5VTEwsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZwYXJlbnRfZGF0YSwgYnlwYXNzKTsNCj4+ICAgICAg
IGlmIChJU19FUlIobWFpbl9vc2NfaHcpKQ0KPiANCg0K
