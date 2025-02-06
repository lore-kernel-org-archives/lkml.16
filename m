Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A4D1A296;
	Thu,  6 Feb 2025 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802329; cv=fail; b=TVzv/EWJBQsexB49LlV0+dxNnSMK66+n4ma8pXXW++FhBHVxWb/YE5lN2C8Opj2uTElP8fVl6FCc2vTHthfRXIffOZmzoq6Qx1sEdBO971RX6AC94GJnENdQESoMtcOzM0eaQ2HKT+k394KKJXrmUNrIAF6JSHcwcZqrICePNXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802329; c=relaxed/simple;
	bh=cxcGY51yGECloJBUMLu4p12PXKDjbyFT0+4IJHvskCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZyYioaoKCSUwyGhLwlqIJTB2OFiMsgR/bia/VsHB+1xWV+qk1V0o4TB8W6Y/7onLlTgX0ALesZL11U2wiYd/ETVJr9LhyU61BkQp+CCZjLE+qQB6F0fMaw6HExfE5GklZocTomTQBM1GlXlLUV7Tr3xR7NVQq0Lf3k5sEcilfeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M6e2j1xX; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M6e2j1xX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRMPKeXoV3icxHsRft7G7UNArPN1fcOowimip9Lt311AzO46IkPl/Ydjuvrl5zPaTDptFvEKhTT7n1LHScB0IxwVg0s7YjF+BPJ2Z8tnIYi/N8c+c5vbGKQskQ+Y6KwQnAng9Sva0z3bVeOf/+YW97A8u1Hz/538rdwItMoLdTkcH+ZT8bvymabV+bzyqOq9UMJex0rHyODkxxVYK9k4QZhRjUu0wICc2RkGJsZAj96tFo8rvIq91fF9Z9+BVbFrxUGqSq6Ijti+pdBCZXEY0VrtUFyrKspJz/KKh8Lbz+H37IIt90gIvO5yNo8MkX2XOeQ3+oe/fRgoXK7hUT2Wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI2kfgxuN7HioO65MIUQgFYFRBOyBB2R1bl2JgUa5GA=;
 b=rEVBZkw2id13dW8Za7jDM8ZbTdf1qoaurzbEsgKkQiYKN6XitazDFWXNNvUx8cM0xevSCmcHZqYWcCmPi3niGgbIpdvXzQC7JJNfCSWlrmF47Ugb81y8ZevoPjiGK/YtZU59vEkNsxFcrRyBiXFYcBuBljdOxHp29M5s440Y4YjRNlrKIeRcfPBpGOSZU8nLjRx592WqNY2itQnlfkNu/0I0D17eIXzIV4a+QWz/MRGj4PId0GDONpRWAEYq3j2Aqt5Ob2NvS1iV0PbQ3D+h3n76U1amzi016qxldYyycnRW6BTB+CEn52Zco/Re+leoCwOZjSkiCXId3J5qZSlwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI2kfgxuN7HioO65MIUQgFYFRBOyBB2R1bl2JgUa5GA=;
 b=M6e2j1xXCa3jKwSRQ3w4NE3iW4Xxcsjxh9rsnbzaEHXaau343vmftG/8MPqEDk21Om3kRUr38y5HMTkZzUzjtolHpdSJAgGC9TOnj3ZuhNHBNhZFalPrJwOvRWGwp2sGucYccOjmqG7jbzNLvRtUBH+PTxCtqqwFXeXVF7y9OqoP8VAqI1gEvqgzSklrMgtBJD93bnZPI/fT771qsG6z/TGIPVKNrDhhAgVW5DgWk0tDaX56mfQ0r0yOz4SPCzrYmXiYP4iA9fB8SDHlAUdL48zmJpuVnJt7TswKEGv5buhTYmgSG7f84I60qJSme4uH9NAzt24FXN5q49xOL0NYyQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 00:38:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 00:38:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Abel
 Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
Thread-Topic: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
Thread-Index: AQHbd7NxpkaGxm6rAU+fLs8XnwVMJ7M4nDCAgADQBZA=
Date: Thu, 6 Feb 2025 00:38:42 +0000
Message-ID:
 <PAXPR04MB8459CDBB65AE57CDE780339A88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
 <20250205120215.if3egfj6vbnynwl3@pengutronix.de>
