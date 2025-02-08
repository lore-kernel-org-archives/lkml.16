Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DE1183098;
	Sat,  8 Feb 2025 04:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989221; cv=fail; b=n8Zycnnp+soFUyHidDsYu3OEw8LkPI13gZmAao7lJjT4S9+zxGsgZsBYCXTrHYfAU/48IFuSte8EnLZtOYkjZwXLW3mX4eHbizmP2DQWoZaiidwjhSEF/dc6w7A2zCFuG2EU73I+N8RO4im74zbgSneU/vOlCD7HC6wPPxqD56w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989221; c=relaxed/simple;
	bh=vXtYl2uVsBJ8xN0pcq1HIPZNZWrPonlL7J0RHyAqEaM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s8uLsM3WWgx6cTsRyTrftNstC2VN1ntjxA/0SQXWiF9+ei1zbxOIMZHPC6ZRS3c57zmDasUJc/3pZvXs3KLy23h+UwXfyMmbWFlvKs1Epn3mc8KRKZVSq2l3CSQdyEH3Jp5ADB3h1RmCWlIcRLjTOcowd9qUlZjeczPkSszUs8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=C9AQiKLw; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=TE5lwM9A; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C9AQiKLw";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TE5lwM9A"
X-UUID: da4443f0e5d511efb8f9918b5fc74e19-20250208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vXtYl2uVsBJ8xN0pcq1HIPZNZWrPonlL7J0RHyAqEaM=;
	b=C9AQiKLwIN7e4M9ydyZEd/YpUwFj7kRKWWLKBBSCA+FjX/AXB179gsjOvSD09bXwIIjyS36OVu27VgGZtq6lOsv0E8AKQwF9eCAjNPPYsKGGD/doSrBAs2e9wc803VWysceEGMjEPVO04m0aZ3fxlcqYGXSFfH0lWmf3JBtY3bI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:bf8157f8-3f18-40a9-9309-bd76552669bb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:f70f3b3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: da4443f0e5d511efb8f9918b5fc74e19-20250208
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1601472131; Sat, 08 Feb 2025 12:33:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Feb 2025 12:33:31 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Feb 2025 12:33:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTlRbTWud6hKAr6GuRX1ftua9OzCkSDPqWuqK1tRNVRvdSY+79zVVUjQfIUNnoDevKhOQ9FTQaXud3902xdl5EP85l6lj5qY8Rtbmv/ClhnqK3QHWMiHILaGZ0GXgSIVyIx1Opx62cq64DS0rgm1uJjTlSpx/7U8RvJIr7UNzzv3W5cDk6Q44sgwPtRpF9+MowT7jRHbclk35DOr3+yLuy4ZBLW21OqapZ2T24+XYVIt9siO3rNU/bez+oxGk3aJ3K+QTtZY/lNcaVTiqN/kUKi0ESBYUL3GESPvV55G47Xso79F+OfNk6+phjPr2g8Qm8SeqiiNTYu0zFoe2O21zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXtYl2uVsBJ8xN0pcq1HIPZNZWrPonlL7J0RHyAqEaM=;
 b=BHdcB51VsMsUg9koPY1VhnhQMjdaBQIWbA8mPHvAgE1QotOsGGeJfTFCPMu/t/dAcoN/oFtB0tQ5b3O9pPdc8dNh+M3XD9bduYRDMocwjHW2JEcGLmU+M4yoIbuOY1If17YdSp1SOkE3+se7d5/ULYMLOFvirTtqx2SBLUFMxKj5axT3nxbAwFwKVNzD6wc/mkKXy3nflIqv0JFApH+CoWcPLGnJuC4zLr+3m4zHifVgI53uqCuyHP1tnIxkyjFLecYYgXEum/MPlbZ7RapKUPhwT3TjdNwqNddBHJ6pvauMb64x6E8jylJ/QuZ0quVdutUQU6kmaN/00/Uh14TuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXtYl2uVsBJ8xN0pcq1HIPZNZWrPonlL7J0RHyAqEaM=;
 b=TE5lwM9Amh5PDq1KDu0UkmGONA9doYI4TPmkJKa8WkB5WyvZkSHqdb5Fz1ZIAaSObFbIyicFodkSYh/WraggOO6dVI8nRtfFG828PegKoC1lEPwZR+7w4aHDoh4b4l7iipEffQCr/D0xNUhIeRMVO9HyAQcp52/1s3VkAd58+RQ=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 JH0PR03MB8844.apcprd03.prod.outlook.com (2603:1096:990:a2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Sat, 8 Feb 2025 04:33:28 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 04:33:28 +0000
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
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLiaBeAgFrEMYA=
Date: Sat, 8 Feb 2025 04:33:28 +0000
Message-ID: <8d20ba5443fe0f74798a2a7d81140d3c6462cada.camel@mediatek.com>
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
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|JH0PR03MB8844:EE_
x-ms-office365-filtering-correlation-id: 7c999c32-2792-480d-9588-08dd47f9bc49
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHY4aGc4ZXhycE1ON3ZzMmVmSTBNcnFmNjgxdldKeE1wbFFrNDd3SjZxaVJ2?=
 =?utf-8?B?c2xaRTBnV1pzMXJyYWgxQmt5Q3A4QVV5cUlHTGZrcmJncGJQbmEvWS9HOE42?=
 =?utf-8?B?U2hSeXB4a0grZlFjZVVCaGMvcCtmTkRINTBTUk9leWpjT3ltSmpNOTY3cXJS?=
 =?utf-8?B?NlZEQWtEckhVT0xpRmk2Z0dKeHhBUzhUVGxQMGg1bFJIS2JPbzE4S2RUeGh6?=
 =?utf-8?B?QzErNlVHZUVNWk9ZaXNkWS9NeW5ReXM1Q25IWUxvUUhkSVZBOTM5eHRoZHc5?=
 =?utf-8?B?Tm5rQzFKYlpMdFVDVnR1SVE5cVJYemFMOExqYnE2bkhJd1k0UFdkNTRxU0VI?=
 =?utf-8?B?ZmJ1bTNScHJ0S2ZPZEVzL2p6K0sxNmVYRktNOVpjQUQxQk4ySFQrbWw0aHd2?=
 =?utf-8?B?cklTNzB4RTZuWDZEQUhsZkdYTHlLUUVqUTYvanp0MkUzVVMvcmdaK1YvcW5U?=
 =?utf-8?B?RE9NMG9WQUVOOW1WYzB6MU5RQzl4TzhhYzZqMjU4QWhkVVUyTTJYdlFFR0lV?=
 =?utf-8?B?QlpuLzh1YlVieHlodTZCYktyclkyK0lBTFZrWGhOM282czBLeDZyZzFobHlH?=
 =?utf-8?B?akZWT2dvTEhqcFd1RnRhWDZqU0Fubno2dm5DNnZlbllpSVJ6d0ppQXA3OSt2?=
 =?utf-8?B?WEQ3aGlBZjdDNDNJYzlMTGZDUTA2bXRzdzVaSVNlRjlrWkUyK0tOUERNaUdi?=
 =?utf-8?B?RnRGVkJCOXhHNUtwMmFOM3ZhSXM3cExYbnQwZE9idmNSOFVCMTVJMlhiaytT?=
 =?utf-8?B?dkZESlVqTGNSUkFZbnZLQzkydzVKcUxRNkxyL2gvN0Z4RDcrLzN6bjUrdHBh?=
 =?utf-8?B?ejRBT2h4aVBJcFRIUm5qQ1A3dWhSZ3NlTnZ5d1R6T09ybGpvSFNqRVl4bG5N?=
 =?utf-8?B?QWlrSWdDUDFwVnVqM0FyVG9ER0VnVk9meHdoY1VaN1Uxb3gvcktJd3E3eGZi?=
 =?utf-8?B?Um1kK3BEeU5iSE5TS3phRE1qeDFoaTRvcGxsTTliTEZFRDdDZExKNnpVdXda?=
 =?utf-8?B?NEM1ME94YkUreVkwTmlsNERWOHVFMmxENGtvOFJTQ0xMeWJqSUFnK2ZBQ21o?=
 =?utf-8?B?OFR3dTVOK0VhRVMvclRKR2s0UFZReGdndE9PK3FxK0lrRGdWa25Sc3ZrQW9Q?=
 =?utf-8?B?WnlzS0tvNVVVVXNZTCt0eHhsZnQzZDhxT1RRQkVRRWE3Sy9vT3ZjUkc5U2R0?=
 =?utf-8?B?RU5HdVdUcmpTVXRWcjR4Z2RZY0REbEZQQzE3RGZPSWxYbm9MUHlGdDFnV0dD?=
 =?utf-8?B?bzR4d3pRVUNJcUptcnBHZnBkSmxER2FYZmMxQ3E3VzZWOHFqWFJYUWZTTGtV?=
 =?utf-8?B?aXFGRWdRWmZSbjJGTjVnSTB5a3FZUXFiNmxGUlNUKzM4NHhFZFdZdWd4ZFd4?=
 =?utf-8?B?Q3JWT1N4eFhmdWhaQnhyb0hxZ2VjNC9OZ1Yvb1BVcFlTejQ2T2UrRUdIYVdI?=
 =?utf-8?B?L2daMVhBL0s3bUpoMTdzV3hmOEVKZ3F0QTA1S3BNdytTUjkvQ1o4VFJoZWF2?=
 =?utf-8?B?K3JzYnZlOVljSThIVGR2aGFsc2M4eFQrMGh0cGpLT0tVUVJIVTM2a0xtRkxw?=
 =?utf-8?B?M1JBenhtbW04SXVLcU5QYXhUK05UM2cwbVNXdEFNR2o3U1c4SFNhUzhxRENo?=
 =?utf-8?B?NjNXa1VwUW9uU2MzL2M0UjBGLyt4dlJHRzllMEg0MTFlbTFDdWRwK09yUTYz?=
 =?utf-8?B?KzdFOXQ3SGdSRGFBa3I3OW94K2YvSjNvSFBkT2RaQkRBYkh3THFveXF1MEQv?=
 =?utf-8?B?T2VPRDFua3dSak5tNTFYVnVPZzJCdUx3bHVEamU2ek1ROFhXUVlJOVFzMk5j?=
 =?utf-8?B?cVdTNVR2MEc5UmJTYlBjVWJOM3kxd2xjdlhzN1lkZW9YMUIyclB6WDgycWRE?=
 =?utf-8?B?SVliTzdhQkJwMHpxVG9zbHVDNHdhdERFdU5PZk1JbWhGTlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTNqZW1QeFd0WHFLQ21IQXZPaUhidkVjRmpOamlDekZoS0dIOUc3VWVXNG1v?=
 =?utf-8?B?clpNbFlid2tPYkNJazQvUEpnd2hvUUJtazViSUIrZXdEaGdJTklZUSt2Y3pl?=
 =?utf-8?B?dXh1THpNemFxL05ETW5oaEo1M2xqSGlqSk8yTDVoblJNcXVvS1A0MUlMSmVY?=
 =?utf-8?B?MFFFU1paSEF4REJvSTVDaHJ3cWRDaTJoV3BUQXhJeS9ZanFmWjZWYU9aK1hi?=
 =?utf-8?B?WkZNeThHbEhKUGlzaW01V2l0bW9JZUVsK3IrR0hla3dFNVdKWE1UNUhtNFM0?=
 =?utf-8?B?LzlvVnU2eEMxVXhCemlVT2pPRU9nclpvT1BjckloSEpNRXlOelRBbTBaWHpW?=
 =?utf-8?B?dVJXUjJLcGlUVEpFWUkxTk5pMWNCdGs1eTFZU3VVV05LRGtkdXcrdkt6OU1S?=
 =?utf-8?B?dmR6WExTd2loTnJSQ2dwbEwrem1tTS8wUGdIbFRGWGlSQzBWSjFNaElEbEVX?=
 =?utf-8?B?aVA4ak4waWpEaFFwZzZoNmk0V2oveXRrL0c2VUMzaVdSUmJSVnNVTDJoVlRl?=
 =?utf-8?B?U1BhUVhSNDhVaEdvY2RmV3dCQ01INm5uWkNCZm15SldvUUM0djM1MU9LYkI4?=
 =?utf-8?B?cGo4a1VJRExuK2dEaWxBa1JEck1PRDRENVh1N1p5T1M5Ui9tZU1qclZwV21I?=
 =?utf-8?B?dmx1N3NJNkRLb1doU0xQY0k0cGlhTzBTeEtDWEpOYU9FVFVIb1VvVVVRdFR1?=
 =?utf-8?B?ZkRxRWcwN0t1bTEzQ0hJN2xTNUZ5Rk9FTm9FbzNlVklROU5NcTVsWEZpS0ZT?=
 =?utf-8?B?UWREZHRCeVVYM3BVVnNKNmJtV2xYa2JmbndYWWlRaE11WmlLMXg1aXE2UzQw?=
 =?utf-8?B?VGNHS0gyd3BsbmpGSHBRbXp3cWF0NlZCWGNXS1Rwb2cyWkNNU0NpOTZXOHc4?=
 =?utf-8?B?M1dFV092TndBbTZSUkIxZHQ5ZnZyV2Nrc0pKRlp6OXdIQ2ZiVjR6cWlRWFRD?=
 =?utf-8?B?MUFPN1lCWXo3OTU1Si9aWnpZUENVVWRURnVWOU83M3B1ZlpZTlhOM0l4K0ZO?=
 =?utf-8?B?Y3JVbUdLRUxoK2d1WlkwcjF0NmJPU1pQK1FkM0h6Z0dQaHVDbjRKdU5NdHhT?=
 =?utf-8?B?OXJBNkRveDlkT3N2cU9ORmYrZlBMYWxCVUpEellPZW10SFBHcVhnS0g2TUhj?=
 =?utf-8?B?bFRoWU5Na0ZWaDg0bXo1V1RYd01yUUVvVllUeHFYTXFrNktEZHo1cGJQbHNP?=
 =?utf-8?B?ZlQ3aWRmV1dzRHNQMlBBRDNJZFJGTy96azVMT3hHMS9odmozQVhGN01GMVhu?=
 =?utf-8?B?SGVkcmxOU1lmQTFYRnRScitzb24xQy9KMGFUdkdOQ1FMZDk2d0ZTTzdEdU5B?=
 =?utf-8?B?d3RPdmp3VFlVWWdUZ0ZCVVBJbFZqRGJTbC9IOVRVRjVRUGZmVmtZMnpvQ3FC?=
 =?utf-8?B?N2ptMytQemFXVDJUb2o2WVZJVXdpOG5sSk9mTExUZFpaN3JFNk5EeFFYQXZw?=
 =?utf-8?B?Q2V4N2w1K3E0RXVDSWtUMFZ4OTFzdXNXVlorVkRSa0krcEl0bng4aGZlamZw?=
 =?utf-8?B?TEFVMGlta3NicHFXQjgyaURndTJKN204eGZVbHluY3VkOVl5STNSdnRpWjRP?=
 =?utf-8?B?NURaRXBESFNkMmNpVUNySGpFSzJmVXhzakhaTlpVUjZ3VlFEaHJXRTEzVXRL?=
 =?utf-8?B?NkFyOW5VODZkenZNUmdBbDZQR0pXazA4V3lUbE1CUVJpMjM0MzRLV1oxUkZM?=
 =?utf-8?B?UFZlbWdIMm5CdmZCT0RLR1FyU1B0Y1lLeUFtWEd5TnZ6cUFPMm9NYVQxbHdm?=
 =?utf-8?B?dEpOMjBMMjlaa2lvclk1a2JhaXZvRFpqZFRHQkJTREtaY3gwSUg5VWpDV2dX?=
 =?utf-8?B?ZmxBSWlrNEpMZE1HQkRVQ1RXeFFnaE1Mc3lIcGVzT2ZSUm1MQnVIWnp4cTEw?=
 =?utf-8?B?UTBzaDd5M21aZVhiUGIvR3J6Y2ZXVHB6dzBuOHNFbjBzYWhneUhUK1dUdERi?=
 =?utf-8?B?RjBoSHlIdDk1bnlyM0JYOUUrWXMvK1ZtanFhNFpvbU13QjBPZmhabDhyOU5F?=
 =?utf-8?B?UWVNUkVUVHUxM1paNWlGVG0veHpOZzJXTHlKNTZQSDd6N09icEVsdVk5RjFK?=
 =?utf-8?B?R0tROVVXK1l2blYyMVppQ3Q1ZWhHSDgwaGhjamN5V1BrT21MaU5sa2FNcEgz?=
 =?utf-8?B?U3h0Zkhkeml1Yjc5ZE9nL0U0a0daaUhjc0swS1J5MUJOQkYwcDF1c3Z3Y3Nq?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3708A8985F8236408BB8542A42A9EBDE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c999c32-2792-480d-9588-08dd47f9bc49
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2025 04:33:28.7251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IShSHOCPDxvk7onqnVuWWmhvqVbONA26IMGgUkauiNByqBPjmAuPyqkr8djpAFuhYCpUPQK14s+XlYThXOhEm21253Zij+AtVYDFyl2Z+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8844

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
Q29udHJvbGxlcikNCj4gDQo+IE1lZGlhVGVrIERSQU0gQ29udHJvbGxlciAoRFJBTUMpDQo+IA0K
PiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBDcnlzdGFsIEd1byA8Y3J5c3RhbC5n
dW9AbWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwNCj4gPiArICBUaGUg
RFJBTSBjb250cm9sbGVyIG9mIE1lZGlhVGVrIFNvQyBwcm92aWRlcyBhbiBpbnRlcmZhY2UgdG8N
Cj4gPiArICBnZXQgdGhlIGN1cnJlbnQgZGF0YSByYXRlIG9mIERSQU0uDQo+IA0KPiBObywgdGhl
IERSQU0gQ29udHJvbGxlciBkb2VzIG11Y2ggbW9yZSB0aGFuIGp1c3QgdGhhdC4NCj4gDQo+ID4g
Kw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDog
bWVkaWF0ZWssY29tbW9uLWRyYW1jDQo+IA0KPiBBYnNvbHV0ZWx5IG5vISBDb21wYXRpYmxlcyBh
cmUgcGVyLXNvYy4NCj4gDQo+IG1lZGlhdGVrLG10ODE4Ni1kcmFtYw0KPiBtZWRpYXRlayxtdDgx
ODgtZHJhbWMNCj4gbWVkaWF0ZWssbXQ4MTk1LWRyYW1jDQo+IA0KPiBldGMNCj4gDQo+ID4gKw0K
PiA+ICsgIHJlZzoNCj4gPiArICAgIG1pbkl0ZW1zOiA5DQo+ID4gKyAgICBpdGVtczoNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hBX0JBU0UNCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogRFJBTUNfQU9fQ0hCX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJB
TUNfQU9fQ0hDX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hEX0JB
U0UNCj4gDQo+IEFsbCB0aG9zZSBjaGFubmVscyBhcmUgc2VxdWVudGlhbCBpbiBBTy0+TkFPLCBp
biB0aGUgc2Vuc2UgdGhhdA0KPiBldmVyeSBjaGFubmVsIGlzOg0KPiANCj4gQ0gwICAgICBBTzog
MHgxMDIzMDAwMCAgIGxlbjogMHg0MDAwDQo+IENIMCAgICBOQU86IDB4MTAyMzQwMDAgICBsZW46
IDB4MjAwMA0KPiBDSDAgUEhZX0FPOiAweDEwMjM2MDAwICAgbGVuOiAweDIwMDANCj4gQ0gwIFBI
WV9BTzogMHgxMDIzODAwMCAgIGxlbjogMHgyMDAwDQo+IA0KPiBTbyB0aGUgcmVnIGNhbiBiZSBz
aW1wbGlmaWVkIGFzDQo+IA0KPiBtaW5JdGVtczogNA0KPiBpdGVtczoNCj4gICAgLSBkZXNjcmlw
dGlvbjogRFJBTSBDb250cm9sbGVyIENoYW5uZWwgMA0KPiAgICAtIGRlc2NyaXB0aW9uOiBEUkFN
IENvbnRyb2xsZXIgQ2hhbm5lbCAxDQo+ICAgIC0gZGVzY3JpcHRpb246IERSQU0gQ29udHJvbGxl
ciBDaGFubmVsIDINCj4gICAgLSBkZXNjcmlwdGlvbjogRFJBTSBDb250cm9sbGVyIENoYW5uZWwg
Mw0KPiANCj4gDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IERSQU1DX05BT19DSEFfQkFTRQ0K
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19OQU9fQ0hCX0JBU0UNCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogRFJBTUNfTkFPX0NIQ19CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IERSQU1DX05BT19DSERfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBERFJQSFlf
QU9fQ0hBX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRERSUEhZX0FPX0NIQl9CQVNF
DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9BT19DSENfQkFTRQ0KPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBERFJQSFlfQU9fQ0hEX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogRERSUEhZX05BT19DSEFfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBERFJQ
SFlfTkFPX0NIQl9CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9OQU9fQ0hD
X0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRERSUEhZX05BT19DSERfQkFTRQ0KPiA+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTTEVFUF9CQVNFDQo+IA0KPiBZb3UncmUgbm90IHVzaW5n
IHRoZSBTTEVFUF9CQVNFIGlvc3BhY2UsIGFuZCB0aGF0J3Mgbm90IGV2ZW4gcmVhbGx5DQo+IHNw
ZWNpZmljDQo+IHRvIHRoZSBEUkFNIENvbnRyb2xsZXIuIERyb3AgaXQuDQo+IA0KPiA+ICsNCj4g
PiArICBzdXBwb3J0LWNoLWNudDoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBEb24ndCB0
ZWxsIG1lIHRoYXQgdGhlIERSQU0gQ29udHJvbGxlciBpbiBNZWRpYVRlayBTb0NzIGNhbm5vdCBz
ZWUNCj4gaG93IG1hbnkNCj4gY2hhbm5lbHMgYXJlIGFjdHVhbGx5IG9jY3VwaWVkIGJ5IGEgRFJB
TSBiYW5rLCBiZWNhdXNlIEkgd2lsbCBiZQ0KPiByZWFsbHkgc2tlcHRpY2FsLg0KPiANCj4gWW91
IGNhbiBhdXRvZGV0ZWN0IHRoYXQgaW4gdGhlIGRyaXZlciwgeW91IGRvbid0IG5lZWQgYSBEVCBw
cm9wZXJ0eQ0KPiBmb3IgdGhhdC4NCj4gDQo+ID4gKw0KPiA+ICsgIGZtZXRlci12ZXJzaW9uOg0K
PiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBG
bWV0ZXIgdmVyc2lvbiBmb3IgY2FsY3VsYXRpbmcgZHJhbSBkYXRhIHJhdGUNCj4gDQo+IFRoZSBG
bWV0ZXIgdmVyc2lvbiBpcyBTb0Mtc3BlY2lmaWMsIHlvdSBuZWVkIHBsYXRmb3JtIGRhdGEsIG5v
dCBEVA0KPiBwcm9wZXJ0eS4NCj4gDQo+ID4gKw0KPiA+ICsgIGNyeXN0YWwtZnJlcToNCj4gPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgUmVmZXJl
bmNlIGNsb2NrIHJhdGUgaW4gTUh6DQo+IA0KPiBJcyB0aGlzIGNyeXN0YWwgYW4gZXh0ZXJuYWwg
Y29tcG9uZW50LCBvciBpcyBpdCBpbnRlZ3JhdGVkIGludG8gdGhlDQo+IFNvQz8NCj4gDQo+ID4g
Kw0KPiA+ICsgIHNodS1vZjoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBUaGVyZSdzIG5v
IGRlc2NyaXB0aW9uLCB3aGF0IGlzIHNodS1vZj8NCj4gDQo+ID4gKw0KPiA+ICsgIHBsbC1pZDog
dHJ1ZQ0KPiA+ICsgIHNodS1sdjogdHJ1ZQ0KPiA+ICsgIHNkbXBjdzogdHJ1ZQ0KPiA+ICsgIHBv
c2RpdjogdHJ1ZQ0KPiA+ICsgIGZia3NlbDogdHJ1ZQ0KPiA+ICsgIGRxc29wZW46IHRydWUNCj4g
PiArICBhc3luYy1jYTogdHJ1ZQ0KPiA+ICsgIGRxLXNlci1tb2RlOiB0cnVlDQo+IA0KPiBTYW1l
IGZvciB0aGVzZSBvbmVzLCBwbGVhc2UgZGVzY3JpYmUgdGhlbSAtIGJ1dCB0aGVuIHJlbWVtYmVy
OiBpZg0KPiB0aG9zZSBwYXJhbWV0ZXJzDQo+IGFyZSBib2FyZC1zcGVjaWZpYywgdGhleSBjYW4g
c3RheSBoZXJlLCBvdGhlcndpc2UgdGhvc2UgZ28gaW4NCj4gcGxhdGZvcm0gZGF0YS4NCj4gDQo+
IEJlc2lkZXMsIEkgZG91YnQgdGhhdCB0aG9zZSBhcmUgYm9hcmQgc3BlY2lmaWMuDQo+IA0KPiBS
ZWdhcmRzLA0KPiBBbmdlbG8NCj4gDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQpCYXNlZCBv
biB0aGUgYWJvdmUgc3VnZ2VzdGlvbnMsIEkgaGF2ZSBzaW1wbGlmaWVkIHRoZSBwYXJhbWV0ZXJz
IHRoYXQNCm5lZWQgdG8gYmUgcGFzc2VkIGludG8gdGhlIERUUy4NCi0gT25seSB0aGUgYmFzZSBh
ZGRyZXNzIG5lZWQgdG8gcGFzcyB0aHJvdWdoIHRoZSBEVFM7DQotICJmbWV0ZXIgdmVyc2lvbiIg
aXMgcGxhY2VkIGluIHRoZSBwbGF0Zm9ybSBkYXRhOw0KLSBUaGUgdmFsdWVzIG9mICJwbGwtaWQi
LCAic2h1LWx2Ii4uLiwgY2FuIGJlIGRpcmVjdGx5IHJlYWQgaW4gdGhlDQpkcml2ZXIgdGhyb3Vn
aCBwcmVkZWZpbmVkIHJlZ2lzdGVyIG9mZnNldHMgYW5kIG1hc2tzLg0KDQp2MjogaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMzk2NDIwOQ0KDQpUaGFua3MNCkNyeXN0YWwNCg==
