Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54727816A;
	Mon, 19 May 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659552; cv=fail; b=udLTCviTxKpl0qpAM7zucB8sa6b++jF3c/Yf+Iz76KjA+c2ux66vCSzfraf7mJ4DgvmtaKXE30W4JJeYZwZile1g7gMEhyN+j8viR4pY3Qxo53pPAdwtPRxS9GnTX9pmodYwfK1uvmQdLLqYVsiMV128xFw70tjV8co9rkNBsgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659552; c=relaxed/simple;
	bh=S+tKIdv4ANB88zJwYcJAAighZiuEnyd249WLVYzZaTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o8Q8FicXBIgme63Oq6/3aeHUz6fmaVnfmnvtb/ICq//DLTQgPUhk62dGn85yx/cmibGjioX/aoucY6TYuEdfoPjbyzZ6GFmetM8AX5VhUf1PNx6pGjRUDPFYZj51e4Fk6sj85qTrUjujX3myUHo+h3PRkd3fuK9k3Ts0PNLHPls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Shryc/yi; arc=fail smtp.client-ip=40.107.20.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Shryc/yi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpwImYXpA3mAe3IOYeXvPBEzkHu+hfkGGfUZAScvEnV/5M/v7CLAjP6gVAEMFhmoiSJtSqjMIn6CRYzPSXdIUK61DWrESutU1I9Gb01mGuAEvEYhh60RWq8zz58ku4N8zOH4JcnP/AgjbjsQNanBy5DurA98x6ATylMaVg4iyzBj01UxY4PpYX8H7rgcRQNM1/j4bkr4M4WkhP8RP6/IQEf70/pfs+ESHn4prOTLjx6PCbTXu0RT+ZNHTsXYS1q+VNFK5TkI54Y/b8PpY73x0WU/9AyszUmhLrVxPXmtl6QTb5HKdWFMe5iQGAEuo7ieuh4BzW8zEccIVeO+lPZbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+tKIdv4ANB88zJwYcJAAighZiuEnyd249WLVYzZaTQ=;
 b=aO9a+yP8JuDiAd4ymBuKEC8KIIXpa0kcP7SMDzLwv0IGYjBOucjNz3axMB2wPOX+9eQkLe8BXhnPx7C/BvVRHMA2bjps7ztoEmhl4K5jrSKk/78JmFoSdDy57noWptVmQXT23SDxsQ7R3ewcOPaOEN4jObYPZLkETu9QO+ivTjE6VvEBkQbm0zbXNug8xO5NyR95a8cvYUwF76Y2TrbVc7xNEkb14e3fxn9YBStI4yPkgC4+v+zufXblAp/YDEzg8QJRAa1ALE+1bag1exMROvko8xxqyVjoQyOdXFUL+7Cb7St80Y9ZlWg/q9+Byv108cVYcizZpw6uOT99ZV2nLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+tKIdv4ANB88zJwYcJAAighZiuEnyd249WLVYzZaTQ=;
 b=Shryc/yi2fltS8EK4wgHUi7vA/kMycBJv29WvPCXI6q/lhiMucblimzBcettksXdSnUyAGEtW7tf9HY2oHvYDV6lbr5IckPNxtZuPFcFK5THervQRxCJ7DWErcGpbK8LB21szJUtlC5XkVC37TAhHUCchPeBXea+NL0qKan6jH5P0rC10hVvabqip8fXEXKknbAphqpoxSZdqQInXch4NOyLizYLOUvI5HA35OD8Cj8M45tP2qMVeThP8c254S0Co8jBP4XOEC/lHMp83NCfa8CQ+xZd/WAZ6eIjZbLKhnBSrcpOZKZJxT2cRVQiZiU8iL93xk5zE+J1kv1q9Ckt4w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 12:59:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 12:59:06 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux@ew.tq-group.com" <linux@ew.tq-group.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2 to
 600mV
Thread-Topic: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2
 to 600mV
Thread-Index: AQHbxLR5ITiZk0OCC0e5vj4gJrt237PZ8X1Q
Date: Mon, 19 May 2025 12:59:06 +0000
Message-ID:
 <PAXPR04MB8459E4BE99BF5326CBE31766889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB9230:EE_
