Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6457603F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745301024; cv=fail; b=rwPdW9Qou4kUGv0h8bBliyn+WzRCOT9szTzYnXCGhK4fRqbSaZmMc+BFItfRA0a5DWHk22hIVuia+F6M+k9MLwpL6x2dUwYha/TIxhVvAqpmwe07vDfvvkUKazDce21H1f9ZUGw6Pz8XYXLGlLcLBqH+UOOnaH64089RVMhJn7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745301024; c=relaxed/simple;
	bh=IszPWM8/QVmxzkQYjsJPq33/OEaN0+wSV3QBmRJUOx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gYlMYRW8X43gbUlPR7qYyPlvambQ4+dHptRKkW1Fex2oMfcb96xmPdWmOQi5zN1RnS3Imj08Jf4w/A7R0tzPbz7HZ9DOiTXjvlJla0mgzo6rtWGgukvmeUGbEdZNvVQOi5VXTcQF2tNZxtLbLH5YgGSgFZ6YLffsQtgJuEWfhWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AuZ4H5Ig; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=nZjAvlcx; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AuZ4H5Ig";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nZjAvlcx"
X-UUID: a7b43dc21f3d11f0980a8d1746092496-20250422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IszPWM8/QVmxzkQYjsJPq33/OEaN0+wSV3QBmRJUOx0=;
	b=AuZ4H5IgG0RL43AfHoxoH68/KntAHetvmZTzKVnoSBrD9MMqqeS0In2hP77wjwWm+IDoyTlEBajoMBsSUP3P5GJ3V54JrJXYcGbFgpw5OWZ3ww3j5kXTCAdvUKxZ0U7IsuBNJDa5BxfNSZaTUiw7rQdG+n6xQsWbXKn2Ok4hQ1s=;
X-CID-CACHE: Type:Local,Time:202504221350+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:601e71ad-3f8d-4622-a582-b66529233e00,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fd4de38d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a7b43dc21f3d11f0980a8d1746092496-20250422
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1093757599; Tue, 22 Apr 2025 13:50:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Apr 2025 13:50:06 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Apr 2025 13:50:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9feiXSRg/VtfIzqHqmczEKtBjV72yOZ+d6dMBC07I+Tzm/m7dxcvMLwI1bN5JOfcvemhzugSFg2vl5DMJ4EUCZJDo//HKJAKLM77M5o+a82may6Tth8dqw/tNhdb3QGP//pk+Q0leBgHyKHsoZPfd1fZEa+0Dhejuw6S6RLAg5qKYKe0sSTZdWLCkm06iKABDvEAT6PP8xxOjQIfjUntpxq2Bu7i0RkupELY3GGcA/D8VmdDp09LyXF4m64vh1N1wUnlprIlW5pm6mCqG/xTnIZvaBJVisHSWf8epdBLcB3slXwJ2+mTNvZgslyT6M8d5LDQ072F4a0Tjd/hJUnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IszPWM8/QVmxzkQYjsJPq33/OEaN0+wSV3QBmRJUOx0=;
 b=xiqLzhv3XxhZQ+zfl99AARtwvmwxGUhIhLqqeqlxOfCRqM+tpOSpyxgrVtbrwtf5PAGs3LsDhmjsJtQHHZH6QWIn3loU1vjIHLmu1mcHfPj8mV2+nmFIRVV1MogpxGHPLkVYdtdoKuP2p9YZC0Rzdh46vUKLunZiOi+/DqiV7RULQkqTF0oTAfa7il1vcrXRLGwjhMOFWklxpsogtkHYMz65u+hg0hTNu5bSXjAalGTmlkVrDkOOn+mDyTTBdEIbybY44nWNrFtaeT/LK85i8NDuvdwiIVfPYtp+aeoOZdEwybvIvGWSCWU0BKuCxJ/kdfUdSYfA9qRc7iiC3YnQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IszPWM8/QVmxzkQYjsJPq33/OEaN0+wSV3QBmRJUOx0=;
 b=nZjAvlcxaGO84QWXV18hBwFMIrks+3xz93XCazMSDI5jJexUQkWTal+m7PKyGoDEEe7P5ItCdKSDZTKcXgIBavORJJ+iAGJAM7s/OsjakOeb/6OG31Yp46B7TknvdihKDmysBkenWqEihQ6lkwwmNI+uXDsBdClZL5oDG4vc6d8=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYSPR03MB8520.apcprd03.prod.outlook.com (2603:1096:405:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 05:50:04 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Tue, 22 Apr 2025
 05:50:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	=?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v1 3/5] drm/mediatek: mtk_dpi: Add support for additional
 output formats
