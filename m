Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF2299937;
	Thu, 26 Jun 2025 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929032; cv=fail; b=hsQ4TN6ZIzGGW7KmtYqjDwPhI/iMxpFFxPrYKeWPtSwBMqRsEy49VH7hQQE6i1MHLO2dj8zlLtPB8uJ7LYDU5FtnmwMVttTui8U1uoAmjZPCCzHTWFYs3b1C1HdWYsonVL1XUe0b4w2BuNYTr2XROAS3BBYlZVboIKCv5yAANso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929032; c=relaxed/simple;
	bh=5ggdYRiOoxsAX4SmWudDYabskGUB+5lkDoTw5YOdKQo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KWTusuZ1O6z/o0sWm3vDbnpdig+34EmAy2T1s1u7+5tm3UatYRgZ5wJlOL/2RnKlctl9XI7SUGWOZIEOVAx9Y+bVi5gjo3VpG28ITue+H6bUJdvHozOF7uWViICWKqYfAE1JR3EdvEaP85oYLS2Z95e8CpaKzebG666kUPk9Png=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tkkYWzuz; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=inq0tjQQ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tkkYWzuz";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="inq0tjQQ"
X-UUID: 5d8ff2c8526d11f0b33aeb1e7f16c2b6-20250626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5ggdYRiOoxsAX4SmWudDYabskGUB+5lkDoTw5YOdKQo=;
	b=tkkYWzuzsZfYY0L38cCj170vHErUnch+yM3JWHEiJiVjbSGLh+JMK2B5b9+1OKaKwP+7Y8gKRtC03ZeJRiKfzZ1mnBwxjTTheAP/O5ZBkWjIm+BKGlB+X/Fd4fjSj/8zTSV3GmkppC4JXWlm5EEYflB+iNntldX28ExOSpXHWCI=;
X-CID-CACHE: Type:Local,Time:202506261710+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:53354d5c-ecea-4358-8f65-d2dd2dd14f7f,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:9eb4ff7,CLOUDID:bba19773-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|11|97|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5d8ff2c8526d11f0b33aeb1e7f16c2b6-20250626
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 116432555; Thu, 26 Jun 2025 17:10:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 26 Jun 2025 17:10:07 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 26 Jun 2025 17:10:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiTkXwvC5bs2RACyYEo5rC8bU/SqCWBGKdph5I0xhLe1E3ApXHRtLscaFEkNTETJFfic5vgWbMlZY3poz0bvodzN9LTfTaXpPF0gSoN2FNad+IJj3VulOMe89LvI1WePDIiCK/WtF+JdEnnEtW4mtsqPN4gtO6I9qN8f56QQsESJddNJEnzzSdVgyOjmNM+iDFhPjG4uVZT4bIGynrzJTHlrPlNVB0vcE5078/D+EjCGzzowL34ewOu4x5V/ZDgVLkNEE1J7qcBPrHoJoGZXdk1mPvbst7PNx0Dk4QWburoB6Gtk4zn+4xDmUmvwYH6iFiOXvurGnR59D5krOArKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ggdYRiOoxsAX4SmWudDYabskGUB+5lkDoTw5YOdKQo=;
 b=n1Mz4yoh8sfyIL8xtp3vXFyvgClb3XjFoJWtF3w/CMjYVEUvAQ1AoX7fS9ZqfUQmlFUgFeC+UUuSmPFA81qdK2hKk/wYN7eQNgXIC3hN9JMObZ3fnZtbTa53kbuNT+a5PA0+xXwJdV1eO5BuJtbBbwwTLCL/gD57CZYy8YAMSDxowiiOpJAG+vN4bnx+Yv9nxgGPcSa/V9cDSaRE++EG3tcsAGIspdIj03LL0EkcMijSOBmq/8uZcaUMYuljDshqelZak3lRydRfzaSUvAcY3rogRUy2vJZOZDYdmTbsl7sLo7hdAmwFylHjXMR4zIMLsXF2/nOCxnUePZNx7rw0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ggdYRiOoxsAX4SmWudDYabskGUB+5lkDoTw5YOdKQo=;
 b=inq0tjQQnw9ZDf9vR4mj5Tt4TuKPAAuNt2KOTB4Il3kL9+gGyGi9uiGGLZJ8JelGu4L5komBlQAKtXDCKYQ7AZn/cU6+ULLi83Mvg39y0ru9yMqhW92sp4BW9RUlsZj1zjpugSfnJ8O8JTVrA4yPbDXC7HpYIGj+vi1gmlSjOHE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SE1PPFCD044E159.apcprd03.prod.outlook.com (2603:1096:108:1::868) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 09:10:04 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Thu, 26 Jun 2025
 09:10:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Topic: [PATCH v3 02/17] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Index: AQHbxXzHpsZJZDn0Vkm+YXt80bZNK7QVaTgA
