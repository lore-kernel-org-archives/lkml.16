Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EA275108;
	Tue, 15 Apr 2025 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704863; cv=fail; b=R+HT4R9HbjEhmX2zwDjl0B7amDjwiqFAkQ2guhGfVnXJyP0r1jASIQOpAGBSIz7B11OwBCgr3oYVjGaBLu87YzmAAwMqYefde/k+2fFrp8XItqgpdLy4xwIiifmsO/aW18Z0o3PqApd8WxInrrSaBrINoE+agFnJmIwQiWnphpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704863; c=relaxed/simple;
	bh=CcMijCRD7dyTwYUmUYvTzqqgLCWuO+dJkcSjSLQ1AUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q6G0/UXVCaXuo2AGuwadPYyDy5NAJbUa5vFC20adNbZQUf20HFJSgGW0Uer12cF/yPBKo3YFTpe64Xok6MMfAcHdGWJSfviCKDVkTiVhci97yZ0Adm/wn1ZcGhSS5MGOZjXSWoas/O90nCnhauosKWPL6EPATyqLmIdJJOjBQU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZQ/OD0Qg; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XAYkUWSq; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZQ/OD0Qg";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XAYkUWSq"
X-UUID: 9ead0b2619d111f08eb9c36241bbb6fb-20250415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CcMijCRD7dyTwYUmUYvTzqqgLCWuO+dJkcSjSLQ1AUc=;
	b=ZQ/OD0QgxPxEkEtk0FUdt+ZutRywEqQHgnJhkVW+Elp6CWtirN1iuxZySxZ540CsW8sbH1Q1NTooJUdvQ5a+kUfMesOlNvA6mF4Ac4v+xJXuDeIUun3m38+t/2qMGhPii4O8P/ZhH9lnEVvbR/TJHAQ+zZq8RgNk/W3f/uoC9mg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1e2c98c1-1666-4f85-a1c4-be502a68fef9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a67fa08d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9ead0b2619d111f08eb9c36241bbb6fb-20250415
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 948478134; Tue, 15 Apr 2025 16:14:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Apr 2025 16:14:13 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Apr 2025 16:14:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1PmiqpsiZuGy3AsXqeYefD/EAKv0V97gUobdzSHNsGqjqDgadrfRv9IjnoT7vy7torEutaZ+xoVfZjOEawAlbohDKKDHwJNqXHmcGqOS0XCbZFo0220CE8sL68Cm3r6k3Yg4Hq4a34apISGgxkxQAFZ2Z73SUKXUP58vJEEEi5Shkwn/46FgSqXo0nEfRwdfvd3w7HYBjpS7K3p8ESHU6u2QqfE0INQdKs4OLF6and6sC0pQGV83+QXRmZ2UuVMXeWvk2CyIuJVXAHozYRiCDAMIRsE+a1cchCbmL3y7WA9YCn0fD/UIGk3A2yBQXtjxGSdf0RtMFbIHdOfu9E10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcMijCRD7dyTwYUmUYvTzqqgLCWuO+dJkcSjSLQ1AUc=;
 b=dqqmxFnLZQvoidrh+69dr7RH5kfwYcds780U4PwJd3xWmWv81gcY17MouwpvSQA/E8GO5hn/GITWBv//BD/aPnDxaUnMusMpOkTZPcF8mVXK9Q7KemNUANNWebiS1AdkAPVGLg0KxA/Gl35LyMMJlpu3B9AGJIEdVF6Bb6I2uCM4WP7IhSMAVR5Yde0Q46ZeC5EQyWUjfNjZrA3tlRwE4LjUlNF02SmQxyuFA+7uCk4g2YDcf/bG5h+/nAV5xNPYg0c05OSYQOsXIuJBGwp3z+34qQqpHiPU6ZdYtSjqLnyhQyLuqtpJRFQR9+z2Vb32r9wyi5xR3ZHUJzooxvzrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcMijCRD7dyTwYUmUYvTzqqgLCWuO+dJkcSjSLQ1AUc=;
 b=XAYkUWSqMzBMdfk52kgzkZonxLOTwQnbcjhZbyJzUmfzCHIvwO7K1qxXrpGJW7ERWqX2oU6bUls16+mO3puducPCn5Chv8kwLTN62TfwVJXKttWnSaMpD9RDKaANZpYRrVyCNnOqt6RK2SA8YZIoG2RMjLacR/emgY+mD0a9V8c=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by JH0PR03MB8810.apcprd03.prod.outlook.com (2603:1096:990:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 08:14:11 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 08:14:11 +0000
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
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v8 23/23] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Topic: [PATCH v8 23/23] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Index: AQHbqVGCVlkQkp8w90q75SV+vls81rOkahaA
Date: Tue, 15 Apr 2025 08:14:11 +0000
Message-ID: <a73ae86c406de1002c7fcff9f34c2eeaaa5f03dc.camel@mediatek.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
	 <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|JH0PR03MB8810:EE_
