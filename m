Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A820298D;
	Tue, 15 Apr 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731747; cv=fail; b=jjVqwCsTVAGw2DuwTVLvw2G8AKFEqM1ExtNNxaW2cTj8CpfdytsjYcu/bvpCae8Fy177OQ2gp7/FnKcltSaaxZmXbMdqR6lsSUoSowsBixX2oYo6GKw9yuQSRdaMm9obVTZeRQ3q8GR00bG7pG3wG0Nidobh114xyOty2smVyUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731747; c=relaxed/simple;
	bh=HZS2T6sHruQun6NUM1mO3/iBGa10dxTyPRqcWMU/VA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kjis46t6OIHbt9En27hkG0eTSh4w+tyVMczTocIwTPOSkWJFMKcKzK7XbFonvCmTF7kK6lqsfd0FYUhMW7e70dcX4tciHHmGGZ60HoXtXQCuRWB3b8FZir57S2MKoX3rb6g0qzN2biljVhHWuH3terR1URHr4BxpLGNKk1kG72M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=rnIz+RMm; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="rnIz+RMm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW3HE5WILOxo9vHSyi/+Sj+Hyjprvtot97SYZ1m9+b8xb0anEm+1jO6rP3cphuA3ESSwNrKat/6AN/nW9fGWxBpFzCF1IdGGJss+DgucZWPMMF2lrtu6YU9+/IJ+D8k1ryYqfXiHAOv60H3IJu0+AICb4rjWvCtnkSHJEhr3MxdVBcS6vvNKHlMMfGpnA2BOh/0HW+XJbhiKoKZ3rTYtzs3wNZqRcFgP+BdNMfGhpJ7LkqmSxyTFyYfx12bl/lto1CRpHxfmZIJ2TNjYoD89yHBICegMtHVM3CdLaX3XBWLiNYtsIxN9SLW79oMTkj/fRqdoZgcnhlZkhRisacPTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZS2T6sHruQun6NUM1mO3/iBGa10dxTyPRqcWMU/VA4=;
 b=nlnBaq4oP3OqDmuaig2V34o61vKwbDoJoMDEsGICb5n1YEnBpSLru7eNcgPfD+8Fbz5pMnJXS5BAtTg342JP+ePdD7StYLywR1JVh336K3m8dg7naN1uRU5vpUjD1Lh+ATT153qyszN88yxZoGypUrS2jBV8CJm/rCvIylVM+RRYDATVI9sJeZ8ksVljLb40gjgw0WC53mH1qUHBQnhvPZ470Cg1OaFLfRE5QRQTPHAK1wYAOMbZxVvtVW8ZDjmj2LvoOkJ+aEgI2b9uhHXoZHDTUxudnl65738RHLXx7qhicl3vIpLmNSZhYI4bwwBKrB0PSAGbqfZ95PKPlEeYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZS2T6sHruQun6NUM1mO3/iBGa10dxTyPRqcWMU/VA4=;
 b=rnIz+RMm4kp07nGgibhY+oPrr6KGwCvZTr0uaXNrGbI5gA2LBpgaxKxZvgtLA8V14YtqyosF9eFgbviVZzQtlEUrIgVuASzNI9wIwsE/Nv7V1WQeIpRIEgdKJhDyZ7NmkILxGvhI8+iUSx9C3omoqDhBZ1dqZNvNj/2+JdJdY/w=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by PA4PR06MB8475.eurprd06.prod.outlook.com (2603:10a6:102:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 15:42:22 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:42:22 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Shawn Guo <shawnguo2@yeah.net>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>, "stefan.klug@ideasonboard.com"
	<stefan.klug@ideasonboard.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Thread-Topic: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Thread-Index: AQHbGL8KifipXUsSOk2/fobsQXRO0bOkOinfgAHOTQA=
Date: Tue, 15 Apr 2025 15:42:22 +0000
Message-ID: <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
In-Reply-To: <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|PA4PR06MB8475:EE_
x-ms-office365-filtering-correlation-id: 48ee6b40-d690-4576-b69e-08dd7c341d0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHpoVTRSZWU3OGN6aEpKZGliWGMydHZLZjA3bVQzc0pKd2pvbnJsdHRFR0FP?=
 =?utf-8?B?cnR4bCtPOFhrczkzNUxpeVphSDhXd1EwRFYzTDllRmdhU1hydFlOMjJmSnUz?=
 =?utf-8?B?UkRvd0JXVzdtbC9zT3hGbUJtOUgzTTZPSDFlNzRNaUhOdmxLMm9mMm9veldD?=
 =?utf-8?B?dC9YMXZBcW5aMDF5Mjh0djVmN2VBL1hKQzE1akpTZlkvNVFxbk1vR21OOHhv?=
 =?utf-8?B?K0o2WlJpaDlITUpGSHJWQ3RWNktKNFVUMWxMMTlDWFRqbDhpZ1JLNERIaElK?=
 =?utf-8?B?VVJhU2ZNa0FFM1BDSStLN251ZXc3bVl2S3p6MkVLeklacklSYkhhYnZXZExv?=
 =?utf-8?B?WTNtNWxWSHRJRnZ2eGdMZ0dEc0tBNjhRdmhVNDBpRGdnd05vM1I2R0pSWDV2?=
 =?utf-8?B?WlJvUmFsdG1hTGtKeTUvYzNacnZTdjhHcmVocC9VM3VwNkFJK3ZkZHhNL2lY?=
 =?utf-8?B?RnQxeFFqSUtzMW1tNXA5MmdFSGg1NHU2dmcwOUFRRUdDUDNUNmhBZjJxcmx5?=
 =?utf-8?B?ejBLcytLOHpDbnBoa3FSZGlLeS9OMzVPUnZnZGNURTdQdUJhOW8vZHlXZjI5?=
 =?utf-8?B?N2FNVGJyK3RpMHpyTy8zWjhqN2ZXUktXbjNDZDd1L1pESUNERTNBWG1lRkt0?=
 =?utf-8?B?a2JqUGdlY1I3WW9SWHBaMUlaZy9CQTN6NkJCa0Nub2dDYTAySnpGaG4ycWV3?=
 =?utf-8?B?cWJmRFhCS0xUOW9nSWcwTXN4ZzVsY3pLSWJJUWNLRGpRTkNYRWxLT2NZTFc4?=
 =?utf-8?B?c2ZGMmFYMWFJaitSc2ppdUJ3LzZWaXhHUmFCRzF1SDdnaGFpWnhtQURzUmMx?=
 =?utf-8?B?VEw1Z1ZNQ0QwTmppQlgzelNmMjE1UmtnYmE1MkV0TksxS1VhM0I5dDV1bEhr?=
 =?utf-8?B?SE1YZm1pSUxhRVNIVTdKNHcvblc3MlVNVkhOVjgrMTFSbzUyWEg5RFlLaW96?=
 =?utf-8?B?V21tWW9uNVBCNXVCV01VU25kaVVLOFFmVmoreVpDZHhKRmVRNysxZHR3WUlj?=
 =?utf-8?B?ZlJpYnZiQUhIT0VDUVZwQWNMVUlHVTFPSUFGSGhuMkZJOWxFdnRhWXVCam9M?=
 =?utf-8?B?ekpMOWZ6OGpWTmJ1QVRKRVgySzF1YnE0TldlU3Q3YlpKZFVYS0g4bko5Tzc0?=
 =?utf-8?B?NVRoOHFmVy9mbFh2T0poVDFBUkh1WFdSazlFem5VUlhQaUU2bzZ4anlXTUJL?=
 =?utf-8?B?M3p4bmVOZTB1OFNGK2xEZDRHKzVQQlpHR3pkOTltREdNVmxMbGczaDE3Z3Yr?=
 =?utf-8?B?WkpXbVI0dXNzYzFuVjBPYm85SmhjSHV0M3hKZlg0RzcwbnFmc29CMjBnbXBU?=
 =?utf-8?B?WERGM0UyQkxNcVFrU0EyU2pLTTlpeGdZWGsrQno4elRqSmE3RmErbE9BaHpQ?=
 =?utf-8?B?SUgySW4vRXpMYllBRHM3VS9lYi9heVRmQjZ1aGhiMWxsdWEwMzMwZURhYmd5?=
 =?utf-8?B?eTlnelNtOHd3N1FZT2lUajA1c0JUQkxvRUdTQW90S2N1ZVV0cFJwUVJlNWI1?=
 =?utf-8?B?bE1QRHlURmVEdUkyVjdOS3dSNGptT0dYRmJ1YzJKZFV3bUdMOVdxRnpIdVZo?=
 =?utf-8?B?eWdSUWhxcUNZZnFLR0FITmVhK3VJV0J5MDV1N2t6M0tOVWtsTFdrQW5GZzdD?=
 =?utf-8?B?S0hGRDh0V1VHMVNZK29DcVN3OENvZ1FIblFZbUxkckFweEJGdi9DZDRrQXpp?=
 =?utf-8?B?UnV3cEdFTHFoZ3NnNDdQR3ZOQWI2dlY1Y09sYU50YzBrdEZJTGY3ZFNBd3FI?=
 =?utf-8?B?dTFtblFQNHc1bkh6OFh3c283bG9oVFdyOE8vNUc4MHZyZ2htTEpXSnY3dTBr?=
 =?utf-8?B?TnMxVnlrYmcwSGhzd3VITlM5Uk1YdjYza3Y3VGtGZlROTW9MMzBzN0dUOVM1?=
 =?utf-8?B?Skp6ZnRoUnJabFM0S2tiemVraUlaTkJJbVo5bEJVMUduaWVxOS80RVMyM3hN?=
 =?utf-8?B?QTRJMmJoR3M2V1k4eEZLS0tYZVpuT3ZESVUzN2xlZytZTTRUckpJQzJWY2l0?=
 =?utf-8?B?RGtPQ1RrUC9nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmVjRUo3dVdEN0N4dW1DY2FheW1DVlg0N1NTcXNjc0RZN0xEZEc0TnJzNWkz?=
 =?utf-8?B?WXN2Vm1BL1NyZDlCeUJ4cEdMS01iczJKZmhkVUxrV0hGcExLOWRUNHRpR2R2?=
 =?utf-8?B?Y09NdGVFcXpDaVk1KzFaUmxlZ0d5d0NnclpvbW81SThUR09NUTN5cHVkL2RZ?=
 =?utf-8?B?UVBVZ2lBV3hqbmlpMHJqS2xmVkdYclMzNUZCTkhhS1lUMzR6YUwzRXVKZ2pD?=
 =?utf-8?B?MXViK3pHL3NDRDRZL3k5cXF2L2xqVkEvWGthT1ZwSkxFZW9MMGplMSt6blVE?=
 =?utf-8?B?aGswMEh3Vjg5clZZQ0V0aHVYdEZZclJRalVXdWJMYUI2WEIzYzcrWWtKNG12?=
 =?utf-8?B?Sm5tUjhYSHR6czJYT2dJYTlOUUQ5MFhKKzFiRG5Hb2tIcTBsSUowY1ZaMFV3?=
 =?utf-8?B?dHNIMFAyUmw4dDFidTEyRnpnSVFLVEdSNi9iZU1Db0pSelpEQ3ZoYzlyc2dt?=
 =?utf-8?B?SUpUK3ZFelZ5Z1hENVBvNVMrVHU4OG5OSVlwdHhSUUJHaTBsYTZlbjdyaWtt?=
 =?utf-8?B?UllQQTBsRG9CLzJjdWVyeGt1TGROYURGSWhkWitLRzQvUFU2WCszRlJVWDdB?=
 =?utf-8?B?TGZxYnFrTFlyNURWVFBYOGtBaHFVM1dOLzltSUkwSEdBd21mOVZtd1FvcFVm?=
 =?utf-8?B?VmwrdWdFVG05MmtnYUw5UnNkRS8xSnk2Vmo5eGFsN3NnSVdYQm1tOXdXdmVM?=
 =?utf-8?B?L2tVYk1MNTM3TFJaeVlXM3M2RjBnQk1WYTNBZnd2MStpUGIxWitjWEVFdzZM?=
 =?utf-8?B?RkZWV0RKL0tmbDduQ2x6aktjc2FxN1p0R2doc1UwK3QyaEp4N2NxSDJrcTRt?=
 =?utf-8?B?d1MvV1JwU2JUUVk0QW5vSW5yeWZzZDNuUE5EWmJkVmNHNllaMFVrSjlPMDht?=
 =?utf-8?B?czV5QzgyK3ZwcjhyY3Nqc0NhUkpTNWxNQ0s4ZkNNcWR3K1pqWnI4alhDLy9V?=
 =?utf-8?B?NWxIb1Y4OVorRDdYN1RucDFnZzRUeHphVlBRSEU0MlR2ZVNVYk1SaXhvcjdQ?=
 =?utf-8?B?QjhuR2gzOG5lNnlLbFplc2graVNlNU1MN1ltVmc5Y2ZNOXdzeVg2K0xEMmVG?=
 =?utf-8?B?aE1IRzJqeUFRM2g3U2VBSXh4bmN2aEdxYTN5TlJFY1RKOUVHZXkxRzNZQWNj?=
 =?utf-8?B?ZGIvQjlMT2toZVYzSUN2STBha2cxQy8ycmdOU1R1R2N2SzNIQlFPNzNITFBG?=
 =?utf-8?B?K1Z0NUUxS1pmM2p3MS9VdkJkbVV6REQxY3BNbFVRRnpta09IN3hFcGw1eVNk?=
 =?utf-8?B?NUI4alpYOXY5eDkzaHRLUVYzZHpZeDEyQWxWS2hzY2h3WHl2V09QZW9Oa00v?=
 =?utf-8?B?WUNIWGwzcUxKWjZ2UUtjRlFNN3VjV3JiVnFzWlNKUG1qUS9vbDFhLy82VlFD?=
 =?utf-8?B?UjhVcFRpejN3LzBVeTFRQXVFbjN4R1M3N1ZISEMwTGNReG5tc3ExWkx0L0t0?=
 =?utf-8?B?eE5LaG8wcmlmRkpiVGtjNFVOZ0tyaUNJMUtibzhGQlBxN0RGTTAxL3dNTVdM?=
 =?utf-8?B?R3F3MGpuaGlzL0V2RmpuanZ5aHVrVmp6WnlnZGx2cW1ocWlZMFNNcW1sY09Z?=
 =?utf-8?B?MW94anlYYW1EK3V1cnpkbkVLNUplVU9BMWZSakVSQlNuMmpDT045d2piVUt2?=
 =?utf-8?B?TmdJV09WZEZmRDFMdXRuakI5SmxjWlA5cXBiNm1rZlJmbFBHd3BrdmoxV0Z4?=
 =?utf-8?B?S1dHSm93Nm5lS3M4QWt5MFNhamJEbHIzVE5UeDM2NVlLRUt2TzFibDhTeU9m?=
 =?utf-8?B?VWd0a1FsdGRrWWdmRlBvZjRWMnU4dWRUczhkempnLzl3dURLRUJ1Z3JCTmp4?=
 =?utf-8?B?RUFaY3VMbGVSVWxVRWkrQVhyRFM1SUJ1d2F3ZnQveUt3K2huS1ROSkZsZElZ?=
 =?utf-8?B?QStJQkhJM2xpZU5vUlBib3NMU3ppYWNMbFQ5TUpoaVlBMFZ5UGVtZHlJdEJy?=
 =?utf-8?B?aWJmTUcrUjVSWk1uRmpoekQ1WnF2Q2trUjZTSzNLVm1TVWwyWTVoem1RTDkr?=
 =?utf-8?B?alZCM3dtYjJubGtBNEpJcVJ5RktWN2xtaFJQYytKd0tiTFVBT2JzZTQ5anNi?=
 =?utf-8?B?RnZ2OHRKYTlkdVpDYnl3VkpVdUFFUTVKOXl2Um8vajdhajA2eDdoUmowU2hU?=
 =?utf-8?B?dGlWdStKdU1hdjFYOXFSUHF5TmtPeWVGWm8ydXBvYWVON3YwM3RzWUlYZzlZ?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DADD95B79E8204C8ED1CF4CF9927F19@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ee6b40-d690-4576-b69e-08dd7c341d0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 15:42:22.3478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYgCFSZks37S5UoUkjn5nkLXRjqUgIwlVwmoxyDLb+/1rR3283Wfk7xgc8M0RcAxNEVPVAzSay2DVDoygsEqiZ7NZ+0rs0QpPHy4VkENe361XK4JZhwdATZxMkrCOWwL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8475

SGkgSmFpLA0KDQpUaGlzIGlzc3VlIHdhcyBhbHJlYWR5IHJlcG9ydGVkIGJ5IFN0ZWZhbi4gVGhl
IHByb2JsZW0gaXMgdGhhdCBJIGRvbid0IA0KaGF2ZSBhIERlYml4IGJvYXJkIHRvIGludmVzdGln
YXRlLg0KVGhlIG1haW4gZGlmZmVyZW5jZSBiL3cgV0ZJIGFuZCBjcHUtcGQtd2FpdCBpcyB0aGF0
IHRoZSBmaXJzdCBkb2Vzbid0IA0KY2FsbCBQU0NJL1RGLUEuIFNvLCB0aGUgaXNzdWUgbG9va3Mg
dG8gYmUgcmVsYXRlZCB0byBzb21lIHNldHRpbmdzIGluIA0KdGhlIFRGLUEuDQpXaGF0IEkgZG9u
J3QgZ2V0IGlzIHdoeSBJIGRvbid0IHNlZSB0aGlzIGlzc3VlIG5laXRoZXIgb24gb3VyIElNWDhN
UCANCnNwZWNpZmljIGRlc2lnbiBub3Igb24gdGhlIEVWSywgd2hpY2ggdXNlcyB0aGUgc2FtZSBQ
SFkgYXMgdGhlIERlYml4IGJvYXJkLg0KDQpCUiwNCkNhdGFsaW4NCg0KT24gMTQvMDQvMjAyNSAx
NDowNywgSmFpIEx1dGhyYSB3cm90ZToNCj4gSGkgQ2F0YWxpbiwgU2hhd24sDQo+DQo+IE9uIE9j
dCAyMSwgMjAyNCBhdCAxNzo0MjozNCArMDgwMCwgU2hhd24gR3VvIHdyb3RlOg0KPj4gT24gTW9u
LCBPY3QgMDcsIDIwMjQgYXQgMDM6NDQ6MjRQTSArMDIwMCwgQ2F0YWxpbiBQb3Blc2N1IHdyb3Rl
Og0KPj4+IFNvIGZhciwgb25seSBXRkkgaXMgc3VwcG9ydGVkIG9uIGkuTVg4bXAgcGxhdGZvcm0u
IEFkZCBzdXBwb3J0IGZvcg0KPj4+IGRlZXBlciBjcHVpZGxlIHN0YXRlICJjcHUtcGQtd2FpdCIg
dGhhdCB3b3VsZCBhbGxvdyBmb3IgYmV0dGVyIHBvd2VyDQo+Pj4gdXNhZ2UgZHVyaW5nIHJ1bnRp
bWUuIFRoaXMgaXMgYSBwb3J0IGZyb20gTlhQIGRvd25zdHJlYW0ga2VybmVsLg0KPj4+DQo+IFNp
bmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhpcyBwYXRjaCBpbiBtYWlubGluZSwgSSBhbSBmYWNp
bmcgc2x1Z2dpc2gNCj4gbmV0d29yayBwZXJmb3JtYW5jZSB3aXRoIG15IERlYml4IE1vZGVsLUEg
Ym9hcmQgd2l0aCBpLk1YOG1wIFNvQy4NCj4NCj4gVGhlIG5ldHdvcmsgbGF0ZW5jeSBqdW1wcyB0
byA+MXMgYWZ0ZXIgYWxtb3N0IGV2ZXJ5IG90aGVyIHBhY2tldDoNCj4NCj4gUElORyBkZWJpeCAo
MTAuMC40Mi41KSA1Nig4NCkgYnl0ZXMgb2YgZGF0YS4NCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAo
MTAuMC40Mi41KTogaWNtcF9zZXE9MSB0dGw9NjQgdGltZT0xMDA4IG1zDQo+IDY0IGJ5dGVzIGZy
b20gZGViaXggKDEwLjAuNDIuNSk6IGljbXBfc2VxPTIgdHRsPTY0IHRpbWU9MC40ODggbXMNCj4g
NjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9MyB0dGw9NjQgdGltZT0x
MDI1IG1zDQo+IDY0IGJ5dGVzIGZyb20gZGViaXggKDEwLjAuNDIuNSk6IGljbXBfc2VxPTQgdHRs
PTY0IHRpbWU9MC44MTAgbXMNCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNt
cF9zZXE9NSB0dGw9NjQgdGltZT01OTAgbXMNCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40
Mi41KTogaWNtcF9zZXE9NiB0dGw9NjQgdGltZT0wLjM1MSBtcw0KPiBeQw0KPiAtLS0gZGViaXgg
cGluZyBzdGF0aXN0aWNzIC0tLQ0KPiA3IHBhY2tldHMgdHJhbnNtaXR0ZWQsIDYgcmVjZWl2ZWQs
IDE0LjI4NTclIHBhY2tldCBsb3NzLCB0aW1lIDYxMjZtcw0KPiBydHQgbWluL2F2Zy9tYXgvbWRl
diA9IDAuMzUxLzQzNy40MTYvMTAyNC43NTUvNDU5LjM3MCBtcywgcGlwZSAyDQo+IGRhcmthcGV4
IGF0IGZyZXlhIGluIH4NCj4NCj4gSWYgSSByZXZlcnQgdGhlIHBhdGNoLCBvciBkaXNhYmxlIHRo
ZSBkZWVwZXIgY3B1aWRsZSBzdGF0ZSB0aHJvdWdoDQo+IHN5c2ZzLCB0aGUgaXNzdWUgZ29lcyBh
d2F5Lg0KPg0KPiAjIGVjaG8gMSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdSRpL2NwdWlk
bGUvc3RhdGUxL2Rpc2FibGUNCj4NCj4gUElORyBkZWJpeCAoMTAuMC40Mi41KSA1Nig4NCkgYnl0
ZXMgb2YgZGF0YS4NCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9
MSB0dGw9NjQgdGltZT0wLjQ4MiBtcw0KPiA2NCBieXRlcyBmcm9tIGRlYml4ICgxMC4wLjQyLjUp
OiBpY21wX3NlcT0yIHR0bD02NCB0aW1lPTIuMjggbXMNCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAo
MTAuMC40Mi41KTogaWNtcF9zZXE9MyB0dGw9NjQgdGltZT0yLjI2IG1zDQo+IDY0IGJ5dGVzIGZy
b20gZGViaXggKDEwLjAuNDIuNSk6IGljbXBfc2VxPTQgdHRsPTY0IHRpbWU9MC44NDggbXMNCj4g
NjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9NSB0dGw9NjQgdGltZT0w
LjQwNiBtcw0KPiBeQw0KPiAtLS0gZGViaXggcGluZyBzdGF0aXN0aWNzIC0tLQ0KPiA1IHBhY2tl
dHMgdHJhbnNtaXR0ZWQsIDUgcmVjZWl2ZWQsIDAlIHBhY2tldCBsb3NzLCB0aW1lIDQwNTFtcw0K
PiBydHQgbWluL2F2Zy9tYXgvbWRldiA9IDAuNDA2LzEuMjU1LzIuMjgwLzAuODQyIG1zDQo+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogQ2F0YWxpbiBQb3Blc2N1DQo+Pj4gPGNhdGFsaW4ucG9wZXNjdUBs
ZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4+IEFwcGxpZWQsIHRoYW5rcyENCj4+DQo+Pg0KPiBUaGFu
a3MsDQo+IEphaQ0KDQoNCg==
