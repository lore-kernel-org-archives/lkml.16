Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D825B31D;
	Tue,  1 Jul 2025 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353632; cv=fail; b=f9S1ZLoRmjfUq1Jez5gdrISCqUYL94BXSy07AXP6mDYDZ8fKBeEK+8M90DMH/FODQoSjANRPs9EWeriF131TrVLAH4APwNC9TEVJe8QOLz3zQx3bSrxQTFIEbhqnIAXhAoA/qrkyn8IxAeY+naE2gP1hkuf2SNUB3bImo42APsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353632; c=relaxed/simple;
	bh=FkRjBJF2kivSGqbqHSrW04uwHg5OHOUhkT0Pzzq3Ykg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZNJ8jURgdVWhmYyImKQO4zlHuthG7j7niVUKwrgC+SUvD4nnjPw8IkLurIq6JhUcSo8B4zJyT9lby6vs5jFlqc0ken6e8n0wYI1dUsitgXXUYqXui8VyPTTMFlYSVGAWufFQd2kSCRjMbGxh2HPioTyqfjjVe2oAWyb9dWNKl1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BquA2dN3; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BquA2dN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXSug2kZKT3dkq/oh1msaTbjdFLn6RploeOciBLuTzEPHZh5/rXGgi2rNkQlVd5tV6ssYDTTvbQUJU+oh9p+VncKnsWweWQGYfVVtuz+8ZSlZmMy7WlWOCdfs0vlusuu4Z9yT1aEEXVNwRgHxebaxz/pVp8XPhQjW+np6STedz+90JK4ZBKIkNxNGVOS1Ib737FBne8uOc3JpJHPYcqpz2MUUwggzj9+P93vZ3l2tAXE+SYM5UqDhGGwpBruyOnczZxONYy3LsOG+Rim3/ZrM300UKafAGxtYndUTCO2f7ZBrp1iknVG/XgEjYoL0uBm6bQLGBYvq2iQuwsSOK/kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjMVzuVSftRVCuFM9mCoCgGOdDc9i0oNnnLt86GL2tI=;
 b=OTpgr6zVKMS7oJHU2NL0cinuFLf4qmM52lC1Zx9Dgwfsh+WL9vO7upc1gGn9hfBsjx7UOg/1c0U3BmXIrgKHCwKnKAIthTUBCTiOSdGWPJcom6jcq2Lt1w9Wiz1eG3XeTb82wY5DUWPWQmSqB8mYPgkF9RxTCuqCj72xDkulO9FGryZYbbz0uZ2X9xzvMwK/QYnZUC3b/JF8oBPiUDtAKezjNPQdj5XjcKM0O/YtWNvizW+MDik6gvEnLsguhRb1U3X10nCKh/T4pLps7UCt/S6maeHHFvNB+e8+5EswnCsdlKCjBIVsQQ3NdA48X0Ss4EYcagvFhMCBIp264y2/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjMVzuVSftRVCuFM9mCoCgGOdDc9i0oNnnLt86GL2tI=;
 b=BquA2dN3XF9avSknaZTCIuaQjhw5n3f8YawYpKojb5fjmRBp92qLT1ZQuQa3gxceowjQKJHztsqmd4fY/uSYFUwRhpUtY7+CGUuVvXP1APrTgnbiPPpWgFJ1F7nsJ2HR+hrHY1KQrmyoUPY+2MRdNITLA8BCSjXPHlJKTQYgrx72CqrxX24UDAS5fxM9YDma/UxPKkJ2drVL8lCT5eDdqMpGakhU9Hu+IuB04H+NLi8irZJjpkH4VAlz/0KKFk4KMfhPd8XlhEIuTkg9Zpjl5ASy6+RKt76i479Qm943ZNZnnIDVjxQsk8naECvXJUUMmYF7Lz6YzYdkvI0eCd7iFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9356.eurprd04.prod.outlook.com (2603:10a6:10:36a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 07:07:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:07:06 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 01 Jul 2025 15:04:40 +0800
Subject: [PATCH 4/5] clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display
 CSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-imx95-blk-ctl-7-1-v1-4-00db23bd8876@nxp.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751353495; l=3123;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=FkRjBJF2kivSGqbqHSrW04uwHg5OHOUhkT0Pzzq3Ykg=;
 b=7SEH0A0pm8QbCktXW7sreTmYJAbRRAojxL4vrUC1NOEVszwds3mxa/hB2sBrf+YUXYkfWqVFE
 ONucFEVuWd6Cs/SfIhSaYglYIg4iwjdscf8riTo74uj4xIJIP53JMLS
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: e968d203-d9f6-497a-ad05-08ddb86de32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wi9aR05JOUEvcUpMSkY0d1QzUUtieGk1eEpYelRGWnFzUGtnbzlVbGhUbDBw?=
 =?utf-8?B?aXYzNjRNdnR5RHVMR0NUK1JadC9rZS9ZR3hmeVNSSGJLZmw2aHBHWlFzelR4?=
 =?utf-8?B?T1VVUHh4cEN5QVdiQXI0b0o0L2N6N0dvVTZmL1d6SG1qaDU0Q25QNDRIM1JM?=
 =?utf-8?B?YXltWVRVS1dvSTN5bk1ZWVgrQnVPZmFPV3pXUFErSTdUTnlLMDRpbFJISXFO?=
 =?utf-8?B?VjQ1WGF3aFFHV2VmMmxkU0lsUmtOdE5TNVdaalFuMmFvYStIUDhqSXpKUUFp?=
 =?utf-8?B?ZCtPZmxvWDdERmtaYmF3UWRrOW5KcTRXNVNJNVlTZkowV3dLTFVkTGtEb3Ju?=
 =?utf-8?B?Nnp5bzdmVjJkK0luL1hqaTFxZERTSEFudFZuRWJ3WDBMS3g2a251MkpnOTZj?=
 =?utf-8?B?TEw5S3FyakZGUlMwaC9RSlpRMW9TSEFPczgwNzZBT3R3VVRjS0ZiNzY4aXRH?=
 =?utf-8?B?QUdqS0I1ZnMyVEc1RjNtNVJpUkltL0hFd3lIeHE5M01IZkFRRHJhdS9yeC95?=
 =?utf-8?B?VnYwWkhPcFA1Y1pVWlRQSVJuWFlhandES1pBZkQ3K1Q1a0YwdUNNRjFNSjlz?=
 =?utf-8?B?MktHZ05JdmJRQ2N2dm5DVVpldSt2NU9YMnN4blY4UnZoVUwzL2VwTkNwaWhj?=
 =?utf-8?B?bENzZXdRVFphMEtKZ3A4QUNPakpQdmtiYVprWFJsU01HcGVabUZzcTViU2dM?=
 =?utf-8?B?Y2htWWRQTGtveDdod0Y1Y0pZdTl0a1lOZy9pM2VUVUdzckJEWndGRWI2Ti9B?=
 =?utf-8?B?U1I2RFdpSStsc2NuZVU2bDJXaFRleXZsdm1FZUJyZDNxMjgvUVdPbENLSUV6?=
 =?utf-8?B?b1Q1TWRTRk5wM0pyb1g3b01hL0RJeXFIMmFtUFgxbndOSEx0WVVhYlpOVlkr?=
 =?utf-8?B?RUp5K1AweFZRSi90dmtyejB1RDB1OUZZRWpLQy9iWU5NRXYyU3FaRHhZV0tU?=
 =?utf-8?B?TUYyakwxVkk4N2JFNS9FQUxLTFE1RWNZajl4MlRYcitndUtnZEVOMzJxV1Zu?=
 =?utf-8?B?M0RPcWVyMDQweC9WSXFQYTMxb3hVQXFGclo4dG1oT2JBa3JaSUxpMGJYdmEz?=
 =?utf-8?B?UTUrUmFVODJzVmFLK1Y4WXhuNnZoRXJ4S0k1bnFvSGRkWGF6dERPRDVWWEtu?=
 =?utf-8?B?YmZQekhKb2F2ays4VnliRlBjWmV2OExxN29JdzdHZUtZVzdXNituak56Vjh2?=
 =?utf-8?B?NHkwcUxGa253NVYzRXBVMmtOTStrNGQ3c1I5QmVxY0VPSFNCemJPdDRCeHpk?=
 =?utf-8?B?ZnlGTmpjNmR0ZU95Z2xMczJPZVNZYlRXZHdVZW9vMGdWMXJpUEpaRkZaMDda?=
 =?utf-8?B?MTJuOUVhN1ZTYVFIS0U4Tm84Tm5yRTlZclFwS2d4UzFpajR3OHNXMFpjVldv?=
 =?utf-8?B?SnV6cWU5R3RkQmlQSXhsQUJjbWRCUGt6blgrd1V5MmtLM3JJTEprZjZ1ZlFE?=
 =?utf-8?B?aXRHUmZTNUJENG1jd1JSM3JBRHF5d3poakc3VGJPTUVUTThoQytzazhmd3c3?=
 =?utf-8?B?VVJFNzlsd0xxSU9WaXhjWHFOMEdkVzJxc3Q4V0gzN3hIV1dIN2ozak0rckNR?=
 =?utf-8?B?Zm1YNWg0WWJRb1FUYUIvNzJJR0lRZVplc2ViWWdWZlovQ1BWT3RYR0JyNWVD?=
 =?utf-8?B?YXdLTHBsMHRiV0UvWU9RZXFVa2t3Ukc3UkdqOUU4cXYvaG9DTjlWK1F5bTIw?=
 =?utf-8?B?YmJNcE1udXQ1akV6b3JUUUlyanVDZVJsRTJLcnRLQUw2c2FNZ29VQnFnRXVn?=
 =?utf-8?B?ajlweTZjRVExZzg2bnpZQko5b2JsUzNGU1E4eEFuU2xzamVPd0c5OXNKbi81?=
 =?utf-8?B?SjVRcWlKM1JIMjZ2czZBVmZWNlpSL3JtVVh5eHVpZ1RlNXFvNE1IVzVkNCt4?=
 =?utf-8?B?dEEyajlVRW0yb3AwYTNBS1Z2WEhRRDNoZTVWNTN6WFRadWF6eUtnVkhzdVYx?=
 =?utf-8?B?QUQ2U2NYUVlJNW9UelI5b1ZQMEpNMXVEZGo4UHpSbWJlWmlHYjdtTzZCdHNI?=
 =?utf-8?Q?4w+FAe0Lx/gHJQl1ey5Kd0wOvUN070=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnZ5M1BhSDV1cHhnZmJWQXNMZVJFdDdaVVpQTC8yVUJJT1VQT2M4Wjg4cmFj?=
 =?utf-8?B?VEE3VHltN3BwdWpwdGlpZlNEdHlLaXZ6Smg2K0dlVGhYVDIwVStZVjl6bnJT?=
 =?utf-8?B?dS9GZ2Z3Q3M0NkQ2czJoSUpoQ0d2VUFHMWdDRGlWeEV0aDRqOUJ4VlYrQXVq?=
 =?utf-8?B?Sjg1c3JYSFo4WDFtYmR1K3lGWmlWMndKbGo5VVBEcmdFcU52ekxoUmlsU2pY?=
 =?utf-8?B?SmdCOFVCd3pFejJORUhPQ3lCV0dJZjNzYy9pcUNqL2czbGxrS2pzUjR3MmRm?=
 =?utf-8?B?bUhMWW5ReHBWUWpnd1pRSFBYVkluWDJrdkErRVhZUmFwaDNTdW9tait6T1hl?=
 =?utf-8?B?elpCd1ZqeWRtU05jN3BZcmY0UE05N1FhOFEyK2t6aGpHQ2hNSmVjT0dyNzlW?=
 =?utf-8?B?UW14UkFCbFY5WEQwZklCNVZDYVlTN2JVa0hBUXVBRngwTEVqcFM5L1FDTmQ1?=
 =?utf-8?B?RnhXVGl2clMvN1RlcytwTk9KaWdFV3JZN1pRU2R5RHB1MWc1b1dGV28wV3Mw?=
 =?utf-8?B?QXYyY2NSS0J3N0JKZVQ2UVFONG94QkZxNGV4bmR5MDloWUdna3F5cEpHOXpH?=
 =?utf-8?B?aXF3LzZuQU9veUt6S2N3citOS3pubm5hNjFoYktaOHFJQ1E3Q0d4dGNlWkpk?=
 =?utf-8?B?alZvUHVNdllRUE9PZVlGODEyM0pqUlVHNC85QnNRbW16Y0pIWW93WHZ1WnQx?=
 =?utf-8?B?aFJMNVRpRWtzMmFJOXdxeVhoVWdyam5BeTlDeFBNMTBmK2p1SWpjb0lYbGxp?=
 =?utf-8?B?WFJlNUpWL2hoWXNSeDB0Tis2TnlhYVZSTTBuMUFDYUU0eVA3MjlubENpcU91?=
 =?utf-8?B?djYrRlFwY0t3bnZoL0pSVmRIa25RUnlhK0tRbk1HUGEwVklMUjdRTVUzTGJM?=
 =?utf-8?B?QzRkR1FZbThYS0JZcnlqeHBHejNTeHVBZUh3ekdnSkVCTHlPTFVFMlI4SmRp?=
 =?utf-8?B?SUJ0WkZHQTMwY0RLMjVOREtkWExkV0w5MFQyQTJ3VWI3aUhOQXRWM2FZWTQ1?=
 =?utf-8?B?dHZBUlZoUDVPNUxqZmszeTlyWEViRW5qcGtsT0VDRlV1S2hTNlprOWJ0RzJi?=
 =?utf-8?B?YWppVUdHMUd1S2tINkYvTE4zNTB1aEQwU2pWNG9JUTV1d0NWdVlIS1p5dmdB?=
 =?utf-8?B?dTV4aTVGQ29CTzQ3LytLMXA1eWFQU2NRc0RyVzFFeEthZ1REbExyb2NWS3dV?=
 =?utf-8?B?aGFucWkzN3phemZSUEZHL1JSM01FRGQrOHk4WVlsbkF4TWlXOG5LR1EvdmJl?=
 =?utf-8?B?TFNrallNbEpIUUhGWERGS2UzaFdjM0VDRXhLZ2JBMnNvWEdONXdxVjZhTk1W?=
 =?utf-8?B?N2JKcnpTQmcwdmk1Y3Q2WXl3RHdlV3UwL1I2UUZ6bVExV3d2RElLcGV3RTRW?=
 =?utf-8?B?WEJUQkRDMXhFSTM2ZWVGVDlUcVE0QklpTWkzc3VxeDdpVDBhd1BHZXRvaWF4?=
 =?utf-8?B?VklhTGp5NmNkM0QybEFPcytQUldzQmozV2NFVWh0WU0xbDJNb044WHp2S09P?=
 =?utf-8?B?SWtpUSt4dlFFb29GYWNoOFdtOEFLaDVOaGRjR1ppTHk3SXRMZG02SUdjZUgx?=
 =?utf-8?B?cFdkQSszSTRzZnJpSzN6aVhpbEZScnZzUU93Tm81bThpMEFVTUJpaHRsQVRo?=
 =?utf-8?B?VEMzaXdWSEdqUlYxNWhZb0hLZzFGb0k4elF3RGx1VGVhL2srUmN2bE5Pc3Fi?=
 =?utf-8?B?SVF4NUxCNmxjRTh0T0dTWlVJRGx0MkVzU0FZcEhwdGEwR2E4TGUrdnRaeDFO?=
 =?utf-8?B?M25WdW8xSzNUNXRqb1ZKZkhIdThDWmV3M2Y2Tys0RG5aNnFIMXVrU2J2bVZ0?=
 =?utf-8?B?eDhxWGp4MGNVSHg0Vy9Hcm1pWlk4TjVvUUZYNVFDb0RuYUE0QmFKRzNNODNT?=
 =?utf-8?B?NXg5KzYrbjVtVXB5OTQwWHVwUE54dWUxWXlGM0xUeVl3NHdQN2Y2TXJrSG9u?=
 =?utf-8?B?cVBDU3BEU2M2NjlZdFpoMWZLU0hKREFzblljbHIrb3lFanBaUjNaY3VibXly?=
 =?utf-8?B?VmhpYnZTdkc5VkpLQ0RTRHltbldJd2VMZnMrdzAxYTdiNFphbkd4VGNhV1FQ?=
 =?utf-8?B?V3hWaGR2MzEwVGpGN1M4Z2pOUjJUR3hDTElrV2F5TjNiN053c2tkYWFUZzVm?=
 =?utf-8?Q?lzWFdgQDUmD+TNe6CnnSp31s2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e968d203-d9f6-497a-ad05-08ddb86de32b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:07:06.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZQodhEeatqwjI8b6v/TNXmih2uIsdcKoTmITgiHrUM5DqznskJrQrEgOV4GmAnuy7KwZlxCmIuidTBaQmyNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9356

i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
register controls the selection of the clock feeding the display engine.

Add clock gate support for the two CSRs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 50 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 828ee0a81ff62c6e4f61eef350b9073f19f5351f..5fe582b0d4a9a197f2c1a49dc18f15ca83ccb4a4 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright 2024 NXP
+ * Copyright 2024-2025 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx94-clock.h>
 #include <dt-bindings/clock/nxp,imx95-clock.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -300,6 +301,51 @@ static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
 	.clk_reg_offset = 0,
 };
 
