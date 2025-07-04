Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA827D776;
	Fri,  4 Jul 2025 07:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613899; cv=fail; b=mm/b3hGmyjH5JyvfRhKjleDMUKiE2j3vNnOlTQEDH06q6kLaDnkx92vMCAFoCLEet+Mv4Yz/2aMd66k40a9SWqDgTZVcp38Ns/TeLalIGfBkO2Ivg2LEjU3XAtQbtEDnThJz7NFGkhUtiVjtv2hOwuhdKG5iUDRRjRdY0ik9HYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613899; c=relaxed/simple;
	bh=ZpusEz1wp+caaoNRcF0dlyqZLginwXIxMBlz6xiQ3cs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AEtsIKg+yId7b7XZhwpVlAFjrE7rVDVWXwBTjy11m1TfcScGA7g+ye5ZfDj4jxnv5gU3lYEERVq+JN532rh5p/VbZEusUdwBe0o1uq0ryxcp6U3DE1bJdEolIkn8qTciRG8Y/qEH/oqbe4L9NSaCyCZJB5QlIyuYJwP75GbjO1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g/JZMlBP; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Gb2ChmdQ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g/JZMlBP";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Gb2ChmdQ"
X-UUID: f567eab658a711f0b33aeb1e7f16c2b6-20250704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZpusEz1wp+caaoNRcF0dlyqZLginwXIxMBlz6xiQ3cs=;
	b=g/JZMlBPa8ojCPAw6LJlcDGPLJj29tiAcwUAmK/0NCI3bKVr9KYp55VEJyDrDsxWV51BxOOVxSObHcvuLm4qTHwLk9gWH+3PTxIrOqHZDpZcrgEWd7CuIdth7EV/kwVyFDI8R3Ncb6GsZ0nSrxD6lyfAws2LWkAjYm4G2NdwoPg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:4de9aa89-fc36-4243-8912-ceec8a919bf5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:ffdbf15f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f567eab658a711f0b33aeb1e7f16c2b6-20250704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1000116920; Fri, 04 Jul 2025 15:24:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 4 Jul 2025 15:24:42 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 4 Jul 2025 15:24:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVPw+lafKtY/COp0yDeji43cUR5522cfBlwh8VsMpqjbwsyu4k44pldk+K5CTBpAZ1cQML5rmWMbxek5cu4of+8vPV2OD6liDG1zj/xPeIGzSuy1WTNp3xfVVs13LhQDoNyZ6YrDVbFsBccrA4+qVWMaWiwe6maIj/POXfoN58jy8j9+PolzCSAFozIS0Wn5QGlOqvXEYAnWjZw942shYAW48Xkmy/+Mm+UuoDAcE+7ASox1A1qrvhn+jLzew8j/F/EOJJ9Zse4V+arw3TdgB6dlpA1kqrSMx6Z30Kvb35exsu9Qy0Uf/MN3+NnP1KEJIkFPzSZzd+tiZnVZwjuC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpusEz1wp+caaoNRcF0dlyqZLginwXIxMBlz6xiQ3cs=;
 b=VOxgzf3tDSl/Xd2kHNxeOSuebWuEU0/besa0u1We076NpoWmX8//bteH+PI8Xyi7dHtbGTdWiBWQ9YQmT0/xbtzEUzS6QBJlXY4A3LqIMjU8OOiyXMD9NHgnMJGuhgXctYb1oINfxEtI/0fZajYUAJJ8uiR5EB/JD/C9WPw2rX+S4zyJZfK+5Ef7JWj+EKQsKzklsLSbl3Pi4rDhcSRxrc5JPH71lDOYAjjEOkSyisL8i8NSIiqTzhYMzleN9BmwMmARR3j14w1OPKPzgTE2JlV7kHVquvEQrGjELLDtZkMD5khXhZzZQFHF8vgnIJaRDI7GMK8NoROh4znM6pA28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpusEz1wp+caaoNRcF0dlyqZLginwXIxMBlz6xiQ3cs=;
 b=Gb2ChmdQVZBiLLFwb2q6KtBqZ/1wth6V44xd1XiTQaT7XC/tgY7P4TAPDiEa656TIzHbMIRltTPcZLede1lqjZr3+eW7jO6hgpQVrymTWCALzShyDQuJ/26L6NSX71VhEMpvcUr7kayz6h3MS5/8himlQXEe+/QP69KA0YPqPbQ=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 PUZPR03MB7115.apcprd03.prod.outlook.com (2603:1096:301:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 07:24:40 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 07:24:40 +0000
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
Subject: Re: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Thread-Topic: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Thread-Index: AQHbxXy+BRbfIFMvp0SAKScjiNH8JbQIyZsAgBkU0oA=
Date: Fri, 4 Jul 2025 07:24:40 +0000
Message-ID: <a05242578fab11f76873e39129066b58c2a0a126.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
	 <20250515093454.1729720-15-paul-pl.chen@mediatek.com>
	 <778e9796ed50d8f9aaf11b6f1fa1f19386eb71d6.camel@mediatek.com>
In-Reply-To: <778e9796ed50d8f9aaf11b6f1fa1f19386eb71d6.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|PUZPR03MB7115:EE_
x-ms-office365-filtering-correlation-id: f0c5cf13-4d3c-4b25-402e-08ddbacbd6c6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RGlPUUJ3YStMekpsd0hIZ1VtYU1WbC9xbHl0U0FucnQ2VnpTZFY5YWJvQlE3?=
 =?utf-8?B?dDlFdXFvcXUyYkx0a3ErVkN3aHlUVmNzYUNzWFMwL05udEQwUStyTnVJRmpq?=
 =?utf-8?B?OE5oVDhjcGdGZzgyNzZHWmVBMnNYeFMrQWs3SS9ETTZBcU5jZksrVGpPdU1R?=
 =?utf-8?B?Sk1xSUhieXY3b3g4WGxyTTJZNVc1eXRPdWJyNzNkeVdDRkllcktsRFlRcm8w?=
 =?utf-8?B?NG8vTm1NeTFzTHpjRnBWVmxGYmJsWHBQYzh0T252eWFJeXUrdWJrdGc0MU5M?=
 =?utf-8?B?b1p0ZkFZdlBEbHUxS2hneGR1ZUY0M29CMlJEOWc5cGdNWWNrYlhPR3hlUTln?=
 =?utf-8?B?RGQvZFJhSHB4MitlM3FzSkRkWlRuOHNvVGFIYWtPVStPZTBPcVZ0Z1pWK1pH?=
 =?utf-8?B?UjJsNmwweDBxdHEyS09xanpUV0YwTVJuL095aGoyVDlpc01oVDVoRjd6eEtX?=
 =?utf-8?B?VElBM2h6U1FnK2w0bnRjRUxxQzY4eUJmRk5ROXhYVHdidWlhVVlRM1Y0NkJp?=
 =?utf-8?B?R2ZRdDR5MW0xUmM0ZnZzeU04K243NlRXQ2ZSSWdoeEcrSHZMeWlTTllqTDl1?=
 =?utf-8?B?NmI5M1c2Z1haZzM0VEJCUmdVTi9zbWp3QUk1eVZxV2J5d1BXbzJYUmp5M3R5?=
 =?utf-8?B?aVN6YlZFNFErbDFNSVFDY3BmUkQrdlZ3b0ZHSkxUa21OeGhPSDRtbHBPc2VL?=
 =?utf-8?B?VGw0WnBhYlhMdjM1TUpLRmpZR281NEVBdnZyVVdxTXFQOXlFcnRFRlFNT2cr?=
 =?utf-8?B?THBHUHhTVnFiellvQnYxaWpETWkzai9yYlo5elRMVVh3dmJVWWFCajU3Q3FX?=
 =?utf-8?B?QndhSHIrSVNHUnc1aTVWM1NVUkZHNzVHKzBBUnBZaVEyRHBQM0ZRTG1KSzM2?=
 =?utf-8?B?dWZ0MWhTSmpIdnVCa2thUkxzcXd2YmxCVCtUajdnYkxSSHZDdkZJOGRTeE5z?=
 =?utf-8?B?eE5YNGs5OXM4SmFOWlJJMCtjRllVS2dad0NkQ1k0bVRibmJreXVrMzNBbllo?=
 =?utf-8?B?ZGxvUllWWG1pWXFGOHZLcXBDWmZXdmI5QnhzSnBvVGpVejNBWkd2RWprV2V5?=
 =?utf-8?B?R083aTdIRnZyV2x1RXdDRnptb2VLRUJGOW5NYWJLaUlZOWtVdDRWbWFNMDdL?=
 =?utf-8?B?UC9pWEZxZElDeE5BRlNnc084R055N1pNaVM5TlRWVkwzUkNpTjF0Rjd6MGRq?=
 =?utf-8?B?Y1dQekxLUUVDREpzeXc4bnlIZFN5UkxMbjFLL0I4bHhybnBzV1hhMlp6OHg3?=
 =?utf-8?B?aEV6WUdsN0k0Q0Y3dFVyT0ZiQ2hva0ZaNHRwVjBsQk1PV0NzZ0hKRWU1TDds?=
 =?utf-8?B?MFZyRjBSQ1Q1U1pPcmo1aU1uNHF0REU5LzJBWTlHN2loYzF2YndZaGs1Qml3?=
 =?utf-8?B?UlYydW9KTjB4dGNvSU9BV3lyNW91N1JaSUEyd1IxTnEvRFJrVWVkNG4xbmY5?=
 =?utf-8?B?cVRZaG9mVWdKR3ZTQllWS29JTXZKMkJyMHZlRzczVno0aFRndG9rdUIvU1Ez?=
 =?utf-8?B?OUNCWTRUTFRWT2k3Q0JrVFFERGc4TWw0aHkyYmtzZVZaQmVXcmlnMTF5MDBM?=
 =?utf-8?B?SUpkNGhmbUFOK3VENm0wL1FEZjA2YVpacjBrVEdkYkxuV2FwemNFTnFIMHVI?=
 =?utf-8?B?MEhjeGxoRCtBSDkra3JqNTdiMlk2RWpZdDRzNkJ6TXBVTHBSbkwxMXcwcFl3?=
 =?utf-8?B?ZVhiaUo3V1ptejlhNkNUNyt0OGkyQTdvMmhWYkcxR0dqT3RaMUNGbGhkL0Rx?=
 =?utf-8?B?L1Y5OWpJcnNsZWF0c0FzQ21BcS9xQVRNcWpMOHo3TUpOWStlN3lqdHdROWVh?=
 =?utf-8?B?NUl1TW5OMEVPZVZDYnFSNUNJK0FxSzBBeFBSM2x6VGYzQjNJWGhQY1JON3h0?=
 =?utf-8?B?a1k0RGtJVG5tVU9GTk95MVBxejZxZ2FUYUpJT1JlWnh6UWc5V2QreEFCN1Ev?=
 =?utf-8?B?Rlp3SkYzQXJGb3NKQ01iaEN4L0JrMzFGamRyNVJjQXVSUi90Z01sUXY0dDMx?=
 =?utf-8?B?Mjdid0xGNVl3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckU5Si9QelM0bGplN00wYlNtZ1d0MHNLWlRrTTJqZUI1SkdqSWFPWmF3OHNp?=
 =?utf-8?B?RzRDZ0VJUjlkMUFCaHhkRHp1VEwvTHBtRWF0dHcxTHI1Yk9oTWZXdjN1VWtZ?=
 =?utf-8?B?REllYmExL0dpajZQTEQrTFU3Z2xJbWNHWm5idXU4ZXZ3eGpxNU1iTERpK0JR?=
 =?utf-8?B?S0Z0TlVKL2lmWFRBRWl4K2E2SnZkZXFoMUhOZlZJYXgwS0hyZW5hc28vb2Nm?=
 =?utf-8?B?bERwd09reUpjZHhpZUd2eVBHZkNEVEhKRitVL1NZYW1ZQnY2NXNuRThkUVBR?=
 =?utf-8?B?VkRBZkhnYWRQc1hPdm1Qd3VnYWxOSzhVRC9UYy9jT2hSSEtlQjRmUmg4ek41?=
 =?utf-8?B?K2o1ZkVwNWdTdENjQXEwa0FnN0YvSytEVkdrSGwwczFEV3JYbzZsZE5kdEJ3?=
 =?utf-8?B?TjNBSjQvRTZDcmMzcGVvNTQ2bGUzZGlNbWQyNUhCS3BaUlRZUzhMTGxlays4?=
 =?utf-8?B?bVl0cThLZ05hK3lXdnhrTGV0dXB0SXhEMmgzRUdsdFIwY0oxUElCUzdOaExl?=
 =?utf-8?B?aUZnbFdqVWNhRkFsNVRhd0pTTVV4Y1VveHJuL1l6NWF2T2hzKzNZVk9EVXE3?=
 =?utf-8?B?RjRib29TeExJSWRDWDk0bzEyZmRWVitMWWozVUVtUWFHYjdBQ1RLcVNnMklr?=
 =?utf-8?B?d041Q3EvREVpUkNLTVRTd3pRSkgxSWJObjVQbTdVVmdTNURTUklKaXZ6TEht?=
 =?utf-8?B?MzVQOHpIbVJRcTY0MzErdkwxNE5EblBNcURZWGttM2xUTE5VNFZjM0xkckl5?=
 =?utf-8?B?VEdwcGNvMmtTdUFwQUlhVlE1dUdLMU1wc1RZWGcvOXNrRG10d3dHSTB0Q21a?=
 =?utf-8?B?N1J2WmVDVm96ZWx5MnpNSktoSmg2ZlhTNUgwS01aa3IvZ0dzMUk4SkFmQlZL?=
 =?utf-8?B?T1UzODRKbi84dlFXVE90cXUxWmJpUEg5Q0dtbVpqQ0g4SEwrOUJHS1RndzNz?=
 =?utf-8?B?N2pFTktlQ0N3TVZidjdFZlc2bUJXeVN6ejYxUVIvSmdPUGtwdmt3M2MrVlp0?=
 =?utf-8?B?bVlEKzhGck4vaWxzYldGb0E5Z3dxQitqVUVrMVRhVnBmelhzWlg1REFQZmpQ?=
 =?utf-8?B?NFBRV2FEaGUrTm1PY0dkU2xkZlpIWU9ZM2hpR1J0TXBPUEl0cVVwam5LWUd5?=
 =?utf-8?B?bnIzN2Rhd0xmVG1WZGhMZXgvZGttRkg1dnE0ZlRVYW83VFpkSnRTUTN6cE00?=
 =?utf-8?B?dEJKeVRDeHZ0TTJnbkdJS1hJN0JtOHlnMW1mUW5QTWsrZ3VydDRETWQ5Sk94?=
 =?utf-8?B?Uzg1VjZGK1FKejJFSlVRRzM2eExRNk9mN1I4K3E2R0g4N2Q4RlJON0Q0Z2tR?=
 =?utf-8?B?dm9SdHZQQzc5dXJFenJwTEs5ZGc4aEt5cFhHby9rbUZDYW43THZTTWRPclRv?=
 =?utf-8?B?ckYzQStzU1hRemtHOE5xYXZzRFlCZVA1SEkrRitVakR1Tk5VWWJseXpKTHJz?=
 =?utf-8?B?U3VlOGtBMlNQYnVVS2phUldJbWdDbGFyZS9rRVdhcElSM1NiOUVpL3JNU3BU?=
 =?utf-8?B?amF6a21ESzFHbFVtYnVIbWlWK2NLMkloWUpVQUpPMFAyNXlxY1NPdjM5SFNq?=
 =?utf-8?B?R0IzWDhmYUNlSkRtN0xRbFhxYlNRUUJFSkxRZVNMZkRzM3RUVlBmem94L1M3?=
 =?utf-8?B?b1BqVnpkOWNCVlBqWEJuaENiM2NseDd6ZEZHbzBSM3RvQXd2MXhBMDlHeDhj?=
 =?utf-8?B?bWE1dW1vVEpqZ0FFN2lVVnBMaGdCaEEzRDJpWmdISzdUdUlSSG1VVGloclNz?=
 =?utf-8?B?QlgvcHY5VHAxNStIQ1Y5ck9LRm9RQVVYOVhzTHA4MFNzVkxEa3FYSldnSHR1?=
 =?utf-8?B?Y3VxMkljb2toNzYvSUlIV1hjNCtTdk9GWmp5S0RHd0w0NjZuZkh2N3JTN3ky?=
 =?utf-8?B?Z0pQbHZRNFJmaHlEaFozUjFxeWpZRmJrM0VWR3JIS0FGVnBDaEVLUXk5MURL?=
 =?utf-8?B?ZW95RVNsbE1XbWdqRytJVTlGTWJQUnd4UmNJU29WRWxIaHlYZk1XbWEwTXE1?=
 =?utf-8?B?ZXRCMnphclFaVC9IMzRIZU1nQmhibDREdHo4dHFESy9wVENoeC9PVXN1Y0I3?=
 =?utf-8?B?MzFPanljYnBRVTdvUml5dFFxSlFGQVFmVC9hZmYvdklyeS9qckJkQmhtYUdO?=
 =?utf-8?B?NmlsZC9zcjN1UFRIR2lkRFlGcG03ZnFTZEwzS3FuNUhldjVnZXhldnBZR1Zp?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F5B2268BFE9874789949EB04A1515F0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c5cf13-4d3c-4b25-402e-08ddbacbd6c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 07:24:40.0460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcVYGBSS6q4y1mU5Bbmu20cbLBIYrwCo6ma2KTmqmuFMZBsMYbCjFH38chFEC9jK3esymyAJIin3STo+MVL3xCJswwbPtjCpD7rcsGExG2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7115

T24gV2VkLCAyMDI1LTA2LTE4IGF0IDA4OjIzICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVsLXBsLmNoZW4gd3Jv
dGU6DQo+ID4gRnJvbTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0K
PiA+IE9VVFBST0MgaGFuZGxlcyB0aGUgcG9zdC1zdGFnZSBvZiBwaXhlbCBwcm9jZXNzaW5nIGlu
DQo+ID4gdGhlIG92ZXJsYXBwaW5nIHByb2NlZHVyZS5PVVRQUk9DIG1hbmFnZXMgcGl4ZWxzIGZv
cg0KPiA+IGdhbW1hIGNvcnJlY3Rpb24gYW5kIGVuc3VyZXMgdGhhdCBwaXhlbCB2YWx1ZXMgYXJl
DQo+ID4gd2l0aGluIHRoZSBjb3JyZWN0IHJhbmdlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsLXBsIENoZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+IA0KPiBb
c25pcF0NCj4gDQo+ID4gK3ZvaWQgbXRrX2Rpc3Bfb3V0cHJvY19jb25maWcoc3RydWN0IGRldmlj
ZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywNCj4gPiArCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50IGgs
IHVuc2lnbmVkIGludA0KPiA+IHZyZWZyZXNoLA0KPiA+ICsJCQnCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QNCj4gPiAqY21kcV9wa3QpDQo+ID4gK3sNCj4gPiArCXN0
cnVjdCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4g
Kwl1MzIgdG1wOw0KPiA+ICsNCj4gPiArCWRldl9kYmcoZGV2LCAiJXMtdzolZCwgaDolZFxuIiwg
X19mdW5jX18sIHcsIGgpOw0KPiA+ICsNCj4gPiArCXdyaXRlbCgoaCA8PCAxNikgfCB3LCBwcml2
LT5yZWdzICsNCj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19ST0lfU0laRSk7DQo+ID4gKw0KPiA+
ICsJdG1wID0gcmVhZGwocHJpdi0+cmVncyArDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfREFU
QVBBVEhfQ09OKTsNCj4gPiArCXRtcCA9ICh0bXAgJiB+T1ZMX09VVFBST0NfREFUQVBBVEhfQ09O
X09VVFBVVF9DTEFNUCkgfA0KPiA+ICsJCcKgIChPVkxfT1VUUFJPQ19EQVRBUEFUSF9DT05fT1VU
UFVUX0NMQU1QICYNCj4gPiBPVkxfT1VUUFJPQ19EQVRBUEFUSF9DT05fT1VUUFVUX0NMQU1QKTsN
Cj4gDQo+IFRoaXMgd291bGQgc2ltcGxpZmllZCBhcw0KPiANCj4gdG1wIHw9IE9WTF9PVVRQUk9D
X0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVA7DQo+IA0KDQpPSywgSSB3aWxsIHJlZmluZSB0aGUg
Y29kZSB0byBzaW1wbGlmeSB0aGlzIHBhcnQuDQoNCj4gPiArCXdyaXRlbCh0bXAsIHByaXYtPnJl
Z3MgKw0KPiA+IERJU1BfUkVHX09WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTik7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3ZvaWQgbXRrX2Rpc3Bfb3V0cHJvY19zdGFydChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7DQo+ID4gKwl1bnNpZ25lZCBpbnQgdG1wOw0KPiA+ICsNCj4gPiArCXRtcCA9
IHJlYWRsKHByaXYtPnJlZ3MgKw0KPiA+IERJU1BfUkVHX09WTF9PVVRQUk9DX1NIQURPV19DVFJM
KTsNCj4gPiArCXRtcCA9IHRtcCB8IE9WTF9PVVRQUk9DX0JZUEFTU19TSEFET1c7DQo+IA0KPiB0
bXAgfD0gT1ZMX09VVFBST0NfQllQQVNTX1NIQURPVzsNCg0KVW5kZXJzdG9vZCwgSSB3aWxsIHJl
ZmluZSB0aGUgY29kZSB0byBzaW1wbGlmeSB0aGlzIHBhcnQuDQo+IA0KPiA+ICsJd3JpdGVsKHRt
cCwgcHJpdi0+cmVncyArDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfU0hBRE9XX0NUUkwpOw0K
PiA+ICsNCj4gPiArCXdyaXRlbCgwLCBwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0Nf
SU5UU1RBKTsNCj4gDQo+IFRvIGFsaWduIE9WTCBkcml2ZXIsIGNsZWFyIGludGVycnVwdCBzdGF0
dXMgaW4gZW5hYmxlX3ZibGFuaygpDQo+IGZ1bmN0aW9uLg0KPiANCj4gDQoNClVuZGVyc3Rvb2Qs
IEkgd2lsbCByZWZpbmUgdGhlIGNvZGUgYW5kIG1vdmUgDQoidGhlIGNsZWFyIGludGVycnVwdCBz
dGF0dXMiIHRvIGZ1bmN0aW9uIG9mIGVuYWJsZV92YmxhbmsoKS4NCj4gPiArDQo+ID4gKwl0bXAg
PSByZWFkbChwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfRU4pOw0KPiA+ICsJdG1w
ID0gKHRtcCAmIH5PVkxfT1VUUFJPQ19PVkxfRU4pIHwgKE9WTF9PVVRQUk9DX09WTF9FTiAmDQo+
ID4gT1ZMX09VVFBST0NfT1ZMX0VOKTsNCj4gDQo+IFRoaXMgd291bGQgYmUgc2ltcGxpZmllZCBh
cw0KPiANCj4gdG1wIHw9IE9WTF9PVVRQUk9DX09WTF9FTjsNCj4gDQoNClVuZGVyc3Rvb2QsIEkg
d2lsbCBzaW1wbGlmeSB0aGUgY29kZS4gDQoNCj4gT25lIHF1ZXN0aW9uLiBJbiBtdGtfZGlzcF9v
dXRwcm9jX3N0b3AoKSwgeW91IG92ZXJ3cml0ZSB0aGUgd2hvbGUNCj4gcmVnaXN0ZXIgb2bCoCBE
SVNQX1JFR19PVkxfT1VUUFJPQ19FTi4NCj4gV2h5IGhlcmUgbm90IG92ZXJ3cml0ZSB0aGUgd2hv
bGUgcmVnaXN0ZXI/DQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCkhpIENrLCBJIHdpbGwgcGVy
Zm9ybSBhbiBleHBlcmltZW50IHRvIHZlcmlmeSB0aGlzIHBhcnQuDQoNCkJlc3QsIFBhdWwgDQo+
ID4gKwl3cml0ZWwodG1wLCBwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfRU4pOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIG10a19kaXNwX291dHByb2Nfc3RvcChzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJd3JpdGVsKDAsIHByaXYtPnJlZ3Mg
KyBESVNQX1JFR19PVkxfT1VUUFJPQ19FTik7DQo+ID4gKwl3cml0ZWwoT1ZMX09VVFBST0NfUlNU
LCBwcml2LT5yZWdzICsNCj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19SU1QpOw0KPiA+ICsJd3Jp
dGVsKDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19PVkxfT1VUUFJPQ19SU1QpOw0KPiA+ICt9DQo+
ID4gKw0KPiANCg0K
