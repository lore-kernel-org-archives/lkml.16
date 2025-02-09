Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39D17BA3;
	Sun,  9 Feb 2025 03:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739072064; cv=fail; b=LJ3nt/7VdAYeQspsaaVYvUtn1QUYkDjDWceJfT+VWwk8KIVeWQdUJkqzkPmHAAhLuMc+3bvbIkcJYJ7LSFLKQUReSO1W53NCD9WiamQPlngE6YKedBYjnBsdWJ63p6OWrGIg8+NRyaW1pYrmSm2t1vuYfEjzwjTs83OCotdM9lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739072064; c=relaxed/simple;
	bh=MiR9mZdH8wLZfDTmbxLFNLaOl0tIk37tnv4Ux2n/hE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P3sQH19/pDBZxNl4LPV/beek/nSUYwLYLvHnVqmHpXCdb0ip2S4krv2Hd1QqHxZuK8DybZ0RKuCVeyEg8uAQYXBWX4yzljt9DTaKw1Ch4om01fzyfXrZzMkPRjY9BNJ7Srv1/22pHWklCZaSWzS86cRMAMKqQCA1TJ90ECm2+NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=e33scqd7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=nOZZ3Zd/; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e33scqd7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nOZZ3Zd/"
X-UUID: bc81803ce69611efbd192953cf12861f-20250209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MiR9mZdH8wLZfDTmbxLFNLaOl0tIk37tnv4Ux2n/hE4=;
	b=e33scqd7rOzr5/CvejGSFwn1LxWzIcQsJiWc8fLkLRuDtIMJGQbEgzutaRm1qsocxOiiRADgAKRs4oIpL6Pw7rUNthHR82Zc+Nu8B4wVTODIk7AJ91YWt9S1IVG8wo0X2CoLREeUNmlmjeZikeyADsvgtK7v1+WYXhtJFPZchMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:7b9ab9cd-265e-489e-931c-69e225f96d29,IP:0,U
	RL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:60aa074,CLOUDID:85df497f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: bc81803ce69611efbd192953cf12861f-20250209
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1702939221; Sun, 09 Feb 2025 11:34:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 9 Feb 2025 11:34:14 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sun, 9 Feb 2025 11:34:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ey8kKCUJMfY5BkW1SYK5YRvzNf5s6ptqIVcnQhaQz4DPp4CYNRgJS7UkMP4W0jjmrfORJ7rs9LDwihcgmTwl0TgbtlbVU/Wgd9EYNCrhMrjogrPx7+47ZfUpry9vdwsC1UOgXzRgeaD5T8PnGexzqRE6CG2QLFoCNU8U9hf4QtkXTuZ0JOWJsUa6GbQRQHDYN/6DP6xkL8MSB9QnPYSeYT7Wr3Pf9AhAx+hVQVDE3f/s1XGg8v/Us7HBlEcqXNzJJcVBBTWxVY2GKMx2WxDCBB7J1lFy8YvNXEXHIhizPoWAyNDZELv0Gb8bjBjHUubHyBlZMcNMJWXXZ/GBV9jqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiR9mZdH8wLZfDTmbxLFNLaOl0tIk37tnv4Ux2n/hE4=;
 b=U2MWI97O2GUVvVgMuCFPnab5a2y9wH24R5j8C9ufIvaTtFpxlLqJPP39EyK+Fh0GsN53LGdqgvNqZ3yy96qxysBIXt2yx1G1AVL7Ri1Snx+bFxhMEkDB3r6FaNVMG2t2pWg8cGyebdlLsBItxQbVfG0v4J7bCxGrDCBoyCNVsYZsEN9OPKKQ0fHDXjALVpvqzjPxxw0j+0FKKQ0k4rH0lI8U/zuvgmthTRvmsVWX01fFiEi7ueY5Znv/qdCETGlK+woaU5ajDIpcBK0C4buVvvc7UVM/8dtgYaXiJgI9oO4Npss+oKmNb/YX969+JyniY5chcQX+7C76NQH7mlT9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiR9mZdH8wLZfDTmbxLFNLaOl0tIk37tnv4Ux2n/hE4=;
 b=nOZZ3Zd/L/wOE/ANyb2XvwUjM8hRSvqSk/BXE2tscQCQBWz1Xzw7T9NuQv2enb8DLZh9AFxuGPyH02Ch1lhpfct5azzYeDX4qNFHfqbPyAcv1L/4mx7hC1IxB0rKpocurqkdeojIVyCd1ikfB/+WdRIs3aZM7W7ikit9VRYIEiY=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by TYZPR03MB6647.apcprd03.prod.outlook.com (2603:1096:400:1f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sun, 9 Feb
 2025 03:34:12 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%7]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 03:34:12 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property
 to set disconnect threshold
