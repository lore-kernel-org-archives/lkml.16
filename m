Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3E20B7EA;
	Tue,  1 Apr 2025 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522280; cv=fail; b=cKkvC3EuHzXUr955wsyyISf6LLM4znuD+BkyHJ+lJ5ZaRp6TGUW0sYA51p9XK04KWfXojm4R2CgQMOZh+KX3siZg1NUKndvu8LJUTJppiGaWdoCHhso0LlF0VDALYInxIcMF1yVjd67rWE7llU70CaJzCnZp2z+0oMNThxRtEEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522280; c=relaxed/simple;
	bh=Uxu9C54zkOj7o8PjPiowjD5RW3H6SWN57EYpP/B0nLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rHDI+0G/pXN0F68ocLJEgRTwJp1DMBsSfG5g0Gw0QFUxuQmX9wlBbISXgMm9un2a6cdL8nZd6sc3ExaNKEh/LYRLJtaNOl0wISmo4LmY5oPZG1D86NtVrEXOhWQHHa0unVBttTRrvZ5LwTNiLafxOsoycVYzrIYJPTvj4luUAPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kreQDqEn; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=L4ByY319; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kreQDqEn";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="L4ByY319"
X-UUID: 35168cee0f1011f08eb9c36241bbb6fb-20250401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Uxu9C54zkOj7o8PjPiowjD5RW3H6SWN57EYpP/B0nLs=;
	b=kreQDqEnJ3wtTPEfCWPBaXf/wgX/gSjSVyJznAW3M21VQh3LWrHmePC6dAKGd31nJi5F6zFnJ6/0StRM6dN67OpqIc6YAZMEtXCUICAvKyHDe8++jz5sTV8knKwr02RTU8988n2sFFKDZvygMehOuWGAURrHAk8CttG6K2ZD+nk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e26c3942-c6c7-443b-a09e-ca9da01f8bf6,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:f6d1d54a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:11|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 35168cee0f1011f08eb9c36241bbb6fb-20250401
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1631118118; Tue, 01 Apr 2025 23:44:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Apr 2025 23:44:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 1 Apr 2025 23:44:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDLgorQCRElA+ivb6+Z9daocMwj03NMXgfLgqan/Ux6yP5pn1urTujEpGXHWPN0A1hl1e1SD7s3L9KRyjYwM0jlmEZ6WePBN2zhqm10cUQrMzWQJW4Iv3VxTN+323Z5K0GPFGdPq42R5f9gSXjOPY5VseGPcWgVwdI099zKAY2vzBl4idFieUTxD22w369/c9q0txH0Gqn3+Itf0FLj5kQ7ElRpbbhO8fPWRijYNMfmnTZGPbRvl7hVZsC3uOUubFQdgLISn4AOeV/qBE/alW/B3nVCNdbXGbV8jzYiJHKEzAWVhHDgTqD7R+lIo1uBLRfuRFIMUW9NyDddkwpg3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uxu9C54zkOj7o8PjPiowjD5RW3H6SWN57EYpP/B0nLs=;
 b=lOD/ElJ2kxmI5dFkc5jR1OjXBHImWs1pSeCR45OKaftpVBZuLebggZta2WpdY74Eng4dNjz/Gy1ZlKyfS5dTP9300sv+whQjX3lcQKMDB5P8rhTTENspl8B4caslB/1O8kvBzG/JdjmaJPHPhcgG+StyxMmGwnWQPUTGnvDh16HEg3DjvrAeE9TyB0zi/4vVIz/HCac2SsSD0kktcLrxa1yyV4BlZleCprf0L3I4SyDWyoExxH2kpp+m6goSbU1pfmtyGrPRGQDFCU1XdJEVm7RTI4Hv44lWPoiIR+YWajTD9zt531vl23eyNF8LtqK5A9XPS1cVSI2aazJvOZk79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uxu9C54zkOj7o8PjPiowjD5RW3H6SWN57EYpP/B0nLs=;
 b=L4ByY319LMVJ6HoxsUkKT14ci9gOk3DBNjrro+/EyXB3vC1xSsqxyKNJDyQC8+tG348lV4gTnOtEIuahQ/+tmMfUC/oO0hhBzjIQfM+BldvS/Tz7rpRPinmUaDbUlz0Y9cHsefdchUYCdztTItkKNSFgTuwr1aAoa+LP9oT7W3U=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEZPR03MB8321.apcprd03.prod.outlook.com (2603:1096:101:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 15:44:29 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%7]) with mapi id 15.20.8583.030; Tue, 1 Apr 2025
 15:44:29 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fshao@chromium.org"
	<fshao@chromium.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v2 05/15] dt-bindings: display: mediatek: add OUTPROC yaml
 for MT8196
