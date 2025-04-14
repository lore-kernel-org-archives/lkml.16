Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D7B1953A2;
	Mon, 14 Apr 2025 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627465; cv=fail; b=r6FwVnpumYya/b3T/hLMUgxmDPIFN0NZ3JwCbDBSOlut1NEUXeLz4WeFIrgayzYexQT5iYgay5y6A5qJ/A6NXyPQhNy0VTeIfyHCC58os7bRJgU0cL6cikD0sy7b9xTM1U9HgAA9/00l7X1xTop29bpwBAleEEZyY0OxGMPXtQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627465; c=relaxed/simple;
	bh=9gFu7LeAyCMdu8f6pc2Q4bZuoGc3Dbr4aV51iwSP8Y0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yhsu6LLkvDD3s0OdTUgMCnDY4QHsrklfHUc/uj+O8ChNt2wTxvCSVH4zFI/iuwMHe/jtciBkQGoRt2AU/Be8v7JE6yNOu2SYzkGGOomYfY2uUVmCJAjHvA4zdJs4atGNDWbjbkcCYTbKeLnIYuajO15g2KAdIs5tnzMVOR5zDho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RBu8J9Zu; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RBu8J9Zu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5ozpG2MjmVzz9baMukTPA3mB/NlK/cnmR76KR/r2Zh10hzLsJBOYyZGnIIs1saPAAVpIcGX6UxedK2laXZ6diC9DTvprIQvrJu/r/YS0ykxVRs0liPdcGkDIbLmA6hVvYXLdqEfrycC58iFh1rWsNe5xnOjQcJUJxrGIjwjmopsZyJ/YnClBYssICNaXOw1zOVrzTRF99jeqsNCsn3gv5mVVhrHZnu+u0+h2MeqR24iAttaSE4lt9GjiRa9mt9IrpkwqQtKjITtCqLzFADQuyPaAanPXtK4S80Tdw7Mrn+eexrTDn9befUIeiUz4yXHd5CseAquSREAqbwQaTTiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2qO2ZoAdv0baZMEO99kSPY+gV44jsQJUPSAZcBIj+s=;
 b=E9Hzf3jD/rypN1u2mNuun4QBEZPG9b3KM3v0yj1qharLwS0OE/PSm651QUuJtHfOGhIvwFT/nRzrPqH2H2GjW1uFnxXpFIPNHmpyDEALgFN7hSS25kruWViZzG3JnK2qX0FTyVhDqNo55n1f+IETo0bBQmLlOubqXG2DzFa5J84MfJDSLoOdrUpMZFIjsMxN8UceIFO+WyafiP1HMq+n4WQn6AA3yKed4wMy5DKuT3u4ZfhdBc0mSdvevL3vBMgM4vStb/2sZS1kGtjkEua2n4t0lM3t/DSjxI3cUNu/DOHKj6Ew9eDUyljpE+Z9Sc7nGFyugMrinLa1GwyohiOJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2qO2ZoAdv0baZMEO99kSPY+gV44jsQJUPSAZcBIj+s=;
 b=RBu8J9ZujiFQCKOFaAX+B2ph3ih/vC9c3u00+muoBMfTVm2519vGDsfbyLahSf29rzH6Nq1Cbrop4TUgcZb8EFcS4ybjbv7LPXHmf8kiHLXB4mfiXljAa/biHSwUASo3uiXxd3/QQYJoVh+4gHjMLwewqMJmLYprDjfE7ZFzfuzpVSATVFOvlhf6fGHm/5ONEaX9E2XCHARquSbD7E1pwiKoQIre8gh/gO3bHqRFZKa9kEEuwzSAjgzIkiQe0XWShIm3ZPuNbhzMv/0l9fn3cTsVx2m65iHUx8xt/kWoV7eAQvKNeLqNr8RAiv+8GrqXtQMk67bu4L9+1FSA00Gumw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9503.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 10:44:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:44:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
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
Thread-Index: AQHbqGLe3kxhTr5dw0mXAVP8MdrZO7Oi8B4AgAAF/qCAAAVbgIAABZIQ
Date: Mon, 14 Apr 2025 10:44:18 +0000
Message-ID:
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
In-Reply-To: <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS1PR04MB9503:EE_
x-ms-office365-filtering-correlation-id: a3474237-cb2b-4b8d-c838-08dd7b414f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PgC4hvtVSg75ddbQme3R7hP5JsCLso/SZ7nF0c2DL+w6fUs3myZH479LQGO3?=
 =?us-ascii?Q?LRXQ8gHh2EqJMm0FT0aAqcpHUQZy/6vCQfJaZHeWcyg3hraacOhx6RB2DTVX?=
 =?us-ascii?Q?xsYeR+QeIW9Cd2RYBpjUeo4xmA9dL801pdllRc1bMVz8c9l77tSFCwnls1CV?=
 =?us-ascii?Q?AUn8szCf2YMuH96vH2qSXd6+8cNHq+P2Rr8dZ8aC9Ecx/78Hml4s7jjRSdKE?=
 =?us-ascii?Q?jEhMX9JvV3QMsC9O6AK+7DP0GSQNkkwo2O+fKUBq2vxbLZeDp28bIuP7n9by?=
 =?us-ascii?Q?l8YhkNODE5Tu0IYdtrfexgpuWWKBFVx0BJvh2G801yoUo65E0VTQ1tOXwiER?=
 =?us-ascii?Q?+gTnUxVpeSjzxDQen8k6mhrfpjm/jowMtVtEgAFOGYzDuYJ1i9b+6Gw61wnv?=
 =?us-ascii?Q?RCoxIi+3pQRbKCnnbba47oaehXt6ICxXJXRtbBacrEDoe1M/juMS0PHK1Ygf?=
 =?us-ascii?Q?zn9nzpWrBvZvwp0z5/R0asTNhXLE3Bynzlb6d/KTAHDb487VbyS/M+3LQVW0?=
 =?us-ascii?Q?R6FvXGtKhAXi+O5RaBxhitpLH0+Stw1naBCk07Q/uHGnNEnrfRAspcZT58JU?=
 =?us-ascii?Q?E1QZ64sMIujkLtfSZhaiKTZw7upwl/DLynoqCj+HQLpHYHy/2mJgb6WYnAMO?=
 =?us-ascii?Q?qEd0WfRrxy5k0uPoh3orJeUnyZWB7lB6kr6mJsl3LI2/mS+gEt6P7ALTdqmW?=
 =?us-ascii?Q?L2wfFsF8M7vTDKvKpFz9nXEOzNyZZVIEkMPZ95Yr6CGbGnGE7cpGHy0ma1j3?=
 =?us-ascii?Q?6iXJkMJTYkMz0aUtP1d86E01YvZlJA25xLzBxUXDNKaYr7UfpeJCEdg1eLC9?=
 =?us-ascii?Q?Wn9PK40U2B9tIFCMkFi5ErVoyqeOkfdo6dSLhNtPiM4TntrvSYijiYRsEfaT?=
 =?us-ascii?Q?hHZwajzok6TPgUkOQxvkUrkZrbVd3Qp5r5PrpB0lpHs2LuFDn+AiYDk0C2Wk?=
 =?us-ascii?Q?HiPsVU00ZnAtLcNJs4Uytzng2QlliX8LqxrdPbgzRd7DFr+f+hIIy6zW2EnF?=
 =?us-ascii?Q?w47TJJ16ut9BHfR1pCRWorO5j9+GOJVqSNYNJesLbJRFX+sZL3BbpRQvcfL9?=
 =?us-ascii?Q?tXwxodY++MYlbcTzN25Cq/0eEZ4wpcC6dbTBppJe6aJu2j2Zu4YXuX92WL4s?=
 =?us-ascii?Q?jJi7+q9YCDXXmJiW9LM78vdReddyv8qUt0WWE7tvfM7lFxw4G7PLzB+2NKtc?=
 =?us-ascii?Q?yfMP7Sg+siEzBC6vnrRvePYIKIpqNO7QCogGMBHqY28jn/AliWlHOy3UG/oY?=
 =?us-ascii?Q?ksBvwstDVw6Ra6tEJ5PvNgZP4NBAjYBZb7rY1XYSbm0Rhlahl1VH/i+mTBqX?=
 =?us-ascii?Q?yhF0P/G3rn/1dOqid78+PivaDoWKAlzMYx3BErbJ3HkIbIlnpRsjPfWiJ4VV?=
 =?us-ascii?Q?cCRYWfo0x1e/iJ5NxomnWN5yYMdivk/TRo0E3Zj/4DvnVOr7uJN98+A8YZEZ?=
 =?us-ascii?Q?3pBJGAmQ9t7fxUNM35Nj+WUUAJfCijKP3UOJx378stcrz/kgg6XoJA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ut/PlIviMTZQFjIdTbO9OzUuyfzQXsbdwjRWeu0UrTE+PN8SxfB0eq2e0NkP?=
 =?us-ascii?Q?6eJu35xaX/iWotOhHg03w2DhQy3Tw7zyj/P2smE82jRZjDSCn03xh8TRG5Kk?=
 =?us-ascii?Q?jFmbnI7UDQpds9rnOeYxH7SytSsmPEdAG0iZN/3cRl/2ZbiM5R4vMKRX3ggD?=
 =?us-ascii?Q?3EPGRDb0DZUoCwebfDwINo2HoTWMqbLZKzAfIOX4Sk5liGdHRcm7hoMPmUrf?=
 =?us-ascii?Q?3IXkdcRh6KOPR3eqjdDzHGugQO7A943DLEn5+7i3EJHWBtNi42Ox5Fnvz2uf?=
 =?us-ascii?Q?6Y7mzV2O/ASIvMOxCJfeF3no5t1ZqJGluqdN041mzfT9l87Xelks75TzgwnF?=
 =?us-ascii?Q?+dqtDgpP8lmxMOdV7DTHy5JqcVyMtmzuP/nqHoRYVb7590FDbcdaHqbO7MQM?=
 =?us-ascii?Q?yL7L4I5TcjDdDiMmpvoxNDXW8Zl13nkbPMTPEX+Zs2RDNgaQR2sUOyvlDxQX?=
 =?us-ascii?Q?eSKET4V6v4kX9aj5QL0WHPVS4tcKgGoRgkninmlUh82ayO9IswLE5DJwR+Qw?=
 =?us-ascii?Q?S7MEv0og77WhpIoAsElNkbKdeGNr3WW2WF+x75qkYIVgzHwAEve9iiIJsptk?=
 =?us-ascii?Q?dKNL4b9oCO/R6QqGy75msu6fJ5BhbqaEsN6sryUU4ZZQ+Iq7b9zA/nXrVkrN?=
 =?us-ascii?Q?PeBvKa9qDKn6fEdq1NrNSU4P3ZMN5NtCe4fLcyncwQoDbgIf3oQWnYBs8mNc?=
 =?us-ascii?Q?PQJxDlpvGgk+jvnC8zEPS7WYqbEH8wWQh1tTxPKCfghM8PWWBc9/JMjkNWK+?=
 =?us-ascii?Q?6maBLcPa244rJIRSpdfSwHz6p3FtRnz29GS19PPltJHYU7M7RZ3wzZUJTeVN?=
 =?us-ascii?Q?+KR91OpFRjHkc27q517qT75bEgO/FvQFuirULrtv35EySXeVWfRRHH0Cl+O2?=
 =?us-ascii?Q?7bQk/q2wbFbHoE4P82CUHYGdp3VhgVblZDwgD0OhDS5ZSTiQMSkL6qoGtWZ4?=
 =?us-ascii?Q?6HQ2SMDbC4qAQpBpzIiXEBpOrklQ3nezrvz4zRCBFDeM5KKXNlikJXe7JoH7?=
 =?us-ascii?Q?2yR7ygyJYwYEpSNaqxsD2Z1TZOxERv9SiVX7EJhkCNcV9kFNPz2ei50OYDzA?=
 =?us-ascii?Q?qV3a4Ws0pZhDaPhiPwGE4aK6x9Og31MPUNA4902RrYm2B2SkZOq5cMCl3+xh?=
 =?us-ascii?Q?qG0sAInt1qmST860pO+vsc9BFYEwhpgExjiNDihTR/fkAxu03sdIiRHGh56+?=
 =?us-ascii?Q?WfWY6i6s9V+I6/+Iuu6xlmx2YIPm5wFGv8eUAIezfN658OxtHMpteH/eWXhM?=
 =?us-ascii?Q?gy2EmFQki5iOHPG4RFQgEah1DpT08i7lctA7OS0N5EMRY77Y5m8KDmNu3DZT?=
 =?us-ascii?Q?G5yZ4bM0ZdlK+d7Ml/x3AV5scCi9SbPCP5FMWPAhFqeHvm7BHqKcJu0Jq+bF?=
 =?us-ascii?Q?yfxU3ia430853dQ/zXIPMrFl/TBVfBAK02MLbsaImsRMkx+30rNpT3+sZI6A?=
 =?us-ascii?Q?bzyUtlsPl346r9gf8J8UgEmqsFcPJZtSWNgATtu0db1jbbHI4mNs++VeQeLC?=
 =?us-ascii?Q?0bj//rBK6o6cDooWUR+obDNtkNPxUe/9x/uzB0JwQ8/+c3on5VbiQM08EMvj?=
 =?us-ascii?Q?HJa4nd2FDpKUentgQu8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3474237-cb2b-4b8d-c838-08dd7b414f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 10:44:18.9116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmZ5uKa7HRdWOpzxd6yNgQtBYorcLtBOL9M2N5ipkzB5nUHAgUziv28plJW1Z72I5/DQ4z70iCyyMdo4mBJFnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9503