Thread-Topic: [PATCH v1 3/5] drm/mediatek: mtk_dpi: Add support for additional
 output formats
Thread-Index: AQHbqVFCVv24yZ3TTU+ND544aiIsAbOvQiaA
Date: Tue, 22 Apr 2025 05:50:04 +0000
Message-ID: <41053b3d5830487dffd6100fc4a347ef0145d72c.camel@mediatek.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
	 <20250409131306.108635-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131306.108635-4-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYSPR03MB8520:EE_
x-ms-office365-filtering-correlation-id: b1a9772c-d4f4-4ccd-5d14-08dd816187a5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTAxTSsxOWRzM3JmQkpvdGhERmVoNTNqTy80TmE4NC9mNDBNZHB5YmdpL0Z4?=
 =?utf-8?B?YTNEMDRIdXlWTmVhNEdGa1hRc2tVNUVDaEFjS1Fua09QOGF1OGhHRjBJTi8r?=
 =?utf-8?B?THByT0xnT1VKZGg1cHFtcFlhVkVvdmc4Wko1L0ZjV1Uvb0lQaHcya2loVXFo?=
 =?utf-8?B?cGpQOTRMc3pLVXczbjdiMm56cHNtSXo0RTZHVjlRSVpxSmhLZnVqR1EvZlU1?=
 =?utf-8?B?VUswazB0a2pFQXRaazZFRVpoMkZ3dFBPYzBha0ZFV2d4dG8vRnlXTTAwNnNR?=
 =?utf-8?B?QkRpWk9lTjNxc2xqSnI1L3R2UEhTeXI2UElrc20vVlBSVVFabXgvWlFsMFFD?=
 =?utf-8?B?UnN1ajNNZ2RFZ1lZaklPbnZ4OHVlSTRkbHpyV1RPcXA1ZHJ0NnVHRkhqaFBq?=
 =?utf-8?B?WGVJeU8yTEoxSnppU3REZ1NQZGZia1dzRHdmV0lqcERTSXBIYUxkbyszcTBZ?=
 =?utf-8?B?RWFpaEhWUWFSU0h0WUJYbnJjMzVyU054cTdKazVzc2tMTTdJdDhoSURqZTVM?=
 =?utf-8?B?cFVHZTVPRk5mUGVucStKa0tXbFd4NklNeTJVbGlCT3ZEZVhIWGxFTzNpTFlT?=
 =?utf-8?B?WFQ1QVg4VXc5blBhakVDWjBaSkVzT2VmZ2dnbmI3WHNKUmpVcVFnbUVuWnhV?=
 =?utf-8?B?dFk0a2tuamhPeWpCYm1aVGFNS0lZMEFsUzhDV09TZVR1ZVU2WFJJY21iYTBu?=
 =?utf-8?B?YnM2WDZua3NObnNyNjZFT05WbVFhOGZtRFFVTmxBdnNnT25ZNkNSRFlKL2N2?=
 =?utf-8?B?WFRyRnZIa1lvaWp3c3pnNk9jL280T3ZLTCtUMWVuUm1jY1JDemZCc3NIa0d3?=
 =?utf-8?B?aDdKczh6NjBleHp2V3paTUFnbUo0NGYycjdMcGVBY0d2UUhvemVGWEJvSUs4?=
 =?utf-8?B?ZWpyR2xtZER4UG1oV3RWemdMZFR4d3pmWkhFaFM4d3lXN2RDRDlBUUZNQll6?=
 =?utf-8?B?d0wrOUg4R0JETFpWcEFyYmhJYWVtK0NCWVFGWjZpYkpwTXU4WGx5ZEJtV3VB?=
 =?utf-8?B?T1ZHZFZoTEpaYzU4OU16d1IrVndzK3NneldSSXRlczlyd29VRy9QVHhpSUVH?=
 =?utf-8?B?TXpNd1crdVVRa1l4UTFlK1puWTIrM3BsNEpJSlpHMmJiMitUVVlWaVYrN2s0?=
 =?utf-8?B?N2NYanZlbjR5S3VUVXA4RTNwOG1wZ1lsaktsZlBMV0Q2YlNqdDB3bHhsbURk?=
 =?utf-8?B?R2IzM0tMbjFVeU9pRDVrek9uWGlnSjRWMlNlSHBjOGRCTWE1YTFnUXAvTmhY?=
 =?utf-8?B?cXlxVTloekkzME5pVlN4cUhRYXZHN0RuNTZmbEJUM3BNS2V3VW9mVmg1VGg3?=
 =?utf-8?B?VzBmdldiSVhnMzJYeXM3TVZBVnRYNmRFa0o3MUhxV2dLNXoxcEhsdlVtSjFh?=
 =?utf-8?B?SVpUTDJGUERwcUpBWjVSall5bHhyMERReVJCWk5vOWkvR1ZtVkxXR2RIZnNC?=
 =?utf-8?B?TXJsM3dSN09STkJWTjZTY25ZUzdGd2RQVCtveU5nYTFJQ1EwUVpMQlMzN1l2?=
 =?utf-8?B?VEJJbjJxWEUyM0lzY1F4dmtCYUVzMldqN0RiVzBHYndGY3FXVGtQMkoyaEo2?=
 =?utf-8?B?cmpubjBVMnlhTVByNVgyU0pMS2JGYVpSRmxIdCtMTXRVSitjL3dhV0VLTHdK?=
 =?utf-8?B?V3RjcytvY2w1ampWUU9UZ1QzMnFSbDRWc01WR2JFbGVzTE0xL2JiNkgxRmt5?=
 =?utf-8?B?TENGUk5aMXRyeElqV1pGWTUrckNhY3IzdkROR3g5Tk1OTHgxMWRRa3RXUjZX?=
 =?utf-8?B?Y2Fuek5MTUdVUXV2UVZSeURUMWE1anpKYXBON1lqaklPQktYQkw5NFB3OExT?=
 =?utf-8?B?RXZSc0Q5ZHVoZW5yQ3VHSFp1akxQdUVDUWF0T0o2aGhwS0hlYmVVRVY5QnhW?=
 =?utf-8?B?QlZBc3ZrSTRPQ3R2cEdiUVV6Y25kZVM3aytPMlZGZmFYeFVELzFRV01HWWdo?=
 =?utf-8?B?L0hvSlJGd29haGh0bS9DZ3RwbUppVzQ5VUxYSFJJQVhrUHlRWlJlanpTWUhH?=
 =?utf-8?B?Nm84c2pVTGdRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nlg4bTJSU1NYUnpWR01yd042RWRNaTNTVEs1a0w2RzUyMTZJYzhjd1lYSDdH?=
 =?utf-8?B?WmhXbW9hTWFSU2k1dCtxcnpWRndjcFZYbkthZmZYciszSTFBNlZRRkJvUDhu?=
 =?utf-8?B?K0JPVmE1OWd4c1EwU0E1N0YzL1pOSlhtcSttT0pld3VVNUNhTmk1OE1qZDVV?=
 =?utf-8?B?aWMrYm9iZjdDU00zR0FaaGNqMW53RGI2M09NbDZ4cHY2T1QrY2FEaXV4Rk0w?=
 =?utf-8?B?Z2ZWYWRIUjR0aWZCWFI3L0M0UW5hYUkvOW9pNnRPaFN0YlZhdGlUQzkrRlNC?=
 =?utf-8?B?ZFBxN1FTK2NJbENKZ1FBRGVndmZudURvUXVRbVhuV0JVbFhRajY3WUMvK2dE?=
 =?utf-8?B?T1lwKytEY1FGd05nbTR5cCt2YmJoaUxPSDdsQmQ2THRDeUlZTENOb2lMd0tl?=
 =?utf-8?B?SmRDOU9Sb04zdjYwUkFjSm93aUgxa1ZqME5kdmRKMXgxazlBSEJMRjVyZ0Uy?=
 =?utf-8?B?UGhxN1lmbHNTR0t4UWFuZDBvanlDSVgxaENnb05PcEcrSzg2cGRJUm9QQ0kv?=
 =?utf-8?B?WDFpZVVzTE0yTmRnZ2t6bFNqRlRvQ09yOFNqb0RHVWlhOEUwUzQwZEJ2QlNN?=
 =?utf-8?B?eG5xWE1EelFXVDdrMkhwUmJOSmNWaGU4RHNLTHpNNkR1VG5QNnc4TVkwWHR0?=
 =?utf-8?B?SGFTY3ZhQldwV2NoTVB3Y1g2c1RNUzIzb3VFRWkvNlUzUU9Ed0pHNWtqWXV1?=
 =?utf-8?B?TTNJUXpRUjdrWEhnd1NTWS9XRWo4MC9SZzY4bnphNXpFUDh3b2hZUVFOU3pL?=
 =?utf-8?B?Mm45L1FBMStlR1dUdkFpVW5vM2N3dEVCYTVJVUJIWHVzVUJBSFNBalp0MDhR?=
 =?utf-8?B?bW1WWGVMcUR0ckg2amYwR3kvOGhOY2FGTWh4NklzQkw2cTQxbi9xME8rOVQx?=
 =?utf-8?B?NTM2RXNZa0NJemlBRTZpb3pXUERpWWU1cEhWWFgyNlZjYzRYc0ZudFlMZkFh?=
 =?utf-8?B?NS84SzhhMmVIank4SlF0M0lwRkx1TG1kekdTem9xeUxPbS9PNzRUYnF4V1Fq?=
 =?utf-8?B?b2RVNWVZdks4MFlrT09zQmUvWUhWeUsyejNSTG5LYjJFVGF2Z2FJUmU0RUl1?=
 =?utf-8?B?WlBuUWJJSUF4VXhQYWFEVy9XeWw5TUVZYyt0WmtYOHV2UXJrYzNYRVhFdCtV?=
 =?utf-8?B?TjUzRVdZUXBrS1Vyd2JZTWpSTFBlSWNIQ2Z3MWNQTDFiRHVuWVo5M09jVWhq?=
 =?utf-8?B?bEN0d0VaM3kxZDV6VXkvcGFPQ01hb3FJc0VQNGNRN2RkOG1vYVB4OERVYllN?=
 =?utf-8?B?c1J5cGNmalo4ZEloT3NwRHpCZW1lS3I2cUMxVjFCQm9KdEliUTRXeERtU1lG?=
 =?utf-8?B?UXh5YmUzNUp0NUYvNUJvOTBCeGwyTlBVTUJORTdwMlcxZlBGQ2RuWWY5Wkc0?=
 =?utf-8?B?Znk0b1lkRTh3Y2pPSG8zMit6TFF3MkVoTWFndUU1UG15eUZyZDhHd3ZjVk1L?=
 =?utf-8?B?WXIzaTVTNTE2SVR5aGhnRng0ZkZqVERhMDhaeUxPMFJzdkNFR2RNQStMd0hh?=
 =?utf-8?B?cHhiUE44NzlObkhhTmNyd2pPam1CaUdHdDBFaEZCOEc1b0VXVkxCNzR3bGNq?=
 =?utf-8?B?Ym40b3RsRllEV1kxVWNhVFdkRHRLM25Lc1dDeXRMWkhBcTNFQWlicEhsOUNx?=
 =?utf-8?B?WS9ESUJZZ1IxdktzQUFvOFU5U0d0dkdiL0lMaWNZelJPWHRGdTVhei8rUjBi?=
 =?utf-8?B?OWdxdjFVZWVySXU0UFBOWHJxWWswU2dKOVpWaXg2RXQzVU91QzdxQXhFODZG?=
 =?utf-8?B?cVRyVGRZelR4UW1oa0VPTGxDZWFKNzNYTTcvbEhYRmN6bmxNamRySnc1SUNl?=
 =?utf-8?B?eEdJY0VSZ0EvYUJMc3BPRXVQNDlIMlRkSmhYK041NVFxdjV6U2ZzbmJ3U1k2?=
 =?utf-8?B?cHM3dGYzS2duOGsyQVVrZnRDVnErSzBaWkZjdThwb0h3RE5ubXdjUHdNZzNH?=
 =?utf-8?B?SXhrOXBlTWFkcEJTbHFnL1dEaW5LZUhmN2RtN0ZqNk1aUm9kTXErY09wQkw0?=
 =?utf-8?B?dDZqRXcvVjgvTVo5b3hZY3oybHM1aTQzMWM3RWZUUzhoS1lzUStTMGtDNGFi?=
 =?utf-8?B?WnhGQS9SMy9ac2krbTRuOGRpaldZdWtlakNHQXFlL2xNR3ZORVUzOEthNjJ0?=
 =?utf-8?Q?PSfYCkUuRz11r5Ubl0thLXSEI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E072D80E6725B147A8E82D9B2FFDB410@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a9772c-d4f4-4ccd-5d14-08dd816187a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 05:50:04.3596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AUT4KfUxKB6v4tPD0tergBi6xIlKGFJkbqHqbthyvqOY9ui0VO9fuNrr7ShxCu9/QaFt0p17wxEvPI6rY93oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8520

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
Y29uZmlndXJpbmcgdGhlIERpc3BsYXkgUGFyYWxsZWwgSW50ZXJmYWNlIGJsb2NrDQo+IHRvIG91
dHB1dCBZVVY0NDQgOC8xMCBiaXRzLCBZVVY0MjIgMTAvMTIgYml0cyAoOCBiaXRzIHN1cHBvcnQg
aXMNCj4gYWxyZWFkeSBwcmVzZW50KSwgQkdSIDgtYml0cywgYW5kIFJHQiAxMC1iaXRzLg0KPiAN
Cj4gVGhlIGVuYWJsZW1lbnQgb2YgdGhlIHZhcmlvdXMgYWRkaXRpb25hbCBvdXRwdXQgZm9ybWF0
cyBpbiBTb0NzDQo+IHBsYXRmb3JtIGRhdGEgd2lsbCBiZSBkb25lIGluIGEgZGlmZmVyZW50IGNo
YW5nZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gaW5kZXggNWE2NmRmZTNhZDQwLi5hOWU4MTEz
YTE2MTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBAQCAtNTksNyAr
NTksOCBAQCBlbnVtIG10a19kcGlfb3V0X2NoYW5uZWxfc3dhcCB7DQo+IA0KPiAgZW51bSBtdGtf
ZHBpX291dF9jb2xvcl9mb3JtYXQgew0KPiAgICAgICAgIE1US19EUElfQ09MT1JfRk9STUFUX1JH
QiwNCj4gLSAgICAgICBNVEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80MjINCj4gKyAgICAgICBN
VEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80MjIsDQo+ICsgICAgICAgTVRLX0RQSV9DT0xPUl9G
T1JNQVRfWUNCQ1JfNDQ0DQo+ICB9Ow0KPiANCj4gIHN0cnVjdCBtdGtfZHBpIHsNCj4gQEAgLTQ1
MCw5ICs0NTEsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfZGlzYWJsZV9lZGdlKHN0
cnVjdCBtdGtfZHBpICpkcGkpDQo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19jb2xvcl9m
b3JtYXQoc3RydWN0IG10a19kcGkgKmRwaSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGVudW0gbXRrX2RwaV9vdXRfY29sb3JfZm9ybWF0IGZvcm1hdCkNCj4gIHsN
Cj4gLSAgICAgICBtdGtfZHBpX2NvbmZpZ19jaGFubmVsX3N3YXAoZHBpLCBNVEtfRFBJX09VVF9D
SEFOTkVMX1NXQVBfUkdCKTsNCj4gKyAgICAgICBtdGtfZHBpX2NvbmZpZ19jaGFubmVsX3N3YXAo
ZHBpLCBkcGktPmNoYW5uZWxfc3dhcCk7DQo+IA0KPiAgICAgICAgIHN3aXRjaCAoZm9ybWF0KSB7
DQo+ICsgICAgICAgY2FzZSBNVEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80NDQ6DQo+ICsgICAg
ICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ195dXY0MjJfZW5hYmxlKGRwaSwgZmFsc2UpOw0KPiAr
ICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfY3NjX2VuYWJsZShkcGksIHRydWUpOw0KPiAr
ICAgICAgICAgICAgICAgaWYgKGRwaS0+Y29uZi0+c3dhcF9pbnB1dF9zdXBwb3J0KQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19zd2FwX2lucHV0KGRwaSwgZmFsc2Up
Ow0KPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgY2FzZSBNVEtfRFBJX0NPTE9S
X0ZPUk1BVF9ZQ0JDUl80MjI6DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ195dXY0
MjJfZW5hYmxlKGRwaSwgdHJ1ZSk7DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19j
c2NfZW5hYmxlKGRwaSwgdHJ1ZSk7DQo+IEBAIC03NDMsMTAgKzc1MCwxOCBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IG10a19kcGlfYnVzX2ZtdF9iaXRfbnVtKHVuc2lnbmVkIGludCBvdXRfYnVzX2Zv
cm1hdCkNCj4gICAgICAgICBzd2l0Y2ggKG91dF9idXNfZm9ybWF0KSB7DQo+ICAgICAgICAgZGVm
YXVsdDoNCj4gICAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQ6DQo+ICsgICAg
ICAgY2FzZSBNRURJQV9CVVNfRk1UX0JHUjg4OF8xWDI0Og0KPiAgICAgICAgIGNhc2UgTUVESUFf
QlVTX0ZNVF9SR0I4ODhfMlgxMl9MRToNCj4gICAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfUkdC
ODg4XzJYMTJfQkU6DQo+ICAgICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1lVWVY4XzFYMTY6DQo+
ICsgICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1lVVjhfMVgyNDoNCj4gICAgICAgICAgICAgICAg
IHJldHVybiBNVEtfRFBJX09VVF9CSVRfTlVNXzhCSVRTOw0KPiArICAgICAgIGNhc2UgTUVESUFf
QlVTX0ZNVF9SR0IxMDEwMTBfMVgzMDoNCj4gKyAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfWVVZ
VjEwXzFYMjA6DQo+ICsgICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1lVVjEwXzFYMzA6DQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gTVRLX0RQSV9PVVRfQklUX05VTV8xMEJJVFM7DQo+ICsgICAg
ICAgY2FzZSBNRURJQV9CVVNfRk1UX1lVWVYxMl8xWDI0Og0KPiArICAgICAgICAgICAgICAgcmV0
dXJuIE1US19EUElfT1VUX0JJVF9OVU1fMTJCSVRTOw0KPiAgICAgICAgIH0NCj4gIH0NCj4gDQo+
IEBAIC03NTcsOCArNzcyLDE1IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RwaV9idXNfZm10
X2NoYW5uZWxfc3dhcCh1bnNpZ25lZCBpbnQgb3V0X2J1c19mb3JtYXQpDQo+ICAgICAgICAgY2Fz
ZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0Og0KPiAgICAgICAgIGNhc2UgTUVESUFfQlVTX0ZN
VF9SR0I4ODhfMlgxMl9MRToNCj4gICAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfUkdCODg4XzJY
MTJfQkU6DQo+ICsgICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1JHQjEwMTAxMF8xWDMwOg0KPiAg
ICAgICAgIGNhc2UgTUVESUFfQlVTX0ZNVF9ZVVlWOF8xWDE2Og0KPiArICAgICAgIGNhc2UgTUVE
SUFfQlVTX0ZNVF9ZVVlWMTBfMVgyMDoNCj4gKyAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfWVVZ
VjEyXzFYMjQ6DQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTVRLX0RQSV9PVVRfQ0hBTk5FTF9T
V0FQX1JHQjsNCj4gKyAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfQkdSODg4XzFYMjQ6DQo+ICsg
ICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1lVVjhfMVgyNDoNCj4gKyAgICAgICBjYXNlIE1FRElB
X0JVU19GTVRfWVVWMTBfMVgzMDoNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBNVEtfRFBJX09V
VF9DSEFOTkVMX1NXQVBfQkdSOw0KPiAgICAgICAgIH0NCj4gIH0NCj4gDQo+IEBAIC03NjcsMTEg
Kzc4OSwxOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10a19kcGlfYnVzX2ZtdF9jb2xvcl9mb3Jt
YXQodW5zaWduZWQgaW50IG91dF9idXNfZm9ybWF0KQ0KPiAgICAgICAgIHN3aXRjaCAob3V0X2J1
c19mb3JtYXQpIHsNCj4gICAgICAgICBkZWZhdWx0Og0KPiAgICAgICAgIGNhc2UgTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVgyNDoNCj4gKyAgICAgICBjYXNlIE1FRElBX0JVU19GTVRfQkdSODg4XzFY
MjQ6DQo+ICAgICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0xFOg0KPiAgICAg
ICAgIGNhc2UgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9CRToNCj4gKyAgICAgICBjYXNlIE1F
RElBX0JVU19GTVRfUkdCMTAxMDEwXzFYMzA6DQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTVRL
X0RQSV9DT0xPUl9GT1JNQVRfUkdCOw0KPiAgICAgICAgIGNhc2UgTUVESUFfQlVTX0ZNVF9ZVVlW
OF8xWDE2Og0KPiArICAgICAgIGNhc2UgTUVESUFfQlVTX0ZNVF9ZVVlWMTBfMVgyMDoNCj4gKyAg
ICAgICBjYXNlIE1FRElBX0JVU19GTVRfWVVZVjEyXzFYMjQ6DQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gTVRLX0RQSV9DT0xPUl9GT1JNQVRfWUNCQ1JfNDIyOw0KPiArICAgICAgIGNhc2UgTUVE
SUFfQlVTX0ZNVF9ZVVY4XzFYMjQ6DQo+ICsgICAgICAgY2FzZSBNRURJQV9CVVNfRk1UX1lVVjEw
XzFYMzA6DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gTVRLX0RQSV9DT0xPUl9GT1JNQVRfWUNC
Q1JfNDQ0Ow0KPiAgICAgICAgIH0NCj4gIH0NCj4gDQo+IC0tDQo+IDIuNDkuMA0KPiANCg0K
