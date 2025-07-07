Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775EA1DE4FB;
	Mon,  7 Jul 2025 02:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855229; cv=fail; b=GDqt+ijmAKhEwNZjgr4wNsNyXS9iyC0wUvKmYiUAH3UrIbOnjw6YpkAuSolpAhU+L2OChqtvWw05N6cqsqZvqCi6bYeytQhhT9A57KyvWG6B0p9RGO5WRxsnpHxn3YxJdrdi6fgn2cxczTNQy7JWvf+UbcA+Wf2pGHA0ZNzBY1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855229; c=relaxed/simple;
	bh=f/ijEim89c6KrSPSQlf8FUAMWeG7tooUFzHwVjaVP9s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BuiNfLCvHGtlRMb8YFPlvglxRfJiURwdU9V7w13tL3clX47+eMOM30tVMfbO4C16Az3DQOTRNsQeEC40MlcdUAN+O7kW9BDMwLfskuATRCeb7rXJympQJFIHQlanpdB0vL34Py8JU9GyDewucwtSUaMHxJVOS0hg8xRRRYqZO60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BOP++UjG; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BOP++UjG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhfairGlVI+0Ub7HFutzisj+65Llg5X2BMOBkYx/xGnnreId4dJ8JbbbXzf6fcNeYe0YlUe7fTvdREkzaqJGMriEHtz8r1CS2uyRgsZLoI83ab25BZi0hmlv7dGukDTTV+bIe02sQM1oLPc6fuSo8JVQym9229XEfemmoQ+jENS6U6l7DwpV8iUi0kJf4JfRJ+Efg0tbedqJz2wznMiS7mVsxv2Q+G5qxEuAx8lfhpUVJsK3x+xFsIyJx1YTQHCraWf2mCj89JdN5Wo53mFj4TgY7y3r4EIyo2QOpxesFzrG5mS2GtOwW7pKA14Rd/y+KpHL6Ze0/M2mm2Kff7z9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik4uI10yIobqQPOAj2IMZiRcD8+q42BYodK7Bu5p3oE=;
 b=bo7gmv/W+pJNYaZJubaG7+2CU3xVeja7XUJUfhgDUXu5j5kCFyqaVw2CSGS/HTR+C3d04DoGBG7eAo9uXudNQSq8T1BN+SSVlL0o+qba7JFptan1eTertNR9viIJsXvWXQOaMw+qrr8YRKKGjN4V/fuoAtJG4CIIa6OOU+qxSLXXpzwQfs9cQ86fF2Yjsrt4jQGIOMxljks0lRiYKOB6SjMNyFbcW37FcXUWBeYw0CbqsYCkXrd4iewqnkbfJoe6OC1yq8HHRSEY9Z5+bKcVV/chafGRkrfVXhGp7w5mGKAmQBZivhFfO+j54RqYR69nCiTIJ0sUGR9FcLdeJxkvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik4uI10yIobqQPOAj2IMZiRcD8+q42BYodK7Bu5p3oE=;
 b=BOP++UjGd12TbdwAuQKrXeLRLG1t4AdVLcole5ZDVfHBeUE9Q74TIS1F/lnxgCBYuj4FkzphJkTx1hpNAtDoQq+74E0C3Fy1JfxKbxXZHCSittrfYSIfWlg/uVOQZ/B2tLIii6ONnTU7kpsvXgY3clO3vpI7VsLNgSWfeJKqx17dA1YLpWzNXO2C2rX14HMHWvWAW5yaXxoLdX+F8Vg44a9gYKbjXdfav5Z04JFk2BtGoWkIbAru8baq2xh6CrSqUdVz89+rCehBVjjLGd2BtgL125DRz3ByB/fGM3liiauQSkmwXtbeVN+NoASLavlyyg1zXenVdIFsD3Y0r8v2lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:27:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:27:05 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 07 Jul 2025 10:24:41 +0800
