Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6421A434;
	Fri,  9 May 2025 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787241; cv=fail; b=ggRTHk5iaEutZsXafruiEOo65Jnq9gEneRHjeWJr+60psdOh260jMc9mB22MyNE1ixAZUaPZZ8eK/Kx9pZCf4iBu5ObN0sKOqxp+2HZusmNtO1S5I3vRXxvLeRBZSCldBltoCu2PMC+vSNp3Ifv1ugXXr/yvyGI3Y2RxQaiorJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787241; c=relaxed/simple;
	bh=X9iJDbOs++a8sRv1zI+XY/0/W6818MwCr1ta0PiKfWY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YVAqUpVOXg1LygrXwuBGt6ZbGwH7qpEN6Itr5UpYNiSXGxbdERassmZhxGekF1a1+Q2zqA97hYht3fVRxI7L0oiE/bmKOBu3IoIRTScklCqrMBLgoHhIn1qODa660RHS0mxvrhiJWP0FNnBCLjsDVxMHDAyRmd2kZk4+ODPgzLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NYLSckKQ; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NYLSckKQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipubFdzC8cBoTO0KdlOedygDoz4BQfvPn0qBrb4nqHbsUOmAqku3DjJ/C6T+9+Fd89K15ZrB4MuSH36jQalTV3ObpqHlnndNQO0/S88qyCCItuO1D+TE+YfRsRtqmv6PsCbKf0sG4hbcLBs1w8CsLqP+fUI7T+klrMtp1Aces2UKHNlUGizX1lcJNh1fOH0k1dzQJKfUJ5LA8fSyjM5dSBAdo0zVDMj7XLj65HJ/JoJFsNB/BLh6gtPAvFkYopT9ABL3ETzYR/viEnDPRjE+P6ZEIscEsZBQe099qdMEhynwCOeVHz1k3sOVAcQjW8mIK6jD55i9Z6GBpWVnva+HTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPmM1cj7w/fl9sDrJwpP30i1F1/CuevnmveT42xPXwA=;
 b=Oyhvf9SIIfFmCPMO8QI+TxmXYeq0wYfbk+mW9bcu4HZzyzS7zU1QBO72awEok9Jkt0j7qyGCCqEbTxW+qyD/diND07wHqU4hmePM5inyjO2SAOFEr3Gjz/tETdOuoTeJSUCa9cwcMZV9EHNo53QibC/JW/c/unsWdD/zFhSaAYl8vrlWf30FztAEbZBjXHINgQv39E7qqELwmx7oK5d4UgZSlebSIAs9+UJ78tOtakwqmUtYJ51Ps4ZJoVlDXpbDe7d55PkAfeMVNk+JWJ2QTkYJbdiWy6zLc9hmy+5R/dhh/RIkfCmCMqnytL6a8SA3j7N1KUoCFpYEQMJT1mkySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPmM1cj7w/fl9sDrJwpP30i1F1/CuevnmveT42xPXwA=;
 b=NYLSckKQSX4T4HOWB3qJ7aABTBtcNKsZC7M+G8VFFUg7OhDNmHPTuvcau86/fdyYCQ5LBhhjHji4M+bZv5LuXP57mWV2nH1IgzecK3G7ttVmvABpwzmKtYMpqHzhriVP6ka4u6DF9l4q6NBSyOpVrNcHnDAHILZv0wFcg3xw1qTCdZytQPQzoUVTKlcsSYeNpZGaSG5Vsc7QblubCMi1Ci8Gq9d+/uQACSgmpZHvUh0eDyTIyxaUTJRumfAqZeBXJkLpnpA2yzLqvgyfa7d66+26kh1zGHsw6dN+2V9UxCIQnWM7ujt2MWd+mLeIcMO0lW4YQYeVBR1bxlCzpi97mw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10571.eurprd04.prod.outlook.com (2603:10a6:800:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.33; Fri, 9 May
 2025 10:40:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 10:40:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Abel Vesa <abel.vesa@linaro.org>, Mike Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo
	<shawnguo2@yeah.net>, Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx
	<linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [GIT PULL] clk: imx: Updates for v6.16
Thread-Topic: [GIT PULL] clk: imx: Updates for v6.16
Thread-Index: AQHbv0yLszFJyZJDU0KnkvYkCs4ZB7PKHc9Q
Date: Fri, 9 May 2025 10:40:33 +0000
Message-ID:
 <PAXPR04MB8459F66A8036C86F124E4E5B888AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250507123528.585447-1-abel.vesa@linaro.org>
In-Reply-To: <20250507123528.585447-1-abel.vesa@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI2PR04MB10571:EE_
x-ms-office365-filtering-correlation-id: 1cb6370a-47f6-476b-9b24-08dd8ee5ed1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QYlRgQa9gVpBcO8mxNamJlbGqGvJkaXbryuxUyASGVrTS0rVeLvQyEEWOd9e?=
 =?us-ascii?Q?SAiZ4uxkTvh8gdnGRabR1m8fc5kN1OHrKjJKZCUwBbAaK8p+NjZFoG4bd1IR?=
 =?us-ascii?Q?JaW/wnoZoKiu3XlRUN++muFUTCVRZBXeoVZvH9SEtDTsA/4HKrG++n/u2xGg?=
 =?us-ascii?Q?SH/Kst4nlZ4XpWriYlBgW2SnedLldstlZ5ylmqvwd9YVw0r7ZC56WJ7UZ++M?=
 =?us-ascii?Q?2OgulSqxGuCSku35+EdCwSFwcxIVq79RIdJBJFPOSoP+dbhPI/Dmtpcf6Vas?=
 =?us-ascii?Q?UqGgro0AsLMoXan+hlb6VBkoB4mko2xAtOh9AQq9RBMxZIzp01V1ZNxJK+cR?=
 =?us-ascii?Q?U9ja0A/36Hlk/o2kDR9la8Ct33/3/9ooHz2GPOAkPI6xXBSTR/FQZ0b50If/?=
 =?us-ascii?Q?tEpnkZPxM24LMu5CGP+EzksGTmpqPTg9W/y3zGMEz2g71AghCtkzt7dqYsHB?=
 =?us-ascii?Q?tO+hjkET/2u0lxJA4t/KW8sX5JTMgCLl4W0KKtqSIRHSEqaiHSeZTkWXFlKX?=
 =?us-ascii?Q?6FhntOFvpeimT1gdILXcQ5XMy5/hja0vrxWchCvbU/Ps6Cu7ZDKOCwsQUhUF?=
 =?us-ascii?Q?4zJWeGqhLCXJ6OtL4w+bQtPzWvkhIlev8GxuIT+jmIkMEjfKCVVIoK6y81es?=
 =?us-ascii?Q?DojgAru8tza0TkZH/bXakQBwayFOrxvKCyskvS3JqcwgmDzMhMmfrMkSJbe9?=
 =?us-ascii?Q?SAxoEJHPu0K78E+rYt9abcEx/g+Wa0lF5oP6Dkxvh6fy8y4eC/94pdnBxEZ1?=
 =?us-ascii?Q?NqazhZJJeXaiDWd3ydOqx5khjTNq866160AK96BTLUaC17yyOXeg7r+Z8bPh?=
 =?us-ascii?Q?lWkIn7/01FbB7SgX7FHPNcasc3dbZECC49jDW7ICUnf2XYoqbTOpPfy14Wzc?=
 =?us-ascii?Q?lx+UJUtwpPDwYN3+4dTmNJvfUyBWFzq4C2ZajmBJSQ9st9gWQvne5UZ8g4b6?=
 =?us-ascii?Q?ciZ32Wfv6astNTfQCSrWAZZgpC7FUPdu2wKXYtqyvy3e6cMcDa3KxyuRzxGV?=
 =?us-ascii?Q?IT05w8I1czhDPGtp1mpcJHeM1GbUoaucPF30jtGxEeJsIwAZyFhQaNOL4xDy?=
 =?us-ascii?Q?LRCBvUrle0zN2fxx97I9HMukCddX/6+MkXWJlV/aE/GKhqKk6DxCYCNIC4Dl?=
 =?us-ascii?Q?UMu9nhKY1XncYkgOyRT8umW/mWpWtNTLoZjJcpWckKZU1bgQ4wTikXI3g6PJ?=
 =?us-ascii?Q?axlJNSkGvWhXXzvZzBV1x3DXtnXcd+2ITNODPt/1Bfxpv4BjpDLcgPLFdmy7?=
 =?us-ascii?Q?73D9WgKhDpcg+mcbfoUu8QOf+kloClyqixEPRyYsa8MLrPCHt4cjgMUtI0N5?=
 =?us-ascii?Q?zLFMsa1h1NbSL2McJHBQ/MTmIV8mSdMFKadM76iA8ABAsL3aMqSGgB0SGL45?=
 =?us-ascii?Q?aMQOmXJt3R8wyOSpfg+BVh2yw6v9rab/MCVc50/vjhOHN8k39z4ZdHIrHq2P?=
 =?us-ascii?Q?FgiO5KxQYGZ0ksk9aHHbSJ3QdXCaVuRGHyt2od8lEp0AglA+FfU0qMdzUjGh?=
 =?us-ascii?Q?5fKpLHKi5Kh+Npo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nnWTJsCA2JR33c6TXa6BPHlQ+6TRM+yuXiUD1wzQ5MgiyyfNHtsoTxK1ysel?=
 =?us-ascii?Q?R2oypRJV0xBNuNW+DJnubpfuKe30wPIQjcIHAqeRyQBZexs/fWJd1eWDhDXi?=
 =?us-ascii?Q?joXQmpH+op6LAeq5g56DckSbQFiHipEdI1KuNDgvwN45ZcbFG3uonlrRtXxU?=
 =?us-ascii?Q?Y9bVCO5IB3aJHBpNLvVZ/2FXUv0wioCcAp0Dzd73U35rboR7ScsROijFUK+J?=
 =?us-ascii?Q?qNMGE3l92aEDh1ngcmT3/mxZO/55fSXpLPj3+wmFlEgxXfdEwTd7COiev4zD?=
 =?us-ascii?Q?hG/XQqSgtA+/36sY1wQwDAQLVDO4ip9G+jWcSr5Eq9z6Hly2+7OP8pS/y0BA?=
 =?us-ascii?Q?zTBtV8eUDztbKw3nvx18nMiMRJo14c6Tb7sUNJLgLVqwi5Ope/0t79pIe1s0?=
 =?us-ascii?Q?vk+1/yw6IHKdqHR3st695cVWy0oL/93r47vEI+xsatGCLu2c25XJz8yVWJL/?=
 =?us-ascii?Q?oP70Sekj3W4ks42QwtcVSVhjOZm0B0ZPdMu6YfLbHFE+6j2p1f4AksWHPiZE?=
 =?us-ascii?Q?2V0ZUdPHeokJHeH/QaD97mbHpuxmIgwtkF0aNOl2/be9J6wF0eqo1sIFXc0t?=
 =?us-ascii?Q?4jplEglL3sTH3W93sHNb3k5d5N8770epOVOYF0m+Py3xGwwE9+6YhB1MOr5H?=
 =?us-ascii?Q?9B7uirIj29d8++tCzDEbA+FC5qaOlWsdB6QFj7hMiXsX30Mf2Gd5oxC4ckQ8?=
 =?us-ascii?Q?/ao97pJ/rSyc3qDvIfsYakPR5bZ+NPdwPSIkFuwvFGNUfh3OrPjDNnNhAwWc?=
 =?us-ascii?Q?tWLv+OD2I2DGwtjn26DzTzL/pXFIyBEtyGmd9KIRRvijM7xjcpzA9ubvPAuw?=
 =?us-ascii?Q?DXy2CEIXEhGjlWeET9qlFysvOv87+jiRc8acRyu3AmAjomeRxgJeCTuH8QNA?=
 =?us-ascii?Q?TU8CF38cPL5nQZmR/Creoeh3TyEGcLrmKab/mlf9rjWiWDOPFh4WVYLJ8Zui?=
 =?us-ascii?Q?4GQ+RZMYCUilhVUBSco3uYk5fCsMd9mTdhCTf3tIWTJTn+OaefRVP7nye+rT?=
 =?us-ascii?Q?lhJW9rlXqql2N3lZA7jgJyp7u2DotAaNEcXOIvJAp/p8l4n/Y70V6aJ/GlrC?=
 =?us-ascii?Q?MUejAI38KTw2MURTqNBmnCQcTzqRXz8VZxYo9K51SBAWRcZhnjhCgpqb7Wxm?=
 =?us-ascii?Q?p4g4TWHUgjI76hu9PTprjM+0h5OHB4x8c5OMFQELzhPX4XuPA6OrROWJR+nt?=
 =?us-ascii?Q?vPJkuPtp+a03vegQfwKwB5son7pBh+5HCUO4s65VmIKysWs+WoIsc2H5TJXv?=
 =?us-ascii?Q?XHOwpc18n91ZL9ROcEbEUURaCyUu3ay6YpF0eXHebiJ/fZf9fHAfZiBGc7je?=
 =?us-ascii?Q?5lf84U3lCT0Wo6Id1n4oQCwkyJyi+xKJ64DWjOGDZRaARPVfMxM57TSV4muG?=
 =?us-ascii?Q?2c7IzPi7yFkp5ck8MxNOkw6sgwQf5aqopJmsXv2XdUS9B93mSmSMpNKljPDX?=
 =?us-ascii?Q?7EXbM/2sMtk3tUx/Alo/wCfax9zJq6/oUuot/1IZ2ULTWq29HFon4ND/GK1L?=
 =?us-ascii?Q?HtHS9i7nxhK+0m+zcdldy3l8kLTOMPuVXROBYpHB3dN4pjYdSBZ2vrhrTO4z?=
 =?us-ascii?Q?7M/fnv4vuPt3neFcivg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb6370a-47f6-476b-9b24-08dd8ee5ed1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 10:40:33.2668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZIAZ3YjiT20J1LWlzx7BjmLnQnvCQiFjKLOyKMxh623dplQE3DExpkK5OKxPxl+6BTyDeInkagKkuOK3xAZvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10571

Hi Abel,

> Subject: [GIT PULL] clk: imx: Updates for v6.16
>=20
> The following changes since commit
> 0af2f6be1b4281385b618cb86ad946eded089ac8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/
> tags/clk-imx-6.16
>=20
> for you to fetch changes up to
> 6a55647af3334f1d935ece67de4a838a864b53fc:
>=20
>   dt-bindings: clock: imx8m-clock: add PLLs (2025-05-05 10:48:56
> +0300)
>=20
> ----------------------------------------------------------------
> i.MX clock changes for 6.16
>=20
> - Add video PLL clocks to both i.MX8MM and i.MX8MP
>   while dropping the numeral suffix.
> - Add imx_anatop_get_clk_hw helper
> - Add anatop clock providers for i.MX8M[MNP]
> - Drop ccm_ prefix from base in i.MX8MP clock provider
> - Document bindings for PLLs in imx8m-clock schema
>=20
> ----------------------------------------------------------------
> Dario Binacchi (11):
>       dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>       clk: imx8mm: rename video_pll1 to video_pll
>       dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>       clk: imx8mp: rename video_pll1 to video_pll
>       dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>       clk: imx: add hw API imx_anatop_get_clk_hw
>       clk: imx: add support for i.MX8MM anatop clock driver
>       clk: imx: add support for i.MX8MN anatop clock driver
>       clk: imx: add support for i.MX8MP anatop clock driver
>       clk: imx8mp: rename ccm_base to base
>       dt-bindings: clock: imx8m-clock: add PLLs

Sorry to raise here.

Not sure whether Shawn will pick the DT part, otherwise
there will be booting break as Mark replied.

If DT part not goes in 6.16, this PR should be delayed or
redo the patchset to support old DTs to keep backwards
compatibility supported.

Regards,
Peng

>=20
>  .../bindings/clock/fsl,imx8m-anatop.yaml           |  53 +-
>  .../devicetree/bindings/clock/imx8m-clock.yaml     |  27 +-
>  drivers/clk/imx/Makefile                           |   6 +-
>  drivers/clk/imx/clk-imx8mm-anatop.c                | 287 +++++++++
>  drivers/clk/imx/clk-imx8mm.c                       | 262 ++++----
>  drivers/clk/imx/clk-imx8mn-anatop.c                | 283 +++++++++
>  drivers/clk/imx/clk-imx8mn.c                       | 183 +++---
>  drivers/clk/imx/clk-imx8mp-anatop.c                | 306 ++++++++++
>  drivers/clk/imx/clk-imx8mp.c                       | 672 ++++++++++-----=
------
>  drivers/clk/imx/clk.c                              |  15 +
>  drivers/clk/imx/clk.h                              |   2 +
>  include/dt-bindings/clock/imx8mm-clock.h           |  76 ++-
>  include/dt-bindings/clock/imx8mn-clock.h           |  64 ++
>  include/dt-bindings/clock/imx8mp-clock.h           |  80 ++-
>  14 files changed, 1711 insertions(+), 605 deletions(-)  create mode
> 100644 drivers/clk/imx/clk-imx8mm-anatop.c
>  create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
>  create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c
