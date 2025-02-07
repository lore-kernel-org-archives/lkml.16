Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B654F5E0;
	Fri,  7 Feb 2025 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909626; cv=fail; b=jA5CoUredYtJG7WAewNYjuzpJVTk559dkfGmpsCcCKTFkycf/DF9rHECaQKgyVpRB2GPTvWNbvsffJGZExzuPZTlkU0G9eMW2sREfVbHX48jgwcA+iUfVQrDeKU/HToTXrdJZSnEuVXafXY7WmiSK/dNNPkqk/Ji4hFwBnvpxek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909626; c=relaxed/simple;
	bh=iQjGAdxkZgbvigE5d1p5jLzXOk/9GZh1hRDVFnEnxWc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ha+JMh6ZCzOxMdjxpfhUDGmvF+RgljFP0aHYnVIJzL44N4vY0jNpr8dfRxWAwAJdiPC38YY28OuwOChRIoItG9rekzDSs77X3SefpDhEgb9Qbjq/HmLMiGOsSY/NSLnkN+wpSa+32BZ0qgUHteELjW1dRCZ65zr8ZFA5b6JJOfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WynGWIOl; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SIEVwBtD; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WynGWIOl";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SIEVwBtD"
X-UUID: 892b8c44e51c11efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iQjGAdxkZgbvigE5d1p5jLzXOk/9GZh1hRDVFnEnxWc=;
	b=WynGWIOlBkgLYHHnvdKP2h6APb27XKTbHaP9GaQfns/yAQxQ9B0cYo6+GdiDm61rIb0WC1H/ot5vdOy/5OFkxBn6sEVRaj3+RXzNCutOrhKywiPoERREUKtctTrFliF89CcRTsV1bWnFUTK7S6hBeKGON0e5IPQflWT2TxgAH8E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ee34f458-d61c-4a0b-9adc-8e55dbae5dcb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:640a2f3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 892b8c44e51c11efbd192953cf12861f-20250207
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1590688622; Fri, 07 Feb 2025 14:26:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 14:26:58 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 14:26:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6+HZX3ytXQp97ESU4sddj4mKLe4E1HbaJCMp93Z6uQ9UCx+E1cjctwHy6FjY5Z9bEvxLk0Y/jIqAKy/7Xe2AOctm5kfEQ1MGU9TWTNmiQsheXuNy3I2f+NIttD25MtAM+i580CVWrLjP1qRQEQaIFIA2BSAklvCpgCPgZnIzj6Dq01YEEi2Q5vq0yrh3Wa/qkmpeVnQ3E2vYU4CSjuVb+LYewwndtt75OsXVKL3ioCD2sNXMGGhmdLEqYNdz1kL9tNCA29bfyQThoIDlw7tyo9mf4KIQdyv0GOJU5IBAsedpdv/EH316hXNpMJUpezdo72r7yaqe7efZo+YEkHwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQjGAdxkZgbvigE5d1p5jLzXOk/9GZh1hRDVFnEnxWc=;
 b=hA0e7zMSj16cZIfamSPFJbipU3l56aUaddsnyJhjn5fWWFCBuBaGTt8b2Jssd6nsvwe7LhrqJPsqOcjCACv/R5fLrDBcmFfBLojl+4zOfDE8EUhQm6hlYYf5/2NImUPm5BsDN7PKo0iSm2NtcaQfvVwEZW6W99TBFChHI5BMdQiAg4LQxbjriyi5n2WeH95nm8OvkiHvQF6LkDQSe0I+3UnIzjfFLOYuGf+Tqf7xlQmPt3OeP3qtMoK8VPMVpROK+06wNwCk+0cSxJGjX9jcPP9Ldgdga37/iLNy1UG3HygktBHjKWiPZcntc4AOg3ar/+e1D4gaRNU3xs3yigtKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQjGAdxkZgbvigE5d1p5jLzXOk/9GZh1hRDVFnEnxWc=;
 b=SIEVwBtDQYQVTKxBJmfubUJUM16/+Trb/rCWFK7EYs70Fd0uTVW0UKq9iDR5j0cC+Qn+n7Dbw0oFuuAw8KBGbWNLCLuPaxJhQN5d6tMZMrpGMdN59FHDQQzpKq6oQhJTOCYIn7OKkpIUtGfDps1Dw/ixA6+5nu2mT4dDSnQ5aRY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7445.apcprd03.prod.outlook.com (2603:1096:990:19::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Fri, 7 Feb
 2025 06:26:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 06:26:55 +0000
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
Subject: Re: [PATCH v5 28/34] drm/mediatek: mtk_hdmi: Improve
 mtk_hdmi_get_all_clk() flexibility
Thread-Topic: [PATCH v5 28/34] drm/mediatek: mtk_hdmi: Improve
 mtk_hdmi_get_all_clk() flexibility
Thread-Index: AQHbZcr+HybjsbpTnUCr3Z4+q+Ly8LM7hvkA
Date: Fri, 7 Feb 2025 06:26:54 +0000
Message-ID: <00e0af22e3913a0e20cc3e00d78fbbf9098a5fa6.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-29-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7445:EE_
x-ms-office365-filtering-correlation-id: dc881aa9-1ffc-4072-a864-08dd47406aad
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?clV5ZGhuOEdBbEN6M21MZjJrdFpxdHljMlRmMmcrMHZBbk82b1U3a0ZSK01z?=
 =?utf-8?B?OGsxTnMrOE9WUlZ3cENzdmlSNHdnK2NlSHVKdzRmN3c1RkRBMk9BWXplRDZz?=
 =?utf-8?B?SlZ6STlTMzd0NzJ0dHJDc1NHZHFFNVowUmVZRlhTUVZRTTJTZTNiOXdGOWlV?=
 =?utf-8?B?VW42L1NZTzUwUUJUb0ZDUGlpaUEvZktEN2MyZE1qYndQVlBKdk8yUlZNa1BN?=
 =?utf-8?B?bGpjYmpQMkZ5Mk5KSFlNZFJjVXlXeWFLTjhRQXRMWlJJNXAvcy9WVitKZnhJ?=
 =?utf-8?B?d1F4M1hxRmwvcVFqMkxYTzRsZXBBeDBvOGl0SWpYT3FUalcxUXNKdDVJaURM?=
 =?utf-8?B?Kzc4UzdvWWFtaVhXOGdENjF3bGttL1o0bnlPTlFheENsemZKUGhQRlNFTWxT?=
 =?utf-8?B?RENRTVBJVHJrT2NrblZzSUhJRTRhRjUzVEhLZW1mRjh1QUdrSG96RXB4VmhG?=
 =?utf-8?B?TTNRb2hpcmNsNHFWNG9xVEh6QUNNRjdZdWxnSlN2aDdveU1ZMXBWUGhaakl6?=
 =?utf-8?B?WkNzM3F3RXFPWEtMZHRwK1F1dm54Si9OOUUzK0JCQWg0MU1xZlZtTFk4eFFH?=
 =?utf-8?B?SjBpVWNoeU5WcDJQcElPOUhiTHg4SGhSMFE4THpoQlFmejhudjBqb1pvLzI5?=
 =?utf-8?B?SVJSSHg4WHkwcnBkRy9lWXQzWEErZVUrb1ZQV1BxZ2R2UWd5eE8zczlBMUV1?=
 =?utf-8?B?WFYyalZIbnl2bTlYclVLTFdiTHBNV2FWeFFlRjFSUm5KZERhMDZGaWFCUWw5?=
 =?utf-8?B?b1FrejF2bERBRTBlZnE2YjFRek1ZdEd0eW1CNUZUUGo4cXVRM1h4Uk16SWx6?=
 =?utf-8?B?Qmk5SEtKTUtObTI0NFFaYmNCdGdKa1JyNmJnZ0R3VjVQY2gzQzM5TlBRaVJN?=
 =?utf-8?B?N1JCdVF0QWZ2aWs5Nk44RXRPamcxR1RsVW1ZSGZRb3hiMXQwNXZhL2NBR1Na?=
 =?utf-8?B?NVdubXZDMGNBOENYcWppQmNGRmwxcEpkUm9JUHZmWG04ZlFwaFVkbjFheUQ4?=
 =?utf-8?B?dWVrUzB6WXJScnhIVFRtVnVZTEZYNU5GbUxzSk9EcWt4Y0JBNmN1K3dWUDFG?=
 =?utf-8?B?NjBtQTAvZnBISFVhd0NldjZibEpRTk9nNy9WeFNFckNQN29sN1hqY1FGYUJJ?=
 =?utf-8?B?Zmwxd1R4S3FZTEFHdEk5STE4SWFyd0J2cUFZYnFRdjc3VXhvaTlDVzRpajZX?=
 =?utf-8?B?Y21JRE0zUk03aHpvYnBPYnFQLzVqWmtLUVNlbzgxVkVJZGhqazFaalc3b3Jq?=
 =?utf-8?B?ZkN4dW5RbjY1TitXbTZkcWc5VXdWcWU4OWsyWWlGVy9QM2N3OERuWnB5c2Fr?=
 =?utf-8?B?RCtudlM3eUtualVhVndhYXhEWHFmb0t0WnUvTXo5aHB1ckhUaktxK3lFbCta?=
 =?utf-8?B?WEEyblJMTUJ1Mm8wbEFsTWJ1bXlTNDlrTDBHOU5wYkljLzRqNmJNQVZTVFEw?=
 =?utf-8?B?QjhYbnpDeWVjV2d0cFYyanY5ZTdjM2NRNUV0VHEvN1FxWlF0RzVKTEZIbG9T?=
 =?utf-8?B?Z0J5eW1vRmw3U0JyMHlhdlczb0RMNzV6SER6UERFQTFZd2JLR1htLzZYbFAv?=
 =?utf-8?B?amJiU3RqVlVJOGdLUWs1bU9OUFZlU20weVlydllCSEJjSXBQMGNKSmdha29R?=
 =?utf-8?B?bWhTZHcwOUhmNjhhRTVKbmtyMXlMSTdUSlRJbkdtcFlWU0pZMlRqclBjaDd1?=
 =?utf-8?B?Z3lvdlhXdVNjSVFFVFpsRlV0KzFjKzV6VlJJUDNVMSsxa1p2bmEyT2kxYm5E?=
 =?utf-8?B?bng5SHk3OUxuY2xBeEhWdlRNblUvd2VmMFVOck83c012SEsxMlNESm9xQSty?=
 =?utf-8?B?WEtaQ0p4MENKeG5HQndHMTJ1anBlT05QQlYwdENWM3RPazl0Qi9CODJkYWNF?=
 =?utf-8?B?RUFiS2NkdGxPRVhiVDJudmpmMFRmZHBlTGNPcmJERWtsUDNOdlJUdWxhSkt6?=
 =?utf-8?Q?UhyKt4eD0l77KwTG4z885mDbpw8CzBns?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFZFeGNGL0Jlb3MzZXNucnZUNkN6TzJKa2tUQmhtZ3pWRDZVdHBnaEhRYnlI?=
 =?utf-8?B?YWFkamJwRDdhVVdaYzg4bUNZU3FYUjBWeHJwS3JvY1FQSUpxNU10LzJhYzgx?=
 =?utf-8?B?ZVRHN1htWm11NmpiZndza1l5eWhzZmpKUjF6YkFxNUExc0tHYUExTWx1NGJG?=
 =?utf-8?B?Z2QvTzlERnBTWmVBNFFSRnpOSUNZd0owV1NDSHYybjVpQVE1OVRqNnM0WVAr?=
 =?utf-8?B?N1g4WG94ckFMSlBpdDYzS2IxMjByQU51QTk1Y2Q4cElPUThibzJlUEdzcUVG?=
 =?utf-8?B?MzNwK1RMZDgvVGlZVkJ1VE1sWks0VmgvTTUrZmlMM01kbFZYRmxaR2hpRXpN?=
 =?utf-8?B?Rkx4TU5aejBNek02bW1WbE0vdUZXNTliZitVSHJtZ201ZGI0M1JFeTliNjcr?=
 =?utf-8?B?WmdJbUtEZm9JS3I4TmpsblFFU2F5ZEZFWVNtMzlNN2pLbVl0QWNYdmwvTWN6?=
 =?utf-8?B?dS9jUzljR0QrV2ZEUkR0UTRtOUZjZVgwK1V3RGhpUjhSV0g4UFY3dVJWellB?=
 =?utf-8?B?Z3JqWEtoVmpLVTZUdmNhUTBvSnlGb3ZlT2lIRUVKN2JBRUVXa2s0bnBLdTMz?=
 =?utf-8?B?cjNYT2MzWkJNK2NEOHowZ1ZkNW04RTFwdDF3azBXVFB2aFlOSmpqT2xGOFZD?=
 =?utf-8?B?YXVQamxmQWR2RzdoVHFHYnREK2JIekM5NUdjdWw1bzdXRkFwc0hlTFg3dUVR?=
 =?utf-8?B?VngxVGxuSkxBL0wyMnFvZGFlMkVzbUFBVXFLZElNb3hlNnE1dXVxdUE3TklI?=
 =?utf-8?B?RGtEV0JEcU5HNkU0WUFWWkZzMmtEN2NaY2UweFkvUEFvVlFlODRMVHZFaW1Z?=
 =?utf-8?B?ZVNyd3BQSG9XNmxlK3JOaENKVjhQQWwwTkRRUEN6dHg4bWxQSFRxa004NWgy?=
 =?utf-8?B?dEI5OXFLSGhHcEdIZENFOWcrRnIvbC93M2VyOHhyeW1xSmgwOUxWTm9rUXNh?=
 =?utf-8?B?eDdvVHJvL0pGejhYd3pPZjNVMmNoamtJZEYwd3VQVFpMZy8zSlBZb2NVeXg4?=
 =?utf-8?B?TVp6S3dGTFlRdXUvQ2xOeVo4WDJEWnMvTnVuNVFReHBVR01VYUlmOVJ4Si8w?=
 =?utf-8?B?clcxRWxYM0w0WCszZVlWNHBYWFJjaklVMjJnbVBDVy9PRjVVU2JEMjYvTjJq?=
 =?utf-8?B?U3ZwN2ZRRzNaUTFkNmU5YXNIaTZwZ2FQb0QzT3I5WHVMVFhtV0NNMkowakk1?=
 =?utf-8?B?ejd2MnNOWkpxdG5hZkxMaTY0S2IvY2RPbFhKRnFySjFDTzBKWkpRM1lKdkoz?=
 =?utf-8?B?Y01DMlk0REhORlZ2eE5hMGdGek12SmFFajhIZWMwa0VSeXBWN2YycjBPdEE4?=
 =?utf-8?B?ZEkwam04SERWTEp0K2VrNVFuWlIwcDhLRTl3RjdRRzRmM3NIamFBS21oQ2pM?=
 =?utf-8?B?cnNFYWNBelkrWkdOcklyRUdQLzl6MDNwd2tCa2hNMUtYRkJDSzRlVWdtK3A3?=
 =?utf-8?B?RmV4UHF5blgwVzJ6ektvOE43TzVvZjUxMG1OcTUyR21abzNEemRRdTU4RGZq?=
 =?utf-8?B?Qlc3THZUN2xDTy9QZkZIaTZtc3FUKzBJMHhqck9qMzRRbEVWTUx1VUdpK3F1?=
 =?utf-8?B?YnRvWk4yRElXOGVka0NjRGFQeSt5bUV4bWxONkZpK3EwcEh0SUVLNk9tZGp6?=
 =?utf-8?B?dEZwaXIvTkVQOXpsZE5sM3FNRC9hU0tRSHhKcG81VjlZSkE4RVB5YzNvVU1v?=
 =?utf-8?B?a29ONWl6cXlkNk1LZ1FXN3FFcWtjeDNpeGFhdWtOSjRUWHEvejluaHQrVTFE?=
 =?utf-8?B?NWRKZ3hQaEdveHEzNlNrY0hLM2JaUHY5Rk1oNmM5TTZ1L1d5TFFtZXZ6Y2Ja?=
 =?utf-8?B?d3IrSUtCbEZmdzUrdXI4QjhPMEZIOGVwdlJ6NlNycHdwblpFK0lRY1lGaHd1?=
 =?utf-8?B?ZVNoWnBSZUZNN2RGajVEUjN5Q2pWVkJzM3BnTk9yR21zdE9ZMnYvSHh2eW05?=
 =?utf-8?B?T1R5NFU1VitKcjJnNUxoa0JDcjU3K2hVVFFLZldwVTJmVUdtMWQ1dXFCbytt?=
 =?utf-8?B?TGo2TVFOc3pQaUUzR2RPY3QyVncvOVNuYmZNbHpsTlh3Tk1KbyswaDllK2tM?=
 =?utf-8?B?aXlWZU1tM1o5K0lISTFnQTVsSGEvdXpkZWlURWtmS3VUcjBFZEI2ZE5UQ2Ni?=
 =?utf-8?Q?ePj/mRn2fXazxhXIRcND0repz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D87A7C9360ED8B4D92312E9D74671494@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc881aa9-1ffc-4072-a864-08dd47406aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:26:54.9597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfvUxPaQFmBuYmNYr+p+z0BqZswBgO6TcVRl4IZhCHwf++YBHeDSaABqKIuUgxMYTvtly2VyqZZu87ok4NfKIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7445

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3Igc3BsaXR0aW5nIGNvbW1vbiBiaXRzIG9mIHRoaXMgZHJpdmVyIGFuZCBmb3INCj4gaW50cm9k
dWNpbmcgYSBuZXcgdmVyc2lvbiBvZiB0aGUgTWVkaWFUZWsgSERNSSBFbmNvZGVyIElQLCBpbXBy
b3ZlDQo+IHRoZSBmbGV4aWJpbGl0eSBvZiBmdW5jdGlvbiBtdGtfaGRtaV9nZXRfYWxsX2Nsaygp
IGJ5IGFkZGluZyBhDQo+IHBvaW50ZXIgdG8gdGhlIGNsb2NrIG5hbWVzIGFycmF5IGFuZCBzaXpl
IG9mIGl0IHRvIGl0cyBwYXJhbWV0ZXJzLg0KPiANCj4gQWxzbyBjaGFuZ2UgdGhlIGFycmF5IG9m
IHN0cnVjdCBjbG9jayBwb2ludGVycyBpbiB0aGUgbXRrX2hkbWkNCj4gc3RydWN0dXJlIHRvIGJl
IGR5bmFtaWNhbGx5IGFsbG9jYXRlZCwgYW5kIGFsbG9jYXRlIGl0IGluIHByb2JlLg0KDQpSZXZp
ZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyB8IDI2ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCBjNTQzMWYxNjBmZTQuLjEzOGM2MjgzYzAzOCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTE1OSw3ICsxNTksNyBAQCBz
dHJ1Y3QgbXRrX2hkbWkgew0KPiAgICAgICAgIHN0cnVjdCBwaHkgKnBoeTsNCj4gICAgICAgICBz
dHJ1Y3QgZGV2aWNlICpjZWNfZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciAqZGRj
X2FkcHQ7DQo+IC0gICAgICAgc3RydWN0IGNsayAqY2xrW01US19IRE1JX0NMS19DT1VOVF07DQo+
ICsgICAgICAgc3RydWN0IGNsayAqKmNsazsNCj4gICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSBtb2RlOw0KPiAgICAgICAgIGJvb2wgZHZpX21vZGU7DQo+ICAgICAgICAgc3RydWN0IHJl
Z21hcCAqc3lzX3JlZ21hcDsNCj4gQEAgLTEwNzIsMTcgKzEwNzIsMTggQEAgc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdCBtdGtfaGRtaV9jbGtfbmFtZXNbTVRLX0hETUlfQ0xLX0NPVU5UXSA9IHsN
Cj4gICAgICAgICBbTVRLX0hETUlfQ0xLX0FVRF9TUERJRl0gPSAic3BkaWYiLA0KPiAgfTsNCj4g
DQo+IC1zdGF0aWMgaW50IG10a19oZG1pX2dldF9hbGxfY2xrKHN0cnVjdCBtdGtfaGRtaSAqaGRt
aSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wKQ0KPiArc3RhdGljIGludCBtdGtfaGRtaV9nZXRfYWxsX2NsayhzdHJ1Y3QgbXRrX2hkbWkg
KmhkbWksIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqIGNvbnN0ICpjbG9ja19uYW1lcywgc2l6ZV90IG51bV9jbG9j
a3MpDQo+ICB7DQo+ICAgICAgICAgaW50IGk7DQo+IA0KPiAtICAgICAgIGZvciAoaSA9IDA7IGkg
PCBBUlJBWV9TSVpFKG10a19oZG1pX2Nsa19uYW1lcyk7IGkrKykgew0KPiAtICAgICAgICAgICAg
ICAgaGRtaS0+Y2xrW2ldID0gb2ZfY2xrX2dldF9ieV9uYW1lKG5wLA0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10a19oZG1pX2Nsa19uYW1lc1tp
XSk7DQo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IG51bV9jbG9ja3M7IGkrKykgew0KPiArICAg
ICAgICAgICAgICAgaGRtaS0+Y2xrW2ldID0gb2ZfY2xrX2dldF9ieV9uYW1lKG5wLCBjbG9ja19u
YW1lc1tpXSk7DQo+ICsNCj4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIoaGRtaS0+Y2xrW2ld
KSkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaGRtaS0+Y2xrW2ld
KTsNCj4gICAgICAgICB9DQo+ICsNCj4gICAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+IEBA
IC0xMzgxLDE1ICsxMzgyLDE1IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfZ2V0X2NlY19kZXYoc3Ry
dWN0IG10a19oZG1pICpoZG1pLCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjDQo+ICAgICAgICAg
cmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0
YShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyBpbnQgbXRrX2hk
bWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLCBzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGNoYXIgKiBjb25zdCAqY2xrX25hbWVzLCBzaXplX3QgbnVtX2Nsb2NrcykNCj4gIHsNCj4gICAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7DQo+ICAgICAgICAgc3RydWN0IGRldmljZV9u
b2RlICpyZW1vdGUsICppMmNfbnA7DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+IC0gICAgICAg
cmV0ID0gbXRrX2hkbWlfZ2V0X2FsbF9jbGsoaGRtaSwgbnApOw0KPiArICAgICAgIHJldCA9IG10
a19oZG1pX2dldF9hbGxfY2xrKGhkbWksIG5wLCBjbGtfbmFtZXMsIG51bV9jbG9ja3MpOw0KPiAg
ICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwgIkZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsNCj4gDQo+IEBAIC0xNjM4LDYgKzE2
MzksNyBAQCBzdGF0aWMgaW50IG10a19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IG10a19oZG1pICpoZG1pOw0KPiAgICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsgICAgICAgY29uc3QgaW50IG51
bV9jbG9ja3MgPSBNVEtfSERNSV9DTEtfQ09VTlQ7DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+
ICAgICAgICAgaGRtaSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqaGRtaSksIEdGUF9LRVJO
RUwpOw0KPiBAQCAtMTY0Nyw3ICsxNjQ5LDExIEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBoZG1pLT5kZXYgPSBkZXY7
DQo+ICAgICAgICAgaGRtaS0+Y29uZiA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0K
PiANCj4gLSAgICAgICByZXQgPSBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShoZG1pLCBwZGV2KTsN
Cj4gKyAgICAgICBoZG1pLT5jbGsgPSBkZXZtX2tjYWxsb2MoZGV2LCBudW1fY2xvY2tzLCBzaXpl
b2YoKmhkbWktPmNsayksIEdGUF9LRVJORUwpOw0KPiArICAgICAgIGlmICghaGRtaS0+Y2xrKQ0K
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKyAgICAgICByZXQgPSBt
dGtfaGRtaV9kdF9wYXJzZV9wZGF0YShoZG1pLCBwZGV2LCBtdGtfaGRtaV9jbGtfbmFtZXMsIG51
bV9jbG9ja3MpOw0KPiAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiANCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=
