Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE925A642;
	Tue,  4 Feb 2025 00:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629116; cv=fail; b=OfrEalnbp5y/0h4GDCBRgP7MgmROna5gDDbR7IrtW6s8OKOWicoAgXUTXZ7CUeuVSocMsZshDoo5rWDwg6X4hHHYRT2wxHcQRnhCYZV1BY2ujmq6WsKU95o1wxAZYJ4UwyZ2dkTdFafNNvsjsZc4MCjuPELSC35J26t1jh0lTRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629116; c=relaxed/simple;
	bh=D6scqiNc8BrnTQk8HmbpSyo7wW8G+QrJ26DjvUP4gUI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LxKHF7qWQXni9FVbZkL5zQFprtjKeTFdF4lLc5l30VjPvNVgazOBLbk2tligrgg4csm3AID1X6O6P8Fdv66ZJk1ex9Nw1fegEIw1K3DTg4+u0e3EilYnUbeyFQSEe1obtj8MxVvHuk7MyCKWCsdKoHR07JZzl2qKLdv2xyFkx3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GiTqPw/N; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GiTqPw/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr0QNh5dRqTCiOQziV91eeFxAuUP8ZFezfIVBxUjEMFzrvEjAgPadyB1gegrzJTB/ftkUeW5lqKn2iZ203GGDjvXSEXHce42iwcgb+wR3TbSzT9CNy5wn873bS20DvJaiQ1hAg6qMp5zIsigcRnR6SFD2wAncNUeHY0UYeRksn2r2mFAcqQXSQbJWe33cK+Wl882XIh/PwKyJpmUET38At+/wJNNg7AZ7Z9UjmczOefVEkM7gqz5LRQipVMxlWsz1ZCi36/Tq/nMW01wsUtFdMUOx1NKkVkwKCmA2IXmWzHjc1O2wz/5Pow1d9x8p8rsmu4TWp6FZtd3DFCvpo6u8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg/NkLEIZXZOFoFflG0mvw394osTetDcPat5MxcW2UQ=;
 b=Jr+GIULJTlBHJVWueZilye2TBa5yA4j92GIg864jV21evziW6DD8/bYp87ebJ3S5Ctj2Ly7knQXxbV850WdTgzHWBR6bjsEWaxBts4f5GN3R/q9slezJy+ptKop5WwBnacsT8xOJ2jCrJBd2xMU8NkDgB/EQRlbGL9PQBmVOE8Dm1Ie8FJzQl4HGdqvLgmtmP+mUP8Q8reHqzVypipqVAnccDE0hlv9SJgUhhU1+0kpE+L6xgcZeU/x/0+uf08YjkFHEVohbML5vOEUwJa6E4M7zbwuWbwu+x45BzjemVYF225tFW4DNl+QM04W0UaHfXk1rcYvpylF8qEjUx/FfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg/NkLEIZXZOFoFflG0mvw394osTetDcPat5MxcW2UQ=;
 b=GiTqPw/NHKVS4syaAB9YPzGFf+kdj7zaKRjtBhWwG+bTfJ2Jz5B0x3lBVSYvbNfQrxeSkRpBDfa0myDCIySR891iblK/Y8rvkD2mts3quffIVVK94Zv5ebMHzT88MkIU1SLcFhLBoNQ4fPZc5i8hdnQPGRVTP1fnlWM0qpBDZHBLgIgEPhVyjkW8WXTrDYZw28rB9fCxTvEtcNc0h1CnlKuVB2DC0/1rkryrSazRTDK92eRAz5mwV86Ne6U7+zFYsCvj9Zu6sYbj6nFHuujWdOrrkW+NTHMUkNsye+fzHkZLqHPBRITvGil9+89kpUOo4YgG7OuezRKMxo0Md8o/aQ==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA2PR04MB10259.eurprd04.prod.outlook.com (2603:10a6:102:409::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 00:31:51 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 00:31:51 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Sudeep Holla
	<sudeep.holla@arm.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Thread-Topic: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Thread-Index:
 AQHbbmKMggQuGIQl9kS/5NYaA5p+OLMsqMQAgAc45gCAAYHFgIAAIpEA///5GICAANY84A==
Date: Tue, 4 Feb 2025 00:31:50 +0000
Message-ID:
 <DB9PR04MB84613DADFD29C8592F7D511D88F42@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
 <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
 <20250202104256.GA13402@localhost.localdomain> <Z6CPy89TVxV1jaDn@pluto>
 <20250203114722.GA20298@localhost.localdomain> <Z6Cm_4XTRHdDluhh@pluto>
In-Reply-To: <Z6Cm_4XTRHdDluhh@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PA2PR04MB10259:EE_
x-ms-office365-filtering-correlation-id: db15993f-2485-4e92-d1f4-08dd44b35145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-7?Q?1aHs2+GEGaW/IzI/ZxegNwzOLM8hnKHMcoL0ZUXOTjQxHcjptWlC0qGxsw?=
 =?iso-8859-7?Q?KhF/IXdnplxvQ/fm504gMKidxRp301JmMId+oOMOfoZYZcRBB9qXcFFrTi?=
 =?iso-8859-7?Q?3zoh3odyqkR5KK28lDZ1LATaXcyWQi8gdUZ7L1TdYlPHN8ujYR3WFB/eqd?=
 =?iso-8859-7?Q?Ivoq7H+18m5ETvR9YJOpK3yFEL5csLx1/BmIbUu+77wC6nLtoOVKDN5iez?=
 =?iso-8859-7?Q?MXAkKhcQrJBy9ofT8ybh3GlSeTPi/cdHEmrVSKWR3l2Oe4d44wb5eaON0S?=
 =?iso-8859-7?Q?rcXswiAGFP1xEye6shjoo7nsosHn12rA2/3N49t/1VWcxIV0767UHKX2vJ?=
 =?iso-8859-7?Q?OQGGscZlwgOqwXG7zkNtpPyF/q0wyCEkoTuQRWc9mqqABNF7boUGG1Vc0g?=
 =?iso-8859-7?Q?r/zLr/5qYS4feUQFcT1OfuEozoP++qJ+/x6cTiCbHVbkBxITqwGVmDck31?=
 =?iso-8859-7?Q?XQ1fCtdmzsHz0iuTyLMl0Sq1vNKoqmetIBbvxjJBdGrbRPiHVovOXziRgm?=
 =?iso-8859-7?Q?ooEOlrZGHdZ0nhxLqsTd/kjLz7IaRluw/ZgMDH19RgKKBj3tFuKmkuHFjV?=
 =?iso-8859-7?Q?MtHmug5vY2u51uHOlM88nNHvF7Rj7RRv5K9Qrthgrl55AZeRNX8mOaMEhv?=
 =?iso-8859-7?Q?nJ+eMftLJbzO1vZ+UGNvr5ljYhwv75Ya6ig2ISetNLOruihkUHKs6c/jSs?=
 =?iso-8859-7?Q?q/+K7A2oz6RsoBfFBHwsYGGE+MjInYkvpFhZnBsKJF0l9Q4FUwWvgjobuS?=
 =?iso-8859-7?Q?yi4FwtUC5sYsllYF//COLHg76WxG2KUgAKCKhIFwsW9Bhtc9bEFjq8oF0K?=
 =?iso-8859-7?Q?AW25ayjLac8ZrHjAteT8pq0eeny54Vfc17lK8AlWHJwdUkuqdEeG8siZOb?=
 =?iso-8859-7?Q?WGm5LyELiJhjv9lqrOsnG9j1RUv5ujxN4oPX7UyASYr9buazo5RlSuyp9Y?=
 =?iso-8859-7?Q?uyN3u38moOTx0qff8vqtISiz1IMPlpjx9l365eDqzFhUH84alJvrO/r9qG?=
 =?iso-8859-7?Q?vSGw/h3GWd+O5Vnel+2Rpeg7CYPb6DItvNQ/P/JbLIh6CDQ4b8WFXWmy4T?=
 =?iso-8859-7?Q?P47Xob9dwGFKW4o3A09D1LPafhVjHMK+JWVM3PqhbCliSyKB7pWy3F/+/G?=
 =?iso-8859-7?Q?siLZ3YEdhW+8H91E0dVPos7sBMH7elQqdDcXLla4jd800skjLuTkhqL/CD?=
 =?iso-8859-7?Q?SaUpF9uq30CxE2WIuDc8Al/RGwWyGx9wirVLuvL+9ZZBq1mTa7czcaKvID?=
 =?iso-8859-7?Q?FMIyJg+CDd5zp+ACHh9K1XSAngRXZ5+o8HaDl8D6/MfWyg9WZjyJXEOKBm?=
 =?iso-8859-7?Q?mkNYGc0M5b4TV773FUZUyjYHm58aEI0xmnpXbhRYxbPeI9mEft77WcXwv1?=
 =?iso-8859-7?Q?dnfUDLKaZI9W7GZRCfU8rm6c9MQTmiEo4qQxJb8Jwa18+gLpWmdaQXa0Kp?=
 =?iso-8859-7?Q?bbA7M3vMxCKXjJRI7UtxIlUPMvM9HPykHJYnYA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-7?Q?8XZp8e4HFOSLheMc6jS2p/BS6RSrL/lUOxVFTJbDRfPcKLEAzlWMgZi11p?=
 =?iso-8859-7?Q?DtXFbGZhKkGldG2ogEQYO9x+xAlBSM8PdqNYxMXk5Gjqx24o6lDBg508Co?=
 =?iso-8859-7?Q?CTWE1L75ru8InQYsjam2Yqh3BZG/qGGU1bvGa+Z9EncmChmvnn6wX2JOSC?=
 =?iso-8859-7?Q?DIfdQ2VGRaWI2irAQLmGG8wF1fKzqbCx6NDs+yUs6G7Y+gEzJtVw6XMQ3S?=
 =?iso-8859-7?Q?LHFOaCte3zBWtdGtSWtZ92wtTB+6dMospXjKsuqGaThgXT+nl8WskemQQY?=
 =?iso-8859-7?Q?qoz9WCDM3K3EAtXZLh7xatdl3Gi3b6WLLzzunwfHIwXZ8FiVHI21TZGiQc?=
 =?iso-8859-7?Q?giF71kv/yg4kkdJwwFAt3ws1wvp4xBghmzFEBMAgw9gHlqLEw0a21bYeEY?=
 =?iso-8859-7?Q?EmTX9dTKgZHkmCqnK47deVrRGw/333mwQn81HqIs5hSNSZ9DoP/XfyAShC?=
 =?iso-8859-7?Q?FaZ0dj6HnbhsuLzZOhRNhE8JiemiXHhJBuLaxVA1x/yx7A81qRoVhlGFF5?=
 =?iso-8859-7?Q?wGY7OhReotbkXXIES7I3UeM6lZT4TkaNJxPbL10tIjBtvne9hU6NM15yXP?=
 =?iso-8859-7?Q?9WUcXZ63rC1VDWXbclwAg0D03Nd6KdiSiEeHIbJ+5OJosxRa/VIWc3Dq8Q?=
 =?iso-8859-7?Q?Ndcm2ea8b8KMIvR/jy1l0y77TTR1PrJfKW+/r9zdB+oFys9XE7BtfWw9gY?=
 =?iso-8859-7?Q?Z3ERUL+rJk4h6sODxCfD2WWwJxdmTXVwrcmLJuRQTWvXJkSvasx5hI7whg?=
 =?iso-8859-7?Q?het2HGoqmxVh+DHHhHwwdp71j6Txh2zq2IjjCa3RpU3R0nIkMaUACOQBSD?=
 =?iso-8859-7?Q?ajXH3cplR8An7y6uOvDKNE9zf55VMt+S0n7h0O0BxPWX5M23v9//QzIQka?=
 =?iso-8859-7?Q?216rUdX7k+N+3LNP3Wqodhz6fehR96fe7P3LqhGja2WR6p4aSjZgxxJGD0?=
 =?iso-8859-7?Q?xy83l+YwEofMuMTippYFVTgoaGeNKBmF+5bOnpELOyc21if9lH8xtdbR5B?=
 =?iso-8859-7?Q?X3UI+jXG4JS3/7QuVZ3EXQEXwVI/5DqACGJMEcthgUD6b/sPq7kCl3YZMh?=
 =?iso-8859-7?Q?ZLuqFB1J3DzmIpGGZ5YhO5K4tjkS+CRtKrTY2C/zR6oKUYocVdhyqvdV13?=
 =?iso-8859-7?Q?owH7qC0VAhYBzCbTu60MebtnQ0bxPn5cwMKSzLOThQY1IWLOpKgB7+Z2NO?=
 =?iso-8859-7?Q?osSY/Bd6g3qz4osn4vXPjJsS9aHm34tv2Y6b9Rvyo2KmM1ZuFM1BOAypy/?=
 =?iso-8859-7?Q?kiQbnbxLVQEAgGsa8rAFh1nENfzsOG3JcfCi3NFp1eG8WhcCm+fFs6EIbR?=
 =?iso-8859-7?Q?7vn9Moo97lxHy3rXKQyfGE2Z2PBZvbfpLPAA3tP/zMjr93FZ5JnjgvdkSo?=
 =?iso-8859-7?Q?7GAt3g5pzIXHuFa3S/Fs0ifQ13yBL0VoU/zx87PcxZUc+IS1zrpiuCqyMh?=
 =?iso-8859-7?Q?9ab/JRKuwCzgiNvRzgTmoh6PSVnmoaI2mDVQL0EtXInj6bErgUIeNxuVN5?=
 =?iso-8859-7?Q?ecyITFPBm3ODC09H9ctnu6WANdw5cegh/+byk5AGfom1I2cCtrYJKZXP7L?=
 =?iso-8859-7?Q?GFoQbTEpJK+ggvxdLE2rKWKRd+REhFU25fCnEyx5J96ZQPaJ8xH5jVtUEH?=
 =?iso-8859-7?Q?7vPhaMZ83kMas=3D?=
Content-Type: text/plain; charset="iso-8859-7"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db15993f-2485-4e92-d1f4-08dd44b35145
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 00:31:50.9648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K7/UnKVoGMhkBuC3hjIzpVKL+DLeTWap9d8Q/1vggBmt00wRbEnWNLw2Qp4aVBc8hMDhCSuuetn8J9mqW26Nag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10259

> Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
>=20
> On Mon, Feb 03, 2025 at 07:47:22PM +0800, Peng Fan wrote:
> > On Mon, Feb 03, 2025 at 09:43:39AM +0000, Cristian Marussi wrote:
> > >On Sun, Feb 02, 2025 at 06:42:56PM +0800, Peng Fan wrote:
> > >> On Tue, Jan 28, 2025 at 12:25:28PM -0800, Stephen Boyd wrote:
> > >> >Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
> > >> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > >> >>
> cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b7
> 36e3c
> > >> >> 2751eeb38dc4577b1f 100644
> > >> >> --- a/drivers/clk/clk.c
> > >> >> +++ b/drivers/clk/clk.c
>=20
> Hi Peng,
>=20
> > >> >> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk,
> > >> >> unsigned long rate)  }  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>=20
> [snip]
>=20
> > >> >
> > >> >> + *
> > >> >> + * Configure the spread spectrum parameters for a clock.
> > >> >> + *
> > >> >> + * Returns success (0) or negative errno.
> > >> >> + */
> > >> >> +int clk_set_spread_spectrum(struct clk *clk, unsigned int
> modfreq,
> > >> >
> > >> >Does this need to be a consumer API at all? Usually SSC is figured
> out
> > >> >when making a board and you have to pass some certification
> testing
> > >> >because some harmonics are interfering. Is the DT property
> sufficient
> > >> >for now and then we can do it when the driver probes in the
> framework?
> > >>
> > >> I suppose 'DT property' you are refering the stm32 and i.MX8M
> SSC patchsets.
> > >> I am proposing a generic interface for drivers to enable SSC.
> > >> Otherwise we need to introduce vendor properties for each
> vendor.
> > >> And looking at clk-scmi.c, we need a generic way to enable SSC, I
> think SCMI
> > >> maintainers not agree to add vendor properties for it.
> > >>
> > >
> > >To clarify, from the SCMI point of view, I expressed the idea that it
> > >would make sense to have a common SSC interface on the SCMI
> backend too
> > >instead of a custom NXP since you are adding a common CLK
> framework feature,
> > >BUT only if it turns out, from this discussion, that a common general
> way of
> > >configuring SSC can be found...and I dont know that, so I am waiting
> to see
> > >what this discussion with CLK framework and iMX maintainers goes
> before
> > >excluding the SCMI CLK vendor OEM types scenario...it would be
> ideal and
> > >easier NOT to use SCMI vendor extensions BUT ONLY if this NXP
> SSC/config generic
> > >solution is deemed to be really generic and usable by any other
> vendor.
> >
> > You may misunderstand. Using DT properties for clk-scmi.c to
> configure SSC
> > of a single clock means to add properties under clk scmi node, such
> > as:
> > "arm,modfreq =3D <x>, <y>, <z>;
> >  arm,moddepth =3D <a>, <b>, <c>;
> >  arm,modmethod =3D <j>, <l>, <m>;"
> >
> > And during probe in clk-scmi.c, the properties needs to be parsed and
> when
> > clk is configured, the ssc settings need to be passed to scmi platform.
> >
> > But per the i.MX8M SSC patchset that DT maintainers raised,
> > the properties(fsl,modfreq and etc) needs to in consumer side,
> > not provider side.
> >
> > So it is not feasible to add properties here.
> >
>=20
> Thanks for the clarification.
>=20
> > "assigned-clock-sscs" could be put under consumer node and clocks
> > could be configured with SSC when needed. This is a generic property.
> >
>=20
> Yes I understood this, the property that describes SSC that you are
> adding is generic BUT are also the related params needed to describe
> effectively the SSC
>=20
> IOW, if we add, as desirable, a generic new SSC type in extended
> configs
> instead of using a vendor oem, will these info down below passed to
> the SCMI:
>=20
> +       /*
> +        * extConfigValue[7:0]   - spread percentage (%)
> +        * extConfigValue[23:8]  - Modulation Frequency (KHz)
> +        * extConfigValue[24]    - Enable/Disable
> +        * extConfigValue[31:25] - Reserved
> +        */

From SSC view, spread percent(depth),  modulation freq, modulation
method is required to be passed to SCMI server. Enable maybe
optional(depth set to 0 should be same as disable).

The upper encodings using extConfig is NXP defined, we could
update following spec.

>=20
>=20
> ... be enough to describe the required SSC config to any generic SCMI
> server
> from any vendor using any HW ?
>=20
> ... or is it plausible and maybe frequent/usual that other vendors could
> need additional specific params to be fed to the server, so that we
> will end up using the new standard SSC only for NXP ?

I checked TI/STM32/Renesas spec.
https://www.ti.com/lit/an/spraby0a/spraby0a.pdf?ts=3D1738492934158&ref_url=
=3Dhttps%253A%252F%252Fwww.google.com.hk%252F
https://www.st.com/resource/en/application_note/an4850-stm32-mcus-spreadspe=
ctrum-clock-generation-principles-properties-and-implementation-stmicroelec=
tronics.pdf
https://www.renesas.com/en/products/clocks-timing/application-specific-cloc=
ks/spread-spectrum-clocks?srsltid=3DAfmBOoqSceW72dYO41RZVhT1YxhyKeXNhWUTfSr=
SCpfZt2A2cy7JgaGv

same parameters are required.

From ADI:
https://www.analog.com/en/resources/technical-articles/clock-generation-wit=
h-spread-spectrum.html
"
Creating a spread-spectrum CLK by dithering the CLK frequency is not as
straightforward as it might appear. We begin by defining parameters that
comprise a spread-spectrum CLK: spreading rate, spreading style,
modulation rate, and modulation waveform. Spreading rate is the ratio
of the range of dithering (or spreading) frequency over the original CLK
frequency, fC. Spreading style is down-spreading, center-spreading, or up-s=
preading.
If we assume that the spreading frequency range is =C4f, the spreading rate=
, =E4, is defined as:

Down spreading: =E4 =3D -=C4f /fC x 100%

Center spreading: =E4 =3D =B11/2=C4f/fC x 100%

Up spreading: =E4 =3D =C4f/fC x 100%
"

fC is same as spread percentage/depth.

>=20
> IOW the property is generic, agreed, but are the described params
> above
> generic enough too ? ...=20

I think so.

Thanks,
Peng.

that was my concern from an UN-educated
> point
> of view...of course, I am talking about the most common scenarios, if
> some other vendor ends up needing some arcane/magic specific param
> that
> cannot fit the above, they will be relegated to the OEM custom spaces
> even if this common SSC is available.
>=20
> > Back to NXP SCMI vendor extension, if SCMI spec could include SSC,
> NXP
> > SCMI could move to align with spec and not use vendor extension.
> >
>=20
> Agreed, conditional to the above doubts.
>=20
> Apologies if I have asked dumb/obvious questions, but I am not
> familiar
> with the subject matter enough...
>=20
> Thanks,
> Cristian
