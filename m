Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5825E45A;
	Fri,  4 Jul 2025 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610998; cv=fail; b=B0PJFXWu86NkGvz2y6YueZHriDo171G/tXY9mIZqZspbeoKCqyjSDmZWZ2wQpfqUPVpRZhD4jg/+RFOhRKJWQuwvbktUAvfspr7YkhnWKaIgwyh/kcqWffORj0F6QwoRTIw8hg8bkMdPtdFm9so5Ago2r5DjDfPSyon+mpsI2vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610998; c=relaxed/simple;
	bh=dZhBJ5cybUPgROZAvUByzO/TbZkYiapqDaKcn5OT498=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bEiWQ2bB0WQwOUsgDS68XqnaVY1gcV0AYfGKTep4hyFxCAyO2XzSD7KRHvrsW0yMWL1Alkj6iev+CSu1rUEOAJKJoy04RvJJcbgFMvTuzbHBbWofRNZCW0qW3fngonquzoebs+kuW+uHgElgTPCEE8KB6k2KFS5Qj4mU7yxNHyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=X8cHGgab; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=L9Nt/2gg; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X8cHGgab";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="L9Nt/2gg"
X-UUID: 37332eee58a111f0b1510d84776b8c0b-20250704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dZhBJ5cybUPgROZAvUByzO/TbZkYiapqDaKcn5OT498=;
	b=X8cHGgabFBzHplSeFu6LLfMmbuMBTPmnsD7J1qpsCBiwk5tJOedBRxx51hxkYUZmT5QFqyZYy3VpW4/HTMxUffqs0mvTMacrLhpWs7LPJ05UqMuYLxAOOadMgYshDMielKmqYRo0nZBD3XOh6ApYVcGdCkm2xJdRJ0Qoyea4o60=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:4734aa5b-9c52-4651-97ee-7e4691360b97,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:f095b69c-b8a9-480a-b7e5-687022facff7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37332eee58a111f0b1510d84776b8c0b-20250704
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1197284801; Fri, 04 Jul 2025 14:36:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 4 Jul 2025 14:36:26 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 4 Jul 2025 14:36:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLQqsKoB4p84hpYoUiFqxQfZJui1A3zu+Y35Qh41anU9T4KHAzgKHDSZRcU3Osl45myN0fX+iyRqBSbtbPL/iS4DqO8vIkh4KdJvZDk2rKX41MsJGP+mQ/Mcv9PSEDMXvkmPZZoFeNa82Y990WHKW+KxrMzfCYkQ8Mca4AxD4iiRtRbkUgpLPpf889Lq8vh146RVOXPt//GNj47VlsYOIgctK4oPdCig1Bk1ZQIVGmo9jspfikWHVw5g3E2WQNaQ8zltmdfG5kNx/VhIbqfktsN1Se4FsZ8w7L2PaFrEnshtWoQ36mYFBcKrSTXFnDvaqRwV81b8WKHN2r/XRs8ujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZhBJ5cybUPgROZAvUByzO/TbZkYiapqDaKcn5OT498=;
 b=biVL3TO3I+8vU0HqszqdlitPk3tDQNc8tNo3bqS5Rk63c6ch1WUNdCrRL/kxwmPua4ZVW81vl1jCZN9u4XYHWtZqLJ7ZxbMarakRJDM8ZsAzdPGGusCY2d9eUM5+c07TjUATSrIUaaqXfNqMtVQ3DmK+eg2+SCj/ooOBl7CPtnETtEJEvxh4iOZ3We6EhpvHmpnlA717aa5NPn5ybnEVxRhLnMJmhU2pZVPTlIW6jzBWlqlZO5jyjbeKBfJflhnT+HDlBZYgnn7+j+9exKEKmT9t56zWF1wX3O6rzQ+ho1KUYO7u1vOg8e1UhrPp5fmTKUFNi0qKspan7jQg+FL+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZhBJ5cybUPgROZAvUByzO/TbZkYiapqDaKcn5OT498=;
 b=L9Nt/2ggvboINt3th/0chYSHR4Ubv/0L2NGSqb8Kp/IqO49coX2ul3hWcf6hIAz40xvFufYC0WqXhS3ZVCel+kVawE6leSFf24hokDd6yuzn+KTHDop8lufhi/4ZIiuSy+y8bXmTyJGxMCcDkNeTBfsu/fePfzxrPY9ItO3hqwI=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 TYZPR03MB6494.apcprd03.prod.outlook.com (2603:1096:400:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 06:36:23 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 06:36:23 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v3 13/17] drm/mediatek: add BLENDER support for MT8196
