Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DB2288CA;
	Wed,  5 Feb 2025 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749058; cv=fail; b=rgDVtwNpvis+GkNXuA6dIEAqSGNbmhmZW7iMYyPzS8pVC6TsPxhgWeBPHpPop2DYOSLC3YhJWOZyi6Pwba0YYDpQvT6OJ0uxoMp/v7MqSWyzYZ9pBACIqcAhYwUTlXbR3DQM3JxHFgPIn2ukrZy+bRPEL6e8tcLM67PJjvwFCrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749058; c=relaxed/simple;
	bh=Q5aAO/aFRXnA+bNNUE42LVO06SmEixTYOTpSLPYKgbM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Vw8F38rNsRmQtFJX/cUA9nI8406U7xWI9/r9WkWF32wKsp9eQQfNLbaQpcx3V6OFtz7i0dBmUvmgaNTUMQoy/cvRP0usRW45Fk0VSOaKwJ1pDn6ekAWStirROcgDHEUcl9mYlJr/WRj9faukx/QshDGbO0dnVeTjIGgx0Bwgr9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KW54EgKJ; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KW54EgKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oT4a6oW2u+r3B46sD35jSComOHSsHJEi8O1spV+dc45ouM0FYAJHTECZ6wJQDNwojsbaVu/YFWKMi7rTLeuQ/o/YeA+NhgjQwrjfJd0D5Trx8W1zTf7z+SFEeY0XWdvezgQC3rDm2NqiEKYvSbQpfvGfZlg73bYoK/bHL0l52wDHX9LXp2670RjdAsQqCPG2dF6sj7XpfNeWJOJMVMmDhbqWuhNuE/tYNU0liTTFAiRC62xuHVT9Jljd59Aa/QdE18adBJgapNPmtYApg4LeJCD9ZtdhM7bMEOvS4q2R4m8E7aG8LlHFaysmRVXgWbehKZ1IfdB8b3aA6tV5bzLI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiEF3b+Hm6mR2+vAyfVcDozw07BkM+qFb4qqBxDOyPw=;
 b=wiEfe6yzx8Tqz5MQOtv74dPjuipXWakqfTgREXDLMDoKvegEGjNasIdYE/fhUVrPoQwcdLSKA0RWvkI1GeBVG+Out1J6X0p91H4U3D4CT0a8v99YhyXJ6LHNwOfeUYokhN6kG8k5MJ1DjJ4lMgWv5ZZ2CPtXOqRF1uP8kgRBSc/IjdW+HomvDfdrO9gsoBQCK4tUKdvqsnizD82ep65vpHg6JP5x0lLO+NTrL0ulXPuJqsfVuNVkvTczN5xazHceVZ1/AitkM8AMjhZ13vSMuEvK7u876lIUssDaa4ZtKFDBJMK/XtpNXakG/R9YDT2ATghS3txW++bvkW0EFBxTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiEF3b+Hm6mR2+vAyfVcDozw07BkM+qFb4qqBxDOyPw=;
 b=KW54EgKJv+QmShyjyiUbzH0KfN3eUN3b7YSeqK3ksxJi7dKmKvIH6v9wcfLQBk0Ioro98D5BL7iCOR5d1QJSg+wOq0OM6R0rIryPcJrQYAUho6RW3CBmLaM7/JUlztnNULaKDrzi8r8gaNc/uIRlnAka9C2ldGWaQ7WfGlYGTaSO2ax7wr6b7ug3VffS4BN2sJk0tytXurKPJvQLpUiDNeKLez/eKdWIRAnIopfFxs+U3MxRXn7nY+vcmMFv7TPAKaLNdPP85t8RmJTa6NaZ3W3m+nX8EPTjvHygOIEIlE4LS8rOxqprJu6SMIYg4V4gMEG99oZZyrFdh+wHVAEXFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7783.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 09:50:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 09:50:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/4] clk: Support spread spectrum and use it in
 clk-pll144x and clk-scmi
