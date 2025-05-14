Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144917A31F;
	Wed, 14 May 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239948; cv=fail; b=ZO/FAmDCUzgdMdbojsfgw3bFGOc4yClSE7z/1Y6CUkh/Siho5YJwKqlHf3ua1byodbdW+E7kI2R/4NrlDfjVFgmPPv2TmoV992NTLRibOtFAs2rDGFqnonMpCZy5+6KRd5oYxGAhcDJjz8mZwPD+NdNrWf1XHG9474lBmt4KtSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239948; c=relaxed/simple;
	bh=x4JnHd+agUzlJ6EApimSNAW6ZYkLPQsNHM5fGpQAPzc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jOdZhdhCQqjiEIBQMz9SZehAr5vGd0u3jjRrboe8M8+6L32MhyKO02W5j7inpDR5azBxT4nCfvG/zYnqGMgI0xa0tbiLr/pO0jotBrNg65E8H4yqg8B9frPbhQLktToDJlBFN3UkFyEeLW0ra+wj/zbf7M1chH5D0HEKC6eJodg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=icgu31xu; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tZG9BRQD; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="icgu31xu";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tZG9BRQD"
X-UUID: 0fbf229830e011f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=x4JnHd+agUzlJ6EApimSNAW6ZYkLPQsNHM5fGpQAPzc=;
	b=icgu31xutWiVPpCUXoH5vaTiXb515/PZThonegL2eSERiLW5xGQt1iXjlVVtMGaSCoP9QalKxHibFIpVSQow35dwATA+WI7qAS0U6S1a3RobXFXrnSjhzmEkkP+bRWUVUlgcdSYznEyoLbdrjTQrKE1tT/NwVSOCzN341ajdQfw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:581d8f09-bfbe-4558-aeed-c5e85fb48a2c,IP:0,UR
	L:12,TC:0,Content:8,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:0ef645f,CLOUDID:d11aba97-7410-4084-8094-24619d975b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:4|51,EDM:-3,IP:nil,URL:99|11|97|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0fbf229830e011f082f7f7ac98dee637-20250515
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 397123270; Thu, 15 May 2025 00:25:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 00:25:33 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 00:25:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmp8HTmEj0eV1uH/GIxCqndHNahyiK7sqKCVs5kg45pJo65+6PQVmurGU1JRgnF2VtwA8kyFyR9VbOz270Q04bspWESJnV3e3TxgImN9xk/uB8hubCvLF5fYGCyAaKjUbaFvtaK+RiIZPYGkjW70oKsfAsUiDub3KXlrmDYkORU/igF1LOu/6a7i3T4hU9CsHF2bMKEIWJOBi6uKL9lgFqvmo+YTIyNX+X0rAryONnPQu7+x8AJi9UnjiTjeajWgM3wdk34waEVAZzoPcmJGsjQVj+vG6SZBU5JPPrxg3u8cFaCjZYeqSJFc0C6KVDumUYMGLaQ3oaZ1c8WQi0PZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4JnHd+agUzlJ6EApimSNAW6ZYkLPQsNHM5fGpQAPzc=;
 b=p/lBkTjVpR+27RAxc+WqoqOwULJ3rEGO6nQCDkIl3gmhIxwaXxPU2+pO2ytEhpSDrPpxLdDoZeT9EqSGDbQFcTQr4hqUBHrV+SOa4r+gYLnsIPKxk4dymv1qkDocG0tVIqwaM0gpYTIb8+IbEQTFGdGLbtvkiBerW2tWrvrivX5gTUh3qol1SvP9G4q+65JRkkM6MXf2Z9KO+8jqxYCIvs3JY34WmebsaMSZJdnIB7RhdmdZhFu+U694TMdejb2vkhvkDMSsuv2qZNGcgRCSXDHVbKCC1Ex8uXhUp3MKvenyigQZqSdb81W/USYUiTBCB5WA7bozDTTfuNUqFtLJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4JnHd+agUzlJ6EApimSNAW6ZYkLPQsNHM5fGpQAPzc=;
 b=tZG9BRQDFpvN4bXT69jixy+lLmA5FQ+/B+1CmOz0qlWfXwB696dcb2Qlp/+mkauxKt5TxuL7mixuuRJj1Yyy8pLc34nqCFjMTVyjjmEuUW3f6rUrFciWRxDRra+S4muRDK78kMTU0vhNfKMF4jYPOK73EJKeFcTKa/udpIyG3qI=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 JH0PR03MB7546.apcprd03.prod.outlook.com (2603:1096:990:a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Wed, 14 May 2025 16:25:30 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 16:25:30 +0000
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
Subject: Re: [PATCH v2 03/15] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Topic: [PATCH v2 03/15] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Index: AQHbmkStXREKccV+fESCzIy6aJS/x7OBmRaAgFEL/AA=
Date: Wed, 14 May 2025 16:25:30 +0000
Message-ID: <4051e2b2249625f0e957352a4a2dfe2cf50818a4.camel@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
	 <20250321093435.94835-4-paul-pl.chen@mediatek.com>
	 <990774c68015d73fee297d12992d7c3e6421cc71.camel@mediatek.com>
In-Reply-To: <990774c68015d73fee297d12992d7c3e6421cc71.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|JH0PR03MB7546:EE_
x-ms-office365-filtering-correlation-id: 516af145-847c-4e0c-7e60-08dd9303f193
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aEl1ZE1scStEc1RaSTFZUTh4aHFMVmx0eUVCY3hSRG10emxjZCs4Z0JOa2I1?=
 =?utf-8?B?UVBJeEtYMGlkTGZLK2RYVTNDYUFvV0dqU0dEOVhvVGZoaUxwd2gvYXYvR2VK?=
 =?utf-8?B?ckFDY09FcGRpYUU2UkpTa2Erd3BpYWlyWVhJNDd0WStrUWozZ3pCcW5SMkp1?=
 =?utf-8?B?SW9ITW5lUEtWbEYxUDdQVk5BQ21ZM1BCRVc5ZXViWUtZOTF2V1l2WGZzOU1l?=
 =?utf-8?B?SDhqdVFKaDF4RVVQRVBpeXM5Z3RPeVVNZjBWaEtkSGFwSmRUakhVTzh1OFNt?=
 =?utf-8?B?OWl3NEJHbzMyRkJPamNlZGZyVkgrYy8rWk1wYXVXRGxqdllvWFAwcGErWDBL?=
 =?utf-8?B?VFZZKzJ1bVZJQmt0dXU4ekU1em85aEZBVTJlZzU5ZExtRmlaaTBNdGF5Tmtp?=
 =?utf-8?B?enUwL3VSemhZU2lwRWQ2K25YblY0R0k0dDdGTGdURzFKMDk0ZHVzZlJQL0tz?=
 =?utf-8?B?QjRjbjFYOFJnRVZMMlI3cnJRSTRQSlRvVEFHdzZ0Zm9oSFgwbU9hWUxoV3Vk?=
 =?utf-8?B?OTFzS21XK1h3YkpLTzUwQzNhQWJYRDV2dktrd0JuSDEvdTM1UThhaENhVm1J?=
 =?utf-8?B?eEM1VzU3ZmEwQnppUGdRY1V4VWcvVmxKaTRiN3VYV2pHTHJZVFYzNjZuRC90?=
 =?utf-8?B?U0x5NTFyRkRrOENlYVB2UGZoTW54MkR4YTVkUHJ6bE1EUWtpc0t5dVJaWERq?=
 =?utf-8?B?d2M3UkVyRStyekpBREpHczZqdWZoUHplMUVIdUZ6ZE9VYXFsWEVpYkNRS2ZW?=
 =?utf-8?B?Um5ZVE5WZlAydWMrelg2ZUhiVkV0VkpOUEwxWU5yQkcwV0lZMUZ0V2F2UE5W?=
 =?utf-8?B?ZnpQVmE1ZXFQcGRGSUdlUmFTcmkza0ZMejlLTmQ1M25OdklFaW1PVzZSOVdO?=
 =?utf-8?B?M25YWWJZTXBpK1V5WmtaeFIxMFVEdG5qWmR3T0RIK1NmSmQyNkRnWkI0Y1BU?=
 =?utf-8?B?Nm9SYjZSV3JqWSt6M3UvY3g2eUh1MDIrcTFMUytZMkVBTWdSS1F3NzhyMEtW?=
 =?utf-8?B?eEN1anA1eVh4dnZXNlFBVHhVTzR1dDVIY3I5L2ZHRHhPeDlFUXpYQ3ZnTTEz?=
 =?utf-8?B?YzRUcElxVkRZMVV6YlJCOHZNSUhNNU5VQTZjRnllU1MxZlp6ZlJRREFSWC9y?=
 =?utf-8?B?UjBrSE1ERnBkSjZSM3FERW5QNHBXWkVuSjNSdlJ0STlqbEYzOFpFQ0dTZmJV?=
 =?utf-8?B?YzlIT3Z5TXUrTnh6K0Vmak96UG5HN21hU2hrbmJ3bHVTa3hncFVZckRLYjZv?=
 =?utf-8?B?T3YwOWxNcHFSeUF2aTNTcFRHeit5VzlHRTNGNC96WUpNOWc3a050aGI0M2VJ?=
 =?utf-8?B?bXM0UWc1UWY3UDR5cUV6U1BkMU9nNFFVdkNRTmFlZUkzU2FwUitDTmZ4ZDdF?=
 =?utf-8?B?Q3JyMGlGNCtaY2lhOTVSdmdhaG4rZVI4bWt5N3BpdjZTSXlFSFJMZGR0eTRB?=
 =?utf-8?B?US9GeDcvYzlCcVRTMytJZlprZzZJYTcvSzltVjdKb3JGdVpsdFhxaUw4WlJR?=
 =?utf-8?B?eEpaRldnaTVpODdNVWJOSVI4RUU3ZFlPZWI1aE9oQ2xHNG10M3FMd0tTOWdp?=
 =?utf-8?B?SWhlMCtWVmNod0ZhUGpmMFc2Zy9CWG9YUHVGRE56TDFNc0x4R2VCT20ycTJE?=
 =?utf-8?B?OFA4RXIrU1BDdnUrR2NUY016RWg2NjBXdTI1WS8wYTVQTWZqdy9vbDhIZGI3?=
 =?utf-8?B?RGFQU3hISnVCNVBMYWM0Q0hwRlFNNlBDVDFPN0c5dHdUdFY2UW5uYk9DZFRX?=
 =?utf-8?B?MmR0Y1Y1OUlhaThQOUYyWjV3dnFlT2c1UUpobUJRYU5VRHNXSVF2MGJTanBY?=
 =?utf-8?B?R24wNnNUcCtrVmplSTZJaWc1eDIwN0QzNG4vUDNKeTFleVVhMkVCSVM2bHZX?=
 =?utf-8?B?SjVtSmlRZjhPWWZaeXJIOVVlUW9hVFR4REV6MnVkWmsvWHhqY3N2WllTMW1i?=
 =?utf-8?Q?MMcUrvLH3OPTRn4ad84r/lTPhSmGR6/N?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUR6SE5sSTJ3VldJbDNVeTluZmNZbkJQeDRRUk1hY3ZGdGtlVUpCMEsrdE5m?=
 =?utf-8?B?dU03NmlYbklSbW9tWG42blR4SEE2d3gxcmJZUlRqZEV2aCtUZVNUalM4d3dO?=
 =?utf-8?B?M2d5SUIwYjV1NmRUSG95djA4STJ4ZWVZU21COWN2Qkc3VW1ZallWbDRyb1M1?=
 =?utf-8?B?d3RKeWxDSFN1b3RGRkFQZGdTYllJK3RIY1psMkNQZFNROHcwR3VNMmI1Rmtn?=
 =?utf-8?B?TzZCWkJncTZVL25Ra1FXNEcvdzNaazZQMGNDTkxZM2RobVBZU0hzWDl6MW92?=
 =?utf-8?B?MFJmWHlDK1hsVUtUVWlUYUU5b2VQaTh5eDNBVEx3c0tLK1RzTVFHZlJjRkNn?=
 =?utf-8?B?cTEwQ3RRQ29ncldyMW1LYU1HZ1Q3N0J1NWRRYTA0MUV3VU9xMkZ3K3AvVTRw?=
 =?utf-8?B?RVMrVzhxZEc3Z29pNnFoTnVwMXBhNzRhY1VXTnErRHlvY3FZR0NmdWd4R3lG?=
 =?utf-8?B?Y1FxUEFRUUNBZERvSEhmU1RNTytZNkV6VVd6S1pRbVo5aTU1aThlS2YzYzBX?=
 =?utf-8?B?RU5RNTFXNzl0R0dWMGlzSndXRFF5OTZNTTJiVHhRL0toUzdZejNnUlBZZ25l?=
 =?utf-8?B?dDRsSzY2SlEza1BRWEg0ME8xdUNXcEFCaGhDaWd1NzFUWkxmTDBqZDl0VGZW?=
 =?utf-8?B?dWR2Ykdjb0xFTHBZZlpRaDZKT2d4RGxrUFA1T3o4WlR6azVZd2NNajd3T0Jm?=
 =?utf-8?B?QjlHTEplZ2RpSWFMV0ZCcktQbUE3NFJuZDAwNnV6YWJaOXFhN0tXcGEvYUE1?=
 =?utf-8?B?MmhOeXNLdmdCMktaQ1VHTWFNYkljZFkvM1M5anRycjZuWjhZTWxvQ0liQXBZ?=
 =?utf-8?B?bFVKenpBVmtSblk2UXJCT3ZMZ1Yza3ZJVnc2NmY3cWVhNlFDTG5KSjJiREQ3?=
 =?utf-8?B?WUlNTks2WnBjVXJBWE1reEVyeC9BN1FjSysxQmQzRDV6MUx3QTlxZG5XMGxN?=
 =?utf-8?B?Z3EybUJVN1c0eUszaGZwaFR2ZTgxZzJKZGdZQ1BQVzZFZWlXR25UU0g0WWZ1?=
 =?utf-8?B?NkFtVkRDT3YzSHlDZkowMDZORVBvbWx0K3E2K25tVk1ub3diWlFXSEtOTlpo?=
 =?utf-8?B?VlFQaWlPTE5LRndieVFRaXdqQlBkYWRlVnVYdExUS0FjREk5cXdKaWJIVGJL?=
 =?utf-8?B?TUxJdERReXFTQlgxcFZSeS81SXc0M3BQU3FrQnpma1Bsb2hOTEZzUDA5ekE4?=
 =?utf-8?B?RElpTmZRODBzWURNb3B4Z3pLN1hsMGErV2szQ2JYSU1LMmZkc0FmWGpoR3V3?=
 =?utf-8?B?alVtSGl4bDk0TmJqV0R3RzhON2NVRUoxYzQ4aDlDUkVOSFVpZk5rSWYvMmZE?=
 =?utf-8?B?UXhJRlB5d0lKblVIeC9TY1R2VFhQemN0VmpWbzM2NHhZdnZrNXJxbkxqOUFj?=
 =?utf-8?B?bmYvYTNhakdVWHRneUtCeklqbHUvZXVuT2pKMGtQRW0zRXo5cVU1cURCZ0dN?=
 =?utf-8?B?UFNMK3A4RklJNkNOaDYrNzVCakFVdm5yTER0Q0lmWjdpSStMbG5jY0RiRTFr?=
 =?utf-8?B?MzZOT0l5eG5OeEFlSVdDS1lRL29mMVdGbVVFa3V0dHFwRWd1ei9yRkFhWktD?=
 =?utf-8?B?TEtaZ1E4M3ZydjE2MXdORVpOTno4elR1Wk8yOXZMMzNXZkI5b293UU5MQm1o?=
 =?utf-8?B?RExVTTloUUE1YklOV0U4K3pFUVhZVWpCQzNqOHFqbU9RYktQMEV2MDBUZnE2?=
 =?utf-8?B?RStCTVhTdmg2bmxQZm9rRGo2TEFuY2JEYTN2bzlDNDJuSjEyeXVEc3RuVGRH?=
 =?utf-8?B?SndkQUE5cFVuL1V0YUFpVCtDZTI5dHVpWEJtWlFJS25wYlZXVlRrN1FyeWF4?=
 =?utf-8?B?QSsyNHVCYU9IMUdhTU40ZlYvaVhhc1ZaeXFwQmhMUnc2WTRjOUJiUmFmWTF1?=
 =?utf-8?B?S1FjbFJ3aTYvQytURU5TYWZyN1dRMEhDZEdOT083ZlVtUnNtdUY4ZnpaQVBP?=
 =?utf-8?B?Mkd1NzhLLzZSL3dMd1l2ckRtRmgxOWtrWHZnOElIVVNWdzRENTNwTVNYS0Vn?=
 =?utf-8?B?akp4WGhnMFNBbU81YmJXbzNSR3V5aTMzbnFTTzFjaVJDTDd2NkQ1Mm1nczli?=
 =?utf-8?B?WGFNM2dnWjg3UzBSMmRzSy83Y2h0S2JEeDduZE93SzVCMk5OejN3OE1kbXZ5?=
 =?utf-8?B?UmtrS09hQVdTU0JIbDQ0bFc5TndXazA3N3Nha2U4Q09XYkh3bEpZQXNHa1lK?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <187904DCCFFD894EBC08063BC903B7BB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516af145-847c-4e0c-7e60-08dd9303f193
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 16:25:30.3348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cBvfM2DFj0lVx7l4xSTvlxvcW06mY4TfBRfta1sA2zNNpWZPXY9mNECUmZ8Aurn7zetGJA29nzXpJnnv5QeaqSyqkB3LMpVSbKM1vpx4Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7546

T24gTW9uLCAyMDI1LTAzLTI0IGF0IDAyOjQ1ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gRnJpLCAyMDI1LTAzLTIxIGF0IDE3OjMzICswODAwLCBwYXVsLXBsLmNoZW4gd3Jv
dGU6DQo+ID4gRnJvbTogUGF1bC1wbCBDaGVuIDxwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tPg0K
PiA+IA0KPiA+IEFkZCBtZWRpYXRlayxleGRtYS55YW1sIHRvIHN1cHBvcnQgRVhETUEgZm9yIE1U
ODE5Ni4NCj4gPiBUaGUgTWVkaWFUZWsgZGlzcGxheSBvdmVybGFwIGV4dGVuZGVkIERNQSBlbmdp
bmUsIG5hbWVseQ0KPiA+IE9WTF9FWERNQSBvciBFWERNQSwgcHJpbWFyaWx5IGZ1bmN0aW9ucyBh
cyBhIERNQSBlbmdpbmUNCj4gPiBmb3IgcmVhZGluZyBkYXRhIGZyb20gRFJBTSB3aXRoIHZhcmlv
dXMgRFJBTSBmb290cHJpbnRzDQo+ID4gYW5kIGRhdGEgZm9ybWF0cy4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsLXBsIENoZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4g
LS0tDQo+ID4gwqAuLi4vYmluZGluZ3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWzCoMKgwqDCoMKg
wqDCoMKgwqAgfCA3MA0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCA3MCBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWwNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kbWEvbWVkaWF0ZWssZXhkbWEueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5kZTdmODI4M2JiNDgNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9tZWRp
YXRlayxleGRtYS55YW1sDQo+ID4gQEAgLTAsMCArMSw3MCBAQA0KPiA+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwg
MS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2RtYS9tZWRpYXRlayxleGRtYS55YW1sKl9f
O0l3ISFDVFJOS0E5d01nMEFSYnchakhfLTJJOE5rVFVYOTB2YlpHamR1VUFvNG9uOERzQ0dGVHJW
WDVqVWR4TF96cEt0NVBTUFJHbTMxb3RQWjR3SUR6STJoOUhGR2JGNERDNWpQdzFuZWpvJA0KPiA+
IMKgDQo+ID4gKyRzY2hlbWE6DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01n
MEFSYnchakhfLTJJOE5rVFVYOTB2YlpHamR1VUFvNG9uOERzQ0dGVHJWWDVqVWR4TF96cEt0NVBT
UFJHbTMxb3RQWjR3SUR6STJoOUhGR2JGNERDNWpyMWp4Sm9RJA0KPiA+IMKgDQo+ID4gKw0KPiA+
ICt0aXRsZTogTWVkaWFUZWsgZGlzcGxheSBvdmVybGFwIGV4dGVuZGVkIERNQSBlbmdpbmUNCj4g
PiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICvCoCAtIENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPg0KPiA+ICvCoCAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArwqAgVGhlIE1lZGlhVGVr
IGRpc3BsYXkgb3ZlcmxhcCBleHRlbmRlZCBETUEgZW5naW5lLCBuYW1lbHkNCj4gPiBPVkxfRVhE
TUEgb3IgRVhETUEsDQo+ID4gK8KgIHByaW1hcmlseSBmdW5jdGlvbnMgYXMgYSBETUEgZW5naW5l
IGZvciByZWFkaW5nIGRhdGEgZnJvbSBEUkFNDQo+ID4gd2l0aCB2YXJpb3VzDQo+ID4gK8KgIERS
QU0gZm9vdHByaW50cyBhbmQgZGF0YSBmb3JtYXRzLiBGb3IgaW5wdXQgc291cmNlcyBpbiBjZXJ0
YWluDQo+ID4gY29sb3IgZm9ybWF0cw0KPiA+ICvCoCBhbmQgY29sb3IgZG9tYWlucywgT1ZMX0VY
RE1BIGFsc28gaW5jbHVkZXMgYSBjb2xvciB0cmFuc2Zlcg0KPiA+IGZ1bmN0aW9uDQo+ID4gK8Kg
IHRvIHByb2Nlc3MgcGl4ZWxzIGludG8gYSBjb25zaXN0ZW50IGNvbG9yIGRvbWFpbi4NCj4gPiAr
DQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gK8KgIGNvbXBhdGlibGU6DQo+ID4gK8KgwqDCoCBjb25z
dDogbWVkaWF0ZWssbXQ4MTk2LWV4ZG1hDQo+ID4gKw0KPiA+ICvCoCByZWc6DQo+ID4gK8KgwqDC
oCBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArwqAgY2xvY2tzOg0KPiA+ICvCoMKgwqAgbWF4SXRl
bXM6IDENCj4gPiArDQo+ID4gK8KgIHBvd2VyLWRvbWFpbnM6DQo+ID4gK8KgwqDCoCBtYXhJdGVt
czogMQ0KPiA+ICsNCj4gPiArwqAgbWVkaWF0ZWssbGFyYjoNCj4gPiArwqDCoMKgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4gPiArwqDCoMKgIGRlc2Ny
aXB0aW9uOiB8DQo+ID4gK8KgwqDCoMKgwqAgQSBwaGFuZGxlIHRvIHRoZSBsb2NhbCBhcmJpdGVy
cyBub2RlIGluIHRoZSBjdXJyZW50IFNvQ3MuDQo+ID4gK8KgwqDCoMKgwqAgUmVmZXIgdG8gYmlu
ZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL21lZGlhdGVrLHNtaS1sYXJiLnlhbWwuDQo+ID4gKw0K
PiA+ICvCoCBpb21tdXM6DQo+ID4gK8KgwqDCoCBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArwqAg
JyNkbWEtY2VsbHMnOg0KPiA+ICvCoMKgwqAgY29uc3Q6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVk
Og0KPiA+ICvCoCAtIGNvbXBhdGlibGUNCj4gPiArwqAgLSByZWcNCj4gPiArwqAgLSBjbG9ja3MN
Cj4gPiArwqAgLSBwb3dlci1kb21haW5zDQo+ID4gK8KgIC0gbWVkaWF0ZWssbGFyYg0KPiA+ICsN
Cj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoN
Cj4gPiArwqAgLSB8DQo+ID4gKw0KPiA+ICvCoMKgwqAgc29jIHsNCj4gPiArwqDCoMKgwqDCoMKg
wqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxz
ID0gPDI+Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgZGlzcF9vdmwwX2V4ZG1hMjogZG1h
LWNvbnRyb2xsZXJAMzI4NTAwMDAgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2LWV4ZG1hIjsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MCAweDMyODUwMDAwIDAgMHgxMDAwPjsNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjbG9ja3MgPSA8Jm92bHN5c19jb25maWdfY2xrIDEzPjsNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZoZnJwc3lzIDEyPjsNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtZWRpYXRlayxsYXJiID0gPCZzbWlfbGFyYjA+Ow0KPiANCj4gbGFy
YiBpcyBjb250cm9sbGVkIGJ5IGlvbW11LCBhbmQgZXhkbWEgaGFzIGFscmVhZHkgcG9pbnQgdG8g
aW9tbXUuDQo+IE9WTCBhbHNvIG5vdCBwb2ludCB0byBsYXJiLCBzbyBpdCdzIG5vdCBuZWNlc3Nh
cnkgdG8gcG9pbnQgdG8gbGFyYg0KPiBoZXJlLg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+
IA0KPiANClRoaXMgaXMgZm9yIHRoZSBkZXZpY2UtbGluay4NCg0KQmVzdCwgUGF1bA0KPiANCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpb21tdXMgPSA8Jm1tX3NtbXUgMTQ0PjsNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjZG1hLWNlbGxzID0gPDE+Ow0KPiA+ICvCoMKgwqDCoMKg
wqDCoCB9Ow0KPiA+ICvCoMKgwqAgfTsNCj4gDQoNCg==
