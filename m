Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484731917F1;
	Tue,  1 Jul 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353606; cv=fail; b=hvWpaw5VXiBzpjGgKoZfAVPfEoYZS/W5NPBe3vAWQL+250NCu/hnP/yptv0GSXCpcf3jFGzwYdkc4Y+xtUplqO21gMk+p/ZPjfZMA8webL/YONfVEMAD3qkm7UG4/9j420Wo6w06oLNeNJJMeWIeYCvi8F24LJ6JW84bA7vFIFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353606; c=relaxed/simple;
	bh=3jnRI+RdGnYNH0X1YD4UYpFLeG3c3y70jpLatPP/zhE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=d7I4KZzuD37YXSoBF4ulO6Nc8wRpEbsspcKdB8ezi4L/r5NeuphuE1eW04UPpksEwmCBm4S5B4LfAuR+Ser+4CL4gfJbs0EwV0vc0CbD7wDysy9Fc/XTe+CC7L/27Sih5sAAQdevNWBBufy2w82xXJhEjLavLPAKkG1NRm511n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XdZJNDhn; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XdZJNDhn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgmfCg0Djz2k+IXWWl+qjGKXltvRD2GyP+17xlv9ZmGci83tgYLv+2pHik2cIKxqfA847vqI8gZvtqAanAfar2vYI4qmvXzMTbdpE5ApxGdhsQ8MDqi722U9V8bYH1favP/RpOCn+aaqjaoC6I/TRS78pmXTKH0apd/AzUTtBsMauxPFns6fE2g/ViTfOW0pXvAcB2/sPbwllo7P+L7W9faR5QouEYDfkLFWtCjEmMncP13eI959fNZjoFvZMQAHIuBmPmV/BD2NH03SXO6f59vssYvECHYRJ9TZudC++YamHLEi3sFdm6kvGDkkUXY3JxgmLqKJg7QlJ9jOvPB3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ9IFT68lA8/J2eQxYQuP+Uwy3wRf6BjYCLxc+kolCg=;
 b=rTpGhSulRw6XbqVWGJuBoWwlE34iSkHnaD9TsVsuzo+4urcYf7N/zCgNag3tzKoOkscymKGrE59FvnhburZBcuLdXnfPwtfHgd3RTHhbuWIrHQsU6EwJb/85B2rGG0tmBNAhGAHvz2YvCZGMHzfBY72C/ociDxpstn0csY4DjGsARwsrqBJ8byeNYtVGnWIXLFUj1XqpD/0YLv0FHSJe+RdC8vRsOKHh5odSZBhX+O/+v8Ijn5bhm8CpNP2p90Q4wSaNvayF58KFoAqppWr3tmeV0+2oueivAugueiVQgsRWbM/rlzLjgNtAt+i9+JaAuUhBS9wFzYnqcZmOPUPx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ9IFT68lA8/J2eQxYQuP+Uwy3wRf6BjYCLxc+kolCg=;
 b=XdZJNDhnwvXPncjOGRHtWP1g9VgRFx4Bx8Z3gh1Xr8WN82IGEJVzDOmrcX+EZAeDbUq2Zp/PNYKHP1O2nTUfkgBRBKFz5FWlaXJklvxWzgSJHnfeBBatBFIoMk+Useds/UXMqpfKyu1xVplBvu2V9jagbiGHGt5jA1JZk4XE0w1/WIJL0sWdhL6gwIUDbCsbKzXRhVDi8lC1ikcZ3UEY9lplrDLcV62S0ncBKUSWFD41rA1M3gp7zMkbtqwtOOvwuXiR1h+ZwH1xK6gpuceUPl5Q730reOYDguLlIFVnwe/r4Auyc3fRvM6vU3B7UHnJKiqqNtFEQpEFgM4tyt24Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 07:06:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:06:39 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/5] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Date: Tue, 01 Jul 2025 15:04:36 +0800
Message-Id: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWIY2gC/x3MTQqAIBBA4avErBtQodSuEi2yxhr6RSOE6O5Jy
 2/x3gORAlOEpngg0M2Rjz1DlgUMc79PhDxmgxKqElpI5C3ZCt264HCtqFEiWW+Uo1paIyB3ZyD
 P6X+23ft+R/cODWMAAAA=
