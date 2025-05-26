Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2229A2
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748229806; cv=fail; b=NrETVRENC2BxS6dH0anCXB+KkrAjS9U+1aOkGVbwot9l0vLl8W44fT0+CaqZKgxltirrvZPuVnVEuWECkXkUz7c560huU6Lvx82tWtMU0oQgf3Gbb4XHP+KpD0fp4cjUFb3SDn+drE2O233y14D4/YUPGgTEO0DV3gtf98jaYik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748229806; c=relaxed/simple;
	bh=Dq+cuFcFb/PQtAANLY6UTyLw0dW1QNsusg7reGXq35k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SLUq2lkG5caFpPFt8FIabyzhz/+SgnLWoT0w/FSO/CFLpiys7WPOxruxq4GEEFzVcfErUFIqr1Nr9SkoMTSpLGTVcGsof1miRwUGCL2uxGZTg6iXjq2sjhwV36Vo1mQlx5pYG0knDlqyDGvMCmfOPncuDJsRtgCKFH7tSNYYwvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=V7vLOVYz; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=QS68Gggb; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V7vLOVYz";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="QS68Gggb"
X-UUID: c0d64c1a39e011f082f7f7ac98dee637-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Dq+cuFcFb/PQtAANLY6UTyLw0dW1QNsusg7reGXq35k=;
	b=V7vLOVYzMT1AnjOI/MTAH4JIe0PQjLJBkR237nAxKBk5d/SZTk3Ik/ZWlmMDN2cZ8qqE/Bt3F1Yj4QcUXjMdSxo0EpNF7txTnp4kw8yFPkkYTubYj3bT75eRDDUQAKeYMPuJVVfWivkRwDDlpl5PNOf98D8kerUAzll9bLkiI7I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6072dd7a-dd60-4958-be7e-76b504f813cf,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e8abf757-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c0d64c1a39e011f082f7f7ac98dee637-20250526
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1269640105; Mon, 26 May 2025 11:23:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 11:23:10 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 11:23:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rITtxOIBlNIReJGHhsUp/UYfg/uyqxLFoH4EDeNrsN83NVeB7bJALLHOjz10UJcJy8SIU/JtNFtpmVDSzkzlFcsVotWFN43vnJk+yjYIWIFOwUssZfphYKFCYz33UnGKbjcmOV7184MTmnHoA7PmXpFXxDFYWNmCpo5m2Bd1jz/JM5HBkvd9mShh3zwXGkFj7ZBODFhqZaNdf/f1XUgwzR2WOGdLt1W/93ahRBKevirx495GDyOxAILS69KuOm69fUW9SEDsw/l4aJZ7TrUvobRKDZcvXAKqLLFFDI5avH1xRIMwIZAU0z0GNkGrmrId87s3RaCEcBfZ52n+CRa4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq+cuFcFb/PQtAANLY6UTyLw0dW1QNsusg7reGXq35k=;
 b=OQLgzydxmLE+MFFUgMuZuCRcOh3VnLnox0R6CMuqTLmw3TWXPWTwHxavIpvCXEeIq+6qiV6AYiqCTZVciMRuV741ACF8TxhryGc6SKj0YLHDt1D+qVtWd1qV+a7jLHoKqq5al8nXJKbgHNrvNwluNJUtiBDbTNVg5XqOw48mrGxdpTw4del4E6aTHnLGuEpymd6NTBkJ/lECdoXZC1mcOTrOzLYg8/9ePoq4HNgTUL4EPCvlrcDrh5rVGa7sxptaJc/mfB//wwtcL6AVfmU8vCUT0AFkoKQoHoHHt9tcfA39re0H4usPTnI6c8y+nHWFh6+TSgHYBC3abliX30Lm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq+cuFcFb/PQtAANLY6UTyLw0dW1QNsusg7reGXq35k=;
 b=QS68Gggbw7CIFDpAj4lNfn0+5aA6juA/H5jzr3yidZb/AsgqgYcrG+kHWRMup4fSmfWVNkXcbJOkorvdoVKA2nkrGirYbv3ApnrNRC+lbEEzmZv+rL/nv0nGrErPLQ7Jk5Kr+oms7J8WL302+lhYgsErvujlj3tYH7l7knSyzaU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6507.apcprd03.prod.outlook.com (2603:1096:101:54::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 03:23:07 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 03:23:07 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "daniel@fooishbar.org" <daniel@fooishbar.org>
CC: "wenst@chromium.org" <wenst@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
	<Sirius.Wang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
Thread-Topic: [PATCH] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Index: AQHbyvbu01ohrC5ahkmCgXDRK5gv6LPhvgOAgAKHDIA=
Date: Mon, 26 May 2025 03:23:07 +0000
Message-ID: <90827603384e6cb15d798630cd7c6f3d5fc4d205.camel@mediatek.com>
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
	 <CAPj87rNV_48pQF+gv3HEx+-n1WvKOoX2u_HRW5w8DrgEAigk9w@mail.gmail.com>
In-Reply-To: <CAPj87rNV_48pQF+gv3HEx+-n1WvKOoX2u_HRW5w8DrgEAigk9w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6507:EE_
x-ms-office365-filtering-correlation-id: 6a40939c-a85f-4b02-86ba-08dd9c04a236
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bXd3dkFVRmtUbDZSV25MNVRORWx2TS8zemllYmovS2E0WFZJMnYrTHJERWVL?=
 =?utf-8?B?ZElRaXFSQUhCb3Vjc3lZVldWSzNycE45clVKdGdFdjF1cjVNZ2svaVVQWVpR?=
 =?utf-8?B?ZVpJNXZHQUFRYnFXQndtWEhhTGc5b0ZRbXdrcmFmcGRWaFhQaUt6V001RTQy?=
 =?utf-8?B?bUVHVjIyQXpWZUwvV3JOM25UZ3VZWmFsa0ZaLy84cktsYW44MnRVUEFCVDFR?=
 =?utf-8?B?aUpmUnNpV3RxZHFYL21JZ3pLNEY4cDZJQ0pPL1U3em5WeHEvY2FxV1Y3SjY0?=
 =?utf-8?B?eXNpb1p1cnErZUtNMlNrWkxPZXVlVnd4a1dmQjhITXR6dDNLd3d6cWJHc0Z0?=
 =?utf-8?B?V1NrV2MzTWpDL3RNMDd1UG5iNFdyZ0VDUFhDTFVzN01BQ2lsYmZJUzllMU1N?=
 =?utf-8?B?ZkxpUkhJeUxaMkxXb1l6Q0ZaMnRmS3FCTjZNQURFZ2R3K2lobHI4eFFBT0lU?=
 =?utf-8?B?UWk2SWVBY2JHZStQM3N3QS9Ea0JIb2l6U3hZdXRIQkFWOGc1WFRYQW5xRFM1?=
 =?utf-8?B?amgzamMrMGk1TU1ZWmorRGs4aW9RaTJvZFZEb3FjWlk5RUozQWswYTE4UTNl?=
 =?utf-8?B?ZXY4R2psNUhyOFN6WVZ4ODAwcGlDSWhpZzNmWEl2OWx0a2I5RVdrR1NmdXdo?=
 =?utf-8?B?TjdkMFZ5dmFnMDdSSWtteTBUZnZIcXRNZHJjcDhSVDJpdSsxbjZNS2FKSjV0?=
 =?utf-8?B?L3pndS9aYmN3ZEdzQ2xJbVRZVG1NVCs3Z1VBbXprSnBzRndoSncxZmZzUHR5?=
 =?utf-8?B?YTBlN0w2VENRWFBlZ1Fvbkk4RXJ1cE5GUUltRFo5WHlEL3FjNGo1dHpjM0xz?=
 =?utf-8?B?ZHFDL21mdGZGdWZLZlZzaHNGK3BaRldTMnRiQUFuU0NBNUlibTBiMEJCa3g3?=
 =?utf-8?B?VUZuTVlLSTZhOEFjWnFOZWRHdDUxNys5NzNDU0Q2QS9adXZQaW9GSG9BdG5a?=
 =?utf-8?B?M0xrdStwZEF2SjBJeklPdm5NeXJoeStjYk9keGNjMmhON1hDSHZFa2RjR0d1?=
 =?utf-8?B?MGFGS3o3c2gvb0tJYlNtdFVBODNqdzAvOG9pVTFTNlNCMnR3SHNZdGl4Z0hy?=
 =?utf-8?B?VFlIN29yWWpMTXpNNjVsOTBWazZoTGpiRVF1TUE4SFF6KzdyU2NlOC81b3px?=
 =?utf-8?B?L2JUS0hhRlVTNjV5TjZtQ29JRE9zMWNTZmZSQkpWRDVMYXNZT1cxbGlvcmVp?=
 =?utf-8?B?STVPVy9XY0VQdDFDOGNFTEpQQlM1czVxZGtGcWx0amxyTFdSU3ZRUTFXYTBT?=
 =?utf-8?B?YVpSbnpvZVNTQ1BXRjRES1FQaWhidXBlMEdtUnFSaStSbWZScjY5U21HUlJl?=
 =?utf-8?B?TUFkcTJBTkxkOUdNVTJnUE0vL29wcGRUamJibjdoRmZFbjdKUkNmVkFINjdp?=
 =?utf-8?B?N2IyODNyT3VpVlc3K3JZNk4wQ1dpWEtKQWRlclhuVW85NFVoNElwWjMvTXJO?=
 =?utf-8?B?N013N3FLVnN1emRoV1k4M0NCbXZ1aHIzNUR0dFV6bDd4SmUzaW8xLzBWSVIy?=
 =?utf-8?B?MnlUQXBpd2J3bHZlSFA0b3FrVGxKbFJQbnl0WXdwSnZOTTZ4ZXNycVVYWXFt?=
 =?utf-8?B?ckZZMi9uSHdyVW1XdWo2YlJZeEx4UTd2c0FhSU5EaTFybnI0dlVrQTkzUkM5?=
 =?utf-8?B?ektSbHNUd2pzRGZaeXJsMzZ0ZnNsV1p2dVdHUElLYjI3RjB6M1VieTF1Mkxi?=
 =?utf-8?B?NVBSUUNSOEtEQTViOCtyTTVsTXFid2tLOUhlOGlEUDZuNHUyRDFDbXViWHRh?=
 =?utf-8?B?dE1ndTBjMlpnMWRTUEhxRTY5MWpVbU5LZy9uYnJZNG1ZbVM4OFMwRWNoTWRR?=
 =?utf-8?B?YzgybEtCRW9TbHZQalJXZ3lMVXFOa09YM1B5eE1ucWE3OTAyem5qaUQ2UWoz?=
 =?utf-8?B?dzlxbzdXZmx0ajFUR0pzTFNVMjBjb0RrNG81bm5PSTVkQmtxZjN4TzNDQkpr?=
 =?utf-8?B?SE95TWZEK0gwYzFvMG03Q1cvKzdxWVp0UVBTc3BwU1hsZDRyckJOVHNCVG5M?=
 =?utf-8?Q?f3jzR27s5SsP9ooQwku9YtJ9CglvQQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akJxZ1hiV2ZCeitLWDUwNlN5MVJjdS8vS0YzR0Zkd2pqRjdCN2NnbjdJR1Ft?=
 =?utf-8?B?OG52MDhLK01PblNMSFU5blRVdnYrQUhOM3ZuNUFMTUd2ZGk3QUp4amFsYzg4?=
 =?utf-8?B?alIxaVZ6SDBkOFBXbElud3R0UlNGYU1kMWo4eGg5Q2hQcExQYWR0T0IrZXVu?=
 =?utf-8?B?QXMyWlZzU2pJTmEyMHlNZ3RsT1hORXlmeEMxcFdOV2puZkh2NFVWMVJVaHZS?=
 =?utf-8?B?bkVPTHY1UThNdW1hcnVKSWgycTVxMDdSTndhekNjaDlnZ0YyS1hHYklLT2t6?=
 =?utf-8?B?OTlvTlNUOXpBZTZxbENjVlZrRGdIK0tyd3lPVGpwNUptY2d3MDVtdWxOMHJk?=
 =?utf-8?B?TS8xT2xzUUN2dWc3dHZWYmJPSHZWN25YOWtrWVRESURNS1Y0OEt1c3YySEx6?=
 =?utf-8?B?cFRXNWpHNGY5K1JTcU1iYjNza2g0Sy95SDR4akM4c2ZKMVhnQkJNVThJVjBp?=
 =?utf-8?B?cVpmZDBDNzJ3L1ZFRCtXTjVLcDIrajgzRlJ5UnljWGQwdG9RVVc2Q210UzJs?=
 =?utf-8?B?YkRFL05wQTZHZURTUFZRVVYzR203MHpZeXJSaG5leUxlZytlMDBZUWRMNytT?=
 =?utf-8?B?ME0zbVRvSEdUeWtsUE1GbCtjSW05cnUrVElOd0RtWktmWU5aMmw1VXc5RHdX?=
 =?utf-8?B?WDIzMjNEa2M3Q2F1SldTWW1sUjJvcThWOEl2YkJwdy8rZ2cxOE50STlyREww?=
 =?utf-8?B?aE1IbnB1dER1QUVaUmtoVlQwQ3llNkdXNVduUWk1YzF6Y01oR0NVT1czZVZH?=
 =?utf-8?B?a3dPK2RJL0RrVjNES2VITk03OEl2bVNhZkNkOUpRNlBxZzU1NUtCeFoxVlQ1?=
 =?utf-8?B?Vm9XUnpBbnNveHpORFlLVEV2NHlERlJPVitVNlZLbjFsRlRnckwvcHFZRStB?=
 =?utf-8?B?SWtubjhGbDV5d2RsMzJVdjdLZ2kzN2FRRGdZUlJPMFZobFcxNGVlTDFkR2xu?=
 =?utf-8?B?TkFrdmF2ZFNaSE1QaldsbUVHUmJoUW9abDZBelpQQnJ0SnFXT2UrUUt3WVRw?=
 =?utf-8?B?eENWOTJXSmZMNnpTK043RE83akpDZ1VFT25WaEtPdkYwV0RTV2E4SVQ0VWph?=
 =?utf-8?B?c0N1RktMZWUzL2s0RzNUaTZjZkhHSkJPOTV5WXZ5TGxqSkd1cnhLcEZKdGRI?=
 =?utf-8?B?cm9WNjM2KzJRckdsM0VlMzkxb295SkpOMERoQUVqN00yekNjL0tuaDdlSkFR?=
 =?utf-8?B?WlFhOElQS3RoMFZnTnRVWk4yKzQ2ak0zaTFxWCtGM1B5SHJzNS8vZDlLQkkx?=
 =?utf-8?B?YWE4czlzK1F6KzBoRXBVOXhFQWxhUld3NE5seGp3dzB6ZXlCSUwwK0R0K3JB?=
 =?utf-8?B?d3QwQ09RNWF1RFB0dStRZitGMzUxR1pZZ2RJNUtycE1xRnhxT2Q0ZTZpeWp3?=
 =?utf-8?B?V081SzVqeHlNNWFrN053YnJCWnVoOFBlWkxqb090eXNNU0NOMTZxT2FLUWdM?=
 =?utf-8?B?Zy8wUEZrWkhlVllSdVdZeGJDMHBPMmF4OHowSllOb1VRMUNyT09uc3UrRWow?=
 =?utf-8?B?dGdhbHpYajhWZlQyNWE1T2IzRVpLbVFEa3M4MVd0REt0dmF2UHJsVjZlb1g0?=
 =?utf-8?B?VExlTWdDdFpUS3RoZnlkUG8xMWRZL3kycVBJUXdJeFlhTm9Ia0xoVHBVYlJE?=
 =?utf-8?B?d0E1eTZkSnhPYXlBUzRjU2J0Nys3aDdBLzVaOHExdkJJUEd3RmJQMUprRTY5?=
 =?utf-8?B?aFQwOTU2b3hrdW1yaUVPa0k1MUFBTFM2dXFHdVRVTytuNUZrc2tZcGVWS0Fp?=
 =?utf-8?B?M01qZXJTTjFQZmpYY0hUVFNTVkpRNHdncnp1UlZMYm03Q1hGWEVoM3V5THZZ?=
 =?utf-8?B?SFc4blJLWm10UnUxb25mMmIvVm1JQlhWWHVNZHViT09aZ2MrNE5VaERDWWdz?=
 =?utf-8?B?NUp0RWg5N3RrazlPMUdiVkZwQU9XNjc1czNKUTR2djF3U2h1RHVNRFVWU1Yx?=
 =?utf-8?B?SnlmNk9lOWZDMDM1b0Vpd1F1ajI5aGVMREllYi9Va01EWm1jM09UeUV1WjNT?=
 =?utf-8?B?dlBMU3NGd09wTXRteXprYkcwUzNKamNxZHZrT25GZDNOaFVud2ZxUVpRNU5i?=
 =?utf-8?B?akc4bGRaM3IwdFQ2OCtqS1BUU3gyWElBR200cGVXc29pbkRwS2ttbHJnakFT?=
 =?utf-8?B?Zmg1SXVMMlhuMUJoalpvWSt2TkhLNWxSbFFmSlFTemRwL3JrM2tBVmtQVjlk?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5FFD999E6759A45B76C440A84E7B3CA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a40939c-a85f-4b02-86ba-08dd9c04a236
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 03:23:07.1324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybRYEcA6nOdZ7/MPF7oaSWZu9tjbZi9VxK+tgctrZ0g/rkeqR3erthSrOdaLuZkNaaTIy1kNhTgkHhk7+dEHQmHwapGUzLlrf0pc1sQXYKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6507

SGkgRGFuaWVsLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFNhdCwgMjAyNS0wNS0y
NCBhdCAxMzo0NyArMDEwMCwgRGFuaWVsIFN0b25lIHdyb3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1h
aWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwN
Cj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0K
PiBIaSBKYXNvbiwNCj4gDQo+IE9uIFRodSwgMjIgTWF5IDIwMjUgYXQgMDk6NTIsIEphc29uLUpI
IExpbg0KPiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gT3VyIGhhcmR3
YXJlIHJlZ2lzdGVycyBhcmUgc2V0IHRocm91Z2ggR0NFLCBub3QgYnkgdGhlIENQVS4NCj4gPiBE
Uk0gbWlnaHQgYXNzdW1lIHRoZSBoYXJkd2FyZSBpcyBkaXNhYmxlZCBpbW1lZGlhdGVseSBhZnRl
ciBjYWxsaW5nDQo+ID4gYXRvbWljX2Rpc2FibGUoKSBvZiBkcm1fcGxhbmUsIGJ1dCBpdCBpcyBv
bmx5IHRydWx5IGRpc2FibGVkIGFmdGVyDQo+ID4gdGhlDQo+ID4gR0NFIElSUSBpcyB0cmlnZ2Vy
ZWQuDQo+ID4gDQo+ID4gQWRkaXRpb25hbGx5LCB0aGUgY3Vyc29yIHBsYW5lIGluIERSTSB1c2Vz
IGFzeW5jX2NvbW1pdCwgc28gRFJNDQo+ID4gd2lsbA0KPiA+IG5vdCB3YWl0IGZvciB2Ymxhbmsg
YW5kIHdpbGwgZnJlZSB0aGUgYnVmZmVyIGltbWVkaWF0ZWx5IGFmdGVyDQo+ID4gY2FsbGluZw0K
PiA+IGF0b21pY19kaXNhYmxlKCkuDQo+ID4gDQo+ID4gVG8gcHJldmVudCB0aGUgZnJhbWVidWZm
ZXIgZnJvbSBiZWluZyBmcmVlZCBiZWZvcmUgdGhlIGxheWVyDQo+ID4gZGlzYWJsZQ0KPiA+IHNl
dHRpbmdzIGFyZSBjb25maWd1cmVkIGludG8gdGhlIGhhcmR3YXJlLCB3aGljaCBjYW4gY2F1c2Ug
YW4gSU9NTVUNCj4gPiBmYXVsdCBlcnJvciwgYSB3YWl0X2V2ZW50X3RpbWVvdXQgaGFzIGJlZW4g
YWRkZWQgdG8gd2FpdCBmb3IgdGhlDQo+ID4gZGRwX2NtZHFfY2IoKSBjYWxsYmFjayxpbmRpY2F0
aW5nIHRoYXQgdGhlIEdDRSBJUlEgaGFzIGJlZW4NCj4gPiB0cmlnZ2VyZWQuDQo+IA0KPiBXYWl0
aW5nIHVwIHRvIDUwMG1zIGZvciBlYWNoIHBsYW5lIHRvIGJlIGRpc2FibGVkIGlzIC4uLiBub3Qg
aWRlYWwuDQoNCkl0IGEgdGltZW91dCBpdCB3b24ndCByZWFsbHkgd2FpdCB1cCB0byA1MDBtcy4g
SSBjYW4gc2hyaW5rIHRoZSB0aW1lb3V0DQp0byAxIFZTWU5DIGJlY2F1c2UgaXQgbXVzdCBiZSBs
ZXNzIHRoYW4gMTYuNjY2bXMgKGRlcGVuZCBvbiBlbmNvZGVyJ3MNCnRpbWluZykuDQpCdXQgaXQn
cyBlbm91Z2ggdG8gZnJlZSB0aGUgZnJhbWVidWZmZXIgYXQgdGhpcyBtb21lbnQuDQoNCj4gRXNw
ZWNpYWxseSBhcyBtdWx0aXBsZSBwbGFuZXMgY2FuIGJlIGRpc2FibGVkIGF0IG9uY2UuIFRoaXMg
bWF5DQo+IGhhcHBlbg0KPiBkeW5hbWljYWxseSBkdXJpbmcgcnVudGltZSwgZS5nLiB3aGVuIGEg
dmlkZW8gaXMgcGxheWluZyBhbmQgYSB1c2VyDQo+IG1vdmVzIHRoZWlyIGN1cnNvciBvdmVyIHRo
ZSBwbGFuZSB0byBtYWtlIHRoZSBVSSBjb250cm9scyB2aXNpYmxlLg0KDQpUaGUgdmlkZW8gbGF5
ZXIgd2lsbCBiZSBkaXNhYmxlZCBvciB2aWRlbyBsYXllciBhbmQgVUkgbGF5ZXIgd2lsbCBiZQ0K
c3dhcHBlZCBieSB0aGUgYXRvbWljX2NvbWl0KCkgd2l0aCBkcm1fcGVuZGluZ192YmxhbmtfZXZl
bnQgaW4gdGhpcw0KY2FzZS4NCg0KPiANCj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBoYW5kbGVk
IHRocm91Z2ggdGhlIGF0b21pY19jb21taXQoKSBoYW5kbGVyLA0KPiB3aXRoIGFzeW5jaHJvbm91
cyB0cmFja2luZyBvZiB0aGUgc3RhdGUsIGluc3RlYWQgb2YgdGhlIGhhcmQgYmxvY2sNCj4gaGVy
ZS4NCg0KSW4gbXkgY2FzZSwgSSBlbmNvdW50ZXIgdGhlIFVJIHByb2Nlc3MgaXMga2lsbGVkIGFu
ZCBhbGwgdGhlDQpmcmFtZWJ1ZmZlciBhcmUgc2V0IHRvIE5VTEwgdG8gZWFjaCBwbGFuZS4NCg0K
VGhlIGxvZyBpcyBzaG93biBhcyBiZWxvdzoNCg0KLy8gQWZ0ZXIgdGhlIHByb2Nlc3MgaXMga2ls
bGVkDQovLyBmcmFtZWJ1ZmZlcigweGY5YzAwMDAwKSBvZiBVSSBsYXllcjAgd2lsbCBiZSBmcmVl
ZCBhZnRlciBkZHBfY21kcV9jYg0KDQpbICAgNTUuOTk2OTAzXSBtdGtfcGxhbmVfYXRvbWljX2Rp
c2FibGUgMjk2OiBpZHg6MCwgYWRkcj0weGY5YzAwMDAwDQpbICAgNTUuOTk2OTIzXSBtdGtfY3J0
Y191cGRhdGVfY29uZmlnIDk4MDogbmVlZHNfdmJsYW5rPTENClsgICA1Ni4wMDEzMDBdIG10a19n
ZW1fZnJlZV9vYmplY3QgMTEwOiBkbWFfdmEgPSAwMDAwMDAwMGI0OWFkNWM4LA0KZG1hX2lvdmEg
PSAweDAwMDAwMDAwZmI5ODAwMDAsIHNpemUgPSAyNjIxNDQNClsgICA1Ni4wMDE1MzhdIGRkcF9j
bWRxX2NiIDUzMzogbmVlZF92Ymxhbms6MSwgc3RhOjANClsgICA1Ni4wMTcyOTddIG10a19nZW1f
ZnJlZV9vYmplY3QgMTEwOiBkbWFfdmEgPSAwMDAwMDAwMDNmMjllMjViLA0KZG1hX2lvdmEgPSAw
eDAwMDAwMDAwZmIwMDAwMDAsIHNpemUgPSA5MjE2MDAwDQpbICAgNTYuMDE3NTUzXSBtdGtfZ2Vt
X2ZyZWVfb2JqZWN0IDExMDogZG1hX3ZhID0gMDAwMDAwMDAwZmIxMzBjYiwNCmRtYV9pb3ZhID0g
MHgwMDAwMDAwMGZhNjAwMDAwLCBzaXplID0gOTIxNjAwMA0KWyAgIDU2LjAxNzc1MF0gbXRrX2dl
bV9mcmVlX29iamVjdCAxMTA6IGRtYV92YSA9IDAwMDAwMDAwZjc4NmY1MjQsDQpkbWFfaW92YSA9
IDB4MDAwMDAwMDBmOWMwMDAwMCwgc2l6ZSA9IDkyMTYwMDANCg0KLi4uDQoNCi8vIGZyYW1lYnVm
ZmVyKDB4ZmI5YzAwMDApIG9mIGN1cnNvciBsYXllcjMgd2lsbCBiZSBmcmVlZCBiZWZvcmUNCmRk
cF9jbWRxX2NiDQoNClsgICA2Mi44NTEyNTBdIG10a19wbGFuZV9hdG9taWNfZGlzYWJsZSAyOTY6
IGlkeDozLCBhZGRyPTB4ZmI5YzAwMDANClsgICA2Mi44NTEyNjNdIG10a19jcnRjX3VwZGF0ZV9j
b25maWcgOTgwOiBuZWVkc192Ymxhbms9MA0KWyAgIDYyLjg1MTI3M10gbXRrX2dlbV9mcmVlX29i
amVjdCAxMTA6IGRtYV92YSA9IDAwMDAwMDAwNzE2ZDE0N2QsDQpkbWFfaW92YSA9IDB4MDAwMDAw
MDBmYjljMDAwMCwgc2l6ZSA9IDI2MjE0NA0KWyAgIDYyLjg1MTQ0Ml0gYXJtLXNtbXUtdjMgMzA4
MDAwMDAuaW9tbXU6IFRCVV9pZC0wLQ0KZmF1bHRfaWQ6MHg0MGMoMHg0MGMpLCBURiByZWFkIGlu
IE5PUk1BTCB3b3JsZCwgaW92YToweGZiOWM1MDAwLCANCnNpZDoxNDQsIHNzaWQ6MCwgc3NpZHY6
MCwgc2Vjc2lkdjowDQpbICAgNjIuODUxNDUzXSBhcm0tc21tdS12MyAzMDgwMDAwMC5pb21tdTog
ZXZlbnQgMHgxMCByZWNlaXZlZDoNClsgICA2Mi44NTE0NTddIGFybS1zbW11LXYzIDMwODAwMDAw
LmlvbW11OiAgICAgIDB4MDAwMDAwOTAwMDAwMDAxMA0KWyAgIDYyLjg1MTQ2MV0gYXJtLXNtbXUt
djMgMzA4MDAwMDAuaW9tbXU6ICAgICAgMHgwMDAwMDIwODAwMDAwMDAwDQpbICAgNjIuODUxNDY0
XSBhcm0tc21tdS12MyAzMDgwMDAwMC5pb21tdTogICAgICAweDAwMDAwMDAwZmI5YzUwMDANClsg
ICA2Mi44NTE0NjddIGFybS1zbW11LXYzIDMwODAwMDAwLmlvbW11OiAgICAgIDB4MDAwMDAwMDAw
MDAwMDAwMA0KLi4uDQpbICAgNjIuODU0NjY2XSBkZHBfY21kcV9jYiA1MzM6IG5lZWRfdmJsYW5r
OjEsIHN0YTotMTAzDQpbICAgNjIuODU0NjkxXSBtdGtfY3J0Y191cGRhdGVfY29uZmlnIDk4MDog
bmVlZHNfdmJsYW5rPTENClsgICA2Mi44Njc4ODZdIGRkcF9jbWRxX2NiIDUzMzogbmVlZF92Ymxh
bms6MSwgc3RhOjANCg0KLS0tDQoNCkFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0aDoNCg0KLy8gZnJh
bWVidWZmZXIoMHhmYjljMDAwMCkgb2YgY3Vyc29yIGxheWVyMyB3aWxsIGJlIGZyZWVkIGFmdGVy
DQpkZHBfY21kcV9jYg0KWyAxMTA2LjQyMjQ3OF0gbXRrX3BsYW5lX2F0b21pY19kaXNhYmxlIDI5
NjogaWR4OjMsIGFkZHI9MHhmYjljMDAwMA0KWyAxMTA2LjQyMjQ4N10gZGRwX2NtZHFfY2IgNTMz
OiBuZWVkX3ZibGFuazowLCBzdGE6LTEwMw0KWyAxMTA2LjQyMjUwOF0gbXRrX2NydGNfdXBkYXRl
X2NvbmZpZyA5ODA6IG5lZWRzX3ZibGFuaz0wDQpbIDExMDYuNDM0OTc2XSBkZHBfY21kcV9jYiA1
MzM6IG5lZWRfdmJsYW5rOjAsIHN0YTowDQpbIDExMDYuNDM1MDI3XSBtdGtfcGxhbmVfYXRvbWlj
X2Rpc2FibGUgMzA4OiBpZHg6MyBkb25lIQ0KWyAxMTA2LjQzNTA1Ml0gbXRrX2NydGNfdXBkYXRl
X2NvbmZpZyA5ODA6IG5lZWRzX3ZibGFuaz0wDQpbIDExMDYuNDM1MDc3XSBtdGtfZ2VtX2ZyZWVf
b2JqZWN0IDExMDogZG1hX3ZhID0gMDAwMDAwMDA3NTI4NWM0MywNCmRtYV9pb3ZhID0gMHgwMDAw
MDAwMGZiOWMwMDAwLCBzaXplID0gMjYyMTQ0DQoNCi0tLQ0KDQpXZSBoYXZlIGFscmVhZHkgdHJh
Y2tpbmcgdGhlIGFzeW5jIHN0YXRlIGZvciBjdXJzb3IgbGF5ZXIzIGluDQphdG9taWNfY29tbWl0
KCksIGJ1dCBpdCBzZWVtcyBpdHMgZnJhbWVidWZmZXIgd2lsbCBzdGlsbCBiZSBmcmVlZA0KYmVm
b3JlIGRkcF9jbWRxX2NiLg0KDQpEbyB5b3UgaGF2ZSBhbnkgaWRlYWwgcmF0aGVyIHRoYW4gYWRk
aW5nIGEgaGFyZCBibG9jayBpbg0KbXRrX3BsYW5lX2F0b21pY19kaXNhYmxlKCk/DQoNClJlZ2Fy
ZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiANCj4gQ2hlZXJzLA0KPiBEYW5pZWwNCg0K