In-Reply-To: <20250205120215.if3egfj6vbnynwl3@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8784:EE_
x-ms-office365-filtering-correlation-id: e52c1567-b414-431f-9a10-08dd46469ba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OH3l8fGWIdNwibkx8Waqe5h+kqG//bysstEwmkbl6xdJuIU86lFimg+UozbW?=
 =?us-ascii?Q?leJZtrgftLY1YKAGdI0HJG8tJvzC5U69hxCuAmDw1aTZOYz1WEW99eQpvMIe?=
 =?us-ascii?Q?9fYJH6zqrDMD7e/bUexvpxhOlDTzwA2Zy32FsdJwTWxuxkZd2fyBs/CJZutv?=
 =?us-ascii?Q?YN8DWhDz5mGvm4070obqBQ8S2jSrJhKxR9edHAT7PNVhKp1bepJMp38Ou8Cq?=
 =?us-ascii?Q?MThwgEQbF8gL2Kyvzuj1i3jln/yUhOZ3zYlMsAu8VTz1ferrLbCOgGxHRiCV?=
 =?us-ascii?Q?3h5JH/MgAUDh81LTgHFOc+oujGsmUPr0ol3MkXXuoOnZTU6/be9fCCpzp8H5?=
 =?us-ascii?Q?RQ0qVVLPV1okHYv4kSCW7679QAruiQemV3fiJZZJjZVSy9xVPBStqSBFEYaK?=
 =?us-ascii?Q?EYpFiu2rNjYFHz6EGyZFEq2bZnEIYWknyK3pXc0Zb7pGCgwQMZFVQojfa7zd?=
 =?us-ascii?Q?cS/XDGBbjL12b+jzDU9D9oZ/ou1QM4PVB9l/nUUwkYb9QdfeR2wDBHPsfHp1?=
 =?us-ascii?Q?4Pu26FCzEEw55vvDmG6vH0z70lE3QpYFPTDSvm01m765WeAjTAA8DkypMdgE?=
 =?us-ascii?Q?3ejhNyPmKH7SBllqhJOQMlhI9Ki8sgbocSVzZpcWDjkw08jPUidwHmZdjsZ0?=
 =?us-ascii?Q?eFo0DZonbMub3c2nV6O+YUux5ATWonZBp6PdvAPCoMrb90Y75prVI3pXUuGz?=
 =?us-ascii?Q?5IRM2WonBQHLgM9RQYlDW2k2QQ0WTzMgN5zB09WgcTXUQJSQuQQGkg6bhOeb?=
 =?us-ascii?Q?NLkN0P8Hc/BTVplacLekkepaWJo9JlduhYErPwj6dAfnoDFqM6DrQ/Mi/4bH?=
 =?us-ascii?Q?e8En1LbS1xDSrRtyQ6Q9+BkQ6k+r2uAWKB1oQ3SKXv/DsPkX2JnyCnaGX/Dn?=
 =?us-ascii?Q?ZY6ROX9ajj6QbJBRdeUUqDbXlJo4lpKZvYynUCkT/MeNQaMUs0wBsbKgzV65?=
 =?us-ascii?Q?r8E5h6l5Q2sfRiyeu7WOdHZ+v/+AsI+oaSGlpDISdSN56eXHL40Kx0cmDHIX?=
 =?us-ascii?Q?ex0QFQknd6lX5ONH8OHJ5ebWhyEoOdrbyAWoPovcbJvOMDQxMLjpqY/CDrBT?=
 =?us-ascii?Q?zPD0L+6SN4H3MKGm8Wb91v/P+XV2+kFBtnywtZOO+lzFmDzVXXkiYdMOAob/?=
 =?us-ascii?Q?fSF/BhO5rhL1ojK/YS4v4Ijf4eGTgQT+QBM7bfbiCAlFjQ1QCWPxPH/AOBDQ?=
 =?us-ascii?Q?AJLfyrhTn0JLhAHJRXivvC0XbnV/teXprg/AjcttptfvjlCZyoJ/MDBl516y?=
 =?us-ascii?Q?0Vhq0DLOlfiW5u9RULgqRVfUQKfXGjV965o8Ud5H3GcrQWu/NVy6WbHeE8h1?=
 =?us-ascii?Q?Vf6krkyytde2PWNbDdTNPO3cFPghRRcdhON36T2HFhiMtvNQOcUstg0hVeKD?=
 =?us-ascii?Q?Me+FaQaCy/CojGmWU95h4X9dSp3UDDdu1PBFhgd4PHJnWgh5mO5Uidr3nntC?=
 =?us-ascii?Q?/bRmnEH9EkuafJ1UG4Q8RnzOuiMOw9v1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w1MaJusOvMn5IDBwrxPM8SNJNPInJ9oJ0qZ6s/Q1voJPU3s5J2tmoXymBe6E?=
 =?us-ascii?Q?6+4eS4kx02rstX1vRGHuii1U7IJN/W9S3kBbiYr9vp+qjyibozWMd/UGkdwr?=
 =?us-ascii?Q?5edWDnnr1gGu/JCWUDOIhdj76/fLcKh1+sr4c5ECHND1UAGd+H6HemfQDC5l?=
 =?us-ascii?Q?/7fx3gmL99AfXHsDtdJeogO/4aMzFKIktWfepa2gotuBDoObDqAqlMvyTfee?=
 =?us-ascii?Q?I9WbzqGAEIeMs8TIfLTaemIsF1r+dXA+pKApEWvY/FQ/IW11S8dB3lXIhY47?=
 =?us-ascii?Q?PQadVVMKya5A/KmFe08ksTixuf9kOTEvSfQoApQCrsc8WagbWg2DzdXW/ixb?=
 =?us-ascii?Q?KfblbEPyaFdx6pT9AoF4lU4g9xcPG111bB6HAnOtv2IZ3eCs3fsdiF2ibddw?=
 =?us-ascii?Q?reGy2xPeRiLy1n10/at3o28hf29411/xX0PFrKSKr5Zci/EzXfLjNoqVzdpP?=
 =?us-ascii?Q?PXmhKz6PjDziuKCNO9eLUqYHwB8OXXjMevibVMQ0GhCCK8J1eO0fiBIYezyN?=
 =?us-ascii?Q?Bov3oVu1a2jDx35eUhJ4F8RWrvhg5AyzGBV3yeXqoVZdvHQ9ikHofxuWFJrR?=
 =?us-ascii?Q?YxDGQ6LMjO4dN5gxGc4Xls2bcCL54LmzLkOObyB/f20tda33QQo5yq/LCbEA?=
 =?us-ascii?Q?sxdi+8BUKHQM0Ks/06sR3ZP95ex+woqe+eeot/JPTmzldzTSdhp/JnXgXjo9?=
 =?us-ascii?Q?z3SMAN5ieuLYTwjP6f/GRqdupQM4OK5Qt2RJsffBCAdCJ0aqzdsA0wTRXyef?=
 =?us-ascii?Q?AfQuSewl6mbFf304G8sTdZjDRGmOFaliN6ObhEgzJbR826s/jSh4rdWX6M1Z?=
 =?us-ascii?Q?Ir15mZnJEcFLZeZq117XXEX206U+nxc9h333MMDx+frouSUI8dBY2xluZ+Fg?=
 =?us-ascii?Q?qeHXtF7NQoXs9mRzxtzUbQOoxqGSxJXQXYIzoWMLvOsG1cC8gBY5ERit+LWQ?=
 =?us-ascii?Q?ZFZ26Snl6KwUcxM11nCT7nUwGYgdDWjJ4aVZ08UKAgn+Jl0+6jnC4B69AaHJ?=
 =?us-ascii?Q?prY08kQLrekQ3yniVt8wwqDB+rBmnNTGSHDSqNjFS8bpFAOvc6hx4RGrPMcK?=
 =?us-ascii?Q?qcEVz4TnvR0NCgSd03L0QHvKXltswbDIvrttXVQdUNuIFker6FvGr13e5FYp?=
 =?us-ascii?Q?ORLV3EhoRM066oPDDaiza2AB8BOaMjZ+IPB/DkK6Mau1fwnxF4NJesBrxh6w?=
 =?us-ascii?Q?/XthXqhnR7OmA11ys23McBEG7DSOmwuaWfwLH6xfq/vePk7oYGrCOIVlpms2?=
 =?us-ascii?Q?t2/AvkAmE/UGkxvCJ5r+kCShfCh+isYr4pd38uXuENaMouutZem2HkpycW1n?=
 =?us-ascii?Q?qKQ/VSGphWjAG7VbQc8uSaSJnRt2lXDqX/pWddI5ZanU7GIAt7reu05hY94K?=
 =?us-ascii?Q?SbDiMWCLrT5ebWJExTv1AnwtpniQzuSBXI98gSUoe9IvDvbBNDeZcrYuPFts?=
 =?us-ascii?Q?6FLiHXz/ATkzRmrS1a9u/hAL6i77JVjwutPiXdGl3+4C1XjtozOEsJB9FdxW?=
 =?us-ascii?Q?03JSeHoKOrqE3c5YGz34uGe42TQqZK/+vgvURPIOWE6wo7gdcFwa4S2o7V8z?=
 =?us-ascii?Q?7BYLk/mLAQDx1cN7p8I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e52c1567-b414-431f-9a10-08dd46469ba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 00:38:42.8973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2AakKGqPmKN5RtSF+RnBudKmA+SNscNR81CpzTSLuml8ajblK73cwztVjOE9C6AiOyeg0StXhjQEJcTLWqNSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8784

