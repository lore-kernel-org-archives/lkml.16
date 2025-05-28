Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2120.outbound.protection.outlook.com [40.107.249.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1143147;
	Wed, 28 May 2025 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457057; cv=fail; b=NHP9VA+rosuEenhwFbW+XDvIxsp0cLm03xopvOwoJjf7GaD/c+4HLKjPiteY38iFWwwQdWRw6cZ2Ryl035M4uHypTgkyIlnuIoxOz/4L7nqDqx5/IDMRVPIhZFxmWhf+e9YCxfUN0SfEIoEO7CoWT0lA23sgj40A49DGNZ+vysI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457057; c=relaxed/simple;
	bh=IxfDTGCpGVLB+ehDE33Cz410rqNpJnpddBaXX0PHess=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R99fCNMjpLpcF66Jndt4bC/jhd3kPI1ymJkzFZtKC8B183g9x1kOWcL4Es+4N2a5gSDOYfFtyVoR+OSx7PLOlHYuAvsUzEEhwcKgXJgpWuEQXtS0MhaUwAY8JywzYNGorlFuLN+5c8QbZgx2vvDA7cBLPogA8GJ8nBR2rY6h7hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=dlK0EZsr; arc=fail smtp.client-ip=40.107.249.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="dlK0EZsr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2oiVrhZd3iIRuGn3Ud6YGcbs/0s60fzPSvQHjHJfnkdpsLyBnxhixX82F+y9xPY49hVBh8ei0GndB6VRLQFt66ejjQMlebD5IQBUPHhdC7EurRHzv7/TyJUkm0Yaalx8xx+ao+bdszUqSSUhi09+3d5nIqEEwLjvJLXSh8UsKmnbSYjW3viPYmhjC8fbu05sp1B9uyGkvLxrXKLM9KPrwBijUxg2b0EL30wtxWi4cF8rXFCX60Iwo1VSKd7WX4K8chuRCobgc1lc+/Bp0/TtscfIFXrk0i14ib23+YWz1wThHEE74gSXWppB7EGz/emEWBqV1LI4x8RS0ilgZO33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxfDTGCpGVLB+ehDE33Cz410rqNpJnpddBaXX0PHess=;
 b=goc6moljtSdypsgZhNzDdbBXhj9NrTRnj+u4A5hpFq+RGWffVmuxm8nkvE6zw0bl0bM8LKToY+Vbgz8zrHss4pFa0bW7phYOfS7har6ZVg2uZ+4OfkW3rWY2q9dGMYxvXtbPzVj8ybkKhQUT/SyOFe4hjfJypx4DD3i9Ubn7KRXdYJbISkslae9sOTTlnKxTH+fN27NvOtZeXGZ/B8vCUruTagAFVVroGooTO7MamJJHAkGWi2fvzL8JumCKKLuNpExG1hRWPGN8oJNQDIr/DcqLo1XZgyD3+isi0rRO6gHk/DZIycBVTPT04LQzxhA6JgrmoeGL2bAdlxuEyyA9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxfDTGCpGVLB+ehDE33Cz410rqNpJnpddBaXX0PHess=;
 b=dlK0EZsrgqRLO2uI5tNmTXrEWdFKaRpLgcTAwQII0eJ3wwMjNZCA9IoMtmbo5wDIewIZtzLLy6buS4+a5pV5m47TvG5HLBpIveOzgfyvBemv9qwCNYWlbAPUGnSegh9UR4tBOAz8i40iVG4Ygdu7goYkOSPDKjqAQn1zFF01oyBlAG9qGJeYjm3j5c0/HlhPfS8w2FMLHk+TX3CknGl4IC9i2jLzqcu3FbPbjRxf+OUbR231jO670brKgm8DnM9WibYee2DOmB3lfoTPwUwFTHuFJ+yhkJkaknQpYUatmk3GHsaGX0KUZ77NYqlXMdOEImnd0O7j0TJrUcfkywBybA==
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b7::25)
 by PAVP195MB2260.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:2f4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 18:30:48 +0000
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59]) by AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59%3]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 18:30:48 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index:
 AQHbzJ5IkKiCUrqPH06p42f/+549BbPiDcKAgAJsSwCAAChcgIAABDUAgAALOQCAACRcAIADjdKA
