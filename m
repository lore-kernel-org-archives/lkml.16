Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6AC17A2E0;
	Fri, 28 Mar 2025 02:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130636; cv=fail; b=pyoA70CPAYltPpHGQP1WKZE98OEdf7lWC4OZWCG4JXXgk6chCiLjAX58P5pOhpWmf0RaWzsOtDtlT2O13juQPRBHxtziwOTfTfLOfu7/xAoBCRBEx3iD9F+Vw6dFIJTT5CtlPR6VSC8ovR0Gi06anNYhngWHjbLhIvBxTAAcezw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130636; c=relaxed/simple;
	bh=5MsRlrkvBCIzfEaSY4XXcdS3PL7PtvQnIjuL999TaSw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C1IVSXB3xquqQG41q0zlpwhpXXQ9dStCf1aIsPw1Du+MhJyw6nrYSxLp3Hi3JPOVuSDqUXH0yUSEAb6KtnA3MYbNN025fEOsAByGA5o6V2GEApZa2qE+2Yku01ZUrTTV+keWWYyhjHP0e/rffwTXV2ytGQUUzhxt7PzpKZO/Y1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lbKwghoi; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=h7lhVLGL; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lbKwghoi";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="h7lhVLGL"
X-UUID: 56d3742a0b8011f08eb9c36241bbb6fb-20250328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5MsRlrkvBCIzfEaSY4XXcdS3PL7PtvQnIjuL999TaSw=;
	b=lbKwghoilvdIzCjdai6sjWD3BL+8CnqoIG6+YBfNrGDlr3RUi5avBOsR9a7yakeR0wAqoGWPkScvttFF/XoU11J71gKYxidXobsImoXqL1FDZUPDa5jtyhDLvRxSLPLi+nGeZDauPMq2/N2eHhZJDepVmgzZm/A2Pj6nEM9ZWNo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:403ab2a3-a3c2-41a9-8229-8653ca2b377e,IP:0,UR
	L:0,TC:0,Content:11,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:11
X-CID-META: VersionHash:0ef645f,CLOUDID:1a87ed8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:4|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 56d3742a0b8011f08eb9c36241bbb6fb-20250328
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1389222371; Fri, 28 Mar 2025 10:57:08 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 10:57:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 10:57:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b30uCLzNBDj6w1vZfoUXiFbHqHEnOxWJxw92uSTMMupKPJwB5i5CTE+dSdnWPaWySE53PPB9ai5jU4fOXt3gJf/FFc1209qdf7bIDio+seOBKIzLNxjkrddHp5I1iY+HLX+jBqkKM2QkMidsJNKj8J0o2jwvDXsmQ6dJoHndBwzCLOuNNUGSFX5SKwxMTbCKPnWzOT+y+mKkAQf5HtRG9dU2c9D5O+C2w4zkcS/aNQMucs8joqOqCT1tYbUkuDLcqGbiXA8zvhBdGD3kgQhtKxMlbYgOSoFTpn9bw8129NTxNvGhIIG4WQLAJ6s1zSUWjTATRq7Oc7ruBUJ8Kwdltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MsRlrkvBCIzfEaSY4XXcdS3PL7PtvQnIjuL999TaSw=;
 b=QDtCz14Fzuuy+48+o4C4Pk/nfYRmGL2XrBxBItSJRwiY4388ZILOuarvlLVQy0k7socokF8qfeybk1tCs9cqXZD5UsmyxhQlaWgXpqSKy0g+lXV1RJkuAU+9fvm0lfPL29vSuMqKi8GLKPgiwHb7Hq4uKpba+KyTyTEuQ82moM/OU9DPr2w0pLLhPIMd18xmq9GCVksLmapL7R63Lgr15gB6TXN3r/vxl0vYq3FbnjebK03Yhkj/FOYKQ/4VjfFmkuiE7tly62k6F55PYkJ3ySUQH/RiwdauhqBWgqN882CfKwJSE3WS63ZuebQX02QhIspXEEKF8ae7ug5Fcsh7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MsRlrkvBCIzfEaSY4XXcdS3PL7PtvQnIjuL999TaSw=;
 b=h7lhVLGLX63gB1FOZOMNN9NIHcsNM48epZZFCb0kMM5Q+TXAAmS1xbErZhXE1Oc7c4HvAa+xK+HrBr145hXTPfHFoJfI3NRbJinbw6RIZwtbzUKbgMZkNAvNjDMhLg/5JUOxtSfLWcqiyxLhfiv5okX2N7CdIiyuGQdAJwLdhYk=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 KU2PPF4EAC9DDBE.apcprd03.prod.outlook.com (2603:1096:d18::411) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.27; Fri, 28 Mar 2025 02:57:04 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:57:04 +0000
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
Subject: Re: [PATCH v2 12/15] drm/mediatek: add OUTPROC support for MT8196
Thread-Topic: [PATCH v2 12/15] drm/mediatek: add OUTPROC support for MT8196
Thread-Index: AQHbmkTAE/z9NlxMDk60kIlnEPyriLOCAbaAgAXj6QA=
Date: Fri, 28 Mar 2025 02:57:03 +0000
Message-ID: <4ab14a55f4ffb36731de65081f0ae618ed6a14a3.camel@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
	 <20250321093435.94835-13-paul-pl.chen@mediatek.com>
	 <297be0e3f2b5b9cb4d051cfae6e5f5868c3cb7b8.camel@mediatek.com>
