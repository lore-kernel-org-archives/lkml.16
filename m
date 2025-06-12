Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EE21C178
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719784; cv=fail; b=DEF0DhVugM/HRY5O3xCrcgLpdUSvbuBZBXjnAJnqy1AznJqS9O0Z4Dpri80Qn3aMHlxe2nCmp1Y3+Nnq699d2J1y2H44QW/yvuxfu69yONw18x8ev3Iq0Ev1xKKtdmaTIp5OmGdmXcRFhjFZLOATQzB4LiTuk1cW+ppz1UEnfdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719784; c=relaxed/simple;
	bh=xsX4VX8RmuIqv5ccwjaXXjvRrOKLpet7zAYfKpXJL58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F52Jof6xcek0dqo/lFrhYJTIpJTe3MXaOaC+WoHm/4Tf8v+JiG0U6ZJtXnJqruoPRdJSlghwQqNGAmdxmwM5zlMZKYvWLD+O0YCyJpMKgp85lFDZo/F1rO2SgDnJYAYDmV+2sjW1Dw6mUOid/w9SjOoYIljS0cziSiA+nShXJtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PHIz9tZN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WY0N7GCy; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PHIz9tZN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WY0N7GCy"
X-UUID: e2d80c14476d11f0b910cdf5d4d8066a-20250612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xsX4VX8RmuIqv5ccwjaXXjvRrOKLpet7zAYfKpXJL58=;
	b=PHIz9tZNXQCoHxEcsKFickAhVnxov0PUjJNT7cn2J/Fo9cbvaJUkFfRAlXg07U6haVvGsf8cxj9w/T4SRaRniilGxOtHVCZmtou3fb01/sX0EmZt+v5T/aPuFsoODxR0PFtLxobYRpgvCnkPNm3ysoQUGnnu0CktWbrPZXxy2Ik=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:46079794-47b9-4cc9-bbc5-4a502eac6175,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:a4ff6128-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e2d80c14476d11f0b910cdf5d4d8066a-20250612
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747328164; Thu, 12 Jun 2025 17:16:13 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 12 Jun 2025 17:16:11 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 12 Jun 2025 17:16:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3uyX1vsslFm4RJ10Av1HUlqOiZ3rgn2jK8lpafIfPL6uYfdnFq/sGJ2zkrS6twhpvhXVpzoncpB6nyD4U0mkXNaPKh/2QQiqSDxSzYCHXjppJxWYh3gnMk1TQ9fSShH03Tl8mECWs9ixaHZWumktBRNiZe4C3pNh7uOz3Jltbtd9uELV2o4LJsV6fqnyLgCz7vfqVZxliBacron7cvpDynwfu8mz2Vv2Qqk9S2pVbVlLzO93n0Zq/8ojS7sw2+ZpgAG/pOtAHGVGmut17VvfL3WP9bn3ZYeGMREEhq/qndzalQwTuFlVq4/K3/iBo5OUZQbKM2R/U9R1SCz5Hgz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsX4VX8RmuIqv5ccwjaXXjvRrOKLpet7zAYfKpXJL58=;
 b=hT8vC2lpzUV1VvXdywPn4dhSyJLrqbF46EbWNtxgJFzzgXykOKPEur8rC7VxAweWbqFSHgRVbfwatyAqTyEUQO8X8TL4vG0DdYK8IYcKOi4Y1bID/Z0hc2lnLRVbw0QB1jRrXo3oNMlchJB6dfUMnpUApFtpAO3M8Nr+9Hy5RJmMOhm8FlriJwjhClT0RsYJ64y5ZVsMZ3MpMpjKHaP3bi6rNdRh7ffPoM0/wj3nviFHAAeFzLHDvHKqefvR4SC4RwbrFSVqBYrYhzyX/303GO6BavEBTp01Z5ECBL6I3zAwo7uEa8gGUeTnFIx88OHgOABNR4oLVenR/XNZYcrNsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsX4VX8RmuIqv5ccwjaXXjvRrOKLpet7zAYfKpXJL58=;
 b=WY0N7GCyKs4Q88gTFt7tm+7ZzuOrOGx7yLDTsSJckN/7jb/c15vH05P8LLjYcylyPXivoxiu8I4vlpbQaRY/yoVV0Oh9HC4F+itUA+5byLhxo6w7SBb++0zI1APm8R6prJNAG7qKeFI6oIHc0QrJo5BWUx5T9AnmU1tBcMV2p1I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI6PR03MB8652.apcprd03.prod.outlook.com (2603:1096:4:250::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 09:16:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8769.033; Thu, 12 Jun 2025
 09:16:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "uwu@icenowy.me" <uwu@icenowy.me>,
	"airlied@gmail.com" <airlied@gmail.com>, "greenjustin@chromium.org"
	<greenjustin@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: only announce AFBC if really supported
Thread-Topic: [PATCH] drm/mediatek: only announce AFBC if really supported
Thread-Index: AQHb0iVMSYYwJyGdSUi346uLkjJ8NrP8j8mAgALBLwA=
Date: Thu, 12 Jun 2025 09:16:09 +0000
Message-ID: <fa5204b35ba7d81e960a1a06ebcf7d8ebc97e04f.camel@mediatek.com>
References: <20250531121140.387661-1-uwu@icenowy.me>
	 <0ab12bdb2af26e6a328615611833dc575d691acf.camel@icenowy.me>
In-Reply-To: <0ab12bdb2af26e6a328615611833dc575d691acf.camel@icenowy.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI6PR03MB8652:EE_
x-ms-office365-filtering-correlation-id: 74123509-1181-4e0c-8c1e-08dda991c4dc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDNMSE8zUXYzYW1keHZHdCtjVGYvRkVwclhmSEdxOVF2MVV0akVPaEdBUml4?=
 =?utf-8?B?bmhDSmdSQjQzd1owQlNzeEg5YkhiS3JMWksrS0h4Y0ZPSjlValltMTI0ZWFr?=
 =?utf-8?B?S0FBYzNHY3VPbndGVXNmVkN3Q3VSZ1Zram1kQzJGQ2dTL1BldUJSQ0ZrUTI4?=
 =?utf-8?B?cy9iaGVEYkVsejZBV01ndEtyUlZPeC9nZ2d5R0dka3RqSG1xdC95cWNQckUx?=
 =?utf-8?B?eWtuZHUySlFPREw2M01RZ0pWMnBYTEd4bHdhNDdTbTR4QVZ4aWV6RldHSW9I?=
 =?utf-8?B?VzA5UFd4Zk4zOGFTeGtRL3NqOFFxTXc1VXhaT2JNbzNCdlgyWk5FdkpMajZz?=
 =?utf-8?B?UGhBSEduTWRVWWFIdGpMWEVBRDk1dUgweEdmbzBmVUZvNlpaUUdlUzExNzE5?=
 =?utf-8?B?SUQzNSt3c2pZd2dQd05hYUc2V1NGY0czNkM5ZXVtVG9SbzZnU2hycEhqYitp?=
 =?utf-8?B?d2xnOG9xenlxNVB4aFArbDhyVU9VT2tUSnJ0MHl2WncwWkp0NlRRMlp5ait2?=
 =?utf-8?B?OGwrMGhoYmtXRXB5NTNscFltSXpMR0FtTjJwQVl1Q3hja3RodW5mYVNrVEtv?=
 =?utf-8?B?VGVpaUhmWTYvSU9Cd2Y1Z05LSGx2cnZWRk9QZC9jQlF0QjZJY3NOSzlidUtH?=
 =?utf-8?B?dDJ5L3BRYUhyU3NlZk1XYzJFUGtmYWVzUFIray84alRGdFFYdEgwYlJlajNY?=
 =?utf-8?B?bTluZ2JaNUVHMWRLR2FuczR3YnhQc2Y2VENXbVlLWlBkNWN4Ynk3WG5zRXVW?=
 =?utf-8?B?VnVNQXkyZnlDQWp2aUJ3UGpzU3ZvNUtuMGwzdjduaUdLY3ZIT3I4WDdiLzkx?=
 =?utf-8?B?Y0VjQ0p4cEcxRkZRRjdablFQSW10QVduem1tUDRTdEV1SnQrZldobWZ4V3RQ?=
 =?utf-8?B?N2kwNmpnWW1wUjdDOGtheDltMDkxQTYyOEtJUmlybkt0WW1XZU9zSm9VcnZS?=
 =?utf-8?B?dGszU0J1RFhSNmFrMXFKMkZjcHN5UmhuWmxSekhNUi9DNWx6YTFuMU5OOU9Y?=
 =?utf-8?B?M1A0M3hCNVJrOUVDVmdObXhJRWVZZGppSEhXNmhyRHRqU2s1UVdwUHhld1Zi?=
 =?utf-8?B?OFNzc2hUYUhaTnd6cm1DdEZ2R1YyRGJIUldsVG1pLzU5UHBkQXA1NlhEV2xn?=
 =?utf-8?B?WnF5d296VGorekMwODBXSFlid1prNCtvbUgrd3pIYll6a1U2OVhPZlJBanZO?=
 =?utf-8?B?V3Izcjd5SnVBT0ltY2p0eW0xNkpQOHNvQmJ2NTBiRDVJSGppZnRyVnd5Zndj?=
 =?utf-8?B?cHlab2JsZ1dxQ1dld2hQU1RKYm1GbThWZjN5blh1Q0g0UkI0L05MZlc5dWJY?=
 =?utf-8?B?S0lUaStuZ3U1S0tCa1dOeExRVTc4VDlibUh3ZXNtSGthQ2hKUEEzZWV2TkNt?=
 =?utf-8?B?bHE1YUtXNkFRZUdGYWpROWVsMTdjbGlORDVuTkhKdlUxNlh4eGIwV0xmQVAy?=
 =?utf-8?B?VWxwTUZHeDRUaEE2eDlmOXNpajlqMXk1Ykphb05xTmhLR1o4SHZlSTNqNm9t?=
 =?utf-8?B?YWtld2llTnN2YkhaRGJmQ09QT3JObHNSYWxMOTdwMTQwVHQ2RXN6ZG1NZ0J2?=
 =?utf-8?B?S2NTeWFaTDdsc1kraTZlYmFxaFJJSnZlSU1oaWVIU0NNL0sxcjlVRjE5eWs3?=
 =?utf-8?B?YjhQNGZMcHFMaWl1VGF2SnBLdXdFMWRFZm5CSE5Ib3c1L0o5dEJ3ZzNkNU4r?=
 =?utf-8?B?ZVZCY0ZnR056bFJoK3VhQXd6bGpjY3lEL2RjSU9jcXhMdzVJS09iYWRkME5C?=
 =?utf-8?B?L0JPOHZicXRVY0VqZ1I1dVp6ZEQrb0Q0aXNTc0FvNDFJSFNkcW16V3dsMHJY?=
 =?utf-8?B?NTFSM3VLVE80VXdWTEFmZmJNVmcrTGJxOERyNitmUnZxSmpnYmJuaUoxSzAx?=
 =?utf-8?B?WDFBYnFDUWdRbkE1a0REYmNrVm5aZVp3MHloUWQyRGJMTVJTQzV6eGwzQXd1?=
 =?utf-8?B?bVZxWlZWbllnTGJrL1FoN0dzNlJES3I0Nmt4ZXpIQ3JwcklaK25tdVc4YklQ?=
 =?utf-8?B?YkhBNGdBN2VnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXZTTG9yaTlNcDF0K3lkMzJpRk5QbUljbi9PME9SQlZiOGNsSi9yalVDNzRS?=
 =?utf-8?B?Yjc3MmVPajBUSmlvT3Zua0xLT1hURnBWNWJJWDRleDBDSmFwbUFUMGVDU0pJ?=
 =?utf-8?B?aTZRcXJvQ3ptZnNvN1Jua0l0ZHJ6djJXMjVLblZoY3p1YzNNem8waWRaT2Jx?=
 =?utf-8?B?a240WnRxcDd3Yk1rR1lMaFFGNDBkWEU3ZFBBVi9icTYzanpNZHdEYXBpMHdE?=
 =?utf-8?B?ZFVIL1g1NEU0bmlvbEtvU2U1enNiYzlnUnl1dGVzL1RlRjZMSk9EM0w3YW95?=
 =?utf-8?B?YTJBZTdUa2FQSnZTZTJ3bEpTMDdXNG1QOWtKZURlbkNkQklJdm9IamQ0NVBL?=
 =?utf-8?B?aHhWM0Rza0RibmltZEc0NG9CdWRzQWtUTzhjWmVzU1Y5VjdoTnAwV1M0c3Q4?=
 =?utf-8?B?SHJ4OWhSRXVzK1BleHFxK0FOK2dHYW9CT1B4WmdOcDFKUVg0a0tMaWxVcjRx?=
 =?utf-8?B?M05GYnRlZk1oaXNTWHBSSTlsYWtTV05ySmFwZ1NJUndqbzdESXRUZVMxeUlS?=
 =?utf-8?B?V3JUbmxmaVBENHFQSHR6d1VCeUoyTEROK3BxWTNpTzZ6ZWJrOFZ5eThsUEx5?=
 =?utf-8?B?QWszU3ArT3N3Y1hQTWpNRE9NUDI1QU1hRFVRUnNkSlVvcDVZdDJwLzdLenVM?=
 =?utf-8?B?MVpvdmpxSHFLVjV0QnZPTGpndTJ3TUJzVE45U3R6cENoa2FnYTNxWVZHRktT?=
 =?utf-8?B?Z2pBZWpKTTdxc2VtT3lWTTFndGVtZjN6OVNsVG1DZDFFUEJwVVRIRVE4TDQw?=
 =?utf-8?B?UGFSbC9zSkhteU13WmFhOHVmVFpmLzlJdWdRVmVJMFZhSURpUk5JRlBKbFBH?=
 =?utf-8?B?TDVmZ2dIWGNweDJaUVM5NXdxMkRaYjczNWFGNkhBYUxBK0xTY3VNTWVGUTlU?=
 =?utf-8?B?Q3dIOVNYZGRtbHVaYUc4cXhhKzlXeWdMOHNoTjh0RTM4TTNSZWxjaFZJYkJY?=
 =?utf-8?B?b2xwZEhQVFNIV3cweEdpM2FWQWhubVl6M2NEa0h0QW5wQzdRT1ZqR0xjOUVQ?=
 =?utf-8?B?NUhoTXkvb1JzYUxoaEw3enZlR1lycThhVjIvd1hBZUplbUZPZjlSS0dnWVha?=
 =?utf-8?B?My8ycStyWXp5UnFrSy9aMEpSVWVKU2ppT1FGM3JoYm5icTBSSVJYTnd6VnZF?=
 =?utf-8?B?dzYwTm9scllhTlRDY2xwS3MrMFBYZUZ1WHYrWUJNU2hUMmxGdVhRYWwxbUJV?=
 =?utf-8?B?ZVFFenFMZFpoR2hWWlF2ZFRqQjhhZ2s3bFlUMU43QldNV3RaRVRncm42RjVl?=
 =?utf-8?B?WFJGYk9LT1dwN0hlMnRqNWowZkttT3ZDT25MdUx5S1FtSFMxRWpvdHJudGlM?=
 =?utf-8?B?SUxvNUtHdWQwWVYvUkgxd1QxQXl2aUVqaTNGMFg5UGR5SnRoNDFDT203OHJs?=
 =?utf-8?B?QjM1UVZ4WXhBZkJ5d3NnU2w3NDZVT1llK1ZVc1liTVpsYTR4aGlLMEovb0t4?=
 =?utf-8?B?MmRrWUNCY0hWZFJvU0toOGRWSXRxdlliNjVRYkc1eUhsV0NWZnBpWmF4V3k0?=
 =?utf-8?B?YWZqZ0RWaXIvRUdaK2FnTVd0RWhuSmNFclVEKzgzU2I4QTV6SmNjZVVwYnMr?=
 =?utf-8?B?VE1TQ1pXM2VzRnBCQ21TZzdxSTVxcGo2dTcwbWx6Ry9Ua0p6b2V3ZStlcktt?=
 =?utf-8?B?VEt2ZTNlRDZFbXFWM2xORWtRajBLR3BjMElzc3lMQm9WTDNSL0xtclYrdUpR?=
 =?utf-8?B?Uzg1TXFvMS9ZWERXVGJhS09JMkRtbkxkWUNYR0xSVWFuei9kVEhaVnVZcE83?=
 =?utf-8?B?U1JIMDBNVDlESXNLRm9xRHVKRksybTJDRXdUekFkSlE4VmFLTjYrbytnbzh0?=
 =?utf-8?B?d29NelhXdmkvcUhxbGJLcm81WW83L3Z0VFdJUHZ6eFNia2NWRU1Sa3lSbTJx?=
 =?utf-8?B?UzhFSS82MFN5aFNET2EvM1QvdVhkbWVOSjNHci9MWFhVNWZ1ZEFoYkx5bnVG?=
 =?utf-8?B?NmdLTW1kMDRjMVFyWkhFd2c5STFscDMwNlR0YlZKOFMyOHFQdC9BZmNpTzds?=
 =?utf-8?B?a2hNOExpVjhPTWNYSzlYNnhvOTlpMDZZdU11RGJRczQzSzRaQTJwRmJBZ1B5?=
 =?utf-8?B?dE5sNENWZDY3d2hGaHQvSEhLWGIwbmV2dW1lWm42dk9Dd2FFTU1jMS9vc0hT?=
 =?utf-8?Q?CyuhqvuBd1oENrGIiIQ/dydoK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1826F499AE4B074B814616FEC45F866B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74123509-1181-4e0c-8c1e-08dda991c4dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 09:16:09.4410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpB62nMG5Xcqnhzg7RJ9lTUXb671YZSohCyX1hF8dXN+t6k2qWMY+mD6oFr8SF/payy/lNlQsZ/5vX1Q+WcDMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8652

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDIzOjEyICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IOWcqCAyMDI1LTA1LTMx5pif5pyf5YWt55qEIDIwOjExICswODAw77yMSWNl
bm93eSBaaGVuZ+WGmemBk++8mg0KPiA+IEN1cnJlbnRseSBldmVuIHRoZSBTb0MncyBPVkwgZG9l
cyBub3QgZGVjbGFyZSB0aGUgc3VwcG9ydCBvZiBBRkJDLA0KPiA+IEFGQkMNCj4gPiBpcyBzdGls
bCBhbm5vdW5jZWQgdG8gdGhlIHVzZXJzcGFjZSB3aXRoaW4gdGhlIElOX0ZPUk1BVFMgYmxvYiwg
d2hpY2gNCj4gPiBicmVha3MgbW9kZXJuIFdheWxhbmQgY29tcG9zaXRvcnMgbGlrZSBLV2luIFdh
eWxhbmQgYW5kIG90aGVycy4NCj4gPiANCj4gPiBHYXRlIHBhc3NpbmcgbW9kaWZpZXJzIHRvIGRy
bV91bml2ZXJzYWxfcGxhbmVfaW5pdCgpIGJlaGluZCBxdWVyeWluZw0KPiA+IHRoZQ0KPiA+IGRy
aXZlciBvZiB0aGUgaGFyZHdhcmUgYmxvY2sgZm9yIEFGQkMgc3VwcG9ydC4NCj4gPiANCj4gPiBG
aXhlczogYzQxMGZhOWIwN2MzICgiZHJtL21lZGlhdGVrOiBBZGQgQUZCQyBzdXBwb3J0IHRvIE1l
ZGlhdGVrIERSTQ0KPiA+IGRyaXZlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVu
ZyA8dXd1QGljZW5vd3kubWU+DQo+ID4gLS0tDQo+IA0KPiBQaW5nLg0KPiANCj4gVGhpcyBwYXRj
aCBhdCBsZWFzdCBmaXhlcyBydW5uaW5nIHJlZ3VsYXIgV2F5bGFuZCBkZXNrdG9wcyBvbg0KPiBw
b3N0bWFya2V0T1MgKEkgcG9zdGVkIHRoaXMgcGF0Y2ggdGhlcmUpLg0KDQpSZXZpZXdlZC1ieTog
Q0sgSHUgPGNrLmh1QG1lZGFpdGVrLmNvbT4NCg0KPiANCj4gPiBQYXRjaCB0ZXN0ZWQgb24gTVQ4
MTgzLCBvbiB3aGljaCBLV2luIFdheWxhbmQgNS4yNy4xMiBpcyBmaXhlZC4NCj4gPiANCj4gPiBJ
biBhZGRpdGlvbiwgSSB0cmllZCB0byBmYWtlIHN1cHBvcnRzX2FmYmMgaW4gbXQ4MTgzX292bF9k
cml2ZXJfZGF0YQ0KPiA+IGFuZA0KPiA+IG10ODE4M19vdmxfMmxfZHJpdmVyX2RhdGEsIHRoZW4g
S1dpbiBXYXlsYW5kIGdldHMgYnJva2VuIGFnYWluIGFuZA0KPiA+IG1vZGV0ZXN0IGFsc28gc2hv
d3MgdGhlIEFGQkMgbW9kaWZpZXIgaW4gSU5fRk9STUFUUy4NCj4gPiANCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMgICAgIHwgMyArKy0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jIHwgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGRwX2NvbXAuaCB8IDkgKysrKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCB8IDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA3ICsrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19wbGFuZS5jICAgIHwgNyArKysrKy0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfcGxhbmUuaCAgICB8IDMgKystDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfY3J0Yy5jDQo+ID4gaW5kZXggOGY2ZmJhNDIxN2VjZS4uNTMzNTljMjQ2NWI2
NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+ID4gQEAgLTkz
MCw3ICs5MzAsOCBAQCBzdGF0aWMgaW50IG10a19jcnRjX2luaXRfY29tcF9wbGFuZXMoc3RydWN0
DQo+ID4gZHJtX2RldmljZSAqZHJtX2RldiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG10a19kZHBfY29tcF9zdXBwb3J0ZWRfcm90YXRpb25zKGNvbXANCj4gPiApLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21wX2dldF9ibGVuZF9t
b2Rlcyhjb21wKSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10a19kZHBf
Y29tcF9nZXRfZm9ybWF0cyhjb21wKSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG10a19kZHBfY29tcF9nZXRfbnVtX2Zvcm1hdHMoY29tcCksDQo+ID4gaSk7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGtfZGRwX2NvbXBfZ2V0X251bV9mb3JtYXRz
KGNvbXApLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21w
X2lzX2FmYmNfc3VwcG9ydGVkKGNvbXApLA0KPiA+IGkpOw0KPiA+ICAgICAgICAgICAgICAgICBp
ZiAocmV0KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+ID4gaW5kZXgg
ZWRjNjQxNzYzOWU2NC4uYWM2NjIwZTEwMjYyZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4gPiBAQCAtMzY2LDYgKzM2Niw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIGRkcF9vdmwgPQ0KPiA+IHsNCj4gPiAgICAg
ICAgIC5nZXRfYmxlbmRfbW9kZXMgPSBtdGtfb3ZsX2dldF9ibGVuZF9tb2RlcywNCj4gPiAgICAg
ICAgIC5nZXRfZm9ybWF0cyA9IG10a19vdmxfZ2V0X2Zvcm1hdHMsDQo+ID4gICAgICAgICAuZ2V0
X251bV9mb3JtYXRzID0gbXRrX292bF9nZXRfbnVtX2Zvcm1hdHMsDQo+ID4gKyAgICAgICAuaXNf
YWZiY19zdXBwb3J0ZWQgPSBtdGtfb3ZsX2lzX2FmYmNfc3VwcG9ydGVkLA0KPiA+ICB9Ow0KPiA+
IA0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfcG9zdG1h
c2sgPSB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRw
X2NvbXAuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5oDQo+
ID4gaW5kZXggMzk3MjBiMjdmNGU5ZS4uNzI4OWIzZGNmMjJmMiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmgNCj4gPiBAQCAtODMsNiArODMsNyBAQCBz
dHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIHsNCj4gPiAgICAgICAgIHUzMiAoKmdldF9ibGVuZF9t
b2Rlcykoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiAgICAgICAgIGNvbnN0IHUzMiAqKCpnZXRf
Zm9ybWF0cykoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiAgICAgICAgIHNpemVfdCAoKmdldF9u
dW1fZm9ybWF0cykoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiArICAgICAgIGJvb2wgKCppc19h
ZmJjX3N1cHBvcnRlZCkoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiAgICAgICAgIHZvaWQgKCpj
b25uZWN0KShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1tc3lzX2RldiwNCj4g
PiB1bnNpZ25lZCBpbnQgbmV4dCk7DQo+ID4gICAgICAgICB2b2lkICgqZGlzY29ubmVjdCkoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlDQo+ID4gKm1tc3lzX2RldiwgdW5zaWduZWQg
aW50IG5leHQpOw0KPiA+ICAgICAgICAgdm9pZCAoKmFkZCkoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgbXRrX211dGV4ICptdXRleCk7DQo+ID4gQEAgLTI5NCw2ICsyOTUsMTQgQEAgc2l6ZV90
IG10a19kZHBfY29tcF9nZXRfbnVtX2Zvcm1hdHMoc3RydWN0DQo+ID4gbXRrX2RkcF9jb21wICpj
b21wKQ0KPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiANCj4gPiArc3RhdGljIGlu
bGluZSBib29sIG10a19kZHBfY29tcF9pc19hZmJjX3N1cHBvcnRlZChzdHJ1Y3QNCj4gPiBtdGtf
ZGRwX2NvbXAgKmNvbXApDQo+ID4gK3sNCj4gPiArICAgICAgIGlmIChjb21wLT5mdW5jcyAmJiBj
b21wLT5mdW5jcy0+aXNfYWZiY19zdXBwb3J0ZWQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBjb21wLT5mdW5jcy0+aXNfYWZiY19zdXBwb3J0ZWQoY29tcC0+ZGV2KTsNCj4gPiArDQo+ID4g
KyAgICAgICByZXR1cm4gZmFsc2U7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbmxpbmUg
Ym9vbCBtdGtfZGRwX2NvbXBfYWRkKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsDQo+ID4gc3Ry
dWN0IG10a19tdXRleCAqbXV0ZXgpDQo+ID4gIHsNCj4gPiAgICAgICAgIGlmIChjb21wLT5mdW5j
cyAmJiBjb21wLT5mdW5jcy0+YWRkKSB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX2Rydi5oDQo+ID4gaW5kZXggMDQyMTdhMzY5MzljZC4uNjc5ZDQxM2JmMTBiZSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgNCj4gPiBA
QCAtMTA2LDYgKzEwNiw3IEBAIHZvaWQgbXRrX292bF9kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZGV2
aWNlICpkZXYpOw0KPiA+ICB1MzIgbXRrX292bF9nZXRfYmxlbmRfbW9kZXMoc3RydWN0IGRldmlj
ZSAqZGV2KTsNCj4gPiAgY29uc3QgdTMyICptdGtfb3ZsX2dldF9mb3JtYXRzKHN0cnVjdCBkZXZp
Y2UgKmRldik7DQo+ID4gIHNpemVfdCBtdGtfb3ZsX2dldF9udW1fZm9ybWF0cyhzdHJ1Y3QgZGV2
aWNlICpkZXYpOw0KPiA+ICtib29sIG10a19vdmxfaXNfYWZiY19zdXBwb3J0ZWQoc3RydWN0IGRl
dmljZSAqZGV2KTsNCj4gPiANCj4gPiAgdm9pZCBtdGtfb3ZsX2FkYXB0b3JfYWRkX2NvbXAoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXRrX211dGV4DQo+ID4gKm11dGV4KTsNCj4gPiAgdm9p
ZCBtdGtfb3ZsX2FkYXB0b3JfcmVtb3ZlX2NvbXAoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QN
Cj4gPiBtdGtfbXV0ZXggKm11dGV4KTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMNCj4gPiBpbmRleCBkMDU4MWM0ZTNjOTk5Li5lMDIzNjM1M2Q0OTk3IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+IEBA
IC0yMzYsNiArMjM2LDEzIEBAIHNpemVfdCBtdGtfb3ZsX2dldF9udW1fZm9ybWF0cyhzdHJ1Y3Qg
ZGV2aWNlDQo+ID4gKmRldikNCj4gPiAgICAgICAgIHJldHVybiBvdmwtPmRhdGEtPm51bV9mb3Jt
YXRzOw0KPiA+ICB9DQo+ID4gDQo+ID4gK2Jvb2wgbXRrX292bF9pc19hZmJjX3N1cHBvcnRlZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVjdCBtdGtfZGlzcF9v
dmwgKm92bCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVy
biBvdmwtPmRhdGEtPnN1cHBvcnRzX2FmYmM7DQo+ID4gK30NCj4gPiArDQo+ID4gIGludCBtdGtf
b3ZsX2Nsa19lbmFibGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICB7DQo+ID4gICAgICAgICBz
dHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gPiBpbmRleCA2NTUxMDZiYmI3NmQz
Li5lMDhiNzcxYmMyNWU5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfcGxhbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxh
bmUuYw0KPiA+IEBAIC0zMjEsNyArMzIxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxh
bmVfaGVscGVyX2Z1bmNzDQo+ID4gbXRrX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsNCj4gPiAgaW50
IG10a19wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLA0KPiA+ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBvc3NpYmxlX2Ny
dGNzLCBlbnVtIGRybV9wbGFuZV90eXBlDQo+ID4gdHlwZSwNCj4gPiAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHN1cHBvcnRlZF9yb3RhdGlvbnMsIGNvbnN0IHUzMg0KPiA+IGJsZW5k
X21vZGVzLA0KPiA+IC0gICAgICAgICAgICAgICAgICBjb25zdCB1MzIgKmZvcm1hdHMsIHNpemVf
dCBudW1fZm9ybWF0cywgdW5zaWduZWQNCj4gPiBpbnQgcGxhbmVfaWR4KQ0KPiA+ICsgICAgICAg
ICAgICAgICAgICBjb25zdCB1MzIgKmZvcm1hdHMsIHNpemVfdCBudW1fZm9ybWF0cywNCj4gPiAr
ICAgICAgICAgICAgICAgICAgYm9vbCBzdXBwb3J0c19hZmJjLCB1bnNpZ25lZCBpbnQgcGxhbmVf
aWR4KQ0KPiA+ICB7DQo+ID4gICAgICAgICBpbnQgZXJyOw0KPiA+IA0KPiA+IEBAIC0zMzIsNyAr
MzMzLDkgQEAgaW50IG10a19wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dA0KPiA+IGRybV9wbGFuZSAqcGxhbmUsDQo+ID4gDQo+ID4gICAgICAgICBlcnIgPSBkcm1fdW5p
dmVyc2FsX3BsYW5lX2luaXQoZGV2LCBwbGFuZSwgcG9zc2libGVfY3J0Y3MsDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm10a19wbGFuZV9mdW5jcywgZm9ybWF0
cywNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBudW1fZm9ybWF0
cywgbW9kaWZpZXJzLCB0eXBlLA0KPiA+IE5VTEwpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG51bV9mb3JtYXRzLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN1cHBvcnRzX2FmYmMgPyBtb2RpZmllcnMgOg0KPiA+IE5VTEws
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSwgTlVMTCk7
DQo+ID4gICAgICAgICBpZiAoZXJyKSB7DQo+ID4gICAgICAgICAgICAgICAgIERSTV9FUlJPUigi
ZmFpbGVkIHRvIGluaXRpYWxpemUgcGxhbmVcbiIpOw0KPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gZXJyOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3Bs
YW5lLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaA0KPiA+IGlu
ZGV4IDNiMTNiODk5ODljN2UuLjk1YzVmYTUyOTVkOGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19wbGFuZS5oDQo+ID4gQEAgLTQ5LDUgKzQ5LDYgQEAgdG9fbXRrX3BsYW5l
X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlKQ0KPiA+ICBpbnQgbXRrX3BsYW5l
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+
ID4gICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcG9zc2libGVfY3J0Y3MsIGVudW0g
ZHJtX3BsYW5lX3R5cGUNCj4gPiB0eXBlLA0KPiA+ICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgc3VwcG9ydGVkX3JvdGF0aW9ucywgY29uc3QgdTMyDQo+ID4gYmxlbmRfbW9kZXMsDQo+
ID4gLSAgICAgICAgICAgICAgICAgIGNvbnN0IHUzMiAqZm9ybWF0cywgc2l6ZV90IG51bV9mb3Jt
YXRzLCB1bnNpZ25lZA0KPiA+IGludCBwbGFuZV9pZHgpOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICBjb25zdCB1MzIgKmZvcm1hdHMsIHNpemVfdCBudW1fZm9ybWF0cywNCj4gPiArICAgICAgICAg
ICAgICAgICAgYm9vbCBzdXBwb3J0c19hZmJjLCB1bnNpZ25lZCBpbnQgcGxhbmVfaWR4KTsNCj4g
PiAgI2VuZGlmDQo+IA0KDQo=