> Subject: Re: [PATCH v2 1/4] clk: Introduce
> clk_hw_set_spread_spectrum
>=20
> Hi Peng,
>=20
> On 25-02-05, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add clk_hw_set_spread_spectrum to configure a clock to enable
> spread
> > spectrum feature. set_spread_spectrum ops is added for clk drivers to
> > have their own hardware specific implementation.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/clk/clk.c            | 34 ++++++++++++++++++++++++++++++++++
> >  include/linux/clk-provider.h | 32
> ++++++++++++++++++++++++++++++++
> >  include/linux/clk.h          | 22 ++++++++++++++++++++++
> >  3 files changed, 88 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> >
> cf7720b9172ff223d86227aad144e15375ddfd86..e11f9615e683af52c7
> 19d4c8419b
> > d30f369f301b 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2790,6 +2790,40 @@ int clk_set_max_rate(struct clk *clk,
> unsigned
> > long rate)  }  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> >
> > +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int
> modfreq,
> > +			       unsigned int spreaddepth, enum
> clk_ssc_method method,
> > +			       bool enable)
> > +{
> > +	struct clk_spread_spectrum clk_ss;
> > +	struct clk_core *core;
> > +	int ret;
> > +
> > +	if (!hw)
> > +		return 0;
> > +
> > +	core =3D hw->core;
> > +
> > +	clk_ss.modfreq =3D modfreq;
> > +	clk_ss.spreaddepth =3D spreaddepth;
> > +	clk_ss.method =3D method;
> > +	clk_ss.enable =3D enable;
> > +
> > +	clk_prepare_lock();
> > +
> > +	ret =3D clk_pm_runtime_get(core);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	if (core->ops->set_spread_spectrum)
> > +		ret =3D core->ops->set_spread_spectrum(hw, &clk_ss);
> > +
> > +	clk_pm_runtime_put(core);
> > +
> > +fail:
> > +	clk_prepare_unlock();
> > +	return ret;
> > +}
> > +
> >  /**
> >   * clk_get_parent - return the parent of a clk
> >   * @clk: the clk whose parent gets returned diff --git
> > a/include/linux/clk-provider.h b/include/linux/clk-provider.h index
> >
> 2e6e603b749342931c0d0693c3e72b62c000791b..ac0270cc9ec13395
> 4b1f8dcffed0
> > 15723bd1ff5d 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -84,6 +84,28 @@ struct clk_duty {
> >  	unsigned int den;
> >  };
> >
> > +/* Aligned with dtschema/schemas/clock/clock.yaml */ enum
> > +clk_ssc_method {
> > +	CLK_SSC_CENTER_SPREAD,
> > +	CLK_SSC_UP_SPREAD,
> > +	CLK_SSC_DOWN_SPREAD,
> > +};
> > +
> > +/**
> > + * struct clk_spread_spectrum - Structure encoding spread spectrum
> of
> > +a clock
> > + *
> > + * @modfreq:		Modulation frequency
> > + * @spreadpercent:	Modulation percent
> > + * @method:		Modulation method
> > + * @enable:		Modulation enable or disable
> > + */
> > +struct clk_spread_spectrum {
> > +	unsigned int modfreq;
> > +	unsigned int spreaddepth;
>=20
> Please use per mil as unit since I noticed that 0.x% is a common value
> too.

I use " The modulation depth in permyriad " in dt-schema, since
Dario said ST chips has permyriad.

So change it to moddepth_per_myriad?

Thanks,
Peng.

>=20
> Regards,
>   Marco
>=20
>=20
> > +	enum clk_ssc_method method;
> > +	bool enable;
> > +};
> > +
> >  /**
> >   * struct clk_ops -  Callback operations for hardware clocks; these ar=
e
> to
> >   * be provided by the clock implementation, and will be called by
> > drivers @@ -178,6 +200,11 @@ struct clk_duty {
> >   *		separately via calls to .set_parent and .set_rate.
> >   *		Returns 0 on success, -EERROR otherwise.
> >   *
> > + * @set_spread_spectrum: Configure the modulation frequency,
> modulation percentage
> > + *		and method. This callback is optional for clocks that
> does not
> > + *		support spread spectrum feature or no need to enable
> this feature.
> > + *		Returns 0 on success, -EERROR otherwise.
> > + *
> >   * @recalc_accuracy: Recalculate the accuracy of this clock. The
> clock accuracy
> >   *		is expressed in ppb (parts per billion). The parent
> accuracy is
> >   *		an input parameter.
> > @@ -255,6 +282,8 @@ struct clk_ops {
> >  	int		(*set_rate_and_parent)(struct clk_hw *hw,
> >  				    unsigned long rate,
> >  				    unsigned long parent_rate, u8
> index);
> > +	int		(*set_spread_spectrum)(struct clk_hw *hw,
> > +					       struct
> clk_spread_spectrum *clk_ss);
> >  	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
> >  					   unsigned long
> parent_accuracy);
> >  	int		(*get_phase)(struct clk_hw *hw);
> > @@ -1404,6 +1433,9 @@ void clk_hw_get_rate_range(struct clk_hw
> *hw, unsigned long *min_rate,
> >  			   unsigned long *max_rate);
> >  void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long
> min_rate,
> >  			   unsigned long max_rate);
> > +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int
> modfreq,
> > +			       unsigned int spreaddepth, enum
> clk_ssc_method method,
> > +			       bool enable);
> >
> >  static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw
> > *src)  { diff --git a/include/linux/clk.h b/include/linux/clk.h index
> >
> b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e
> 11cd3b927688
> > 96c4e45c4e7c 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned
> long rate);
> >   */
> >  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
> >
> > +/**
> > + * clk_set_spread_spectrum - set the spread spectrum for a clock
> > + * @clk: clock source
> > + * @modfreq: modulation freq
> > + * @spreadpercent: modulation percentage
> > + * @method: down spread, up spread, center spread or else
> > + * @enable: enable or disable
> > + *
> > + * Configure the spread spectrum parameters for a clock.
> > + *
> > + * Returns success (0) or negative errno.
> > + */
> > +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> > +			    unsigned int spreadpercent, unsigned int
> method,
> > +			    bool enable);
> >  /**
> >   * clk_has_parent - check if a clock is a possible parent for another
> >   * @clk: clock source
> > @@ -1088,6 +1103,13 @@ static inline int
> clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
> >  	return 0;
> >  }
> >
> > +static inline int clk_set_spread_spectrum(struct clk *clk, unsigned
> int modfreq,
> > +					  unsigned int spreadpercent,
> > +					  unsigned int method, bool
> enable) {
> > +	return 0;
> > +}
> > +
> >  static inline long clk_round_rate(struct clk *clk, unsigned long
> > rate)  {
> >  	return 0;
> >
> > --
> > 2.37.1
> >
> >
> >
