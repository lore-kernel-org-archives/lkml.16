Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDE21392;
	Mon, 14 Apr 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628426; cv=fail; b=fchbmhRRiPuuwk0YXh1SQoCSe2h8pm6MWQ6xpaTS8bMSs+YmB6cBVFgSeFMTllMtsQlutgUoMZkMwuy1HT+e/auOAR836KXTM9kjanT+/Vxqwrl7O7k5UYfRWd6koYKowh4Ep1MIHAyZ8sw7ZmB7zBXOV9fEoEutGs/azWhoqyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628426; c=relaxed/simple;
	bh=ZLhjOJibIEiPqDID4B7+VYff65i4wgOVijIhEe9om9w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PzBK4AolOwvj1IEOVAXu6iKYBTkPSuUpOwAHo4PLo3TTpg4WIGMHLO7PYpSUhha+c3vOcz3HW+svEjGsRqq/NTjyT9maC0GL2bJrnCkFtu1TVFzrQDibc6tGhoRcZe0Q1mJUZ/HbKmOe+7E0bwTBbZQXCykJG2gRo2+EzkVkwCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=noPcnKfU; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="noPcnKfU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M99nQ9y1COSHRAxW0lI6O61SsCc7Bx7kRAX9REUzjXCm6xvUz8HurIwyAYFs4H0c7gLa7HTlOcKh2Th7HArrt5gLaOHF2RrUEP0P5OwW0taZfmlI/iVgoE76yFcZ2hdQgBwzmjF0xOyPY4MsCT0jpYv5EzXu/db8KujJoGzSpMsMQXI6vLtgWNiofdzrYcFQknk56evqs6AJPPOtx1cX7wOhLZvHgBJFgllKfR7J34A7g4Pn67FJMQujeDKNkAk3ow+s1R6WCrhjxgWdPeAS0hf41FK447GNAyZs7QZkk71LHSdPUmNYFWWg4woRVGKZIBQQeTg5brLtYvr2RROrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSlbC7n3FFJEHjQ+PrxEhHdch8lYUKFfWC1DRazZVKI=;
 b=QVWoCk3nkG0wEdk8AzYmVKVkvO/wtvzzfjuEH+RJKKZRTk6MtFFpQvthDD/3jGts2/FagcME762cDgvc4azj7E+lv4kh2EZoF0+0pma2kX47RXtP1pWnCwJkVae86lzewG+KVZn48+fFH687yanLAp1N6l0BZyMcMToC1dCcLbghq6a7B4AvTkrCzFkrZIFw8A9eSpPNpeGnw/hAdlaVvMpJ6ocN0yG7kt9hOiXZbC1rTqBzZ5IGidt+yDtKFmnt/efJumghALBIC9VHl1oYXwKUqZ1to5PqBbefsd9V0aWHxb90JYVu7HX+rrfXLWEQ2/DDRnyCD8oELIM54zNQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSlbC7n3FFJEHjQ+PrxEhHdch8lYUKFfWC1DRazZVKI=;
 b=noPcnKfUiKekeTkYb6aTkOB67TNYuzt5io55QZO/5LBA1viQLfi+f+p6+8zf/oRMNgKjwBwYazAj2G7kdCn19CACgIzm64eCWcQSQObkYoe2tGHn/OUcFNvZF8ouxpDzulnjM/RZF8FmedsFhQH5rF1gdmZzWGq0dPgbuiuKSFB7QzBUOjCSyEiaP25HHx9t9lc/PP9yZPOxs44LuW/fWmMjmI06PRC/431fF0InTT8aPXm8GTozSbiVt9q+dWeRCtUwVpjuMAl+f0nbTWNV/+jrLdz5BXwxCAuy1E5J/JhkBnvXRMQb3zFpWeSYlUKC435At280wlJBRUTSi4BMRA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 11:00:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:00:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Thread-Topic: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Thread-Index: AQHbqGLe3kxhTr5dw0mXAVP8MdrZO7Oi8B4AgAAF/qCAAAVbgIAABZIQgAAEh6A=
Date: Mon, 14 Apr 2025 11:00:20 +0000
Message-ID:
 <PAXPR04MB84598733FA39A7402E91DA1988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB8122:EE_
