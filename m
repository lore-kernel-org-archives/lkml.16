Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A3214830F;
	Fri,  7 Feb 2025 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908664; cv=fail; b=Lzl5gllyiOaH5fLXCP9gC83FDFuJh9g8BIEQhZp8pgfRMvshtAvotKqH4uRhvRYbPvn+GAidgK1Eq1lkWrihZn9HFRnSq3EJFOZlbBB7p/fRZnFHSOxDPItktN/VCH+wphSAgfRKtUZRv5AIHy1trA2eWF02FzwvmTalRfARHg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908664; c=relaxed/simple;
	bh=m6Z4E7SMCxEEbLDSoaWYNtWwHfTsIUd4SbeL2dGIimw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mRioqBkNWfB18n7N28vaCjTo0OzArYQFEg+VeGJlOwoOVgRAbueln2+8IRzzqwmbe0PSTX3MYbpgtYOyrsB5igaTmPeulnmgSKZJyxebi7Qtyjs1DzJ9rSDVW3ed+PsI4JZPbRiG64VZD9wRLWnmkOKcNVGk8fRm6L1XfKKKxoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=q2oWK+Rb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gyOK8L4m; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q2oWK+Rb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gyOK8L4m"
X-UUID: 4ba80ac0e51a11efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=m6Z4E7SMCxEEbLDSoaWYNtWwHfTsIUd4SbeL2dGIimw=;
	b=q2oWK+RbmYCIkCzoMDaY1v5kN5sBBinbvdRPglnWbiSGuc/lneTc0E0onzWrI9bZfrpZVpXxb/fXnvNQUsZAT+ezENuKcew5d+FX+OPmFtx83F57gvL42alw4bC9rD0elUl1+JDmfdXC0Wr165xdF4SdPbgXDn+ujib7mXnxCeM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:dc78187f-4312-4370-a906-1461efe6f836,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:49cb2e3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4ba80ac0e51a11efbd192953cf12861f-20250207
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 542007729; Fri, 07 Feb 2025 14:10:57 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 14:10:56 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 14:10:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCDrWZuD1F/wzTdGMhwZK4HnDclGeg6vNM6u0S9eOrgvJeYSmfGBmnIUNcPz3ku+HrAstNz8w21JcIcwWNrIaSyNCJksOQwywLp7ph8zuDYHwlbL5RGM2y4450AxOm6sP7lR66YNBSKTxFosAlGnhg/7wb5/7stI5qoqVj8DuFO91BlueESDAcURPUIGpSvOYU+sp9hjrXjc4pbRl/XmHoW/+yFBCFOHxruN1l8vwNmMIjqt3Lc09VLH9mH/NO746UCeRNQHm3WVYjzJa0Tsj+Nt6WwrlC7AXKaba9nDs+zfy1TAk06gJF4PwZNm9jCbwDq3yjpYO4lTZTchlAEhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6Z4E7SMCxEEbLDSoaWYNtWwHfTsIUd4SbeL2dGIimw=;
 b=JcZ/FSGRKH0nrH1loxC7+nQsUP/7EYlDcx+luFtDykbO/EtoWXlecgL60XdDt37rOKPL0UglR7brfk/YMn3VIl/Zc3VVZmGBrCgX1whtSoWhNandm8zfkyWdM7Ws1T5+Qd+SVgJ9cL1t6e+1iRrTtpWZwpjFayw/W+S+tcrQZUikVPkvmI930hXX7apmzsTXzXvqkCXXnnJTpxcyXeknygYBOAPUhpfrnAPIU+qVD6GFkNQDD4ODMH7dW7G/E0o1jwTrwRls41ax3I2ty/S3HcuqHe/3Qr+oucX5rVPjdaRuk9E4+htRBVAD83sNL3ast1R6eFjv5ddgyMt1RsoXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6Z4E7SMCxEEbLDSoaWYNtWwHfTsIUd4SbeL2dGIimw=;
 b=gyOK8L4mpzflKfoyZ1kweLG0pNLcdY9wWr/jpJuNitTnnNvtcFYocsD3oy10efT3CBr0DkncRsm5Xzgm2bKLaK2ghNP0Bo6Ce3TIYDnEbfscClzlU4brcDWn8XBik+Y3s4fDyDyxuIbhfuWuJtah4RyZ0jUX0ADA0aXh+ApnXxA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6895.apcprd03.prod.outlook.com (2603:1096:400:288::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:10:53 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 06:10:53 +0000
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
Subject: Re: [PATCH v5 25/34] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH v5 25/34] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Thread-Index: AQHbZcr8TeMcDpKuBEW0+iDLSDitE7M7gn+A
Date: Fri, 7 Feb 2025 06:10:53 +0000
Message-ID: <a9c0027b1d02365389624c5cb9b42b5bf39dac85.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-26-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6895:EE_
x-ms-office365-filtering-correlation-id: 43571dc2-12f3-497e-97ed-08dd473e2d9e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXdYQmFkTlZkWDhFQVZkNU5ZUlEvNFhQdzQ0SUs1V3ZkWm04eEVGNmI1Y2lT?=
 =?utf-8?B?a0d6Q08yTUQ3VTAxYWJPbUVqM1pNTEt0NlVNNU5uUXFRNHNXeWRVVTFQT3Jm?=
 =?utf-8?B?V0lrb2VDNGtOTk5tVGRRZjhmNUtvTnlyNHZDTmtOS2JreDhCRzdhdjFWMytM?=
 =?utf-8?B?OWtUbXRJZmFtZG5iZTZDRVV3QlhHN1lIN25LRnJ3bXc2YXZKekhUY2ZjSnB6?=
 =?utf-8?B?VTVZNnA4T1NhTUtqUDNhR0lzckhQenlxMWtTMUx4WC9YaUs3ZWpkWkZJRmxn?=
 =?utf-8?B?NVRJZ0Q1aFZGS1kzTDVEWDRaSUdkYlZZTTVucWtxd0pVekdXZ0lkSWNubjUr?=
 =?utf-8?B?Q3ZmVDloeWY3ZUEyUXc5NlM3c2pUallJaVp2a2tERlRBVGJnakMrZEJpeFJR?=
 =?utf-8?B?QVVyWFFvVjhPaWtuZWFLZ2s1aDY3K3pOaksvSmJKaUJHcWNIc3lhZWw0R0Ev?=
 =?utf-8?B?QmoxdmpmYTdUNnRXNmdyakRnZlhBVVNwTlhaYmNPQVhaZWFhanc5SmUyQnkr?=
 =?utf-8?B?S1JJSmNiaW40ODNEc2xGSGxlam5EUHhKU0RoZzQ1R1NsRW9kczdRV1licG8v?=
 =?utf-8?B?WFZsNUlHM3lIcFIwMWxNWEJNNm9GM2pDR3MxMVJVbWphQTU1YTVRVWFPVFl5?=
 =?utf-8?B?V2ZFc0lUR05qb1dZT0twczF4ZmZaWmNtejRjU2pPaStPa0tBcmd5WHRId2lQ?=
 =?utf-8?B?UllmVDR5Nlk1RnlkTVQ0ZUVwY2xVZ3FHbU1mcTRkZEdQZ0MxQVUrc0s5anJN?=
 =?utf-8?B?ZklNSXVCNms1YzR4YnA1b2tsdmZ6QVJMdlUxd3FiT0wrL2xvOGF2UlNHWGlB?=
 =?utf-8?B?RDVUNkROR0hjTXFTT2RFaSsvMzNPRVV1Z2JQL2p4TkNjLzh2NmlDZGM1VmNo?=
 =?utf-8?B?UEI2dDV5cEN1VVdjeDFKWnk3NE9SZkN6RUlHK1pDQjA4cmlZY0xlWHNsenRP?=
 =?utf-8?B?azlTclN4aWx2VUlzK052RTUrUm9ZTUJSd3UzTFFseXVWN3BCdTF0ckEzSGxM?=
 =?utf-8?B?d3kxN1Zyd2IvcE9neHBRRXpxWE1RenFzR1BZcDUxdEZUV0YzRS8rcGhCYVpY?=
 =?utf-8?B?N1VaTTZpSTZGdjJ3SEk0NVZBMHlkQVVKL3lHbE5DUzVYQkhnZGZ2L3g5SHdB?=
 =?utf-8?B?aDNzRWQyK2VNcFNZQWovM1NKNE9oWjFzRnZHRGhlbGNrR3ErVGNuR3ZMVUd4?=
 =?utf-8?B?WEpJeWhjL05Xa2ROL2tyaDd4czErZ1VBS0tYMlpWQ1Q5amdLMjdjakUyNTE0?=
 =?utf-8?B?RkJ1M2syNmMraTRQTUxlVmxNbVJldW5XZzVDVFlURElrZGlJM2E3UkFobHhs?=
 =?utf-8?B?M3pzcEN0azFrbXJiM241UnBpenlHLzNQM1M4S0tuZDZIaXkyZE5mYVJMekE3?=
 =?utf-8?B?VmFhMG9SOTVWU3g0eFFSb0E1N294QU92WWFLaHFKZ2w5Nk9NVDVRWWIzRmVE?=
 =?utf-8?B?clpibzJFaVBZbkhLcWhMYXl5Yk9jNDR3aDJ1UmFOTk1CS3grejhPSGowSUNG?=
 =?utf-8?B?bnN4YzZBb254OEhQd0tNSHJkL2FHQ3VsQm1POEx1NWdtSDhhWnpRMnlSQlFH?=
 =?utf-8?B?b3FLbjZ2L1lQL0k1anc3bWVERFZYOUtqT2tWbEo3b0NMZ0pDaXpiS3ZyQThn?=
 =?utf-8?B?L2Q3cldES01PUXQyWVBqRWN2MkU1czQyTDBjalAxVURTNVFISXl1Qlk1K2g5?=
 =?utf-8?B?aXI1TnRocm5jQmNqUlhxZjJKbE9Ldnc2bkI2S2IzUVFQNncySzEvWjJwUDZM?=
 =?utf-8?B?YzJ1QzlGeGI2bjBMMzd4Tmw0K1MrK2ZHT29ZWFFuM0dHbG45RzIrZkFRTUlx?=
 =?utf-8?B?Lys4WjZXQk52RlREc2ZzaUk3M2U0RXhReStnUVQ4ZkRlYkd4UTdxZklLTWZq?=
 =?utf-8?B?UmFFWGNpbllPMVlKM0hmYnM0ZC9OK2RzVGZoQTBSMGxFK3hGazVvcEtjYlVM?=
 =?utf-8?Q?W9w+UO6Le91BsF8UHsIKfDjob0j8p3qQ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmN5U283N0RVK3FaUkMwenlFdi9pbGZhZUtmM09BNUxRZStwZElneXQyOHNM?=
 =?utf-8?B?a3RWQXdnbXZmdS9vZ2gyY0xZRW0vbWEyVjdKZjNmTExmSFZFazlQVFdud0VY?=
 =?utf-8?B?bWtUMXdNUVlzNDBsTWlJRFpBZFM0bTNRaE5LN2RzWHFHTTlDVTFIV3ZMYjQ5?=
 =?utf-8?B?ZFQwUHEyVWs5SXEvaG5BUTJnMG5hQUZHRnZxc2NXR2NKV2FwaXc0QWYwSkEr?=
 =?utf-8?B?SlNMVmhuSHpUbkhnazZuNnFxUytrWDhrMVJUdTg1dUJpRHZaZEhMZCtBS0VI?=
 =?utf-8?B?OFBlc3ppd0xOTldwV0N4WTBrUXhXaFdMMi84OENkek1XOGZROUlNR1NCTDA1?=
 =?utf-8?B?QW5nNjRXY1Jvdlh4blFsSHpUL3c2M2ZXbGwzRlI3a2dwS3dDb041am5YdGp3?=
 =?utf-8?B?MWR4S2VGazJvQmNhTmJhWWdRNGJpVm96Mys1cXh2aHNQajZXcEN5eFpRcnp0?=
 =?utf-8?B?ZzNyWWtiRmUzRU8wQmRHWUNKUkR3SXdzcEViQ3d6VHNDYnNzMlpOVmd1ejBm?=
 =?utf-8?B?azVPSi9veHhka0pKUU9JR2kzbVZlNDlmSnJKVTEwejlCZkgybmdrTjV0RXZo?=
 =?utf-8?B?bWZUZGZVdkQwY3M5bkJZVUJES3FHRUI1clVkSjVydmZXejRsL3NpUkkvVE56?=
 =?utf-8?B?QTlrdGRucXU4WXBPTmFpMFpRZGcwSTFCai9Eb0J1U25nMm1HYmhOa1dHMzhW?=
 =?utf-8?B?TVJPVHg0U2dOeXQwdHIvSTdueHN2NlQ0RmdwYUFDbHd0dnE4aDRvK1pyK0Qx?=
 =?utf-8?B?NVBJWTlXYXp3MS82cFBPTHZkWFNqOWlvdVU4YWpXQjdjNGp5UHU0eWJwZm1l?=
 =?utf-8?B?NGovTDZBU0dscTU0QkNiRXVpQXZpNEs5RVpYeUpvVk9WdWNTU0x5U0Fqd2Iw?=
 =?utf-8?B?WHp1bE1MRzVQMjZYWkFQVFdRSlJZMXZreUVuVDBVZXdUSGR2cG5oU1IzVHBS?=
 =?utf-8?B?UUNNZkVrRys1VC9TenRtR1VqU0wxR0dPbGlraUYvZWhUU2pOY2Q1dWpmSk1r?=
 =?utf-8?B?TFRTWG9vbGdpdmRnaGd5M0hMVEREVXAzMmxjYlNrd1RWek9VRk82ZEgwbEJC?=
 =?utf-8?B?Tng2NEVZa2owa0F1c3dKUHBlU05DVENvU05qQmVBZUo3amZTMlovVzRvMmxl?=
 =?utf-8?B?clRBM0pEL0R5ajM0eWpQaThLdWx4TEFsd2E1OXliTWs3SHpJYTcwL0k2am5D?=
 =?utf-8?B?d1VidDlXODRwWElONXF6MDVIRW9KN3BHN3Z1TkVqcG5NYXlzRHNJd1VOa0Qr?=
 =?utf-8?B?U3ZNOFdmYnRWM2h0eGdzNTA1ZWJyU1RYUm9oc1hFQWVEYm5uUnhnSk00THk2?=
 =?utf-8?B?dGNrMzRoZ1JEeWdDZktGVmo4QUFTU3RpYk5nWGhnck01aTlEUWFqTW5SalNx?=
 =?utf-8?B?STdYSndQdjRVZlZEMnQydGNpcFk2YjN6NVFDaGw0cFNLWEh5d0VjYUhsZEts?=
 =?utf-8?B?dkF6L2FVbWVQUjBHUzhMdDVEZWRoTUtZOGNoUzA5eStQYWdQY0dRZkRxUGVI?=
 =?utf-8?B?RnJqZjVjb1BwS1c1OW1laGU0Z2VsUWRHV2kvWU0wR0VPdUY1cXIvYjRIenN2?=
 =?utf-8?B?ZUh3MW41dzB0SThoUDc4QU53THBBeTgwdHFHdnZFK0plWUs4Ykh0WkhyRkJP?=
 =?utf-8?B?blExTXVlVTh5dkhJUWxGV3hnTEFLcldyRnRUS3pYVldYY2gvSHp2T3R5cnlm?=
 =?utf-8?B?ZDIyQ1FKcStuUUxXbjlQUHNLT1laeXFWdjlWdjFmOXhudHRtY0ZKVTdsWFF2?=
 =?utf-8?B?Q05BNE1CTTBObStVbmtvclFBQlhlMTBYNUJFM1ZoV0c5Mm5ndVBDNzdCOUR4?=
 =?utf-8?B?dlVIbWhLdXEwUmc4UC9iZFJ5bHp2aDh5Nlkvckdja1VCK1FDQW1TeVY4WEI4?=
 =?utf-8?B?NE14NEZ2REhtb1lidGF6NHBQZHJXQXFxQ0RpRlhJeU5OUjZTVlJ6UGpsajJw?=
 =?utf-8?B?K01TWkZ5NHgyTXFJZGhibkVWUXh1NVFvRlUzRDU3K0NHTUdlb0dFSVJxNG9Z?=
 =?utf-8?B?S1FRek9WSThvRWtQampjbStaK2dHbEJ5Z1p4WCt1Ni83U3RMZElNRlEwbjJZ?=
 =?utf-8?B?Tys2M2tyN2g5ZDhhMDNEQm5LVDZiY2tsSUREQ0VUTzN5Z2E5VlAwRS9ETzVW?=
 =?utf-8?Q?uPzEy0dgTqto8RONGN8jTEfpU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B1242BF5A8DCE4D82EA1F79C481A49F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43571dc2-12f3-497e-97ed-08dd473e2d9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:10:53.4816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7q8oGGSDHVSop+3lj/5IPr3Wt9tUbIougdKREsZypAw6QIH1O1Z3rATdqZtBCvOElzi0NFRZt5fLqfyzZCPdDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6895

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBTaW5jZSB0aGUgU0lNUExF
X0RFVl9QTV9PUFMgbWFjcm8gYW5kIHRoZSBwbSBwb2ludGVyIGFyZSBhbnl3YXkNCj4gZGVmaW5l
ZCB3aGVuIENPTkZJR19QTV9TTEVFUCBpcyBub3Qgc2V0LCByZW1vdmUgdGhlIGlmZGVmIGZvciBp
dA0KPiBhbmQgaW5kaWNhdGUgdGhhdCB0aGUgbXRrX2hkbWlfe3JlbW92ZSxzdXNwZW5kfSBmdW5j
dGlvbnMgbWF5IGJlDQo+IHVudXNlZCAoYXMgdGhleSBhcmUsIGluIGNhc2UgUE0gc3VwcG9ydCBp
cyBub3QgYnVpbHQtaW4pLg0KPiANCj4gV2hpbGUgYXQgaXQsIHRvIGltcHJvdmUgcmVhZGFiaWxp
dHksIGFsc28gY29tcHJlc3MgdGhlDQo+IFNJTVBMRV9ERVZfUE1fT1BTIGRlY2xhcmF0aW9uIGFz
IGl0IGV2ZW4gZml0cyBpbiBsZXNzDQo+IHRoYW4gODAgY29sdW1ucy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgfCAxMCArKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMN
Cj4gaW5kZXggMGVjM2JmZTUyOGY4Li5mNmI0NjNhYWJhNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBAIC0xNjkyLDggKzE2OTIsNyBAQCBzdGF0aWMgdm9pZCBt
dGtfaGRtaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBt
dGtfaGRtaV9jbGtfZGlzYWJsZV9hdWRpbyhoZG1pKTsNCj4gIH0NCj4gDQo+IC0jaWZkZWYgQ09O
RklHX1BNX1NMRUVQDQo+IC1zdGF0aWMgaW50IG10a19oZG1pX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KPiArc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfaGRtaV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikNCg0KSSBzZWUgbWFueSBkcml2ZXIgdXNlIENPTkZJR19QTV9TTEVF
UCwNCmFuZCBTSU1QTEVfREVWX1BNX09QUygpIGlzIGRlZmluZWQgdG8gc3VwcG9ydCBzdXNwZW5k
L3Jlc3VtZSBmdW5jdGlvbiBpcyBub3QgZXhpc3Qgd2hlbiBDT05GSUdfUE1fU0xFRVAgaXMgbm90
IGRlZmluZWQsDQpzbyB0aGVyZSBpcyBubyBzdHJvbmcgcHVycG9zZSB0byBhcHBseSB0aGlzIHBh
dGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiANCj4gQEAgLTE3MDIsNyArMTcwMSw3IEBA
IHN0YXRpYyBpbnQgbXRrX2hkbWlfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgICAg
ICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBtdGtfaGRtaV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiArc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfaGRtaV9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBtdGtfaGRt
aSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgICAgICAgIGludCByZXQgPSAwOw0K
PiBAQCAtMTcxNSw5ICsxNzE0LDggQEAgc3RhdGljIGludCBtdGtfaGRtaV9yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KQ0KPiANCj4gICAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gLSNlbmRpZg0K
PiAtc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG10a19oZG1pX3BtX29wcywNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgIG10a19oZG1pX3N1c3BlbmQsIG10a19oZG1pX3Jlc3VtZSk7DQo+ICsN
Cj4gK3N0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhtdGtfaGRtaV9wbV9vcHMsIG10a19oZG1pX3N1
c3BlbmQsIG10a19oZG1pX3Jlc3VtZSk7DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
aGRtaV9jb25mIG10a19oZG1pX2NvbmZfbXQyNzAxID0gew0KPiAgICAgICAgIC50el9kaXNhYmxl
ZCA9IHRydWUsDQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K
