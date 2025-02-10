Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF241B87CD;
	Mon, 10 Feb 2025 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170918; cv=fail; b=hBc9AzoMDTyin3UgS5KsABpyCWUyKY4XGJu5cJVk1wrGU1l/jErW2+Z1+4gVQ7vc7tueJjwRTUT+Vh2McvHDAqq4x6ZA3OLCAgGD37ypM7EqJP5cW6yF/YFuVpBQKQS1fh60yrQRDeISVDNwZfHA98gNaIXyzKh33Aoeib3yDHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170918; c=relaxed/simple;
	bh=ay/QHMVAPEpbTPeIQzv4sdnPgkswJPtp80p3YXejRTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u8fACKqYVXXKkOATc2GKRv4TRXREelik9sRauvHa23fCeGVVO8FnuNQ4vjkv055xx3kr0VR0Sm9rC4YUtEMCmwbzmK7eE9sZKkcvTuanJPLdR5ZTbUSjNNwOsZYD8q2//pDdpGbNscmsO6Um9EubEaNJrnggLRoGrOb6TQQxMZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gCTiQwxq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=hNZrPFec; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gCTiQwxq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hNZrPFec"
X-UUID: e227044ce77c11efb8f9918b5fc74e19-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ay/QHMVAPEpbTPeIQzv4sdnPgkswJPtp80p3YXejRTI=;
	b=gCTiQwxqY4t2JTDVEA1oVaCXi5MeM5Rx00aAPaB2+bZ49hTTuYmOIgrpPlm9oqWAU4uBU86sf+lh6Y67do3f+TyvscYHHoJLc4RnI0RT5KFGnfH6CfJ60c9X/8JB7WOQn2bz/TjNC1h08nZ6ly2a6xQb3ih6QQs/ndQ+aJJgOL8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:26ea476a-d4c0-442c-a421-35a3b354c619,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ab69503e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e227044ce77c11efb8f9918b5fc74e19-20250210
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 865811478; Mon, 10 Feb 2025 15:01:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 10 Feb 2025 15:01:41 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 10 Feb 2025 15:01:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVlSjj51m30hGjSwRed7zptT2yJn3xbZGxIYdjXoaH4sFZ8V93Eu5sCSntoJZO43kIB39ag7xgktQD8/sZKrtu+ha3kkTr4bNhW7Hs3kn39lNOCR23ouAxyRKmDaYsCpz2dPYjaoRxDhrnfooEPaV3P8MgG8M3y2yaTGKBFmeE8s+MDLjo1F2yl5UCbAoQ42ZZgNtXQWD/rMHt/m+GFEyd5fUSg7j4pVjjUlA+HUyK7k2ekb/Kv/D0FkR7VtXQ6ZDG4nRIciP7LRQtSUL7+9Yi9U8Efoq0qXrSAepXpBXwa7g48eDEUeU6jOUTp0MIuuv+1TPO9lXWEF8FpoQjFW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay/QHMVAPEpbTPeIQzv4sdnPgkswJPtp80p3YXejRTI=;
 b=mlD4lDHa9Ig6mnJuIW9x7Zbb0syc7G4Jnam0o+tlacnXix/Gjh29+b5StOZr7WOgz4rmJUkEQIrlFpDqE4UmMfAF9FCc4KqXZkoAOVvR3P7plcJE1rw4futPBZdCG55UAr5Ke9T0b27cPBOB8aV49YKxuDLinibfBWADoYIPB5AxgLcKHpnJqGuEnVOm111ElKKNs4lRDH6kiEIQPKB0Z8Z4MUeIajiYWO3x43XDeYiYTMP60h8+vkSlluvjaHxoPXjBwO9r/z3TKVKQpdGdTsN8xGQkL3wrW8Eo4mdtapMkqrlYG8E/BEVhzb9NOU2312nu9gC9nkUESMJnPIyiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay/QHMVAPEpbTPeIQzv4sdnPgkswJPtp80p3YXejRTI=;
 b=hNZrPFec7fnPRyTYzhVGY5AKp28QNdLS+aKiOB9TjDNqW03/8s+KadblbhmKwOItkvWRHpcZSZgZhGa+B+I+ZYVgW1d9CZT9fOIldFeA3o/qUiR7VaFJDxwyXkVXiP0NtI5jMR8pE9ENOrK7ooQsGLj84BL4fhPcQpZbyiL/lRA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7132.apcprd03.prod.outlook.com (2603:1096:400:337::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Mon, 10 Feb
 2025 07:01:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 07:01:38 +0000
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
Subject: Re: [PATCH v5 10/34] drm/mediatek: mtk_hdmi_ddc: Switch to register
 as module_platform_driver
Thread-Topic: [PATCH v5 10/34] drm/mediatek: mtk_hdmi_ddc: Switch to register
 as module_platform_driver
Thread-Index: AQHbZcrvUCACV2f1lUuNMKp+PQbxQbNAR6wA
Date: Mon, 10 Feb 2025 07:01:38 +0000
Message-ID: <424656ad6c9fbd1c32a62d7ed7b35eb322e94720.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7132:EE_
x-ms-office365-filtering-correlation-id: 821497fb-46c2-46af-55cb-08dd49a0c40c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUNLemd4VmVPV3NJU0N1S1ozVS84cXJrZFAvWFBITVpzRDVwUlAzeStZc1NM?=
 =?utf-8?B?TVdHdCsrMnJyRkVhQk50WFFTcUY3Vnp5aTVDdmRrVXM2aXMwZC94OUN0Y1Fm?=
 =?utf-8?B?MFFYN0JBTUFjdkpjQXV5MkJEUlQwc2EyZnFkVTNBaDR2Z2JYdTJ1MkkrMjFQ?=
 =?utf-8?B?RlRtRkFQcHdoRlR0TGYrRDZYcy9UYSsyVldSbkZSMUN4QTZhc0ZoWjVxV3pP?=
 =?utf-8?B?THpDK2VLZGtwbFZlN0dHZks0NGM5WTNSTEJOUVlMeWQyckZvTDlHRTNDTkZ1?=
 =?utf-8?B?OFNSZDVQeW5kYngxMjBGVkVQYWpRWkRKTUFiZktUL3pYSkhmdkRpZFp6Q28v?=
 =?utf-8?B?ajhUQndMU1VSOG03cHBwQWdGSE5uZXM5WkgxazBqZnFENjVEcFNQL0pUZHhE?=
 =?utf-8?B?clk5b3F0blZqeDRDU0dTOE1PMW51TVBlZkVWcEVEM1lUcmpVNGpaMjdyMnlN?=
 =?utf-8?B?UXlUMElNRTV6YnMyTmRUNGhJU2hKc1pLQ0JuallaaVVSV1dNWkZIMnhNWU5w?=
 =?utf-8?B?aWJrMW9iYUVCNjVuWVBOQWtzb2R6RHVwK3ZrRGtZR1NmRkNqdm50ZDU1cTdl?=
 =?utf-8?B?NHQycTRWeCs4S0Q3dWUvV0VTTjhreWFlYXA1S2dEMW5UQlA1MkNFN0FFMDZk?=
 =?utf-8?B?ZkpibWJoQndDR0twZFlsV0lDTnNocDkxNG1ubXR6T2JVdTNEbG9XeTdKVnhT?=
 =?utf-8?B?K3U0dTV3K0p4SW1PdUhKTUkxVEw5d1ozNXpFenlPQWxxbEFLNW9yb2Y3eHor?=
 =?utf-8?B?Y3VsY3VDajJ6TFJYWm5zdHNNbUpUNDBXOUc1K3lJcWNoOGZMdFRwYlZIeFJK?=
 =?utf-8?B?aEl6TVZWeWhPa1ZZSkJNQ0ZLWUp1bTNoRjdiM3VJcEJKTE5qdnEzYzJSVEVm?=
 =?utf-8?B?MmpWKzRmakh4bmhBYzc5VVdKU2VlWGhlYWtsV2s5TmJFYytMc0wydkJ5ckJV?=
 =?utf-8?B?eXdibXJGT01pS0k1K1RINjZjbkFmU1pOK3JEMmcweTBNOGR2aHpnQ3FVSzho?=
 =?utf-8?B?c1I0RmpqYmFweHNUUHhmTjRBeFlSbnl3QWVZWTdFblFBRkpCV21TWWVYWjkv?=
 =?utf-8?B?bkhlTDRIMDdTN0o3ZUQzWEFZMTVqRnJUZmV5b1c1MDY4R2RwT2Q3S3RRUkdY?=
 =?utf-8?B?NFRnT2p6OGk0R0NodjVNZTdxaUVTaGJCTnlWa0FTQjFqeTloS3pIRUxsV2lw?=
 =?utf-8?B?OG9lbVFQV0xJNlZMZTMyTTZFVkZPYThkOUFrSkMrREI2aEpMQjJWUzFMd2dV?=
 =?utf-8?B?TkozYWVYMUI5VG1EZmRhKzRpSmk0Y1RlNXFESXVXa201QVhxL21aRHBHTkFG?=
 =?utf-8?B?emxBcERuUlZLWnBucUt3TDR2aHRGMHBDa2RJVDlPeEVoQ2huaFVDUFhJUmEy?=
 =?utf-8?B?V3BhdkZnREQ3VXlpYXkzUTdoN1pKZ2EzZ1FwUGpkb3VPb0QvSnVXTjdwc3pQ?=
 =?utf-8?B?b0pTb0ppaHFlSHRZOW1xRVRoR3c3M09wbFJ3LzZmZ2ttZGMxNVVPNGlxWWdH?=
 =?utf-8?B?V0xrcXlyT0NJbWx4ZHlKSkg2cUVSK2Nab0x0MzNaZEZ6R1AwL0VOQkxCNjZG?=
 =?utf-8?B?TGR4dWI1WVNPNWtoRDRZWUtERzcxeVM5MENYaFF0RTUvRzZ3L0RuczRNY29h?=
 =?utf-8?B?ZmhELyt3YmFjV01tVTdNenh4NnBjQ0NXNG5SQTdiaTQ5dUFjdzlXb2RzTmdD?=
 =?utf-8?B?aG1aTE0yOHhWVG1vbTUzamhySmd2eXozcVpmWFhKbGVMWHZweVI4TVRCM0VO?=
 =?utf-8?B?bERmUHk5Uk5sRjNDV0FuZ3p4VWFmYWtHSWgxOCtJZkNvOUdUMEFJUmtBNTB1?=
 =?utf-8?B?V21KRVpYd1JEblp0RVR5ZTlBRlJsNjF0NDBWOUk5czlTVmRpbDI0alZTbm1n?=
 =?utf-8?B?MGFkL1l4TTBtZTJ4WWptL1VnMVVYaW5YaTR6Wm1FQjBwUy93OFRUMjZjd0pH?=
 =?utf-8?Q?5ypSk9OZUCLxWWnDyOgkWewZq6P2rxNk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm85K2UxOE5nVHptM014eEFoSUtiaGhDMTljem9BTFl5b0ZFYmRrQXNSVUJ5?=
 =?utf-8?B?bm9Ra2NTM3U0bzdFTWhhb2R0T0dscUk0ZUdiRjFka2QxdmpNQVR0OFBwcUVl?=
 =?utf-8?B?VkZNRlhVRzUwUU4wYlFidXF6RFNnUE50dnNnMzM1OUVTbGZtbko0U2RSd1FO?=
 =?utf-8?B?VkxzYkJjQWdyUkgwbTRoeEtGN3NJVm1QSmtIY2l4NURXUExVZkQzVUtaazhQ?=
 =?utf-8?B?ZHQwSUpPTVZEb3RwS2pCM0hYZTlUS1IrcVdYaUVjSlVGTDN2OEFydUFNOHBq?=
 =?utf-8?B?YVZuYThCZ0lETGg3WEd2b1pER3JZc0YvZ0xsZnZkMjFMaUxtRTlUZjZ0d2o0?=
 =?utf-8?B?ODhvL3VUNldmdFVSTGJTMWs3dVRMRjhROW1kMXFYellBd0FsWWEySm5VRU94?=
 =?utf-8?B?Q3ZvZm9IYm9pRnNTS3hYMGY0WXhLbXhwM09GQU45NGF3M2VsYld4bjRvdk52?=
 =?utf-8?B?VXJLYVRjajFlai9KKzQzUWsyUDhwb2JvME85blVqNjExc2ZTb1RXdWNmTklS?=
 =?utf-8?B?WnZWcG9FRFhmMFdxdldNc3JwSStXRUpDSWwyZTNWS2grQ0psSzJSbWg5MUpR?=
 =?utf-8?B?U2pISzZrMVVsQlhkZ2xDcTBQcTVIcy9sOFNtb0NDZElhSE82VnNWZDFFd251?=
 =?utf-8?B?RTRVZ0NUc25kT2U0U20weUJTQTBTa3pOemwvMGNJcitWZFBuUWY3ZDlVanlo?=
 =?utf-8?B?ZjNuWU5GcGFERklDUklKQkI4SXQ3ODZ6Tko4bVpNZTVGenJQR3RDZVdpWnpP?=
 =?utf-8?B?K3hQQmhIcVlyUDU2T0s2OG9PQkhKcHo2alVNYytLUXI4ZzAwUm0xeGo5aCtl?=
 =?utf-8?B?R1h0eFg3aENFWjNyVFUyeXFST1Y1N20xMWRaamZod0w0MTJGdjdDV3FTWVdT?=
 =?utf-8?B?Mi82NVBUZUh0RjE5Y1ZHdVh5djlBSG1FSXg0K1c1ZVA0bkxPaW0vVDVjb3JG?=
 =?utf-8?B?bk5RNWpHQjIyY3g3OExnaFRrMUFIdkFDQXdpU3hZZ1hLUTRZbitvd05tb1Zm?=
 =?utf-8?B?L0N4eDhPNDlDcnF2d1NkMW01MnRlOUZ2YlM2d2Zra0p5c0p5REc5SjVsTlNl?=
 =?utf-8?B?clZ1SGFNKytCZGFUYXJBYkZQVHkxNlFSQk1PallsdzlRWmVwUlozQVlxaHJ3?=
 =?utf-8?B?SHcyR2F6N0RxYm96bkZRS3RKZEUwYlp3bnlEUEQ1czVEcDRpZ1BpMFVKd25P?=
 =?utf-8?B?YjVDaWV0bXFzN1VOWU02THZTdlJsRlkrdWZrU1FrL0F4dld5Q2VEVitlSUZD?=
 =?utf-8?B?NGZYTjdWY0dhd201aVdSbWwzbjhqVS80RVJTYmJpalhlYnBXdHBBM3dPdCsw?=
 =?utf-8?B?RGs5QStrRnJJV0dOd3Y5UlFMaDUyLzZlVENnWEU2Qi9EaEFUb1daMlFNeldq?=
 =?utf-8?B?V2dFekFJSGNkQVh2d1NveHJwUkxxdmFieGVKN3M5eS9qbFdBdmZYNk9BRW5l?=
 =?utf-8?B?NEZJdDIwR2JWZnArM1hwQjdlSVh0TDU0eDZkTEErR282K0p2Y2RuSHJjdFFa?=
 =?utf-8?B?dE1Ub1VEZ1o1bkk4bjdBeU9NQXIzU05sbnBGM2pWU1pKNHZCVFRsYS9kSno0?=
 =?utf-8?B?cHJVVHVPSm12Z1d1RVhBTnlpZlY5NVdRRVVNTmgyL2xOblZTOG1BZlNWVzUz?=
 =?utf-8?B?eUZkYkU2MWFWeHR1Q0FSalllT2xMNkI3cEVCOXRQN2RoeTVwMi9wbTE4U1VD?=
 =?utf-8?B?TkYrNHAzSEpxS09VaE8xQnozNmd6ZkNOZ2JpTG5FRFJxRjBNZS9uekkwS1pv?=
 =?utf-8?B?L2YwL1RmUUhQT3p5Slc5SWNaWFViN2VxbTRvdmllUW1jaHF4bnNqVDVNaUNs?=
 =?utf-8?B?ZVFxVFU0Z2JkSVIxSFh1YmJUZVRQWEc1TTQrRnlYa3pYZ0JkYUhDenc4T2dB?=
 =?utf-8?B?R3ZZTHpTSi9FQzVWTDlzWm11QW12ZDJrcXFhRStXQms4bUFQWFhxeVoyVHoy?=
 =?utf-8?B?T2xQclFMVTVyaTkvQVUwU2Vucko0eDJ0SENlRkJOZGgrK0JvWWFoSGdIRkgr?=
 =?utf-8?B?aVNGZTJRUEZ6QWxlZkFnWFJweVdoQkQxWFRCNDZzaGxIbStySTBRK3ZaZktB?=
 =?utf-8?B?YldmUjhNSXNrdnNVVVpMbkFJSEdlRlRSMnJDQmJrMVBic1Mra1Z6bmZEZTJl?=
 =?utf-8?Q?c1VporT+lkFkBXKorl4DiAcXE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0712F57102A6214D98135D3EF4FD89EE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821497fb-46c2-46af-55cb-08dd49a0c40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:01:38.9120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnbyGeyZ53/DxV43Ke7lvz8uy8WLFg8FrpfmOyO8ZSgrNHY8wrVtWqi8DWs+7K0lQpujwycRE+Orp5kc2EjKXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7132

T24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3Igc3BsaXR0aW5nIG91
dCB0aGUgY29tbW9uIGJpdHMgZnJvbSB0aGUgSERNSQ0KPiBkcml2ZXIsIGNoYW5nZSB0aGUgbXRr
X2NlYyBkcml2ZXIgZnJvbSBiZWluZyByZWdpc3RlcmVkIGZyb20gdGhlDQo+IEhETUkgZHJpdmVy
IGl0c2VsZiB0byBiZSBhIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIgb2YgaXRzIG93bi4NCg0KImNo
YW5nZSB0aGUgbXRrX2hkbWlfZGRjIGRyaXZlciINCg0KSSB0aGluayBkZGMgaXMgbm90IHRoZSBj
b21tb24gcGFydCwgc28gdGhlIHJlYXNvbiBpcyBub3Qgc3BsaXR0aW5nIG91dCB0aGUgY29tbW9u
IGJpdHMuDQoNCj4gDQo+IFdpdGggdGhpcyBjaGFuZ2UsIHRoZXJlIGFyZSBubyBtb3JlIHVzZXJz
IG9mIHRoZSBtdGtfaGRtaS5oIGhlYWRlcg0KPiBzbywgd2hpbGUgYXQgaXQsIGFsc28gcmVtb3Zl
IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgfCAgNiArKy0tLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICB8ICAyIC0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuaCAgICAgfCAxMyAtLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfZGRjLmMgfCAgMiArLQ0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiAgZGVsZXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5oDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlDQo+IGluZGV4IGJkZDNhMDYyZjc5Ny4uNDNhZmQwYTI2ZDE0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+IEBAIC0yMSwxMCArMjEsOCBAQCBtZWRp
YXRlay1kcm0teSA6PSBtdGtfY3J0Yy5vIFwNCj4gDQo+ICBvYmotJChDT05GSUdfRFJNX01FRElB
VEVLKSArPSBtZWRpYXRlay1kcm0ubw0KPiANCj4gLW1lZGlhdGVrLWRybS1oZG1pLW9ianMgOj0g
bXRrX2hkbWkubyBcDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2hkbWlfZGRjLm8N
Cj4gLQ0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfY2VjLm8NCj4g
LW9iai0kKENPTkZJR19EUk1fTUVESUFURUtfSERNSSkgKz0gbWVkaWF0ZWstZHJtLWhkbWkubw0K
PiArb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfaGRtaS5vDQo+ICtvYmot
JChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19oZG1pX2RkYy5vDQoNCkl0J3Mgbm90
IG5lY2Vzc2FyeSB0byBzZXBhcmF0ZSBkZGMgdG8gYW4gaW5kZXBlbmRlbnQgbW9kdWxlLg0KDQpS
ZWdhcmRzLA0KQ0sNCg0KPiANCj4gIG9iai0kKENPTkZJR19EUk1fTUVESUFURUtfRFApICs9IG10
a19kcC5vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGluZGV4IGRhNzI1MTgy
ZjBkYi4uZTY0OGZiNTcxNGU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Yw0KPiBAQCAtMzEsNyArMzEsNiBAQA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVy
Lmg+DQo+IA0KPiAgI2luY2x1ZGUgIm10a19jZWMuaCINCj4gLSNpbmNsdWRlICJtdGtfaGRtaS5o
Ig0KPiAgI2luY2x1ZGUgIm10a19oZG1pX3JlZ3MuaCINCj4gDQo+ICAjZGVmaW5lIE5DVFNfQllU
RVMgICAgIDcNCj4gQEAgLTE4MDQsNyArMTgwMyw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIG10a19oZG1pX2RyaXZlciA9IHsNCj4gIH07DQo+IA0KPiAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgKiBjb25zdCBtdGtfaGRtaV9kcml2ZXJzW10gPSB7DQo+IC0gICAgICAg
Jm10a19oZG1pX2RkY19kcml2ZXIsDQo+ICAgICAgICAgJm10a19oZG1pX2RyaXZlciwNCj4gIH07
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuaA0KPiBkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggZTQwYmM0NjUxOTk1Li4wMDAwMDAwMDAwMDANCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmgNCj4gKysrIC9kZXYvbnVsbA0KPiBAQCAt
MSwxMyArMCwwIEBADQo+IC0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
ICovDQo+IC0vKg0KPiAtICogQ29weXJpZ2h0IChjKSAyMDE0IE1lZGlhVGVrIEluYy4NCj4gLSAq
IEF1dGhvcjogSmllIFFpdSA8amllLnFpdUBtZWRpYXRlay5jb20+DQo+IC0gKi8NCj4gLSNpZm5k
ZWYgX01US19IRE1JX0NUUkxfSA0KPiAtI2RlZmluZSBfTVRLX0hETUlfQ1RSTF9IDQo+IC0NCj4g
LXN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI7DQo+IC0NCj4gLWV4dGVybiBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIG10a19oZG1pX2RkY19kcml2ZXI7DQo+IC0NCj4gLSNlbmRpZiAvKiBfTVRLX0hETUlf
Q1RSTF9IICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWlfZGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfZGRjLmMNCj4gaW5k
ZXggMDdkYjY4MDY3ODQ0Li42MzU4ZTFhZjY5YjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaV9kZGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfZGRjLmMNCj4gQEAgLTIwLDcgKzIwLDYgQEANCj4gICNpbmNsdWRlIDxs
aW51eC9vZl9wbGF0Zm9ybS5oPg0KPiANCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIg0KPiAt
I2luY2x1ZGUgIm10a19oZG1pLmgiDQo+IA0KPiAgI2RlZmluZSBTSUYxX0NMT0sgICAgICAgICAg
ICAgICgyODgpDQo+ICAjZGVmaW5lIEREQ19ERENNQ1RMMCAgICAgICAgICAgKDB4MCkNCj4gQEAg
LTMzNyw2ICszMzYsNyBAQCBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19oZG1pX2RkY19kcml2
ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBtdGtfaGRtaV9kZGNf
bWF0Y2gsDQo+ICAgICAgICAgfSwNCj4gIH07DQo+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG10
a19oZG1pX2RkY19kcml2ZXIpOw0KPiANCj4gIE1PRFVMRV9BVVRIT1IoIkppZSBRaXUgPGppZS5x
aXVAbWVkaWF0ZWsuY29tPiIpOw0KPiAgTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRpYVRlayBIRE1J
IEREQyBEcml2ZXIiKTsNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=