Thread-Topic: [PATCH v2 05/15] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Thread-Index: AQHbmkSyqX5TDq7mV0qR8PPMXfg897OCd8UAgAyNmAA=
Date: Tue, 1 Apr 2025 15:44:29 +0000
Message-ID: <4565ce4d23c4d1ec044ac5e774d965abad65b881.camel@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
	 <20250321093435.94835-6-paul-pl.chen@mediatek.com>
	 <20250324160234.GA113887-robh@kernel.org>
In-Reply-To: <20250324160234.GA113887-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEZPR03MB8321:EE_
x-ms-office365-filtering-correlation-id: 2c81ff2f-e377-44ad-b306-08dd713416cc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUtQNHZmZy91WkkwWU4wNTg2VDZJZkxqaFZ4NlZrNjBud2lpZG1lKzJDWXNn?=
 =?utf-8?B?SzE0YVBoZ3Z6bXJmcFVlK3dQcU9zaGFCZ3dDY2R2QjJlQ1Bwc3cyM2srNU5q?=
 =?utf-8?B?ZkJhbS9Xd3N1TlpjVVVwYmprU3pzc1gxckZZaVAzSitwSEFxb2tCU1JSZWQ5?=
 =?utf-8?B?WnpkcTNqaXdpTnN1clp0aWNxTXNKUmticWdpUHpvSWFkNHBodStSb3REZm93?=
 =?utf-8?B?RGdmNjZTVk9BRXEvYUFCV1NQMG9OanR3Y1BzWkN2cHFBSktROFc5Q25HdWhD?=
 =?utf-8?B?dFF1ajJBY3FuY1d2Zmo4bWZTeGxlTXZlM2hEdnJiRGJCUEQ1eURUMkRjYWxR?=
 =?utf-8?B?QXdFU0lhQ2FVK0RGZ2IxKzdUWHBrRDliQ3lzZmJlUi9qeE5rMWFZbXpINSs5?=
 =?utf-8?B?VEdFMk9adEF0UUNyY21DditmZjd6Nkl2MzBWQVZaY0Nhb2VrekVnNVdSSm4z?=
 =?utf-8?B?bmpPamJEa2tBTmZBRnA4UVo4SU9ETjBlNEZ5VmcrRk5UNEJtdFR0SHEwczYy?=
 =?utf-8?B?L05iTUdDOWFTazRCUVZTby9QWVdmWnVXWm1sNFRQekI4QzBHQ2xSVjZTNVdh?=
 =?utf-8?B?dUV6SGI0QTR4Yy9FbzZSdWNIRmxwUnN5L0lYZFRpUW9uZGEwMzZHTEJKZWJt?=
 =?utf-8?B?dXNSSGFldWVjN3Y3S0Q5Mm9ncW1wdWRMakI1ZW1kQnJJN1psYjRQWGRSV21h?=
 =?utf-8?B?a3dwd09pMDVmMjViSlZyb01kd0JkcmxPU1l4QmNLNktQRjY1UjZlY0l5YUZN?=
 =?utf-8?B?TTNWdmlZSldOMzdPNUlNK202UlRpZFBQakdkWUltYzd1QkNCREFjck16bDg5?=
 =?utf-8?B?MTF0SllYNTRvZTkvMVlFYVlzMFl4YUM0MTBJazhsUUhadXRGZFphQTlMbWpw?=
 =?utf-8?B?bk1hdXB0b3BpUmV4d3c0M3hJQ1d4NzJSYTRESGlzTHluNGlIM3FPT29VUndQ?=
 =?utf-8?B?QVR6MTdKclZjVVpPUkVQak52VU5mbEdyZXB2WE9LVDJzOU9LY0tiS3lleDlV?=
 =?utf-8?B?eFltNDhhNWV3Z1orNUYrTDRXbkpCYVRKdmpjUGJBWEo3b3hMMDM3N09GQUlt?=
 =?utf-8?B?SU5rTWVtc2V4WDEvUzQ2TTlpWFIrU2pLUUk2SnVQdlNuVEhWcGd1VkZYUHhz?=
 =?utf-8?B?RnQvTlBqU1owcFFQN3BoUTl3SlhJMVNIZkN6SWxjc1dlNVBwUTc5ckYvbk5O?=
 =?utf-8?B?VFFFcHMzd2VSYmdMQzNxSEVkTUQvNGNJbjVzd0hpRGJhcGNxNThORlJ4aFYr?=
 =?utf-8?B?blYyRmlySTVKdmptelpYQkNJZkxKWHlxN1pQcCtDMkNmMHB3MXhNNytpNFJp?=
 =?utf-8?B?dlFmMlpFblpHSlNEay9peGUwRjc0MkJjcUJhWE94M1BnWDFIeWZMcmJhODV0?=
 =?utf-8?B?MWV0bWN2WGM2dEpsVFJsV0NjOFpJVXRrVW5mY05uS01ZR2RIU0tPL0ZVWlhD?=
 =?utf-8?B?L1MwYXFVRkwrL3NtNCszQ0p2d0ZrWGIzRTNVUDd1RWViOVlKVG9MWDcxSDI5?=
 =?utf-8?B?b1g0VS9UN3dUL0dBZVlFTzNCdGNOenhKSGU0aDlmdU9hREJ0V09YcWxGSnJi?=
 =?utf-8?B?MnBTeVhVOE1YejYvVmM1KzZRQVZFMVc1czB0c0FYTDVESVlqc0l6Y01sNXg4?=
 =?utf-8?B?cXZhSnBIVzA1L1V3eXN1SmlOTkloOThoZ3RGdHRyYXdyWFVFbkplVTRhQmF3?=
 =?utf-8?B?eHYzK0piM2xiMElla1c5V2tTc1RMZlIvak56Yzc2eFBVUVFwczM3d01JVysv?=
 =?utf-8?B?S2xEWGZKZXBLdzNYVFY2TVRaTHl1S0pWNWZVZE03c091SEwrNTZLYVJZZVFx?=
 =?utf-8?B?aFB6OHc3SmZYZElMQU9kSTZuREJncEljR0R5UXFxTzI3cmtFM2VUbFVDTzNv?=
 =?utf-8?B?ZTRScEhWTDJlZHpET21XMzJ6RGVaRTY1R1ZUWS83QmJUUGxzaHZEM3o3ajhn?=
 =?utf-8?Q?vTeIQ4FIUX8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG4zTDdPV3duZE1yQ3RKR05Yb0l0dUdqVFFmcFdGQ2R4WDZBbHZIdWsxOGI4?=
 =?utf-8?B?ai9zZmNkZ1JXMlk1ZFJQd1hyZVB6RGdRNFhkUHF0a2VIemw4RVlsdGxUUzBh?=
 =?utf-8?B?eUs3ekY2M2xCc0lDUDVIbEc2MjBoWW9CWEJ4dzhKcDB0aXI3T0NDWWducGNp?=
 =?utf-8?B?VDMyL0NET2FrUjJaVTJVdGNLK3lrTXloVnVBYng1Wm5tYnRORU9zYnZqMXRn?=
 =?utf-8?B?ZklTNHUwdGVJbm9GbG1MTzNZd0Q4OWxLckFraVVjRG96bmZIS0JVU2hoeGNp?=
 =?utf-8?B?Vks2dTBQcTRMbjdUVDIvSEVGOExWNlkwbWwzcmpoUlcvNllWOGREWWdITnRx?=
 =?utf-8?B?R2tCRHZiNmtuZkRjeVZLUDI4QjdrUnBlSzRTMGJFdTBsNkhiUmd1V0dkRjlj?=
 =?utf-8?B?cEdHQkJ3NFJDZ0dkdnllU2p5dG5VblhHUENkdjMvUkxTWnlsL2czUXJsODVU?=
 =?utf-8?B?REU1cFZybHMzTUdjcUljdDN1UHRFSzFlcHVNemNweXZEYzBFaTNPSGpIUHdC?=
 =?utf-8?B?dmhvakVDN0c0S2wzYkdLU29Ra3JGTzhNT09uRi9pSmwxQ0ZkUllKZThtbHkw?=
 =?utf-8?B?VEZPckJyTWpuWjdBYkI0QVo4cWJQWXV1TXRkdDRsc3NrYVlrNnZRbE9lY3Vr?=
 =?utf-8?B?N2pRSUNFVHdDU0RoQVAyNkg5eE1MemJPS1dSMVdDYzVuZW1TaDNXai93dWdo?=
 =?utf-8?B?K0RweVV5Sm9CWTVYdGlYc2w1MGVmZ3k5UVJTUENUL25pK2psUVIzUHNmMmFW?=
 =?utf-8?B?TkpTTmVYdGhYcDhVT1hlSTQ0ZGxCdGxzc2VEcXprekYwemc3YnFGR3lkeDZy?=
 =?utf-8?B?cUdjN1JSOEt2Y01JM05BN1NQYjdEVEk0SUU5OUFnMU5DWlordkFiK3B2K3Vw?=
 =?utf-8?B?K1Z2OUdJcnVTQ204bnJqQlUvaTFPNHk0VmNwOXQ2R3EzNGx2STlVVG9KTFJa?=
 =?utf-8?B?bW42WGdEYjZtNXgwMmxIMTlFNi9VeHQyS2tqaXpKR0xNSFl1UlFNenZEV1d3?=
 =?utf-8?B?cVY2alU2YXRLRTRaRUZFd3Ixc204UkhzTWlxRHRiS2pJaXpNbUJRSjM3bXpN?=
 =?utf-8?B?TmlaY3A5UEF2TDhCeCtWVzh6OHRSdVZ1WG1ISkxUWGlNR1RnRnFaN3VVODVV?=
 =?utf-8?B?MlZ3amswTEc1R2s1Y2JmN1VaOGcvcThmZTR0dGJZVTlTdkxab3dKbmxYMGZE?=
 =?utf-8?B?VmNJckhSNUtkTFkyQklTVEFWZER6WlVCRTlTL2N1azd6RldLekcyRTA3bi9E?=
 =?utf-8?B?aWNMTWFQa3A0RVdUQWNiLzVUbzhLZW04N0xlUGR6a3lKc0pNR1R6dXF4SDdn?=
 =?utf-8?B?SFBqK1VnMFhQQWRCZEFTRzRjY2l4bC81QTlsUnV6OVE5aVpWUWNVSFhlY1NE?=
 =?utf-8?B?T2NLL0lFUDVzYWpBN2g5R21qeFZ3eXE3NHFZay9zTXVJdEJ0aWh6UWo3ZDZX?=
 =?utf-8?B?R3pndmhRc0RNdTk0ZTR0TlRobkVJMkJEeVJrNXhGS25zaXNGQktDWmRkdW1E?=
 =?utf-8?B?Nm4vUDJPM0p6ejQyY1o1SjljNGNXSlBValg0VDNGWDdhV01yVVpzdFZBczYz?=
 =?utf-8?B?bFRld3V0OWVuamRRZ1ljc2ZOM01ja3NVYTZ0ZHpSc05kekpTNEk4NUN2WkJ5?=
 =?utf-8?B?a0Rsa2p6czM2eFg2SWJITnZJRFZ5UmMvOStZL29rV1dldEQ5TjJjVTE2SW40?=
 =?utf-8?B?YWFFSzd2ci9jaitlbFR1dGJXTTNNZmlkS1FtdGExODE2Q1dIN1hldjB3dXdk?=
 =?utf-8?B?OTF6c2xxc2YwazF1enNuQjNwb0VkRk1xc3M5QktHMCsxbDhud1lvQkVyaE9T?=
 =?utf-8?B?dGxxQVMrSFdIRlBWWHlCWDA3cFRtQVJFYnRMS3dJMVNMUDVjY2pON0IyY1Bi?=
 =?utf-8?B?TVZPcnlhSVJyT3FwTDZtUG5ETFhVRC9ObEF5N29MdHBuT2FsdFgzOEdDdDQx?=
 =?utf-8?B?MWRwZi9WZU82NDg5UVBjTGxlbEREM3hpRnpJUEFxUXpubENHa2s1MjJwc3ZZ?=
 =?utf-8?B?cnNReDVkcFFZTzNDV3dUWllaWXZzQ1BzZHM3R25PVjlhQm5ocVhsYVlXRnlQ?=
 =?utf-8?B?VWc5enJxdW8zTzgrYlhmcGNtc3ZKbUtqWU0vSFE1a3QwWkh3TE0wSVVkMVN2?=
 =?utf-8?B?UDdITzRUckdMVnBnTjc4c3NWSXpuR28vRVcwMk9PQmZtQ3E5d2ZSMitNb1JH?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <442C41116BBE3B4292BB44112DB33AE1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c81ff2f-e377-44ad-b306-08dd713416cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 15:44:29.1213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +U0oAFfJB8CWjOOQ9ag28op2Agr8TZpnPsM+IVXNxcP0zyC7sTgN/AXHWmV8oMtVyHh4OxyEooJr5ChwNhPiZQFX6iCgA8J+dZk+qSjMpR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8321