Thread-Topic: [PATCH v3 13/17] drm/mediatek: add BLENDER support for MT8196
Thread-Index: AQHbxXy/+f3qSi5O3kOEeeBk057BorQIrOOAgBkkDQA=
Date: Fri, 4 Jul 2025 06:36:23 +0000
Message-ID: <b60298b13a4b97dee0fb04d8eb416944b859f845.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
	 <20250515093454.1729720-14-paul-pl.chen@mediatek.com>
	 <6b561f320d4e614f37d065f5769759bef5f08632.camel@mediatek.com>
In-Reply-To: <6b561f320d4e614f37d065f5769759bef5f08632.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|TYZPR03MB6494:EE_
x-ms-office365-filtering-correlation-id: fd937eb6-7b0f-4f93-4729-08ddbac51851
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N3phZ3k5WGZOUVBGaERKZXRQaHNLdk5RdTZxM0Fqc3BNVWJJblcwK3I0b3FP?=
 =?utf-8?B?VDJDTzZWdWN2N2ZaWWMzVXRuV08zOTBja0hKRkMySFpzWTZSeDdGQlIwd1p4?=
 =?utf-8?B?eHZuWmhLa2k0YitjOGp1d0JhYkJlY2xjSG1JNm9hcGlNK2dRb0hGNHEzM25R?=
 =?utf-8?B?Q1F6MlNGMTNLeElpZlI0T2owVE03ZTJLLzUyT3lCck5JNTJlVFZFaTFxcmNI?=
 =?utf-8?B?Z25OaDZDSTg0YkRiNVhpamROVWJvM0FLR3dOSWRYU3c2dTJSNkFEWHZmNERs?=
 =?utf-8?B?NFVVSUU0eUVsOVVMcjdKQUNTWlVaZ1lFbWdmQkVqQ0FmTEs2ZFdXUlp3enlV?=
 =?utf-8?B?Q3QrQ1lXNnUrREJnbXc3WWg4UWVLMkVxMzdaOU1OUTRRL0JvQkd2dEFNT3ZS?=
 =?utf-8?B?cDlpemtzdnJtMTdDejJqY1dhTTJNV1lmTm05NDBSKzNvem5CMTFMSzVQTzNv?=
 =?utf-8?B?RmdkODEreFB2blREK1pxajExY2FMUFY0eTY3anVaQ2g2bVRRaXFWb1lGbktU?=
 =?utf-8?B?RDhkcENhYktOMzNTZ1FNU3E4aGFsSkVHUFVpdnhHaExlM3BGOHdEODlFY3ZM?=
 =?utf-8?B?TC9qckE2TVphMUhkSHprL0RmTnNuUW10UTRQeERrd2RmQ3cxejE1QXRHNzRH?=
 =?utf-8?B?M3VLTFphMnJjTmFpelFHZnh1ZDRKRW94ZGUzK1lHS1ZnK1RJYXc0M1dibDNQ?=
 =?utf-8?B?MWtZd0hRRXhRMUVzMTBRZ2tqbUpqN3g0eGFRZjROeThLVjZIWEtFMHhKSW5R?=
 =?utf-8?B?dGpVMVZLZlRaOW5IVDBUUFErUmlRVGVESE1VUThpVDE1OWhYLzVRWFBjNSti?=
 =?utf-8?B?czZieXFwK3J3WVorNWRyZzUvZVR4N0Ivc01RdUpHQmUvRDE4S1Q0V2ZjendC?=
 =?utf-8?B?UHgwcDlPdU5SU2prclNRK0FnMTh1bEdBS3VMZm9xQ3VVU3BCYUNKWmp6SlNq?=
 =?utf-8?B?eXBMS1NJSDQxbkpxKzJjVGo1UjVoU2ZTVk02YitEU3RJa1NteXhtMThQUWZS?=
 =?utf-8?B?Rk1HdjB4bWlWeWFZWUt0MHc3Y3UrOGw1WUR1L3RwS25nbmVpVFdZNFVIaTk4?=
 =?utf-8?B?MEpvbzIyemxHdm02bndOVThEemRWcWcweDdhR0tzM1MxT2RZNjdhQWtsSllm?=
 =?utf-8?B?VnN5cXFLNDZKZ2RncHBvOUtkNFFzWnJIUkJNbWFnQ2EwcnNsTDRBbGN4UkxJ?=
 =?utf-8?B?NXRiZndVS3piMUUwZTZQdzk5Smd4ZmJ0VlVrL0VPVnRxMTMyRTdFejZwRWFD?=
 =?utf-8?B?QUZWRUl2NmQ2ZkJtSU1EeFpkM1BSaWI2eDJaMkZ3NUwzc0ZuZVhsZktNdDZ5?=
 =?utf-8?B?OXNJQ3JYaHdjdFp3blNJR3dZa2JsRmR4YkhoWmZuc0MwOTExYXRiSi9JYzdl?=
 =?utf-8?B?MEczd2dBU2YyUjA1TGpyaXl3YUcxRTN0RGx2REF2RjJ3OWNPQzFlQjVHODFp?=
 =?utf-8?B?V0N6RzBNV3pPdXNqVGtkMHRWR2x4d2tQNGFhZXhISENQc0lPcXdqbzVrUW9E?=
 =?utf-8?B?UXdzbU1OMXVEdXUrSGI5UCs4NDJLYStiUG0yUGVPbGV5TkZYOG1BUFQ4bXVs?=
 =?utf-8?B?cWZWZFpCcDZkM2dqWEVQemlKdjRyVHY3UTBNZHh6eVJFc1Z0cUI0ZEhhSnNt?=
 =?utf-8?B?MkkzajJ5cDl1MXdTRTlOSENIY0xTNjlGc3BsSE5uN29NSGJzRE03cXczTERZ?=
 =?utf-8?B?N3oxWitmSHpWZk0wZjVVVGU0MmFETTVxWTZ3S01GZEZ5VGRZdEJJeWdhNW9R?=
 =?utf-8?B?bTRyMnZMWkE3MXZpWHg0OVRLRVhweG53bXVEa0h0OFlJVTRMeUhTV2JsS2Vz?=
 =?utf-8?B?Skg0V29SdHArVzd5Um5PYjVsM2t3ak5ma2NGWFdqWWVnNkRHaU90dWhSZ3ly?=
 =?utf-8?B?Mmw1ek1oWnU1REF5WWdHNmRvQ1lXVDZGWVNUUStYQ3lzRzhsRU1EWHB3VlFp?=
 =?utf-8?B?TFZ0Z1lmdkNMT0dpaHBCcU8yNmhpUEs0SEJTSUF2QU5QM1h4V1MzcHJDa1hF?=
 =?utf-8?B?UjFoQUNSZ213PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2hLVEs4aTB4NC8yQUc1K2pTNTBQeXAvcHdGWlNvUTdKcE04NTBpNkxyWXph?=
 =?utf-8?B?N2s1amlOYkxqcVZrV0V2NTNSZ3RFWTIwQWI1b0FudkNYRnlUQWFWczc0a2Rp?=
 =?utf-8?B?WEFpeU1qa0J1V0hQWGpWdVVLRlkzMjBFRC9RNExDRnMyTHZGTW5QVXRhbzdD?=
 =?utf-8?B?Wk12R3NwK09Yd2x3R0pHUTI5WmpEUjdta1ltcXgweFRRZURTVWFwd1FkdU56?=
 =?utf-8?B?WGdUaUc4MTlpSUlOd3VaeDVPNHdidG4xdE5LLysycjh0R0lPZGxOaEFXRUhT?=
 =?utf-8?B?WVBON1haS2tudFdNNDhEYSsvQ0F5bkNBbldZUVZCWGpKT0NhaHhqUDc4Z2Rj?=
 =?utf-8?B?YnlzeVZtV0YwUmhibVlYaGExTXQ1V1d3TGhlaE1yVUEvNWhURTRKcDNnNGxL?=
 =?utf-8?B?MDlISEJYanIyeVhyRDNZK2MxSU5EaUtUN0daWC9mSHNQUzBTeGI0a1JBWVNl?=
 =?utf-8?B?MnNsMGt4MzFydTZaRE1aV2hlYTJVandkZFlZTVp2MGxRNCtRUFRuZ1FtSzBN?=
 =?utf-8?B?MGFyeFJoamNjWUJFSDFhZHRzSHBVMTFlaG5WM090aVlSWjcyV1NCVFZxdVhO?=
 =?utf-8?B?TlFxazJDSWhuaGg2QVdGbGxqT2c1Ry8zb2ZHNXNWZzhQc3NsaFo5ZXE0Rk02?=
 =?utf-8?B?bDJORm9WTDBXZ2JRbUhVem5KU2ZJanVBVWNzOHpQYnlKVmR6WlRYdmg5S0t6?=
 =?utf-8?B?Q0c3QjgxMk95SHlmU1ErY1N4WE9BRVg1M0hwd09rM0tGVDJ5MFFaYUtMRzNO?=
 =?utf-8?B?WDEvaXZmQTlyTG1BS0R5V21wZWE5WXBVdGhVazVUOFFYdTNwYk9YYVduc3Bv?=
 =?utf-8?B?NTh6STl2SWhoM05uWFF6eHdTSjlTRXFGSTZoTlFhdnNWUDJRQW9mUHZMekRv?=
 =?utf-8?B?c1Y3YkE0dHdjclZWVWVYSER3RTMrMy9IVC8yMTZFVkxFK0xxNUltZnZWMGRU?=
 =?utf-8?B?a1lsc1UyYXJsQ1RiSVdHeGhkWEZvYzdXb2F6L0hJdlcxeVU5NTRUdElZeHRo?=
 =?utf-8?B?NlZCTU9qRkYyd1VGQ0xsdkJ5NUFFU1p0N3hCU2FZSWVHY1RneXI2ZThZSG5E?=
 =?utf-8?B?MUhnekxUYnZBN2xpUC9tamozZmNnRHBhcFZoWFdXVjhNbm12YlhCQUpJNitx?=
 =?utf-8?B?YzNhcEt5d0J3K3cxenFlcGJjK1d6SUIzaFhzQXBJbVFUQ29XWXNXM2VoQ1FD?=
 =?utf-8?B?M2I4ZG1lL1ZMZkJ4QXVFZERMVDh2bnNEQTdBSnVIN1ArZUQrQ0RaS3gyYzFm?=
 =?utf-8?B?UTBzS0RvcE5tY0NuMUo4SmRsRHh5WlBNTkpLdU9nK012c0VUMGUzWklZZ0Yz?=
 =?utf-8?B?SStoa21kWElKL2JTazJkTW5RbXhKR2hxNTFSRU9jY0hyYi9xcFNKakdoOXJU?=
 =?utf-8?B?N2JDRjZmTkdoRWMrNXdESjE5cDMzc0xqSVFoRlMrNG5ab0xHVXZ0SkRVWFBN?=
 =?utf-8?B?cWptdG9yTzREY0NkazVpeG1JSDJQbHBTVmMxRmxDWFU0UC9Zc2NnV2ppSEV2?=
 =?utf-8?B?QVR6NVBBTmp6RG9kK0NoSVNyVWJBdWF2VU1oOXhVMnFYdy9la2VVMDBJS2FL?=
 =?utf-8?B?RjBmelBNYTRnWDdGMDRMeXA0U3lNSFVQMVNQdVBFUDdwNEkrT1ZQRFREQnBW?=
 =?utf-8?B?QU03Q0JvcWZKRzFkdVhJQlBkZlg3R3RSeFNKVzlNOVlMSTc0SnpIb2xpVTRT?=
 =?utf-8?B?Y0dZelgxdjhHTFVJOVlHNG1UQ1NoMWl0Ry9vMFhIQkVWYStQT05zQnhSUTM1?=
 =?utf-8?B?VEtzZDhqcDVCeDFsaTh3TGxuMTNpaDNTTWFFOXFGZEk3SmQzL09GeEpvdDF3?=
 =?utf-8?B?ZHBETDlpRVdIdSsvcjNBR3BnWFp1RFpzYnRhaTFmcXI5Q3ZlY3N4LytJZU1k?=
 =?utf-8?B?b0Rtby8yRmFjY1ArSE00TnRPbjc2ZUI1ZmZ4Mi9CdUVLVFNqdm5JdDRuR1Nr?=
 =?utf-8?B?RVkwSFJLdktuVFVzR1o2MFdKYS9zWko2aVg4UXF3ZkJXczZjZTdvMjNnVlFr?=
 =?utf-8?B?RzQzRjc2RldpOFF5T3FXTXlwVWxsSDREMmJWZHNFUGVlVHl4TmVhZlBpait1?=
 =?utf-8?B?M1NLY25pWWVGMitNeXVJQjFKR1pSSnUxSVF5MDZSOFV1eXpWVS9SK0g2d0Fy?=
 =?utf-8?B?b2xKL0pXVWhDYUhRL3h2QkF3NURlSGpjYjQ1TGwvaU5MNERadlJWb1ROc2lv?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <910AF405CF59E941AA41A2DABA4BE513@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd937eb6-7b0f-4f93-4729-08ddbac51851
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 06:36:23.5254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVwyRx8B6SfscMHMIWkwQcvHW5O4VYS7wLGwEqVvWzQygUTwsd2Pu9WAmZxXoeSgMglMUlBvkPCrEbc0aXgXgAlvs2RWAh1wdehrsQFDlEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6494

