Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2130.outbound.protection.outlook.com [40.107.21.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8AA1F03C7;
	Mon, 26 May 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253866; cv=fail; b=Lc0/0fK6xOxmsqcxjqukAt7MITyxbdqbWNRLYTx29BF37LeA60qpS89urNgS3VH6W0enpuKUER6ti4gdF5aJbU0jEnYPZQ+pjmmLDM+HffcUr21jGzL1Sobx+nF5DJNIYxaPNlDmkx3pmMHAm7k0j4i7HdhO8jKDHAlZmHpC22s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253866; c=relaxed/simple;
	bh=wb8aMAGqcJfhl6Y3/S+jwGPO8bQXnt8xngNRL+joo4k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kaAp2OqC/SbsocETX29rGuVRB2Ag+RZUS+krtPuEMEa8n2jFoUANhRCOIBasMb3LF3TZvxkZenIXCLEsL5pWCP3j03lYh73VcY9f6lmb0bgUKU35YimegT3lXtah8zg+4I5tVlfLxPR5CwEbhEZS0JZxZKjDOirGoEL1jQthdQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=YocoldQZ; arc=fail smtp.client-ip=40.107.21.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="YocoldQZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMjd2sfEh0iw4dUvQJfTWD+ajqIx+b5GeV5ah/W4HeiY4Jt81rv2wuppnSfQbGdMcCJ0PW7IqUmhEezWwRO5per/7WPk9AyegVOzsN6sZ1+GshibVxYfJYBHj0BlkuDAadI/o++Eo09Xo6/86YFWpqG0oo3oZTuJquSx/juRi3HjblC0ExfTXBrPTU553ahw0SLZr8eYSErRtHgm/3VktAkGZaNnH02zvkcDrHqLZFAJCQDvEakAjr8ORwBJX4hB4imw+yQj9f5DkN/MUMF668+9cIUIyEyXdHlVMfgxZ4vpDcacvgVQuiwryc27MBE0A0UruH8F9UXocS01T4mK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb8aMAGqcJfhl6Y3/S+jwGPO8bQXnt8xngNRL+joo4k=;
 b=thjDZRUWKZOT1Vk5RqmP8KkP71/Kniu7NwZdLhWSCOKmhZH//TVrnBJ5Jn2NsMKtXIWGMUfGuAzQ/3/i8I3TDEC+ZzdEkxLBYKddYZVM26yyiB39ssXkQ8ZiUTMYsfw5wUIwAEvweCHLcaCWU/Ao4MNMnlXmxmuAeZu9Sxd29dXXnGTwmjXECQul36cG84OoUoO/mCXS1Q14pLqlPuowE3gESlW/z10Xr52jhcGGN5+IVMhgzVL3XqR7U9DAoF6jhT3qoGqlkFnBw4gawhH8ymndhesfjovL1uRHmuv3gIcsrhI6yB341/K+jRziGUOigd83aJ1WwkN1WB8FzoJvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb8aMAGqcJfhl6Y3/S+jwGPO8bQXnt8xngNRL+joo4k=;
 b=YocoldQZjhdAtevgimXmQuW27BF/osSYKxSM+KhByWKt9vaMn6KrQUbTLWdtcYlTCQG1lZ4sMZjmX0ifphgHeJD4dvasm6VMdFrE8mnGxsUn0in1Kz6WAV+u8rnUc9e0TKQ7GhTiV/EPffKxnbQeoURzS5HaHU+4EWmQEyvmXNYx7FqGCb20GVqZNF6xaJnqwptE1/A84aXexCR/8IoJDsK4ht6oWBRyXemVXmXhbg0+irky2c8dxGDbf+Hq/dRr+Xrdg+ujCos2HGoqEr8eGMqtJiR/jn8NzX5Tmv9b70yCams2JSQ8UpisGRGOgRwoExDiIgw6c0jOWPtR4adHgA==
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b7::25)
 by PR3P195MB0799.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 10:04:18 +0000
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59]) by AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 10:04:17 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index: AQHbzJ5IkKiCUrqPH06p42f/+549BbPiDcKAgAJsSwCAAChcgIAABDUAgAALOQA=
Date: Mon, 26 May 2025 10:04:17 +0000
Message-ID: <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
	 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
	 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
	 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
	 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