Date: Wed, 05 Feb 2025 17:49:50 +0800
Message-Id: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD80o2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMT3eScbN3i4mTdNOMUc4O0JLPkFMNkJaDqgqLUtMwKsEnRsbW1AAG
 1OzlZAAAA
X-Change-ID: 20250124-clk-ssc-f3d70fb6cd1c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738749007; l=2396;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Q5aAO/aFRXnA+bNNUE42LVO06SmEixTYOTpSLPYKgbM=;
 b=3LcL4h5b/hBsVE3K59nQ7IlyFAK/ikytNafqhMN8/jTC4VKFoeh6e1MA3wtMPKDiVR4jy08XN
 mYb0gPGxDPmCExupbIH84dXhKw71obK8cX9Va/L2Li00ne9uh8TA47u
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c37670-d483-4de0-617d-08dd45ca90cf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjFiM082N1dKaHNzTUNnc0UxNzdSOUM5dHN1UDVKSWFiOGlicmF1WDBxRjhS?=
 =?utf-8?B?NzVab2w2U1BWVWNaNGNuc0xwQmlJL29xdWQxUHhsSTF4TUE4c2ppcGNiekRs?=
 =?utf-8?B?amoyOTRzMVZmYjErMExFVXY5S1gzSUpnYXc4cWxTUlp6UW9BNzBxd3diblI4?=
 =?utf-8?B?OEJuSFMxQmxBeEFSN3pabVpMRzQwcWNDOHkxM3FuamMxQ3AwZURSZ0ZBdzJs?=
 =?utf-8?B?TGpaOFcxczlIUjgrU0dzZHFwR3JFRmlzejJINWpOL1IwZjVRZ1c2aVZZZ241?=
 =?utf-8?B?VHFWWnZaL3pPb05Qb0Npd0RzeGI4Wm1kNnVDZ2hLSFd3QUJJemlDcHFML3po?=
 =?utf-8?B?N0htUmpDV1loVEh0K21sa3BjRGN2aFZJeWVhZHF3WEJqNHBzcmgvWjFOU0hn?=
 =?utf-8?B?K1NyVEljdFZORlZiYTkzbk5KTHFZRDhuL0VxUGVnbmJYMjlCSVJ2S1dpTXhN?=
 =?utf-8?B?VFlOV2xOSVh0ellSaTBxZGU1ZHpFM0huM0M3cU5teTUzZnNoYjM2Q01LM01G?=
 =?utf-8?B?dVFCaklQZXcyV0ZiUmtHVEk5aytlMWVNa1Rkemx3SG1CNXREM2JQS0tsQUo3?=
 =?utf-8?B?Uk4zT0RZZjVLdzMyUm5uTE5ZZ3RnMUVyTmdOd3VvODd2NmZQUTg4SlMrSWw2?=
 =?utf-8?B?dHRZRGNNSUVTOFQxUm1KWHhsd2hRMXNPSXc3ZkpaT1gycGl0bnJCMGxCM2VF?=
 =?utf-8?B?OWtYVXoyUlE5T2JuRzdYaFJQelhuTjRuZzFKL3FnYWRYOEVNU0tPL3R2elI0?=
 =?utf-8?B?ejVWRUYrYktINXZlWDlRbGJHSnY3a20xKzdIM1JVZG9vVTJqa3htQmFWOVla?=
 =?utf-8?B?ZC9iUkRjOG02bHFRWTJCeDhFV1JZWC9ZUHF6RHVEWmdmbEFlUzFXQ21JT1dC?=
 =?utf-8?B?V2phSGhONjc5QXhOSUVwUFZaZFNRTXN2RStEVHRZbXk2ZFNFQUYvdU5hT2RT?=
 =?utf-8?B?RkdhTW9UVnd4eHNRUnA1WHVYV0xhQ2JBUmtnUnZlRlQ1Z0VXODZnbDJPV2VS?=
 =?utf-8?B?QzRRdTFxMFRxMWkxUU8xbU5BN0ZHcGZtVm5vcmdOSCtHb1FQMkplcytNUW9j?=
 =?utf-8?B?dGluSEVSVkllem9STFl4MG5zZ3pYMVdZN3Bxa2laK2ROSXJTS2lyeTdXOGdo?=
 =?utf-8?B?ODhYY1dtelpxY21NU0JUQlV6RDJjRWxPV1NVWHRLTHBvZnhFbkh3dWVhOGU1?=
 =?utf-8?B?dFpUck5YZTAzeTFrMzRHdHhTbUplbi9rQ1ZXN2Noa251ODNJaXVjWWtrRWFP?=
 =?utf-8?B?NXdYY0VPUUV6MFFuWHh3UTZENk0zWHlxNTZldjRwL24rdDI1SVdpZThmRDZF?=
 =?utf-8?B?akZJWXo1NnZBK1pIbGpFWEVOYk1ZWkpIZGVYcVFxOHlFd0hmN1hvZHM0RmdO?=
 =?utf-8?B?K1IvNEVSbjVyazlCWkVlRGpDQnRWamtnSGRKSitXVUlGdWJtYUl4QUdIRC9l?=
 =?utf-8?B?ZEtXUkNBb3lEQXhGYzNjRlJOSkk2c1hpOUlvTDBsTVZTUTdRb1NpSVRVVDVx?=
 =?utf-8?B?NHYvQ1A3T2NQQWRmMHg3OHhlTi9ibkVJRi9CNlRNU2l3cFpxZjJsbmhNSVFY?=
 =?utf-8?B?MjdGeFIyR1gxNjNUbDJZTGo1blFiYWE2bzdtaGFWZCtVemY3UG5EdmU2dkNI?=
 =?utf-8?B?aFVlT1FoNmxLRDdlS0dtU2tYNFVPUERMMWxNSDVWR2k3YTJoVmN3M1BNQ2VH?=
 =?utf-8?B?SGlhY1huNXlWM3pHUnJhalZGU3g5YmNoemZBREJ5eXR5ekZMRS9LUEdaVnVO?=
 =?utf-8?B?LzRUWE8vNDU0TEdSUUZrblRpdm9CREVQVS9ZN0wrSDVYTU1UL3M3MVhQcVg4?=
 =?utf-8?B?TktGVzdpL1lYbUM1QXFuVlp2dk9HNEY2SStCQmdsMnRxdkxXNzM4eTdLcS96?=
 =?utf-8?B?WlpvOXUzNUl0UVRiWTNFSzFTL1hMdXcyQnNNR2IyeXNmSFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHh3cUx0SXBFMWYwVFFDVzd0dXFsZWdIcndjSkUxSHNSTHBqTkpFQ3lCNkdY?=
 =?utf-8?B?UTJZdHZqOUJQQjdKK3pzaEU0c2VlVVpWQXZXdlZzSjhpQjlFK2Y5N1NwU0lw?=
 =?utf-8?B?VXYraVpmeEJzQno1WjZ3QW8vZTIyNndNN1piVmVWV0lldG5VdHZXT1BISCsw?=
 =?utf-8?B?MUFGSWR2dWQwT2dPYmxLZ09vY0hBTXlpOW1MWFlJSlpuaStwQ1pEeXp0QU5J?=
 =?utf-8?B?U3gzRWZLN3ZMdUQ3ZU9lRU5tSG1VUGtqd2E3bUt4ak9uRHZoaFA4dkNxR290?=
 =?utf-8?B?WFhJdUxoejZMd2RtUXowWUc2VmdYNGRQRVJqUWFLY0RQYnRRT3dGaVNoeUdB?=
 =?utf-8?B?R2hpQnJqZFNYSjF3VXhSRHBsRThFNGhBZklpMTBPbTJMcEM1dDNWajdQK2N3?=
 =?utf-8?B?YnZrMkNZSlZyQTg5SE00aEM3alE1RXBYV1VqdnlETDNhOFl0cnRzV0dnOUc1?=
 =?utf-8?B?OStRU2hGWElvcGZBZ1VVTTVsdC9lVWdTNVhpQ09BZ2w4QjdqYVA4WWN1Rm9B?=
 =?utf-8?B?aTZ5b0sxbnZRQkgydGJFSlYyM0Z2TEs5TVRTbWc5OHJCTFRVTzNiRnRLNjNV?=
 =?utf-8?B?SExRNTR5a0c4SlovLzNOd1M2cStKd2RPVVlxNWxRNmhLRUg2WU0zUm1YR2pj?=
 =?utf-8?B?Z2Z2dytlZG5HNHdVZERCM1h2RmEzQVVuNjA0bUErd0dnL0JuUWdrWlZacWNn?=
 =?utf-8?B?czlJeWNFRXByZEN4ZENFa2xTY3RvWGc3RExJTEovODlLVnR3NEFNQktMR0Nl?=
 =?utf-8?B?aU5iWnZVOGllNWFxOVluVGdSdEl6TUs0SG9PNXFUUFBKNnZaZUNuemE0VTVO?=
 =?utf-8?B?cnBKdHpLaytHYUlaOFE0bGQxbnJFazJDUm5NRkpvVzZOajc4SkFCSjFoZW1i?=
 =?utf-8?B?TXJ1WjZVOGxDSi9hMzdoMk8wY20vMk83WVo1OUNFSmZKMGxCQTdoWTF6bGNJ?=
 =?utf-8?B?bythUEhjM2cwSXhCaEQ3L0V0T0VKWHA4UzA3UGUzV2pGSmdUZzEyWW8rYis2?=
 =?utf-8?B?UFNVTnFRN2M1TEFaalA3RUVETGhiYmlETnlkTUdZOE1WSWFiRnZYZVo5dE50?=
 =?utf-8?B?QWNaSXdzTlJibEVDaUxVMkdteDNyTWdzeFk5Y0VBcFZiRWE4QUhsb1pFYWgz?=
 =?utf-8?B?TGt2b3ZhRXI5Sy93WldDRSt3RkcrbDJwUUt1bk5iT1NtcWJBaHprMURKNExs?=
 =?utf-8?B?bmtvRkRCUURvR0JqNUtIelhwREdpOUJtSUZqSnhrQm5MYW9idjBsN0tScDRT?=
 =?utf-8?B?YXhmM0ltMzEweWxFMWVSblRVVnJwcE1UWXBYQmtEZWtWbFFYeHlDWTViNjJC?=
 =?utf-8?B?dFR0WjAvMExGeEZKajV1TjlvVW1PRjJIcVljQzhCaytFOEN3dHdtVTlGRkxP?=
 =?utf-8?B?aHQxdkRPZ3kwSXRPRUlUQUx6cEc0R0ZrZlQ3d1hicjRhaEJpejZCUS9HRFdD?=
 =?utf-8?B?M3YyS2N5a3Jva2hoL0RjdHBHU24vKzIwTFlMVEc2bDFlQzRZOGJwZ3lvVVh6?=
 =?utf-8?B?cEx0eDI3SGRoYkw0c3g1NUdJTkNIYlR4LzRlSkFoY0h1SnFVV2YwTC9uRzlx?=
 =?utf-8?B?QWpTTE5Fb1VWVlFaNEdPcVFZMld6eWJKM0w1R1M2RWF3ZzhsNlJ1MnlIVXVw?=
 =?utf-8?B?aW8vS2RyTHlnUDdqd2d4NCtUQ1pkcXBwZUlmWlFMbE9abTNuay9SQnF6T0tv?=
 =?utf-8?B?V3ExZFdXdHVYTHl1empYM21reDNQTU91eWVYSy9hc3h1TW9yZnhZTEM0MjIy?=
 =?utf-8?B?ZjF5eU94czVpSHdkVnhObnZoSGpZamlKeDVlM3cxVnYxWENQdk1ab0V3QkRN?=
 =?utf-8?B?RE1YRjFSUkx5MjFVVGUvR2JYeis2ZHlYWktRUHNMYU5FUDN3Q3dQYW1XS1B2?=
 =?utf-8?B?RFh0QUdhTVBxaWRVdWY0SGpuQnVINmVnakdZdTR4dFNMVFpDYkVxUndyd0ln?=
 =?utf-8?B?MDh2dFgrTWZUQ1h2ZmFKcmJFUVJSOGNvb01WSVZYV2NHbXJDazV6STQ2NDRq?=
 =?utf-8?B?bnhGSURhTHY3eE1uZW9tczNRRDQyV1YxV2kveWkzZXg3NEQwWUZKUkxDQ20r?=
 =?utf-8?B?VlJmV0JPaWoyaS9UZWdmUlVsbE5vSWFBODhPdkZLUXJpYmVjckgzQkRxOTF6?=
 =?utf-8?Q?9U4rCToTp/2hTPHdw3Tl1NSWZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c37670-d483-4de0-617d-08dd45ca90cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 09:50:47.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOg+t3Uumr8jRgz2iMctzFK6NMyMnNnHvtCk0v3M7zDSf0Lx6xT1grEfvChs7fRrQmMdj7tFf7qG60uc7i+Y0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7783