x-ms-office365-filtering-correlation-id: 11380109-46bd-49e1-14a4-08dd7b438c76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tIa2SoKoeN9PtXTjoZU0w4UE5j1cW+eDsi/gZOJQWQszGLzwGExTdHekAhKW?=
 =?us-ascii?Q?F8N5EVhIZzhkDkUwveibLTV200GTlwBo0DLLsyJJIgEiiddGbbkyZw+rmAHJ?=
 =?us-ascii?Q?6I9HlCBZv13ldaiTiyltR6986WVFXnIaS/8TI5Lmrw4zLxCzcZv1SobRt/W3?=
 =?us-ascii?Q?VgSqS15HbnldslrWhGtqy3hNp0N3ujFbFZjoeYwTgpezKmpmWndCbBatE6zr?=
 =?us-ascii?Q?qcZWn0UB2O7s7z7M9plo93tLO/6f/BFKYpFgV70v8z2m1XGDjT8JxSMJYodB?=
 =?us-ascii?Q?BwcFJu7bq0M8WG+vKBkCXgBvbhhAasZcKbxnDPHb8jnByaONI1y/gKnm/eVg?=
 =?us-ascii?Q?DNcdTZpCfAw2B/CnLpGk+m49Hn840ScLkdWdpqABk6w8RieJYf5aFFR0CB4r?=
 =?us-ascii?Q?U2sr25qGMar0vfR8i8PkgonsPwiKSd6nKNzy3lfAgsWWK7/ibGw6Un7zS/Nl?=
 =?us-ascii?Q?YhBQsk/fZ++tjob4VNeKhl/RxUedYqSf3NuflAuGjUgVhTzWaiLYlmzYY1b3?=
 =?us-ascii?Q?4VvA4CioolyMnYJpUqLZTdC1uTphTPdcwcOHB0sRZHqsiX5UsyG3ZuqaUUoJ?=
 =?us-ascii?Q?tBv38T8xhuGG9d5wZ1S+rPMhAshDhr/wdQ/CbRvh8rmfA9J8NWg8xKtbzWmJ?=
 =?us-ascii?Q?kFtI4QDpkyqMq39Ct+RcteueMRZVA/bJnI9gqG13T79qy4yb1VgsUx3IJKKK?=
 =?us-ascii?Q?pTkummXprMZeLL5JPGL5spFKALtgIRtu0jevtYhVgNEoZ6atJA67mKYDUMrI?=
 =?us-ascii?Q?mz7O9pE0VYUdBx/1My2p8k6A0xWbaevPvOanSNMTcOx9ENXzhaik5GRJy+QD?=
 =?us-ascii?Q?7LIMAiLh8aYwYIcaqX7aCHwIFW1UtVyfx26PDGEJlhTPnVYZb37bQySDVmYB?=
 =?us-ascii?Q?2goRFHDN48tJk7fczP3UBfcgLemYt9TjwsNJhvSJ0bZW8IvhD/Z/HgJIG/GM?=
 =?us-ascii?Q?wLHj1CH0J8cQjT/0LMxVi70JZdhA+xtxSXCmnkDUZVNsYXaF3nR3AFBFAzwP?=
 =?us-ascii?Q?9tglmmwGRuuiGGLO1gB0GUF0neiWFzXeJGE0r0WuXpD+YH8jhOMhhm/JiaZV?=
 =?us-ascii?Q?8NFRKn4BBcH2dAtydNMcVTdC+1Ee/D6iSTORzTDNTfALvQJzPd/RqFLoV6N6?=
 =?us-ascii?Q?lR5wCmO6FbZrhLt9l9p5Kmu7p2tBr+TOIBVFAHyeo0zoQI3/dGW1QPqc/HfI?=
 =?us-ascii?Q?Q3dPLK1BpS6QleWo6MCKmI0F09/UssO42n4y3CNi591eOte51LeKA8s6/Tv0?=
 =?us-ascii?Q?11NmHPcSjfYzL8m/AzqGy4/+tqTAFx5X0HAPaUk4Ce6Eg4Z7iyCcrLKTvzRE?=
 =?us-ascii?Q?OroJFGnZz/+OIBq33Z9bT7ECr7VFYu6xUveokTJ4GOT5oA8WGn92BaGI5FZ4?=
 =?us-ascii?Q?HSya/4uhujzUhjKfYMyH0O9HrMleERzqET5SCIUcmIRxeY3dDQ4te8Kr9mjU?=
 =?us-ascii?Q?ZxzcrkzqB8zW+t39KpGQbDVZXNFQDDZi5N20q6nx//t4Wl48xGTXlw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Gj/3SKd+XYBuwXPzCwLn8KyAConI1Hqm1mc9VMQ33E9zOds0BRSiaOY4afXa?=
 =?us-ascii?Q?dQwqUC18yMgN2FnqYibxsSXfKxRj+IKr/0mH2NWMahornlfo2jbKvxWW+Qnl?=
 =?us-ascii?Q?LOKsnD3k4lS+wfsZdvirq40fTxK5fkrNEnzO8PTGsorvHNGBaIZ9c/YZGtp6?=
 =?us-ascii?Q?swLV/EQ9gN+Jf+LLqfYN7Q/138sAapgAhjjxqQISw59f/gUUUkokvBwxuvjf?=
 =?us-ascii?Q?uX/9SwlpaIfYu7uof4WaywsIFx/84JPaSsiztcmaKcTrrGxuQIf+6gPGfTDr?=
 =?us-ascii?Q?A+o2qBsVTceZgKXXqt8ZeIkekvV59ZHaorxFIv7IwOca1rveFziNbDL2L8MW?=
 =?us-ascii?Q?NvljAtydUAYoBHO4IYoBGTB5D1rkoA11u4kzO4R4FZ+hmndMSwbAfeXJiRTu?=
 =?us-ascii?Q?ab5/EWW9GezakaxR8VSHkgNA7FhJYW0C50zUJIER6doq/gafJLt0GGKA+dFw?=
 =?us-ascii?Q?Xm9228Ac3WHhky7MU/KCYh4SRjuoV5Vb5909P/XJGlQsKwWKrWJTCEa1Tya5?=
 =?us-ascii?Q?gHWoP98NP/XW2T9yIsG4IBu60OmSj1WxnZqlGO6vIXEjO/lTlubdkDkTyaoI?=
 =?us-ascii?Q?oeDk5RU2aM7EkMnoGoAsLckUIeamTSu5lMKB/OVpzmsjk7xoTvxFi6/476Mf?=
 =?us-ascii?Q?1cmqXN3PByzPZR/E6B56iDVIBnXQ37pIsRHFZM8m6XuohBO+1O8QOYX7VXuY?=
 =?us-ascii?Q?q9JqufuFTZoGnlws2bk69jiPdlmwmRMGzJAuofSFAhHMK3IOU+DZj0AMw6Lu?=
 =?us-ascii?Q?YysdYs3pXMXHjKHxXFvOOr+54FYlMO7u7ODmtIUqSywX40syTC8uMj2NEXu0?=
 =?us-ascii?Q?9oXO0MMlKi+PVYMyriUxVl9ySvnzENLSwbWNxxxvJ++F6YBTx7yvcwnhmuRM?=
 =?us-ascii?Q?ysvk+nF5lc/PX7O/rphe/PM7w0vgJDNXz8+OTQkEGciSRWfYudgXslk9CLso?=
 =?us-ascii?Q?0zViP3AzyZ0qIfGqZS4FWWtLbzW6dSCitFiww8W5SlWacGzkVUvQU9TV9KdQ?=
 =?us-ascii?Q?eXBG3WrmQZmBac0ToTO/U98TmdNcj3v3tEK+U7EJB4eT8pW0idF+KN4X72Ju?=
 =?us-ascii?Q?YJDVDBvdxsputcwOHVn6QajrcJNKW43+xUudZTseIf8G39bj8SR1WqnqQSYQ?=
 =?us-ascii?Q?H/myypYz/8t08etO0tZDbnT2pcmBOMz+OaRb0lfT5HBSRpFd7lIhkx6w2dSv?=
 =?us-ascii?Q?lFqsWRbN8c7CJ1A3uHmJ4tIzU4dlowosHw/lfFNoBaikxpC49xqDTX4OBAJQ?=
 =?us-ascii?Q?WzfmnRGhZR/ct8MEqrvKRHNAiGbqJGCxqXxZ9PBwNEzvCJWXCzdfsBZvKy5o?=
 =?us-ascii?Q?irRHHhu1DZeAwnNTj96LwynOmAr2J9k39utibZ1V2Me8Lr70SK9aIxDNCKOx?=
 =?us-ascii?Q?ZJd9NI9D2fRK7/3iiOrd6ZFJ6zWig0in0FjpAtZ4Xn1Rzzl8jcKtjRs1DL70?=
 =?us-ascii?Q?K31F+N6mV/RG6dRERy57GvpAbE4/taD/T3ANFdSqcsJJjspg+jmK5hZrVzM7?=
 =?us-ascii?Q?qP41eHvdhkm7roqRtfE5hIX2bEKwOf7vxUr/nvMw2StU4Rm4m54VgeRwLyFV?=
 =?us-ascii?Q?cTVJnYoqmPuTzlKAH4Q=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11380109-46bd-49e1-14a4-08dd7b438c76
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 11:00:20.5618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HoE9ZIB/oF6WnkiMsGOxkp6o47Savnq2PoQ3x4DrJd1E9gDkEgtoDqXLivQ+8putnK2q+Cgu3sKfYNffyEDKBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

