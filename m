Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2124.outbound.protection.outlook.com [40.107.22.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5895E1B043E;
	Sat, 24 May 2025 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748085961; cv=fail; b=aWaHO8YiX4VrmEJaoqKzG5ZxBOo/K8AQn7OvYejYhaKaHcGuwDoekQnVT38Qz4fnjnPM6H6z+JILtqyJ0xAJDy2Yrj11hAuj+aiC/YSN26amOSNMnieeGwboLr6CRVuT46C6SJeOa8pHtpXxLH+2GJjr045OE2/ODpya6yeyOas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748085961; c=relaxed/simple;
	bh=1jTsjVkNTU05Wq/RweiaOasPygG0zTacB9VjTvyoW9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qWaUYxW4NKwNBcXoFjog8BTt0JTKamzZJzKlMrtn43VVUL4aJcfP38n4jrkzIY8FRLTSJ9aK+KLtjAiA/mLYW99ONtc48DRtzQ3JBYUZoltqTNOviNqbSdMnUY2qsN0LnbbRd0r1iK15VK5/KnokKppGuOlOzGML4oNNLGqO+2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ZkFWvGK2; arc=fail smtp.client-ip=40.107.22.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ZkFWvGK2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekqoozOClbmbZvXRJbQ7kiy/o0UV5LJ1kuhZ5fhPJIHWd8T2W2I1RYAK4HzdzbtIELdjbp/C3YxL6Jefsd3mqJZ+LEvrRNpVEMvqFocH6p9Lq7djTVZ2fv289WurSWk7lUSiz6mKKPM0qIoNZ4JT7JOagUNvAyqIYOZOuxMFzLvkeH76gf0ikNXNqXDeez6PW2eT/63pZupiwQlbWaZyG7NCG8ySyuSbC48Oe2mO8l/YN2qcgYwWisBjIlfxsUFcv+JMi1CDKzsQCEj7OmLuBL7ItLTaztGBsRZLMyGpojw1tTcCV3rbthVbmgMkx2AZQO1V64ZETkJ4dqsXmWt0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jTsjVkNTU05Wq/RweiaOasPygG0zTacB9VjTvyoW9g=;
 b=LvXtvWhcdEIXQButJoCc8rncMditOJfeUkuhx94keZzkYa+Mmmew+S1jB2GLa4ULDEqquYm4/g7pCl8YOTG0qOoaG2mQkEYjhD7TIXilR+GWSpqCFCPLvkwNj28sFx6n+7CZEtwT5VUG7a58Ztld0y3sRSkSlYXwfm76HmldukhrqpRpqi2+Faqb38i5K2Z4QJbTHDdD4kmLOPtTXCO9dhpVRHI7r6QZgWBOioyPjqRN4zK1SRPDuqjVb0VqXJbN1qgRJYxaocF4Lb7bNyGPNWmkjqnr68vcxIiPVVf6s4XkxRt2aVxkOfXKYwmqGfEEVhbck6Ej+S4FgxGuqvCgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jTsjVkNTU05Wq/RweiaOasPygG0zTacB9VjTvyoW9g=;
 b=ZkFWvGK2Is+tqc8lHE9ujAK7DxXEzRtPPajUzTgWfoavWYdT7mpixLkOjJhubCQhMm8YLHmL0LB6Ex7pfAjZ9HeyginzlIgiRz8O1tFZFHn8F9aX2MW3oleGRXQ739ropNfwFI0Gct4FtBlYNo/xktreUDcBvcwAXKRf5zxNlsT+EuGo6OUlzN0tGolJOfkem9OS5IYKw4m8N+MCupxwuQjZV51G1zgxVZTEkRnJEaFgGDvGwspC4QXL1EFyyXRyq1ZYT9if0rhGNhHAPYceBVlbaPY4XioUcxjb5BckcV83D2spw4xYILkYFyU9DasSWRmXuOLQFBhEbylv/QbO6Q==
Received: from VI1P195MB0272.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:60::29)
 by VI1P195MB0624.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Sat, 24 May
 2025 11:25:55 +0000
Received: from VI1P195MB0272.EURP195.PROD.OUTLOOK.COM
 ([fe80::e9b2:9988:f36b:8cc]) by VI1P195MB0272.EURP195.PROD.OUTLOOK.COM
 ([fe80::e9b2:9988:f36b:8cc%4]) with mapi id 15.20.8769.019; Sat, 24 May 2025
 11:25:55 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Fabio Estevam <festevam@gmail.com>
