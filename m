Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2328A1EE;
	Fri,  4 Jul 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625598; cv=fail; b=D9gtfzdbhsNCJgq7PeDhJ43czM9jgNRziu/+h9M3cuj7OZUxVIRJrjhwbYlu1IRrQJ9WIY9lhXn91WwvUEiex0zng9eUgtE20mI9e8MrsLX3aaylfE9jTt1HCHX21KUfLtjA24AvBt7+D/YjHf/1edFSSRJiWUSqBctHK3lKQMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625598; c=relaxed/simple;
	bh=bAP/BCcRGiunclGlaTFAgFtmtmp8WRoPi1DFFgGICJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kt/iaG8n33eLZOu+2W+OH3aQoH0PLJKxd0U9bxW1FaTzml0H1/IKdmEbOv/dJQqYSygMUbvlc5sCjMYfYkwMNFhxUVyzDva7m200KVBzFx0DoyUw23EZL9eBtlAfeG7ptChyt8y8dzQiuyoM/UWr/SB3QAbvEqHiYQlJhbEvnss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BOpLLc6/; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BOpLLc6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBskSGnA2dgFZAY6pNsX10osNSqZIAsrwTmZPVs/IuPYi5nqs+YGCK7GqgB2TmnlO4Ii3PCHn3zGwM0/4zaeSqzGX3Y9lu/+DKoRsSxZxeCK18BeoT9tF6jdsN/o5jtjmwlQvwvqohE0kh6DtqprxFUggu8ad5CkwhDrln4ZDhujQixyV8onmwtV6XWjk3lPZyDu6N2XCQQ4JrYEFagpRlws8eC2vrozEKnZZLhssDp6X868GHJ7255S0Y91YRDyv7dwavO+Q3Or8BK5Ve7/tqqwgB9milhBnq4Ci1SWI+XPdxZG8s/UWTtxR+TYaGbatSacr8KJmh/VG9wkyroPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUFLIVBVQJD5vLk6usm6FS0qVBUoP0k7vLIFOEPed+4=;
 b=PRTTNzl1+xge0Kn5um4WFDeN0SxLSwEUEjaHAZ5fKUFPDytnXkWy7TsQnmIILavrh+MUE996RC++66gzYUwoKR7JKgC5YJl5KB+CM7aqfFlUFCB1/PZfN4RcVUdrC4gdnyhccPkiNTkZ9ULqtfQr0k6CF/5aT02PMx96gYNV0osRFGF90zVSxgGloEY1E/Eq8eNCU1qVKM+FKSubtamNnvGmB3vENBnABl3HQj0X+y6a4bIQfwxpMw8els+p4Ga6DknHmLOLMd51vHghvDuo8C1Ce7RtRu14S4vu8ZEzW7HuIvT+yAzjVEiEq2TX4wk4isAmHGNBw4JssVJXpBVuug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUFLIVBVQJD5vLk6usm6FS0qVBUoP0k7vLIFOEPed+4=;
 b=BOpLLc6/4blK/lMrXBPOlFOUb2e24Put1Wd/VDexGYVpI1SyEHnqj4kkgJd2Zolaiy4AAM0psY6K/9CeTUD7zxJYO9uo5ffu2wWa3iWKDC0eTdZB09Vva9T+QTL4Gqd1ntjQvA/kyB/IYtVn6ae1xtQmiz8qdY83RG4+Y5WJ5n/XgQC8TpPKOU/5B9l/lKrRYG8c4M6k+35GAPOCYmcNeC/Q2I6qfWdLabv4EYuylDVuDt+ODl6wkaRn8ZcgFGeZtXiffW7Ij4G7fyh0Ih1DIc7E2bZ9cq3KONDGQwsOYpUqTJiAVMecKWVrX8KsNMv3Jpd7H19lvynIzI8EiYbPHg==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV2PR04MB11448.eurprd04.prod.outlook.com (2603:10a6:150:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 10:39:53 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 10:39:53 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Chuck Cannon <chuck.cannon@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Thread-Topic: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Thread-Index: AQHb5ymI+0/IBGmTVESL7UE/Kt4EqbQe+8YAgALM24D//+3FAIAAGxHg
Date: Fri, 4 Jul 2025 10:39:53 +0000
Message-ID:
 <DB9PR04MB8461CD9CBAE26448D5610BF28842A@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
 <20250702-arrogant-jackdaw-of-skill-bb9fd3@sudeepholla>
 <20250704100741.GC4525@nxa18884-linux> <aGeYomz9DmmAOSEw@bogus>
In-Reply-To: <aGeYomz9DmmAOSEw@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|GV2PR04MB11448:EE_
x-ms-office365-filtering-correlation-id: 91451e91-0d63-4247-0476-08ddbae71c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?K3XkWvYz68s8ghptoadvRMrK9+FgNf/VbRXGFFW6+9g5j6X0iL8Je6yhyHYn?=
 =?us-ascii?Q?3kKBqwhtkVJ9MOqRlV8Qa21AxhENbI9WF80vhhHwStfrjv7NDxsCIu1Wegqp?=
 =?us-ascii?Q?HVFsy8AIFOH3yOF2vhQ9/29ZGOzNJsNjQlF3HIet4awvS9/xA7E8gC/jlt7L?=
 =?us-ascii?Q?ifYPi51r5nVW3q8dj105n8WIbgHPftDeUjvWmZzC/fgssSrgjvyjZClCz+hD?=
 =?us-ascii?Q?bACwAZEX9YR2QxWCaV6bgecT8aY7eBqE1pzD0Zcl8zkd6mXeRkBrauhSdjyG?=
 =?us-ascii?Q?Df+9s6lCySHzwvLl+wKzMFVERjpTe+4690S02txz6dogBZwuiX+hSg/I+vF1?=
 =?us-ascii?Q?qqJ6uRcWlLyqSPX+EBcUB05uLzIRYjkp3pTAmE5KQ94ec5X8ML/xHfkv44Hi?=
 =?us-ascii?Q?G1+aNOGVNJz2FPOnBu5Kluv3+SHPdGIUDvt21caOLmms3ZzZ5SWMCqoOfgVK?=
 =?us-ascii?Q?3raJrcFle0lhj9NwHHiNsOIU/3AuAbTfTGBc3MYpn6PZxhWD81pzCfsBydGJ?=
 =?us-ascii?Q?5vs+E64i5WaPijkhO3EYjEK0KZFQi7mQ8S515HeqhAaIEscrVkeHe71tlqEH?=
 =?us-ascii?Q?iGhUUCNkhmK8BcXqfzWm1+kjRc9PobQRatVhV+8mPHm2KmQuKNiV5z/eCXUD?=
 =?us-ascii?Q?xCcyAumnZTzwuqrMqxZWy8H63SGfv8tZLULjcwOxUE7lKzZP5h+v4Y3wQGoe?=
 =?us-ascii?Q?X0BegAsOY4unXI2EJHhs/bdglE1bLwbO5I35IVScly1VlLx0lOzo5YaiZksl?=
 =?us-ascii?Q?xcNVdA28WreWIReyYztPnD3/jc6fwwY3Vu35pSxcJCuCzF6pAUiE36hf7nPm?=
 =?us-ascii?Q?U6zTJFeJ9EPHJqfP2ew4dHA8MDNVYYegkKW0xLBJV3gh70d6Gfe3Z49OwToQ?=
 =?us-ascii?Q?rn1zKk6wwtATvl6I5WH6NCAoFhJDZFiXZiTyB57CNA5Y523C9r1qjmzyiEYU?=
 =?us-ascii?Q?eG+vA25NLswjeYeYx+My1H2X8pfs6hYH1/OMa+3hgs21iF/XId1lYj8nmjQq?=
 =?us-ascii?Q?l7hn7cflisc+pU1Ii/hwiYi+oSGQZHNAhBrEKiIcCCdpZJh6JtWreXcIRVmq?=
 =?us-ascii?Q?rt7K2BzLC60AqHm3q5sIbhSi7Y/iQoCSCsHHbjioLpM/tAQBG4VdWmb2cBD8?=
 =?us-ascii?Q?1OZFiWd/EsWUaUOeKScjZJvxFpozuftP2iwJ31PMAzzgw9LbNkxb87ecH1Ef?=
 =?us-ascii?Q?TtbCLDCshJG0PHbfqeZwvTbfx1tMIzSXYEVbCPPhUbwC1OzAagcV2G7P5RDs?=
 =?us-ascii?Q?UZx0c4gr88desR8oE5hWvQhwB1P6IH14rl4c7mBxJagUi+yjeXA+Le2RV4wl?=
 =?us-ascii?Q?LeccTV8hkb3MgQCj8PgRySkw6DPkWbgxbdds1wzam6l0RHzJizrwZzq2raie?=
 =?us-ascii?Q?wblH9n+q4w9agJRKaYxfkpQ0dNoZQYfvAlLHK4TUr+axlULaP2Bie0hQWydw?=
 =?us-ascii?Q?pY05dIjgTVbgBjkPO1wccbSiW0ZFBhKkdjqsIGHSVMOdB2CG1NsNVQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yMUwoI7Lc4W5QoX5zS5FLvq33z18V0k/c88CIHpNzDFH2n2upAdJ4I964ZlX?=
 =?us-ascii?Q?WsQkzsK+EB3jAKgSBhyt8oheqBYVc4vrmp6wWpmsBtAAqiFZA1XrfIkkVvea?=
 =?us-ascii?Q?1u++ga0PwvhBsAlOpKPZbS5JWyqKCB9xj4u7S9WqMAs79hU1NQY31yTUuwzz?=
 =?us-ascii?Q?XqPd7nHKZ62ViS08YizmaIk87uamS7m1n0/TRCl+DSmvEL9BU/IrKQ3UJAwb?=
 =?us-ascii?Q?3WC326DF1uqNl9sDVsdbxMhZTSm9pbBx9hj3ZImeahuHptX58+5rH8SmN9Lt?=
 =?us-ascii?Q?zWkfgG774h9jcONn4D79U2K4MIxpLX7IXwSYsEK2/10ktdy09LGYc3fGY39y?=
 =?us-ascii?Q?8p6aA8BB4aEpXkCnGUcKgSctIq6UsLVxpz7N7YNuA71VQypRpMpsmPqO74tR?=
 =?us-ascii?Q?/UVx0cjTtcH+ZC6+jM+QQRn8aix6kkToKtA1WpuCueLwV/89mgeFmYfnT8Tf?=
 =?us-ascii?Q?Mp/slTiW5HP+D67TFVZBXgaXeXsmagJB4W2EIMzTK5SLFaCAg2oU1SpvO75P?=
 =?us-ascii?Q?pv60oIJzyoG93kdW65g39CBahMCjylwLC0fZUK6ZUN/0+GZLImOd8voxuRH5?=
 =?us-ascii?Q?Usx6CqrR3tuh/5XbUNr1ft8n0KRyxE5II8KF3rGQJCLV0bT1C7ae8fn/Nys4?=
 =?us-ascii?Q?mp4stKZ7K5OHYah9lVt5tyqPM4Se5lxsQIuyxcVYYqK3v8cZ8/Ed4FvUAmsP?=
 =?us-ascii?Q?Z2VBMiNwGCF09malvJVkFvmGmyiGxAn3gLP7jEGK8B/+2bQYt9wqUBcn6ioj?=
 =?us-ascii?Q?x4Xsh+MV/e6Q8JxUy6MyDwA9i3usjgxDF13fzvcSTokvU0vz32Qd2tfjYK/Q?=
 =?us-ascii?Q?Qh0BJ8VmDUK2H3gmHfbbART7ZA6f9It7uTsXT0GckQp874xXgAlgMDa3hJPl?=
 =?us-ascii?Q?w62fDSaUO471tBV9/3rYzk1IkI/Rc5iyi3VORuw7L1p/XbROwXq89MeqqpM1?=
 =?us-ascii?Q?dgMeN44czsFBBtZVLjU1cuoh40bBtS9DSUr5m/9I/RfMXxhufv61Qx33m8b8?=
 =?us-ascii?Q?Hf8z4az51nUfgsUxaxLVn9Lcm9fltTflusn++HvZbbTRHOpM4pctga+AcwPL?=
 =?us-ascii?Q?qF+tNoT4Mjrz8YsY1RpiXTd0Yex/hy1+3Xmq0ETA6pEwDD/DgFcoP1jsgDza?=
 =?us-ascii?Q?mP3qeR1CfEWIWr0ahdiU6MWHBbxWfLUf7R/5EJiGH4W35OLkutRgMFDIsGSr?=
 =?us-ascii?Q?9rIdBplRNKz1cNNRs9N9YUEDPZ9Co47CQL4t7YqXAD5+oukEwoSSWDBrqjkx?=
 =?us-ascii?Q?Jrz6nrGHfhZ8DY6X/zdkK0cGz5KbeOL/sz/JsF79apQY5ewB1ND+ndrsOlW6?=
 =?us-ascii?Q?GgsxoQKy3weYPpVa718Znc1GnnF34Itl4dwakxYV2mB1sK1C6Y/xGzIsZFeh?=
 =?us-ascii?Q?YplM8XTwiput/aSerhJEQJ6wPmwQQNElJjhkuN8N62rbApx/bXkB9GPt9PxS?=
 =?us-ascii?Q?m+F2pZNhLRcW67YFJXgFjQY7gOi2R/KKZblfjMGIGMjoDECMxrO/JzanBYUB?=
 =?us-ascii?Q?OIHZEcm5L9t8tLH0KoTgGRPvHF7wh7FeD36ObyclvAmCLY1Z5RP/9K1X+J3p?=
 =?us-ascii?Q?4Gt3NyxKhNgo3yA4kak=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91451e91-0d63-4247-0476-08ddbae71c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 10:39:53.1088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0At3RVgU/4JshklY1Y1x3xOJRVkbZiUOuNa9jSe0OMXMBfTrrT+Um4sYXBGk4nlQpsT0QRaXZITffFu1jZntQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11448

> Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg
> info of MISC protocol
>=20
> On Fri, Jul 04, 2025 at 06:07:41PM +0800, Peng Fan wrote:
> > On Wed, Jul 02, 2025 at 04:21:58PM +0100, Sudeep Holla wrote:
> > >On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
> > >> MISC protocol supports getting the System Manager(SM) mode
> > >> selection and configuration name. Add the API for user to retrieve
> > >> the information from SM.
> > >>
> > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > >> ---
> > >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30
> ++++++++++++++++++++++
> > >>  include/linux/scmi_imx_protocol.h                  |  5 ++++
> > >>  2 files changed, 35 insertions(+)
> > >>
> > >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > >> b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > >> index
> > >>
> 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f3
> 0d72a34
> > >> 717678613b35049 100644
> > >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > >> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
> > >>  	SCMI_IMX_MISC_CTRL_SET	=3D 0x3,
> > >>  	SCMI_IMX_MISC_CTRL_GET	=3D 0x4,
> > >>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO =3D 0x6,
> > >> +	SCMI_IMX_MISC_CFG_INFO =3D 0xC,
> > >>  	SCMI_IMX_MISC_CTRL_NOTIFY =3D 0x8,
> > >>  };
> > >>
> > >> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
> > >>  	u8 buildtime[MISC_MAX_BUILDTIME];  };
> > >>
> > >> +struct scmi_imx_misc_cfg_info_out {
> > >> +	__le32 msel;
> > >
> > >Now, I realise, this mode select is not properly defined in the
> document.
> > >Just 32-bit word. What are those values ? Any fixed list of values
> > >with well defined modes or configurations ? If so, please add to the
> document.
> >
> > The current used value are 0,1,2. It is used to decide the logic
> > machine boot order, such as 0 means booting LM0, LM1, LM2, LM3...
> > Regarding 0,1,2 using which LM order, it could be defined by user in
> > i.MX9 System Manger cfg file. That means 1 could mean LM0, LM2,
> LM3,
> > LM1 or LM0, LM3, LM1, LM2.
> >
>=20
> This sounds like this is not well defined and could change on a different
> platform ? If so, how will you manage this extension across i.MX
> platforms ?
>=20
> Or the above order is actually fixed and will remain same across the
> platforms ?

+ Chuck who is the best person to answer this. I may not explain it clear.

Regards
Peng

>=20
> --
> Regards,
> Sudeep
