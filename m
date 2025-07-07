Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A11D5151;
	Mon,  7 Jul 2025 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855218; cv=fail; b=rqxl0K5U+FQlNC2C3LSY7Yjc4lzFhHGwH7FpmVjNWMqmJnZmw3ewNPhi3soHaniuD6Ai/7Q/3lH6QQVGN5btGVmloGQg3vMn9gSvODjDSCDiKopyc1TS9VlHNH+liWg+928aQP5ANClB9KlrydccBQ7IKOFXfGgEU9BLhb4j9Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855218; c=relaxed/simple;
	bh=pBbWZmRu7054H9zNwXpUlRzVy/vNNyToqaCG3AfvhAA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M9FAKbH5sKf1LHIZN5psMTszQpPtL5Tp+icijd+kMTIHzXm0CP6M/3QbvIhSpCuSU3p1FYhfzN62q3m+ClzJFOS6jeJzM0/odyGImMwuqwsw/Ok2YjwNexoDOFa5o+HVlmsTqn5xm1KNr9eJ/i+iacnI6yb9fBwWKFCEn/QbTMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n2LKRqHp; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n2LKRqHp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAlPzBY5upF384KrQGRizDJkFX+eGdSdZ30hN7ocNuEtfM97RY0gi3g1Zk+rLQkr6PcGT7w2ryyH0Jo/00ZmRdrC0xRZJ5BS63bD29JjZKMR7bnwHex6JjiTOKSe6V6VF8ejLgpr+fIf7dV6jqsk4pSfOvthv0olLcVJfEHyUOC0728BMhrqujlR5vvWTwVW5CoYxKvuWUkiXxd+tQCS1LjrPYuHlWtvJdW/YGtcVZY7YyTH10irZVc+uZDorBlyn/JiDBcc4nvfMpoQy0wlt3Yku9F7TER4ikZkJT9IKIOrLxB8DOUG1N4SLB1d7whoCc6WKKpjMKFhv3w/K04uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AOPg4WkDo1O/p5nxAWLB+g1SMqQZDDovQkUOocf9gk=;
 b=Ts15uZdy045MFeIybhIJkv8otRLqIPRn3q1LiY1fw1bCcD2Y8/hYibT0Y9D/jlMRm6tA7JrjtyeW4gji5nuGryujlG17ytNRTQL11/DzyUcOXz3FtvvPuhlLMZg4olnV1aaPlFwTQxpvf+6WOMyDGI+Ob/IyCoINH+U+G3iKLLFnHY3ESotnD7BWckjn+L5HHpS7Wbw2vJK1Eb50VQSNg5beaBykcWIM3MNfyo/1CGcE1iR4kfL2LyPk5A7lJ4DTFDhtcIGl2bmwMK6VTapEy+ihmuyk4gti/iLlUOPxynUahWze4JqNFKuLx7eODE62tpF1Cp+9ZL+Aitekgw0tPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AOPg4WkDo1O/p5nxAWLB+g1SMqQZDDovQkUOocf9gk=;
 b=n2LKRqHpTsb9KT0tWuhkvVV84kNU7OccGtI7+Di+98reMGtAU8zHQO+8tJ+30M+hmubIA+hL2aVdJDVmfiVzADDmcB2xykeIN9Vidz679oGobQwvFV6ezSR3imPbaelMkiZ8cmzow5XVPDFDVTqMgxkOyAKseDxerjBkw/NgoDwf7v54iWozHh5QQxUx98rklM4Cr30drV0HBUZWWtVVjitGCnW9Zysb9F31qtVOUoAxahBIZWboor/GSNWZOIU62qmcjdfW3/HT6Gv7cx74Emv+/bQ79cb7U/m+KoDCDOmoh3HD6bMcAeSa1LaW0bqqRpm8YYfLMS0O11E4vtLZcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:26:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:26:53 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 07 Jul 2025 10:24:39 +0800
