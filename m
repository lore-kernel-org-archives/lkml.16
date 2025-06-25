Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03E1DE4D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834507; cv=fail; b=NRPrAGvBhUrqztBu7aX6Z4Dv/2IRDHf10f1eFO4KG8X1oBMxw+D3Kubxz+6H/N3+GViIHwtHoCziQIm+4u0eYYfYceR0/8GtICJcdps6DLYiiFv/IIFYEvSZ4xpS6xy/OU4Uw6u/RzXeKijQlo3KWrVBrM5R5thGtCiaHiYkTdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834507; c=relaxed/simple;
	bh=V+Li+TTWSe4085r8Id+tKLY2/YLKaLQet1bhNzB9I/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oncg40sf0MjkG4/fK+blgPFCpuV4VTsEn2NA8HlUdgdWMhxdnXnYkBd8H32/9YixVi4P7zK1JRwL4vFNn8t/RjoDqpnKbv0YHY0aOPqCf68VWEwe/QM45AUq8SjYBJJJNPDoZNTvT0uMWdxR2V3iCN28gCvyN6/qL4azqBSkzJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ju8q1Cmd; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KRUftVaz; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ju8q1Cmd";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KRUftVaz"
X-UUID: 4bc813fe519111f0b910cdf5d4d8066a-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=V+Li+TTWSe4085r8Id+tKLY2/YLKaLQet1bhNzB9I/c=;
	b=ju8q1CmdI2YPpTFpNqQioz/hNdHEC6o6L05N9BGI55eo7HQz4H0QQm++QD1+5VH2ABc/QF/xZxNfferLqyErvpLzX9jayT2rP+iCniky+PRtWgXCtpOwVCk9yuTUQhs9MeuXXq0Z8sObMutUqLNxjssEXt6ukc8RuHnYaFnt+V4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:146e8f74-24c6-4b98-b8e0-c0d1e9c78e9e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3b6d8b73-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4bc813fe519111f0b910cdf5d4d8066a-20250625
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 325091704; Wed, 25 Jun 2025 14:54:53 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 14:54:50 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 14:54:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8NtzXnKauKHGuQZP/DzL4oOIJYJdLf1ra1O0Hy0Q6AXuGTA+oYF0PoL2xANUcrMpkw89tD2gfOwSD+4NWpkWbLTpwYX+jji5r8iI6tKCHw/UjSFFH66D2krcsDhZxuuGsyRoIHeVU3Z+dZMFoh2abWAfGEdv7DxuG7DRFC6QUwnlR9v3TvlnR+1ibxa3A9Vl32HfD3rmGqAqnSQdd70j/0Xpm4xfDzw0CyQjgbwjH8gKuTyO1/MOGdDhK9MiJT1hIK4wO9CpgHDppoRrXgt4NiOWQwSB+8VSVYUVyGE/Jk5YshmOoXaqimElIPb47OorC1YQBsczkH4zxxWGwHuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+Li+TTWSe4085r8Id+tKLY2/YLKaLQet1bhNzB9I/c=;
 b=clZV1EbUV5yWojCxcOePlLupSRiJ4G53j6V/WdeebV+xiRRUmt4pbTta/9LlLI6hPYbpznuL7QtrSVtC59atrlkM5GsMkw1RFIBHhiRBrWvYiMdRVjDiUAUryl6JwI4hHDJW8zKy7RS3LbuDcx4YPA54lMQAXyzj9CzTUW1ahoyQFjFcI7/QOkbSxnkLiQLziLnMNVZxAOV13/GSoIDLMlLxqn5nc0FnugoC0ysUjqrFPhX2ZMDFtiVVLIvLwJsl43g2B8nRF+HKhwx5jMdR4zAEjCiiEB/+jAO2r/UamPwtN8iuB+Lwd/4mgeMuIajol37bMCEAV4dqUElbzmau8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+Li+TTWSe4085r8Id+tKLY2/YLKaLQet1bhNzB9I/c=;
 b=KRUftVazed5AKOhErK08bXBHuCGDLQCqCBF2ES+cgF/r5LXqYYz5KIlEaoR5R274qSYFZqw4cyb+pKTnEAA02tw/VYEmIfS893JXw+AfCwms0yEVWb8/AnoLD1NLRVFUOoN4TXuFHKTaQ5kLxnkJPRQe1Cr8FeJMr85lWTRNKR4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8552.apcprd03.prod.outlook.com (2603:1096:101:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 06:54:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 06:54:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>
CC: =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
	<Sirius.Wang@mediatek.com>, =?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?=
	<Zhenxing.Qin@mediatek.com>, =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Topic: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Index: AQHb5QI4PRT0KPkbBkqas5J9O0aqnbQTcgsA
Date: Wed, 25 Jun 2025 06:54:44 +0000
Message-ID: <669aae01778b4dbd49420fff053a6fa59078a9b1.camel@mediatek.com>
References: <20250624113223.443274-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250624113223.443274-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8552:EE_
x-ms-office365-filtering-correlation-id: 31239998-83c2-4494-d65c-08ddb3b52b1d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RHpaaU96UjJHWHFEREowQTFPSGpSc0t0MnBkREJhb3FVTjVyeVJOUWI3b1NO?=
 =?utf-8?B?VGpEeEtZMi8vVTF0Y05jY0lUYXA5M2tKaXRMNFhLVXNURTZ3K2VlYzV2bHJ0?=
 =?utf-8?B?VWZwN0FBeC9ubEdHZlZJTzRPUmh4eHBpa3VNSnp5SWp5a1JSOHhRWEM3OHp1?=
 =?utf-8?B?UkhPb2pSc0s5Rk12bC9IZTdFNW1GQ2tNMFBoZ0dSYWdMQnkxNjkvMDNURmli?=
 =?utf-8?B?NFpuRW1mcXhQYi9DMUFodjd5WW5XbEpZd0F4Smc3K0k1UndXclA3RG9tV0d4?=
 =?utf-8?B?NnEyRDRXdkRudmxlWm5TSmtCNlBCak5rd2w3eDNnbTRFeU1sdmxML1NxVmtQ?=
 =?utf-8?B?OFVIQmRMREcwbmU3elhYM3NPVDJTazZLYUwrMzdSNmZsZjg4MDFsZDUvZ1d4?=
 =?utf-8?B?cFViYUNNVEViRlk1OXA1ZnErZkIxL3pYOUJKekhNcTA1S1RSTnBiR2U3WjV3?=
 =?utf-8?B?Ni9LU3BBUEZBYUtia25KQ3dnSHI2TmZlNTBjREpsTGxIQ2V0N1o2TUZUQjdr?=
 =?utf-8?B?bDVWRHQvNDhZT2FZcyt0OXcrZkJQbU11cFF1QjRxRlVucG5CV1A5a2lGN294?=
 =?utf-8?B?L1c0K1RCRVNtK2t4N0dhTmtsSzIwVWpLMXExc28xTGxaSlNwUEpDRDhLUjM3?=
 =?utf-8?B?VGs1N3dQcmtlSEVHT3F0eFlLVnRnVzJnSEhUM1hEL1YxY01BcXBLYWhEMU9Z?=
 =?utf-8?B?OWlydXVTM3dkMGF2bE5scXcxbWVwbmNnWDFnbHJLK21KN2VQMzM0SlNzb3hY?=
 =?utf-8?B?K3craUI1ZzVjTVljNjBJczhNR2NKbDZUdFNDUWxoTHZLL0IyQkIxTW9hT2tn?=
 =?utf-8?B?MGVMK1YzRktzQS9MdTJyMjA3SjB2dWRuS29pSEZ2dFVqVE1FTnJSRDRKTmZi?=
 =?utf-8?B?MW82bUw0Y2ViekRINzNPNlNQWTk2OXRNVUlZY2YwTlBsNUxyQUk2UzFyeGpD?=
 =?utf-8?B?UTl4QldhdnlIdmpJZXFHeU44TWlnMUFKa2g1cUMwSjEvTzNVN2FHd01TL1BG?=
 =?utf-8?B?MUUwc3VDdmJqcnI3NGpJRlArSWRFdmVPdXQwL2xURGFORXQ4Vzd5ZTJxOVZE?=
 =?utf-8?B?SFpCRExEU25XNjZwMi9SNmhYSVRZRVQzcXY0cXlmRzlEb2NWQ0R1N090VHRj?=
 =?utf-8?B?WFVsUzVZc3JVdnkvTUtma1FMaE40QUN5ekw5OEdXRkp6RFRNdVhNTlN6cjJ4?=
 =?utf-8?B?QklHWmwzQml0bDd2MEhSVmk0N0J4ek85bVdFQzNuMllVb0VvMHlvMmdDUzAy?=
 =?utf-8?B?bFZ6cWhaeDJyY2RuakhYSCtuSlFVcGtVelJGTmE5WDJoU29nUVhJczFPblBH?=
 =?utf-8?B?TmlzK2xqaUFhUlZ4SHZlQ0UrOFZYU0dFQWtPbUVTOVEzMGxQWGVUcVBEWGxJ?=
 =?utf-8?B?dkFYRTE0aGt4ZFh4TUJiWFA2SWQza0w0anF4TGdJbjZkYm5wWGhoTm9qTjZN?=
 =?utf-8?B?Y1I2U2h1b3JwWHhsZEwwb1RLZUpCNXRzRlYzVGNldE8yT1JkbjRpQmdEMUsv?=
 =?utf-8?B?MExxaTROUjVCSVVlS053Tnlqc1RWckovcGhGWDBJODVpcVJCc3ZKc29uSnE3?=
 =?utf-8?B?c0pidDhOSjNRREw4eitlNTRUM1N4WjZ1M3Bia0JLUGo0MVlzekNCWXpqeGhO?=
 =?utf-8?B?SlRoai91d1QrN3RMNzFoUnl6NFhJNExCV2dIbGpIdUNDWmlPcERHZkhOcHIz?=
 =?utf-8?B?WUdLT0NWN2xubUExOHVSQzRoU0JtNTRQZDUvc3F2MzZkQlJVdU45aXN5NDFS?=
 =?utf-8?B?M3VxLzZBdHlIL1ZqbGI1ZkdNaG5XWHhuUENIekg0VkpLejNlZzU0QmFyYlBB?=
 =?utf-8?B?TklqSHZhSXB4bU8yUi9ucEVkeE4wbHprZXBFR2pXTkNFY3FFYkxKRERKWTQ0?=
 =?utf-8?B?bXhKZnhGbzcwbWtYQ3V0N0dRMEFoL1YwWGg2Rk5iL3NIL042ZWJaZWIwZkZm?=
 =?utf-8?B?THJuK3h5OHpXSG5HWWk2WEJEYkt2Rnd0Zkd4MVo5M2thN0VKWjdXMElNZFFn?=
 =?utf-8?Q?iH2hsAJK9MzL+fy91RyGGAj/8mH/GA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm1jQkF3MEFMMXN1dmJCcWhHbFBUL2xhMnpUT2FVOWpyZTJ4ZXN3UDFrd2Vu?=
 =?utf-8?B?T3g3UnVBT3RsdG1qWXcyOHU0a3VHaXNvdXRoWDV0dnpyWk50alpJSk4wNXBW?=
 =?utf-8?B?bWJ1QXdBRmdtNG83SGY0TnlBYkVQRVpPa0QxVGxPMEtnWkhsVHZzVTdIT1dh?=
 =?utf-8?B?R1JROVhVa3pzK0l6QXZjeWk3UksxWjZNZENDZGRteVVlV2VCdzV0aStRbGwx?=
 =?utf-8?B?SFRkVHNnRjBLaFlFakQ2M2xGdW83UjV4NFQ5M2dyS0VoZTVsZGlSSFpFWkZR?=
 =?utf-8?B?Wm8wcEQrNStuMVhNOVlBTG5kUEphS3dIQndjTkcrMWt6MXhtRm1yeGpMMFgw?=
 =?utf-8?B?V0VpeC9NelhTVXJHd1JCTFFYZDFabDNaUEswdUVRdzNVUm5ZUWFkNnFwblRn?=
 =?utf-8?B?ZEhqUzk3aVJmbldnMEFQWkFqcWZYclN3ZTZJQk9qRG9CVE55bVlHaUdaZjdw?=
 =?utf-8?B?ME1qNDgwVk1XR3ZmU1RTUXE0d1BzeFZXekNiM0dtSmJXazYxK3I2RzRCN0R6?=
 =?utf-8?B?R0MyRGg4YnJEbVN0UFhQSDJkYmRvOXh5TWRmYlYxWEg2bzdNcEIvYjlFMTgy?=
 =?utf-8?B?L3gwTURWZ25iZ3RhT2Y2M0tqalhvWjh3ZDd5amh5cW1OUklQdkNrUlpHamNu?=
 =?utf-8?B?TU11U0EyOGJML0E0cGRuSXV3TnczOWhralFVN0tqWi9adjN3ZnpnbWpTY2l4?=
 =?utf-8?B?WW9hL3FuYWc5eDZOWDA5eTJPN2owWkNGclF6V0Ryc3JjY0IrL1dRbkE4QzVy?=
 =?utf-8?B?Zmw1Z0tnalRZY3N3Rm82bHJrLzcwUUVFeFBndnVLM3ZEekVTMUtNU1lIcEpo?=
 =?utf-8?B?RENwR0Z1YzRCRElSK3U1UGIrTE5WdGU5S3dPQXBMQUdGYkd0V3dUc29udkFD?=
 =?utf-8?B?TnEwZEpPcDVrclBmYjBSUE5xVDN4UjRxK0ZOdDVuVEJmclQwaUdvNGtSb09E?=
 =?utf-8?B?VmY5MHNTeEd4NzNuMi9GOUdqRkc5ZjMvQUpTcG5NVFowYzc4NFZjOEFDR2dK?=
 =?utf-8?B?MnhKSFBTTU5ZRmJWNFFtbUFlOVBES3VEeGZDejhQaWlTYW1wQnRCWUExc0NU?=
 =?utf-8?B?STdJQkt3dnh6T1Jrd2FvMjBHYkZxQmRJZ29YRjBkalpHZzZldVhiY1BWazk5?=
 =?utf-8?B?OTNNUlF2WndmYmdzTnIxaERxL2NTdDh0bHRDYnNIalVCNmVXUHJtVnhEYlhY?=
 =?utf-8?B?a1E2eWg5dm9RTnlUTXVPNWtWblRrWTdyc3lDRUZGQm5NeTd1cU9iS210bTIv?=
 =?utf-8?B?SCtrdFl6N3hKVDc4K0FVaGlqZXM3dmIwdTlCcDdtSCtlUE9FTmZmSmN3dm9s?=
 =?utf-8?B?dmNjMU9zeU4wSDg4YnZhS05Gbk1nSDJaR0J1Z240N1VmQ20wRGhERE1KK3NF?=
 =?utf-8?B?VzMrTXVvTGErVWN5L01ONy9lTjJlY2xQTmhiVFAxNTFPc0hYOTlTT28zRFp3?=
 =?utf-8?B?TmxKUUwyVTJ5MUdpK0NvTUZMcXFrTWZjZ0JMY1NKS29FdmFVK0tsWTk0dHNp?=
 =?utf-8?B?UGJTNFA2NUJtd2NGQVVRbFZrMVVSN3lqeVpoYVloQ0tKODJwWkR6VnR2eHND?=
 =?utf-8?B?VXNuQ0NaMWlWQ2JyYTJqODNsR096YWp1am9tcktyMmFwWUprb0owcHlRUHd6?=
 =?utf-8?B?NWtzK3BNVEFyODZONFdLdlFZdE1QWTZpdFh5TlNEdC9uNkgzUW4rTTdvRFRZ?=
 =?utf-8?B?VGFRbGpYVi9wSTRYMjVlN0l5YkFWa1ZxbklWNWtsUExrSk1uV1RiOE1MTWlU?=
 =?utf-8?B?MkVUakdsYVZIdVVKdCtCWWsrYVNvQTRCUUVFY0k3bDg1MXk3aldoTnBoNy9F?=
 =?utf-8?B?VlRLNjV2bTh0WDdCLzlJcndKZE81Y1BDZFNRZ0RiVndZY3R3cE9YcDZQU0xR?=
 =?utf-8?B?VHJ1dXVkVEk5bVFxcXJKVFZ3cXo4VHRhNjFNM1htOEtxMjNidUlSdC9BSjdF?=
 =?utf-8?B?UCtYMFFpbzEwQ2duVk1OUFh2cTFxUjdPdjhONE04bmNVd1ZYUEtXREROalFI?=
 =?utf-8?B?SmowQ2VIbDc3QS8waGJXUW9pNzd3UWZwMGhPVFFlQ1cvQm9Vc2h2OTFDR2Vz?=
 =?utf-8?B?bnR1bjAvU0hYbzdrSUtrelRudHVkRmhrZnptdDVlSCtFSWlHOWNpYTQ4eEJz?=
 =?utf-8?Q?7YAHtaPUXmPSJgrkIrGLHZvSm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E0936D8C441DA4F824C7D5972EBF8FA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31239998-83c2-4494-d65c-08ddb3b52b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 06:54:44.7097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODXuhydx/5ZQngf6l59xZ7LTR862v9wH71mTY34Ui3b2uaPjmDbWEWDFpdVCH0VHJcZ9MIGs4ziGia3dZEqd6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8552

T24gVHVlLCAyMDI1LTA2LTI0IGF0IDE5OjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
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
IERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQ0KDQpUaGlzIHBhdGNoIGxvb2tzIGdv
b2QgdG8gbWUsIHNvDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
DQpCdXQgZml4ZXMgcGF0Y2ggaXMgbm90IGNvcnJlY3QuDQpJbiAiZHJtL21lZGlhdGVrOiBBZGQg
RFJNIERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iLCBpdCBkb2VzIG5vdCBzdXBwb3J0
IGNtZHEuDQpUaGUgZmlyc3QgcGF0Y2ggdG8gc3VwcG9ydCBjbWRxIGlzIDJmOTY1YmU3ZjkwMCAi
ZHJtL21lZGlhdGVrOiBhcHBseSBDTURRIGNvbnRyb2wgZmxvdyINCkkgd291bGQgY2hhbmdlIGZp
eGVzIHRhZyB3aGVuIEkgYXBwbHkgdGhpcyBwYXRjaC4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNv
bi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jICB8
IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfY3J0Yy5oICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
cGxhbmUuYyB8ICA1ICsrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+IGluZGV4IDhmNmZiYTQyMTdl
Yy4uMGM4NTZjYzY3OWRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0K
PiBAQCAtNzE5LDYgKzcxOSwzNyBAQCBpbnQgbXRrX2NydGNfcGxhbmVfY2hlY2soc3RydWN0IGRy
bV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gIAlyZXR1cm4gMDsNCj4g
IH0NCj4gIA0KPiArdm9pZCBtdGtfY3J0Y19wbGFuZV9kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0Yywgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpDQo+ICt7DQo+ICsJc3RydWN0IG10a19jcnRj
ICptdGtfY3J0YyA9IHRvX210a19jcnRjKGNydGMpOw0KPiArCXN0cnVjdCBtdGtfcGxhbmVfc3Rh
dGUgKnBsYW5lX3N0YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7DQo+ICsJ
aW50IGk7DQo+ICsNCj4gKwkvKiBubyBuZWVkIHRvIHdhaXQgZm9yIGRpc2FibGluZyB0aGUgcGxh
bmUgYnkgQ1BVICovDQo+ICsJaWYgKCFtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikNCj4gKwkJ
cmV0dXJuOw0KPiArDQo+ICsJaWYgKCFtdGtfY3J0Yy0+ZW5hYmxlZCkNCj4gKwkJcmV0dXJuOw0K
PiArDQo+ICsJLyogc2V0IHBlbmRpbmcgcGxhbmUgc3RhdGUgdG8gZGlzYWJsZWQgKi8NCj4gKwlm
b3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmxheWVyX25yOyBpKyspIHsNCj4gKwkJc3RydWN0IGRy
bV9wbGFuZSAqbXRrX3BsYW5lID0gJm10a19jcnRjLT5wbGFuZXNbaV07DQo+ICsJCXN0cnVjdCBt
dGtfcGxhbmVfc3RhdGUgKm10a19wbGFuZV9zdGF0ZSA9IHRvX210a19wbGFuZV9zdGF0ZShtdGtf
cGxhbmUtPnN0YXRlKTsNCj4gKw0KPiArCQlpZiAobXRrX3BsYW5lLT5pbmRleCA9PSBwbGFuZS0+
aW5kZXgpIHsNCj4gKwkJCW1lbWNweShtdGtfcGxhbmVfc3RhdGUsIHBsYW5lX3N0YXRlLCBzaXpl
b2YoKnBsYW5lX3N0YXRlKSk7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0NCj4gKwltdGtf
Y3J0Y191cGRhdGVfY29uZmlnKG10a19jcnRjLCBmYWxzZSk7DQo+ICsNCj4gKwkvKiB3YWl0IGZv
ciBwbGFuZXMgdG8gYmUgZGlzYWJsZWQgYnkgQ01EUSAqLw0KPiArCXdhaXRfZXZlbnRfdGltZW91
dChtdGtfY3J0Yy0+Y2JfYmxvY2tpbmdfcXVldWUsDQo+ICsJCQkgICBtdGtfY3J0Yy0+Y21kcV92
YmxhbmtfY250ID09IDAsDQo+ICsJCQkgICBtc2Vjc190b19qaWZmaWVzKDUwMCkpOw0KPiArfQ0K
PiArDQo+ICB2b2lkIG10a19jcnRjX2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
IHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCQkJICAgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlKQ0KPiAgew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19jcnRjLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuaA0KPiBpbmRl
eCAzODhlOTAwYjZmNGQuLjgyOGYxMDliODNlNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19jcnRjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19jcnRjLmgNCj4gQEAgLTIxLDYgKzIxLDcgQEAgaW50IG10a19jcnRjX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiwgY29uc3QgdW5zaWduZWQgaW50ICpwYXRoLA0KPiAgCQkg
ICAgdW5zaWduZWQgaW50IG51bV9jb25uX3JvdXRlcyk7DQo+ICBpbnQgbXRrX2NydGNfcGxhbmVf
Y2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4g
IAkJCSBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZSk7DQo+ICt2b2lkIG10a19jcnRjX3Bs
YW5lX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSk7DQo+ICB2b2lkIG10a19jcnRjX2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
IHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCQkJICAgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnBsYW5lX3N0YXRlKTsNCj4gIHN0cnVjdCBkZXZpY2UgKm10a19jcnRjX2RtYV9kZXZfZ2V0
KHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5l
LmMNCj4gaW5kZXggNjU1MTA2YmJiNzZkLi41OWVkYmUyNmYwMWUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gQEAgLTI4NSw5ICsyODUsMTQgQEAgc3RhdGljIHZv
aWQgbXRrX3BsYW5lX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAg
CXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19w
bGFuZV9zdGF0ZShzdGF0ZSwNCj4gIAkJCQkJCQkJCSAgIHBsYW5lKTsNCj4gIAlzdHJ1Y3QgbXRr
X3BsYW5lX3N0YXRlICptdGtfcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUobmV3X3N0
YXRlKTsNCj4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3RhdGUgPSBkcm1fYXRvbWlj
X2dldF9vbGRfcGxhbmVfc3RhdGUoc3RhdGUsDQo+ICsJCQkJCQkJCQkgICBwbGFuZSk7DQo+ICsN
Cj4gIAltdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuZW5hYmxlID0gZmFsc2U7DQo+ICAJd21iKCk7
IC8qIE1ha2Ugc3VyZSB0aGUgYWJvdmUgcGFyYW1ldGVyIGlzIHNldCBiZWZvcmUgdXBkYXRlICov
DQo+ICAJbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLmRpcnR5ID0gdHJ1ZTsNCj4gKw0KPiArCW10
a19jcnRjX3BsYW5lX2Rpc2FibGUob2xkX3N0YXRlLT5jcnRjLCBwbGFuZSk7DQo+ICB9DQo+ICAN
Cj4gIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLA0KPiAtLSANCj4gMi40My4wDQo+IA0KPiANCg0K
