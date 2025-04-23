Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3721C170
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745379970; cv=fail; b=UWUAj62nyerTE4i6eSteFGqxYzywSfy3aRiJqApaqXIohgZlvQ8Zf0cBEpokU8Ib1HmQG4589ppbXt29OFQJC+8ncmtpxQwabV5bnC8eIc1v0SWcDGlz7UpKgyH1E3eoVBOpKhM3us//30cale9udR+gJd3lnQEIthIa1wO/FtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745379970; c=relaxed/simple;
	bh=pSsphFftclzp8u5caXBK83YEjHv1EZwI8xmb+qGnrFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WP74P7KQTglWFoegVUwcC79UfWzy/tb7OYn9AnDsYQfh8ziZfUb6gDFojj9MSJEHepprN5t6oBh0VP+TseAoZQbdvMypZD7Mio1o2bgii7PKcYYvFOLAFwjkaS9Solsje0uw2HySUjkLMiKlbCX9sEXNTbWrJGQAXV5vQyxdzes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ge1t21tr; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JCN0JEvK; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ge1t21tr";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JCN0JEvK"
X-UUID: 7873441e1ff511f0980a8d1746092496-20250423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pSsphFftclzp8u5caXBK83YEjHv1EZwI8xmb+qGnrFo=;
	b=Ge1t21trrs+ZRb3QsAy7nm7MVQBqpgui5+JYBygiZuDntd6+L+uZwsbWsclQLIrovZFihaf9uVBb/Z+p1Gf0mEjLtZxp99WOjLP+lbQY4IsHEdhF/SZZ2CjjupbNExUUDx5LNCYXsY4KPg/u7v9k6M4UrA1tcJykVtfchB7SmtY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:49f9bee9-cb07-4c6c-9ada-7e49a8d88dd8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:8da7802a-2448-4c17-a688-fd64fca576d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7873441e1ff511f0980a8d1746092496-20250423
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 312302350; Wed, 23 Apr 2025 11:45:59 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 23 Apr 2025 11:45:58 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 23 Apr 2025 11:45:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m212XvcmmXpV9o0lD0K79fseXZ5b/Vyve0jKu+V82y/+bjhAtDSaaPMddY5/V5P3XQc8IZRT4KUxBQOz0kF0CZBGG4UO3I5MNzydYRHzI1tnb0vkhexR2Uam0iP+J3nNO8Z8ovvWAOfzfzOFZhnl9YRQnpt58c1/EMSVJMBDtS+rRn33MHFkffrWEkqAxerd9J6koGnv8kV4ZOJtLDh0BXS2krJk0nAon92bWANpHIKbSeRcyj1oHUi0+p08Pyc0BD+BbhymIiLagFIuckdZPuZOzdIR0Uo9e/hdGBL+GiL3SrF9+iOtxmxuRJ1/a9FfoiBgWXvtQFAf5PnY2urxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSsphFftclzp8u5caXBK83YEjHv1EZwI8xmb+qGnrFo=;
 b=x+brU+nELVhFtb+0XKoDOblb5KGU3FS4Qjmd4rrxlXD3LODwmPHxjvWjgcVATYTTdflnDTiGAnqnpbhJJxazCqKrcfYuyu3LnMQTI/Nrzo3ejAUwS9VSIChIWAJc3Rntq3oT06Ipw4yHbNbla/gCtA7WQcvLQJdEs23vMPfjb955Fm+Ad5fN2BqUbIRTkzJDC6Utofhv0ED6oGFe+0kYMdllV+3LZSeo4TNCG04XLda9zahrkBkQD9fPJ20k6GVP5W/ypKdFTLJae+TOBXrkLzppv1NaHmrmrsZILTiilCTnCLEc2TOsMHw4PT9Gj3MBqZHBBD0SSEGGnGMWtPClYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSsphFftclzp8u5caXBK83YEjHv1EZwI8xmb+qGnrFo=;
 b=JCN0JEvKV7JBCdxuoP7z+lo7Ywv9WcoGxoG0t3RZhU5vj3M+cSDNujpFDaE5n0NuAm03HJAiRmHbJq35D5kzqrOK4tKOQLAt08N49ulb83esAa5muzeKiCCCXm+Orx5Z5A6ncIlctFcQ38O6Ex1aZio0NPZw+bUfLDCdC9pggwk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7543.apcprd03.prod.outlook.com (2603:1096:400:410::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Wed, 23 Apr
 2025 03:45:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 03:45:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	=?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
	=?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "kernel@collabora.com"
	<kernel@collabora.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_dpi: Allow additional output
 formats on MT8195/88
Thread-Topic: [PATCH v1 4/5] drm/mediatek: mtk_dpi: Allow additional output
 formats on MT8195/88
Thread-Index: AQHbqVFgMggQ11QFZUWpXtAKiSq7JLOvRUKAgACAyICAAOu/gA==
Date: Wed, 23 Apr 2025 03:45:55 +0000
Message-ID: <5821bb426ab9279d46e2bdbe2840c86614234825.camel@mediatek.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
	 <20250409131306.108635-5-angelogioacchino.delregno@collabora.com>
	 <270828a4074dcb0d1017cee0c5ce0406991fbc8d.camel@mediatek.com>
	 <17b19733-b203-40bd-ba14-07eb66f02d6c@collabora.com>
In-Reply-To: <17b19733-b203-40bd-ba14-07eb66f02d6c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7543:EE_
x-ms-office365-filtering-correlation-id: 7f0db6dc-ef95-404f-948b-08dd82195a12
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TEZ3MlRWNzFXSjI0T2hPU3p1U0lRQzJydWNJZWZGRVZ0ODY1Q3crU3dONElB?=
 =?utf-8?B?QjJXYkNJSkl2WkdMOUhnMitjZStkMEJ3R1owL0JiRndjMmt2dldJTlNQMVVR?=
 =?utf-8?B?cDlpM3NuU2ZUTWE5TlhBY24xNnJnb0JxNlprMldMSmxxYTBoREVpK2ZjS0FH?=
 =?utf-8?B?S0tBN1YrN1pDVC9rQ1B4QzlNSCt6MnhicWhpVE4zdDNyeUtiV05XNHhZMHdY?=
 =?utf-8?B?TXpPOW1LWnVNYzhKSVprZmlHRWlJL0ZycGVWUm5abHgyeUYwNVYyRDJRUGxK?=
 =?utf-8?B?d1hOV2haQ1hHMjU3eUVsWktGZENMdVBXaFlFZUZ6N1pBbC9JMmxTNDNJRFJM?=
 =?utf-8?B?MHZWZ25mSGo4ZGhwUjFpZjdEK2xlSFlxQVRLV3FYVUw2ZWh1MERvUmdlbUJz?=
 =?utf-8?B?RE1RclFaYitsWGlGOVU1NmFDejNhZ0JJNzJhNWUxckxYeWpRNXh5Q20xYnM4?=
 =?utf-8?B?R1AwM2h1b3VsN2srRCtzT3BlTFEyN3JqdSt1N2syTU1XRUEyeitKMnNwYldE?=
 =?utf-8?B?R1g0TStnUUtFTXlIN0JGRVBoTmsvOHE1Wm0wNkxpQ21EeFEwNzJReXlvVExE?=
 =?utf-8?B?eHpFVnNFdmRwbHVrWVFma2piTjM1UnFCTUpuTkczZHNINWp1Y2VuekI0UFRD?=
 =?utf-8?B?d0NNZFhPSzNtckdNSlEwY0tjS21neGxObmlvVzdyc1ZtRGoxTlNONjc4a2Vu?=
 =?utf-8?B?aW9BT0Q5RmtoRmZra0d5TGhLZ2tNYzkxbm9jdGVaQS9HdFhBajQ3SWVkcExp?=
 =?utf-8?B?K2FNczlyOVpRNERPWXZXa1ZwV2pmcGttajd5SWtQSWJLUlo4Mm9INk9EaWNS?=
 =?utf-8?B?RUxOQzNhdDI3TnB2MmdXRnNMQ3hhaFVFK0dKWFdFUmh4aWJyd25jZWp6OXBL?=
 =?utf-8?B?T3Z5N0JGcUtPM0dDZ1FDYzRUVjJVZTlZRHV3OFAvKzZmOW50M2dPM2ZjRVNa?=
 =?utf-8?B?dFNSd2I1V3lTMjNySStkYWNwZUU1SUoxdmV0QXZMMDlZaWN1UkJOcUhPcWpq?=
 =?utf-8?B?NjVIOElUOUc2ZVhJK01OelZ4Kytkci94ZE5PUlpRRkJqcFo4Rk1xK1BjVmVH?=
 =?utf-8?B?a1R0cGpTL1N5WDRNMXhkQWgzMEs5SitVVjRvQVg3amYrUnVmeWhpczZpd0Zl?=
 =?utf-8?B?LzNGLzVsWmZsVmlkZnVpeXFrT1g1b2JVdTdYNTU0WklwaGU3VG05SDFLMEYv?=
 =?utf-8?B?cmlQcE1EU2IwY2toZk80akNDU1FXd2l5cFdlbUpZSVQ1NmxPaU9GcktKZU5G?=
 =?utf-8?B?VWNieXRBdG9WeEZ3bU9UellrNmNhcUFLVFFLZ0g5RlltNTc3WTdiZU5UbGlm?=
 =?utf-8?B?NURxYWsxVVEvQVZiZ3BNd2YyUVNMU1FwUWdYT2JMS3d4Rkt5NG9TbExjajVr?=
 =?utf-8?B?MzJRdyt1WndubVUyZUFIdlpYY3Mvam1zYldyNXJuQ0dqb2FKd3UraFhWUHFN?=
 =?utf-8?B?RVVMTFFoT0VVVUtTTTYzaFQvT0xvV29RQTJzVXNDc0ZubWV3Qjh4dEcydnI3?=
 =?utf-8?B?bW9LNWcvMFMxd3JnUWphRGhMN0RpK0FIb0JTU3JiYi9UU1IzalJ5NXlpaFdX?=
 =?utf-8?B?NTVXNVIvb29CcmgxK1VLM3F6K3hFQ1UvcVpTMEMwbXB4K2pwZE10VVZnd2JW?=
 =?utf-8?B?ajJob3pEOHdyRWpwL050Y3ZwTmxmYTRCQ0Zjem1NcmI1NktkQXBiSU5WcGFM?=
 =?utf-8?B?VWdjMEJKc2FsUi9lUy9xbnIzOTdTWTFoU2lDK3BJcTQrVlVKVVdHS1pjVVJr?=
 =?utf-8?B?ZkptV3hab0NQVjFSdGlIUnNhODVTc2xvZDNkSlg4eWhjS3VNb1YraHgvVldr?=
 =?utf-8?B?dkMyTFpkSXhvV1ZyRmNEekVCZGlHSUpDY0tBN3dUdktwaFIrRVloRC92WUJv?=
 =?utf-8?B?RjhzSVh3cUE2cSsvN3FoYUlvcnJqUTJuZUx4UThtK0hTN3R1VDZSRVpxbHMr?=
 =?utf-8?B?WEtPQUFmMzJlMERmRFhSQk13dy9jME9acHovaWJVMmhkVTZOUFJjUEd5WVlG?=
 =?utf-8?B?MTF2dVJnQ0JRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmhRcXd1Njh3d256dnJHSys1aW55eUFMMDFsTXFnTnplVHpUVXptRTRCOUZa?=
 =?utf-8?B?L0ozZm4rM2FiZEMzN3Zsc0gvOU8wbnYrNnk2YVg5NEgzcW9lYjZqNDhvZ1VJ?=
 =?utf-8?B?Z2ZxdTZNdlpNYWhFMmtreUlrWVJ2eXBJdE1iZVdDUGNrTGQyUTRXbUpwekpw?=
 =?utf-8?B?amxiQjdPRnNta1o5V2pqS0dIbzdXQWtiZ1ppcGY0RXRraXFYUXJHTnVZNENS?=
 =?utf-8?B?SkdxYWtWV3luNDZpVlRMSWFxZ1VNM2FLZmk1K3dGQnI4NWl2b1dVRWJUV2JU?=
 =?utf-8?B?YTJaaG9BdlMrOFJ2SDdPQXRCZXVPTkZGeU81Ujlad2w5TzRyVWp1M3JIVVpm?=
 =?utf-8?B?OTYwU1FjWHNTR1gxVkUrS2JGaEY0ak85TUdkWVhkaEx0Szh5YjZLb0UzNVBO?=
 =?utf-8?B?NDNnbHFoa1M2Z1U4VDNWdnBiYk5US2lnek9nK3JrNkhRUDFaa1owd0lMUzZ6?=
 =?utf-8?B?aGk4akxZYU5COEtCSUM5SDdqMGFzUGpwZ3JmY21yNkJ4OTJhUVBkdEdzMmhs?=
 =?utf-8?B?V3FpSXNpQlptQXBsTVRtMjVaSWdubkdsMFZvaXFtTVJQRW14OS9iZ2lZYzhJ?=
 =?utf-8?B?V29weHFEdXE1ci9NeHg2Y3ZsU3VsU1hMZGpBNnRONTBudnZCYjlVSkxSRE5S?=
 =?utf-8?B?ZkU5M1JKS1hUYmNwRVBEQ0JiQW1reG5uOVpaYlJXREowSGRNS0xqTjNyaFow?=
 =?utf-8?B?YVBtSlhVeVFDdTEzVEpleDlGUTVDSlpjZ0h0ZGxPeFkrc05WV0M2QUlaNlRh?=
 =?utf-8?B?MC8zSm9sdzBMRHhNMU5lcFFxMlMwN3I1QzJGemdwd1h1ODZmNVdlbVo2Ynda?=
 =?utf-8?B?TjNjVnQrdm1kT1hGSXk2K0lVWTZLR1hSdVFSZlpxdzNuUWJ6ejRQNW1GY3Nu?=
 =?utf-8?B?YU4xRlJ3aDM1VTFyZmxheW5TYTNOc2llT3QrYXVaS0ovSDdvWFJEdHZNdWRn?=
 =?utf-8?B?OEdDWWplaHFUS1NrRGkvNEVmL0RJZlhQRm1yTlh5ak1kTFFIcnkyMjVUd2to?=
 =?utf-8?B?SnFpbUhXOHZ0Mm1XMUlNQlpiQUJkaWRxMmxObmxkYldzbU16ZjVNRjFOS2U3?=
 =?utf-8?B?N2Z5QUoxSk5WTmdGUUducDNqS080elFOTlZ2NE4rMnZUcjF4OTlVMzJGMVpG?=
 =?utf-8?B?ay84VkhsNDB3RlJRMVMzZkV4QkZPY2VVWUNFU3p5LzMxbUtUZ2pBM3NJbDFD?=
 =?utf-8?B?K29BaXMwcGxzL2JBdHJIYnkyK2ZmM3JaSEgrMk5SbTd5eitQc0hmaCtyQnVp?=
 =?utf-8?B?Q293dkVyQTNyY0RGRGdkVWoxUk45K3pzanhjTVgvWHFHcXRtYWttL3k4aUpZ?=
 =?utf-8?B?bVgxQ29vb0VHK3NCdWh6MXdJZTZOR3E0bmtBTis3K2V4YVNiL3BzQXlBdFQ2?=
 =?utf-8?B?eDlxNmY1M2YwakhCRDM3OHN2cDgyeEhLMTc0bDFwUGNDN3d2bmNQT1gzRTJV?=
 =?utf-8?B?cnZBN1h0Rjhra2cxeG55RFUzSjVJQ3FRVmlRNnhUZXhwSzBUYUM4NG5rREJW?=
 =?utf-8?B?dCtWemtueHhVdkpkMnp5M2s0K1o4Q0FOb2VVU2xEWjdVV3JDdDVoN2ZmT1Na?=
 =?utf-8?B?K3lFQVVTbU9IdSt1ZWMrdmhPcmJGYXF1eE53alRSajY3U2tTTWs5cVVRdUs4?=
 =?utf-8?B?UXFySTZOYysvK2NuSXB3NklFTUJXcDJHaENpWkl4SXV1WEhCeUhGWmhWY1ZJ?=
 =?utf-8?B?b21WcUI5MGsvVTNLVUE4aUV0STU5bE5MckhBbVFuRXVlK01DRnJyQnNLT25O?=
 =?utf-8?B?MGJXcndpMFJyQzFuZUJxRVRqNzkrS1FUNEJ6ekV1K0dlNmFOcStYdnpOR05S?=
 =?utf-8?B?OUpYcC9mNHRRV3M3bHlsODg2bXN2Y3pDTWFxbDdtOTMxejEwN0pqOWUxK3hB?=
 =?utf-8?B?dkxOR0ZmMkVSNkpVajBhd2pjY1gyUWJxK1hRdVRGSnRpZXFjZWdyUDlQRU9C?=
 =?utf-8?B?dUFnakREOWcxUmlSRlRzQm9ibXc0SWcvNnRxc1BldmowNWtvTCtucUFlVktv?=
 =?utf-8?B?R09KOWs1ZFR0eGVwR0tzd0hCTTNjL2hCTm9WUjZOcVQ3QitiaGZNNWVTdzF5?=
 =?utf-8?B?U2hqdWZRRmZSWGVTcjU5dWlsakVHb0RmWk96VytSU1YyYlNDS3BwQWp2bzRD?=
 =?utf-8?Q?mEHzBo8clpiaqtxkJk/Unj3Y0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <142108A1CAABB5428A3BE54402E061AB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0db6dc-ef95-404f-948b-08dd82195a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 03:45:55.3218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xlZYV9+nhsbe7feYVh/L3aNFAsnkgvoFFRzN9XQ2sM78iKQg9TqRKwGx+J4N9Lrvly0oTglALh/gCXG6fcq7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7543

T24gVHVlLCAyMDI1LTA0LTIyIGF0IDE1OjQyICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyMi8wNC8yNSAwODowMSwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBIaSwgQW5nZWxvOg0KPiA+IA0KPiA+IE9uIFdlZCwgMjAy
NS0wNC0wOSBhdCAxNToxMyArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEFsbG93IGFkZGl0aW9uYWwgb3V0cHV0IGZv
cm1hdHMgaW4gYm90aCBEUEkgYW5kIERQX0lOVEYgYmxvY2tzIG9mDQo+ID4gPiB0aGUgTVQ4MTk1
IGFuZCBNVDgxODggU29DcyAoYXMgdGhlIGxhdHRlciBpcyBmdWxseSBjb21wYXRpYmxlIHdpdGgs
DQo+ID4gPiBoZW5jZSByZXVzZXMsIHRoZSBmb3JtZXIncyBwbGF0Zm9ybSBkYXRhIGZvciBib3Ro
IGJsb2NrcykgYnkgYWRkaW5nOg0KPiA+ID4gDQo+ID4gPiAxLiBOZXcgZm9ybWF0cyB0byB0aGUg
YG10ODE5NV9vdXRwdXRfZm10c2AgYXJyYXkgZm9yIGRwX2ludGYsDQo+ID4gPiAgICAgbGFja2lu
ZyBZVVY0MjIgMTItYml0cyBzdXBwb3J0LCBhbmQgYWRkaW5nIFJHQjg4OCAyWDEyX0xFL0JFDQo+
ID4gPiAgICAgKDgtYml0cyksIEJHUjg4OCAoOC1iaXRzKSBSR0IxMDEwMTAgMXgzMCAoMTAtYml0
cyksIGFuZCBZVVYNCj4gPiA+ICAgICBmb3JtYXRzLCBpbmNsdWRpbmcgWVVWNDIyIDgvMTAgYml0
cywgYW5kIFlVVjQ0NCA4LzEwIGJpdHM7IGFuZA0KPiA+ID4gMi4gQSBuZXcgYG10ODE5NV9kcGlf
b3V0cHV0X2ZtdHNgIGFycmF5IGZvciBEUEkgb25seSwgd2l0aCBhbGwgb2YNCj4gPiA+ICAgICBm
b3IgZm9ybWF0cyBhZGRlZCB0byBkcF9pbnRmIGFuZCB3aXRoIHRoZSBhZGRpdGlvbiBvZiB0aGUN
Cj4gPiA+ICAgICBZVVlWMTJfMVgyNCAoWVVWNDIyIDEyLWJpdHMpIG91dHB1dCBmb3JtYXQuDQo+
ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDI0ICsrKysrKysrKysrKysr
KysrKysrKystLQ0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+
ID4gPiBpbmRleCBhOWU4MTEzYTE2MTguLjlkZTUzN2E3NzQ5MyAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gPiA+IEBAIC0xMDkzLDkgKzEwOTMsMjkgQEAg
c3RhdGljIGNvbnN0IHUzMiBtdDgxODNfb3V0cHV0X2ZtdHNbXSA9IHsNCj4gPiA+ICAgICAgICAg
IE1FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfQkUsDQo+ID4gPiAgIH07DQo+ID4gPiANCj4gPiA+
ICtzdGF0aWMgY29uc3QgdTMyIG10ODE5NV9kcGlfb3V0cHV0X2ZtdHNbXSA9IHsNCj4gPiA+ICsg
ICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMlgxMl9MRSwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MlgxMl9CRSwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9SR0IxMDEwMTBfMVgzMCwNCj4g
PiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9ZVVlWOF8xWDE2LA0KPiA+ID4gKyAgICAgICBNRURJ
QV9CVVNfRk1UX1lVWVYxMF8xWDIwLA0KPiA+ID4gKyAgICAgICBNRURJQV9CVVNfRk1UX1lVWVYx
Ml8xWDI0LA0KPiA+ID4gKyAgICAgICBNRURJQV9CVVNfRk1UX0JHUjg4OF8xWDI0LA0KPiA+IA0K
PiA+IFdoYXQncyB0aGUgb3JkZXIgeW91IGZvbGxvdz8NCj4gPiBJIHdvdWxkIGxpa2UgUkdCIHRv
Z2V0aGVyIGFuZCBZVVYgdG9nZXRoZXIuDQo+ID4gDQo+IA0KPiBBY3R1YWxseSwgQkdSODg4XzFY
MjQgc2hvdWxkIGNvbWUgYmVmb3JlIFJHQjg4OF8xWDI0IG5vdyB0aGF0IHlvdSBtYWtlIG1lIG5v
dGljZS4uIQ0KDQpJIHdpbGwgY2hhbmdlIGFzIHRoaXMgd2hlbiBJIGFwcGx5IHRoaXMgcGF0Y2gu
DQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBUaG9zZSBhcmUgb3JkZXJlZCBieSBwcmVmZXJlbmNl
IChhbmQgdGhlIG9yZGVyIHdvbid0IGJlIHJlc3BlY3RlZCBpbiB0aGUgYWN0dWFsDQo+IGNvZGUg
YW55d2F5KS4uLi4gYXMgaW46DQo+IC0gRm9yIFJHQiA4LWJpdHMsIFJHQjg4OF8xWDI0IGlzIHRo
ZSBvbmUgdGhhdCBzaG91bGQgYmUgcHJlZmVycmVkDQo+IC0gRm9yIFJHQiAxMCBiaXRzIHRoZXJl
J3Mgb25seSBvbmUgc28gLi4uDQo+IC0gRm9yIHl1diBtb2RlcyAtIFlVWVYgaXMgcHJlZmVycmVk
IHRvIFlVVg0KPiAgICAtIHRoZXJlJ3Mgb25seSBvbmUgZm9yIGVhY2gsIHNvIGluIHRoYXQgY2Fz
ZSBpdCdzIGFscGhhYmV0aWNhbA0KPiAgICAgIG1lYW5pbmcgdGhhdCB5dXl2OCBjb21lcyBiZWZv
cmUgeXV5djEwDQo+IA0KPiBJZiB5b3Ugd2FudCwgeW91IGNhbiByZW9yZGVyIHRoZW0gYXMgeW91
IHdpc2ggYW55d2F5IC0gdGhlcmUncyBubyBzdHJvbmcgcmVhc29uDQo+IGFnYWluc3QgYW55IGtp
bmQgb2Ygb3JkZXJpbmcuDQo+IA0KPiBCZXNpZGVzLCBpZiB5b3UgY2FuIGNoYW5nZSB0byB0aGUg
b3JkZXIgdGhhdCB5b3UgcHJlZmVyIHdoaWxlIGFwcGx5aW5nIHRoaXMgY29tbWl0DQo+IHRoYXQn
cyBncmVhdCAtIG90aGVyd2lzZSBqdXN0IHRlbGwgbWUgd2hhdCBvcmRlciB5b3UgcHJlY2lzZWx5
IHdhbnQgYW5kIEknbGwgc2VuZA0KPiBhIHYyIGZvciB0aGUgZW50aXJlIHNlcmllcyA6LSkNCj4g
DQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4g
PiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9ZVVY4XzFYMjQsDQo+ID4gPiArICAgICAgIE1FRElB
X0JVU19GTVRfWVVWMTBfMVgzMCwNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gICBzdGF0aWMg
Y29uc3QgdTMyIG10ODE5NV9vdXRwdXRfZm10c1tdID0gew0KPiA+ID4gICAgICAgICAgTUVESUFf
QlVTX0ZNVF9SR0I4ODhfMVgyNCwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MlgxMl9MRSwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9CRSwNCj4g
PiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9SR0IxMDEwMTBfMVgzMCwNCj4gPiA+ICAgICAgICAg
IE1FRElBX0JVU19GTVRfWVVZVjhfMVgxNiwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9Z
VVlWMTBfMVgyMCwNCj4gPiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9CR1I4ODhfMVgyNCwNCj4g
PiA+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9ZVVY4XzFYMjQsDQo+ID4gPiArICAgICAgIE1FRElB
X0JVU19GTVRfWVVWMTBfMVgzMCwNCj4gPiA+ICAgfTsNCj4gPiA+IA0KPiA+ID4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19kcGlfZmFjdG9yIGRwaV9mYWN0b3JfbXQyNzAxW10gPSB7DQo+ID4g
PiBAQCAtMTIwOCw4ICsxMjI4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYg
bXQ4MTkyX2NvbmYgPSB7DQo+ID4gPiANCj4gPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
ZHBpX2NvbmYgbXQ4MTk1X2NvbmYgPSB7DQo+ID4gPiAgICAgICAgICAubWF4X2Nsb2NrX2toeiA9
IDU5NDAwMCwNCj4gPiA+IC0gICAgICAgLm91dHB1dF9mbXRzID0gbXQ4MTgzX291dHB1dF9mbXRz
LA0KPiA+ID4gLSAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxODNfb3V0
cHV0X2ZtdHMpLA0KPiA+ID4gKyAgICAgICAub3V0cHV0X2ZtdHMgPSBtdDgxOTVfZHBpX291dHB1
dF9mbXRzLA0KPiA+ID4gKyAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgx
OTVfZHBpX291dHB1dF9mbXRzKSwNCj4gPiA+ICAgICAgICAgIC5waXhlbHNfcGVyX2l0ZXIgPSAx
LA0KPiA+ID4gICAgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsDQo+ID4gPiAgICAgICAgICAu
c3dhcF9pbnB1dF9zdXBwb3J0ID0gdHJ1ZSwNCj4gPiA+IC0tDQo+ID4gPiAyLjQ5LjANCj4gPiA+
IA0KPiA+IA0KPiANCg0K
