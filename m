Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012069.outbound.protection.outlook.com [52.101.71.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A2C26FA52;
	Tue,  1 Jul 2025 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377395; cv=fail; b=dvy9N8M5vR4ze8gmm4Y1l9+8d4Sw8wTWRmnzqQMHgFPxaF+Czg8xXYBrFXEfLz8dUfYl9RR3Yye5ZW4Lcn1xl/8YbQRyh5RBspu6x+TMo53W3aaWoLliGQfqMHEMk6rSY+vfDOZba3DF1UH6D91BKSu9erlqEiKrcMkzSNA74bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377395; c=relaxed/simple;
	bh=m3yjYXxKz8p5OcpXBIV+gaKsHj/1DI7urbjCk9UWh/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSm77vTcFF30jNciSyqk11wERioAQxS9AB0Db74KHdssJEltmOlgF1SIbwOYRrxrnwHnE82mNkDXkXstGzXSKwTt78ZLtfRoB19/GWzrxYxkv7rx4F8DC7BOhAZbgISfpJ9IicoP698zwwTJGPZcPxYKEqHuLQ8zUq2PLmeQZ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c1u9uNrq; arc=fail smtp.client-ip=52.101.71.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c1u9uNrq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1bWh7KjitqAvzI/H6GbLKu583JTKtcepS+/n0NKbPOR8hpRg5lrnOFCf+E1hKAoALtiOaTwwtsYjsJorVuwW9NmtjsH17YOzp0KhM4tuQMV/wLV05k3ZKwaBJtGh6eYfoz4ZM+ETQjeE2dW9HgM+LfNZd8mckoCxHd1r/DZrRpktUn5uwI34aU3LU0VOBYIkzbW5hLVBiU1qK4QESjWBANyfWBAu1UigBnz1eKbg5U+uJ9dKyHAbkYSiPH9QsUQwpomUXtYeYb6Hn6dDdl0LMRUzCn/TfJJbME0aLXmYP55w3rTh/lO7y9IRzRrWifaUAyvx/ILBDSoTlZhB7/YHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3yjYXxKz8p5OcpXBIV+gaKsHj/1DI7urbjCk9UWh/4=;
 b=nDmY+2tStp4+K4mFoR0ARXthyst/0EyJRSck9UpshZGLvA8krwDPga7fIDJkiV/4iuOjasfTjMYdrRx1hMyBHN6QvMXa8PVNub/YOVUbCyJNTVi//4fd/JhG9l/J31rRoNrSRZBSzlzfId3obt4FqhMMR5WwYUstMbGfwvPe6WJFAZwcNoHqpIr013G+kWDE5VLbsmRY5oV04emwVIGpmJ4K/LhbPcB9R1TtC5c6aUQP71GqDfYr8pWWwM01wj32GCk0I2ICEmxwRNByRHrOip6OtNB8IYX2W+/bI6eE1/Jh3KXpxTbVSXBa5jMr3tqaPF0VquJds78n/Uk+0XBeDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3yjYXxKz8p5OcpXBIV+gaKsHj/1DI7urbjCk9UWh/4=;
 b=c1u9uNrqgcabmvp+dm2T+0gQhu38O69ZhG8ajoxJt3t684Wo5OGEov69V8zu1Knxq7jgwtifzHNUg3Qhi5YRKM5wJyhH1/0tAC3Q0gXZju0O34YjLKQ1O/4R2nO1rZZATMi19sYnPbUtbwPyCcM5oqnuK8vJ6Cw0k30uq7InxqJ8S2Ld+7frsMXi6kbBaWIr2k1P7mbRSTzmbYan4rAjbNfznVov48nu0lMaXlES3UUL7u693snMy+NZUsk+DR6ps2nXI6nUyGzJ3zMeSm6M6UePcLIeunxNP55c3xPJk+u0zFf7OA3zqiODszgC3Z7yzaFAW2LoU90nJuGguax6OA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB11257.eurprd04.prod.outlook.com (2603:10a6:10:5dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 13:43:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:43:10 +0000
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
Thread-Index: AQHb6la0KE/lySeH9Ue7yyiljH9uqLQdJLYAgAAXrTCAAAYwgIAABD6g
Date: Tue, 1 Jul 2025 13:43:10 +0000
Message-ID:
 <PAXPR04MB84592379C34357482F218FC18841A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
 <efeb4af5-642e-40d2-b535-5aacc47bdb99@kernel.org>
 <PAXPR04MB8459BED6EAE13B22943E4C6F8841A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <0cb379b9-021f-466b-b9d2-03dccdaa738c@kernel.org>
In-Reply-To: <0cb379b9-021f-466b-b9d2-03dccdaa738c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB11257:EE_
x-ms-office365-filtering-correlation-id: 6966f931-1232-409a-286d-08ddb8a5381d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVFrWUZKT28vdkFFS25qMGxrTExnS0svMGVLaDRtd3o5MnBHMWYrTjFNQXVC?=
 =?utf-8?B?T1BndTVZQ3MvZE5qQkM2MWFtZnFWK0pYbklicXJiUGJIUmUyMjB6bGVxUEtR?=
 =?utf-8?B?dG9rMTBBZXJYZ1F5cC9VYncwckJFOTdES3dVKy91MnB2NnFFYkw5V1poVWNB?=
 =?utf-8?B?ZjhxYWZLeUs0NlpSeXhNSWVORVRGcGljV2duVVNlYlR5a05KL2JJUGJVTUdy?=
 =?utf-8?B?Yk9EOUxwKzRtYytXelJ2bk9jOXdvZEdtdE4zZDRvVitKL05SbUo4WDF2QWM0?=
 =?utf-8?B?NVBUTTUrWUFUMk9UWnVMclI2U1J6N3MxT3FnS0xUWjFQWVZka0ZaU0xxRHEz?=
 =?utf-8?B?YTBsQUdaemN3MGdPTWZNeFRQcUE4UUMrTTcwZGNheUZ5RXNEZUl0K3NhdHJq?=
 =?utf-8?B?NkFLTThPOEUzRnNCQzBhRFZtTFdRb3daS1o3TkVvQ0I3ZFlOZStMVlBXSW5C?=
 =?utf-8?B?d2s5c3FlMUVRWTJ5TlB6NnM0N29id1k1aHlEUEZaQXdSaVBkZmFENTNBZ04w?=
 =?utf-8?B?eHYwTzdKdjJVdTRPczdsNUdXZ0ZCRCtvTWtKOWZlbUdSMUwvSld1WEFrQll5?=
 =?utf-8?B?K1V5Y2M3YWhUSE9XaTJDTHpVR1RNekNrdG8yMUg2cmdCTTE3cFpCRTEyQlJv?=
 =?utf-8?B?dUxOSU44aitmYXl2dkU4K2JJeC8ydHJRWGdBY3lTNkdvaVp4Q0pscWF1cDgw?=
 =?utf-8?B?Sm1ON2c5T3ozNjNERTZLV0RONEhsM28vOWJjbmZiUXM1YnZhQkEvTjlReGdl?=
 =?utf-8?B?SjFKdlBhUTFzMXh0UDRCREw1QlZScVJ5TnIwOXZ4ajNYYmxzRmhMYURVZ2RM?=
 =?utf-8?B?Q213RjNGb2U2N0xoTFcvK1ZIeTczUTk0VmNTMmlwRlVqdG1FQ3VBQ29TeDRE?=
 =?utf-8?B?SnNSR1YyVzNQRG1BSy9SN0ovektzcnNvTHc2WDNyTUFoNFI1OW1PSGVNOHRS?=
 =?utf-8?B?cS95bmhtY3ZaSzZQVlcwOHRrZFJTUVA3VlRpVDlyZEVtQ2Rud2lIM21uR2ZF?=
 =?utf-8?B?NUpvanpnYjBOMXhXMkJRODFkRGYwUDhsaTUveGUyUzNqeXNmZkdvTElGTW9G?=
 =?utf-8?B?N0ZSSlpXbkMwbDNZVHhrV05Wd1J4Q3BITmJNKy9SRTd1VjlnN0p5eXdOeXo0?=
 =?utf-8?B?WGJFTElQRyt6UUpqZXZHKzRHV29rdGhMN3Foa2ZKQ0V5d3J6NUU0dDdXWE04?=
 =?utf-8?B?dzdxR0VKM3JJVHZxVkU1QUFPNVdrYWNtQmc5NWVsWXBrN3VXSzJFZloxd2xo?=
 =?utf-8?B?NDZWZjJ6Ny80dGFWSkJFMk5TYnd6cDdpa1c3YzZMbDduazYxa1I0M1RsNmx5?=
 =?utf-8?B?N093Tld1UWpKRGFwREMxYWM4MFB6SHM5ZFlCSGU0YWw0Mk9LeldJclArWWhW?=
 =?utf-8?B?RTJrU0kyWUF6d3MrYzltQUZQeXFYQXVVTStRTnpzcGl3OEllTHJJUnphZWhV?=
 =?utf-8?B?cGRPZVZ0cmpJelQ1UG9lZ1NmYVRaWEdUcSthcm9UaFhuTnFlUGo4UlVMUEhH?=
 =?utf-8?B?aFlOUUx3Q3BkYVd4bUZWMkg4c1ZBWkt6aFNLNmRVTUIxSnF2enAway9FY2Fq?=
 =?utf-8?B?RXl1aEo0M1dQMlljNFBQb0RiTk5NMzBHeXJxWHpZRHVQSzZTY2NWd2xUUFZN?=
 =?utf-8?B?cW5KUW8zN2tyR2RFYzNyTXdZelZQMWxhMDJicjE0YkFNSGRHc2dJaDNxMUNo?=
 =?utf-8?B?d1k0bVJqYkp3SjJHTkw0Yll3bVdaU1NRTXJ0dENCUmhHNS9PTURzeE1MRlZP?=
 =?utf-8?B?MFc3V0gxcSsyOVJhYkhBS0hFa3pXcmIzaVVnOFlKaFI2d1A5QkRwVWphdXg4?=
 =?utf-8?B?NmcycVZxN3ZUVml1bG1ud2NOSjBEMlNSMFNoNGNvb3FKUkkzWVpTWmpZMUJi?=
 =?utf-8?B?bDFHOGljQWRFNVNYR25abTdtdVhqQ1FONnFidlhPTzZiQ1I3RVQ4cVRRRzl3?=
 =?utf-8?B?bkxHdHJBVlJUZGNrbGM4ODU5MkZ0dGxicThHV21mMEZnMFNUOFU4dVJmZnRY?=
 =?utf-8?Q?BqsW5eCxpM80sLWXvtZ6j0zCwcrjwE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWxuYkgvMkRxV3NBYkgrOTlWL1VueE12cUQ1Z1d2Z3ViZnd2TTNpNU9jSWFX?=
 =?utf-8?B?UFUwZEtrS0NheWdnVXNLL3VNcEhOaUVSeFlXV3FjeXV6RENFdElCNHUreEp3?=
 =?utf-8?B?L1ovNEcvNTBwTkZrdW1JYkZWZFNvUDVyUVlKZU5MVnJNdUJRTXJtY0J5M1lG?=
 =?utf-8?B?K2JiT3hIazFIeWQvbVNkMjAwTlN2Y0cveHBzZVVIVzNiVDU5TDcyTmVUTGdX?=
 =?utf-8?B?Q2JQMTlROUNuUWo2ZVEyZ1ozVGVhR3pFR3Fxb1grUnhCeDdoY1ZDQjQ2dUxZ?=
 =?utf-8?B?Rk1ONWtoRm1HMmYrVFpGODNHcUtwM2pFaGIwSDNjQWpoN1g5NTBPakRRR09M?=
 =?utf-8?B?dU5yUkNKSld0aXZoV0hRVlRTcTFZdkI1MmVmTkV0UUJ3NHBvemhDNWVELzlh?=
 =?utf-8?B?Wk1kQVF1MzJYdko4ZjA4VGtzM3ZJQUwvaGFOL3gwL29uUVZnNXBrbXFGUUpu?=
 =?utf-8?B?d0lxMHI0bG5TR2tJYlMwdWNSaHBmTFpqb3Y5SzRCS3gweDRnSUhzYXZpOXhK?=
 =?utf-8?B?TnVDaTkwZE9YZE9aYU9oR1NWV3BCaHpTcVF4bWVtdXVOeVFONTkzR1E4VjM0?=
 =?utf-8?B?VVBKcHgyM1VLUjNndlNudmtwOUFETjJ3SlJRZHpTVzBCc1dlWjgxREQzNTUw?=
 =?utf-8?B?emlMSVBkMDhmMWd3YWtNd1B2NE8zR1VGcEFhaWFjSmR0SUZjVUhVS29lOXpV?=
 =?utf-8?B?ak1LTE5xcVhKaW0vUVMrWkhxTHZCak5CN1NDeUVqYmlSRkt4NG5zTmxETmpQ?=
 =?utf-8?B?TmpXd0txbHlVd0wyYUF6VlYrUXM0SWxDUnUxYlBlOG0zTkNrL0JOTTdwZEFJ?=
 =?utf-8?B?ak8wQ1Z2WlBpalZnYkhxbU1jUzM1UmJvd1ZQSkNsUzNucmVJd2tTSHd5V2JK?=
 =?utf-8?B?V0lXWEJjc2hndENpcVBpRVJXdFdwM0ZBVzVYL0N5L3ZKQlNVQmwxMnZaUFlm?=
 =?utf-8?B?UVoxOXh3ZlZ0TkdqdnNsZElrTmpsemZSM2tkOERoUzJTZEdXQ0tYaGJOK1c5?=
 =?utf-8?B?b0hJRFFoVXlFdUtaVXkxZFFlcDNhNVI5SkVwMzVzVk5vRWVGKzQ1YTM2WWpa?=
 =?utf-8?B?eUk4QnZtTUxTcHNOSmlHMDdQQndaOTVGcFhpTzVQNU52dXo1dC9tYVBMRitx?=
 =?utf-8?B?R2hzclRCM1lXdmpEUDJ5Rlg2dDUxbG5xM3ZTdEhNOUpnZGdzbk1idkZya0RO?=
 =?utf-8?B?Vnk2U3NkR3hzM3UwclI2RVc2aGlJNHZBTWhVNlRVbGxPMkQveFQwZStUMjBo?=
 =?utf-8?B?RC80bFpaZWg3TXd3dHMycTNpZzdtdE9jZFV5TGtBbjNudE1VbVFUeUJCd01X?=
 =?utf-8?B?eHk3UTZBMTdmbGVsYkxYcVpOelMvMVdUUGVuelFoQjYxeDAwMSs5WDZ1WFlG?=
 =?utf-8?B?TjRoUHRKbnhtVzEvYTAyM1R4Ni9kWW1XeUJMSjU1cStrcndZbmFkd3VlTFls?=
 =?utf-8?B?blVRd1pxdE5EY2RjUVRWZi96SXozM0s0dDlPL1VzVHpTS3dUZEhaN3M4TW9y?=
 =?utf-8?B?Ujl0NVVEYWZvRWtPRTJReWdXelhSdW0wbllRVEhQeFJweENON0pheHJzR0hK?=
 =?utf-8?B?c3gxdTMzWFh0WHJjUjFEbVNOano0aEZTTG1Xd0ppOGZIeE0wZCsvZTVMUkJ1?=
 =?utf-8?B?a0pWVGFFWEF4cVM1dU5pVzJ2VUFETWhxcm5mb1h4eFI0aE5QRHlZOExydVkw?=
 =?utf-8?B?NnlTd203alJCSlc3dUhHMkdnNDA2TUJ0UEd5eTZSVU4yaFNIem1sRHUvL0Fp?=
 =?utf-8?B?WkhCeDdBYVZUSHI1U3B4MDZXdjh4NWpRYnN2dGlBM2tsblUyQmxhbERCNXV0?=
 =?utf-8?B?Y29VWUs2bFBrQmxVL29GbGRmR3VPTllBejRoSUtyclkycUFXc2MxajVINVpM?=
 =?utf-8?B?T0hzbUFFV0M5eXBoUVdLZ1ZBeEJSZGhnYmtDdDByZ0xhKzBkL01jRnVQTHcw?=
 =?utf-8?B?cEtBOWd2QlpqdXFKbEVybE44bWpSeU1sMVNlbnBOY005Q2hyY3F1K055cWRJ?=
 =?utf-8?B?bkZtb2VjMHBnUVBnN29SenFUd3V6WEYrdUxlNXJwTEo3MEJnZHpOM0dTNkdH?=
 =?utf-8?B?ZWxhajQweThFT2hBUGhUcndBSmJ5eWlpS0x0SFkxd3lRcWZIUC9LNG01WjZD?=
 =?utf-8?Q?lO0g=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6966f931-1232-409a-286d-08ddb8a5381d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 13:43:10.6503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSn8W+anhbLIhLTMzYnqaL9p8rkZrixXslmTfUYpTTOmTGTNieTxbuZQgTfhQkNwENVR5n99I6U/XQqXeKDpmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB11257

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgc3VwcG9y
dCBmb3IgaS5NWDk0DQo+IExWRFMvRElTUExBWSBDU1INCj4gDQo+IE9uIDAxLzA3LzIwMjUgMTU6
MDQsIFBlbmcgRmFuIHdyb3RlOg0KPiA+Pj4gQEAgLTE5LDYgKzE5LDggQEAgcHJvcGVydGllczoN
Cj4gPj4+ICAgICAgICAgICAgLSBueHAsaW14OTUtbHZkcy1jc3INCj4gPj4+ICAgICAgICAgICAg
LSBueHAsaW14OTUtbmV0Y21peC1ibGstY3RybA0KPiA+Pj4gICAgICAgICAgICAtIG54cCxpbXg5
NS12cHUtY3NyDQo+ID4+PiArICAgICAgICAgIC0gbnhwLGlteDk0LWRpc3BsYXktY3NyDQo+ID4+
PiArICAgICAgICAgIC0gbnhwLGlteDk0LWx2ZHMtY3NyDQo+ID4+DQo+ID4+IFdyb25nIG9yZGVy
LiBZb3UgcmVjZWl2ZWQgdGhhdCBjb21tZW50IG9uIHlvdXIgcHJldmlvdXMgcGF0Y2hlcywNCj4g
bm8/DQo+ID4NCj4gPiBBaCwgYWxwaGFiZXQgb3JkZXIsIEkgdGhvdWdodCBudW1iZXIgZG9lcyBu
b3QgbWF0dGVyLg0KPiANCj4gVGhlIG51bWJlciBpcyB0aGUgb25seSB0aGluZyB0aGF0IG1hdHRl
cnMgaGVyZS4gT3RoZXJ3aXNlIGV2ZXJ5b25lDQo+IHdvdWxkIGFkZCB0aGVpciBzdHVmZiB0byB0
aGUgZW5kLi4uDQoNCk15IGJhZC4gSSB3aWxsIG1vdmUgbnhwLGlteDk0LVt4eXpdIHRvIHRoZSB0
b3AuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQo=
