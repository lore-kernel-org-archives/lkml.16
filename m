Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881BD215793;
	Tue, 11 Feb 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278789; cv=fail; b=aPlwpQdw0CAUsxpev8FtREeUL+oHpss1m+L9qwxT+4jgQFLoj0uKcXEaHAGhCfRItrq7q/7ADlfZPESQt0peI2S4rieCR9KWXEbYkA1kRSYmw4XlMn6yr0xJfARn1w9TSg2Nx3t7soRVuquG5gWt8xS4lqa8nVZBCVbY38LHzII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278789; c=relaxed/simple;
	bh=0HLsjm7r0xbRMMXWPF7E1IsUbcxhqXva9lYcOi0cVRs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VtNPQVD/gK63GS4FWvaZZPRImTz4xqUsokOjSp8b7fNfV9Ioy6X3rE9Gj7MVmWRZlAaL8UAkp5HsQWSNc0XydFQa/JMKodrDVCqRh8dbDSaiZdR2Y5GoddMYRMvtkrj+xQeIQrF/9l2HA59fdL5JkGQK3riTx6DdMynwLQoVMBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=S+qDSHON; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=dVKxzELX; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S+qDSHON";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dVKxzELX"
X-UUID: 0ee967eee87811efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=0HLsjm7r0xbRMMXWPF7E1IsUbcxhqXva9lYcOi0cVRs=;
	b=S+qDSHONnrfe144zH4Tphj5Z0m4//YMpy7cGLBqvw2/8uie6w67inVOjdpugwNNPM5qFT3P/pWkYBp5c0/XXk0I9Y1nNvvQRXDQXOD2UIsw9ODO4EJ/r3YUXB4MDdR1Dk7ktMhnn6xA2ir2awORD6ljz6vMUL0++5sjvirXq/kM=;