Subject: [PATCH v3 5/6] MAINTAINERS: Update i.MX Clock Entry
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=855;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=f/ijEim89c6KrSPSQlf8FUAMWeG7tooUFzHwVjaVP9s=;
 b=aokpthnN/BkFjPmUw3JrNB75OG7QX00zIiEfRRW7qgeHR7SPsLq9GA1S7M8Xd5yeAm2sPNeFj
 J7+9558zjvlDCoW04aXySSoUO050VvQfBUI4AznfCRWSeHi78h2RLB9
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
X-MS-Office365-Filtering-Correlation-Id: 3037d117-6e5d-48f8-4fb0-08ddbcfdc37b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|7053199007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjhIRGZxYXE0UFFLeUVlVHZJZUUvQys3NEVjbHdzNFVFdHhkbHN3d0Z2VDJm?=
 =?utf-8?B?S0lNZE84T3h5VGJwdXVOaWx3eFJEanlyaUxnZ2VLbkNJVkhNM3ZONkdoQUxV?=
 =?utf-8?B?aThEL3dqcjduOS9ZZVVDdi90aTBoZ0ZZdGVhYS83bVhTVFJWUm5wMzYzTmNt?=
 =?utf-8?B?VXZKTzV0THlEYzdvalM5NVhJTkpKOGJmOEpwclBvaWFqU080UzIyeXQvQXVz?=
 =?utf-8?B?WTh0OUh1blZsY2hGaHg5cGQ5VmlvOWhLNkxZemVzWTJLdzJQU3Vjc0hBeDRU?=
 =?utf-8?B?M2tRaFhzUmZvYVNOZ2hjam40QjJmOFZTMSs1dzVjV2FhV2tDdzlXM1RVdjVE?=
 =?utf-8?B?d3I3QlhFOEFROGJvTzk0UitDZXY3VFM3Q0FIaXZpdit3UGVQNVdMWnc0ZEdK?=
 =?utf-8?B?RGRQTGhJcW5LaEp2Qi91R2NoYXFjQ3Z4K2lVNEJSZ1h2VENDbkhwcklyc2kr?=
 =?utf-8?B?SmZIdHRIb1JCY3NRMFNKM1JrVzBCc0xVOG40L3JMaVM4ZllQUWVXVjhLU1V3?=
 =?utf-8?B?ZHgzeFBiYUhmM2V4alF5bmtmMXpidkpXUG82ZEk2d2dDRFROZkp2SzdIQkY3?=
 =?utf-8?B?dEpFVjYwRWwxQVRobnM4cXQvRnExOXFIcXlTSnpWOTNKenFJV2dUZzVXVGxj?=
 =?utf-8?B?NGw4OVNMeVpkYmFKTENtRzVvOXgxa0ZFNXlNR3NDK1NYT3AzQlpjSytVTSs5?=
 =?utf-8?B?NFpjeHAwWmQvQldXSXd3Wlk1SEtibzh4T0pFSmd2WW9NVVJpN0dkQ044RXVX?=
 =?utf-8?B?SVpKNUtoZWZsTlBrY3R5U215NEhSQyt1SG9GVjd4RUYxTW5iZmlhMkpobHRK?=
 =?utf-8?B?bHkzMzdWSUg0clJMUFBnSUlDK0sveEw3cW43ZG5OR3A0TlE1QWY3bXZxVjB6?=
 =?utf-8?B?MUhDa0xrTFdaQ3dhR2FCRmtIaTJpKzVVZ2oyZXNZM3A2WFBucGhXZk5GQzNq?=
 =?utf-8?B?OWwvU2llRyt0TTZNVmRYTGQzWHExcDgvd3VKQ3hQays0YzBDOUFheVBRTU90?=
 =?utf-8?B?SFF0dTZ0eGF5NGdqd2FVV3VjNnB5ekZKRGhHWlNralFxZEFKeWwxdWt3ckpz?=
 =?utf-8?B?dStnVlUrMThtYWxCek1FVXR3anRhNysvcisvTmgwUjIzYis1MjhadjM4dUtz?=
 =?utf-8?B?OEgwTEMyT2dJSlBiNFU2SUNrc2JWOGhvdTJ6bjdCUUZqcXB3VVIvYVlybUJ0?=
 =?utf-8?B?Z2liL1hlUkpSQ0laWXFyanBHWXA3Mk9oTDk5TitOazQzN1Z1bXBOUmFJLzNy?=
 =?utf-8?B?cjlYMENaQVFxYW1OTFJWZzFlSFFPTWNVc1hFMDRmQWt6UlVOTUdrN2J6K2d3?=
 =?utf-8?B?dzJISFE2cU5QQWpacWlYNkJxTU1LSUZKU015TXJyeGR6MVdrQ1ZNY29RQ04x?=
 =?utf-8?B?QjdTcnVJdkRwV0hmazFiZlRvK0lpS2VLR0hGTjhRdTg1K1ZSSWc4anl4M3Qv?=
 =?utf-8?B?MmJsL0VvODNtQnpNdHNFdFVQYjhnNjVQVGxuWHBreThSYVdUc1pPOGRyQnBs?=
 =?utf-8?B?anNKM2QwdlNvSVp0cnBtUURFdERyMGpnNEZYYjlPZ1hlUjdUQTUyclNFekxL?=
 =?utf-8?B?U3pET01Ua2dxaFplUUxuTndDR3hicDlnV3JxQUFhY3JIZVFxL3ZhYjl1amNS?=
 =?utf-8?B?U3lqRjQxZFdjN0tuZXpYM2RSZnhtT1haY2JCSVBIZ2tURWpFdFNDK1kwWlFO?=
 =?utf-8?B?cmVLaitveHE0NFNacThscjQ5eWV1UVVFcGVTbnYrS0E0NTVLc0NYZ3BIamFh?=
 =?utf-8?B?b3NPTmVaS3JTQW1VTjdtWGowcTMwaGRiTUNqUXhJc05Pd1hzNzB2bGxma21G?=
 =?utf-8?B?Q0Z5bzJpRVRFV1M5cThaTStkOEZ2NEY2QlBuS1dHSWEzN2ZkcE5ZNjZydnk1?=
 =?utf-8?B?VHJMY09xSFZiK2g0NDA0cEUzNGZYaStSZXplVFJmdnVFNHh6QzJnZHJnMDhB?=
 =?utf-8?B?OEFZdDc1RWl1VFNiWWRNRDNveHN4U2pYVUFWSGw3RVREUXAyV0RhR3lva1JZ?=
 =?utf-8?Q?EIH+y74nd0+m856tj735wpu5/YP77c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(7053199007)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGkvMlVzeUFWaW10U2xMRnk4aUh6Rlo4V3BjZ2I4b0JzcnpGQ0ZORE5aV09I?=
 =?utf-8?B?aHg0N3UwWHdBWHZZN1FRZjFMY3Q1K1I0VzBJVVkxenRSMm9KZlNwbEU0NG1B?=
 =?utf-8?B?UFc4blFpM05yNGYyQWREREFJQWJyQllwdUFJWlZzQmRSZVRhZUhScWZHTENn?=
 =?utf-8?B?NVdLS0UwYXZ3UTl2UmdzWk9XQmY3MnRDUFVScDhDN2UwOGlleURFUm1kY29W?=
 =?utf-8?B?Wk9wVks5YTFoVmdYTDRNZFhONTN2ZlFPRWI4RzZTdXlYcXh0Z1E2eWpJWjhF?=
 =?utf-8?B?Vkg2UFZkdGFYQmVmak9QY2NRWHQxWCtmaTJHZEhQUnNqMy9aZHFRUGVtZkNM?=
 =?utf-8?B?NjI5TUx0UmpVNldkK2lJNFVnWm1Zdmg5SVluZzE4RGlRNFZxc3NIWmMwYlpj?=
 =?utf-8?B?b01UV25pcUNKeUV0NGpySmpDeGRVdFI3N3FXSWxVbGo1ZGJMSE5zUzJ1ZzNM?=
 =?utf-8?B?OFYvV0p2czNhWlhud0tNNkhIcW1tbGFPOHZZYVF0MzZhbCtoMy94eUEyWkY1?=
 =?utf-8?B?NEFlL3JvallCNU5XUW9jeVAvSWIySzd0QVZYWWpYQnNicDNTUW1Cc3VZbUZM?=
 =?utf-8?B?T05SaFRSempma2x2UFlibEVJTXhTY0syYVVyUkZlV3p1ZHI1ZlBXL0dPWVZN?=
 =?utf-8?B?aE11aFpvVVFSRXdMcHp1akZnRktzME9jbFhuNitER1Zsd2pFVEh5L1dVWEM4?=
 =?utf-8?B?THpMTllteWNtTnB5NnZGakRKVk1RMnQ0SWN4WEd1L1RiTjd1RFVMN2c5aXoz?=
 =?utf-8?B?cEVVMCtRM1FxRS80QVVwSnJFcXI3ek02NkcrVW9mMjA4bXVVTkhvL1BXdUVB?=
 =?utf-8?B?cTl4dzdGSjdEd2dEK1RSSCtIR1dKWVh3VGttVVBrV28vU3FoN0NObGp5UjNo?=
 =?utf-8?B?dXV0eDk3dlQwR0w5cWtUNCsrOHdjQ21UWVNmUkxOd3V2R0owbVhjS2lVN1NI?=
 =?utf-8?B?b1I0VGd3dnVXb2xZbTNkSXllS3YrdHpjeUFjUTZ5VStvV1RZTUNXaXM5SnQ5?=
 =?utf-8?B?Y096NjJMNjlURng4R3BHTzZtaUh0TzZOeXlLUysrVVBKdEFJMTY3azVST1By?=
 =?utf-8?B?Z3BSYTBTVmZJODc4SFpjMk42NjJHcFVCeHcyUHZ1Z1ZMTE5GdVpDVDJyalBK?=
 =?utf-8?B?cmIrTEJib2NVWkQxd3U0ZE1ZZGRlMDlsSzFyRUhqZFJsK1dCNFpQTDF6eUd2?=
 =?utf-8?B?RmNRbXJURHllTkxzOEluMmhrVUQvVGlkZ1M1WVIwWEpvamJvL2hscnZjMnR6?=
 =?utf-8?B?VzBCd1ZJRk5zbThwbkZXY1FMZHR3ZHlUSFZNQzlqSm1WelYwM1ZRSkNwM0lM?=
 =?utf-8?B?c0ZpeHlIdDNxdHhraGN1THkySzF6Yzk2RjZOZDd0dGdEaXBEZk91amlJTTdO?=
 =?utf-8?B?a1dnSnhHU0NndlVYRis0QlRXWGdBNWVsSEtnMVAxVWZjQkVWSXo1djVHa29Z?=
 =?utf-8?B?WkdjOWpIQmI0UHQ2ZExPb3hsZXdMRnVYc3MxL1ZoOEpodHZEUSs4UE02NXZV?=
 =?utf-8?B?aDdVTUJsMk91bnh3VjBGemh2VkQvRlMrWjJnMCtCbElUeGFuT0Rtb3R3Tnc1?=
 =?utf-8?B?RVdLRFNKTmlvMEpuNEJLanJ1Q0ttR3BZRnVQUUpIdVU2RFR1NUlsSDJtOEJP?=
 =?utf-8?B?UmlpNlRMcm05RTFicU5kQmdPN3BWenZwOHo2aEp0SS9OUVhnRk1lLzl1Q2lZ?=
 =?utf-8?B?bXZVQnR4c2pPTmdzRzdkWU1zWHIwWWRVZFFoN3I3RFZiTFl5MlhTY3UvZUp1?=
 =?utf-8?B?Y2VzazN6dkZNcjdVRlVGdlVnSWppdWdEaVJMS3RCWm9kS3A3djB0MC82ejI0?=
 =?utf-8?B?LzgzVS81VFFpUmhkVHlBNURLZXlJU0NIMFdiU0RTMzNEenlIUHhLcUFTTC9x?=
 =?utf-8?B?alRGb0pnc213N3dha0Y2emQvM1EvbjNEMDE0QnYrR1dpTS83UGhxV3U2VGxw?=
 =?utf-8?B?UmY0NGJ6VnpoVS9hMEFUWHpXamRDeENJU0RjdC9Ia21kT0dmTkEwQ2xmN3kr?=
 =?utf-8?B?UzVCc0xGZlBtZ2d3Vk9YSk5aT2N6UVJHa3pMcVNEOVFGb2c2MVg1Q2VaT0xt?=
 =?utf-8?B?bnUwaHk3U2hNaDM2Rkk4RDNhZkNyNm5rbDFWNTVoM3lma0c2a3B6VzFac3NL?=
 =?utf-8?Q?SqMKI+9My7cwoE2guDuzUXH5S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3037d117-6e5d-48f8-4fb0-08ddbcfdc37b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:27:04.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MX6VP0LZXhcC3HivYt4tPZn4brXT76w2p+g1rt+7flVE4nFWy8WjFDWQc4LODzC9QFuchx0iXhLYFa10IRLdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

Update file match pattern to include nxp,imx* and fsl,imx*.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92e9d8c7708ff4874efaa9727814ad7f1c9f6b0c..8be3e0fbe72b82dc398046d415481d6cfd09c78b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18073,9 +18073,9 @@ L:	linux-clk@vger.kernel.org
 L:	imx@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git clk/imx
-F:	Documentation/devicetree/bindings/clock/imx*
+F:	Documentation/devicetree/bindings/clock/*imx*
 F:	drivers/clk/imx/
-F:	include/dt-bindings/clock/imx*
+F:	include/dt-bindings/clock/*imx*
 
 NXP PF8100/PF8121A/PF8200 PMIC REGULATOR DEVICE DRIVER
 M:	Jagan Teki <jagan@amarulasolutions.com>

-- 
2.37.1

