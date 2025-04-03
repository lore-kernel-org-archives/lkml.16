Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2100.outbound.protection.outlook.com [40.107.20.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456724113A;
	Thu,  3 Apr 2025 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666273; cv=fail; b=mMQ1RCsFLJ/UinKGCeGzN5jAWa4yEseT+fkPfx10g8NNJ0QeMQaSPx594v2E9W2ZKyLFnJRLDgccZKRfiJguOBHUC5ysEtlmQd469Ukatube6jrPy6ExEMPwxgYRlbsVeS0A9gi3/Z9uea9duXWpb9m7yuY5pvlYqGbyaeYfDuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666273; c=relaxed/simple;
	bh=LwsrLlAhRDQ5YZ+tjBp/R017iRGB0b9WA6nJkp/HisU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o0fjTNmpovrlNwkKfRK7D/ANCGeWqjcqKCayWG4MkeankVYmf4qyP87ZtRs8hnul2nX7Tw9/nGc4M0X6VwIjPBDxzz2EENLCMomQfO8gJBnoijwbLLWu3kPjVe0dca1Liv1EMBotacok7NQiDPUGr/WgnyguRTxKWqqXQ0YDBek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=3smLrryM; arc=fail smtp.client-ip=40.107.20.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="3smLrryM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdKYKjnDyfwYFTXcOid86GdSg9JmxEj+cIu5NE6DkQKFOsa7eb6x30lSg/WkERsHBMPM5ME6dHI914YBUytVYQG2lzrKwlfslwVRU7rtULCQW8Tacs9dO/bfiqcK9UReVObmqmPA+JaNzieLZknLDwgBrwJgHaXtC9sQzz9FV1O04Q6LT+t/YxWg1JL2YGMT9Ee38/SVHNUrZiyM/VqZqrkln4TXAEsTlhouH9quRRdX3vt+HE7n5uUM5l1BYeZwiEsUUQf2cIJ1Ktt9sTmG39aF8Yg/eYtt12llEKqicnLMMQrFr6pGbZ9oixXgu60JCf2jLuH/YuUOMvCfMJ4HEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZlYx0W8gkZb6s1gYQiebyLRGJIRpFW1fQOhsWi6Dos=;
 b=cyRH7iP0N1SWQx5N54syZfn9NAypfUqE/Jnj8zNqfmIomUnwSO1TqsJTAzHYXjM332mtMstsj9yyIYoVLLkcbUezS0fzSLOi4rhFyuoQwJUYxASPODCabnBnBvrxWoGMZIUBUc0Bi7cOjrWPeFmxiq2L2c+j4nENIpFw/RxaVva3HWEpAghoxIVG0yqg35tOMj0CPlngOKXMTkMvTg3nbMpwtc/kwFL9AbuDmt1/oAsaqHen8Tht5nbrIh8XCrW+aPpjJcMOwpFklbMiDFPDQxe5LhLFhYJTCQPNh2RsopxVXYItqWE3nG2XvAjk1AuV/vduQRjSRJ5b5ziibZ81NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZlYx0W8gkZb6s1gYQiebyLRGJIRpFW1fQOhsWi6Dos=;
 b=3smLrryMul09sU8GFx8KXGALaXngBcL7WojQYtA/aFHZtwKeKEaFhuU0Ki9+GXz0iJAcxafgVF1dHhPAFMXCskdnJzPBBu0oLjxTe+b0VIuEBh8uXt96Fj5DDrYeNlrAnUE2UmZWyvZax4QeUjQj8YCdMKpBuQMDhln34b776Zyg9gw+WoBICgnsV8nPKWab/W/WJmx56OzXXQp6vzQdlTUj6Rt38dCJKCfxhdPmGKLO7WPo9kBURt/ZFYcwkia7Xv4ApB195M4tqLuwaulTEJg1gRnto5dGYD8JwXIgF/SmJst9qrkWU1/WCBeI6jatOMSO2o0avgfWNe50gFF+EQ==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PAWPR04MB9957.eurprd04.prod.outlook.com (2603:10a6:102:385::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 07:44:24 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:44:24 +0000
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
Subject: Re: [PATCH v4 7/9] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Thread-Topic: [PATCH v4 7/9] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Thread-Index: AQHbpAZaa4NkM9QFiE+EIkpF0ZTSSrORkB5o
Date: Thu, 3 Apr 2025 07:44:24 +0000
Message-ID:
 <PA4PR04MB7630AC77144FD2D9995D70D1C5AE2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-7-9f898838a864@gocontroll.com>
 <Z+2RZGGkhkxMOEQI@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+2RZGGkhkxMOEQI@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|PAWPR04MB9957:EE_
x-ms-office365-filtering-correlation-id: fc7b617f-a860-42de-e79d-08dd72835ae1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5t4CYCs2LSTp5I/uBPGr3j63BahAubrDlIY+XMO9bpEjbgP+mTGvSLwy6T?=
 =?iso-8859-1?Q?9XhaG6ElGADJHvKGckTKCEKwBWNqNzQSc6QRPsh6fklG4/yOSmRJo8xAOb?=
 =?iso-8859-1?Q?p5OlL7JDk2hsDdQIeks+HgpPdTNRjbpsRFV+eHbdTJvMZzi4zcdHBer+1A?=
 =?iso-8859-1?Q?rSK8yt7mKBfRnB6Vgc1qJRdTwbtW2gLcwK+yNi8EQ3M3ZS8ZUNmoGSEOTT?=
 =?iso-8859-1?Q?aZci2QzArOW+q6RXCUed1zosz+SYcd5iEZcxss9f71fsXUZsRCRE0SSF0E?=
 =?iso-8859-1?Q?JPrLPu9TJeNV2eaVeh1wlFI8HAmwGXaLPozWF7k1fOq2I0B0xHQhAkQrvw?=
 =?iso-8859-1?Q?ziFOXHAfDEkSEL0vGPqVTEyTpGRFxYelpV/Se/X1qP+kwWqlgGNFLMI6MO?=
 =?iso-8859-1?Q?D3ybXp9zVRwITi0P3UwVD4Yo6jTThpFTgMLMX3ydTCXuIuaBWgd5QrbLQl?=
 =?iso-8859-1?Q?UEifZK5fOmKIHzGi29npJtgtqHzHHhqNIQrcF+KTnSVYOrOoWLKvLsyNmr?=
 =?iso-8859-1?Q?vhbHpjYSUQz4ICIsVF9fj0huNUbpHcMcvWfbTY4zDvYhyPomDwrDSD5zYE?=
 =?iso-8859-1?Q?ZULEf8O+QmlT+lDacah+S5+fynilxI6265MLFjYaayRJ0NZhWMYDRQRWNl?=
 =?iso-8859-1?Q?qAo/U0r1+PbH8W7hEsPP3oNnBailemfFdWW5sit4GdCT7lkvmLbLrP3egh?=
 =?iso-8859-1?Q?Pj+RontagSb3vVWvDBoe6cbJmot57gUXrHFaeerqUPzt7dJpKF1pHDG5By?=
 =?iso-8859-1?Q?wpieCrCiLura1ucVL6HSgzB3lqSvutUDzh7mugTIK9YygNS8vbV8hh+n+/?=
 =?iso-8859-1?Q?tPb+TpLvBsVDgRIsY/bqYgH4KtUOqS4W5/NX01+PVHmz2knY7EzbWmKV/0?=
 =?iso-8859-1?Q?mSFUU8i2G7jmLjKXgHYmvu3kfOUc0HHxFbtriGnjnY16cBBwwn9ESC1k+r?=
 =?iso-8859-1?Q?T3vn7erSwHc+cz5BoiWWm0StutM/C1HUS2E9tPbEhZAqZoj0qI4IeVs+ry?=
 =?iso-8859-1?Q?7d2xDU/nCSopqXLXQ0uOVtduyUH6Z0Uj9yF+4TrwhZS976K0W88Tvg20eo?=
 =?iso-8859-1?Q?pOVKMI64QIMaUi48GrWDjr3ePW2r+SI3ddePjyrAX8q5INsnX3MGmUAbTs?=
 =?iso-8859-1?Q?IXBhaDcW2kFvUFT8hsOhoKyesBBylbxIYg7Zahbqon45IQdcHCse8Gt7n4?=
 =?iso-8859-1?Q?VQJfAzkPpzL+Jlek1vBEywlUja7f10PJpYF1L8tloVeRrvTbs1xUDOYYHF?=
 =?iso-8859-1?Q?5TTEtvQwvIBOndAbILeht1VQu2MGb90g1r0xM5xRTB0EryxAhvRueG2Adk?=
 =?iso-8859-1?Q?Oj9NYg6Fv0J0Z6LhH1CKqIGa5cLW4zKUQQkPqCFGskoJGMjbvcNBASU8T8?=
 =?iso-8859-1?Q?ze+2ZdeG44igvG3x80T7TheT5lrHLObmDxoQmReJGrwpiQozLovYPXuSG9?=
 =?iso-8859-1?Q?hzRzYgUbAkmACy/zKTMMeoOWfte/dWx9CrlQYnz3yecIT3U1Qit0dUGvwB?=
 =?iso-8859-1?Q?NPpD8EirKU6hcuJhGgDwzBI6c4p8WWgQ3vNiCl9NePig=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YPM0UaAnQoTk/9UDRCzi/pRPqfn+4iDtMfOzL375NC1Gbuq1o1laNpr5mC?=
 =?iso-8859-1?Q?KXw6b94mx8IwDTuPa5IGYmSf1JUp+ZhM3XFqUaIsExLrQQp4EO/HN060B/?=
 =?iso-8859-1?Q?x5ueFlyi7yRRxKk+WrSiaAxu47Xf1hZAuMEbidA9vxy9zWQF3Rc7vcILDA?=
 =?iso-8859-1?Q?Ma8XnKVNQr4s04kV/LYIjSpWgBqIhTLsb4Qr3G45hPahBJREXnvQfh4P6s?=
 =?iso-8859-1?Q?C0YHDqglUurFYE7qSoIkFA4tSUlWmYc5KkMGSgsqXt63WSKwp5HltFNMXp?=
 =?iso-8859-1?Q?K66PJXGLEFcD3Xq2/MAlnierejE2OnEZhJfQ6kSMTsQCYdwNSVGpX8rNyQ?=
 =?iso-8859-1?Q?oJ3lNi2cWq3bQDkOWNnvlpDDEtN5LrXYOcumG6o9QvlSv55Y9eg4Xqg5j4?=
 =?iso-8859-1?Q?jnXgi1Tdt/TK5GFNkKat5cd2JC0PLGksZ0NButKsYN+uqfaY46OJO7DSFK?=
 =?iso-8859-1?Q?yDmxhAbtXaJp7NfrtU8tOFiGJY/XfBfOTW7cS4hcyY1s2dEZOPAsPrq5QM?=
 =?iso-8859-1?Q?kFFwdkAh7hlV8GnfC4nxjb0DtZNVX0mMlWd+6ladaYF3TPAf0PFgcraw6h?=
 =?iso-8859-1?Q?LVRx4hObg9jJA14mbgrSwOOlrmT6iOZWQtxlzyP0m7KxABC4aT4251yv2h?=
 =?iso-8859-1?Q?j95rFLMxAhuOKgZ6hGLtdALR/nKzyyK8gelpNH33kL+vnP7SBle+qYLvLZ?=
 =?iso-8859-1?Q?av3JK3aHgA0r/T+f3w40iZtR6IvEwQ9GLs2MzLBvAYZrCiv5IbIVcfgUn2?=
 =?iso-8859-1?Q?+yIjIZOT2h46/GOBpuUDf7RujPkgWuuTwgFq1KezVvTTWWz+bM6Tk1QHNT?=
 =?iso-8859-1?Q?HMxuq+05oeqKvm+Jm5AwfFlAk74DyP4afjv7ET9HHQX10YffVXgZHW8s/z?=
 =?iso-8859-1?Q?kG1wJnB8RAm3zpQVT+gLZcNx0q2cSprQ7AbuNnExyvq4R6ttuEme9fYBDy?=
 =?iso-8859-1?Q?9GarLSUihnITnpFH6uzIFecUCj1SiKJ7oBXENTtDPsXoQvGFD1DfebikH8?=
 =?iso-8859-1?Q?BnHLcDHreAwrbil4we8UXPiFNEbGxy7ydYOa0hsiDgaLH0Lo0/opEsnZm3?=
 =?iso-8859-1?Q?0Q+VhHO9FYf+2WH3TliXNUGnLvOnbVam3XLfjR59sgFuS7us4ZNmamY6sY?=
 =?iso-8859-1?Q?noI/peUm4m7mLmnk85P4xKI1OL5iGP+OLxzG6dnX0iDhj1DtAkzYYYXwfX?=
 =?iso-8859-1?Q?77+PN5ln7JJyIdHGtVQkqgiTlkT8UOyqLXRGs0YiNntBymiGQJ97vAasIq?=
 =?iso-8859-1?Q?XO+IshvZRwzcx2o8JpBgUE4W9Ez7DHzGdmE4Q7xDHpB1oeJMXaUcCOkbqq?=
 =?iso-8859-1?Q?QKdBSBf5XvR6vjG1BdXk6Am88UCP2JvUb59h0WrfFLMMlW0JofGnMKTfYk?=
 =?iso-8859-1?Q?CPzEvs5EIS5eHHOO4tSLDmEIKjsdoGqkGBbJtB5PeQW3aG8cUk+sD84+zs?=
 =?iso-8859-1?Q?7V/TYhfhrFiZxYme+S2MLNtjLIQAqbwL0o46ZrXJEOWWGVLUp/KJ9JHaXW?=
 =?iso-8859-1?Q?zDsUegIoXZpFDSofFmAsPE/sG7AjCgGY+8aGeO5NZi3GDOdTxO4rehi+/u?=
 =?iso-8859-1?Q?M8DCYdlz/msiPUhEMMF4GIlUpE+0mi/CAFhxH6EAaT89TPHzjSl+vBsgqT?=
 =?iso-8859-1?Q?JSZITP/8izLnjMv7HJUDmYU3LgJIrO05YMNqlJIwQpA8Grq1KlGS1gVxYB?=
 =?iso-8859-1?Q?/g/IWxM9fes7TwHDm4a6nnkUCQosi4hFcHuT0UssJXfDXiWE3Vnvu4gv1t?=
 =?iso-8859-1?Q?Z8RQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7b617f-a860-42de-e79d-08dd72835ae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 07:44:24.7295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0IOczRktKV+/sgdq19sraBxqOD7StuwjhAc9n6R9Nawo0HlJVDvE6MlEGoCBVWkdOlsPGE/hHBQZ9WjgncKAxWWCtFEU1YgoEVK8C9fn0z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9957

On 4/2/25 21:35, Frank Li wrote:=0A=
> On Wed, Apr 02, 2025 at 09:07:10AM +0200, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant=
=0A=
>> comes with a 10.1 1280x720 display with a touchscreen (not working in=0A=
>> mainline).=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> ---=0A=
>> Currently the backlight driver is not available, this will be upstreamed=
=0A=
>> in a future patch series. It is a Maxim max25014atg.=0A=
>>=0A=
>> The touchscreen has a Cypress CYAT81658-64AS48 controller which as far a=
s=0A=
>> I know is not supported upstream, the driver we currently use for this i=
s=0A=
>> a mess and I doubt we will be able to get it in an upstreamable state.=
=0A=
>> ---=0A=
>>   ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 102 +++++++++++++=
++++++++=0A=
>>   1 file changed, 102 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-dis=
play-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81=
-moduline-display-106-av101hdt-a10.dtso=0A=
>> new file mode 100644=0A=
>> index 0000000000000000000000000000000000000000..2855d7090988380ca0d4df84=
59cd1a67049f1080=0A=
>> --- /dev/null=0A=
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-10=
6-av101hdt-a10.dtso=0A=
>> @@ -0,0 +1,102 @@=0A=
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)=0A=
>> +/*=0A=
>> + * Copyright 2025 GOcontroll B.V.=0A=
>> + * Author: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> + */=0A=
>> +=0A=
>> +#include <dt-bindings/clock/imx8mp-clock.h>=0A=
>> +#include <dt-bindings/gpio/gpio.h>=0A=
>> +=0A=
>> +#include "imx8mp-pinfunc.h"=0A=
>> +=0A=
>> +/dts-v1/;=0A=
>> +/plugin/;=0A=
>> +=0A=
>> +/ {=0A=
>> +	model =3D "GOcontroll Moduline Display with BOE av101hdt-a10 display";=
=0A=
>> +=0A=
>> +	panel {=0A=
>> +		compatible =3D "boe,av101hdt-a10";=0A=
>> +		enable-gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;=0A=
>> +		pinctrl-0 =3D <&pinctrl_panel>;=0A=
>> +		pinctrl-names =3D "default";=0A=
>> +		power-supply =3D <&reg_3v3_per>;=0A=
>> +		reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;=0A=
>> +=0A=
>> +		port {=0A=
>> +			panel_lvds_in: endpoint {=0A=
>> +				remote-endpoint =3D <&ldb_lvds_ch0>;=0A=
>> +			};=0A=
>> +		};=0A=
>> +	};=0A=
>> +=0A=
>> +	reg_vbus: regulator-vbus {=0A=
>> +		compatible =3D "regulator-fixed";=0A=
>> +		power-supply =3D <&reg_6v4>;=0A=
>> +		regulator-always-on;=0A=
>> +		regulator-max-microvolt =3D <5000000>;=0A=
>> +		regulator-min-microvolt =3D <5000000>;=0A=
>> +		regulator-name =3D "usb-c-vbus";=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&iomuxc {=0A=
>> +	pinctrl_panel: panelgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07=0A=
>> +			MX8MP_DSE_X1=0A=
>> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09=0A=
>> +			MX8MP_DSE_X1=0A=
>> +		>;=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&lcdif2 {=0A=
>> +	status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&lvds_bridge {=0A=
>> +	assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PL=
L1>;=0A=
>> +	/* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */=0A=
>> +	assigned-clock-rates =3D <0>, <1054620000>;=0A=
>> +	status =3D "okay";=0A=
>> +=0A=
>> +	ports {=0A=
>> +		port@1 {=0A=
>> +			ldb_lvds_ch0: endpoint {=0A=
>> +				remote-endpoint =3D <&panel_lvds_in>;=0A=
>> +			};=0A=
>> +		};=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&usb3_1 {=0A=
>> +	status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&usb3_phy1 {=0A=
>> +	status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&usb_dwc3_1 {=0A=
>> +	dr_mode =3D "host";=0A=
>> +=0A=
>> +	connector {=0A=
>> +		compatible =3D "usb-c-connector";=0A=
>> +		data-role =3D "host";=0A=
>> +		pd-disable;=0A=
>> +		vbus-supply =3D <&reg_vbus>;=0A=
>> +=0A=
>> +		port {=0A=
>> +			high_speed_ep: endpoint {=0A=
>> +				remote-endpoint =3D <&usb1_hs_ep>;=0A=
>> +			};=0A=
>> +		};=0A=
>> +	};=0A=
>> +=0A=
>> +	port {=0A=
>> +		usb1_hs_ep: endpoint {=0A=
>> +			remote-endpoint =3D <&high_speed_ep>;=0A=
>> +		};=0A=
>> +	};=0A=
>> +};=0A=
> =0A=
> why need enable usb3 in overlay file, I suppose it should be already enab=
led=0A=
> at base dtb file.=0A=
=0A=
It seems useless to me to enable the usb when the av123z7m-n17 board is=0A=
attached as it doesn't use it, but I guess it would make sense to put=0A=
the usb/phy in the mainboard and keep only the connector/dwc in this=0A=
overlay.=0A=
=0A=
> Frank=0A=
>>=0A=
>> --=0A=
>> 2.49.0=0A=
>>=0A=
>>=0A=
-- =0A=
Met vriendelijke groeten/with kind regards,=0A=
Maud Spierings=