In-Reply-To: <297be0e3f2b5b9cb4d051cfae6e5f5868c3cb7b8.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|KU2PPF4EAC9DDBE:EE_
x-ms-office365-filtering-correlation-id: 5fd06c29-5d05-4f90-3e6a-08dd6da4382a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVpoVUcxc3dza0NnWWN0bCtZUmo1MWxHQ21kV0pQTjNDcVc1b2JpWWNZalMx?=
 =?utf-8?B?a0t6R1lUQWVrY1NRdVRBcDZSY0szdFRFQkR3S3dTRHc3K0Vib21DMHdZa3Jm?=
 =?utf-8?B?UTYxVVlGRFpLSFdOUlpRNFBxTmt0SXQySVhqMmp4Tm5vTUxvQ2tpaytJQkE0?=
 =?utf-8?B?ZVFLTlFWb2dSSVNBZk1iNmg4K3hGcU5YNDRFbnZpaXZyREY5eDgxbGxqR1Aw?=
 =?utf-8?B?ZTdETXlpRGgwK2MzMnZvcHpZbkFyWXlqYUNxZU9OQmtUQ1VQb04wOEJhb1dy?=
 =?utf-8?B?eXk2L0NvQWNTSFdRMmhsVDg1ZXFzZmFrS3RuNzFIY21LSHp5RHBIOUNOYjkr?=
 =?utf-8?B?dVFFUDNBVFVCaVlzNkFlMTVDcEZGRngvRktndVFDUXFQVWpUSU5oT2Vuem9S?=
 =?utf-8?B?Q04wZ05IN3AxMUdqMW8zYnAxay95VlpNVU9ud09MZ21LRklNTG9TRzM2M0RL?=
 =?utf-8?B?ZWpZZWhKSnRGTTU4clNwVE56ZFlON1ViWXNjR1ZXMk0zUXdVWDRESHVUcFlD?=
 =?utf-8?B?S0J0S2ZrYlpqcTlzd1dzWForOFlqQmV1QlNJYWZaTDduMUFWRjMzYnhQY1Qz?=
 =?utf-8?B?Rjl5YU9BMTlVWnBYMU5ESkRaK1JGdmkrbm52NHRzeCtoSWZLMkp6VnpMbG5i?=
 =?utf-8?B?eHBZQUdNalFxdm81Ti83SVJYL2w4VWxhS1R6a1pPSmdmWFkraFJxaFMxRWpw?=
 =?utf-8?B?eEJwNjRaS2lxSEFSSUN1UThhRTRYc09hZ09NcXNyczJEQ0xUSmxYVXBBY3VX?=
 =?utf-8?B?NjdxNFo4a2paSW1Qd2EzTzhuNjNmV25jQjRwZ29XOW5FR2pFTHJIVDRqVm4w?=
 =?utf-8?B?WDd0SUNqUytVQUVhMGt2aXlyWHdCNldZWWpQbkh2UnVkMmN2ckxaa3U2Tzcy?=
 =?utf-8?B?ZjljdXE5N0lPakZBRmNxbG9TdmFDM0JWLzVubmdPUHh3am96OXVPZGpQUlVp?=
 =?utf-8?B?M0FyVllYRk81TEZuZ01maFFVYjhIakJqZUhwanlLWGlsYysxMkZydmxzd3FT?=
 =?utf-8?B?QlFJSGIxbG9Rb21IT0RQaUVQR3BBL0NvRk1FcGZwbGdNaHpZa1FDT054YXQ1?=
 =?utf-8?B?bllya1NwaERlYW9yQStuNFZVblJRN0R0RVI3MmdiTTJTSnlDSlRNQkw4eGx4?=
 =?utf-8?B?TVlFcVRzQUJrWjJqVDhQK0VZRmNTMW9tb2NPQ0NCMWRxdjM2ZmdaV0dOT0Q5?=
 =?utf-8?B?RC92amQ2SUNpdW9UZzMyeDBoWmI5T2pwcUpXejJqdURMWVgwMld2N1RtWnRX?=
 =?utf-8?B?aW9jUkQ4dkorclZXaG9hZ0hXbURSWnlmWDVuU0NKMWFrWFYzZVFMNjdxR3da?=
 =?utf-8?B?OXVMZE9XSkRIMER3WkFieG1OSUJJYUdiS2VjWlRNQ25Tb0VQb2RhYWtkU3pE?=
 =?utf-8?B?Wi90Qm92MVNZOFE3dG9WWmFNWThSbzlUZUZObzNxbHVNY2VPd2NHZWw3WU5l?=
 =?utf-8?B?M3JKSWZtcjRrRTNVRlVudDRlNkV3dFhjZ1lSU2FqdFV3T3R3SVp2QkQ5czd2?=
 =?utf-8?B?WnBVRndySzUxS1dYUDkzL3NYRTRhdnRyQUhOSWRxRjV5M0RXcCtDNWZyaWgw?=
 =?utf-8?B?T0V6a2MvQmtvNzVPYkNzVlNuZEgvRmRiTnNHd1o5ZjMyY2NwVjhoeVFoeVpY?=
 =?utf-8?B?QWNHL2hvcTZsZEtjWFV6NGI3emV4Z0ptMGVNeFhSTitlQkozcXFBbWJpWTBl?=
 =?utf-8?B?bHRMVFIrS0U3WHhDVnZJUW5sUnR5THZKUjRSTVhaTWNONFFBakhWRnhEcllV?=
 =?utf-8?B?SGNMcy9EWFFZaEh1Y1V2Snp6cDVtV25ZSFVra21KT24rR1V2VUlSeCsxWTBt?=
 =?utf-8?B?Mys3NitVMWkwVXF0MHc0cWI0NkQ0TytuaUpjbHZJVitObnpQZTdXWElaNndy?=
 =?utf-8?B?eDZCbW8rY1N0WFZNWWpjOWVCTGY2Y21IcFpoYm0xbzJkVHRFVGsra1hnQk40?=
 =?utf-8?B?VHV3TjlyaWVDbkpPQzRaMmUrUjU1eCtWOEU1STMrN0w3TThDTnhXRHVnSVhG?=
 =?utf-8?B?cnV4dlRtVTVRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cURvOUVxVzM5UTF4cllzZ2dkV3NxdWszYkF6ZHBkUXBoeVlrK1RFVkc4cE56?=
 =?utf-8?B?MWZ4SkRwN2IvclJpamcyQTFtMjlyQ1Q4bVFIZTgrU1NSZTZSL0c0YXRCRXVi?=
 =?utf-8?B?QVIycXhCLzQ4ZUp6dVZUZ3BOVE1wbDN0NXZhUXV0UlE2bE5DQzNoVTRBQ0NU?=
 =?utf-8?B?Sk5ZR3BOcEw0dW9HR2J4Q1dNenVnNHY5UmRubmtBNk1Ua3B1UTBOYlo1bS9a?=
 =?utf-8?B?QVBjRlRtWncyMG5UUTJES0dzMWVDY2didkp2YVJHbzZqZUVSZiszUHM2Qi9X?=
 =?utf-8?B?enptTDR4OEJyT0VDM1JDTm9PTFBGbm9LWWZCd05xUGt3aEFaamR1V0Z6WEdt?=
 =?utf-8?B?N0tDczQ5TkhWaWt2UjYxKy9HWDZ1d2hPTEsvMFQzSVRFVFhidVFvVXVkc1pM?=
 =?utf-8?B?K2ZqdmRvYktTcTRFVDYyZS92MUVOZkJBang1d3ljUHVZVnVyZ0QzTnpBcTJJ?=
 =?utf-8?B?bnROdVc5SWkvVjlsYWhKSmpTSnA0RlRGcmx4RkhObi9pRW1KTzVyK0tOcTBV?=
 =?utf-8?B?L0Fpa0Q4Yk1CbHNjS1oxMjZzaXprZFVHTEI5RU1sdzhjYndPcjVUMjRCQ1A5?=
 =?utf-8?B?UWlhZWNhRlZyTFhxUExyQXRDUzVSOUFFdnRvWW92SjFQcExJQUhiSFVGditl?=
 =?utf-8?B?bUduamMyZk9PUVNYWmZKeURrNEFqR0xSTmJnQVcrVGtsdGRqQWdqNWFPU0NV?=
 =?utf-8?B?bU14VVN4dGFZOEhKL2QzbGR0c293RlJBSEhZLy9TNVg1ZURXUDhlb3Znam54?=
 =?utf-8?B?TnZlWDRGaEh3U3NnZFJXU1FzRTZWY2hiSTVYd0RXK3MvQUVNOWhSQ21WMWdp?=
 =?utf-8?B?MEw2VzVjcmZ6ZVZHUEErNSs4RVhCNnExdVp5a3lxVGFtTjVZVTdxdmJkRGNt?=
 =?utf-8?B?aGJvbklDeGgrM0lGWnJvcDR2UXVVNUYra05wZ1VBbkFWY1Ryc0pHaGFPajZp?=
 =?utf-8?B?V3FOVmlzRGFmV1lwMitlZnlpV093ZTU2UEsxdVMzckJ1cUtBWDBMaFI5TVNI?=
 =?utf-8?B?UWxvRW1tLzBSSTNlUWdkMjQ1MTVWQTJjRGhrVlFZajdYTDNEQWJxV05PK2Fk?=
 =?utf-8?B?Y1pjWFYvdkhzZHFvL21NMm1aS2xrdWpvNVdjTEY2dHhNbzg2MG9sL0k3OHZn?=
 =?utf-8?B?ZXNha3RmdFJ6TUxobys4WDg2RmJKazRUOHBkL1p0c0NFNGhhdlIrUjZ5RkNi?=
 =?utf-8?B?ditjY2FnRnBFWnBIM0RRdEFNT0VlZFBMSlg3OVhQY1RPdWgzdGxoLys3bkVL?=
 =?utf-8?B?NFpZc20yWkFpbUNwZC9YZkFUT2QwWStuQ1kxRjBBTEplTXpncC8zVVIwQlRO?=
 =?utf-8?B?aWVBMG1SQWFoZ2o5MnhMT0M0S0cwbHJrV2I4cjNxZjdIWVB4ZCtzbHk0SUc2?=
 =?utf-8?B?OXRubUhNNUFnc0R2SFhUbkFadTVuSmFHNzErNENaQkdzOExKRmxrL3RzV3My?=
 =?utf-8?B?RWJxbWo5ZzdHUzRteTFMQWhOTkdTYVgxYzM1ZWovMGEvSFJLcDdocURSb1Yx?=
 =?utf-8?B?ZUlXYTUyZWdQd2ptd1Zjdm1BYUpNRTVzRlg4TGkweDU3Z1pzZ250YnhRM2NS?=
 =?utf-8?B?cDNiTHFYemV3RXRacXZBOEtVb1BuYWFHRVI3Zkk1YUYyTzVNb05IeFByQ3Fz?=
 =?utf-8?B?VEgraDFUcnBzM01aS0ltd0ZtYnJTc1J2Q2xJbGZDWjF4NlNha0YxSU11bXUr?=
 =?utf-8?B?WlVZWS9mdVdSZnF2NTd2YndQVTVlam8zZG5PRnU2aDVyblpjd2s3RnFZRG1H?=
 =?utf-8?B?amY2ZVp2SmdORmNvRmFIODBSQzZMUEpPa1hWR2M2NHljUmZQNHMwODdTZC94?=
 =?utf-8?B?UHJCMEZuM1hURklLcUlvWjhGMjA0aXFTWEF1ZkZDTTRVZ0JaVDcvOFdlWmF6?=
 =?utf-8?B?eHhvYlVCbmZUaHZWUENRdEZFbWV2NTFFd2phTjg5aVFUSEp4UlVMcnJDR3hh?=
 =?utf-8?B?eXJwYVJHUzNHR3VDYlAwN3RnbVNpbE1QZW5rYUx0eXZxWjJ6aVZzd1ZKVi81?=
 =?utf-8?B?MGxtYzRYc0QzdmlKTWxDMEpZSlozeWFYZ1hWRGhVdHZOWlo3Y0FhRGNXb3BB?=
 =?utf-8?B?b0Z4dmZ5c2JjTElSeGRWNmdVQlU1UG9qOW82SUx3MGV0ZjMrTzRQZ0ZLUHhH?=
 =?utf-8?B?VnB4TE8yS2NFeDk2WGNiT0VPUC9rSUcvakp0dHNVVW1QNVhpR1YxOGlhZXBT?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDA615457563E24FA64C69EA40476E9D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd06c29-5d05-4f90-3e6a-08dd6da4382a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 02:57:04.0322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlSJDf12sQiiqFZZ3PPgtMUycYh6cD+I8o1XLbONVeBKgXpgo8X88jXK4OtPUUNtx3G/WMIPfqoA+copi+PXq8m8/y/12C3WjRAoat1XDCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF4EAC9DDBE

