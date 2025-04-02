Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689E1F4CB3;
	Wed,  2 Apr 2025 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743565914; cv=fail; b=MFiMuQy9CiVp6lcZNTYzqbICkBu2Dg7qSWvYeBN5iqYX4AgA6c/fmwuDPLFLQqNRsVg1zbbaK0Hv8b5kmTEbEZvj5q+JqkpjTUj0enDD7eXU4ppQnlMdF8PWzOxe+vhY1dTYeQtWGeZboTs4vlaue80w0pkDowxESS+4NxDxdSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743565914; c=relaxed/simple;
	bh=SVUL4unjzBQ+9Rtf5Inhe1w1+GxmL/3StPvq7ely8hM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IJzHwohRHxfwlOokqVJLQOuqKxRvt21J/fpmKkEBUQ/zsfFwOUWmGWwjLGBkmbXC2wrVlFTuPo3TdOOw3343udwvLvFVg86mkkxtTN6sZWa390EsFiWqlm56BquLV3wJ+y0TBzUalkoow02yjTwCKxrPLTTNqVwd5xkW4jllThA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=h6RC5cRy; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=nmzDetuT; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h6RC5cRy";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nmzDetuT"
X-UUID: cc8a6bb20f7511f08eb9c36241bbb6fb-20250402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SVUL4unjzBQ+9Rtf5Inhe1w1+GxmL/3StPvq7ely8hM=;
	b=h6RC5cRyfxGpAUV6f8QxFZ4Ega/B3wWkROCfvsT3K07ylu2BDuDe28PhqSpSqav+19JyAEMenG+LEGh++1hT1Ja5h46y7EJRldNewtnTfExb/7OgWNUDPzJyMQUnKM8+8Xxk9ylrtQX2AqiSmvXGqtSkSWPFMwcfSa/cSDIpdag=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4bf8772d-21c9-4352-8bc4-406c310743f6,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:6bda1f8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:11|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: cc8a6bb20f7511f08eb9c36241bbb6fb-20250402
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1907756746; Wed, 02 Apr 2025 11:51:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Apr 2025 11:51:46 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Apr 2025 11:51:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMfxP1sfEDFq8Gh24bo8zOubeFK5pU9AeDRoq/pRLmjwhy+3sDDjNtmSzrZXFh6szy8khssmM3y4ETLgTD+KHChfDOzVqzOA/p3y6OTjLlJ92HQCiIUOW2bu4kKY5bEjj+7zRhJHGCXwTjStos/pv/zwwv27ODLHbGfBTd+cLOsboJrnMWhWVbI3CoiEexe0imzQtl8TGXcdiaFsgfPJ3fEmAtwYPDHAvYL6TJKAobEwydRYUQVQkzmZUSqVhG7x4ueisDSfPzMdwRj8YOHSpWPojWB1kXlw5cTWAqtWuT/+1kK9/ialxe/wgfDLyIxlEaWsspp6j0E/2XtBVxmIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVUL4unjzBQ+9Rtf5Inhe1w1+GxmL/3StPvq7ely8hM=;
 b=WDhIgbSjYX7VvTevGBekGGIe9fDeZITvUVV2l32x22oG/U5jSIRfn+rbRUDmf9ICOAaCB/NGIEVU9tM4wf+eMrQJhq39ZZXFEZwpzlWcgOBJ/V3sRLNZO2RaZTfOlOjM98QAdq7ZyMiVQyPTFUoZXtbJb49Z7/aF++awSbndTTsZ45m5p1FNr+1tw7gPAuaqFEN6/mSSsmosZd4XHyXAxtM9ci6LacDgxPPSJw9zA39Y9dCfatf0CicMJ3wZIBiXN3MFpq9AgJjNXn1kU8eBZdCCD5thFFXVzTCh3gLBNXeH6hU4mEFHlv4Z1ABy9f52MDeh5ztNpWLW5Xg82pzXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVUL4unjzBQ+9Rtf5Inhe1w1+GxmL/3StPvq7ely8hM=;
 b=nmzDetuTKH74uJulmvZavIaiuQeHJOtMqklS5BdJVr9yVLV3j7BwNH21o4Le6W/qkaxQa6uQlJvNSiW6wg0FhYhDPCJzPq6LuFJ1yjjxQf05KTQs8iu3Xphc6lZ9ZDZOUmtCgyV0ELE6jk7/TAcnaSLd5Xc9ImVwpHBiLoej8HM=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 SE1PPFC86F9605A.apcprd03.prod.outlook.com (2603:1096:108:1::865) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.34; Wed, 2 Apr
 2025 03:51:41 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 03:51:41 +0000
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
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Thread-Topic: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Thread-Index: AQHbnhi5fvav1fMYp0WGwPZhFVIEv7OFNLqAgAqUKQA=
Date: Wed, 2 Apr 2025 03:51:41 +0000
Message-ID: <4bad42c867a838da413154fa0a779547d642642c.camel@mediatek.com>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
	 <20250326063041.7126-2-crystal.guo@mediatek.com>
	 <fb154077-e650-480e-a4d7-0a141b563dfc@collabora.com>