- Introduce clk_set_spread_spectrum to set the parameters for enabling
  spread spectrum of a clock.
- Parse 'assigned-clock-sscs' and configure it by default before using the
  clock. The pull request for this property is at [1]
  This property is parsed before parsing clock rate.

- Enable this feature for clk-scmi on i.MX95.
  This may not the best, since checking machine compatibles.
  I am thinking to provide an API scmi_get_vendor_info, then driver
  could use it for OEM stuff, such as
  if (scmi_get_vendor_info returns NXP_IMX)
      ops->set_spread_spectrum = scmi_clk_set_spread_spectrum;

[1] https://github.com/devicetree-org/dt-schema/pull/154

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Rename to clk_hw_set_spread_spectrum and not export it as consumer API.
- Fix error handling
- The enable parameter is still kept, because 0% is valid per
  https://www.ti.com/lit/an/scaa103/scaa103.pdf?ts=1738667308903
  https://www.synopsys.com/blogs/chip-design/understanding-pcie-spread-spectrum-clocking.html
- Include the i.MX clk pll14xx which was an effort to enable SSC on
i.MX8MN from https://lore.kernel.org/all/20250118124044.157308-1-dario.binacchi@amarulasolutions.com/
  With this patchset, things could be simplied a lot.
- Update the clk-scmi extconfig, marked as not apply, because spec not settle down.
- Link to v1: https://lore.kernel.org/linux-clk/20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com/T/#mce926ef10d3d9c1c960c21867c2f1509f1f87cb9

---
Peng Fan (4):
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: imx: pll14xx: support spread spectrum clock generation
      [NOT APPLY] clk: scmi: Support spread spectrum

 drivers/clk/clk-conf.c        | 70 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c        | 47 +++++++++++++++++++++++++++--
 drivers/clk/clk.c             | 34 +++++++++++++++++++++
 drivers/clk/imx/clk-pll14xx.c | 66 ++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h  | 32 ++++++++++++++++++++
 include/linux/clk.h           | 22 ++++++++++++++
 include/linux/scmi_protocol.h |  6 ++++
 7 files changed, 275 insertions(+), 2 deletions(-)
---
base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
change-id: 20250124-clk-ssc-f3d70fb6cd1c

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

