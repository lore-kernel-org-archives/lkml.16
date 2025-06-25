Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068791FE47B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836161; cv=fail; b=FhhUzkMwDG1GU7J/ZrrnLeXaMHM7W48h+23xVb1h+qsk53Roy28CkTOctN1Dk4gIUNEifZ8AI5nvaJ1P+ABUiok30wYyzCn0zibh2J6KrqQG4lDw0zOpvGKjMRAXIoYv/3la4yKf+HssHyWl7AjWyT1S8X3AzLzppdn151wfzRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836161; c=relaxed/simple;
	bh=7n4YlxoN1hNuFiOBHlaBPV0pigQPewyGx+MC7HN+ZxE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VnEBjJqur3sO/pQKHUibIDqXj8KAbEX7Ao2Bs3erkBPgNw5/FV6jl9mXFeFjsiIJaL2UhIMUbHRclRxHfUrkqo+u/UpA7s/Y6eoPQ4eyK0wufn7c09x1l7UOfQDv4mWe1QXZAWUAEC636ynz/gYQyt20rm8cA/WrETqL+E66c4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ed/nWrbA; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qwUIC3h0; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ed/nWrbA";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qwUIC3h0"
X-UUID: 2962eb5a519511f0b910cdf5d4d8066a-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7n4YlxoN1hNuFiOBHlaBPV0pigQPewyGx+MC7HN+ZxE=;
	b=Ed/nWrbAWb40mirhRAbnAVJe0XBwsGlX1zs6VjH3dyxMSRrEQbjUZVItr6+3hj/HYRGKaAQMA4iQep3h3n9kG/HJ1aDUhT431WVXQz0mnWpYKJLYStyu+Gj3udByQeydxDPRHoL99s3vGMqUKFe3whvpOQwrN46K3hsF6XFfFIA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:78502816-78db-4e33-b8a9-49654f46b77a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:68a28a14-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2962eb5a519511f0b910cdf5d4d8066a-20250625
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 266917610; Wed, 25 Jun 2025 15:22:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 15:22:31 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 15:22:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts8QAY9NKcFU0VjN0fvkswIYT8l8HkJNdDvSxVQnGH8ARvT5Ia+r/latj8Z6lgFg0xpaMxfWT68+dTSLCNMncPpqbES3KA5LqvNrpjQJPLxVAlwbKXpQrBU5yDnUR6SP73QiH13erW+Zx/knK3Sv+GwqUsBL9QL1ARJz6PGUcrTnURg1XqW9wQNOszDIXyfQlRpUu7yvkhhGb9k0efcxnVGj8N70BTDbXo+b6hT+HuDh9RToH5yMIgZc0G2/9qs12K2wH1EVluKPNVoli67NTq/BAccigo0K5V2y4KeDq7BRYkzCBq3ST9nVOtdIhvB3t/TjBtaMj2UpE7WyrsGcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n4YlxoN1hNuFiOBHlaBPV0pigQPewyGx+MC7HN+ZxE=;
 b=YYUahFb2PFbpxpLAMZEi7O67vgoc7/OOhFKFmUszBg/pPg33eF49DjzHixSplbURlyrAs7k4V1r26Z+GpKsNQ6IPw3DLhpnwb8QdpW+pw8Kc4r65wQ1MaxYYMBX8tPtp4WNkgAMtRLfQQMNpPUyCv9ldUTIeVD+TnMo2H/HfnZxsBtv9j+JTHnEaMqqgI2oIb17NB7Lu3Rs8VYEah9pPBHQa4ck/K2aGZHcHvnDJZYEB9CjEMNDLRHoxiaXKQ1gXv+1gW0j2ByrCXUP8De6Vdg14lVCOeTjEaggDX9URHGjjpNbNvjmupm2JbRbGsp6wwb+xIgSATSW7NoFiTc6ViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n4YlxoN1hNuFiOBHlaBPV0pigQPewyGx+MC7HN+ZxE=;
 b=qwUIC3h0phxth7A6aApeeEVfNz0vML8KQxOOxPDYR78flEuozDPruJkTQ6qgQzBQ6h6hJ8BBdno9VmPZLkzKQUByL5b5iOxB/0nMdLU28fI6lsnxERJjlEOlCm2ADdc3k9M1t3VCHpIIO3ybF5GgJiy4QTcrWQ5NJuCrikAlR/w=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6435.apcprd03.prod.outlook.com (2603:1096:101:3f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 07:22:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 07:22:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on
 MT8195/88
Thread-Topic: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on
 MT8195/88
Thread-Index: AQHb1uHqKVQVd8nI90y4eIJj2hJhgrQTlgsA
Date: Wed, 25 Jun 2025 07:22:29 +0000
Message-ID: <870d30cbb6a3f423a5440a59a63bccd2757b5e7b.camel@mediatek.com>
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6435:EE_
x-ms-office365-filtering-correlation-id: f49e8091-7809-4920-b0b7-08ddb3b90b2b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MVAzWUNtZ2hobG1xdzBON2V3TElUQk5tRWwyWk13ekpqWDRMY2dzUVpMeWhF?=
 =?utf-8?B?WHFLMWJCY1dNSUtqNm1MZzliN1Y4Y2d6Y0ZDTFlOdXNVZzBNUmV6Qi9HblFI?=
 =?utf-8?B?eFpLd0VkbjJwN3BPYXdKZGJCVDU2U3ZhaGF2UkpYMXdSOHhINEdnN2pCRlhi?=
 =?utf-8?B?YVNxQ2RxRlJaYlNOd296REZxNWsxU0VBckUzV0didUM2WXRwY1JxSHF0UnVL?=
 =?utf-8?B?Q2JrZ0FaM3JxVFp0N1A0VjFjbGo1Z1NHbTFoYzZkaW5UblR0UU1uQ0JVTit1?=
 =?utf-8?B?SmZHVEVYNWJPV3RCUVVNYi9pZWNBRlBVdzJoWkRWZ2ZlZDVETzBoVVNNbitW?=
 =?utf-8?B?NFhKUHZoVytDTnp0Q09aMC9vdXczM3E0aHRwdWh3QklnSHhYSWljV2pWR2pj?=
 =?utf-8?B?L0pXSnRSU1VEcThvU3ZsZHg2Q2o3Q0dwY1RRbkl6OG81blBSTFZhZ213a2xq?=
 =?utf-8?B?Z29SVlNuUWlEV2c0b25ZdEFWM0dsc3RxRGh1ckl4Nit6b05ZZGd6eStncFlm?=
 =?utf-8?B?SkdWQVUvaGhzS0NxRnhNQzFpejdwYjhodUhHalVYekVPMjlwRUQwZjFPREEz?=
 =?utf-8?B?bWZuOWs2WTFNTzdyVWJOaGlXc2RQZlZSWE5XTXNLYkV3cWFLYzN3cUprc2hz?=
 =?utf-8?B?aFUwbHFBNjBGd3M5cEdkb3ppQlQ3bGZ4VXNKTzhRUEpSYXh5QVkxTnNjYUFK?=
 =?utf-8?B?TkcrYmhNOXVkODZCWFJWNWlNNTNlZWk1cHBEMTQyeml6SklaTHo2ak53SnZV?=
 =?utf-8?B?UmlYV0RsNnNsVXluRjZ0dTErbUdyN09rUkdTbUduWmFmSTAwWnZJL1NSbmhZ?=
 =?utf-8?B?eFppbkpaa3RkUFRJdGwrR3oxMWNWVFE5aHl6VDFYd2RwNmd4ZVBJSDJYVjFp?=
 =?utf-8?B?clYvNXN4S2FDUjJid09NSTE4aVRGc2pQcm1QOTFRVmlRTFluZGpMa0NWMnRR?=
 =?utf-8?B?QzErVmJ6R0hTQTJ4OUtoVm5UTjRwYS93V0srQXA4eWpmMVQwbWhENE00c2tU?=
 =?utf-8?B?alh5d1NHaGJWQUs4b2pXUExqRzRZWVd2VVhDWk9YOFpGS1BQOU9pdmdaTjRQ?=
 =?utf-8?B?dldCeWltSUlkL3VGNTk2MTZyQmwwWXpBWnRhcVdvZ010c3pyMnUwOHQ4TkJz?=
 =?utf-8?B?YmxKanJyUEoxTTBBUktXVmt1SkJnOFgxTkw5UWZoY2lLcElxVVJQTkdHL2Qy?=
 =?utf-8?B?TTNzdjVOMVBuMUFDd2hYK1JaQVp1YTE3eVo0N3F6RUxhZzhCMG55bXhnOHl2?=
 =?utf-8?B?ci9wRW15SEtQQm5rVVlQK1RCY3Voa2tpb1NuVlVaeXQyTUVjVlRHR3hpRmQ4?=
 =?utf-8?B?OUR4c3pldjVHaEdLT0tmL2NESW1QRHcyNFB5bVRVTnZTRUdQMHNiSWRkNTBQ?=
 =?utf-8?B?TG5aVHZJSmVKaGFRdm1hTjNSbUxMME0vSERXM05iZkRhcEZxK0JENFNXd1B6?=
 =?utf-8?B?WWxkdmh4RGdRb1RTK2t2Z3JCeEU1SEFDNjRpbDJrT1hvaWRMYlJkcFJQMFdi?=
 =?utf-8?B?VEduUTVyK3NCc3Nsalh0UDEyUlhYdUpna2NRQmNKaXRSNGdVczFUY0s3K0NV?=
 =?utf-8?B?Y01EakcxZUg0L1FnMVJHT0hLSzdVb2wyWG9SMFZjKzRIWUk2anpralVWbnpE?=
 =?utf-8?B?c1hsSG9KTUVSZzE4RmZ0SVZ2aUpOMXZqZ1hFU0hOS2sranJkTnBIMkdCb3dj?=
 =?utf-8?B?WHltdjc3UGxyYm1ROEt0aTlOam5wRkFoeTZPbGE0VVVNc1E3Z1B6YmlSYlFJ?=
 =?utf-8?B?RlRYU09zSi9SSEkzVnRBVTFMb2hQM0lXZWpkenJRdEZBZ045YnJDbytCd0dZ?=
 =?utf-8?B?eG1ka0NKc1NFb2NKSWZ6QWxoMVBRVGFJdVMvamxpZmxBZzhocVIrNEN1V1d0?=
 =?utf-8?B?VHZreVV3SWFYT1Y0UEljbS9FNHpoRjZ0dXhGaW1EeHhQLzZpRVhxNVFxaHZt?=
 =?utf-8?B?VGh4YnhoT2dRSlBJK3ByejVGT0c3ekNqMHh5RytLWEpvVWtja1ltaUVRR3NF?=
 =?utf-8?B?QnRISlJndlpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWY4bHdGcmtQWVVvWFE3d3N2MXRpd3FLWEt2dDZpWUVVU1ZjbU5Kbi9RTm5q?=
 =?utf-8?B?L2VxNG9saTBvRG9CZmpqQWlOQkpnTUd6RnZLWjlZVE9DdjEyYkQyNnBXUlJp?=
 =?utf-8?B?dGR0UTI3RGcrVTVocmFDbzFuOTZJRFR3ZkZLYmkwYUpuVklyaVhSWWxieGZ2?=
 =?utf-8?B?VXBkR2ljSk03V2NNWmFNVEdOdzhFb2pzRFB4NHNlL1F3QzJSdERlL2NlMDZO?=
 =?utf-8?B?eU9QdS96NERwWjdWQXNEVER6RHk4SGhWT3RGVU93RnUyYUp6ZjI4U0VNMk8v?=
 =?utf-8?B?TlF5NThkK3lXSGhOZlRsYUVnQUlHY2trZEVvd3pyMVl2L1VHYVZ6bmcrRHBQ?=
 =?utf-8?B?L3RnTHpvWVJoVHVicEdPNkgwMDB5NjUzcEVZdXZ4NERvK1JKZjByRE5Uamlz?=
 =?utf-8?B?TXVGNmM5eUdpNzZKUWhPcU1uVmhXNS9lVitTcXZTN0hPTi9ueFpNYlJZZ1Nl?=
 =?utf-8?B?eXhjN3dMeTV5REswZkNEUzBxL2p6OW50ZXcvVGFMWGQ1dHp3aitHR2JhQ091?=
 =?utf-8?B?WkJnM25NcnZmVDEvNkJGK24wOS9lZkF6WnFPcUNvazVhZHhuYTZNVGFCU0JL?=
 =?utf-8?B?UVRwWTduaHhiS3pubnpCS29ZYm9RTjFDK1BPZTc5QVRiMmRCTE9ZbllEd2Ro?=
 =?utf-8?B?S2dHTFpmN1dqRnNMS1MrRGgrZHpDeFIvNG92bHZzejNZYnk0TDYrc0dUSldo?=
 =?utf-8?B?d0oySmJOdzRTVmdYY2FzRFVtY2dIT2djMHNuUzJJQVZIdHlMbEpvWGg1cFNT?=
 =?utf-8?B?a0RlRVdMaTFEZEFJSDhZYmtIQ3dWM0J0ZVdwVmVmaStUYjB3bmJGRjFpaXE5?=
 =?utf-8?B?L3JNR21LNExPN2NoRDdSbmplSmlHN0w4Uk5iWm9FM0ZUZjB4ZUFnckV4RWZj?=
 =?utf-8?B?QWlKdDhyMEVrTWxYMHdWRjY4U0Z5dkFwVUZMQ0M3OEZJWThkTjk1emtCekhn?=
 =?utf-8?B?Q1VTd3hnMVdoNTJiNngxdWxvalFyM2Z0ZEY2M1FPcGRBY3FWMklHR0pvWFJy?=
 =?utf-8?B?WHVEOHdtRlFtUWNRbUkzWjh2bEdVMUptWDF5MkhiUFRQaU5uMExBUllrcktv?=
 =?utf-8?B?d0k5djNwSmZ3Z0ZUMUxycVRwUFgyMzhuZGtVWGE2ZXRWSE95VzFySTZrY2t4?=
 =?utf-8?B?YWZqT0MxR3VVQU5nWng0MU5nWXVVd1ZCZmI5ajFjSEJiOXZMRlRLSjJvRjBW?=
 =?utf-8?B?S3NIWTM2a2xKaXJDQ1ZjTUQ2SG5tZU5ISzJpSFJVMXlOV0xGalRSbFJnNlln?=
 =?utf-8?B?VlNmU3pqeENDU3dEUGNicG1DR2gxaHhmb0hzb1E3RlRmSnlpM3ZxY29KS2JP?=
 =?utf-8?B?M3pnRlNnWDQwMUx1YjRMY1c0ZnpOekxMN3J1cHFXaTB2UW5ERU1EcGVhbExx?=
 =?utf-8?B?OGMwaGhabkRGdHd4QWx5azFHMTZwUThCSGk1L0cwcENxS3FrSzkvODU4SzBh?=
 =?utf-8?B?VU02NTdlcGErbVFUSEg1dnN0bko0b2V3RjR0cU1CTVVJSlNaSno2dGp6Sjd4?=
 =?utf-8?B?eDk5bDVQR1FuWHNCYlNtWEQyWVlIcUViRGpWdmNEd25VVmxSTWZrRWEySUZH?=
 =?utf-8?B?dlJGQjA4aE9QZGcrMlRLemh5N0pwR0labEpzZ1ltWk1kOTdNZjlvUldNY1NP?=
 =?utf-8?B?VE1VdkRNaFZ0MUJkTXBBcWQxczN0UE5TL210UEM0N2VmbDFsNUJrNnIzSFdn?=
 =?utf-8?B?dVh0T1NjTVJ5aG85Z0FLZUZRUHp0UUkyQ3JsWnFuYno2cEFjR0JJYzNrM0JU?=
 =?utf-8?B?ZmlickEvYW1GY3lLRTdOTVhXdkJldGRucEhMeWJrNG01QjJ1V2ZSdnJQS28x?=
 =?utf-8?B?by9pODlSdWd0bFVJVWZUTTRvR3p6QjREVUtiVGswSk90Ri9MZWc0c1NTVGY2?=
 =?utf-8?B?K3FGY0M3VDJFa3M0bytDLzFpUGV0c1ZDYlM4OXVLZDZFWm9pbSs3dG0wak51?=
 =?utf-8?B?c2pTQ2FUTXhvM1VmbmF1WmxuWlhxc1FFMkdXZ3JMVFRBL09tSkRoUCt3bUgy?=
 =?utf-8?B?THdZRnRWRjRVbkI5SDVxMllObjFDVURaWWVncjJnSElELzlIM2pTUTRYenhT?=
 =?utf-8?B?emE3dDJ1Ti9GTjlTWFBuNUx4Vk1oa2N6aitpNlM3THZheGZLS3hDY0gzVzEz?=
 =?utf-8?Q?RuUCU6UOLjSEblrlzwvpmV4xz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <858977FCC3780B4E90474D5A3E7ECDC5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49e8091-7809-4920-b0b7-08ddb3b90b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:22:29.3610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4W5wKnCAZPakGMrh3nIYXqbbygUO2PQUmMdqB5bMisM2Vlzh19bm4r23UznheAhLAFkjugJdCoJeUO3o7Rwxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6435

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDE0OjUwICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IFJlb3JkZXIgb3V0cHV0IGZvcm1hdCBhcnJheXMgaW4gYm90aCBN
VDgxOTUgRFBJIGFuZCBEUF9JTlRGIGJsb2NrDQo+IGNvbmZpZ3VyYXRpb24gYnkgZGVjcmVhc2lu
ZyBwcmVmZXJlbmNlIG9yZGVyIGluc3RlYWQgb2YgYWxwaGFudW1lcmljDQo+IG9uZSwgYXMgZXhw
ZWN0ZWQgYnkgdGhlIGF0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzIGNhbGxiYWNrIGZ1bmN0aW9u
DQo+IG9mIGRybV9icmlkZ2UgY29udHJvbHMsIHNvIHRoZSBSR0Igb25lcyBhcmUgdXNlZCBmaXJz
dCBkdXJpbmcgdGhlDQo+IGJ1cyBmb3JtYXQgbmVnb3RpYXRpb24gcHJvY2Vzcy4NCg0KUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiAyMGZhNmE4
ZmM1ODggKCJkcm0vbWVkaWF0ZWs6IG10a19kcGk6IEFsbG93IGFkZGl0aW9uYWwgb3V0cHV0IGZv
cm1hdHMgb24gTVQ4MTk1Lzg4IikNCj4gU2lnbmVkLW9mZi1ieTogTG91aXMtQWxleGlzIEV5cmF1
ZCA8bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYw0KPiBpbmRleCA2ZmI4NWJjNjQ4N2EwMTljZGNkYjM3NzBkYzA2YTFkZWFiOGQ1YmRh
Li5hMmZkY2VhZGYyMDlmNmQyMTY2ZTc1MjNiODJjYTE4YzgyYzdkNDM1IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gQEAgLTEwOTUsNyArMTA5NSw2IEBAIHN0YXRpYyBj
b25zdCB1MzIgbXQ4MTgzX291dHB1dF9mbXRzW10gPSB7DQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBj
b25zdCB1MzIgbXQ4MTk1X2RwaV9vdXRwdXRfZm10c1tdID0gew0KPiAtICAgICAgIE1FRElBX0JV
U19GTVRfQkdSODg4XzFYMjQsDQo+ICAgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwN
Cj4gICAgICAgICBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0xFLA0KPiAgICAgICAgIE1FRElB
X0JVU19GTVRfUkdCODg4XzJYMTJfQkUsDQo+IEBAIC0xMTAzLDE4ICsxMTAyLDE5IEBAIHN0YXRp
YyBjb25zdCB1MzIgbXQ4MTk1X2RwaV9vdXRwdXRfZm10c1tdID0gew0KPiAgICAgICAgIE1FRElB
X0JVU19GTVRfWVVZVjhfMVgxNiwNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVWVYxMF8xWDIw
LA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRfWVVZVjEyXzFYMjQsDQo+ICsgICAgICAgTUVESUFf
QlVTX0ZNVF9CR1I4ODhfMVgyNCwNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVVjhfMVgyNCwN
Cj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVVjEwXzFYMzAsDQo+ICB9Ow0KPiANCj4gIHN0YXRp
YyBjb25zdCB1MzIgbXQ4MTk1X2RwX2ludGZfb3V0cHV0X2ZtdHNbXSA9IHsNCj4gLSAgICAgICBN
RURJQV9CVVNfRk1UX0JHUjg4OF8xWDI0LA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRfUkdCODg4
XzFYMjQsDQo+ICAgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9MRSwNCj4gICAgICAg
ICBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0JFLA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRf
UkdCMTAxMDEwXzFYMzAsDQo+ICAgICAgICAgTUVESUFfQlVTX0ZNVF9ZVVlWOF8xWDE2LA0KPiAg
ICAgICAgIE1FRElBX0JVU19GTVRfWVVZVjEwXzFYMjAsDQo+ICsgICAgICAgTUVESUFfQlVTX0ZN
VF9CR1I4ODhfMVgyNCwNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVVjhfMVgyNCwNCj4gICAg
ICAgICBNRURJQV9CVVNfRk1UX1lVVjEwXzFYMzAsDQo+ICB9Ow0KPiANCj4gLS0tDQo+IGJhc2Ut
Y29tbWl0OiBiM2JkZWQ4NWQ4MzgzMzYzMjZjZTc4ZTM5NGU3ODE4NDQ1ZTExZjIwDQo+IGNoYW5n
ZS1pZDogMjAyNTA2MDYtbXRrX2RwaS1tdDgxOTUtZml4LXdyb25nLWNvbG9yLTVhYWIwZjZkMmQy
Nw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBMb3Vpcy1BbGV4aXMgRXlyYXVkIDxsb3Vp
c2FsZXhpcy5leXJhdWRAY29sbGFib3JhLmNvbT4NCj4gDQoNCg==
