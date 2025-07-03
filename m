Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF22D12F4;
	Thu,  3 Jul 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531828; cv=fail; b=tBcO0Q3CaZAjChEgCf5mGrI5S5fNBaYgnRM9VM2Nx7QIhu6EjSxq1MGO9keC5i8GRFZCHSv/GSKs4+CdWze2MRd9UiAIhXj6v98L6SKwr6/D+zzRitf3tr7CtYJ8e9NrIGtepCH5YZ+GynYfma3zABDxbyrncCjFtRCz/eLgWnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531828; c=relaxed/simple;
	bh=8POTI2Or3XtPSkHdMVYhUGdsVeykPYp+SKjExy2qEZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cy3mlvokKFx1J5c+uUH3gJAZWX/xleF68IGx4LMB84i1FlW2gK55VrOBs5XRMfiUL4oL1Z6UkIILSaySnpKIumYM7A7k839VEDTUp2rhKX4yzggnW64B5qPMq1Qd0WJVE2XXIeDzdSiny3rZXmOJ5y4aYabqBBxLgBhuja31kF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bnUV0Wtv; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bnUV0Wtv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOoWJYT+fJj6z6CiC8JlPtc08cwI1AngNRftul/P255ULoi9fKscZ6g3wwdjoN4gioCp+XN2SCAwhbkKxoIbgM/bUDNs/ezP1/q3NVoKS61sRqAD784BhzwW8UEHC8n68myYg0awkxJWXNncMrE0vxQZobJ6D3z9AE5H1912XJ4nhxqqqWecm6sKqvrnSnzG/CoYIZldRxFrrt2HCNsYEwBlWhA+VuZDP+jhXLUsM1na6i3v/xb1U4IHRtvLnsFmYSkXYLZ1oLbaaVynIwD2e6ede0nSn/pniMPI8cXheAcL0EHyVW1kDBoFAa2unAJMbpVXigMY5BaVSwCSZxCUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8POTI2Or3XtPSkHdMVYhUGdsVeykPYp+SKjExy2qEZU=;
 b=Qqn9iweQlXfPmLG4js6THebCPDpZLVbVsR7lIEhRUe3nOJTWzsceg7Mr4tFMoLEeHJ6FOe+7x74nontfMe7Ak/iehyU+QTOy87kJLCfqlUzSf9Z3CCAuMfGe6ejnxrAf4Q51N+ThAu2+Ui9xYIgG/5J0BcSv4vg3ibJabFQMUI4xFdkPgGEQgq2AxJTATOlSKrb9CEBcIkk1VlPmW/hRk0pIEteOtmj2o6AaMZ6H1QIAwZT6vTN6afU/JTs42PmbLxg08lbsgPykv2/2nmaFvHgF9RpT9hiycZyWThf26d9/vmkplrbLbrXqa/U/SK1p2YK28+TIDUydqsHs4NwpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8POTI2Or3XtPSkHdMVYhUGdsVeykPYp+SKjExy2qEZU=;
 b=bnUV0Wtv4KdQglXCRXJCI867kkAp+KSSMwB9c0BoS1f/5LQ2C9Iw/EtWB9Ir6g43tdUnOaYIgiJaS44CwQix0zXcDMEg02kqem+Yt7Qps4f+fvocjw4tglpGpjzI62jlY1WEgQ5bDrfrz3UHYU1ukpyxZUUGKcG3ocXmVRFaO8IIwnDhGNL91SqsslZqqLeCNdLWdJmIseG9IZHsnH/ijKwsDdGvUOBpizWKybq2m/GSm4BkVJ6olroh7zKsYvdp8fy5pKwuddt+quZMHEecMbEaMhmq1qGiU87Z0oiJlzyYgpkrFl7VIWFcvRuiQjbJs0v6dpKBDXeMqOxbkYPI+w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8888.eurprd04.prod.outlook.com (2603:10a6:10:2e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 08:37:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 08:37:02 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Frank Li
	<frank.li@nxp.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Thread-Topic: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Thread-Index: AQHb68x+oow63NwYokGomyOeoIsLI7Qf8tcAgAAgIzA=
Date: Thu, 3 Jul 2025 08:37:02 +0000
Message-ID:
 <PAXPR04MB8459CE9F696C59A30BFC5CC78843A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
 <264fec16-5974-4f9c-98a8-67c21b5fbf7f@kernel.org>
In-Reply-To: <264fec16-5974-4f9c-98a8-67c21b5fbf7f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB8888:EE_
x-ms-office365-filtering-correlation-id: d58a93b3-5287-488f-6262-08ddba0cc87d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2g5aURiSFdhN1FDaXZhQTJnNDRqSkdnZU56N3RwZWtpZTQzMmhzWGswMFVw?=
 =?utf-8?B?ZGYzUXVjOHp0Mlc2QUJqQVk5RTZWYXhUeTk5dlF5bzZwdERtOFgycVVDcVkz?=
 =?utf-8?B?NHdYb2tsRzIxMTREWWxLY21CL2RYYy83eitnRWlJVEQwQjBybGIzT2I5YzJs?=
 =?utf-8?B?YS9oWEc5UWV4L2c0V3hkSkdDcmwxNTk1K1k3N2lTZnB4Mkg5Y0taQU9ySWZU?=
 =?utf-8?B?M3U2YVY3Tmp0d1d3emtWWE9NR2F6SHNQYldoK1N2eEZ0M0h5NlVVSVhtdXlu?=
 =?utf-8?B?TmhlSEp1MEpzQzVpNXdNY1MyM2pXaE81THUxeGRHTDduc2h5Z0VLN0M4MFhP?=
 =?utf-8?B?dXFGcTlIMmZCbEkwMFF5NlNxZzhwdmh1UjRkNVk5bDkrUHk5Nkw4L25BU0Ru?=
 =?utf-8?B?NDNEQUU2NTgrc1BCU2UyZzBKT1JHUVNKYjRGMEdRWEFQVWdCb2dOSEZPUlYv?=
 =?utf-8?B?OUlmelJzYnZualR4ZGUzN1ZsVWNOUmVBT3hIalpIbk5oN1UySVJMUjJtOGZq?=
 =?utf-8?B?bEN4S1NyUGtXQWw0TG9mY3JXMHRTTStUVHpZMTFMSDZZK2czSVlScUhvRElB?=
 =?utf-8?B?UDQvckh4MEdJK1hqMmdheWFOR0Fhb2FtUHgwY0Z3VlBEZ0xrT0tHSzFmVkdW?=
 =?utf-8?B?SXM3ZTJCdmpETkcwRGtVMUdsK3MzaEVscEErcHBpallMcy91WDZGL2NHWU4r?=
 =?utf-8?B?bk1EbkNxSjQxcVREcEtPd2dlQXorN1MvTEluS0o2cWQrVUdoWFllL3BnaWlM?=
 =?utf-8?B?N3RVRGF5azNRMDR0SGNOV1k4WHowVXBER24rcXY0YmpHOEZPL08wSTlzNHdy?=
 =?utf-8?B?My9LZHNTV2YxdVRNVlFHN1dBd0pNQ0ZvaE9RTVkyajdsVG9lNEtyUVZxZU5Y?=
 =?utf-8?B?L2ZLZkJoQjZUWG9XYmlaU2F0cEpnNTh1MlJpWXBXNjZsWUQ1Mit2TGJnN2sx?=
 =?utf-8?B?ZlN5ZWRBT2V0c1c1TXcvUzduWGE0SzRRM0pmRUQzNXlUVXpJU3NncFhSMFJC?=
 =?utf-8?B?elVpcCszQTdNdVZWeGEycjJaNUhVY0RtbHpNL29ldDhYeWNVS3pWMXFqZDhC?=
 =?utf-8?B?djk4SVJlMWRlQ0dXUGxCTDBma2t0a21aTGZMeDBCN2lmU0c2RmlpL2JFRURu?=
 =?utf-8?B?bHJJcEgrRnhmbHBROFJUM084eC8wSjV4NVBhbVdTczVIYXBZSmZncDlSL3RO?=
 =?utf-8?B?TStGWU1FbTMwYUlybDJBNXhieHN3aXcwaGM0VUtxSUh0TDFZYnNLVVNoVXl0?=
 =?utf-8?B?VmhhNzZOYVBUZWxqV2FQS3JjdEV2TGpMQUZKa1doMGlSeGN3OUM5VkJrZURp?=
 =?utf-8?B?YWFkSnFVdGZXNXFOTmtscnRGWksvRURLOXJ1dUdPRlh0ZVdtRkdRUzdmUTVj?=
 =?utf-8?B?REx1VDhIQm1nczRaZDZrMUFaYmp6Z296bVc3UkFpU0dBV1FwY1QwR1lybDN1?=
 =?utf-8?B?enMyRUk5cFA1RlFUNDJWMzAxU2RWd3pYMmJhdkpCdEpsT1NkNUR1S1I1QVE0?=
 =?utf-8?B?eDIyY1dZYnRGZVRHbit6dWlMT2l6a3lUZXpFNWdNMEhqM000d1VLYUdPODhj?=
 =?utf-8?B?azJ3ZmdKUkRkQm1ZN3QzK0U2QXdwZmVoL0g0eWlWTk9qajNZQzhGUGE2M3NG?=
 =?utf-8?B?UVlOSlBYVC9KOEJGa3FKbEl0eTVBcVc0ZmQ2TDAyZ0xnKzVSdC9wb2NHbGJ5?=
 =?utf-8?B?NU5JSUNVMmhJVlZWWEJNWmdDOHF3ci95QlNMUW8wSk1aeUQxSU8yV3ZTZFF2?=
 =?utf-8?B?b29CUHV0aFBKV2ZhRmV5dXZGanAvamt0YStiSVpBeXMzUHJwOWxseHEvNkFQ?=
 =?utf-8?B?NnpXUnR1V2RBeitRS0tPTWZRZEhsMDZUZXRWOStUb1dVbVNRMGxjeDVucEpE?=
 =?utf-8?B?VlhQRVZBdzNnU2RoWldsVzRKaVgxa3hSZmNzTmgyRVBIQ3R1Wm9VMGo0Y1Nu?=
 =?utf-8?B?S3hSYzhVU0xRQ0hOTmZzbmprUWR1MXJMWlArM1Y0bXIwRS9xdFRCZTRkeGww?=
 =?utf-8?Q?dMHePCs5AJSjDZJNC3a+oKDeqXwJck=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em1EcWV0MDRWd0x1VURTWnJXZERBZVZqUDArWE1vRTExYmxnMUsyYlpOREsz?=
 =?utf-8?B?d0VVck5OaUx0NmRFYVJUVXdRVythZk5vUENHcmJQNURZZVpmUi9HZ0QxZCtC?=
 =?utf-8?B?aWtrV3laK2NmUjdwME5oaVRkSHJCTnRWS2hJUnBCc1hkNFNIdjlMRXA5M29x?=
 =?utf-8?B?Y3Y3TFA0Qk1hblh3MkJySVVHSzdJd1plM3JNNEZyTFA0OUNPVkpoRWlUdEVP?=
 =?utf-8?B?S0R0VXVtSTRqVVo3eXpIUjFzUjZPSUpsYmh4TUIvNGhwUHk1emV0djlOOWdR?=
 =?utf-8?B?UENXUXBiV3N1U3NLS2xNbklOb1pqcTlzaWxFNDZqaEdaMzBndjZjbEw0UVp4?=
 =?utf-8?B?RUEyT29WeHg4VWQ4V0lPNmtpWHdxMGE0Z2pSQXdJNzNUMlhCOG9HR2xpNmJn?=
 =?utf-8?B?eXg0RDBONXZRRURXR0xTM0dXVUVkNllhcWt6TlRQZU13WGRCYS9MYktCbWdR?=
 =?utf-8?B?ZitYaU9CRU9CUkhRTUdZUHdFaFppMnhxZzZ2MmtEYUIvQkMxQ3dCVVdYalFE?=
 =?utf-8?B?RDgrOE9QQ0JLNXJPTTdueW1kdHhHQmhDK1BhSnhUZUhLdXhxWHRRZkIyc3Zv?=
 =?utf-8?B?dEpwQTlraW5ZWG9yajRCR1pYcGFuNS9lMGxpOXcvQlhYZ2EzM3JjVTU2TXJW?=
 =?utf-8?B?bEFFb2E4MDdrbU9MQ2c2aGt6U1hUdFJiMGcxVzFzRVJLTmx0L3N6SnlTbTNh?=
 =?utf-8?B?V0pMV0tMcGlIb2x5WWdiZXpXNi91VkhsTUtObWlPbjRRNCtYNkNNZ2JKSUxv?=
 =?utf-8?B?OXVwVGYyempZaWxHNVlrRWYwNXZoWXBHVkx3aktTMXJnc3ZPSFdYOTU3UlZG?=
 =?utf-8?B?VjlmOGFmSG9pZDRoUDZhMjlmYk9iK3hkczhWSGV5RFhIbzJWdVp0dDRaYndv?=
 =?utf-8?B?ZGpvS0JnM2xGcjdJMnptUVF5dmFDU3A3RUJCY0JMQWxPQU05bGt2NDUyaGdB?=
 =?utf-8?B?OXdaZkEzZzBSUSs2b0cxSFo2aFU1WDFBb3FvaWE0ZStOUjZ3S0NqYkJhZS94?=
 =?utf-8?B?K3RsTHlmNkZkeVB1TzZQVG9PUzVPekloZ0JvVmd0alNkK2JodlNTTE5mdnFa?=
 =?utf-8?B?SWlGVDUwZEhoT0tMbElHN05abm51TDZ6R2VjbTMyVjhlMVRyamhMN3ptSitY?=
 =?utf-8?B?Q21IV1VQOFhuQ2d5eTh5bG4zc2FrUHEvVjJ2M1VrcTNieG1zcXRtQWd0Zk5R?=
 =?utf-8?B?aE9CUC85OHRSUmdqNmRDTFFMb0RHQ25Hd3VkL0JobVBkaGE5ZFA4RmtPQzVN?=
 =?utf-8?B?aXc1U2lZQ3BDZkdEeE9mVDZJdUF6dzh1UkFiRTdPaGtsdlhML2drNWo0cXRz?=
 =?utf-8?B?dzRhc3h5TlRmYTc3YTB6MEQvMjB0SkE5WDNSeFF0L2x4R0dFVmFJK0FxSmZy?=
 =?utf-8?B?VTJvY1VxVEJ3N25CUDZCQ1kyNEtGQWtZdTh5bms2TS9mVmppbzNkZUw4b2xR?=
 =?utf-8?B?allPRS9Ta0JGeGl1NW1jVEFtMFREV0IwZmk0UlUvRnJ2NnRMaDZWbTdOSUdO?=
 =?utf-8?B?UEFLdEhoMTJTQWRycnIyaHBIcU82MlhIOTdaQnN3UHluaHVyNndoSGZmcFBI?=
 =?utf-8?B?WU0vWXBZY0VKSmgvRVVYUTZwQ3p0ZFo0c3g0YjdQNmxXNmFXdHRHTmlPREJO?=
 =?utf-8?B?ZmR5bVp3a0UyZVMzQUZIazl2a1pIUzVndnB5UldGL1YzS1BoOWdJQU01b0NW?=
 =?utf-8?B?YTZHRlFPbEo2WG5Ib1kzbkIvYU8xZFhaTGRxUk9XbG9KMWF0Y3A5ODNRRTVD?=
 =?utf-8?B?L0tzNFlVSXZVeHFuQXEvbEpUVEQxdDlZMlNJOTJIdmp0TTF0RW9vZDc0Zjdt?=
 =?utf-8?B?SlExdGpBbVRXY2liUzltNldyZWpoM0wwV2NsdW8ycVhwdUlCRnMralNGT250?=
 =?utf-8?B?ejlGeUg5VGEvYkJoQVFTNy9NUHFINmgrTHZzVDRTNUUySDdkanU2S1BIWVQz?=
 =?utf-8?B?TnFjcS84UHl2aFdTWUswVWh4TlBWS0Q5djRaN2tNa0tLUEdFZW13ai9zMG1C?=
 =?utf-8?B?b1JFWkloTUpuMjd0K21DUjZGajE0WW5LbGpFNkRnR2xZVFRkbUtzN2ZVaEl4?=
 =?utf-8?B?K292ekZDd1lVS09kaGYxcFZhTVFacm5uTVJLZ1EvdUQ2T2pSazkwZWgweUlR?=
 =?utf-8?Q?HKoY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58a93b3-5287-488f-6262-08ddba0cc87d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 08:37:02.2019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPeG7j11wpZ+UrsncQ1es6dqgUVLExFtRnvTwcPky9ONPIS3Kw+XpgohKKDAlMjKojh91M4l1kh7tCcyQRnETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8888

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvNV0gZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgc3Vw
cG9ydCBmb3IgaS5NWDk0DQo+IExWRFMvRElTUExBWSBDU1INCj4gDQo+IE9uIDAzLzA3LzIwMjUg
MDU6NDAsIFBlbmcgRmFuIHdyb3RlOg0KPiA+ICAgICAgICAgICAgLSBueHAsaW14OTUtaHNpby1i
bGstY3RsDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbnhwLGlt
eDk0LWNsb2NrLmggYi9pbmNsdWRlL2R0LQ0KPiBiaW5kaW5ncy9jbG9jay9ueHAsaW14OTQtY2xv
Y2suaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgNCj4gMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uYjQ3Zjc0ZjAwZjExOWZmMQ0KPiBjMWU2ZGFk
ODg1YjViMWUzYjFmMjQ4YTENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9ueHAsaW14OTQtY2xvY2suaA0KPiA+IEBAIC0wLDAgKzEsMTMgQEAN
Cj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBNSVQgKi8N
Cj4gDQo+IFVzZSB0aGUgc2FtZSBsaWNlbnNlIGFzIGNoZWNrcGF0Y2ggYW5kIERUIHN1Ym1pdHRp
bmcgcGF0Y2hlcyBhc2suDQoNCklmIGl0IGlzICJTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpIiwNCkkgd2lsbCB1cGRhdGUgaW4gVjMgYW5kIHlv
dSBjb3VsZCBpZ25vcmUgZm9sbG93aW5nIHRleHQuDQoNCklmIG5vdCwgcGxlYXNlIGhlbHAgY29t
bWVudCB3aGljaCBMaWNlbnNlIEkgc2hvdWxkIHVzZS4gSSBub3QNCnNlZSBjaGVja3BhdGNoIHJl
cG9ydCBpc3N1ZXMgYWJvdXQgTGljZW5zZS4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
