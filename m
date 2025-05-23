Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E92DCC18;
	Fri, 23 May 2025 02:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747968946; cv=fail; b=sNRPo9wquMsZPVmjHdy+3GBP8zTCAaS8lJhKatjl2M6UDYepjtCr/uK4vD8Ztffa0zyvbfDI+iW45Ll7ZfLgog1rXFDNvDGIeD2lM2LPY+FrV4OTHyhTousJZwdw4pxHFjo3IThBxqdEus9LwAr8k+1XwZU0Q4e6fXFUXBBAthQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747968946; c=relaxed/simple;
	bh=a4dibPfWiBNUSSIWVim3AHWgoWlXOrlXGGpX9qnKd98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RAhLE9atGe9tlqENV8uHJM7Lkdo/DTIRKqVAPqM9y/4ZlGHw+EGvhYwGJS1XoliLxLCYbibVkdC8x3oot8xpU4xqS1KU08vgoDIm+yZnCr49+oeLb6UkyTJ+XsESPiTuba1DjOomMgUsHT5sxnNDKg6gy0F/OyEl/GhBtbwLYE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qsncPp6s; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=byUE4hhV; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qsncPp6s";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="byUE4hhV"
X-UUID: 630c5dce378111f082f7f7ac98dee637-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=a4dibPfWiBNUSSIWVim3AHWgoWlXOrlXGGpX9qnKd98=;
	b=qsncPp6s1rRJihRxIjxFo5SvHtvxjJu4wvXNhP6Ok7BBd3u+FFCCtQWGA7V9z1VjpaoB7ypjMmY5sPx6o+kfi8MVyPyNn4J6jEfJ4pg0Po0xTWZPpzjiYFSgoupTqN/L0LdY5c7p6KYs//i1ylAxQhTWwWylWVO4bmzbPiO9Rto=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ab264a9e-f911-4c86-a87a-085ac8a423d4,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:7efce157-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|11|97|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 630c5dce378111f082f7f7ac98dee637-20250523
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 405536978; Fri, 23 May 2025 10:55:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 10:55:27 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 10:55:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBn+AImhtIsWaMnRAGmS7qXt8EQ6WWZeLj1b+NS/2+Q5PEEVKYmq9F/8fbUw3TlEL2uaeABoA8RHm0b0zgOUQDWChwYjnC3UP6DqH/6ESzkqHbPxP7Sfyxr9HeQiJWHTKfXUwrg2OVRJ16lXPhIGqQIxIj+5q9nhiRXLQr4O3w4RYiMeqV+IImgrM84kojUUXFrvdGD7/QlsLpV0qyD7BlG0qrN1WFSjx8yzQr8YY5zgJoTU9wBbRea8Mnjog3qaLZ4svDD3i62Jp4C467mkCAgS9cfddXqSGR1xD2ap710eGDWXRcTEfuNQ74WHVM5GWT5VMcHBDG8l7C08jyZvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4dibPfWiBNUSSIWVim3AHWgoWlXOrlXGGpX9qnKd98=;
 b=UIN8fkoIFp1o+CW0rkYsFnuYbOQW3pQpaoON77kkTwOJIZ+JCXGur5iWeBogfgteTB7YZzQlF0vgkvqXI4Xu7m6M186YOwMjoCdd4jjVzabGD/RliDCei5g0wXM9SqyTx3MW6OGqJolTPDGw/NfQyXCkJbQJMYZcCcNN6/Iq4eyV173MLZCSWnl1jhku3GsmAoEYGbI9e7VLg+2Dn3nGErz6Qajoex/jGrF/CTW05TuGkh+H02zRFHLkLI/nQyowNMQ00t/hV0HYnn7KGlIoRqoOal6vMjhxto+C2WErXuyi0cNh7oxvOxkf0GoR+GwoIgpQ9dSqwmdDMQMLUYEI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4dibPfWiBNUSSIWVim3AHWgoWlXOrlXGGpX9qnKd98=;
 b=byUE4hhV4GiCGTFu71SuJgN7HQ3e1WTz+0an6Y0bKm+gID2gQx5Yno2gt7QA28fal8iDAFOKsF33KkrrmrF9ox9M+z4wAqtLlmoK7u8BIc3ORxVVLLLIseF15JdDK9ygMFXrdRtul6IlToHkN5OWVL4AwG6brqZuVG8LPQp1nII=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KU2PPF9D6AFF433.apcprd03.prod.outlook.com (2603:1096:d18::41c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 02:55:25 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 02:55:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
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
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
Thread-Topic: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
Thread-Index: AQHbyy/XhwEoa98C3ESnGkjdlfg3IrPfheIA
Date: Fri, 23 May 2025 02:55:24 +0000
Message-ID: <caab284a85ad5906d1d2befd6a3bd2ef77301758.camel@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
	 <20250522150426.3418225-2-nancy.lin@mediatek.com>
In-Reply-To: <20250522150426.3418225-2-nancy.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KU2PPF9D6AFF433:EE_
x-ms-office365-filtering-correlation-id: 4eb1c070-7cee-4211-dfae-08dd99a5441f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UzBqSzhsdnJxN2dIRUNlY3RkVHFnTHdKR2EvUHpGaTZDcTF4TzVsRk5Tbnpr?=
 =?utf-8?B?RHd3SnFxYjJ5cVlKSGVnY2dGRkJrY0p2NmF3Nk9rSHdXTVI2S09UWFJrM1Mr?=
 =?utf-8?B?T3dVTXY4WElPNEF5WHZUU1h6YnNPL1BWNUJqelgvUHB4SU9HM0lLa0IzdXpZ?=
 =?utf-8?B?eXNxRjNaWW1IYnEyNHdRUkI1anF3ZGxjS290YW9ocGFsZlJENG9LR0xKQUlC?=
 =?utf-8?B?T3hpZmxEcUtqVkRwdW11WjRldzRHcDNxQit4MitjclNTT0xoU21iYlRuQWo5?=
 =?utf-8?B?NUVyQW91REFDOEFWbC91ZnNhNkVVNkdpTTBCTnFCRTFiVWlHdEJiNE5zSElB?=
 =?utf-8?B?VlFuWXF6YmZaVkZIYlBjbC84Qjg5ZE9WU1pvWUN4dkRtWG9BK1p2VE1LWmlW?=
 =?utf-8?B?Vjk0TE5yK2lVUU16Zjd5K2hibTA3Um9pTkFJMjBRYUdqOUJreUFTNnpvRWth?=
 =?utf-8?B?QVRCN2FCNDdicmJYbzRyKzFuZGhNdzFPQ054NW5xVWQzci9nMnZrbHRwUEVz?=
 =?utf-8?B?eWFyUkVJZVBPeGU5SStrQkErcUFqWmFPUEVhbU9xanBPRVV2ZCtPcFAySDdS?=
 =?utf-8?B?RGsvQUVUSkg5TVlNMHpoVjk4SXhDWEl1R05rNXdCZU9pNXhYTEN6UFJtbDRB?=
 =?utf-8?B?T3dtTlpydDROU2ozaVNwMm1pUlIvVkNuUlIxWDRRd2RsanB3V1UxNktseGU4?=
 =?utf-8?B?NGpubTRSZjVBWU0wMy83VEc4TFJjTEhPZ0t6VkZEcVRtQkVacjJqc1FQREZU?=
 =?utf-8?B?ZVNHQUV0N2tjZHdaNEdid1pvSFk4VEJCQUNVZ2ZES2l1YjNYRFRnbzVxbkNZ?=
 =?utf-8?B?dEltYW41SXRWRlBWcXVWdW1JbmpxdExpcUkxSGYzZ3Vhc2hHaWN5T1kvRmlJ?=
 =?utf-8?B?SmwzSU45QW1SRVNRUzAwNnduUTVsUmdhWEZHdWp2dUs1NkdHU2ltOEkvTW1V?=
 =?utf-8?B?YU14MzlBTU8wSm5XbVBIbDIrTGxVSGx5OWsrRjcydi95SDFEMmtvODJ6Zktq?=
 =?utf-8?B?SmJ3Rzc3TU9iVkdMYXMvSjZGMUZ0bktESDQvN3pEVXhHUHJsVC9LRFY4bWxL?=
 =?utf-8?B?c2srbVBoU1ZiL3pMK2krS2lDMGx1M1NrZmJoazBaNThyWG1UZ2VyOVpCa3l0?=
 =?utf-8?B?TFIrWmdmZFhNMndkNU1rTXY5YVU4OXRvdmNyMVJMdjNDYVFseUh3d09vNWNC?=
 =?utf-8?B?WU9xa0syVlNyL2JhTGcxMTN5bTJzdC9aYSttQkxJZ213OGdWWGJoYkhsZTAv?=
 =?utf-8?B?MXAvcFdBSlJ1OHBYWXdVUnIrNXNUYncvZnBJZTBLNnYvdStWTE55dVAyMXI3?=
 =?utf-8?B?NVozd2FDeEptMWRMK3IrVHpxa1IzVG1ocVJhMFJSeFh3bCtwWkNhSnhiaW1s?=
 =?utf-8?B?Unl4YmlkM0gxR3F6MVp1WXEzdUFRQllRYTZTeUZEbW9sWTY0OEhYVlFoWTZV?=
 =?utf-8?B?dGdzSlJ5WjdzVS9qUVRua1ZNelk0Z1RyZGl2elBCVUU5SjFGdER2QXAwTUlX?=
 =?utf-8?B?di9sQXRWaWo0SW82R0JnRE5JUWhhRWJqdUI1R3BUbzBEZ1pwY09VMkNNNmQw?=
 =?utf-8?B?K2l5Vi9TM3BpRUZqWlk2dERNWEtpdWt3UDFxQ3B5ck9sTndwMC9vQ05EaEFu?=
 =?utf-8?B?MWpWdjdXR3Rjd1UyV052SVVuUDFTNkFBM3hhcytCTmxrMWJzUnAzbThsUi9Y?=
 =?utf-8?B?KzRXUjJaUWpXekV4TVViS2tpczBreVpoUUt6VDYwamd0VTZSWlhsR3NOVks0?=
 =?utf-8?B?dlVCVzAyRm5KNjVlaWhnNjQybjE5R0JmVHhqRDJtVGlJNHFlVXVIWVA4TlZq?=
 =?utf-8?B?VzJUZklGcUFkL3IyNjV4K1J4eEI2dEd5SGc3U29nUnNZMm1sdzZjZHhCTWtn?=
 =?utf-8?B?c3hFUHhsRVdpTFlyaUU3SEJJZ2NmY1gyUVdqVGJaOGh4bTZrOHpPWWoxczg5?=
 =?utf-8?Q?UGZMhTGqO5Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFVpY1JEWG9SZjF3dlFLckR6T21IbEUvanR6ZjI1QW1oZW9BU1NzUzdhKzlw?=
 =?utf-8?B?LytSMUtpbUsybnRFNE1VR1hFdVZSYnMvREw5SENyc3VJam0wNjZtTVpvbjlu?=
 =?utf-8?B?VjRKamV6em5RaXNLaEVNMXd3UVdSQUh2ZVNqT2N0V2xHVUJkMnpYMVhQaVFl?=
 =?utf-8?B?azNQaXRHYnpISm1yWmZiUjREeDluYmgrVjhWeEEvM1FwY3JzdXoxUTNwQll0?=
 =?utf-8?B?ei9nWGNTZ2dxdmdsWFZ6LzVJbmlBdCtRTGo3RzRtVHNXelhrQzJaY3hEVXgy?=
 =?utf-8?B?cmRjMm5aZDZtTk1uZjNZM0xwT0h2bkdNOTNySWZrT3lmbUhaeU9RbmV0SDUw?=
 =?utf-8?B?YmNrSzA3YVJqb3RlaUYyQmVjczhwRkRXWUhnbUxRVkNLbTBOTVFSRitobXpG?=
 =?utf-8?B?NUJMWTZVdGZuM1JPWHJ0a1FEbVo1YzI1OVpQZjhFOVQ3YUQzVmYycTVBUTg4?=
 =?utf-8?B?YnFDOVBuS0dLL1JjRHY1RDZLZFo2WVpXWHZhT1djZXV3c2dJWDRaZ1RLZHo0?=
 =?utf-8?B?N01oQXJoU3QvMzczK0FhbXRjcXVuNTJWQmxQYitSMkl0K245R1hpVnMzaEFp?=
 =?utf-8?B?cGo5azhMVzlZMWV1QWhkL0d2OHFsWWNPclB5YjBGcXlTeVBzajJpdWl6cWNB?=
 =?utf-8?B?ZXlMdXJwaTZYMjBpVnVyaCtSajVEUXFQZng0S0ZOM2hxMUZwMUZWNzZrODR1?=
 =?utf-8?B?RjdiZUY5ZnRrRUVlVWU1aGcrYUx5ZmJaaElZMjJ0MkltOHdNUkNyTE9WdTRW?=
 =?utf-8?B?QXd2VU5vVFZOazJUMXQ0VHFaMGpzN1pwRUZ5M0RPSzJtV01FeSs1Nm1MeVQr?=
 =?utf-8?B?clFrTHdpSkF3YmJnQmRCUXlZbXR6a2Z1aHZnMW5KRGc2QkhVVENYSDZsYkdn?=
 =?utf-8?B?WGRoUVBtc2pyMUsvblBxT2VaUGhaQUlTYUFoT1F4cG9XYW1uVVRRYXB1UXRu?=
 =?utf-8?B?d0J1eDNMZ2xGL0gxN0FqNXdYK09FRWRIVGEraTRaTkwyY3pmNDArM1FFRm1P?=
 =?utf-8?B?WUZLV282c2NUZXdFS01PamNjTjdOdCtkanZ0Z0ZUOGh4amhmZVZmbkhjWDFt?=
 =?utf-8?B?OEdSem9tRlMxYzBzbEM5aUpFQkZSUW1CdTNUckNIeVJiV1FDTUJGaHc2UHpR?=
 =?utf-8?B?Y3dkL3o1MWlud29VNnhkdUdnQWhodkg3Si9tbk9pbmhCcUdKZUlZSWNhWDdQ?=
 =?utf-8?B?ZjZGcTlFQlhKMnVrcjdrTWlrYW1ob0p6SmZBSnpaRmZRUWVZcW9ySjFRdC9E?=
 =?utf-8?B?enpmQ2w3S0MzSXlEcllsMjhTeG9Jd1Uva1hHazR3ZkwvMUhTZnFnLzlqTWxM?=
 =?utf-8?B?YU9EYlplRU1FY2dycGNpd2dQOFNWa0tFWG5jblV5OWgrREVtZkYwQzAxTExr?=
 =?utf-8?B?bFVXUFpobDBpaFQ3bDlHRmVqQVlVL1FMdHRFZGVhNGI5SFk5Mkh6azM1Ukww?=
 =?utf-8?B?UzVWOEZyVmhuMkxsb3NmRWNJU1VhY1N5OGxDWXUwSnM2ZVgxMW4ydlMrcWw5?=
 =?utf-8?B?TUtpUDViQXZtNFl6NXVRNFdWbEhHWWtWd0gxZkpvYWJDc0luRE84YUJRa1J2?=
 =?utf-8?B?SXduNXErOStIUzlXNklnQ0JtajJsR2l0WEh4aVg5QmF6N01vbWVDWHJUTDNo?=
 =?utf-8?B?NWZJNThqRVhKMk9pdXBrNTRQREFtQUN6VGd2Rm1XcTZXT0pJUVVaYXdMK3Fs?=
 =?utf-8?B?RUU1aElqVmRYNzVFK2Q1RURGWHNieTNGZTVPMmhOY05uc2lMV2ZtUkttMDJ1?=
 =?utf-8?B?N2ZoMWMxRHNjZFFoTTArWGJyeVZJQk9uWTZRa1poSFFqRTJ3REtyRUJSdENq?=
 =?utf-8?B?SDh2VnZSNTZySEZMQzR4VFFkK2pWV1djMnBqQzZOUi9hMHJYSTNIeXFvZmdh?=
 =?utf-8?B?K3EzaFFrQUdGa25vZU85OGxjMVVpTUtKczkvckxzWUxROUp6YzhHUXFvay9P?=
 =?utf-8?B?Ym53a056U1ZEa28wV2ZRNEZPMVBMWUpueEJuZFVTWDR0WDlyWlFlTWhWRTFO?=
 =?utf-8?B?dDV4UWQ5M0pHS2ZxUEtNMlhuZVdieHAwLzMveTZjRG9scjA2S213TmNsQmRO?=
 =?utf-8?B?WHdVVDRCVmFPcStJUkNMTUgxMTBSbkVtdGJvU3RYRnhmRFB4MVhabDlFdEJ2?=
 =?utf-8?Q?hsi1p6t+4Ie/p3K80Pe0/T8VM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B20BF4C4F278AF4A878116862BC59F24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb1c070-7cee-4211-dfae-08dd99a5441f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 02:55:24.7732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFTY327UuZI+ce+riM3coFjFLrX3yrkgzP3b8Pr/9FXvZWJOy6t0AhAhl4gsa7GhB5Te04mXVTqWsE1dDz7EvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF9D6AFF433

T24gVGh1LCAyMDI1LTA1LTIyIGF0IDIzOjAzICswODAwLCBOYW5jeS5MaW4gd3JvdGU6DQo+IEZy
b206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIGRldmlj
ZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnQgZm9yIHRoZSBNZWRpYVRlayBNVDgxOTYgVk1NIChWY29y
ZQ0KPiBmb3IgTXVsdGlNZWRpYSkgcmVndWxhdG9yIGNvbnRyb2xsZXIuIFRoZSBWTU0gY29udHJv
bGxlciBhY3RzIGFzIHRoZQ0KPiBtYWluIHBvd2VyIHN1cHBsaWVyIGZvciBtdWx0aW1lZGlhIHBv
d2VyIGRvbWFpbnMsIHN1Y2ggYXMgdGhvc2UgdXNlZA0KPiBieSBkaXNwbGF5LCB2aWRlbyBlbmNv
ZGUgYW5kIGRlY29kZSBzdWJzeXN0ZW1zLiBJdCBwcm92aWRlcyB2aXJ0dWFsDQo+IHJlZ3VsYXRv
cnMgdGhhdCBzZXJ2ZSBhcyB0aGUgcG93ZXIgc291cmNlcyBmb3IgdmFyaW91cyBtdWx0aW1lZGlh
IElQcywNCj4gYW5kIGNvb3JkaW5hdGVzIHdpdGggdGhlIGhhcmR3YXJlIGNvbW1vbiBjbG9jayBm
cmFtZXdvcmsgKGh3Y2NmKSBhbmQNCj4gdGhlIFZpZGVvIENvbXBhbmlvbiBQcm9jZXNzb3IgKFZD
UCkgdG8gbWFuYWdlIHRoZSBwb3dlciBkb21haW5zIG9mDQo+IHRoZXNlIGNvbXBvbmVudHMuIFRo
ZSByZWd1bGF0b3IgaXMgY29udHJvbGxlZCBieSB0aGUgVkNQIGZpcm13YXJlLA0KPiBhbmQgdGhl
IG9wZXJhdGluZyBzeXN0ZW0gc2lnbmFscyBpdHMgcmVxdWlyZW1lbnQgdGhyb3VnaCBhIHZvdGlu
Zw0KPiBoYXJkd2FyZSBibG9jayAoaHdjY2YpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFuY3kg
TGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIC4uLi9tZWRpYXRlayxtdDgx
OTYtdm1tLXJlZ3VsYXRvci55YW1sICAgICAgICB8IDcwICsrKysrKysrKysrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tZWRpYXRlayxtdDgx
OTYtdm1tLXJlZ3VsYXRvci55YW1sDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tZWRpYXRlayxtdDgxOTYtdm1tLXJlZ3VsYXRv
ci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tZWRp
YXRlayxtdDgxOTYtdm1tLXJlZ3VsYXRvci55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uYTUwZTM1YzJlMjM4DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tZWRpYXRlayxt
dDgxOTYtdm1tLXJlZ3VsYXRvci55YW1sDQo+IEBAIC0wLDAgKzEsNzAgQEANCj4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEu
Mg0KPiArLS0tDQo+ICskaWQ6ICJodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvcmVndWxhdG9yL21lZGlhdGVrLG10ODE5Ni12bW0tcmVndWxh
dG9yLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFnYXdBVE5PVDN1NlVCdFR3dGdub1pnZ3dk
d1ZMM1ZCdUZaUXlmLWJhVjhqMXdVTUlWMXNJYXFCdmhjcXRmblpTbG1YRmVzZW5ndFphWXhDV3RE
byQgIg0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnch
Z2F3QVROT1QzdTZVQnRUd3Rnbm9aZ2d3ZHdWTDNWQnVGWlF5Zi1iYVY4ajF3VU1JVjFzSWFxQnZo
Y3F0Zm5aU2xtWEZlc2VuZ3RaYUxjbkdMbXckIA0KPiArDQo+ICt0aXRsZTogTWVkaWFUZWsgTVQ4
MTk2IFZNTSAoVmNvcmUgZm9yIE11bHRpTWVkaWEpIFJlZ3VsYXRvciBDb250cm9sbGVyDQo+ICsN
Cj4gK21haW50YWluZXJzOg0KPiArICAtIE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNv
bT4NCj4gKw0KPiArZGVzY3JpcHRpb246IHwNCj4gKyAgVGhlIE1lZGlhVGVrIE1UODE5NiBWTU0g
KFZjb3JlIGZvciBNdWx0aSBNZWRpYSkgY29udHJvbGxlciBhY3RzIGFzIHRoZQ0KPiArICBtYWlu
IHBvd2VyIHN1cHBsaWVyIGZvciBtdWx0aW1lZGlhIHBvd2VyIGRvbWFpbnMsIHN1Y2ggYXMgdGhv
c2UgdXNlZCBieQ0KPiArICBkaXNwbGF5LCB2aWRlbyBlbmNvZGUgYW5kIGRlY29kZSBzdWJzeXN0
ZW1zLiBUaGUgVk1NIGhhcmR3YXJlIGJsb2NrDQo+ICsgIHByb3ZpZGVzIHZpcnR1YWwgcmVndWxh
dG9ycyB0aGF0IHNlcnZlIGFzIHRoZSBwb3dlciBzb3VyY2VzIChzdXBwbGllcnMpDQo+ICsgIGZv
ciB2YXJpb3VzIG11bHRpbWVkaWEgSVBzLiBJdCBjb29yZGluYXRlcyB3aXRoIHRoZSBNZWRpYVRl
ayBoYXJkd2FyZQ0KPiArICBjb21tb24gY2xvY2sgZnJhbWV3b3JrIChIV0NDRikgYW5kIHRoZSBW
aWRlbyBDb21wYW5pb24gUHJvY2Vzc29yIChWQ1ApDQo+ICsgIHRvIG1hbmFnZSB0aGUgcG93ZXIg
ZG9tYWlucyBvZiB0aGVzZSBtdWx0aW1lZGlhIGNvbXBvbmVudHMuDQo+ICsNCj4gKyAgRWFjaCBj
aGlsZCBub2RlIHVuZGVyIHRoZSBWTU0gbm9kZSByZXByZXNlbnRzIGEgdmlydHVhbCByZWd1bGF0
b3INCj4gKyAgKGUuZy4sIHZkaXNwLCB2ZGVjLXZjb3JlKSBhbmQgbXVzdCBzcGVjaWZ5IGEgJ3Jl
Z3VsYXRvci1uYW1lJy4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJsZToNCj4g
KyAgICBjb25zdDogIm1lZGlhdGVrLG10ODE5Ni12bW0iDQo+ICsNCj4gKyAgbWVkaWF0ZWssaHct
Y2NmOg0KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5k
bGUNCj4gKyAgICBkZXNjcmlwdGlvbjogUGhhbmRsZSB0byB0aGUgaGFyZHdhcmUgY29tbW9uIGNs
b2NrIGZyYW1ld29yayBzeXNjb24gY29udHJvbGxlci4NCj4gKw0KPiArICBtZWRpYXRlayx2Y3A6
DQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0K
PiArICAgIGRlc2NyaXB0aW9uOiBQaGFuZGxlIHRvIHRoZSBWaWRlbyBDby1Qcm9jZXNzb3IgKFZD
UCkgbm9kZS4NCj4gKw0KPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ICsgICJeKHZkaXNwfHZkZWMt
dmNvcmUpJCI6DQo+ICsgICAgdHlwZTogb2JqZWN0DQo+ICsgICAgZGVzY3JpcHRpb246IHwNCj4g
KyAgICAgIFZpcnR1YWwgcmVndWxhdG9yIGZvciBhIHNwZWNpZmljIG11bHRpbWVkaWEgZG9tYWlu
Lg0KPiArICAgICAgVGhlIG5vZGUgbmFtZSBzaG91bGQgbWF0Y2ggdGhlIHN1cHBvcnRlZCByZWd1
bGF0b3IgKGUuZy4sIHZkaXNwLCB2ZGVjLXZjb3JlKS4NCj4gKyAgICBwcm9wZXJ0aWVzOg0KPiAr
ICAgICAgcmVndWxhdG9yLW5hbWU6DQo+ICsgICAgICAgIHR5cGU6IHN0cmluZw0KPiArICAgICAg
ICBkZXNjcmlwdGlvbjogVGhlIG5hbWUgb2YgdGhlIHZpcnR1YWwgcmVndWxhdG9yLg0KPiArICAg
IHJlcXVpcmVkOg0KPiArICAgICAgLSByZWd1bGF0b3ItbmFtZQ0KPiArICAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+
ICsgIC0gbWVkaWF0ZWssaHctY2NmDQo+ICsgIC0gbWVkaWF0ZWssdmNwDQo+ICsNCj4gK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsg
ICAgdm1tOiB2bW0gew0KPiArICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTYtdm1t
IjsNCj4gKyAgICAgIG1lZGlhdGVrLGh3LWNjZiA9IDwmbW1faHd2PjsNCj4gKyAgICAgIG1lZGlh
dGVrLHZjcCA9IDwmdmNwPjsNCj4gKw0KPiArICAgICAgdmRpc3A6IHZkaXNwIHsNCj4gKyAgICAg
ICAgcmVndWxhdG9yLW5hbWUgPSAidmRpc3AiOw0KPiArICAgICAgfTsNCj4gKyAgICAgIHZkZWNf
dmNvcmU6IHZkZWMtdmNvcmUgew0KPiArICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2ZGVjLXZj
b3JlIjsNCj4gKyAgICAgIH07DQo+ICsgICAgfTsNCg0KZGV2aWNlIHRyZWUgaXMgdXNlZCB0byBk
ZXNjcmliZSByZWFsIGhhcmR3YXJlLg0Kdm1tIGlzIGEgdmlydHVhbCBkZXZpY2Ugd2hpY2ggaXMg
dXNlZCBmb3Igc29mdHdhcmUgdG8gaW50ZWdyYXRlIHRoZSByZWxhdGVkIGRyaXZlciwNCnNvIGl0
IHNob3VsZCBub3QgaGF2ZSB0aGlzIHZpcnR1YWwgZGV2aWNlLg0KQWNjb3JkaW5nIHRvIHlvdXIg
ZGVzY3JpcHRpb24sIHZjcCBpcyB0aGUgbWFzdGVyIHRvIGNvbnRyb2wgcmVndWxhdG9yLA0Kc28g
SSB0aGluayB0aGUgZGV2aWNlIHRyZWUgd291bGQgYmUNCg0KdmNwIHsNCglyZWd1bGF0b3ItbmFt
ZSA9ICJ2ZGlzcCIsICJ2ZGVjLXZjb3JlIjsNCn07DQoNCkFuZCB2Y3AgZHJpdmVyIGNvbnRyb2wg
dGhlc2UgcmVndWxhdG9yLg0KDQpJJ20gbm90IHN1cmUgd2hhdCBkb2VzIGh3LWNjZiBkbywgaWYg
aXQncyBhbHNvIGNvbnRyb2xsZWQgYnkgdmNwLCB0aGUgbm9kZSBzaG91bGQgYmUNCg0KdmNwIHsN
CgltZWRpYXRlayxody1jY2YgPSA8Jm1tX2h3dj47DQoJcmVndWxhdG9yLW5hbWUgPSAidmRpc3Ai
LCAidmRlYy12Y29yZSI7DQp9Ow0KDQpSZWdhcmRzLA0KQ0sNCg0KDQo=
