Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133991A83F7;
	Mon,  7 Jul 2025 02:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855212; cv=fail; b=sWAhDCaSgzdB7JvTYNd56goHeMgZwbOgzfc2lGZM17FX9vsKZcrkMf7qSO0In2CEwOIDhrU8UpeNe4fKjrIKCO5nC5288Y0TEQoN/tmknF3nJbfPKxcLgJG8BNQ7Uxg4pHE63XWAH9nxM+iyeBmMx23KoM/eH0qaH5itGLKRij4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855212; c=relaxed/simple;
	bh=XGmWcecnkzjdgm0F6DOTa4SKkoS2MpuN/S12vVEKFlE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FYUkEXFgroB7a0Jp39js8GBx3MJDdXsFqXWA3xXKTlsm3BQ9kVqDy8lV1hJIrSVrZV0ap1kBOpkMhyA26x+cbTMr/3qml22/NVmKG0vOurrjbDfebEG5zd6b45GTKRpjAmAkB/XvyMdqqrdZ+gIFqUJVDANx2mNlmFngZsAxtwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P8hX6pAI; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P8hX6pAI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGFY8VMP/Rw59DIr3B4b34bdC+rRyi99vZOTtQBUOyeUWmFI0jnruxaKZK1h6lGa4XOzv25HFct2UVt9HQMm1dNuiM2JgB9o+WJQkjeQpolyFjLOkpEWv6g50mdlA/1mC6xPQyXxNCxR8xedrNND7HZ4u6DR9KD5fSdFF6AYSRn9sfcOPFmmzFfqYF9DQhv99dFICgg8tR9hfM+iNlA98M7x0OmvW6h1bJnUgZQaNOGSve8qTiDEe04MAojLP/guAjuuaZS0Xv3PxRs2q+h8ivDCB65zW9G6+vsVlqInhORV6fphUxiK/K1Rbl1LATOB0+q7JZx2xy1i7t3OC1GrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFg7kF0CQqbaK2egqhsQ6hvWOORE1uLw1UEjqA0OvMk=;
 b=W+1VCZdr1XATIBKY2JtQt5SIYQwrEIy3dv6NVZIOQBM7zW7iy5xZ0PYEqGh8EiZxXN5iHQMPnC65Vg19X1KSjSFFA0p8l9oFpiqr4fenEYi942hYEreMCcE2DogCfFAMHP4zhUzgy3BO3Og3V/TkbDmTZgVnw4vsJo5/Rz0QnWN4Mbl/pueI1KklZvcigrHHRR+3PfPb3cNZ5XW5D6M5eH5AGNrEvZkirDmc7nzETyQOcnjVKl8Ds0b02g6VBvTkN8Sh/o5/efFNZVUYY8caR4xgxNlDyL3NrKcPqbF1UHlXkY9rITxkyfNEJYKh8qul7uXl3A8Gu/0+MEVdbm4DOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFg7kF0CQqbaK2egqhsQ6hvWOORE1uLw1UEjqA0OvMk=;
 b=P8hX6pAIkPCdX2N08EhCbHsZAn3kHxOpYVnhR8Oy49t8+Vd1YbWBztvhsNSCOwP8XSIA50DohAxggKJdqckmdWE7P/ayyTNRakk8JoF1WreKGM9V1hv0g7H1oS+4CpTf92yV2ngD2cgfBXBirb6VlHqWBmZBwtjt5Pc7bGDiAV2GttHBEMlJApv1I43v5dguz2GFhHqSN/tGwagcaJh3sbD7GhNeQxzAup96kHEONM71R8c4TnWm+2fWuCgNasawR8YzovrbgAlldg3lBTEsZuMLa7apT9jiaHy7sfstz04gBTk1ZtAl85zOizpsNo6e90r56+xEIBFbCwPb0j9xSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:26:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:26:47 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 07 Jul 2025 10:24:38 +0800
