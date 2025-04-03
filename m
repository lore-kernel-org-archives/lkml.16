Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2124.outbound.protection.outlook.com [40.107.20.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF424113D;
	Thu,  3 Apr 2025 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665794; cv=fail; b=P/WKqnSpAL103fccpwh4Y7PTDaQLF1W+yLaX5PURvecX5Q3Cq6WlPhriJ1YXB09q6U/cZCCXY8Uq9CzzDewuOC6Gx6gkMWroBbaGV1o327FwHyyRnUkUtYi5JNR5reWe+NavjAQeKdK4FUkb238DECOQVMBPpmWGexJUPnCRVvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665794; c=relaxed/simple;
	bh=okirV3Rr2dvCKv/mkVqxyuff6W5z394X2UaJmHfc8Uo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nvrqsB73LCIFzKNdRQolf0M7zIX4LAVfShWgp34fFHhUtEYm7uCx7Wj/VSWWo3sDfsVLerlzdxeXXIoanpMGEewLjc4vHuAOyno92KA2nHe1QGfuVzRh45KBoLChMTVDndT80ZSJjZD+e11keozbh2/MTxzS5uaz62PNRHxM7xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=XQqARJBl; arc=fail smtp.client-ip=40.107.20.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="XQqARJBl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtzfBdjPL988ZDG3yea3FLZg5apWaxnyHsKgF+Cu7z0n6T/hrxgfYheJscboEdbSbLq5R+08SER1VCB+76JrSFhZdmQKku5IW66detw955BBSH10iFGfsfDE/6s29nkMfi1npsTU6WLkGsT4D7yqnZCg0DIiutA6x4v8YV/lZsXxNEiNRcjytTzWrKuO3S/P+G7gJ7wiU6TxoDTgWZswiSFpy3Wpxn5W6gqDbEeM6CV5Vm8rw78Cdqc/sbdEW9DtP5BsMzbtsPxgLzHvy7dkuICby16k3zbb8Inqkpwh2B2Dixo1ImA6QQDxsfccKnumnqOgNLJtIotRj5AhSzWpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g4pYG/4Z0DV2XFO5ur7nVnL5cwlqxyf8sEm3YrEm0Q=;
 b=S/ihyu6yCmi4kXQryigdZ80F5Jp5NcF08Xx4Re5fzl616f3iI8lZhUzgWFcfqTFeG/2253+PJRI9s/lzYT0nvg0+1ZQ5NoASB6/deZFDSXk6xxGOTtR72NCOF7HTcIqjlB+8vj4VWNAHg+k7sSfFhYsGTHBfH3jimZt2CkxBafseN5YRqfDPcezaIggIwMtb/4fH3VcFW0/eD/3bDYbQqxy3L52/51Yr3eI47d6TNhOaqKZ5cUOTAyJzJqD2zXvE7jYxw3zTEnJ39wNCiGm5pkpuff7hPYXKXyHGZqPQyLga8+SrAFPKi8AChBjRXjCHkGeCjB0349THH9zjVGurAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g4pYG/4Z0DV2XFO5ur7nVnL5cwlqxyf8sEm3YrEm0Q=;
 b=XQqARJBlvPOhLXcKhVn9RUOAiA5tvwNpC2/kJvnER2p8ywO2wGLydqwCA/mKxZvQOYb/3aER96y0KXCWdZji3E2WQLQecAbtkWO+HRhiT8FmFfxk14JrnjcIMl6yoQ3ogwcge3snHsjPxgc0eYUooAGxaQ1kWST8Oh8BnHatWQnYE/yMUPvNoG+W2tn5DCoKHpd2kVjvg9VdaOjKNMV1t3qyKL0ae0OQJ7jeS0Qy9kBmux6Kl7qEStooUf/0wO/gJG0XWvt3rZ6HF64mkGf1rmOV1eDtv/yTz5hBRCzLq3Ts5rYNEMx+rpbVB6g0PmRBWdNjaZ4Biz33mLlemO0dUQ==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DB9PR04MB10067.eurprd04.prod.outlook.com (2603:10a6:10:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 07:36:25 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:36:24 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/9] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Thread-Topic: [PATCH v4 5/9] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Thread-Index: AQHbpATYHQy6ZlVHS0Oim8hxs5J+S7ORjbGc
Date: Thu, 3 Apr 2025 07:36:24 +0000
Message-ID:
 <PA4PR04MB763033995576A03705DB2FBFC5AE2@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-5-9f898838a864@gocontroll.com>
 <Z+2O0MeWOz/MeKOS@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+2O0MeWOz/MeKOS@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|DB9PR04MB10067:EE_
x-ms-office365-filtering-correlation-id: 76c8cf6f-5cec-4baa-a794-08dd72823cba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ncD9bPnj2HrsoW/Gltqs7q0iB5Vxisffe8IaQ9EhFAeB7lgsn9R8DTbQSl?=
 =?iso-8859-1?Q?C7LC85tQlWKJr46BBrJk5e0TS5tXQTT8CaYpunaCdXgeyhL3xe8KVJ4Za1?=
 =?iso-8859-1?Q?GDbAq2qz72eDJQa+hfP0TDT+ob1PeIB6IrAB6iAUNOyQKWjQa4DW2qYmgQ?=
 =?iso-8859-1?Q?kW3FDp+R3orVxL87LdDY7yAdtErgpdyh889p+/aI+0yzFc1l0J2OVxYdcC?=
 =?iso-8859-1?Q?s0XyxUj56PyuYsUVgXtQTTJ1l/333NeFBfZa7JhiIdTHcziwfp3gQQPMu0?=
 =?iso-8859-1?Q?dNO/uqLt9A+nhSlgZj/yTS9WeVQwhGy5aMZO9mHbCIaQkH3R8Zb6uBZyiM?=
 =?iso-8859-1?Q?mkCodgzcQHbF7I2w4YgtnHXSg4TRAw8VHPQyoNdm0TcSjiV2POc/xLuvyQ?=
 =?iso-8859-1?Q?g5qMoqzq50SevM2QUYOHJfR+r00cWwkSfnHYAWEJQPwOU8kgEtHi8LhnZw?=
 =?iso-8859-1?Q?d7QA7HWQbEm7qQ6sr4jCYWCj1mnVcpVQoYwlBWOUrp+ce/SBbqxbsm3a/Q?=
 =?iso-8859-1?Q?e6NSwqzuxoAPYASlFh4hDtociXcibtcgrjxMr97e30ENNLeuM5LR/tGrAt?=
 =?iso-8859-1?Q?D/SfPiPI8v5gKmTtHM29IqZCYqm5Dish877MSBbDZRuZqrnmVfETfgRB5J?=
 =?iso-8859-1?Q?oKVU4Wl5VVJfH/Jm1dolmYPARxgzbse7hQl2is03eFNL2wTdcTSfL7NL+3?=
 =?iso-8859-1?Q?YxIz1cFXELTuHKNcj3YXbdtW68YlU/sixv4INgQnlAn2ZOqVjbaMahKAlf?=
 =?iso-8859-1?Q?jXutIIbZGDQpy7g0St+XW2Z7wrykKJ2ormZc0leHtdY2QC/arQTAe+q3yx?=
 =?iso-8859-1?Q?ZM0tJmz1SR8ev11M5PuCrnUrlJnWfl/vOvsR0OLJo910fhP4lpeSLoXqAT?=
 =?iso-8859-1?Q?vVAhUhTOjV9G+gC/vVmpKq+ZufA2nOj38LPIepan2e/v4bDkUNkGyDUSSH?=
 =?iso-8859-1?Q?GrsifqSVGMBjSp5jEyy1H/bdgxaBGmiRTDW1tCYTG6HRKp1fM1CBVDHyc+?=
 =?iso-8859-1?Q?OSohV7AbaUnlah2GZ20PkD+OPcxyOYYcnIpsHv+hzKEWp4l68ZMpZsqlg8?=
 =?iso-8859-1?Q?sLZQrVbPt8G3M2o1ieEt7tKJ1zCcU8utrinf64UJzpK5MoWhFNqqZpvgfs?=
 =?iso-8859-1?Q?w+U8N1kZDaufXp5P6NVsXGs6TNewn+ZD38kaJRqOcC4KvzQncYiGp0DzBu?=
 =?iso-8859-1?Q?yXn8dL+Cul65jDX0E6NE9cmWTZO1QHsF34OfJaInLSG1D5LiL99EFwNpNf?=
 =?iso-8859-1?Q?SjeIwmBlyxh8Z4F/MSRCHejxpDTZtPE4ctEMWrVYrM+3JmBfitlOr1rezl?=
 =?iso-8859-1?Q?rnM9lCz0e3EpTxnu3URmpc6T9jvyfwA0Wbb+MiW2nYvW+qEHXcK+XT5Kc0?=
 =?iso-8859-1?Q?UZKyiFte4JDgb5mVYkxg1SWD7u7+vp6b00NkAMCmPo9sAxpDf7BLgJsHjk?=
 =?iso-8859-1?Q?sQvWNccml8uzkPvcJgV0FRNhxDX925X4ni2w5Allc+ANXKQn0CiRRpUhV8?=
 =?iso-8859-1?Q?ZHCogrIpPix8ooovFtAxYa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1PaOUSLRLX+GMIVkzJz6T7Tn0WKQabSH2ydOM+ydeKftG7pTlLXThOUaVh?=
 =?iso-8859-1?Q?NQHhvgIqvKmBQYYFUZL/RsEIji7wK4Pp/roUUD9wSh5GCTVQX32iX4tF3o?=
 =?iso-8859-1?Q?SyJeXZZFK248AWuOL8ln9M97cbjoYEDtglfgb3yFXju1IdEqIzvYrLyOAX?=
 =?iso-8859-1?Q?rhMQwoNBzqTUrrFR2x5xQ73bYBb5HPQriBIbyyOc3afmbFCcdKuCw+RwkV?=
 =?iso-8859-1?Q?Wrn4nneUVfddCp6m5QJO72jaD49yxU7agG9+ZhfSB5zSyEYF9JA/GhEsgR?=
 =?iso-8859-1?Q?7pLJK6hePIajNTBobAnfuOS3c8wuh4n//kNLNy6rKSQDWhwuYwjRh0FPk/?=
 =?iso-8859-1?Q?O3GxwlxoUqfVgzQlkPhaawLrZnLndncBneJ/zBCPgDOWZs99kWZMiTTO4y?=
 =?iso-8859-1?Q?0bWaYyH+Ssawxkdlk0lt/BcwEKz0RPgjVV+H0+YKMH/bv6rrhSh8DDU0/V?=
 =?iso-8859-1?Q?4eHLQPynBVxXPjMoQj6Aw3Yc6YG8zTznXGVw02Srh+2EYYgxa3ljARnb+j?=
 =?iso-8859-1?Q?GFW+P+S0cXLrfi52qyFjH6s7EqyTbjNQNT62rzKFVLjuvGA4TGYTRUksTY?=
 =?iso-8859-1?Q?26TWoJKZ1eYlMibwdnIM1Lbo+zHhAUDfJyf9M9kvDVljTg80PrVJbP91nD?=
 =?iso-8859-1?Q?5OQj6wjOKv3Jtp/KJlHohb8rePyj8q7uwRLQ18zM3gUumaIJ34YMhZDyQQ?=
 =?iso-8859-1?Q?qiSfkI7anurueSVw7YzqvnRv63BIo119UkyV3kw0wtXe+F6sJQf5r+05AS?=
 =?iso-8859-1?Q?vJcguarOqPoU8YYnyCIaGN7qnVEmhN2cMyK2SNtQMyQZaDytNEd/kTwMr8?=
 =?iso-8859-1?Q?uTAyAYV+vPi0pHoClmTHUYEbRM+d456iZm+PsjuwtXB+PIMnd8kp6CNlup?=
 =?iso-8859-1?Q?k/oM9+ZL/As2hxtR8CbUdAq9iDkw5RHCiyUhfyMDRT1vkSVsdkwQYIwpG6?=
 =?iso-8859-1?Q?kzDOmluDthnY5POe45eu6osBtm33GlFLdY4JcTveza8rEbZIztoFEcSDbX?=
 =?iso-8859-1?Q?mDGciiMZRSRpXE9oCsDNQVhYavXJXG0uE8tMwFLPlnKItGDgS57cREeHRW?=
 =?iso-8859-1?Q?c2JhE8RDFk859T1kMlEzBx/GI6TCKHlVMjvJmK1ih6XkIvYeFfVc6y+pdV?=
 =?iso-8859-1?Q?XujtxPE9Qp5swEQgQYe8RJ4WbcPizY/1bTGOGzYwsK3e6kqVmVY2XpVIQq?=
 =?iso-8859-1?Q?VppfxgWUuQN/to4KJcrzxy7wI2eY9dhNzhDvpln3ILeognCYLjaawMeCP1?=
 =?iso-8859-1?Q?fxVlHGhyWENYhnxJxsojDTbIvdarVJL9T/7m8y38S1EGc9RGF0DV2F6Rpo?=
 =?iso-8859-1?Q?sIDh3N+2iKdfg6aR76T+6anZY33ch5m+3ipGk9BgPOboeGR4vKuVjZaR3L?=
 =?iso-8859-1?Q?OGjmk8hTIqgHnx3cCrEy5rhI8xIdsDrgh+jTtRCi3Bp58SS/2waBJBeauZ?=
 =?iso-8859-1?Q?CZF5JX52jkgsOMPua4FOY2onUK1YWETE6sQVy9kcQEngeHZJKuYtMiwZKW?=
 =?iso-8859-1?Q?YDm0TwPHkEWNNjiF8WUsGO1bJUR19enJ8LGlUvZmm7Iura55XCwM3t3Ldq?=
 =?iso-8859-1?Q?e3DgtM4D3iPNcy8iH9rqN3Tad2z5YQN0POcqQ5HVAynKSCXq6Y2xrLPzac?=
 =?iso-8859-1?Q?m7fFmuv8hAMfMsMJ2+LkqCrRgKdKgvk98XOsI8M313gEhzS4oOgL+KMIBf?=
 =?iso-8859-1?Q?zuZGTCpiGhR85u7CmD93YxwhyZUqZwiXyYtvp+qhfdkZwEoFrYFdCKpDRj?=
 =?iso-8859-1?Q?37vA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c8cf6f-5cec-4baa-a794-08dd72823cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 07:36:24.6346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYMqerjXuuJyMMepVQ7NUmlBlhNLYpEVt1oA6T6+f/ggVc67g/X0+PtSR6l29J67awM3IMzJancnwed+U1e6Dq33lLqNJaG5nCvjrSGMXwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10067

=0A=
On 4/2/25 21:24, Frank Li wrote:=0A=
> On Wed, Apr 02, 2025 at 09:07:08AM +0200, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has=
=0A=
>> 2 GB or ram and 8 GB of eMMC storage on board.=0A=
>>=0A=
>> Add it to enable boards based on this Module=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
>>   .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++=
++++++++=0A=
>>   1 file changed, 548 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>> new file mode 100644=0A=
>> index 0000000000000000000000000000000000000000..9c69228a2cd28ce767fa4054=
d10b19a196668ea2=0A=
>> --- /dev/null=0A=
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>> @@ -0,0 +1,548 @@=0A=
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)=0A=
>> +/*=0A=
>> + * Copyright (C) 2020 Lothar Wa=DFmann <LW@KARO-electronics.de>=0A=
>> + * 2025 Maud Spierings <maudspierings@gocontroll.com>=0A=
>> + */=0A=
>> +=0A=
>> +#include "imx8mp.dtsi"=0A=
>> +=0A=
>> +/ {=0A=
>> +	/* PHY regulator */=0A=
>> +	regulator-3v3-etn {=0A=
>> +		compatible =3D "regulator-fixed";=0A=
>> +		gpios =3D <&gpio1 23 GPIO_ACTIVE_HIGH>;=0A=
>> +		pinctrl-0 =3D <&pinctrl_reg_3v3_etn>;=0A=
>> +		pinctrl-names =3D "default";=0A=
>> +		regulator-always-on;=0A=
>> +		regulator-boot-on;=0A=
>> +		regulator-max-microvolt =3D <3300000>;=0A=
>> +		regulator-min-microvolt =3D <3300000>;=0A=
>> +		regulator-name =3D "3v3-etn";=0A=
>> +		vin-supply =3D <&reg_vdd_3v3>;=0A=
>> +		enable-active-high;=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&A53_0 {=0A=
>> +	cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&A53_1 {=0A=
>> +	cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&A53_2 {=0A=
>> +	cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&A53_3 {=0A=
>> +	cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&eqos {=0A=
>> +	assigned-clocks =3D <&clk IMX8MP_CLK_ENET_AXI>,=0A=
>> +			  <&clk IMX8MP_CLK_ENET_QOS_TIMER>,=0A=
>> +			  <&clk IMX8MP_CLK_ENET_QOS>;=0A=
>> +	assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_266M>,=0A=
>> +				 <&clk IMX8MP_SYS_PLL2_100M>,=0A=
>> +				 <&clk IMX8MP_SYS_PLL2_50M>;=0A=
>> +	assigned-clock-rates =3D <0>, <100000000>, <50000000>;=0A=
> =0A=
> clock rate 0 is quite strange, do you means 266000000?=0A=
=0A=
I must admit I blindly copied that from the source, it does make more=0A=
sense given the name of the parent clock. I changed it and it does seem=0A=
to work fine.=0A=
=0A=
It seems that in imx8mp.dtsi it is also set to 0, so I think that is=0A=
where it comes from.=0A=
=0A=
>> +	phy-handle =3D <&ethphy0>;=0A=
>> +	phy-mode =3D "rmii";=0A=
>> +	pinctrl-0 =3D <&pinctrl_eqos>;=0A=
>> +	pinctrl-1 =3D <&pinctrl_eqos_sleep>;=0A=
>> +	pinctrl-names =3D "default", "sleep";=0A=
>> +	status =3D "okay";=0A=
>> +=0A=
>> +	mdio {=0A=
>> +		compatible =3D "snps,dwmac-mdio";=0A=
>> +		#address-cells =3D <1>;=0A=
>> +		#size-cells =3D <0>;=0A=
>> +		pinctrl-0 =3D <&pinctrl_ethphy_rst_b>;=0A=
>> +		pinctrl-names =3D "default";=0A=
>> +		reset-delay-us =3D <25000>;=0A=
>> +		reset-gpios =3D <&gpio4 22 GPIO_ACTIVE_LOW>;=0A=
>> +=0A=
>> +		ethphy0: ethernet-phy@0 {=0A=
>> +			reg =3D <0>;=0A=
>> +			interrupt-parent =3D <&gpio4>;=0A=
>> +			interrupts =3D <21 IRQ_TYPE_EDGE_FALLING>;=0A=
>> +			clocks =3D <&clk IMX8MP_CLK_ENET_QOS>;=0A=
>> +			pinctrl-0 =3D <&pinctrl_ethphy_int_b>;=0A=
>> +			pinctrl-names =3D "default";=0A=
>> +			smsc,disable-energy-detect;=0A=
>> +		};=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&gpio1 {=0A=
>> +	gpio-line-names =3D "SODIMM_152",=0A=
>> +		"SODIMM_42",=0A=
> =0A=
> Please align to "SODIMM_152"=0A=
will do=0A=
=0A=
Met vriendelijke groeten/with kind regards,=0A=
Maud Spierings =0A=
> Frank=0A=
>> +		"PMIC_WDOG_B SODIMM_153",=0A=
>> +		"PMIC_IRQ_B",=0A=
>> +		"SODIMM_154",=0A=
>> +		"SODIMM_155",=0A=
>> +		"SODIMM_156",=0A=
>> +		"SODIMM_157",=0A=
>> +		"SODIMM_158",=0A=
>> +		"SODIMM_159",=0A=
>> +		"SODIMM_161",=0A=
>> +		"SODIMM_162",=0A=
>> +		"SODIMM_34",=0A=
>> +		"SODIMM_36",=0A=
>> +		"SODIMM_27",=0A=
>> +		"SODIMM_28",=0A=
>> +		"ENET_MDC",=0A=
>> +		"ENET_MDIO",=0A=
>> +		"",=0A=
>> +		"ENET_XTAL1/CLKIN",=0A=
>> +		"ENET_TXD1",=0A=
>> +		"ENET_TXD0",=0A=
>> +		"ENET_TXEN",=0A=
>> +		"ENET_POWER",=0A=
>> +		"ENET_COL/CRS_DV",=0A=
>> +		"ENET_RXER",=0A=
>> +		"ENET_RXD0",=0A=
>> +		"ENET_RXD1",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio2 {=0A=
>> +	gpio-line-names =3D "",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"SODIMM_51",=0A=
>> +		"SODIMM_57",=0A=
>> +		"SODIMM_56",=0A=
>> +		"SODIMM_52",=0A=
>> +		"SODIMM_53",=0A=
>> +		"SODIMM_54",=0A=
>> +		"SODIMM_55",=0A=
>> +		"SODIMM_15",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio3 {=0A=
>> +	gpio-line-names =3D "",=0A=
>> +		"",=0A=
>> +		"EMMC_DS",=0A=
>> +		"EMMC_DAT5",=0A=
>> +		"EMMC_DAT6",=0A=
>> +		"EMMC_DAT7",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"EMMC_DAT0",=0A=
>> +		"EMMC_DAT1",=0A=
>> +		"EMMC_DAT2",=0A=
>> +		"EMMC_DAT3",=0A=
>> +		"",=0A=
>> +		"EMMC_DAT4",=0A=
>> +		"",=0A=
>> +		"EMMC_CLK",=0A=
>> +		"EMMC_CMD",=0A=
>> +		"SODIMM_75",=0A=
>> +		"SODIMM_145",=0A=
>> +		"SODIMM_163",=0A=
>> +		"SODIMM_164",=0A=
>> +		"SODIMM_165",=0A=
>> +		"SODIMM_143",=0A=
>> +		"SODIMM_144",=0A=
>> +		"SODIMM_72",=0A=
>> +		"SODIMM_73",=0A=
>> +		"SODIMM_74",=0A=
>> +		"SODIMM_93",=0A=
>> +		"",=0A=
>> +		"";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio4 {=0A=
>> +	gpio-line-names =3D "SODIMM_98",=0A=
>> +		"SODIMM_99",=0A=
>> +		"SODIMM_100",=0A=
>> +		"SODIMM_101",=0A=
>> +		"SODIMM_45",=0A=
>> +		"SODIMM_43",=0A=
>> +		"SODIMM_105",=0A=
>> +		"SODIMM_106",=0A=
>> +		"SODIMM_107",=0A=
>> +		"SODIMM_108",=0A=
>> +		"SODIMM_104",=0A=
>> +		"SODIMM_103",=0A=
>> +		"SODIMM_115",=0A=
>> +		"SODIMM_114",=0A=
>> +		"SODIMM_113",=0A=
>> +		"SODIMM_112",=0A=
>> +		"SODIMM_109",=0A=
>> +		"SODIMM_110",=0A=
>> +		"SODIMM_95",=0A=
>> +		"SODIMM_96",=0A=
>> +		"SODIMM_97",=0A=
>> +		"ENET_nINT",=0A=
>> +		"ENET_nRST",=0A=
>> +		"SODIMM_84",=0A=
>> +		"SODIMM_87",=0A=
>> +		"SODIMM_86",=0A=
>> +		"SODIMM_85",=0A=
>> +		"SODIMM_83",=0A=
>> +		"",=0A=
>> +		"SODIMM_66",=0A=
>> +		"SODIMM_65",=0A=
>> +		"";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio5 {=0A=
>> +	gpio-line-names =3D "",=0A=
>> +		"",=0A=
>> +		"",=0A=
>> +		"SODIMM_76",=0A=
>> +		"SODIMM_81",=0A=
>> +		"SODIMM_146",=0A=
>> +		"SODIMM_48",=0A=
>> +		"SODIMM_46",=0A=
>> +		"SODIMM_47",=0A=
>> +		"SODIMM_44",=0A=
>> +		"SODIMM_49",=0A=
>> +		"",=0A=
>> +		"SODIMM_70",=0A=
>> +		"SODIMM_69",=0A=
>> +		"PMIC_SCL",=0A=
>> +		"PMIC_SDA",=0A=
>> +		"SODIMM_41",=0A=
>> +		"SODIMM_40",=0A=
>> +		"SODIMM_148",=0A=
>> +		"SODIMM_149",=0A=
>> +		"SODIMM_150",=0A=
>> +		"SODIMM_151",=0A=
>> +		"SODIMM_60",=0A=
>> +		"SODIMM_59",=0A=
>> +		"SODIMM_64",=0A=
>> +		"SODIMM_63",=0A=
>> +		"SODIMM_62",=0A=
>> +		"SODIMM_61",=0A=
>> +		"SODIMM_68",=0A=
>> +		"SODIMM_67",=0A=
>> +		"",=0A=
>> +		"";=0A=
>> +};=0A=
>> +=0A=
>> +&i2c1 {=0A=
>> +	clock-frequency =3D <400000>;=0A=
>> +	pinctrl-0 =3D <&pinctrl_i2c1>;=0A=
>> +	pinctrl-1 =3D <&pinctrl_i2c1_gpio>;=0A=
>> +	pinctrl-names =3D "default", "gpio";=0A=
>> +	scl-gpios =3D <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;=0A=
>> +	sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;=0A=
>> +	status =3D "okay";=0A=
>> +=0A=
>> +	pmic@25 {=0A=
>> +		compatible =3D "nxp,pca9450c";=0A=
>> +		reg =3D <0x25>;=0A=
>> +		interrupt-parent =3D <&gpio1>;=0A=
>> +		interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;=0A=
>> +		pinctrl-0 =3D <&pinctrl_pmic>;=0A=
>> +		pinctrl-names =3D "default";=0A=
>> +=0A=
>> +		regulators {=0A=
>> +			reg_vdd_soc: BUCK1 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <900000>;=0A=
>> +				regulator-min-microvolt =3D <805000>;=0A=
>> +				regulator-name =3D "vdd-soc";=0A=
>> +				regulator-ramp-delay =3D <3125>;=0A=
>> +			};=0A=
>> +=0A=
>> +			reg_vdd_arm: BUCK2 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <950000>;=0A=
>> +				regulator-min-microvolt =3D <805000>;=0A=
>> +				regulator-name =3D "vdd-core";=0A=
>> +				regulator-ramp-delay =3D <3125>;=0A=
>> +				nxp,dvs-run-voltage =3D <950000>;=0A=
>> +				nxp,dvs-standby-voltage =3D <850000>;=0A=
>> +			};=0A=
>> +=0A=
>> +			reg_vdd_3v3: BUCK4 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <3300000>;=0A=
>> +				regulator-min-microvolt =3D <3300000>;=0A=
>> +				regulator-name =3D "3v3";=0A=
>> +			};=0A=
>> +=0A=
>> +			reg_nvcc_nand: BUCK5 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <1800000>;=0A=
>> +				regulator-min-microvolt =3D <1800000>;=0A=
>> +				regulator-name =3D "nvcc-nand";=0A=
>> +			};=0A=
>> +=0A=
>> +			reg_nvcc_dram: BUCK6 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <1100000>;=0A=
>> +				regulator-min-microvolt =3D <1100000>;=0A=
>> +				regulator-name =3D "nvcc-dram";=0A=
>> +			};=0A=
>> +=0A=
>> +			reg_snvs_1v8: LDO1 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <1800000>;=0A=
>> +				regulator-min-microvolt =3D <1800000>;=0A=
>> +				regulator-name =3D "snvs-1v8";=0A=
>> +			};=0A=
>> +=0A=
>> +			ldo2_reg: LDO2 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-max-microvolt =3D <1150000>;=0A=
>> +				regulator-min-microvolt =3D <800000>;=0A=
>> +				regulator-name =3D "LDO2";=0A=
>> +			};=0A=
>> +=0A=
>> +			reg_vdda_1v8: LDO3 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <1800000>;=0A=
>> +				regulator-min-microvolt =3D <1800000>;=0A=
>> +				regulator-name =3D "vdda-1v8";=0A=
>> +			};=0A=
>> +=0A=
>> +			ldo4_reg: LDO4 {=0A=
>> +				regulator-max-microvolt =3D <3300000>;=0A=
>> +				regulator-min-microvolt =3D <800000>;=0A=
>> +				regulator-name =3D "LDO4";=0A=
>> +			};=0A=
>> +=0A=
>> +			ldo5_reg: LDO5 {=0A=
>> +				regulator-always-on;=0A=
>> +				regulator-boot-on;=0A=
>> +				regulator-max-microvolt =3D <3300000>;=0A=
>> +				regulator-min-microvolt =3D <1800000>;=0A=
>> +				regulator-name =3D "LDO5";=0A=
>> +			};=0A=
>> +		};=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&iomuxc {=0A=
>> +	pinctrl_eqos: eqosgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK=0A=
>> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_SION)=0A=
>> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC=0A=
>> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO=0A=
>> +			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)=0A=
>> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)=0A=
>> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0=0A=
>> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1=0A=
>> +			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER=0A=
>> +			(MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_eqos_sleep: eqos-sleep-grp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22=0A=
>> +			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_ethphy_int_b: ethphy-int-bgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21=0A=
>> +			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_ethphy_rst_b: ethphy-rst-bgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22=0A=
>> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_i2c1: i2c1grp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL=0A=
>> +			MX8MP_I2C_DEFAULT=0A=
>> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA=0A=
>> +			MX8MP_I2C_DEFAULT=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_i2c1_gpio: i2c1-gpiogrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14=0A=
>> +			MX8MP_I2C_DEFAULT=0A=
>> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15=0A=
>> +			MX8MP_I2C_DEFAULT=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_pmic: pmicgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03=0A=
>> +			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_reg_3v3_etn: reg-3v3-etngrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23=0A=
>> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_usdhc3: usdhc3grp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK=0A=
>> +			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7=0A=
>> +			MX8MP_USDHC_DATA_DEFAULT=0A=
>> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE=0A=
>> +			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENA=
BLE)=0A=
>> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE=0A=
>> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENA=
BLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +=0A=
>> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {=0A=
>> +		fsl,pins =3D <=0A=
>> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENA=
BLE)=0A=
>> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_USDHC_DATA_DEFAULT)=0A=
>> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE=0A=
>> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENA=
BLE)=0A=
>> +		>;=0A=
>> +	};=0A=
>> +};=0A=
>> +=0A=
>> +&usdhc3 {=0A=
>> +	assigned-clocks =3D <&clk IMX8MP_CLK_USDHC3>;=0A=
>> +	assigned-clock-rates =3D <200000000>;=0A=
>> +	bus-width =3D <8>;=0A=
>> +	max-frequency =3D <200000000>;=0A=
>> +	non-removable;=0A=
>> +	pinctrl-0 =3D <&pinctrl_usdhc3>;=0A=
>> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;=0A=
>> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;=0A=
>> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";=0A=
>> +	vmmc-supply =3D <&reg_vdd_3v3>;=0A=
>> +	voltage-ranges =3D <3300 3300>;=0A=
>> +	vqmmc-supply =3D <&reg_nvcc_nand>;=0A=
>> +	status =3D "okay";=0A=
>> +};=0A=
>>=0A=
>> --=0A=
>> 2.49.0=0A=
>>=0A=
>>=
