Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD03152E02;
	Wed, 28 May 2025 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404926; cv=fail; b=IBGypaf/oLXLu/hK98PVmSk5WGOBg8fUsGZmJjiNVmSUgJW0j5GNxcMnE+erPEQPI1e+uq9KO0Y+gDj+HFvtxb1Iu9ShTjl9cBLqibjZTfF5+Wzl8MlyxW68sCacmMoWH3+5XTkGtj8KReC5oq0v1fvzBHYEwt2YOwujSEgCnig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404926; c=relaxed/simple;
	bh=yNQWAoeNV5clJXJRUUfa4lQLhbzYmDSHmWzKvRgRC8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sb0hVeSsn3U5J9UkSD7ifORKfTtPGd8OlRMBBo+N0TYMTlkBEO56qrbfyTapgvc7gGxIYaCDNSOyGAULRvZrq41rzOu9EkpdlUCh6EihB2EsbW4jNxz9/FCiKdylWFqxQLUg3C2UfRhBsOmGwMAnKqujsAPoIaeDNqHCHGSDby0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Cs4EYqWb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fcyYdG1h; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cs4EYqWb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fcyYdG1h"
X-UUID: 80d70ec63b7811f082f7f7ac98dee637-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yNQWAoeNV5clJXJRUUfa4lQLhbzYmDSHmWzKvRgRC8U=;
	b=Cs4EYqWbB7DxWsrBoOuI+2i40XLMg0YLOwv212OcT+1qT9xIf2P4ls7BSBB+vzHlBKsfaKDmiRHrBaN0JkVvTG+JjDEeuZAV9EqxucDeBxXjs8thZ1XBK/n6WVzbpLt6HQEVh2jiuNHI4XZOH/o75n0d+r9tR8xEPoQwuicdB1Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1e521a58-a837-478b-82fb-0cb529698c68,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:5e85ce47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|11|97|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 80d70ec63b7811f082f7f7ac98dee637-20250528
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2048951558; Wed, 28 May 2025 12:01:59 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 12:01:57 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 12:01:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow6nuAK1SMnXCHIh+KTYoGlMLiWTlySZ6Am+HREgpISghq6+CwL2XhLH2/IQEoKITcYaXXLknCPH+QQjGTWmUYbx+/GROd5+niR0yeGS/28M1ZuVkDkkZrvtUsgJs7D9lSo2SxPB0h1V3Lbs88bk2vCEerEE4p+y3PuiolEqHDIxUex/QALGEyJXo4HUh41JrHhWIVpCdXUmH4A4H5hUyYhvc1mc/EyXpa8xSJSpKwE8BDeKo4zHCsj2MB6aggcnslhQRLHPLtBjCZkktL3MvDd4ETgiybQrXHMjPZ1dNqTCNm4HgXPZXwEc1bQpgEbtRtAwkJw2lmke4qkgoDOAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNQWAoeNV5clJXJRUUfa4lQLhbzYmDSHmWzKvRgRC8U=;
 b=StyA+E0uNJs27GBxvxgO+gWif3O+gpoNSZEpWsPmimFp0Alz2+uuzlFPAVrZ/aK3eDA0E7ui9e/60x9lu2/OvrLXtoVO1hrl5ljye+LE+5mt8RIXH/SxoaQK6tinToersgn2DwAnAC45yEe5R/a9kxskakQPER/WuJL6OnScBRPfOzjI7qS04AnPf1v9uy9lIIBIgviyKDRehDJ5TLfOFiWn5F7ed4cyObn9whrupKjjbfmFURlWM/rBXdSm9YvoX+/LNtefPOHH/lpqZVUyOnLs65sWAQXc7IBopQ0hWvp7xkMtsQnLDek9chQiyZtZ6MSqV2bjGOKMmcIoPVPvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNQWAoeNV5clJXJRUUfa4lQLhbzYmDSHmWzKvRgRC8U=;
 b=fcyYdG1hxh1kXJ2jhqfQbP+yuMS4OJ9TlzXfyyJxMRAqoY+OFRwTUEYt/lGiwII+htBF9rkozE+AHWN8OZpivB6k0jsKaI94m1HrlqbDzZAISeRYveMce3ZGvQ5KOXdt89RlFLDa/Cw+cj8gqo3Oykei3bEuv9nfz9SfX1Am8zM=
