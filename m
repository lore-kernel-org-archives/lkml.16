Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EFA1ADC86;
	Mon, 10 Feb 2025 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170706; cv=fail; b=PgHmTBR7yl9o4IqJlXp8oANpE0cNBBlFbwfhYd019cUcF6DaiowI/e75tH9twp2nMZ2SV5eOxiEBbjiyCrK4JQobllaegbo4rlKlPAE35SlF24PeIlr2EhIsdwM8brJ+stV01m3H8XK+3hZRL3DjpjQRnlegE9ho6jo8jhiA9i0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170706; c=relaxed/simple;
	bh=fqzZbHn6dcsXdz5nzkb4jVYoDc/W6FPYFiu+FkvtL5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i9PSE+xcESEo3K9hu5q8yjLSMaZZkgPIGWGqGH1L0TkG2FQeweQSqK+GpDeZETle52IRjgW67wIs5yinrKfb5LdydTH7CJWoP/cVPh6Ge5PtTIrpxavxc8HiHOZ0NzxxYpNIRpgKDtVXUuAk6OwjVkbe5W+pgNBNFLNinczlIkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KZHlwIJi; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=F7sTr52o; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KZHlwIJi";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="F7sTr52o"
X-UUID: 67e47656e77c11efbd192953cf12861f-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fqzZbHn6dcsXdz5nzkb4jVYoDc/W6FPYFiu+FkvtL5c=;
	b=KZHlwIJieZ2VSuuPT2G6qdUljgF0x+dEdurP7t3822rQ4pL06SQtkwp7RiWy/PTTeKD+tr/zgv8UGoq0DzuPG/MCFGphKI8bK0CcjxJ14i6sj2AlV1+tMuQu92bUXR/4AdXdasN1gc3pUdPBYZUTCERLCNQFLL9PyYKBfkEdoUo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4c28b8af-7c93-4324-94d2-c173f70998fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:c159503e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 67e47656e77c11efbd192953cf12861f-20250210
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1328610381; Mon, 10 Feb 2025 14:58:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 10 Feb 2025 14:58:16 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 10 Feb 2025 14:58:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/GmF6je5+aUP8IPqPLq1r4LWLZiaHAA/B8ZTEcSDWANY/QD0rGXBCyn7QRFmTMeQy2H1jFVz4I8CERU0aDMQBRlVmMGD+aovsZw0UL5ixr53EyemjooecAA4wC9EsW4OeTpKa7p2gnot9qBjWOZbGBywNp78CLsaSRXoYLqSND5T1U+gryctT+4EwyHKQqkVbBg8bb4QKt0RD2EyapTaFXPiVcpQH5ysqUgFFk5xFoBhACXylPLvLThF5cZPUKeWbfP8d8TlIU0ZNQrrJKj1Lo84Ggo4R9FsGBAd0dG3SZIGLd1k/0ALHsvbJFTVOj3LZWnt39RH/jJojvb5Me6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqzZbHn6dcsXdz5nzkb4jVYoDc/W6FPYFiu+FkvtL5c=;
 b=rrABvwxBQ9ZMqR+422EeFdUnVqCNWRf+rSKjoEW8INeZjlnRP7we8hsRCE62fu/pDY2Tt0TzoX7you8RSFQUqiXBQT1rZZjwV9fMUhLllOmSuikWw3LmemO2H57sffnKjKvgKoDTHQF82maZbjbHWQgg7nhuzFaNkQMgvkjcZsG964AqEWdjvmO/JFl1uueXWZ+8HRxDWwSk/ntKeiEVQxU7MomtdEIYu3OqOGMcvaEXna+VD6v7wW2v6+Eq2V5vnqWUkG25xRd1bwvUXnCQBPlYRukrf9DlcsxMOM2yZD8todJc3Pdny1F3hUD3S8KpZA51EF9keJtLMzmPya3J2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqzZbHn6dcsXdz5nzkb4jVYoDc/W6FPYFiu+FkvtL5c=;
 b=F7sTr52oN24e9gr1xjKGl4HncjrF3wsf8Q5TYmr3r5sv5d4/q2lkGt4Y8jY+vc4TMGhwPsr5APSJ0qYGJ7oTgBFM6xsVsTlHi3K2TcYIoAgxWfhYQPKYklogiWEU3b9wpkJTjSDdgof+9eQAO3TeNWb1Aey46pPs1Xp3K17Cao4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7737.apcprd03.prod.outlook.com (2603:1096:400:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 06:58:14 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:58:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 09/34] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
