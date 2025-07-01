Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25825F96B;
	Tue,  1 Jul 2025 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353624; cv=fail; b=J6ifPvUSaHOucQLprBiikFCRBQbFtc1gR7Y9f5Z+gBhyOrWEyLLGoAf1xiEoIckf7BLm63osMDb3jHYY0Ot4+85D6leSIxCYovvWsAvOChX3uuGWGpE+hQuDHIs0fDbqdvEwYFxik9c5no1/phtWYKo6CYtxTDya3xAM2jKUy0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353624; c=relaxed/simple;
	bh=LE/8uLUbCgHsiAEwEfWoDdCUrWD9voT+WMSzTcOavZ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hqxvEPzucXFpdLaecAseNjTznVtI1AX3WgefJMZwReDNiJVLiT56IUaAIuNSwcv7OzP/J+DK7+o8OQezXw4ZdtYSJaGmimKmNwLhoEehD8tNTNwqw9BtAeHX7ncO0lzdL40v64OxxH9FY/vGNUPnmsLOVSq/tHKKzSURI4EStVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GmLL62vc; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GmLL62vc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWiIIsDPSPhLsJHtnfCXbUH9eOwy4xevr/q7j1KpH17UUMLxjrK/8fW2ThGkD5as3CePaGIXCZ5XGrMi82qbookXLBlYZE5yYAW0insXv6I74nefcQCwufvf4U0s3FmJmjfAoaX/nSZiBTI9H3fF/BR53lE9EMKJEuaENtaCILrz9OmR86fiqxjG5aqvGXCiE3EXAguaB7eyMPy3mGqF4ccRiwMl+VMDm11aBeuHAJ3U1uTwFMnv8vzmei/PDmlM2jkoXwGvMZnrCYOVk+A/uCCcgr5/AFSoAbflcb/PoV5PWsyB4pg/YSu8I6vSlsUvW9GqT90FkB+szNYqBB9Q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxF3NyG1FOMtgJUfrY0lB3u6ZpHqOkyabScTXtsY8sU=;
 b=eWKvGpnk6hEInkZGbi6UwPwux9FdnW1BsuT8dMaCMCPqcz7LOuQ9WNZV+fvU7Gq912Su0P3NDHJUzklu8IOjlxps9WCgGHlB7V1YD7QvC5Jtr1pHM1Skg6ANAWmYoUhLFtfmOiGpRyspufADuxhLAFmphhTiG9gHFWfwKNncxVS6wDOfHVoQznjDM/0qnn/MKvxi+syAC5CyA12HAQk1HTxN8HpPqJ858NUA0gsFkqzXLBc6RgbIbWirpkswjmqQsspjpSLCur7cMpaQhpm59egcJZU4+Dhwc/HPmapAXH/+yxq+WFZ/tKPBXUJLuQyIFliabP75iGtHmwDhIGBYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxF3NyG1FOMtgJUfrY0lB3u6ZpHqOkyabScTXtsY8sU=;
 b=GmLL62vcdkjbueA2llC3nmK1mzaa/2nz0jvGM1NVkFcEdiECPZW1rfRK+J1QVIBQHyGAVqlkhFbgsn7oSGhStqlw8UyUr4p81E0R555MhSgBQqP/wSgJjE4++nH2kv2rCDETdULAwGBDJLHPdPiKTntgqWo97sA2MN/GqHpYC2heTzzBP3wkL1POVh/TALnj6XZ2b0ylBMrNFKdHXve3re/MeJ1eOeeivL4wWetQm2ToNxZDRu+qHEqoNCX8oL+bK9t4L87xTaKc7cQWy+/WPve/uwo/40iwZDBqw/CoeIk8lIAMads22zv6VCoYM6RHlcVGvUj4oGQ+BDAnn0cTzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 07:06:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:06:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 01 Jul 2025 15:04:39 +0800
