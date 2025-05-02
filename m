Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420C938DF9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177387; cv=fail; b=q14qsDZmr0vlHbwPYBxhVr6GB9HAoAT2SCwddTr25jz887Q7xSxsp4JigH2mSgR1NRH9tMDjPSq3GQHniisv286CTz/4k8zA8vUxfzNnG3j++v+mtAvNl1O97968raIniH4ozUg10bdaiT3mXtTGAwOtDKt08GDKoAl03+zBTcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177387; c=relaxed/simple;
	bh=5W20X1Bnuhkf4cTkag1YrEKhEHrHz9YEfyjt9Klm/k8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B33f1qSmLxkEBvXCZteNEHNCBheKRwrH37zbrVcVX532UCqpfHrrf8yx1QAqRGkins0Ir8adPqk+9aWt0+NTuKafqe++9bBp6JPfKggEXGmSK6E2s7oEgAptprmBilCtfITOCMXafq20TqXV6pfJrJ9eobCEteMtIOnLAV1DIzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Q60GWC8t; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=unV62aef; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q60GWC8t";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="unV62aef"
X-UUID: 14d51804273611f082f7f7ac98dee637-20250502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5W20X1Bnuhkf4cTkag1YrEKhEHrHz9YEfyjt9Klm/k8=;
	b=Q60GWC8thrwuXo2TGczoNrXbw/yapjS9pVQUHOW7E/yUoDaS+PaxyqJo/4eE5XlDJi3/6fAxrqueTqYvXpOhUn87WtIjnf/3/WVLx3QA+tUvJc+W3AEQmd/QCHKOfTIi92GUlnzWOOizvjIz+o1ff5jtsuGWdDy4YutaZVSNIpE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:303e4717-63dd-4902-bf82-f9765bc9a2c6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fa441b70-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 14d51804273611f082f7f7ac98dee637-20250502
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 413645321; Fri, 02 May 2025 17:16:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 2 May 2025 17:16:06 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 2 May 2025 17:16:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRm6fnXZLM2IhZdGgG6FNQ9P1Wqz16SmZs/6tOFDSaVqHyOKqZozVtANBUV3mE6NRYJ6R6RaCoOy9aorqLQkIAqG9zNxQxghS+lUxSrsJflYR9++InuDszKRVBqyRynmoJRIR/BMOqTBjP1t0PdAgQg+G2d8XaVAZfLdJljVsse0iVNmPLZHXShRWl7b9u2N02FkegPFsuBLjbSbFhUouYD0IWiYtkcSilOIGOv3t2V9m7Qoep2CniIKAVw4LjX/pzvlA35C0iRmwgQ2UDa88MKmhqoV7QkudDqOs+XG1dk0+K94hhR2xBznmQ3FybCZs+GNcRLV3/bZoPYemZpNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5W20X1Bnuhkf4cTkag1YrEKhEHrHz9YEfyjt9Klm/k8=;
 b=qwIEbylE+60RJmTxgX6L5AU8qByeas7Ap2nytcbLRLwMVWj9CWZouAOALURepC48rOuNXxYNKy1I24+dEsNQ3pAMMz82t3HhCFMYNgflLOQFSDyc5y4zSEB2+sCqON19KKAaPs+VfRdIEw5Wodmwzj+PWHwK609ZyHSUeW8dWT3lJho6APwXiTbPAIrAQQAN1hV83volKWAywZufbWWlKscZBpgYiF+NFuSfmoVLr3VbLy8MLrDrvIn4CUPcDc03JhU5iRYv3A5EwVYHJlIm1HANOkFd+BevKEN4eHjgMfphOh8DhCfC2FOZ4+uTdEL77CYW8MA/31yZamGk9GBJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W20X1Bnuhkf4cTkag1YrEKhEHrHz9YEfyjt9Klm/k8=;
 b=unV62aef2Uz/W7plfRBmGFrKRfVqChjxXe8zI0w6ujd1//I6SsbCEUZ3DoVP/fMJ5JhZG1DHjnktBwuNI87XFF2CmdzL0RuzeMhFf2vzZp4822vfKuoydk1fsUdojqqhlt2eSNskqj3ypfQva/5YGK0l4wlDAfvIlkgHKcFJAIM=