X-Change-ID: 20250701-imx95-blk-ctl-7-1-e9f82be61980
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
 Peng Fan <peng.fan@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Sandor Yu <Sandor.yu@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751353495; l=1619;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=3jnRI+RdGnYNH0X1YD4UYpFLeG3c3y70jpLatPP/zhE=;
 b=zi6lvB70YyOqmu2wajm7fCV86BeKWCSWgPVpFnyzas5Q/TqTPx3Xjfy7cPSZVcBxHX+O40iKQ
 AhS4zJBGA3CBeaGyt13KQJBNCZQqKBbcQpWnRy497zTS4s9cjYDlvYt
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9fdf89-ad08-46a8-e727-08ddb86dd313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDFWTkc5QlNDSElsZ21zOWxWc04xNmRhQjBSSVIyOHZVVzVGVGFsRG1tV05H?=
 =?utf-8?B?aVk1c2xZbVYrYkdMcFN1ZVRqU0NzTGhHRWtQZ2dsaGlyWVlyQUN6Z01ZRDFa?=
 =?utf-8?B?bHlRSStOaEJ4R21rMGYxeDJIQkI1QjJ5cFVJWUFDZlRGV2NObFhmSC9MUGJ2?=
 =?utf-8?B?L0lZc3QrQTF0K0J6dS9XQmVTcUY2V3VhMDIwQzRPUDJQSVRhSXFhRWF6RURI?=
 =?utf-8?B?aWlhZk5tRzZHZk55d2JIQ3JpMyswTHZBL3VDK2Q2YXlUcUZvV083c3BoNzZk?=
 =?utf-8?B?SkN6a2lyZnd3dGtmSWg3YVo2b0FvY0dGSGV5QzBhVzB4VldVMXJIdzl4dEdy?=
 =?utf-8?B?LzhpOGxPZEtEM3NSQXcwSkxmTHBCYVc0Zm5zWWNRYXNOZld6a2E3MDdYb2Nn?=
 =?utf-8?B?UWdWTGdZQ2RobENqZU85SGd3RnFQREhwa0w1cHhGamJKTmpaakw5ak1WNGR4?=
 =?utf-8?B?TzFXTmdXOUNhNGliUzc5dFlkV1A2bVRVN1VRa0NhMUt2TTIxUGd2eFF2OUlC?=
 =?utf-8?B?SnlDQ2lRN0lwYzRueUdPbjRiM2w2NksrNE0vRG9yY0xTTVB0Y1pjdTVnNS8r?=
 =?utf-8?B?bDdpbyt4S1dTV25XQk9HSytIcmFacmphS2xJSG50d0txdC9LbytHSVlwNFJj?=
 =?utf-8?B?ZXdBRUdoOTRucEJuZHVFUFFrcU5IMU5zMFk2NUxld3hSaU45ZjJDMlkzT3FV?=
 =?utf-8?B?VDQyVUlmMnRYcmdVYU9MRjRoOCtrYmZvb1hxUWdJa1cyVTZTUGZhWlNNT1pI?=
 =?utf-8?B?ZFhzM0tJVEN5MzM2OHVlVnczNlJaTjJaSXpucmNQN2dpWFBDaWQ0bE1EV2RJ?=
 =?utf-8?B?NWRFNXZMMHl5RUd6OHZPb3c1YmFxR2c1QlY2eVFQTFFsVWNDWlJaelpRajJy?=
 =?utf-8?B?enZKbHlxR3loZERjVmt4azBzV05aZkRlYS9pckIrbG9hT1BIWEFuN2Y4anBp?=
 =?utf-8?B?bnZ6aWUwdERLb2pxOTFaeDYxWE1EbTRvZjJvM0tnRjB2ZVdIWVhhNDlTRFlK?=
 =?utf-8?B?V1BGb1h0NFZITVVOT0NSOVI4UVdYc3F1cHh6LzloQlQ0VE1seEhxdGtqSVVx?=
 =?utf-8?B?dm1Fd0FlYUs5MHYrRGR1VXdjVmk1c1V1SEFYOU15VXhWdmxhUWZwN21HVjU0?=
 =?utf-8?B?cXhQWDUrS2pHV2FDazJnM0pxUThSNTJQZEk2TUNaSnl6OXBsZll5c1gwTGlx?=
 =?utf-8?B?Skg3VjdBVFRKSm9WOVVPa3NHR1dnQUhmaEF6RWxZQTVlYTZiNk1DTDRvaUlY?=
 =?utf-8?B?WERsL0Y2ek5kcmo5MlRBTUZ3QjJVM0s4d0JPMXZFMFF6REFzTUFETUlwdGU2?=
 =?utf-8?B?RGlBNi81L0VZeUlHem5IUWY1WlVhR1E1QklEc1dvbk4zSXp1YUVkNEtpNHRU?=
 =?utf-8?B?RkhuRmNsN1UxLyszK1NHdS9tVDEyQWtFM1ZLcHlxWXczT0ttNGZGcy9oa1I2?=
 =?utf-8?B?enpuTFFLL0hyUG9MbVhONGgwQVBGVG5QK2wyS1VNTnNzNEhSUXNCRUVFTTVX?=
 =?utf-8?B?S2VlQ29kTUlNTDR5QW96dXh0SzUxMWVIOFpPTzZrN0FqUzZENnF0elBnRFJH?=
 =?utf-8?B?WXNRN1N5QXRFUEQvSHlwLytid21tN1UwcHZPOUpRbGlzODhGeFhtdTVacTA1?=
 =?utf-8?B?QURxYmcyNkhMcHlpNGV1M0c4SExJakpsQ2N2N1cxellva3hxY1UzeURtaVJS?=
 =?utf-8?B?TWkxZU91TFc5MmovdGljVVJSMEdWcjJFeE1qaVExQXV1VjlwaVNMT1J6eUVK?=
 =?utf-8?B?enduTzlhbFdxUFN6REVTazJiZko3a2Y4cDdSTFNtZkp5MFNvRjRRTEc4OTJS?=
 =?utf-8?B?NnR2d1o2MmRFNUd4cnNUVXFucnhGQWNyTTdyaUdlMFNiYUNCWEY4eGUxQllB?=
 =?utf-8?B?T1JiSDVtRXIxRWIyTitOMUw4Z3BuOEpXdUNGZlhyYWh6WDlPVG9wYmpmRGJO?=
 =?utf-8?B?eHZ2VUU3ZC95cSt6WnFBcnRoQ2lFOFJtYVNsVU94YmFpcHgrb3F1WjNEQ2hY?=
 =?utf-8?Q?eEvo7dl7PMqxXDHQ65oXQK4Gw5/61Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG90Q2p5emRQVExpbU5ZalAyNXB5eXVyVEdTc2QyNmM1KzcwazM3aFRTSEtq?=
 =?utf-8?B?VmdXWENwNzEvM1U1YjZjVHMwbWZUanZLZjY3ZlNMM045Q0VoT25zTEd5cms4?=
 =?utf-8?B?bWwydlBObHlyVjQxYXlhWm5PcWFTc05QTDBvYUd0Wm1WTmp6UVZISEtkMHdC?=
 =?utf-8?B?K0JtZ3I2KzZoTGIrTHorZVRkc1JoWWZNNDNmTTVEUU52eTVmamYzSWZPRjZ3?=
 =?utf-8?B?UUliMVJydUVYL2I0bjlRd2hudzQ4bTRuVUpMc3NIMmxPS2RoUmRoTmwwYjMw?=
 =?utf-8?B?M2JUS2d1aTFUVmZ2azZZdVpxRHBCQ1Y1SG5TaU5tZjJsdmxFaDFUZWtFQ3Mz?=
 =?utf-8?B?cVIwelhQUWROMDl3K1FVSmVXdWZlZ0p4cXB6MFFxK3NDOUhpOS9LZ3pGVXdy?=
 =?utf-8?B?NkQyTFhreXhlWDBzd3lXcStOYXU2Sm1uMDNPS2gzMTBMbC9IOHp2L01LTEFR?=
 =?utf-8?B?ejVISDVqcG5ZaVVEa2ZzT1hVenlORTlYRVFIVDdRVDVOdTNHdi8wMjFoUlJ0?=
 =?utf-8?B?VjlZWXV6bE94SFZGa0VoOURLNUtUMzhRUHBVcHRKZEs3STJvc3U4YnhST2Vx?=
 =?utf-8?B?VHlwOVB5b080WVU5TFB4bnlPekZJZy93eE0xNFNJSVNkUGFWU1JGVTZhNnhC?=
 =?utf-8?B?SG05VHZpM0JsZmNtUisrVzNSc1lkRGFZcmoraExSODhia0w0Nk9WZmhvdERy?=
 =?utf-8?B?UmVCRFphM3I0TXBZZ3FncGJvYVIyV2RZRC9Ubm04ZTVkbVhhNDc4VUNxYi81?=
 =?utf-8?B?UklzSWJNWCtyc3pKT2U5SVZtQU9Sa2RDWjltN09sYk02ZDFUcUp6T0RyMytJ?=
 =?utf-8?B?U0FWTUppOUdkWjUwdzF3clYrSDNydmFkUThVdW1KM1JIN1dQQVgzZmlaQjcz?=
 =?utf-8?B?RWlSaHMyYTV5bmVVMmdNSXc4YkNUVlVQUE1mUjlyZ0xTaFJya1phM0hxSFZQ?=
 =?utf-8?B?VGM4NVc1SjBRSzZoaEtrUk9ENUhCUVR0cXBLWHlqZE9BY2pYekVGRjZjSVho?=
 =?utf-8?B?YzNVZ3hDa2F5Nnc3U0w2enJ3RTJrdkl0b3MwYXBzYjhoUWs4VmFkRUF2K2VI?=
 =?utf-8?B?dHZON0k5dngwSEpsVTVDdW51WWR3VzdaallVMkhQNVFtdkVlajY5VnQvSHV5?=
 =?utf-8?B?dkQ1MU5vQ0hpN1VneEVTTEFYYkZmY1ZoN3Nwb2tjSUplY3cyVlo4T1dweVlR?=
 =?utf-8?B?Q0lQMUN6cElpdnhvSGNqamk0WEh5eU1VbUFqcmkyL1o0WFJXUlN3R0VXOVRa?=
 =?utf-8?B?UHoxRGloV2ZtL1lKZ2FsVFNLbHhrN3NiRXNpVnMxM3JRbFUyU0lDcFFlTjNh?=
 =?utf-8?B?YTIxcGtJbG42aUFxV055Q1poUU9zSTRjcXpDQW8zSnRlYW95d21yMnNwKzhp?=
 =?utf-8?B?Z0U0VnBXZFFWNEVVQ3VWd2lRazc1dXc5Y0tyWXQ5NFV6ZnIvK0NSUGtWOGlw?=
 =?utf-8?B?UVRWNmJhVmRTbnlEKzM4ZGVUZHZPcjRSdVdLSHlVVlRnbTgvUER4U3BwVlJp?=
 =?utf-8?B?dGwxY2xRYTBwUmRMUUNZUFhlRW53NHNaeFFNNFk1b2hMQ1VtWkNIc0w1N2Ju?=
 =?utf-8?B?eGdGR2czOG10RzkwS0dJTEwvMkwxQ01FbGhmYzdtcGRKakRrcVZITEV3ME5J?=
 =?utf-8?B?L2lrSU9TK2RjNTlqWHRpeVFWbG5hbmlZZTd4SnlId085dzQ1ZWNIYXN0QVhJ?=
 =?utf-8?B?cEJmdzMwY2h2ek1WTWcrSldCSklGbUZodmQxcXNWcWUyM3NHVlhzV2FEQlpi?=
 =?utf-8?B?STNWbXNPbWMxV28wQVlOVDZRTlFUWXBrb2ZOT291NGN5ZzdESzlaWmtRSHZi?=
 =?utf-8?B?YXRYSTl5RUo0VWhFalY3eEEwcmdOMkpjSk43dkt2NFU5TkhsMGpvbmM1ZUV4?=
 =?utf-8?B?ZkU3K2lTNDdlNFV3S2VMekNFWUVhRE8xTEJRdVJoeHlObUYwWXN1V2tRRTl1?=
 =?utf-8?B?b0J4cGdvd0E5ZmlPNTdnaFBSVE1rMWZRbGUwam9YaGQreEhBUzNIQVJZR2NL?=
 =?utf-8?B?UGFBOTNUdzRoQVBJZ283WEN2WWFvb3kxOHo0ZUpJUW1zMWI0NEFybnhjOHM2?=
 =?utf-8?B?RVUxZm00NmIvS1hhRWlhZWxYajE5Mk5IS0xJZGNQampWVDdzbjlhWE5xUnk0?=
 =?utf-8?Q?IHN2lzsF/lpJsMqgNzmXeD/al?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9fdf89-ad08-46a8-e727-08ddb86dd313
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:06:39.0085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7AaCxBB1KZ8wbL8q8id9lf1vhYuFk43qZt7Cn0XPjFCrQI2f5vkvc+IPlrnWxcgzryM4joGrqBS415Bj4pn6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154

Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
clock gate for LVDS and DISPLAY Controller. So following same approach
to add the support, as what have been done for i.MX95.

Patch 1 is to add the binding doc.
Patch 2 and 3 are fixes when supporting i.MX94, but the issues are
also exposed to i.MX95 even not triggered. No need to rush the
two patches for 6.16.
Patch 4 and 5 is to add the clk driver. Patch 4 is almost picked from
NXP downstream with a minor update. Patch 5 is modified from NXP
downstream with a few minor patches merged and updated.
Patch 6 is the dts part to give reviewer a whole view on how it is used.

Thanks for Frank Li helping do NXP internal review for the patchset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Laurentiu Palcu (1):
      clk: imx95-blk-ctl: Fix synchronous abort

Peng Fan (3):
      dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes

Sandor Yu (1):
      clk: imx95-blk-ctl: Rename lvds and displaymix csr blk

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  2 +
 arch/arm64/boot/dts/freescale/imx943.dtsi          | 34 ++++++++
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 93 +++++++++++++++++-----
 include/dt-bindings/clock/nxp,imx94-clock.h        | 13 +++
 4 files changed, 120 insertions(+), 22 deletions(-)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250701-imx95-blk-ctl-7-1-e9f82be61980

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

