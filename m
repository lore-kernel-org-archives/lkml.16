Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B49846D;
	Tue, 11 Feb 2025 02:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739240752; cv=fail; b=FowfZsYlLOB4FjL8kqSrDJIQXup0hB58Y4UDb1FyD2P5iXBz4wTxvp4LSJx8eMijFK34U/JgnI+yRv3WtBhFku9dWHfYvqfgZO/u/ZTpWzT+LHb2gPig9JC5atfv9nMScg8cjl2b0bOqpzyoTPPuHSPzQlsu8rs5rlxguLxnRTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739240752; c=relaxed/simple;
	bh=OhKYMOetZwRX7i2JPX19XfXmpkiXFN0Tb7rTQiODHtE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rLlRl5NM6X4Pwl1oGXLXXSwZoxPDRxap8Lkm42oAxz4qSnCrMhoKqQv/38fgIgbY/6s2WM375U/R5+ewqyZwGkUcsN+slcPIac0NvwpjIU6vV81XhSxHh2Npmndqrpgtz1VIL76NoyL6hI0NEmEQ2/vfdsSWh8B6P10Ty6nu20c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nsbY8j8O; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=my8Lxk6r; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nsbY8j8O";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="my8Lxk6r"
X-UUID: 7a20a030e81f11efbd192953cf12861f-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OhKYMOetZwRX7i2JPX19XfXmpkiXFN0Tb7rTQiODHtE=;
	b=nsbY8j8O0Uuhv+Sv+MF3EUH7mXffXejZi9HQV2HDLXNw+sdHvS7QiiP+rc8QuYe87Pc8QtPLYeb1ttbqioXeVxBfXNw/tKn2iWujVkoIklBDoN2Co2ENywO5+L/aagZbLluV1k7rwWgsj85u8jApxWCONRWXSCAa7CblxSxWOTk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ef6462d4-c736-48f1-a70a-1a2250339178,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:51636b92-d651-4ec6-81e1-a3deb10c9ff8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7a20a030e81f11efbd192953cf12861f-20250211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1185005963; Tue, 11 Feb 2025 10:25:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:25:35 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:25:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aE1INOxaxDAKeRloJNf5JIRwOHN17QDJ7g/wpRSG1tCBy7R1sdNZ5jHR3thP7L59d4tdC+ELyBgu0QYXnMUO69ouKzuRtAST0aWYpeO32A9FwJVZKL6RIXI2R4Oqq1j5unrKbNOShXAuRgj1s/BBtQd+tD5HvVBIsWWeudZNWhAM1BKdc074inLbG+CYtjl0YAooHOYR5B68KDIkzvSqmIQi8j0nJfRQqMdVuv7Z49fjrpdA/8lfZuvMtHtt6P9t5cEJGpT25X9Mg1tvOU+vJJtLBCwz+6egt6YILaIEMaQLH5E/6s0gUBlAhJztM89pDxX3tRksPSTVa83FChR1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhKYMOetZwRX7i2JPX19XfXmpkiXFN0Tb7rTQiODHtE=;
 b=a+q/ycsP6g1qiqgHaVuWvznpTYBqDnaZANAZj/mU1DZg903Bni18AMaGmbAkIltdW2O2MFt5mpCQYapnEaT8J/2E5NdJYJX86jBNNoJfCPDkkN2z/GmVZyNvXprvh9Cd2JH9P85DEhHhjzjm1mOt7TpImv8tcuA9UGx/WnOGiimt8eP92yG/zu3oKbSyWiDDpBXmrrWzW4y+qsFNWCjTnRAPIptTGL5j+Po/3T5syl/IlBaMyTO4ObiCqX83fmF0DE6kCEFp2anhPzZNQlCXZl/YRXktfrgYtfibpPm5SQ7NAQWjP28f8dIY51MaPr1T9BIu50VWUcE+Z+W9OtY3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhKYMOetZwRX7i2JPX19XfXmpkiXFN0Tb7rTQiODHtE=;
 b=my8Lxk6rbWKYvXCQ6R+cQrWcKGhCUR4b7PMTj7OYXNt+D5OQCaHRqg8g0GeqvTMGYYP0nFlXmquy+pWpPiTEjAfmwpwefXAHX6ozx5jdxCmSQONNJJJxFip2uwSRWk4hXnr96aXmlMGP0SJxYDx/rQGjWDFdkYkEGpYA2cfem0s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8380.apcprd03.prod.outlook.com (2603:1096:101:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Tue, 11 Feb
 2025 02:25:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 02:25:32 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	=?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 23/34] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Thread-Topic: [PATCH v5 23/34] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Thread-Index: AQHbZcr6tppprJBqKkeVRqIsUoAQcLM7e4qAgAUTDQCAAP5FAA==
