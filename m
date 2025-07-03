Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FB1E1308;
	Thu,  3 Jul 2025 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545771; cv=fail; b=WNqvCoBYw+xxHCdA/v7Qr6WwrgQQmHx88KKUFuO4D1EZudYefAzlFuEe1zK+4+LiOjRYQxg+ZNybvdzUe5OgK7IyJpKWLPkF77ndJMe3MGb3WjYzcWZ9LUE9G2Xsb5uP4aWZfJnteIiynOISRXrZQuucbfZxruj/2748xcGI15E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545771; c=relaxed/simple;
	bh=yGCCbh4KuqUPiKHZ/+Fe0AVejGZinAzNtFFfz80lC7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oLa1T/pnuGAEivGCYmgol2lWcpd8PfZGvBbak8tnnKC/zYIGmiJMtYDPD2SIpZV/IEao84U9JrYTX2aGtBhhgHPgDge9ciF0+LV8mwTe4DWYVNbgnkstNQXpRqIhE35+3JtE9SrnpAUdccSY3lgb311gqOjswLGbBvnwC6rqI+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=Snvf23Qc; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="Snvf23Qc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siaMjFDpfgVgGp1zQ8oeCrsohflpZuwOYT8+hni+Q5LiPEy37TtpWKfI2JdMYMLwQ6VJf5Kr1hTF/+1rVTE/Vet9nL+m+yTZQu/aHlWfqMotuFoKftFkbcYXaP1Y8/5eM5jle1aczyaPudXSd+iq8Y3g6PgJMW5oOqVToUfu2JJ1xTp6Tc7v3rflrqzynXknPm745ho1WUEbDsojJTKHmEZ4D/cHCpKo/ev9Hfa9jg4va9Vj7o3GKyfrDyyUuohMXVktZmnT2V120c3gYB48iq3LXdForK/SsNdRRs4Cg87Zoi4H5Pdwksgjx7SJriOBWzs7JfDSv0HBXEXz1lDC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGCCbh4KuqUPiKHZ/+Fe0AVejGZinAzNtFFfz80lC7w=;
 b=Z5Yu8iSvKjGJYDxbk4QDvTAtgavO5cHEUhq+wovPlOi2WJTsk6Qvm2c+nfjhdr6EvdPKkto0mLQBUfpf7DKq/Z20uVXmo1BJ8cwL1flTg0T/t6R9ptBhQ0jFs1TRoe0k0egHoxa8wX0YBl8387EGQof7J3xJ51wvpGy2i7XkbGRfs9BYgRTJsaAJlh7s9kSp9ITpTqc61aPj1xCtOtAPqVMXKCuCjcLni5AVbcXbEmwbyyXD8o61eHJyHcQl3VuyzwXrPGgIT8ps3dVd9FadF1974/tTafPiHr/wRvqViOi6D8SRDVNrcqTEnHl7RbF1j93A3kw5/XnikYssE9S11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGCCbh4KuqUPiKHZ/+Fe0AVejGZinAzNtFFfz80lC7w=;
 b=Snvf23Qc6Gfig/GlplGz6Dm4jEH14VTGdz57KTwKmKu5ODO2rZ+WqwKkegUo/lconPYncdqDZNgov19JuqqjRMjgwnefDdPE83V2lwUeLD2YUmc9ssBKG9745yA3SqRm6v3QnCwB8Oxoo5qCmOPnQQpqlnC0hLfGukg0LwTXE8o=
