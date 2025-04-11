Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199041DF974;
	Fri, 11 Apr 2025 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359552; cv=fail; b=P7ROC32QQ55vs7iVotZhui3nJFicBKPP9LA4fHYCSqz+/9gNXEVzTTV/GRpfDuoO01xb24yKZ9mImfhEgYBZmhztU5tNcJkpN0+7hdFvH5BZtSPnwtFK6i5egAjuPzgzmJ2d5Muk+RYGeIsgIr9lMS3J+6IKKH2mVGiA6VrU11M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359552; c=relaxed/simple;
	bh=IHJHfbD2FEl4ZAenKYKKrXb5gQZw5nLYT3+yoH1fXF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=diJS6QMiAanG0fg3BV+wrP9BQqi5Zo1MEbOdhSYJWSKnuAg5pAnz8/F3VLuRBjuki8oayw+hyjAqISaBU0nVpSUc0m66OR9SY1S4RAo2CB+DIodvIrE5/8ACcPMLBke5WKFUvBTMrnIUE0JzaF2MZqgnLtbDRMnOsIzd8Zcz9cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PgqQRikH; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=NQFIPB/i; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PgqQRikH";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NQFIPB/i"
X-UUID: 9fdbca8616ad11f0aae1fd9735fae912-20250411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IHJHfbD2FEl4ZAenKYKKrXb5gQZw5nLYT3+yoH1fXF0=;
	b=PgqQRikH3jYpHMaiPqwqEw5iWb8GohlIJPHA0kCIX3i9ATDaLLde354TE7nVNNuDQJGt2cuLiY6eY8OduCwuJLRimuj1KLtyELHysQFV7rrfsf9uPBjiRMMfQHdLZypid35h983RSqe36Sn4wDYlDQttzP18FZNSLBYbuYR3ZR4=;