Date: Thu, 26 Jun 2025 09:10:03 +0000
Message-ID: <1354f7efae2c8024bbca5852805161fe40ba8f74.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
	 <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SE1PPFCD044E159:EE_
x-ms-office365-filtering-correlation-id: b5b304bd-e0b7-40ae-dce6-08ddb4913cc2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bmVzQ0NDbjIzUWdLVTlLcWpnOUcwbFVRSnVJS293NFRubFcrQ1ZybFZONkky?=
 =?utf-8?B?d21VV29ISVJtQlY3T0hESkwybE92UW1JaTYwTnZ0TlJSL3FyMG0rWUZSSDh3?=
 =?utf-8?B?aUcvUlJRcG11Q3p3OUdtSDdsbTlibDl2ZGR3S3B0T2lNNmFpemd1enFrdFJk?=
 =?utf-8?B?L3puYjBtazgyc2Fza3BxajVpaDUrZGdjK2oyczNiZzNIV0R2cFFvaEJBSVpV?=
 =?utf-8?B?WVV1Q1A5RWphUklsVDRIT3YreFJwbkZUclh3dTNxQTlqK3BkNlYxM3FYSFJw?=
 =?utf-8?B?ZjNhUnlwL3VTNzE1MUpRckIyL1ZmWGtnR3VocVZUY1c1VENZUThxZUFJaEFs?=
 =?utf-8?B?cGIzeXBhSTEzVVcrWnJWcDFaTzR0YmtWUzBDaFNXZmFOb3poQnA2TmNGOXhw?=
 =?utf-8?B?SkIvb2IvN2NwQkNSazZ5ZHNLbUtqcm9GaWs3NlFQcnJyRTh6RWg2RmtKZDZ6?=
 =?utf-8?B?R045UEtzWlN4WkpMUnNwVVZvSXR0WVozU0svZTJpR1V4aG9GT202c0w0K0Vv?=
 =?utf-8?B?blpsZWpmU1pFdlR0WFdKVHQ0WUpZNmpJaWZOTmVTUFF6cFVyZVEyd3RINjVV?=
 =?utf-8?B?NU5xWUVXUmphSzdJcm9YZGNWTTVqU084Y2dkR3hRemJ5NUZPSktQODdQNzlq?=
 =?utf-8?B?TE5XR2lBRVBwMzdnWVpSQi9yMGlSWTNJYkxXTis5d3JHL2l6azZWNzVlSUYv?=
 =?utf-8?B?SmowNnYwazdNVzNjc0M2MGpCcDNOSmVtQW9vaFA1VFNPMndUcTdYUFFMUnlk?=
 =?utf-8?B?YkF2QkhzakhqK2sxK3ZzVW96b28rMldYQ2lRZVdvSFd3M1BWVnVIVDV0bTlB?=
 =?utf-8?B?WFlGWGdVejllSFN4QmFvSzdhOStXYjIwZ3ljdzFHbE1IWVdrdU84dmtjZ1Qv?=
 =?utf-8?B?UWxhZTVQajJxNHNjd3VyMzlibCtQa0xEcHFFTWxybW53Wm43a045YjdrMERJ?=
 =?utf-8?B?NnBEQy9hN1IvaGtMTWxranRMSVJUUmlQTlF5NTVIbFRSY2VaMGtxdXUrUzBy?=
 =?utf-8?B?STRQaVRET2NVajVFZTdwTVliQjljaHpyc0Vkb0JHcDNPd2w0K3B1K3ZkcHhZ?=
 =?utf-8?B?N2hHM3E0dURUS05KNWJDM0hnTVRXb1pWSlNyUy94MUlkYlRLKzdYd2tORXl6?=
 =?utf-8?B?cVgrUEZCc2dXV0JmZ3d2dGI2eW0xSkd0ZnJjODJZT3p3aVdoUWpaYzVxS0tE?=
 =?utf-8?B?V21TMU1zOEk3bm0xSTBnNFZzVnN0ekVsZVRQZ3pvcGRuYnhUZXpycWt4cVJK?=
 =?utf-8?B?RHhMeGpjU3pjUGpld2lhaGtLcXZzelV6dU9OV3E0RGRKb2dMSkpvT0UwcG9p?=
 =?utf-8?B?RHBGeWZiVTlPV0pRZVA2Ykx3M1lwbll2TzdqMWVLaXlpT0M2RHF3ay8rWWk1?=
 =?utf-8?B?bXBjakd2VnFKdE92MnRienQ3eHAwektweVNMak9KQllKalhlQzYrQVhUNHJy?=
 =?utf-8?B?MjFYYW5LUDhqV3poanJKTk1oYThxdWpUbWtqTW44RFZHdU1ua2hKdi91RXFU?=
 =?utf-8?B?Y2dMck56VCtuQ0k0QnF4Z05OeHZpRXY4cW1JVjFGRExMYWQ5VUhsbnVBaU5v?=
 =?utf-8?B?ZW5MRnQyNnNUTjRIS1BkaXQ4cmFWNDh0K3pZQmFJamJKaWlVRHFIWTg5eXY1?=
 =?utf-8?B?RVBEK29hYU5LaExqQTJEcFpTUGdQM1RLaitvaWw3aUR3ck16WkRldXVtbjBt?=
 =?utf-8?B?ZDdjTitYdlBYcS83U3lFOXNOb2ZxVi9pT3haaCsxUjBPTGRtS1AxV25hZDVk?=
 =?utf-8?B?Z1FGa3VHQUltZlNvVGdWZ3lKR2lBdVlrbW9JZW9rUFhlNnpwVUxLaElnZWhF?=
 =?utf-8?B?VHdDZjhNdW9XYzFLVE9tcExYaFdLV0JLbTdXTnlIdloyaFZvYjhiRGJJcytX?=
 =?utf-8?B?WVZOUzRBWDZFT2RMNlJCWTBYalZ1SmJMaEN6QVFYUk1EVXFsSVFiUkRxQXpD?=
 =?utf-8?Q?kNDob0rGqonW/X3GjkzZaLWrRrfhN/bU?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ei93bkZpNVo2MTJib2xNcnpHN1BxbGJjQ256WnR6WDUrRVdFRGQySDB3b2o4?=
 =?utf-8?B?L1RvYVBZMnFYcUc0ekkrWmxTcmNNVzBUUnhMRFlFbXZaTm9ZTUtEZllLYXBq?=
 =?utf-8?B?a2tSNVZsL1VkeENNSjRkTlNuamMyMEwvbVFLbUI5UXVvK28vNVBEQjBYMWRY?=
 =?utf-8?B?cUQ3YUZ6a0lXU0drRS9WdlFac2RhcmZYL242N1BFa2VFc0pQb1Z2MEd0YjM4?=
 =?utf-8?B?N2JjSkpINWRVYmNZR2lYaGdkWlJRSFlpNkkzMExTL2hHZE5EelhLS1RaelpZ?=
 =?utf-8?B?dkgrdXdXbkRMTkNkL3VUMjBSTG9ReS9waEYwdkFnVSszbzZTQ1NlSFVwZ3Ns?=
 =?utf-8?B?RHkzSmdOalBiRElONmdDUmd2MHRDY0V3dGZ6RUxySExzaWN1OHROZHovaEto?=
 =?utf-8?B?SmJYR2hOc0RSSXp3ZFlWSlpDb2FtUXZpZlFCcGdDaXpGRzREbEZHMVgrSldI?=
 =?utf-8?B?RDVpNDVpbkpKMkRkcnlMVHVMM0txNG53djY3amJkL0pTYnlQYkFVQUNlUEJJ?=
 =?utf-8?B?RmZtUTJxdUFBd1FPdXhxaHh4bW9IRG92ZEkzOWNNNStSK1ZNb0hsRWZReTE5?=
 =?utf-8?B?eDAxL3B6Sk9Ddm9ZTU5IWmhCMmFLSTd4UGlyeTQ2b2xXTm9NWkI3WkVzY1RG?=
 =?utf-8?B?dG9WN01YUVZFcGdZQkZsNEtua3BybUM4Z2tmUHJFbWtpOE1LcFVMVFZqYldp?=
 =?utf-8?B?QkN3VVB2Q0JkK1VZVldQRlpRQlVWRlhZc1F0SklKSlJLL2tLQ29xcnVqeTQw?=
 =?utf-8?B?Rnp6em1yUlBhUkRsU290cS91YWdUMlZZSVdkWWR1dGlnZUtKSXBIZWIydjd1?=
 =?utf-8?B?R1RkRFVDQWRUdDE3ZVhPYlMrVWJ3SWpRYmNOL1pmQ3VhYy82YSsyL2xUUzA3?=
 =?utf-8?B?YUxGYlljQXlTcGRBMk9MWnNObzFaYjJJbE1vTVAvZE5GeVNHSnZsYjA1WnBt?=
 =?utf-8?B?dEdMT1JuRG1HYU4zV3RXSXNMSWdOYjAzY2VVTXJQcUxON2E0eCsyWWFyMmJT?=
 =?utf-8?B?YjBBUzlkeEtWbjdsQnM1cVN5UUdYd1QvV2czdE5iRlJGL2V0NmI0NWRKUytj?=
 =?utf-8?B?enlNa2prWThGTXdTYTBVNDV2YXJ1Y2hwNTB2MmR2ekk5ZmNXSWlpcU9Xdzgy?=
 =?utf-8?B?eUE2Q2NTT3M3UU8xMG5uQkRlN1BPS1hDaVlBSGhCekVPcFViL1QyQm80UjZ2?=
 =?utf-8?B?eFQyK2FUczFUWmM5V1NQUkxtWGtKNUtvanNDaGhCVHA2ZDc0RDcwOVVXL2d1?=
 =?utf-8?B?VmIwNTVkTC9jUlNWb1RES3ZIOW9aL0VCSEpKdUpubTFOaDZCc3lMSFFWSW94?=
 =?utf-8?B?b2crTThTTWdhbHpoVnVyTWFlV3A3NTZTSzJ6MnhWZW8xM3pLMVpVOVZPRkF3?=
 =?utf-8?B?Y0didUtWRGU3TkFVdGlXY3kxbTRXVzdzUjk0MG0zMVZHVmpwWnF4NHNLeE5l?=
 =?utf-8?B?anlSdGt0R3BtU1J6U3FPWHRkemY5R0tZbVM1V09NZTFIV0VXVE5kUktTYjJo?=
 =?utf-8?B?ZyswUitmVHBlWGFaVURILzQ0ZU5QNzRWTGtCWTE0bU9RZlltaEdUa3dUbXJk?=
 =?utf-8?B?L1Vpa3cyUXNNbjZPRXBuUlN3OXZUb1k1VG9jeE9xL2I3NnJiUCtKczFnQVls?=
 =?utf-8?B?MkZ2Y1N4b2dDUTdkY090a1loK0NsbDJwWHRSbHBXRVJDejkzSEJIZGxaTGJl?=
 =?utf-8?B?NFFVUlk0ekk2WXJmODV5NlFIYTMvMHpRSkRvaXRWRnNmNjk2NWtEYkVlNk53?=
 =?utf-8?B?RTRNWUlmcTRBVC9ObDJlUGQ1ampiUFpRM1dpUnJiRVB1bDF2UC9IbFFvRkdD?=
 =?utf-8?B?ZDE1YWtmQnJyUS9tcVFXei84dGFSS0p0azlaTy9BRHEyYzllcEl2Zmh0Q0V2?=
 =?utf-8?B?L09ldFQ0WEQ4dStxazVrRGI5dmxpR2xIM20vbmduTXhNRWFUU2h2OEo3L2U5?=
 =?utf-8?B?dm9EWnFwaXJwLzk4T1h0cysvdGJIaEZ0UUFHOGMwcExMQUNia3pwdHNnN1pz?=
 =?utf-8?B?SzBSbGtGYUg5SU5nQUpRdEhSS01JQmF0R3dzL2V0dS9YVHBvR0RnOHlmaGN0?=
 =?utf-8?B?dDJwT0c0aXRhNDNGY2h4UklhaC9JZXE5ei84c2NKUzFJM0hqN0lpWm81dS8r?=
 =?utf-8?Q?TPuFv8R2IzolZxrD3yHV1Dfyq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <005CCF434650C24BAF9E04EFE88EA4C3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b304bd-e0b7-40ae-dce6-08ddb4913cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 09:10:03.8589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2dTnf4RvoyvlAXrZAMnCq7m6dgRENiGWyc122WwNbA36fDzQjR+EoCUSvqwqTFrSHTDLyYxhkSdAuB6YZOX3Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFCD044E159

