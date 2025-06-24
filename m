Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994AA27A47A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758016; cv=fail; b=iXIzWXyX7LOqKquDGLprJLmuhzqu8wzQz59hkCrO5NzKuFXtLMxuwpqjXZiLesw2j9+DF9e8kAx5YF0TFotO+yw3Nxx4JaFxXXWPnlQhUtjoK4mxKXta1xy+vqbY0NhuhinlJwBFfqx7imR8wnxtKy4oBQiVi5uDOtMexawBUMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758016; c=relaxed/simple;
	bh=/FQ//ezKfnMKjX8kgk39IDg/klicoBXtpcAqIWwIcBY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hpdcP+buAROq828Pb0SI86I1ICUHu+UDIOarBe5QcleLXeEI++ax+gZAFIB5Rwc4yh+QEhc9Q91WA6JMp3svzomiWD76aDzTKMW8UTgKLO/5Y/Oc0fBXmRas9th9Ir3Gv45XPPOvnrWXiMV9BrmeZp/b4W8lkxZBfkjV/w3YO0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VdE2ITg8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=shdfqDQV; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VdE2ITg8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="shdfqDQV"
X-UUID: 360bf29a50df11f0b910cdf5d4d8066a-20250624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/FQ//ezKfnMKjX8kgk39IDg/klicoBXtpcAqIWwIcBY=;
	b=VdE2ITg82Dw2/IRjwv2PraWhjNkeNB7lUCrXmYotPU06aU9hoof4EWke395UV6vYFDmmPsq13/nAhElMgmNIV2CwC0NlWrNrfdfvhQ6Fgsps3fIhEc4lG5YXNYIqycidvI2xNqycJVCRaIOHT0VIPsM4NPcrb40fdYLw7eE6Nkk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e83b2e79-46eb-4ebc-93a1-a27251a6395d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:fb818273-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 360bf29a50df11f0b910cdf5d4d8066a-20250624
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 332992367; Tue, 24 Jun 2025 17:40:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 24 Jun 2025 17:40:04 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 24 Jun 2025 17:40:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWKeGLEOFuZWiLWt4DJiP3hXwualHoDh4cQUMybGHPgpTl5XiBB7qAa8xduivOa25K/t97xB6mheE6n/eCgsEUDjTyHXoJ4shzADIYugWDvVVmGyeiF9EXWOw4T3INyqD98sM2YEGJvIdA3JflGBgPE5e9OE5kDxFWrYdQ5W483a2hG3jLUje5mrU5luHgUFiyP6PpMUzig9OYG/n3vzzEJ+H0VzMvmDXtXw2jrbIUxQTiLz7AtUZ4WDsOrbadsRYMuotFPfIVPoQ2LV8YMwJ/F6csoWy5WLLQv+jvFiQuAvTfJy4LNw1YuP0qMQB6v4IdPnJHbRZ6yxUVTfdKoS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FQ//ezKfnMKjX8kgk39IDg/klicoBXtpcAqIWwIcBY=;
 b=KKJtGdaxhhEZtbKNLVpMYSf31ugTBzfN/i6h461ds3JeLzC5t91i9+Ok3XHDBDXtndHAuRHAEUUStiB4yaDFDn20ZJw5Zcoxbch0/USYm8Msqxc0FP4AUzCYneWZ0/C0R/YujsmHAlU3NvDeKCtXJCJqqCOC4inudPKsRXJlVP/9gxmIwa4FLkWLOmwA/2vjhda4KH4Lo2ZDHhHY/x+oJVs7RZ6wQhR76rY6LMyXVKyjuH451kfPmSWT6Tk6uihJek1cGOYzeTDvhooOcIvsQjvbLj8KCTPgMTI/1VBLNVYTTkeqKcpUf5mIGKR9jjNDNNLEgFyXqZwq2kpsFPijNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FQ//ezKfnMKjX8kgk39IDg/klicoBXtpcAqIWwIcBY=;
 b=shdfqDQVKzXtBzqbncdJe4t+9CHEN0AAFJeB1yot+irS3cVsYQ5XoO5nOwk8bKbd6xbw2s5pBd8aUd87cUoTbHiVvZa6KPf8uG3plYerFjpJgUHKamKa/LGa0NrJpBGPGuG6ix1DBHjzjA6NAwauK8do8XJV22ms8illoEXPWKE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7875.apcprd03.prod.outlook.com (2603:1096:101:185::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 09:39:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 09:39:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
	<Sirius.Wang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "fshao@chromium.org"
	<fshao@chromium.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
Thread-Topic: [PATCH] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Index: AQHbyvbejB/zfD8/0kyGbYWOlhuMybQSQfaA
Date: Tue, 24 Jun 2025 09:39:58 +0000
Message-ID: <d46b431600ad2e5e2b3639b8bea784dd6c151bfd.camel@mediatek.com>
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7875:EE_
x-ms-office365-filtering-correlation-id: 46671ef6-aa92-406c-9916-08ddb303158d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YUFwV25lVHBsdDFUZDl3aWNicFRUUFpBQ2NnN0l2aWxBaWJQNk84dFpjcklC?=
 =?utf-8?B?b2dtMTU3dFpDTUpSWnBVUGRjN21KRWhzL2g0THNEQkI1SWFjTTRYaE56RGRH?=
 =?utf-8?B?NXVld2tZS0FqYjlZbTdpYTNRYzNxeGszcE9VUURJNkZhek1ZYk83UFRRRHdZ?=
 =?utf-8?B?cnExcjRoR2R4L0hNTTh6TjMxQ01oYzlvTVNVYkxRdisxOGhlZXFuVUNlRWk1?=
 =?utf-8?B?SmRYaTlrNnBweHdRdEMySWdiak81Qm15Q0JHRDNUb3ZZOHg3bFBydG9PRkox?=
 =?utf-8?B?aWtuQk5uM0dTK01vM05MQ0lDOHBuK0NzaFNoMldKYzBObmZ5SlFNOVZRRFNm?=
 =?utf-8?B?KzJFL0ZFUW5kbUpWWm9wNWZQcGhtRDEweWhTTCtUVmJIblFNamFFTXE4Tjly?=
 =?utf-8?B?Z3AreDlVTkhRWldHOEJLR3JmTXJiN1QxY0lPM2pmaXhROUdhditVNWhYU1Z0?=
 =?utf-8?B?YmdRaTRESkZ6VS95K2VQazZBUXhDczY5SkhYTXRDN3Z1cGZpOVpIWUVjTm9p?=
 =?utf-8?B?OFZrVk1jdzJLa0dkblhLOVZ1eWhNVVZ5SS94VzVKNkNTV045ZG1pZEs5SUUy?=
 =?utf-8?B?YXYyNUNaUTdCVlV6MVhZWG0weGlKRHpZSE8rVjh0ZTZWMDJjZkIrREhZRjYw?=
 =?utf-8?B?ZnhmYVlhT2FCSHdJSUgvem5NVytQOGovSE9Nd3kwcDhXeUpZa3dkeXd6RXY0?=
 =?utf-8?B?YXI1VlRRRkhHV1dXbnduVlhaVWRyUWYyZU9pMWR3SHBXVVUrRjJjK1FXVkdH?=
 =?utf-8?B?bWRlYnF1NGdIT2NXTm5zU05WU0NkczBROTloS1pZc3NLRGVRQnNtWnU3R1FQ?=
 =?utf-8?B?QzBqN2RCbWc5WlFCWDA3Y2R6ekNvMGNjejNHeEl6TFk3bHBkQWgrUis4Skdm?=
 =?utf-8?B?Rk1QekkyRWUxUWhmM0JoUUZDWENNMGVRVWFPS2ZkVHZaY0kwM3pJQ3RJbXU0?=
 =?utf-8?B?WmlaeFRmdlZ0SkxWK3Nuci9IeWJSRVFRTVEyV2lveEZrTXh3SENVVW50bDBW?=
 =?utf-8?B?Q1c5MGZyajQ0eE1nUk9ITEpEUCtYWFlOZisxdlptTmJqazhnc1RhNTRKQm5h?=
 =?utf-8?B?enJBNkZnd3JUd2FCY0l5ZmxjcUZRV3J4UkN6UXR3MkptSWFYYk8wSTVRbGZQ?=
 =?utf-8?B?Z0dTWUFUTG5DVGhWa05nNUxwVmk1TWNRM2ZTaTRGd3RGSkNzWnpNcEtEVTJk?=
 =?utf-8?B?Z29rNlY4OTJwNHJ1TDhxb3lmTEdqbktRSFBqZm5LQmNLK2RvMGhweHYyU0Rv?=
 =?utf-8?B?T0JmaUNweW1wTmM3QXZ6Qnd2a3RrZmp5VUlReU1YMXBXK1ZqcDBwU0YyMmJY?=
 =?utf-8?B?c01MRXJBTGttNlNhUEg3Z1hWYS9tWjFzaXl1eDR1TDMwUHJzUWdva1VvMGl4?=
 =?utf-8?B?QVNqTW9TdFlhS1JJUG4yRTV2b0RlNnRvL0ZhRjNNTHp5cVN3ZW9YUzB6VWZB?=
 =?utf-8?B?STFlZXlpUkswSVRoQXFUbnhYRjUzWnlINFFmM1p2RWdmOG5wRUc0RnpLKzdF?=
 =?utf-8?B?RUdYUmtlNmJ0cHNhUi80b2JhTmYyUnM1WkNiNWZydXp2L2FtNElPYmFxNlFB?=
 =?utf-8?B?TThrZjVqdXZQM2x5VVN6NmtzR3hoRVJzQU9HaERwaFp5M24yaW9JYncvRm8z?=
 =?utf-8?B?L0FSVHRueWpaOGQ1QmErZ1o4ZTZGUmVDTHhWdWNqZmZCWldwM0lRc2pyTGxY?=
 =?utf-8?B?bGpWZmpxNG51RHd0eEJuS3FpOUl2UU9QaC9ON2YrMktHMmdMQkNSK0xmVEs2?=
 =?utf-8?B?T0Rldms2c25uQ2tjS0xZRTJOajFWWDBQVEV6R3NLeWNSd3pjMFVPa3k5bjYr?=
 =?utf-8?B?clhIMnlnbXExMU1rMGEvL2o0Zm5QNWFMeG5hRU5nSytrcWdXTFR6RFNCVUNE?=
 =?utf-8?B?L1JSVXN2S2RpdHA1aXNyaTB2cWhmQnRjZ3V4cUU4OFpkQmUrSGhBNlNjVXp2?=
 =?utf-8?B?dmtPM3ViWExva2tCa21Jb1FwanIxc2t2eG8rencreThPSUNqQzlvTWlYZm9V?=
 =?utf-8?Q?iC++GdcCb2e0hrt3iljWU4WG+P8wOo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVZvcExtUXhHcXd4SWwvWEU4WkZ2ald4cXQwKzEyWXRpL1czbkpOSm1FZ2tr?=
 =?utf-8?B?VmJEdk5IM21rZEY3NWhrK2JuMWFOK3ROelptMEptTGw1VHVQK0d2UlBUVDFh?=
 =?utf-8?B?aWdzcmdRMDNNTEVMYzQ0YnI3THVPTDdTRGtyVkpoVTZxcHZ2Njl5UCtrZ2Iy?=
 =?utf-8?B?UFRaZ2FNK3lWMHpsL2N0ZVJWbzF2SDBmZVpSTWVmSlVGOGN3Tmg4bXJxTHlw?=
 =?utf-8?B?ZlVrUSt3S1BwOTV5ZUUxSjFZeUVva0xWREVZUU1YQm5PS0tlV1pUeEplSUlp?=
 =?utf-8?B?RU1kMjhGcXhMa2hCOXlNMkNhOVJyY1gvZEVPV1Jyc1F2aG9GME5zMEUyVEdO?=
 =?utf-8?B?ZnpWWm5sRVVPb3RoTFV3YVRGU2JlVEY3cE5IYkErOG8rN3lPWnZPSERoKzZK?=
 =?utf-8?B?ank2NFdHT3FWYWJCanV4ZmQ5TUVTaWJIZGtTRk8zd1dFT3JiTkFiQUNTNi9p?=
 =?utf-8?B?MlVOekpydTVtdnRraFRRaTgrMnpHd2VycE1XVVlVaGpCMEJVYTBabTUxODZQ?=
 =?utf-8?B?aWlSR1MzOXJ2b1VwTXRmYXROaTVmNGJNY1RvamU3dHRwbGdNNkJucUx2Skp1?=
 =?utf-8?B?TjBDWnU4MmhBbTlIU082dTE1K3RVMTFEakhMempPUXlwWjNTZDhmNE1wdWVS?=
 =?utf-8?B?bzlsR2xwb2srT280S2UwaEVVR1B3c1p0RGdMek43YTBpQTdWQmI2WFZBRzdx?=
 =?utf-8?B?VkR1Z2ZicDdyUWhUQno2OERaeDlWa1Q1TzRBaUl4SjhoQ1pWVlJOZUJ1ZTNU?=
 =?utf-8?B?YlVPaEYwQ1QxZkFKQmhaazYrTmdJWjZQaTdvVDlSUGo4R2RzalEvUk9WcWlJ?=
 =?utf-8?B?SEoySTl5ZG9zWjJsNjNsM2Q4MDdXM05wdHZmMHp6M2xTMStvNXV3OVZyaEJp?=
 =?utf-8?B?dGZuTlNhMWhRK1dPZEUvanZtZDdrcWJZbFl0d21ieTNvbXo1L25CbDdaY1Bp?=
 =?utf-8?B?eU1UOGVBTGZRWVdYYVFXYVpad0dxRS8rekRpZ1BVZWowdGZPK09SQWl1RlF4?=
 =?utf-8?B?R2w4cGRtVzRaWllBeWZtTUpxL081cTlOS3crYWJIbVhjYXBselU1U1lONnh4?=
 =?utf-8?B?d2tuRTB6TXAzc0tOZW1idFVreGt3YURTNWpjWHBqdUhmcllvSkxnbkVWV1BK?=
 =?utf-8?B?Z1NZZUFaNHhISkI3cE5ZUEJreVVZblhzU3VwY1ZRK3A3OVp5bXBlUnNTRURY?=
 =?utf-8?B?MkJCb3BhOVZWcnR5WGdNMHY3STBXanphK084TVFUeXhtVUNSeWVtNWFMOTlO?=
 =?utf-8?B?Ty9xSTg1akdMVlp3Skl2cmhzYnFCMk5GdEhsUFdkRnVjQjNOY01acGFqODkr?=
 =?utf-8?B?d3E5SE02a1J6U1JwUWpBMllsWVZ3cFJBRzVNWGkzWEdxNXZ5RFgvWW0wTDZu?=
 =?utf-8?B?VnFMNXFPdzNEN01LRXZ0dzQ4RjhzK1hON01kQldXSFo0dGhaSUZ0c2VPemxU?=
 =?utf-8?B?YVk0MkRYOGZ0RFFlV01KWDZMSUQzM3VWMWovL09mSzA1V0UzVlpySm9HWXVm?=
 =?utf-8?B?Qi8yTXFZWVFIa296YTJ3Q0JKcFFOaWpMNjVudUtKeFdoNkZNNFlMZjBIR3V1?=
 =?utf-8?B?d3hFK3ppcThEam1ReFVZSFppM0E1RktQcjBVQUIwZlNXRmx4TnZYZEhkSmRG?=
 =?utf-8?B?dzF4dmlzcGZLTUpBYXdtYWNlTkRndWRzaENoWi9hZ2paanh4VGpQTWFzNlZt?=
 =?utf-8?B?U2xqejA5YWZwTm92RHM1VVp1ckdraXhpbTNLQzVRL2VEdHc3cy9kZ1VqNktH?=
 =?utf-8?B?dzZVR0JIWERQV0U4RW81YkRKcVNUVkk1cXExYnF4dWR6QnloYm9hOVUwUHJC?=
 =?utf-8?B?WHE0Wm95UHR3bW11SzZUNlBvZnRtREZkcVJIaGNDTTJCYnNkdFROd3Y0WGFK?=
 =?utf-8?B?ejhhNkZrLzlwYThqYlBZQlQ5Wmw4Mjl2VTRpMGxaaTFWQm95MVZYanhmaktP?=
 =?utf-8?B?SHdyOW9lNWZ5VzIzbFM5OW5mQk4zSUgxZjhRenJPc05XVVVVaS9ONHBiSnZq?=
 =?utf-8?B?NHkzSDVueHNZNHBlOEttZi9OaFU5SSsxZzJpNE96bnM5bFZ0ZWVlajFSS0Rm?=
 =?utf-8?B?MGFMMzB5RXVnVG5aSWlldFFMZDlBQ3JYUzBYeS9VMHl6VHRrbzFlUUxHRnlK?=
 =?utf-8?Q?RVCZHIAS2Vg+uZNYz0HluHiky?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C4A425CBFED2B40942560D46E06BA16@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46671ef6-aa92-406c-9916-08ddb303158d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:39:58.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9Uf/sgzqF1KGMzhqidArE0xyx7tx0xWpVptaiVW8ALqmSS9omU8weM4syeIg1n/0pCJeDms4M1sOuiIhfQJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7875

T24gVGh1LCAyMDI1LTA1LTIyIGF0IDE2OjM0ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IE91ciBoYXJkd2FyZSByZWdpc3RlcnMgYXJlIHNldCB0aHJvdWdoIEdDRSwgbm90IGJ5IHRoZSBD
UFUuDQo+IERSTSBtaWdodCBhc3N1bWUgdGhlIGhhcmR3YXJlIGlzIGRpc2FibGVkIGltbWVkaWF0
ZWx5IGFmdGVyIGNhbGxpbmcNCj4gYXRvbWljX2Rpc2FibGUoKSBvZiBkcm1fcGxhbmUsIGJ1dCBp
dCBpcyBvbmx5IHRydWx5IGRpc2FibGVkIGFmdGVyIHRoZQ0KPiBHQ0UgSVJRIGlzIHRyaWdnZXJl
ZC4NCj4gDQo+IEFkZGl0aW9uYWxseSwgdGhlIGN1cnNvciBwbGFuZSBpbiBEUk0gdXNlcyBhc3lu
Y19jb21taXQsIHNvIERSTSB3aWxsDQo+IG5vdCB3YWl0IGZvciB2YmxhbmsgYW5kIHdpbGwgZnJl
ZSB0aGUgYnVmZmVyIGltbWVkaWF0ZWx5IGFmdGVyIGNhbGxpbmcNCj4gYXRvbWljX2Rpc2FibGUo
KS4NCj4gDQo+IFRvIHByZXZlbnQgdGhlIGZyYW1lYnVmZmVyIGZyb20gYmVpbmcgZnJlZWQgYmVm
b3JlIHRoZSBsYXllciBkaXNhYmxlDQo+IHNldHRpbmdzIGFyZSBjb25maWd1cmVkIGludG8gdGhl
IGhhcmR3YXJlLCB3aGljaCBjYW4gY2F1c2UgYW4gSU9NTVUNCj4gZmF1bHQgZXJyb3IsIGEgd2Fp
dF9ldmVudF90aW1lb3V0IGhhcyBiZWVuIGFkZGVkIHRvIHdhaXQgZm9yIHRoZQ0KPiBkZHBfY21k
cV9jYigpIGNhbGxiYWNrLGluZGljYXRpbmcgdGhhdCB0aGUgR0NFIElSUSBoYXMgYmVlbiB0cmln
Z2VyZWQuDQo+IA0KPiBGaXhlczogMTE5ZjUxNzM2MjhhICgiZHJtL21lZGlhdGVrOiBBZGQgRFJN
IERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNv
bi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmggIHwgIDEgKw0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jIHwgIDUgKysrKysNCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19jcnRjLmMNCj4gaW5kZXggOGY2ZmJhNDIxN2VjLi45NDRhM2QxZTVlYzkgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+IEBAIC03MTksNiArNzE5LDM2IEBAIGludCBt
dGtfY3J0Y19wbGFuZV9jaGVjayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICt2b2lkIG10a19jcnRjX3Bs
YW5lX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2NydGMgKm10a19jcnRjID0gdG9fbXRrX2NydGMoY3J0
Yyk7DQo+ICsJc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxh
bmVfc3RhdGUocGxhbmUtPnN0YXRlKTsNCj4gKwlpbnQgaTsNCj4gKw0KPiArCWlmICghbXRrX2Ny
dGMtPmVuYWJsZWQpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCS8qIHNldCBwZW5kaW5nIHBsYW5l
IHN0YXRlIHRvIGRpc2FibGVkICovDQo+ICsJZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5sYXll
cl9ucjsgaSsrKSB7DQo+ICsJCXN0cnVjdCBkcm1fcGxhbmUgKm10a19wbGFuZSA9ICZtdGtfY3J0
Yy0+cGxhbmVzW2ldOw0KPiArCQlzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICptdGtfcGxhbmVfc3Rh
dGUgPSB0b19tdGtfcGxhbmVfc3RhdGUobXRrX3BsYW5lLT5zdGF0ZSk7DQo+ICsNCj4gKwkJaWYg
KG10a19wbGFuZS0+aW5kZXggPT0gcGxhbmUtPmluZGV4KSB7DQo+ICsJCQltZW1jcHkobXRrX3Bs
YW5lX3N0YXRlLCBwbGFuZV9zdGF0ZSwgc2l6ZW9mKCpwbGFuZV9zdGF0ZSkpOw0KDQpJbiBjb21t
aXQgbWVzc2FnZSwgeW91IG1lbnRpb24gR0NFIGZsb3cgaGFzIHByb2JsZW0uDQpUaGlzIGFsc28g
bW9kaWZ5IG5vbi1HQ0UgZmxvdy4NCklmIG5vbi1HQ0UgZmxvdyBkb2VzIG5vdCBuZWVkIHRoaXMs
IG1vdmUgdGhpcyB0byBHQ0UgZmxvdy4NCg0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+
ICsJbXRrX2NydGNfdXBkYXRlX2NvbmZpZyhtdGtfY3J0YywgZmFsc2UpOw0KPiArDQo+ICsjaWYg
SVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gKwkvKiB3YWl0IGZvciBwbGFuZXMgdG8g
YmUgZGlzYWJsZWQgYnkgY21kcSAqLw0KPiArCWlmIChtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hh
bikNCj4gKwkJd2FpdF9ldmVudF90aW1lb3V0KG10a19jcnRjLT5jYl9ibG9ja2luZ19xdWV1ZSwN
Cj4gKwkJCQkgICBtdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID09IDAsDQoNCkNoZWNrICdtdGtf
Y3J0Yy0+Y21kcV92YmxhbmtfY250ID09IDAnIG1heSBiZSBub3QgZ29vZC4NCklmIGEgdmlkZW8g
aXMgcGxheWluZyBhbmQgbXRrX2NydGNfdXBkYXRlX2NvbmZpZygpIHdvdWxkIGJlIGNhbGwgZXZl
cnkgZnJhbWUsDQptdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250IG1heSBub3QgYmUgemVybyBhbmQg
Y3Vyc29yIHdvdWxkIGJlIGJsb2NrIHVudGlsIHRpbWVvdXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+
ICsJCQkJICAgbXNlY3NfdG9famlmZmllcyg1MDApKTsNCj4gKyNlbmRpZg0KPiArfQ0KPiArDQo+
ICB2b2lkIG10a19jcnRjX2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCQkJICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0
YXRlKQ0KPiAgew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19j
cnRjLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuaA0KPiBpbmRleCAzODhl
OTAwYjZmNGQuLjgyOGYxMDliODNlNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19jcnRjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19j
cnRjLmgNCj4gQEAgLTIxLDYgKzIxLDcgQEAgaW50IG10a19jcnRjX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtX2RldiwgY29uc3QgdW5zaWduZWQgaW50ICpwYXRoLA0KPiAgCQkgICAgdW5z
aWduZWQgaW50IG51bV9jb25uX3JvdXRlcyk7DQo+ICBpbnQgbXRrX2NydGNfcGxhbmVfY2hlY2so
c3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gIAkJCSBz
dHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZSk7DQo+ICt2b2lkIG10a19jcnRjX3BsYW5lX2Rp
c2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSk7DQo+
ICB2b2lkIG10a19jcnRjX2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCQkJICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnBs
YW5lX3N0YXRlKTsNCj4gIHN0cnVjdCBkZXZpY2UgKm10a19jcnRjX2RtYV9kZXZfZ2V0KHN0cnVj
dCBkcm1fY3J0YyAqY3J0Yyk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4g
aW5kZXggNjU1MTA2YmJiNzZkLi41OWVkYmUyNmYwMWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX3BsYW5lLmMNCj4gQEAgLTI4NSw5ICsyODUsMTQgQEAgc3RhdGljIHZvaWQgbXRr
X3BsYW5lX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCXN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKm5ld19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9z
dGF0ZShzdGF0ZSwNCj4gIAkJCQkJCQkJCSAgIHBsYW5lKTsNCj4gIAlzdHJ1Y3QgbXRrX3BsYW5l
X3N0YXRlICptdGtfcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUobmV3X3N0YXRlKTsN
Cj4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9v
bGRfcGxhbmVfc3RhdGUoc3RhdGUsDQo+ICsJCQkJCQkJCQkgICBwbGFuZSk7DQo+ICsNCj4gIAlt
dGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuZW5hYmxlID0gZmFsc2U7DQo+ICAJd21iKCk7IC8qIE1h
a2Ugc3VyZSB0aGUgYWJvdmUgcGFyYW1ldGVyIGlzIHNldCBiZWZvcmUgdXBkYXRlICovDQo+ICAJ
bXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLmRpcnR5ID0gdHJ1ZTsNCj4gKw0KPiArCW10a19jcnRj
X3BsYW5lX2Rpc2FibGUob2xkX3N0YXRlLT5jcnRjLCBwbGFuZSk7DQo+ICB9DQo+ICANCj4gIHN0
YXRpYyB2b2lkIG10a19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LA0KDQo=