Thread-Topic: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add
 property to set disconnect threshold
Thread-Index: AQHbZDNc/4kk1BQehk+0OCcaCvG0gbMVChuAgCl0dYA=
Date: Sun, 9 Feb 2025 03:34:12 +0000
Message-ID: <e61b61574bd58c1bbc0648257fb4ab23ed582de0.camel@mediatek.com>
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
	 <20250113-aerobics-tall-e570d8bbcf2c@spud>
In-Reply-To: <20250113-aerobics-tall-e570d8bbcf2c@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|TYZPR03MB6647:EE_
x-ms-office365-filtering-correlation-id: 1673a83d-ae36-47c0-a31f-08dd48ba9eea
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TGxGaWNlb21JYVBWSk4vRnFVWkgyM0ttL2hmR2dsQzQzdWs3Uk9RL0ZIVm5n?=
 =?utf-8?B?TUhxNWQ3bkFYME9COXNaRkdLQVpRM3ZoU3FHa3VBUkw2MjduU2tuWEhETjl5?=
 =?utf-8?B?blI3MUxocFJzeng3NTYzcDZ5VTNYU2Y2VTZKS1Rsdmw3V2FLbm43RFVoY2Mz?=
 =?utf-8?B?OCtnNjMyTy85blROazRERzFhd25zVUZxWUZ2OFAyNkFuS0N0MC8yU1FvV2Fr?=
 =?utf-8?B?ZGo4bzNzcVdFTkdCNHNyVGtEcFhiWmFZL2R6UTlVVVNOWXRHeVZyUzRCUlRN?=
 =?utf-8?B?SXpoOUFTeG1UaDJDbzJwakFxT0pwckxPamsvVmUxZU9mZGRSeVhsRC93ZHRF?=
 =?utf-8?B?OVlLMU9TaXpYWUlmWE1tS0VHc0k0bklrSDUyb0dlZXpTb3JZYW1sSjZLeFlu?=
 =?utf-8?B?NS9NQzV5SlNCMmRqdDIxS3BUQVh4Q0pTekprVmpBQVgvcktNRHpBTmhXaEFt?=
 =?utf-8?B?aHF0TkFSOElsOEJic2RzRVlETkhpMXRXYWg3U3hHQjBYcjd0bUt2Z2cvUGQx?=
 =?utf-8?B?NTNBQWNjT1h1Z0tkOVR5TXRONzRxTnJ4UktucVpqMS9GbXc0TkowQXpIbStw?=
 =?utf-8?B?MVo4bStiNExjUzRaNVdkKzNidjROais2M1dGY3huY3g4Tkgra3JzbDIvYlZa?=
 =?utf-8?B?MUlKeUdxNXpDa3RLZEliVXJETG42cHJlVHJETEJUYyttRkdkYTZzMzRlQkth?=
 =?utf-8?B?eDJhU244U2VVdTJScVB3alQ2YjV6UUFsdWdkdzJLYWtFS1hoTkFqVXlpWnA4?=
 =?utf-8?B?YVR4M2lib1JRamVITTBMZHFRR21YNlhSZzdKR2xRMDQzeDNNM1NIU0hWQ3RS?=
 =?utf-8?B?QlB4NGNBVkphdWJwM3laMjh0andGaWxEa016emFpZTJXMkVlWG5aOGY3V3ZS?=
 =?utf-8?B?aHpPY1F1eXZKMS9zNDB0bkI4THdZb0lLREtOMlRnbGx6bW9DVExzTDgyUU1m?=
 =?utf-8?B?VnRORlVvYnBxclpCcHU2ZjU2TGVQRUlCR3JwenE4QnQxckthbm5WK0FkbWVv?=
 =?utf-8?B?S0VaaG9ZdmhWWlZCck90RnRqTkRlQ3VhMFRrVmIvcTdwR25zODBwNysxcEVi?=
 =?utf-8?B?aWllb1E0MUZhSkRkYVlxbyt0NDJjMXpqZkNqYklib2tVMjNBYzhqOWxQeWd0?=
 =?utf-8?B?ZitnT0hBQWhUUUxUTXZHbHNCYS9IL0cwc01WSGpKQ0oxUCtZV2xMYTFYWXcr?=
 =?utf-8?B?NkVFSHE0UmkrWUFhdWJJTHFFSXQxa2xPUC90K2RhL0JJTEVWRFJSY2dDeEEz?=
 =?utf-8?B?KytWSmd6TkJDL2JIZDUyMGI0VjArZVM4UW9yd0FBeVNITnMzaWhjZGNBdm1o?=
 =?utf-8?B?TDV6OVNFU3MyazliaVFDdE4xZlRhVFUwbmp1L2N6eTJTWm1wTHFhUEEyelEv?=
 =?utf-8?B?RWkvcHdKdFdPVzVobFl0RkV4SEtMMGhXRlhjclFIVllaU1gxYlhRQmkrajcy?=
 =?utf-8?B?bEIrSXhMbnJqMi9oendSelQyLzNpRWpTRGVlUWdYRDZFekhwOHYwN1ZRZmdp?=
 =?utf-8?B?bWhxdFJQRGR1eUhDZ29haG1HS1p2VTNyNml4c2QxeHE2ZkNkMG1VZVFkQnNV?=
 =?utf-8?B?UFVlS2VOVUFSc2lZWGoxNTAvY3J1dW5iYXY3MXRIWC9LaVU3THorRVpnL2pQ?=
 =?utf-8?B?aVVkcmdqV3pSVnB3Nzc0YVpGUDd2VWJXWWRBTHJnODBBMHBoWFIwVy96UjBV?=
 =?utf-8?B?cHIxNlcxWldJOGpWRGJPWm40TmExZVp4R3JXVXpZViszSkVCNU5DdjZsSzhL?=
 =?utf-8?B?RDhaWm1QM25GT3VFNGZlbEJZbmY0UjdMRmVoV24rY0lLNmFGZGYybXVRK01z?=
 =?utf-8?B?LzVOMTdVeU9PYnU5bXBYOGdOdjROWCtVQmRaLzRkQlRDcVRoK3p2cUdPc2dQ?=
 =?utf-8?B?KzRRWHpFVlBKcHlrS1Ixcm9yaTRFYk0xRmhDRy9YZ0REL1ZnV0JqQnZYbmhO?=
 =?utf-8?Q?RulNV7pePYHwNcdhZArHYQwYSH/Kiyzr?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDhVdk1KR3BRZEh3dGRzVWRtR01YNkErb1pVcXY0dGN4cXZJRWJFbHZ6bDNa?=
 =?utf-8?B?RUpSdUtZR21tMnNyUEJnWGoyUm9VaVJqVExVWGNuTjF6MTJPbFdOZWRYQzZw?=
 =?utf-8?B?bDVxOW9GSUNBbnRaTkRZbDgxcDNCS2kzL2F2OUkyb2VaaTZnUG9qZ2VLRnd5?=
 =?utf-8?B?aU04VW1YVE96dlVTTDJrNjN5SGU2REgrWEtoZ2xRZWpLOWtGZ1FGR2JGS2pX?=
 =?utf-8?B?TXJPM1F6eWpSKzJDRG1jWEdtWEIrWkhLZjVQUFNnUTBKdWg0UWhNWGE0c0Jz?=
 =?utf-8?B?bC9Ka1VLeGZ5M3IvM2dxeW01YnA0SFc1TUlGR000TmlmZ1pvaUNNcEVPWVlt?=
 =?utf-8?B?cnNoakhjMVltc1psNTdVUU8vMnhDU2NCdVhCVXFFUVlKdXBsWFpxenNWRnpk?=
 =?utf-8?B?b2kvdlRIUitPSGFMZkh2bWw5UUlmbjk5NDV2T3JjN3J5cFkvQ0RpVVI3TE0w?=
 =?utf-8?B?dzc5N1gzbDZJV3ZEVW1oTnl3MG1WakFSMk9QMlNHNjNHcXNQcTZ4SmNPNWlJ?=
 =?utf-8?B?VCtWaEgwSVhRM0ZoS1haV3Z0dkhKNDBkUUMvaWdtU2pUaG1GTXlWczF1WGhB?=
 =?utf-8?B?LzJ3VzFGbmZBWCtsNlNOUTRBWjFlWXhUdGhma1A0TVErU2VkQjl6RTlYTlIw?=
 =?utf-8?B?dXVTeHVkRytvSWErUHkwYkFZdjNnZFREMndQdVJWY2VZV3BaK08rODNmODF1?=
 =?utf-8?B?NUYwREpPM3lVS0R5b0xESmllVGtEWjZUTVZqSVhSVFJ2M2Q3eFpsS29pMjlJ?=
 =?utf-8?B?WXJ6RTFWcVowNThLTWV3Yng2cHFNWVgzazhZa2VmeU5nVmJCWEdXUjltbU9S?=
 =?utf-8?B?MGFNOGlsNU0yWU8zcDl6QTdla1l0SHMyWjJ0c2IzcWsydVh3dThZZmVkUys1?=
 =?utf-8?B?cHFJZGpZYUlocFZOSnphM0JxZ2c3dUhhTGZsZHZrTlVZUGY3aEpJTFpOQU9i?=
 =?utf-8?B?QmxjeWlINUo3blBvcDlFdXV3anhaZ1o3TGRydVF3SDNNV1hwbUFPM1A2UVQ1?=
 =?utf-8?B?ODNkVlhsUXJwWE5WZkpmWmpTOVFyUEs3WFd6SEdEWWM2ZWdibE1TZ0l2NHds?=
 =?utf-8?B?cGdlNkJHaVhZd29lenRkaVR5RjdVdGwzcG45blNhbm9BUHFJMDBHem9hcGZC?=
 =?utf-8?B?Q0tFMmNYUFE5ZVZxL0ZvVEcxNDNac3Jxb1lWYVV4aHBMSkxXbDQwVFk4TDdq?=
 =?utf-8?B?R3lpN2IzbU9HTFF6K21yOHpud3ZHTTZENjl1VDZxODVXNjhWWVdKdUtqT1ht?=
 =?utf-8?B?RTFqMkdEbHdoOGg1MmdyTXhCRWR1SG9kVlZlbjZ6Zk4xUGJaaFZNYm5wT3BU?=
 =?utf-8?B?UW53SXVzb0dmUFluRysyUHdJUTNRUFNrSTdiRWlIWlVGMVMxamgvNk04TGFR?=
 =?utf-8?B?VWJrV3NjUFRlV3NISzNGMHFaa0RiaCtLMDBEbno3ckVISkp4Q3lrU0ViTlIz?=
 =?utf-8?B?dG5TU2RJVHFOQlpOZ0VKdFZGMzFoMENkaVZzN2s5TnF4SDRvMnQyaTZXbm5X?=
 =?utf-8?B?dGFxeXNwSzJod0F5VGxobkVMZjJwdFZhaHA3aUlEeVdFK3FINUN1Zm83V0lw?=
 =?utf-8?B?RldMTlk5c3E1TUtURnRCS2hHNlVScWI2dHY3blhnai9hZUF2S3M0ZHZucFll?=
 =?utf-8?B?SXN3NlBmVTg1YTBSOVl4OWtteHRwVlByYnpZTUlKcnRjQUYrVmU3b0RCcmpX?=
 =?utf-8?B?aEI5T1RSUi9meDFQMGtZZ1JTN0RPSDQzTHpMejVCczR3U0ZReno1VFZtRVM2?=
 =?utf-8?B?b3FTLzl2SlhvTDNPbGJYMi9FSElwdU85ZmIza2VrS0hGaUNpUFlvVU1hUGpB?=
 =?utf-8?B?eVh2cnMvQ2sraUF6djIrM1Z2d1FBdFQ4UG9idW1acUNRaEtlYTJ0Z0hScGgy?=
 =?utf-8?B?cTEyWml6SE8vM0N0clcvalcvWXhNUEVmTzM1TEFjZ09OTy9sN0pLTjlvWnRM?=
 =?utf-8?B?NkFCYzA4OGJIdXIvbGptQ09rZ2VpMmRHMnZLNHpiai9TdVRxS0g3eEx4NTlU?=
 =?utf-8?B?ZW9hNnY3cnAxZ1FCOXFtUFhVRWhWaGlVa0ZZZmFEdDdveGVOeGJmdVIvdlNJ?=
 =?utf-8?B?N3RXaGZQaTNEVDFnbDZ3QWloWnZDb3FqZmh0TnlmcjZQY3JtZ0dkTzRiTnM0?=
 =?utf-8?B?VmVhNWE4TDhaUFJLM0I4T2NSYjlSbkF1c3lZeTgxaU1pSEpDYlNmVHc3NStR?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF88A0D89C499841B179ED9BE84D96DC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1673a83d-ae36-47c0-a31f-08dd48ba9eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2025 03:34:12.3273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYeohLYUo3NIHZ8Rs/iVsbBdYsCETFCwFuyrIFTOm5IuBnRlDMm1Vo4y4VBhVudhz2QiB+5CVFEiEl2bK8+Q+VEt5Arx/4DLMEcJDBFf7CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6647