CC: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index: AQHbyX2bW4iAAlnw50GZbSoOhdp/G7PbhNeAgAF4NgCABK0wAA==
Date: Sat, 24 May 2025 11:25:54 +0000
Message-ID: <4ea4f86ff4ecf6affc55f0fe11c368bfad9d91b2.camel@phytec.de>
References: <20250520115143.409413-1-c.stoidner@phytec.de>
		 <CAOMZO5D8giOiBCeV5AP1pL+hCFQt9bs3gFsr2mCgMSSbcbCovw@mail.gmail.com>
	 <bbcf96dea612dd5dc2e9f2809139a3df2602f7d1.camel@phytec.de>
In-Reply-To: <bbcf96dea612dd5dc2e9f2809139a3df2602f7d1.camel@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P195MB0272:EE_|VI1P195MB0624:EE_
x-ms-office365-filtering-correlation-id: a20515e9-69ce-4409-56ea-08dd9ab5bf89
x-ld-processed: e609157c-80e2-446d-9be3-9c99c2399d29,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TnVNR1p3cnVyYnliZ0UzN0NZSk84YmV0WkZOYmF5b2JkYklndnVyNlJQTENU?=
 =?utf-8?B?T1pwTm9yTzR5U2NXRGhxcmtveEZ5b3huN20wRzFnaTNGWkxOcjhlV3BWdGJh?=
 =?utf-8?B?ODU2dHlLcGtrZnNLVGVuOHc3eVRHVkNtV3EwM3RyZnhxVnpTUTRZZlluK3Y2?=
 =?utf-8?B?ZUQ2QTBnOHhxUFFZYmVrK0UxNmxrU3RvT040NCtjUndIMU9oanV1VDBUSnVN?=
 =?utf-8?B?cnZreDR5RUViSHlqM1Z2SURIeE13ODUzcmdIWGNlMllneXVMb1BjZXloSmFi?=
 =?utf-8?B?a01RVTBtM2w4MzJ3cEc1b0FEN2luTkZBTlRqWmxtNjIwOXkwRFJ0Q0szc1BW?=
 =?utf-8?B?ckNOY3haMjh3UGN4NzNIbmZ1YUhUOU1kWDZJT3hrRUZ2QThkWFNBTmNDWi83?=
 =?utf-8?B?UDlRdkJjUTNvcTNCQnZyOXpjNGR2T3h4TlR2cTdhZEJVcDZGVWxoNDZPNXNO?=
 =?utf-8?B?R2xnb01VR1pjdk43QmJtUE43dWYvcU1JWjNHUVl5TFJtWW54enkyZjQ0UUtM?=
 =?utf-8?B?TXI0KzdISXZUYWVGaW90UGNPRTEzTUVpK3lCS0VENGgvT1JJM0VvTmtLSGxm?=
 =?utf-8?B?UEhHUGlHcFViRW5HUEF4WmhuSUxqRG5oSVA4WTRxZENHR3ZhdlJZSU9HNXJy?=
 =?utf-8?B?dWxkMDZyOGRlNlRyc2hDc1Qxa1RtcVNSWVQxMDlnTXZmSEI0aEFsS28xa1Vr?=
 =?utf-8?B?eDVIeExlSG9GaFZXMG4vdG5DZUJnMm5sbVZaUWJQaVBjSzRwVWx5RTlFY3BG?=
 =?utf-8?B?Y2J4VTl5N1VMS3daNytXMGxKK05SdEUvUFhQMzFHNmhoWnJPWUNGeGhneG91?=
 =?utf-8?B?OWF5UjJXU3AybnhDSHBETWlDMTJqNUk0dlV1TXhTVXZSSXViYWV3SEpFZTNq?=
 =?utf-8?B?VVdwUnhwa1RQSFBKU3JBclFOUFVweUpHR2dNakdsUlk3ZTFIdWlBWkNxd0lK?=
 =?utf-8?B?Ykt1VXFTZ3VnTGhKSTVlZStDcUttUTkxeW9LN1lUS28vekVKdk5YdkpYZ3Bj?=
 =?utf-8?B?Tmo3OU9xWTBiMzZ4dDRrbnRPT25ENm5zSy9MSldsTGZoT0VpTzBzVG5wNjd0?=
 =?utf-8?B?aXptQlNpQVNJdGl6SGphTDZhTHVqUm41R1hCNDhVeTNZc0RDa1k3cjlwUDBJ?=
 =?utf-8?B?WXRvOU1GNVg5MWpGRm0vS3hiQjlCZkxqa2lUTS9kNXl0dVBWcXIxUGxqem1T?=
 =?utf-8?B?Rks5MlM3SkJMMGpxZmowOEVEZVAzZDRlN2lHSHdObXhmREhyT2o2QmpSVnUz?=
 =?utf-8?B?MnpoSmhsOWU1UGJScVAvckxvMXBRcmUrQmQ2R2dINEt2dEtpNlNvMkd5Mmxm?=
 =?utf-8?B?SVJJdkJqR00xam4yMGVpVjljbmYwSnZGNHA0d1VjMTlGQzViUXJ6T1NBU3Yv?=
 =?utf-8?B?aTlyS01sTkhhTUEyYkxFS1V6VktUZmU1Sjd2cW5KNnZFTkRPYXE3Ym9xc1hW?=
 =?utf-8?B?c0lPa29SV2QrTlRqM1J5WGxMZGVYd0JNTjF1L255bG85QzRzeXRaWVB5VXhW?=
 =?utf-8?B?My96b0FHcWt2L28vUzJNVzNaL0JnOVlKK1lORmFQQzZxekFQK1NlZzExai9Z?=
 =?utf-8?B?cWdzSjV4V0FqRC9VTkdtU1Z5S3lRdUMrMVlnUXgzeUkya0lVVjIzZGRyRWlM?=
 =?utf-8?B?eFEyNU9mVWhRcHFORlVyTU9UUllONGtvcE9vaU1DN2VZZXA3c0V4bzhobGdu?=
 =?utf-8?B?NjFHN3RaSGMwSDVyWWJYS1YzVUh0dXo3TGhVcmQ5M1IweFd6S2crbE40SFpy?=
 =?utf-8?B?S0F3Qmt0MWlLbllpNDlBWEtlQmM2aXBNbmRwRnpHcktwbU44T0R6THI2M0Jx?=
 =?utf-8?B?eEs1QkJjNWlRLzI5bnBlZWNxS3Z5cVJDanRDaEY3TGlDSkUvd3NJV3hJd05Y?=
 =?utf-8?B?UStFa2NKbThtYW5vcWZqcjcwMmlQY0V6SmEwQkMvOHRRNTVzRHk5VUxLQXNi?=
 =?utf-8?B?d0x1Nm1qUWtzS0gxZ296Qk53T2NYZlM1TmtSZDBvZEhxeWV1VVZiYTlVT3A2?=
 =?utf-8?B?YmpjbGpIL3pnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0272.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFIzT1ZWRVRtNGFvOUlCNW1POE5ORmtKbXRlUGlrNjZxOFNMUHBya2xVeXFx?=
 =?utf-8?B?UGR1cjk2aDFSakJHaGxqL2ZwbllBbzR3QkZ0UTBGc2pWbnF5dTFOZXpQam0y?=
 =?utf-8?B?OG43OTNCSGJPSEpXanpNSGszeFJBMHNGYlZ6ZVNOQlUwZHFyN2Q5L0t6ckxL?=
 =?utf-8?B?ckVUWmlWdmJHZ0t3UUU4UWplTU1IcUtFLy9IcVh0YWRnZGZnaEtibEQwdlJZ?=
 =?utf-8?B?Z2FTWXhPNUJCdkx4ZU5DYTFBMldXSGI5UDBkZ1VRdVhsTlRleE02c21qdUM2?=
 =?utf-8?B?dFRyanJWVURhNUxFNXdUNDFUOUpsWm9HQkZDWm9YTXQwdktIZXBwaDBHMDdm?=
 =?utf-8?B?TVJSWFhjOUtSaVMrZVBJakEwUmNPMlFZT01aS2pHMWZ1Y05iQ0lmTGhEd0N3?=
 =?utf-8?B?S2NJT3dCWU94cUczdjBHVEZ1MjR4LzhoWWpKWFJ3UTZSTzY2Rk1ld3ZmeThw?=
 =?utf-8?B?MS84TDNkK2orTkVMZkVIeVBvNTkvNHF2aG9yMkQweDV6KzdTOVFXWTZ2WEUz?=
 =?utf-8?B?eCtDeE0wL2pSVUZFMmVYNDVXWFp1ZEY5TmsrL0YzMWpMWXIxdUFCaDd4djBR?=
 =?utf-8?B?ZmxuQmpETElhL21ybFE3Rys0QlI0d3pJQUMzVU5ZVWlBaGNvQTNkVU9nQTM3?=
 =?utf-8?B?NnMvRnNxdXhDWjAyRWdFNlRvVFhqb1dSdkl3UW5held3cHZaUmYxUFlleUlK?=
 =?utf-8?B?NnFtbXNVNkpuODY0aEhnRGNHTWJzTUhqMCs1ZnlwSEZEempwWFUrbEEyVEVM?=
 =?utf-8?B?MC9FenhIQmNQUTJFcEJDYTV2bUE3YmcwbW8rVHNqOHoxdjJ2SnAxN1U3MkR1?=
 =?utf-8?B?QUg5UE80MEEzN241blNBT0dRYWhJcWZPb2F5eDdzNThzanFBTUhHVmgvOGRm?=
 =?utf-8?B?QXlVb3BsQmVBbVRKLzlPTC9PckRMSC8yVkJzTWtRT2pINWhHZ1BCaCsxTHUr?=
 =?utf-8?B?Vk1vU2RqT3JBVThETmxSenpmdjZLaVJMa2tsMkJ5bzFQSUJmNnROOWxpS1ll?=
 =?utf-8?B?Z1cydXJkZ1lNS3A5MFh1STFNM1R3SW9UOEoxeHlxSFRjQ0ZMZ2xkSVdDV29Y?=
 =?utf-8?B?a2lRQ1plUFNTSTBXNFZDRHpweVZiYUtkNXlqL0pweEFMS2lJVG82Z3EyZ3g4?=
 =?utf-8?B?ZERpR25tMkdBR2UzQkZETSs4ZEtSMm9pUzNNVmxTQ3JlNjFpWEhPdW5PZ2lz?=
 =?utf-8?B?YloyUDEwMUN1WVlDVDllZFMxVlYyenZaWi9pcjNvd0s2ek9iTG04enJqS1ZE?=
 =?utf-8?B?U1dmY1JSNUJvRVFRTkxweS8vRVJkYTkxVnZReTBsc0hqcm1TTFFqQ2pONFdD?=
 =?utf-8?B?NzcyL1hUSVJXUnpXdUJ4bEkzU2tuY3cwdGZXWHFOa3FSMjh0SWUrWjQvM1FX?=
 =?utf-8?B?bEh2RCtZQnM0MmZpeXEzUEhJclM3czZKankwdXNkSkJISmo5RTM1T3lCaFYw?=
 =?utf-8?B?Y1VQOUtzUU5Vd1RUVkg4M3IyZnJkMHg0emJQQWpIMVp0aEROV2c4MTlZMlBF?=
 =?utf-8?B?OFE4YzlHZGVjWENiakdPTVJXQVYxNkNSWGNsMS9yM0E5dHRKSU13MFlpdWEz?=
 =?utf-8?B?TjJTVVFWb1Yrb1JRWUFJSVl3c2tTSk41NGVwc1krUU5jcUFubSsrYUFadHF6?=
 =?utf-8?B?QUkxZDZPZGsvVkk3WjIxcWtZbVhRcEdYZ05MMFZnOTZ5SzZFcVlQcC84NXFa?=
 =?utf-8?B?SlhFbE00ZHV5ZDZQNVgyMmVJYkJkWjhtWG1OMjRRekpNb0tXcU9UVVBmQ0dL?=
 =?utf-8?B?LzlnREFYQk5qT3lIRkRLL2xlSWMxaGF3Z1NLek5BSXRVTkpLOUlLeGRaT1Mw?=
 =?utf-8?B?bW1pN3Y4QWI4UXpFbjhUeUdGLzJDSkRDT3k1dmMzKy9pd3Y4dnlEMG9vcmNx?=
 =?utf-8?B?OTBOTzBybXV1UDZOOU5zWXpZSVZwdFl3dm5QWkR4NlVLa216ZE5QbTBBMXJY?=
 =?utf-8?B?REsxYUJUUzRwUDNkdmhQSHN4bVBzdlVEVHZ2bFZBK25Wei81cVUzMFJEZDhI?=
 =?utf-8?B?a1ZCMTVBR2NnclBzVkNuY2VvczI3YWZOTDNRZGlpSWRaa2R3WDlUYWFNK1BN?=
 =?utf-8?B?Tm5NUEFsM05FcHA0NE1jUkJJcWlvM09DeDJwK2JjbC9Ma204LzZUY0txTGNC?=
 =?utf-8?Q?yKpnMWwy0w/SNhqUzZkcgLBzW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <588D25EEDDA5F146B2C218FE162025A5@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0272.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a20515e9-69ce-4409-56ea-08dd9ab5bf89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 11:25:54.9171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4CIBRGLH45aZeF/BJT0c+8Xq9uTJnuV8NF4V7HDFoBuLC09krAs2OXVN/qEaEL0aimWmAtDkYuzGtCvZxuSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0624