Hi Sudeep,

> Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> driver
>=20
> On Mon, Apr 14, 2025 at 09:57:43AM +0000, Peng Fan wrote:
> > Hi Sudeep,
> >
> > > Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> > > driver
> > >
> > > On Tue, Apr 08, 2025 at 04:44:29PM +0800, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > The i.MX95 System manager exports SCMI LMM protocol for linux
> to
> > > > manage Logical Machines. The driver is to use the LMM Protocol
> > > > interface to boot, shutdown a LM.
> > > >
> > > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
> > > >  drivers/firmware/imx/Kconfig                  | 11 ++++
> > > >  drivers/firmware/imx/Makefile                 |  1 +
> > > >  drivers/firmware/imx/sm-lmm.c                 | 91
> > > +++++++++++++++++++++++++++
> > > >  include/linux/firmware/imx/sm.h               | 14 +++++
> > > >  5 files changed, 119 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > index
> > > >
> > >
> b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f83081
> > > 0f8ba376ece9
> > > > db93c8cded6d 100644
> > > > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > > @@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT  config
> > > IMX_SCMI_LMM_EXT
> > > >  	tristate "i.MX SCMI LMM EXTENSION"
> > > >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > > > -	default y if ARCH_MXC
> > > > +	depends on IMX_SCMI_LMM_DRV
> > > > +	default y if ARCH_MXC && ARM64
> > >
> > > I can't understand the ARM64 dependency on this and next patch.
> >
> > ARCH_MXC both supports ARM32 and ARM64.
> >
> > To i.MX ARM32 platform, there is no plan to enable SCMI, so only set
> y
> > for ARCH_MXC ARM64 platforms.
> >
>=20
> OK but why is it different for IMX_SCMI_MISC_DRV. I really don't see
> any dependency. If it is not supported today fine, but do you need any
> issue to use it or compile it for arm32 ?

Seems my over-thinking.
There is no ARM64 dependency. No issue.
I just think there is no need to default build in this driver for i.MX
ARM32 platform, because no i.MX ARM32 platform supports SCMI.

But after a rethink, ARM64 dependency could be dropped, because
there was already a dependency ARM_SCMI_PROTOCOL(i.MX ARM32
not select this option), so we could follow same as
IMX_SCMI_MISC_DRV.

Please let me know if I need post new version for this and
Dan's comments. Anyway, no rush.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