Subject: [PATCH 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix csr blk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-imx95-blk-ctl-7-1-v1-3-00db23bd8876@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751353495; l=3865;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LlEZ8/XfDA6g9UWhESmmzzxI0gf+e36dIyWKbtZffwE=;
 b=4Hzx11WyA+G+iQqGKxaIjhNE/GjWTN5cvXiMY3ZsNebn2CkmxE/8XZwBinzKtWpS9m29M1VDN
 AnzR//mopyBBiRW44jFkJV6RXmPWUU3zH4XNB2prh2dq1VaB+j7oMl/
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
X-MS-Office365-Filtering-Correlation-Id: 18b8d9ed-572b-404a-a6e4-08ddb86ddf3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU1jdUpBcDZzZjNhTTlRaU9Bd3hNeFlZVlJXVHZaMHlsV2tpbk40emtiQ3Iv?=
 =?utf-8?B?ZmRycDVBc010b21wOUM1Vm1JU3BLRnNpclFDTVlPNTEwREMvbjN5bkU1cVJQ?=
 =?utf-8?B?TXl4Y0ZwR3RnY00xUmora1lYSWZmK1lFTGNHR3NhUEhRTXpBZm14MEdxRXFF?=
 =?utf-8?B?N2VQdlkvRHRtVVBCUVpPbm84UFgxNHAxV0VSVVhxbDBtdzRUNXFXTDlWaVlC?=
 =?utf-8?B?T3lvc2RJTDhMbXMvRStTS0JTNUk2UVJzV2o0MktOOFB2aW1qSXQvT2x6Qjg1?=
 =?utf-8?B?d0RDY2lMbExHSDg2TC92bzBxMnRXbWN4U2c1bUVzTi9YNFRvVEdFV3dSR3dl?=
 =?utf-8?B?RG1BZmlaclhwRDRSVUttcW10Q1UvYlpZUjVmMWxkUk92SVUzWFNmdGJ0QmhW?=
 =?utf-8?B?ejdva21YY3J0NEN4c1ZKTTAyRTExcndJdHFZeTgxWUhrYzhWWU5ma1QvNDg5?=
 =?utf-8?B?Y3Q2WndoYTFiK2dHb3JDcStpZTlCRk82NGZMc3dPa0JoSlozcVBUdnE0amY2?=
 =?utf-8?B?RXJhdnBmSWhzVXkyZEdjUDJONW53Mm92V0hQMHZOMS9xTEV4OHBUTDNGYjA0?=
 =?utf-8?B?OFVyT2JUblF1eFhjQXdDQ25FQ09tSzBlb3Q4bnZtYjB2OU03NWFUQ3FxdHVj?=
 =?utf-8?B?cVgxUXl3bWY0bEk1anZXRnB2TGphSUk2Q0M5UWx2VnBPak9oVmdCTEJvT09U?=
 =?utf-8?B?bzlRWkRnL1NJSGUxMk1MU1RoN2VXemR5RHNzbzMyWG1McGFhbm1TeGNFUU94?=
 =?utf-8?B?WU91SEIvQ2lwN3ozejdhKzd1RlFFbElZWGROTTBEelFnRjVERlFOSWZLY2tV?=
 =?utf-8?B?SzdqMEx5K1NCZ3kvZHhHbWV4R3kwcXNoWW43bkxLOEhvRUg5U29qL3hlTzcw?=
 =?utf-8?B?Vk1mRUszK2dTWmV2RmY1Y1VXQm4xQVZHMmE4Q21hU2w1TDYxcDg3azRtcVdw?=
 =?utf-8?B?WVRBL1pLSHZ0elBzRittYkpndDFOczgvbG1RNSt0WG4ybWRNdGNFdWJFTTZ2?=
 =?utf-8?B?VWZQNmptMXl2clVJWmFQcTU2RmQvZ1M2QUdhWFh5TXJUcFBMQ1lpVlZJdDA4?=
 =?utf-8?B?Z1daYlo2MFdLL01FbzNRQVRtS3JMWmQ5RFdVSEgzSStCMEV4Ti9pM2tDTVla?=
 =?utf-8?B?dVlRY0lKeWcxMWpQeE5KU3dEWFFHYW1VRlAyUFVFZG9ZMmsrRlEvbm1YaEtt?=
 =?utf-8?B?VDREdFgyekpycTUxMGFlOXRYWmF4WGsxWHFBVGpBSzlaQzV6SnRHaUt4RkpG?=
 =?utf-8?B?OENUWURQRDFGcjhBV2xCZmtRaVZvZmxhc0xRSE5SRzk4cDJIYllLZmsyTnhk?=
 =?utf-8?B?RGdsdVRSNEpERDhTSEVScHRpOG5FWURyVTVpaDU2RkR5THRXeTBOZXJVWSt0?=
 =?utf-8?B?c2pNODVuR2VJOTdGc0JRejFPWlVNYnNuYlBVYW0vaHkxQmhINE5wLzVVcGlL?=
 =?utf-8?B?NXlNS0g4c0VjbEVDVlE1emcyNkFXRFhNL2ZUL3VUcDg3MUNPT0dFMW16Vmxy?=
 =?utf-8?B?b2tOM3RXZ0ZMa1RIRWIzblBpaEtNRkFHN0xFZlZ0YlhEQWpGclY4UzU4d2FP?=
 =?utf-8?B?cG9Fcmx6cVFyQlBtbnAvUWdXTXNtVkVNOGNvY29qTmxKekw4ZFdIZ0tIbDdu?=
 =?utf-8?B?dzhoN1RUdGJSOXFFTzFra3VHeUpQMkl4ZUNqai9HNlI0RjNuaTh5c2dXYUJM?=
 =?utf-8?B?ekNIdUxXSEkrTHlOOTVHMXBOcVFGeTN5YWZNdk5XOTM3UjZCL3NJbVIzbU45?=
 =?utf-8?B?dmxnVm1ySUJwdEJ2LzExSjF4eGVEMTJUZTRLWFBoUkM2N0U4TmZyVVpWalFU?=
 =?utf-8?B?b0lqWXpvY1BHOWJocUxMZzBFMFp5ZHlWM05qRzJIb0dRY1VJWWZjSVlPRzVx?=
 =?utf-8?B?RUNQYXdIcXZlV0VYd25YRW85Vkt0Yy9PRjRFZGFTcjlxcFJNNittZXgyZTBq?=
 =?utf-8?B?ejFFdlBOUzRseFB4WmM5T0FaYXFkSnRPd0hsSDNQVUZtalJ2YlZoMkFUVUd2?=
 =?utf-8?Q?tcOJGP+qWiXful7sLhs3Jj4YdjVULc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXNKSTh6SUExV2hLV1lNTVRGTmYxYlJFbkk5bmdmc3hqbXFoMnl4RlMrQk53?=
 =?utf-8?B?ZDFKNGhidGE4cXEya1JCSy9EQ3Z5a0ZVZEVBWmdjNENsbE9ZTGJPL2lSbTFu?=
 =?utf-8?B?MlFHOGMrWk5STHJITGVtQ3dxUnk2MGExeXd5blNxd2ZWYlZMYWVVemhXeVlP?=
 =?utf-8?B?dFB5a1hSeFdWSzMwMzNkMFZBZjRLWHZuM3ptajRGSURtanUrWjJ4eXRIZkky?=
 =?utf-8?B?Zm1YWlA5cEVGaVYwS04reExiVWxQSXFOSS95YXY1THE3S1JhVG1PQjBONGR2?=
 =?utf-8?B?MlowRys2SGJMVHBJa3NDaDgzeTE2aDJMU0dLTjNtZGYrc1hqT0JHZEN3MmpO?=
 =?utf-8?B?dTVKZ2JjUmp5RG5qR2g5T2pBMVZiTWZJeEw4eEI5aTZCT1dQeThSMlBmQzdm?=
 =?utf-8?B?WWRpV0xyVlNXc2V4VG04MHVEV2dmSG5IUnUwV3E0QTF2VHJhUngwVTRPQUZn?=
 =?utf-8?B?ZXVtNGIxZW9Jd2NHcE1KdDZ2SVRzMzVBT3lhQmtSeWcwWFJDSkVYZU1Hd1E5?=
 =?utf-8?B?aTd6UWIzS0lIbmJEaGU2OGNTYkZvcjJKL1hmNDkzSTB0eWtGZ0trZGZudHlS?=
 =?utf-8?B?OTRFZUxVdXhOWGxuNGJRVE8vdGlRZUZoLzJTeWNSZHBtb2FtQU9INlZxYjZN?=
 =?utf-8?B?WEZRMVh2dUpjeTNjMjRwdXh6emhUN29USEloRkljMmg0OE41RmZDb3FXM1JP?=
 =?utf-8?B?aC9nSVhUcG5ITHpSdWNLcTRnMjJNY21LNVV0SWZUU3NLTlQ2akVINzkrd2l0?=
 =?utf-8?B?anhPdmNURFJYR09CMGlLNlBKOEhxY3NSU09lY25aL01rYWpLNzBqdTRxaEZ4?=
 =?utf-8?B?WjZkOUh0dmlYeWZ0aGt2RUZPbEF1TXMzeERGcmUzajIrVDZVd0dBS2pCOGM0?=
 =?utf-8?B?ejlvL0cydzI4M0czcEJWTlYwbk5UQURJRmRGNEd2Nk5mUlZnOEJHcW0wVS8v?=
 =?utf-8?B?c0ZXQ0VOSU5mVVNtOWUzaTh2K0UvZzQ5MGNvYWtKcWxhY1N1eUR0dkY3bmJX?=
 =?utf-8?B?akwvYUU5SENWdkpGbHVlNjZCVERSdlhTK3ZSUjF3THRhNVdibW8rcEgxM2Ru?=
 =?utf-8?B?Q0dGOGxDOXVSRGR3UG8yUEprSmw0OWg2OGh5YXgrQkQyNjdmSW44aTZVcEsr?=
 =?utf-8?B?UStFeVBwQzBJUGdTTDV3bGxyWXRudzhJL1FkdGd5Vy9mOUZ1NjVPUnBUa0Zv?=
 =?utf-8?B?MGExZ0haMzBrZzNwNFVnZ1ZFL1N5YTJydk0ydXlFMGxVK2JHb3hXZy8yRUls?=
 =?utf-8?B?dWZ5SmpHZDRKRzFIait5WjdpenFyQi9IbTY5cDAxZnVqeXZNNXhzMlZzT0th?=
 =?utf-8?B?RDlTSHR3bEFPZ1NyUFJqQWhIS281UjJwVDRpODdmNUNKMnlNR2hVWDlUU2dE?=
 =?utf-8?B?bmxLdkFYN1FIaWdRTHRCQ1ZHZFhLQ1VXRUpISU9HeFBWa1l6R0NjWUxwSFRH?=
 =?utf-8?B?eVQ5SmZqbTFHVHFSVkpVYmVzTXpKSEVLTDZEN3U2N1lyMzc0VVZ5WXhVR3U4?=
 =?utf-8?B?eFdDTTBLeVdrT1ZVNStVMHJMUWVGQ040cTBaaTA4c3ZOb2M2TXdQM25DY3lT?=
 =?utf-8?B?MlBkUk9TMVh4blZ0UDlSc3ZsYUx4LzNpTFdWUGowZ1BrdjlQMXluc1pyV0pD?=
 =?utf-8?B?S2NuZGVyU1haclVMUGFWaFRrWnlWc2FPSG5JNnlUNXhUTWt2TjFlRlN3WDZl?=
 =?utf-8?B?WktMZXZCL2lybjNEVGdCSGtleVExMzNMZFZCTnFPZ3JFa1ovNzkrbUM1S3NL?=
 =?utf-8?B?UVVJVUtUNkovZ1ltZkVTc25aSW5ZZDBTdDF1Tk05RUJvTEdvZFdPc243MUVO?=
 =?utf-8?B?VjNNNjdoUVJ6R2liSERTWDhSNFJsditueWRsc3N2UDh0Q0psT095d0dmNEN3?=
 =?utf-8?B?N0t1MGdWNExOUjllVmgxNUkya3VaUEhHYkFSQVNOckJoU1UvY1NWQVpMY1U5?=
 =?utf-8?B?TmVVd2daYXJ6MGVVN2Jyc0NCQTA3cWFxR2FaWjBDeVlQemF0VUFQZ1VQZVQ4?=
 =?utf-8?B?eW1FdVRobDJXMGlhQ283dGQyL1ZoL3Zldjd4T1l3RUMrSnI0TGg5MTZ4NE9Q?=
 =?utf-8?B?bTJGeXNoZGk0SHN0LzlEZG5NVk9RWHF1a3B3bVo5QVg5eVkxQVZtMk9DK2FE?=
 =?utf-8?Q?/spGR0Fb4xYm0tLCgug06BAmZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b8d9ed-572b-404a-a6e4-08ddb86ddf3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:06:59.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDl7DwC5dEygVaFTTDPk0tpjjKXex8sJHiJ+B0GoLiUhXD/m8fybL6ZI+KkHW4SPiwaaf7CtqHgm2Bp3EnpROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154

From: Sandor Yu <Sandor.yu@nxp.com>

Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
support for i.MX943.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 86bdcd21753102b7d160288e7b69bf73da5a5706..828ee0a81ff62c6e4f61eef350b9073f19f5351f 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -156,7 +156,7 @@ static const struct imx95_blk_ctl_dev_data camblk_dev_data = {
 	.clk_reg_offset = 0,
 };
 
-static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
+static const struct imx95_blk_ctl_clk_dev_data imx95_lvds_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_LVDS_PHY_DIV] = {
 		.name = "ldb_phy_div",
 		.parent_names = (const char *[]){ "ldbpll", },
@@ -213,21 +213,21 @@ static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
 	},
 };
 
