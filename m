Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70170807;
	Tue, 11 Feb 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273117; cv=fail; b=OOtMGCF3cbZHtib99vNznFnZJ5ImnDyVa7wexiPtwj2ukOO4SdZYz8YVvc6UqimgROsHvcG8sMCe4eX79qWmYLKIh2juTIW/rjtVWOUJ+a4WYnCToRacaFSGarNtkJegD7pQoqKTtYyjcz42DnV4+5tOecLhhsBerr5EiKYHOKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273117; c=relaxed/simple;
	bh=WoVy7xxxzKqX2gMjCzwZ0AhbC5TMbifYYIVSGwF4wAU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=blCjHiqMu/X62qMI3svjjbquQHDBLtLXdNCbFQRVRI0wqPAFVYAT3PbLL1yQHaaaUFlhlMggEZO8e9jl2FP+SKOKAiLfZbtu+JhUVbj2hla837GZYcFdxalMoM45UI8x0JzM3bIyqiG7ZSEbIu84+r974feL7R4GKT4MAM50ZBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CXkV8K4a; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=M/qk4zgL; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CXkV8K4a";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="M/qk4zgL"
X-UUID: dafd178ae86a11efbd192953cf12861f-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WoVy7xxxzKqX2gMjCzwZ0AhbC5TMbifYYIVSGwF4wAU=;
	b=CXkV8K4aHMt+ZDS8mv7Wb5VsTDogsAIvFTV3q41OQ+v/ncQYcnirn1GTjV/i0+3i7YGjB/C8pTOcT/ZPBygbrVUMq8x/kg77Pg/aDzEVx+qVgAm8D49CHyWTNCvgPfouQ+XKxl14LGOtTSw/A58ddrzI0bKriS9Se8SnrsofkFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1ae95c19-a082-4ff6-9210-80ddabd757f6,IP:0,U
	RL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:60aa074,CLOUDID:622c6a7f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: dafd178ae86a11efbd192953cf12861f-20250211
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712637236; Tue, 11 Feb 2025 19:25:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 19:25:07 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 19:25:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VND/nPmuKF5099diNky4mu+cZqCzJN8Ks8nfQQWCX1OQdL5a0Pf9v5zddaTRPxmne+g2FqVcFgRZbRRGNcTZnbLoBv+WPEZSQAcILodeaHP/LLbeTFtmSo1wbu2Mps0P2+aNkAewNgg+NQIG1REtQQ3UOPFMFW3Xaom50SRExxWnbtpjM9AyIyHfCWaTBEo8DnTRPqAHDisSahCAjnw6dPZabOpcKAu+Z7Cw4S3YGQJZOCd/hgVa7kB9o4JVOtZNcBNkouUHoShSNqYtLUo28BdiPwmtbqzHNGXQ4RXnyZYGPoKT/s4ekjabNGCoZZVXAb+ernB2VlRZFbLKn/G2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoVy7xxxzKqX2gMjCzwZ0AhbC5TMbifYYIVSGwF4wAU=;
 b=egxk9EfatkellW+ewcDNyL21cj5Wlvu4LwZ0GNq09HlWGvJeqNE2ggax8nQa8d8n/LJ7oM4y+mSpVin/vxw6+bQwpAs40Sk2jce1iKcq6OGFNApjd4rVXcIgCsoTYnPAojM9tuctJVehlczjknKGnSGtGZHnjUDcToWRCO6NsaStw/r1iYBRetQ+5+OwY7LAx+xTIPtHyjMlo0fTTplYbQi+qhvddVX0fU+qUd2DA6x6Ex2e0nrQWkBYyspl3/ZGGTRyCse0cvfwXQDhaDhlZpHPlAly/H6KHZBV2FUVxiSqcjCVanejK5UyPvtN3PfCfOkHwzU4o83DD+CmDnkjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoVy7xxxzKqX2gMjCzwZ0AhbC5TMbifYYIVSGwF4wAU=;
 b=M/qk4zgL6BKsrYm+SbJWW8uMJu4PRbM46IQTLKvsRBJBdki6dxOeS81pXKcoCZiPnU1UCG2XMNwcHQIorZnAa61dKbWeMTCOZLON4yxeE1SNsBPMzgxn1Wo9nozwpemUj7zX1ZUFuzbuqmxPNk44DfWoYMGRxauQ70TqLBFgEsw=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 SEYPR03MB8007.apcprd03.prod.outlook.com (2603:1096:101:175::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 11:25:04 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 11:25:04 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [v2,2/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Thread-Topic: [v2,2/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Thread-Index: AQHbeJD67A6EginEkES/04tEM7A1p7M+z0UAgAMuyIA=
Date: Tue, 11 Feb 2025 11:25:04 +0000
Message-ID: <115b6e35d36f0ee9fbf46e5df0be7eaa928d78ad.camel@mediatek.com>
References: <20250206121629.12186-1-crystal.guo@mediatek.com>
	 <20250206121629.12186-3-crystal.guo@mediatek.com>
	 <bdae5678-ff79-4c04-8d77-c6bdfe613c68@kernel.org>
In-Reply-To: <bdae5678-ff79-4c04-8d77-c6bdfe613c68@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|SEYPR03MB8007:EE_
x-ms-office365-filtering-correlation-id: 0cb9e800-3522-4306-4031-08dd4a8ebb56
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a05VV2pYODlpSUtCU1lBSlplZVRyVDZHT3NaRXpDUjhEZnFXT0tZZDQ1aG1T?=
 =?utf-8?B?S3R1MW13cm1WKzlxVEQ1Z25vZU02dkJEZkIvRVR4dUUrQzkrOUo1azVXSDhD?=
 =?utf-8?B?WEswV3hNUERhTXVCSXI2VlBiQjhvREpUR0ZsY0VmWmI2ek5yOERlTk01cE5n?=
 =?utf-8?B?WWpoQ2NleHE4VE8xblA0WStSaW9OTGo0WGhRS1ZKM244Vmt5cWczNFNiQ0x1?=
 =?utf-8?B?M2xaV2s5MVBqUlJFQTQ4UFBTRXJWYkZXT3l5RWFXdXJYVTJoVDVQQWxLRUVk?=
 =?utf-8?B?bHNYeDY5MjJxb1JlMTZKeHNtd1FPWTJSOERZWkNnaUg3K1NOcWY1MlhsR29x?=
 =?utf-8?B?c0lnVTZ1NE4zSzUyV1BkWXQ1eGZYWVY2WUxZZ05zMWlXNFN3bUNyVkF0K3NK?=
 =?utf-8?B?OTRRZFpkZmw1Ymk4cmtsVjRUYUt3cnZhbFYyVjZEYzl1ZXoyZ3RBZHVaenNo?=
 =?utf-8?B?bzhYNDJQa3A1SVNsU2QzVWM1N3ZKOXNpaVg2L0FJNzAzcG5DVERpbk13UDhG?=
 =?utf-8?B?cG9IamdRTzlwR2htekFiR0tkRUpkM2k5TFRBemtzMm11NkFjVUNkTTZpeGlC?=
 =?utf-8?B?ZVVTRVR0MlN6UStmRE50VHhkTFRuNmJwRmZ3RjRsMUk5TzFwTzhmdW5IOVo5?=
 =?utf-8?B?Mm9KajBIcThHQW1kNm5PNFBTUU80bzBHRmJDYWcrNDVNQlBDMEJBTDF4UEdn?=
 =?utf-8?B?eUJYVG5BQzMxVXg0NTRwaldpVDdaQ0trbVZlTW9pSlBob2M3Yk5EVFl5SFBC?=
 =?utf-8?B?blhNOVVleDNCV2tGOU1HTDJ1RlVPNVBka3hSVjVodHRHRVZHb0ZtbFRITTg2?=
 =?utf-8?B?RGJyL2V6cTV4UnJzM0J6ZTBvdHN2aEE1ZWhucnZEYjN1SDZJdGsxRWIrcXM0?=
 =?utf-8?B?eEVBZ2liTFkvakNZcThPMzBCenVVL2JSa2QvUTRNY0s3TGFRUm9LSXVLV0F5?=
 =?utf-8?B?OEFVRmJFaXo1OVlGem0ydFJDbmoxVHhsR1BVdWkzQTRLTFBXaWJnVXlQeURn?=
 =?utf-8?B?NVowSWNtR0FMNUhta29OZThIS3hrcGFXakplRE1xMEVqMUQ4emNhTDJkNnk4?=
 =?utf-8?B?L2V2aWlQbzZaQWxLTUY5TXBJaXhvWGw2b0I3a2lGMFBqL0hSbWtiVkZMenpD?=
 =?utf-8?B?WHZKbzFlR3JZdFVxdEZvQ3JpS2NGZFBTejFYZTkzZjdud0poMDNmWSsyM2hU?=
 =?utf-8?B?YkFmanljalBEVTA4SnhibS9PS3BDTFJZb3ZNczJBNll3cTB4VkZXajdlcExP?=
 =?utf-8?B?RkRVUkU1d2xTWmVTRW5TZ1pUR3o4aUt2WDZMRlc4WmJTaE5Qd2t4cGpIeXZ0?=
 =?utf-8?B?SzFnem9XOVArb3FkNlZDcUNBcnRJRGMrUmRBdzkzT1V4d01LNEx6cmtlUUJh?=
 =?utf-8?B?NUJ2T0E1OVZQMWdqeVFJN2lUYjJSQi9MQXJUSGNDYzRmSkFrYlE0aHhUOHBp?=
 =?utf-8?B?ZFFOY0ZUd2gyNDdmb1FRR2YwT2FsbVJJK2xYKy9XRWNyaFpnUEtZQW43UDZL?=
 =?utf-8?B?WXcycGRtbUpjMVJvNWRhUmpIZ0xOZ0RJd0pPT1JJSFRCV0grNGJIN3c4Nlgx?=
 =?utf-8?B?UlRpbGhtQ0E2bDJwY0V0QUxkL2ZyVU1DeEJrTFc5WU5TYTBNeWovd2hYZVBR?=
 =?utf-8?B?M0VjeEYrdmNSN0RtRHo4bERNMWFJZW5LLzljSmJ5SnRNMUo5cE1GUDk2bndJ?=
 =?utf-8?B?OUZXbkEvWW1jWE1YdmF1VnJIR3FkVVhNcmZ4QTN4MTc1MWRPalphV09WbnN5?=
 =?utf-8?B?Z1pjS2Ziem9iY0EzWmdqbTVyTnVBM1p2V0NqUDl6Ym10aFJPNElmdmpCL0sy?=
 =?utf-8?B?cXdxWkdkc2RRS3hoNFYvVDVBeUFaZmxQV294Smh2eG5CeUdsaWhSSUV5WjA4?=
 =?utf-8?Q?gt785RV/rFMQo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEpPc2JWbHpaa0lHcDU1bFZ5RnpGbE5NbG1iR3dKSGxvV3MycldITHpZZWlZ?=
 =?utf-8?B?bUEzaGdIKzF2SzdXT2NHUWpuOENGM2hBOVZLb0RvWDRkZUxnNW8zazcyYW1E?=
 =?utf-8?B?VEE5YWE3WCtxNXBFOEZZYkFoc3M5d1RtRXBnellZY2hHc3RYSlJzS2liT2hQ?=
 =?utf-8?B?b3NkOVVpM3A4VG9kVkpIN0FmLzVDR0kxWFpxRkIydmY5TWdPSFlPNlR5QXVt?=
 =?utf-8?B?QWlVcUFsZmJWSTl5d1BSUG5LcWYybTY3RlZRWFBDZjFLWU9kaUxaR1dOQXEv?=
 =?utf-8?B?eHpRMVl5QnN4SUVYcTRMbm0xcDcwcDFWM2JBSklWMVJKQVh1Ni93OVo4bkhl?=
 =?utf-8?B?cEcvUWtEdWk5ckNNQ09RRHoxLzBYQkZjd3pEdCtvSXVxSlNYcVBCdE0yU3NR?=
 =?utf-8?B?SnVvVEFRSmtmeWt0WjM1azVjdkdJbkZVQ0I1eFo0L2ZlSmgxUUFZMTBSaEpG?=
 =?utf-8?B?TlExa3pLb01WZEdiVW1JNkd6ejgvUk5oT1BCUHltbjZvSWNyWVN2REVWT3F2?=
 =?utf-8?B?c1AxSjRSQkdpMmo3NWxVVzIvWWlhcXdUUEN3NSsrTU5zdW5LZVovaFdEdy9y?=
 =?utf-8?B?RjlCb3RLM1FIQkVxWEJrWWV0OUZVMk1kV1NpSnRpVjFVMFArWTdKTHZ5UmxZ?=
 =?utf-8?B?VlJvZy95b1dkb21GcFFtSzB6M3c4U01sMnd5SFFzTVpHeHdOUzE4MTNwUjZs?=
 =?utf-8?B?YWFwRjVxMXhiSys0QUJFV3FWR1Z5emtadm5xWkc2eUIxdmExZnRKWG5aVlZB?=
 =?utf-8?B?M05TbGV4UCtrbDZsZUh6M2JtRVJEYTh4N2p6Q0dVckx0Ylo5eVk5TCtJRDEx?=
 =?utf-8?B?ZWcrOHBzMmxla1ZNSDBkOTJhSlBjcVNnYXJDTzVEM0pDcnJLT1pMNG5ZOS9O?=
 =?utf-8?B?bERkRHcyVDdxUlAydmthSjMwbDlFYWVxL3NpRmRFTTZSYzl4bFlGZUgxQ0ll?=
 =?utf-8?B?UGJ6TEM4ekJxK05HWXJYclJBQ05DWmtMQmxVUFYxNmtTQ1BBaXVWT2htVmNU?=
 =?utf-8?B?cEttekpLRm1ZZ2swb0V1RTZHNldjbzIydDIrVlRoZVBTdHVrSjJKZXN3aXJG?=
 =?utf-8?B?ZHVxRXZyQUpyZUV0NysyMmdDdVRvc2ROK1F4ZGxhczByRjNFNk9vUG1iMHlz?=
 =?utf-8?B?WUFwWWpTSHNERXFKQ1A5QWdscUxSWWxYQ0lRZUVhRHc1c2lndnQzcUJVUUoz?=
 =?utf-8?B?NE9RQTNlOC9VbDR0RVVPOGZpOCtIVms3VFRpVzVWcHFBalFaM2oydEk5cDA3?=
 =?utf-8?B?RGp6U2pxVDBJNjRBc2ZnQ24zNU9uU1RrN1kwOVY5TFNmRi9wTzJLbUFwcTNN?=
 =?utf-8?B?MnA4TmdWSm9YVDNUMGlxZGxoY3NDNDBjakJTdExmZnRZekxhRHRxeFB3RkJj?=
 =?utf-8?B?clYvdTRvNGhaWWZuU1c5V2t3aHZIL2VkU3hCVnhadVE2a25EWDBybDBmNHhh?=
 =?utf-8?B?WnFxa3NZbWJoanptUWtwRjBXNUdCNElVY3RjREV0UnB6RWZUN2V1eXpjdmpt?=
 =?utf-8?B?NGVPN1dRS3N5YW9LRWw0YzU2MFVOejlCQ1R0Zk0rV0NCY3duSnZzcjI5YWY2?=
 =?utf-8?B?aE45dWJ4ZWFXQzJKdWhGc3hqUkVHWlB1bmhGMzFpcFlkZCtyQ0s0WEJlVXBS?=
 =?utf-8?B?WkxXcE1OQjA5YnpYVnRLM2FCeW9FT2NRRVNRaXRaZDVLT1BiVi8rc2RxUFNz?=
 =?utf-8?B?RHNQeGhoTnJhaGRqeFJ0K04rRERCNWwrSHBNV0U4YjhnOFN5cGZWU0puSXBw?=
 =?utf-8?B?SmNTK1R2LzF1eHpVODRzZ0NZNm9uNWQ0YVFNZ0xkblZhcmJoYUNERlVsaEpa?=
 =?utf-8?B?OUIzbG83Ryszc3NONDBlR2ZxNlU0Q2ZWdG9NVDl5eVMxTjJHWXh1SXd1VWlr?=
 =?utf-8?B?REpoUGVHSFA1V3hHQUtkK1VvWlFWbWlHM2lmY2IwNVRWM1BPeGhQUUwwbkwx?=
 =?utf-8?B?UHBuWlFaSlkzbnRQUTA1M2xZMjg5TElhUnd3UG5yVndWenc1dFFuTnRWanIy?=
 =?utf-8?B?ZlhVZVdIYXBDa0ljNWFZdzQyRWFrdjRsZlNYWVA1SlVST2Q2Y3gxRnMwSWZl?=
 =?utf-8?B?cW9RK2U2QzVZL2M3YmpZVkx1YXdxQnBwcVRHNkNSUDJXSWwxdWgweTYrUTZC?=
 =?utf-8?B?TEJDVWxxVHNFaXVzMmdqd3kzWmFvSFdEdU90QWdvaGZUaXUyVU9HRk5DYmVo?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE8B35BA5C998E4FA5F559E37AE430F9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb9e800-3522-4306-4031-08dd4a8ebb56
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 11:25:04.5005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZUr6o6K2J+XUVf13pSz16ClE971S/rvHo35BHc7aDD6pDgBEIqxo4RvNuMjqowjFwIytrXZRZ3+SgasRgPheMWFlfkHdCr6JyuUla7Ie5bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8007

T24gU3VuLCAyMDI1LTAyLTA5IGF0IDExOjQ4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA2LzAyLzIwMjUgMTM6MTYsIENyeXN0YWwgR3VvIHdy
b3RlOg0KPiA+IEEgTWVkaWFUZWsgRFJBTSBjb250cm9sbGVyIGludGVyZmFjZSB0byBwcm92aWRl
IHRoZSBjdXJyZW50IEREUg0KPiA+IGRhdGEgcmF0ZS4NCj4gDQo+IFBsZWFzZSB3cmFwIGNvbW1p
dCBtZXNzYWdlIGFjY29yZGluZyB0byBMaW51eCBjb2Rpbmcgc3R5bGUgLw0KPiBzdWJtaXNzaW9u
DQo+IHByb2Nlc3MgKG5laXRoZXIgdG9vIGVhcmx5IG5vciBvdmVyIHRoZSBsaW1pdCk6DQo+IA0K
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2LjQtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRj
aGVzLnJzdCpMNTk3X187SXchIUNUUk5LQTl3TWcwQVJidyFsckpSMXhZWTF6cncxZFJudnp3T3Nk
MEZ5cVFhd1RVUkZBS1ZGcFdFYU1MTjJlaVYwM2dReThXRGFjSC1aR0l5cEI0LVd1UHVwY09FUmx3
OSQNCj4gDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFs
Lmd1b0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9tZWRpYXRlayxjb21tb24tZHJh
bWMueWFtbCAgICAgICAgICAgICAgICB8IDEyOSAtLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0NCj4g
DQo+IFdoeSBpcyB0aGVyZSByZW1vdmFsIGhlcmUgaWYgeW91IGFkZD8gQ29tbWl0IG1zZyBleHBs
YWlucyBub3RoaW5nDQo+IGhlcmUuDQo+IA0KPiBXaHkgdGhpcyBwYXRjaCB3YXMgc2VudCB0d2lj
ZT8NCj4gDQo+IFBsZWFzZSB1c2Ugc3RhbmRhcmQgZW1haWwgc3ViamVjdHMsIHNvIHdpdGggdGhl
IFBBVENIIGtleXdvcmQgaW4gdGhlDQo+IHRpdGxlLiBgZ2l0IGZvcm1hdC1wYXRjaCAtdlhgIGhl
bHBzIGhlcmUgdG8gY3JlYXRlIHByb3BlciB2ZXJzaW9uZWQNCj4gcGF0Y2hlcy4gQW5vdGhlciB1
c2VmdWwgdG9vbCBpcyBiNC4gU2tpcHBpbmcgdGhlIFBBVENIIGtleXdvcmQgbWFrZXMNCj4gZmls
dGVyaW5nIG9mIGVtYWlscyBtb3JlIGRpZmZpY3VsdCB0aHVzIG1ha2luZyB0aGUgcmV2aWV3IHBy
b2Nlc3MNCj4gbGVzcw0KPiBjb252ZW5pZW50Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0KVGhpcyBwYXRjaCB3YXMgYmFzZWQgb24gdGhlIHByZXZpb3VzIHZlcnNpb24uDQpC
dXQgdGhlIGFwcHJvYWNoIHdhcyBhY3R1YWxseSBpbmNvcnJlY3QgKHNoYWxsIE5PVCBiZSBwYXRj
aGVzIG9uIHRoZQ0KdG9wIG9mIHRoZSBwcmV2aW91cyB2ZXJzaW9uKSwgc28gSSBoYXZlIHJlc2Vu
dCB0aGUgbmV3IHYyIHBhdGNoZXMgYmFzZWQNCm9uIGEgY2xlYW4ga2VybmVsLg0KDQpUaGFua3MN
CkNyeXN0YWwNCg0K
