Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733E185B4C;
	Sat,  8 Feb 2025 04:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988655; cv=fail; b=ibG2wyB8+ac4Zv9vXytIOjqJ6nyAKGTMvuzGwezr9BVE7bjsw2Rm5cWh0vDODtPJDQwTXF89rWez3hPUKzUsyZmyqPIyV/xMmEnNf9bcFciF7+hAZMvpnCPjCsM3MxX2o3qQzc3A5Tf9h2KWcH1EWx+qCOZ1oJwlF+Ph2NQ+W3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988655; c=relaxed/simple;
	bh=Oyyjd1c903mfrpmtG7SNq3c6T/V4lKObCTMInisgBdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LfAJdaAx8tLVtI12x0ntzggNtcVhFkvO7I8qQq/SNPBdcUc04XbpeVk3SymK13I7qX1a+vXazHFIs9g6ONdp14FCacm8UBDYJUpRs7mv+jvltXtc1ZFnj7xSEOEwcwUAiSRziojoX5zYN955ieh3PoJRitEsyazUlDLNZNnZeFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=maAQpfk1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=emSDvZS1; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="maAQpfk1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="emSDvZS1"
X-UUID: 88ff540ee5d411efbd192953cf12861f-20250208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Oyyjd1c903mfrpmtG7SNq3c6T/V4lKObCTMInisgBdw=;
	b=maAQpfk1GKuI2b33vNN932ZscFJ2TI7FygOwo86PHChisvc1sPMfNj86GviTTOcydE8Ax6Io3+S3SWBItTBVD8EGoAGK+D3m5MxQ6o41Sm2GRZzZKb2mjhDdFJL6HxUTTL4mnmbkwYHObAHmIHhGPTs7gyLvsmjBxIk83dNhLW4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d2e40b62-a605-46e8-aea1-155c17961bcf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:4e53417f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 88ff540ee5d411efbd192953cf12861f-20250208
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747776303; Sat, 08 Feb 2025 12:24:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Feb 2025 12:24:05 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Feb 2025 12:24:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lo3avHhTcls7GWT4AFVl5Jg30Y4wtUPlG3HN2YG8qzIZvisSMB9Q6PECIHAMZFdK9/WFNH0QJOzcIIqzyj8OKYci3rEqi/DeeS3UCqvYnRv/R9XYEWyNGggo2jVtX4ctyfsIHPFij7nY9GMIyjEd6/h33sdotVBeP7/VtKHHU+D1zct96P93unD2xK3BN6myh887KXdrCITcPiKYMXLH2O9U30GN63bWz9e2Jmre6xmNT20QVrlSNmmrtXKC3NWWiboXRicQ8BCtPIPydEmCvb8BwihgGTGnwt3PdsxrwQDuN0CRtoFjrIfxztyFoLCQMVo0DDeAOCTiVjuh//BwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oyyjd1c903mfrpmtG7SNq3c6T/V4lKObCTMInisgBdw=;
 b=LrgDspGsa2lvxFacFW3xWRcCrz2R92ahacR3kYfadm9AGwj5rf/G/p+JA7uaUcCWQQyQbtTyTyNbi71NDTUKVjdznL/EXf/hq0aQXUtyJd528fqX5vPy8dqJ9DA/DdcwfZC97KW5MY+Pc0baNPl51cN5XfZBnWZiFgs1SrOKDXF0D3nkAF/C4Xg8kQmsT1djuuF2FcuGmjTKsvPfijXRgJI3+VV9aFSxquSICFmktyyuoRI2B827v1WiAAMu0hqC/UPfEiRsExtcnbrjvfKuuk+RwmNT1wTMCHS9uwQ2ngICX4jf1EUBRijaST4xe5rrxEHCQaKz9TEsJR9Gu+LaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oyyjd1c903mfrpmtG7SNq3c6T/V4lKObCTMInisgBdw=;
 b=emSDvZS1XcOFyDFoVnNE6+VNljiBDYpUeNcvqMhSBawBZfShdKchRnPLulN0dNMfSUyr3GxTVwOS6a8d9B9J2XHxJ/2+x7f7xxshGeBZs4SByYUE8L/ptjfbI3Mc8tRUJBz+08KVaUT8J5GYeKkMfVAJPiTxd7Hdw4mkewjyhHc=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 SEYPR03MB6816.apcprd03.prod.outlook.com (2603:1096:101:8d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.15; Sat, 8 Feb 2025 04:24:02 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 04:24:02 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Topic: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLiZ+QAgFrBwwA=
Date: Sat, 8 Feb 2025 04:24:02 +0000
Message-ID: <8b70bf99c13c6da1551c415fd821a7f358e02afe.camel@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
	 <20241212090029.13692-3-crystal.guo@mediatek.com>
	 <173399922996.1678560.9494303027075425033.robh@kernel.org>
In-Reply-To: <173399922996.1678560.9494303027075425033.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|SEYPR03MB6816:EE_
x-ms-office365-filtering-correlation-id: cc946c0a-039a-40f7-8ef5-08dd47f86afa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V2U2bEZCemh6ejNTcVpVQXBzMFhSVVVrNnE5b2xrSkJLNjl3U05pWFVOZ0J6?=
 =?utf-8?B?ZnNNL0NrME5xSlFKTjk1SzhIK01ESTJCZFNBOEZldVNmM2lYNkNLQnlJNE45?=
 =?utf-8?B?T216MVNWVE5PQjc3bkxPdlhScnhYcEVKYitudkpBZHNYT0JTL3pIZlk0NU8x?=
 =?utf-8?B?K0Q3TnhSSlZuMDIrMGVJT0lTemZNWUNrL21JMzM4MzNTbmlaMzJKRERZenRy?=
 =?utf-8?B?ejlIdW8yR0NhK2xzZlFHU2YxMzBidmQyTXVyZ2FPNVZ3OHROVE96anhSc3FT?=
 =?utf-8?B?T2w4NTNSdWtBVHVMOEtPUFhJSVVHY293c1loRU1aYldLbGUyTzMrc00zOC9j?=
 =?utf-8?B?YWdZK1pEb2NGZVdMcE1kdFR3aThBWkNnSCtNWFVqcXZaUUxicERTdGt0QlBa?=
 =?utf-8?B?N0wrdXFWOGRGZlRROWhDTHhIMEVxOWJyQ3grWWo3RmRUVGt5RjAzMmY2d0N4?=
 =?utf-8?B?dnM0TUtnMHBJOUM4S0IwOWY2bVdNT3c0Z3grTGk3VlV0aDVpeksxbXZYL0ZH?=
 =?utf-8?B?MGhtZXJUQ001MldUY1RBVnUways0b2hHckFYcEVDYlVFWUczRlVYTTU5MEFT?=
 =?utf-8?B?Z3RPYWRxdllQUWhLTUlQRlYrbnpMdHJlOEtjUnoyL1BDL1g1S2tUbThWSGZo?=
 =?utf-8?B?UFZjSVBtSnZSNzFTMStTQ05JK2hEUEdBUE1ac2dYMlZZUU5wZk1reUV2c0pl?=
 =?utf-8?B?MW9PSnl4MDl1clZNdGhRS3l6NGpqekVhdDZPaGlMSmY3aEdtQ09RUUl4Z01Z?=
 =?utf-8?B?bjJwTkwzMWxET3dZRHorV1Q1VjdTc2IrRFZpV0s0SHhpVmlxNVY2dTFzR0du?=
 =?utf-8?B?a2E3RVJBYnJublpFRnhNeDJzUE4rOUE2c2dmOXh2YThhbWxGUDBoNi9ycXpV?=
 =?utf-8?B?ZXp6RlE4eEV2bXYrbEhnVC9yY3cwR0lDTExLWGZKUlZiMkpTZmhwMzJhVUtu?=
 =?utf-8?B?L1JSQTdHdDVadDd2L3BSajlXbDdIN3Y0OG5uT0ZiOENvZTFhS3Q3TytocTIy?=
 =?utf-8?B?bENtR2tXLzh6U05sVFhKVGdsT1djMlpXTktnZGdTdEN2TkUzQjVRNTY0LzBR?=
 =?utf-8?B?ZllrWmNpanpCcjQvcitxdWhtRjV4Q2JjR0pBNmQ5dmh5alNZL0c3MzdINGtB?=
 =?utf-8?B?YmJ2UnJzSHVmbGFJdEcxM3lFWXBvZEhFSWhoRlVrZExwRTdjaWFKNUJTUm1k?=
 =?utf-8?B?bVJrSnhUUGxrTWVPbGRZQUcydkpLMzdwRnpEYk1DQWh0aVRtRTJRSWRHeGFw?=
 =?utf-8?B?UENMMzMvQUtITDZpVEdxbkpidGhINkF2Tm0zdzljSjhuS200SVJrMG9IbU5r?=
 =?utf-8?B?a1dJYXdqR2sxeEt1Q0ZFUGZQaEJ5UU1jNi9lNmhiRElFM01WZ0NkYkhPd2hG?=
 =?utf-8?B?ZHpOUGhkM1NHQ1JibVpqSTVxcjJieHhuK2Y5eWdIU3cvT2xONGVETFNzdnVM?=
 =?utf-8?B?djY0N1dGZnZsSmJKQjQ1Y2Jva1FleUIxOCtvamYzM2FzNEFCS3hJcWl1MTJB?=
 =?utf-8?B?Zmxua1lIUE5paHk2d1FxS3NLZTUrRkhpRFhNOFFwcVlsZkM1N1RLQ0x4Q0xw?=
 =?utf-8?B?UzJpVVpnT01tQXVtUStZSGs0Z3dZOUw0S2dsWmZaOEQ3NzRETmxXNlpuN0ZT?=
 =?utf-8?B?SExlM3pvQ1JENXZOdk9sUW9Jd3h2L2QvRnpnNXZ0Rmd3Z2hVdGVqeDVmWlN6?=
 =?utf-8?B?Z0txM3k0NU4yRGptQjg5QktjQmRidVNGYS9kckhXaHI4c3JDbXFFQnI2VmV0?=
 =?utf-8?B?UGN2V3l4anlZMTA0akpwUklQSEg4NkREWm5Wdm9RS05meHFUdHdkaDJWdk5q?=
 =?utf-8?B?V21jTmtYTnV4dFdtQ1JzaFNpbGxEMy96bncrK2pJKy9vQnpYMllDa29EMjZE?=
 =?utf-8?B?WWl0RHNtbmc5czl2SnNNc0VWdHo4Qm8wdHUxWHNYcTJXZ1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2ZIRG80cmtzUzVkTlZ3TXJzUTJpUzh3ZzcwOUtWOTRYeS83SVAzbTR6WlZZ?=
 =?utf-8?B?ZGI3ZUdpbG14S0JPb0V0S1dSeXRneHphSm9pRlFlR1I1a2xQd1lhTEFTL0Ux?=
 =?utf-8?B?UlhlVGpSZzRsSTlRSEpaTmJ1R1FyT1ovS3FSOElKK3BBRS9keDJOQ3Yva0ov?=
 =?utf-8?B?d2oxajBFUlZONi92dUJLWkJJUlFlTElja1F4WmJsbDBDQXFZQi9UQ2ZlWUp4?=
 =?utf-8?B?NlkvWTEwTlc2TkJMcFBHQm5JejRiL3F2cU9ydHQzTThFaHYvOGZPU1hxZGxZ?=
 =?utf-8?B?ZVNBaFlqck1zdHd2TTJBZC9pejJpNjU1U3RlWXFmY2UwTDNjaHVvTDZ6ZGFK?=
 =?utf-8?B?YkQwZXB3S0o2aTRkOTZTQzVUWFludHUzYUY5SUpaMzFaRkhKRU1idHRBclBn?=
 =?utf-8?B?NHFrdmg3Y2NRK2czVGJBMGcwNTZGU3pEblJVNmRFVHRSNDQwQ00vOHpBOU5R?=
 =?utf-8?B?c3VvN2RFQjdaMGgzbHVHL1FzVTdyVk1jZEhGRjdtUGdpSmpDaGJET2pYVTBC?=
 =?utf-8?B?bW5OV3NKOVZNN2NGb2NaS3RKM3BNZFNmV09OUFMwQ2lNTFQxc1JOeGx3Z05D?=
 =?utf-8?B?eGNpOElTbUFjMnJUZlNOVDhseEowWEdrZWdCT2hjOXlUYXp2V0VRaWhGWksv?=
 =?utf-8?B?MzdCWjFlckxJVDlDQnZCaGg4MFltUGFiUk9rWTB6djJHa2FyT2xLckt1SDVI?=
 =?utf-8?B?QjVIMzQvdGpETE83VDFKejFZa1R4bml0RGNBcEJSV2laRnY5a2k4VGk3WnFz?=
 =?utf-8?B?OTMrZlB0dzdwVlZBa2ZDNzVGUkcvejdlb1dpM2dTM1NEQmdINnFSNlNhcWM3?=
 =?utf-8?B?bFFDRDRLM3NFdDE3YnFhUitHY2hCN2lOb0paSzRNTXRGSnRrbjNJZ3IwVWln?=
 =?utf-8?B?VkhUbXUzVjNTTm04aVRKcnF2Zlo2bTQrZklobk9iRTg4MHhoUVdOdTNIREdZ?=
 =?utf-8?B?b0RlNFZpaFhObHFSOEp6dWV4d0xFbFRpME5QbTh6Ulo3elBFQUJ5YUhuSmht?=
 =?utf-8?B?OVZGRDhxdnkrV2Qrd3VKNy9xejBYNTEzSHJ6YVhobERIRDZONmVuVVJnQ1k3?=
 =?utf-8?B?Sm5ueHNScE12ajd4K1FXbXowMy9Qa091STl2VnZXYm94T0FPdklnWXlDSkhp?=
 =?utf-8?B?OFhFZEVvdkNsZUlpcGY5V1Bhc2Y5M1NmUVpseVV1YVJ6b1VzTVEzVWlhaXVB?=
 =?utf-8?B?OVdtRHRMS3E0MW1adG1PY2ZUeml6K0lWb0dMOEhLMXh6djlENm04MXN4emhn?=
 =?utf-8?B?REo3WjRJMTRvNUFDZXVNdy9uTlIyUGdReTRFSWJ1QmFLRVRoRVNhaFBkZW9v?=
 =?utf-8?B?MThTZEZQVXZaSXhOZW0rWW5Yd09aSWViNjVHVERIWllRMXpSZ1ZGZUNhTkNZ?=
 =?utf-8?B?REVqN1dERnc5dG9xQkt0SHRZbHNhZEtsUTdUbTNqZ1U4ckxLWmpSLzR3SmN0?=
 =?utf-8?B?cVRjVHBvZ3ZmT0hmNEtBTjdXS1BYSExiZzBEZW1CYzRZcFI5aWgxSDFZZlc3?=
 =?utf-8?B?QkVLTlFVSWYyT0VkaHYyTGhTMXhmNWFLNFlPMVJkYTZZYytDK3ZSQkprTFlu?=
 =?utf-8?B?VTJveVBsNk1wcUU1RldoZzhxQmtpdmgrMk5CYVVVWTA3bENkZkdYSGFXQkJS?=
 =?utf-8?B?cE5oTGdJMndwNkc4Z1Q0OFQxU3c2My9jbXBZdkJDWllJOW5mUTBuK21lOW9F?=
 =?utf-8?B?eWpoWVduU2tpVlU0MHJpYnBkWEljdmRmU3ROd2VEZzFDaE9iTEdQTGw2MzhN?=
 =?utf-8?B?cnpEdWxVOU5mMHM2SVl3MmVEeDgxUTY0anJmRUQ1VWNMUUxBb0k0Zm1xSDJF?=
 =?utf-8?B?eE5OYVZlcGREa0picjk1ME5ZYU5LYU02M3JqQTZ4T1Q2KzVwTUUrbElTcWQx?=
 =?utf-8?B?Y1puYm00WE91YUo1bTFWT1RieDNyQVZxK2szZlRndC9uTUU2ajhDSlFvNU9w?=
 =?utf-8?B?TXBMMVV3Q2cxOGtTOXpzb1J4OHg3RVY4M2NjaGhaejVqTEc5R2xzNjgvQ3VI?=
 =?utf-8?B?MjA5MUh6RnE3WWloSGVnVzVXMnVRN3BxeExWZTJDeUdJZklnK2ZPMnhUZ1JJ?=
 =?utf-8?B?eXVneVVkdlgxNTMyU1RheU9sdXVzL1Y5cDZ5R29mcVY4dW85Z2YrS0JVUFVJ?=
 =?utf-8?B?b2JzWmFhejZxd0xERjBvVHFuSDE0eHdoVlJZeldhb2RQdFdueUJxMkJyUmZW?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9363F073C0FD88458A06A6BCF37560A1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc946c0a-039a-40f7-8ef5-08dd47f86afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2025 04:24:02.8409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxWnehDRxfvWPuLXIJnb8DZ6pbD6Gc0MKAy42q3S9lSdqYvYI8wjCyOmWKnm6lP6OrEfkjgy6cLRRhHoFXv5QZDE2c+9VWSHb6d/zMV8m3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6816

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDA0OjI3IC0wNjAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiBUaHUsIDEyIERlYyAyMDI0IDE2OjU5OjQ4ICswODAwLCBD
cnlzdGFsIEd1byB3cm90ZToNCj4gPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5nIGZvciBtZWRpYXRl
ayBjb21tb24tZHJhbWMgZHJpdmVyLg0KPiA+IA0KPiA+IFRoZSBEUkFNIGNvbnRyb2xsZXIgb2Yg
TWVkaWFUZWsgU29DIHByb3ZpZGVzIGFuIGludGVyZmFjZSB0bw0KPiA+IGdldCB0aGUgY3VycmVu
dCBkYXRhIHJhdGUgb2YgRFJBTS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDcnlzdGFsIEd1
byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWF0ZWss
Y29tbW9uLWRyYW1jLnlhbWwgICAgICAgICAgICAgICAgfCAxMjkNCj4gPiArKysrKysrKysrKysr
KysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0K
PiA+IGNvbnRyb2xsZXJzL21lZGlhdGVrLGNvbW1vbi1kcmFtYy55YW1sDQo+ID4gDQo+IA0KPiBN
eSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91
ciBwYXRjaDoNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4gDQo+IGR0c2NoZW1h
L2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctDQo+
IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+IGNv
bnRyb2xsZXJzL21lZGlhdGVrLGNvbW1vbi1kcmFtYy55YW1sOiBzdXBwb3J0LWNoLWNudDogbWlz
c2luZyB0eXBlDQo+IGRlZmluaXRpb24NCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy0N
Cj4gY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4g
Y29udHJvbGxlcnMvbWVkaWF0ZWssY29tbW9uLWRyYW1jLnlhbWw6IGZtZXRlci12ZXJzaW9uOiBt
aXNzaW5nIHR5cGUNCj4gZGVmaW5pdGlvbg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3
LQ0KPiBjaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0K
PiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbDogY3J5c3RhbC1mcmVxOiBt
aXNzaW5nIHR5cGUNCj4gZGVmaW5pdGlvbg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3
LQ0KPiBjaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0K
PiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbDogc2h1LW9mOiBtaXNzaW5n
IHR5cGUNCj4gZGVmaW5pdGlvbg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LQ0KPiBj
aS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250
cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbDogcGxsLWlkOiBtaXNzaW5nIHR5cGUN
Cj4gZGVmaW5pdGlvbg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LQ0KPiBjaS9saW51
eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVy
cy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbDogc2h1LWx2OiBtaXNzaW5nIHR5cGUNCj4gZGVm
aW5pdGlvbg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LQ0KPiBjaS9saW51eC9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRp
YXRlayxjb21tb24tZHJhbWMueWFtbDogc2RtcGN3OiBtaXNzaW5nIHR5cGUNCj4gZGVmaW5pdGlv
bg0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LQ0KPiBjaS9saW51eC9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRpYXRlayxj
b21tb24tZHJhbWMueWFtbDogcG9zZGl2OiBtaXNzaW5nIHR5cGUNCj4gZGVmaW5pdGlvbg0KPiAv
YnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LQ0KPiBjaS9saW51eC9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24t
ZHJhbWMueWFtbDogZmJrc2VsOiBtaXNzaW5nIHR5cGUNCj4gZGVmaW5pdGlvbg0KPiAvYnVpbGRz
L3JvYmhlcnJpbmcvZHQtcmV2aWV3LQ0KPiBjaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMu
eWFtbDogZHFzb3BlbjogbWlzc2luZyB0eXBlDQo+IGRlZmluaXRpb24NCj4gL2J1aWxkcy9yb2Jo
ZXJyaW5nL2R0LXJldmlldy0NCj4gY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS0NCj4gY29udHJvbGxlcnMvbWVkaWF0ZWssY29tbW9uLWRyYW1jLnlhbWw6
IGFzeW5jLWNhOiBtaXNzaW5nIHR5cGUNCj4gZGVmaW5pdGlvbg0KPiAvYnVpbGRzL3JvYmhlcnJp
bmcvZHQtcmV2aWV3LQ0KPiBjaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LQ0KPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbDogZHEt
c2VyLW1vZGU6IG1pc3NpbmcgdHlwZQ0KPiBkZWZpbml0aW9uDQo+IA0KPiBkb2MgcmVmZXJlbmNl
IGVycm9ycyAobWFrZSByZWZjaGVja2RvY3MpOg0KPiANCj4gU2VlIA0KPiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDI0MTIx
MjA5MDAyOS4xMzY5Mi0zLWNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbQ0KPiANCj4gVGhlIGJhc2Ug
Zm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudA0K
PiBkZXBlbmRlbmN5DQo+IHNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guDQo+IA0KPiBJ
ZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUg
dGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3Rh
bGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwDQo+IHRvDQo+IGRhdGU6DQo+IA0KPiBwaXAzIGluc3Rh
bGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBh
ZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLg0KPiBOb3RlDQo+IHRoYXQg
RFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1
cA0KPiBjaGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0
byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXINCj4gc2NoZW1hLg0KPiANCg0KVGhhbmsgeW91
IGZvciB0aGUgcmVtaW5kZXIuDQpGaXggdGhlIGJ1aWxkIGVycm9yIG9uIHYyOmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTM5NjQyMDkNCg0KVGhhbmtzDQpDcnlzdGFsDQo=
