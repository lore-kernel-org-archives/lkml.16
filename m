Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020122.outbound.protection.outlook.com [52.101.69.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029593594E;
	Sat, 14 Jun 2025 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.122
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910888; cv=fail; b=d1OemXPNtF+/NAEgz+f49+AzOrKNzMBNUz1Xy0FlVFbz0c9JCYIBJ0LFKPYwZejrvVZypy8ynYSPHLgDNXLoj/Y5/VAhBj1MJ7qMRHiOSnfg1ia+savipjoOfbaZq07ai1Ha0Oi5tdXCjyTvX+AM46dAgNgpGenwo2g3A5SmvkQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910888; c=relaxed/simple;
	bh=qEnTtwRvAeIMNS5bbQCPbcpWZTBMQuMykLP6XR4eEvk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ccnJ6F3PjL8JuZxMg3PvKl7H+j9sEyPdkLzTZel1kuK4Te5+wQKcUyargWRUdjzNZGLyG/g0s5yvV3tW4Cvfojtn/Cg5IZKEt24GOykNHnrlIxNJa2csr1XiFrPXu8qn4RCO36x4kSFw68qN4t99PVwxN6Mn6R0zDiO/q0cPPZY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=PweWNRlP; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=PweWNRlP; arc=fail smtp.client-ip=52.101.69.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PweWNRlP";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PweWNRlP"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AQjoJqB+1YA0hYNdWfz0zIVy73tyYnKGCE9wGLeHwC9JtdHZwZYM8XeGjaKLTbktjrQbvVCLaSxjd0ElIcdZrf/LhzV7QDJrL3Ejjl5EN34SQEwR3VLE6oc83S90WSMOsXyUi2H56b2OG86vt7H47O6cJk3ppjMDQ45fp89hbMozpAWfdkv5r3zpCVM3IRCbfn3sS9Qd7w4E5YVcrNdEbzSMAmr7RgqUIlZ9IP/i4dyTdekoIm0rQkEb8U1j/dKYaXuOnYuaTCk/0fBxvcDRDeLOWxqTbcj7/B610gEGVSlahdEQVTzzdCuMTREy27D1NyI/OTYWUkqXLhSgKzk6kQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gfr13J+SkpCo7Oc+u65kduTi9Ccd1AsYyE7Vn9htes=;
 b=UED9RzdeGgHiHj7fYojJny+FOZm/I1unU/vVgKYoDY11ui996vwOdmbIDyLHZvCDLpEmwI/Cr+JybbGKyTvPybzbk/a1ir2MVjs+EYDcXh9+V+rp/l8B3w4Gx0xomp7cg330HvriFQHKSK6W8TjHcLRzIcUVgROAkhmWK1TDk9OxG5lJwDQhmPMMS+/HvFdJhrg36Sv9K6GpTK7aWkujAllgUkM6dsyJupUVhqYDHzTIMKw+kSpa+gu7WDHmHZ9ow5dXWnLQ3LOhw6qZtPkIxtB49cxt4A0F+apN/Mc3EWTDJ88cfp2Mq2kBlPvDpPLOVhMreXYhn9pDNJ/1jwxrrQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gfr13J+SkpCo7Oc+u65kduTi9Ccd1AsYyE7Vn9htes=;
 b=PweWNRlPu4JZM/uG4zHTpZSczl7RbbcemX+0fB/wwqh89GgN6b9UYLckpubDu3q9867Ep1009O7AW4gRvo3j8pQIF3x4Pq2lwqfjRtiSKqjWKp99x6tWka45dnsUcrfWsx6T3QRQHCksBrA03NmiwyggPt3KvuewRZDeEtjVID8=
Received: from AM6P191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::15)
 by AM0PR04MB6947.eurprd04.prod.outlook.com (2603:10a6:208:18d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Sat, 14 Jun
 2025 14:21:23 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:209:7f:cafe::52) by AM6P191CA0038.outlook.office365.com
 (2603:10a6:209:7f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Sat,
 14 Jun 2025 14:21:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sat, 14 Jun 2025 14:21:23 +0000
Received: from emails-8145592-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-176.eu-west-1.compute.internal [10.20.5.176])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id ED0B97FF0C;
	Sat, 14 Jun 2025 14:21:22 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1749910882; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=2Gfr13J+SkpCo7Oc+u65kduTi9Ccd1AsYyE7Vn9htes=;
 b=MT+eaBVUTg5KVF/IDFux+Fd8fu96+MStRU+RrFlG6OQjOD6wBpCIKr97h/TFp5PkS6Rf/
 wTacoVqd7PUctcsaM+lnYUEBG02/L0IBkEW6SNZ7rzVO2LLlHA75zyVGE9G3hHm4tJkSgkW
 FrwIGbYrAK8EzujXf3/bFf8+e3aoEok=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1749910882;
 b=P7ojtmOJYjzeZr4xALFbIH7lREqkThebEE822+8TurADKucZjSw9bYjVCgIfzaNpXsoUE
 nzHY47ilxVT4SC/3b1XxB/JaD5+FXIBwUSl9rMfcVNkuynVVg1wwSsKmS6Fzjens9CKN/r/
 IB4EO4FWTNAz/Na3vvQqynsK9hgFBDk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJrEGBih5DI9KndQ/MxMjy4rthJVmemocik6+HAW5Dfy180RPs46VikHRiF11YEIPHqFdHEqkys6buiCkSxiS0xR2hIrmLsW7jQEWzmdP5TejTtg+YPLHJzZD0RiNWsRx+PN6EVV3RJUzATPYEuMpGTQa5Zgf4okIATTuH/zOm1oI4D5w/wf4baOnHfE3elnO1QnCJoMCKOt2zdZS60Or3goo4w3do2v2HWpicwMK+2KQ85sJKGr2JBJosUGU8kMZI+H/KYJFk9OKRcFKUx7DQkt+gCkhjGmBcuZy9ZFjAa4NjK8pYTLU1EE3jtDj1hjLqqy2ij8Igsx56B7qzq3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gfr13J+SkpCo7Oc+u65kduTi9Ccd1AsYyE7Vn9htes=;
 b=oZCMUY9nC0Bw8gPdgESYNYkEoSnyW4qD/DbBykvMyjD8fkmAk2TZxD2sU3U6S/LuN/wMUuGANPfpdABKfSfc41AMMNDsRgQ03v5CdywnDNhZQFrLZ2QM65mdRC4kFBLdMEM1FKaStat+omApc+xmsVWUeBGj1WKdoU3EtKjL+LjUmoToUmc0Nb4C5eBzPT7wiMqh4AG0akP+bFotF8IWYz9aCQ82GRs/K7WvLa4D8OO3vYqjKlD+XLAop+t7J4t2mdcy9BbY8i+kD9PD+8siEsz4Jm0/ISXRWMcqYhGkZxSgQ/QS2pTX/cudgVq0jLxwwLhS0s7EwoydDjDpxmswlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gfr13J+SkpCo7Oc+u65kduTi9Ccd1AsYyE7Vn9htes=;
 b=PweWNRlPu4JZM/uG4zHTpZSczl7RbbcemX+0fB/wwqh89GgN6b9UYLckpubDu3q9867Ep1009O7AW4gRvo3j8pQIF3x4Pq2lwqfjRtiSKqjWKp99x6tWka45dnsUcrfWsx6T3QRQHCksBrA03NmiwyggPt3KvuewRZDeEtjVID8=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by VI0PR04MB10174.eurprd04.prod.outlook.com (2603:10a6:800:243::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 14:21:10 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%5]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 14:21:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Jun 2025 17:20:56 +0300
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add bindings for SolidRun
 i.MX8MP SoM and boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-imx8mp-sr-som-v1-1-3ca3269883c4@solid-run.com>
