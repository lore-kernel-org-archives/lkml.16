Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3DA192D6B;
	Tue,  1 Jul 2025 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375068; cv=fail; b=OpEMSnbs6PigIlo0ZBNGdtpRo99F/Ale0+TfEzgDM1NcgAwewjAFsTsOqOzPOL4rrm8QWeMe8StiCjh+4DACVyquu5wDKjLaZM05onV0izIN1p6GNsRD0A0UVxopGHxEUMB5r+BMMm3QcT1cgbGBjf2clvYt6sSN7A5h8lQs+HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375068; c=relaxed/simple;
	bh=50J9rpobjEk7HDuqaRVx3vCBhllnLOpUqWdYAB10X1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3pijlH2+EG3FqLGZ5b9HAG0aCb336xCq0NhFhceqXBPqCNXo3Mqb4ZVOLwQ9GDRq6yH34SdMau75CoIy0teCWNWTEpp1SJ3xssxvG3/I2/0EOTslIrB9eOr/Ctl4dhC8CZtA0ZvPBtdXgXfkbSJ5OILL0Q1zM0Kx6A0ElLr8QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C/eoALGv; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C/eoALGv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG6LzKFTcCgE0JPJi/B8+D1eCAZKA4TaNU+2oillqqAMo0aeN9ClLIlQAFanEcUI9QGZbGzcxEhbgI8+dOKbBtmxeXKq+2bfN1O7MZFjbSQwts6YXrd91y7zKXA71ckPZf4Of87knOa22tGe+7s3qN3tbNw7z8cD/ShWHlSlpUruScsBLBKTrTTtz6YwUBdGxzfXwUFjzNn5davusU91p+1lkC9B18GJIZ2boR5TwtV0YVKNmIz1hyEJdF6+IpE+8bUNr/+S8kdgIxnSh/JoaisRwkapBiKqUJaDZ3ZUaP9otgtzedieVYkIlVV1bUT33mtxPVnhluIFURw/tpcX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50J9rpobjEk7HDuqaRVx3vCBhllnLOpUqWdYAB10X1Q=;
 b=wBsGDNkNdTdnjOEkr2CEcyn5x2Pgxy49BDKEMsD0+R57/MZJCOXZop2G+GEvdTY0aiGk6tnZ3xyNCI9Xe3/GEiswJqNomDRMJfLJs07QV9EKzMbSxi/UHcNy4Hz/yjaROT7bJcIZEM/SctHsbCc3wBJLkAanL5948zFKf4QBnzd/pErQRXY7Vavvjw6+wKBvRQcoXNzVfPtM9JQm6rYJRfxY0wx2cAPMGNd1wLzvALYnJdNGPlCuAxvGlARlH1KejoId4EvoWDjyKM9eVJvQYelfXf0BVGoLXcZVSf4As55LsTGgYYntzKIhM7kz7N0s/9OQzU0Infm282sbS6n14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50J9rpobjEk7HDuqaRVx3vCBhllnLOpUqWdYAB10X1Q=;
 b=C/eoALGvhRe8cieuYejrbuGoMykKA1JjfACZjpeyF9rAkZEfRKK+mZ/t2MavIZ9j8CE2J6eFvBiB6Nlo/ieeJCBd4QzQwDXLEvRpSdBvsI6ajmAzRdcrqKqEG9Awyahan/0K0b14kxApY0o2evFOqQ6FWuRQGCAWBs//kTzgRirRm0aokyuBgWx9Jg5gTVphAjqCxNHTm/57sVvnFKzxIUiSOT29GK8kCBHKBepwSWwrESmtbymeAX+laMMdHTEyL3kDXyDxUIe+AfjllCWCAfOrGnAcPbcP5SKRotxiemAX3R9qiPyYtkZlEZz6TQHArf/LzjxRLpXriPDeEk5KuA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9286.eurprd04.prod.outlook.com (2603:10a6:20b:4de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 13:04:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:04:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Frank Li
	<frank.li@nxp.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: RE: [PATCH 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Thread-Topic: [PATCH 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Thread-Index: AQHb6la0KE/lySeH9Ue7yyiljH9uqLQdJLYAgAAXrTA=
Date: Tue, 1 Jul 2025 13:04:21 +0000
Message-ID:
 <PAXPR04MB8459BED6EAE13B22943E4C6F8841A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
 <efeb4af5-642e-40d2-b535-5aacc47bdb99@kernel.org>
In-Reply-To: <efeb4af5-642e-40d2-b535-5aacc47bdb99@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS1PR04MB9286:EE_
x-ms-office365-filtering-correlation-id: 3e7aff2f-382d-4a52-6f43-08ddb89fcc10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUNWNkpKN2krTjlhRmlYZVlJbjV3S0RaK2pUTWFOdGhxSmpmYjAyMnIwZU5S?=
 =?utf-8?B?cXpZSXBzUHRuM3Z3OEFPNVE1b1JkK0ZuVG5kaEFZTWx2NnpIYVdSeitDQlA0?=
 =?utf-8?B?aWNOR1hGRG90YXBkcFdwdnpmaWFVV1NnUG8xdmpMcjEvbERCSVNkSGFrWEdL?=
 =?utf-8?B?ZnJQYTV3ME40U0pYUlNEY2l5bVdOVnR2eTgzTGxsQmQ4dXJMUkFnclBFclFQ?=
 =?utf-8?B?MWdQMnlpd1ZrVnhpT0poZk9QeHMzTkpHaEtVSjh5a0h5ZEFXQVR4ZmxpMDFC?=
 =?utf-8?B?SUFHYUdVNkw4Rno5SmRZZzR0SjZrbEo5RjRmbEtvekZ4QnVaQlVwRTB6eHln?=
 =?utf-8?B?bjRjWUg2dEtBQ1dWb1VPQ2lwN2tEUzJXaGRnelp6RzRVWnQzcW9vM0hhZ0lW?=
 =?utf-8?B?QndHcjY0dHlnOVJCcWJ0QTdpNWJTc3NvVjVDQWpMM2tHRFVFVWtEc2YyQ1pr?=
 =?utf-8?B?UFdUL3k4WDdTVnI0cGZFUlNIWUtSUWI5MlNTWUVHS2dQT2s0bUwzN3U4MFRW?=
 =?utf-8?B?eUlYRjB2YjNaV0JiRXg0cm4xN3pMazJScndUVmxPbGNlWVBHSHRibWZ2Sm94?=
 =?utf-8?B?TTY3Vk44ZzZ1K3VWUEZpWE9FNEZSVTk1SjE2Q01EQ014MytyR0RYVlFEWW1s?=
 =?utf-8?B?RVJmbW0zVHVKc2dXcFF4VEZjblV0THYxeHFWZzhJT3BkdzNJUmpPSlgrbHcy?=
 =?utf-8?B?d3NkNzZoZVZyWkd6K1EwMkJML2daTkZiVGdRMkRqejJXQkgxVUFINjZFVVN4?=
 =?utf-8?B?UWo2cUx0d05SVkNZZmFuZit5V0lMZUg3ZG9tL1pYMnJwMURXMGpkMVdxSzh3?=
 =?utf-8?B?UXdlS3pEKzRabVdmT1NqOFRzeXdsQ0lzTW9XcDdSRzBMNjFBUzZBdjZJOEM4?=
 =?utf-8?B?cklPUnRLRC9ZbjByWm5zRS9ERzVhTGRJV3hSbmc1RDA2SmZoeVpVYVByU1hH?=
 =?utf-8?B?OVlwdlRVcUFmSGxkSjFmRXZBanFhcnMxZmpqWU4yaytsd0NSVlhKenUxVXMy?=
 =?utf-8?B?V0F3SkVCTkhQVmVrTzNxbnp2YWhaUXpnZmJ5MThld1pJSXYzSFlWMFJqSXpJ?=
 =?utf-8?B?TzFJcG5DcFpyL1loVXBuUlkvQzJucFNnWEhBZERETmVyaXhRVDBMVkZzYldR?=
 =?utf-8?B?bGFjVzUzamtSQ0pSLzZHbEJGYzdvNHJJK0NydkU4MC9GRnhhQW54L2hwR3FY?=
 =?utf-8?B?d0ZSaVVISVl2VDhqOUNYSHdaK2hOT1BERElZQktob29wUWtpdm1XRDRCZEhF?=
 =?utf-8?B?UFpjUnMrVlF3SWc4VE9iSHViREpxU1d5VTBRUkc4NVRLN002Wi8xelhmUGdq?=
 =?utf-8?B?ZVQya3lRdDVsb2w1bElhMGhuYWx3d2k1VVdxM1paVWRqZk1zODN6Mmt1a2ls?=
 =?utf-8?B?Ylo0aDBERE5yYUE3YXhVdzhobzlzbFl4TlZjMjh4NkdZdC9MSUo3VnltN2lK?=
 =?utf-8?B?NWVtdlo2MWlvUUM5YTYrMEFKaFFocVkvR1NDVTBhYktZTFZGdlVCMWxuTjNJ?=
 =?utf-8?B?NHZkWlQ1Tk9GSEZUTWxDLzMwcTFpcWFTSm0zWnlZRzhhUTY2eVFMbEdZVjBI?=
 =?utf-8?B?QjI4VUZmc2F3bkJqVWozMUhHM1FUWm9KdVhJN1FBWTBORTAvOFVyS2tVSTNO?=
 =?utf-8?B?L05rdFVlRjV2OVdaYnpwUGpJVHA1NzhsRmlMOS8zaHp5SUVTbTNGbWJYZTRH?=
 =?utf-8?B?bEV4SDc1V2t4SHZ2a1dLSGhIb0RjNXBhd3A2UEVyZ2FxeU1UelVPNUU2Q2Rt?=
 =?utf-8?B?cmZ2d3BzZ0xwSGpFc3JVQUJURUFuNUdqdGdhcUp0N1dVM29uK1h5cjBBVk00?=
 =?utf-8?B?VVp0OXVZTkhVSk5mUDhVNjBQSjJBNG9NVlRQZUpyU3RuU1Fkems2a2hmUjJ2?=
 =?utf-8?B?bmpySzNpSWl4WFQ2VnB1cU1PbXVkd1BaRUlRempBVFJwTmVUeFlReEdVNmRh?=
 =?utf-8?B?NG1aWkx1Sm8zVVptUGo2dCtQU0hYblVFRk04RnRRdVBhRFh2Z0E2UkFWdnRt?=
 =?utf-8?Q?9QZVg4MTaFKRG0rse7AU1D94g2zTCc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0E1dWVndmx2QUUyeCs3TzVDdDd4SWZWMGNOTEEya1g5OUZQQWJHMjF6U3pK?=
 =?utf-8?B?NE54WG13aEQ5UFppL1JPWHJVNjFhenNZbzgyclZ1UjZtQzg2dktRK2E0aGhG?=
 =?utf-8?B?VE5KT1poM09wUkZJRWhQSzE5TWcyZEl3cms0ZHQxQ05iVHFtcHVXNDVTUlF1?=
 =?utf-8?B?b3YycDBiTmM4QjUvZ2dEUk1DcmdwMnBqWG1ObnVlL0RqWFNpOVJGYys3VXAw?=
 =?utf-8?B?cnpGOHo2RGVlcklxSktrWFJ4bG0xekR6a2NkWm01SVpRUE1UZHZGcFFDcTZo?=
 =?utf-8?B?MDNCTVF0cHRib29ZVCs0UmVZZ2gySWpFTTZrWDdYc3FrU0kvMGJxRzNPK25N?=
 =?utf-8?B?Y1BRNE9GTlpsd1V6R0FtNXlaU2xqdklGRUFHN0Z1MEo1bzVUWWVBREhZUHpo?=
 =?utf-8?B?ejllV2NJVWxLRkhzdHhLcE5IdktoOHd3YkxTM3gxc3JhRnhOckE3Mi9QVVpS?=
 =?utf-8?B?c1Z6NVNobVpoUEJLaTBwOFF6WHhTRWE3eWoyY3Q4UnNVWURGU1FnaVo1d0Nm?=
 =?utf-8?B?WHE0UEUxeWpQQ2F1cXNNYzlXd3pGVEV1b1QyemJrbW5wanNWZTVIcEpMZXVW?=
 =?utf-8?B?bHlrMTliUXFRZklSN1pmY0lIS0lEcWE1bmcwTUhWM2JmeWFUWGgzZW9vM21x?=
 =?utf-8?B?Szd4cldLZHFEQ0d4Ni9yS1hSNE9XZXdkblRzSGU1c2pVdUJTZXVtaklNNGZV?=
 =?utf-8?B?elhja3FCcWNEbzdGalhkeXA2YWRJRzRScHVBNURrNitSdXcvRHZIalBCbjBC?=
 =?utf-8?B?c0ZjMThiZm5xcnZtZGErLysyeERsZVNucUQ1cUNNZmxROXdRTG9DQ2F3cmth?=
 =?utf-8?B?eWo4UXZITVNGdDhaWEpOVmZVODZXQ2Y3VlV4Nm9KdUM0NVV3bnpNTjd3ZkxR?=
 =?utf-8?B?Vmk0SlE2Wk51R3VEK0JpUWdXMG1LY3VTU01NVWdBUG94RG5NVGRmZlBSVUpH?=
 =?utf-8?B?VkE4cFhtL1MwNmxxbnRYeEtycVM1ZjdaRE5LTFlZZ1FGWDNmNE5nelRkaHVF?=
 =?utf-8?B?cWdTdnRpcVVyaUlLaUc2Y3ZLenNPVVNuRDVuaGd0MVNiZGlPaFJzTjZWTXBU?=
 =?utf-8?B?K1NEeXVRa2FqbnMydWVPSkVFRVlOT1AwcThtOU94S0Z6aXFUSkNhYzhOR3Vv?=
 =?utf-8?B?NUo4dVJNT1k0V0tOWjhDTEJLQUt0SHhhYkNqRzE4TWF2STdCR0ZZWkVFV2Z6?=
 =?utf-8?B?SGRUdmV5Wm9UdGNmNm15cm1Qa2pUSjJjdnU5T2ZTMlNXejBJTC80TlJzcmtG?=
 =?utf-8?B?ajh2SDdrRW9HajUrVG5uT0ptdEtNcmdwTGJ3RXdPWTJWOCtRTkpLRWlYU1dw?=
 =?utf-8?B?amtRMHlBcVdLc1pRTFVEckRlNFVTcmt0SVVTVVRvbHgrQW1pVFVnK09ISlk5?=
 =?utf-8?B?ZGovMlhUWHg0QzVVUCt1M01sakZETSs1dXEyeFBhU2tWV01HUjhSRXo3V1RR?=
 =?utf-8?B?aHpYV0lwQktsOVM0M2J6bE8yYXhYd0lqZXF3aHZtNjFUSDdyWXpSbm50ZmV0?=
 =?utf-8?B?dzZWMUVEanV4QUxYaUJIZjZoVnNOQkFWTkFPMkNZV0pjcDVrZHM2UWh6c2tI?=
 =?utf-8?B?WWgzOFBYRzZDY1NCQWRNd3VZeDF2NnNZZXh2N084U25TbnFzOWtkY2VvdlFw?=
 =?utf-8?B?U3crQTdLK1pFRmJIMEZFSGRHR2lUeWpreGxqTmtzbUdyQ09NUG1sdmxWYjVO?=
 =?utf-8?B?Z1hNc000cnhSNVJWWlJzQnlNdWFGQ1VPTmQ4NE1SaHEvU3NkMFdSTFNWbWNP?=
 =?utf-8?B?SG52YjlLdmRObVpzTlNZVzlvem5CYTFCVS9vcklscFczelJnRDZ5N1QrYlZs?=
 =?utf-8?B?c09mRVVqRkN1amNESXFGRzZEK0VGcGpKS0EwOTlwdmo1QmdxZFNCSnJMa0Nq?=
 =?utf-8?B?d2ZIZXprNWM4TzYwZldFelNXVlJ3ZnhwNFh6TUtEdmRmbjc1R1pvTEpmV0RP?=
 =?utf-8?B?NXFYWGw5UkdycWxxWnFodVFNY05SWlJXeGNmckxpdDI0SiszZGo5WHBjY25F?=
 =?utf-8?B?cTZNSy8veFhKTDBpS2QrbUZtU25JVTlmTGJYaWsxOHg2em1HdzBBYzRhN3Jx?=
 =?utf-8?B?K0FkYVVBUWMyc1E3dGc5WHFQaXAwd1RiK2I4aTRmR1R0eFNVZVhoZ3pyK3Fn?=
 =?utf-8?Q?KDCI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7aff2f-382d-4a52-6f43-08ddb89fcc10
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 13:04:21.9396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKY2dZe4erz29k2GHdBdYz8nQxwOyp8Y7NjWoDYLP8+ykG/Gz8kRd6ujTcPQj2bva7o8T9oTATwAr0jUfTJUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9286

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgc3VwcG9y
dCBmb3IgaS5NWDk0DQo+IExWRFMvRElTUExBWSBDU1INCj4gDQo+IE9uIDAxLzA3LzIwMjUgMDk6
MDQsIFBlbmcgRmFuIHdyb3RlOg0KPiA+IEFkZCBpLk1YOTQgTFZEUy9ESVNQTEFZIENTUiBjb21w
YXRpYmxlIHN0cmluZy4NCj4gPg0KPiA+IEFkZCBjbG9jayBpbmRleCBmb3IgdGhlIHR3byBDU1Jz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL254cCxpbXg5NS1ibGst
Y3RsLnlhbWwgICAgICAgIHwgIDIgKysNCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9u
eHAsaW14OTQtY2xvY2suaCAgICAgICAgICAgICAgICAgfCAxMw0KPiArKysrKysrKysrKysrDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9ueHAsaW14OTUtYmxr
LQ0KPiBjdGwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9u
eHAsaW14OTUtYmxrLQ0KPiBjdGwueWFtbA0KPiA+IGluZGV4DQo+IGQwMjkxYmZmZjIzYTI3Y2I1
NTY4Mzg4MGZlM2ExZjhiM2UyYWRhNWEuLjRlMjBlOGM4NjYzYjNiNjY2DQo+IDVmZjkxYWU2M2Ux
NTM5YWE4ZTljYzliIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9ueHAsaW14OTUtYmxrLQ0KPiBjdGwueWFtbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9ueHAsaW14OTUtYmxrLQ0KPiBjdGwu
eWFtbA0KPiA+IEBAIC0xOSw2ICsxOSw4IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAt
IG54cCxpbXg5NS1sdmRzLWNzcg0KPiA+ICAgICAgICAgICAgLSBueHAsaW14OTUtbmV0Y21peC1i
bGstY3RybA0KPiA+ICAgICAgICAgICAgLSBueHAsaW14OTUtdnB1LWNzcg0KPiA+ICsgICAgICAg
ICAgLSBueHAsaW14OTQtZGlzcGxheS1jc3INCj4gPiArICAgICAgICAgIC0gbnhwLGlteDk0LWx2
ZHMtY3NyDQo+IA0KPiBXcm9uZyBvcmRlci4gWW91IHJlY2VpdmVkIHRoYXQgY29tbWVudCBvbiB5
b3VyIHByZXZpb3VzIHBhdGNoZXMsIG5vPw0KDQpBaCwgYWxwaGFiZXQgb3JkZXIsIEkgdGhvdWdo
dCBudW1iZXIgZG9lcyBub3QgbWF0dGVyLg0KDQpSZWdhcmRzDQpQZW5nLg0KDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