T24gTWksIDIwMjUtMDUtMjEgYXQgMTQ6MDEgKzAyMDAsIENocmlzdG9waCBTdG9pZG5lciB3cm90
ZToKPiBPbiBEaSwgMjAyNS0wNS0yMCBhdCAxMDozNCAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3cm90
ZToKPiA+IE9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDg6NTLigK9BTSBDaHJpc3RvcGggU3RvaWRu
ZXIKPiA+IDxjLnN0b2lkbmVyQHBoeXRlYy5kZT4gd3JvdGU6Cj4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLXBoeWNvcmUtc29tLmR0c2kK
PiA+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5k
dHNpCj4gPiA+IGluZGV4IDg4YzI2NTdiNTBlNi4uYzA4ZjRiOGE2NWE2IDEwMDY0NAo+ID4gPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNp
Cj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLXBoeWNvcmUt
c29tLmR0c2kKPiA+ID4gQEAgLTU4LDYgKzU4LDkgQEAgJmZlYyB7Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZj
bGsKPiA+ID4gSU1YOTNfQ0xLX1NZU19QTExfUEZEMV9ESVYyPiwKPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNs
awo+ID4gPiBJTVg5M19DTEtfU1lTX1BMTF9QRkQxX0RJVjI+Owo+ID4gPiDCoMKgwqDCoMKgwqDC
oCBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwxMDAwMDAwMDA+LCA8NTAwMDAwMDA+LAo+ID4gPiA8
NTAwMDAwMDA+Owo+ID4gPiArwqDCoMKgwqDCoMKgIHBoeS1yZXNldC1ncGlvcyA9IDwmZ3BpbzQg
MjMgR1BJT19BQ1RJVkVfSElHSD47Cj4gPiA+ICvCoMKgwqDCoMKgwqAgcGh5LXJlc2V0LWR1cmF0
aW9uID0gPDE+Owo+ID4gPiArwqDCoMKgwqDCoMKgIHBoeS1yZXNldC1wb3N0LWRlbGF5ID0gPDA+
Owo+ID4gCj4gPiBUaGVzZSBwcm9wZXJ0aWVzIGFyZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiBm
c2wsZmVjLnlhbWwuCj4gPiAKPiA+IEl0IHdvdWxkIGJlIGJldHRlciB0byBwbGFjZSB0aGUgcHJv
cGVydGllcyBkZXNjcmliZWQgYnkKPiA+IGV0aGVybmV0LXBoeS55YW1sIHVuZGVyIHRoZSBldGhl
cm5ldC1waHlAMSBub2RlLgo+IAo+IE9rLCBJIG5lZWQgdG8gZG91YmxlLWNoZWNrIHRoYXQgdGhl
c2UgZG8gd29yayBwcm9wZXJseSBpbgo+IHUtYm9vdCBvbiBvdXIgcGxhdGZvcm0uIEkgd2lsbCBj
b21lIGJhY2sgaGVyZS4KCkNoZWNrZWQsIGl0IHdvcmsuIEkgd2lsbCBzZW5kIGEgdjMgZm9yIGl0
LgoKUmVnYXJkcywKQ2hyaXN0b3BoCgo=