Subject: [PATCH v3 3/6] clk: imx95-blk-ctl: Rename lvds and displaymix csr
 blk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-3-c1b676ec13be@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=3912;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=07QUPinhJ6vN5+YOqPGedjsWzVCcdUSc46cUrXyB4GM=;
 b=DapHAGcoPCo46OX2m+H4QOPBjNjC45Qc1rBFsOnMCq6lQQ1nQ6Q6tEyqdwnNYmHgdNPclcE5x
 UYvpTP2/RP+ASizJQvrZR9FbBJ3WhfFLsftCHLR0FglP+rIi4vD1PpG
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
X-MS-Office365-Filtering-Correlation-Id: 2b8b7df5-7643-476e-c905-08ddbcfdbca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1ByRXJTZWwyckdOT3ZTNW9McDZQWFAwQmJXSmh2a2FxSFUxWDBtbW9GOWpn?=
 =?utf-8?B?ZldPQWVJdVJicVR4QTEwLytuazZVZE5CWWhOQ2NlcDUrSFdxWnhMZlpiUUlK?=
 =?utf-8?B?WkxGR1NhR0h2a3EvVjhCdC9MUEJvTzZnWGh4WUhyTVBBQUdYSStMNDFZNTNH?=
 =?utf-8?B?ZkppcDBSVVlTS0dxRlRLM21TMlpxZkVFYWtXVFZ6a3BoSmgzYlZudVB0Nits?=
 =?utf-8?B?bTZaNXZoRUVmL25veWU4T0E1ZkhCZ1Y5NVlzbE1tcHBBMjB4MXNwSFc2a2dk?=
 =?utf-8?B?WEVYdElqK0VBVE5STHM5enNTNktYMUNraW1XbS9PaWdFai9EMStBaEc4d1Na?=
 =?utf-8?B?MU5jU1o5dEtuZkFpUDJCWnJzbC9NVW9HY1ZLenQzYVBGQUJyL1NtZHQ0SUpO?=
 =?utf-8?B?SGg4NjMvZU5MYXp5SzNhbWt1bWpCdmwzTjhoQzJ1V0ZTQXZ6Z1JybUtjelBn?=
 =?utf-8?B?VUNwTEFWa3VPQ0haM1E3c05TTmNndEZ0TGowd2xwamdZdHVxNEc0MjB2b3kz?=
 =?utf-8?B?b3drOHp3blZ5NnNaajRBSjdoQzJtQVV6SVVlYzBpbUh0YVVydlZVTHc5VExa?=
 =?utf-8?B?czV6YW8vQXZJRVdDRDJZWDZKMlF1YkRzZlFEb2ZrY3dXK1pKQUt4a01rT3px?=
 =?utf-8?B?WThYUDlFQWRJUDFONDAxeStZODUwMlRQYlczbm8zTktZdVJlRWY5YmMzTTJ0?=
 =?utf-8?B?T0Z3VG1lR1doblBJR0FUQ29OcDdpWk1wd0NEQzEySzI4U21DenFmUnhQdEtq?=
 =?utf-8?B?bnFJSjAyblZtSlhhclFZVXFBNDF2Mlc2c0lTVXVsV1F0Qldud2R6b0w5bEpV?=
 =?utf-8?B?WVR2SGY3YU1BR3I0T1F5VGYvWm1oRkFJUE13WE9lVHhMZThpQjRQOHlMVE8r?=
 =?utf-8?B?blBBeVhnTTU4aXVubG9wanlqTHFJbXpWbUJUeFVzR1htS0wyZFROVFltL2Jr?=
 =?utf-8?B?UWIwcHViUGNmdmhpRE51UktJLzJOY3UyYXNpVkRQRnlSMzRaYWdpMnVIdUd5?=
 =?utf-8?B?WWJFODhUSFpKVVFPZitycDRLR2hzQW1DSHFOak1SZyt2Njl6NDZQY2hmYXAv?=
 =?utf-8?B?dWZsc1VsVVNUdmdMZkhMTlZIN3Q3cjV1TTQxS1ZjNXdkZXJxSVllM1lZQXN0?=
 =?utf-8?B?c2RNc0hleCtISHZrQVNyd0hZR0d5cHVTdURPb0NobVRRM29Pck44dmY5NHlm?=
 =?utf-8?B?WnY2cDJIZ0xCZUtKR3dTcWxCNWxBbnpNQ2tGWXJTclZZTEExY1kxVXZxaWVV?=
 =?utf-8?B?c25wbEVBLzhDTHV4MitobU0zVFlKcWxPdkhBZVlkczdCeEtlbzg4WFliZVQ0?=
 =?utf-8?B?b1pYVlJTU1pwWCs1dnhDZE00OWtXaUxyS0NnNnpWVDlCR01QNEJTOE05TElP?=
 =?utf-8?B?SUt4Zk41cVFYYWIySklxVHUyeWdkRDgxLzZwUmoya2pPY3dIejJKeXl0SU1n?=
 =?utf-8?B?OVlENmQrZ3BmdTdQd3lDQzE5OUpGVWJZYmhSN3FNUnFtamR1UjNGM3dpRXB3?=
 =?utf-8?B?eURsUmNuTTBoaG5sS0pzV3lzRlo0MmJpbDdPZlZJM2NXQjM5cXZNay9xaEZm?=
 =?utf-8?B?cTdTRXlBcTJ4MndWeTAvdmNGVU51cXE0NzQ0bDk1WTlHaWhsZkpBb2tYd3d1?=
 =?utf-8?B?aUM3SXhVNnN2QzFsRTZGVUdZU1IyRWhicnRJOEpKcDhJbnBUTmpqUmRib3Rh?=
 =?utf-8?B?bHB0YTBRYWJmM2tpVlBabE1uOWZ4TXhXM2wyT1dvMUgrV2djMlA5bXhiOHI5?=
 =?utf-8?B?dlJKZDlMMkxvN1dvd3N1L0lkTHRZa3gyblYrWDUxSXg1Vkx3di94TjlpSFFS?=
 =?utf-8?B?UFlJZkI4UDYxRHdIanNtdHhGN2JkSDF6cllnQ1FxTXAxTFhYQTR3YXk3MDhz?=
 =?utf-8?B?OVpwT3FYUno0QVhFRnNpaEordVdFZndYSUw4VjdyRXRHWm1PbmRrN3BXNHQ4?=
 =?utf-8?B?RmxyTVVYUURsN3FkM3p1UHZUWGpVZmVPRWx6UEowbWFZTHJWdU9kankwV2d0?=
 =?utf-8?Q?P8e8VKgTlUVZ+aRcg8iHhm9t3WUQ1I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFdFVDNVVGw1WVJqQ0VLRXNoZ1Jhd1BLcE1SNmgyWmpDVmp6S052VmZsYzBL?=
 =?utf-8?B?TDRacVovSjBwSWJVTHBkVSs5QWV3dEw1aFFlK3R5ODlsTE5BUm1WUStaVC8w?=
 =?utf-8?B?dHE4aUFZOEJKSXZ4YXdLVlQycThHRUJWNFB6aHcvODA3ZXgxT2p6V01mUmpY?=
 =?utf-8?B?TGh4Qi9pKzRnTTdJMHk3Mjc4NmowZ3BROUsrUlYwV29UYko3ZGNCZGhVWkg0?=
 =?utf-8?B?TTJvTUk5ak9XaWt6QXN4ZXk1aE9NSC9MZVRma25FWjFkTXZIWnU3MSt4QWln?=
 =?utf-8?B?cmJzODJsZEdHMG1DNHBWZ2h2dG1jYXA1eStvVy85NFM5dkl6cXNHNVgvY1Ny?=
 =?utf-8?B?OGltd3B6bWFBOVVIK2Ftdmtqak9mMkFRZ0c2TWlsblNUcDE1aWMzSFd5RlBo?=
 =?utf-8?B?V2RUSUgvQWYrUXdEYXcrNWRFL3llSFVrdGhsY3RhUzk2R0ZhSUZsOTdjbXhk?=
 =?utf-8?B?bmpoM0JVaUlZTmlUbmZFeVdDcGZUWk01RkF3YTdjd1NlOVlSWXpyK0tlaCtT?=
 =?utf-8?B?UGJWTG95NDJmY2JFTEN5YktkMWtIZ1N2a29ldG1Qek1PTDhsK1F6QTR0YU5N?=
 =?utf-8?B?VDd2eHFFRk1oVkVzK29rRGppWVQyZ09sNWZFOU9QNWxSTko2WU1HTEI0Qko4?=
 =?utf-8?B?RGpPcnFUeFJhVG5mU0J2azNBeUxmSE55VUs5Y3Y5ZjZ1dHVkd0hZUDN1S1Va?=
 =?utf-8?B?VE9wc0tTQ1RBRDB4MTNyN3ZjUkNURDFBc1JUQkZZOVRLY1lPYjZLQ2xjVFlK?=
 =?utf-8?B?TUZUYTNEQkRVMjBBNUhuUVhiUEM4MUtKVDVXK3JDUEZJNFdZd3N6a3AzeHlE?=
 =?utf-8?B?YTREblMrRXpWTWJrT05ROTRxdGQxUG9NUThuQmhJT2NFNFh3b3VmTFYwTm1y?=
 =?utf-8?B?RDExSWxyNHFLVE84MEI1MjJGMG54Sm1YM3hlNTRrNGNpMndlVXlvcmNHZVM4?=
 =?utf-8?B?SkRtVFNBWEwvb1FIOHJtQWRVWDd2MDJkaDZFZ1Blc0VES05vL3UyY2dUenBD?=
 =?utf-8?B?cFdzVVdiUzZ2YVVITmhyM0hSTlVNNGpTUlh3b0E1MlBTZW9ZZ0xtMytoMFVs?=
 =?utf-8?B?MzdBSW1aRmUyMFNDNE0yYng5Z1RMQitWbXNqSEtoWWdzdjlMbTNxU2pMbnda?=
 =?utf-8?B?VE0weU90OEVyaHEyUlJRL2JFMDRsd3dIbkRvWEU5YkFvMEhoWXFMb2pqQWx4?=
 =?utf-8?B?eE9HRjFOTnVrcFBWQnJmYVhDbEVCS1RPOWxIbmZYZG1nZldPeTJaRGlIRW8y?=
 =?utf-8?B?RkgzTTNWcXVkcVFxOFE4a0JCZUdqQytubXlNRnZGOE5PZVBUQXJVb2FmeTZj?=
 =?utf-8?B?VTNpZGFFa1dYWVJLS1ZaME5XSzlycHRRaWNnNUtvaTZtd3BVSE9abnJXbTFk?=
 =?utf-8?B?SitiOTU0Y0F6aUhsOTdnczMzTjFjSFlLSExRTzJ3eHhJMUVTN0hzc0k5ME5W?=
 =?utf-8?B?eFNtRlRZTm9UMkk0dUlWR21KeW9na01uSDRuZXpsRVI0UHNsT1lUWkpMMmEy?=
 =?utf-8?B?R1crY21HcTNHWjNIUm9XZW1MS2hVdExkM2pYTHVOVDBuRHAyL0FaQnp5WXN2?=
 =?utf-8?B?cFFFMklZVHZwZEZzbHp0c1p5SmR3RzViMnEyQUxuTXhYMk04WS96cWg5Szgr?=
 =?utf-8?B?ODY0KzVBVDBUTUx2TUJRZ0RCM3FpUnZ2SmFqYmNTUjRXUjVUSWhkNFFrQ25i?=
 =?utf-8?B?ak5xK3Nmc1pIWWpISTdMQUViRnZCbzR4RXptRjQxdmo2Y2FpSDd6MXpZT0I2?=
 =?utf-8?B?a0RUL0VLT1BLaHNFQ0ZEN3VndFJ6R0k4SkRFbEE1MW5CTjBlbkhkMksyUzhy?=
 =?utf-8?B?ejc3RDVSR2VyY0hHZld1NzRacUM3bEphTnlIYkdhb0ZuYkszYmhTMjRNa05m?=
 =?utf-8?B?OUtCQXZxOHR5d09mWGNuNW5UL0JWSnk1WU41bS9ZTFluSnNpaUNZV3hpZitu?=
 =?utf-8?B?ZnRVaFYvSUtpYUpKekNrYVhncldYYlBUUDE2UlBkRjQvVDM4bTUxQmNERkZu?=
 =?utf-8?B?RllOUXplbmxrMEcyQ2pvbmRNY3pEY1AvU3phU0lMd0xmblE5Q1NneTBBLzRv?=
 =?utf-8?B?Q2tYZFMvcURvOHA0YUlRem1mSjMrVjd0Y2RXM25CWDhFbEhJOU4zVEpyeThI?=
 =?utf-8?Q?j3d1SmlVhIycYSpQSNv7YRpOH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8b7df5-7643-476e-c905-08ddbcfdbca4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:26:53.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpBU46yEuLTTbjiYZVcrjGqh74sWHY6S+oZbpV1BQarIFHCxuIG/6tvGoPS/0EOIybt+JXR7f0PB8i0YJFr2tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

From: Sandor Yu <Sandor.yu@nxp.com>

Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
support for i.MX943.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 86bdcd21753102b7d160288e7b69bf73da5a5706..c62d61c3444bd40fabcc0b50929584cc1724ae95 100644
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
+	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },
+	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
 	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
 	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
 	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},

-- 
2.37.1

