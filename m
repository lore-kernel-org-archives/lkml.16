Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7A815A848;
	Wed, 28 May 2025 04:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748406286; cv=fail; b=FEK6aD+Y0F2/BNoCqZFHY7VLNXQG4cC058sRzF9tBeqZ2CNGKBGyuOZ9G28sQvj+grX8IWcDTNCWfyR+ZDbYmGbROvloQV2l5ljM3huvq+7ftLs+YoglHMkkYTlX3LMMGlB7uN0ICoyCRsKTP5glfmz1sSW0JPV4p/nbfYLbppA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748406286; c=relaxed/simple;
	bh=NORPrP2C0L27B1FWPJlpFEXJNSCQCeHN9UIaT/cV4u8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cXauc8ArbCle9wzOLUwHYfUWZlggbfy5D3OAvpuw5hlFpR9rBLzML+7XvVWu/W4eqPvuidu/ON1wEYpUFO3DC9B5nUb+0xQTak/rLsgCpmijTvXSI4p8zcs///f0TiJq1Q1MYe+ujA007JZL/xRGvtkRJkZaeiY7xEIFl4V5o0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=f+Q1DWAW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=t+saolDU; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f+Q1DWAW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="t+saolDU"
X-UUID: a70c64b23b7b11f0813e4fe1310efc19-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NORPrP2C0L27B1FWPJlpFEXJNSCQCeHN9UIaT/cV4u8=;
	b=f+Q1DWAWw0K/KBFX8QaHGtEDo9RKps+37nCgWsnI6WUPtuOD7+VKDObBkq8DGbAEglaylPyXSwzg2i35Y+6teZ3MUMcs1ZLYtBGfxgYcj3nstn8H45FUkrdc/1HgK9QGV3utZI0/UxuamCg72GL3sb2YtyooqBlri3q1QsaIVtw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:54319a70-c80f-499a-bb37-a2d152793121,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:39215cf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a70c64b23b7b11f0813e4fe1310efc19-20250528
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 56743209; Wed, 28 May 2025 12:24:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 12:24:29 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 12:24:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ6izFsKloUww+3FDODUdDOSCXjrRE4qBbt9kqYAWFjVW8/kN398yftm9wv8htgp7K0S0bb8YgpKgXuN7w7ty4HqaSKK/bNIjkyx6CTp20us7Bl3hrEJdNyWFiw8sTN8HsS9yWqDXMoXad2OtrNrI3r0F5HpkRXWhScwz1ZWMWV1R9cG21tunIUsCqVjsvyQWXCP70g/ubRR5U+HJoN3v7nYxmnHZ5dpMzi1U9xnMGnYYPzvlkdLpX9mHy/c2Vxt1nM6/PQCOBLesqlY9m82bOGtnHol+zNHuRJuL5Kz/IAKKar1oadFoLLbu36bdG/HSftLWTFI8ZQHfKZEmAlmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NORPrP2C0L27B1FWPJlpFEXJNSCQCeHN9UIaT/cV4u8=;
 b=MqOd8kSBrZGpbeQTE5Z0GAAt0+NX422ZCD2hHtObhQFFqhBYxI8h5iNt8ZrluHC94uGzYyfnj5p3vwfF6riCORntEtD+9ZmmrDN4v+WWUJDX3QH/b+qbCTrf2+0hrUHf+a8RZ4UizjpR4ysW8NEPLCm3Et9xs+RBSXDGlKURqWQ8Ns2gn5d4SKMvJUvowtP8rfuNVrrgh0oM3AEQeQzddHLc5fslRvkBJye+hqqZaPAWBqDi03qF+svyMWp5OrnaEYZsDB37c3uVuI+WVqZPKXvGLZAcWXy/hzBxulbYxrKgXsQGTxEvt4NQj/d5RdxE1GsmtROZooC2auT4vgLroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NORPrP2C0L27B1FWPJlpFEXJNSCQCeHN9UIaT/cV4u8=;
 b=t+saolDUxf2kTE5JtAVBanEmRYK5l/Q32THLXy/7P0tpPLV80I1gdMo0hPeBApJuvY+X7FGKbUA+pWmRJ6wA5YHQhSJi8zu1kc70ephVCbu1cOJDWXoleRLifxvo4rwcK2KoF0Tro/5kZqwOtxLIdofbzCo5CJZzaRjTKIT/t7U=
