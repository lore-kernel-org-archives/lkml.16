Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC04187332;
	Fri,  7 Feb 2025 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738907173; cv=fail; b=V1HLihQ05K37Ca71MnqRQ11ERvcolDoUM5sWDmNl/WFqUqZ5H9TrWSpr32oJbeZw6WI8PhiNhwkGvJxXFI7EIyhLnV0/7rHzdqaA5ertvDf2R07BsP4hkFPI4w1a983/wIViebAVWpzAbASukafALiQOh+DueKS5xe5nZVijsbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738907173; c=relaxed/simple;
	bh=nCy3G0/Ag4th7mohGXAe5tLYgM4Udxnmb8DfKM/1rkA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IJgDKd4yqwpdTPFKNKdRz8qgohafQyGmVRYh9sKXxONsQ7MVxIemntMYjne6k0Nj5vz9XtrZZ+tPoROE6WX1nESGs7LEqn3ROTYlCPGJewCmHFNCIPiQfXla6MId1tyNCap+BgUtCp6705eoBvAzaTHnM3TBOQFS2aIxfi6++9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JqAyLtbC; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Lh+TYQ7K; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JqAyLtbC";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Lh+TYQ7K"
X-UUID: d237cc0ae51611efb8f9918b5fc74e19-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nCy3G0/Ag4th7mohGXAe5tLYgM4Udxnmb8DfKM/1rkA=;
	b=JqAyLtbC6Nnm0WhH/PVPhKKQg8CPVIIW7/h9WaBJlvjCLeZK8H4+pIt2tVlGeo5Xe/u8eFAHtLTvjFqKObV2JLvsqOBm7GB8gR39xiIKYoMcpyVSNIpQjrbGUT8AmPBfQ63H66K2srSvQktDhuj8I8y/QNrQipOPTcF3WJv1c7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b9b30a64-d69a-47b8-9961-9206e54c7246,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:8b692e3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d237cc0ae51611efb8f9918b5fc74e19-20250207
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1424417442; Fri, 07 Feb 2025 13:46:05 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 13:46:03 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 13:46:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9KvPQ+fYsv378WGq4j6kzZlEZl++nQ3G4RXdRbw3f2VgmSqM8cwYw5J5mmrGucBK5lzDuyBHBpeyGoRUrEdNsYqdJ3wPny1gINo4ECv/TWxoSoyD4FVm5NE1bImew2eNc6yBm1mZE7mhmTclhF30G1CxAJLNnbsXjyVIumqFTfU3Ul6ALm/EdlXO54ZN6QRweFk77gk/TS+O+OyrBGVd6URKuRSPZK7V6O5NO056fvxCwuxDM9kDfpuiJkhSDUReOV16vtMGQb5Bp41bFt58TsYG/K9cvU6uGWZ74oca4pDtdeL1q070Du9305VxCqaOVv+ByqyBNgXB9F6EgfRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCy3G0/Ag4th7mohGXAe5tLYgM4Udxnmb8DfKM/1rkA=;
 b=ypW9iCuBw8WpCCe3mgoH+t1jVENFbQJ1B4gG8xPO49zj6PXeR+KPynXb5iIJ7RCG4AMaek9oOyL7Mp1YfZ09oV07cCJJ2PuX2ZPcVj6qhHrRheJuE6mucM30Yu/6TYC0ReYJVoRSgyPp+4Yjq7vobQKwvsC2F+Wjasmx2vffYlmasZkx5lutLyxeq2zCsI7ITVuv5/eqwragETIm0WY9ULQTrlT0G9r8yUQMljUQLFg2i5LnI4cixfjvQVNLmQIRWXGVfhFmAfYMq75azaHrFJmYuoGo82IX1SK2YJqfpzTrwMmdffld9kDxxUJ9/HMIPVx/9lwypKFXIkDTkJYQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCy3G0/Ag4th7mohGXAe5tLYgM4Udxnmb8DfKM/1rkA=;
 b=Lh+TYQ7KdySljnChVps02YN4DGG91rLs87eaSAwjiG4bm97cgTBf4ku9SUWRfx0LB6GGfn2dN6oyNOno9ZUE0ZEee+y8RglH1AZKJrJFxfbvTruyheVIXL+e4qfGh2lg1ZIlJuvJ4ik+YxWoRMq9h94hxxgQoe85jthOQT8WsN8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7678.apcprd03.prod.outlook.com (2603:1096:101:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 05:46:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 05:46:00 +0000
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
Subject: Re: [PATCH v5 23/34] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Thread-Topic: [PATCH v5 23/34] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Thread-Index: AQHbZcr6tppprJBqKkeVRqIsUoAQcLM7e4qA
Date: Fri, 7 Feb 2025 05:46:00 +0000
Message-ID: <1d5a94f3b974d4617a58f2d9dfc54d5dc889f18a.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-24-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7678:EE_
x-ms-office365-filtering-correlation-id: 3125508c-e09e-41a1-b0f9-08dd473ab3a0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VHdDZnh4YzdWbUpicUE3TjdCM2Z0a2Y3dkdOem5Gb1VrdEM4TUJUTTliNldM?=
 =?utf-8?B?cSsvREpSZlZvQTZlQkZ2cG9ybFk1SDZyZWJqaytvUnZKazd6Rm1QQmNFQTFx?=
 =?utf-8?B?MGxVRTV3SVdFaFpDT1dnVHVVOWlkV3JlVVR4YkZpQlpBays4SjFQYWJPRmZL?=
 =?utf-8?B?MmFuZU9VeXBLZ3M0ViszTElobDUySStEbTRuditpSEtIWUN4LzNPUklUbDRT?=
 =?utf-8?B?NXJGazd1Vk42RklyMyttbVZIS0M4cmxWVTZZbHpnUGRWNis5V21Qd1VmNjV5?=
 =?utf-8?B?YlJoRnRJUk9ubEFDY21jZ1JlSVdKU2xCR2pEVEdzeDhIRmF1cEo0MEdQQjlk?=
 =?utf-8?B?Q2w3ZUxkcnNONUZ1cUd1VHVWbExQaTlHWFNOOERLMVNKdW4vN1R5Qk5EbnFW?=
 =?utf-8?B?ZU13U1duNllkNzJJT2x6bzRuTHdSWWxiWDFlMWcvVzN3Z0dzN2ZpSzA3aTFV?=
 =?utf-8?B?RGo0NDlJYWdwZWFhYVZMS2hVbFhpd2ZFZ3FUbVhFMHloZ2VCUEYyYThJR0ZJ?=
 =?utf-8?B?bWlDU1hZRWVaVkJ1RTZRYXFvVFB1YmEvSXV4amswSVg1QmpzdUdjb1FSSUEw?=
 =?utf-8?B?OVhsWnNId3h1TDB0VnVheVh0cnFtQnhWSWYzZDV3bGtvQVR3VTJOaXJjaVRq?=
 =?utf-8?B?dWpncWVQRDhiM2tMUUtpYVJWUTBKTWduVGdJTGNZWUZiQlRoazBpcHZBbEpz?=
 =?utf-8?B?bi96UkVudytTV0prdHN6NnNCQTVvUHZwOExSTUtCTTc4czVWQmxsY0s4V2lV?=
 =?utf-8?B?ZitBeGpLaWdyTjJHYXdEMWxVTVdkUUtCUjlPN2kyZ0FMeDMxYXRyRjg2bHBP?=
 =?utf-8?B?NGhpS2QrZ0dyS0p6T0dKVzVMTktMaUdEdlQxRndnVklVWE5jdXBZSUU1Qnps?=
 =?utf-8?B?WDNjUjJ5T3BhT1JMOTIvcEJHcGQ1SVY0SE82RWZVY21EUWwyemJqMEtoVCtM?=
 =?utf-8?B?aHRDY3NWclU1NXB6L0k0bnRiTjNvbkRzT2l1SnViRkU4bVVYVzJlWXppSEY0?=
 =?utf-8?B?TVpUVzNMUllXdTNjVE1DdWVORWFFMGtpckIvQnhmaEhHOUczRlVvaGphOXpO?=
 =?utf-8?B?TldONTZMNmYzdzIxQlA5RlJ6UzgxOTlabFhUSnE4N1pSc3M4NGZrWGJCQjlk?=
 =?utf-8?B?M1pCNXVsajdWRVBJN0NNbFVDRmdpQ2tsUkNGVkNRSHE3ZkUxR0tvMG51RXds?=
 =?utf-8?B?aGhtZDlxTEpYbkRpOGNzVXZKbFZQMFNZYS9aWDV5RnI3bWdjNmpxMzV4U0Nn?=
 =?utf-8?B?OFF0eVBoSGIvMzVWdEdLTURlWjdvU05oMUJqK0xjSnlVYnJ0bEZnVDRGM3VG?=
 =?utf-8?B?YkNHT1NkL3FVTWFnL3FxSzNFNGtVUkJEUk1QMDg3NWRJMndmRmQvZitJWkVs?=
 =?utf-8?B?RDFkSWVhSGJCR0NPR2xLaTh1SGFYN2lxR2puejNVWTcvbjBPOGZJbXFFR3FT?=
 =?utf-8?B?ZzYySlpRRUdqNXExd0hkMlpSMnF5WUZOL1ZjTCtYYkwxa0dWY2hNVzJGQWtk?=
 =?utf-8?B?MXVYa3lXYVJOZTkyMGszUlJpK0ZIY25Nc0ZCd25KOGd5Mm04MEtqeFZBMURw?=
 =?utf-8?B?azVtWC9rNE1EYTRxOXUvMzVsVFBVMys3Z2k1R0c1QW1uU2dITGtHMlVOcHQr?=
 =?utf-8?B?ajFQeER1ejVudi8zOXN5R2dhdWpWV2N6Wk5aYU1mcnRrMzc4dklHL0hPOW5J?=
 =?utf-8?B?MVI3L0hGZ0ZSY0hjRkVxOXlaZkVHdUErcmc4MkVIdTdPeTF3bFdpd0syZjlm?=
 =?utf-8?B?bXVJNnB0YVpvUmcwcEwvN29Md3k1ZnNPVVBLT0EzckE5dmdvVXFSR3Y4Z1R5?=
 =?utf-8?B?YWxBN0F6YWhWQ0pMeFh1U3kzTUVrSmlMdnRPeXRqWS9vU1U1Mkd3cUJGZGhZ?=
 =?utf-8?B?dWcxZ3h0dkszQzI0Y3RFcFgvSW01OENlRGgyWm5mVXpmODlEKytFc2srVUp4?=
 =?utf-8?Q?IjVrA0crQIrYR20fLFnbmSXPe//9UydY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDU5OEpZKzVvZEpIWVlWQTBlL3BWWUttRENUTTFOM3FrSWp0bS92TTNQWElo?=
 =?utf-8?B?Y3dCd2h1RFUzV2xad0crbkpwMDhwcHVIRnRJNTZrL1BCSzJmeUdtR0dtSWR2?=
 =?utf-8?B?ZmZPV3o1cFlZRWo1UCtZSTVZZzZrOWNiS1hqVGFBNVBWZGt6WHFEdGNmcjNZ?=
 =?utf-8?B?aFQ3bTB2ak5WWm9hcFFlSjhlcWE1QmExc3BtUVdibDhLVE1VZkY3M2dXb3Zs?=
 =?utf-8?B?NFJnWDV1ZjFsZlE3SWJwZ0xHZnlWc3ZVSEdqTDVmWm9MYlNWUkpZTjhNemll?=
 =?utf-8?B?WVJHdEIrdUNhT01mWFhmQkZKbmZuelB3S2pTRERmTStWTEwrYm9QSGNYMHBJ?=
 =?utf-8?B?SGgrZHRCZjh5TEM2amVDMk5nYTdYZVdVTG1kN3JTenJpMFdXVWg5bVFvaVVH?=
 =?utf-8?B?eHlDMUZpZmd3TFZaK0x5WW91eHZPMlM2T29nSnZza0tTN2pITmVNc1ZDZmRp?=
 =?utf-8?B?STk1QlFKMmlXSVZqTkpEMGRvNkFCSHNycTRRTVF4eCt4eU01Ym0vcFJidlEv?=
 =?utf-8?B?Wm9ma3JCdGFhbWR2OVB4bG9ZK0NSMkFoMDQzY1o5NW12aTdGdmdzbkhMQnYr?=
 =?utf-8?B?UUc1L1lSVlc0VkZSdXZHQ3NrVHNQakVBK3o3S2pncEIwQ29sWDQwU1RBOWRM?=
 =?utf-8?B?RXl3K0VhaGVVZU9KSlNQU2Q5ZXdtTDJTSzIvamdwWFpQZ2NNb3JBdWxOSjNV?=
 =?utf-8?B?OWw5U1pRdWRPNkdmQlRzazhCRy8vUVhqdmZhMWkxcWxybXptdHZ3QlVydmFy?=
 =?utf-8?B?U1IxV2d6Q2lhdDJERzB4dTErZEwrVTdZRk9jYTVzdG1hY2RnRjJNRjlhdEo4?=
 =?utf-8?B?MmFNS0ZWOUxDeGEwSVNtOE9pNWQ4aldqY1VyTjFPTDczZS9UcngwZUhXd01C?=
 =?utf-8?B?clZSZWtsdHNZSUJaV0xxaUpVeFh2eXpxb2VQUEpyUlIvQ2J5RURlK2FNTllD?=
 =?utf-8?B?UnBqNUpSZVc0OENvOXM2UlNMY2ZTcXg5WjhWazVCQ1d2eCtpenIxVWlpMkxn?=
 =?utf-8?B?RXIxZXczcys5SkdIS2hURHVOTUhoVnl0UlJuWWxPZDBzTEZKa21kVXpabGpq?=
 =?utf-8?B?RkhqMnRYa2pNU2o4algwWnJBWU80UEJRcnl5MjJsTUZnM09Ia3pXV3d6dHow?=
 =?utf-8?B?amh4TkhsSWR2Q3lHdXNWNlJVT3NDYjBTQWlkTXFZMjAwaFRCMGdKcG5RNytM?=
 =?utf-8?B?c1hMR0xFSHovQkUxTGczR0ZvdUZZM2dtdWwxb2dScVhGcVlmYnFOT0pXcjRt?=
 =?utf-8?B?M0xzeDRabTZ1ckw3OGR5R09vV1d2MG1yaEx1YVFaMDRpY1VXWmRveVFNaVo3?=
 =?utf-8?B?bUFVTkhFdWRIYVR4MDl3anVGeDJNVjZ4QkF6N3NCYkNMR2l4U3IrendwUDZ5?=
 =?utf-8?B?c2lWUUI3QmNNaGtFSmxEdDQzQXAxNzgrWmdNdDJiOVpQbW5uOWR0ZWcyVG9u?=
 =?utf-8?B?L1YvSmtrRyt0NW9NNDZYZUlUN3pNNGd2Y3oxbkI0WUNUbjNvaHhmSkNhOW1j?=
 =?utf-8?B?bTM3VWh1NElTRE5HdThzdEFwSW81ZWJ1RXNQejN3WVlNREJzTnUrN3NvYjhP?=
 =?utf-8?B?N2NOQ3ZNRENtT2VxYW9UY3F5QmExVjdpVHh1SitrQ3dYc0g3aDdmUmRwOVF5?=
 =?utf-8?B?QVU5VVpkUS9Ia2RJcHY4WjdFRFhMWmk4em9CQXpxb3RSbVpMR1NMdVUrZlEr?=
 =?utf-8?B?cFR3a29jREY5QW1tRzByeGxoR1BxanBIbUdKVVB0S0JsaXQza3phSkFvdVl3?=
 =?utf-8?B?Y0ROZmk4bzhCTFhObUpxcUg0enNiUVFZQnBwMGhkVk5YYWtNeVVRd3ArQjRr?=
 =?utf-8?B?SnNhbmFFK3pKOEN1MjB3bTJKRkswNXBNa050d2RUYmVHRDZzd0lvRE9DTlRQ?=
 =?utf-8?B?K0o2TWhNUVl3Vnc1YnkzQkVmcnhmSVl6dVIvWWlDY2dPUDAwZXE0cmkyT0lX?=
 =?utf-8?B?akl3L2p3UzFUSitkdHI1ZERVcU1VYWh2bzhaWkpwY05rYUlEVXcvcjFOZ0RS?=
 =?utf-8?B?VFg0SEYvUEpSVTBKM3lUS2xGdXp4SjJ3OHNPWVJWbWNRZWEraFJzUzlPSWdX?=
 =?utf-8?B?ZjRqZjZOaEZtN1EvNWlZS3duNEpJNDZPbkcwOFhaMjVHSDNKcFY2VGYvNnVs?=
 =?utf-8?Q?S3KScAGbcdq1M4xmcMhj48LtP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E28E50F3C269A44B902FFA66B9283DEC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3125508c-e09e-41a1-b0f9-08dd473ab3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 05:46:00.3390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZN1t61eEm50KCe5K2ZsLJHrFHvuLG773mZWTrhpFMnfx3JzoAySpgReBuWLdlLQhV+YJChdOLitCMmZCr6pWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7678

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgbW92aW5nIHRoZSBjb21tb24gYml0cyBvZiB0aGlzIGRyaXZlciwgbWVyZ2UgdGhlDQo+IGNv
bnRlbnRzIG9mIG10a19oZG1pX291dHB1dF9pbml0IGluIG10a19oZG1pX3JlZ2lzdGVyX2F1ZGlv
X2RyaXZlcg0KPiBmdW5jdGlvbiB0byBhZ2dyZWdhdGUgYWxsIG9mIHRoZSBpbml0aWFsIGF1ZGlv
IHNldHVwIHRvZ2V0aGVyIGluDQo+IHRoZSBzYW1lIGZ1bmN0aW9uIGFuZCB0byBtYWtlIGl0IGNs
ZWFyIHRoYXQgYWxsIG9mIHRoZSBzZXR1cCB0aGF0DQo+IGlzIHBlcmZvcm1lZCBpbiBtdGtfaGRt
aV9vdXRwdXRfaW5pdCBpcyBzcGVjaWZpY2FsbHkgcmVsYXRlZCBvbmx5DQo+IHRvIGF1ZGlvIGFu
ZCBub3QgdmlkZW8uDQo+IA0KPiBXaGlsZSBhdCBpdCwgYWxzbyByZW1vdmUgdGhlICIlcyBkcml2
ZXIgYm91bmQgdG8gSERNSSIgZGVidWdnaW5nDQo+IHByaW50IGRpc2d1aXNlZCBhcyBpbmZvcm1h
dGl2ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCAyOCArKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGluZGV4IGUyMzkzZjc1
NThmOS4uNDM0NWM5MWU5MmU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Yw0KPiBAQCAtMTAyNSwyMCArMTAyNSw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfc2V0dXBfdmVu
ZG9yX3NwZWNpZmljX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksDQo+ICAgICAgICAg
cmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBtdGtfaGRtaV9vdXRwdXRfaW5pdChz
dHJ1Y3QgbXRrX2hkbWkgKmhkbWkpDQo+IC17DQo+IC0gICAgICAgc3RydWN0IGhkbWlfYXVkaW9f
cGFyYW0gKmF1ZF9wYXJhbSA9ICZoZG1pLT5hdWRfcGFyYW07DQo+IC0NCj4gLSAgICAgICBhdWRf
cGFyYW0tPmF1ZF9jb2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiAtICAgICAg
IGF1ZF9wYXJhbS0+YXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0laRV8xNjsN
Cj4gLSAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5QVVRfSTJT
Ow0KPiAtICAgICAgIGF1ZF9wYXJhbS0+YXVkX2kyc19mbXQgPSBIRE1JX0kyU19NT0RFX0kyU18y
NEJJVDsNCj4gLSAgICAgICBhdWRfcGFyYW0tPmF1ZF9tY2xrID0gSERNSV9BVURfTUNMS18xMjhG
UzsNCj4gLSAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9D
SEFOX1RZUEVfMl8wOw0KPiAtDQo+IC0gICAgICAgcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gIHN0
YXRpYyB2b2lkIG10a19oZG1pX2F1ZGlvX2VuYWJsZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkpDQo+
ICB7DQo+ICAgICAgICAgbXRrX2hkbWlfaHdfc2VuZF9hdWRfcGFja2V0KGhkbWksIHRydWUpOw0K
PiBAQCAtMTYxNiw2ICsxNjAyLDcgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfdW5yZWdpc3Rlcl9h
dWRpb19kcml2ZXIodm9pZCAqZGF0YSkNCj4gIHN0YXRpYyBpbnQgbXRrX2hkbWlfcmVnaXN0ZXJf
YXVkaW9fZHJpdmVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKyAgICAgICBzdHJ1Y3Qg
aGRtaV9hdWRpb19wYXJhbSAqYXVkX3BhcmFtID0gJmhkbWktPmF1ZF9wYXJhbTsNCj4gICAgICAg
ICBzdHJ1Y3QgaGRtaV9jb2RlY19wZGF0YSBjb2RlY19kYXRhID0gew0KPiAgICAgICAgICAgICAg
ICAgLm9wcyA9ICZtdGtfaGRtaV9hdWRpb19jb2RlY19vcHMsDQo+ICAgICAgICAgICAgICAgICAu
bWF4X2kyc19jaGFubmVscyA9IDIsDQo+IEBAIC0xNjI1LDYgKzE2MTIsMTMgQEAgc3RhdGljIGlu
dCBtdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAg
ICAgICAgIH07DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+ICsgICAgICAgYXVkX3BhcmFtLT5h
dWRfY29kZWMgPSBIRE1JX0FVRElPX0NPRElOR19UWVBFX1BDTTsNCj4gKyAgICAgICBhdWRfcGFy
YW0tPmF1ZF9zYW1wbGVfc2l6ZSA9IEhETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQo+ICsgICAg
ICAgYXVkX3BhcmFtLT5hdWRfaW5wdXRfdHlwZSA9IEhETUlfQVVEX0lOUFVUX0kyUzsNCj4gKyAg
ICAgICBhdWRfcGFyYW0tPmF1ZF9pMnNfZm10ID0gSERNSV9JMlNfTU9ERV9JMlNfMjRCSVQ7DQo+
ICsgICAgICAgYXVkX3BhcmFtLT5hdWRfbWNsayA9IEhETUlfQVVEX01DTEtfMTI4RlM7DQo+ICsg
ICAgICAgYXVkX3BhcmFtLT5hdWRfaW5wdXRfY2hhbl90eXBlID0gSERNSV9BVURfQ0hBTl9UWVBF
XzJfMDsNCj4gKw0KPiAgICAgICAgIGhkbWktPmF1ZGlvX3BkZXYgPSBwbGF0Zm9ybV9kZXZpY2Vf
cmVnaXN0ZXJfZGF0YShkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEhETUlfQ09ERUNfRFJWX05BTUUsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBMQVRGT1JNX0RF
VklEX0FVVE8sDQo+IEBAIC0xNjM4LDcgKzE2MzIsNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX3Jl
Z2lzdGVyX2F1ZGlvX2RyaXZlcihzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgICAgICAgaWYgKHJl
dCkNCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiAtICAgICAgIERSTV9JTkZP
KCIlcyBkcml2ZXIgYm91bmQgdG8gSERNSVxuIiwgSERNSV9DT0RFQ19EUlZfTkFNRSk7DQoNClRo
aXMgbW9kaWZpY2F0aW9uIGlzIG5vdCByZWxhdGVkIHRvIHRoZSB0aXRsZS4gSWYgbmVjZXNzYXJ5
LCBzZXBhcmF0ZSB0aGlzIHRvIGFub3RoZXIgcGF0Y2guDQpCdXQgSSBkb24ndCBrbm93IHdoeSBy
ZW1vdmUgdGhpcy4gQ291bGQgeW91IGV4cGxhaW4gbW9yZT8NCg0KUmVnYXJkcywNCkNLDQoNCj4g
ICAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+IEBAIC0xNjY3LDExICsxNjYwLDYgQEAgc3Rh
dGljIGludCBtdGtfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
ICAgICAgIG11dGV4X2luaXQoJmhkbWktPnVwZGF0ZV9wbHVnZ2VkX3N0YXR1c19sb2NrKTsNCj4g
ICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBoZG1pKTsNCj4gDQo+IC0gICAgICAg
cmV0ID0gbXRrX2hkbWlfb3V0cHV0X2luaXQoaGRtaSk7DQo+IC0gICAgICAgaWYgKHJldCkNCj4g
LSAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBpbml0aWFsaXplIGhkbWkg
b3V0cHV0XG4iKTsNCj4gLQ0KPiAgICAgICAgIHJldCA9IG10a19oZG1pX3JlZ2lzdGVyX2F1ZGlv
X2RyaXZlcihkZXYpOw0KPiAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=