> Subject: RE: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> driver
>=20
> Hi Sudeep,
>=20
> > Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> driver
> >
> > On Mon, Apr 14, 2025 at 09:57:43AM +0000, Peng Fan wrote:
> > > Hi Sudeep,
> > >
> > > > Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI
> LMM
> > > > driver
> > > >
> > > > On Tue, Apr 08, 2025 at 04:44:29PM +0800, Peng Fan (OSS)
> wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > The i.MX95 System manager exports SCMI LMM protocol for
> linux
> > to
> > > > > manage Logical Machines. The driver is to use the LMM
> Protocol
> > > > > interface to boot, shutdown a LM.
> > > > >
> > > > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > >  drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
> > > > >  drivers/firmware/imx/Kconfig                  | 11 ++++
> > > > >  drivers/firmware/imx/Makefile                 |  1 +
> > > > >  drivers/firmware/imx/sm-lmm.c                 | 91
> > > > +++++++++++++++++++++++++++
> > > > >  include/linux/firmware/imx/sm.h               | 14 +++++
> > > > >  5 files changed, 119 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > > b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > > index
> > > > >
> > > >
> >
> b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f83081
> > > > 0f8ba376ece9
> > > > > db93c8cded6d 100644
> > > > > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > > @@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT  config
> > > > IMX_SCMI_LMM_EXT
> > > > >  	tristate "i.MX SCMI LMM EXTENSION"
> > > > >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > > > > -	default y if ARCH_MXC
> > > > > +	depends on IMX_SCMI_LMM_DRV
> > > > > +	default y if ARCH_MXC && ARM64
> > > >
> > > > I can't understand the ARM64 dependency on this and next patch.
> > >
> > > ARCH_MXC both supports ARM32 and ARM64.
> > >
> > > To i.MX ARM32 platform, there is no plan to enable SCMI, so only
> set
> > y
> > > for ARCH_MXC ARM64 platforms.
> > >
> >
> > OK but why is it different for IMX_SCMI_MISC_DRV. I really don't see
> > any dependency. If it is not supported today fine, but do you need
> any
> > issue to use it or compile it for arm32 ?
>=20
> Seems my over-thinking.
> There is no ARM64 dependency. No issue.
> I just think there is no need to default build in this driver for i.MX
> ARM32 platform, because no i.MX ARM32 platform supports SCMI.
>=20
> But after a rethink, ARM64 dependency could be dropped, because
> there was already a dependency ARM_SCMI_PROTOCOL(i.MX ARM32
> not select this option), so we could follow same as
> IMX_SCMI_MISC_DRV.

Oops, I just checked wrong Kconfig under drivers/firmware/arm_scmi/
vendors/imx

Build this for ARM32 i.MX is ok, I just think no need. So add
a ARM64 dependency.

For IMX_SCMI_MISC_DRV, I could not recall clearly, seems I forgot
to add.  But anyway, w/o ARM64 should be both fine.

I tested ARM32 build with imx_v6_v7_defconfig, no issue.

Thanks,
Peng.

>=20
> Please let me know if I need post new version for this and Dan's
> comments. Anyway, no rush.
>=20
> Thanks,
> Peng.
>=20
> >
> > --
> > Regards,
> > Sudeep