Date: Wed, 28 May 2025 18:30:48 +0000
Message-ID: <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
	 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
	 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
	 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
	 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
	 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
	 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
In-Reply-To: <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0257:EE_|PAVP195MB2260:EE_
x-ms-office365-filtering-correlation-id: 067db444-f2a9-4a11-e848-08dd9e15c497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RldyZkpXMFhIWlYrUDhOQmNhWElJUGozTlZRRXlpVGcycXNJNmkrNVNIUCs3?=
 =?utf-8?B?WWF4ay82ODQrcFhxeUhXbVp5Qm15TEZ0R2Rydis1YVlFRXIrY0w1c0FTWDdI?=
 =?utf-8?B?a1plbG1XbXoxcjdTd0QyVzZDNHY5cU5sTlFvRW1Qa0U4bS9RYzlnRnZhMWhj?=
 =?utf-8?B?RnVuelg0a29DQXRxcFFwM0xESTVwS3M3ZXprM2gxb3pPOHFicWVmNlhhZXdL?=
 =?utf-8?B?Wk90N1k3bHlNaStheGxjSjUwOXBtTWZSMVJhNWlFZWpScHM5QUJXaGd0aVZw?=
 =?utf-8?B?VWpER1BybU05RC80eWtuR3IvYVF5a2dmMThnMk4wUm1ldnArWmQ4Tm9RdDRS?=
 =?utf-8?B?VkVPYlFpbHRaZG5TcHZIcDRoM3ZRUjFSNlFpeVhYNXZUV25uU3o0VWVxRFEr?=
 =?utf-8?B?Qm9qaWlMNHVMMUxnWXROUC9kS0lqa0lnczlheHhYYU5oYWYyUzdlMXA1Y3ZQ?=
 =?utf-8?B?MG10MXdzTGxPSkFNLzVTMkd3QTJoRUxuYklpdzVDeHhEVVdzV1BiWmIzcFNH?=
 =?utf-8?B?SU1NczE4TWdPKzU1QzB0T2VOOXNtb09NZU1mZk83OTNBTmphUEhFWWUxS2dw?=
 =?utf-8?B?cGtBUjRUWEVhVHc2MHZaQ3ViU2VJK2hCMEdsN1ZFUXFYN3Y2MlZ5anBQZUp0?=
 =?utf-8?B?bzFoOWRnc2FNaTZVUWxFWGNZcTIzVUpBSzFhVXRIUCtnWmxuY1Y3VWhLendN?=
 =?utf-8?B?bExUbjRvNmM1MmkwRDUxK1QwSjVJL0VLQmprR2xOS1BhRU04ODZMZFRFU2Jl?=
 =?utf-8?B?SURCb0tCYmVtQXFCWVY2M3JGd0lrQTZ0Z1ByUVRKeGl2a2w0S1lWdU1EbTB2?=
 =?utf-8?B?V1RLMVN3SWluUXdaOWU2di9FalRxd3ltVi96NEhuWDlBeW1MNUtFZ3NLbVZp?=
 =?utf-8?B?aU5yMHNtYTZ2b1BnZWsyRVRJbGp6RmJRZ0pxc1ZlbzR3MUs3MUFucHBxREpP?=
 =?utf-8?B?VFpTZ0NiRCsvdjFUbG4yTVlFdDZVbmhTMHdSSzBUQ0tlNXI4MFR0dGZEdkF5?=
 =?utf-8?B?R0x2Q2ZVYmY3WWFlbXBlTDkvcVBMTnFSRURCUHU0Q2FZbkFMOGlFMWZadldv?=
 =?utf-8?B?UTJlVHFDbWFSTzBpNGplV3M5bUdwQjZjVUU4ZmxHaWdKeDNZT2dzRVI0VzNB?=
 =?utf-8?B?cU5YWms3UlJWOEZxQ3k5ZmhJWEpnNkcwdTBwcXhiOTc0WWVIczEvcmkzTmYv?=
 =?utf-8?B?VFpLSmNEMC9sKzhNbWJ4MjJ0RlhPclhBNEdQalBCVFcwTTlWUTVXd0lnaERj?=
 =?utf-8?B?UWlKWm42RURaMURsNDJQYm5VeW1udlc0OHFWYU4wTlQ3d1poaUUwSUJHV09j?=
 =?utf-8?B?TldOOVZzaCtPYzIxN2xlZFRaNllUR1c4R2FsK2J1OTlBOU9MZVBLQmxIQ203?=
 =?utf-8?B?c2FFMDVFaHlGR0pDNHcwZzdKeVlJTTJkNFdnUUpQTlRhM29vZk9tTXFOdk55?=
 =?utf-8?B?WWhKTERhM3UyU1k4T1pGblBVd29wMlZSRTNySk9kRE50dzBHMFdIUEJtd2hV?=
 =?utf-8?B?WG9aZ3ZjeXhiRzF3MExtSGpaTjdDN1FhQmsrMFdqN09jMFJFZHdTV1VZYkZS?=
 =?utf-8?B?bVhiK3RBVHJNR0hicVd5UzBpdVg3SlgwN3RzN0p2WDc0WHVUN1RhMENGc0Jk?=
 =?utf-8?B?NWVBMFZISzJmK2hVMXFpRkIzMjJBWTlVLzZETGlhRU1vVGdxVVdNZEhSNjgv?=
 =?utf-8?B?YWlkejBTcnBLT3dJSjB6SENIaG9scDAyRVR3R3M3bUViNFo1ZVoxUUpZekFF?=
 =?utf-8?B?bTUwODgvQXg4dGlTdFZaTCtFamRiUDVzMXlTUUhFNzduYjY5M2ZFeDM1R3hi?=
 =?utf-8?B?aDZOckU5TkROQ2Q4aXA3Tk44bnNHRDVUaCsxbXZEWG95SzBOK0hmSWlBMHBh?=
 =?utf-8?B?MEdHdHFIVmhqTDZDci9zQkp5TXdYZ1VnV3lFSTRxQXVaSWdQNVhaVmFtbWV2?=
 =?utf-8?B?UnBDTnlyWmhydFpFeXJFRTZrakZMZ0Q5bG0vaWtKeEJZWjVBcHB1bEoyYlNJ?=
 =?utf-8?Q?7IOfEbhcO9BYxdydMvcJ4DWs1y810o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0257.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TE5mc0hDL0kxNkNnc0RabUNaT0NJSGFCMWpUeTBneVpXNktIWEdCdGpwc3N0?=
 =?utf-8?B?WU9ZRzBmQ29mTkRWbW5POFlFWU9rQXZZdEVUZmUzN3BodmFTbVhSdmFqN0g3?=
 =?utf-8?B?WG5NSk1pSk5ZQitTQUZoMEJlc1FVTW1tQW85bnl2QTFJV1l5eHhqbzhRbjdh?=
 =?utf-8?B?YUxyRE5XTzJ5YzArQ05DTjRYRlVjUStaZWFMWXVZV01aNy9DQlpucXhIb25l?=
 =?utf-8?B?cXdIVTZuTnlZR1QzZ2pNTU1yVEIzNWZycFFWaUoyRFVHT3o2SDdvQmNwbzZ3?=
 =?utf-8?B?VEh2K082SUNZbTI4QWloRXJWaTNSSGJqSmxFZytabmVlLzVnZXpxVTdzdEdp?=
 =?utf-8?B?VVp5Q0ZVMS8wU1JJSnUwU0hvOWcrem5wc3J1SUlVZVBjdGw2Z3ZiZUJGbStt?=
 =?utf-8?B?TkN6dVJuUW9RTEl5TEFBc0plTGQzeDFBTFBmSmlmMDlHMnllbDJZWDdlQzRa?=
 =?utf-8?B?Rk1MY2xnbjhrZG9Tb1A4ajFaVjVHeU9Bei9jdjFseHFaVzRvWHNmUGpOU2h2?=
 =?utf-8?B?L0lVUFJxY0ZlbGt4QzgwNEZGVmRzRjlHaHNLWTE0M1BSQnhvYXhJc2MvdXM0?=
 =?utf-8?B?Z0FZL0xBbjZpejBnSVQ4bU11TjQ1NHVXRXFmWkt6QjRNR3ZQQnE2cGNKU0FT?=
 =?utf-8?B?b2MxWU92eWdpUWhkRjVDSFNvOWVVRUtVMzlIZjJ1QnZWdk5tTXV4OXVsdm1Q?=
 =?utf-8?B?OTE2WVloZ3BHRlRTRjJDTHdqUkhuMjhrcjVEMTFPbDB4em9vV0dpYmZLSyt5?=
 =?utf-8?B?VDFZTU1TMWlaYzhEYnIrMGh3Zmx0NmN3TmpjYUJtK2c2dHlTVEpTRCsyaUhi?=
 =?utf-8?B?eHc5d25BZ0ZESUZiWXdkcDMwV3pOQ1lkdEZpSUIzakpPc04ydmI5TTZ6YWM2?=
 =?utf-8?B?a0p4Slk4eGlzd0NpZ0F6NmNZVElWeitpcXQwT25QSlhlTEVEZmRmZWZ3YTd3?=
 =?utf-8?B?MDJUeGQ2U1hCVnZNdlFjQ054ckNKT1ZZSWJqWVh5cERrQkJKZ1AwOE1DTWhw?=
 =?utf-8?B?U3hkOWZXa1pTelY5Y0s3TThaWkNjU3d1M2VyV0pRYVdqTlNwdFZIM0pNR01a?=
 =?utf-8?B?cDdEZ3VvTnVCL0poNlVtOG1tcDJKTGVLa2YzT1MweVlvSEZhaVV2UlhtSmpP?=
 =?utf-8?B?dHVhK0N3NlEzaGxqWitjbnVQUkpkUUFPc1lLWlBFa1JZUzdHMHcwaDNyMElN?=
 =?utf-8?B?NlZibmJWUmZLdnZRcUpVaC9ONi9LeFhaakZkR3liRTFUMDVMaXZMYUFFamFZ?=
 =?utf-8?B?OWJlbXU3U1hGTFZoc3dtSFcyRVAwN1lrRTdCNEl1V0JrQUJUdkM4QWtieDlw?=
 =?utf-8?B?VTJRZUxOV3pROXVhVURPUENmWEg2Q0ZGZUg1UElrdkIyU2VNdXIwUVU2S3Nt?=
 =?utf-8?B?ZFFEdDdwdmEwU3cwczQ2cjNEWnVtczRLWkc1K0lnUWo0L1l2b1RsYmQ4TW1Z?=
 =?utf-8?B?T1k3dXNocUxGRUs2WDJ5S1Urd3owczhvQWlWbDJNakpWUnExa2xrMnNSaURM?=
 =?utf-8?B?empHQnVUMVpYMGR4cU9pcHR3NGlMRDRCZ2tUZllwaUg2MXJNbFptc3NBMm1P?=
 =?utf-8?B?bjVOS0ZCbUg1Vk5wc08yV3RxcVZ0V002TjUyTEt0UFAvOTJIT3M2R0VBcFBO?=
 =?utf-8?B?RkE0WDRJQ2JIY3NYYWc2STV2amVWNHN0RzBxN1B5NXFVQ2RGdHdCbHZDZW9z?=
 =?utf-8?B?UTZQTHB3UHlUZnFzdkpkeUJ5VXIrSkFrSFV2TTZuUWw1ckxINENreEZBTWFj?=
 =?utf-8?B?ZWtlV0NFbkdaU1p4WHB2N3VDTk12Z0h2ek9PYXExUVZEK1pSWE4xQTlySEhv?=
 =?utf-8?B?bmFzVDdDT3duQktUMjVNdnVQcklaTi9hVlZLb2Nzd3Nha2hsVENRS3VEMnhU?=
 =?utf-8?B?MXJZaUw0c3Nxc3ZOeWdoM24wVlNXU2dCc2FwdGpqMFprUE5TaEdXbU9acTFa?=
 =?utf-8?B?RTBOcS9uWGFIQmtoREhNbndDZ1MrNTM3ZEg4ZTdJb2dHRlJvRzNSS0pZNzJV?=
 =?utf-8?B?VlNtZ2YwekhWMFpQK2lQWkJEc090aUg0ZFhnNktON21pWDEyMk5FenZNN2ZV?=
 =?utf-8?B?LytDN2pxZzI3c2o5SlgrS3dvREtaU0xoSzVKMDE3QUpjVnpUN2VEMXhDbzlp?=
 =?utf-8?Q?s797221e9M+owyKABrFxGQ5bd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95ADB2AD62867D4E8FE6E26697DB761E@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 067db444-f2a9-4a11-e848-08dd9e15c497
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 18:30:48.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oktuFis8N++q/j1GhqIrfDFulp77PNVaRZWn3pZs9j32Zh+ty6HmxFhYjVEDkRfWpaAIdFdb6ewzKkd1RifQpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP195MB2260