T24gTW9uLCAyMDI1LTAzLTI0IGF0IDA5OjAwICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gRnJpLCAyMDI1LTAzLTIxIGF0IDE3OjMzICswODAwLCBwYXVsLXBsLmNoZW4gd3Jv
dGU6DQo+ID4gRnJvbTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0K
PiA+IE9VVFBST0MgaGFuZGxlcyB0aGUgcG9zdC1zdGFnZSBvZiBwaXhlbCBwcm9jZXNzaW5nIGlu
DQo+ID4gdGhlIG92ZXJsYXBwaW5nIHByb2NlZHVyZS5PVVRQUk9DIG1hbmFnZXMgcGl4ZWxzIGZv
cg0KPiA+IGdhbW1hIGNvcnJlY3Rpb24gYW5kIGVuc3VyZXMgdGhhdCBwaXhlbCB2YWx1ZXMgYXJl
DQo+ID4gd2l0aGluIHRoZSBjb3JyZWN0IHJhbmdlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsLXBsIENoZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+IA0KPiBb
c25pcF0NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdXRwcm9jLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dXRwcm9jLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uYTdjNmQxOTgyYmNhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdXRwcm9jLmMNCj4gPiBAQCAtMCwwICsxLDI0MiBAQA0K
PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKy8qDQo+
ID4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBNZWRpYVRlayBJbmMuDQo+ID4gKyAqLw0KPiA+ICsN
Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ID4gKyNpbmNsdWRlIDxkcm0vZHJt
X2ZyYW1lYnVmZmVyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L2NvbXBvbmVudC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRk
cmVzcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVr
L210ay1jbWRxLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
Lmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gPiArI2luY2x1ZGUgIm10
a19kZHBfY29tcC5oIg0KPiA+ICsjaW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4gDQo+IEFscGhh
YmV0aWMgb3JkZXIuDQo+IA0KPiBPSywgSSB3aWxsIGZpeCB0aGUgQWxwaGFiZXRpYyBvcmRlci4N
Cj4gDQo+ID4gKyNpbmNsdWRlICJtdGtfZGlzcF9vdXRwcm9jLmgiDQo+ID4gKw0KPiA+ICsjZGVm
aW5lDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfSU5URU4JCQkJMHgwMDQNCj4gPiArI2RlZmlu
ZQ0KPiA+IE9WTF9PVVRQUk9DX0ZNRV9DUExfSU5URU4JCQkJCUJJVCgxKQ0KPiA+ICsjZGVmaW5l
DQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfSU5UU1RBCQkJCTB4MDA4DQo+ID4gKyNkZWZpbmUN
Cj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19EQVRBUEFUSF9DT04JCQkweDAxMA0KPiA+ICsjZGVm
aW5lDQo+ID4gT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OX09VVFBVVF9DTEFNUAkJCQlCSVQoMjYp
DQo+ID4gKw0KPiA+ICsjZGVmaW5lDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfRU4JCQkJCTB4
MDIwDQo+ID4gKyNkZWZpbmUNCj4gPiBPVkxfT1VUUFJPQ19PVkxfRU4JCQkJCQlCSVQoMCkNCj4g
PiArI2RlZmluZQ0KPiA+IERJU1BfUkVHX09WTF9PVVRQUk9DX1JTVAkJCQkweDAyNA0KPiA+ICsj
ZGVmaW5lDQo+ID4gT1ZMX09VVFBST0NfUlNUCQkJCQkJCUJJVCgwKQ0KPiA+ICsjZGVmaW5lDQo+
ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfU0hBRE9XX0NUUkwJCQkweDAyOA0KPiA+ICsjZGVmaW5l
DQo+ID4gT1ZMX09VVFBST0NfQllQQVNTX1NIQURPVwkJCQkJQklUKDIpDQo+ID4gKyNkZWZpbmUN
Cj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19ST0lfU0laRQkJCQkweDAzMA0KPiA+ICsNCj4gPiAr
c3RydWN0IG10a19kaXNwX291dHByb2Mgew0KPiA+ICsJdm9pZCBfX2lvbWVtCQkqcmVnczsNCj4g
PiArCXN0cnVjdCBjbGsJCSpjbGs7DQo+ID4gKwl2b2lkCQkJKCp2YmxhbmtfY2IpKHZvaWQgKmRh
dGEpOw0KPiA+ICsJdm9pZAkJCSp2YmxhbmtfY2JfZGF0YTsNCj4gPiArCWludAkJCWlycTsNCj4g
PiArCXN0cnVjdCBjbWRxX2NsaWVudF9yZWcJY21kcV9yZWc7DQo+ID4gK307DQo+ID4gKw0KPiA+
ICt2b2lkIG10a19kaXNwX291dHByb2NfcmVnaXN0ZXJfdmJsYW5rX2NiKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gPiArCQkJCQkgdm9pZCAoKnZibGFua19jYikodm9pZA0KPiA+ICopLA0KPiA+ICsJ
CQkJCSB2b2lkICp2YmxhbmtfY2JfZGF0YSkNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19kaXNw
X291dHByb2MgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKwlwcml2
LT52YmxhbmtfY2IgPSB2YmxhbmtfY2I7DQo+ID4gKwlwcml2LT52YmxhbmtfY2JfZGF0YSA9IHZi
bGFua19jYl9kYXRhOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIG10a19kaXNwX291dHByb2Nf
dW5yZWdpc3Rlcl92YmxhbmtfY2Ioc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+ID4gKwlz
dHJ1Y3QgbXRrX2Rpc3Bfb3V0cHJvYyAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+
ICsNCj4gPiArCXByaXYtPnZibGFua19jYiA9IE5VTEw7DQo+ID4gKwlwcml2LT52YmxhbmtfY2Jf
ZGF0YSA9IE5VTEw7DQo+ID4gK30NCj4gPiArDQo+ID4gK3ZvaWQgbXRrX2Rpc3Bfb3V0cHJvY19l
bmFibGVfdmJsYW5rKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiA+ICsJc3RydWN0IG10
a19kaXNwX291dHByb2MgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4g
Kwl3cml0ZWwoT1ZMX09VVFBST0NfRk1FX0NQTF9JTlRFTiwgcHJpdi0+cmVncyArDQo+ID4gRElT
UF9SRUdfT1ZMX09VVFBST0NfSU5URU4pOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIG10a19k
aXNwX291dHByb2NfZGlzYWJsZV92Ymxhbmsoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+
ID4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3V0cHJvYyAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPiA+ICsNCj4gPiArCXdyaXRlbCgweDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19PVkxfT1VU
UFJPQ19JTlRFTik7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBtdGtf
ZGlzcF9vdXRwcm9jX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQNCj4gPiAqZGV2X2lkKQ0KPiA+
ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3V0cHJvYyAqcHJpdiA9IGRldl9pZDsNCj4gPiAr
CXUzMiB2YWw7DQo+ID4gKw0KPiA+ICsJdmFsID0gcmVhZGwocHJpdi0+cmVncyArIERJU1BfUkVH
X09WTF9PVVRQUk9DX0lOVFNUQSk7DQo+ID4gKwlpZiAoIXZhbCkNCj4gPiArCQlyZXR1cm4gSVJR
X05PTkU7DQo+ID4gKw0KPiA+ICsJd3JpdGVsKDB4MCwgcHJpdi0+cmVncyArIERJU1BfUkVHX09W
TF9PVVRQUk9DX0lOVFNUQSk7DQo+ID4gKw0KPiA+ICsJaWYgKHByaXYtPnZibGFua19jYikNCj4g
PiArCQlwcml2LT52YmxhbmtfY2IocHJpdi0+dmJsYW5rX2NiX2RhdGEpOw0KPiA+ICsNCj4gPiAr
CXJldHVybiBJUlFfSEFORExFRDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArdm9pZCBtdGtfZGlzcF9v
dXRwcm9jX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCB3LA0KPiA+ICsJ
CQnCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50DQo+ID4gdnJlZnJlc2gsDQo+
ID4gKwkJCcKgwqDCoMKgIHVuc2lnbmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3BrdA0KPiA+ICpj
bWRxX3BrdCkNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19kaXNwX291dHByb2MgKnByaXYgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKwlkZXZfZGJnKGRldiwgIiVzLXc6JWQs
IGg6JWRcbiIsIF9fZnVuY19fLCB3LCBoKTsNCj4gPiArDQo+ID4gKwkvL21vdmUgbXRrX2RkcF93
cml0ZV9tYXNrIHRvIG10a19kZHBfd3JpdGUNCj4gDQo+IEkgdGhpbmsgdGhpcyBjb21tZW50IGlz
IHJlZHVuZGFudC4NCg0KU3VyZSwgdGhpcyByZWR1bmRhbnQgY29tbWVudCB3aWxsIGJlIHJlbW92
ZWQgYXQgdGhlIG5leHQgdmVyc2lvbi4NCj4gDQo+ID4gKwltdGtfZGRwX3dyaXRlKGNtZHFfcGt0
LCBoIDw8IDE2IHwgdywgJnByaXYtPmNtZHFfcmVnLA0KPiA+IHByaXYtPnJlZ3MsDQo+ID4gKwkJ
wqDCoMKgwqDCoCBESVNQX1JFR19PVkxfT1VUUFJPQ19ST0lfU0laRSk7DQo+ID4gKwltdGtfZGRw
X3dyaXRlX21hc2soY21kcV9wa3QsDQo+ID4gT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OX09VVFBV
VF9DTEFNUCwNCj4gPiArCQkJwqDCoCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsDQo+ID4g
KwkJCcKgwqAgRElTUF9SRUdfT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OLA0KPiA+ICsJCQnCoMKg
IE9WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVApOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICt2b2lkIG10a19kaXNwX291dHByb2Nfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+
ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3V0cHJvYyAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOw0KPiA+ICsJdW5zaWduZWQgaW50IHRtcDsNCj4gPiArDQo+ID4gKwl0bXAgPSByZWFk
bChwcml2LT5yZWdzICsNCj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19TSEFET1dfQ1RSTCk7DQo+
ID4gKwl0bXAgPSB0bXAgfCBPVkxfT1VUUFJPQ19CWVBBU1NfU0hBRE9XOw0KPiA+ICsJd3JpdGVs
KHRtcCwgcHJpdi0+cmVncyArDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfU0hBRE9XX0NUUkwp
Ow0KPiA+ICsNCj4gPiArCW10a19kZHBfd3JpdGUoTlVMTCwgMCwgJnByaXYtPmNtZHFfcmVnLCBw
cml2LT5yZWdzLA0KPiA+ICsJCcKgwqDCoMKgwqAgRElTUF9SRUdfT1ZMX09VVFBST0NfSU5UU1RB
KTsNCj4gPiArCW10a19kZHBfd3JpdGVfbWFzayhOVUxMLCBPVkxfT1VUUFJPQ19PVkxfRU4sICZw
cml2LQ0KPiA+ID5jbWRxX3JlZywgcHJpdi0+cmVncywNCj4gPiArCQkJwqDCoCBESVNQX1JFR19P
VkxfT1VUUFJPQ19FTiwNCj4gPiBPVkxfT1VUUFJPQ19PVkxfRU4pOw0KPiANCj4gVXNlIHJlYWRs
KCkgYW5kIHdyaXRlbCgpLg0KPiANCj4gVW5kZXJzdG9vZCwgSSB3aWxsIHVzZSBgd3JpdGVsYCB0
byByZXBsYWNlIHRoZcKgJ210a19kZHBfd3JpdGUnLg0KDQo+ID4gK30NCj4gPiArDQo+ID4gK3Zv
aWQgbXRrX2Rpc3Bfb3V0cHJvY19zdG9wKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiA+
ICsJc3RydWN0IG10a19kaXNwX291dHByb2MgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4gPiArDQo+ID4gKwltdGtfZGRwX3dyaXRlX21hc2soTlVMTCwgMCwgJnByaXYtPmNtZHFfcmVn
LCBwcml2LT5yZWdzLA0KPiA+ICsJCQnCoMKgIERJU1BfUkVHX09WTF9PVVRQUk9DX0VOLA0KPiA+
IE9WTF9PVVRQUk9DX09WTF9FTik7DQo+ID4gKwltdGtfZGRwX3dyaXRlX21hc2soTlVMTCwgT1ZM
X09VVFBST0NfUlNULCAmcHJpdi0+Y21kcV9yZWcsDQo+ID4gcHJpdi0+cmVncywNCj4gPiArCQkJ
wqDCoCBESVNQX1JFR19PVkxfT1VUUFJPQ19SU1QsDQo+ID4gT1ZMX09VVFBST0NfUlNUKTsNCj4g
PiArCW10a19kZHBfd3JpdGVfbWFzayhOVUxMLCAwLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJl
Z3MsDQo+ID4gKwkJCcKgwqAgRElTUF9SRUdfT1ZMX09VVFBST0NfUlNULA0KPiA+IE9WTF9PVVRQ
Uk9DX1JTVCk7DQo+IA0KPiBVc2UgcmVhZGwoKSBhbmQgd3JpdGVsKCkuDQpVbmRlcnN0b29kLCBJ
IHdpbGwgdXNlIGB3cml0ZWxgIHRvIHJlcGxhY2UgdGhlICdtdGtfZGRwX3dyaXRlJy4NCj4gDQo+
ID4gK30NCj4gPiArDQo+ID4gKw0KPiANCj4gDQo+IA0KQmVzdCByZWdhcmRzLCANClBhdWwNCg==