In-Reply-To: <fb154077-e650-480e-a4d7-0a141b563dfc@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|SE1PPFC86F9605A:EE_
x-ms-office365-filtering-correlation-id: 619abc71-ca98-4589-ed29-08dd7199adb9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NTNBL3R0eCtUZ1NMUVVPSUlzZUk0SS80cnB6b0RVZFFrSEc3STB5UlJBbFd4?=
 =?utf-8?B?RWp3RVhKaWt1YzZMbWxpMWFHQmJOK0NkTGR2bzlUQmJDTFRMejZIdHVsNERB?=
 =?utf-8?B?TVY0N1pRUVNZNEdCZFNjZElDMHV0SWw5REFJd1RoOTlla1o1ZXlBRlJubzEz?=
 =?utf-8?B?T0gxenM3WmlEQTZKNmlYMHBNZnhpVlJkaFVTVkN6THVwUDliRG5rS3RrbGNZ?=
 =?utf-8?B?V1JPWVYxVm5VRlRHTXVVanltZElOSU9acWNwUHZaanBHNW5EaE15QXNzYk5l?=
 =?utf-8?B?TWNlQWxsQzRESTUzTDBzMjA0ZHQyOXV6eXMvOUJOcWZBdnFMUWs4TG5VNHdM?=
 =?utf-8?B?eGpjNmlBVG1qWENjUjAxL3g5YkFCVVRabCtxV0Z1MWd5cFBjQmRkckgvR0ZR?=
 =?utf-8?B?bmJDd01XUFpqMVZiWUI0bzBSbHlML0p4bzNHaVdzcEVIZHJqOTlKR3BnRkVu?=
 =?utf-8?B?NkxkNXhHSTdkd2JJQTVMaTdCWEVmQ0s3dVp6RXdBSElhbXNOSkVxemJGTjk5?=
 =?utf-8?B?WUhFWVY3Tm9mK1ZSVjZkYWowdzlxSHBKR2p5NjdQNU04eHNBbGZvQnlIK0Qw?=
 =?utf-8?B?RHRTV3l6RTJBVU5GQ2p1ZXJDelJFUVFuQm1WbmpSWkhLeElXWjBwQ3AvejJs?=
 =?utf-8?B?bE9kZFc5T2FsMlo2SEViWnAvOENDOS9pT24vckpqUGZYdnZMTWdTcHVYOVN6?=
 =?utf-8?B?NXFOV0ZRNlRlTWMveW5Ga0d4TDFuZFZJRjhHU0tXUWIvdkw4N01KQWxhYytQ?=
 =?utf-8?B?dnZ0eC9HMmp0VEo2UmxNb1NibStwQSs0Z1lFWVBrVTVVUTNJbXlZS0g0eC9U?=
 =?utf-8?B?c3V5TE5sT2diWGJSSDViWWR1UHdHcnFHWTZjdjRxS0NXRlRTeHBuV1ZiR2Jy?=
 =?utf-8?B?SlBiVzl3blVaa3JEU2lwS0duS2p4WFVMdEtWYmsyUlA4MTFGVGtBRHJDTVl3?=
 =?utf-8?B?elByYjBLaG8xV3pXWXJtVkhRT2JwaWlLaU5xQVB3MHI0QXRkVFBBMXlRNzRZ?=
 =?utf-8?B?ZjRtUEJYVVlSTGZmQW5mOFNwU3BXUldhU1VMM2gvTTFhQ0Q0b0VSc3NtZ0tH?=
 =?utf-8?B?a0dDRVV6L0I4Y3NWc1dVenhyV0MzeXV5UGlKVURyUEhMNjRnWFdZdGZhNUph?=
 =?utf-8?B?eGZwWWF2bnNxbXY2bG5GYlQxQXVBdy9CKzkrVENrVnJ1bWJ3YVhoTzE0c2hI?=
 =?utf-8?B?ZFJnMGJDaVRaQmd1RVJUbko0WEdwN2YyVGduWmIxTWVyaWdIK0dtaTIwdmxS?=
 =?utf-8?B?VFZmbWZYSGhYaGsxaG9XOGZUam9TRHN6N1VaaVdYaDBUdExYYkFCM0J0M1hI?=
 =?utf-8?B?cmdkZUlRRWI2VzhWQklVOXhjdGZxdWJtd2diK0w1a1dFUWYxRlgzdUJmM2Ro?=
 =?utf-8?B?dGtxb0JpRUhENUwyUnljTlhEZG1ZS3BSSUswWE92WlFvN1pqTVRmQVMrSWpi?=
 =?utf-8?B?OXZIUXhGSUNMb0grT1p5VG5XRlprR3F5dkNCcUthWHNMem1saEJwOFE3ZS8y?=
 =?utf-8?B?bWpQekRiSDVoWjYrY2dQYXRNQWkzdnhUVGlJWmEyVkpiSlR6Zy9tY3FYNTdW?=
 =?utf-8?B?TFk3ZnNmUmlJRGt5MmZsUHVnUTVzQ21XVjRyWXU2Q2ZYbWR1MjJ3SW0yL2Ux?=
 =?utf-8?B?SUVsTWUvd2J5cVJBOVgvckVyYytCVlVlcjBQdjNzT3RBek5CU2VROTJ0Q3dH?=
 =?utf-8?B?YUFLSlVJc2h0YVlNTi9aVUZXLzZSVkJqUWFCZnFrZ001SHpjbmc3VTZBU3hZ?=
 =?utf-8?B?eThTZmdFUWVyZVd0VUpuU2dOcTNTMXYyWDFJVXpoOGlGM0VjMDhkRjhWeGlh?=
 =?utf-8?B?c3lPT1p1OFo4QWxObmpOTkRqVEsxaDJrOUFDQzZ4RkRXSlJlOE1mSjVxWmZM?=
 =?utf-8?B?eFhsZ3FZOS9NVE4zbmdTUWpLVklXNEd4Y2pHSDV2dTRtVDQ3NVFaaDQ0NDZY?=
 =?utf-8?Q?B9o+l2yFeyc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFJEdC9xTEtXYWE5T0xNWVVQTzJqSmtGTWRJUFZKTjF5Q0krVmVsWUxYVk8v?=
 =?utf-8?B?eG5NWDN4dHJXSituNGFCSEVCQ3p4cTdaazJ1Z1lQcWlzcGpyMXRKeG5Pb2Fu?=
 =?utf-8?B?QXMxY2ZDanNCeExLV3FrNjEzNUYxZ3FPbE16cDEveUlseEJuUjhGWllOZzlQ?=
 =?utf-8?B?T09rN0cySWNFdVdDVXc0aDZXbHNLdExQOWwzVjNZS241eEsrWjRQeTRpYVRG?=
 =?utf-8?B?dEtxaDFXRHpZMWRKbGRSWStGYWZ3UUt0QTkvT2cwZ1NRN25OeTRXL1VjZWE5?=
 =?utf-8?B?dUNrVDI1VHJIdkFVYit0OUllUVlvMEZ1WFVVTXNmcTlkV1lSbWsxR1FBeFBK?=
 =?utf-8?B?U05rNzlPUDdEaGxkQTdFZlZadnMzcnB2ZnVlb0FYSVZmUWlQRWtNdDlKbFU5?=
 =?utf-8?B?U25jd0oxV0dOQnJsbDB5bFh4OGVUNmxCcU12eU1TMk02OWRQc1FVTEo0dTYv?=
 =?utf-8?B?cGlDWGp2cVVzMk1nOWw0bUpsc25RZUhsWjBCeCtJUURBN2t5c3pTcldtSjAy?=
 =?utf-8?B?TFplcWpxRGFIY0c2NXpXT05DdWFCWGxOUmxMRGR0Z2dEeUV0TkkrR2tDN2VZ?=
 =?utf-8?B?ME1ucnk1R3lCM1crNnEvMWR4VjV2dmRVZ2tzOWZ4bGpJZjI3MXlRNWsrYUJM?=
 =?utf-8?B?aXVhN3ZCaFNuamxPd21ValBFQ251eG54a2JscEUydDllVFNqek5sbHIzMFk1?=
 =?utf-8?B?b2ZjT3gxU1RuUkoyeDhwSkU4ZHh3UzRKVHJaRCtWWGg2RXh2TVVKZGpoQW9G?=
 =?utf-8?B?VzdPdTBEYldoMWhBRGtBYU91ZWxXTTFGUEtWbVZERUFseVArMjR5TjZidG5U?=
 =?utf-8?B?cis5UDVjS3ZCR2IyVFFKSCsvMnB2MlNhR0RvQStCVXZBTHBCN0N6andieENh?=
 =?utf-8?B?V3B5aU5mNFFTV2h5d0VaRURVSnFtbmd5Y2xKaXVSb0NzSk1XV1poR2h6VnI1?=
 =?utf-8?B?WWNwdmoyYTc2WmFseXRqN09kZEExTTdXTC9paWp6b1VsamhqS3d6NkVOdkto?=
 =?utf-8?B?cTFUdVNSWk5KbGZvU2RwUWMrVkNTVjdrVDFuQzRmMkhidHB4VnZZTDZ6cDAx?=
 =?utf-8?B?TFp6c0toUnJtMFpwcjRmR05DN1YwMWcvTjVmalVnWndRNVg1YTJma3lMWEVT?=
 =?utf-8?B?NGhyNXl0TVNwSkRwaEJYaU92YnV2dTRYYXRFeVdvSlRxT2tPQUprK2IvbGw0?=
 =?utf-8?B?ZUhOZVR0S2d1UVJsQS9KN3JxTGtQOVZsNXRWSWtkYTg2WWdzM29XQmFML2lM?=
 =?utf-8?B?ZFZQN2xsektuaUdERFNab3daMXZGVE1WSkpoNGVKTlZWd3JseWI2d3JBajU1?=
 =?utf-8?B?elhrZHBNTnFRWklLWXhVYmw1N1pGeEJMd3h3QjVmcUQ1cEpmMEdpaUcrWVp0?=
 =?utf-8?B?dFV6SFFuUmdLN0ZMUEVYNHUvL0gybXI1RlVsVGtUUG11WUZRcXBGUGZLaWxB?=
 =?utf-8?B?eW15aE1aQ3N5RDQrQkExZWl6azNhdy9DeHNZOW1TVlc5elBicHdEZlI0aHJh?=
 =?utf-8?B?L0pBR2pUQWpDdnc2YzVsbXUyZkpyY2o0QkFWVVVUNUJuWkZRcS9LNkpwSWp6?=
 =?utf-8?B?bVphRFVBNGhRK1Iyc3JRaUs3eXJkZUNKdGR2dTcySHlvWGFpSzd4UUIxeU5k?=
 =?utf-8?B?WGFsNUtDQmcyNk04ZU1vM0ZDYWJia3V0MU5NRktYWUxNdDlUdjVSTUp3MmJC?=
 =?utf-8?B?RDNlYXlHblJVVkhxMzFZVmRkRnVzZVZ2RHZEd1RrWGt2Tm80R0hmVUxjTVdi?=
 =?utf-8?B?RnJkaE9rNStybGhZVW80SElVVEp1UU91MUlnWFlJbE5UeGdWVkY1WVpjSXVx?=
 =?utf-8?B?QmV5SGxIamFRSEJBbEdDUU4rVCtWTXJmeGhnWFl5VW9YZ2xGZTVrTFhHZ1pi?=
 =?utf-8?B?cklHS0ZyQjQ4N1VpSlN0WjFOSlI4NlRYbk5UU1NtaHlyTmltSFBMbFhQSW9L?=
 =?utf-8?B?Vy83b3ZZYStZbk5scUhEZC9kL3BJZUhIR0RNVHcxVUhEK0RLRWdCZmt3bjRz?=
 =?utf-8?B?M3N5TG5QZTdaN1VJSWJVb0VYS1JHbFJSUHJKU3dDSE5zTEJmVWp4U21WbFc5?=
 =?utf-8?B?eGk2QitsdEI1cGZ0VlkvdE9aWFh1OUl0MGtJRjBHd2RGTHAySkdWNnI1V3Rr?=
 =?utf-8?B?S25Wd0pOOGl6a0tuSFJXU2VYc1JJRnBkOXc1QlhDUnQ1OWtNVjVvYUU2QUZG?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46864AE66F6A6147B20A8AE7B3CEE959@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619abc71-ca98-4589-ed29-08dd7199adb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 03:51:41.4700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HzJYSK/e6dyIp9k5JYhRd0U5fxF/NKUzCH2CgO7yGbcjGbS/78wKZUbMYu43qVwzFGRU+DzTBzHsxzakpzQcvKD3Ze5BBnlF7kyaLPQXQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFC86F9605A

