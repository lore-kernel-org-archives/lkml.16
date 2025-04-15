Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2098.outbound.protection.outlook.com [40.107.20.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED60275107;
	Tue, 15 Apr 2025 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707173; cv=fail; b=PVVcmZ6bVHlCCzGg4pDsl1giksc4Vd+wfeLzUJwvuVTo8eidcQ3wA8sXitCSHqSPJ2OMpCJ7GFtyKBJiSLInbX9e1ETi+mFUt0hqNxJOOTNtVAEE3J4oieb8/aoBxh44TpIXB/HTi6LhcSJ/oU9l7HX6iRABXxsXaH6fm6j/am0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707173; c=relaxed/simple;
	bh=8ml2dCL8dOWv/zUUKmNP6lNPUA79kOVs8IgP603UXY8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LzNXTU4V/Jt6rtYQeghR7x3vkmWJ7SVKK7vZuymuBxozqasts9cJSkKfdg9mjo2iAIfcv32n7xwuvf+LVgbCOslPj33zqPNOzzFa0MCi7g/nj0Y6+P6zhtyjFTzTAIYX/NxUNJv1azgaXIcs1nxRSTrcQYM1kUfM3YRFlAd91uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=jQkiU5i2; arc=fail smtp.client-ip=40.107.20.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="jQkiU5i2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JANBUgis+zxj3eBxz9yukKrk420V8hAmhJrqjCnDWmFSOzkZDGZIk89FuoxIApQKCPOZ6e0k4xrBK3FcgMvJm25WJvilfqAyWBFDCX/leSViIRqJ/D179rMmTHb8rxbEMgKOMV1N8Ly3+IJeItEFqHPdnQofakNV7JGsgyFHu9nH8cw1pX7zG4U3oWTqCclEI2YPrJe4WUVrpSs+c6S04i/jVxUYAzL8UEnAarX6XMAIqoENvxqF///NqdZ1ZgLrvzlSenDKiD5Z+tj3MR9ocVANrYv62KzjhTcbBWGj+YNxu9RWqwjAkKAn7Y2bgwp0RiLrYANBAjo/7gBI1ibLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ml2dCL8dOWv/zUUKmNP6lNPUA79kOVs8IgP603UXY8=;
 b=IU7UYHZQ+ciU21oBVdZA68J6u0tGffU+43PB0upImZ4Id+QK2jlwXXRGSLs5f+j+38jHHW85PzT37iREIPTuriFmqUYcStFuZ6CGUhCJVHWP9YOXbH/rbVVCKP2M6XPsEFgJzjH3KJX02WMMZSeiVZmw2NVCuiF2W7NZ7QBR6AYfzjTALEkb6wmWJLoIPF5tX2I/Fyq+HylOWR+G6CXKYhs+CEE7bwTNaXibnQeozOXv7UgWU3eIOML1l0rRt0T5mBfDdSqXM0A7cYFO0vSsqlCgCAHmbotjTK4xS01HIWzeRINxNassZQVFmXkLFFJl/Yv95DWe/naldgDTO8OCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ml2dCL8dOWv/zUUKmNP6lNPUA79kOVs8IgP603UXY8=;
 b=jQkiU5i2qhskpqxnK5xYKkzMN4sa0Vp0t/zfvGkxVAa+IoAEyB0DCyeS3ooXHshZodXHT5IQ6KOvROzZoS23v/tWl4WXbI04AVCFtR8c3K4ehBJ/VmS2f1mJXpBACmSVbKInZjxKz2vFr3QzZg1j5bOs4L89ZLot3TY6DO4nm4VKJ1pikuPIaSx5e17qEQWhuKZyh42CKFB3UOWDZoW3IUQOTrxF2awdY5PoJ7m4flQ1zEJts/TEAKwmwptv2cysCKKtP2ptV70HGG8WDZCpddaALalfTMaO/QLv5H9YAlHWjhZRi9WEJV5WX3G7YxoIA+uoRGmStWSRF8FvLPbh2g==
Received: from AM0P195MB0386.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b4::32)
 by GVXP195MB1688.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 08:52:45 +0000