Received: from TYZPR03MB7602.apcprd03.prod.outlook.com (2603:1096:400:41c::11)
 by TYZPR03MB8422.apcprd03.prod.outlook.com (2603:1096:405:78::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 04:24:26 +0000
Received: from TYZPR03MB7602.apcprd03.prod.outlook.com
 ([fe80::caa4:f232:9622:3328]) by TYZPR03MB7602.apcprd03.prod.outlook.com
 ([fe80::caa4:f232:9622:3328%5]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 04:24:26 +0000
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
Subject: Re: [PATCH 2/2] soc: mediatek: Add MT8196 VMM driver support
Thread-Topic: [PATCH 2/2] soc: mediatek: Add MT8196 VMM driver support
Thread-Index: AQHbyyr2Gz+uC6fwaU2Jei9rsCImgrPewRkAgAi5WwA=
Date: Wed, 28 May 2025 04:24:26 +0000
Message-ID: <6c41738df74af4fc1e409cb781d55e765ff38529.camel@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
	 <20250522150426.3418225-3-nancy.lin@mediatek.com>
	 <ea79d8fd-8134-4d14-92f6-f656be20cd9f@kernel.org>
In-Reply-To: <ea79d8fd-8134-4d14-92f6-f656be20cd9f@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7602:EE_|TYZPR03MB8422:EE_
x-ms-office365-filtering-correlation-id: 123288f0-b7d7-4732-3145-08dd9d9f8843
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eTNKY2NnQk1YTHQ5ZkJXc2tuRjBxSzZFS25jT2VLdGxPMXRNL3Z0MWVzSk8v?=
 =?utf-8?B?eVVzQ25NNmZQbkplV2hqYjJMN2kvMlpTNWY0RUJHVHdyTHpWdzFQTW9OUng4?=
 =?utf-8?B?QlU4bmNxMW9UNi9oaE1HNm5ZYlgvdFk2UlRXUjZVby9VRnEzQnlyR3UyVVZm?=
 =?utf-8?B?T3A5QnVDdExyZnVUNDdpK1dtWnlacW96RnZzREVMdzZXWGlEVUlPTDNNYTk3?=
 =?utf-8?B?SUJTZ2xsSlRvcHlEeFh1bzBVRjhvc0J6Z1Raa3VpQmVJZFFJSUxXdk4yYW9N?=
 =?utf-8?B?WDNMSURwMHBKZVRVcEJaZElXZlBuMTgwU1FUSlF0b2pwMURkTXplTmZLNDl0?=
 =?utf-8?B?SXhmZ3JIZ3o5WSsyOGEvWktBZ0dWMktBNTlnWC9uUzQ2alhhdFVpSXRQWUMz?=
 =?utf-8?B?NnZ4Nk5GZ3VTTTBVU3kwUVdBTVJraEYwWTBtY1h3UFNPNmR4ODJqUXUzdXo1?=
 =?utf-8?B?ek8rSG8rNWs4dTQ3QjZkQ3FBMnQ5NGpTampjV3NLZE1kNzlQM3NiWWVXaERK?=
 =?utf-8?B?K1h4Zm5pUVJiR0tDWm1ob0RQbDczWkJvekxiS0xxSm9vbFowL3lIQmdhU3pK?=
 =?utf-8?B?US90VTRiOWdtS1FCR1pSaWoxRFJlcWlOZktWakxoZGx3SnpwY0V2cDRueDdq?=
 =?utf-8?B?djR4bHhLdWRqUzBneCtjcVd6WDMzamkvYi9qZWVxMjRwVWFWTkxBaGF6dTFI?=
 =?utf-8?B?R0piY3F6eVE5b1c5RjB6bzcrVFZ2WVFiQzFYbTFuQ0p1TDJmaUhSYllqTlF1?=
 =?utf-8?B?ZFk5VFk0TCtDTld4OFViOGVNNHdCOTl0WWVMb2VDNDB5WHVpSmQ1amNNZk16?=
 =?utf-8?B?L0pTbnh0VjZVazBOZDhOblFVNXlvSlRIRFA4UW8xQUdGOHlaY2F2Q1F3TFhI?=
 =?utf-8?B?MUlBZmlpVm95a3lEd202cU1VbnJxemRmcVhOWVpidkVReTZKSDV5UDNLMTkw?=
 =?utf-8?B?UDdqNzFxdXlWVXhSTzE1NW1ldVlRQTBzc3RsTUxWbTY3MDJ1T29UdGk2OE1K?=
 =?utf-8?B?Q1RmR0NneFV1eVpWVWJVaE9WbjByLzlJOTN2YTE3MlVJSE1SMkNNWEkrZGJX?=
 =?utf-8?B?QzRzVUREemJ1SENmcEwwQitrRTlnNmw4WVBXNEJqTzBJV05Kenk0MVdFMnhn?=
 =?utf-8?B?MW1xY3pZYUlHenZkU0hPaFRRaU81bmtHYm53NXd3Y2VMK3pxTnk0TFlPMVVi?=
 =?utf-8?B?dSsxVTFYbEpDZ3BXYzVpQ0NaZ3RGMHErTzZHdDl0ZDJZa1FpU2I0YloydFVt?=
 =?utf-8?B?d2M0aGpkTFhYaGkwQVhXZmpVTVVOUjdVODhHZjJxU3hDUWZQbnNManFMaSs2?=
 =?utf-8?B?OFhGek1QMVRGaVI0eGdGNFF4U0dIKytZMmJNYk5pNHVkcWRIdlpWMXdYOTlO?=
 =?utf-8?B?WVplNDF1anhTSHFwSlpZVDFxaWlIbmlqcml3em9xV09laWtMSTBKWm1UTmpL?=
 =?utf-8?B?d2NFN2dHQm9IQ29LMVRCNEhsRW5Kc0I3VlljVTJpWHFSdnNYaVVkaVU5WWZw?=
 =?utf-8?B?Z3dkOXZ0VnowT1ozYzd2MGYzTmlpbkpIWGRYRzJwZndmN2lXVFdvTUVtM002?=
 =?utf-8?B?bzFEbk9lRVV6NXh3azd4NldhTFE5aG1pKytZUnM2dHR6TGplTmVkdUp3bitS?=
 =?utf-8?B?OW10Tnd4WGd2TGZiQy83NHJyNGIvaG52NFRFZjBXencycXRkekhkd2Vid3Bn?=
 =?utf-8?B?OTVIeFZsQ2k4QnZseUJoK1lLUFdzMmhsNVBid1ZCQkhKL05jZzNsaVpZQkVl?=
 =?utf-8?B?SEsxZHoxNkRkMVc3L0x1NjlReTFtT2xhZnlrRGhTb1pRWHhiRnFidnZ5dzlH?=
 =?utf-8?B?ZENKamZ6SG8vUWlLbjhldzRWQmJ4QXBldy9wa2I0T0xycVVBOStOODZra3I4?=
 =?utf-8?B?Zms2NWZtenNuYmMxYzIxR2x5SHJhMmdNRlVQRzRaNVJBUkI1bjc2ZlNMdFMv?=
 =?utf-8?B?R3hNa2MwUTlnblp6SnBZMG1HckNLQlpxUVZXVXhVRWtXZFdETmtPdjQrZk5i?=
 =?utf-8?Q?n0BQVO0JikS1wtB/nKr3Ah9oHJ0usw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7602.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akt6ckJ4OXl1U0FnY3laNGdqdjhYbXRWZTl4TmcrWVRNWjFDWjhMTXFoMG5y?=
 =?utf-8?B?N25RR1RONWhqUEp5ZkFZTVczVXBBUG9OeFBaVWJScklhbEUvY01rN2pMWm0w?=
 =?utf-8?B?RWdkSUpQNTA4MHhKSUdNbFQ1bVowWmhybnVuZHNuZTQvejRZRnJOZ3Z4SjVB?=
 =?utf-8?B?VEEwZ3BOQjZSYWIyYkRXdzNXTEkwQ0YyZVVYM1NkcFJGY3VXM0w5YVpqbTJn?=
 =?utf-8?B?UFRZMmczUzF3TGlEbkhnSG5XVXhCcXNDalovZWZwMGtnLzhvTExuazRMejVI?=
 =?utf-8?B?Q1lMdGVObWRMa2N0clAzdWFYOTBvSWtnZ2QyUnhJL1FBSExLcG9YekNDMVB5?=
 =?utf-8?B?MllvMzJkUGU5MElBelZkS1k2Y1BMQ0FDWjg2TEFaVWdpYWt3NnBrVW1Uck5E?=
 =?utf-8?B?bjZqd2dFVTF6c1FPSGM0czY3RHJwdGlCV0l3M1EzTVNaTFBJSkVIUkFxSXJJ?=
 =?utf-8?B?bVBYWld0VDAyVjdhdWFyQXBReS92VWgxR21hN1JTb2pTUnFZNVVaSzRSMTVT?=
 =?utf-8?B?NXJaemc1UnN6SHFnQ3BrMEg3dzF0UWJXNzZlUm1EK1RBWDV3cWp6d1JxOXF6?=
 =?utf-8?B?KzN1dWNvaFRWdGhXcjhuRVpMS3EwNmFQTGpRN01rVzVkUDVUVVVHa1dFaVdP?=
 =?utf-8?B?aWcxdElkb3I3WTl4SkRnNXhmNnVwc0JCdEZUa1pzNHdWbkMvd05ObERBblBy?=
 =?utf-8?B?OVVKU0IyQjliQmhDS1pXRDVzaDE0aG00QXc2OC9kNHJ4SUtRY29lYUNncXNG?=
 =?utf-8?B?MVNhUFpPWit1dDM3SmZ3ZTQwc1pLd2ZQV2MzNUFSdmZaR3FtMy8yMkpKSXFx?=
 =?utf-8?B?ZFBobzlCei9sbWJSZmFlcWwwczBzY3k4Y0ROUTE2K3Uzb2VyWFAzUlM2ZVU4?=
 =?utf-8?B?R29KUm1qSjBaYXNHQnlEeExPd0xhR25aUldtZ3pHL3JFWFljM0xMdXRWQWor?=
 =?utf-8?B?YktodnJMWTFIK3RxUnZFUFJGU3k0THh0c2pUaDN5ckp4SXZuNVErZThlUHhS?=
 =?utf-8?B?aUQ3RU5jRE0rVXdzR1NQWmFWTGxtdnRMR3ZBMG1pcm52a2JSdFFDbkcyLzNl?=
 =?utf-8?B?S3kzTVRKSFVpWXBKSEZ4OVNPVmQwVlplSFlGK2xUd3F0Z3Jkc3R0SlQ4Nnht?=
 =?utf-8?B?aTZJV0hpTlc5ODh4U2ZrejVGckFCWUdHVHY1QWQ0TVp6dG5lS1hYS1Z5bUJL?=
 =?utf-8?B?clBSYXpZVlJRdnByL3lEeDMyZ3U0VFcwTmVyUzV4T2pVZkZiOEFyeW03Y0cw?=
 =?utf-8?B?cFpBTFg1UDdSTlFaZEdUMGRsQjVlY3NRVTFrSFhlS0Q2aG9jbDNFcjFSZFlN?=
 =?utf-8?B?eHI1WHcxaFF0V3BYV3M5QlVZVnk4aHM2NEhScTA2bWJneWI5K0Zlc0VOMEJ4?=
 =?utf-8?B?ZjdnbHlidUlLTVJGbVZXWnI5ZUNqaSt0d0dkNS82K0p5dFF4c1lJMmQ2dU5N?=
 =?utf-8?B?blZXKzZXK0w0MW1qdmpKdXpaVWtsc3poK3RTT2J3alNJMS9TK0drODlkeHhM?=
 =?utf-8?B?emIvcWl6ZE55bzBtNS9kaEZwcDRzU3JqSTlXbkJtNHVZYkZmWGlhM2xmQm1h?=
 =?utf-8?B?NG14enh1SUYzSWtIK1FGc3UrczA5SzAxK3g1ZG5jcjUyUGw3emE1emxVRTY1?=
 =?utf-8?B?eWdGQ0tLUHhFM2FhU2pERnFjbWJ2aHgzbTZxY1lyNmZQU0twcVJuMkV1T0kw?=
 =?utf-8?B?Q0RhOVAwY1ovb0JqR1ZWelZPMkFqdXFxRVlTblhMK0liUlhnTm5sYjkwbUU3?=
 =?utf-8?B?V0ZqYzJYc2N2aFI3c0ZxMnJpeVV6ank5Vk1NbHNOQWxzb2dGeFFFMkJTZEgw?=
 =?utf-8?B?QklYSUJwSGFkemNNZHl2RnFvamF1K2JLZ05RaTBTRC9OU2pjTjRUc0hSZWVj?=
 =?utf-8?B?eGRKNldodjVybkZrZ1luQjlySUgvRTQyMlpJNjJhREJUSUxpUmpXYzhiRTBE?=
 =?utf-8?B?eGFpb3FVSTJDMk9sUCtweHlzSy9DNEJOdkpCM0ozMlpKRmtoZTYwWUNWa3dr?=
 =?utf-8?B?cE5VMWNENEZqRHFrTFlEb3c1RGxDd0VTM25IdU81VUpGM1BXd3pZcFZ6MTJi?=
 =?utf-8?B?akE2UWx5VWhwdlBiWHlWZEovRDZueVUvN2xWc0NHUkFmZUI3YlZBME1ETUVx?=
 =?utf-8?B?TlVlUjBKajRoQ285N2NEOTd1VjFlbWQ0VnQ4blU3SWRLeU9RcGlmVWhiSmcx?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30577A8EE65D5F44904755BBC56B4B31@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7602.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123288f0-b7d7-4732-3145-08dd9d9f8843
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 04:24:26.7786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3b1rPxQ2pOLI7haybQOPyig4uMTG5A0XD9C90yfvRBv1pNRepbnIXYHU1GpSeh6zAlWt6sBhj39BYMfxKFnew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8422

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjUt
MDUtMjIgYXQgMTc6MTAgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IA0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IE9uIDIyLzA1LzIwMjUgMTc6MDMsIE5hbmN5LkxpbiB3cm90ZToNCj4gPiBG
cm9tOiBOYW5jeSBMaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRkIGEg
ZHJpdmVyIGZvciB0aGUgTWVkaWFUZWsgTVQ4MTk2IFZNTSAoVmNvcmUgZm9yIE11bHRpTWVkaWEp
DQo+ID4gY29udHJvbGxlciwgd2hpY2ggYWN0cyBhcyB0aGUgbWFpbiBwb3dlciBzdXBwbGllciBm
b3IgbXVsdGltZWRpYQ0KPiA+IHBvd2VyDQo+ID4gZG9tYWlucyBzdWNoIGFzIGRpc3BsYXksIHZp
ZGVvIGVuY29kZSwgYW5kIHZpZGVvIGRlY29kZSBvbiBNZWRpYVRlaw0KPiA+IFNvQ3MuDQo+ID4g
DQo+ID4gVGhlIFZNTSBjb250cm9sbGVyIHByb3ZpZGVzIHZpcnR1YWwgcmVndWxhdG9ycyBmb3Ig
bXVsdGltZWRpYSBJUHMNCj4gPiBhbmQNCj4gPiBjb29yZGluYXRlcyB3aXRoIHRoZSBoYXJkd2Fy
ZSBjb21tb24gY2xvY2sgZnJhbWV3b3JrIChod2NjZikgYW5kDQo+ID4gdGhlDQo+ID4gVmlkZW8g
Q29tcGFuaW9pbiBQcm9jZXNzb3IgKFZDUCkgdG8gbWFuYWdlIHBvd2VyIGRvbWFpbnMuIFRoZQ0K
PiA+IGRyaXZlcg0KPiA+IHVzZXMgYSBoYXJkd2FyZSB2b3RlciB0aHJvdWdoIEhXQ0NGIHRvIG5v
dGlmeSB0aGUgVkNQIHRvIHR1cm4gb24gb3INCj4gPiBvZmYgVk1NLXJlbGF0ZWQgYnVja3MuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29t
Pg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZ8KgwqDCoMKgwqDC
oCB8wqAgMTIgKw0KPiA+IMKgZHJpdmVycy9zb2MvbWVkaWF0ZWsvTWFrZWZpbGXCoMKgwqDCoMKg
IHzCoMKgIDEgKw0KPiA+IMKgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXZtbS1kcnYuYyB8IDQ3
MQ0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAzIGZpbGVzIGNoYW5n
ZWQsIDQ4NCBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLXZtbS1kcnYuYw0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3NvYy9tZWRpYXRlay9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9LY29uZmln
DQo+ID4gaW5kZXggZDcyOTM5NzdmMDZlLi40ZGI0YTA4NzYwODMgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL0tjb25maWcNCj4gPiBAQCAtNjksNiArNjksMTggQEAgY29uZmlnIE1US19NTVNZUw0KPiA+
IMKgwqDCoMKgwqDCoMKgIFNheSB5ZXMgaGVyZSB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlh
VGVrIE11bHRpbWVkaWENCj4gPiDCoMKgwqDCoMKgwqDCoCBTdWJzeXN0ZW0gKE1NU1lTKS4NCj4g
PiANCj4gPiArY29uZmlnIE1US19WTU0NCj4gPiArwqDCoMKgwqAgdHJpc3RhdGUgIk1lZGlhVGVr
IFZNTSBkcml2ZXIiDQo+ID4gK8KgwqDCoMKgIGhlbHANCj4gPiArwqDCoMKgwqDCoMKgIFNheSBZ
IGhlcmUgdG8gZW5hYmxlIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBWTU0gKFZjb3JlDQo+ID4g
Zm9yDQo+ID4gK8KgwqDCoMKgwqDCoCBNdWx0aU1lZGlhKSBjb250cm9sbGVyLCB3aGljaCBhY3Rz
IGFzIHRoZSBtYWluIHBvd2VyDQo+ID4gc3VwcGxpZXINCj4gPiArwqDCoMKgwqDCoMKgIGZvciBt
dWx0aW1lZGlhIHBvd2VyIGRvbWFpbnMgc3VjaCBhcyBkaXNwbGF5LCB2aWRlbyBlbmNvZGUNCj4g
PiBhbmQNCj4gPiArwqDCoMKgwqDCoMKgIGRlY29kZSBvbiBNZWRpYVRlayBTb0NzLiBUaGUgVk1N
IGNvbnRyb2xsZXIgcHJvdmlkZXMNCj4gPiB2aXJ0dWFsDQo+ID4gK8KgwqDCoMKgwqDCoCByZWd1
bGF0b3JzIGZvciBtdWx0aW1lZGlhIElQcyBhbmQgY29vcmRpbmF0ZXMgd2l0aCB0aGUNCj4gPiBo
YXJkd2FyZQ0KPiA+ICvCoMKgwqDCoMKgwqAgY29tbW9uIGNsb2NrIGZyYW1ld29yayAoaHdjY2Yp
IGFuZCB0aGUgVmlkZW8gQ29tcGFuaW9uDQo+ID4gUHJvY2Vzc29yDQo+ID4gK8KgwqDCoMKgwqDC
oCAoVkNQKSB0byBtYW5hZ2UgcG93ZXIgZG9tYWlucy4gVGhlIFZNTSBkcml2ZXIgdXNlcyBoYXJk
d2FyZQ0KPiA+IHZvdGVyDQo+ID4gK8KgwqDCoMKgwqDCoCB0aHJvdWdoIGh3Y2NmIHRvIG5vdGlm
eSBWQ1AgdG8gdHVybiBvbi9vZmYgVk1NLXJlbGF0ZWQNCj4gPiBidWNrcy4NCj4gPiArDQo+ID4g
wqBjb25maWcgTVRLX1NWUw0KPiA+IMKgwqDCoMKgwqAgdHJpc3RhdGUgIk1lZGlhVGVrIFNtYXJ0
IFZvbHRhZ2UgU2NhbGluZyhTVlMpIg0KPiA+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBOVk1FTV9N
VEtfRUZVU0UgJiYgTlZNRU0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
TWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gaW5kZXgg
MDY2NTU3M2UzYzRiLi4yYjIwNzE2MTRhYzQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmls
ZQ0KPiA+IEBAIC02LDYgKzYsNyBAQCBvYmotJChDT05GSUdfTVRLX0lORlJBQ0ZHKSArPSBtdGst
aW5mcmFjZmcubw0KPiA+IMKgb2JqLSQoQ09ORklHX01US19QTUlDX1dSQVApICs9IG10ay1wbWlj
LXdyYXAubw0KPiA+IMKgb2JqLSQoQ09ORklHX01US19SRUdVTEFUT1JfQ09VUExFUikgKz0gbXRr
LXJlZ3VsYXRvci1jb3VwbGVyLm8NCj4gPiDCoG9iai0kKENPTkZJR19NVEtfTU1TWVMpICs9IG10
ay1tbXN5cy5vDQo+ID4gK29iai0kKENPTkZJR19NVEtfVk1NKSArPSBtdGstdm1tLWRydi5vDQo+
ID4gwqBvYmotJChDT05GSUdfTVRLX01NU1lTKSArPSBtdGstbXV0ZXgubw0KPiA+IMKgb2JqLSQo
Q09ORklHX01US19TVlMpICs9IG10ay1zdnMubw0KPiA+IMKgb2JqLSQoQ09ORklHX01US19TT0NJ
TkZPKSArPSBtdGstc29jaW5mby5vDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay12bW0tZHJ2LmMNCj4gPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay12bW0tZHJ2
LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZGU0
Y2ViN2Q1OWZhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay12bW0tZHJ2LmMNCj4gPiBAQCAtMCwwICsxLDQ3MSBAQA0KPiA+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQ0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMjUgTWVkaWFUZWsgSW5jLg0KPiA+ICsgKiBBdXRob3I6IFl1bmZlaSBEb25n
IDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1
ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbV9k
b21haW4uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2RyaXZl
ci5oPg0KPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfTVRLX1ZDUF9SUFJPQykNCj4gDQo+IEFu
ZCB0aGF0J3MgdGhlIHByb29mIHlvdSBzZW5kIHNvbWUgc29ydCBvZiBkb3duc3RyZWFtIGNvZGUu
DQo+IA0KPiBUaGlzIGRvZXMgbm90IGV4aXN0Lg0KPiANClNvcnJ5LCBJIGZvcmdvdCBhZGQgcmVm
ZXJlbmNlIHBhdGNoLiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIFsxXS4NCg0KWzFdIEFkZCB2Y3Ag
ZHJpdmVyDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0
ZWsvbGlzdC8/c2VyaWVzPTk0OTIzMg0KDQoNCg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVtb3Rl
cHJvYy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVtb3RlcHJvYy9tdGtfdmNwX3B1YmxpYy5o
Pg0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKyNkZWZpbmUgbXRrX3ZtbV9kYmcoZGV2LCBmbXQs
IGFyZ3MuLi4pIFwNCj4gPiArwqDCoMKgwqAgZGV2X2RiZyhkZXYsICJbdm1tXSAlcyglZCk6ICIg
Zm10ICJcbiIsIF9fZnVuY19fLCBfX0xJTkVfXywNCj4gPiAjI2FyZ3MpDQo+IA0KPiBObywgeW91
IGRvIG5vdCBnZXQgeW91ciBvd24gZGVidWcgY29kZS4NCj4gDQo+IE5BSy4NCj4gDQo+IFRoaXMg
aXMgbm93aGVyZSBjbG9zZSB0byB1cHN0cmVhbSBjb2RlLiBEb24ndCBzZW5kIHVzIGRvd25zdHJl
YW0NCj4gcGF0dGVybnMgcGxlYXNlLg0KPiANCk9LLCBJIHdpbGwgcmVtb3ZlIG93biBkZWJ1ZyBj
b2RlIGFuZCByZWZpbmUgaXQuIFRoYW5rcyENCg0KQmVzdCByZWdhcmRzLA0KTmFuY3kNCg0KDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