References: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
In-Reply-To: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TL0P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::17) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB7586:EE_|VI0PR04MB10174:EE_|AMS1EPF00000048:EE_|AM0PR04MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7b75fe-53d2-4955-579f-08ddab4ebd99
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|52116014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dTdXd2dCVjNIVS9GeG4ySlh4SDBoODI4anhyUjZxME1La0ExRHF2S05iRkNL?=
 =?utf-8?B?WjhseXowUEF0dGViWTRsODJaMkFFOWRYU0szbjdkSGtpTklGODRUQnFDNm90?=
 =?utf-8?B?NzZMeW13dEd0YzNyNytCY0FENG5adnJPVTRnNzhaMjgvUVJCR2h5N2tCd2V2?=
 =?utf-8?B?SytmUW4xeEd4aGlPeTdoSTM4cUtMV2trY1RGaGNMbEs5T24wMXkvek1YQ1BF?=
 =?utf-8?B?MnVLUEVjbXczNmI1c0VmVmdaUWZsNWV4VGN6eWFEVWR0UnhRdm1KL0lxZ21t?=
 =?utf-8?B?TDNUQmxXekNkWDVnZjI2blNMYTM2bGRpbERJalFtbFpjTUh5S1VQR3lGcUVQ?=
 =?utf-8?B?clZRL2xRcWNiOUN6b2JXT25NYzZISmdKazluOU8zQkwvYVIvdDRqZHY4d0gr?=
 =?utf-8?B?M1dqRHVlN21uSGpmalF6QmpXVDFMdS9aTmdVTXZmUW01T04ySHdTOTdHSHc4?=
 =?utf-8?B?eWdQR3h5bGpzaTBuZ3VkRzdsN0FyZ0VHbHJBMHNxL0RHNFZwekNPVXJPNlpn?=
 =?utf-8?B?alJ3cjBmMXl2ZEc0eWQrS0xJZmp6SUJXRHVXNkdnRUhLanpiMHIvT1lBb2xR?=
 =?utf-8?B?alNmcFp0dmpab3JScDNVRnFSTnFpckpUYTRiUUJ1MWhRMXFnc1JuMk9wSzBa?=
 =?utf-8?B?UUFoL2VheWhhdWVCcDhaNGZYQmlqQThGYWIvbWVZb20weHU4cGx4M3lLbmZR?=
 =?utf-8?B?aDMzVXVGck4vRzFmZ3VMck8rOE1ObmNkcXhFS3IrSUNuU2lsNCtseVNkc1Qx?=
 =?utf-8?B?ai9HWWk2b3NleVBSdHRCc2lZZTV3Q1Z0VWZCcUJpSk0xbUZsS3dPdU83dEkv?=
 =?utf-8?B?aVovM203VU1OYXFMb2VOT0x2bUxVQk41VTB6UWtLU1BYMkg5dUR4bFJyNTBa?=
 =?utf-8?B?SzVRaVdxMlpRbjg2cnU2eXJBVGdFaHZ6ZWx3a2hKMTZNV005QTc1QVQxbkZX?=
 =?utf-8?B?cEQvTitTZ1BvdldNT241emtQby8zVUZTTXBlSGZlQ3ZlQ1NDSy9IazFTMzNU?=
 =?utf-8?B?d1ZVc2haZS92bkN5UktoUk9EUVpnMy9ycUVReDZ5aDhRRUVmaDJHcDVWKzZJ?=
 =?utf-8?B?ZUUwNDVWVE5FTlFDeFVVZ3lsWnl0V3RUM29SR1FuR1pKSTNzVVFnTFNpeVN0?=
 =?utf-8?B?L0FLeSs4Y3hvb2JwTGx0UGt0SXJ2T3FvNm56S0NWK2xIdnBzRy9nbVZlT0RT?=
 =?utf-8?B?Z2FJTGtoMUpBbThqNkhGcHpJekZMcTZ6NURTTDR1L1p0QVRHSHNoMnpKR1VZ?=
 =?utf-8?B?b3BGbW5STUw5OWNqUkdudFZOeEZ3WXJMbDFmRVNxOFIybmtFcFI1QkV2MmVY?=
 =?utf-8?B?WGhtZytZMGh2eEsxSERQVVNDQmdqVEpIc2lTWnRicXZ3bDVEWmJTUXJLaGlZ?=
 =?utf-8?B?STM2WWg0S3E3WnhzM0hUelFmbkIwY1Y0YmF2OXNsNHhmdlplOFJDUE9SU0tp?=
 =?utf-8?B?R3VYdXdaRDd6M3I3MjVhVjNRR1FsMUY0WkI5MSsrWnFzbkZOWXloVE9JeUIr?=
 =?utf-8?B?USt2SEYxdjhlcTBGcmhLbXMvRGZJVnh6WHNTa1BCc0dFWWg1eGEzR1RRakV6?=
 =?utf-8?B?cUt3Z1graytLcDBhYTBMZ3JLZWxRelVVb1RXQktTWnI1di9UeTVXVE56VzAr?=
 =?utf-8?B?dnhQNDFWS2IyZTNXdkM5K3VaeEtRNDE4UjM2NCs0c2I1Q2hRTSthRUd2SjNz?=
 =?utf-8?B?UGpVdW1vb01wM2pjWGlCbENZWUdYVFg4a3NzdTNBK2V4ME11QUUxTksrQmF3?=
 =?utf-8?B?WUN1c2lUbGlXcWNtWkRDZSsxaFl6Q2t0NFlqSm9PdFludkFFcEJlQzRZZS84?=
 =?utf-8?B?MG5nTjdvckI0emgxNXE4dXczUEY2ZEY5NUEwdXRhblB2ZnczZ0RoakMzTy9j?=
 =?utf-8?B?bGYwQnNOUDJLYitYWGpRbGRPUWwwZlJPelVzNkgrMU5pTHc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10174
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2b4daa7f6f3e4fd4ab80692a9bc57812:solidrun,office365_emails,sent,inline:c6c1941fd6a7e60e4eda29d9496811eb
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da4d01f2-58d5-4aa5-4db4-08ddab4eb5a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|7416014|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3c5QWJ2WlV1U24xMnNLb01BcTZCd1lnY2t5cDNVaUcvNzRxaW1hcy9uaEJH?=
 =?utf-8?B?UUIrbWU5d29ZSEFHUlhERi9Kam15Rm94YXAyWFVRcjhuR2VyMktPU0xCd1RV?=
 =?utf-8?B?dVQ3eFppT0gyK1RhVWRDWmljSFdDL3J6am9rRS9XdllwUFJrNFBHRklHanV5?=
 =?utf-8?B?UTVWc09zc1YvMVFNelptSm5RNDAvMDkyVjZETzRzNTlnOEN3WDl0OFNJK0Mr?=
 =?utf-8?B?QjdOVFdTYnJmeS8wK0VRdmVsSXNnZnpLL3U2Qyt5MVdPbXkxVVVWekVZTGk1?=
 =?utf-8?B?MEVMOXdZcDhQMGlQV3VQaThRYUhnRS9rbjNUOExCUnpGN3gzVXA3VTRRMGFy?=
 =?utf-8?B?RXRVOW5pajd6cENhbHYvQk1lN3plUXZxTTZmdzB4Y0UzV2VSR2JYZURLanl5?=
 =?utf-8?B?MjJNOU8vdnJSSERkRlpyS0xLSFoxYUJ5T1ZUS3ZKOGZKYWhHQlovWTJ3aVpz?=
 =?utf-8?B?NUNkYWhiYnpqU2ljOEs2MGYxSnlmYWVQYXdOdFVUd29RaWd2S0VIV2xwNXY4?=
 =?utf-8?B?TUN2MGVzVzA2RVRQU2hjOFcxTk0vZ2hRdzh5bmhCcW9keVYwa3B2VTR2bW1q?=
 =?utf-8?B?OXRONWNwTzNhN0xPekIrbDh5akJOaXduRVFWNGR6N0JXN0ZXRzJYdWFGQSt1?=
 =?utf-8?B?NmU4Tm9iSmJxTFNGYTU1TElPcDhCTldJU01tVFBSaTZBYi9oZGU1VGRzUlFD?=
 =?utf-8?B?ZFRoenJ1TVR6NTVXUFpadS8rbldCQlNxR1dBRE5IZmpUZm15OUlrRy9RRHMw?=
 =?utf-8?B?SUlJYW05RkN1bEZrNTMxdS8wdFVvZzEvNzJSUWNtMFVIVjVFMldzR0NKMVpq?=
 =?utf-8?B?N2phNUdLTXZuYlprcFFHb201amVZZmZGTlYyQklmQzVnQmUzYlloU09McVJJ?=
 =?utf-8?B?Y0Z5bzVjcjhVemRZTlgxVVJwZFJRMUd2Z0VLOFFacWs4YTVpK0VlVGkvc2pQ?=
 =?utf-8?B?ZHFwOEs0SG9QZU1TcEpNT1krOGhNdGN5SGxPNnY2U1ZZWkY0ekpJU21JaFY2?=
 =?utf-8?B?YTBYSzloUEdYRXJ0SGxieVYzY2svSVRsZ2RmUUhjeWM1VlhMMWdoSlFHb0FO?=
 =?utf-8?B?THlmRFFtWUh3c0o2eXQ3dFFhcDJxRE1sK2FEME50WGZFZnVpT093Y21kaWFZ?=
 =?utf-8?B?SDFOR3N2MC9aZ29MV09iM2tVYXNSck84Q3lhdlZGZ3hMRWI5N3k1Qmcra3JQ?=
 =?utf-8?B?Y2UzalVWU2JoRkhta0Jzd2dKSTRIVTljSjk1a0srWnl2a1RrTjgrTndIUy92?=
 =?utf-8?B?NnV3Z0lKdXVSYWRySklIbkxmWnp0cDZiRHVKNVFrcFNsRXF5S2xLeXZiRFpE?=
 =?utf-8?B?NHFudlREWWxnb2toRXhoc0FFd2dLYStva2NpS05hcVN4R2tMMW5EcjNJdnBI?=
 =?utf-8?B?Y0VjZ0FBMGxVR2N1a3ovekdjMkFhU1RKaUY3SkhuM0Jmd2MzUHpTZ0lOcUJY?=
 =?utf-8?B?MithVk9IaXV0WDRXWk1HWllXekdRTUFTcW4vWXYzeGY1TEZ4TzZoQmZKOXNE?=
 =?utf-8?B?UXIyTnBBWTRPQTJEUFlmM0hmakt5Tk5RWU9LOHk0dUx0OWI3N3dLR0MrOXpI?=
 =?utf-8?B?Vk5LVEpOcEZHWktnUGdPVmM0SkUwQllPbGxMRUhXSFlaY1l5QzFNVEw4T3Zh?=
 =?utf-8?B?NUtaN1lROExQR0NTbkNTdVowY1FPekZFUGVOTmd0U3BSVmJtM0wxVmJkdW84?=
 =?utf-8?B?M1ZEMDJEbHk0Zm5aamRvYmRTMkxzM0M2RDVHSEpEZk9ob0ZEamxPMG5YVzNr?=
 =?utf-8?B?S1J6Q3ViSlZpNnZoRVkrUExMamRiNDdlQmtodGVLZVNuQmlRbng1WExsazUz?=
 =?utf-8?B?bkt0VUs2N05PQnNreEZ0THVtTk9tVHE4NFFDM2RUYjJiT3lGQWQrbEIvTHlm?=
 =?utf-8?B?N3EwRGlnWWx3QnZjN0tCU3pkd0xnWmR0MWNORnhvbGtTSjZKODNyV3dUdFJa?=
 =?utf-8?B?OHVuVENjSnp1Z2xpM2tnRUJVODZoSEdKQmZjMnFDZCtNWENpWmJmSTRlSlFC?=
 =?utf-8?B?OVhNV1F1ZFNaWi9pd2F0aktoeGxkeUhLcGR1OCt1ZzFWNkpkN0Z2WkFVUlUr?=
 =?utf-8?Q?AmIWpe?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(7416014)(376014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 14:21:23.2336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7b75fe-53d2-4955-579f-08ddab4ebd99
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6947

Add bindings for SolidRun i.MX8M Plus System on Module based boards:

- CuBox-M is a complete produc with enclosure including the SoM
- HummingBoard Mate/Pro/Pulse/Ripple are evaluation boards with common
  design but different available interfaces.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e4166e35760c17c772aa0195137de93..1462023f35b7be47a5cb855fa64025d07361d550 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1189,6 +1189,17 @@ properties:
           - const: polyhex,imx8mp-debix-som-a       # Polyhex Debix SOM A
           - const: fsl,imx8mp
 
+      - description: SolidRun i.MX8MP SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
+              - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
+              - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse
+              - solidrun,imx8mp-hummingboard-ripple # SolidRun i.MX8MP SoM on HummingBoard Ripple
+          - const: solidrun,imx8mp-sr-som
+          - const: fsl,imx8mp
+
       - description: Toradex Boards with SMARC iMX8M Plus Modules
         items:
           - const: toradex,smarc-imx8mp-dev # Toradex SMARC iMX8M Plus on Toradex SMARC Development Board

-- 
2.43.0

