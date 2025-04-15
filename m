Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E783D4C96;
	Tue, 15 Apr 2025 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705007; cv=fail; b=o57wMuoTmdQQBt6ysuYlCRYiNyVDFU2h8uIA9WxnVbD4vB3UwDvvcuVHUOVpuXqbxik18MTFo7VzUOxLelylwSrWR10m1qLhXM0qN9w1GHY1Sa8I2hRpn0vNFL+Rn/BuP322147n0KSCp307f6u+IXQ/8//lOd9h88Ip5fhaTlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705007; c=relaxed/simple;
	bh=CldlGD4bw65j19UZLXn9Ae0GFfTXfTm1CqhPmtMElQw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HXELeFQ3S/PQ043i4qtiGl7dMdJhC9ffy32t/T4j+fq7dmeIXPYU1phg5Jt7/34iXJeehj7EcSCuMNePYlKotBNNUBdz90Dq61rZ8MRrTgoaMpXKYlvxQHeBAmhwNOih2mnxsduybgfvqCtMeMIpRfg4VQ9cScFsgVTvWdrVzpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g936qYeV; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=m5fWGKNL; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g936qYeV";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="m5fWGKNL"
X-UUID: f47d499e19d111f0aae1fd9735fae912-20250415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CldlGD4bw65j19UZLXn9Ae0GFfTXfTm1CqhPmtMElQw=;
	b=g936qYeVCzXPxqu1P7DRIuGzNMweVfCxuRfzknHoxciEIgTh0DpqVx6IHRisjgUvcZEvu0vSAUDQ96qH/K5ax8RkFoz/gJj/n81dPqpLxxtHgU92EfxfwlL/V0d4iK2kgg0RWx1w2YwkyU2PLUUjlzSd7iThTEPWvYTfYtelVTc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:310510d1-b7f3-4f09-ae25-f5c348788df2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:79c997c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f47d499e19d111f0aae1fd9735fae912-20250415
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 378445837; Tue, 15 Apr 2025 16:16:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Apr 2025 16:16:37 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Apr 2025 16:16:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENVHIABdreL0xSCvrPAv+F6SZj7oR5igev8JElb72wrFCZ1mkfCjw6LI7jU7nzfYBctopNRh5oxA50XzXzogw42tjquZzzrV2sHuFk8d9vMYzsNN0O/x9Q/T4vJ7GMpc/apJ9yq0glutnnpNernkyakQtQuCvrviyVYWRIxFGheYz/98TaSY/TAYdSCoNr4qt6LME/rpmHT/CjeRtO8bg4JVsWNnJuZ2kEhWeUC1DuFPfa2d9r3rxu/2X2E4UtkJRz5P2XRYQQ69edUumUGJD10GjTkiOMyjE7GXzlQgCa4qT+h7rinrIC/1/R5AyAUIyaYxzDB7NjQneuyWo54EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CldlGD4bw65j19UZLXn9Ae0GFfTXfTm1CqhPmtMElQw=;
 b=ODFjUuVzub95ThjOlB/jgQVwJkf5iXxpZfInk5fTKMoN4Ygnbyl4os7sQBwuNh5WGRoIHyiD9p7gZyA/o3BO+h4pFVD88SFc+IY9Q3PXDxucU63HH9qT/ALSHANCRf+SOl0OaPO4Yquk/uOMaIXff0M5BRpb+T6GBjLDz9gPmBQXBIOM5tPbBJyU5dKwTZbD4Q8ZaaNc6v4JdsLNEk87QY6blVfnm1iEqRP73fhcnI1BRjrybxyhU7ZOoRghym2Qn88U7esPlcunoMTudMl2Pa9TRell9NMNh2xVQR86+YUrV9jVnXrF7Yed4rj4gRwfTQbEJ98HSMXW+jy7d1FaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CldlGD4bw65j19UZLXn9Ae0GFfTXfTm1CqhPmtMElQw=;
 b=m5fWGKNLRpzaRFbWZulA9AZrya+b7NkSYseCqHIXTDXCiEwlSRXbqu/tI0p0UQ/VN6EO92XxEeqLrGLfZtfLn51Yvpm8YqpwXHOKWvqxRL5UCKMGCnX39qThwew+6HoJKVW9UQ2m3iibpw1+wU7LC+hFDPf+rEbXPBmGrDwDUJw=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SEZPR03MB7172.apcprd03.prod.outlook.com (2603:1096:101:ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 08:16:34 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 08:16:34 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	=?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v8 16/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v8 16/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbqVGAOVAUn7or+Ui6ODgXt7tC9bOeIhcAgATAdwCAAYg0gA==
Date: Tue, 15 Apr 2025 08:16:34 +0000
Message-ID: <69dc929a69905b7a251f601070e1428cb2e0aaa7.camel@mediatek.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
	 <20250409131318.108690-17-angelogioacchino.delregno@collabora.com>
	 <b9eafca53149fec817433da3d10bf06a6c96f959.camel@mediatek.com>
	 <bc6e0c12-2af8-4608-a05a-3d04209a4325@collabora.com>
In-Reply-To: <bc6e0c12-2af8-4608-a05a-3d04209a4325@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SEZPR03MB7172:EE_
x-ms-office365-filtering-correlation-id: 3c0a22c7-1aed-414d-773e-08dd7bf5d622
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dWFhY1RRdElXbkM3cmpycllaUFAxSjBELzZCenN1M0lPVXVDRWpuVldXUk1L?=
 =?utf-8?B?eEdRRHl4anRhNHNDVU5IQ3YwYVVhU2FWTCtVZ1hsVUpxb1JZamtGVTAvcGMx?=
 =?utf-8?B?djBTMnVQZFh6b2VDOHJDOVBsTE4zNFkycDQzOHpqRXAwZzhJYTRSak1jdWZL?=
 =?utf-8?B?SzNZbVN6T3lEcHFDZ0o2U1ZDUUpBczl0Nmw4dmJxM1dhVUFNVkdEMVU1cnp0?=
 =?utf-8?B?R1hGTTRFNmVyN25OSjh1RzJlTlBGSUF4SUg5ZmZsbTJyY2FhK1Y5eElMQUZt?=
 =?utf-8?B?QkN0SnJ0VWRnd01OVWhsb3J3T29qc2xmZFBYSjViNFd5ZndMZ2EzcmFtWkhi?=
 =?utf-8?B?N05hMUpnTC9hOHNQQnJZYlRIZWxTWnR2ekNxaW85V2g2Zk9RemN6aXQ4T0pC?=
 =?utf-8?B?RmlBY3lKMUF1b29tckZBSUhMa1FzVVNjVVI5eWUzb0Y1UGhCVnA2Q0Jmbjlw?=
 =?utf-8?B?QjFWWVMyYURTa01SSEsvM0ZSK01wY3pIcUZOYmdWZ0IwdHJDS2hsTmRnQmZ4?=
 =?utf-8?B?ZjNSMGhBWFlucFdEb0g4REhJU3hadTZXSjBwN1ZiVXVnSHVJNlpFdFFyd054?=
 =?utf-8?B?Z25uOWtUNWg2UmhkRFR6cUVmb0kzOWVlWEM3MFAzUzBoRTR4NWZnazc2cWJx?=
 =?utf-8?B?NDVZZC9MUitzYkZKQnRDZXdzVlh0T3YyTENkcFpheTJtOThzdStqNUpMbGRL?=
 =?utf-8?B?OW05VzlvWTJIZ0xDY2RGQSt3U0JEdnNiYzVIUDE5dGovWFhqcWV0TURybDNx?=
 =?utf-8?B?M2VSS2laVkpHSERoWlovTXdmdGEyVklSRVhjdFM4MUpyeWRrT3JDTm9Oclg4?=
 =?utf-8?B?enI0MUpiWXg5VUZKZEF2SjI2L0VzYm5WR2ZKK0JVSDNuMlJDRTBRclBXb2Ns?=
 =?utf-8?B?Rm5aT2ZoaEVoT2Q3cHdMNlE5R0tMQ0pRdmxhaWd6SVU2ZjZqY0t1cXVhODZR?=
 =?utf-8?B?bndnTnh2UE95ZnNKZGhwcmM3cTYrVWVqYU41Q2dnMjdpT0NVT0c5VWR3TWVz?=
 =?utf-8?B?SVNscXlON0srL3hNMEhuT25GSWNhYWxRS1VlYU5rMzRzeXpoM0pTTDZicHM0?=
 =?utf-8?B?cUpPYnBlaXdWWDIxcTZlSDBweXl6d2k1ZTJxNFp5WVZENGp0Yy9OZHVzaUpI?=
 =?utf-8?B?U09Ha1BjNlRSc3Q4OGZ4MU5VQlJYdEVwTU1iWkpQTzFLRU5MVmdkQUR1UWcx?=
 =?utf-8?B?clE5N0pFWGIrN2hYZGF6elUxUDlDQ1ZLNzdGNjVrWXVqSFpTdlk1RFV5ZmRn?=
 =?utf-8?B?UUlWYXVqaHNGcko1MzR1VU4wSHhRcVNMTkFuR1QzeU1pSWQyb0ZXS24zY3Ix?=
 =?utf-8?B?TEFrSXBDSFc4Vk9KM0EwUzBkdUF1dWhTODZRTkhURmp6MU1NOW5vN0NJdlVL?=
 =?utf-8?B?VUpDYjVrMTdXdDZBdGVhRk9UZlRQd1FUajBKYlpFc2h1anI2aWpicWNkQVMw?=
 =?utf-8?B?T0hrNXNES2hCODc5SDdNTFV3V2t0bE5DaDN1MEFqbmJPdDVJanpZdzNGVDdu?=
 =?utf-8?B?NEo4SHlUUUJ1Y3V3WTFRQTlucW9nVXFqWEdqUXdtR1BQVDIwRWdxK0Vmd25Q?=
 =?utf-8?B?dE5GdGVKdCtKcllQalVtL1ZSVmdtQVhGdlhTUlRRdEdsZUZjWEwrYjAyWEtI?=
 =?utf-8?B?eitTemdUK3YrRXhWTHhBYXJJd0hiM1l5elRHT1Q3cWY3YjZoVEV4SDdhdVRy?=
 =?utf-8?B?S0FDbkNHQkxzMzQvelFYeXdWWDVNS1pBdEFMZDQzWkFqNVVMLzNEa1JQRnQ5?=
 =?utf-8?B?YkM1QW1jZXJwK0VGak5QbHpHeGxaS3hMUTd4QW03QTlGQnh0cHUwZG9xbWdS?=
 =?utf-8?B?ZjI2VVRkOTRqZXp2Z2ZEUkJQVUR4OCs1Rkk2YUU0YzJZK1M4RWNLK1V0SW1i?=
 =?utf-8?B?K0YrQ2FEUTJiODJ3N2Y5T3ZVRkpVMXF6dzNHYTJIRnAwWWlCdUlGd2x0TTBF?=
 =?utf-8?B?K2RjUHNiOTB0VHdGMk1IdUphamJTazNYSVhJSkFNWUNIU0hyTmpITGs4MTZU?=
 =?utf-8?B?bDZPK0F0cXJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjN1U3lXSHpiSGpETjM4S2hvdEhyUGpFK0Q4TGIvM1ZlcTdCV0U2azNKdU9y?=
 =?utf-8?B?SmJVcjhJK2ZGdXR6WUpoWXppelEwMVI4aWJTOXdWc3ViY2tQRFozR3BOa21S?=
 =?utf-8?B?S21rMjFwYVYvVjVZck1Fc0U4NDNtV0ZTemdEaVdxMVdiRTYrSDNEK3QzRG1W?=
 =?utf-8?B?VTZVSEY5bWN2RStiQnJCV2l5OWkzTXlnNWlWRXd4YTBWa0l4TmZBcVZYZGE0?=
 =?utf-8?B?dFVQSTFRaEhJYzBKVEdndzBTRTJGS3dQaHEwUERUYnlrdGpGc0praVZIZnc0?=
 =?utf-8?B?bWtLVUFqdENrbVU5c1JncDMzWTBEVVcrZ0NLREJSUklyc2ZZcFRQcEQ4d0Fs?=
 =?utf-8?B?aEEyOElSbFVRRS9URUwwN3RDZU52b1NkME1mendKN2tZZlJML1dDWUJJdXdl?=
 =?utf-8?B?dHhXM1o1NENSbGw2YngyNjJjREQrMWZKSUtIMkpBSUNyamJXTjBkdFVzSUNw?=
 =?utf-8?B?Y21Yc2VIZjFrbzViY3dTMHJuaGpTN0RKNG54Y1pHNFNaMGxVM0dyQ0IzTnVT?=
 =?utf-8?B?MmZNWSt5VDZ3c0UwSHR5MkZhK2RFbWdLamEvdlVtR2tEMno5S0RTenJZcUNR?=
 =?utf-8?B?L21ZMVd2WGNiYVdnZnRJNkhiUW4ycjBySkdNY3hNM1FObkpsR1ZiMzJETjNX?=
 =?utf-8?B?L1RKSTBYdUh5SlFaa2hQYVltd1pRUURhbTdhS3NFb0NPWkJPdzV6elB0R0Zr?=
 =?utf-8?B?SmZQVkUraU5WUFVsY214V3M4NGRHOTVJcmMzZ1hBZXkvRVQ5WldQd20wRnRI?=
 =?utf-8?B?UlJ5bmNBa2FrN1RIYjAxTVlwUW9yZEJqeC9HaEV5M2dKVHBORWVyaFNCZEoy?=
 =?utf-8?B?TCtEMXhXUTZBbHcrWmtBMHpWVitsNWMrQWRlQUUzY0JieW9QbXlqOVJXYTdy?=
 =?utf-8?B?ZUVQM0VrbUI0dUVCdXFxT2twb2tDanUyWENxWThFOWo4MGJDRGpoekJza2tI?=
 =?utf-8?B?UTdYbnA2VVJNcGZieEVNRS9tYytuRzBKSXRDTE5ldEc1SGYxNWM0S3FBUXVp?=
 =?utf-8?B?VFc4alBhdjJzOU5ZSm11dDQ3N1N0clM2a0FYK3dlYzVZaUVEZCtMMlQxa0NE?=
 =?utf-8?B?MXJlNUJXVW95UDRkT29OSC9JTGVXYzVZVnR2ZlVEc1VBNkFHVUpwT0UyNWRl?=
 =?utf-8?B?UEd0TXFVQmRKV2Y4aWQ2ZkNiblNYdHJYUzh5TWR1Vy9KVWdTSVNaQVRpQXd0?=
 =?utf-8?B?bW8vY0xGN3h4bjFuTzBjbmtBdWdTMXZqdkhSMTZnaGpFaWtrNjdJeSthVmJT?=
 =?utf-8?B?MDByQXR4MkZuRHBEWVJqS2lUcXZkL2hVcWZpb2RTNVFuN2ltU0R5cjZRVE56?=
 =?utf-8?B?dXU4R3FVNzMxU2ZJV1FObmNyakEyc2VyVTdaUmZsSzAyZTdsYVA3NXN2bE1L?=
 =?utf-8?B?b3R1bnAxLzRoTW56NmZMcEdCK1Y3MEl4Mk9OdkhBSzd6TzQwRjZKZStqM1Er?=
 =?utf-8?B?SUcrMWE0N29Ed1c2bDdSK2NzOHBMUGJyemRrbGNKdlhYdGkrMlJDb0VlVDRU?=
 =?utf-8?B?OE1TaDFRVExNWm5KMzFjak5iZWhnT1ZabkZ0eUd0OTBVdHpZenZBYmt3cUxF?=
 =?utf-8?B?U2twQURkMXhGMzdwRjdTcGg2ZkZoWkI1UTRnVkQ5SW05Z2o0UDI1aWp4REFS?=
 =?utf-8?B?UDc1RTNGbStielpLYWdXTGlISC9rOCtXQjlwZng1K1o2a2lBQVZ2cUNHRFJ1?=
 =?utf-8?B?RUNyTy9tOVkwVW5yME5paS9QYmhKSEt1cDBlNGF6V2Z2RGJuZ3kwM0lIY2pz?=
 =?utf-8?B?UmhmTkpTUWo0bVpSYk1xNHVpUmpmNUJOUnZPQWhubUQ1bUo5aWROVTd1WXpI?=
 =?utf-8?B?cC9VY2ZKT3VOK3hxb29sRFJIT1l3b2laTkdoOFhpbmdzZi94TGpYN01ScHBt?=
 =?utf-8?B?c1BPZEM0MEpVbk1CeWZBU2lOa05pMGl5cTIyb2ZYZ0NTeDNCdzFHV0dESTl6?=
 =?utf-8?B?ZmVQeWtEYnh6cmFTL21NM1pHNmJtaktnNGNjNG5tZ1VDSzNPRmdLdDVhSytv?=
 =?utf-8?B?Y092eWgwYnhpb1c5REhPaEExb3FOVXpIT0tzUGtPUmRFMGlTbDRBOVQyUWhw?=
 =?utf-8?B?QWE5R3p3S1lEVW9ZemNmQlJ1RVFoNGd2VHc3MjJCQ04wYkZ3NmNqTXRVQVQy?=
 =?utf-8?B?aFd5SU5JWXNZTXk5anY1bmh5S0xtcHhiWW1KaXFIbXF6NzE0K2ozOHZpQms4?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7CA6F014E948F498A9FD1C2C34AA7DC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0a22c7-1aed-414d-773e-08dd7bf5d622
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 08:16:34.5695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bas9981G91k9zNjlBXcnovun915rbhfrct9uWnkCY7eqKtn/tyQcIi0M1B4SYZQ7sPR4TZGCEndYTvDUxMwCmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7172

T24gTW9uLCAyMDI1LTA0LTE0IGF0IDEwOjUyICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMS8wNC8yNSAxMDoxOCwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBPbiBXZWQsIDIwMjUtMDQtMDkgYXQgMTU6MTMgKzAyMDAs
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiA+ID4gRXh0ZXJuYWwgZW1haWwg
OiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhE
TUkgVFggdjIgSVAsDQo+ID4gPiBzcGxpdCBvdXQgdGhlIGZ1bmN0aW9ucyB0aGF0IHdpbGwgYmUg
Y29tbW9uIGJldHdlZW4gdGhlIGFscmVhZHkNCj4gPiA+IHByZXNlbnQgbXRrX2hkbWkgKHYxKSBk
cml2ZXIgYW5kIHRoZSBuZXcgb25lLg0KPiA+ID4gDQo+ID4gPiBTaW5jZSB0aGUgcHJvYmUgZmxv
dyBmb3IgYm90aCBkcml2ZXJzIGlzIDkwJSBzaW1pbGFyLCBhZGQgYSBjb21tb24NCj4gPiA+IHBy
b2JlIGZ1bmN0aW9uIHRoYXQgd2lsbCBiZSBjYWxsZWQgZnJvbSBlYWNoIGRyaXZlcidzIC5wcm9i
ZSgpDQo+ID4gPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxpY2F0aW9uLg0K
PiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICB8ICAxMSArLQ0K
PiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgfCAgIDEg
Kw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgICAgfCA1
NDIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaV9jb21tb24uYyB8IDQyNiArKysrKysrKysrKysrKysrDQo+ID4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uaCB8IDE4OCArKysrKysrDQo+ID4g
PiAgIDUgZmlsZXMgY2hhbmdlZCwgNjMzIGluc2VydGlvbnMoKyksIDUzNSBkZWxldGlvbnMoLSkN
Cj4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV9jb21tb24uYw0KPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5oDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9LY29uZmlnDQo+ID4gPiBpbmRleCBlNDdkZWJkNjA2MTkuLjk5NGI0OGI4MmQ0NCAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ID4gQEAgLTMwLDkgKzMwLDE4
IEBAIGNvbmZpZyBEUk1fTUVESUFURUtfRFANCj4gPiA+ICAgICAgICAgIGhlbHANCj4gPiA+ICAg
ICAgICAgICAgRFJNL0tNUyBEaXNwbGF5IFBvcnQgZHJpdmVyIGZvciBNZWRpYVRlayBTb0NzLg0K
PiA+ID4gDQo+ID4gPiArY29uZmlnIERSTV9NRURJQVRFS19IRE1JX0NPTU1PTg0KPiA+ID4gKyAg
ICAgICB0cmlzdGF0ZQ0KPiA+ID4gKyAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiA+
ID4gKyAgICAgICBzZWxlY3QgRFJNX0RJU1BMQVlfSERNSV9IRUxQRVINCj4gPiA+ICsgICAgICAg
c2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUg0KPiA+ID4gKyAgICAgICBzZWxlY3QgU05EX1NPQ19I
RE1JX0NPREVDIGlmIFNORF9TT0MNCj4gPiA+ICsgICAgICAgaGVscA0KPiA+ID4gKyAgICAgICAg
IE1lZGlhVGVrIFNvQyBIRE1JIGNvbW1vbiBsaWJyYXJ5DQo+ID4gPiArDQo+ID4gPiAgIGNvbmZp
ZyBEUk1fTUVESUFURUtfSERNSQ0KPiA+ID4gICAgICAgICAgdHJpc3RhdGUgIkRSTSBIRE1JIFN1
cHBvcnQgZm9yIE1lZGlhdGVrIFNvQ3MiDQo+ID4gPiAgICAgICAgICBkZXBlbmRzIG9uIERSTV9N
RURJQVRFSw0KPiA+ID4gLSAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9T
T0MNCj4gPiA+ICsgICAgICAgc2VsZWN0IERSTV9NRURJQVRFS19IRE1JX0NPTU1PTg0KPiA+ID4g
ICAgICAgICAgaGVscA0KPiA+ID4gICAgICAgICAgICBEUk0vS01TIEhETUkgZHJpdmVyIGZvciBN
ZWRpYXRlayBTb0NzDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gPiBpbmRl
eCA0M2FmZDBhMjZkMTQuLjc4Y2YyZDRmYzg1ZiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlDQo+ID4gPiBAQCAtMjEsNiArMjEsNyBAQCBtZWRpYXRlay1kcm0teSA6
PSBtdGtfY3J0Yy5vIFwNCj4gPiA+IA0KPiA+ID4gICBvYmotJChDT05GSUdfRFJNX01FRElBVEVL
KSArPSBtZWRpYXRlay1kcm0ubw0KPiA+ID4gDQo+ID4gPiArb2JqLSQoQ09ORklHX0RSTV9NRURJ
QVRFS19IRE1JX0NPTU1PTikgKz0gbXRrX2hkbWlfY29tbW9uLm8NCj4gPiANCj4gPiBUaGUgd2hv
bGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4NCj4gPiBCdXQgbWFrZSBjb21tb24gcGFydCB0byBh
IG1vZHVsZSBsb29rcyBhIGxpdHRsZSBiaXQgbW9yZSBtb2R1bGFyaXplZC4NCj4gPiBMZXQgdGhp
bmdzIHRvIGJlIHNpbXBsZSwgSSB3b3VsZCBsaWtlIHRoZSB3aG9sZSBNZWRpYVRlayBoZG1pIGRy
aXZlciBiZSBhIHNpbmdsZSBtb2R1bGUuDQo+ID4gRm9yIE1lZGlhVGVrIGRybSBkcml2ZXIsIGl0
IGlzIGFscmVhZHkgYnJva2VuIHRvIG1lZGlhdGVrLWRybSwgaGRtaSwgZHAgbW9kdWxlcy4NCj4g
PiBNYXliZSBzb21lZGF5IGRzaSBvciBkcGkgd291bGQgYmUgYnJva2VuIHRvIG1vZHVsZXMuDQo+
ID4gU28gSSB3b3VsZCBsaWtlIGhkbWkgdG8gYmUgYSBzaW5nbGUgbW9kdWxlIHdoaWNoIGluY2x1
ZGUgdjEsIHYyIGFuZCBjb21tb24gcGFydC4NCj4gPiBJZiBzb21lZGF5IHdlIG5lZWQgdG8gb3B0
aW1pemUgY29kZSBzaXplLCB0aGVuIHNlbmQgcGF0Y2ggdG8gYnJlYWsgaGRtaSBtb2R1bGUuDQo+
ID4gDQo+IA0KPiBIZWxsbyBDSywNCj4gDQo+IFRoZSBIRE1JdjEgYW5kIEhETUl2MiBkcml2ZXJz
IGFyZSBoYW5kbGluZyB0d28gKnZlcnkqIGRpZmZlcmVudCBJUHMgdGhhdCBjYW4gbmV2ZXINCj4g
YmUgKmJvdGgqIHByZXNlbnQgYXQgdGhlIHNhbWUgdGltZSBvbiBvbmUgU29DOiBoYXZpbmcgb25l
IEtjb25maWcgZm9yIGJvdGggd291bGQNCj4gbm90IG9ubHkgYWRkIHVubmVjZXNzYXJ5IGJsb2F0
IChlc3BlY2lhbGx5IG9uIG9sZGVyIFNvQ3MhISksIGJ1dCB3b3VsZCBhY3R1YWxseSBiZQ0KPiB3
cm9uZy4NCj4gDQo+IEFsc28sIHBsZWFzZSBiZSBhd2FyZSB0aGF0IG9sZCBMSyBib290bG9hZGVy
cyAoc21hcnRwaG9uZXMvdGFibGV0cykgaGF2ZSBhIHZlcnkNCj4gbGltaXRlZCBSQU0gY2FydmVv
dXQgZm9yIGtlcm5lbCArIHJhbWRpc2sgdGhhdCBzaG91bGQgYmUgYXJvdW5kIDhNQiBpZiBJIHJl
Y2FsbA0KPiBjb3JyZWN0bHkuDQo+IA0KPiBSZW1lbWJlciBhcyB3ZWxsIHRoYXQgdGhlc2UgZGV2
aWNlcyAqY2Fubm90KiBydW4gZGlmZmVyZW50IGJvb3Rsb2FkZXJzIGFzIHRob3NlDQo+IGFyZSBv
bmx5IGFibGUgdG8gcnVuICpPRU0gc2lnbmVkKiBiaW5hcmllcyBpbiB0aGUgZWFybHkgYm9vdGNo
YWluLCBzbyByZXBsYWNpbmcNCj4gdGhlIGJvb3Rsb2FkZXIgaXMgbm90IGEgdmlhYmxlIHNvbHV0
aW9uLg0KPiANCj4gSXQncyB0cnVlLCBwZW9wbGUgY2FuIChhbmQgbW9zdCBwcm9iYWJseSB3YW50
IHRvIGFuZCB3aWxsKSBidWlsZCB0aGlzIGFzIGEgbW9kdWxlDQo+IGJ1dCwgaW4gbXkgb3Bpbmlv
biwgZnJlZWRvbSBzaG91bGQgYmUgZ2l2ZW4gdG8gaGF2ZSB0aGUgSERNSSBkcml2ZXIgYnVpbHQt
aW4gZXZlbg0KPiBpbiB0aGVzZSBjYXNlcyAtIGFuZCB0aGF0J3MgYW5vdGhlciBnb29kIHJlYXNv
biB0byBrZWVwIHRoZW0gc3BsaXQuDQo+IA0KPiBUaGlzIGlzIGRvbmUgdG8gYXZvaWQgYmVpbmcg
aG9zdGlsZSB0byBvbGQgcGxhdGZvcm1zLCBpbiBmdWxsIHVwc3RyZWFtIHNwaXJpdC4NCg0KT0ss
IGl0IHNlZW1zIHRoZXJlIGlzIHNvbWUgY2FzZSBuZWVkIHRvIHNocmluayBjb2RlIHNpemUsIHNv
DQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBSZWdh
cmRzLA0KPiBBbmdlbG8NCj4gDQo+ID4gUmVnYXJkcywNCj4gPiBDSw0KPiA+IA0KPiA+ID4gICBv
YmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19jZWMubw0KPiA+ID4gICBvYmot
JChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19oZG1pLm8NCj4gPiA+ICAgb2JqLSQo
Q09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfaGRtaV9kZGMubw0KPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gPiANCj4gDQoNCg==