In-Reply-To: <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0257:EE_|PR3P195MB0799:EE_
x-ms-office365-filtering-correlation-id: 6e8fc07e-8b05-4a96-1a41-08dd9c3cad43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGF6Q1pGNVowUS82WnRQMjc4d1RoZUJBdmNYUU5KNGxOMkNYQjFYbVdZS3Q5?=
 =?utf-8?B?eHM2NHJiS1NCM3ZtRjI4bmJpNzdWVkFjbnI0TGdNU0VDcVhVWlBCWlVXd2RQ?=
 =?utf-8?B?bEZPNWkvQkY4emFqNHhiYkFxOXNybEhsUXo2NkpMWXZhWUdkM3lRNVpPdzhw?=
 =?utf-8?B?VlRXbmRxTTlBTHBlMTkwREc3bk1uUGYrM0ptM2NaUDBXL3VFWnh0WXBlbUov?=
 =?utf-8?B?YkZDaFBTeDEyUUEwOGVXQlhZM0NsamQ0dm1Nb0l4YTdvSUpSd0lTZUF6SkJl?=
 =?utf-8?B?dHlERm11dE5UK3Qya1VtSFBGb0E0YmtZTUo4QW5hVWI4SmZRYkJWVmYweXlD?=
 =?utf-8?B?N1JiU044bFB2RUtXVzYyRkdyTVFvN1ZtT0taUU9JSjl4U2JPSnVLUUw4RGpx?=
 =?utf-8?B?K2RWdHpVRDExaTJ5VHNoT0orOFFncnFJODArRFJITCtRNWtCYlRhNVBMK1ls?=
 =?utf-8?B?QUx3Nm12NlpNNkswclpWM0hzYlNKcnNPbTB3UWRrMkJuZmphR3Bkcmp5OFZn?=
 =?utf-8?B?MU9wUG1xN2Q1d1JBQ1pJRWxib3pQenltWmgrYWROWVgwQ1BHUXVMZzRtMnZO?=
 =?utf-8?B?aHZCbTN0UzFsQnVTOXU5SytuSENodzkrdUJtR1FDeWhwSXY5Wm9OSlZ4L252?=
 =?utf-8?B?S05LUDdtYThQNEVhSkdBM0sxZkdYMnJJek9KWW5TbmJJdG5NczR1aCtMaU1w?=
 =?utf-8?B?dWUwN1Q1NlFsUzAyZXQzcGNreStlcjhxR1h1U2pSOVVyNTdSR0F5dnI5WlFm?=
 =?utf-8?B?V3J0VEgxSFFtZ1RSZWlVdDNiUVlVS3d3VTU1RkMwUVV5ZFlmR2RnOHpHUFph?=
 =?utf-8?B?RmtyNmU0NW1CazRjdWd6UVUyOGVWQ1A0V21BSk11d0NHeUxQTGJ2ZDl1SVNl?=
 =?utf-8?B?ZHJ3RmUyYzF3SVErLzZFQnFOTEc3dk51RjRkR1FaVWdaWWw2UTA1YSt5MWtU?=
 =?utf-8?B?OFpvVmFuaWhiMVlFczFObUc5eFpHeGJiNUQvVUJUbUJ3SHpGWWNqSldLaHR0?=
 =?utf-8?B?bWgzNGVLY2lqTzBsUE4zdy9hK0g2UloyM29jckQrSkZmM2k5Yi8zTVNJa21I?=
 =?utf-8?B?S1lnb1JmZWZUeFVWVzNYaFc5U0NyOTY1MnB6NlNuaHRkNXA4TGFLckpoMFhj?=
 =?utf-8?B?SERHd0FsYThXNnNZYzRYYmpzaVhsQ3BRejdId29yaUJycDZOak9OREp0cjhL?=
 =?utf-8?B?aDRsMkdjSUltSnhGZlZhb1JrTjZlNndkK2xITEhtSUxXT2x4S1BoQmF6dldR?=
 =?utf-8?B?bjVVb3M5emJrWXdLY1pWWndySGwxbkliWWg3QzNkWjVaNXRtVVUzS01CWmFx?=
 =?utf-8?B?ZmJEN3ZyVG5TS1ZZYlVMQStNeEoxL21HaHhIMU5sS1g0R2thRkhERVE4RDYy?=
 =?utf-8?B?RzlXMVZKRVMzM2ZJWmNtbjR5SXl0NytpSG5FaWIxWDRwUW5KblNaQWxMdTZ0?=
 =?utf-8?B?aFBObU5SdFRpWU5EMGMvNEh0RDNqYmI4Zm1UQXl5MkNabTZSdTZQM0sxaHc3?=
 =?utf-8?B?S25lS0VPZjNnWFdHa0l4Q21mTEZic3EzL3UrRGdvSkUrMUZYSHRoVXlFTHNq?=
 =?utf-8?B?SlV4N2xYWlF0dXhremhpOWF6SEpDMG96Vm14OVhUTjBkYjEwWW1rQ3Qzd3lV?=
 =?utf-8?B?YXZFb1hiM092WTdPZGo3RGtRVXB6dEtEcGVEZ3BpT3hESDZGbHRHaDRJdm8y?=
 =?utf-8?B?NkpJYkcrSk5xclJuT3lLN0s2MG9hYTd2cGFTR2dIUVhvZDJ0SkRrN3NiaEJr?=
 =?utf-8?B?T2xnQ3VIbC9GbFZKb3VjZDhxWGc4blQxWFZNVG5jYnVXNTQxVkgvTjBZOWJQ?=
 =?utf-8?B?bmV2c3lJS1M0bjQvb1c5ZnBCam42bjhhTlNpdzIxdDA2MlJHc21jek1qb2Rk?=
 =?utf-8?B?MXlrRmhHRXF2MFdNczBMT3NRYjdncVk5RFdldW1WSHZGcG8vdEJRbXVGV29K?=
 =?utf-8?B?S290WFcybzBpWVhHMXpQUWtkZ1ZJZ2ZrNU9XLzZUVW8xS1ZlTW00N1RqSWh3?=
 =?utf-8?B?VzYwYkhzdVl3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0257.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1NXWVVBSEZuYnZtUVJ0VEFWYUk0bVU5NkhaMDFzVHhCWmZDbDAxTEsvcnY0?=
 =?utf-8?B?UkZ2YkV6a0dmNTlEVHlSMnRuNkNXK2RrcU84ZWF3Qm5uMXJVUWl0Q0VoZnRD?=
 =?utf-8?B?ZTdzVFVwUHl2d1Y4K3JGNXp3NGNCVjArKzB3b1p0KzRhR2lwR3dFQ0c5Wlh4?=
 =?utf-8?B?aFhRZEhyRCtqTC8wK0phOGM5Yk1iYU5ZVmF6ZVlycFhpUllpZlBpcWNYNXdj?=
 =?utf-8?B?TWs3RUdDQVc3aUY3bW5XbXBnYTljb25xMW9lS1l2Nmh1MGh3Sk83SkpBM2FS?=
 =?utf-8?B?UFV5SWtaWjkzOWU1UVVGQnlGZkJkK2RXRXdzYXFJeFVRZ0V6elExci96STJn?=
 =?utf-8?B?UDhsRngxT2VYV05KRkxDVFFuOElGMk42QldZM0Y4LytYSXVzQ2IxSm1uV2Y5?=
 =?utf-8?B?UWY4S0djSGd4aVd0N0FKcFV2cHBLK3pwQzdqNGFLczM1Y2JxVDVQVFo5a1NW?=
 =?utf-8?B?WEJhRmRRcXIxZ3ZDWEcwOUdvNEFmNk8vMTBLKzVIMVBMTk1FYUMzNXhVL0FT?=
 =?utf-8?B?Y1dTUlVRRUhUeW1mZ1UwK3RNUTVySG1jczNBZ2xOYk02R0pBUmhicG1CNkNy?=
 =?utf-8?B?bG9DeFRVZWs2MUZrVWtPQW9xZGl2SXNsT01QM3hZdlpvdGo4Rzl3QUNMTXlD?=
 =?utf-8?B?Nnh4MTlJUXVQT0prSWVudTI5RUF3Ui9PbU5jTkZQRHNqYm54S3kwWE9OQ29w?=
 =?utf-8?B?MUoxRk9TeTR2ZDBycHl3WkNFRDBtNXJIOVhnbndXdGZIU3ExNHdUd2RzRkVZ?=
 =?utf-8?B?bzJ4U29xZHA2UUdzRzdZWnl5NGJ1K1FrZDVUaE5NMm9UYmFrSzlVWXB3Lzlv?=
 =?utf-8?B?dG9Ca2NrYzF2cmFZMGVaTWU1NVNmZUpKUG1LQmtSdWZNcE9nNFB2MXZ0aGVM?=
 =?utf-8?B?N3BxcU9sODV3OVVsc3VJS3FFWjRNOGhqbm5TbGRLYzRidm1OTVVJb0hHRk5P?=
 =?utf-8?B?VkdMQjFGc1l6WEg0N0ZWK1Nyemx3eGhHWThwallCVEFNckdlNEtSZm9EUHFL?=
 =?utf-8?B?TFY0ck9OOE5yVnN1NmRBempjRmVzMzgrQlhaNDJBcjFMUDE0YkthTzg4cXU3?=
 =?utf-8?B?WFFod3Y0S1N5VXRETjQ0bXZ5VjdlNHRCQmlxTDlXblk4aXI3SzN5MGM0MDlH?=
 =?utf-8?B?aG9DNzZtWWVjZWdUVkJtL1UzQlZjZkdYbmloMVQyMDR0SkJDTnZYMVZzOWRO?=
 =?utf-8?B?cFhOQ3RpV3lxRW5hc3JYWU5OY3VHM0ZHOW9od2YyR3Z6Z3oyOWlHT2tzTUhF?=
 =?utf-8?B?MHkwRXJEdVRJdEJPa1VTMmlmeEFzRDloTTJBaEVPNHZJQ285OXZQZHp0cHFR?=
 =?utf-8?B?Q2ZGRzl6ZVRtU2drcXNZOXd5cFVselR6dGFXWXFOU1RKcmdnYys1YUo1Uk94?=
 =?utf-8?B?RDlFN3N6MzVVc0ljRVBhM3pkcXhTYzNTRU5nbDc3QldqREdZQXA3NDZwWThR?=
 =?utf-8?B?Vko1TWxGTitaM2pYS3JJTzhiSTBGdlZCS1NzMW1NaiszMTA2NUdKRnVMb3Z4?=
 =?utf-8?B?T1BhY3VXNEhkU3JoMTg2ck5taTl2SzVCTnRmOVNSQ1owVzhjem1MM0dIdjRq?=
 =?utf-8?B?cTh2MmkwYWlPaUtRb252d3ppckVkMlNiQWdRY2pkRVNPYlhVWVBVSS94RUlz?=
 =?utf-8?B?akMvdEJlWUdSYUNLOEh5Y1JKa3UvaU9wWUEzN0FidGFubTZnc3BZRkowSWZR?=
 =?utf-8?B?d3RPSUFRRG5hTmswa3VPTEFlaWZ0NnA1SytBODRpaHJSc0JFOElpVUJSdDVw?=
 =?utf-8?B?bVlkN3pxUk85Njh6OFJmcEdLeWRCcEVEMzB6Z2NrbUVEZzNQN1Z5bmx0VXpR?=
 =?utf-8?B?U2JuM1U2L0RDUGxYaVNWMGRvSzVzdWprZkJIZXRYWEtKRklJa3dVU0hwdjJN?=
 =?utf-8?B?ZkVLTGp4cDNMc0cvREtjbU4rSlNMYTBFQmtrWnFCMFE4WDRpdlV5RGNsaFF2?=
 =?utf-8?B?VitRdXlXdHFPOVdmSjVHMUhDUExIdXplT1lRWTlTOW1Wck1ZMERTc3FacnYz?=
 =?utf-8?B?OW80YXRZZkhJMDJ6aXFqeGFKb0tmYkNiKzdDemNRSWYrdFB2bncxai9SeUh6?=
 =?utf-8?B?VmZ5Zzd2N1BlTkx1eWU3VXFXcXd2cVRtd0ErdnJnTlJxaTJxYklrZXNFUUFC?=
 =?utf-8?Q?YjaUy2ygP04sg5cVvwoPkl3DR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F22F63A84B6784EA79403DFBCCF867B@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8fc07e-8b05-4a96-1a41-08dd9c3cad43
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 10:04:17.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfWZztMnSvh6u8nL1PNmaL8/UcLlni7kGkeFx3v7epSyaQ1MU0QkyvjlHGXgmCgW2dFCwFEJDeFzJeSFUhbizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0799