-static const struct imx95_blk_ctl_dev_data lvds_csr_dev_data = {
-	.num_clks = ARRAY_SIZE(lvds_clk_dev_data),
-	.clk_dev_data = lvds_clk_dev_data,
+static const struct imx95_blk_ctl_dev_data imx95_lvds_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx95_lvds_clk_dev_data),
+	.clk_dev_data = imx95_lvds_clk_dev_data,
 	.clk_reg_offset = 0,
 };
 
-static const char * const disp_engine_parents[] = {
+static const char * const imx95_disp_engine_parents[] = {
 	"videopll1", "dsi_pll", "ldb_pll_div7"
 };
 
-static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
+static const struct imx95_blk_ctl_clk_dev_data imx95_dispmix_csr_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
 		.name = "disp_engine0_sel",
-		.parent_names = disp_engine_parents,
-		.num_parents = ARRAY_SIZE(disp_engine_parents),
+		.parent_names = imx95_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx95_disp_engine_parents),
 		.reg = 0,
 		.bit_idx = 0,
 		.bit_width = 2,
@@ -236,8 +236,8 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	},
 	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
 		.name = "disp_engine1_sel",
-		.parent_names = disp_engine_parents,
-		.num_parents = ARRAY_SIZE(disp_engine_parents),
+		.parent_names = imx95_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx95_disp_engine_parents),
 		.reg = 0,
 		.bit_idx = 2,
 		.bit_width = 2,
@@ -246,9 +246,9 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	}
 };
 
-static const struct imx95_blk_ctl_dev_data dispmix_csr_dev_data = {
-	.num_clks = ARRAY_SIZE(dispmix_csr_clk_dev_data),
-	.clk_dev_data = dispmix_csr_clk_dev_data,
+static const struct imx95_blk_ctl_dev_data imx95_dispmix_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx95_dispmix_csr_clk_dev_data),
+	.clk_dev_data = imx95_dispmix_csr_clk_dev_data,
 	.clk_reg_offset = 0,
 };
 
@@ -469,8 +469,8 @@ static const struct dev_pm_ops imx95_bc_pm_ops = {
 static const struct of_device_id imx95_bc_of_match[] = {
 	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
 	{ .compatible = "nxp,imx95-display-master-csr", },
-	{ .compatible = "nxp,imx95-lvds-csr", .data = &lvds_csr_dev_data },
-	{ .compatible = "nxp,imx95-display-csr", .data = &dispmix_csr_dev_data },
+	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
+	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },
 	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
 	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
 	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},

-- 
2.37.1