Subject: [PATCH v3 2/6] clk: imx95-blk-ctl: Fix synchronous abort
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-2-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=2533;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=U8W0h6DKF7VsGxnUEdSIDSJmZZvZtqnPgGSKMXpYhxI=;
 b=A8pfwTV6IiHLY0VKU7Z9tObVgk2Q94SKCGhth7Iz2nXINIiwGJ3I10Vb4M+i0oBEoyL0cBpX6
 ASYzjaPeQnoAP/SigKAh+gxCjnPL+2nU6BnoLmujFcmGBwH4Iueu++h
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: cb11d9ff-1bbf-4295-9da2-08ddbcfdb8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3BLSTlKMExsR3pueFEzRXNzTTBZZkxzdG9kNkJxSHNPTzhvQ3RBUnQ4MFB4?=
 =?utf-8?B?SkxORXhLWHhtMkcxckJrNUxOeU45TWdGYUE0Tk5Sa3hPSUJDSW04dmtWTzNW?=
 =?utf-8?B?MzNSMElZUTlDY2YrdDlBVHkyTnpaUHR5VHVLdzFHTTVYaWFtYktrWnMzUFNK?=
 =?utf-8?B?ZzdvNkxHWkNpV0owMWdlQzd3a2RsbGVxdnQyakxMb1ZIaE4ySlFQdjFRZXhU?=
 =?utf-8?B?alJiaGRicUFuZmxyaFRpTWFhbHB2aTJ6SStnREw4MWNHQ2pPL0xNZ05haDJ3?=
 =?utf-8?B?bjZ0RVBaZnVSYmRpRkJGbDdjbjBYS1dSelRERmVSYWQrNWtMcGFaNnNmNGw3?=
 =?utf-8?B?Z0E0ZGozYStZL3J6dmF2T3VuczJJRDdnMlI5a2pLTHVvakVDNUZ0YkpwMys0?=
 =?utf-8?B?QlJhVDV4UHJGRWFHaDQydUVRVjRZSlFDMytYbWdlWHZSdDg1cjVhaFJoTFhy?=
 =?utf-8?B?elhkS08yYjdlTEEwSnFkUFFNcTZRejZld29LZ2RtTU8yUjFHSU1sb2xyM29l?=
 =?utf-8?B?SDljQTIyc0s4dVRLVWRCcG5HMEdIRlIxWDMrN1U3ekxsRTVjYTFjc3FEdkVi?=
 =?utf-8?B?R2hxYjVIM2ttK3B3VHFvL2NMMFhWNFBud3lER01sVEZ2aDJCL3ZveXB1Z0NW?=
 =?utf-8?B?SC9tVHB1TklzMWxOakNaQTgzSC8wZ0xmRlVzcVlTTnRmSlFkZEVWZmpKWHlw?=
 =?utf-8?B?S3dZOUliT3l4eFdZVjh6RFlWWjZzMkRwc2dzNDVPOGdYWFA2UEhUcWJmdXc2?=
 =?utf-8?B?OVRYVzRydk5MZmNERGFSWmdFSGdiYnZtbkxRSE9VTFZ1OTZzMTZSck1ERUc3?=
 =?utf-8?B?NHBXQk1JeUVhV2RNQ2tPWWx1NWs3Qm5CbUpOYlFOdHB2TEV2ZFhnd1kxMVpp?=
 =?utf-8?B?OUJhZkc5eDZENzJWeEVnRlpmcldBa0JjWCtxeldaenhTRzRaSDRGOEdkKzE3?=
 =?utf-8?B?QTU4dHU3M1hvdTBRaDNkTU1DdFZyWXJ2bEd2anF0UE13NXk2QlI0VlRacjFv?=
 =?utf-8?B?THNpbTlEYlJiK2YyVWZpQk95SEQweHc1V3ZaV3BNKzhNWTh5dmlEZDRpRnlR?=
 =?utf-8?B?MDFsMFp6VlVGTEU4cGtRTzRBUXQzU2RjaU5lYlVLcDlZcGtnT1ZkMmVvMk1z?=
 =?utf-8?B?TzZYb0tnY0ZDN29VTzdtZXZDRS9pTGcrQ2FheXRsMkM4eEdVMkNoQU10UFlP?=
 =?utf-8?B?Sk54Q2hkQmJEckQyKzFtbWlBd20xMS9wbFBrd0IwNXMvVmVvV2hLRVoxZkNU?=
 =?utf-8?B?dXp1Zk5CMTV1KytYdkN2QXdHTWdLK05WcGtZWWFzNmFub29sV1lvM0hPbUpM?=
 =?utf-8?B?WnArSFNHRUNhdW41bkNQakRoRzlnNTNTRFNXNWExTDBHbGpuVkt2QldTdDhC?=
 =?utf-8?B?V0UrbGNrVXh3bGFDck9WVmQ2dUhsaHNUUHI3ZGxQVEFILzlhdDdBZjJEN0FC?=
 =?utf-8?B?L3VDSERlT0xMRlhNYUVLalNjUHhkb0EyY2tjdnArUGZYVGhQRkhMTXB6UFZ5?=
 =?utf-8?B?VC9NZy92QWNXRHJ6MTJhaldGMTZMdm5RLzRrQ05YNVVHanJCL2szbjc3Qytk?=
 =?utf-8?B?Zkp5ekFqOU9wTnJzTUo0VUpTYlBva2lyaWdTUDdWeldpZVAzNlVaTzBxcFlF?=
 =?utf-8?B?NVNJYklEaFh4TFYwendyQy8rWWpZV1NSZmN2c1krRVM5L25TYkpLQUNDK1pv?=
 =?utf-8?B?d1dmTDUrZmpVN21sTVBKR2VQQm9CV2p5TW10c2l6NDVpby9wKzY5aStBcXIz?=
 =?utf-8?B?SmNOR2tjbFBESnFWSmlkMkVGeGE4WXlkNHBjdTgwWEI1M01USkNSczdaandM?=
 =?utf-8?B?UXBGSDBsdnR2K3VKUWVVMlVXVGdIQzROLzB1bkRsRXNxS2hNamVPYnU3Q1Ns?=
 =?utf-8?B?SXdBbUxPTlhQK2plR3dHYkQ4OTl5eUczL3RaOCtjaDlVcC9LbUx1NUZyU2xY?=
 =?utf-8?B?aC9tRkJXMDZEZ3k3V2NwMjBZaXhKUDVETmxkWEdncmlvdmNxWjM3dmtvSEJ3?=
 =?utf-8?Q?ydw656wkMkN5l9BoMoj07yCULSlqZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rnl6LzFYSFp0eHNBWmRkbjZyVFl3dkpscmxTR2FvVHBLNVdZTXNCZFRmYXBW?=
 =?utf-8?B?WTdEOVFYOWd5U0RTRXIvVmZ3SXJVNGZSM05ZY3k5L1QxcUZ2a1FRWW5TMlYr?=
 =?utf-8?B?S20vWnJQais4Q2RlTlN2blo4VjI1R3pncVFJSmd6aXprVFZTN2wxUkMyMEJk?=
 =?utf-8?B?ZXhobFJwVHMrazBvNE1rUVdMYjROZEE0ODBkRGhwUTdEM0s4dDE2eHQ5TWUx?=
 =?utf-8?B?NUQ1ZmwvdFRRQWdpMmUzaURiSXZZY1pTYlZCRFpmYVdwNWtiZi9FT05UVkZF?=
 =?utf-8?B?VWZ4YlBXWGd0a0VJUzcrcENXVFBDOENMZmIwWW8wUXByQmFUSnVWMHkwSmdX?=
 =?utf-8?B?dUxHRWx1NmlkSXcrNU1FeVF2dVVKWWMvMjR3cVNBMnFzcmExcnozbnN3MUJI?=
 =?utf-8?B?THlac2dhT2ppY3pZY1JDbmI4YUVjVE4rMTJVYUpPcFYzeUtnVGFNcnlvN016?=
 =?utf-8?B?amx5OUVQNDlPalo0L3VaWkwxZGYvbFA2RmVQVXNYL3Fyby9OTmV0U0wxemZE?=
 =?utf-8?B?S0hxZDFrL1JPeTZOY01jc2JwcW9EemhSanYwVys2MERpMmZNaElGVG9rcnhJ?=
 =?utf-8?B?NVFGSkJEQ2lOT3NLblR0ODlJaWRReXl2SE5obWNOZXB3bUhieityYTE4ZnFr?=
 =?utf-8?B?QmJJblRWS3BYY1VlNEFtSEloV1BoTm1jdlU5U1lpYXQ1bi8rajVjdFVJMDY0?=
 =?utf-8?B?TmlHRmR2NWxycDhURjhlTlljZ05nMUxPQS9jZUc2dVhWOC9INkFhekl4d2Jh?=
 =?utf-8?B?WnVRMGVkUTljZlNoazNxdTRuOHNEVkZ2WUlWN000Mjlsb3BtSmtPQ0tQTjFO?=
 =?utf-8?B?Y3N0RGE2R3IxcXEvVFlQN2VtbnRhYWhtdVVBczg4RXRVRUdpVGFoaTgwSmha?=
 =?utf-8?B?S3M3U1NiWmdIOEFYNlNFc0hNdnN1UGJJNXY4YmhpSU9rQnJlYzZrcG9TVkdx?=
 =?utf-8?B?Q1BWVytXZ1NRd3J6R0hjVjV5N2phTmRxdnExNzVXbVNFcVJvdTUyU1RDdDZo?=
 =?utf-8?B?NllNSmlKdXlwQjB0MElSV0t6VDNvMVhUdUVCeVNKdFBnd0c1WHUwVTFQMkxN?=
 =?utf-8?B?SmhNaTFNNHVFaG51dGcydFByMFZ3TTdoMU40WFdNNDYyTHhsaU9LcUI2aGp3?=
 =?utf-8?B?V0RFV0tJTW90QmtOQ1IrUXV6U1ZFb2lVMmlUZkJ2UldVMUV4amdwWnZjNWlB?=
 =?utf-8?B?UDVaUkhKblRQNHNOM1plUloxU3J6OWQxSDlmYk5wOGpWK1I0NUJRUEptM045?=
 =?utf-8?B?SHhmakdlZUxuZWVpY056QlhRVDlheUsyME9tREFJTVRGQU9jMGh0YzVlaFRE?=
 =?utf-8?B?Y2JCMDV5dnhnUTR2a1hPZk5VN0tzOXEvNUwxV0RlS05vZXVFL2ptemgxUlpF?=
 =?utf-8?B?UlZWSzUrYU9SdWx2ZS8valczb3JrWlI2UGdRNllsVDVkVldabU5NUzJtVThN?=
 =?utf-8?B?Z2hNZDgrZlEraERYSzQxZWMvTko3OFhNbVZzNkgxdmlQVTZSc2dnSXBxOG1x?=
 =?utf-8?B?MncrRC8yWllGMnowOGZpQVNNYnF4c3BhNVA0Vk9Edzl2RUtEK1RaWllST2Zr?=
 =?utf-8?B?UUlUQTVneG1GNDRnQmpMTzZOMndpcFV4bmFuYjUwYkFPSzEveXljMEhockpu?=
 =?utf-8?B?b2d2YXVmY2dOZ1RlRWpzWnNBWlVaYStmVndtVkN3RGhaTTRmeFZnNzRXQUF1?=
 =?utf-8?B?bnlVZkdpMXlORndubGJTQmthVzdPc3FBbnFxWnQyanhacVluY0pMWDJNQ003?=
 =?utf-8?B?bkRtYmRFU1ZObExneWRkNXRJblg1eTE1SXVGYUhSM2VqallBbS9YWDB5eEE3?=
 =?utf-8?B?ODNLY2JJcGxENUFtYjJMYTAyRkJrY2dDeS96QytTRjBCejdRaHZuWnVXaG1K?=
 =?utf-8?B?M2tOSjczL0lRUlM0Uk1PZmd6L3BlNkQ1bzM2Zm5zYmpmVWtjK2JkbmlQSHRz?=
 =?utf-8?B?UER6bm44RWJBWDFZTm5CcEd2dG50TmlFUklDUy93UlhCV3dTR0kzcTRlRDRC?=
 =?utf-8?B?SGZaUmUrU3k3blVzcmo0eG9lVVA3NCtTY283UDNtU0dLK3lkWVZ1d1Jjdndk?=
 =?utf-8?B?M0xKUTEvMjROYURrNndyT0d3NzVYZ0c3RnJIZFRaNzcrWlZtc1ptRkduR1Z6?=
 =?utf-8?Q?nuJ/xvRFKhSe1OexgFRjbN75I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb11d9ff-1bbf-4295-9da2-08ddbcfdb8ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:26:47.2849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC2xnL5pkOKSy7/hz89+fB9Gsp47v9uDRZ/068OSjiEw/PFheGScblacKUeJ+nuVMSqdzOZb+TW/QX4jKUbuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