T24gTW8sIDIwMjUtMDUtMjYgYXQgMTE6MjQgKzAyMDAsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4g
QW0gMjYuMDUuMjUgdW0gMTE6MDkgc2NocmllYiBDaHJpc3RvcGggU3RvaWRuZXI6Cj4gPiBIaSBT
dGVmYW4sCj4gPiAKPiA+IE9uIE1vLCAyMDI1LTA1LTI2IGF0IDA4OjQ0ICswMjAwLCBTdGVmYW4g
V2FocmVuIHdyb3RlOgo+ID4gPiBIaSBBbmRyZXcsCj4gPiA+IGhpIENocmlzdG9waAo+ID4gPiAK
PiA+ID4gQW0gMjQuMDUuMjUgdW0gMTk6NDQgc2NocmllYiBBbmRyZXcgTHVubjoKPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3Jl
LQo+ID4gPiA+ID4gc29tLmR0c2kKPiA+ID4gPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OTMtcGh5Y29yZS1zb20uZHRzaQo+ID4gPiA+ID4gaW5kZXggODhjMjY1N2I1MGU2
Li5iNDgxMDk3ZjA4YTQgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNpCj4gPiA+ID4gPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNpCj4gPiA+ID4gPiBA
QCAtNjgsNiArNjgsOCBAQCBtZGlvOiBtZGlvIHsKPiA+ID4gPiA+IMKgwqDCoCBldGhwaHkxOiBl
dGhlcm5ldC1waHlAMSB7Cj4gPiA+ID4gPiDCoMKgwqAgY29tcGF0aWJsZSA9ICJldGhlcm5ldC1w
aHktaWVlZTgwMi4zLWMyMiI7Cj4gPiA+ID4gPiDCoMKgwqAgcmVnID0gPDE+Owo+ID4gPiA+ID4g
KyByZXNldC1ncGlvcyA9IDwmZ3BpbzQgMjMgR1BJT19BQ1RJVkVfSElHSD47Cj4gPiA+ID4gPiAr
IHJlc2V0LWFzc2VydC11cyA9IDwzMD47Cj4gPiA+ID4gSXMgdGhlcmUgYW55dGhpbmcgaW4gdGhl
IGRhdGFzaGVldCBhYm91dCBuZWVkaW5nIGEgZGVsYXkgYWZ0ZXIKPiA+ID4gPiB0aGUKPiA+ID4g
PiByZXNldD8gVGhlcmUgaXMgYSBEVCBwcm9wZXJ0eSBmb3IgdGhpczoKPiA+ID4gPiAKPiA+ID4g
PiDCoMKgwqAgcmVzZXQtZGVhc3NlcnQtdXM6Cj4gPiA+ID4gwqDCoMKgwqDCoCBkZXNjcmlwdGlv
bjoKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBEZWxheSBhZnRlciB0aGUgcmVzZXQgd2FzIGRlYXNz
ZXJ0ZWQgaW4gbWljcm9zZWNvbmRzLgo+ID4gPiA+IElmCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
dGhpcyBwcm9wZXJ0eSBpcyBtaXNzaW5nIHRoZSBkZWxheSB3aWxsIGJlIHNraXBwZWQuCj4gPiA+
IGlzIGl0IHRoZSB0aW1lIHVudGlsIHRoZSBQSFkgZmluaXNoZWQgaXRzIHBvc3QgcmVzZXQKPiA+
ID4gc3RhYmlsaXphdGlvbgo+ID4gPiAoZGF0YXNoZWV0IHRvIGNhbGwgaXQgVDIgInJlc2V0IHRv
IFNNSSByZWFkeSIpPwo+ID4gVGhlIFQyICgiUG9zdCByZXNldCBzdGFiaWxpemF0aW9uIHRpbWUi
KSBpbiB0aGUgZGF0YXNoZWV0IGlzIHRoZQo+ID4gdGltZQo+ID4gInByaW9yIHRvIE1EQyBwcmVh
bWJsZSBmb3IgcmVnaXN0ZXIgYWNjZXNzIiwgdGhhdCBpcyBkZWZpbmVkIHdpdGgKPiA+IDJtcy4K
PiA+IEkgZGlkIG5vdCB1c2UgcmVzZXQtZGVhc3NlcnQtdXMgZm9yIGl0LCBiZWNhdXNlIHRoZSBm
aXJzdCByZWdpc3Rlcgo+ID4gYWNjZXNzIGRvZXMgYW55d2F5IG9jY3VyIG11Y2ggbGF0ZXIgKEkg
bWVhc3VyZWQgNDAwMG1zKS4KPiA+IAo+ID4gQW5kIHdlIGhhdmUgdGhlIHNhbWUgZm9yIFQ0LCB0
aGUgIlBvc3QgcG93ZXItdXAgc3RhYmlsaXphdGlvbgo+ID4gdGltZSIuCj4gPiBJdCBpcyBkZWZp
bmVkIHdpdGggYSB0aW1lIG9mIDUwbXMgYXMgInByaW9yIHRvIE1EQyBwcmVhbWJsZSBmb3IKPiA+
IHJlZ2lzdGVyIGFjY2VzcyIuIEJ1dCBhbHNvIGhlcmUgd2UganVzdCBrbm93LCB0aGUgcmVnaXN0
ZXIgYWNjZXNzCj4gPiBoYXBwZW5zIG11Y2jCoGxhdGVyIC0gYW5kIHRyZWF0ZWQgaXQgYXMgZW5v
dWdoLgo+ID4gCj4gPiBGb3JtYWxseSwgdGhpcyBtYXkgYmUgdmFsaWQgdG8gc3BlY2lmeSB0aGUg
Mm1zIGFzIHJlc2V0LWRlYXNzZXJ0LQo+ID4gdXMuCj4gPiBCdXQgc2luY2UgdGhlIGZpcnN0IHJl
Z2lzdGVyIGFjY2VzcyBpcyBzbyBtdWNoIGxhdGVyLCBJIHRob3VnaHQgd2UKPiA+IGNhbgo+ID4g
c2F2ZSB0aG9zZSAybXMuCj4gPiAKPiA+IEFyZSB5b3UgZmluZSB3aXRoIHRoYXQ/Cj4gSSBkb24n
dCBpbnNpc3Qgb24gYW4gYWRkaXRpb25hbCAicmVzZXQtZGVhc3NlcnQtdXMiLiBUaGUgcXVlc3Rp
b24gd2FzCj4gbW9yZSBhYm91dCB1bmRlcnN0YW5kaW5nLgpHcmVhdCwgdGhhbmtzIGZvciB0aHIg
ZmVlZGJhY2suCgo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gQ2hyaXN0b3BoCj4gPiAKPiA+IAo+ID4g
PiA+IEFueXdheToKPiA+ID4gPiAKPiA+ID4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPgo+ID4gPiA+IAo+ID4gPiA+IMKgwqDCoMKgwqAgQW5kcmV3Cj4gPiA+ID4g
Cj4gCg==