X-MTK: N

T24gTW9uLCAyMDI1LTAxLTEzIGF0IDE4OjMwICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFNhdCwgSmFuIDExLCAyMDI1IGF0IDEwOjE1OjQxUE0gKzA4MDAsIENodW5mZW5nIFl1biB3
cm90ZToNCj4gPiBBZGQgYSBwcm9wZXJ0eSB0byB0dW5lIHVzYjIgcGh5J3MgZGlzY29ubmVjdCB0
aHJlc2hvbGQuDQo+ID4gQW5kIGFkZCBhIGNvbXBhdGlibGUgZm9yIG10ODE5Ni4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gYmFzZWQgb24ga2VybmVsIDYuMTMtcmMxDQo+ID4gDQo+ID4gdGhpcyBw
cm9wZXJ0eSBpcyBwb3J0aW5nIGZyb20gdC1waHkgZHJpdmVyLCBkdWUgdG8gdGhlIHUyIHBoeSBh
cmUNCj4gPiBzaW1pbGFyLg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwgfCA4DQo+ID4gKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHku
eWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRl
ayx4c3BoeS55YW1sDQo+ID4gaW5kZXggYTllMzEzOWZkNDIxLi4yZTAxMmQ1ZTFkYTEgMTAwNjQ0
DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRl
ayx4c3BoeS55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS9tZWRpYXRlayx4c3BoeS55YW1sDQo+ID4gQEAgLTQ5LDYgKzQ5LDcgQEAgcHJvcGVydGll
czoNCj4gPiAgICAgICAgLSBlbnVtOg0KPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDM2MTEt
eHNwaHkNCj4gPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQzNjEyLXhzcGh5DQo+ID4gKyAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5Ni14c3BoeQ0KPiA+ICAgICAgICAtIGNvbnN0OiBtZWRpYXRl
ayx4c3BoeQ0KPiA+ICANCj4gPiAgICByZWc6DQo+ID4gQEAgLTEyOSw2ICsxMzAsMTMgQEAgcGF0
dGVyblByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgbWluaW11bTogMQ0KPiA+ICAgICAgICAgIG1h
eGltdW06IDcNCj4gPiAgDQo+ID4gKyAgICAgIG1lZGlhdGVrLGRpc2N0aDoNCj4gPiArICAgICAg
ICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgICAgIFRoZSBzZWxlY3Rpb24gb2YgZGlzY29ubmVj
dCB0aHJlc2hvbGQgKFUyIHBoeSkNCj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgICAgICBtaW5pbXVtOiAxDQo+ID4gKyAg
ICAgICAgbWF4aW11bTogMTUNCj4gDQo+IFdoYXQgdW5pdCBpcyB0aGlzPyBVbml0bGVzcz8gSG93
IGFyZSB0aGUgdmFsdWVzIGRldGVybWluZWQ/DQpObyB1bml0LCBpdCdzIGEgbGV2ZWwsIG1heSBi
ZSB0cmVhdCBpdCBhcyBhbiBpbmRleCB0byBzZWxlY3QgZGlmZmVyZW50DQp0aHJlc2hvbGQuDQoN
ClRoYW5rcw0KPiANCj4gPiArDQo+ID4gICAgICAgIG1lZGlhdGVrLGVmdXNlLWludHI6DQo+ID4g
ICAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gICAgICAgICAgICBUaGUgc2VsZWN0aW9uIG9mIElu
dGVybmFsIFJlc2lzdG9yIChVMi9VMyBwaHkpDQo+ID4gLS0gDQo+ID4gMi40Ni4wDQo+ID4gDQo=
