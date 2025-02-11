Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC43320F;
	Tue, 11 Feb 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278024; cv=fail; b=FsRbiq8ztm/cWhZ2iI7trisBNkvckbqFHHG6pMdw4k9HkMfnRObmN35f9zfMO2oJb77l6O0PSS23ob+ygX7wfuDJwLmTUjURyvb1AHDgwOV7AiflHYI9hL0gT5LKzYEBaAb7eQrwllvz9skz1c7o0knB8cGwVuNhxPY9sBhhfWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278024; c=relaxed/simple;
	bh=SjHIkmu/33AHmSjzn3ILo/mDPJQnHdhefacSiFcgLug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LB3RTUZHQR33dvXwDhlL11tjkt1W8u7SLdKRPy7qLZvuDlsPSPdE6DpfSrqk+UaGwqocyJ3Rg6YqPzihOp+4vnXCR9ZEB05KBI559jcdKGBn7I7cRp86xHnUH05ZQxh9QanJJ/H8jT6LSE6COuwoKWLy5CG56z5LpK/UULbQmIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LuREVOGj; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bxdv8UBR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LuREVOGj";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bxdv8UBR"
X-UUID: 45b53660e87611efbd192953cf12861f-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SjHIkmu/33AHmSjzn3ILo/mDPJQnHdhefacSiFcgLug=;
	b=LuREVOGjVMy86NO14X6rMDm6EvfnTJ+E8idPnoIp/vgv09WrgcT78he5XCR6Z0fJqIN9VaL6/0QghLsU1L6zahs48maKrcRXnYWhgqgLK7yTtXuiaat8oaAHfN+29O9xIwOfmW2IzCzqA3paeJcHxnV0OuLQyto2eIOPMM5R1zY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b953317c-c6ca-4376-931a-45fb8eb0651d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ac672d9c-f55b-41e7-a712-ffbe7a973280,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 45b53660e87611efbd192953cf12861f-20250211
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1605641858; Tue, 11 Feb 2025 20:46:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 20:46:53 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 20:46:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R542dDhWQdaBF0HLcI7MijMV1lr37RGpWpXXsvmf70XzTqkJf+pSp9Njoud6Nfn+gKjtwf4jYLtwnG3CK7SvGj6DICMCrrIL/4t5WZPg5T1H+4dYI3p1kJhY1Ala3XSwe7cVKp9Sd8shPrxdCC9SFBPKnYmd6G713fB7mEzDLcLY8wkdI2Z6ACITKvt3MrCl1AftfZbKW20beuRNY0TXst+vfTAIh6TlvBEjCrVRiDcNZxPSSBjfsjM18h2RZG5mUPuJ1YV2WjchVWcdfBkWsGmvvdRSW571c3q3ezZe7hDHt937tN9hn0AszDC5wBbMzMBrl52WwIu8PY3trRI27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjHIkmu/33AHmSjzn3ILo/mDPJQnHdhefacSiFcgLug=;
 b=FSd70/mOQH5+581fMCzkeiCoNvbrLeW2lHDSwTbxQoO89xqcbOPEYnO3Kl2QAYYJjql+L52oOnD8qkU1OWjtUKZj3wF1m+rGNAd+lDopCM3D08YEImz5STTu4BV7nAfHAjsquwP1vsUarB2pu//Qesz0SFgTdkQMu9/tuXpVTEXvajlwhz8pkW/DNU11+IWJbqEFAezFk9AYx/JIKLhZGWw1c5zQmeImKYWpstPC/Iv59tx+cR7m2MpmNFITRWcsJxWiiOvIzPjQiro9pL9mtm9R8C29By4Mv+v1hPcO7tPuWgaBwl1yqtR+wZKRJNR+yReARhGEvKmkfoOz4Of6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjHIkmu/33AHmSjzn3ILo/mDPJQnHdhefacSiFcgLug=;
 b=bxdv8UBRNSNem/S96noWUGcDlGUdjQOyc8nY5AY7/f689/NmF3ALSebBx0l9+W061ZILYyZaolmBohbdL72c5FCX7LQg29SoBLnZPxnOiYo9JR3PswyfbLECagWmurCWl2+TXVix1MbF6outeWVqXgaf9ktewMuEUdHZvbw7GSg=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 SEZPR03MB8566.apcprd03.prod.outlook.com (2603:1096:101:216::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Tue, 11 Feb 2025 12:46:49 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:46:48 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Topic: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLiaBeAgGAFBoA=
Date: Tue, 11 Feb 2025 12:46:48 +0000
Message-ID: <ab82119032f2517241860ce2149e31c4bbd30abd.camel@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
	 <20241212090029.13692-3-crystal.guo@mediatek.com>
	 <5d06211b-5ee2-48dd-9334-7c8bcffb894e@collabora.com>
In-Reply-To: <5d06211b-5ee2-48dd-9334-7c8bcffb894e@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|SEZPR03MB8566:EE_
x-ms-office365-filtering-correlation-id: f32d16f6-aa0c-449d-30ef-08dd4a9a2671
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b2laMXN0MDg0VVJPWmUwM0NCK1hUYVltV2Vyd2RSdURhQUhpZmgyNGhpVDE3?=
 =?utf-8?B?eGFGME9nWCt0eSswc0ZXMGh1dE9RSmRoRnE2K2NXeVRiUEhTeXRRRDR0ZkRI?=
 =?utf-8?B?bW1IcWxmZXVlMVN6SGNNczl2bFI5YXVaNzEwVXpZaEV5ZVlWWEt6TEpnclYr?=
 =?utf-8?B?dVV4ZTAvemFRMHAvNVdLRlI4VnB3WVY0MStKWUZISkZ0d2pqM2hycjhTelJG?=
 =?utf-8?B?Uk9idnhvR1hxN1REOGlCN2YrWm1uYW5QOEg2djIzeU5TejJ0TjVYOUtmTGNW?=
 =?utf-8?B?UVBkNWtwNkNIN2VXaGxoSis3Umh4S3dCUzNlaWRzV0lPeENFTWNBclQ0T0Uz?=
 =?utf-8?B?bE5BNzlZZ2tMZkRHUUd4MmxEMXIvdTdmZ3ltaXN3dUZPWGRWZmNvS1pFeWR2?=
 =?utf-8?B?a3lxTUV3R1NlUkw2SjlnbWhmQSt1SStmaitOYk9PN0hsRU94V1VTRWNqR05l?=
 =?utf-8?B?QnRLc2NacjVOOEVMTk5UOWQzam1OWXFhQlNlZzFJRlZMazNlZ0VFSy9rRmZI?=
 =?utf-8?B?eCtMdFlUcTAvYzIvMjFvZ0lGc3RvSUR4RFpra1BDK1NrakJvS0xSNGZkSmZH?=
 =?utf-8?B?S004NEJQNXRXaWdiM3gxdmJqRUxUcnMyUzNDdjVBbjlKVUQzVDQwcVI1akI0?=
 =?utf-8?B?T2ltcGh3NGNyZVlmSWhDRGhvODViMk43YS9CbFNhY3ZFVThIWmY2YjlyLy9m?=
 =?utf-8?B?ZGkzenVXVk85Y2NzK1k0SFgzSHFWaDBDaUJmdHhoSjJaNlh2eE8wZVhHd1B3?=
 =?utf-8?B?Z3d3WmpaRitrdTRYQkplZ1h0OSt6TWFROGV0NE4rSU4zNmdIK21OaU5iV2NS?=
 =?utf-8?B?UEJINldJMXk1TTJOWGJuRys0TjREaEM4NXB1V0pyVTU3YnV3TlpyVXBLSEJT?=
 =?utf-8?B?OFhiZ1kwWVRuKzF1K1FnbWd5aUoyWlRnZXBpUXF4d1VjaWlhRFdHM1lnczlF?=
 =?utf-8?B?NjF0OUJFWTBaR2dtd1RyNi9ZZFc1SWkrUGl3bUtoaDRrc2t2Z2dJMjdERWVa?=
 =?utf-8?B?aEVWS2tvMlVGQ0xpOTRlSkJGbE1OZzQ4N1RZSWVLTVVZOFNGTytRTGloSXFV?=
 =?utf-8?B?OEVoV1pKZjF1dko3UitseVBidEt2eHBhTktZaDNLRWRXSXQ0RkptaGp2N0JP?=
 =?utf-8?B?QWxCMUtxemlRc1oydFl4UFVtcXBsS2tHODE1eDl0ZDVPanlLZUpLZzhaU1or?=
 =?utf-8?B?MVJNV2dNR3IrRVF5N05MdVc1dlE5ZkhITTJxbXZnNkpHYlRxM1hFaEkwQkJU?=
 =?utf-8?B?c0dTa3BSc0o0aXEzRGF1NE0rV1NyelpvZ240VnpGQTZnenB3eW5USGR5bHla?=
 =?utf-8?B?UHpKTVVmazhJQUZaNDlsM0pyOVYvd2pxU01UZ0ZwbnhhdFdWZmtncTR2ZUVh?=
 =?utf-8?B?bzF3RHR0N2xTd0ZHS3h6M2dEaTdCUnFIczVJUXdOOU53aGJlTHdoV05ZSGR5?=
 =?utf-8?B?RVladjhMemhsL01MSWdxTnlJS2pzZ1R5eDRMT1dBb1JsMjl4eE1SbWFpNTBp?=
 =?utf-8?B?bndpTEN5L2NCOUtEVFNIOGd5dUk5SGlycTZkTW9vQ3FIc1dXb2JtQmltL1Ji?=
 =?utf-8?B?RGJlVnlIODdJc0srRDdTQlpwS0ZjSVpwa2xoaFhuNDNUVCtwakJnTXgrNUNS?=
 =?utf-8?B?K25LSlFXR0FYQm1DdUFMS3pXTUdZTmFnWUhLTnBjeXllMHN0cGdBZm9mWGVh?=
 =?utf-8?B?NjJRcGZxcGw4S1BoOWtIWTJqTEdlWUJER3ArL1NzRGJxbHRGOHRIbDBNN1lI?=
 =?utf-8?B?bi85KzE0K25UdS9hVUpZdkNPRHF6Zk5lcVcwYnppeWowV2YyRzRDNmNtZnBK?=
 =?utf-8?B?eWVDeE9PWTZEdmVjUzBUMGtLb3VyZ1VCRC9pblhUejduTSs1Wko2TU1xb2Mz?=
 =?utf-8?B?TkVLbVJubTRvMjZ3dTlaQngzOTBxZHp6b2p0UE5ycWovY2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU5JYU5WS0FPNGZTVlpEZVZuQXMwZzM1eVRkQVVmV1RZRTllWTI1OC9NdE5M?=
 =?utf-8?B?MG5Bc1VQT2VibFBKRyswU0RsaVIzL282aVdQK3dSQ1ByWFdhbUlmNGZvdUFn?=
 =?utf-8?B?SVRieFhCcHNvODJCWUxoMjlsK1JsNVpETE1UenJ0SjZZMGJxZmlQOVBuUUoz?=
 =?utf-8?B?Y2p2Q0NjczRJWk1jUGRacUViSGl5OWlaelNXakRlZXlZcURWQWtvUkhOeTE0?=
 =?utf-8?B?cGlKdEMvaXk1Z2QzUEdUaFZJQy9DaEgxL2d5RC9id0tuRHhhZGJ5Nkp3U29U?=
 =?utf-8?B?c3piUVMwbkphODkxRWNPRDJFQ2trT0kzL3hNOS8vSExSRzFwblVBUDFiaHpp?=
 =?utf-8?B?K3diZFZobkRJOTBrZ3Q3K0RScHFMOVEwaTA5bXl6YjVoRG5ITy92cHhEemxT?=
 =?utf-8?B?MSt1bFFva0h1Z3BpbFlEVFc3eUJOc0gzQXdMT0lNM1hUczNvam1teUlBQ2M2?=
 =?utf-8?B?ZEVwUUFOdzV5OFpCZFNXU1dEWkNWcEw1MVRPZGQ3aTFuSDJsL0RJT2N3dU9V?=
 =?utf-8?B?VGZNb1lyT21uZlp3WmVXcWRNMEJzVzMrNW9abmlqd0l5NndiNEFSYjFJU01w?=
 =?utf-8?B?S0IyUlRLakdGZW4rWGlIcUJ6V0g0YmJhWmxpSXFoTkVqRmYzN3V5RnkyOEh2?=
 =?utf-8?B?TjBISXJVcGR3bjZZNDFDSGgxeVgwSlRKUkYxR1ZGVCtKNkNXV3hYY0J6UlhC?=
 =?utf-8?B?STNxUm1KOFJFTk4xUmRzWDVFdDcvc1RDVGZXSXE0KzNoMTZpYytWUStRYjdM?=
 =?utf-8?B?eVNrTGVHK0dOaVA2UEdiU3pkQUtyL210clRFWDFzb20xWEVQQm1RdTBxT1JY?=
 =?utf-8?B?OExua3RPSklSS0JJTkEvbmpzbVV6WHZMVWt6YTJUOXJzMjE4VHpubWd2ZGgr?=
 =?utf-8?B?NTZ6VnZ6RTRsbGdva0t5U3RzZ0Q1T2VtMVg5Z3FkaVB4TzJ4K3R4ZVBmek41?=
 =?utf-8?B?eldndUpGcGdEMVV2bWZMTFRPWkdKWFZJVXRjc2swSEp5cWhmdGFJczB5TUhB?=
 =?utf-8?B?bDZGcTM0UWI4K0YwT3RnTVhNK00zMWdmZlBaV3oxRUtGbFhSc2g4em0vQ2tP?=
 =?utf-8?B?ditWeHJmNHZHT1NNb1JHY3lwZW90OU8zV3ZLcC9yeWFORnFsME53aGw2ZDlp?=
 =?utf-8?B?RXJaWmE5S3MvdGp1K3FhRThYZklUNjVjdU5LSklZUGJzcDlTa2pjN2FNWWIy?=
 =?utf-8?B?a1lkeTM3THVxVGpTYzFCaUFQU1lMazIydGUzWjA0emZoU0pScW14MkIxZ3Er?=
 =?utf-8?B?VE85ay9vVVRLNmVBTllqUzVUTGc5cG9PVXVHYkp6MTlldTZmUUh5QmhOb1BH?=
 =?utf-8?B?cU8wL1BGd3huYVVaYWFrd0FIaE1HVWJtbVlsR3VhM0NBTzQva014aFBKRFI4?=
 =?utf-8?B?VXlHdmc5U2Q1Qk9TMHZidDE1akwzVCtRZlZJdzN3bXhYTDhYcFlaOVMzQ2tq?=
 =?utf-8?B?d3VWdElyaHJhZnRHQzJ5bTlCa0ZOWVpxMm9NV3gyaERKSEFKNFFDMDJGZHUy?=
 =?utf-8?B?TC9qTEdMUm15d2lsa1RiZDBYZjlZYlpmNjhBaEJmMXBkWUtHK0V4SnZvbm9S?=
 =?utf-8?B?L1l1WFpkRHE0RGdYNDQ1MTd2NHc4ekcyWUdnTmxIaFdzT01vT2JOR1UrcVdR?=
 =?utf-8?B?ODA2bDQ5RWdQcVdPYk0xTVJwWWs5SnQ2a0JQL2tjM2FlUU1LUkRjUkdtVW9X?=
 =?utf-8?B?RmthTzNOV0xlVXdLZ0s3OEx6M2E2Y3E4VVU5Z3YrMnlWUlFOaFB0U0c3czZi?=
 =?utf-8?B?L3BsMm90THZiaENuRGNOMkl3ZW5FdGtFSCtGaGhIRlgzREF2NUVwdGhWWTJl?=
 =?utf-8?B?WHE3Y0dhRjZWcXpmTEJMbDY4SVN6S0RHbE1HKzZjUUtyK1gxaGNtNXpGbnpY?=
 =?utf-8?B?Nkx2c2p6U0JZV1VCNmd5ZEg1bURxY2ZtQWQwY1Uyem4zdGp6YXhHeEVCNTc3?=
 =?utf-8?B?QmNzU3ZJRUYyYVJUNCs5ZzBtYnl3aGZsNXFFK1FJNk9DVVlxU1ZUQ3dKTkRW?=
 =?utf-8?B?NjdJZzJBK3FodlNJamFqaGlKTXJOYjhFQ3haZ0hmd2xpZ1BKMzJMMm0rdXUw?=
 =?utf-8?B?NkFQYXBtc2ZWclZnVU13VExmNjFxMm1RY2pEU1NRNVpsNlZ2WkM5cm9EZGhp?=
 =?utf-8?B?YnVBcHRrbFFIaEpEZlR1Nm4ySVpEYzl4OWlPSHRLeFp2NDZOV0NDV3pZYVla?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBBFA50E5325A7409A15BCB35F745601@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32d16f6-aa0c-449d-30ef-08dd4a9a2671
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:46:48.6591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Do6UWAqT2aTTqkdUUiXj+XLa8jjSr/9OtNCkkVx7bUeuJmE4BpXVigSuk4eVnDvcZ/OEDbVQkHycIOfswztaUm0tAG+S4jJ2iS8gsKbeHJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8566

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDExOjI3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMi8xMi8yNCAwOTo1OSwgQ3J5c3RhbCBH
dW8gaGEgc2NyaXR0bzoNCj4gPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5nIGZvciBtZWRpYXRlayBj
b21tb24tZHJhbWMgZHJpdmVyLg0KPiA+IA0KPiA+IFRoZSBEUkFNIGNvbnRyb2xsZXIgb2YgTWVk
aWFUZWsgU29DIHByb3ZpZGVzIGFuIGludGVyZmFjZSB0bw0KPiA+IGdldCB0aGUgY3VycmVudCBk
YXRhIHJhdGUgb2YgRFJBTS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDcnlzdGFsIEd1byA8
Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL21lZGlhdGVrLGNv
bW1vbi1kcmFtYy55YW1sICAgICAgICAgICAgICAgIHwgMTI5DQo+ID4gKysrKysrKysrKysrKysr
KysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0K
PiA+IGNvbnRyb2xsZXJzL21lZGlhdGVrLGNvbW1vbi1kcmFtYy55YW1sDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4g
Y29udHJvbGxlcnMvbWVkaWF0ZWssY29tbW9uLWRyYW1jLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxlcnMvbWVkaWF0ZWss
Y29tbW9uLWRyYW1jLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uYzllNjA4YzdmMTgzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxlcnMv
bWVkaWF0ZWssY29tbW9uLWRyYW1jLnlhbWwNCj4gPiBAQCAtMCwwICsxLDEyOSBAQA0KPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlDQo+
ID4gKyMgQ29weXJpZ2h0IChjKSAyMDI0IE1lZGlhVGVrIEluYy4NCj4gPiArJVlBTUwgMS4yDQo+
ID4gKy0tLQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWssY29t
bW9uLWRyYW1jLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFoa09iRmVQN0otdXZOU3lEc2Vw
cXFkSF9qWlFjZjlOUTFrbkJSR1kxT0RwSDZGb1p5QnpMMXg1ckVJV1BwcHAxd05tTGRvNDFQUVRa
TTR1bE1QMVFnN3dyOVB3RkVkZU4kDQo+ID4gKyRzY2hlbWE6IA0KPiA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWhrT2JGZVA3Si11dk5TeURzZXBxcWRIX2paUWNmOU5R
MWtuQlJHWTFPRHBINkZvWnlCekwxeDVyRUlXUHBwcDF3Tm1MZG80MVBRVFpNNHVsTVAxUWc3d3I5
Rk43bTk1dyQNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBDb21tb24gRFJBTUMgKERSQU0g
Q29udHJvbGxlcikNCj4gDQo+IE1lZGlhVGVrIERSQU0gQ29udHJvbGxlciAoRFJBTUMpDQoNCk9r
YXksIGNoYW5nZSB0aXRsZSB0byAiTWVkaWFUZWsgRFJBTSBDb250cm9sbGVyIChEUkFNQykiDQoN
Cj4gDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIENyeXN0YWwgR3VvIDxjcnlz
dGFsLmd1b0BtZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsg
IFRoZSBEUkFNIGNvbnRyb2xsZXIgb2YgTWVkaWFUZWsgU29DIHByb3ZpZGVzIGFuIGludGVyZmFj
ZSB0bw0KPiA+ICsgIGdldCB0aGUgY3VycmVudCBkYXRhIHJhdGUgb2YgRFJBTS4NCj4gDQo+IE5v
LCB0aGUgRFJBTSBDb250cm9sbGVyIGRvZXMgbXVjaCBtb3JlIHRoYW4ganVzdCB0aGF0Lg0KPiAN
Cg0KQ2hhbmdlIHRoZSBkZXNjcmlwdGlvbiB0byAiQSBNZWRpYVRlayBEUkFNIGNvbnRyb2xsZXIg
aW50ZXJmYWNlIHRvDQpwcm92aWRlIHRoZSBjdXJyZW50IGRhdGEgcmF0ZSBvZiBEUkFNLiIsIGlz
IGl0IG9rYXk/Lg0KDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6
DQo+ID4gKyAgICBjb25zdDogbWVkaWF0ZWssY29tbW9uLWRyYW1jDQo+IA0KPiBBYnNvbHV0ZWx5
IG5vISBDb21wYXRpYmxlcyBhcmUgcGVyLXNvYy4NCj4gDQo+IG1lZGlhdGVrLG10ODE4Ni1kcmFt
Yw0KPiBtZWRpYXRlayxtdDgxODgtZHJhbWMNCj4gbWVkaWF0ZWssbXQ4MTk1LWRyYW1jDQo+IA0K
PiBldGMNCj4gDQoNCkNoYW5nZSB0aGUgY29tcGF0aWJsZSB0byAibWVkaWF0ZWssbXQ4MTk2LWRy
YW1jIg0KDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1pbkl0ZW1zOiA5DQo+ID4gKyAg
ICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hBX0JBU0UNCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hCX0JBU0UNCj4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hDX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjog
RFJBTUNfQU9fQ0hEX0JBU0UNCj4gDQo+IEFsbCB0aG9zZSBjaGFubmVscyBhcmUgc2VxdWVudGlh
bCBpbiBBTy0+TkFPLCBpbiB0aGUgc2Vuc2UgdGhhdA0KPiBldmVyeSBjaGFubmVsIGlzOg0KPiAN
Cj4gQ0gwICAgICBBTzogMHgxMDIzMDAwMCAgIGxlbjogMHg0MDAwDQo+IENIMCAgICBOQU86IDB4
MTAyMzQwMDAgICBsZW46IDB4MjAwMA0KPiBDSDAgUEhZX0FPOiAweDEwMjM2MDAwICAgbGVuOiAw
eDIwMDANCj4gQ0gwIFBIWV9BTzogMHgxMDIzODAwMCAgIGxlbjogMHgyMDAwDQo+IA0KPiBTbyB0
aGUgcmVnIGNhbiBiZSBzaW1wbGlmaWVkIGFzDQo+IA0KPiBtaW5JdGVtczogNA0KPiBpdGVtczoN
Cj4gICAgLSBkZXNjcmlwdGlvbjogRFJBTSBDb250cm9sbGVyIENoYW5uZWwgMA0KPiAgICAtIGRl
c2NyaXB0aW9uOiBEUkFNIENvbnRyb2xsZXIgQ2hhbm5lbCAxDQo+ICAgIC0gZGVzY3JpcHRpb246
IERSQU0gQ29udHJvbGxlciBDaGFubmVsIDINCj4gICAgLSBkZXNjcmlwdGlvbjogRFJBTSBDb250
cm9sbGVyIENoYW5uZWwgMw0KPiANCj4gDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IERSQU1D
X05BT19DSEFfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19OQU9fQ0hCX0JB
U0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfTkFPX0NIQ19CQVNFDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IERSQU1DX05BT19DSERfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBERFJQSFlfQU9fQ0hBX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRERS
UEhZX0FPX0NIQl9CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9BT19DSENf
QkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBERFJQSFlfQU9fQ0hEX0JBU0UNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogRERSUEhZX05BT19DSEFfQkFTRQ0KPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBERFJQSFlfTkFPX0NIQl9CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IEREUlBIWV9OQU9fQ0hDX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRERSUEhZX05B
T19DSERfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTTEVFUF9CQVNFDQo+IA0KPiBZ
b3UncmUgbm90IHVzaW5nIHRoZSBTTEVFUF9CQVNFIGlvc3BhY2UsIGFuZCB0aGF0J3Mgbm90IGV2
ZW4gcmVhbGx5DQo+IHNwZWNpZmljDQo+IHRvIHRoZSBEUkFNIENvbnRyb2xsZXIuIERyb3AgaXQu
DQoNCkFjdHVhbGx5IHRoZSBkcml2ZXIgb25seSB1c2UgRERSUEhZX0FPX0NIQV9CQVNFIGFuZA0K
RERSUEhZX05BT19DSEFfQkFTRSwNClRodXMgc2ltcGxpZnkgdGhlIHJlZyBwcm9wZXJpdHkgdG86
DQogIHJlZzoNCiAgICBpdGVtczoNCiAgICAgIC0gZGVzY3JpcHRpb246IGFuYXBoeSByZWdpc3Rl
cnMNCiAgICAgIC0gZGVzY3JpcHRpb246IGRkcnBoeSByZWdpc3RlcnMNCj4gDQo+ID4gKw0KPiA+
ICsgIHN1cHBvcnQtY2gtY250Og0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gDQo+IERvbid0IHRl
bGwgbWUgdGhhdCB0aGUgRFJBTSBDb250cm9sbGVyIGluIE1lZGlhVGVrIFNvQ3MgY2Fubm90IHNl
ZQ0KPiBob3cgbWFueQ0KPiBjaGFubmVscyBhcmUgYWN0dWFsbHkgb2NjdXBpZWQgYnkgYSBEUkFN
IGJhbmssIGJlY2F1c2UgSSB3aWxsIGJlDQo+IHJlYWxseSBza2VwdGljYWwuDQo+IA0KPiBZb3Ug
Y2FuIGF1dG9kZXRlY3QgdGhhdCBpbiB0aGUgZHJpdmVyLCB5b3UgZG9uJ3QgbmVlZCBhIERUIHBy
b3BlcnR5DQo+IGZvciB0aGF0Lg0KDQpPa2F5LCByZW1vdmUgdGhlIHByb3BlcnR5ICJzdXBwb3J0
LWNoLWNudCIuDQo+IA0KPiA+ICsNCj4gPiArICBmbWV0ZXItdmVyc2lvbjoNCj4gPiArICAgIG1h
eEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgRm1ldGVyIHZlcnNp
b24gZm9yIGNhbGN1bGF0aW5nIGRyYW0gZGF0YSByYXRlDQo+IA0KPiBUaGUgRm1ldGVyIHZlcnNp
b24gaXMgU29DLXNwZWNpZmljLCB5b3UgbmVlZCBwbGF0Zm9ybSBkYXRhLCBub3QgRFQNCj4gcHJv
cGVydHkuDQo+IA0KDQpPa2F5LCBtb3ZlIHRoZSAiZm1ldGVyLXZlcnNpb24iIHRvIHBsYXRmb3Jt
IGRhdGEuDQoNCj4gPiArDQo+ID4gKyAgY3J5c3RhbC1mcmVxOg0KPiA+ICsgICAgbWF4SXRlbXM6
IDENCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBSZWZlcmVuY2UgY2xvY2sgcmF0
ZSBpbiBNSHoNCj4gDQo+IElzIHRoaXMgY3J5c3RhbCBhbiBleHRlcm5hbCBjb21wb25lbnQsIG9y
IGlzIGl0IGludGVncmF0ZWQgaW50byB0aGUNCj4gU29DPw0KDQpUaGlzIGlzIHRoZSByZWZlcmVu
Y2UgZnJlcXVlbmN5IHVzZWQgdG8gY2FsY3VsYXRlIHRoZSBERFIgZnJlcXVlbmN5Lg0KSW4gdjIs
IHRoZSAiY3J5c3RhbC1mcmVxIiBwcm9wZXJ0eSBoYXMgYmVlbiByZW1vdmVkIGFuZCBkZWZpbmVk
DQpkaXJlY3RseSBpbiB0aGUgZHJpdmVyLg0KDQo+IA0KPiA+ICsNCj4gPiArICBzaHUtb2Y6DQo+
ID4gKyAgICBtYXhJdGVtczogMQ0KPiANCj4gVGhlcmUncyBubyBkZXNjcmlwdGlvbiwgd2hhdCBp
cyBzaHUtb2Y/DQo+IA0KPiA+ICsNCj4gPiArICBwbGwtaWQ6IHRydWUNCj4gPiArICBzaHUtbHY6
IHRydWUNCj4gPiArICBzZG1wY3c6IHRydWUNCj4gPiArICBwb3NkaXY6IHRydWUNCj4gPiArICBm
YmtzZWw6IHRydWUNCj4gPiArICBkcXNvcGVuOiB0cnVlDQo+ID4gKyAgYXN5bmMtY2E6IHRydWUN
Cj4gPiArICBkcS1zZXItbW9kZTogdHJ1ZQ0KPiANCj4gU2FtZSBmb3IgdGhlc2Ugb25lcywgcGxl
YXNlIGRlc2NyaWJlIHRoZW0gLSBidXQgdGhlbiByZW1lbWJlcjogaWYNCj4gdGhvc2UgcGFyYW1l
dGVycw0KPiBhcmUgYm9hcmQtc3BlY2lmaWMsIHRoZXkgY2FuIHN0YXkgaGVyZSwgb3RoZXJ3aXNl
IHRob3NlIGdvIGluDQo+IHBsYXRmb3JtIGRhdGEuDQo+IA0KPiBCZXNpZGVzLCBJIGRvdWJ0IHRo
YXQgdGhvc2UgYXJlIGJvYXJkIHNwZWNpZmljLg0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo+
IA0KDQpUaGVzZSBwYXJhbWV0ZXJzIGFyZSBTb0Mtc3BlY2lmaWMuDQpJbiB2MiwgdGhlIG9mZnNl
dHMgb2YgdGhlIHJlZ2lzdGVycyBzdG9yaW5nIHRoZXNlIHBhcmFtZXRlcnMgYXJlDQpkZWZpbmVk
IGRpcmVjdGx5IGluIHRoZSBkcml2ZXIuDQpUSHVzIHRoZXNlIHBhcmFtZXRlcnMgY2FuIGJlIHJl
bW92ZWQgZnJvbSBEVCBwcm9wZXJ0eS4NCg0KVGhhbmtzDQpDcnlzdGFsDQo=