x-ms-office365-filtering-correlation-id: 05a2094c-b9bb-4cc1-2429-08dd7bf580af
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?azBSa2xpdmp4M0g2Ylp2UDJtWVgyNVFxVDExdHZkU0N2TnQwUXJIWVBMc0FE?=
 =?utf-8?B?V1lnZXJHUmFDNWtyTHEvMG5kOStaSndMVFFOTEtlcm5QQmhJWWh4dDhMR0g2?=
 =?utf-8?B?RzNmeW1MTklJWUQrOURpbHBzYjMwVnpjbzd5UkYrc2hEdStuMWdKNVZ5amxa?=
 =?utf-8?B?cnZNOU00bnBtTXMzZGdCT2xlSlhYRHlCSUNBaE0wckpCY041eGFpQXBOUlF4?=
 =?utf-8?B?d0ovcWViTktIZHZKL1RTSEtvRCtGd0xMYWNIeU91cHA1MkoyOWZrc2FrNmgr?=
 =?utf-8?B?QWlsSm83a0lUaHlnODBOclJmRkNVaC9yQUJ1eVVxQ1EwOEVPR2xKMEJ6SXhl?=
 =?utf-8?B?Q2JCMDV0bGJGYlNxUTFqUnJPd3VOZTFJVWpLeFdjU09KQUpTM01HdzNMZ1hS?=
 =?utf-8?B?emN6RnphRmNhc1JiQXcxQUR4dDlqQ1A4SjJsaXpFd254TXRaT3lOT0FMZVhT?=
 =?utf-8?B?L0VuZVQ5TDIxSTVUS0FSV2Z0cDl0ZDdDK3F2d2RGbXJaYXlFY0ZlMnAvSHQ4?=
 =?utf-8?B?aElSOGhMMlZXTzhVckVXQmNMTDlUR0ZGVjl3ajNIS1RHcmVodGtUeUdoS2Iv?=
 =?utf-8?B?K2p1US9DY2R6NnZIZ0lnUjVIZ2ZwNXg4VTNKNHBjcERjUlcyQWFRanFaSHNy?=
 =?utf-8?B?Wkw3akp5cUV4UjlZM2pUbHRBeFpjTW5rcThsbXJJdGl3aEtFUGhQNFdnMmVx?=
 =?utf-8?B?SC9kUWpGQ1lNdXpwQmhrRVdDcEN4VXpEZFJvN2MwT3h5dU5RWWJVT1FwS0Mz?=
 =?utf-8?B?QVNpVS94K3R2K1ByekcwN3o1RWN6VFB2YXFEY2RiZmRtWGdTeE05eTFud0Nx?=
 =?utf-8?B?VldsSWNqd1diMERJZE1ERUhUUnlra201STAvQjFBc1JCUGVTSUNhWHNIa25Z?=
 =?utf-8?B?MFhtVVdCaHlOeHhFOVhBcjBuOFJuRGwxY0gxOFdMTjhkRXM1U0FDRXlpOFZV?=
 =?utf-8?B?UEhPSVRjR1AwM1JzNDIrbFRyUy91NWNjOU1IcFRNNjh0SU9TclZmdndBS2Va?=
 =?utf-8?B?eEoxTE51ZkdzKzN2NWxzRUwrdHE4UkpGaEx3OU1FZjBCYThjMXZhZUVXbXdn?=
 =?utf-8?B?Kyt0ampFaEpBU29KQUNseHNka3FqZVhKWFB2Y01RUlA1SzBtdWJHNVRvK2I3?=
 =?utf-8?B?Wjl5Mm9weDFteDJaYk1nRkJPRU5Rekc4dm93V3lrNGdVSVF6OXNOQi95b1BC?=
 =?utf-8?B?c0I3Lzl0RDBDdDB0VjdXcDFoaU1aM2xtSU5hY1BtU2w4TkFrWGlUb0xITnhV?=
 =?utf-8?B?WE9RRGc0UmF6WC82R1M1MTU1ZURzTVNyZHlZWHU0OWZlSjBEWTRmcDRDQ29v?=
 =?utf-8?B?TjM3UzB1MERzS05ycWxRL0FOSlUrengvTHpUaE41TURTVDRJMjBKazZHSTRN?=
 =?utf-8?B?VHkrZzVXVVV1OWN0NUIvNGI0M1g4TU4wbkVrbXBFNXNESEdSazhMbjZBRS9t?=
 =?utf-8?B?bmlDcDFyNFdxeWVXZk40NEptbkFYbkNHWXdZZHh6aVI0a3ZzYUlTazRFNklX?=
 =?utf-8?B?VlFpSVA3QzUwb1hUaW5IOUpQUXZ3RzlIOVVQVEFlQUt3Tis0MS8yb2NacjEr?=
 =?utf-8?B?QUVxWUlYS2xMN0hrTGl3Z29WRlY5dFVGbmNmOG02QnFVU2VUYXZmeTk3aGJ1?=
 =?utf-8?B?Qi9SczBELzdBL2k0dDhFbWpRazlGT2dqMk9hbGR0RmhYVlEzRWdlSi8wMzJT?=
 =?utf-8?B?cUt2ZUg5Z0xJTlUwWk55dWdieHBlakpmdWhqSmttTE92ZWVyNkhiQjBsbm5y?=
 =?utf-8?B?THYrQTFJenJURXN1ZDVvRUwvZjZLckRIRkY2dnRzZjR3d2NNUitTalVzQ3pC?=
 =?utf-8?B?QlhBUnk2T1d2eGcrKzBtaVNCVDllOUY5blFHUG96OWtOWEtHQWNiOHhyYnlk?=
 =?utf-8?B?cUg1ell4NzYwdVoyYXlhOU5nUXNjT00vK0gyRG1ScFBjbm0veE5yVW14Q0R2?=
 =?utf-8?B?L2w5eW14MGw3cXBheVplN1lLWER4VHloMjBPNEdyYU5VQktrNzBZUDhUTFdO?=
 =?utf-8?B?bkRyMzZESmF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFptT1Z5cVFYblpGS21Pb1VjRkxTREFNcFlmd2RtVmpEblF3QldIYWZURFEz?=
 =?utf-8?B?aU1ON09TOTBMb1F3S0trQkxrVHpXTGpxV2VucGlxUEtyaTdaYnBrRzAvdDBG?=
 =?utf-8?B?T242Mkt1UkViKytGcnB0TmdqT2hMRlpSQkl4UjZGblhBZHFmMFRWeldZZmtP?=
 =?utf-8?B?ZHcwcnlIUDdtRlJxQmhxb0YvSlEvWlBnVlJ4cHYxMGtvWUtYOWk5TitGZzZP?=
 =?utf-8?B?dkZqZVhGWEt5K0VMdzA0UGJESEVTS0lyaEdncDkzR2hlbTRjZk9lZlh5akE2?=
 =?utf-8?B?T3YzNnROQkZTV1ByVjZ1LyszS1J1aTJjWjFZYVZyTGtZNHBWU2RMMTk2V29N?=
 =?utf-8?B?d3hUOGZEWW9talUxQ05Sb0pIeW1oVDl3Z2xVNlp2T1BBZkNmM2p4YVhLZDVs?=
 =?utf-8?B?L1cvQUxTS2ttL0RiNEJ5Q2g2S094L1lwTktsd3QrTnJZRWhnY2ZPOE0rQkVD?=
 =?utf-8?B?VFJhUW84NEFkOFRUcDFvRERqMTB6UDRLUWNaZGtGR1ljd1dLbG81Y0xkaGZk?=
 =?utf-8?B?QmcvdU5kckoxVWo4Z3ZNajhwT0dZWFBKRngyMFFPL0dEbzVFdjAyT2prU01k?=
 =?utf-8?B?VXFzNFVPYWZrUk16cHBHV2Y5M1IwSmxiTnd4TnVVbWREZzQwY3dheG95ZDVV?=
 =?utf-8?B?UEhUWVlFUHNUUUZXNExZa2czMGZWa1kzdXF5R1VXTDJqeVpmRUlQV3lBdlJB?=
 =?utf-8?B?ZG1XV1RyRm53c3M1Skp1TkNuQXUvZTB3UTRtOFQzd3d3TUhVS2NPV2ppZTdX?=
 =?utf-8?B?VStITkdvQlRZZ1phVzhPWVpkR2o1UmQrMmpFMHRONFRwVmhXTWtDNjQ1YTVs?=
 =?utf-8?B?NkQ0OFkxTVNwUHBoZDBudzIwOUl3cjFXMmZ0WkpaQ0o0Y2NHWmQrRXVpeGtX?=
 =?utf-8?B?VHdISGJ5emlZeFVLeWkzajg1RHJpbmpEaTJlNXgzM0ttbXVIaWRpbXoyaUxH?=
 =?utf-8?B?akE1UWJPcWdIZFlrVnA0N3ZORURjeXlPMDFOcWRLSUdxcWhUU09lUjBLUVF3?=
 =?utf-8?B?VnRJa2VzMStuZmZMa1d4TTdkR1FxRzVNT0hTRHRBcFFiR1hlNUhzSFVRSWdn?=
 =?utf-8?B?Snd0dFVVNm9LYjkzdE1KK0kxdEM3Q3RxWjA1TUJid3hmdzg4eHZtVUNUZFBk?=
 =?utf-8?B?aDZmR1J5eEVtUm9ZOGdpaVllMFQvK1QwalRnTC8ydEpCbm5sTm5ZRFIwN1lF?=
 =?utf-8?B?YlNnaENOOVhTQUx4SzczajRiRHVCL0ZxTzVhV1dKd3dHV0RMZk9aMW5zMSs3?=
 =?utf-8?B?ZFlrRFZPcTdxSGU0SDVNN2YyRmhXajhuOFpJSXR6NTlUY0ZzaUltUDlqTkxo?=
 =?utf-8?B?ekVnYlZ2bGFLVENDNCtxdExWVHFjMDdldjRyOG0yaHJPMU1JalVMdGtmYjNK?=
 =?utf-8?B?aVNCb2hyNGt2WlpRamVNZHBzcHkwQkJYYXZYSHlxeEJZK1c0M2RJQ01zWWN0?=
 =?utf-8?B?T1RXeFFOY2dWNVJNZXpHOGpGTWVEWkVIRnREYlNRN3ZXSEFrYlVOYXlOQTc1?=
 =?utf-8?B?NEJad3AxVE1CSnFIQWpMTzMxak5ua0ZybWRoR2lsVDVUa3lBUmgzQmdqTFVU?=
 =?utf-8?B?RjZBVnUvakdjcStyYUNheFI4bi9MRlpwMmVKREFqSG51dTBvWjdkMWZpa2p5?=
 =?utf-8?B?V2hrUkxMaVhMYm5teU9wS3V2bzlMbDVvVVFzS0Q3N2lsRnprZWxQc0FweHBs?=
 =?utf-8?B?UXdmNXV2amNubWhTYWduYlgxZjhLYVVWN3pjaGd4OFRJampKaFpxVTRmZkFx?=
 =?utf-8?B?RkllZTRHWG4zMk04djU5ZkdkKzhxZDV5V2pKRWI5WmtnYUVyeDgyc3BLTmFP?=
 =?utf-8?B?akZYUUV3MUdrOVJoMUduTThBbElCM2FmQllxNSt4VjlBV1FRNitLTENTaHM0?=
 =?utf-8?B?YndabmxEWHJtQVMvRVVrVnJ6RThhMlJYRlpWZkg0ZXJ0Y2FVMmt4TWRmVE13?=
 =?utf-8?B?a2hYVzB5U1cwT2hCS3QrQlhLNXBSQzB2RGk0Qkg5OTU2azdScmxXdllrYUdu?=
 =?utf-8?B?VzFIQ0JSUUg0N0hSZXZMcXQzL2krMDhBd01NTWVtaDB5UThZYjgxSG80NGxS?=
 =?utf-8?B?ZFdXVkRrNVdPdkg0YnFsUS9GaVpYRWxzcllBTmtLRU1ScnkrcklHQW9waWJR?=
 =?utf-8?B?eXZVbmdGWDhUWVB3MmxhR3BoZUdFZDFaZlhKdWNvZHhDVS9oaUdsa3ZFbTVr?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <650FD8405F9B574088B312A1A6CD95C3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a2094c-b9bb-4cc1-2429-08dd7bf580af
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 08:14:11.2548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uF61ebSUZaU9MzFiKERpdxYMvVHuucBIQDLcptrzhIz7xTIGbqP6J9xxk7PYmxRpIOSdAOMok4tSmVbDUgHALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8810

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBVc2Ugc3lz
Y29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKCkgd2hpY2ggaXMgYSB3cmFwcGVyIG92
ZXINCj4gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIGNvbWJpbmVkIHdpdGggZ2V0
dGluZyB0aGUgc3lzY29uDQo+IGFyZ3VtZW50LiAgRXhjZXB0IHNpbXBsZXIgY29kZSB0aGlzIGFu
bm90YXRlcyB3aXRoaW4gb25lIGxpbmUgdGhhdCBnaXZlbg0KPiBwaGFuZGxlIGhhcyBhcmd1bWVu
dHMsIHNvIGdyZXBwaW5nIGZvciBjb2RlIHdvdWxkIGJlIGVhc2llci4NCj4gDQo+IFRoZXJlIGlz
IGFsc28gbm8gcmVhbCBiZW5lZml0IGluIHByaW50aW5nIGVycm9ycyBvbiBtaXNzaW5nIHN5c2Nv
bg0KPiBhcmd1bWVudCwgYmVjYXVzZSB0aGlzIGlzIGRvbmUganVzdCB0b28gbGF0ZTogcnVudGlt
ZSBjaGVjayBvbg0KPiBzdGF0aWMvYnVpbGQtdGltZSBkYXRhLiAgRHRzY2hlbWEgYW5kIERldmlj
ZXRyZWUgYmluZGluZ3Mgb2ZmZXIgdGhlDQo+IHN0YXRpYy9idWlsZC10aW1lIGNoZWNrIGZvciB0
aGlzIGFscmVhZHkuDQoNClBsZWFzZSByZWJhc2UgdGhpcyBwYXRjaCB0byB0aGUgZmlyc3QgcGF0
Y2ggb2YgdGhpcyBzZXJpZXMuDQpJIHdvdWxkIGxpa2UgdG8gYXBwbHkgcmVmaW5lbWVudCBwYXRj
aCBmaXJzdCB0aGVuIGFwcGx5IGhkbWkgdjIgcGF0Y2hlcy4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gW0FuZ2VsbzogUmViYXNlZCBvdmVyIEhETUl2Mi9EREN2MiBzZXJp
ZXMgY2xlYW51cHNdDQo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyB8IDcgKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCj4gaW5kZXggNzg0YmMwNWM5NTQxLi4wMGE2Mzhh
M2NhZjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9j
b21tb24uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9u
LmMNCj4gQEAgLTI2OSwxMiArMjY5LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9nZXRfY2VjX2Rl
dihzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWMNCj4gICAg
ICAgICAgKiBNTVNZU19DT05GSUcgZGV2aWNlIGFuZCB0aGUgcmVnaXN0ZXIgb2Zmc2V0IG9mIHRo
ZSBIRE1JX1NZU19DRkcNCj4gICAgICAgICAgKiByZWdpc3RlcnMgaXQgY29udGFpbnMuDQo+ICAg
ICAgICAgICovDQo+IC0gICAgICAgaGRtaS0+c3lzX3JlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X3BoYW5kbGUobnAsICJtZWRpYXRlayxzeXNjb24taGRtaSIpOw0KPiArICAgICAgIGhk
bWktPnN5c19yZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAs
ICJtZWRpYXRlayxzeXNjb24taGRtaSIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxLCAmaGRtaS0+c3lzX29mZnNldCk7
DQo+ICAgICAgICAgaWYgKElTX0VSUihoZG1pLT5zeXNfcmVnbWFwKSkNCj4gLSAgICAgICAgICAg
ICAgIHJldHVybiBQVFJfRVJSKGhkbWktPnN5c19yZWdtYXApOw0KPiAtDQo+IC0gICAgICAgcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJtZWRpYXRlayxzeXNjb24taGRtaSIs
IDEsICZoZG1pLT5zeXNfb2Zmc2V0KTsNCj4gLSAgICAgICBpZiAocmV0KQ0KPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJhdGlvbiBy
ZWdpc3RlcnNcbiIpOw0KPiANCj4gLS0NCj4gMi40OS4wDQo+IA0KDQo=