SGksIEtyenlzenRvZjoNCg0KT24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVs
LXBsLmNoZW4gd3JvdGU6DQo+IEZyb206IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlh
dGVrLmNvbT4NCj4gDQo+IEFkZCBtZWRpYXRlayxleGRtYS55YW1sIHRvIHN1cHBvcnQgRVhETUEg
Zm9yIE1UODE5Ni4NCj4gVGhlIE1lZGlhVGVrIGRpc3BsYXkgb3ZlcmxhcCBleHRlbmRlZCBETUEg
ZW5naW5lLCBuYW1lbHkNCj4gT1ZMX0VYRE1BIG9yIEVYRE1BLCBwcmltYXJpbHkgZnVuY3Rpb25z
IGFzIGEgRE1BIGVuZ2luZQ0KPiBmb3IgcmVhZGluZyBkYXRhIGZyb20gRFJBTSB3aXRoIHZhcmlv
dXMgRFJBTSBmb290cHJpbnRzDQo+IGFuZCBkYXRhIGZvcm1hdHMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBOYW5jeSBMaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICAuLi4v
YmluZGluZ3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWwgICAgICAgICAgfCA2OCArKysrKysrKysr
KysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvbWVkaWF0
ZWssZXhkbWEueWFtbA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kbWEvbWVkaWF0ZWssZXhkbWEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kbWEvbWVkaWF0ZWssZXhkbWEueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmVhYmYwY2ZjODM5ZQ0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvbWVkaWF0ZWss
ZXhkbWEueWFtbA0KPiBAQCAtMCwwICsxLDY4IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0t
DQo+ICskaWQ6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kbWEvbWVkaWF0ZWssZXhkbWEueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
IWt5QWs3a0VpRGpVQ1JnYVVwQWFSYmpwWDZCOU00UTdTaXI1TFNpRHFLUnc4dW9USlJOMW9DRlV0
WmNzdDN2dEcxWGM0aHFjWUVqQlBkMzlFMFF4Uld2MCQgDQo+ICskc2NoZW1hOiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFreUFrN2tFaURqVUNSZ2FVcEFhUmJqcFg2QjlN
NFE3U2lyNUxTaURxS1J3OHVvVEpSTjFvQ0ZVdFpjc3QzdnRHMVhjNGhxY1lFakJQZDM5RThabFBs
ZkUkIA0KPiArDQo+ICt0aXRsZTogTWVkaWFUZWsgZGlzcGxheSBvdmVybGFwIGV4dGVuZGVkIERN
QSBlbmdpbmUNCj4gKw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gQ2h1bi1LdWFuZyBIdSA8Y2h1
bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ICsgIC0gUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4NCj4gKw0KPiArZGVzY3JpcHRpb246DQo+ICsgIFRoZSBNZWRpYVRlayBkaXNw
bGF5IG92ZXJsYXAgZXh0ZW5kZWQgRE1BIGVuZ2luZSwgbmFtZWx5IE9WTF9FWERNQSBvciBFWERN
QSwNCj4gKyAgcHJpbWFyaWx5IGZ1bmN0aW9ucyBhcyBhIERNQSBlbmdpbmUgZm9yIHJlYWRpbmcg
ZGF0YSBmcm9tIERSQU0gd2l0aCB2YXJpb3VzDQo+ICsgIERSQU0gZm9vdHByaW50cyBhbmQgZGF0
YSBmb3JtYXRzLiBGb3IgaW5wdXQgc291cmNlcyBpbiBjZXJ0YWluIGNvbG9yIGZvcm1hdHMNCj4g
KyAgYW5kIGNvbG9yIGRvbWFpbnMsIE9WTF9FWERNQSBhbHNvIGluY2x1ZGVzIGEgY29sb3IgdHJh
bnNmZXIgZnVuY3Rpb24NCj4gKyAgdG8gcHJvY2VzcyBwaXhlbHMgaW50byBhIGNvbnNpc3RlbnQg
Y29sb3IgZG9tYWluLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiAr
ICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTYtZXhkbWENCj4gKw0KPiArICByZWc6DQo+ICsgICAg
bWF4SXRlbXM6IDENCj4gKw0KPiArICBjbG9ja3M6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0K
PiArICBwb3dlci1kb21haW5zOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgbWVkaWF0
ZWssbGFyYjoNCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9w
aGFuZGxlDQo+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gKyAgICAgIEEgcGhhbmRsZSB0byB0aGUg
bG9jYWwgYXJiaXRlcnMgbm9kZSBpbiB0aGUgY3VycmVudCBTb0NzLg0KPiArICAgICAgUmVmZXIg
dG8gYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL21lZGlhdGVrLHNtaS1sYXJiLnlhbWwuDQoN
CkluIE1UODE5NiwgdGhlIGRhdGEgcGF0aCB0aGF0IEVYRE1BIGFjY2VzcyBEUkFNIGRhdGEgaXMg
c2hvd24gYmVsb3cuDQogDQpFWERNQSAoZG1hIGRldmljZSkgPC0+IExBUkIgPC0+IFNNTVUgKG1t
dSBkZXZpY2UpIDwtPiBEUkFNDQogDQpJbiBNVDgxOTUsIHRoZSBkYXRhIHBhdGggdGhhdCBPVkwg
YWNjZXNzIERSQU0gZGF0YSBpcyBzaG93biBiZWxvdy4NCiANCk9WTCAoZG1hIGRldmljZSkgPC0+
IExBUkIgPC0+IElPTU1VX1ZQUCAobW11IGRldmljZSkgPC0+IERSQU0NCiANClRoZXNlIHR3byBh
cmUgc2ltaWxhciwgYW5kIExBUkIgd29ya3MgbGlrZSBhIGJ1cy4NCkluIE1UODE5NSBkZXZpY2Ug
dHJlZSBbMV0gKHVwc3RyZWFtKSwgT1ZMIGhhcyBhbiBpb21tdXMgcHJvcGVydHkgcG9pbnRpbmcg
dG8gSU9NTVVfVlBQLA0KYW5kIElPTU1VX1ZQUCBoYXMgYSBsYXJicyBwcm9wZXJ0eSBwb2ludGlu
ZyB0byBMQVJCDQogDQogICAgICAgICAgICAgICAgaW9tbXVfdnBwOiBpb21tdUAxNDAxODAwMCB7
DQogICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUt
aW9tbXUtdnBwIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDE0MDE4MDAw
IDAgMHgxMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxsYXJicyA9IDwm
bGFyYjEgJmxhcmIzICZsYXJiNCAmbGFyYjYgJmxhcmI4DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZsYXJiMTIgJmxhcmIxNCAmbGFyYjE2ICZsYXJiMTgNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmxhcmIyMCAmbGFyYjIy
ICZsYXJiMjMgJmxhcmIyNg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmbGFyYjI3PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNTk0IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZ2cHBzeXMwIENMS19WUFAwX1NNSV9JT01NVT47DQogICAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYmNsayI7DQogICAgICAgICAgICAgICAgICAgICAg
ICAgI2lvbW11LWNlbGxzID0gPDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRv
bWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZQUFNZUzA+Ow0KICAgICAgICAgICAg
ICAgIH07DQogDQogICAgICAgICAgICAgICAgZGlzcGxheUAxNDAwOTAwMCB7DQogICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtbWRwMy1vdmwiOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTQwMDkwMDAgMCAweDEwMDA+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA1ODYgSVJRX1RZ
UEVfTEVWRUxfSElHSCAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxnY2Ut
Y2xpZW50LXJlZyA9IDwmZ2NlMSBTVUJTWVNfMTQwMFhYWFggMHg5MDAwIDB4MTAwMD47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ2cHBzeXMwIENMS19WUFAwX01EUF9PVkw+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVf
UE9XRVJfRE9NQUlOX1ZQUFNZUzA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11cyA9
IDwmaW9tbXVfdnBwIE00VV9QT1JUX0w0X01EUF9PVkw+Ow0KICAgICAgICAgICAgICAgIH07DQog
DQpJbiBNVDgxOTYgWzJdICh0aGlzIHBhdGNoKSwgRVhETUEgaGFzIGFuIGlvbW11cyBwcm9wZXJ0
eSBwb2ludGluZyB0byBTTU1VIGFuZCBhIGxhcmJzIHByb3BlcnR5IHBvaW50aW5nIHRvIExBUkIu
DQogDQogICAgICAgICAgICAgICAgIG1tX3NtbXU6IGlvbW11QDMwODAwMDAwIHsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1tbS1zbW11Iiwg
ImFybSxzbW11LXYzIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDMwODAw
MDAwIDAgMHgxZTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
R0lDX1NQSSA0NzcgSVJRX1RZUEVfRURHRV9SSVNJTkcgMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICAgaW50ZXJydXB0LW5hbWVzID0gImNvbWJpbmVkIjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAjaW9tbXUtY2VsbHMgPSA8MT47DQogICAgICAgICAgICAgICAgIH07DQogICAgICAgICAg
ICAgICAgIGRpc3Bfb3ZsMF9leGRtYTI6IGRtYS1jb250cm9sbGVyQDMyODUwMDAwIHsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1leGRtYSI7
DQogICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgzMjg1MDAwMCAwIDB4MTAwMD47
DQogICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvdmxzeXNfY29uZmlnX2NsayBD
TEtfT1ZMX0VYRE1BMl9ESVNQPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21h
aW5zID0gPCZoZnJwc3lzIE1UODE5Nl9QT1dFUl9ET01BSU5fT1ZMMF9ET1JNQU5UPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxsYXJiID0gPCZzbWlfbGFyYjA+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgIGlvbW11cyA9IDwmbW1fc21tdSAxNDQ+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgICNkbWEtY2VsbHMgPSA8MT47DQogICAgICAgICAgICAgICAgIH07DQogDQpC
b3RoIGhhcmR3YXJlIGRhdGEgcGF0aCBpcyBzaW1pbGFyLCBidXQgTEFSQiBpcyBwb2ludGVkIGJ5
IElPTU1VIGRldmljZSBpbiBNVDgxOTUgYW5kIExBUkIgaXMgcG9pbnRlZCBieSBETUEgZGV2aWNl
IGluIE1UODE5Ni4NClNob3VsZCBMQVJCIGJlIHBvaW50ZWQgYnkgdGhlIHNhbWUgZGV2aWNlIChE
TUEgZGV2aWNlIG9yIElPTU1VIGRldmljZSk/DQpPciBhbm90aGVyIHdheSB0byBkZXNjcmliZSB0
aGVzZSB0aHJlZSBkZXZpY2U/DQogDQogDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2k/aD1uZXh0LTIwMjUwNjI2DQpbMl0gaHR0cHM6
Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvdGhpcmRfcGFy
dHkva2VybmVsLysvNjI1MzQ1OS8yL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk2
LmR0c2kjMzEyNw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICsgIGlvbW11czoNCj4gKyAgICBt
YXhJdGVtczogMQ0KPiArDQo+ICsgICcjZG1hLWNlbGxzJzoNCj4gKyAgICBjb25zdDogMQ0KPiAr
DQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gcmVnDQo+ICsgIC0gY2xv
Y2tzDQo+ICsgIC0gcG93ZXItZG9tYWlucw0KPiArICAtIG1lZGlhdGVrLGxhcmINCj4gKw0KPiAr
YWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVzOg0KPiArICAtIHwN
Cj4gKyAgICBzb2Mgew0KPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gKyAgICAg
ICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ICsNCj4gKyAgICAgICAgZXhkbWE6IGRtYS1jb250cm9s
bGVyQDMyODUwMDAwIHsNCj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTk2LWV4ZG1hIjsNCj4gKyAgICAgICAgICAgIHJlZyA9IDwwIDB4MzI4NTAwMDAgMCAweDEwMDA+
Ow0KPiArICAgICAgICAgICAgY2xvY2tzID0gPCZvdmxzeXNfY29uZmlnX2NsayAxMz47DQo+ICsg
ICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZoZnJwc3lzIDEyPjsNCj4gKyAgICAgICAgICAg
IGlvbW11cyA9IDwmbW1fc21tdSAxNDQ+Ow0KPiArICAgICAgICAgICAgI2RtYS1jZWxscyA9IDwx
PjsNCj4gKyAgICAgICAgfTsNCj4gKyAgICB9Ow0KDQo=
