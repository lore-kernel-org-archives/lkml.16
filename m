Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012055.outbound.protection.outlook.com [52.101.71.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41762036E9;
	Thu, 29 May 2025 02:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748486639; cv=fail; b=PrOhkKG/3vmS+tGTLy5uATBNzwrUUY5X1qDU9UvTgO/2fOaG+HCNQpCumIO5wCJ0eMxDYZuF0pGxYdu05u0kaiAn0DoqMORfa55NAz3SU9cJeaPHexihG/kflosz9wojJewAclQYpxDGs4/AB0sWtx9l8ThFAE41Du3FlQ8iXi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748486639; c=relaxed/simple;
	bh=TpFTIxf90d+LE2hSkJHaTrjN0UPFHxK48UOBa8DjTPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nLOpniynAb2uEih1pFrhkqAjPw1Soay3IW2bKal9HttZRLgfgDY/CqC87E2RB1VAdPHf9UrxzH7qAlLPiLJfvp6pOKv0MuKSoWFSxX/TX8isJWq4IcAxuLSXS0EGtrVJsoheLp33OO4WYNSZijZvHl1mQRKyx+/7Sv4T2Lwugw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D08zh8yd; arc=fail smtp.client-ip=52.101.71.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D08zh8yd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMXPgYiVfAmbtD7VFjREkoCrbHgW4KqHEB0BziRQ9NVwxtJBJySJPMHfWbQjNbg2XLHqFjGHDRsRTObADVf73v85pm/qN20ygucPYjZ4NEp61o9HF+4f/SYX1/uTZIbFOfXKUH7Z6yEF7r2rBLq6Fl7iI9OM1jJ6f/gCY6OFZ3T+k1zg5Hi5HRbzHLO4xKx+peZXWYoqMV2J3sGs2c4QqCXAuPe6fgJJ2suj3kw2iAqjRcqKdLqnRvmisMZgQvCAN3hMmYwhtaK9yBLEu8FE3dBDiWs9bwkAT96NrL5I9Kb5J+tERjMog3WK7xjREEmHHaIEtsU7QUtXSnZuxcGVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTl2zzKEZEIa9LupzpMGMjFQ76YYg/rtCebDmGRw2lU=;
 b=HVU6aX92IRT8mP/+WztoWLZF52iu9M5Lj9Si7xnmsXi1Boe71Lif8X0QFcSfukh6DtsokgCqcNWEluV4fGKpAPduZJvn6YeOvTg3+FwR3Z+R5QpPqB62reWeRL4zzoOF/8NYUxENz7sbeUfe1bfrR2YYwfG9yO1UZZubgyklhMrwtB2dRhKS8iw7Zlux61AWuTqlaw1Ggf7TkYJsYId6g77uSnRLUZv+0g/XMPOxXaQgemRjwCbGfxa/JT2oefYSafgW9mdl8+BqCb5wxJdvTYuTVMbTaCVHhusJnU0iCrTMcqGkEvq7ukQyfbxN0VrulRbmv3uarFhXaKKLPDBpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTl2zzKEZEIa9LupzpMGMjFQ76YYg/rtCebDmGRw2lU=;
 b=D08zh8yd1o0WslxA7Il9a6aXS9kcNhZBml7LAHvdj7OnE1gbqWxjHUSy1BUifDeqgvlFvTsjZ8D6U7sZVGQ3GxMBzYuzbhYZauMjLCXmLN/hu3YMiEbxtZDLvoENPIzs9U6ocuJnIMAa7P8t27u+SLED0tocJ700YEyCcWIMwVfbNldr6EHmy2qxfeoP+PpcSklZNmW5gGbbRmEing+bpR/178kttgz3tpv0Nbw5Z0idkH1d1jg9o6dYLQqhmxTNcVfYVL93WMH5uE+nFR0qy6+XkkN3gHu4USdrfh7S1W8cBBRR0eYgkbJipMal1biuc8lpbxy+jthztNoAApvB/g==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7567.eurprd04.prod.outlook.com (2603:10a6:102:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 02:43:54 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 02:43:54 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: imx95: add SMMU support for NETC
Thread-Topic: [PATCH 3/3] arm64: dts: imx95: add SMMU support for NETC
Thread-Index: AQHbz64pIjTJw74aN0mAPdVJ1SXq+LPoJbIAgADBOrA=
Date: Thu, 29 May 2025 02:43:54 +0000
Message-ID:
 <PAXPR04MB85107963A54F916FFACAE7B28866A@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
 <20250528083433.3861625-4-wei.fang@nxp.com>
 <aDcnMnAJO+YVQ6rJ@lizhi-Precision-Tower-5810>
In-Reply-To: <aDcnMnAJO+YVQ6rJ@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PA4PR04MB7567:EE_
x-ms-office365-filtering-correlation-id: f7e4da31-fece-4f22-afdd-08dd9e5aa718
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gCDhofnWZ9k7M+ATw0hvD0m6uE0nbS/pVnSa8xPd2g7fYdXS4uZdatsQGz5Y?=
 =?us-ascii?Q?baqJvlbSrQAPGVrsbFvOIZdjk+d/O3oURTstDIu3qENF1LmoJ+yrBX+3NIK+?=
 =?us-ascii?Q?izx5voaYeG8L7dzll0UcIAMkzfX0GZFxwGGfCLGqq1ajLmQ9DZXfXQelqR+p?=
 =?us-ascii?Q?yCtNhKeyIvx0qsYHAKlCrq0tYn+Ygh6O9A3i8IeAFp+InzcinPlPAhtFIgTz?=
 =?us-ascii?Q?KCBsC7uxe9q5BMLtNc+hV7Q2EAIhUnvTHdCRNxqGMz0JCcvByjVrmHQIkx76?=
 =?us-ascii?Q?zbQ8/FJ4K5eLF257bHmMeib3YNgOXJbRE1ZrQv9TFUtg5fWl7BZdQZeY+/MY?=
 =?us-ascii?Q?mqmyFeuHoOhVgdMjbwGlCOJvsnK9DERUEmw8OFDCYAC5XoHdDN8ZErNYomsY?=
 =?us-ascii?Q?g3mVuhHyE4qeLmrQmnm+T91a6iV2TWvkORaIsHgM7dgkR+3abRayjD7Y9/Se?=
 =?us-ascii?Q?8zzWjeJCCWfp1dpTNjICU3ZltdtlM1cuuSu4ytmg1QufPGNRGgQXLXl47eWp?=
 =?us-ascii?Q?7j9HUNFbaAPBq18xc/IEQAbA8COnG+oz7HJdziAdUpl1WZHSGjP4nARqK361?=
 =?us-ascii?Q?BpCX2krr1WfG7OW+J67rXjavqyUHaNPDlgesLgr8dQUZGMwNW1TqkR7ftguJ?=
 =?us-ascii?Q?nSYXJDtka/e3cogBva6v05sQUxAMNXIRsyBWMI3fzcOh6+gJjOI7p6T7iDuc?=
 =?us-ascii?Q?VRKmjg+A3190yod10zTMqukT9RRcmBe+7LjiROe8PQs8flV1kc5U6/nPE3u7?=
 =?us-ascii?Q?Xyx2DE1bTc8zraq8oUp7nktI5vTnfDQtfrd4F/MIOGhJpZGKP0Rd3qCFANxS?=
 =?us-ascii?Q?oejZsJPWc5kxKLl1ptSvWFc0MwCkIR+/h166XI4lbOXbOEgflbIXnXl8uVe/?=
 =?us-ascii?Q?K2ikFuzFzoH10rEnJAvAkdJKUlqKeftyAfvu76HVmoPZnP+XWiTv+3ROBAgP?=
 =?us-ascii?Q?GqeM0D9lm6vIIhbFwliIXI5f33i3922xZYLQw5l6DxtDahrGUe4SV7c3bxRy?=
 =?us-ascii?Q?Yx2cahCrxpNr6hubKdu8HDnBoh9d68K4FJ9VcWLK/PIGlAWsiAtBH+krX+lG?=
 =?us-ascii?Q?KcyQ1clIhV7VrqUT/M2PGuMKNEutV1rhsD3BKPAoAZalMYscCkvLZ0cbejZs?=
 =?us-ascii?Q?gL2MWHQuD3Na/n0xoKSxhAGVEe5AmTExQAfAwSdZnl6Mq6dSu92VfDDAoHtQ?=
 =?us-ascii?Q?JSmqoX0HnI27pfok2oA0iw6Qn5fNq2MwixolQOx7w9z5+uYiu9Xr5PT0M0gX?=
 =?us-ascii?Q?6nUxZfItdqEtOEiCGtcKecAPHnSzhJPanBPSytlGDVEbmLhnq1fJ6ApJtcjw?=
 =?us-ascii?Q?socnMgAEjo1F9CwFoZDL41Q/m5+H5wZhfiKCyQEBA1fV3lp8UUHfr+xhdRLU?=
 =?us-ascii?Q?WnH7FQGraEonGatTxSgeDxuQd4npllDjNsX2hOAwvMnq4u1aIs8Sa9lvqMRh?=
 =?us-ascii?Q?raSBwYVWhtn+oR3qGWWKBeJcJMx0a8Xl5kPA2vjumB1p4hAImVmtRQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?677JqMEJMIdIvdewJMaITP63Wa4pwgJkZkHKdiVMFwRU/QHaM5fwZuwl+1Dz?=
 =?us-ascii?Q?Grf522vXSKw4qlNU5ljctL3Y/ibINgSdzvRtF5o50nKjRDxxNVGmfCvQ+2yW?=
 =?us-ascii?Q?uZBufFG+VtE5Ex8w0y0jM3JNkJSg5VxGXDk97a1jyNGHa31cIW4wBm7gZng6?=
 =?us-ascii?Q?7ikWuWKcevqXiNeYBr3ofqDbPrmvSmad9kg87mgKLQkkKzxy/oU5O7L5ERnE?=
 =?us-ascii?Q?LD4O2SZAH50zT/+fCvoB1eIDbtTc9B+9/G6YB+mtJWPQg/M4NpquaRoovkG4?=
 =?us-ascii?Q?LqyneKTs7G4r8GW1eho2t2bKc8FE8RcXaBdbKbQpiIJ0lLzctEEHrsLl7jOZ?=
 =?us-ascii?Q?E0UxQR2qBKRUOBw8sgP5XqJtt+aXErsYxUTqxf21hWuHLfzyp6NZZVFQ0X8q?=
 =?us-ascii?Q?IMtrBdhhTnAKgTcPuCkcm4BGIKn5lI3//73PfkQ1vhFK+znPU/Izrlcty6aA?=
 =?us-ascii?Q?QbI80MDtmbqmtItgk87LN6we05uqP1BpfebYIsOlWJnwIq9T0jN71Jx1tw5l?=
 =?us-ascii?Q?D6yHFW6LbWW8ziv5pRHiA9jjHKvSXPZ7vBttXbfKEggn/2sbBmjUUps3lXTu?=
 =?us-ascii?Q?y2VBexQGNIjO9wYkoqGhdRxUgCAC3xKFYA2rc14S8+AYqpw3haPCrPBprNcU?=
 =?us-ascii?Q?mhqiVXV/3gX3VTG4g1hAu8OArTxvUaQ2vVGqaVQq4dKnjpsvz61vKu274Ta4?=
 =?us-ascii?Q?S3YruqWly1wnukziBKX4HMCTF2gsnm0fqT8efiBIr/v8l/VL74GihDyBogEk?=
 =?us-ascii?Q?vSGNTsgq279suWEPjO42CTIic+xiWMU5ny3qp5xrPphVs2EELYe/ecODbJET?=
 =?us-ascii?Q?PB29+yvQog41gGV4uFbjYd4ggTF7fyltXJQAnRWc+zdnNtBYtpxf+84WBA/G?=
 =?us-ascii?Q?lA3Y9aXyK6Mj9zDx3xfcEEtbQtYXSCdPGl1KzQYs19x3hygFXg/2dpcMtcaO?=
 =?us-ascii?Q?BRNzoaPu920IV3Gr613uLs8FaJpj3S2MWA2HIuO6Zm5nCow4zMh1h28Amgx5?=
 =?us-ascii?Q?o9cFhzCfOTpDILoMhTwT6198r5CMZWqUI3CLYNQt43SS3jnaMyGcZosN3/mz?=
 =?us-ascii?Q?gD1Hr52UkZ5/h/hIQ5sDxMGwWwY4SZMyX1qtq5D9bIN/MSRy7IAS81oa2Dom?=
 =?us-ascii?Q?ICXn8mqsjjNpE5Uc60/ujbKC3jyYym7nfGk7CVTYMV66VqtxzERy0uCJJ9GG?=
 =?us-ascii?Q?35/MZ7gJ53ZeQxGJHu0LIMxKdue+CLlLzF5XWIS+L7dFTkEXTO7q8qNM77ME?=
 =?us-ascii?Q?/kT0DmzYQQ7PTF6LKIETf5S3LBcFu4aCoCDLxkJ1f8Kwx19Remz+CjFqgQtT?=
 =?us-ascii?Q?bsYTAnQ5pPPnCU0YL6ARXYPUMfLG0b0HSOyeMgjY5VqeEeSRcKf0ndsE8CAO?=
 =?us-ascii?Q?U0hDAiaXJRoPBQtt/n2WeyQCteaqRwigj/Wb6jP/7L1O191qyo3M5p2E/cIL?=
 =?us-ascii?Q?XbKfIsP4vQbNCtMtPnDu6cTgppzxZVeEWbHNNJvWlOhIxT1DWFH0hWBTUL6L?=
 =?us-ascii?Q?/XLHndvYOim1kFry2ExIG/xjzVH5qS1h2JVFc5I0mk1sXjzjr2/M9Ez2f8QA?=
 =?us-ascii?Q?oDFbpgU5UTb4E65V25M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e4da31-fece-4f22-afdd-08dd9e5aa718
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 02:43:54.3903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d66fYRePMj8IKL1tGKQE97CAcXeEEucZ0npus+2V9hU3YjqbksTLollb+hHTl/qsKoYufSlgHD/zSoY8L4tShQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7567

> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > index 9f4d0899a94d..e9a5fb36f5d0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > @@ -494,6 +494,14 @@ &netc_bus0 {
> >  		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
> >  		  <0x80 &its 0x64 0x1>, //ENETC2 PF
> >  		  <0xc0 &its 0x67 0x1>;
> > +	iommu-map =3D <0x0 &smmu 0x20 0x1>,
> > +		    <0x10 &smmu 0x21 0x1>,
> > +		    <0x20 &smmu 0x22 0x1>,
> > +		    <0x40 &smmu 0x23 0x1>,
> > +		    <0x50 &smmu 0x25 0x1>,
> > +		    <0x60 &smmu 0x26 0x1>,
> > +		    <0x80 &smmu 0x24 0x1>,
> > +		    <0xc0 &smmu 0x27 0x1>;
>=20
> Do you need iommu-map-mask to mask bus id in case difference probe order
> with pcie node?
>=20
No, the bus id is fixed for NETC devices.