When enabling runtime PM for clock suppliers that also belong to a power
domain, the following crash is thrown:
error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
Workqueue: events_unbound deferred_probe_work_func
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : clk_mux_get_parent+0x60/0x90
lr : clk_core_reparent_orphans_nolock+0x58/0xd8
  Call trace:
   clk_mux_get_parent+0x60/0x90
   clk_core_reparent_orphans_nolock+0x58/0xd8
   of_clk_add_hw_provider.part.0+0x90/0x100
   of_clk_add_hw_provider+0x1c/0x38
   imx95_bc_probe+0x2e0/0x3f0
   platform_probe+0x70/0xd8

Enabling runtime PM without explicitly resuming the device caused
the power domain cut off after clk_register() is called. As a result,
a crash happens when the clock hardware provider is added and attempts
to access the BLK_CTL register.

Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
and getting rid of the pm_runtime_disable() in the cleanup path.

Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index cc2ee2be18195f0e05e911bcb26e284b1a894244..86bdcd21753102b7d160288e7b69bf73da5a5706 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -342,8 +342,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
 	if (!clk_hw_data)
 		return -ENOMEM;
 
-	if (bc_data->rpm_enabled)
-		pm_runtime_enable(&pdev->dev);
+	if (bc_data->rpm_enabled) {
+		devm_pm_runtime_enable(&pdev->dev);
+		pm_runtime_resume_and_get(&pdev->dev);
+	}
 
 	clk_hw_data->num = bc_data->num_clks;
 	hws = clk_hw_data->hws;
@@ -383,8 +385,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		goto cleanup;
 	}
 
-	if (pm_runtime_enabled(bc->dev))
+	if (pm_runtime_enabled(bc->dev)) {
+		pm_runtime_put_sync(&pdev->dev);
 		clk_disable_unprepare(bc->clk_apb);
+	}
 
 	return 0;
 
@@ -395,9 +399,6 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		clk_hw_unregister(hws[i]);
 	}
 
-	if (bc_data->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
-
 	return ret;
 }
 

-- 
2.37.1