x-ms-office365-filtering-correlation-id: 48b07821-8369-4fed-1532-08dd96d4f01f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?U3uKlsJNPB7jXwvndrGKOVfTQKsJcgER0qSsYgz8pLbVc7ceifa12YbY/gKk?=
 =?us-ascii?Q?t9EQ6AXjzHNShhQmrP/UPfyyJdduWOV8hH43iYSMIq6J+Ym+TC233U6pjHyD?=
 =?us-ascii?Q?3vHGmJwNuEQIZvenTvG67L41AOaxKrxnxw8/9UKcCk6yo0QelVMkaS4gVWhn?=
 =?us-ascii?Q?XFnaHDfO8coVjKqxrMD2Lp3A+PKorkMKNza9P62+TaDSzR3B2iYahh3NnZfP?=
 =?us-ascii?Q?3QquZP6XHHdnY8inIImj1DmgruaGC4zmo3dF/ketkp0ZtO4R8si542niNJt4?=
 =?us-ascii?Q?2WPLJcbjFQBKs4d5KrunGEtt1AXrigRyLl+2uD4ExLYtHqgPrhvG7nRSUB5N?=
 =?us-ascii?Q?cfCQi3D/H35KdZ3JLHK3GYSK+W2uvZn0dZOyLovzFtxmeZ8ApHV9+L/rV6cm?=
 =?us-ascii?Q?sm/3n3Tb7jiTGp+xd3sFacbExIQErvCJaT3u+oJcObCoRk7+Tp28T3/ecx72?=
 =?us-ascii?Q?lCesHQ3eqXUWwbaAGBVLmz+/J9MQhoo9FMsAeD8vx24jAq+ib1p/JIe6Rn4T?=
 =?us-ascii?Q?fsLY69J89MwMu5H8geU5Xp9HN6eZ/SjbnvDKH0fWoJLthfh/BLhxBu5vTlrM?=
 =?us-ascii?Q?gU0TRmuwHvrlpYTJn72WGzZeV4qzvwbaZz+oz3qwUdTRNeN0FboTgG8dWrt+?=
 =?us-ascii?Q?p596dZgpb7bikg4ys0L7MI+csG1Oz2IB36sIG6T6ovPqLJPUAn+GjXdTKkc3?=
 =?us-ascii?Q?fdiCIYUqKbUfT6iQa11eYG0UuxvUKEpwPTfY7yiOK+j7o6xmyjMvd/ve4pl2?=
 =?us-ascii?Q?gtDwJtg/kh7ekX0c3/0DfaFFoTcQDV/LDhmW8Us0o6xfFM9KPMkzaW8E4BgU?=
 =?us-ascii?Q?OQuyvwJT7OuwRbm033pmNaLCMB7dn4J9uR4igTUUmuqKTStcetpSMQBNxV1I?=
 =?us-ascii?Q?fdzUDXor3PzkoeRvLXqjARDR9yIum6HgVcUlL9cUdIMD4HONRkGBr+0oqHZy?=
 =?us-ascii?Q?z4ZCNMNbLz7ZonBHiZ9HRm4MAJrJDlta2I74r0KgEvuNrt7omub/2CmIf7vn?=
 =?us-ascii?Q?/JhGfPcjvy0za5BInkFJ7e2Ie5RrZlqmebOeNX+HChJpO6LxYsRCQ1AjWaYV?=
 =?us-ascii?Q?Of8cPkJrsAcwH2k2b8o9V+s6dqdD9tRmXK2kIB+tFAEjbyHDY8CNF5Q+2Q7r?=
 =?us-ascii?Q?xX5uj7IZzMMVE6N2XwpuN9sX/3VSFbwYDEdSKC0itruiQSsuUy6LeDeqCSFT?=
 =?us-ascii?Q?LSd/6i35pqUPqM/Vu5VIAlQ/TCyBi/APNYmLasMmkrgsyRU+Yxean1INceDW?=
 =?us-ascii?Q?+wDOUpx/wn5mYkTyv8SIZIme4FGYY5axdCZjuYfypcTNmn1NXN+m5GNLwrFA?=
 =?us-ascii?Q?o1IlRAXTRv1howj9lWzXg4miODY7UIe80Z/a0Giwchq3yMeZpdgaARcjQEB7?=
 =?us-ascii?Q?H2hn2Lm++UQnNysn93YkKE2RzxjGBJDf8f5BiZUXtozinIwmvlRkpvGWivtg?=
 =?us-ascii?Q?Ff2X8sdukJ8TNYie/KowxaMbwEe6IDxtdUY0+SbuhQd/1eucvHergA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7tmVul6t7lH7RFI6lqvNFj1wo0oIJ4QX1twOA96wkPXKEjw5OdyPnB8kLYmz?=
 =?us-ascii?Q?LIJmmk61jyqSIosaaCx7NQFIC3wodHumYNabxley1jESKCm2+5cpk302bimi?=
 =?us-ascii?Q?fMyUF5cfMJkMCKukqFML6pPwv6U4VXgXlL9AMAzlG3in/XAwHtrJ7LXTSP/k?=
 =?us-ascii?Q?nZ4WzJnxmIi/x94yWxJ/AcGW2FlOI0RtxELO62mlR0g67Pi7vr2uJoPKW7zu?=
 =?us-ascii?Q?UmsqO9aWPvpagnUIIzZtopQ6Yg2Z8Ub9kIqhaUcEBBaPBZ5WsE41bJuLKwJ/?=
 =?us-ascii?Q?hxC3MHu9r4FqFarNT6oUnqqJtWNi2OG3mnXnNYZD+VZR80huF1a6LJHtU6jr?=
 =?us-ascii?Q?p11NVI2G3miOrb9NbT7KfT3QGiPHzTemAKC5JpJyCxe9UmPmZKnZtGjSOW8a?=
 =?us-ascii?Q?4zjut4wNYPTyQ1anjGTbhGrW9wBbE9WBjhVHqRG9tNk/kPuLLlp6YZGsvr1G?=
 =?us-ascii?Q?NHOe+wWUkCnNH9X1fvdGUY4/aa7Vg57GUV1GlsDG+29RCmUWXKHfhN6v1iVA?=
 =?us-ascii?Q?2y0PcqYqDowYFb6zouc7z0VzoyM/yYr7H4WF4YcaI6BwmV1OQ+9tF/WbESeN?=
 =?us-ascii?Q?LBquFjnnascDQNRc27HG69VZ0ZL4kHLnT/CmsOUDFN1fndDOUUdVxGQnAacD?=
 =?us-ascii?Q?8VpC0T6qOCTbj1Y5jsSDi5P7uWItzD5JvgDYhWe1ZViELc62H/NsTHYHTUeO?=
 =?us-ascii?Q?Vqqv24xeZ9kdEagUB6sj8K/uG+Om1IrtgPVotqydZpF0lSqalt/r4MMOSTJM?=
 =?us-ascii?Q?rmy2e71ixGVa/ZS5XC0IZ0oXKt8ieYOzSAkHIZY3J1eyNoAM8hrhiT6yru9z?=
 =?us-ascii?Q?lEH58NWomp88usv43RqSFACN91o3YHPqw8cqtDbWISiQjDsJ3ZhJKMGfMUCQ?=
 =?us-ascii?Q?RTROQrE71lyFWyxqU6PCOY0MSQ8ejLo42Neydl9fZ6mzKhnZIKzq8OcgD8tP?=
 =?us-ascii?Q?uCRBevCvWGPlS3GzR0aq+SgzM/eu/vWwhrdwpOr2MX0r+l3i92fDpP5gmgCC?=
 =?us-ascii?Q?50I2VOBirsYl3eY55KMGdE5zjW+zgE4Md5yh2PKGiHOYaMJ5LhAzYP+F1PD3?=
 =?us-ascii?Q?jPPvKM20Z8CH83U7N6illeYGtEo4fmd36LWzV/6eg/BoA8CxKdsckt9yYPZn?=
 =?us-ascii?Q?zvSzTuTqFWx4LUz3UVybvoXWSUpMS9yjkUcnFEOpL8iR90h1h8vRzZoYkBlR?=
 =?us-ascii?Q?2oKS1PsQNTcrR5bwqKUz3vqObCAb9ahyhx3CvsYKxrJF7c8TsAsK7m1X/cz9?=
 =?us-ascii?Q?4DcdMNeFJA8SIgeTvZo7z46dZncMiI6lpUMxb1YSIO5DightMiGI9BUEFNGc?=
 =?us-ascii?Q?HGPlRc1aqiY7PIshzExPconbi1ljHMEJDDXytQO4ulz4g0+tvSp+Fowu9M+s?=
 =?us-ascii?Q?zTallIv2ONCXJE9sFbzwxivr08zRXB2sFw9RtmxOdVsvRLPwDGyFqgcy6Ph6?=
 =?us-ascii?Q?/B4cV587DPOU4SWsWIUt1HacaVklWpcv2VRmgEL5u+4L8u/KbIB5464lqeP4?=
 =?us-ascii?Q?xYamEBBywYV4j01ougytTKu6JrtSDl8Bav9vKY52PbJAUbgTyH2ixhl3U+oX?=
 =?us-ascii?Q?o/Th7QmYhHtagpk3OPI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b07821-8369-4fed-1532-08dd96d4f01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 12:59:06.2079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHhZHF43r3khEVbAtGt/dQ0qwNPSCxrTJxobXc2KiCqY51kVC4XcwVOVPRMG7MUbZe5Z4a9mQOtEc3TpUzmVmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230

> Subject: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit
> BUCK2 to 600mV
>=20
> TQMa9352 is only using LPDDR4X, so the BUCK2 regulator should be
> fixed at 600MV.
>=20
> Fixes: d2858e6bd36c ("arm64: dts: freescale: imx93-tqma9352: Add
> PMIC node")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Peng Fan <peng.fan@nxp.com>