T24gV2VkLCAyMDI1LTAzLTI2IGF0IDExOjE4ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNi8wMy8yNSAwNzozMCwgQ3J5c3RhbCBH
dW8gaGEgc2NyaXR0bzoNCj4gPiBBIE1lZGlhVGVrIERSQU0gY29udHJvbGxlciBpbnRlcmZhY2Ug
dG8gcHJvdmlkZSB0aGUgY3VycmVudCBERFINCj4gPiBkYXRhIHJhdGUuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIC4uLi9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWssZHJhbWMueWFtbCAgICB8
IDQ0DQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQ0IGlu
c2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiA+IGNvbnRyb2xsZXJzL21lZGlhdGVrLGRyYW1jLnlh
bWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxkcmFtYy55YW1sDQo+ID4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LQ0KPiA+IGNvbnRyb2xsZXJz
L21lZGlhdGVrLGRyYW1jLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uOGJkYWNmYzM2Y2I1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxl
cnMvbWVkaWF0ZWssZHJhbWMueWFtbA0KPiANCj4gVGhlIGZpbGVuYW1lIHNob3VsZCBiZSAibWVk
aWF0ZWssbXQ4MTk2LWRyYW1jLnlhbWwiDQo+IA0KDQpGb3Igb3RoZXIgTWVkaWFUZWsgU09Dcywg
dGhlIG1ldGhvZCBvZiBjYWxjdWxhdGluZyBjdXJyZW50IGRkciBkYXRhDQpyYXRlIGlzIHNpbWls
YXIgdG8gdGhhdCBvZiBNVDgxOTYuIEFmdGVyIGNoYW5naW5nICJtZWRpYXRlayxkcmFtYy55YW1s
Ig0KdG8gIm1lZGlhdGVrLG10ODE5Ni1kcmFtYy55YW1sIiwgd291bGQgZnV0dXJlIE1lZGlhdGVr
IFNPQ3MgbmVlZCB0byBhZGQNCmEgc2VwYXJhdGUgeWFtbCBmaWxlIGFnYWluPyBvciBjb3VsZCB0
aGV5IHJldXNlIG1lZGlhdGVrLG10ODE5Ni0NCmRyYW1jLnlhbWw/IFRoYW5rIHlvdSBmb3IgeW91
ciBndWlkYW5jZS4NCg0KQmVzdCByZWdhcmRzLA0KQ3J5c3RhbA0KDQo+IA0KPiA+IEBAIC0wLDAg
KzEsNDQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpDQo+ID4gKyMgQ29weXJpZ2h0IChjKSAyMDI1IE1lZGlhVGVrIEluYy4N
Cj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJv
bGxlcnMvbWVkaWF0ZWssZHJhbWMueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWdINWhNVEoz
NFpjWWZOTWZMVU5MLWRIOVNNeVFHcjA2a0o0amlqMWFuZXpCeUY3SUJPU2JrWU5kcXlzZ0hvei1y
U1JOd005cjZSYWFUQzFNTzI4ODJvamlmMjZvYUJ6ZyQNCj4gPiArJHNjaGVtYTogDQo+ID4gaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchZ0g1aE1USjM0WmNZZk5NZkxVTkwt
ZEg5U015UUdyMDZrSjRqaWoxYW5lekJ5RjdJQk9TYmtZTmRxeXNnSG96LXJTUk53TTlyNlJhYVRD
MU1PMjg4Mm9qaWZ3OGY2c1VIJA0KPiA+ICsNCj4gPiArdGl0bGU6IE1lZGlhVGVrIERSQU0gQ29u
dHJvbGxlciAoRFJBTUMpDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIENyeXN0
YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlv
bjoNCj4gPiArICBBIE1lZGlhVGVrIERSQU0gY29udHJvbGxlciBpbnRlcmZhY2UgdG8gcHJvdmlk
ZSB0aGUgY3VycmVudCBkYXRhDQo+ID4gcmF0ZSBvZiBEUkFNLg0KPiA+ICsNCj4gPiArcHJvcGVy
dGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0g
ZW51bToNCj4gPiArICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LWRyYW1jDQo+IA0KPiBQLlMu
OiBiaW5kaW5ncyBtYWludGFpbmVyczogdGhpcyBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8gZ2V0IG1v
cmUNCj4gY29tcGF0aWJsZXMgc29vbi4NCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KPiAN
Cj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IGFuYXBoeSByZWdpc3RlcnMNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogZGRycGh5
IHJlZ2lzdGVycw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4g
Kw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+
ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICBzb2Mgew0KPiA+ICsgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+
Ow0KPiA+ICsNCj4gPiArICAgICAgICBtZW1vcnktY29udHJvbGxlckAxMDIzNjAwMCB7DQo+ID4g
KyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2LWRyYW1jIjsNCj4gPiAr
ICAgICAgICAgICAgcmVnID0gPDAgMHgxMDIzNjAwMCAwIDB4MjAwMD4sDQo+ID4gKyAgICAgICAg
ICAgICAgICAgIDwwIDB4MTAyMzgwMDAgMCAweDIwMDA+Ow0KPiA+ICsgICAgICAgIH07DQo+ID4g
KyAgICB9Ow0KPiANCj4gDQo=
