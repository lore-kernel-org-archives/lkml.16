Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135DC2EF;
	Thu, 22 May 2025 02:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881789; cv=fail; b=SoCv4QUT9X+K+5iAugSQk8SLaKzLG4TJ+pltkMEyShzqCuDO2vf+JBL2wXmOXoWilbcqKGSoelTB9HX/J7PbCgeALa1bp+0SoeCyP9jOZebFOfuH5ZRDo9QFS+qYEKCjltYbGAxCdBqabQNr+ajVWXJqd6WBp1IrtoeNOMYk82w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881789; c=relaxed/simple;
	bh=yEyFH7DNoHmXzJNze25NMGrWA2pLGkhz8176n50s33c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DgdWQKqNIfytYTQeHL6z5K97Q6W4X/Es5me0FcV8vyuBzonjPX8jz6/WixhbX0q1bHMzGlXd9zqyDd+Ss9RUi/Ais9blB5AZk7UtfSMdUhnI33J18W1u+Jdq+y2VxANCDN1zIXsR5uJsxWZJnNG4fBXBGIvivktpc5yOC4Rnd/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dJPw71J9; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rFrTqQJU; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dJPw71J9";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rFrTqQJU"
X-UUID: 75f43b1236b611f082f7f7ac98dee637-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yEyFH7DNoHmXzJNze25NMGrWA2pLGkhz8176n50s33c=;
	b=dJPw71J9c94iPDwVQkI+Cgo/0POWrpjjekOaTCJDb+215MEVW8JRxDXDlklPWQ7czPjGS02Zd3hP/vOrf2JeDxhUmV1ql+dWtxqZbSgFntWCtJ6VMcNwmBXLp0If1i0HU6qh5aeVuYLSyKqMipeCKpaA6ZhwDji51vxu6D6C1y0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:73f1ad42-f7bc-4444-8b00-a310bb3a09e5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:17419747-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 75f43b1236b611f082f7f7ac98dee637-20250522
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016209405; Thu, 22 May 2025 10:42:53 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 10:42:52 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 22 May 2025 10:42:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk3cnG2gDJOt7juozTkoEnjFFunBYVN7+5pQYPf/D1iJFWK2cvD+aBGaI3MZ6hudO8iOtNYJNLXzxpgklPW/nbvjRvPPgLiaKJv2xxEWAEF8skV09YX22EZH6U4/YLB/dSr0WRMYK7ReLxIq558kF0Rt1HrEpUCVj+IEgs4Bz46HbcAX1aAiuBByEy/dpdHWvmzuyGbgxbdXwOQgqjBcLa3v/O7hk0seg1FxznRRUedFdYqkuBnh9jCUw4D7cv+iA48CPCb7PzSMLJL7tGjFU0K/Xii1VNt2ww9GSTrZVVeYnq17dUkBEqXQute+O3i0JdJz3Lre5rQv31+TcVZxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEyFH7DNoHmXzJNze25NMGrWA2pLGkhz8176n50s33c=;
 b=TNh7bYkqM64sFlrxHgArK2Cqib9RFleppF1TT6WDOlXyQckKQ6mKO9SR7whfneqNHELew0jtCiT6riMMTmmgLXHy55Nt24+RpdAshxremUFoVpvQa9neo4rFLJV74w7UIpCE4IkJNAYRtko4pj+PIt95+Bq0SenFeK4Yj8xPlg8DZiHxF+f6ArkQCHJEFMm51Fnk9XmMzjGFqFaG/fJfCerI7D9qXHKV+ndKsWH0NsPTzMOiK3aE4vX4tmAy00Fa6g8wFt55cOqzv7g2eX+ueOT9kiPaUKwBKvyp86m1OPWch9CUl2BVFSGnCFNOYnUkCDc6xeyEtV2U08SWxR+tDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEyFH7DNoHmXzJNze25NMGrWA2pLGkhz8176n50s33c=;
 b=rFrTqQJUAnDUv3j7qP02wsPCLyUxv9/QGEuKL3WMnJtF9QBz7jbLDDWJYFvYcBxyftPoeEzyZThOvbUGLqk8wCrGWShGTX5+u6ixE+1ZsZzcapMCn1z0eW3cvD2O/A9wfx5m6Sx2F7MJLMT1ZiAhSuptlTnUnIABoSS58Dn7G5U=
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com (2603:1096:990:3d::5)
 by SEZPR03MB8139.apcprd03.prod.outlook.com (2603:1096:101:180::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Thu, 22 May
 2025 02:42:49 +0000
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f]) by JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 02:42:46 +0000
From: =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
Thread-Topic: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
Thread-Index: AQHbyjEyndMMsz1dSUq7NQ3YpZ+K0rPc0HGAgAEhkAA=
Date: Thu, 22 May 2025 02:42:46 +0000
Message-ID: <ee9f04f90721963feeeb98e83a8d4fb38ee6617c.camel@mediatek.com>
References: <20250521091626.4283-1-friday.yang@mediatek.com>
	 <9c594eaa-9ddc-4340-ac0d-d911073764ac@collabora.com>