T24gV2VkLCAyMDI1LTA2LTE4IGF0IDA2OjQwICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVsLXBsLmNoZW4gd3Jv
dGU6DQo+ID4gRnJvbTogUGF1bC1wbCBDaGVuIDxwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tPg0K
PiA+IA0KPiA+IEJMRU5ERVIgZXhlY3V0ZXMgdGhlIGFscGhhIGJsZW5kaW5nIGZ1bmN0aW9uIGZv
ciBvdmVybGFwcGluZw0KPiA+IGxheWVycyBmcm9tIGRpZmZlcmVudCBzb3VyY2VzLCB3aGljaCBp
cyB0aGUgcHJpbWFyeSBmdW5jdGlvbg0KPiA+IG9mIHRoZSBvdmVybGFwcGluZyBzeXN0ZW0uDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYmxlbmRlci5jDQo+ID4gQEAgLTAsMCArMSwyNjQgQEANCj4g
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsvKg0KPiA+
ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgTWVkaWFUZWsgSW5jLg0KPiA+ICsgKi8NCj4gPiArDQo+
ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9i
bGVuZC5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvY2xrLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2Uu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gPiArI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUg
Im10a19jcnRjLmgiDQo+ID4gKyNpbmNsdWRlICJtdGtfZGRwX2NvbXAuaCINCj4gPiArI2luY2x1
ZGUgIm10a19kaXNwX2Rydi5oIg0KPiA+ICsjaW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4gDQo+
IGFscGhhYmV0aWMgb3JkZXIuDQo+IA0KU3VyZSwgSSB3aWxsIHJlbW92ZSB0aGUgdW51c2VkICBj
bWRxX3BrdCBhbmQgcmVmYWN0b3IgZnVuY3Rpb246DQptdGtfZGlzcF9leGRtYV9zdGFydCgpDQo+
ID4gKyNpbmNsdWRlICJtdGtfZGlzcF9ibGVuZGVyLmgiDQo+ID4gKyNpbmNsdWRlICJtdGtfZGlz
cF9vdmwuaCINCj4gPiArDQo+ID4gDQo+IA0KPiBbc25pcF0NCj4gDQo+ID4gKw0KPiA+ICt2b2lk
IG10a19kaXNwX2JsZW5kZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50
IHcsDQo+ID4gKwkJCcKgwqDCoMKgIHVuc2lnbmVkIGludCBoLCB1bnNpZ25lZCBpbnQNCj4gPiB2
cmVmcmVzaCwNCj4gPiArCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50IGJwYywgYm9vbCBtb3N0X3Rv
cCwNCj4gDQo+IHZyZWZyZXNoIGFuZCBicGMgaXMgdXNlbGVzcywgc28gZHJvcCB0aGVtLg0KPiAN
Cg0KVW5kZXJzdG9vZCwgSSB3aWxsIHJlbW92ZSB0aGlzIHVubmVjZXNzYXJ5IHBhcmFtZXRlci4N
Cg0KPiA+ICsJCQnCoMKgwqDCoCBib29sIG1vc3RfYm90dG9tLCBzdHJ1Y3QgY21kcV9wa3QNCj4g
PiAqY21kcV9wa3QpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlzcF9ibGVuZGVyICpwcml2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKwl1MzIgZGF0YXBhdGg7DQo+ID4gKw0KPiA+
ICsJZGV2X2RiZyhkZXYsICIlcy13OiVkLCBoOiVkXG4iLCBfX2Z1bmNfXywgdywgaCk7DQo+ID4g
KwltdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgJnByaXYtPmNtZHFfcmVnLA0K
PiA+IHByaXYtPnJlZ3MsDQo+ID4gKwkJwqDCoMKgwqDCoCBESVNQX1JFR19PVkxfQkxEX1JPSV9T
SVpFKTsNCj4gPiArCW10a19kZHBfd3JpdGUoY21kcV9wa3QsIERJU1BfUkVHX09WTF9CTERfQkdD
TFJfQkFMQ0ssDQo+ID4gJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLA0KPiA+ICsJCcKgwqDC
oMKgwqAgRElTUF9SRUdfT1ZMX0JMRF9CR0NMUl9DTFIpOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4g
KwkgKiBUaGUgaW5wdXQgc291cmNlIG9mIGJsZW5kZXIgbGF5ZXIgY2FuIGJlIEVYRE1BIGxheWVy
DQo+ID4gb3V0cHV0IG9yDQo+ID4gKwkgKiB0aGUgYmxlbmRlciBjb25zdGFudCBsYXllciBpdHNl
bGYuDQo+ID4gKwkgKiBUaGlzIGNvbG9yIHNldHRpbmcgaXMgY29uZmlndXJlZCBmb3IgdGhlIGJs
ZW5kZXINCj4gPiBjb25zdGFudCBsYXllci4NCj4gPiArCSAqLw0KPiA+ICsJbXRrX2RkcF93cml0
ZShjbWRxX3BrdCwgRElTUF9SRUdfT1ZMX0JMRF9CR0NMUl9CQUxDSywNCj4gPiAmcHJpdi0+Y21k
cV9yZWcsIHByaXYtPnJlZ3MsDQo+ID4gKwkJwqDCoMKgwqDCoCBESVNQX1JFR19PVkxfQkxEX0ww
X0NMUik7DQo+ID4gKw0KPiA+ICsJaWYgKG1vc3RfdG9wKQ0KPiA+ICsJCWRhdGFwYXRoID0gT1ZM
X0JMRF9CR0NMUl9PVVRfVE9fUFJPQzsNCj4gPiArCWVsc2UNCj4gPiArCQlkYXRhcGF0aCA9IE9W
TF9CTERfQkdDTFJfT1VUX1RPX05FWFRfTEFZRVI7DQo+ID4gKwkvKg0KPiA+ICsJICogVGhlIHBy
aW1hcnkgaW5wdXQgaXMgZnJvbSBFWERNQSBhbmQgdGhlIHNlY29uZCBpbnB1dA0KPiA+ICsJICog
aXMgb3B0aW9uYWxseSBmcm9tIGFub3RoZXIgYmxlbmRlcg0KPiA+ICsJICovDQo+ID4gKwlpZiAo
IW1vc3RfYm90dG9tKQ0KPiA+ICsJCWRhdGFwYXRoIHw9IE9WTF9CTERfQkdDTFJfSU5fU0VMOw0K
PiA+ICsNCj4gPiArCW10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgZGF0YXBhdGgsDQo+ID4g
KwkJCcKgwqAgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLA0KPiA+IERJU1BfUkVHX09WTF9C
TERfREFUQVBBVEhfQ09OLA0KPiA+ICsJCQnCoMKgIE9WTF9CTERfQkdDTFJfT1VUX1RPX1BST0Mg
fA0KPiA+IE9WTF9CTERfQkdDTFJfT1VUX1RPX05FWFRfTEFZRVIgfA0KPiA+ICsJCQnCoMKgIE9W
TF9CTERfQkdDTFJfSU5fU0VMKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArdm9pZCBtdGtfZGlzcF9i
bGVuZGVyX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGNtZHFfcGt0DQo+ID4gKmNt
ZHFfcGt0KQ0KPiANCj4gRHJvcCBjbWRxX3BrdC4NCg0KT0ssIEkgd2lsbCBkcm9wIHRoZSBjbWRf
cGt0IHRvIHJlZmFjdG9yDQpmdW5jdGlvbjptdGtfZGlzcF9ibGVuZGVyX3N0YXJ0KCkNCj4gDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlzcF9ibGVuZGVyICpwcml2ID0gZGV2X2dldF9kcnZk
YXRhKGRldik7DQo+ID4gKw0KPiA+ICsJbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBPVkxf
QkxEX0JZUEFTU19TSEFET1csICZwcml2LQ0KPiA+ID5jbWRxX3JlZywgcHJpdi0+cmVncywNCj4g
PiArCQkJwqDCoCBESVNQX1JFR19PVkxfQkxEX1NIQURPV19DVFJMLA0KPiA+IE9WTF9CTERfQllQ
QVNTX1NIQURPVyk7DQo+ID4gKwltdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIE9WTF9CTERf
RU4sICZwcml2LT5jbWRxX3JlZywNCj4gPiBwcml2LT5yZWdzLA0KPiA+ICsJCQnCoMKgIERJU1Bf
UkVHX09WTF9CTERfRU4sIE9WTF9CTERfRU4pOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIG10
a19kaXNwX2JsZW5kZXJfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjbWRxX3BrdA0K
PiA+ICpjbWRxX3BrdCkNCj4gDQo+IERyb3AgY21kcV9wa3QuDQo+IA0KPiBSZWdhcmRzLA0KPiBD
Sw0KPiANCk9LLCBJIHdpbGwgZHJvcCB0aGUgY21kX3BrdCB0byByZWZhY3RvciwNCmZ1bmN0aW9u
Om10a19kaXNwX2JsZW5kZXJfc3RvcCgpLg0KDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlz
cF9ibGVuZGVyICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJbXRr
X2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCAwLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtDQo+ID4g
PnJlZ3MsDQo+ID4gKwkJCcKgwqAgRElTUF9SRUdfT1ZMX0JMRF9FTiwgT1ZMX0JMRF9FTik7DQo+
ID4gKw0KPiA+ICsJbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBPVkxfQkxEX1JTVCwgJnBy
aXYtPmNtZHFfcmVnLA0KPiA+IHByaXYtPnJlZ3MsDQo+ID4gKwkJCcKgwqAgRElTUF9SRUdfT1ZM
X0JMRF9SU1QsIE9WTF9CTERfUlNUKTsNCj4gPiArCW10a19kZHBfd3JpdGVfbWFzayhjbWRxX3Br
dCwgMCwgJnByaXYtPmNtZHFfcmVnLCBwcml2LQ0KPiA+ID5yZWdzLA0KPiA+ICsJCQnCoMKgIERJ
U1BfUkVHX09WTF9CTERfUlNULCBPVkxfQkxEX1JTVCk7DQo+ID4gK30NCj4gPiArDQo+IA0KDQo=
