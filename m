Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC21990CD;
	Mon, 10 Feb 2025 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168532; cv=fail; b=oyXqYedMlbc/yDIrbUCyuFBxRNsls4HPYApUx6zgyTIv+dCd7CRRgTJ8bDWoYp2w2aCVLfOc9vJy0CBwOmXEgT+9fjpmSvkdc30KgjUyAgPPTUR3tJHy/o87ldvQI0uuEutHRX87UgC3rGFZUHG3SZsdpkwu8SHD0i9qaZlsI7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168532; c=relaxed/simple;
	bh=YWDEWbSO+NAkMzx6iC2qmlCUKdam2SXohpOaGUqQkgU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L8Es2A3PRY12jw82cq2koAtAoC6aoHroVnT0Be2/Hlor7mMqe1Y4LQX1HHGkppxZVwOK132CFbhnAANsfYNo4wqdMV87tVTKkEQ6IaOGtVtA6frGX2Bg01NyRdKh96B4uvQL7PjLqPzzr3EFHtgcgZbSnmUYSUTUborGSeZbUSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FdpX/9B0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=BJM/NPEX; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FdpX/9B0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BJM/NPEX"
X-UUID: 58d7bd9ee77711efbd192953cf12861f-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YWDEWbSO+NAkMzx6iC2qmlCUKdam2SXohpOaGUqQkgU=;
	b=FdpX/9B0ewQaKA+FQLwQllKENzVkC5d6KhzWW2ZmYKsVz4P1M8yYnNmscv+ot1ZGCSPK1/R1iO03BZqDCMsuwIpHIwLFUK5Udo22ZvYAsS+oPpawIoJUEfE/vUIL18RKORuI+NUMyPyBdWxHqwGwgdKRvCwykdiznTWUQtmyAp0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3158c994-dea6-4ef1-a203-895063b38eb0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:dbba4f3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 58d7bd9ee77711efbd192953cf12861f-20250210
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1255117869; Mon, 10 Feb 2025 14:22:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 10 Feb 2025 14:22:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 10 Feb 2025 14:22:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gfa054gIplugPflQe9cJpdVMQDQEo+NMvJzRsxTvrCVH8eqaJWypFYg1Sv7cgGktSxJiQrjGhk/6nwPeeOqbxyhVGQgfhNvlAEmPAN6UCJNw3N1Iz30Zw4lRuhaWWN6fzkrRSX8TUX3CX2I70HK3Q1JbsfyLVfI7mftCcg8o4u4ptyasL8BFQSa8BrA0kJf/XfIqYlDABEnxj0jGuupC87HZOs0Y6QxFwBzoafhh2msOBv4dbj+qEXInYusfjfopoT0PV2OLAkoLD2DM2nZRjLc/8MtxeYrRp1h5sdNvE3ZIAoRW5VFj1TcyVOhh4ZJ++0lNVUmv9CpucGeFsjJlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWDEWbSO+NAkMzx6iC2qmlCUKdam2SXohpOaGUqQkgU=;
 b=VDYzKAE6HQwYpFhzQ9T3PaAJCHG2k5e3T3LZGQs3M8kQLLGCtq5h6P3QqokNNFjEcdDcALyODMQC5g36Qvzw2UFKf+YVxHucCwNLL0lqjQr54gVZ/qulmSUEGyGB/j9KFgMqb/GgXZbtUu7aPTmMqB45Zi4+3IcbHSJj5hB7MIEnVKfLzymYAzYLu5COkiqUFcx8tb5V4I4jTU+jWJ35RkE0vTmtXemPxythIdB1/wj4RjA/NPFsQ8pUQodpfS0w4MAFQHMEi9wBdL8M3P8SD71C8i3lxQbTttUDHf1/WLe6OSi2Oh2kX2ZcInDOd5yJ/tIbSVV8rm2glnEsAjqN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWDEWbSO+NAkMzx6iC2qmlCUKdam2SXohpOaGUqQkgU=;
 b=BJM/NPEXqVigEA0w3lpUsBSRy3I9Juhnt5IOe2TatfUOKHiKgfgob8KQxBHt2N2fxyOyd8xFFEINH936C9TwRh77SUHX9SmKi40knJfSkuonetQbeCO25+RQkdVAEXwJbFTMK5Cb628WdwWFU9GKO8pGxd8dIHBCWj3/A0aZOvo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8196.apcprd03.prod.outlook.com (2603:1096:820:109::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Mon, 10 Feb
 2025 06:22:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:22:00 +0000
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
Subject: Re: [PATCH v5 21/34] drm/mediatek: mtk_hdmi: Move CEC device parsing
 in new function
Thread-Topic: [PATCH v5 21/34] drm/mediatek: mtk_hdmi: Move CEC device parsing
 in new function
Thread-Index: AQHbZcr4PT+nXPH+skmF/H/3ENVNmbNAPJiA
Date: Mon, 10 Feb 2025 06:22:00 +0000
Message-ID: <bdd6e4dac0db87cf8f2c6e23b2b679cf58b9f3a8.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8196:EE_
x-ms-office365-filtering-correlation-id: e5833e1f-3d2e-4214-4f64-08dd499b3a79
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGJWUFZpTDhHM0F6RmYvZnNxTUNTRS9jRHBMMkNOdFJTS0xxck51U3dJUFdY?=
 =?utf-8?B?d1ZibGF6T0hKU1lnSVl3M3h5YWRTdGExM0ZiN3hLMmwrZklRT25ia01NQ2NF?=
 =?utf-8?B?V1VTTWtKZ3JQVHp0a1A1ZjRSTzVtQnFhVFo5TGlqK25udXcvM1lod0gxMWYv?=
 =?utf-8?B?cUxia1Nta1ZtdG5KS2EzNHUwTHQrUVByWGVLaVRwTVI4RzlOU2dlTU1WNHNj?=
 =?utf-8?B?dmdkM0xNSERpQ2l5YzM4OWVHRnR5ZVBRMytQRmZMMEV0VDh5cVNjRzR6U2s4?=
 =?utf-8?B?cVZBdm9wRXVGbXV0RkRjWXVSRGs4MjBMbnQ4aUw5SjNEQXpBcXdmbXlNQ1Yz?=
 =?utf-8?B?ZXJYeUU5anFMNUlocnpDeUszN25uY1l4am1EY2RibTU3NlZid2xKQnhpWndW?=
 =?utf-8?B?V2IyZkZsV2ZMWWJ1RDIzVTUrSDdUd2IyNk5uZ1c3MFBpWkNaMENuMGFOSGNB?=
 =?utf-8?B?cEFnRTg2OUNKNmRaL1VuaHgrSmgxU1FQZGZEemErZ0UrdTFBanM5WkV3ajJH?=
 =?utf-8?B?L2dHT2tGYWZic3NvNTdSbXdOczJQczVjRzYvRzN1K0cwUXBoZFBJMXJRYlVZ?=
 =?utf-8?B?UWFDbUZzb2NjYmM2NDRQLzIrWlhNL3dNMmI5OXJxaGtPeTJQL2xOSTFzMHJQ?=
 =?utf-8?B?RUphb1c0ZzNqdnRRc1gzbU40bkxRLzRNL2xUWHMrU21vQ3BzV3BnN0w4T2Fr?=
 =?utf-8?B?RWtXVDRNYjkyU3Q4amtjclJOdTNiZzMrTmlxMzhYSXZTRW1BZmNwQngzckxk?=
 =?utf-8?B?ZEh0THlEQWRVdEVhczhXWmpVY2dURGVYSTdHc2F2dGFsWVk3Q3VsSDNpb3Jq?=
 =?utf-8?B?ZWgzczhITFY1bDA0NkxqVjhFM29WeVhTb2QxalJLT0J1ajBZOWYybXJrVXBH?=
 =?utf-8?B?TXoxU0ZBc0NKelRRL0FBbzNqWkFSTnN2TURYUFl1aTNaRU5sOGpQQjV6NWl3?=
 =?utf-8?B?YUdTNHo2ajVWTm9HTXBOUFZFWVgwS1IyZTVDYmdwdG96aHBWT0g4QXU3TEow?=
 =?utf-8?B?dkpxOFd0dk1ML3d6WnEyc204WG5lSnRBRU1WNm5QTi9QbWZsM1U3S0NlaVBT?=
 =?utf-8?B?OHE4VzE2RnpVQVdBWmlEK2I1VEpQeFlzaUZtUTlCMzV0VStKdXR1aklEekRW?=
 =?utf-8?B?dFc4MEROR0pweUY0M3g1TTFsdWJVUGVjU3loMjJQVzQvbHRMVFV1RXZ1MnFz?=
 =?utf-8?B?Q0kzcnhGVHJZUlZ4Um8yQlEyMWxOK3NSZ09BZFFQTXFiYlZuMVRZaEY2MDl4?=
 =?utf-8?B?UGNPUnh1a1Z3ZlpGL2QwNkZwOW85bk5Ca0xHU25GYUR2ZStWK1V0WFc4TTlU?=
 =?utf-8?B?Rk9wdms3bkc2V2VRbWxFV3pTcTAwMlhydlpIdFloTjd4WGJLUFJqTm9mWCth?=
 =?utf-8?B?SzhpVElRanpnY3JsRTRoVVZxNmFlZ3hOQUNzMFJaZnRRWGMweGh5bjFlUm0v?=
 =?utf-8?B?ejNIRDRGTUNJNVFMRWtEZWY5VWY1eFRCVlp2c0VhMU15QTFSS0RZUmw4TTMr?=
 =?utf-8?B?T3JuQlhMNkl2TVNLRVYwL1Z3MEwvNytCMkpqeTZZcEk5NW5jVVNlRjMrQThL?=
 =?utf-8?B?Z0VuSXdvUFJmVzNjVytKSFhaV2pYcHNNb2FjNU1Jam9UM1hoN2o2VFRwMTJO?=
 =?utf-8?B?bDZEWFd5bG5WRDhBeHdwdkdvQ3BIbEdDbk5lN1ZCcEM1czM5Y3pkRFNENHZx?=
 =?utf-8?B?VjhudU50d25UNEpQakhZQWRnTHdXQy9zc2g4VXVpdFA5VGNRSlpKVEJSZkxN?=
 =?utf-8?B?UWQ3ZFc2S3JrV0I3dGNLdkY3eG9nN2luS0RvUUxlVXJReGdjcCtBY0ZTUG9L?=
 =?utf-8?B?bjAwcy9UY1BvL2VTclZqMksyaFIxeXphamg0TCtSRjViY3hmVXcwQXRRSUt2?=
 =?utf-8?B?L1RmaVlYemU3NnIrU2RxTXI3Q1Q4b2llb0cxbVdtNzlSUGw1d3liT1Iva21U?=
 =?utf-8?Q?jsQkSOP80o4UntgSWr74Cu1mg9vp0RYv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm9NL3lzUk9PdXY1TTg2RnJwdlhvMzZBNFIzci9MN1FiaW91Y0VYWisraUI2?=
 =?utf-8?B?K2VVTFlKazg0dWMxaEZmWnhtWE4zalpwNXZvblIxL2NyYTM3dlVHVjFEQWw2?=
 =?utf-8?B?cVpldXEvSU9wbzh1Wm9sMDBCTmJZZjFNVU1jdWlnYnM0Q09oam5zV0ZkS2tL?=
 =?utf-8?B?eWowMm9hOEZsSU1yTVl4WFJ5WlhDQXp5WkFZNjMwWFpuYXVwQisxYnBLa2c1?=
 =?utf-8?B?OVNqTWlob05JOENKcDBvMW54N2g3RGNWQmpmaHFFN2FYTU15bExxQUtleXhj?=
 =?utf-8?B?RDhILy9XVVVrWVBWZ3VYODExdGEwR0p3T0l3Y3lMcmJhSkVERmNLVHlMTUVo?=
 =?utf-8?B?Q2RDRWVtbmJXUHBhUExhSmQzK2lnOHA4ZHNNR2dhUlRXeVVYVG11aFJGQzJ1?=
 =?utf-8?B?dTM5WW5HNnlBSFU0MjIxZWtrbi8xTnlIRmthZWpvdFhRL21qT2F4ZEtqVGpG?=
 =?utf-8?B?Q1kwTlBpVmJyS1hqNmYvM1pFdk1OT1RBVHNOT2JmaGlTWTk5K05FQ1A2S0Qr?=
 =?utf-8?B?blpqYzZ3MTZqRDgvSHUwdTRVSW13WWZxNk9vajJYTkhWNS9wbDRmbWNlNDlD?=
 =?utf-8?B?ZkwvcHNjSE0zWDFOcUdxRU54UUEydDhpREpYRGNYaHlWTDNDZmloT2FCakU4?=
 =?utf-8?B?cmFFUzJ6SXZUV1ZRUnZaRmZLQWdJN3VHZmRiOFcvLzkxelJXdFdSdjhOS1pE?=
 =?utf-8?B?QVJyS2Z5NzRjZGFZcUFJNTkwN21wN0RrcEdRdHBuclNpMS84a3ZnL1NsbjRu?=
 =?utf-8?B?ZnNKQ1VEV25XWlFnbmgrVlo3T0NRcXJuQnJxekpJUVh5YkZVaExiUDdtWloz?=
 =?utf-8?B?MVhRaXNzWndWUnRqeTdTTndzcDJxdGlJcmorTSs5RWVDQTcrZGxDdllsNml5?=
 =?utf-8?B?cWxSM3hveUQwM01xU2J4YWcvOThUc2FaQ0hvYkJ2eGw4V0pJQWxHTTYrSTBu?=
 =?utf-8?B?c2dGMGRzajJnMTdzQ0xyOWQ2VmQ3VlBMN0toRU1KODdwbzc2aVZDL3VyeDlS?=
 =?utf-8?B?QUpsT1JRK3U5ckc3V2Z0b2JtZm5YMW1tL2QyaWgyV0FIbDhUMHI1T1ZvdVJ1?=
 =?utf-8?B?bU9CeTMxeEwyc2YxSm5SNDVRYnpoWEdTeHpmY3lkK2REYXd3cFI4dGNUMDQ1?=
 =?utf-8?B?QUdZM1B4NWp2Q20rQ2hTR3B0NjY3d212Z0FsdGQ5UmduRUEyTUthMkxCRndq?=
 =?utf-8?B?aUNCT1NCaUZnQm90eTg4aFFqK1o1bE5sMktXbUJYeG5TK0J5UlJlNkx0YWtG?=
 =?utf-8?B?d081NWN1WE1jbWxXczFnYms0Vk8yRlA2NXRud3UxYU5HenJnamh4RHJ2N3ZS?=
 =?utf-8?B?VWloMDQzSVhzbzFtcXlaaG9uelVHMlZZUWJUN3J5akNqQnVCNkk2eXFJc2JS?=
 =?utf-8?B?aVVkRzI4blFZc0NOTjE3WDRnZjdrSnFqWjdHdW1hY0N6ckw0Um5wdkdSQmh4?=
 =?utf-8?B?OUtDSGs5NzUxaE9BWWU5SnZ6VVJiVy9ieHhlWnRsVVFDa3owRGYycVRiaHVK?=
 =?utf-8?B?QkFWYjdBS0l5VncrcDlsT01KekU3OFVyQlpqaDNlOER0aytja0lPM08zMk1T?=
 =?utf-8?B?R1gwcStKTHdkSWFMTU5WRGFSeVF0Ky9YK21JRjg2MjJ3aVY5cUkrdW5xbS9x?=
 =?utf-8?B?WGJQOC9mQS9nQitHYnFDV0czMzYvaG55a1RvZ2M0ZlV0cTEvK21uR3RhUXQv?=
 =?utf-8?B?cVlEVkZQSDBxMEg0SGUvZUpjT1ZMb2dkNGVKaWpQTTVObVRudXZBV3l3eGdk?=
 =?utf-8?B?V2pQOUxyZ1MyMnA0R2FrMFpKZ2lma1NNYi9hSzljRkxOQ0trMlJHUGVnZGl0?=
 =?utf-8?B?eXFqTGdKVlZQZ0ZDUmJIUE9nK3h5LzRwWUVPKzBUNHdxNkttV2g4N21rQjdl?=
 =?utf-8?B?RVRsZ0E2VENHRnlmdlg4bEFGaVdJNXI3SFhzcDc3ODVWTkNsaHBpUjBVcCty?=
 =?utf-8?B?a25weU5ONzNKNk9qVFNQVXU0bXNRK1h2cVhTUm0zdVBuV05ickdhcVdudDlq?=
 =?utf-8?B?czUwbENLS2NBNnNrNjl6N1JyVXJ4a3hyTnJqRjhMamtMdW9hQWdwY1JvaXJS?=
 =?utf-8?B?bWVQSnFSamhxbkdSYW82dlZOWXdVU0JQSHk1NnlhcDh2aFMzamFiUUtCa2ZD?=
 =?utf-8?Q?Dn7FGMaIFg9KZKh7h2jfdgbQf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEEEDFCD8D14CA44A1485255D1A56F4D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5833e1f-3d2e-4214-4f64-08dd499b3a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 06:22:00.6073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0s8DqCLUMYrbTfCymi3XXG8YKQH8ibDUEWz6u/rHIDEV+/aHj+lymCQ6sec6VBdIrJpAjOkinFjStJrDF9d+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8196

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBNb3ZlIHRoZSBDRUMgZGV2
aWNlIHBhcnNpbmcgbG9naWMgdG8gYSBuZXcgZnVuY3Rpb24gY2FsbGVkDQo+IG10a19oZG1pX2dl
dF9jZWNfZGV2KCksIGFuZCBtb3ZlIHRoZSBwYXJzaW5nIGFjdGlvbiB0byB0aGUgZW5kDQo+IG9m
IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKCksIGFsbG93aW5nIHRvIHJlbW92ZSBnb3RvcyBpbiB0
aGlzDQo+IGZ1bmN0aW9uLCByZWR1Y2luZyBjb2RlIHNpemUgYW5kIGltcHJvdmluZyByZWFkYWJp
bGl0eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCA4NCArKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggNDhjMzcy
OTRkY2JiLi5lYjI4NWVjMzk0YTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jDQo+IEBAIC0xMzY3LDI0ICsxMzY3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Jy
aWRnZV9mdW5jcyBtdGtfaGRtaV9icmlkZ2VfZnVuY3MgPSB7DQo+ICAgICAgICAgLmVkaWRfcmVh
ZCA9IG10a19oZG1pX2JyaWRnZV9lZGlkX3JlYWQsDQo+ICB9Ow0KPiANCj4gLXN0YXRpYyBpbnQg
bXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICtzdGF0aWMgaW50IG10a19oZG1pX2dldF9jZWNfZGV2KHN0cnVjdCBtdGtfaGRtaSAqaGRt
aSwgc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPiAgew0KPiAt
ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+IC0gICAgICAgc3RydWN0
IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKnJlbW90ZSwgKmkyY19ucDsNCj4gICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpjZWNfcGRldjsNCj4gLSAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ICsgICAgICAg
c3RydWN0IGRldmljZV9ub2RlICpjZWNfbnA7DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+IC0g
ICAgICAgcmV0ID0gbXRrX2hkbWlfZ2V0X2FsbF9jbGsoaGRtaSwgbnApOw0KPiAtICAgICAgIGlm
IChyZXQpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwg
IkZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsNCj4gLQ0KPiAgICAgICAgIC8qIFRoZSBDRUMgbW9k
dWxlIGhhbmRsZXMgSERNSSBob3RwbHVnIGRldGVjdGlvbiAqLw0KPiAgICAgICAgIGNlY19ucCA9
IG9mX2dldF9jb21wYXRpYmxlX2NoaWxkKG5wLT5wYXJlbnQsICJtZWRpYXRlayxtdDgxNzMtY2Vj
Iik7DQo+ICAgICAgICAgaWYgKCFjZWNfbnApDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJGYWlsZWQgdG8gZmluZCBDRUMgbm9kZVxuIik7DQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FTk9UU1VQUCwgIkZh
aWxlZCB0byBmaW5kIENFQyBub2RlXG4iKTsNCg0KQ2hhbmdpbmcgZXJyb3IgbWVzc2FnZSBzaG91
bGQgYmUgYW5vdGhlciBwYXRjaC4NCkkgc2VlIGFub3RoZXIgcGF0Y2ggaGFzIGFsc28gRU5PVFNV
UFAgbW9kaWZpY2F0aW9uLg0KTWF5YmUgYm90aCBzaG91bGQgaW4gdGhlIHNhbWUgcGF0Y2guDQoN
Cj4gDQo+ICAgICAgICAgY2VjX3BkZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKGNlY19ucCk7
DQo+ICAgICAgICAgaWYgKCFjZWNfcGRldikgew0KPiBAQCAtMTM5Myw2NSArMTM4NSw2OSBAQCBz
dGF0aWMgaW50IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwN
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOw0KPiAgICAgICAgIH0NCj4g
ICAgICAgICBvZl9ub2RlX3B1dChjZWNfbnApOw0KPiAtICAgICAgIGhkbWktPmNlY19kZXYgPSAm
Y2VjX3BkZXYtPmRldjsNCj4gDQo+ICAgICAgICAgLyoNCj4gICAgICAgICAgKiBUaGUgbWVkaWF0
ZWssc3lzY29uLWhkbWkgcHJvcGVydHkgY29udGFpbnMgYSBwaGFuZGxlIGxpbmsgdG8gdGhlDQo+
ICAgICAgICAgICogTU1TWVNfQ09ORklHIGRldmljZSBhbmQgdGhlIHJlZ2lzdGVyIG9mZnNldCBv
ZiB0aGUgSERNSV9TWVNfQ0ZHDQo+ICAgICAgICAgICogcmVnaXN0ZXJzIGl0IGNvbnRhaW5zLg0K
PiAgICAgICAgICAqLw0KPiAtICAgICAgIHJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5
X3BoYW5kbGUobnAsICJtZWRpYXRlayxzeXNjb24taGRtaSIpOw0KPiAtICAgICAgIHJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAibWVkaWF0ZWssc3lzY29uLWhkbWkiLCAxLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZoZG1pLT5zeXNfb2Zm
c2V0KTsNCj4gLSAgICAgICBpZiAoSVNfRVJSKHJlZ21hcCkpDQo+IC0gICAgICAgICAgICAgICBy
ZXQgPSBQVFJfRVJSKHJlZ21hcCk7DQo+IC0gICAgICAgaWYgKHJldCkgew0KPiAtICAgICAgICAg
ICAgICAgZGV2X2Vycl9wcm9iZShkZXYsIHJldCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIkZhaWxlZCB0byBnZXQgc3lzdGVtIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzXG4iKTsN
Cj4gLSAgICAgICAgICAgICAgIGdvdG8gcHV0X2RldmljZTsNCj4gLSAgICAgICB9DQo+IC0gICAg
ICAgaGRtaS0+c3lzX3JlZ21hcCA9IHJlZ21hcDsNCj4gKyAgICAgICBoZG1pLT5zeXNfcmVnbWFw
ID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShucCwgIm1lZGlhdGVrLHN5c2Nvbi1o
ZG1pIik7DQo+ICsgICAgICAgaWYgKElTX0VSUihoZG1pLT5zeXNfcmVnbWFwKSkNCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBQVFJfRVJSKGhkbWktPnN5c19yZWdtYXApOw0KPiArDQo+ICsgICAg
ICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJtZWRpYXRlayxzeXNjb24t
aGRtaSIsIDEsICZoZG1pLT5zeXNfb2Zmc2V0KTsNCj4gKyAgICAgICBpZiAocmV0KQ0KPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJh
dGlvbiByZWdpc3RlcnNcbiIpOw0KPiArDQo+ICsgICAgICAgaGRtaS0+Y2VjX2RldiA9ICZjZWNf
cGRldi0+ZGV2Ow0KPiArICAgICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50
IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiArew0KPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsg
ICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gKyAgICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKnJlbW90ZSwgKmkyY19ucDsNCj4gKyAgICAgICBpbnQgcmV0Ow0K
PiArDQo+ICsgICAgICAgcmV0ID0gbXRrX2hkbWlfZ2V0X2FsbF9jbGsoaGRtaSwgbnApOw0KPiAr
ICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwgIkZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsNCj4gDQo+ICAgICAgICAgaGRtaS0+
cmVncyA9IGRldmljZV9ub2RlX3RvX3JlZ21hcChkZXYtPm9mX25vZGUpOw0KPiAtICAgICAgIGlm
IChJU19FUlIoaGRtaS0+cmVncykpIHsNCj4gLSAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIo
aGRtaS0+cmVncyk7DQo+IC0gICAgICAgICAgICAgICBnb3RvIHB1dF9kZXZpY2U7DQo+IC0gICAg
ICAgfQ0KPiArICAgICAgIGlmIChJU19FUlIoaGRtaS0+cmVncykpDQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gUFRSX0VSUihoZG1pLT5yZWdzKTsNCj4gDQo+ICAgICAgICAgcmVtb3RlID0gb2Zf
Z3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5wLCAxLCAwKTsNCj4gLSAgICAgICBpZiAoIXJlbW90ZSkg
ew0KPiAtICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gLSAgICAgICAgICAgICAgIGdv
dG8gcHV0X2RldmljZTsNCj4gLSAgICAgICB9DQo+ICsgICAgICAgaWYgKCFyZW1vdGUpDQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+ICAgICAgICAgaWYgKCFvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShyZW1vdGUsICJoZG1pLWNvbm5lY3RvciIpKSB7DQo+ICAgICAgICAg
ICAgICAgICBoZG1pLT5uZXh0X2JyaWRnZSA9IG9mX2RybV9maW5kX2JyaWRnZShyZW1vdGUpOw0K
PiAgICAgICAgICAgICAgICAgaWYgKCFoZG1pLT5uZXh0X2JyaWRnZSkgew0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIldhaXRpbmcgZm9yIGV4dGVybmFsIGJyaWRnZVxu
Iik7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7DQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FUFJPQkVfREVGRVI7DQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gcHV0X2RldmljZTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+ICAgICAgICAgICAgICAgICB9DQo+ICAgICAgICAgfQ0K
PiANCj4gICAgICAgICBpMmNfbnAgPSBvZl9wYXJzZV9waGFuZGxlKHJlbW90ZSwgImRkYy1pMmMt
YnVzIiwgMCk7DQo+ICAgICAgICAgb2Zfbm9kZV9wdXQocmVtb3RlKTsNCj4gLSAgICAgICBpZiAo
IWkyY19ucCkgew0KPiAtICAgICAgICAgICAgICAgcmV0ID0gZGV2X2Vycl9wcm9iZShkZXYsIC1F
SU5WQUwsICJObyBkZGMtaTJjLWJ1cyBpbiBjb25uZWN0b3JcbiIpOw0KPiAtICAgICAgICAgICAg
ICAgZ290byBwdXRfZGV2aWNlOw0KPiAtICAgICAgIH0NCj4gKyAgICAgICBpZiAoIWkyY19ucCkN
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIk5v
IGRkYy1pMmMtYnVzIGluIGNvbm5lY3RvclxuIik7DQo+IA0KPiAgICAgICAgIGhkbWktPmRkY19h
ZHB0ID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGkyY19ucCk7DQo+ICAgICAgICAgb2Zf
bm9kZV9wdXQoaTJjX25wKTsNCj4gLSAgICAgICBpZiAoIWhkbWktPmRkY19hZHB0KSB7DQo+IC0g
ICAgICAgICAgICAgICByZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkZhaWxlZCB0
byBnZXQgZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVcbiIpOw0KPiAtICAgICAgICAgICAgICAgZ290
byBwdXRfZGV2aWNlOw0KPiAtICAgICAgIH0NCj4gKyAgICAgICBpZiAoIWhkbWktPmRkY19hZHB0
KQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAi
RmFpbGVkIHRvIGdldCBkZGMgaTJjIGFkYXB0ZXIgYnkgbm9kZVxuIik7DQo+ICsNCj4gKyAgICAg
ICByZXQgPSBtdGtfaGRtaV9nZXRfY2VjX2RldihoZG1pLCBkZXYsIG5wKTsNCj4gKyAgICAgICBp
ZiAocmV0KQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gDQo+ICAgICAgICAgcmV0
dXJuIDA7DQoNCk1heWJlDQoNCnJldHVybiBtdGtfaGRtaV9nZXRfY2VjX2RldihoZG1pLCBkZXYs
IG5wKTsNCg0KUmVnYXJkcywNCkNLDQoNCj4gLXB1dF9kZXZpY2U6DQo+IC0gICAgICAgcHV0X2Rl
dmljZShoZG1pLT5jZWNfZGV2KTsNCj4gLSAgICAgICByZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4g
IC8qDQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K