X-CID-CACHE: Type:Local,Time:202504111619+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bd00ad09-3251-489a-bc94-514fdc92c06a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:2675f5a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9fdbca8616ad11f0aae1fd9735fae912-20250411
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1705966579; Fri, 11 Apr 2025 16:19:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Apr 2025 16:19:00 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Apr 2025 16:19:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3tEpkCzSqjWsF8fYsaIMc1TzCn7JcZ8GbjkfbWSzDWbGwrwl3xbAxBygSn2zq/lceKixFzx6b6afH5RDWET7j+5IezTkUj1jJa9hqBgFw2IFnS/d1fCKEI2bC8P0cJ1QCVV+S0BowWeGjWPNtKSgHI3E482D0iocQMHBgmB7o+UlCawh01+FQO+lswsERPDInCAU6IfEq2wTOMeZB15vu4s0+BwuTpMpb27/iiB4Hw1LuGsjBybGFijRyD/1JF4ySomAyyNSXgOAP4d/SFFqZNgG9IegJ6/RQ4J9JtIOOaboIC5/Y+HPTGnXLwifIIKKNt8mtwBvi3Hi6TOFG9m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHJHfbD2FEl4ZAenKYKKrXb5gQZw5nLYT3+yoH1fXF0=;
 b=DwQdJn6b+m38M6Af68JC/M/L5YaOGp0ee5aMr8725uI0IRhyueJjV191ASzJCFajiRw7CIjqB5+WHsrKg3BSQoXPYNfWct1LZhdODC1j55X75VxDMytAo01zWwA/OGNuv6KZUta6zG1jfUTe6mQ56L+AhBAiOKpXE+kGP8putYCwzYo+CxT01Jmo1MljK7WZSuNJ0xnlj7hvZ8Fj61Vl0bwTG3IFgP5ax1Pn7kGJ2DvmTugEi5ENrkXt/MkwJQh2uZwwupB+ah2mCD/n/WbAr7ABW1VFWxV4sJwzqmGG4yPZuP6pB9TDwJ01rrk1B9tiSGyfnr274ofWzw7ukKk+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHJHfbD2FEl4ZAenKYKKrXb5gQZw5nLYT3+yoH1fXF0=;
 b=NQFIPB/i5COebrT0YbeqKZQ78mB+JlsYJ2e4aK9Rcm9moejIzhqp8NcOJRBf1kucXwfM2kutm0W4Fc6CVYJTlWVdZ2M1qYS17POZl7fnPK62kJ96+x0E7ZP2irCWDTTRK4fYXmbwpHFgYp0Tp98KXqvQ1E5E10EGT6DSeb5E2zE=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SEYPR03MB7142.apcprd03.prod.outlook.com (2603:1096:101:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Fri, 11 Apr
 2025 08:18:56 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 08:18:56 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v8 16/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v8 16/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbqVGAOVAUn7or+Ui6ODgXt7tC9bOeIhcA
Date: Fri, 11 Apr 2025 08:18:55 +0000
Message-ID: <b9eafca53149fec817433da3d10bf06a6c96f959.camel@mediatek.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
	 <20250409131318.108690-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131318.108690-17-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SEYPR03MB7142:EE_
x-ms-office365-filtering-correlation-id: 066b1c6d-a24c-4fd3-3d73-08dd78d180ce
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eC9NNG9OU3J2azRTUDJlTzRqNG5QWis1RFNUemZuZWFuN3p2YjVHMy9MTnRy?=
 =?utf-8?B?QjlJWmVQaVRQY2RYQVFXNllBS0grSDVKQjFvRmNQRmlNTko2VkJYQTBUV0N0?=
 =?utf-8?B?Q2w2dHpPUVRQTG4yQU5WMUxyUVcyeUVTNThqVG4zQm9qZ1d0bkU3YVd4UE5C?=
 =?utf-8?B?ZENrWGJWZ1MwcXlSZ0ZXeXdVTXl2WlVHQm5UbGpTeDBSM0U0bWdNZUdjWG9D?=
 =?utf-8?B?Z0hzQ0tRSWtyN2V1WFQzbjZERDRZV2R1ajRQMGJtNjlVOU9OWStBcW1sa0V2?=
 =?utf-8?B?ZFVXOGF1VkZuN0JqbFlac1VFQ2FvL0l4UzVJbk5oeU03VHpBRUVBRGpzeW0x?=
 =?utf-8?B?NXlhbERSbVp0QjVOc2VzNXdEV3Q0TzZMQVFSdTlwaXkxb1R3Qll0YVFCczJX?=
 =?utf-8?B?SXVnZkJPbjMyUHBteUFQTlUvVU9yWVFlOUZOTysxK2JuTmhIU1UxTVFLMmlS?=
 =?utf-8?B?K2tLenN1L3g2VG4zalZYWVBUWTZsenFuSjhoMGFobk96N3RQMGNaUmFtb1Nh?=
 =?utf-8?B?QUtVOTEzVHAxNktsY3A3R0FZLzJTVGVtMC8zc2I0dW5pR1lqTTYrbzBGTUMw?=
 =?utf-8?B?RGF4QWdiMzRmaElPTzBSM0VicE5vWDBhdGM2V1hkbHZjZW9SWDhIWXg5Mlgx?=
 =?utf-8?B?Z3pPZ2hLdHI0ckhTaS8yLzQ2M1kySjJWNCtVeDdtYWYwOFFoUENvK2ZoQ29a?=
 =?utf-8?B?T3R4aHBCLzZJLy84UEtsL2g1RnA4WkJ0VUtobEZTT2ZxMEU5QmxmVmduVTdw?=
 =?utf-8?B?L2h1eXVTVEFWc2FoRHdJTEg2dWJDcTVIRllZNS9lbTZCVEdVb2xXKzNEK3Y4?=
 =?utf-8?B?S3JraGs0MVBHaVgrRzVZZkQvSnNYRE1SakhrL2wyUU5BS2dMZFU3Slp0cWJz?=
 =?utf-8?B?VFVBNFlTeHRvL1NMTjZpUlZZMGlvck8wWkhybkRHWUpqbzhTNjR0a0VmUUxz?=
 =?utf-8?B?amdtRUhSUXNSTnQzcVlNa1IrVnNJaUR2aVlFeEZ3djMxeWxVblYzbURtZ2pj?=
 =?utf-8?B?YXVLQ2tMNUExaTVrRGcyYVo2WHErUDUvZGFNQWc2TC9weFBkSkdnS2RzQWZr?=
 =?utf-8?B?ZEhQOURLM3h0NmVnZU9MQnZsc2ltaDIvQk5qaG9QSUt2MnRoVUM0c25sTEhY?=
 =?utf-8?B?K21uQWRGQTRRSzR1elFjRDJobm5vdVFZRmVoS1QrUzRXOGpBeEx3dHZvTXdP?=
 =?utf-8?B?SGJ3WEhUV1hRK3dIeWR2V04vVENoWi9vdTVjN0I1ME1saEx6V0tBbG5RZFE3?=
 =?utf-8?B?aDdJMlA5bFhKcXZZdW5qc3VPM0F1UUx5U2lJVFB0Q0pSTVl1VHlsUXZHcWVV?=
 =?utf-8?B?a2E1S0xqejBBdTdacTFLMnFualQ4V1JsZGpLT2c2N29YTGdIVHRMeU8rcmpZ?=
 =?utf-8?B?YnppeTNFMUtOZTVMNzBWQ1U4bjJUNVdYdlpzZEJHQjlWUzc5QWZNQlJ2OHlp?=
 =?utf-8?B?Y1AxVEdKNEIxTi83RmZrVWE4VTRBRjVBdTM1ekdwSFFybUN5encyVmpQeCth?=
 =?utf-8?B?R2VML2VIRTFLSGRpaUVvaGdkOE1wcVpmdDBIRmVtREViOTYrTTM4bTBQaHZv?=
 =?utf-8?B?OXBJNk9EeUNvZTdzN3lRNFQxU1BFVGJITkZiUUIvc3U2Ui9lN1BkYTFjMWFD?=
 =?utf-8?B?eXpjTjRpa01IRnJIUzEySEdvMi9lTGNReW5MdkZZc2dnWlN1TnRuUllXcnJu?=
 =?utf-8?B?WWNEd2FoeXNUY3NaTmNLQVlLc01odFQvQ3cxUlJ2b200QTJvcnlwZ1pIbzhw?=
 =?utf-8?B?T2k1dWkzMFAzU2xlOHVKYldLZUFRVGdwb1dJYmJ3RExlMExlN0xXWUZKNWFM?=
 =?utf-8?B?eFlad1BtTHZ6VlRKY0ZIS05hNlZzYkdqYnZISVJNc3RuRVBSNHdVK2t5cTQ5?=
 =?utf-8?B?N25GY3MzWmZteng0NkdQN1ZBWTdqSnJYQzJOeWlJdU93VDFpcENSVFNYaUI0?=
 =?utf-8?B?YnVCcHVIL2wwSUZMVW5pYUlVOS9YczFsU2YxQUFZUUU4SzNVdDlvYitXaG5R?=
 =?utf-8?Q?z3NvQDT/130s4vP/XM62eCPQKqbPuE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm1jREdvZk54M1JJN0UwSEd2WlhjcFRlMGs5MWU0MHBTWVl6OXZrMTNJYTZY?=
 =?utf-8?B?cTVHbGxnQVlGRkVsMmo2Sk1TVk1lVk1uRHBMeWJSanpuTk5wQ3dPTzFBb20r?=
 =?utf-8?B?Z0puUWt2ZkFiaWx2S0tDbFBDRHBJQ2ZpTElSRmN0RDBrWkplTlJ3dkJ5OFRm?=
 =?utf-8?B?OGllQUdORXR2cmpxSnJvYVpub1JKZkxUc25FVVY2Vm5SWUZHYXBwK1Y5Tk53?=
 =?utf-8?B?ZGNvUGt1U3RqaGM5RUhGanI0cVBzTXpGbVNXR2d4QUh3UjBZNzV4LzhBSXhG?=
 =?utf-8?B?RC8xbHV2bU93eTZpQTRJTVVXZzNHeXpHcWQvMEhxczB0WTJLMDFuYUQ5YzRM?=
 =?utf-8?B?RTJ4VnNKYnUzQUQyL2dYSGxhNVViRFRBT3hLSlJMdVR5aWVkeEJXK3h3Vnln?=
 =?utf-8?B?bkVGYkIrMy9QTUhGaEJEaVdqZXdORHFENTd2ZGhmYk9RYVNZYXdNdEl5eDQy?=
 =?utf-8?B?NjRmVzZqUG5LOS9HTVNlcEZpUitIMWJVMHM4RTcvdHdLa1lMZ1ArS0lIZXBM?=
 =?utf-8?B?Z3RoMkMrcWo1VjV1bU9wYlVPOEduOVlmdnIwUEp5VnVzOFFmbDhucGNibHZY?=
 =?utf-8?B?ZERoMXNpRVk4WG1MbGc5MVVDWG5IS2lhWjhEaTczNFBUbXMzaDhyMHY1Vm1s?=
 =?utf-8?B?WTIydXdGVUZObGtOVzJ0SW9rT0NmNDZmMFprZTdSMWtoem5hcW9MWndzdzVF?=
 =?utf-8?B?cC9ZVFYrejNwaVBDVDhiS2I5NmZXemZwalhVUm5DdjM4Y3Q5cHNzQ0N4ZSt6?=
 =?utf-8?B?eTRPbVYrYVJJQmUwcXZSMnVkVWZSVkdZSXVDaVYwWGlvblZiODdGVkMxSEY1?=
 =?utf-8?B?Ui9yVWQwSER2OHhHemhaQkhKWHQxUENWZFMvek5QWDNsSkRHQnlTWWg4cTNh?=
 =?utf-8?B?SHhrNHFMbURFNm8rMHk0Zy9VYUFMRDB6WU9Bc0ZpWUtkREdHeGF3aDlyV1ZJ?=
 =?utf-8?B?amZJa3Fnay9LSG9LWUJ1czJMWElFS29XeFdKZ2xTbmZ3Z3djUytSK1NkRnZk?=
 =?utf-8?B?eUpWTm9mcUNGZ0gxTS9rZ21HME83Q0dLNm9vUHVJTmlXWW5YaDBrWU83amxP?=
 =?utf-8?B?MGI5MjMwSUI1VVE2bG9wa1p0aFhWU2k5MjBYSmZoU3h2VGFoU3RJeUpvTGFI?=
 =?utf-8?B?TzFtNGY1ZU9NVjNWc0pnSWdVWmI4VWVqNWNzNktNVlE5UUl5ZWR6RTg2Yi9x?=
 =?utf-8?B?YXllQ3lBUHJnS2ZTNzZ6SzgvZloxdHRIZUpISmM1YzVXWkxGQXB1dkdHVXRh?=
 =?utf-8?B?VjdaUGQyWGlaeitIWis1TFlVa0NQcGNMSE5qcHUvZFlITHdBS3JaWVpuOUs1?=
 =?utf-8?B?ck56aFVvM3ZXaGh5OUszbDd3Rkt4MGFRdTcvUWExWTVMQ0FqLzhNR2syVEl1?=
 =?utf-8?B?RjhsalBCWFY5OE5xeGtNTURCUkpTWWsyZ1dPVUQzbEJoWURLSlVRcFB4WHo5?=
 =?utf-8?B?cjZXZExNMm5HMXY5TTZBdTNSV2FFRzZwd1J3b0ZNMXVsV0hYOW15OHNmZy9i?=
 =?utf-8?B?M1pMSDlXdDdqTDZVMjE0aTFyQ0pjWnBYbEZncituSEdPTEcrbUdsVFZ1c3BX?=
 =?utf-8?B?SnJucDRRK1cxNXUrSTJjcytSMnJsTUlGb1h4OXR3UmF3ay9RcCt1L3c0b2RT?=
 =?utf-8?B?eS8yY1ovalh1TGNNZVJrTlhxZUJPSTN3SFhyZG93MnhZVFBJaGQ0OFM5aGJS?=
 =?utf-8?B?c0FhemdRSExWeFRNb1VLMC9IaEp1OHBhaW9VWVo4NTVWQzRpK2JsYmpLV0tC?=
 =?utf-8?B?UTBJS1RpWFdFWGJlZ29EYWpNcUN2dk1QQVRFNGRSQy9tR0d6cDhvdzNxblRu?=
 =?utf-8?B?blpxRnVUZkN5Q1N2MHludm9UdTc5dWF0ZHhDK2M3SVJjKzVFUkJkQjJSdTR2?=
 =?utf-8?B?L3RLaTJabHJvekcrUHFUMEhDSGl1NlArOCtUaVl0ck0yREFGYThTcUprbjVq?=
 =?utf-8?B?NzBTMVV2ZExzSVR2YXo3cUNTYjQyazNyakdoaDZtT0Q5Y0cwMkh1cFRLdXdR?=
 =?utf-8?B?TzV1Yjc2T0o0YW5tM2FaWGZ6b3R4YmNRLyt5MGZJYytqbldPM3hlWldFY2Jn?=
 =?utf-8?B?L1duMytzbzJzK2E0SGhFVzYxdXRQbDZVRnZHRXl3VkN6YUJtNVlWNFFNMEVj?=
 =?utf-8?B?TFVoR1o0UXFHbWJDV2wrc3pxRFJNSXFFbkFNNHA4bUIzY1g4bElaWndCRk5v?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CC8138AA91F894299EC5213E323DDBD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066b1c6d-a24c-4fd3-3d73-08dd78d180ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 08:18:56.0526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6jH2vlKE4KpcB4Yl+qJNehzy3GiJBsVZSLT+sH+rvS8jC/rox0HxhJ8wP/SQh3LfWYuYC4XjHIiapFUtyuKMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7142

T24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIGEgbmV3
IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91dCB0aGUgZnVuY3Rpb25z
IHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0KPiBwcmVzZW50IG10a19o
ZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNpbmNlIHRoZSBwcm9iZSBm
bG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBhIGNvbW1vbg0KPiBwcm9i
ZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBkcml2ZXIncyAucHJvYmUo
KQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxpY2F0aW9uLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZyAgICAgICAgICAgfCAgMTEgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyAgICAgICAgfCA1NDIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgfCA0MjYgKysrKysrKysrKysr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5oIHwgMTg4
ICsrKysrKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjMzIGluc2VydGlvbnMoKyksIDUzNSBkZWxl
dGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWlfY29tbW9uLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
DQo+IGluZGV4IGU0N2RlYmQ2MDYxOS4uOTk0YjQ4YjgyZDQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZw0KPiBAQCAtMzAsOSArMzAsMTggQEAgY29uZmlnIERSTV9NRURJQVRFS19E
UA0KPiAgICAgICAgIGhlbHANCj4gICAgICAgICAgIERSTS9LTVMgRGlzcGxheSBQb3J0IGRyaXZl
ciBmb3IgTWVkaWFUZWsgU29Dcy4NCj4gDQo+ICtjb25maWcgRFJNX01FRElBVEVLX0hETUlfQ09N
TU9ODQo+ICsgICAgICAgdHJpc3RhdGUNCj4gKyAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRF
Sw0KPiArICAgICAgIHNlbGVjdCBEUk1fRElTUExBWV9IRE1JX0hFTFBFUg0KPiArICAgICAgIHNl
bGVjdCBEUk1fRElTUExBWV9IRUxQRVINCj4gKyAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NP
REVDIGlmIFNORF9TT0MNCj4gKyAgICAgICBoZWxwDQo+ICsgICAgICAgICBNZWRpYVRlayBTb0Mg
SERNSSBjb21tb24gbGlicmFyeQ0KPiArDQo+ICBjb25maWcgRFJNX01FRElBVEVLX0hETUkNCj4g
ICAgICAgICB0cmlzdGF0ZSAiRFJNIEhETUkgU3VwcG9ydCBmb3IgTWVkaWF0ZWsgU29DcyINCj4g
ICAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiAtICAgICAgIHNlbGVjdCBTTkRfU09D
X0hETUlfQ09ERUMgaWYgU05EX1NPQw0KPiArICAgICAgIHNlbGVjdCBEUk1fTUVESUFURUtfSERN
SV9DT01NT04NCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBEUk0vS01TIEhETUkgZHJpdmVy
IGZvciBNZWRpYXRlayBTb0NzDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gaW5kZXgg
NDNhZmQwYTI2ZDE0Li43OGNmMmQ0ZmM4NWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFr
ZWZpbGUNCj4gQEAgLTIxLDYgKzIxLDcgQEAgbWVkaWF0ZWstZHJtLXkgOj0gbXRrX2NydGMubyBc
DQo+IA0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFSykgKz0gbWVkaWF0ZWstZHJtLm8NCj4g
DQo+ICtvYmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUlfQ09NTU9OKSArPSBtdGtfaGRtaV9j
b21tb24ubw0KDQpUaGUgd2hvbGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4NCkJ1dCBtYWtlIGNv
bW1vbiBwYXJ0IHRvIGEgbW9kdWxlIGxvb2tzIGEgbGl0dGxlIGJpdCBtb3JlIG1vZHVsYXJpemVk
Lg0KTGV0IHRoaW5ncyB0byBiZSBzaW1wbGUsIEkgd291bGQgbGlrZSB0aGUgd2hvbGUgTWVkaWFU
ZWsgaGRtaSBkcml2ZXIgYmUgYSBzaW5nbGUgbW9kdWxlLg0KRm9yIE1lZGlhVGVrIGRybSBkcml2
ZXIsIGl0IGlzIGFscmVhZHkgYnJva2VuIHRvIG1lZGlhdGVrLWRybSwgaGRtaSwgZHAgbW9kdWxl
cy4NCk1heWJlIHNvbWVkYXkgZHNpIG9yIGRwaSB3b3VsZCBiZSBicm9rZW4gdG8gbW9kdWxlcy4N
ClNvIEkgd291bGQgbGlrZSBoZG1pIHRvIGJlIGEgc2luZ2xlIG1vZHVsZSB3aGljaCBpbmNsdWRl
IHYxLCB2MiBhbmQgY29tbW9uIHBhcnQuDQpJZiBzb21lZGF5IHdlIG5lZWQgdG8gb3B0aW1pemUg
Y29kZSBzaXplLCB0aGVuIHNlbmQgcGF0Y2ggdG8gYnJlYWsgaGRtaSBtb2R1bGUuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQo+ICBvYmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19jZWMu
bw0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfaGRtaS5vDQo+ICBv
YmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19oZG1pX2RkYy5vDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQoNCg==
