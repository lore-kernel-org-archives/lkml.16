Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021089.outbound.protection.outlook.com [52.101.65.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456B2907;
	Thu,  3 Apr 2025 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661079; cv=fail; b=a6uUorRz6wZSnLKnjKWO26HharBIcRTg6mTcOKcdMTE14mzbQwzEPePyBTOZ2CbGq6Ul4UWrVNvfiX5wJHVTvpYBu3J8U3H+cZVQ1rCUPzR+uwMNh1yEaNJgN1QOv3u//70kOgAC+FGrj74yUSEJFa33YE87odbTfAAAozHHp/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661079; c=relaxed/simple;
	bh=ke3z/YVHOuznR+ODOFlyD2xnhUboMXzVVRFQcN4AIxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OAqu45DRPNK09/Gm8kEqyTrbbOKuDY0mKOdht+MLo9hXb436fkS4y3+mFqZIDyE5dz9V+pVAjdUSuXJL8iPzP2B5iFvUBL8Q1Hn0P3NcHQ/4eklp+463buMr6H/kVxCIPRZmXFPPVNioPmtUVDoa00795ZlDYYgU8vGaQC6v3kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=fDR+B4tP; arc=fail smtp.client-ip=52.101.65.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="fDR+B4tP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJGtvXHPPDsboj38MCk2JGyKgnSC2qJtrarPXLjHH2f4JhZBgp5bIoeAwhIEQ1zcGl1Qu/muDAeLTXV3K6thymS5wPwUUBSyn2GId+rEfQXs2Jx7z2zfVxlMEK47l/9EbyjVJr55hjBWFkpB8qfuBxRMFSEEmCcL8KgnL7mA7hL253z9Zk/CMewz10ZKE6oJ9FZ0N/AYRw3t/Z6Np2nYilIQgzKMpKMFFTxRn2Bgk+pq2PWyR4A+MwZJQbs6preOfovn+UOLqnnS4ygIPLRx4HDwNMWuuUfDf/hdwQmpt0f8dgs+s4+ccTJVPMJHd6FfMY1ti2vBh4hQDadLGeqi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAfIeqgYfKrsjxIN+x9u8/P6U+uziw+lu0Je0iqrO/g=;
 b=T209AJc1kcKQoTkML/2M1ZgZeXcTNmID42RTTTAn+h472uqOw66lKqyvpkT+ZFOhl+En9wI8pQaci/aOWmlD3dVqlXj/S8edcCT9D2u9ONJpl/4f7tfZHen6X75uhknKENTl5OMNDy0hPLAnuqYRpNHwDMioYXfPlklwFNop4nUOc55TuOAI35qJVGTuuSEQRVuSYGeHrZqqeenLHavRxX49q2YEZokhOKIv90kWBJorYkf5eTGQ3U9E7dhSkLqtD9tp2DwMgehI8lkNjCO/7o+22k7NqZq85/6o/+mWGx02Qmw/EY+3Y2K4oVyBHlNb33lwCcPtmn819q70CAMq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAfIeqgYfKrsjxIN+x9u8/P6U+uziw+lu0Je0iqrO/g=;
 b=fDR+B4tP8wF6fBUOSxJEeTL+HSW2WvZmqZDOoiLa5lxFeq/guUHyOFY3wuFEi6QzO1Urvovz47BLZSNXBseMZhH4tWpIFldGlv2qpawuxrdOfmYamXpbZDGrNh7XURbAiyxjQWI5EOspdSP9Oob2LX6/VJCVhPJv8fJKC3sbxJuJxgIsiO5shoFqpzhUPXyw46xV1zeWU0kCXFlA5P3NQcHbvWNtI2kgpT42d8G/AGywgUx5moeOpNegO9SDaJO/+cXXUSLF45BAuyT6a79kjeQcqUdjA77eCx+LAOCl19KHP/c2oradnUyBtHZwJGBFMbCokoaMFkLNIu0iD3+dxg==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DU2PR04MB8903.eurprd04.prod.outlook.com (2603:10a6:10:2e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 06:17:52 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 06:17:51 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 4/9] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllersy
Thread-Topic: [PATCH v4 4/9] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllersy
Thread-Index: AQHbpAPc2PNhgsfbRka9Bo1flh8OybORd/vL
Date: Thu, 3 Apr 2025 06:17:51 +0000
Message-ID:
 <PA4PR04MB7630F6B7CD6CDD6AB791CECFC5AE2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-4-9f898838a864@gocontroll.com>
 <Z+2NNFyd3NmfeMSr@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+2NNFyd3NmfeMSr@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|DU2PR04MB8903:EE_
x-ms-office365-filtering-correlation-id: fd129c29-bd42-4b21-994a-08dd727743b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5edZtkmucAvCZYmk3xcHzK1IaV8yaDHlwP5BhGX4TqdehOfObDHNPDS9De?=
 =?iso-8859-1?Q?hotHLgfCdBhlw4r5PvCI1rCeoi6Ni1ULlGB8QY61UYsZMktX5MH1yWMvKF?=
 =?iso-8859-1?Q?A62WLYp63E5w+sq6ZT7GAey2U3fQhbywXkHKjwScHAqYsvvUvQYH3WnYkq?=
 =?iso-8859-1?Q?XkC9wGESwLzg28MN6du3dQskjdgqrG7GZKX5ITilWJ3cybiuPi1A3yxrs7?=
 =?iso-8859-1?Q?rsPyPJyRKLFQvCbX1z2Mt9nfaE9PL2erV8GaREVZ+NZjwGrBECOpCWqnxm?=
 =?iso-8859-1?Q?w5tEEsPlm5roQrnepKUNAipshOLIBZASidDJ29HiWfirGXQmqSevSM6mzt?=
 =?iso-8859-1?Q?ofdMg5K1qmKfwTbHq8YmK7oC2mvNRfCs/R61kwX0gK7NcTlyv+5ajar8c+?=
 =?iso-8859-1?Q?Sg3hI8HfRs7RjR1rZI2TasXkDQ94wBNRUdp8eIZnSgpXvkgOSUO4x6Ye+T?=
 =?iso-8859-1?Q?m38BHS8NCPzl6zT/jWtI4qhkeAFvsTnRLS63XX4LFm9xRbV3DcdyQ/NG3W?=
 =?iso-8859-1?Q?bw5XDXY6EM4XlaHaVYk9ULh8Exkw8/cdZwhcXC2efdZkPqCcRYZYPa/btx?=
 =?iso-8859-1?Q?f0VSZF9vvbGaObbYcdKyIHaVCL/IjuKY2+R+V/skFqKa7n1avjdRKQ9nNM?=
 =?iso-8859-1?Q?1b7JjVdpDKmgqkojQiaWuiTNV2fsB/C4FbtVuP4j6CRuaq3py+4usLuFo8?=
 =?iso-8859-1?Q?G5CtsU5yPEMPNPo9J2+f6VPKv+h3OMAf/frLPqnP0BQFfWEIgNVQD+CVjr?=
 =?iso-8859-1?Q?LKe9atJmt3/6qrV6PPGAOV1OUiwOggu+9+R61SDj5KkNYjNkZ/M5Ao7ZzW?=
 =?iso-8859-1?Q?WFGETWZU6DQqlczJqA8+MnuUCODhv8xJv2UtQu6GNYCBwaG5Akkaa6h+5l?=
 =?iso-8859-1?Q?QOiXJt9I1yaBm+0v1iMotzEZx4hiOTViRu8UwMhTE0WgNG1mCGBgE611KW?=
 =?iso-8859-1?Q?8ak4vhKx+GnHCLOT4vau7GnL8eIuLWL/1JcK2LFvllKbxKXa7K7s3c7i1W?=
 =?iso-8859-1?Q?Jcx2x3uPYcEKVQ8+uKoFEVxhgbhQycV6dykLuiKFUaX8nLrgHZ+oCg/ECL?=
 =?iso-8859-1?Q?AGGHKN5i8oUCg4dh9J1hgxObPtPgZYcSE2SYQbP5/g/ckTJ9hl+sPlYItB?=
 =?iso-8859-1?Q?5JGneB5UUdA/URHI2rPeTT+vUhMIl8p6LOCKi4EzuGVn+Pchk3uj9GrXj+?=
 =?iso-8859-1?Q?rj9BNbPgrEenlITceO5L7vsogkxeYzg4WmHV047Pl4IVqUjDrl8zjYqIrr?=
 =?iso-8859-1?Q?E547Noq/ATgBBVIDroGagnblQ7rgT+uvOVApddwm4FOnZ0NXbgaHwkd0GX?=
 =?iso-8859-1?Q?7iGjD+vKI46WuITB7UObmQiUGMmzZWxWQn92Wv1hEu/TqfTXtSSv8eSfPd?=
 =?iso-8859-1?Q?uNIW8acxvogfffdTDBoW14szKyuVjwJrLCu8c96T4nHbJ0+EPWTYGEY3UD?=
 =?iso-8859-1?Q?e1x2si1ECg+noLxbNWbNZ1l8xxMSO+SAIC6ccEjNLf+ElOUxlHQq0yH/sw?=
 =?iso-8859-1?Q?7g0AAPDA/cgciMTWdftSUc3Zc2rr2699S07PSkM87s0w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YrY5kOgPBzixqqC4DwFJ6jfn1JfhgBa2hemVqGerTT/djGjWOPWEp8uGgH?=
 =?iso-8859-1?Q?KQHc38dEaJREXragTDUXgG4UsqShv79sq1JfpFQp69z3verdNlwxTSvG6u?=
 =?iso-8859-1?Q?0z3z0gSg5MfLeJLEpV5cJ29R4LOiulf5G/CRJlcHn4cbP8tZsTEQc5saxf?=
 =?iso-8859-1?Q?hyjuJvzUcK1lxAjoBKapN12TBHN9ZqbmwkhtpFKfE8yqDB34sRqkhlJTWG?=
 =?iso-8859-1?Q?7KHDG8j8iR5evREZvvXphnl8M/4Oaw5pYyn1u4xOrMiVJo+LQb/xlI/nRW?=
 =?iso-8859-1?Q?VjM4rsYs2DKb/5ZBnVsidyu/Ftuxy/Rhf2sKa2rZYD2b5PJthUPtE08FMN?=
 =?iso-8859-1?Q?FaTAFXLUfcU+Uj1hkgx0IwozmMIcMVyoKYXhHIrehEH7xMnepM53HUKTs/?=
 =?iso-8859-1?Q?y5ZMxh/pj4bSngh0XmE3Rb1jDa4xQk2kyMxmFxS1Hf9buy/GTpNtLWOBzp?=
 =?iso-8859-1?Q?tAFPjuQyRI5LrKrIbmYJkagUlzcFyyTS/uc8zlHqzA2DdlmOdVCXHsLucT?=
 =?iso-8859-1?Q?H+jGz6h4M43pwvNU9gjdvq/cgEgYduv4ZKAasGp+brOCnxLZKcwfCcLEyU?=
 =?iso-8859-1?Q?o6hugE+Q/xJB9eaLMuHTz8PeeuoRzFnBnxLfheQWySHScUUhwsvVgNDNA6?=
 =?iso-8859-1?Q?uuBNMo99IXVXSicX742OAdVs5+d3Ig7Vb7/rgqG1+UmS62KxLtAg/Gm9fz?=
 =?iso-8859-1?Q?/h6TWzzHkMaHOUL6MJIfIK6+p1nSBY0N8lBpqvyctEttZbChrE7bvpCM55?=
 =?iso-8859-1?Q?qprKRAH13oqiwaAgr7JPxcwkv6OGjQGX1nAgnrMgE040ip0mHzO7E0Z9Dv?=
 =?iso-8859-1?Q?v3jX7/6AYZPvNJ15MQh8BXBKZQuepgL6Y47hZ2jcR/5IprhLBbNUbQ+xrU?=
 =?iso-8859-1?Q?iYYwuPQByaR4wK/Xt+ynLc6ynn3/z9oL2YusWVBG/KL1brvb4aIHw3jp4m?=
 =?iso-8859-1?Q?N/1FPtMbh9EvcyiMMaAFmYKeXHl0xyKwUAW5BxQAx1EJM+ZdhltrH91Zt/?=
 =?iso-8859-1?Q?yHONohCDuKKlht0I7GXnNuZcAhPs9c/DIbtFex+F9TPgGf3khc5XtAoxu0?=
 =?iso-8859-1?Q?QnnfZTJcBYY7zrCN8ZTkLhu7l2qpVlZWpODOjh73rlVPqVXzbOmrZXGSCd?=
 =?iso-8859-1?Q?YTkMu3eL9HhluPUIqX86IVDO4qUwCRvqlIAzYgs/OffGuU90Y65qxVYyIT?=
 =?iso-8859-1?Q?fFPc57WWEYJP2vfNWadisc8RJ3/fCYCVW4M7TRC3kWw2axsSa2t4yBPiqW?=
 =?iso-8859-1?Q?vBAgdy6jzS/lyQuCSmY2ogslcEE7fVTj7FbPCaT4XfaBj3TEwVTAQzti0U?=
 =?iso-8859-1?Q?t5GJcIZBERhLtD5zNKPl9jSwxKiKjN8CQ8a4h0Q8XslroJuxQBA6qPQysY?=
 =?iso-8859-1?Q?9hwHXjnEpO90amAhDjQRbLoVo5m1cmP5hxC6suk0NA3WuDQy++zm/H3pkK?=
 =?iso-8859-1?Q?YG7t+QzAKfJI1t0da47qhRdzS/weeAD+rgUeesRjeWm/vy6LeBHK0mNlkJ?=
 =?iso-8859-1?Q?fR7noXWG5pzBm7uG1N0vIXo4lQEfVs5xN41mvImRcpgsVLgTvJjcFTdCKX?=
 =?iso-8859-1?Q?uI9pUmTDmlxNY+v4BpM/kWGZtw9ny4nM25cJpG4x8wLY3HRv0gEsChFM3a?=
 =?iso-8859-1?Q?mnwbBE+RV8sFb6rV/3zeQmW6427H0FFZ2yCfw0DfPln/Hq9p8BDTkAZlIH?=
 =?iso-8859-1?Q?D5d4Gpo00rKz6K5cbHVA/OS8B329fI/hR6VIVjZcNIDeKMoKnMfqDYM7/Z?=
 =?iso-8859-1?Q?yheg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd129c29-bd42-4b21-994a-08dd727743b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 06:17:51.8987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8wMGEDcPe0n4IH/29R3Ri4DeOOyLi4eNm4Ji3sR7nF5mkbamq4WUuyLWhy+Njq0NQMlufdtFLC+iZOwY7uEXjkCiqMogiebXNkgFdLQ0uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8903

On 4/2/25 21:17, Frank Li wrote:=0A=
> On Wed, Apr 02, 2025 at 09:07:07AM +0200, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> Add a maintainer for the GOcontroll Moduline series of controllers.=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
>>  MAINTAINERS | 6 ++++++=0A=
>>  1 file changed, 6 insertions(+)=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 4b3864a9852f9fca2be48987d383c0671e668336..7d4fbfdaaac1776fc7c4a569=
f7ab667f0a485eab 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -10043,6 +10043,12 @@ L:	linux-media@vger.kernel.org=0A=
>>  S:	Maintained=0A=
>>  F:	drivers/media/usb/go7007/=0A=
>>=0A=
>> +GOCONTROLL MODULINE CONTROLLERS=0A=
>> +M:	Maud Spierings <maudspierings@gocontroll.com>=0A=
>> +L:	devicetree@vger.kernel.org=0A=
>> +S:	Maintained=0A=
>=0A=
> this one sill need=0A=
>  L: imx@lists.linux.dev=0A=
>=0A=
> Frank=0A=
=0A=
Ah I didn't realize that comment applied to both my bad.=0A=
=0A=
>> +F:	arch/arm64/boot/dts/freescale/*moduline*.dts*=0A=
>> +=0A=
>>  GOCONTROLL MODULINE MODULE SLOT=0A=
>>  M:	Maud Spierings <maudspierings@gocontroll.com>=0A=
>>  S:	Maintained=0A=
>>=0A=
>> --=0A=
>> 2.49.0=0A=
>>=0A=
>>=0A=
-- =0A=
Met vriendelijke groeten/with kind regards,=0A=
Maud Spierings=
