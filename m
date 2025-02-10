Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D759219BBC;
	Mon, 10 Feb 2025 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739155014; cv=fail; b=ALrSSRpZiVmUHAUuJuD1IKVgiAliYpcUd10VA1kHZWR/YqVIaSxh6Kg/uQyOoEkGszCc7xQ+Umh88/3ykTD/xtUv+gH5dMKpJ1CfdlaA8uydldfbjShUTxgUjEJsqvbpaOUa7QBUGEtvWq1wUbL7rk5hAizj7Gb6tKMd8cR2Ax8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739155014; c=relaxed/simple;
	bh=QNInxdIjkkRNPW05LYIXZ1QO7A2WCM8w44zl211AXLU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fPMa81EoCly/RbgIH3brHuVXV88rABq7vTMbqXU+jCTcuXl5guvdSIWNaMxpAf90zQThYzpoW5xAms1Xy2gvkBuytZPR6PgJ09ZX7KZfzt0WHterh2Q4dTOtMcS5MuWEH+QfkikrcSr4I+gUl/EUN6nigP08GNCEpQ54xIk8wNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A4NFpcef; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A4NFpcef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxvXWXNZmIFNtpvJiVLnaq8WbYf44EZk9ci2QQX0o+I5IYvOWkUGaf1fCk2ETG6/JZ/XPjdMMCFd3Fn8AgqDzag4QZ0eU5GotWNSADUBNOworkUfLjmaphE+Asf3xUrNoO6in3bJkHsD+B0I2ri9CzbSGXIDnBjwhfORt3lRoV/GDD4NSodzC9vzhYZuv9trHCRWXXzqUWKrURR1YlNkcU45U74J4mXWoT+cRcMA3+t1HhbkxL4fWsJcYcXyLY2tJMl5odPB6/xggSAh/LNqfkL+tqPuecnM2GTgIHN3uzUfb7ykgsbJ95aoc90Ut0rFKCTAEHy9EIhx0b++W52j8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mscInv4M5PCxbQkmwPflaBACtxpA4G81v/YLb2vUYCw=;
 b=dfiR0ZeMo1HBIfvlbPk7Qhr2PwmdSuej8MOzUzd0B3B2j3vhOCdlFl7Tn7UC44YjfzqLDS1gJV2dFI4WlpOCP9jmp1fqSTmj3+XaVdrjZDRjU1O5ZFhSwexGMfAO25MifIst+mETW6iVUQ3WEO3eBAoJWSyyd+XT3xzO16r2XA6TM1CyMsYrYTqSeEx6QhG5FJA0ANWug34BWqZfEgEUjZVqCgb3cXF5vRWc9VlXpdkavQrDva67Q3e42oV5X9R2OhUfU5+LB+e0sl6xOXX0QvTnOWzsJGeDgDU+Ccy5uqMqidlUe0X0UKV9yPwmwsWSJCMOMlmazovtLzKiBr1ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mscInv4M5PCxbQkmwPflaBACtxpA4G81v/YLb2vUYCw=;
 b=A4NFpcefYFrKQzkf2kurSei2IQwiOCIgQFBIORKCy2CnxnvaCzM6kEqw8FjUcldB4EPHk/CuIGI8sUSXnVw5wB2hMGD15FnzD1LpE4hA9JR/uW0WkCQl8Kfc56QXdKXpbIhALbGvFPHw+7LCvnoIdyPEDCu603SmsyVXMB1/IWSLCMXaLfeNJ0Ah0vkamMV74xLDjsgg4qxk2T/OCBUbPzeAYZK8jpvvfhETrYWxZU5IKBnEbqKCvuweSnyT2YPQoZsli1i23ZtcYsSVdkP/LW0m3CtMVhnd5M8bnGk5FIl++LX/eAGGYQpF2ZIkpp5OhUTOqnLg9aqg0IkbSUfgVA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 02:36:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 02:36:48 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller
 references
Thread-Topic: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller
 references