T24gTW9uLCAyMDI1LTAzLTI0IGF0IDExOjAyIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+IA0KPiANCj4gT24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMDU6MzM6MzRQTSArMDgw
MCwgcGF1bC1wbC5jaGVuIHdyb3RlOg0KPiA+IEZyb206IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5j
aGVuQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBBZGQgbWVkaWF0ZSxvdXRwcm9jLnlhbWwgdG8g
c3VwcG9ydCBPVVRQUk9DIGZvciBNVDgxOTYuDQo+ID4gTWVkaWFUZWsgZGlzcGxheSBvdmVybGFw
IG91dHB1dCBwcm9jZXNzb3IsIG5hbWVseSBPVkxfT1VUUFJPQw0KPiA+IG9yIE9VVFBST0MsaGFu
ZGxlcyB0aGUgcG9zdC1zdGFnZSBvZiBwaXhlbCBwcm9jZXNzaW5nIGluIHRoZQ0KPiA+IG92ZXJs
YXBwaW5nIHByb2NlZHVyZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsLXBsIENoZW4g
PHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqAuLi4vZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxvdXRwcm9jLnlhbWzCoMKgwqAgfCA1NA0KPiA+ICsrKysrKysrKysr
KysrKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspDQo+ID4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxvdXRwcm9jDQo+ID4gLnlhbWwNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxvdXRwcg0KPiA+IG9jLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG91dHByDQo+
ID4gb2MueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi5mNDJlOWFiYzE0MzYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrDQo+ID4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxv
dXRwcg0KPiA+IG9jLnlhbWwNCj4gPiBAQCAtMCwwICsxLDU0IEBADQo+ID4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFN
TCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxvdXRwcm9jLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFnaEdreUNTdTVJbXRfUWViMVJJ
NVFjTG1MZmFfUTFhRWF5R096UjJDSnNfeWtzX2Q3S3Z4UzNITEhfZTZTVldmNGJxOGlFbThnS2ZW
aHlQb3p3JA0KPiA+ICskc2NoZW1hOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktB
OXdNZzBBUmJ3IWdoR2t5Q1N1NUltdF9RZWIxUkk1UWNMbUxmYV9RMWFFYXlHT3pSMkNKc195a3Nf
ZDdLdnhTM0hMSF9lNlNWV2Y0YnE4aUVtOGdLZm9KLUtfaEEkDQo+ID4gKw0KPiA+ICt0aXRsZTog
TWVkaWFUZWsgZGlzcGxheSBvdmVybGFwIG91dHB1dCBwcm9jZXNzb3INCj4gPiArDQo+ID4gK21h
aW50YWluZXJzOg0KPiA+ICvCoCAtIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwu
b3JnPg0KPiA+ICvCoCAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+
ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiANCj4gRG9uJ3QgbmVlZCAnfCcgaWYgbm8gZm9y
bWF0dGluZyB0byBwcmVzZXJ2ZS4NClN1cmUsIEkgd2lsbCByZW1vdmUgdGhpcyBwYXJ0Lg0KDQo+
IA0KPiA+ICvCoCBNZWRpYVRlayBkaXNwbGF5IG92ZXJsYXAgb3V0cHV0IHByb2Nlc3NvciwgbmFt
ZWx5IE9WTF9PVVRQUk9DIG9yDQo+ID4gT1VUUFJPQywNCj4gPiArwqAgaGFuZGxlcyB0aGUgcG9z
dC1zdGFnZSBvZiBwaXhlbCBwcm9jZXNzaW5nIGluIHRoZSBvdmVybGFwcGluZw0KPiA+IHByb2Nl
ZHVyZS4NCj4gPiArwqAgT1ZMX09VVFBST0MgbWFuYWdlcyBwaXhlbHMgZm9yIGdhbW1hIGNvcnJl
Y3Rpb24gYW5kIGVuc3VyZXMgdGhhdA0KPiA+IHBpeGVsDQo+ID4gK8KgIHZhbHVlcyBhcmUgd2l0
aGluIHRoZSBjb3JyZWN0IHJhbmdlLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArwqAg
Y29tcGF0aWJsZToNCj4gPiArwqDCoMKgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTYtb3V0cHJvYw0K
PiA+ICsNCj4gPiArwqAgcmVnOg0KPiA+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4g
K8KgIGNsb2NrczoNCj4gPiArwqDCoMKgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICvCoCBpbnRl
cnJ1cHRzOg0KPiA+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0K
PiA+ICvCoCAtIGNvbXBhdGlibGUNCj4gPiArwqAgLSByZWcNCj4gPiArwqAgLSBjbG9ja3MNCj4g
PiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBs
ZXM6DQo+ID4gK8KgIC0gfA0KPiA+ICvCoMKgwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4NCj4gPiArDQo+ID4gK8KgwqDCoCBzb2Mg
ew0KPiA+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiArwqDCoMKg
wqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoCBk
aXNwX292bDBfb3V0cHJvYzA6IG91dHByb2NAMzI5NzAwMDAgew0KPiANCj4gRHJvcCB1bnVzZWQg
bGFiZWxzLg0KU3VyZSwgd2Ugd2lsbCByZW1vdmUgdGhlIHVudXNlZCBsYWJlbHMuICJkaXNwX292
bDBfb3V0cHJvYzAiDQoNCkJlc3QgcmVnYXJkcywgDQoNClBhdWwNCj4gDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTYtb3V0cHJvYyI7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDAgMHgzMjk3MDAwMCAwIDB4MTAwMD47
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZvdmxzeXNfY29uZmlnX2Ns
ayA0OT47DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDQ1MCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCB9Ow0KPiA+
ICvCoMKgwqAgfTsNCj4gPiAtLQ0KPiA+IDIuNDUuMg0KPiA+IA0KDQo=