Thread-Topic: [PATCH v5 09/34] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
Thread-Index: AQHbZcr0PCYLPvrs9ESDJfQy6tmI3LNARrYA
Date: Mon, 10 Feb 2025 06:58:13 +0000
Message-ID: <38a949ea89ed322579d9cc1aa820c374c33adcfa.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7737:EE_
x-ms-office365-filtering-correlation-id: 947129e0-df5d-428c-5e92-08dd49a049cd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VkMyL0d6MkFoT1lqMVRuaWlSaU01MFJFeUI5TFVCYUdXWmNmN2ZVc3R3S0hk?=
 =?utf-8?B?emJYeUExUW1jOW1zU3ljNldSOVR0bHdrMnE1UnU4Y1ZWa3dqOXNqR05ZY2pz?=
 =?utf-8?B?d0h1eVFwbVk1UEdjQ21WcktDcEpzSXRZUmkxdGl1c2o5U0s2MFhaRngxT3RC?=
 =?utf-8?B?Q3FJN0k2aGdqSFJQV2pQVXl5V2RDQ3BuaWVBYU1YN29JK1huVHd6WjhGa2xn?=
 =?utf-8?B?R3RGRCtrVDNPbCs5dEZ1MXk1cEJRNmpsK1l0NmU5M1RRVUtYV0dGZ0FjNjc5?=
 =?utf-8?B?cUpqK3ZCZEhuMkJsRHp3cHJwWFZYeERsZ205QmkrVVd0YS9LU0Z5dkVRZU5W?=
 =?utf-8?B?cVNkeW11QWxiLzJYT0FjT1QyYnNJVUtWVkZxc21VUEJEVTMyVHhFSXdtWFIx?=
 =?utf-8?B?S3FPRXpXWkxLMmVsRnZoblVjOGlETEVTNFpXeXNyRWZvRUlCVjZOYURsejda?=
 =?utf-8?B?YUNYb0JacncvbnRTTUxBaGlneTNaTE9yMHZpSTBSWUd0SXRwZHM3Sk1pMVFS?=
 =?utf-8?B?RDJEVkx5NFdTVFA2MXJJZU1CT2d5blNIdEFCZUg4SjhzbzhITnJ4UDdlMHBT?=
 =?utf-8?B?Sy9CTVFaOHRZZTVYc1o2OHBOZ0Zqd0hhT3ljelE4T0FyVUdBRjY4L0M2TXc3?=
 =?utf-8?B?Y1FvbHNNVFhrd0VnSzZWamcvWHY3NmQxMDBsQkYzeHVXZjgwSy9FTDdnYVFS?=
 =?utf-8?B?ejYzT09RSGpSVUYxd05tLzhDRTFRZGRmNEZFYm9JcWFQK3ZLc0h0M2s2UjhG?=
 =?utf-8?B?djJ4RUFVT2VqL29zQ0gyekN6WVJMWHdHQjgrMC96UWtnM0dMNi85dUl3RGdr?=
 =?utf-8?B?Y3locTh5b28vbGVOWG0xK1pQZE52NjRDdjlYZjF5ODJyUUhWUVdNYWF1MUpB?=
 =?utf-8?B?WENWUU1YOGMyZC9oYUVMODYrME1nekNrS2lxdUZJbE93NkliUVdoeTlQMWxD?=
 =?utf-8?B?T3ZQQ1MyWGljc2ttQmErUzROMHl2VHVCbzZGTzNSQVJTcFBNVndvZEhKWmJv?=
 =?utf-8?B?dzV3WmUvTGNhZldPNkt4WFJXNlZMTDZmRnRuU29YdnZ0NHVpQSswajRjSlo1?=
 =?utf-8?B?UjBWWG5FM1BtNWs3K2lLZXptUkVPR1NMekZHTkx2MjN3VUpVVkNiT1dzdzBm?=
 =?utf-8?B?dkVCUnlzMk9jMFEreVV0VmFMaU9GQUZLSjBTM2tTZ0JxcjRQMjM5V0d0T3BO?=
 =?utf-8?B?Sm1sUm1TazByUldTd3N3V2g5ZHhoU0Z0eVN6YU5MNW1IM2FFODhvYU8zcXAz?=
 =?utf-8?B?TjdQejZRdFlEdGo4VW9rTmhHZkZKNDV0Y2NhR1VMREpDdnA4bFFoVDVoUFli?=
 =?utf-8?B?N0hyUlhWNmVlOTBWOGdCQ3F5Y2VnbDNpdFNFNHgrSjZYZmlGcnNoa2lpNjNl?=
 =?utf-8?B?amNIbkROMzJ0Qzd1WWtoeTJVZ08wcGVONFZ6TEVmditpc21xVWdSOStXMzJz?=
 =?utf-8?B?OW45c2NDbmtXZUxTZnhmOXA0R3pNWW9EdGs0L2FkK0FXRVRxT2dBQ0N0S3NV?=
 =?utf-8?B?NFVoSUQyaVJOTFVPRTR4QUUvWGZObWhpRXd6S293YWdKMW5oUjNXcnNuNVZm?=
 =?utf-8?B?OWk2dkVQeXhqaDhRcTZDdkduNGlhUnpCY3dTSCtObE1CRit0MHR6T0NNZ0hP?=
 =?utf-8?B?cmZqZDJ5ZFhkOFN1TmU2Q1NiSnoyNFVoY1cyWVVmQU1NOGZORHZKbHdMMFdF?=
 =?utf-8?B?NmVvcmwzbDVib1hjZDZHaWhPQVJScTRnWmFBclVyUkZjK3IwUmE0amt5ZVRO?=
 =?utf-8?B?RmFHU0RrdWhKQTlIR0VJUXV2cUtlblU1QmlKbXU1QlR5ZG5QbTdCR0pjWGpm?=
 =?utf-8?B?UXlOUTZLaE5QQUdETHR3bEpOWHRTUW1yd2RyTEd3L2IyOGxOUGhZbHdSU1dW?=
 =?utf-8?B?eDVxK2VZVC9OVnRERXV5ZHJ0dkQ5aXJKM3FwQVhsNzcvckFXTGpGelcrNlVr?=
 =?utf-8?Q?f0zgE3vx46RI7AOdmBvBIen1zRkfPIjJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1dIVEE1M2F6K2ZRcGVCWWZtdmFXSjlpVzA0eW5JUFBhcHQxSFpxMHphN0Nw?=
 =?utf-8?B?TTJQUlh5elp6eVMvQXpnYnZSQXZyRkZpanpIdjVnOHNpMFAxT1gyQTZKN0NF?=
 =?utf-8?B?TXI5VzN6WVQyT0xCbHFYZTdRSVdHd003alhLTklwSGFydjBaZEYvVGY4NWJy?=
 =?utf-8?B?a3VLN2JETHhSSnNodng1S3ltdVQrU2Y2dDdjU1VzVExWNTZMWFI1SFI1RHFO?=
 =?utf-8?B?cEE2N05wWHBTbGl4N3dIQzJlZU5ndkR4aWxOMmNoa2xDVGNrZlZjME9qVlBK?=
 =?utf-8?B?ME9lUFdrYVVhRndWVG5GK3JYc09oWnFjTnZpREptWmxJc09YNUV2Uklqd3Rk?=
 =?utf-8?B?NWZkbVZndWxRT1d5a2JOYVVPdHdHUU9ndEsyY0g5Q1hZYS93YXdOb1Fxakph?=
 =?utf-8?B?QUZZQjBZVVBpOGpzL0NSdTduZC9zbUFoaStZZVVScGtRdThDTXpBcWU2Tnp3?=
 =?utf-8?B?ZUFHQVRSYjF0dnArWTJIUUVCc0tMSUZTby9mRnh4eldKSEpKbTllZFdMRmVT?=
 =?utf-8?B?WnpLdzh0L01uOXVOY1Z5ejFyMlViSW5GTCt0bWxZMW5WTnY5b1M0Yy9DaU54?=
 =?utf-8?B?ODE2Vk1rak8rajFuUUJOTTdDNFlXd0tBbE5GVCsrSGFsbStzNC83K28ySTVZ?=
 =?utf-8?B?UjNoT21ISzFBNEg3QjBpRE9GeldQWndUa0Zvcm1OOStaZjU3eElkMGl4bkhs?=
 =?utf-8?B?YlFpd1dxb3dSQVpmWndBYjB2dG5vNjBKcGZBRk9aTHJlc2xWMzJseFhmQmVE?=
 =?utf-8?B?em1tUDJZMzVKRFRIbW1odkRHOUU2TktoWm9DajZudk80Wm5SdXpNcUVYdnov?=
 =?utf-8?B?MTBvSkpNWjJZVXlNZW1BT21FQWdUcUxrbk44aXg2WmlRRTJGZXJINHdBZk9m?=
 =?utf-8?B?M1JBMURybVY2allET0FxZHhvazE2M2lxY2FQbEV0KzZqMjdYak5JOW9zOXNq?=
 =?utf-8?B?Zkpla2VmaCszL01JdzNmZ3BMZE1qei9LMEVyQVdOSFk4dEhBQTR0SW9ZYzlJ?=
 =?utf-8?B?ZTl4eHNvYU5nSUtTY255M0Z2SkRWcUcyVVZDRzAyTEN2VzFXc0kxNDRZVHZj?=
 =?utf-8?B?WjcvZG9RcmY1L0RxMjJIUXREY2JYUW14ajBuSWkrMVgySDlxMktVcjVmVEl2?=
 =?utf-8?B?dkdsUXlpaUluUDQ2RXNSc0NYR1MweDdwUkVLU1lJTFJYaVNBQ1BJRVdZWlE0?=
 =?utf-8?B?QUZaS284eUhXOGlwQmRwSWVMTE5wc2Q4cCtlcXZGUmRIb3JPQ2RZb0J2dFli?=
 =?utf-8?B?SVgyMFVvSjZCNjFNWW1Zd2JiVXBTSGxvWlVxZ24xUFUwbGNhTWoxaGVRY2U5?=
 =?utf-8?B?ZUJ1U0N6Tmx5SWVlR2k5cDdGZkRDcjdSVkNIRXI5UGZGRVVTNUhrNXMySjVu?=
 =?utf-8?B?aVF5ekM4bkFxekR6VDU1N2UwR2o1MTI1RGpSVzBLcituRktPcTd2MXNwV1Jm?=
 =?utf-8?B?Q3R5dU43S0pyYmFEdVU3L3pRVi85Z2FJOEF3R2Y0VlVadFhLM1dzRXo0UFU2?=
 =?utf-8?B?bXkvZm5XdktUeVJETEJveWFjVFl6KzYvQXJ0MmhwbVQ5VFZqWWMrL2oxS3JM?=
 =?utf-8?B?UEwyZmpQQlVoNldFYkEyRXFpdTgrNFJaU1kwdVhUL3Fkc2VnRFNpbmJvYVVC?=
 =?utf-8?B?bVJKd2o3TStVQmpEZkRheE9Fa3E1SmQ0VGF3dng2QWlGMUpGSDEzdUVub3Nn?=
 =?utf-8?B?a0w5bGVaaThaRTdDK3ROR3drL0R6NHEyN1VlUUwyMDMxaCszdmZvZTJ5RHp6?=
 =?utf-8?B?dy9aU3ZPRHNwWmNKOFl6elNNdkpSdDJzRTNMRzhOSUpYY3FNdERsclNmcWp4?=
 =?utf-8?B?bHRQSEFrdDFkdlpPUjhVMkNTZXZkVk5LemFlV3dsbUdBcmdzekxWaTRySVVv?=
 =?utf-8?B?T1huNVNRcDhpQnNPWjVPaHhpaUs1dnFyMjJ5ZUZGQzcyRkh1YXUyaVlLMWNt?=
 =?utf-8?B?dWdrSzJKdGJVNW16RWhpcDloV0oyZUlFd25uMzRtR0RPTHhSOExrMWVVYlh3?=
 =?utf-8?B?REdVMElXdFJVYTdvcXFsNGlyTmYyMkViNWE0ajRCVFF5aEpFSHNwQ09jWjRN?=
 =?utf-8?B?L2pnMFgzcTA5SVJMRTg0MFZCTDBPZzJjTGZoTDhjblhPYis1V3lGWE5mSmhP?=
 =?utf-8?Q?DQyOrr6GlmBJNrdmaSRCjudi0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B15F2A83FB0BB345A1EAFBD54B10CA01@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947129e0-df5d-428c-5e92-08dd49a049cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 06:58:13.7681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y90NoWPAFAr8eYWEH65gwtl/7c4CX1zFBq+0FvZGosYNtNFML2wuVkZsFR7SB0uUJRqH/D3bF2S/pe95mCBEVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7737

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3Igc3BsaXR0aW5nIG91dCB0aGUgY29tbW9uIGJpdHMgZnJvbSB0aGUgSERNSQ0KPiBkcml2ZXIs
IGNoYW5nZSB0aGUgbXRrX2NlYyBkcml2ZXIgZnJvbSBiZWluZyByZWdpc3RlcmVkIGZyb20gdGhl
DQo+IEhETUkgZHJpdmVyIGl0c2VsZiB0byBiZSBhIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIgb2Yg
aXRzIG93bi4NCg0KQ0VDIGlzIG5vdCB0aGUgY29tbW9uIHBhcnQsIHNvIHRoZSByZWFzb24gaXMg
bm90IHJlbGF0ZWQgdG8gc3BsaXR0aW5nIG91dCB0aGUgY29tbW9uIGJpdHMuDQpJIHRoaW5rIHRo
ZSByZWFzb24gaXMgSERNSSB2MiBkcml2ZXIgZG9lcyBub3QgdXNlIENFQyBkcml2ZXIsIHNvIHlv
dSB3YW50IG5vdCB0byBidWlsZCBDRUMgZHJpdmVyIHdoZW4gSERNSSB2Mi4NCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgICB8IDQgKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19j
ZWMuYyAgfCA3ICsrKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
IHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmggfCAxIC0NCj4g
IDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiBpbmRleCAzMmEyZWQ2YzBjZmUuLmJkZDNhMDYy
Zjc5NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiBAQCAtMjEsMTAgKzIx
LDEwIEBAIG1lZGlhdGVrLWRybS15IDo9IG10a19jcnRjLm8gXA0KPiANCj4gIG9iai0kKENPTkZJ
R19EUk1fTUVESUFURUspICs9IG1lZGlhdGVrLWRybS5vDQo+IA0KPiAtbWVkaWF0ZWstZHJtLWhk
bWktb2JqcyA6PSBtdGtfY2VjLm8gXA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgIG10a19o
ZG1pLm8gXA0KPiArbWVkaWF0ZWstZHJtLWhkbWktb2JqcyA6PSBtdGtfaGRtaS5vIFwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfaGRtaV9kZGMubw0KDQpZb3UgZG9uJ3QgbmVlZCB0
byBzZXBhcmF0ZSBtdGtfY2VjIHRvIGEgaW5kZXBlbmRlbnQgbW9kdWxlLg0KWW91IGNvdWxkIGlu
Y2x1ZGUgaXQgaW4gdjEgYW5kIGV4Y2x1ZGUgaXQgaW4gdjIuDQoNClJlZ2FyZHMsDQpDSw0KDQo+
IA0KPiArb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfY2VjLm8NCj4gIG9i
ai0kKENPTkZJR19EUk1fTUVESUFURUtfSERNSSkgKz0gbWVkaWF0ZWstZHJtLWhkbWkubw0KPiAN
Cj4gIG9iai0kKENPTkZJR19EUk1fTUVESUFURUtfRFApICs9IG10a19kcC5vDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19jZWMuYw0KPiBpbmRleCBiNDJjMGQ4N2ViYTMuLmM3YmU1MzBjYTA0MSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jZWMuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jDQo+IEBAIC0xMiw3ICsxMiw2IEBA
DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+IA0KPiAgI2luY2x1ZGUg
Im10a19jZWMuaCINCj4gLSNpbmNsdWRlICJtdGtfaGRtaS5oIg0KPiAgI2luY2x1ZGUgIm10a19k
cm1fZHJ2LmgiDQo+IA0KPiAgI2RlZmluZSBUUl9DT05GSUcgICAgICAgICAgICAgIDB4MDANCj4g
QEAgLTEwMiw2ICsxMDEsNyBAQCB2b2lkIG10a19jZWNfc2V0X2hwZF9ldmVudChzdHJ1Y3QgZGV2
aWNlICpkZXYsDQo+ICAgICAgICAgY2VjLT5ocGRfZXZlbnQgPSBocGRfZXZlbnQ7DQo+ICAgICAg
ICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2VjLT5sb2NrLCBmbGFncyk7DQo+ICB9DQo+ICtF
WFBPUlRfU1lNQk9MX05TX0dQTChtdGtfY2VjX3NldF9ocGRfZXZlbnQsICJEUk1fTVRLX0hETUlf
VjEiKTsNCj4gDQo+ICBib29sIG10a19jZWNfaHBkX2hpZ2goc3RydWN0IGRldmljZSAqZGV2KQ0K
PiAgew0KPiBAQCAtMTEyLDYgKzExMiw3IEBAIGJvb2wgbXRrX2NlY19ocGRfaGlnaChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQo+IA0KPiAgICAgICAgIHJldHVybiAoc3RhdHVzICYgKEhETUlfUE9SRCB8
IEhETUlfSFRQTEcpKSA9PSAoSERNSV9QT1JEIHwgSERNSV9IVFBMRyk7DQo+ICB9DQo+ICtFWFBP
UlRfU1lNQk9MX05TX0dQTChtdGtfY2VjX2hwZF9oaWdoLCAiRFJNX01US19IRE1JX1YxIik7DQo+
IA0KPiAgc3RhdGljIHZvaWQgbXRrX2NlY19odHBsZ19pcnFfaW5pdChzdHJ1Y3QgbXRrX2NlYyAq
Y2VjKQ0KPiAgew0KPiBAQCAtMjQ3LDMgKzI0OCw3IEBAIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
bXRrX2NlY19kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBt
dGtfY2VjX29mX2lkcywNCj4gICAgICAgICB9LA0KPiAgfTsNCj4gK21vZHVsZV9wbGF0Zm9ybV9k
cml2ZXIobXRrX2NlY19kcml2ZXIpOw0KPiArDQo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk1lZGlh
VGVrIEhETUkgQ0VDIERyaXZlciIpOw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCBjYTgyYmM4MjljYjkuLmRhNzI1MTgy
ZjBkYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTE4MDUs
NyArMTgwNSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19oZG1pX2RyaXZl
ciA9IHsNCj4gDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciAqIGNvbnN0IG10a19o
ZG1pX2RyaXZlcnNbXSA9IHsNCj4gICAgICAgICAmbXRrX2hkbWlfZGRjX2RyaXZlciwNCj4gLSAg
ICAgICAmbXRrX2NlY19kcml2ZXIsDQo+ICAgICAgICAgJm10a19oZG1pX2RyaXZlciwNCj4gIH07
DQo+IA0KPiBAQCAtMTgyNywzICsxODI2LDQgQEAgbW9kdWxlX2V4aXQobXRrX2hkbWl0eF9leGl0
KTsNCj4gIE1PRFVMRV9BVVRIT1IoIkppZSBRaXUgPGppZS5xaXVAbWVkaWF0ZWsuY29tPiIpOw0K
PiAgTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRpYVRlayBIRE1JIERyaXZlciIpOw0KPiAgTU9EVUxF
X0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiArTU9EVUxFX0lNUE9SVF9OUygiRFJNX01US19IRE1JX1Yx
Iik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuaCBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5oDQo+IGluZGV4IDQ3MmJmMTQxYzky
Yi4uZTQwYmM0NjUxOTk1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuaA0K
PiBAQCAtOCw3ICs4LDYgQEANCj4gDQo+ICBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyOw0KPiANCj4g
LWV4dGVybiBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19jZWNfZHJpdmVyOw0KPiAgZXh0ZXJu
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2hkbWlfZGRjX2RyaXZlcjsNCj4gDQo+ICAjZW5k
aWYgLyogX01US19IRE1JX0NUUkxfSCAqLw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==