Thread-Index: AQHbeTucaaMq+IrsykGrfuo2Bh1yRLM7vceAgAAJ2ICABA68EA==
Date: Mon, 10 Feb 2025 02:36:48 +0000
Message-ID:
 <PAXPR04MB845912F48DC37B6BC599313888F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-5-alexander.stein@ew.tq-group.com>
 <20250207120213.GD14860@localhost.localdomain> <8037692.EvYhyI6sBW@steina-w>
In-Reply-To: <8037692.EvYhyI6sBW@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VE1PR04MB7216:EE_
x-ms-office365-filtering-correlation-id: cf25e2ce-bc09-4318-b60b-08dd497bc497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wafQdc+zZ6rQLH6Y33BwfWpv9GVSUzpNicgVW/tY7McnHDV4G51N84Fr1v?=
 =?iso-8859-1?Q?zLNMBElir/hPSEJuqXnNBeJGYI7FgnnXn+jpdgC9SGQ81CZ1wfhUrjXMmF?=
 =?iso-8859-1?Q?LuwFz9eg/SFuZyFRlBT8wRfjwQt2DDeye+6ynDcjgSJ7u8Ey4kX6/wjMyM?=
 =?iso-8859-1?Q?9603f7m2CBtdG0v7q8som/S/C+g4825pVXCdBk+6uGH7BlVgKjuAknjr4R?=
 =?iso-8859-1?Q?FeQKEMX6VzVSwgGpwBu3rXFZS6cUpccVcyR/5UHzHWe5/7BfFzgVm1PEES?=
 =?iso-8859-1?Q?2najPwuLUYJW73/HyrKTFActT6NU81e2dwInDw8W2phsUOmfcwyU9EblHp?=
 =?iso-8859-1?Q?02kkphZErzrr2RYuQ2gmN4+BG5ru6rGqBh4cQfSyGmJWBEOCHOIrmgn+uF?=
 =?iso-8859-1?Q?bShCxipdrcu5p4u1SXMA1N5O+RczOzfYQjETdFmMtiTzZBCWEC5/JwaURQ?=
 =?iso-8859-1?Q?Vh+KafSxquqWGpD6MRxY+p7oFNK99GBZo3tdckPlFUb8qBICDAmPVLputP?=
 =?iso-8859-1?Q?T4Pgp4wkmefIiIpQ4ZJ5sW1QrOrCoSs0Syl/+RgcyyGtLtKtmbe92etsFy?=
 =?iso-8859-1?Q?0kHVgmr9LOjxoqkIfz+BHhlK6lwBIG7E/EqyDJ313/vxn2CiD8YGtToK1n?=
 =?iso-8859-1?Q?4q97vKduGJZzIqkWJdt5CWYK4EZZoJwi9xoFMsVh+FY8Pp+CnsPKYQMB/o?=
 =?iso-8859-1?Q?H4H5y9RN+P4xpUEKrTzhZ4WKrqfOYKo17/vhEhBz6ZXeBCu0w7i7TI3MFI?=
 =?iso-8859-1?Q?D4P3om25kNe1obi6oQchsiVnmWV6sKNsBbadq+qGzVvmqkIgqdhgb+jj3E?=
 =?iso-8859-1?Q?r5N6s7p2+qSVT2KAyBn6EXVQTkDqeuIqjCs2h+1jtcAWPjqVJvwfVPGVk/?=
 =?iso-8859-1?Q?rPwI8qGHLSxPzbNo4kmgwpQDFWf7fhYHpCp2BQ1gY9tA2OESLi60UwHimp?=
 =?iso-8859-1?Q?IFJty6rV/UABGOIsBrBvuTiUfxaDBAb2Eems8JPtgD8ywvro8SRfgSxks4?=
 =?iso-8859-1?Q?YAs9bauwQoWyDFNYgxSYz0KIaTtSkkvw0c41txZAMjOwqMCtbzkYoAny6a?=
 =?iso-8859-1?Q?OV00sf1+rCfBCeJELL8cpVkRDGHPfo2VN32lO7bfFbNLpVK2SJyQ3xOYgz?=
 =?iso-8859-1?Q?SWJyxnYpD9Gi/DfRt3yrDDEN7N3wLB9g2P4afIHMouJoKcefi0DaDdouYe?=
 =?iso-8859-1?Q?FCPzyqEroPMAHHuMMJQ7JeLYzctvhjVRMj4vMo8VssVDBGjqPR/zczyjQy?=
 =?iso-8859-1?Q?bbQqvJYdqs/z4gPNGdkdgabwt3zi8k8TLgt/19KpAERuPT+AdUCBv5QQCu?=
 =?iso-8859-1?Q?lzwYI6VdM545uAC8hen9WoSECs0+cQ/CwFtnk46lTGzkzeeKbIEEEiz3Jt?=
 =?iso-8859-1?Q?TdtNlFjQM9sDZnd1ODDu9X9F7mT1ledMgbjuFsdAtjHtoD/bWvO5PcFnP3?=
 =?iso-8859-1?Q?/dLbXIjrFvZLiNR9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+Frv8oWNdQ3bynUUlPOMm8hmVcTb29LJgUkMcdNpYkPCKlRaYGW6/vDjFG?=
 =?iso-8859-1?Q?ad3ekRNL4Aoq/0EKYB0ET1w/hD85RlaSLoLsfi0prXBm5u/5i0XF2bLuth?=
 =?iso-8859-1?Q?CMXuuMFMTMBST7jqMs1+g6Mqblj3qWDAZxfJFdiuC9jqRmY/Ib2X0W20Qc?=
 =?iso-8859-1?Q?lo16r4JnoovlWRgZGCvS3XOhKsk7Jzyy2t+Nyy7QS8OXrOSnCn4M0LLCb7?=
 =?iso-8859-1?Q?II+68sy9fCEKKeOpM8U9p5/DSBH8e46imBkXcBIhb3Wq36orjDv1wLTCEC?=
 =?iso-8859-1?Q?b5337401vnujsBBulAyQ0BnOw19ggRteFW5ACy8ze/Tjq/nET5Aj7i4/2X?=
 =?iso-8859-1?Q?VRre3DgkM817wTOjcyXElyadDwiD+CtL6UxEfiDIa6znvqyVIbgo4hnrI+?=
 =?iso-8859-1?Q?sGJ5+qn2TawuxhkoN7UCMtg2eXdN0anySm59z+oKzKRHy17ovyY/BfUX4O?=
 =?iso-8859-1?Q?ywUw7J7CW+plKB9SQ2F9YAfbK8EpTu52DI/GkY/uBp37qfqYvJ4gdEbQ7T?=
 =?iso-8859-1?Q?5iDef2pw/QDOsZe0Fj4T929wocxk773GqNwYseAR81zphtha8/CEgJjY2e?=
 =?iso-8859-1?Q?mJvX3147eFjh8FizCZWtzaymqj601VuAfhMvfazb/dFLVD+iMBt+YpPyUM?=
 =?iso-8859-1?Q?dyRdHCpfVOZqYQVXk79+Q4CrrmopRxuN3ph9k0lJOyM0Q7V8tb6514xNHm?=
 =?iso-8859-1?Q?ewA/TCq9A1qTqdn0pGvQmKEEunsSKeDw/480HX2L7fDF6djp5WIJ+Q3vWG?=
 =?iso-8859-1?Q?DENyz6QnoOVYClwcpI9CEmjQLdHZiBfa1WDl9G+8F/ACSSmyP4mzhasIPO?=
 =?iso-8859-1?Q?akPte4DgzcQLhopCtCvtEzVcdLQcIIQYvI0oABzQB/YOuHFV+OxU9FoYYz?=
 =?iso-8859-1?Q?9ZCpHrK77MY7byxcXVrne5tR+BYqTmaV8fD6m3nzJzickp7Ik93yWXj3Zw?=
 =?iso-8859-1?Q?tHDYTRPz/oupFCNMEP7q4c3qwGJBzTenQeC6RITdBcYbq54Z+YS9MBTH07?=
 =?iso-8859-1?Q?xfdTssDg1OCRFK2vwuJ7mqON3cJwJKVHyuBieaXe9R2Vq1qVnqdrCK0Zm8?=
 =?iso-8859-1?Q?lmvRjN6aAdmOq5Xdt15mx1RtmeK0wvqMRZFQJsHGnsom516pzbPYKEjyYj?=
 =?iso-8859-1?Q?BLaMc9PNceVle2eVj4PY0DXLprWUxNg/LeHnJQcezJnZxwYvfu2MSaL7Dx?=
 =?iso-8859-1?Q?BY5h7W8aS//ZRPn2CyN/CgRIRMOTCnHuiiLkeG72hefEsotAm3lYUCtlTf?=
 =?iso-8859-1?Q?yo33kEFAZblyUJEmMRdVLkfL1H5fEVNeTSc8K+iui+cos6p50YbcllekIV?=
 =?iso-8859-1?Q?Qv7HIHHjUqTW3LH5j5FSc1sGYxWdeh0dtbrJLTNjv+C+AP+f11ls988Qfg?=
 =?iso-8859-1?Q?F+qjKcXh/v21DSOyXfvgBzKH+AXamBihYclqbpGFGOsPH2ippZhfYuMfBA?=
 =?iso-8859-1?Q?46ypg7aWaBnwoLHa6RQwkl6XJuJ/s3rtPeJOruP+sruyroUwe7ZrCAuDxy?=
 =?iso-8859-1?Q?XciIjMTWOom5w0E7GvefiAxGiL1KplInhjDQtYerzf2Ry99Lb1o7lLqIhV?=
 =?iso-8859-1?Q?oIzIDuT9jVahBU4b7mG2KAB2ngchFczG1KQ56EInhQ3nR0h1WyiBi1thia?=
 =?iso-8859-1?Q?Xfbw52Ronh/mU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf25e2ce-bc09-4318-b60b-08dd497bc497
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 02:36:48.3953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CJJ/vzzq2YRPzkmfF3oxxWL/gTfm1lzZzfpyFE+s8naO3h8AA3fqucKtPQkgU5nzHtfMXN8ZR8R3uuLR05RcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

> Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-
> controller references
>=20
> Hi Peng,
>=20
> Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
> > On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
> > >Mark ocotp as a access-controller and add references on peripherals
> > >which can be disabled (fused).
> >
> > I am not sure whether gpcv2 changes should be included in this
> > patchset or not. Just add access-controller for fused IP will not work.
>=20
> Well, I was able to successfully boot a i.MX8M Nano DualLite.
>=20
> > i.MX8M BLK-CTRL/GPC will hang if the related power domain is still
> > touched by kernel. The pgc can't power up/down because clock is
> gated.
>=20
> Well, with GPU node disabled, no one should enable the power domain.
> But to be on the safe side I would also add access-controllers to the
> corresponding power domains as well.
>=20
> > This comment also apply to i.MX8MM/P.
>=20
> Sure. Do you have any information what is actually disabled by those
> fused?
> It seems it's the IP and their power domains. Anything else?

In NXP downstream there is a patch for  drivers/pmdomain/imx/imx8m-blk-ctrl=
.c

soc: imx8m-blk-ctrl: Support fused modules
   =20
    For fused module, its pgc can't power up/down and clock is gated.
    Because imx8m-blk-ctrl driver will pm_runtime_get_sync/pm_runtime_put
    all power domains during suspend/resume. So we have to remove the
    pgc and clock of fused module from blk-ctrl DTS node.
    Update the driver to support such case.

But this patch also needs U-Boot to update device tree nodes,
I recalled that U-Boot will remove gpc nodes, but not update blk-ctrl nodes=
.

Regards,
Peng.
>=20
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> www.tq-
> group.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Ca7392a7
> a9a7d480f69c108dd477447bc%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638745286928288330%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DF
> R%2BeuYsheLUO8UY6sB%2FGFpTo2911r9tQDl%2BZFqnDqcY%3D&res
> erved=3D0
>=20
>=20