In-Reply-To: <9c594eaa-9ddc-4340-ac0d-d911073764ac@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7983:EE_|SEZPR03MB8139:EE_
x-ms-office365-filtering-correlation-id: ca99f3c0-6dea-4563-a53f-08dd98da55b6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TGVxSlFiaUtEYnBzNC9kQTRSd21MTUtZNGpORVVDNlloTTVkN2wwazlVV3Yw?=
 =?utf-8?B?Y2JyMDh6bWttSTVtZkk1bmhOQTFCRklDTll6VHMrS0NJM0I0b2ZSbjhVZ0o3?=
 =?utf-8?B?ZCs3dHVmZlo5d01WVDdRVCtWeUEvcEFxVkNKUHA2VjdXVDYwMFBJenI4YXF3?=
 =?utf-8?B?NXkyRXlJZjFzRzhveE93N3hqUVdQQVpKU1pHemJaSE83YUlET3NmRXhzdTRY?=
 =?utf-8?B?dkdSSW1JK2FLYnBkWGJZVXFXd3dLelkrL0p1bzJHUlQ0ZWRaMTB5VWthMVFY?=
 =?utf-8?B?d0taK2phTGZUSXlYdGNXdkhSYjlCSk5iVXR0ZU5SYjZISnpNU1hTNERlSGNO?=
 =?utf-8?B?aFRBaTh1Sm1mOVZKVk4za0pZMnAxK3VuUENRbjhxY045OXBueHNRT3cxSFQr?=
 =?utf-8?B?a3hOdlV4dncyY0VlQ1dnaHQ1RW1sUmFsK0JrYnRSNnFQUEZBNk5qWlBSaFZq?=
 =?utf-8?B?MXhPYkgzN0VpQ292NitrQ2txeWJsRW1iSElqTnhidmNsdi9meWltZnVZbjM3?=
 =?utf-8?B?dmxEcHliNzhCcDI0THVOQU1zblMybTk3U2JsZ281OFUwTVl3NVlVK0pYTEls?=
 =?utf-8?B?Y1lXdWFmZEhTVnZ5Z3hEU3ZkVXl4MFZhTy9FaUNINnp2SnozZGt2dnNLeUtq?=
 =?utf-8?B?VzUyWmtGVWNBSVNQRkxpSy8wZzZVTmVnK1VWNXZJV2NLNmdNZDlPamorWEdY?=
 =?utf-8?B?a3c5ajd4K2F4Qnh0RVRGbWZQWWQwYk9FSzN0c01HS1RQdmt4aG9RVGFVd0xi?=
 =?utf-8?B?NXRFMzJlclRDRUEwN29UNDZiNk1mWE9TQTVjVEh0RGJuS0ZGeWhFRFprZm5Z?=
 =?utf-8?B?L0hjNmxwbitNMS8yQjlNREkvT1ZWS0wySXNUMUN4M0Yvc2hndjh2SHBYVlEr?=
 =?utf-8?B?M0JmdDJkdURaRWJtSnpoeTVnSTUwWmtsVTBIOGJEeEU4SUVLMThJVHBabWNL?=
 =?utf-8?B?ZUhkS1JxNWt5bVpUMDRiY1FqdnhMdDkvRm1pN1JaS1pUQTg1ZXhxTU1UM3NB?=
 =?utf-8?B?TDUrUG1BQVgzblZyOU0razNrbEFkem1BZGZ4dTRpeEsxVzdXK3oxRWI3U1FV?=
 =?utf-8?B?V2NEcEtqa3BBQ1MzcDcxazF5N2cxTHNkK2RvWTlLVWJEMkdZU3dTL0plMjQ0?=
 =?utf-8?B?dHJHK2JSaTBsS1gwbStDZWhuM3RBalYzNjY5eC9NTFp4NUtnMjhRcjMvbS8z?=
 =?utf-8?B?bXpIY1JmVDVVY3YrbktEZ2lIakdLOUtzdythRGJ1UllSL1JSZ000K3U3cm1o?=
 =?utf-8?B?OXI5RXpRQ084N1pNRnV5MDhZS3pNK08wWDNvWW0vbjhrYUxvU0RSazlEZHB4?=
 =?utf-8?B?R2E1c1ZQUS9SS0pBRjdvZUxhck8xVVFURW8wY3lDd0FpNUJQN1VabXJFdWNT?=
 =?utf-8?B?UGpITTc4NTdYMHJIMmpYZDFRYjZzN3JTbk9CVm5uaW5pYVlEY2RHTGw2OThw?=
 =?utf-8?B?NFczd2FmQUkrT1FQczJzU2IrbUNwNUY5TGRld3BQNG0vcjdWQXU3a2FuOWQ4?=
 =?utf-8?B?bWJUcitrdUtsUy84aEwrODBXVzBQTGF0STlSU1c2WXN0V3JUaFpaamJqalJ0?=
 =?utf-8?B?Tjc0NUQ3M0luOFBKYXhRaWpyaUM3U2JrOENPTVk5cDFRWGRaN2QxSElzM2Vv?=
 =?utf-8?B?bzZENnF1YlVXajh5N0tJam5SaVM4Y1JrKzZYZ2xERmlHa2dyeUgxZ1V2cFRX?=
 =?utf-8?B?WWdqeWdNZjFWajllcjR6eTVsSmVHbHBqU0xGalVmQTJMUXFtdmplbEtQVzFl?=
 =?utf-8?B?ZmsrcEFBenJnM2JvTGRWMGhXcDBETHR4b1JJYzhzZ3hiTDZZelRhNlJ4WFlJ?=
 =?utf-8?B?U3Nzb0diWFFnMU1Tb2RzL08zdjQwNWUyamJzclZDZDdpRXFRZDNHWTI2V2Z5?=
 =?utf-8?B?VENzMEhuWjR0d1dXUVF4bnl0OWF2NDM5c0dJbDVEaHl2QmFzWGVmQkpvaFNp?=
 =?utf-8?B?eFd6d3ZFeWdKTk9PLy9QSG40Z0JuSjJ4bWsxdk5pS0ZuWEV4ZkEyTWEyZlVs?=
 =?utf-8?Q?LzMS5+BdnKbwzBBPcncsCCfWGco+gg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7983.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFh0akllOThGcExDNGpIUU0zR2g0eUd3NjlGVGg4ZmRYZ2xhY0R0NitRdnlY?=
 =?utf-8?B?c0ZHNUlQWGxWRWZuZmFtU2hkWmZFQkN6MzVTS1F6TElEQ3QydERzVk9LMFdK?=
 =?utf-8?B?cjhQeTRYc1hmU1lVQ1BuaExUb3M3YjFOM1U4ekZqRWpjWmFIWlByUWh5MlJX?=
 =?utf-8?B?Q1RFTW0yeFI3TUMvL2dLamdtOElxdk9YVDZxRjc3S2ZmR3BhSncrdGRGOVJQ?=
 =?utf-8?B?cWlwNG5WdHgrY2tMZlZ1N1R6b1pEMThPSm1nMzMzSmQ3M2psUDVCN01CaTRt?=
 =?utf-8?B?b1VSVG84K3dCTmtMRUFNdkEwR0dpZFZPaVhwOC8rS0FwVVRXTVFJYmpoNDhN?=
 =?utf-8?B?U1g1VDMwS21GUm5aLzNmbmdVeFArK2M1MHJsa0ptUFJSNitIenJmTHVySjVY?=
 =?utf-8?B?bFRraWJWUEE4TUhvSmJDdTdGOFp1Y2xIYitQcUxmLytGOWdPcjJvd0tEb2Vu?=
 =?utf-8?B?SExHa2Z1cmhjci9iaENocmkvNXFoQmRiMEJrOXEzYmxtZDFlNWtCNlpQdVhi?=
 =?utf-8?B?ZjRHVDQwMDNTYXVHb08veVc2eCtzeVBHU1p5bWxIWUY4L2VKV2Q3QXlGMnJv?=
 =?utf-8?B?dU1HeFQzdVNxOUdCWnFxd1Z3dmR4RmtaQ0d2eHN3MVM5ZlRaY25Nc2xoUlRR?=
 =?utf-8?B?aGFMQUs2d3p4UlhsNzhWQmc0QkE2YUF1cU93TlhZQlVoeW9sLzV6TTlFbW9Q?=
 =?utf-8?B?RzRLNFdCMzBHU1hvVXRUdXI2UkoyV0xVb0tIYVRhMldMNmkzQXFCRGJPOEZD?=
 =?utf-8?B?cE9vcXBWMmdraEdlQnllMjZsMXZtaVhVeGJseWxCS2oxVCtQeW9NVE0zQ1lx?=
 =?utf-8?B?cWsyNFVYUk9ielBnclVmaWVlRXFLdXdISU1GRmQ5Y1ljRUxNQmJpdnh4aVdq?=
 =?utf-8?B?ZmI5YjFjR3BTQXMzaXRQcFRNV2Q5SlZPTnVCMnJhQW11OUNwZTJMaEd5YTVO?=
 =?utf-8?B?U1hkRndrNWY0VkRONnhkaHlpMWVPVVdTekcyK3BNYXp2N3hHQ2xRQTVMcWtJ?=
 =?utf-8?B?T0hJdjNaWDc5WW5NeW9ZQ2FlNU56dm56WlkrWGJxWDNNSkNIVHgvd2d4bTlM?=
 =?utf-8?B?enMvbmZ2OWtXeXczUzFHeW56TjZON2MrRE56aU1JS1lKcndDWklFNjcrU3Z2?=
 =?utf-8?B?SUZMR0JnbFZzR0t2dnpRQm1mUnlPSU5PU2xjUXZrVWJjbW90dC9SYWFsU3lE?=
 =?utf-8?B?MlNvT1JNTkk5VitUd21uR1dHd0lURDZqZCs1NkhRT2E5RlBqNzI0TjA0eW1R?=
 =?utf-8?B?dGFkOTBvU1gwSklHeHFrblZHMUdKMXFyYlN3QkM5TjRzS2YxcklpQzJKaStp?=
 =?utf-8?B?OXpTQnhxWlkzRlduVGg5SDYzSEY3UUVRc01Fb2tDTFlaTVg0eGR0U2pDSllU?=
 =?utf-8?B?ZTBJTjRKYjByZHY4VXJFdG05ZUE5TThZcE9CRTNrT0k1TkxzSzhGVURMb3l2?=
 =?utf-8?B?WEE3L2FNL0dqN0duUzdjbEhZVUM4RjFBNVJRVTZybVdXcVJtZmdzdVJ2YXhO?=
 =?utf-8?B?Mzh3cjY4WXdvN3RQVmR6bTZrTVBmN0JEMGJ1b3lON2ljd0FuZDJ0U09TVm1P?=
 =?utf-8?B?blllQk12eHZZSy9HYTgzNFpnTG5jQUNtKyswTWN5NVVlOE1jclhpZVlIbjR2?=
 =?utf-8?B?MDZqTThjNnV3ZURBVk53UEwrbWlHbEVPeW1yL09kSGc5ZGxWU3lqaEEwb0xz?=
 =?utf-8?B?YjQ1UU1vUEkxOStPSktERCtBdW1OdFpWUzNkU3ZNSDZuTFBrRXpIRDMvSWxL?=
 =?utf-8?B?RXo5MU44bjVzZ2J2Zi85dmxOSFF0OUUzSXVqKy90SnNVUjRrR1pGYjY0OVlO?=
 =?utf-8?B?b0xSQXE1VjZSWkRUdTlWMWhHcnZVdTBEL0tjWlNUcytEdEVXbjI4RlNBN1Jy?=
 =?utf-8?B?blVMemtqYmVTRWN1OFd1M3NneGM5aXBQMnhuTWtybTJKN3FkdVp2SFN6dFlU?=
 =?utf-8?B?V0FCQTgxeXhPWGNiOUpsckcyZy9xcGdSWDZpZTRMK1RaTCtoYVhjcE5yclQr?=
 =?utf-8?B?eURPeUhhcWpDTkhiWlpRWHFyOGZPTTB4MjZwblg2eFRqSUFKS3N4OUN2RjFT?=
 =?utf-8?B?SGo4STVlUWdYN1o1cFBoZHJQZDZyYmF6dU1RYW9jYXZVUUtzZCsxeHo2K3NI?=
 =?utf-8?B?QXdPVEhLeGYwVlRaYkN6NDF6QlpKT0VJZHdkRnVxazY1c1hYelpKNzQyWVFK?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D75469ADD93A114BA38D317D78B44B66@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7983.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca99f3c0-6dea-4563-a53f-08dd98da55b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 02:42:46.4203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvIpMJ4M/zf0C0vNrQhuilo8ufINDPVEpnXTNHNl9VVrCmU60mIxGC+/9p/rZXEP5NvI4TRBAfeS2CYZGVIJFa6xGe53osAWmzDShp+LJpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8139

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDExOjI2ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyMS8wNS8yNSAxMToxNiwgRnJpZGF5IFlh
bmcgaGEgc2NyaXR0bzoNCj4gPiBBZGQgaW5pdGlhbCBvc3RkIHNldHRpbmcgZm9yIG10ODE4Ni4g
QWxsIHRoZSBzZXR0aW5ncyBjb21lIGZyb20gREUuDQo+ID4gVGhlc2Ugc2V0dGluZ3MgaGVscCBh
ZGp1c3QgTXVsdGltZWRpYSBIVydzIGJhbmR3aWR0aCBsaW1pdHMgdG8NCj4gPiBhY2hpZXZlDQo+
ID4gYSBiYWxhbmNlZCBiYW5kd2lkdGggcmVxdWlyZW1lbnQuIFdpdGhvdXQgdGhpcywgdGhlIFZF
TkMgSFcgd29ya3MNCj4gPiBhYm5vcm1hbCB3aGlsZSBzdHJlc3MgdGVzdGluZy4NCj4gPiANCj4g
PiBGaXhlczogODZhMDEwYmZjNzM5ICgibWVtb3J5OiBtdGstc21pOiBtdDgxODY6IEFkZCBzbWkg
c3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogRnJpZGF5IFlhbmcgPGZyaWRheS55YW5nQG1l
ZGlhdGVrLmNvbT4NCj4gDQo+IEkgYWdyZWUgYWJvdXQgdGhpcyBjb21taXQgYW5kIHlvdSBjYW4g
Z2V0IG15DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0K
PiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0KPiAuLi5idXQg
SSBzdGlsbCBoYXZlIGEgcXVlc3Rpb24uDQo+IA0KPiBUaGlzIGRyaXZlciBpcyBnZXR0aW5nIGxv
dHMgb2YgdGhvc2UgYmlnIE9TVEQgYXJyYXlzLCBhbmQgSSBjYW4NCj4gZm9yZXNlZSB0aGlzDQo+
IGdldHRpbmcgYmlnZ2VyIGFuZCBiaWdnZXIgd2l0aCBldmVyeSBuZXcgU29DIGdldHRpbmcgc3Vw
cG9ydGVkIGluDQo+IHRoZXJlLg0KPiANCj4gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCBob3cgd2Ug
Y2FuIGltcHJvdmUgdGhhdCwgaGVuY2UsIGNhbiB5b3UgcGxlYXNlDQo+IGRlc2NyaWJlDQo+IGhv
dyB0aGUgT1NURCB2YWx1ZXMgYXJlIGNhbGN1bGF0ZWQgYW5kIGhvdyBhcmUgdGhleSBsaW1pdGlu
ZyB0aGUNCj4gYmFuZHdpZHRoPw0KPiANCj4gSSdtIHRoaW5raW5nIHRoYXQgd2UgY2FuIGRvIHNv
bWV0aGluZyBzdWNoIHRoYXQgd2UgZ2V0IHRoaXMgcnVudGltZQ0KPiBjYWxjdWxhdGVkDQo+IGlu
c3RlYWQgb2YganVzdCBob2xkaW5nIGZpeGVkIHZhbHVlcywgc28gdGhhdCB3ZSBtYXkgZXZlbnR1
YWxseQ0KPiByZXBsYWNlIGFsbCB0aG9zZQ0KPiBiaWcgYXJyYXlzIHdpdGgganVzdCBhIGZldyB2
YWx1ZXMgKGZvcmVzZWVpbmcgMy00IHZhbHVlcykgYW5kDQo+IHBlcmZvcm1pbmcgYSBiaWcNCj4g
Y2xlYW51cCAod2hpY2ggbWF5IGJyaW5nIGZ1cnRoZXIgaW1wcm92ZW1lbnRzIGluIHRoZSBmdXR1
cmUpLg0KPiANCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCj4gDQoNClRoYW5rIHlvdSBmb3IgeW91ciBj
b21tZW50cy4NCk9TVEQgaW5kaWNhdGVzIHRoZSBudW1iZXIgb2YgY29tbWFuZHMgdGhhdCB0aGUg
U01JIExBUkIgaGFzIHJlY2VpdmVkDQpmcm9tIG1hc3RlcnMgYnV0IGhhcyBub3QgeWV0IHJlc3Bv
bmRlZCB0byBmcm9tIERSQU0uIFRoZSBTTUkgTEFSQiBoYXMgYQ0Kc2V0IG9mIHJlZ2lzdGVycyBm
b3IgZWFjaCBwb3J0IHRvIHNldCB0aGUgT1NURCB2YWx1ZS4gRm9yIGV4YW1wbGUsIGlmDQpPU1RE
IGlzIHNldCB0byAzLCB0aGVuIHRoZSBoYXJkd2FyZSBhbGxvd3MgMyBjb21tYW5kcyBpbiB0aGUg
RklGTyBmb3INCnRoYXQgTEFSQiBwb3J0Lg0KDQpGb3IgZWFjaCBTb0MsIHRoZSBFU0wgREUgc2lt
dWxhdGVzIGFwcGxpY2F0aW9uIHNjZW5hcmlvcyBhbmQgcHJvdmlkZXMNCmFuIGluaXRpYWwgT1NU
RCBzZXR0aW5nIHRvIHRoZSBzb2Z0d2FyZS4gVGhpcyBpcyBqdXN0IHRoZSBpbml0aWFsDQpjb25m
aWd1cmF0aW9uLiBXZSBoYXZlIE1NUW9TIHNvZnR3YXJlIHRoYXQgZHluYW1pY2FsbHkgYWRqdXN0
cyB0aGUNCmJhbmR3aWR0aCBhbmQgc2V0cyB0aGUgT1NURC1yZWxhdGVkIHJlZ2lzdGVycyBvZiBT
TUkuIEluIHRoZSBNVDgxOTYsDQpNTVFvUyB3aWxsIHNlbmQgdXBzdHJlYW0uIEhvd2V2ZXIsIGlu
IHNvbWUgcHJvamVjdHMsIHRoZSBNTVFvUyBtb2R1bGUNCmlzIG5vdCBlbmFibGVkLCBzbyB3ZSBu
ZWVkIHRvIHByb3ZpZGUgdGhpcyBpbml0aWFsIE9TVEQgc2V0dGluZyB0bw0KYWNoaWV2ZSBhIGJh
bGFuY2VkIGJhbmR3aWR0aCByZXF1aXJlbWVudC4gU2luY2Ugd2UgZG8gbm90IGhhdmUgYQ0KZm9y
bXVsYSB0byBjYWxjdWxhdGUgT1NURCwgaXQgaXMgZGlmZmljdWx0IGZvciBTTUkgdG8gY2FsY3Vs
YXRlIE9TVEQgYXQNCnJ1bnRpbWUuDQoNCllvdSBhcmUgcmlnaHQsIHRoZSBTTUkgZHJpdmVyIGNv
dWxkIGJlY29tZSBsYXJnZXIgaWYgd2UgaGF2ZSB0byBhZGQNCnRoaXMgT1NURCBhcnJheS4gSG93
IGFib3V0IGFkZGluZyBhbiBPU1REIHNldHRpbmcgaW4gdGhlIGRldmljZSB0cmVlPw0KRm9yIGV4
YW1wbGUsIHdlIGNvdWxkIGFkZCBhIG1lZGlhdGVrLHNtaS1vc3RkIGFycmF5IHByb3BlcnR5IGZv
ciBlYWNoDQpTTUkgTEFSQiBhbmQgU01JIGNvbW1vbi4gVGhpcyB3b3VsZCBiZSBtb3JlIGZlYXNp
YmxlIGZvciB1cy4gSXMgdGhpcw0KYWNjZXB0YWJsZSB0byB5b3U/DQoNCkJlc3QgcmVnYXJkDQpG
cmlkYXkgWWFuZw0KDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL21lbW9yeS9tdGstc21pLmMgfCAz
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5
L210ay1zbWkuYyBiL2RyaXZlcnMvbWVtb3J5L210ay1zbWkuYw0KPiA+IGluZGV4IGMwODZjMjI1
MTFmNy4uNzMzZTIyZjY5NWFiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVtb3J5L210ay1z
bWkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L210ay1zbWkuYw0KPiA+IEBAIC0zMjAsNiAr
MzIwLDM4IEBAIHN0YXRpYyBjb25zdCB1OA0KPiA+IG10a19zbWlfbGFyYl9tdDY4OTNfb3N0ZFtd
W1NNSV9MQVJCX1BPUlRfTlJfTUFYXSA9IHsNCj4gPiAgICAgICBbMjBdID0gezB4OSwgMHg5LCAw
eDUsIDB4NSwgMHgxLCAweDF9LA0KPiA+ICAgfTsNCj4gPiANCj4gPiArc3RhdGljIGNvbnN0IHU4
IG10a19zbWlfbGFyYl9tdDgxODZfb3N0ZFtdW1NNSV9MQVJCX1BPUlRfTlJfTUFYXSA9DQo+ID4g
ew0KPiA+ICsgICAgIFswXSA9IHsweDIsIDB4MSwgMHg4LCAweDEsfSwNCj4gPiArICAgICBbMV0g
PSB7MHgxLCAweDMsIDB4MSwgMHgxLH0sDQo+ID4gKyAgICAgWzJdID0gezB4NiwgMHgxLCAweDQs
IDB4MSx9LA0KPiA+ICsgICAgIFszXSA9IHt9LA0KPiA+ICsgICAgIFs0XSA9IHsweGYsIDB4MSwg
MHg1LCAweDEsIDB4MSwgMHgxLCAweDEsIDB4MSwgMHgxLCAweDEsIDB4MSwNCj4gPiArICAgICAg
ICAgICAgMHgxLCAweDEsIDB4MSx9LA0KPiA+ICsgICAgIFs1XSA9IHt9LA0KPiA+ICsgICAgIFs2
XSA9IHt9LA0KPiA+ICsgICAgIFs3XSA9IHsweDEsIDB4MywgMHgxLCAweDEsIDB4MSwgMHgzLCAw
eDIsIDB4ZCwgMHg3LCAweDUsIDB4MywNCj4gPiArICAgICAgICAgICAgMHgxLCAweDUsfSwNCj4g
PiArICAgICBbOF0gPSB7MHgxLCAweDIsIDB4Mix9LA0KPiA+ICsgICAgIFs5XSA9IHsweDksIDB4
NywgMHhmLCAweDgsIDB4MSwgMHg4LCAweDksIDB4MywgMHgzLCAweGIsIDB4NywNCj4gPiAweDQs
DQo+ID4gKyAgICAgICAgICAgIDB4OSwgMHgxLCAweDEsIDB4MSwgMHgxLCAweDEsIDB4MSwgMHgx
LCAweDEsIDB4MSwgMHgxLA0KPiA+IDB4MSwNCj4gPiArICAgICAgICAgICAgMHgxLCAweDEsIDB4
MSwgMHgxLCAweDEsfSwNCj4gPiArICAgICBbMTBdID0ge30sDQo+ID4gKyAgICAgWzExXSA9IHsw
eDksIDB4NywgMHhmLCAweDgsIDB4MSwgMHg4LCAweDksIDB4MywgMHgzLCAweGIsDQo+ID4gMHg3
LCAweDQsDQo+ID4gKyAgICAgICAgICAgICAweDksIDB4MSwgMHgxLCAweDEsIDB4MSwgMHgxLCAw
eDgsIDB4NywgMHg3LCAweDEsDQo+ID4gMHg2LCAweDIsDQo+ID4gKyAgICAgICAgICAgICAweGYs
IDB4OCwgMHgxLCAweDEsIDB4MSx9LA0KPiA+ICsgICAgIFsxMl0gPSB7fSwNCj4gPiArICAgICBb
MTNdID0gezB4MSwgMHgxLCAweDEsIDB4MSwgMHgxLCAweDEsIDB4NiwgMHg2LCAweDYsIDB4MSwN
Cj4gPiAweDEsIDB4MSx9LA0KPiA+ICsgICAgIFsxNF0gPSB7MHgxLCAweDEsIDB4MSwgMHgxLCAw
eDEsIDB4MSx9LA0KPiA+ICsgICAgIFsxNV0gPSB7fSwNCj4gPiArICAgICBbMTZdID0gezB4Mjgs
IDB4MTQsIDB4MiwgMHhjLCAweDE4LCAweDEsIDB4MTQsIDB4MSwgMHg0LCAweDQsDQo+ID4gMHg0
LA0KPiA+ICsgICAgICAgICAgICAgMHgyLCAweDQsIDB4MiwgMHg4LCAweDQsIDB4NCx9LA0KPiA+
ICsgICAgIFsxN10gPSB7MHgyOCwgMHgxNCwgMHgyLCAweGMsIDB4MTgsIDB4MSwgMHgxNCwgMHgx
LCAweDQsIDB4NCwNCj4gPiAweDQsDQo+ID4gKyAgICAgICAgICAgICAweDIsIDB4NCwgMHgyLCAw
eDgsIDB4NCwgMHg0LH0sDQo+ID4gKyAgICAgWzE4XSA9IHt9LA0KPiA+ICsgICAgIFsxOV0gPSB7
MHgxLCAweDEsIDB4MSwgMHgxLH0sDQo+ID4gKyAgICAgWzIwXSA9IHsweDIsIDB4MiwgMHgyLCAw
eDIsIDB4MSwgMHgxLH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICAgc3RhdGljIGNvbnN0IHU4IG10
a19zbWlfbGFyYl9tdDgxODhfb3N0ZFtdW1NNSV9MQVJCX1BPUlRfTlJfTUFYXQ0KPiA+ID0gew0K
PiA+ICAgICAgIFswXSA9IHsweDAyLCAweDE4LCAweDIyLCAweDIyLCAweDAxLCAweDAyLCAweDBh
LH0sDQo+ID4gICAgICAgWzFdID0gezB4MTIsIDB4MDIsIDB4MTQsIDB4MTQsIDB4MDEsIDB4MTgs
IDB4MGEsfSwNCj4gPiBAQCAtNDkxLDYgKzUyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X3NtaV9sYXJiX2dlbg0KPiA+IG10a19zbWlfbGFyYl9tdDgxODMgPSB7DQo+ID4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19zbWlfbGFyYl9nZW4gbXRrX3NtaV9sYXJiX210ODE4NiA9IHsNCj4g
PiAgICAgICAuY29uZmlnX3BvcnQgICAgICAgICAgICAgICAgPQ0KPiA+IG10a19zbWlfbGFyYl9j
b25maWdfcG9ydF9nZW4yX2dlbmVyYWwsDQo+ID4gICAgICAgLmZsYWdzX2dlbmVyYWwgICAgICAg
ICAgICAgID0gTVRLX1NNSV9GTEFHX1NMRUVQX0NUTCwNCj4gPiArICAgICAub3N0ZCAgICAgICAg
ICAgICAgICAgICAgICAgPSBtdGtfc21pX2xhcmJfbXQ4MTg2X29zdGQsDQo+ID4gICB9Ow0KPiA+
IA0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfc21pX2xhcmJfZ2VuIG10a19zbWlfbGFy
Yl9tdDgxODggPSB7DQo+ID4gLS0NCj4gPiAyLjQ2LjANCj4gPiANCj4gDQo+IA0K
