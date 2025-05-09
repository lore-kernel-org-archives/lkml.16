Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2105.outbound.protection.outlook.com [40.107.20.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C832686A9;
	Fri,  9 May 2025 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780166; cv=fail; b=GWjvAUgxFRfp85MfTBvfYh5Z3Wku08pHMWDjhKsCvvryS+3009MIyIsVEhGZgdJG6j3A42Gczg1HTsqJD3AAKkkbUgnfau1kPY3mvARax+RHM+N+ZM6F1G7eKcoiW7ATI0Xj/PyDY3SlByHIu3nHickrgkGGo5fVKP3Yss341Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780166; c=relaxed/simple;
	bh=evTySsX2HzRAzPr+Ejj5HWAf0PYHGqSplnN5lK4uqPQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sbAKxrBaPJi6mdzk4NsXOnMAmk+LI+vSwz8k5/uBzeGB+RgO1ftegXK8Co2tXOkvO7/vv+TNkdEQcPwQ9JDUmFRiokPE3BJJ9zf6UjWUpOuJ55ajE3SoDMt6RiCEENdsOghJg2KJDxjMPwWf7dQnjytMZOFzCURbgjFykUdtVqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=7UnEIFpV; arc=fail smtp.client-ip=40.107.20.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="7UnEIFpV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfe9ddHsBoJuxtRw+hutlBqaiD3C+OyNBfqZVsomRZNgTQMoSDK29wA92PRA0PhGeVmVITdEVT5CNUZLbGzX7k8l7/8gwvcSpQb53Wp257F9kYp3whMmSn1BJtU6fPVFL8BJg0kojGVfiMWQeosLkcletIoDWKev1+n2lGB31Kss7iz49dBAUJLe8y/OiakDECwXPuCA8JC80UcZ9mtbXUQ5Bn3/Pbxn/Snd0bD9APnQCeGVhDw+tZAk6IC8hp0E/Ffd0ej3/Dr4DRm+uhj62pckILiaTZu5wwq5b3FdEPTqMtGe9wkBaNvALYBCLyGO4mHMgup+TpV9ScBz4zkTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q7c9Px9tsVhPbAPGwJZ00WuUGuQYBNDnGpzGOtxOus=;
 b=pOFH+dNEQSG+55I5bx9tc0CbwsTTd7QB41oaB7gkD/vttPFMT8jx2+Lqa+pjKNa2TsnNOvL/kiSPIYY9beQAByjLfgkajfoUfHKyqQBQvWDyXTHPNC6Rwctwgc+jWEhc6fcJzNZyzhP1x1FxsHcphUXHlRcp1H+SPEpRyP7hIe49NWNIMmYvAqFCfKjAnT56JTTXa9ap0y2ZIgESOyOKihDPljcHyIUOM2mvrZsqSYa2cdhEed9kRjgPlHGsVEuiPMTYWWo8qf5kdjD+QAmJ5lIdTx45Gm4BgJhBiTVZeZwrDMPYHKuGwz1r1pSNs4MwllGRI2p21bSER3J3maUgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q7c9Px9tsVhPbAPGwJZ00WuUGuQYBNDnGpzGOtxOus=;
 b=7UnEIFpVBafuJJy1gmYJIAchpOmBGZN7NqW9k+LdB/qG4QfJ71kAHn1VoDyJskSUUC6b25kF6zPGJvFJA7v581Jlj4k/SjlGYVlUZQzqJ5Wr33EbGXPaae0huaRSZx5ytpf6IqDB+BcURvMiTzwWwWZgpTrzVIKfFmczdaWiGF1T94+LrYZLj5yZPVDeu/fADpQtifWCbDOJ6UJ+3LF5kxqCuX1MxO1VVJt/liy76IXMwvyqgMZhyFT0T702ihhv44fIOtTeqCkB7yO5f+YPYhtVrcv3W4fihw8ZwpBmm6H1WMKhl4T5UzrN40Hp7h6HtCF6kzobLkpjpTzCwlEKKA==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 08:42:38 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 08:42:38 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Shawn Guo <shawnguo2@yeah.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Thread-Topic: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Thread-Index: AQHbr4F44tTPQq7J1kig5rAcrpD03rPKFpSAgAAGvFw=
Date: Fri, 9 May 2025 08:42:38 +0000
Message-ID:
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
In-Reply-To: <aB26FRq/Ets5fiRK@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|PR3PR04MB7291:EE_
x-ms-office365-filtering-correlation-id: f9fefe72-e70c-477a-9a88-08dd8ed573f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VENnwyiirUiHBIBwuT4SvNsSgwHcwz0lHtObAMHNSnjCyCgtrqqDlxB4M1?=
 =?iso-8859-1?Q?sDmYUDfglZPZfRATnaAagErYRaVWi88Utn4hy37y8VL0+IrIExQFQ/83u7?=
 =?iso-8859-1?Q?sVkZ9ByC0yudcHwBc3w2GRivexFi5VUwzaakZkzb8/DJIWNJT/u/4TEVmP?=
 =?iso-8859-1?Q?4bzJ+D6vTNsiPsJPlMGbphElqek3sXFIK1emX0UsAKyZn7rd/K3wBYgOwy?=
 =?iso-8859-1?Q?gG9zjOcGI11+HYp6zyT8voxaCGDdpTfDfkj7VRvhYqAor4wMrbiFOGykfc?=
 =?iso-8859-1?Q?A3hC0907LDUi/p40GJZdlt1wp2kwuyEhy9pdt/uIA+jsDqheAWoK5Vw7Ya?=
 =?iso-8859-1?Q?GxWSPEAAK7DULjU/vLBgKVr3K77bBiHIYdubzrfV7PsLHG+xQ/nXWxIe+X?=
 =?iso-8859-1?Q?c8+rFCEWJxKslfela0/yWwwLwoUGFqN2jOjYPCvFht0552unXpMJpwuBmx?=
 =?iso-8859-1?Q?4Z+878jI2PKiOFxqtE0dN2yBJnMRR4jNa1sI294ulzpBPoOVTd8fUjoG6M?=
 =?iso-8859-1?Q?7H9OPo69VqSbZ1XjDn35Za7mooYEphPjD3/nuJ6QnYBG3BSSK6zLOHzUcb?=
 =?iso-8859-1?Q?MAXMkJuZuXOJcZxv5C3jAW3kmOoTds80dMCSvAhSKWjM1jRGqHDmfBp7kI?=
 =?iso-8859-1?Q?Ic0Gy8cv3WfDQJG8vrvSZNzbINLyaaxQ4sd79irFFhJr5hB6eFarjCSgjS?=
 =?iso-8859-1?Q?OoYmlUtG0uhXgZ5yHNZ/oFYQ39qKmQx4JYGFaxUUpNOdRHtGVml1zqHOmx?=
 =?iso-8859-1?Q?uTGmNFTYGYt1I04q1emGIZULJlLa1wFDTGXCBWsRWONn9mohxnXIcvUpzH?=
 =?iso-8859-1?Q?2IQgQDYWMtwAIWO9D/SKjHpt95Icfxrzz7+rAIJMVhuQkGRTVc8hlqUBB2?=
 =?iso-8859-1?Q?+qZ1VJpyA2CxhYdQT9iSrkRuqBT1CgyyPS848pS1lE5h/N0pAeuieZYKwB?=
 =?iso-8859-1?Q?bcY64vbjoE/VKpc5Sus6Ca433pmKGPwDm8fawfNw1eU2HqrgFKhjw21ULf?=
 =?iso-8859-1?Q?/Q2m1nV2ZkYQVZKY/xeAPRCbw2x0Zn9vYyhg7/RllSI2M0hbdbqirOKVu/?=
 =?iso-8859-1?Q?Hded7pnqtMy2/Z6xh3WhILc+yJld9XNdFS+m88SzxMcfBfO/WQyX3IziEE?=
 =?iso-8859-1?Q?TciGaOSqUY3zY+3paXZ5MXw8Tn9CLgcnAigvyK8QO34hdnJSyJ69dq3iQI?=
 =?iso-8859-1?Q?tnWZdbzwJoAqwHjH9enGCpzjAgDdLeQ9pdQJ0xRqYv01MI1t9UMIjnbq9a?=
 =?iso-8859-1?Q?hHkt7g8WLqtT8fJ0rfhVt3+rvNzeCRGXBr82tqKDeLMRzu8DLFLBnJdcYO?=
 =?iso-8859-1?Q?iShTwoWXH0MCKMd/HO8bqcNh2BqMtIxpMHH1/Oov0/lAEsYCZWTbhYa0sz?=
 =?iso-8859-1?Q?1HQe7yWNixqBhDDAiWvY+X342sTkFNFePLdLgfBZLmEJ8aY+blhNF535gK?=
 =?iso-8859-1?Q?SGXhxHuNVPJK8VI/+B9hhzA11OX7XMMFB8CeQLewvyxX09Rr7Lwe1IizIY?=
 =?iso-8859-1?Q?Ma/xC8VOzg2KNKpYxKPF2n25m9z18zlqjBukolI9NPtA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c3xPwvb/wnizQwSMMS1FWIDPJH6m1XDylXWRvOl+xiKE5lYA+lBRgwwRih?=
 =?iso-8859-1?Q?RuniHl7pfRqbfmVWyKzB2+ONRopU+pEdKsKvh8kseLAK98+zUbpayjNdFA?=
 =?iso-8859-1?Q?f/tiAg9r6pUMV2MNRkiPX6/fKqoRhclz2uFVC5qK71qoHMRUkuVoTV/6Fs?=
 =?iso-8859-1?Q?bY1HFDSuIvUHxySBQNgu+aeHkse5YZ8jwou+KLA3CG9rfpIqTRRlWoLgak?=
 =?iso-8859-1?Q?sV0B07uG08+9rWirc/WLqWzB01Zs3dscnyIKVqUkBeWjMmfklJ4WXONJGi?=
 =?iso-8859-1?Q?SJoO/tV2P49dq0rO3/ceQisaB/drBL6E7q78si2SnAxO2CX3l8W2IaPyUH?=
 =?iso-8859-1?Q?pvCrRTIGRR/3a1p4Olpp3qHcTlhGOE5zteMByaIJ0ZvHY9HZ7YVJkPlVJT?=
 =?iso-8859-1?Q?8tBh8/KZ08g7JQJK+C977hxhrAj4BgS6XU4FXxJBTrPBEuFA0iPAnNoFlE?=
 =?iso-8859-1?Q?hjAnjvHWYfS70CeChWSNF+nbiEaj9OAcMz4isuvPufljv56jnlDt7uCGyh?=
 =?iso-8859-1?Q?AYSpfJbRHEI64Vj7nyTmenuYrvtQP8xfJo0nSQbOTrCn0m+unaEX9Eab8T?=
 =?iso-8859-1?Q?JcnMQdLbaVlbTjGvs1yeTw7sdTku7B45y+kCABaXbeHfKEdXDI4GpSfBZX?=
 =?iso-8859-1?Q?ksz8tr0kNCsBWVz0a4oRm/cQZEqPTodGyOZ4Mbz+Yv43BNctGrzieQOuVH?=
 =?iso-8859-1?Q?j1IW32Z09bjuAaTgtxGp+OKf6Wpougo3wrkpsPlSCmjY1OX3Vz4PQHF2Rv?=
 =?iso-8859-1?Q?vtRTxI5jAc0RbccdJtB7XrxP3jwcvmWi39nHzhGJbPaaljr9MqTyHUFnMe?=
 =?iso-8859-1?Q?CsKx/zOE6OH4Po9Eo4TpkDnXdTZwE+be7li4aZIQXgALjMojs8/K026Z7j?=
 =?iso-8859-1?Q?TVeLKD9cAMi5PUaaCepd8VnOqG+3xG2qYIviJS2U4CxmxYUhyA/Giz3MMl?=
 =?iso-8859-1?Q?rsNb2G3qRxC3V7DtTtbwDr5LZ0o1pRu1EKChczwl4pxCUNauXrG0ttCdd/?=
 =?iso-8859-1?Q?1sqbC8/V1N76WQakVOIeXuqr5OwptPamvVmW4QXiT71nEi3+tf+LVvvYfP?=
 =?iso-8859-1?Q?BRXiisNqf90ioo55a4vXD8WUoGwTJKXgxBxyVsOCoOJAfFB5CDtDc7a67K?=
 =?iso-8859-1?Q?gNRehpjll6sssWqL4P7nnpwCx36vx/lhIDb4Wh9FZ91mw5lk2C4wjsFG6X?=
 =?iso-8859-1?Q?z8i7JQekgAgXB3fnsSjJ9ZBHESWn/JykO6mi0NJwfq5/aufc6qC0lZAUyi?=
 =?iso-8859-1?Q?t4vb1minwj5cxl28U0XdfYylLxNGTGCfLLPzaNAqCc3xWp5wSy7lnDoqzY?=
 =?iso-8859-1?Q?fgl7wOYfkWeEB8uL7cI1GfYvaleZytjVyGRRgJjTdNalAN6dhiVAs3iSB6?=
 =?iso-8859-1?Q?2iLQv25yzSASMiGdw93As28qmxyLDyEPu7oS26qsCAdYK2wV/++V6hVbSv?=
 =?iso-8859-1?Q?8Yg+dswzHws3q9bGiGs0jiU0DK5yDNOS4/EfTqpWiK8b/oDfnjWPRFbU73?=
 =?iso-8859-1?Q?5Z5WukQge1R04hlzede0qWg3kfzj1tBxXxGxvnPAdW3OE8sd+HfU2QTvLJ?=
 =?iso-8859-1?Q?2Js0wSYnJ/pvnu6sL/xBTq4pULJhd6mFA7fSxYjtBrufNkk+9FJ3MODPYL?=
 =?iso-8859-1?Q?f24hpeWb5L0T0W8tSm6Nvwsfz8WEI8KwOpiJkt0tFnZpww4FYdOJ2PL5xu?=
 =?iso-8859-1?Q?9jD8OkcsuiahthCRkTTMHxMim7ebdlNu6xZz/gdXAQHIOAj8jK77cSMmLR?=
 =?iso-8859-1?Q?W24Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fefe72-e70c-477a-9a88-08dd8ed573f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 08:42:38.0864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOurCXV85fP2i8TDgogDfubTwV8hVnCixbgzvWDeuFOTb6Qivq2HUB3iAKWE8GuxXcNq6PbKnxKIPuTeJ1H0lxdgE7MP2ceCi/uncDDHS8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

On 5/9/25 10:17, Shawn Guo wrote:=0A=
> On Thu, Apr 17, 2025 at 12:14:04PM +0200, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM=0A=
>> module bindings.=0A=
>>=0A=
>> This support is not officially done by Ka-Ro electronics, if they at=0A=
>> some point will supporting mainline, this should be changed to them.=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
>>   MAINTAINERS | 6 ++++++=0A=
>>   1 file changed, 6 insertions(+)=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6=
431570045495ec23 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -12779,6 +12779,12 @@ S:	Maintained=0A=
>>   F:	Documentation/hwmon/k8temp.rst=0A=
>>   F:	drivers/hwmon/k8temp.c=0A=
>>   =0A=
>> +KA-RO TX8P COM MODULE=0A=
>> +M:	Maud Spierings <maudspierings@gocontroll.com>=0A=
>> +L:	imx@lists.linux.dev=0A=
>> +S:	Maintained=0A=
>> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>> +=0A=
> =0A=
> I'm not fond of such changes, as MAINTAINERS file could be bloated=0A=
> quickly by individual DTS.=0A=
=0A=
Is there some way you would prefer to see it? I don't really know of a bett=
er=0A=
way. =0A=
=0A=
> Shawn=0A=
> =0A=
>>   KASAN=0A=
>>   M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>=0A=
>>   R:	Alexander Potapenko <glider@google.com>=0A=
>>=0A=
>> -- =0A=
>> 2.49.0=0A=
>>=0A=
>>=0A=
> =0A=
-- =0A=
Met vriendelijke groeten/with kind regards,=0A=
Maud Spierings=