Received: from PSAPR03MB5542.apcprd03.prod.outlook.com (2603:1096:301:4e::12)
 by SEYPR03MB8389.apcprd03.prod.outlook.com (2603:1096:101:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Fri, 2 May
 2025 09:16:02 +0000
Received: from PSAPR03MB5542.apcprd03.prod.outlook.com
 ([fe80::a323:3128:209c:f02]) by PSAPR03MB5542.apcprd03.prod.outlook.com
 ([fe80::a323:3128:209c:f02%6]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 09:16:01 +0000
From: =?utf-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
To: "hannes@cmpxchg.org" <hannes@cmpxchg.org>
CC: =?utf-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>,
	"rppt@kernel.org" <rppt@kernel.org>, "nphamcs@gmail.com" <nphamcs@gmail.com>,
	"21cnbao@gmail.com" <21cnbao@gmail.com>,
	=?utf-8?B?SmFtZXMgSHN1ICjlvpDmhbbolrAp?= <James.Hsu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	=?utf-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
	<chinwen.chang@mediatek.com>, =?utf-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?=
	<casper.li@mediatek.com>, "minchan@kernel.org" <minchan@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Thread-Topic: [PATCH] mm: Add Kcompressd for accelerated memory compression
Thread-Index: AQHbuam75fKFDYRy3kqH05cQs0i7u7O90AIAgAFCT4A=
Date: Fri, 2 May 2025 09:16:01 +0000
Message-ID: <bf1db02cc0e7682e8f6eea4d0d61f6f249536163.camel@mediatek.com>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
	 <20250501140226.GE2020@cmpxchg.org>
In-Reply-To: <20250501140226.GE2020@cmpxchg.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5542:EE_|SEYPR03MB8389:EE_
x-ms-office365-filtering-correlation-id: b497a623-6b13-4f50-a4e9-08dd8959f55e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RDA3ZVVqYjd5SlJ1WG9YVnBJY0gvZ1lkc2hCd1FqblE5VThONG81a3RkTkZ3?=
 =?utf-8?B?eXVhS0h3THh0bmFDeTBoOHFyYU9VOEdOcm9WK2dROWMwTWw3R3gySFZ5dWRm?=
 =?utf-8?B?RzkxUU9RY2N0WTZoWDZRZW5OUlhzczIvNHVpVTVlK0IzK2FsbXZFdmF0enc5?=
 =?utf-8?B?N2dxYUFMUjZFRFhyY2EyV1BpWDhsZ0pLTVhweGhuWXovckkyR0NNSEF0VzVC?=
 =?utf-8?B?ZWFaOHVwUlh4MWlRMUZHdU56OFpYczVINU0xQnVmWmFOdXdJaFZYakRWZTVo?=
 =?utf-8?B?REhiaE5wcndOaDRVczBZcG9ZWGloZ25MUTJodFh6cTJrQzk1UEZJRkNKbUcw?=
 =?utf-8?B?QUlLdWJCdTErTU4rVlZYa3pLQThOQUU0d1RuRmVsa1NZOHZINWpPVzFkb09q?=
 =?utf-8?B?UWQ1ZndlNnFPZytIU2VQdzRVZHEyazlSaTV2Ri94YTQ0SGlVak0wS3FFbnBE?=
 =?utf-8?B?LytMRStldlh0TkRtNEl3TWJEaFNPR0Y4Rlc2S2YxSmtaSEgwb0lRdXNjYStO?=
 =?utf-8?B?UXpMRjBsVXgyKzlYcFhZMmtKOE1qam5FRUFDd3dQKzF6WXRsN1VPMk1PYTZY?=
 =?utf-8?B?M3p4VkszcXNBZTVvdzNUMkljeFBJcm9nRENXSW5pNnZSTVZzVDVoTEFWZEth?=
 =?utf-8?B?VnYybXpjV0FjaWdMS29uNnV6RllHeFhPbHc5aitsdnU1K1NuLzJXWXJKZyts?=
 =?utf-8?B?Nk1XTUlWS3JEbUFHQnRabzcyNTJ2Rld3V0ozaGVIc0hhQStkVE1GK3diNExr?=
 =?utf-8?B?QlhueWFsaHpyVlJ6WU1wbTBvamEyR2gwYy93cHg2cG82OU9MWmFvajUwMHR4?=
 =?utf-8?B?TXhJa1dKL3IrM2ovWmxRNDlZZkxQOFdZUCtwbm9XS1VueDgzaHBwbDU1N05p?=
 =?utf-8?B?M3RLaTYvL2xvcnp4aUhLWnhCN2lidkxKTzZZN3JQb2ppUW0zNmxuZG56WXI0?=
 =?utf-8?B?bDNZR0ljOHhEY09zVGhRY1d2cnJkMmxUVHUxQkdXZjFGY3lteFZnMFFQV0hn?=
 =?utf-8?B?ZzdQeUhWTTNaMk9XMm5HTndzalpFenlKTFNFSzRWUzlvcXRzS3hTQ001d3RS?=
 =?utf-8?B?Ny9Md0N2UkVodll0UUZrZzFGOUJTMmRldTdlK1VtRkdYeXcvM2llYW9VSEZn?=
 =?utf-8?B?eU9UNWhVY3RuaE9VL2FkSHovaC9wNURuMkZHOS9qZS95My9OQmxRdVRVTjRX?=
 =?utf-8?B?OHdKSWtmR0d0Q0gyQUhCUFVreGpKQzh4THR6SUFZTXV4dGxmOWMzTFBIdnVn?=
 =?utf-8?B?SHd4R2VCR2hUNmZ0Rjc0UW9BbU5TYjIxaGRHeHh4OERQdGR2ZFcrRTE3N2Fm?=
 =?utf-8?B?d0N6ZDN3c25KVTdoWEZGNzdCUG4zQ3BjVHhZQUpNZkVYU1lJeXZYdmZqUUtw?=
 =?utf-8?B?MUc1dTJUcm1rN0dxVHZWL2Q2VkpWTWJUeEZLdkNKWlJoN1FSOWJza21zTDZv?=
 =?utf-8?B?SkV6cDh3UDF6QWk3ZEo1UGVZcEN4SHBpb3ZQLzVDRm56aUExM0s1a0NWaGt1?=
 =?utf-8?B?VkNoT0JiRjVPREhueSs1cEJCUVRBeVRuZDFOYjIwd0VGRU5pTnlhSVRxbVh5?=
 =?utf-8?B?Q25oUEtvL3RnWHF4aUVmTjMyai94ZlZPOHI4WGZtV0VGYmFTOEZEeWx3N0hV?=
 =?utf-8?B?NTU4WnBNeXNsZEl2N3VRbEZGZmYyQ3JPQVJQUUJtWkdvQ1FacVZLZjFiMnFa?=
 =?utf-8?B?aFBGVG5OeWN4WmJlTzlWSHVmMlZLTFEyQklML2NRSy9OZDZuUGNlUVEvTW5E?=
 =?utf-8?B?ZTd5S3hEVkE2SkxDNitaUVpKOGJqN25DbHNzYXBUemZaS2sza1IyY3BnckJL?=
 =?utf-8?B?S2tkWXBZL29VUm12ZGtzOEcxVUhFYTkrVldXTHhmK0c3THk0eGF6Y2hKWDZE?=
 =?utf-8?B?VXduZC9DNCt1YVVJODBhamd1akNyUkpZbDUyQ2J5Yk9pdVlpVmRvdEFxc2pH?=
 =?utf-8?B?WWJxY1N0TFFUQkQ1c3ZwY05aOW5GZUNHam9iN1VtN3ZMeTUrcGllNVZ5UlJT?=
 =?utf-8?Q?yhXua7EczhcfLqY4W3xY07pS4wpFt8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5542.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjIrLy94VFN0c0xkdTllUm5HdjFJaGFzeGJHcHo3aVVGVk4waVdvY3Z0eTZZ?=
 =?utf-8?B?OVcwMDVXcEMzK2tOS2N3b002bWI2ck14OGtELzJ4OStubFJJNlVjWnhidFo1?=
 =?utf-8?B?S29LRW5YQXp5K2pDajNJQWtnUXc3bk0yTEk3N2QxYjRoemRGeFdKWjNHVWFN?=
 =?utf-8?B?bWNCN0xNVXgzMlRMYzBvRXBscXM0TE5Id2JiL0dueDVWNkJwZVpoQlE1VC83?=
 =?utf-8?B?eXNIaEllaGxCeVV5L1lYUXZvVlFhZmZEek9pelM1aUZ6QjlXL29Gakk4a0JW?=
 =?utf-8?B?dWxLYlgzVERVeFpFYnlvK0p4NEttTWI1YjMrRThrZWU3NkFKWllVNXBWVHZN?=
 =?utf-8?B?bTZoQ0swa0VRaVJvRWhqUGVhYXhKOVI3K296VkdmR0J5YU1EQ2JvWk1DTCt2?=
 =?utf-8?B?VFd3TmlTSU1aM3laNFJHZWZESnJkSWtkTmt1cFNIUnZyZThwSkV1cnd3eitx?=
 =?utf-8?B?V3dpM05uZEdUSEh3bjdTZE8raUlwMDFVNkdWdkVERXRFRnVWalU1QWVMdmdO?=
 =?utf-8?B?Q2xoSU1jczFoSEljY21QaWpna1BOcGo5ZDYxaWFXYmtrcGtrTXcvODZJamVh?=
 =?utf-8?B?UFppeUF5K0pQcDhreWliTHQvV3doalR6RzNnaUJWN0dvcE4zdXFFR3EzV0pT?=
 =?utf-8?B?bFN4STdaUXdjUGIvcmNra2lhTkhLaGlocmE0TmJBcHV5VnhzMEJDdjBMRmZp?=
 =?utf-8?B?eDV2dyt1Z1JoVXpoVU9tSmIzSUdIRnRlMXFML01kWEU5Rk5ud25QV2syRU1B?=
 =?utf-8?B?ZVhZYUV3Z2ljbDhORlBHZUY3aVBFVGd5a2FMb01keVZtZlVzMWpxeUhBOHN6?=
 =?utf-8?B?UEo4UURGTmoxSkFwcWE1TTBWeXRlZm1yNXJBKy9nRHhickZkNmE4bzRwSzVY?=
 =?utf-8?B?RmxZRGxDNTNDM3MzSXozUW5TaHE0RkgzcDJ2YU1PWm9QUmZMeHVtVk9lbnI0?=
 =?utf-8?B?WnFYdUdpSUxqZUZiMWlxcFNVamFCYytwRnltQktGL2JzWGVZN2N1elRya0hr?=
 =?utf-8?B?YVg5RlJhUlpnNjFxZmQ4c3lYWTBDWk9hNHQyYmpneTBwQ0pXR01xZjYxZzZG?=
 =?utf-8?B?UVZrcmhNOFhGR1lZWGk1dTczN0NWcTRXTEFGdUcwUXp1cnI2L2JteWFqbWor?=
 =?utf-8?B?dkFlZS9ZKzlKc0ptV3RRdmVobVViMmd0SlIraXNsaGgxVVdpR20xVHRTVUFW?=
 =?utf-8?B?MUVGakJZRDFiTElSUlp4SEs0aWk1eXZ5ZEdIUVhCQXlkYnB0Ni9VYmd2aEhS?=
 =?utf-8?B?RWJ2a2w5RmNoUXhydFpHamNvUm1QMlVMZ28yUlhCZUNaWmJrbVdrZmsrR0tP?=
 =?utf-8?B?MSt3S0J4cC9CMkI2dW02aUxvOUxiVjVPREF5bDdPTGRONnV1TzRMQzVNcDV5?=
 =?utf-8?B?K1puVmorcEFEejVVWS9GNURYWEFOU3R5cWdHajFscmxQdWVaZzZGaXVLSlU0?=
 =?utf-8?B?VFN1Y0xzUEJBL2RGeFJXN25OcGhPTWo4MlgxQzRWc2E0elJxYUIwdDBtKy93?=
 =?utf-8?B?WlJMNDBwRXkxL3hTcThJdXlVZzJQelEzbk1YUGNTZzJWVkVhZUdLZWwrK1dv?=
 =?utf-8?B?MmYrQ2prVDg4dWVxa05KS2dKQUwrOU9ISjN2djN1UHpyYldrTmRsVFlFOTlh?=
 =?utf-8?B?RExYc3VkdmUyREZYcUFublRISWp0Z3Zxd3c4TFdaaTFDWE1BUTRua0VIVDho?=
 =?utf-8?B?bm9WR0ZNT0ZYcER0dlRHbWNhY091T0NuR1NZZVd0eVB2VEM3dWtvNGJ1d3lu?=
 =?utf-8?B?L0NqWHc1d0xleVhHOTlNekc1YStFK3c0TVRGM2lNVm52dzZCZSsxSWxLZHpu?=
 =?utf-8?B?Y3YwVWV0ZGdtYzNyWDA2SloxMk91L2dGb1BtUFVucFI1N3drejg1L0I4UzBq?=
 =?utf-8?B?MXVvZ0cxQ29DVGZGSWZ6azBtR3hMSW9tdkF2Nmdaa2tZYkN4bm5IR3ZXa21H?=
 =?utf-8?B?VnVpNGdzamNpL0YzeHhvNEVoZElBSURSRVZENmFqYm91MFVBYXhuMEtlSGRW?=
 =?utf-8?B?ZytRM0NPQjFsL0JPNGJmWDRnd3plcGUwbVJaeEdrcWtZRWU2SXoycG9adVRF?=
 =?utf-8?B?dlg3UXBMVC9BV2xvSHJacFRHQVo0bW9mcStRbGRIYXpVcUs5Um5GQ0hBR01S?=
 =?utf-8?B?eVNtcVVjbndrOHFQc1l2OHJ5Zk8yOVZ3Uks2M0Jmb2NNTU5vUlVuMjlhbmRv?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BBCF5732CD12048A827B69D27469D5C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5542.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b497a623-6b13-4f50-a4e9-08dd8959f55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 09:16:01.7605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQPW72d7ssMGmT2zPCStGNaTGmA6eeDyS66xPCSnQvvswyvDtvI1I7SjEsxaWmFHMDB/71KTNHksPTlr3V/KmMWaO2+babAYu8Olu/RHghg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8389

T24gVGh1LCAyMDI1LTA1LTAxIGF0IDEwOjAyIC0wNDAwLCBKb2hhbm5lcyBXZWluZXIgd3JvdGU6
DQoNCg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiBXZWQsIEFwciAzMCwgMjAyNSBhdCAwNDoyNjo0MVBNICsw
ODAwLCBRdW4tV2VpIExpbiB3cm90ZToNCj4gDQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9k
dWNlcyBhIG5ldyBtZWNoYW5pc20gY2FsbGVkIGtjb21wcmVzc2QgdG8NCj4gPiBpbXByb3ZlIHRo
ZSBlZmZpY2llbmN5IG9mIG1lbW9yeSByZWNsYWltaW5nIGluIHRoZSBvcGVyYXRpbmcNCnN5c3Rl
bS4NCj4gPiANCj4gPiBQcm9ibGVtOg0KPiA+IMKgIEluIHRoZSBjdXJyZW50IHN5c3RlbSwgdGhl
IGtzd2FwZCB0aHJlYWQgaXMgcmVzcG9uc2libGUgZm9yIGJvdGgNCnNjYW5uaW5nDQo+ID4gwqAg
dGhlIExSVSBwYWdlcyBhbmQgaGFuZGxpbmcgbWVtb3J5IGNvbXByZXNzaW9uIHRhc2tzIChzdWNo
IGFzDQp0aG9zZQ0KPiA+IMKgIGludm9sdmluZyBaU1dBUC9aUkFNLCBpZiBlbmFibGVkKS4gVGhp
cyBjb21iaW5lZCByZXNwb25zaWJpbGl0eQ0KY2FuIGxlYWQNCj4gPiDCoCB0byBzaWduaWZpY2Fu
dCBwZXJmb3JtYW5jZSBib3R0bGVuZWNrcywgZXNwZWNpYWxseSB1bmRlciBoaWdoDQptZW1vcnkN
Cj4gPiDCoCBwcmVzc3VyZS4gVGhlIGtzd2FwZCB0aHJlYWQgYmVjb21lcyBhIHNpbmdsZSBwb2lu
dCBvZiBjb250ZW50aW9uLA0KY2F1c2luZw0KPiA+IMKgIGRlbGF5cyBpbiBtZW1vcnkgcmVjbGFp
bWluZyBhbmQgb3ZlcmFsbCBzeXN0ZW0gcGVyZm9ybWFuY2UNCmRlZ3JhZGF0aW9uLg0KPiA+IA0K
PiA+IFNvbHV0aW9uOg0KPiA+IMKgIEludHJvZHVjZWQga2NvbXByZXNzZCB0byBoYW5kbGUgYXN5
bmNocm9ub3VzIGNvbXByZXNzaW9uIGR1cmluZw0KbWVtb3J5DQo+ID4gwqAgcmVjbGFpbSwgaW1w
cm92aW5nIGVmZmljaWVuY3kgYnkgb2ZmbG9hZGluZyBjb21wcmVzc2lvbiB0YXNrcw0KZnJvbQ0K
PiA+IMKgIGtzd2FwZC4gVGhpcyBhbGxvd3Mga3N3YXBkIHRvIGZvY3VzIG9uIGl0cyBwcmltYXJ5
IHRhc2sgb2YgcGFnZQ0KcmVjbGFpbQ0KPiA+IMKgIHdpdGhvdXQgYmVpbmcgYnVyZGVuZWQgYnkg
dGhlIGFkZGl0aW9uYWwgb3ZlcmhlYWQgb2YgY29tcHJlc3Npb24uDQo+ID4gDQo+ID4gSW4gb3Vy
IGhhbmRoZWxkIGRldmljZXMsIHdlIGZvdW5kIHRoYXQgYXBwbHlpbmcgdGhpcyBtZWNoYW5pc20N
CnVuZGVyIGhpZ2gNCj4gPiBtZW1vcnkgcHJlc3N1cmUgc2NlbmFyaW9zIGNhbiBpbmNyZWFzZSB0
aGUgcmF0ZSBvZiBwZ3N0ZWFsX2Fub24gcGVyDQpzZWNvbmQNCj4gPiBieSBvdmVyIDI2MCUgY29t
cGFyZWQgdG8gdGhlIHNpdHVhdGlvbiB3aXRoIG9ubHkga3N3YXBkLg0KQWRkaXRpb25hbGx5LCB3
ZQ0KPiA+IG9ic2VydmVkIGEgcmVkdWN0aW9uIG9mIG92ZXIgNTAlIGluIHBhZ2UgYWxsb2NhdGlv
biBzdGFsbA0Kb2NjdXJyZW5jZXMsDQo+ID4gZnVydGhlciBkZW1vbnN0cmF0aW5nIHRoZSBlZmZl
Y3RpdmVuZXNzIG9mIGtjb21wcmVzc2QgaW4NCmFsbGV2aWF0aW5nIG1lbW9yeQ0KPiA+IHByZXNz
dXJlIGFuZCBpbXByb3Zpbmcgc3lzdGVtIHJlc3BvbnNpdmVuZXNzLg0KPiANCj4gDQo+IFllcywg
SSB0aGluayBwYXJhbGxlbGl6aW5nIHRoaXMgd29yayBtYWtlcyBhIGxvdCBvZiBzZW5zZS4NCj4g
DQo+IA0KPiA+IENvLWRldmVsb3BlZC1ieTogQmFycnkgU29uZw0KPFsyMWNuYmFvQGdtYWlsLmNv
bV0obWFpbHRvOjIxY25iYW9AZ21haWwuY29tKT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJyeSBT
b25nDQo8WzIxY25iYW9AZ21haWwuY29tXShtYWlsdG86MjFjbmJhb0BnbWFpbC5jb20pPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFF1bi1XZWkgTGluDQo8W3F1bi13ZWkubGluQG1lZGlhdGVrLmNvbV0o
bWFpbHRvOnF1bi13ZWkubGluQG1lZGlhdGVrLmNvbSk+DQo+ID4gUmVmZXJlbmNlOiBSZTogW1BB
VENIIDAvMl0gSW1wcm92ZSBacmFtIGJ5IHNlcGFyYXRpbmcgY29tcHJlc3Npb24NCmNvbnRleHQg
ZnJvbSBrc3dhcGQgLSBCYXJyeSBTb25nDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqANCltodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMzEzMDkzMDA1LjEzOTk4LTEtMjFjbmJhb0Bn
bWFpbC5jb20vXShodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMzEzMDkzMDA1LjEz
OTk4LTEtMjFjbmJhb0BnbWFpbC5jb20vKQ0KPiA+IC0tLQ0KPiA+IMKgaW5jbHVkZS9saW51eC9t
bXpvbmUuaCB8wqAgNiArKysrDQo+ID4gwqBtbS9tbV9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMSArDQo+ID4gwqBtbS9wYWdlX2lvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDcxDQor
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoG1tL3N3YXAu
aMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKysNCj4gPiDCoG1tL3Ztc2Nhbi5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDI1ICsrKysrKysrKysrKysrKw0KPiA+IMKgNSBmaWxl
cyBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L21tem9uZS5oIGIvaW5jbHVkZS9saW51eC9tbXpvbmUuaA0KPiA+IGluZGV4IDZj
Y2VjMWJmMjg5Ni4uOTNjOTE5NWE1NGFlIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvbGludXgv
bW16b25lLmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L21tem9uZS5oDQo+ID4gQEAgLTIzLDYg
KzIzLDcgQEANCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9wYWdlLWZsYWdzLmg+DQo+ID4gwqAjaW5j
bHVkZSA8bGludXgvbG9jYWxfbG9jay5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3pzd2FwLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZmlmby5oPg0KPiA+IMKgI2luY2x1ZGUgPGFzbS9wYWdl
Lmg+DQo+ID4gDQo+ID4gwqAvKiBGcmVlIG1lbW9yeSBtYW5hZ2VtZW50IC0gem9uZWQgYnVkZHkg
YWxsb2NhdG9yLsKgICovDQo+ID4gQEAgLTEzOTgsNiArMTM5OSwxMSBAQCB0eXBlZGVmIHN0cnVj
dCBwZ2xpc3RfZGF0YSB7DQo+ID4gDQo+ID4gwqDCoMKgwqDCoCBpbnQga3N3YXBkX2ZhaWx1cmVz
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogTnVtYmVyIG9mICdyZWNsYWltZWQgPT0gMCcNCnJ1
bnMgKi8NCj4gPiANCj4gPiArI2RlZmluZSBLQ09NUFJFU1NfRklGT19TSVpFIDI1Ng0KPiA+ICvC
oMKgwqDCoCB3YWl0X3F1ZXVlX2hlYWRfdCBrY29tcHJlc3NkX3dhaXQ7DQo+ID4gK8KgwqDCoMKg
IHN0cnVjdCB0YXNrX3N0cnVjdCAqa2NvbXByZXNzZDsNCj4gPiArwqDCoMKgwqAgc3RydWN0IGtm
aWZvIGtjb21wcmVzc19maWZvOw0KPiANCj4gDQo+IFRoZSB3YXkgeW91IGltcGxlbWVudGVkIHRo
aXMgYWRkcyB0aW1lLWFuZC1zcGFjZSBvdmVyaGVhZCBldmVuIG9uDQo+IHN5c3RlbXMgdGhhdCBk
b24ndCBoYXZlIGFueSBzb3J0IG9mIHN3YXAgY29tcHJlc3Npb24gZW5hYmxlZC4NCj4NCg0KDQpU
byBhZGRyZXNzIHRoZSBvdmVyaGVhZCBjb25jZXJuLCBwZXJoYXBzIHdlIGNhbiBlbWJlZCBvbmx5
IGEgc2luZ2xlDQprY29tcHJlc3NkIHBvaW50ZXIgd2l0aGluIHBnbGlzdF9kYXRhIGFuZCBwZXJm
b3JtIGxhenkgaW5pdGlhbGl6YXRpb24NCm9ubHkgd2hlbiBhIHpyYW0gZGV2aWNlIGlzIGFkZGVk
IG9yIHpzd2FwIGlzIGVuYWJsZWQuDQoNCg0KPiBUaGF0IHNlZW1zIHVubmVjZXNzYXJ5LiBUaGVy
ZSBpcyBhbiBleGlzdGluZyBtZXRob2QgZm9yIGFzeW5jaHJvbm91cw0KPiB3cml0ZWJhY2ssIGFu
ZCBwYWdlb3V0KCkgaXMgbmF0dXJhbGx5IGZ1bGx5IHNldCB1cCB0byBoYW5kbGUgdGhpcy4NCj4g
DQo+IElNTyB0aGUgYmV0dGVyIHdheSB0byBkbyB0aGlzIGlzIHRvIG1ha2UgenN3YXBfc3RvcmUo
KSAoYW5kDQo+IHpyYW1fYmlvX3dyaXRlKCk/KSBhc3luY2hyb25vdXMuIE1ha2UgdGhvc2UgZnVu
Y3Rpb25zIHF1ZXVlIHRoZSB3b3JrDQo+IGFuZCB3YWtlIHRoZSBjb21wcmVzc2lvbiBkYWVtb24s
IGFuZCB0aGVuIGhhdmUgdGhlIGRhZW1vbiBjYWxsDQo+IGZvbGlvX2VuZF93cml0ZWJhY2soKSAv
IGJpb19lbmRpbygpIHdoZW4gaXQncyBkb25lIHdpdGggaXQuDQoNCg0KDQpQZXJoYXBzIHdlIGNv
dWxkIGFkZCBhbiBlbnF1ZXVlL3dha2UtdXBrY29tcHJlc3NkIGludGVyZmFjZSBhbmQgY2FsbCBp
dA0Kd2l0aGluIHpzd2FwX3N0b3JlKCkgYW5kIHpyYW1fYmlvX3dyaXRlKCkuIFRoaXMgd291bGQg
bGV2ZXJhZ2UgdGhlDQpleGlzdGluZyBvYmpfY2dyb3VwX21heV96c3dhcCgpIGNoZWNrIGluIHpz
d2FwX3N0b3JlKCksIGl0IHNvbHZlZCB0aGUNCnByb2JsZW0gdGhhdCB6c3dhcCBpcyByZS1jb21w
cmVzc2VkIHRvbyBzb29uLiBhcyBtZW50aW9uZWQgYnkgTmhhdC4NCg0KSW4gb3V0bGluZToNCg0K
MS4gUGVyLW5vZGUgcG9pbnRlciBpbiBwZ2xpc3RfZGF0YTogIA0KDQogICB0eXBlZGVmIHN0cnVj
dCBwZ2xpc3RfZGF0YSB7ICANCiAgIC4uLiAgDQogICBzdHJ1Y3Qga2NvbXByZXNzZF9ub2RlICpr
Y29tcHJlc3NkOyAgDQogICAuLi4gIA0KICAgfQ0KDQoyLiBHbG9iYWwgcmVnaXN0ZXIvdW5yZWdp
c3RlciBob29rczogIA0KDQogICBrY29tcHJlc3NkX3JlZ2lzdGVyX2JhY2tlbmQoKTogUmVnaXN0
ZXIgYSBuZXcgYmFja2VuZCAoenJhbS96c3dhcCkuDQogICBJbml0aWFsaXplIHRoZSBrY29tcHJl
c3NkIHN0cnVjdHVyZSBhbmQga2ZpZm8gaWYgdGhpcyBpcyB0aGUgZmlyc3QgDQogICBjYWxsLg0K
ICAgDQogICBrY29tcHJlc3NkX3VucmVnaXN0ZXJfYmFja2VuZCgpOiBVbnJlZ2lzdGVyIGEgYmFj
a2VuZCAoenJhbS96c3dhcCkuDQogICBVc2UgYSBwZXItbm9kZSByZWZjb3VudCBhbmQgYml0bWFw
IHRvIHRyYWNrIGhvdyBtYW55enN3YXAvenJhbSAgIA0KICAgaW5zdGFuY2VzIGFyZSBhY3RpdmUu
IElmIHRoZSBsYXN0IGJhY2tlbmQgaXMgdW5yZWdpc3RlcmVkLCBmcmVlICAgDQogICB0aGUga2Nv
bXByZXNzZCByZXNvdXJjZXMuDQoNCj4gPiBBIG5ldCBsb3NzIGlzIHBvc3NpYmxlLCBidXQga3N3
YXBkIGNhbiBzb21ldGltZXMgZW50ZXIgc2xlZXANCj4gPiBjb250ZXh0cywNCj4gPiBhbGxvd2lu
ZyB0aGUgcGFyYWxsZWwga2NvbXByZXNzZCB0aHJlYWQgdG8gY29udGludWUgY29tcHJlc3Npb24u
DQo+ID4gVGhpcyBjb3VsZCBhY3R1YWxseSBiZSBhIHdpbi4gQnV0IEkgYWdyZWUgdGhhdCBhZGRp
dGlvbmFsIHRlc3RpbmcNCm9uDQo+ID4gc2luZ2xlLUNQVSBtYWNoaW5lcyBtYXkgYmUgbmVjZXNz
YXJ5Lg0KPiANCj4gSXQgY291bGQgYmUgZGlzYWJsZWQgYnkgdGhlIGZvbGxvd2luZyBpZiB3ZSBk
aXNjb3ZlciBhbnkgcmVncmVzc2lvbg0KPiBvbg0KPiBzaW5nbGUtQ1BVIG1hY2hpbmVzPw0KPiAN
Cj4gaWYgKG51bV9vbmxpbmVfY3B1cygpID09IDEpDQo+ICAgICAgcmV0dXJuIGZhbHNlOw0KPg0K
DQogICBXZSBjYW4gYWRkIHRoaXMgY2hlY2sgaW4gdGhlIHJlZ2lzdGVyL3VucmVnaXN0ZXIgZnVu
Y3Rpb24uDQoNCjMuIEVucXVldWUgQVBJOiAgDQoNCiAgIGtjb21wcmVzc2RfZW5xdWV1ZV9mb2xp
byhmb2xpbykgL2tjb21wcmVzc2RfZW5xdWV1ZV9iaW8oYmlvKTogUHVzaCBhDQogICBqb2IgdG8g
dGhlIGtjb21wcmVzc2TigJlzIEZJRk8gYW5kIHdha2UgdXAgdGhlIGtjb21wcmVzc2QgZGFlbW9u
Lg0KDQpXaXRoIHRoaXMgYXBwcm9hY2gsIHRoZXJlIGlzIHplcm8gcnVudGltZSBjb3N0IG9uIG5v
ZGVzIHdoZW4gbm8gYmFja2VuZA0KaXMgYWN0aXZlIGFuZCBvbmx5IG9uZSBhbGxvY2F0aW9uIHBl
ciBub2RlLg0KDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayEgIA0KUGxlYXNlIGxldCBt
ZSBrbm93IHdoYXQgeW91IHRoaW5rLg0KDQpCZXN0IFJlZ2FyZHMsICANClF1bi13ZWkNCg0KDQoN
Cg==