CgpPbiBNbywgMjAyNS0wNS0yNiBhdCAxNDoxNCArMDIwMCwgU3RlZmFuIFdhaHJlbiB3cm90ZToK
PiBBbSAyNi4wNS4yNSB1bSAxMjowNCBzY2hyaWViIENocmlzdG9waCBTdG9pZG5lcjoKPiA+IE9u
IE1vLCAyMDI1LTA1LTI2IGF0IDExOjI0ICswMjAwLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+ID4g
PiBBbSAyNi4wNS4yNSB1bSAxMTowOSBzY2hyaWViIENocmlzdG9waCBTdG9pZG5lcjoKPiA+ID4g
PiBIaSBTdGVmYW4sCj4gPiA+ID4gCj4gPiA+ID4gT24gTW8sIDIwMjUtMDUtMjYgYXQgMDg6NDQg
KzAyMDAsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4gPiA+ID4gPiBIaSBBbmRyZXcsCj4gPiA+ID4g
PiBoaSBDaHJpc3RvcGgKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQW0gMjQuMDUuMjUgdW0gMTk6NDQg
c2NocmllYiBBbmRyZXcgTHVubjoKPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtcGh5Y29yZS0KPiA+ID4gPiA+ID4gPiBzb20uZHRz
aQo+ID4gPiA+ID4gPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtcGh5
Y29yZS1zb20uZHRzaQo+ID4gPiA+ID4gPiA+IGluZGV4IDg4YzI2NTdiNTBlNi4uYjQ4MTA5N2Yw
OGE0IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDkzLXBoeWNvcmUtCj4gPiA+ID4gPiA+ID4gc29tLmR0c2kKPiA+ID4gPiA+ID4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLQo+ID4gPiA+
ID4gPiA+IHNvbS5kdHNpCj4gPiA+ID4gPiA+ID4gQEAgLTY4LDYgKzY4LDggQEAgbWRpbzogbWRp
byB7Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqAgZXRocGh5MTogZXRoZXJuZXQtcGh5QDEgewo+ID4g
PiA+ID4gPiA+IMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1j
MjIiOwo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgIHJlZyA9IDwxPjsKPiA+ID4gPiA+ID4gPiArIHJl
c2V0LWdwaW9zID0gPCZncGlvNCAyMyBHUElPX0FDVElWRV9ISUdIPjsKPiA+ID4gPiA+ID4gPiAr
IHJlc2V0LWFzc2VydC11cyA9IDwzMD47Cj4gPiA+ID4gPiA+IElzIHRoZXJlIGFueXRoaW5nIGlu
IHRoZSBkYXRhc2hlZXQgYWJvdXQgbmVlZGluZyBhIGRlbGF5Cj4gPiA+ID4gPiA+IGFmdGVyCj4g
PiA+ID4gPiA+IHRoZQo+ID4gPiA+ID4gPiByZXNldD8gVGhlcmUgaXMgYSBEVCBwcm9wZXJ0eSBm
b3IgdGhpczoKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IMKgwqDCoMKgIHJlc2V0LWRlYXNzZXJ0
LXVzOgo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4gPiA+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqAgRGVsYXkgYWZ0ZXIgdGhlIHJlc2V0IHdhcyBkZWFzc2VydGVkIGluCj4g
PiA+ID4gPiA+IG1pY3Jvc2Vjb25kcy4KPiA+ID4gPiA+ID4gSWYKPiA+ID4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoCB0aGlzIHByb3BlcnR5IGlzIG1pc3NpbmcgdGhlIGRlbGF5IHdpbGwgYmUKPiA+
ID4gPiA+ID4gc2tpcHBlZC4KPiA+ID4gPiA+IGlzIGl0IHRoZSB0aW1lIHVudGlsIHRoZSBQSFkg
ZmluaXNoZWQgaXRzIHBvc3QgcmVzZXQKPiA+ID4gPiA+IHN0YWJpbGl6YXRpb24KPiA+ID4gPiA+
IChkYXRhc2hlZXQgdG8gY2FsbCBpdCBUMiAicmVzZXQgdG8gU01JIHJlYWR5Iik/Cj4gPiA+ID4g
VGhlIFQyICgiUG9zdCByZXNldCBzdGFiaWxpemF0aW9uIHRpbWUiKSBpbiB0aGUgZGF0YXNoZWV0
IGlzCj4gPiA+ID4gdGhlCj4gPiA+ID4gdGltZQo+ID4gPiA+ICJwcmlvciB0byBNREMgcHJlYW1i
bGUgZm9yIHJlZ2lzdGVyIGFjY2VzcyIsIHRoYXQgaXMgZGVmaW5lZAo+ID4gPiA+IHdpdGgKPiA+
ID4gPiAybXMuCj4gPiA+ID4gSSBkaWQgbm90IHVzZSByZXNldC1kZWFzc2VydC11cyBmb3IgaXQs
IGJlY2F1c2UgdGhlIGZpcnN0Cj4gPiA+ID4gcmVnaXN0ZXIKPiA+ID4gPiBhY2Nlc3MgZG9lcyBh
bnl3YXkgb2NjdXIgbXVjaCBsYXRlciAoSSBtZWFzdXJlZCA0MDAwbXMpLgo+IEp1c3QgdG8gYmUg
c3VyZSwgZG8geW91IHJlYWxseSBtZWFuIDQwMDAgbWlsbGlzZWNvbmRzID8KPiAKWWVzLCB0aGF0
J3Mgd2hhdCBJIG1lYXN1cmVkLiBGb3IgYW5hbHlzaXMsIEkgYWRkZWQgc29tZSBkZWJ1Z8Kgb3V0
cHV0cwp0bwp0aGUgcGh5IHJlc2V0IGFuZCB0aGUgMXN0IHBoeSByZWdpc3RlciBhY2Nlc3MuIEFu
ZCBhcyBJIGNhbiBzZWUsIHRoZQpwaHkgcmVnaXN0ZXIgYWNjZXNzwqBoYXBwZW5zIHdoZW7CoHVz
ZXJsYW5kIHNldHMgdXAgdGhlIG5ldHdvcms6CgoKICAgICAgIFsgICAxLjcyMzI5OF0gREVCLVBI
WTogbWRpbyByZXNldCBleGV1Y3RlZAogICAgICAgLi4uCiAgICAgICAuLi4KICAgICAgIC4uLgog
ICAgICAgWyAgT0sgIF0gU3RhcnRlZCBOZXR3b3JrIENvbmZpZ3VyYXRpb24uCiAgICAgICBbICAg
NS43OTI3MDVdIERFQi1QSFk6IHJlZ2lzdGVyIGFjY2VzcwoKClRoZSBjYWxjdWxhdGVkIGRlbHRh
IG9mIDQsMDY5NDA3IHNlY29uZHMgZml0cyB0byB3aGF0IEkgbWVhc3VyZWQgd2l0aAp0aGUgb3Nj
aWxsb3Njb3BlICg0MDQwbXMpLgoKUmVnYXJkcywKQ2hyaXN0b3BoCgoKPiA+ID4gPiAKPiA+ID4g
PiBBbmQgd2UgaGF2ZSB0aGUgc2FtZSBmb3IgVDQsIHRoZSAiUG9zdCBwb3dlci11cCBzdGFiaWxp
emF0aW9uCj4gPiA+ID4gdGltZSIuCj4gPiA+ID4gSXQgaXMgZGVmaW5lZCB3aXRoIGEgdGltZSBv
ZiA1MG1zIGFzICJwcmlvciB0byBNREMgcHJlYW1ibGUgZm9yCj4gPiA+ID4gcmVnaXN0ZXIgYWNj
ZXNzIi4gQnV0IGFsc28gaGVyZSB3ZSBqdXN0IGtub3csIHRoZSByZWdpc3Rlcgo+ID4gPiA+IGFj
Y2Vzcwo+ID4gPiA+IGhhcHBlbnMgbXVjaMKgbGF0ZXIgLSBhbmQgdHJlYXRlZCBpdCBhcyBlbm91
Z2guCj4gPiA+ID4gCj4gPiA+ID4gRm9ybWFsbHksIHRoaXMgbWF5IGJlIHZhbGlkIHRvIHNwZWNp
ZnkgdGhlIDJtcyBhcyByZXNldC0KPiA+ID4gPiBkZWFzc2VydC0KPiA+ID4gPiB1cy4KPiA+ID4g
PiBCdXQgc2luY2UgdGhlIGZpcnN0IHJlZ2lzdGVyIGFjY2VzcyBpcyBzbyBtdWNoIGxhdGVyLCBJ
IHRob3VnaHQKPiA+ID4gPiB3ZQo+ID4gPiA+IGNhbgo+ID4gPiA+IHNhdmUgdGhvc2UgMm1zLgo+
ID4gPiA+IAo+ID4gPiA+IEFyZSB5b3UgZmluZSB3aXRoIHRoYXQ/Cj4gPiA+IEkgZG9uJ3QgaW5z
aXN0IG9uIGFuIGFkZGl0aW9uYWwgInJlc2V0LWRlYXNzZXJ0LXVzIi4gVGhlIHF1ZXN0aW9uCj4g
PiA+IHdhcwo+ID4gPiBtb3JlIGFib3V0IHVuZGVyc3RhbmRpbmcuCj4gPiBHcmVhdCwgdGhhbmtz
IGZvciB0aHIgZmVlZGJhY2suCj4gPiAKPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IENocmlzdG9w
aAo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gPiBBbnl3YXk6Cj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgIEFuZHJldwo+ID4gPiA+ID4gPiAKPiAK