Received: from TYZPR03MB7602.apcprd03.prod.outlook.com (2603:1096:400:41c::11)
 by TYZPR03MB8035.apcprd03.prod.outlook.com (2603:1096:400:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 04:01:55 +0000
Received: from TYZPR03MB7602.apcprd03.prod.outlook.com
 ([fe80::caa4:f232:9622:3328]) by TYZPR03MB7602.apcprd03.prod.outlook.com
 ([fe80::caa4:f232:9622:3328%5]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 04:01:55 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk@kernel.org" <krzk@kernel.org>
CC: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
Thread-Topic: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
Thread-Index: AQHbyyr3TV5YlxKjckW7D5CVzWbKv7PewKWAgAizgoA=
Date: Wed, 28 May 2025 04:01:55 +0000
Message-ID: <9ada04bb73e980f981d3b933552f0eda47d4fd26.camel@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
	 <20250522150426.3418225-2-nancy.lin@mediatek.com>
	 <d21e1775-d5d4-4f58-865e-0cb33d14f371@kernel.org>
In-Reply-To: <d21e1775-d5d4-4f58-865e-0cb33d14f371@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7602:EE_|TYZPR03MB8035:EE_
x-ms-office365-filtering-correlation-id: b099ab0a-8bca-4c77-2aad-08dd9d9c629a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N21zejZaUWc4bHFBMUtiYzAwTXR1Z2ppWUVtRk9SRGxqL1FJcFdneGgrU0hG?=
 =?utf-8?B?SXJoeHYwcDlXRTV4V0NmSitiVlhya1ZqRktmc2RydGFpNG5RbGZtOC9JaEdo?=
 =?utf-8?B?TUI3Q0hSR083VSs4b3UyQmhFUzVhS2tEUUxEOWU3RjN6b1o5c0JzSXZSQmly?=
 =?utf-8?B?K2EzMUg3WmloaWxHc3VySVdoYnJsQ0lqaytGZG5VRW5WT1V4cDhoQmpBR1Zk?=
 =?utf-8?B?ZmVBQVBWTzM2amh1ZDlONGp5OGkyNExzbU5VU3lKVVZjMkd2cVFidkJwblpQ?=
 =?utf-8?B?MEhOaDRSbWZSMW92MDZHL3NJWSt1bEk4S3FZRVNJNXlNd21ic3RlYTFid3Mv?=
 =?utf-8?B?Unl3cU8yUXBjS1BZc250bi8rd01Ha2tnbFVEQm9NWUwwc3NUa1BySGIrcGQw?=
 =?utf-8?B?QXdUNWp4akJUT000eW9LNnBkcXFHbHk1Sk9PM0FSQjlUdnlVU2Y0VVFVUlZi?=
 =?utf-8?B?WnpXdDVMQmk5THgxWGxhYjRwKzFVbDRmWm03YlQrTHpQbmNnOVV4NlFaYjVD?=
 =?utf-8?B?dTR6NXoyc0hMcmF6YVBHcmc4azJkTjlKQ1RsZWJwamhTQVF2SE5sS1pJVEpZ?=
 =?utf-8?B?K2drd20zVWFUWGxSR3RMM0lMLy9nMlgwdDYzRWR2YVhqWlpSYXozNFZGODBw?=
 =?utf-8?B?QkZlY2RLTDdWVExxd1lLTGVHTTFIeWZFTHlxT2RhNkFGR3Q5d3AzajVaZ2ty?=
 =?utf-8?B?My9CVG5zU01zUU1taUJGcXQ1bTYxWU5SVVFFU3JGLzFobDJyZ1YzclRPMjd1?=
 =?utf-8?B?VnpWNlVBblRSS21NS3NQYTJyd1pVZjY5OHU0QjhXcUdJSk1sMHVrcDRsbGZj?=
 =?utf-8?B?eDFBSzd0UjFXT1lGV2ZUUldaWSsrSmNNdkVqSTI0V2FEbU9oODVqZ0dvZXVu?=
 =?utf-8?B?Z1dMRkJWWkVCV1R2VEJWMFIzMStYOTRjWlVYNHc1TFhTYjV5TVltcTZsb0gx?=
 =?utf-8?B?cnlRS0NpR3QveHJyekkwTGxlSVFlTUVaeStETE02TmRMQy9McGRkYTdXakNv?=
 =?utf-8?B?bkFHa05vY3IrMzh0c1N2TnJEV2R6N0tUYjhTMWREUXFZQ2lpV0xHdUVGaE1D?=
 =?utf-8?B?NFRiZU1CM0hZM0lqMnBnMVBZcDVIc050MktEYlplY081ZnVBV0lScU1mQitq?=
 =?utf-8?B?eFJ3Um1mbkc4R1A3TEJRNDd2WnpkeUFUYnI3L213TC9yeXBDRStMYngrTzAr?=
 =?utf-8?B?R2xjZVVjd1BCOWpmL09PUDh0YWtka0QwSjdlY2FweDJVZ3l1MnZuYm13R2tS?=
 =?utf-8?B?MkV6OEdUakxGZysrWEh0OXhrdzBTbHpEUEVJQk10dkFMTXgvSTJjT24wZnBE?=
 =?utf-8?B?eW94WStScW9kZUd6WnhYR0pJQi95c0lUZ3NBUU5vZkpkRjlRREV2UEZsUFNW?=
 =?utf-8?B?YTJWYUZzSTdnTms4elJqbyt3cE9Tclpyckk3bkdBcHVKMlhJVmkxN050d1ZP?=
 =?utf-8?B?emtmS3dwKzVDbG55MDJodW9pVWM5dGNIQnBVRzB3Tk1pTmI3N2pSOHBIa1hX?=
 =?utf-8?B?ak9KeTdDc2hyb01mTEN6akxHQ2U4V29QT2VQWFVlS1UybGRwcUxDNnJ3NTVY?=
 =?utf-8?B?dHN2eDJZKzIzWDIyd0Q1RHZLQ0drdU5tN2hCSStqbmRaaTNFUU5CMmMyVmRW?=
 =?utf-8?B?Wi8xVjJ1WlJUWnNIVFlyVE5pOVNveFZhRTVxMW9oblBOTk9yNERTcEpxTzZ0?=
 =?utf-8?B?RlRTZUphK01vSURDeFhoZDZaUW1mOUVreHR4YmhqdlNvaEYvdkhLeFpvb2Zp?=
 =?utf-8?B?MkVqOFd4dk96bDJ3SUk5eVd5Njk1NTFqaVhrdVp1b0dsTk9jRElYZlpuOFl6?=
 =?utf-8?B?SERWT1NRakQyTUg3M0lYenZWblJVZUhHeHBtNlhBWkl6d29VeDhZSmJpSDVw?=
 =?utf-8?B?TkxyYUFESDcwMGR0MFlsU1Y3enk4OTdEK0NpZjN4OGsxVHVMcWxnUDNqbGlM?=
 =?utf-8?Q?8c2VbSXGpHw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7602.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnIyU1RvWEVqUjF3aTd6MHNVUmlHMFZVMXgxUHpDQXVEV0kxdDAzVGFJZ0pF?=
 =?utf-8?B?S3NoWm14UnBrRzZTRmQ5ajlIU25VeHRhZDhOTDVaMHdiK0dOOXhBcnpMRC9H?=
 =?utf-8?B?MXI2bW5yRXIrUVNmZWVGZ1Q0UENUbGhVUlVGR2VjbyszZnIvQVUrbTB5VVNl?=
 =?utf-8?B?WlhwTHVsbFpiL0pnTzZkMDdDYlBXbWdETjExS3BlSWs1bVBFQ2pNeUZ0Sjcy?=
 =?utf-8?B?dGdFSEIwQjRaUENSSmNzUDJLdnJMOXM3M0RUeGFhTE9ldFR0Qm1TbGE5bW5K?=
 =?utf-8?B?dnNXRmkvOWt6RU0waVdPVGNwWVZTT1k0MWYyV3Q0QWR3M2prZHJlKzd5RVNS?=
 =?utf-8?B?TlRuQ3UvaDlWNkM0eDVNazBDeUxLVGxSMWJzZ01zZmlPRk81SThLZE53cGlX?=
 =?utf-8?B?U2pKRzhsTzhML0VZWUswM3U5N3hRcTAzTHRBbUcycVZoVXIrVHJZQ0JNODdV?=
 =?utf-8?B?d3pqRVZqei82TVdveHY4QXJWcU5UN05CQnBwU29ycm5nZ1hGakdubll3enlp?=
 =?utf-8?B?TDNkeUhIMHVOS1kveG5nMjY3OFB1bS9rSVNGaE5mTDNMTHU1VTNHYzFoZTZo?=
 =?utf-8?B?TExlbUlrcGNvZFhKWXhLNmZqVHlxd1VocFF3TndQTXZDdHdXa2ZKOHVFZDVm?=
 =?utf-8?B?S1c3WUZPai9ROGtnZlk2RTc1UU0wQXFRVms4TGZ1N2MrcmhkeXduTzNEZXI1?=
 =?utf-8?B?ZmpGbStaWERGa2NoZHU1NHpnaWlyZ3dOWStleUpaTUU4dUEwb2JBbzFBNWJn?=
 =?utf-8?B?dk05K1BsSkg1ZGgzOGdRalZqVVkvOFFTU3RUUDdsK2ZQa09CaTI4SFFVS2x0?=
 =?utf-8?B?VjRrL0VnTy8xL0FUdFd5Yk9Ud2ZUc2FEeEQvWGtYSytMZWhtT25Rck8yVFNt?=
 =?utf-8?B?M3RaVHR5QkdBeld0TWIxSFUwS3Ywd2NNVTJwcEs1VmRYbzFTTVdTbEhiTVEz?=
 =?utf-8?B?MlRtdktTTEJZeS9QMnFCNUtjaHlwNjRwa3JBUUJZV3gxN0FkbUl1ZnpLdU5L?=
 =?utf-8?B?QTVXbWJDZ2xEY2pQQ0hmZzJjUzNUTVhYbjM3d2tVS2NsSFVhSmZvMkRkMmNk?=
 =?utf-8?B?ZUZzRUpNWThhc09Hb0QzVitmNXMraDk1c3ZGQTRjeHBiU0lzcGo2RngxL3pw?=
 =?utf-8?B?dG15aytFYVJDa3BONVVqMVZjQ2FreGZ3bTQ3S2hhUFhLQXhJWnpSK210cmFy?=
 =?utf-8?B?Sm9WR3JwcHl2K3B3ZG5PKzQ2WDVwQjNGcENGWUY0L2ZaMWtVd0plL0ZvNkdF?=
 =?utf-8?B?N1NRT2pHTENVNDhTOFlaN1crT2ZtdWlvUDJiMU1UZ00xdThpVGRiWVBaNGgv?=
 =?utf-8?B?VEtWZVIvTVVDOGtnYjQ2NHc3QVAwdnhzaXloYkMydGp2YXpycDhTRVgxN3ll?=
 =?utf-8?B?U2lpZUJISjdSM2NUTDNiN1FWSmVGbUt1SGhyVWMzL2ErOFNBdGFnY0FOaVJ2?=
 =?utf-8?B?RXo2OEh1WGN0RUd0SzdtTzQ2MnpQRnpQN3duWEF5Wm8zbVJEVkpyczVmeDI4?=
 =?utf-8?B?ak5MMlR2TXIvK042SUJJRVVPSDNEWi9iV3FHb2hYUmJCWlhTWm03VHVGc1ZI?=
 =?utf-8?B?TkpDalBoNUNCSGl1ZDA2QUR5VDR6RFF4WGJteERMaXBYcHh0Wm55ZktCOTVw?=
 =?utf-8?B?SS93Vmk2L056cjgzc0FTZ0lQRUh6WTA4eTd0QUE3RWZVNHNBQWI1dFMwVVVx?=
 =?utf-8?B?Y0hibndXNFRwWXAvYVd5TkVtYWxqQlVnSHVBMGFuTERVRG1MRExZWlQ3ZmRU?=
 =?utf-8?B?ZGNRbGdmUTMybmpBYUdEdkwrNHJldFBwSkVkNjZzRjlGMEl5TXJCdkQrWFRF?=
 =?utf-8?B?YjRMNHRQNUhPRngrbE5ZU2JJbHViNlFRRVFvWTFJRm5XeFZCYktDdENOSFE3?=
 =?utf-8?B?eXJpeWRDMmtFcVk5MzhmcEhhUGNsejEwOVJFaWUwdHN6ODhRNjZwQkdPU0di?=
 =?utf-8?B?NWVxeXhxdEVOWnZIK0taQjlaZ3FxVzNmOEFxb2k3S0gxakt2SGZyTnFOOUtW?=
 =?utf-8?B?Q3lJLzdkeTVhdkduNzJKNmlNN1JCK0VLMmdYZ21zWFhUTkNVT3h0YWJYeUZW?=
 =?utf-8?B?YjgxOWxORnlxRE1xVWpMaFBjL2IxVFBtNmxyWSt1Sm9NaG5IMlgwQ2NTZWto?=
 =?utf-8?B?bGpRTGp4K05HRjllT0FGb0VpVVlMTDlnQmVWeUY5R3lXbmZyeHdWcm1KU1JR?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF17FFD7B0B13A4FBD16AC084A6EACA8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7602.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b099ab0a-8bca-4c77-2aad-08dd9d9c629a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 04:01:55.1106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+kdKMOQjDiVvFbz7NQLNxGhDNivrdt4QRiOM7M/hQwUsqt4uf/+5cnUD3k3JxI5LnITvdL2026VLUBISlivjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8035

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjUt
MDUtMjIgYXQgMTc6MDkgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IA0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IE9uIDIyLzA1LzIwMjUgMTc6MDMsIE5hbmN5LkxpbiB3cm90ZToNCj4gPiBG
cm9tOiBOYW5jeSBMaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRkIGEg
ZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudCBmb3IgdGhlIE1lZGlhVGVrIE1UODE5NiBWTU0N
Cj4gPiAoVmNvcmUNCj4gPiBmb3IgTXVsdGlNZWRpYSkgcmVndWxhdG9yIGNvbnRyb2xsZXIuIFRo
ZSBWTU0gY29udHJvbGxlciBhY3RzIGFzDQo+ID4gdGhlDQo+ID4gbWFpbiBwb3dlciBzdXBwbGll
ciBmb3IgbXVsdGltZWRpYSBwb3dlciBkb21haW5zLCBzdWNoIGFzIHRob3NlDQo+ID4gdXNlZA0K
PiA+IGJ5IGRpc3BsYXksIHZpZGVvIGVuY29kZSBhbmQgZGVjb2RlIHN1YnN5c3RlbXMuIEl0IHBy
b3ZpZGVzIHZpcnR1YWwNCj4gPiByZWd1bGF0b3JzIHRoYXQgc2VydmUgYXMgdGhlIHBvd2VyIHNv
dXJjZXMgZm9yIHZhcmlvdXMgbXVsdGltZWRpYQ0KPiA+IElQcywNCj4gDQo+IFZpcnR1YWwgcmVn
dWxhdG9ycyBkbyBub3Qgc291bmQgcmVhbCwgc28gZmVlbHMgbGlrZSB5b3Ugd2FudCBzb21lDQo+
IHNvcnQNCj4gb2YgcG93ZXIgZG9tYWlucz8NCj4gDQpUaGlzIHJlZ3VsYXRvciBzdXBwbGllcyBw
b3dlciB0byB0aGUgcG93ZXIgZG9tYWluLiBCZWZvcmUgdGhlIHBvd2VyDQpkb21haW4gY2FuIGJl
IHBvd2VyZWQgdXAsIHRoZSBNZWRpYVRlayBQTSBkcml2ZXIgZmlyc3QgZW5hYmxlcyB0aGUNCnJl
Z3VsYXRvciB0aGF0IHRoZSBwb3dlciBkb21haW4gcmVsaWVzIG9uLCBhbmQgdGhlbiBwb3dlcnMg
dXAgdGhlDQpkb21haW4uIFdoaWxlICJ2aXJ0dWFsIiBtaWdodCBub3QgYmUgdGhlIGJlc3QgdGVy
bSwgaXQgYWNjdXJhdGVseQ0KZGVzY3JpYmVzIGEgcmVndWxhdG9yIHVzZWQgdG8gY29udHJvbCB0
aGUgcG93ZXIgc3dpdGNoLg0KDQpVbHRpbWF0ZWx5LCB0aGUgVkNQICh1UCkgaGFuZGxlcyB0aGUg
b24vb2ZmIGNvbnRyb2wgb2YgdGhlIHJlZ3VsYXRvci4NClRoZXJlZm9yZSwgd2UgZW5jYXBzdWxh
dGUgaXQgYXMgYSBzdGFuZGFyZCByZWd1bGF0b3IgaW4gdGhlIGtlcm5lbC4NCg0KVGhlIGludGVy
bmFsIGNvbnRyb2wgb2YgdGhlIFZNTSByZWd1bGF0b3IgaXMgYXMgZm9sbG93czoNCiAgIGtlcm5l
bCAgICAgICAgICAgICAgICAgSFdDQ0YgICAgICAgICAgICAgICAgICAgICAgICAgIFZDUCAodVAp
DQp8LS0tLS0tLS0tLS0tLS18ICAgICAgfC0tLS0tLS0tLS0tLS0tfCAgIGlycSAgICB8LS0tLS0t
LS0tLS0tLS0tLS0tLS0tfA0KfCBWTU0gcmVnbGF0b3IgfCAtLS0+IHwgaGFyZHdhcmUgICAgIHwg
IC0tLS0tPiAgfCBnZXQgYnVjayBvbi9vZmYgaXJxIHwNCnwgICAgICAgICAgICAgIHwgICAgICB8
IHZvdGVyICAgICAgICB8ICAgICAgICAgIHwgYW5kIHRoZW4gdHVybiBvbi9vZmZ8DQp8ICAgICAg
ICAgICAgICB8ICAgICAgfCAgICAgICAgICAgICAgfCAgICAgICAgICB8IGJ1Y2sgICAgICAgICAg
ICAgICAgfA0KfC0tLS0tLS0tLS0tLS0tfCAgICAgIHwtLS0tLS0tLS0tLS0tLXwgICAgICAgICAg
fC0tLS0tLS0tLS0tLS0tLS0tLS0tLXwNCg0KV2hlbiB0aGUgcmVndWxhdG9yIG5lZWRzIHRvIGJl
IHR1cm5lZCBvbiBvciBvZmYsIGl0IHVzZXMgdGhlIHZvdGVyDQpwcm92aWRlZCBieSBod2NjZiB0
byBjYXN0IGEgdm90ZSBmb3Igb24vb2ZmLiBUaGUgVkNQIHRoZW4gcmVjZWl2ZXMgdGhlDQpjb3Jy
ZXNwb25kaW5nIElSUSBmb3IgdGhlIHJlZ3VsYXRvciBhbmQgcGVyZm9ybXMgdGhlIGJ1Y2sgb24v
b2ZmDQphY2NvcmRpbmdseS4NCg0KPiBBIG5pdCwgc3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwg
cmVkdW5kYW50ICJiaW5kaW5ncyIuIFRoZQ0KPiAiZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJl
YWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuDQo+IFNlZSBhbHNvOg0KPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djYuNy1yYzgvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0
aW5nLXBhdGNoZXMucnN0KkwxOF9fO0l3ISFDVFJOS0E5d01nMEFSYnchbEJxdHpaOERtQzZmMmtO
bkxYUkNwSHNvZjdYT1l2cklNRzRvX0RYdXZqWWJnMVN5RlJyWHJ0RU1Makl4UzMxY3E4MmhxUW93
cmN6V1JnJA0KPiANCg0KT0ssIEkgd2lsbCByZW1vdmUgdGhlIGJpbmRpbmcvZG9jdW1lbnQgd29y
ZCBpbiBjb21taXQgbWVzc2FnZSBib2R5Lg0KQW5kIGNoYW5nZSB0aXRsZSB0bw0KICAgcmVndWxh
dG9yOiBkdC1iaW5kaW5nczogQWRkIE1UODE5NiB2bW0gY29udHJvbGxlcg0KDQoNCj4gPiBhbmQg
Y29vcmRpbmF0ZXMgd2l0aCB0aGUgaGFyZHdhcmUgY29tbW9uIGNsb2NrIGZyYW1ld29yayAoaHdj
Y2YpDQo+ID4gYW5kDQo+ID4gdGhlIFZpZGVvIENvbXBhbmlvbiBQcm9jZXNzb3IgKFZDUCkgdG8g
bWFuYWdlIHRoZSBwb3dlciBkb21haW5zIG9mDQo+ID4gdGhlc2UgY29tcG9uZW50cy4gVGhlIHJl
Z3VsYXRvciBpcyBjb250cm9sbGVkIGJ5IHRoZSBWQ1AgZmlybXdhcmUsDQo+ID4gYW5kIHRoZSBv
cGVyYXRpbmcgc3lzdGVtIHNpZ25hbHMgaXRzIHJlcXVpcmVtZW50IHRocm91Z2ggYSB2b3RpbmcN
Cj4gPiBoYXJkd2FyZSBibG9jayAoaHdjY2YpLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5h
bmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9tZWRp
YXRlayxtdDgxOTYtdm1tLXJlZ3VsYXRvci55YW1swqDCoMKgwqDCoMKgwqAgfCA3MA0KPiA+ICsr
KysrKysrKysrKysrKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCsp
DQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVndWxhdG9yL21lZGlhdGVrLG10ODE5Ni12bW0tDQo+ID4gcmVndWxhdG9yLnlh
bWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVndWxhdG9yL21lZGlhdGVrLG10ODE5Ni12bW0tDQo+ID4gcmVndWxhdG9yLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbWVk
aWF0ZWssbXQ4MTk2LXZtbS0NCj4gPiByZWd1bGF0b3IueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hNTBlMzVjMmUyMzgNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3Vs
YXRvci9tZWRpYXRlayxtdDgxOTYtDQo+ID4gdm1tLXJlZ3VsYXRvci55YW1sDQo+ID4gQEAgLTAs
MCArMSw3MCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBC
U0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICJo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cmVndWxhdG8NCj4gPiByL21lZGlhdGVrLG10ODE5Ni12bW0tDQo+ID4gcmVndWxhdG9yLnlhbWwq
X187SXchIUNUUk5LQTl3TWcwQVJidyFsQnF0elo4RG1DNmYya05uTFhSQ3BIc29mN1hPWQ0KPiA+
IHZySU1HNG9fRFh1dmpZYmcxU3lGUnJYcnRFTUxqSXhTMzFjcTgyaHFRck9nVUFUakEkwqAiDQo+
ID4gKyRzY2hlbWE6DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnch
bEJxdHpaOERtQzZmMmtObkxYUkNwSHNvZjdYT1l2cklNRzRvX0RYdXZqWWJnMVN5RlJyWHJ0RU1M
akl4UzMxY3E4MmhxUXI0VWl0Z0xnJA0KPiA+ICsNCj4gPiArdGl0bGU6IE1lZGlhVGVrIE1UODE5
NiBWTU0gKFZjb3JlIGZvciBNdWx0aU1lZGlhKSBSZWd1bGF0b3INCj4gPiBDb250cm9sbGVyDQo+
ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArwqAgLSBOYW5jeSBMaW4gPG5hbmN5LmxpbkBt
ZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICvCoCBUaGUgTWVk
aWFUZWsgTVQ4MTk2IFZNTSAoVmNvcmUgZm9yIE11bHRpIE1lZGlhKSBjb250cm9sbGVyIGFjdHMN
Cj4gPiBhcyB0aGUNCj4gPiArwqAgbWFpbiBwb3dlciBzdXBwbGllciBmb3IgbXVsdGltZWRpYSBw
b3dlciBkb21haW5zLCBzdWNoIGFzIHRob3NlDQo+ID4gdXNlZCBieQ0KPiA+ICvCoCBkaXNwbGF5
LCB2aWRlbyBlbmNvZGUgYW5kIGRlY29kZSBzdWJzeXN0ZW1zLiBUaGUgVk1NIGhhcmR3YXJlDQo+
ID4gYmxvY2sNCj4gPiArwqAgcHJvdmlkZXMgdmlydHVhbCByZWd1bGF0b3JzIHRoYXQgc2VydmUg
YXMgdGhlIHBvd2VyIHNvdXJjZXMNCj4gPiAoc3VwcGxpZXJzKQ0KPiA+ICvCoCBmb3IgdmFyaW91
cyBtdWx0aW1lZGlhIElQcy4gSXQgY29vcmRpbmF0ZXMgd2l0aCB0aGUgTWVkaWFUZWsNCj4gPiBo
YXJkd2FyZQ0KPiA+ICvCoCBjb21tb24gY2xvY2sgZnJhbWV3b3JrIChIV0NDRikgYW5kIHRoZSBW
aWRlbyBDb21wYW5pb24gUHJvY2Vzc29yDQo+ID4gKFZDUCkNCj4gPiArwqAgdG8gbWFuYWdlIHRo
ZSBwb3dlciBkb21haW5zIG9mIHRoZXNlIG11bHRpbWVkaWEgY29tcG9uZW50cy4NCj4gPiArDQo+
ID4gK8KgIEVhY2ggY2hpbGQgbm9kZSB1bmRlciB0aGUgVk1NIG5vZGUgcmVwcmVzZW50cyBhIHZp
cnR1YWwNCj4gPiByZWd1bGF0b3INCj4gPiArwqAgKGUuZy4sIHZkaXNwLCB2ZGVjLXZjb3JlKSBh
bmQgbXVzdCBzcGVjaWZ5IGEgJ3JlZ3VsYXRvci1uYW1lJy4NCj4gPiArDQo+ID4gK3Byb3BlcnRp
ZXM6DQo+ID4gK8KgIGNvbXBhdGlibGU6DQo+ID4gK8KgwqDCoCBjb25zdDogIm1lZGlhdGVrLG10
ODE5Ni12bW0iDQo+IA0KPiBOb3QgdGVzdGVkLi4uDQo+IA0KTXkgYmFkLCBJIGFjY2lkZW50YWxs
eSBhZGRlZCBleHRyYSBxdW90YXRpb24gbWFya3MsIGJ1dCBJIHJhbg0KZHRfYmluZGluZ19jaGVj
ayBhbmQgZGlkbid0IHNlZSB0aGlzIGVycm9yIGJlaW5nICAgICAgICAgICAgICAgICAgICAgIA0K
ZGV0ZWN0ZWQuDQoNCj4gPiArDQo+ID4gK8KgIG1lZGlhdGVrLGh3LWNjZjoNCj4gPiArwqDCoMKg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4gPiArwqDC
oMKgIGRlc2NyaXB0aW9uOiBQaGFuZGxlIHRvIHRoZSBoYXJkd2FyZSBjb21tb24gY2xvY2sgZnJh
bWV3b3JrDQo+ID4gc3lzY29uIGNvbnRyb2xsZXIuDQo+IA0KPiBObywgeW91IGNhbm5vdCBleHBy
ZXNzIGNsb2NrcyB3aXRoIHN5c2Nvbi4NCj4gDQpIV0NDRiBpcyBNZWRpYVRlaydzIGludGVybmFs
IG5hbWluZzsgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGhhcmR3YXJlDQpJUCBpcyB2b3Rlci4g
V2UgdXNlIHRoZSBJUCB0byB2b3RlIGZvciBidWNrIG9uL29mZiwgYW5kIHRoZSBWQ1Agd2lsbA0K
Z2V0IHRoZSB2b3RpbmcgcmVzdWx0IHRvIHBlcmZvcm0gYnVjayBvbi9vZmYuIEkgd2lsbCByZWZp
bmUgdGhlDQpuYW1pbmcvZGVzY3JpcHRpb24gdG8gInZvdGVyLiINCg0KPiA+ICsNCj4gPiArwqAg
bWVkaWF0ZWssdmNwOg0KPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246IFBoYW5kbGUgdG8gdGhl
IFZpZGVvIENvLVByb2Nlc3NvciAoVkNQKSBub2RlLg0KPiANCj4gRm9yIHdoYXQgcHVycG9zZT8N
Cj4gDQpUaGlzIGlzIHVzZWQgdG8gZW5zdXJlIHRoYXQgdGhlIFZDUCB1UCBpcyByZWFkeSB0byBy
ZWNlaXZlIHRoZSBod2NjZg0KSVJRIGFuZCBoYW5kbGUgdGhlIGNvcnJlc3BvbmRpbmcgYnVjayBv
bi9vZmYgb3BlcmF0aW9ucy4NCg0KPiA+ICsNCj4gPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ID4g
K8KgICJeKHZkaXNwfHZkZWMtdmNvcmUpJCI6DQo+IA0KPiBSZWR1bmRhbnQgbm9kZXMsIHVzZWxl
c3MuIERyb3AgdGhlc2UgY29tcGxldGVseS4NCj4gDQpPSy4NCj4gDQo+ID4gK8KgwqDCoCB0eXBl
OiBvYmplY3QNCj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOiB8DQo+ID4gK8KgwqDCoMKgwqAgVmly
dHVhbCByZWd1bGF0b3IgZm9yIGEgc3BlY2lmaWMgbXVsdGltZWRpYSBkb21haW4uDQo+ID4gK8Kg
wqDCoMKgwqAgVGhlIG5vZGUgbmFtZSBzaG91bGQgbWF0Y2ggdGhlIHN1cHBvcnRlZCByZWd1bGF0
b3IgKGUuZy4sDQo+ID4gdmRpc3AsIHZkZWMtdmNvcmUpLg0KPiA+ICvCoMKgwqAgcHJvcGVydGll
czoNCj4gPiArwqDCoMKgwqDCoCByZWd1bGF0b3ItbmFtZToNCj4gDQo+IE5vLCB5b3UgY2Fubm90
IHN0YXJ0IHJlZGVmaW5pbmcgcHJvcGVydGllcy4gVGhpcyBiaW5kaW5nIGlzIG5vd2hlcmUNCj4g
Y2xvc2UgdG8gaGFyZHdhcmUgZGVzY3JpcHRpb24uIExvb2tzIGxpa2Ugc29tZSBjb3B5LXBhc3Rl
IGRvd25zdHJlYW0NCj4gZHJpdmVyLCBzbyBiaW5kaW5nIHRvIGZ1bGZpbGwgZHJpdmVyIG5lZWRz
Lg0KPiANCj4gUGxlYXNlIHJld29yayB0byBtYXRjaCBoYXJkd2FyZS4gSSBzdWdnZXN0IHJlYWNo
aW5nIGludGVybmFsbHkgdG8gZ2V0DQo+IHNvbWUgaGVscCBob3cgdXBzdHJlYW0gZHJpdmVycyBh
bmQgYmluZGluZ3MgbG9vayBsaWtlICpwcmlvciogc2VuZGluZw0KPiBkb3duc3RyZWFtIGNvZGUu
DQo+IA0KSSB3aWxsIHJldmlldyBhbmQgcmVmaW5lIHRoZSBiaW5kaW5nIGludGVybmFsbHkgYmVm
b3JlIHN1Ym1pdHRpbmcgaXQuDQpUaGFua3MhDQoNCkJlc3QgcmVnYXJkcywNCk5hbmN5DQoNCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