Received: from AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
 ([fe80::3f8f:9315:c279:d35f]) by AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
 ([fe80::3f8f:9315:c279:d35f%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 08:52:45 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: "Frank.li@nxp.com" <Frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Teresa Remmet
	<T.Remmet@phytec.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Benjamin Hahn <B.Hahn@phytec.de>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, Yashwanth Varakala <Y.Varakala@phytec.de>, Jan Remmet
	<J.Remmet@phytec.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Thread-Topic: [PATCH v2 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Thread-Index: AQHbpIvCNfR78ODT0kOLDKyb43AfO7OSRCWAgBI6RAA=
Date: Tue, 15 Apr 2025 08:52:45 +0000
Message-ID: <07a38758876925a117e3874327141e935e1aec4d.camel@phytec.de>
References:
 <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
	 <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-3-c0d2eff683ac@phytec.de>
	 <Z+7UAzFYCHYij0AA@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+7UAzFYCHYij0AA@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0386:EE_|GVXP195MB1688:EE_
x-ms-office365-filtering-correlation-id: d34a91cd-8481-4960-131a-08dd7bfae413
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elVVTmp1N1pRUkkvUjROd0d5VmNJcUYzY3hFaDJYaVZ2UVdyRFlzd1hrM0JZ?=
 =?utf-8?B?VU5SQWk2emFZTjBEV2RGYm1TNTdaL2NvODRTcGJ1YkcvNisvOHBSK29MT0Fm?=
 =?utf-8?B?Q3J1U0IxdFhFNXBwR2tMa1hrYW1yYjczYnduSGl4ZDlsK1hsVnBJc1prSEd0?=
 =?utf-8?B?NjNIQVZocGlKVW9sNm5QbGJQQzVmdm4rczV2SkN1VmdsUHVac0hvZjNPajN5?=
 =?utf-8?B?dHdzUFhqdHZIaGRNeWhYZFVSSE1GVU5uU2gyTjFnZVB2MFNYNktWYUVTQ0xU?=
 =?utf-8?B?MHFpN1R1SnVVU25wb1dZa0FobHllcEZDcnpnZUtFQmFGR3pUVVQrcWNIbGRH?=
 =?utf-8?B?dmF4dlVCNTRGSDlDNEc2L28wWjREYll0bVBuZHBCZ1hRY283WXczMWd4elR2?=
 =?utf-8?B?NThUSWdlOXF0emxzTHUyZkE4cTdtWWFmUzBYZHk1S3JIRy82bVRJWTgyV2gz?=
 =?utf-8?B?ZjRtdEhpbGFVcjVKaWgrQWg5TVZOenhUK2RqKzJiQ3FxK2ZzMDFpczNDdXdG?=
 =?utf-8?B?cThmc05iTXhJYmZ5SUp5VWY4ZlVSUm12WnBLUzA2SnM4TkRicDlYKzNGaGVp?=
 =?utf-8?B?U2ZDQWsxTjBMY25RR1JiZnhHSjR6QmZ0QThhc1BoVXBuRC9oNkhoS3lzeFQ1?=
 =?utf-8?B?NTVRS2pQNDNWRlErN0I4TE5HTHpqbERxcVVlaElub0plb3BNVW9NTDFlK0g0?=
 =?utf-8?B?eFBkeXNMSUZFMWV3bXg3K05PRUdkVU5meFgxK1lJWUxVN2p1L01idVlaOU5V?=
 =?utf-8?B?M0FaRzhsSDBmcml2U2RzVURRWXo0SW9aZTBUOGFYRjRQZlZKMXl2eHBFdTIy?=
 =?utf-8?B?NVZDYUNjd2xIS0I2MERjUmZuVG0vVzRtR3BEa3Q1L3paRi9ZUHMvcHVuZ0NV?=
 =?utf-8?B?K0t2MW1vMHNQYUhQMFdDYXJDdUxCKzBiYXpLOHpNWk1venZYckVkeVViQ2Fh?=
 =?utf-8?B?UmoxZmNKSytKOU5abXN3QThkNFpGWlFqS29rb0ZpVVl2RG05QkFjR0dzTFVl?=
 =?utf-8?B?RDBIaS82ZE9xQWtBS0IwcGtOQ0NKdTlkNUh2QmxYRWplZVo1RUNVMmozODZl?=
 =?utf-8?B?YWdvUmx1aGVqSmx1VGpNcE5OcFlmVmgza2dNY3RWNGRFZ0g0Y0dRK0FKbzVG?=
 =?utf-8?B?aWF3NWEwcDZjS0lWdzczaGZWZEU3TktEbHAvNWdRUm5taGZyNldCSllONDZ5?=
 =?utf-8?B?eTcrSzgwQ0xRMEN0dGpEaGlFT2JaQ3hXNTV0ZGF1bEZRNU9vVG8vNjNyZDll?=
 =?utf-8?B?dS8xNmg0alY5SjZIci9DTjB5dW10NDhpQUJoUmRLTDZaVVJYMGtzV2h0N3lK?=
 =?utf-8?B?amphNzNZUkVHaUZ2N3FnSGxiMUxNVnJMelhIMDNOb1dwcm5xUWl6YXpiaW9Q?=
 =?utf-8?B?aVNTY1FobUFuM0Ura3BrOWdReW03N25jS2VwVUszTTdMZVpISVJYQ3pIMWx2?=
 =?utf-8?B?RStlNnlYbWowUlZOWGFreGFyVFFBeHRiQzBVc2pjRy9GOVhNYVRmdlA1STBh?=
 =?utf-8?B?MFdRM3djdVYzNnl2dVB4YXplOWFCbDlQZ3Rzd3hFeTlFNTFIV0tZZHBGY1Fn?=
 =?utf-8?B?RXhaRnVQTUMyQlZtYzU4dmNRMzVuSHhvMUJoWHo4OUNnbURRdmt0b2U2ZEdQ?=
 =?utf-8?B?OTBkckFLdTI2MkpWcHhEUlU1RWw4VGFueUEwSFp1cVRKekdzTGpYQWxmbFly?=
 =?utf-8?B?Mmt5UldZVFRJMjZnMU4zSlRKRTNSTHNSM0RCYlBBZkVFck9reUtHcFFIN0Yr?=
 =?utf-8?B?U0c5M0o4bjMwY1BwVXc0RUFYUFNMQk1DVDdTK3dhRCs5ZURRaVAzMkZPMVNC?=
 =?utf-8?B?NitWeHhLcFBUZGdTYnFSV2c5NThGc3c5WG9DazVkd2RlYXhDT2pBaTZhZXdB?=
 =?utf-8?B?elViZkhpTnVnck1YeEpCZ3k2d1E5Wk1sOUllcDZDc3JrTFlQRnVNSE4yc3V2?=
 =?utf-8?B?YnVPR3o1TnBURUF0QmQrV2h1OCs3VVlSQmJXczZ5YzVYamFiWVRDU29iR2JH?=
 =?utf-8?B?RFpGbzZldE5RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0386.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QU1Jb3RuYlZtMXlKRkh4bmpZT0NXSE5vaHk2L2tjajZDd01RUW9YT3JRQkdv?=
 =?utf-8?B?Z0lVZWhibHNzYzN4SXBpN2hVbDB4NENpL203dWZMaEFra3FhYy9sUVlyKzNw?=
 =?utf-8?B?c0RvT2taTWJZaUJ6M1RZaDA2bG85bC9FNHR1TGhBQWNiZzZVb2M4bnRZS295?=
 =?utf-8?B?Um1VUGNqN2pHbHRQTktJRXViVW53STR6MFZ1VTU3V1BLby82Y2Q2Y1M5M2hs?=
 =?utf-8?B?SnpEVWNXdWQyVU94V000ZFRRM3ZnKzF4NEk5eGxtZUdnNCs1TE1DUXRZRUg3?=
 =?utf-8?B?aXNiOTQrM0dCNVhSVDViTmM0azduL0RWRllnU0xDeU1pUHlOZWZZOW1MV1ll?=
 =?utf-8?B?MG5Pd2xIaVpwQmRaOGxYZ0tMRDE5eGZ1eFg4clAyRm9ySnZMMzJPS1BBY3ZB?=
 =?utf-8?B?TXdGcjBiU2NxMVFOYlY4VGtteWxPVmZ4T0l0dG5aaWNkbGhEUmZTU2VtTGV6?=
 =?utf-8?B?MldMcVBYcnNMeUtubm1sZnpoQUM0ZVVSZnR2eE9neW9XMk1GelVhdVNUZnNo?=
 =?utf-8?B?TUFrRkVrb0ZZZ0hhdVVURkxUZHVQQUUrZTRjNFFNY0ZCaE9udUc3eG9nWTR6?=
 =?utf-8?B?QU5FUm5JNzlUVHByd0hIcG5YdHNKcXNHeU41TlA1NnIvdG1ndklRc2FXNllI?=
 =?utf-8?B?R1Z6RUpmUU5VcTNMdFJFVkRUTkVZTkh1cUtrYmd3WElZaUJQZDBReDFpMWtK?=
 =?utf-8?B?MHhRSWdpT0doMGVOS3NTbytIcXZTUFJiMm9RNWZqUnFUaGpPaVY0UWVCZHM0?=
 =?utf-8?B?R1BFcHFiekZHcS9zcG9hZjArak02amhpakRWeGdTNGYzajFPaXIxdUNOZVND?=
 =?utf-8?B?UTcxc1E4bjVyMGh5UWlzQmpMQk5YUWh1RUxVK1pCTEJhakJET3RKZFRKWHIy?=
 =?utf-8?B?TmxWb0xtd2NoVVRRbXVoRUFpVGJmWXJaKzJKclQ4ajVyWW51R3NMS2dHb3BP?=
 =?utf-8?B?VE5YdHRLNXhHemRtRlNzTUhQYmZrb1dBOXZZazN0Y25Rd0RGdjRmZEZ6TzRl?=
 =?utf-8?B?c3NSd2FmUjZrVmxsQTN3bytsUHBVM2NsRWN4QWovcGpYcDh3WUxMT3dSd0da?=
 =?utf-8?B?amF1Y29DQXh0dGFxVVUwdUFqWWNYaW1UMlQxOG53ZFZ2UmRBcU4xd3YzY3Nw?=
 =?utf-8?B?Q1FvbHIrNUw3dmpmVDM1cURJRkZCdmV3QjNRTTN5R0ZyQnJIN1NpNzRzNUFK?=
 =?utf-8?B?S0hyQlZoVkNubjgyZERDK3E2U21KMkVFb2dPQ0tmU0gvY3RBVWRBeUhMZkhI?=
 =?utf-8?B?T2YreGtaRU90aEpMOW9CTS9MZnlQV2dqMDNGS3pqRUFqM25US042SUlTOXJl?=
 =?utf-8?B?RWF1RmpNY3JHSERwNzFtNkZYWVZVc2JvL3dPaUVSUWJYcHB1b0F0YzRGQmxv?=
 =?utf-8?B?bHlWUmhsSk1aRm84Mno1MDBaaUtFT0N1UVlMSlJZbENaaXJKWFlheURLc0U3?=
 =?utf-8?B?ZmhYaCtzeFBGSW1aQ1llczZ4WE1ka3pXRDdacmVBaGM2Z2lOdTFFSU9JMXpO?=
 =?utf-8?B?dTNRRkVHUUZIQWdvQ2JrN2d2K1lxa0FPc0xNTDluUDlwR0NHNHprYXBabUt0?=
 =?utf-8?B?RE9PVDFvanZWRGdFR1NKVWRLMkRLY3pEcTM4NGcwbEw5eXZPVU82Y2piWFFw?=
 =?utf-8?B?M3JYVVZMbTRNbmRreHRpSTZvMWd2SzdFR1VGblBJcFQzbDR4REdNTlFwMVkr?=
 =?utf-8?B?TWRvdTVFNDR1Q3psZ2Z2bVZMTXV5clZ5cEkwM0hPLzVHcURJdVYyRTREcEZV?=
 =?utf-8?B?WjBSbUNsQ2Y0MUxIMXUxc0xPNDZObjVSbjB3M3dtZExESm9XOGNHazhSMGc2?=
 =?utf-8?B?TGEzNE1aeC9hdXZuOHdzWDNGTjcwc0NJMDF3UHpBV2lqVXQwUmRyWFR1U0ZE?=
 =?utf-8?B?c0VraW5XdklGVzBzTjQycHdjUjFoaUo2ZXFjR3pkakQ2bjcrTG0zb1NsTFBQ?=
 =?utf-8?B?SXhGSXFpZHF2MmNqbDdDelovOEJEQmh4a3ZGQ1dXNGJJSkk1eU1CcHdJNnZm?=
 =?utf-8?B?Q2JOWEFEMk0wYUFzS1hqZlpoMXFmZUFDNDVncDJzQTc2R1lkODdDVXhmUTVC?=
 =?utf-8?B?NUFaWlpnQ0lVaTFWb1VSU3I4QytXbStiTDFHSFRKZkdUN2FCR3RUQ0tadkhz?=
 =?utf-8?Q?aFyg7sIkucvohf7geSwGtnGBP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F86AAA774208C4EB14117C57A88C304@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d34a91cd-8481-4960-131a-08dd7bfae413
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 08:52:45.4795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyOY3hyHEZ/7pfSbI9UKu7LjFCTgMECE2ZesjiB6JRNcEQeGTWPwOj8ihJFpw+bYqZDssixYLVGVDjZJlbraDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1688

T24gVGh1LCAyMDI1LTA0LTAzIGF0IDE0OjMxIC0wNDAwLCBGcmFuayBMaSB3cm90ZToNCj4gT24g
VGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6Mjk6MjlQTSArMDIwMCwgWWFubmljIE1vb2cgd3JvdGU6
DQo+ID4gVGhlIExpYnJhIGJvYXJkIGhhcyBhbiBMVkRTIGNvbm5lY3Rvci4gQWRkIGFuIG92ZXJs
YXkgZm9yIGFuDQo+ID4gZXRtbDEwMTBnM2RyYSBMVkRTIHBhbmVsIHN1cHBvcnRlZCBmb3IgdGhl
IHBoeUNPUkUtaS5NWCA4TSBQbHVzIHRoYXQgbWF5DQo+ID4gYmUgY29ubmVjdGVkIHRvIGl0Lg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm5pYyBNb29nIDx5Lm1vb2dAcGh5dGVjLmRlPg0K
PiA+IC0tLQ0KPiA+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGXCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKw0KPiA+IMKgLi4uL2lteDhtcC1saWJyYS1yZGst
ZnBzYy1sdmRzLWV0bWwxMDEwZzNkcmEuZHRzb8KgIHwgNDQgKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gPiBpbmRleCBkZjc5MjU1M2JlNDc5
YWZjYjZmYTUwZGNkMjVhN2ViNjNiNjdiYzQ0Li5hYTM0OWVlMzVkNWIzMTA1MTJmMDVjOTIzOTBk
NWMyYTI3ZGY4MWJiIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL01ha2VmaWxlDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFr
ZWZpbGUNCj4gPiBAQCAtMjAxLDYgKzIwMSw4IEBAIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0g
aW14OG1wLWtvbnRyb24tZGwuZHRiDQo+ID4gDQo+ID4gwqBkdGItJChDT05GSUdfQVJDSF9NWEMp
ICs9IGlteDhtcC1rb250cm9uLXNtYXJjLWV2YWwtY2Fycmllci5kdGINCj4gPiDCoGR0Yi0kKENP
TkZJR19BUkNIX01YQykgKz0gaW14OG1wLWxpYnJhLXJkay1mcHNjLmR0Yg0KPiA+ICtpbXg4bXAt
bGlicmEtcmRrLWZwc2MtbHZkcy1kdGJzICs9IGlteDhtcC1saWJyYS1yZGstZnBzYy5kdGIgaW14
OG1wLWxpYnJhLXJkay1mcHNjLWx2ZHMtDQo+ID4gZXRtbDEwMTBnM2RyYS5kdGJvDQo+ID4gK2R0
Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OG1wLWxpYnJhLXJkay1mcHNjLWx2ZHMuZHRiDQo+
ID4gwqBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtcC1tc2Mtc20ycy1lcDEuZHRiDQo+
ID4gwqBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtcC1uYXZxcC5kdGINCj4gPiDCoGR0
Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OG1wLW5pdHJvZ2VuLXNtYXJjLXVuaXZlcnNhbC1i
b2FyZC5kdGINCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OG1wLWxpYnJhLXJkay1mcHNjLWx2ZHMtZXRtbDEwMTBnM2RyYS5kdHNvDQo+ID4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtbGlicmEtcmRrLWZwc2MtbHZkcy1ldG1s
MTAxMGczZHJhLmR0c28NCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjFkY2YyNDljYTkwZDJiNGQ5NzIw
YTU1ZGUzOWUzZjg1NjQ3ODBkYzMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWxpYnJhLXJkay1mcHNjLWx2ZHMtZXRtbDEw
MTBnM2RyYS5kdHNvDQo+ID4gQEAgLTAsMCArMSw0NCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb3ItbGF0ZXIgT1IgTUlUKQ0KPiA+ICsvKg0KPiA+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMjUgUEhZVEVDIE1lc3N0ZWNobmlrIEdtYkgNCj4gPiArICovDQo+ID4g
Kw0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9pbXg4bXAtY2xvY2suaD4NCj4gPiArDQo+ID4gKy9kdHMtdjEv
Ow0KPiA+ICsvcGx1Z2luLzsNCj4gPiArDQo+ID4gKyZiYWNrbGlnaHRfbHZkczAgew0KPiA+ICsJ
YnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA4IDE2IDMyIDY0IDEyOCAyNTU+Ow0KPiA+ICsJZGVmYXVs
dC1icmlnaHRuZXNzLWxldmVsID0gPDg+Ow0KPiA+ICsJZW5hYmxlLWdwaW9zID0gPCZncGlvNSAy
MyBHUElPX0FDVElWRV9MT1c+Ow0KPiA+ICsJbnVtLWludGVycG9sYXRlZC1zdGVwcyA9IDwyPjsN
Cj4gPiArCXB3bXMgPSA8JnB3bTEgMCA2NjY2NyAwPjsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsN
Cj4gPiArfTsNCj4gPiArDQo+ID4gKyZsY2RpZjIgew0KPiA+ICsJc3RhdHVzID0gIm9rYXkiOw0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArJmx2ZHNfYnJpZGdlIHsNCj4gPiArCWFzc2lnbmVkLWNsb2Nr
cyA9IDwmY2xrIElNWDhNUF9DTEtfTUVESUFfTERCPiwgPCZjbGsgSU1YOE1QX1ZJREVPX1BMTDE+
Ow0KPiA+ICsJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNUF9WSURFT19QTEwx
X09VVD47DQo+ID4gKwkvKg0KPiA+ICsJICogVGhlIExWRFMgcGFuZWwgdXNlcyA3Mi40IE1IeiBw
aXhlbCBjbG9jaywgc2V0IElNWDhNUF9WSURFT19QTEwxIHRvDQo+ID4gKwkgKiA3Mi40ICogNyA9
IDUwNi44IE1IeiBzbyB0aGUgTERCIHNlcmlhbGl6ZXIgYW5kIExDRElGdjMgc2Nhbm91dA0KPiA+
ICsJICogZW5naW5lIGNhbiByZWFjaCBhY2N1cmF0ZSBwaXhlbCBjbG9jayBvZiBleGFjdGx5IDcy
LjQgTUh6Lg0KPiA+ICsJICovDQo+ID4gKwlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwwPiwgPDUw
NjgwMDAwMD47DQo+IA0KPiB3aHkgYXNzaW4gSU1YOE1QX0NMS19NRURJQV9MREIgcmF0ZSB0byAw
Pw0KDQpCZWNhdXNlIGFmYWlrIHdlIGRvbid0IG5lZWQgaXQgYW5kIEkgd291bGQgbGlrZSB0byBr
ZWVwIHRoZSBNRURJQV9MREIgY2xvY2sgZW50cnkuIFdlIG9ubHkgY2FyZQ0KYWJvdXQgdGhlIHBp
eGVsIGNsb2NrIGZvciB0aGUgcGFuZWwuDQpUaGUgY2xvY2stcmF0ZSBmb3IgQ0xLX01FRElBX0xE
QiBpcyBvbWl0dGVkIGluIGlteDhtcC5kdHNpIGFuZCB0aGUgMCBtYWtlcyBzdXJlIGl0IHN0YXlz
IHRoYXQgd2F5Lg0KDQpZYW5uaWMNCg0KPiANCj4gRnJhbmsNCj4gPiArCXN0YXR1cyA9ICJva2F5
IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZwYW5lbDBfbHZkcyB7DQo+ID4gKwljb21wYXRpYmxl
ID0gImVkdCxldG1sMTAxMGczZHJhIjsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsN
Cj4gPiArDQo+ID4gKyZwd20xIHsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4g
PiANCj4gPiAtLQ0KPiA+IDIuNDkuMA0KPiA+IA0K