Date: Tue, 11 Feb 2025 02:25:32 +0000
Message-ID: <69c2d145662345b160718feb5966ffa06030d607.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-24-angelogioacchino.delregno@collabora.com>
	 <1d5a94f3b974d4617a58f2d9dfc54d5dc889f18a.camel@mediatek.com>
	 <98caee8a-b78e-4dcb-96d9-37fd4f279e68@collabora.com>
In-Reply-To: <98caee8a-b78e-4dcb-96d9-37fd4f279e68@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8380:EE_
x-ms-office365-filtering-correlation-id: e008f5df-797e-4a24-5556-08dd4a435c50
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dnJiRklyYkRmY0ZQVEdFZk1yT3pLRU44dWxTcytIOW12WDh2RmVpSE9QcEhJ?=
 =?utf-8?B?QkRvcmYyaXZLQlBoWVJUZWdleC9vc2h6VkNlVWpKQkxtUjJKVHZ4YmV5elBG?=
 =?utf-8?B?SWxDZytBUVZqNFhnNlFVYTJZODh0OGt3TENFbkpyWDZyN1d3bzJLb1d3V0pt?=
 =?utf-8?B?K3J0c0JwYzBVYStaSnROMXdpWCtadnlWMGs3OHoyUDVkODh2V1E2bzQ3QjVn?=
 =?utf-8?B?b2NIc1hoN2JWUE9udlpvMnZGT1ZEZU9DKzQ4WE1tdStuTmxNSy9vRVhzdnFJ?=
 =?utf-8?B?Um1wQTFjYlFNS2h1YU04STNzU2ZOVnZwN3lYZ1o1U095SStYRkxiYVpSTmd3?=
 =?utf-8?B?QzY2Tnc3dHZLR29nQkRjM01oeDJSR2k1VXRBQUg4MDJ5Q2I4TENEWDJZQ3Bo?=
 =?utf-8?B?Nm91UFF0QzRLM3NTZTRScmNHUExkTE1icmNMVzZVZE14TE1xU2VqRGZYMUVW?=
 =?utf-8?B?UjY2S25yZUNpU2QwanFsRHRmaVpjNlZ1ekRsU2VJb0pwekR5b2tnTGVhRWxI?=
 =?utf-8?B?WHBRaStzbVVncnBCZ0NYUSs0dmN5UkV1OS9nZFl0cDFyYWtBbXB1aC80RVdy?=
 =?utf-8?B?ZXZ6aWZTSThNekxTanduWC93MWhtZWtUNlZXUENZYlBuU0FnR2JNRWJoZ212?=
 =?utf-8?B?NnQ5eUJENHlBcjlXdlVpTGlBeHRPQlB3am1HcHZkQWJSOXBXSDBNM1dhbzV0?=
 =?utf-8?B?eGtUdVdJdnVnWHFsbXVlSUl1RG4raDIyM2pzZGtKcFBBUEVkMTVlYVVzVlNX?=
 =?utf-8?B?ZXJJcUNHdlV0anl0N2Q4WkdKcVNENXRoTkxhVkRzRkNUNHA5RDhyU1JQcWVv?=
 =?utf-8?B?cE91OFdET1JNSmVOTUxoNXRzNzBSTnk2TzFHUFRVMXNYSkdZaE1ac1hoeFUv?=
 =?utf-8?B?RFhZVWRnaGxHOTJVQmpjSy81NmJXMDdGZis4NGJyTnAvYTduUWxuVXdsbVFN?=
 =?utf-8?B?TXBYTHVQcnNVaTdiQ0phUWxHeHhSVFZ1bDViK1AyUjhpaUcrVnJpRW1tZSt6?=
 =?utf-8?B?SHFISUVON2M1dTdyLyt1TDlCdjM0SGkrVXd5MFdvVGU4UGRSQm9nejdreWRR?=
 =?utf-8?B?dDd0V0tXaHkvbUpoNTNxTVJVak5JZGpvMnFkdHBKWXRobUZhYnhZYWszUEN1?=
 =?utf-8?B?RmpwSGd2am1LZVVaYndhU1Y4TlA0ZU0wWEwweVdUNzVBN3pGOXJ3WlFWSzVs?=
 =?utf-8?B?MkxZZ05EQld6QjdzQ2hCeVB5RE02VyswNXora3FWTE9BaHpkdFl2bWZtVFhE?=
 =?utf-8?B?cldOaW12dFNNeXJKOHVYeXVDRlNxVFY2U1RYc3JCQmlMY1BUNFpxbzF0c21s?=
 =?utf-8?B?M2dQZXp6VmhtbnhCQ3V1TytocWpHUzdpQkN0S3lGelB4bjFVSE9GdnluWVFt?=
 =?utf-8?B?MXlPQWUxVEVaMlR2cW0zYW1VQ2dOd3N3bTJpZElDVUZKRDgvM1FKVlJUSURr?=
 =?utf-8?B?WjcvTm5hUjdXWTdmUkxjVGtNR3YrNkVkYkdFbU5RMFRmc25xZ2lxaVlIMEJu?=
 =?utf-8?B?MUN0WitxMWlqRWFZYXhLYkpNRU96RnFRUUVZTmxVWFpMTTZiWDVOZXRwaS9T?=
 =?utf-8?B?Y2NSOUxRNzNCMUpuN3ppbklwekxnQ25HcFZjUVlwY0grV3JDNWpqd3o1V2l1?=
 =?utf-8?B?OGgxVmF4bGRPbXVJM2kxZEdOcldvNzgxN0RrV2xkVjVIV1JwQ2F2M3p3UkFK?=
 =?utf-8?B?Rm1VSDZERUdHa3JoNUtVUm52c0VvNmtzTWpKU2VVNkJVU0M3VnUzNkRMVU4y?=
 =?utf-8?B?NlZZZEhHdWhqcTFWSXpZdE1NaG1IOFdRMEVCcng4ZUJGQ2Zya2xlUDdYMU1p?=
 =?utf-8?B?RGkxZU9TOVdjMmR5UHcrNWZqdVZKcis0UWNad2V5WnVBVFU0QWo0NjE0aTEv?=
 =?utf-8?B?L3puNlpsdHpUK2RvKzFMZW9maUV3ZUdRYlVMZUNBLzFlRTBxak5kYm5MZDRr?=
 =?utf-8?Q?HEiYMEQh0/Ppb30vQ44IEFPHe4KDPGwk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1hFYTVpNFdva0picjJodnQ4ellSSm4xV0JGU0s4WkZUcjVEYWYwRURYWmh5?=
 =?utf-8?B?YnlqQUZKZnhsS1NhdUxtOS9MR0MrUkZUZ1p4SnczWUN3bEpMN1FZQ0RTVE50?=
 =?utf-8?B?aTlaWnJnMFdCQm90V2Q0MmljQVZUZVRIazFPUk5MbUordDVCT3QzUGszSEh3?=
 =?utf-8?B?aUxmV0hac1UyUjIrZy9IOURCNnFZT1J3N0xtQS8vVWNhMDNxYzBUK2ZuTWtv?=
 =?utf-8?B?c0hkMGpBd1R0dU1Zcm5VTVM1aVJqdlVzMUFlTUF1ZS9FbnU3ZUxNMDY5WHo3?=
 =?utf-8?B?clEzNlVRNnJXUFo3OUFYT0xmOTNZOEVDZTQ4RklGMFo2bkxPbnBMR3RhNURY?=
 =?utf-8?B?bEh2b2hZUjZOdDUxSGxEQUpqTndBUUhmRmlWYzN2Q1VHS2JIOXdydGJMNENa?=
 =?utf-8?B?MnVvY25YdVl1Q09SSERocmJGbU13NUl2REkvaS9UdytWSjVaZ3NFbTl2Q3ZU?=
 =?utf-8?B?MWNIbVo0b2gxWk1kWUR2c3lKNVp0TE8xMkk3NTR3Rkw1QW11Tk1CUlFxNmhN?=
 =?utf-8?B?QjlBdDRwZ081WjZEcGVhbkZqY2FkSW1DRjVBUXRUVGZIMlByY2ptSmNUVy93?=
 =?utf-8?B?bUdKcTZjN3lmYkduL3BUeVRZM1NNOG5KK0RWM2M2Z3BMcW1WWTc0UnBIZmta?=
 =?utf-8?B?WlpsN2xqNW1Va25zTGtNS0ZiSWFVNjBIR0VBQ3JadU9QWXN2bFFGSXkraVBu?=
 =?utf-8?B?b05wTUNqMGpBcUFTRG0vOU41Q1lQQWNJc1BIUWhVSXJ6YzVqZDNVUHg1K0Yv?=
 =?utf-8?B?eTRwTkc2N0NaSUVIVndvaDFQckRiMnVXczVYcmZxOXQzTHdLV2tCbTY5NzVo?=
 =?utf-8?B?bUZXSXlXQ2Y3UlNnY3ZDMXNDdWpmcXNjUjVoNEJNTnQ5dkJvUDQ5QjdUbUI2?=
 =?utf-8?B?Y29hNmhPckVmeGZBTUFkSXZlU3A5dUJ6b1ZoZDByOVp3YmtudFJtUjY1RUJs?=
 =?utf-8?B?TVVWRlFQZWtNRnpPWDF6L3NiRG9ScnlCVTdZOWpHOUY3K01qOGNDbzl5aktq?=
 =?utf-8?B?YUhESHRRS3U1RHVNSlJpdVk2bmRYRDgxSk1qL2VndEdMcUZlM3pNemtuK2RK?=
 =?utf-8?B?QVFBSDZKbVl4dDJhZnBvUTZzQTc4YnVrUE9lV00wUXJray9yMVVmT0tVN2JE?=
 =?utf-8?B?ZWJXRkpDdmNGc3EyeXpDaHlnRTZZQTlTRElOUVJUQU5BSFZrTUx3akp1b0R4?=
 =?utf-8?B?emJqTHFpcDBtZ3RhNGxyY0FNWk9sU0dwVTNxRWM4TzhtRE5adVlBOEJXZ0pC?=
 =?utf-8?B?Q2VacjdLa2JJcWtZc3dpem1hN0ZDUXo5eFdqa3ltTzV1bUxwRmpkTXBQZHZB?=
 =?utf-8?B?cU10dVp5MzBkVUgzK25tZ00rRWlsbE1ybjdJSWNFWEd0TzZqaVZnL1BPOFU2?=
 =?utf-8?B?dXpGMlpoMUVqeHM5SnozRW5MWk5UTHluaGR0VTg1SHRYRnVWaUxJV2VuRGE5?=
 =?utf-8?B?bStZelpCOTAzOVBLdWdUcytmQWxQQVZoQnJYNHNJT0lacG5zNVBDZzYvQkJu?=
 =?utf-8?B?UkZJT0xIV0pEY2NIaURaRFh3NWxSNm1xYjZBZkZsYmlUdndUcVJ2eU9EUTRE?=
 =?utf-8?B?VjcxWVBnZEdUK3FFak5waGtkdlRUSU9JK1Y3WFUyVHZzYnRnRGc3V2ZqWlZk?=
 =?utf-8?B?cWgveFpRUjExNC9jamtZbitxRXBOcGxMREc4R0swR016b0hxd0I3cDc3RTdp?=
 =?utf-8?B?K2VFQzhTcy9ZdDhraWN2Z2gybXdFVitjUFhBN1ROdlJPZzRIY3Yzc25aWjFS?=
 =?utf-8?B?MmFiaXVpTDFsVlRCUWpNNXFtY25LUTJYQkFRLzBFYlZQVjk2bytHRElhV1Bv?=
 =?utf-8?B?RUFrekJDUXJ6bEc2UHYxZzBPOERON1QxSGltTVlZYlJmYUMzUlRhRGRCVHZD?=
 =?utf-8?B?OFZ0YUR5QndpUHhyN1kyUTdQWFJHMExYTjRrT3h2amllL0NmV0xKcjRjTUli?=
 =?utf-8?B?eUQ3cXBrRkJMZ3hIQ2pETEhrb1F6azhMVW1kT3JFN3NhdWpVeXZMNFVLQlFM?=
 =?utf-8?B?REc5dnRJSlNmNVE0Vk51bGxza1R4a0tGMHJQWG5PYUhyRzRzWGhzcStiRXNo?=
 =?utf-8?B?UnhpVklCUURwN2NvcjNOSnlwOTNLYkludEdjeEdOdjZNS2xlUTZhelhKOXY4?=
 =?utf-8?Q?8KQ+EoSSip3pxnALUEdF6F7Bt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAB5AD0A05F7F24E8C1F0C5E3371F0CE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e008f5df-797e-4a24-5556-08dd4a435c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 02:25:32.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZb5hojF7dyU85XzYFGf1otKq0Qf0exKAodklALLBNsL6n4HqbXqLwUOl1lyNPhblUcvYwxxknFSGB3KAZqCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8380

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDEyOjE1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwNy8wMi8yNSAwNjo0NiwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBIaSwgQW5nZWxvOg0KPiA+IA0KPiA+IE9uIE1vbiwgMjAy
NS0wMS0xMyBhdCAxNTo1MiArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEluIHByZXBhcmF0aW9uIGZvciBtb3Zpbmcg
dGhlIGNvbW1vbiBiaXRzIG9mIHRoaXMgZHJpdmVyLCBtZXJnZSB0aGUNCj4gPiA+IGNvbnRlbnRz
IG9mIG10a19oZG1pX291dHB1dF9pbml0IGluIG10a19oZG1pX3JlZ2lzdGVyX2F1ZGlvX2RyaXZl
cg0KPiA+ID4gZnVuY3Rpb24gdG8gYWdncmVnYXRlIGFsbCBvZiB0aGUgaW5pdGlhbCBhdWRpbyBz
ZXR1cCB0b2dldGhlciBpbg0KPiA+ID4gdGhlIHNhbWUgZnVuY3Rpb24gYW5kIHRvIG1ha2UgaXQg
Y2xlYXIgdGhhdCBhbGwgb2YgdGhlIHNldHVwIHRoYXQNCj4gPiA+IGlzIHBlcmZvcm1lZCBpbiBt
dGtfaGRtaV9vdXRwdXRfaW5pdCBpcyBzcGVjaWZpY2FsbHkgcmVsYXRlZCBvbmx5DQo+ID4gPiB0
byBhdWRpbyBhbmQgbm90IHZpZGVvLg0KPiA+ID4gDQo+ID4gPiBXaGlsZSBhdCBpdCwgYWxzbyBy
ZW1vdmUgdGhlICIlcyBkcml2ZXIgYm91bmQgdG8gSERNSSIgZGVidWdnaW5nDQo+ID4gPiBwcmlu
dCBkaXNndWlzZWQgYXMgaW5mb3JtYXRpdmUuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgfCAyOCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiA+ID4gaW5kZXggZTIzOTNmNzU1
OGY5Li40MzQ1YzkxZTkyZTcgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMNCj4gPiA+IEBAIC0xMDI1LDIwICsxMDI1LDYgQEAgc3RhdGljIGludCBtdGtfaGRt
aV9zZXR1cF92ZW5kb3Jfc3BlY2lmaWNfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwN
Cj4gPiA+ICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gICB9DQo+ID4gPiANCj4gPiA+IC1zdGF0
aWMgaW50IG10a19oZG1pX291dHB1dF9pbml0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gPiA+
IC17DQo+ID4gPiAtICAgICAgIHN0cnVjdCBoZG1pX2F1ZGlvX3BhcmFtICphdWRfcGFyYW0gPSAm
aGRtaS0+YXVkX3BhcmFtOw0KPiA+ID4gLQ0KPiA+ID4gLSAgICAgICBhdWRfcGFyYW0tPmF1ZF9j
b2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiA+ID4gLSAgICAgICBhdWRfcGFy
YW0tPmF1ZF9zYW1wbGVfc2l6ZSA9IEhETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQo+ID4gPiAt
ICAgICAgIGF1ZF9wYXJhbS0+YXVkX2lucHV0X3R5cGUgPSBIRE1JX0FVRF9JTlBVVF9JMlM7DQo+
ID4gPiAtICAgICAgIGF1ZF9wYXJhbS0+YXVkX2kyc19mbXQgPSBIRE1JX0kyU19NT0RFX0kyU18y
NEJJVDsNCj4gPiA+IC0gICAgICAgYXVkX3BhcmFtLT5hdWRfbWNsayA9IEhETUlfQVVEX01DTEtf
MTI4RlM7DQo+ID4gPiAtICAgICAgIGF1ZF9wYXJhbS0+YXVkX2lucHV0X2NoYW5fdHlwZSA9IEhE
TUlfQVVEX0NIQU5fVFlQRV8yXzA7DQo+ID4gPiAtDQo+ID4gPiAtICAgICAgIHJldHVybiAwOw0K
PiA+ID4gLX0NCj4gPiA+IC0NCj4gPiA+ICAgc3RhdGljIHZvaWQgbXRrX2hkbWlfYXVkaW9fZW5h
YmxlKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gPiA+ICAgew0KPiA+ID4gICAgICAgICAgbXRr
X2hkbWlfaHdfc2VuZF9hdWRfcGFja2V0KGhkbWksIHRydWUpOw0KPiA+ID4gQEAgLTE2MTYsNiAr
MTYwMiw3IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3VucmVnaXN0ZXJfYXVkaW9fZHJpdmVyKHZv
aWQgKmRhdGEpDQo+ID4gPiAgIHN0YXRpYyBpbnQgbXRrX2hkbWlfcmVnaXN0ZXJfYXVkaW9fZHJp
dmVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiA+ICAgew0KPiA+ID4gICAgICAgICAgc3RydWN0
IG10a19oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gPiArICAgICAgIHN0
cnVjdCBoZG1pX2F1ZGlvX3BhcmFtICphdWRfcGFyYW0gPSAmaGRtaS0+YXVkX3BhcmFtOw0KPiA+
ID4gICAgICAgICAgc3RydWN0IGhkbWlfY29kZWNfcGRhdGEgY29kZWNfZGF0YSA9IHsNCj4gPiA+
ICAgICAgICAgICAgICAgICAgLm9wcyA9ICZtdGtfaGRtaV9hdWRpb19jb2RlY19vcHMsDQo+ID4g
PiAgICAgICAgICAgICAgICAgIC5tYXhfaTJzX2NoYW5uZWxzID0gMiwNCj4gPiA+IEBAIC0xNjI1
LDYgKzE2MTIsMTMgQEAgc3RhdGljIGludCBtdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIo
c3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ID4gICAgICAgICAgfTsNCj4gPiA+ICAgICAgICAgIGlu
dCByZXQ7DQo+ID4gPiANCj4gPiA+ICsgICAgICAgYXVkX3BhcmFtLT5hdWRfY29kZWMgPSBIRE1J
X0FVRElPX0NPRElOR19UWVBFX1BDTTsNCj4gPiA+ICsgICAgICAgYXVkX3BhcmFtLT5hdWRfc2Ft
cGxlX3NpemUgPSBIRE1JX0FVRElPX1NBTVBMRV9TSVpFXzE2Ow0KPiA+ID4gKyAgICAgICBhdWRf
cGFyYW0tPmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5QVVRfSTJTOw0KPiA+ID4gKyAgICAg
ICBhdWRfcGFyYW0tPmF1ZF9pMnNfZm10ID0gSERNSV9JMlNfTU9ERV9JMlNfMjRCSVQ7DQo+ID4g
PiArICAgICAgIGF1ZF9wYXJhbS0+YXVkX21jbGsgPSBIRE1JX0FVRF9NQ0xLXzEyOEZTOw0KPiA+
ID4gKyAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9DSEFO
X1RZUEVfMl8wOw0KPiA+ID4gKw0KPiA+ID4gICAgICAgICAgaGRtaS0+YXVkaW9fcGRldiA9IHBs
YXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKGRldiwNCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIRE1JX0NPREVDX0RSVl9O
QU1FLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFBMQVRGT1JNX0RFVklEX0FVVE8sDQo+ID4gPiBAQCAtMTYzOCw3ICsxNjMy
LDYgQEAgc3RhdGljIGludCBtdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoc3RydWN0IGRl
dmljZSAqZGV2KQ0KPiA+ID4gICAgICAgICAgaWYgKHJldCkNCj4gPiA+ICAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gPiA+IA0KPiA+ID4gLSAgICAgICBEUk1fSU5GTygiJXMgZHJpdmVy
IGJvdW5kIHRvIEhETUlcbiIsIEhETUlfQ09ERUNfRFJWX05BTUUpOw0KPiA+IA0KPiA+IFRoaXMg
bW9kaWZpY2F0aW9uIGlzIG5vdCByZWxhdGVkIHRvIHRoZSB0aXRsZS4gSWYgbmVjZXNzYXJ5LCBz
ZXBhcmF0ZSB0aGlzIHRvIGFub3RoZXIgcGF0Y2guDQo+ID4gQnV0IEkgZG9uJ3Qga25vdyB3aHkg
cmVtb3ZlIHRoaXMuIENvdWxkIHlvdSBleHBsYWluIG1vcmU/DQo+ID4gDQo+IA0KPiBJdCdzIGEg
Y2xlYW51cC4uLiBpZiBldmVyeSBkcml2ZXIgaW4gdGhlIGtlcm5lbCBzYWlkICJib3VuZCB0byIg
b3IgInJlZ2lzdGVyZWQiLA0KPiB0aGUga2VybmVsIGxvZyB3b3VsZCBiZSBleHRyZW1lbHkgbG9u
ZyBhbmQgdW5yZWFkYWJsZS4uLiBzbyB0aGF0J3Mgd2h5IHRoaXMgcHJpbnQNCj4gd2FzIHJlbW92
ZWQuDQo+IA0KPiBJIGNhbiBzZXBhcmF0ZSB0aGlzIHRvIGEgZGlmZmVyZW50IHBhdGNoIGlmIHlv
dSB3YW50LCBldmVuIHRob3VnaCB0aGF0J2QgYmUNCj4gb3ZlcmtpbGwsIGltby4NCg0KSXQncyBp
bXBvcnRhbnQgdG8gcmVkdWNlIGtlcm5lbCBsb2cuDQpBZnRlciBzZXBhcmF0ZSB0aGlzIHBhcnQs
IGlmIHNvbWVvbmUgd2FudCB0byBiYWNrcG9ydCB0aGlzIHRvIHJlZHVjZSBsb2csIGl0IHdvdWxk
IG5vdCBiYWNrcG9ydCB0aGUgd2hvbGUgcGF0Y2guDQpTbywgbGV0J3Mgc2VwYXJhdGUgaXQuDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0KPiANCj4gPiBSZWdhcmRz
LA0KPiA+IENLDQo+ID4gDQo+ID4gPiAgICAgICAgICByZXR1cm4gMDsNCj4gPiA+ICAgfQ0KPiA+
ID4gDQo+ID4gPiBAQCAtMTY2NywxMSArMTY2MCw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ICAgICAgICAgIG11dGV4X2lu
aXQoJmhkbWktPnVwZGF0ZV9wbHVnZ2VkX3N0YXR1c19sb2NrKTsNCj4gPiA+ICAgICAgICAgIHBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGhkbWkpOw0KPiA+ID4gDQo+ID4gPiAtICAgICAgIHJl
dCA9IG10a19oZG1pX291dHB1dF9pbml0KGhkbWkpOw0KPiA+ID4gLSAgICAgICBpZiAocmV0KQ0K
PiA+ID4gLSAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LA0KPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gaW5pdGlh
bGl6ZSBoZG1pIG91dHB1dFxuIik7DQo+ID4gPiAtDQo+ID4gPiAgICAgICAgICByZXQgPSBtdGtf
aGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2KTsNCj4gPiA+ICAgICAgICAgIGlmIChyZXQp
DQo+ID4gPiAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LA0K
PiA+ID4gLS0NCj4gPiA+IDIuNDcuMA0KPiA+ID4gDQo+ID4gDQo+IA0KDQo=