X-CID-CACHE: Type:Local,Time:202502112046+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:61b1d423-d2e3-45f6-b4fa-54fcc36ca7cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:d5da6a7f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0ee967eee87811efb8f9918b5fc74e19-20250211
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1434431893; Tue, 11 Feb 2025 20:59:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 20:59:41 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 20:59:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kfb0tWP9lCvlRh1aEYGedI2y6R6CGDorv5qLHpjIwg3ZFnlsB8ps8337sYrxF2vFOKFBzcdN+o1wmsvfwmGbo7JXLWYRX3kXMOm2RhhY+ZXGqZWkM7ciZp5L1bZ6K93s//j9srxatupGHUZ/AbRnWEp2XuE8YYwX6H8EI46MupqtCx/oWL4Uz1RgKPerfcZPEdoGIZNcaQXljNJNPIxZkXjpttk+PR1svW3A2whA/t+iwggxAykrNvGgR9oA0inZw+TTmeJuBLEfYB54HW14x4RKJQTqKDlsEy9b9n7qAVlD4mJGEGGXpv766XQEnR6qYZSv5Aa+xw83M1taLh5HvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HLsjm7r0xbRMMXWPF7E1IsUbcxhqXva9lYcOi0cVRs=;
 b=cOVbhVE+Ui+U5resTrbjdgGfSU/0BQ3r00K7a24lH42+7REScnE46a4cH9eZ7ao7NsTcvMmc33t1MJeesG1tidD6kMwa1F0g4pTKHCibFEVObmvu1lfF7kYCbFJHYsOgM3JFuf6YLjKJ2MaLOp4wAqinThwAu+yUdzkByTutHb0OKZk63Ed4Fw+65/egNjgEp0C9HPQjz3XImeilsiLULmGin2tdIfxBfNePNlviGkYFX6wEF2BeOoWxQyuqNbBR9PtQ0ttlpibAuJbNo4wUFgHes87KfTLXW5aB6YcG2ITG7wE66WTqRhg/juKxvD5qd7FzFsMPZvBVs5vKgJ+shQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HLsjm7r0xbRMMXWPF7E1IsUbcxhqXva9lYcOi0cVRs=;
 b=dVKxzELXU5Rh5LeepQtD01XucljbPpubPe7Xvu1WODXHxoYRCSHNtiWJi9glvxUoNN8Cw/S53LwS4UN2RmNQ+g58PYRyDImvGyOFqa+qVcAQWUXTstsBwjXhF8ccub/X+lnBrBES9FLcCVoB+9Xcu6gPV2T2YrTC22rCSWMx8yY=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 SEZPR03MB8268.apcprd03.prod.outlook.com (2603:1096:101:191::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Tue, 11 Feb 2025 12:59:38 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:59:38 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Topic: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLicIEAgFq9ooCAAfpyAIADSB8A
Date: Tue, 11 Feb 2025 12:59:38 +0000
Message-ID: <d54b010491c1c77a5be92920f8da4ba98722b180.camel@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
	 <20241212090029.13692-3-crystal.guo@mediatek.com>
	 <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
	 <82cf93733dd14abfbcd17b100d1b3c40c6aed916.camel@mediatek.com>
	 <9302b338-9905-4720-ae41-c1e2713528f2@kernel.org>
In-Reply-To: <9302b338-9905-4720-ae41-c1e2713528f2@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|SEZPR03MB8268:EE_
x-ms-office365-filtering-correlation-id: 1c53b246-5d6a-4f05-1c96-08dd4a9bf183
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?em04eW41WFhRVDMrT0N5Tno5T0RrdzVXcjZueXJScnJwWVlUQ0cyS2xHYnNJ?=
 =?utf-8?B?RkJENGd5MVljVWgvcVlySzRmUk5pWGY1bDFRb2RBc2JIUWFNRkkvRFBlVzhY?=
 =?utf-8?B?bngwWHQ3WHc5bGtOSWJvODJEbVVZV0FtL21OWnEvRkQ1Mi9jckNIMTNDT1I2?=
 =?utf-8?B?cWZ6dzRqZVlWZFE4MmQ3ZVg5bDI3U0xGSTBORDgwSThodFpsV1RwMnhyRTNy?=
 =?utf-8?B?NUl5ekorc2pPOTlINUNsRTN1SjZYb3gyKzI1WklMU0hvUnYweVFwWXBnMlla?=
 =?utf-8?B?ZXFSRE1BckhOTGNpUXlOSmoxSGZ4bzRSNjR0OHdwanUyNVBYK0Zjbzd3djFU?=
 =?utf-8?B?UmIrQ2hQS0NKdjJqb0RsS1hvVml4M05XNmdMdEpabVlYYU1OWkhUVlR4OTdB?=
 =?utf-8?B?RHpXaVZzNVExQ0lsUEhheWh6dlBOQXgvSU9LeElaVGIzN1kreDFqcmRWQ3dU?=
 =?utf-8?B?REYveDE4b0I4YkpyQUpwMm8rTjhUYjY1eDZNZisxbU9ub2NzcEU0Rm8veDY4?=
 =?utf-8?B?WFQ0WlBtUzhPaGpDOURXUGhPeXhGanZoRHkwSjNYQUl5WlF3TUp6OE9xSTU0?=
 =?utf-8?B?WVUxR3Nvdjg0bXY2S1NkVE5XcVVBRU9TLzBIY1NDRUI2VjkrYVhlNGhaRmsw?=
 =?utf-8?B?N2xES1BVMVc0M0FPSDlQazd6bDBMK0Z3Uk83cngyRFdsdHVERmQ5QW5XUjVB?=
 =?utf-8?B?YnQ1YmN4bUNoQkV5K1VBVDdUOG8xZUp1VnBwMm5oNlFySzlwN05naXlzbUV2?=
 =?utf-8?B?bUFFZ0JSRkFuc3RVRS9XbG5meDdlWmJXdFlwU0pVUUVhc25CQkt0NDhWSzdR?=
 =?utf-8?B?UVBXMkRQQVJ2akM4WmxOOTJFRnJyTzI5dXlFZWVXdHZlSE5zMEswbWNaK2hI?=
 =?utf-8?B?NmU4aVUzc2NWd3dXSWlHLzFFeWdWVUV6WHpmOTR1T3YyRDhpQ2JyTFhhNGZm?=
 =?utf-8?B?aEdDRFV0aWxhcndGbTJkV0U3V0ZRTllZUEgvdG55VHNoU3FFZzBPUlhkUzlo?=
 =?utf-8?B?N2xINWNNc3hhTEpFdmpqS01QeW1PSk55dGNxRnRhelFxZklUYklDRGpIMFJp?=
 =?utf-8?B?MVVKK0JFc0s1OTVxUjdtVkQ3V0dkazM5TDQvVTZSeUV1U3JGeXBPckk3Vk1Y?=
 =?utf-8?B?WUE2N3NSUDR4WFRUWGp1Y3kyclV6MDJXQ0ovSWhkN3BYVEZldVN1RVcxVk1C?=
 =?utf-8?B?dTNKVmpiRWZMZGdyb0plMTdIMEJNeHRQbGFzc1AwSENrb0lqMXl2U0dla3Yw?=
 =?utf-8?B?NVl5d2tHWHhrRmJCcnlScUhiNXpGL1dFVWZaeDB4TlIzcXl5T1ByQkJSeTE2?=
 =?utf-8?B?YS8yZmI4Tk9BU1lacGpCZ0lwNWdpYUdUY3dlc1B6SjltMkFER1ZzcUlrdzlE?=
 =?utf-8?B?ZG1iL3ZXaEZrSUlJdkZmY0hmTTlIbTBRZjJjOHNRRjBDTG9FaHNNWUttRllM?=
 =?utf-8?B?OWNEV1hoRzhjSkwyWHFxMlljWWtFOG9IcnlMMTcyd3d2aUtYNE9HN0RJWHRj?=
 =?utf-8?B?bjVjbFVIWGtKQ2VCeDVkUXBqTzZMSlNESDFEYk5RTjMvRnNmU0VIa0lSWWgy?=
 =?utf-8?B?V2RsenF1b0pZOXZzOWI4dDVwbi85Y21Bdkd6bmg5a21zL3Z0TlZVTjlDbTBs?=
 =?utf-8?B?VlcrSTVHL0MzRlZoUnFVL2UvOGxJODZNc01DQmx5cEZqdEpvZUp5L3pCSHFv?=
 =?utf-8?B?c0FYMzBZNDFOOWFFQ2ZnZkNPMTlJejNwREtEOUpqMUtJOU8yU3Z2NWRaRllH?=
 =?utf-8?B?aW1lQkRmNnRBTDgwNi9CcjBBdStXMFVteXUyYXVJQVJmN2xXOGcvUEMzSXBK?=
 =?utf-8?B?ZWtFMnltek05b2N6bDlZdWMyUGh1bm1KbGQzMWIrRFNvWkJpSFFRR005RlZ4?=
 =?utf-8?B?OHJPNjRKK1luY3RENmFjajE2ajdrWjJVb0wyTGdIVGNqTVF3Y2p0aWZwZlBJ?=
 =?utf-8?Q?M1poeSW0pGVb1pBaMRsS/bOp7rTqTaqy?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3JDVzdIUUp2KzZMdVYxRHBpYTBEWDRNMEh6SEp4SFMrc0FvTjZERWhuRVJy?=
 =?utf-8?B?aUVjK3VJU3dyV0diaVhPUDNZMG84U09Gdm5jS2V1MldyaUZsdUNXMGFzWmhl?=
 =?utf-8?B?WnRpRTlPb0tSQ3J4eXdHNzVsenBnbjJ5OHp3TlVrdDZ1NGNRTjhFaTdBc2ta?=
 =?utf-8?B?VHFBY3VzRjFHc3RFZWRWU2dwNzlNV3E3SHlza2gzcllYUk1MVmphczFtWGJL?=
 =?utf-8?B?NGh1MmRoZEVXd0k0NGJUSkZ0V05KRGNuWkJmS0ZzbU53YWluYlpta2tZUHhY?=
 =?utf-8?B?YmdZUTlkblAzcWgrajQ3dy9QbEZYVmtsQ1ZVbXFEamswdXNBK2h4ZElKV1JE?=
 =?utf-8?B?bG9QTjlDMW1RTm0zRWRIUk9HWDRRTUwxTzRkbzRZOUdlckhKQzJ5SE03T2h1?=
 =?utf-8?B?dlZOc2FRSzBQdXdVdk9raTJ2WkVBMktGWHY1cHJ3WGsxRGR4NmVXYytPam55?=
 =?utf-8?B?VFlLQ2FSMGJPZk1zZlBjZG5rYmtkTEpCb21lVzRaYWdFRG5TeWswMzhYb21r?=
 =?utf-8?B?WGhpa1JWWm1sZk1ZTFhQRElBNFpPMUpZcTRVdHFZMlcrR243aTZNUlQvdWtj?=
 =?utf-8?B?elZPNTcwd2hWUXc5SHhvZkcrS2FTb3I3alF3L3hMcWZ5OEdEY3ZpN09jaHNu?=
 =?utf-8?B?ZWFicmYyc2hrVzVBb1RSeEJEV2oyeUhhdGt4OEsvMWtXdTcyZGRYVm1mSTR5?=
 =?utf-8?B?WmVtc0pIVXpvUmJTaUJ4djFDVThFbkhUM0JtaW5vTmdkVzFFYzlmWlZGaUpy?=
 =?utf-8?B?V2RxYnJnOTBLalEzY2luTyt4c2p4RjlDQ2NOM0hTSXpnUzg0Wi9hNDVMY0tp?=
 =?utf-8?B?T09LTFZ4MnhjZXJLTUhZa2xHdUV6aFJHdHZNUXhPaGxZNHpRRmRKV1R1U2RI?=
 =?utf-8?B?aE5Na2ZGQVFGNUp3eGFQeGUzV0ZjanRpakErcVBTMGNyNVVTdXV0bzJ2Uy9x?=
 =?utf-8?B?RVREWWFvN1JFbytSbkRIOUQ3V0p4ZHhUUTZvRGlPK2RKSFA1MnFyUHR0emNq?=
 =?utf-8?B?aUhIUnlSU2VKNE9zcUxVZ0MzQWtWZzJsNmxKUURhQ2FWdVhHbUxsVW85cWo1?=
 =?utf-8?B?T1lIcDJENW1uSWxuaVZDT1V1UnFSemNJVnlLN3JYdFlqQms4K2tkUlFSY1Ji?=
 =?utf-8?B?ZXR0V0lidkZsSklzdUZNNWtvWDEvc2xmNUY2V1pxU1F2dUtxMFYrbjdDQkFr?=
 =?utf-8?B?ZUorVzhWVHUyN1dUcEttaERHSmIxbGs5cFZoeGgyMDB5dlJySmJiMHFiVk5u?=
 =?utf-8?B?clkrOFhFbTR1d2YvUXNuaU9KMU04MUdMaE1NbjBCOG1HbDduK0gzbzlKNyt5?=
 =?utf-8?B?VG1mbEhSejJUL25qRTdrb3hHVkpJUjYzTS9ndEZ1QVZIZzd5ck9STmlsaFVl?=
 =?utf-8?B?WCtNRFFWWm5hUXB1RTZsdEdkRXFLcHNqOERqcW9BaHVtbVpzVVl6ZmUxR0Rq?=
 =?utf-8?B?UzF1UXZWVWNURnVleTZpM01RZWRzQ1lRU3puUkRQU0NyTFhFWVhMTUFlZkdI?=
 =?utf-8?B?bHFIWm13MGhYdEU2UmxkOERoNEI4c2lLc1NJdktkM1Z0Z2JmU1VKSEliTEN6?=
 =?utf-8?B?eVA5Vi9INUpuY1RxQ2xrZXZpREIxU3h5TFVJVVFoYUpUSnRzNFNJYVNZK1J5?=
 =?utf-8?B?VVJqc1A3TlIvL0Fsb2lyRW5FVVpuMlMxMFVoUWZyTzFDaFRpY2hXMW1tTTdr?=
 =?utf-8?B?S0NHTHpmaE12dWp0NWZkTG04eUp6b0R6K1dYUmlReEdqaW1DalE2dDBTVXZW?=
 =?utf-8?B?QjhveGp0V0RzaEtGWWl6emp6NjJXa2dCcEl3dmtGdVZnMWV3TWcrS0MxQzZa?=
 =?utf-8?B?bWZlQ2YzRFlOSFlyRTdOMjZBbFp3VkVxUlc0VDR5VmtneTlmZTZKZGU1Zy9a?=
 =?utf-8?B?THdaT0c5cWZCWkI3M2xkcU5WUllNQlBZVDlWdFFZNW5LeVVpM3IzbUdIWC9u?=
 =?utf-8?B?SDNCYklvdEFsUUxveUx2NkFXWGJyd0pkOUk0UWNZb2t1R0ZHZHJyTDlHNFJZ?=
 =?utf-8?B?am5KcWpBSExLY0ZNWStza3hGVU1QRGI3Q2IzWW5KWmx6U3A0bGpWeHJvNDQ2?=
 =?utf-8?B?eHNCS3ZUT21rdFdnZTRXSFYvWVpvWG9pR3RhTmpacFNuQXc4MGhrTVR6cWtT?=
 =?utf-8?B?bWtqaWZjK0NaLzZ5SHFlNm1NMXEwZENZYmlEZ2lQeWJqTiswWXluaFh0M2NM?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDB64F8C714CC54999D102811BEDFCAE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c53b246-5d6a-4f05-1c96-08dd4a9bf183
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:59:38.8564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rDVhh57cZTKXEwDmWoj8GQxsM8ZrTLlGI8r7BE8DQVs2fbhpl3XLqLScSXo9X/uCXTeDvH7zrC2sZ+75+dOC+B7IzyXfsLBptfaaicsF80c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8268

T24gU3VuLCAyMDI1LTAyLTA5IGF0IDExOjUyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA4LzAyLzIwMjUgMDU6NDAsIENyeXN0YWwgR3VvICjp
g63mmbYpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNC0xMi0xMiBhdCAxMTo1OCArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4g
eW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+
ID4gDQo+ID4gPiBPbiAxMi8xMi8yMDI0IDA5OjU5LCBDcnlzdGFsIEd1byB3cm90ZToNCj4gPiA+
ID4gQWRkIGRldmljZXRyZWUgYmluZGluZyBmb3IgbWVkaWF0ZWsgY29tbW9uLWRyYW1jIGRyaXZl
ci4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBEUkFNIGNvbnRyb2xsZXIgb2YgTWVkaWFUZWsgU29D
IHByb3ZpZGVzIGFuIGludGVyZmFjZSB0bw0KPiA+ID4gPiBnZXQgdGhlIGN1cnJlbnQgZGF0YSBy
YXRlIG9mIERSQU0uDQo+ID4gPiANCj4gPiA+IEJpbmRpbmdzIGFyZSBiZWZvcmUgdXNlcnMuDQo+
IA0KPiBEbyBub3QgaWdub3JlIGNvbW1lbnRzIGJ1dCBpbXBsZW1lbnQgdGhlbSBvciBrZWVwIGRp
c2N1c3NpbmcuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpHb3QgaXQsIEkg
aGF2ZSByZXBsaWVkIHRvIHRoZSBwcmV2aW91cyBjb21tZW50cy4gVGhhbmtzIGZvciB0aGUNCnJl
bWluZGVyLg0KDQo=