Received: from AM9PR06MB7300.eurprd06.prod.outlook.com (2603:10a6:20b:2ce::7)
 by VI2PR06MB9214.eurprd06.prod.outlook.com (2603:10a6:800:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 12:29:26 +0000
Received: from AM9PR06MB7300.eurprd06.prod.outlook.com
 ([fe80::96d6:3806:3e29:9b56]) by AM9PR06MB7300.eurprd06.prod.outlook.com
 ([fe80::96d6:3806:3e29:9b56%4]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 12:29:26 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shenghao-ding@ti.com" <shenghao-ding@ti.com>, "kevin-lu@ti.com"
	<kevin-lu@ti.com>, "baojun.xu@ti.com" <baojun.xu@ti.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH next 2/3] ASoC: tas2781: fix reset-gpio polarity
Thread-Topic: [PATCH next 2/3] ASoC: tas2781: fix reset-gpio polarity
Thread-Index: AQHb6+8wdDGyTCprKkqkastOZc4Cr7QgCh8AgABKO4A=
Date: Thu, 3 Jul 2025 12:29:26 +0000
Message-ID: <72ba4fbe-eb2c-4e8a-8118-9b264af04f31@leica-geosystems.com>
References: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
 <20250703075037.2558549-2-catalin.popescu@leica-geosystems.com>
 <1e08ec21-e863-4720-8604-df0640624a83@kernel.org>
In-Reply-To: <1e08ec21-e863-4720-8604-df0640624a83@kernel.org>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7300:EE_|VI2PR06MB9214:EE_
x-ms-office365-filtering-correlation-id: 30d4d34a-97c4-41c4-0909-08ddba2d3fd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXJ3WDRuM1MzRFVMdWg3NFFuWG1IRngxbzlwbzNJNzVVMEVJaGpvaXdpaDFr?=
 =?utf-8?B?b2R2ak80REVLSnVUVDJqS1ZJMnlnbzZLMmVadnZTTVJXQ0Z4dFhIRmF5QkFV?=
 =?utf-8?B?aytjUDNLNkYwd1Q5NzNqS0J6ZVp2Z2NLUm9Ya2E3WVlBMnMxYWhhRHNlRG5O?=
 =?utf-8?B?Zzc3blExMmtVY3FXRjJwSVZmQzNmU3V3MlpIakdlbWVEeHJJbkxrNXZFK1pK?=
 =?utf-8?B?Uk95ajhoSTlMdEUwRnltMGVxMmNaczRTZERjSjlSYlUxR1lIT0trYXV1UWl6?=
 =?utf-8?B?cEo3bU5Qa2tmMDhsZXNwUFMyREJONEdUMml0cTFxWE5ZMHZFOWYyVUQwV2Za?=
 =?utf-8?B?b3JiRFVIZzR6aHlIcm85V1Y1Y1ZnWTh3Qy9ua1FqbXZObEx5WUZBK2dPRm9J?=
 =?utf-8?B?SmZZOGx1ZCs0K0FMTzBhb2wybCtjL1Z6aXhsK1gvcHZkUHZCWjFXOStFVjBv?=
 =?utf-8?B?QmlFMnNzNDhiYyt0UUd1dmY4T1pkTVFCaDc5eVk3L0hpSjdwa29JdHFya3Nl?=
 =?utf-8?B?V1o5K3lERGgxMlY2WUJ3bjd2d055RGt5aXdRNldwVTMxS0syQngxQVJJVTJr?=
 =?utf-8?B?UVhWRzd5OUhHcHdxR0VvR082eTlwQjFPNEtxVEhyaFJuU2FLRjdBN1BTTy9H?=
 =?utf-8?B?clk2UFdDeXU4allYSGN2NnNDSExqMkh5aXVBRXFJMnRjejFXZ3E4NzVITXU3?=
 =?utf-8?B?amNXdHlKNW1KSEVTS25nUkd0cUFjVzErTHgzeEVPUTA0T1RremZOSXRXc3ZB?=
 =?utf-8?B?L3VBZ0JhaWJZcTczalY0SFlHcm1oL0g3U09RbHBPbG9QZGVYWDBjVE4wenhB?=
 =?utf-8?B?QitiNU5GMm93TkIxeE43aXdYVGlDUm1GdDBIOWQ2TWtXVjNkeFAvOVkyQW5t?=
 =?utf-8?B?MUhxejlmOEpPaDJKSXdOVitmdnhyQjRNazRnUWo4MzBrSlkvM2k0c2RjNFJs?=
 =?utf-8?B?QjU4ZXJ5N08vZGpJelpFMmUvWDNTam1haldzQlByNnFwYXViN3l2ZWlzZGw5?=
 =?utf-8?B?a3JjMVJ2dnR6ZFN3NVczTHh2cm5qbUw0V1FJclRmTVNOK2xOWUphRzFjY2VD?=
 =?utf-8?B?ZGtpN0FEUVdTd05KRWRyZ2J4OU9LU21Lekw1THZQWFMxejArbjhiTzBDb09x?=
 =?utf-8?B?Um1qejRXcDRnTGhKMkdrTXd1Rlppa1hkNS9DVjEyNXFTaWFMeDBOU01xbm5T?=
 =?utf-8?B?UUluSzdOS1JzTFhidVNRWVZFS01wTERMMU83YW80R2xGVnZhWkdTVzlFaVhV?=
 =?utf-8?B?NHJHaERDUm5JMmZSdGdOVUhnbnViZ3VBcEM3T3I2Rit2bWJ4ZElNNmZXQVRt?=
 =?utf-8?B?UUNQc05XVlRKcEJqa0J6MlhjK0xQN2JoSU11aDF1QzZlejh5T1pPY3VxRkVw?=
 =?utf-8?B?THV3a1o3WUdKd1JTeXZzR2JPN0VhVG5MNVBNemYrSkFWSURQZjZYeWlOZk1o?=
 =?utf-8?B?SHRzTTZ5b2FKTCtHdFF4TG5rRGNKZm5vVW9URDhZY3lnTmc0eDMyZGpLdUd5?=
 =?utf-8?B?YncvbjVOSGhqMllCeGo5SFRzdG5RNFdySjJzWjhEd3pTcXZZNG1BZjZpZHFV?=
 =?utf-8?B?eCtPTklTYzNwS2hpMDhjQjlLcmk4SlpVeGs5SlFwMk1iOGJCc3FwdlZUUnVR?=
 =?utf-8?B?WHdHbDFocjM1QzZPL3N5aklEMXRxd2Fob0cwZmtTcW90S1RQY0NXYWw5UnQ4?=
 =?utf-8?B?Tk4zRGw4RHhMaTN1MmZHYmdCVFNucWJHcktpeUhGSWlxbVZEcDhNOXFmblZM?=
 =?utf-8?B?a2hKTmNYQ0N1cVBsVXVEbGIrOFBLK09qOGNYUmhJVkYzZXc2SWxwRnRyQVVn?=
 =?utf-8?B?d0QxeXNKUXhoREJvc3pZb25MNnl6cm1HanJGZmp6N3pCZEFWYVArc3V1dS9k?=
 =?utf-8?B?SkNQQ0dkQW0yNnN1VmhRb3FacW10alh4cXdiVGZ4a1ZUUlZsVnNUWGk0eDlP?=
 =?utf-8?B?VUdPOHFaWVdNeUREdHpLOXI5SlFMMUVUWHFuUjlmaS8zZXVMamNVMTRvdU8w?=
 =?utf-8?Q?9ehEc41gK60D6wkx+rLa1Opz2ToTQM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7300.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjA4ekVPYnJnT1FQamluY1NvWEdJakhkemg3N05iYmFtV2lkMEJoaTlIZDFn?=
 =?utf-8?B?N0d4QVVvcngxWGp1ajBLYzlXT0tidVpOK3VGZDI4SkRqL1p3NDNoK0lJTHJk?=
 =?utf-8?B?Z1hVU0grK243eE9BMk11b0xCelEyUTkrbSs3YUZFVXZVcUNmOE9ReXVyTEZz?=
 =?utf-8?B?TGxnT2dheTV6MnpvUUtJeWQ0bUhxeFVtbjJ4YW1yanF3NzlKanU2NmRSZUZi?=
 =?utf-8?B?Nit4TWZ1RFFJSEdxN3BVTSsramQ2R0M3eG5yVHRQOVYyOGRpZXhwUGdjWEJw?=
 =?utf-8?B?YVdTUUhlOU5uamVHb0R6SDlndXc0bHlyamp5SHo4SndJYjZNcU5jaWptanlz?=
 =?utf-8?B?UlB3WXp6d2RJak84bktaMllKWUFsUTcxNG1TN0srT2tSRWxWSFNNdlM4aXZx?=
 =?utf-8?B?QjdHZGFGL01UQi9BV0lYSVJlYW5pZFpxN3EvUDlOMjVMa0g5bFBBdVNydjNK?=
 =?utf-8?B?bWN4VE43MlQxNVRnVGRVVWVob0V3NkRCTllSMnh4aFJSQVpRdXBEc3BpQWQ2?=
 =?utf-8?B?cTc2bEVyNlI2c0dzWXUzd2pWRFpXazR6QmU3RzdsQTRPNWI5OTNGTTFBM29H?=
 =?utf-8?B?NWhaQ3U1R0g4dUQ4U050eGxQOGtSdnZkZno0SlMyakd5R0hNaDZzQUVWQ2hX?=
 =?utf-8?B?cG1JTmRUMy9MNkFNTGo0NEpwZk9CSGYrb1hxOUhFSkZJNkpLMXNiK1kvRFYr?=
 =?utf-8?B?Q1pVODlIbTczbXN3aWgxaXVGMVEyUktkV20waEhDbW5DdUwzMnU5RHhHUitu?=
 =?utf-8?B?bU5mZDF5enR6a1JKemVvVzR5NDBaaXU1eEFWZ2hZdUorbGJ2empvZy8zMkIw?=
 =?utf-8?B?anJGNFRxVWhHaWg0K1ZsVXVvYmJmcSttNktXRGQzRGZIc2I4QzB6YmRnZUow?=
 =?utf-8?B?N3RoWXdKaVNDUUMrYVMzRDcraXA2Q2tKd2dkVlVEZnp0ZnNlQUduaU9VV2dj?=
 =?utf-8?B?aUN3OTJDVUphR1BuWVBRTGp6NU1UV0hmODFqUVZMTWY2NldZV3c0azQzMVFw?=
 =?utf-8?B?UUlYdkVFb2EzY2lHNFRyL1N6YytUWkNXdmlycTlHTkxYczNyZjVVTlpFdU9D?=
 =?utf-8?B?U1c5TW9yWUh3MWtUbGQrMUplNjBhbUgvUmlGNGxPUm13OHZMbWVYVlo1b21H?=
 =?utf-8?B?SUFiVU9UcG5iWWo1NW01aU5uRUNCcFd2ZllOcFBCN2R0QmMrLytMenpCRGEy?=
 =?utf-8?B?YzA3TXBvbVFMOUxUeS85WS94YVp5WlFUK1lWaDJXR2I1SlYrQitLWlVlaHQ3?=
 =?utf-8?B?cnlyQk5qUHZrSFBLU0pzVllPTG16YTMwQWZieVFVd1VTSTZDblhGdmJpMnll?=
 =?utf-8?B?MnRxR0pQMW9JNXBWZE1SVm50dTQ4MVlSVk5jcHg4bEVacjRGN0ZOdDdFbjdo?=
 =?utf-8?B?WWV0cVowTEd1RlZDbTZ2dytzWUUrU0d0L2tPTGd6WVpDY3o5ZzJpODJOS2VS?=
 =?utf-8?B?S0tRbnRQTjdOYlh6d25VYXp6K1Z0Yi9lMDh4REVWOVhvN09FQ21Ed1ZnVHox?=
 =?utf-8?B?MkNVa1RpbldzZmV0MVBYa2tHekhYUzlmOW5laHFNWW0rMWc0SkRpaTVuNWkx?=
 =?utf-8?B?Q3p6UURyUnZpTFFaK3NwS0VLeVFGOWVlU0NRWVlpdGMyTzdSUFBwRVlIOHp5?=
 =?utf-8?B?VzNJeEZ6NlBDQWVITnFLd2xoc3NKNlB6U0diYVFCRlRDNGNJbWI0aEZ2OWt0?=
 =?utf-8?B?V3VlRlN1T09QRjNybmtJWHBuWW00bEN4djFmMWJTWGlhNnBHWkpwZllOZFlX?=
 =?utf-8?B?U3NTM2VySjh5QTNTMVRtbk5qTlFPQjRCbExlRU9tVTlSSWFvckRJdmZCU0Qz?=
 =?utf-8?B?WW1hVXJ6UHZiU3h1ZmpNby9LcC9BVzBCMlMzcGFGZ2l0bDAzNmtwanVxYmF0?=
 =?utf-8?B?RHdBb0QxaUIydXlxVmNZdUMzYmRsbnF3ZzUzYnpHc21oby9lb0YzNS8vc042?=
 =?utf-8?B?dWNkbExUcnR2QkljRElRT2tCeUdpa2diMnJGNGpkeE0xVy9NVkNyTDJ1SnFk?=
 =?utf-8?B?U29RZnhQNTNFdUhGVGFIYVBqYUdkYlFrUEltc0NrU2cwdEZubWFHQUpjUlBa?=
 =?utf-8?B?SUVuTkVFZHNzRXpPOTlTTExxZEpoc2RpZW9iOU1oKzdFNzk0cVMvQzEwUWNl?=
 =?utf-8?B?QWJYeitIKytxa0xBRTlZVisreWx3WkJxRkZQcHJLSC9BV0dpODc4bGtHcHZ2?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65D9DB459CFC1348ADBFABDF618D98AB@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7300.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d4d34a-97c4-41c4-0909-08ddba2d3fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 12:29:26.3744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDOTGQHbyvmQpIfvVDPW3IpYjvrS4t977MyRKXfgNb9tvRxImOTNqTrWyl9nGeb/B/a6PnkU5WFHygYQNLAVRztmfnBvaUm4anGbE3Hyw7FlEtTvBdm7ePTIJSQJakES
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9214

T24gMDMvMDcvMjAyNSAxMDowMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gVGhpcyBl
bWFpbCBpcyBub3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2Ug
YmUgY2FyZWZ1bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3Ig
cmVwbHlpbmcgdG8gdGhpcyBlbWFpbC4NCj4NCj4NCj4gT24gMDMvMDcvMjAyNSAwOTo1MCwgQ2F0
YWxpbiBQb3Blc2N1IHdyb3RlOg0KPj4gQm90aCBUQVMyNTYzICYgVEFTMjc4MSBoYXZlIGFuIGFj
dGl2ZSBsb3cgcmVzZXQsIHlldCB0aGUgZHJpdmVyIGFzc3VtZXMNCj4+IGFuIGFjdGl2ZSBoaWdo
IHJlc2V0LiBIZW5jZSwgaW4gb3JkZXIgdG8gZ2V0IHRoZSBjaGlwIG91dCBvZiByZXNldCB3ZQ0K
Pj4gbmVlZCB0byBsaWUgdG8gdGhlIGRldmljZXRyZWUgYWJvdXQgdGhlIHJlc2V0IHBvbGFyaXR5
LiBUaGUgcGF0Y2ggZml4ZXMNCj4+IHRoZSBkcml2ZXIgc28gaXQgY291bGQgd29yayBubyBtYXR0
ZXIgdGhlIHBvbGFyaXR5IGFuZCBsZWF2ZXMgaXQgdG8gdGhlDQo+PiBkZXZpY2V0cmVlIHRvIGRl
ZmluZSB0aGUgY29ycmVjdCBwb2xhcml0eS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDYXRhbGlu
IFBvcGVzY3UgPGNhdGFsaW4ucG9wZXNjdUBsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4NCj4gVGhp
cyBicmVha3MgYWxsIGV4aXN0aW5nIGluLXRyZWUgYW5kIG91dC10cmVlIHVzZXJzLg0KPg0KPiBE
VFMgcGF0Y2hlcyBhcmUgaW5kZXBlbmRlbnQsIHNvIHlvdSBjYW5ub3QgZml4IGluLXRyZWUgdGhh
dCB3YXkuIEFueXdheSwNCj4geW91IGNhbm5vdCBmaXggb3RoZXIgdXNlcnMsIHNvIHNvcnJ5LCB5
b3UgYXJlIHN0dWNrIHdpdGggdGhpcyBvciB5b3UNCj4gbmVlZCBzb21lIHRyaWNrcyAoSSBvbmNl
IGRpZCBmb3IgYSBxY29tIGNvZGVjLCBidXQgSSBkb24ndCBrbm93IGlmIHRoaXMNCj4gaXMgcmVh
bGx5IHRoZSBzb2x1dGlvbiBhbmQgbXkgY2FzZSB3YXMgZWFzaWVyIGFib3V0IHRoZSB1c2Vycyku
DQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoZW4sIEknbGwga2VlcCBseWlu
ZyB0byBteSBkZXZpY2V0cmVlIGFuZCBzdGljayB3aXRoIHRoZSBjdXJyZW50IGRyaXZlci4NClRo
eCBmb3IgdGhlIHJldmlldyENCg0KQlIsDQpDYXRhbGluDQoNCg==