+static const struct imx95_blk_ctl_clk_dev_data imx94_lvds_clk_dev_data[] = {
+	[IMX94_CLK_DISPMIX_LVDS_CLK_GATE] = {
+		.name = "lvds_clk_gate",
+		.parent_names = (const char *[]){ "ldbpll", },
+		.num_parents = 1,
+		.reg = 0,
+		.bit_idx = 1,
+		.bit_width = 1,
+		.type = CLK_GATE,
+		.flags = CLK_SET_RATE_PARENT,
+		.flags2 = CLK_GATE_SET_TO_DISABLE,
+	},
+};
+
+static const struct imx95_blk_ctl_dev_data imx94_lvds_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx94_lvds_clk_dev_data),
+	.clk_dev_data = imx94_lvds_clk_dev_data,
+	.clk_reg_offset = 0,
+	.rpm_enabled = true,
+};
+
+static const char * const imx94_disp_engine_parents[] = {
+	"disppix", "ldb_pll_div7"
+};
+
+static const struct imx95_blk_ctl_clk_dev_data imx94_dispmix_csr_clk_dev_data[] = {
+	[IMX94_CLK_DISPMIX_CLK_SEL] = {
+		.name = "disp_clk_sel",
+		.parent_names = imx94_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx94_disp_engine_parents),
+		.reg = 0,
+		.bit_idx = 1,
+		.bit_width = 1,
+		.type = CLK_MUX,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx94_dispmix_csr_clk_dev_data),
+	.clk_dev_data = imx94_dispmix_csr_clk_dev_data,
+	.clk_reg_offset = 0,
+	.rpm_enabled = true,
+};
+
 static int imx95_bc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -474,6 +520,8 @@ static const struct of_device_id imx95_bc_of_match[] = {
 	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
 	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
 	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},
+	{ .compatible = "nxp,imx94-lvds-csr", .data = &imx94_lvds_csr_dev_data },
+	{ .compatible = "nxp,imx94-display-csr", .data = &imx94_dispmix_csr_dev_data },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx95_bc_of_match);

-- 
2.37.1

