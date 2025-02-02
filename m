Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7EEEB1;
	Sun,  2 Feb 2025 00:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738457415; cv=fail; b=X/pl+bdqeALupVJoyz4J2r6u7vdGo2DTLi0obQMY2TZsfdiXXEjGHU04aXhaJI8SS5tdW6CaNyVx0wl1zBSkUxaoOxE9ix8sJspjNar80dppAS5A31Gc1pfeJwyCG4Um/dcLTV/C9bkSHDvw7j2dmPeu4p9YE3kzpC2p+Cu45HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738457415; c=relaxed/simple;
	bh=W3QIoTkDwnpL9HDVfQEYxcyY5ipZyJ4wL4e4XSiR338=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r2SNF33RASOKARh/rPM39Mzr9/RYbIJ2hD3d390sj1V+ynfc5drzuUzZwEmEUzk/xCyUf5v9lSj9DadfnIviueXihlXXqrYdVDhNjxg9APFIricMs5oEDzrEc4LRzYdQGK34PRZRUMwky6cV1v5wwyKDSEzM+WaOa/pgtd9fDbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GQgLXqcH; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GQgLXqcH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRk7Dvsa9NIkquHJMMZGnmPvhnrzPRBZRGR2TG/E1i4EFjxFzc6a3UDJRjlP8DhmciLSaXMtE/RD9LECrolo6KcDPs1N6MmE7ZF2ZYOv5nsfVZqxQ29Dbu9YS4wvHzdjvfJp64g3Xx7P3a0b1JpqzFG+8DMdnPES4EhWOFKaBMP4Ks7GPefjKtHGfWg49c1yKBOFG3agFLT94Ge5f2Wb5g+LwYYX+86QvdGoENFGg2xvJ4AaddKFEz3V7/3WObIJuCG+yJ36b2zMFb21Ev2TX2hYXO/UFX3ypxtaq3n7bWP/IZwmR/ep9wLOkqYFsOM/SFuFPZPyO6W278cm4lLXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnRdHsxaAcViRTPEQfvHw+sWedtBw21f/M59VsQkyJY=;
 b=PrDnGQo/ohDW9XqnbFNGkZEf4v3rzhGROMwoMyYO3rgLUZojPMKIZ/4lIwvIdmoQqaGZnv7z3BToLN9A0HLfasWea8ZMGq4zZO4DOnGyr5V6akKdLu71bK1A2cOllQk556Jv39wqsZM6GdFvaFPtn73WDx4dpxPSvnqqfPwKnWR9t1VRo3k839fYyZSQWTjcEOazJptwpXEcne9UYiOp4ectvaNmLwzmZTH6KSPVj/usZYevjrdxu0NKFm34sDPJY8sVminPjbtVr21j9BusAJcOLMntzMS0PZFlltK65QoD94S9KoE3v+VlAxdl6a7IQ/6hY6C+bIhX5gJVr0NztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnRdHsxaAcViRTPEQfvHw+sWedtBw21f/M59VsQkyJY=;
 b=GQgLXqcHjPC2XooX5YsJZ8W0eBbwEPh4Jy+RwgeFJyRJw650JRxvsQF8a8MnJJfJ5F04BFOChM2361r6aVmScY6yvpLwYitSNAWoNnCNPUx7HpfTcB8aXcvv7fZlHT6LTnFmXGoaCS1ZHNDzep1OvnYUBCCk8hk+vHExITYp/3JFSA9lP+QP5q0QyeiEnJE3nnfOt28u6C9GDcrP6ltr5VoOUhu/DtuXe1SjPoKex018Qh/xI24h+5dc9FapVYinBCZcUp2K2N4V45ZS1Fwf3AK3pVcc1dP4TTg/xjzma5D3cp/LNEvXPLn5Pcmz4gHrapkRrukpjaWevAJ3PuFI6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9932.eurprd04.prod.outlook.com (2603:10a6:800:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sun, 2 Feb
 2025 00:50:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 00:50:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 02 Feb 2025 08:49:13 +0800
Subject: [PATCH v7 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-imx-ocotp-v7-2-5622ba16451d@nxp.com>
References: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
In-Reply-To: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738457363; l=9131;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Anv2VHTrQ5YUO8Yumr43PlFx9MaHLgFhhdjS8Z8e8PQ=;
 b=bSH6+RucaywdNuNKB8F+CLm2LzVD4XQsZWbKpGryj3uYnPJBywod+P55qzB73EYpoPtSo76wK
 ZzWK8RjEwOEBIzuJS6R5+kX8eDKGtjbhEPgqOBOkeK18Xx8wReyM4lu
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a2bca7-9732-4cdb-e943-08dd43238b22
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3JJZjJwV1B1RzNPVkl3TkJrU2NwOWJJN0NzMlNVZUlhYTFxNy9xa0s4MTVY?=
 =?utf-8?B?S09HbU8vSlZ4VXlBVHg2MUdzOUNBYmFsTUJLNzFDWFRXWGtXY0lpY3ZoeExM?=
 =?utf-8?B?TnpoWUpJQ1gwcGVxQWxYdnU0MmdVOXd5MUNDZWt1a0VwUXU3RGdqc1RTelA0?=
 =?utf-8?B?Qkxyc1NjZFRZZVJmS1FhWUt0L21JYkJLNmtsN2NrbGlIdS8xdVdmdDltSm1V?=
 =?utf-8?B?Rk1Dd05vdWZSbHZVbE1lYzRUd1NaQS85bVJlanJZRUFiQllQOUUyL05sQUVl?=
 =?utf-8?B?T3cvZWFZc25Lb2tlWlJDRWRDLzNTTk9VZHE5MEthUUVvelh0Tlp1UjNZdmta?=
 =?utf-8?B?UFA3ZXlRU3Q0MVViU0dueWpQeUV6SThRQ2hyMGZDank0U1dZKzUvUEhKNnJX?=
 =?utf-8?B?QVpNQjBBVWpwL09IYStJR0d0eStUa0w1MWhRU011VEtpNW80ZWZIdDN3ZldK?=
 =?utf-8?B?SjZNS3JjYmFYZEFPTFgwZzIxWU9hTU9Bb0pnTVRnaUovY2hEVk4zeUZhdGJJ?=
 =?utf-8?B?WFJMZmY1OWJjdnVxL1JhY3J3NkZuZUlHQWlSV29tRk9jcTB1SkNybGQ0VXhy?=
 =?utf-8?B?dG1YckM0dDVOZGxRcG5QOVdScm1KNCtvb3JuUFhUWTJLcTdUZ2x4eitET2JE?=
 =?utf-8?B?djdKbEIvVDRMTFZjK0U0b2RPUVhPNGpETUtsKzEyb3dLSVM3TXVBWUdhZUgr?=
 =?utf-8?B?ZGhJNks0WENhVllNblI3dzhtTk4xZUFTKzY4b3hla0FsQTdMd3RySjYzQjRz?=
 =?utf-8?B?Wlp1Z0tHQmxOYlYrOGxRMWxQL3ZuU21RSVl5UG1NUjVXY284NWRmc2xnQlVj?=
 =?utf-8?B?NFZhczdqTU0zVW4yYUNhMlEwV2lvanVCYnpjd2hOckE5dkhxQ24zNlYzSkYz?=
 =?utf-8?B?cWZJSDJ2Qjlvd1FESzhRRldNMmFQeU9OYkI2clFaNTJDWUZsaDFsMzR0Q1Rz?=
 =?utf-8?B?dTdTbklHNVJsUm9BZXA2Q3hBZ3U1ZUxSeHl2ZkxuVXNLUGR6cmlQNHY1aW50?=
 =?utf-8?B?R3VRN0dKbE1vdlpxdEg3Y0c5RWF5NlhQRHRUcTFUcWFSdXIzblpwUFFsZmtI?=
 =?utf-8?B?djIySytTNDgwc2ZOTVNYalZpNGdMSXIraUd2Y2NaeWN5ZlVBZFJKbVdnK2N1?=
 =?utf-8?B?K3RhQVlObE1NWVhsZ0l5anVwYjc1K0FTam40dkMvQmJXcFduSVlYZURrSUVU?=
 =?utf-8?B?NEc2Zll3MklGZDNlWnRYRUhCY2hXN0NmTElFY215UnpJdXpKN2UwOXdmVGR2?=
 =?utf-8?B?aFMwZWx1ZlB1elpUMmltbEJIdW9GNUtFT0wyTTdKWW5FcWxRVUdVVFlaYlFl?=
 =?utf-8?B?SnVHeE1mblV3ekhkWW9QcHRnSEM4dWxFOHovamFJcGZxeUdQb3dZcHNOdXpw?=
 =?utf-8?B?UlY1T2tHOGlYRHpXdzBaUFU2MWtuVXZ3UGZ5dWRtTXE0NXlhdHVlRzdBc1FQ?=
 =?utf-8?B?L2NiUitsZnhISTY0bXRzQ1ZQY2VHSGNjcEY3SE4rMWtrL3N6WnltaWpMbGVW?=
 =?utf-8?B?Mko5SExRVkU4TE04dkVhS3VNY2g0Z0NHUXErd1lJWHVlSXN3MFdUSDVjR1Jk?=
 =?utf-8?B?UHN1azA5R0MrU1NpY0xWNTFRV1p0dG5Sdi9RMjM5dWdzNityZlp5TWNNWE9y?=
 =?utf-8?B?SFUzTW9VTmp6SzV0TUh3d0h2QlhjNDVuNksrUlY4dUJUOXVvK0tVZk1UaFVw?=
 =?utf-8?B?dEtzc213VHRjeDgxb1hxUlNKRWhLcWJXMDZVWi9DRmZYU3o1ZFVBM3FkRTBW?=
 =?utf-8?B?LzIyS2ppUS84NWNPVGQyZFpaYmpuYXEzcC9tbTBUWUoyMEYycCtSczdWcGt0?=
 =?utf-8?B?YjJ0VTlHRmxkWWhXWW5lb3NpcVhmTHJWV1dRbE9XTGdkcmxiRGE4OWo5cC9Q?=
 =?utf-8?B?WU9wcGE4d2R6RExkbkVSYmpJUWltUjJsNDUyVFpXNTliQkJYdTZHM2N5bk1C?=
 =?utf-8?Q?g7Y/HDQG2KvGnBTubWbThL1rUhNLYNZM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTZZSkxDVHFoa1J4SjB4OFZIUXJxSVRNeVgvZ0dzUC9US3ZRMWZCc1pFdEc4?=
 =?utf-8?B?ZGZxR3p3OW4wMllpaWFzS1JMZ3BMMENHRVNDbzNIY3dPTTdaZTI0R1RTSGhG?=
 =?utf-8?B?UExGbUxvUFYrdzZacU1PUG9kZHBRZnpIWDNPMHR4NzRCQUxxSkxwWmVhelhM?=
 =?utf-8?B?TmlhU0RmTTRUTERLaFArNFpLVklwWWY2K0RCanlQeWZJUUlnZEFsM1JIT2J4?=
 =?utf-8?B?dXl6NitpcSs5VXpXajQ0c2gvcmZDbzJaek9PSVJld3JaaTFiRGtwYlN1T3kz?=
 =?utf-8?B?QmxURjNjN2xPMi8wZFExenJQN01qTVN1OENTL3BxZ2ttTlY1NCtBdXFrbjlG?=
 =?utf-8?B?aW9XSE1xS2xhd1RBdG5BcWo5WlVad3Yva3o4K3JnT2hEV1NwenlWV3ErbU51?=
 =?utf-8?B?K0JTZS8vMWF2NkN3T2tFTDI3YzBsay8yNW5qNjkxUjZSUU9nd1FRb000MHgy?=
 =?utf-8?B?STJpeU1LTnJWVy8zUHAxVFV3SzZIakc0NXR1eWVLMXo2N0ovWHdJSEIzd1lF?=
 =?utf-8?B?SUNCL1pOSDVnOTcxSGdtRzJ2WjJtYzh2RW9tMmk0S1oxRHgwQmx3UEdvSnVF?=
 =?utf-8?B?YjZRNG1kUi9JdWt5U0pJYlF4RkoxMVVDb2Y3bm5tWG9xcm5hbDFGZzJFZXNX?=
 =?utf-8?B?MkM4US9JMXY2NzVlL0w3c3lLNzcyZ3hvTUhIMFRwMHM5U2lxTjJ3RTZWaW95?=
 =?utf-8?B?bjR6WHd2aWdmOThoc0lDeUFCbjNjdkNjNEZYWUU2SVYyL2dNMG5qaVdjZkdw?=
 =?utf-8?B?OTV0b2ZFcXpQdm9ubE1JVW9FM3FIc2t0MXNpTDBkNWtUdkZoYityUkxFdHI1?=
 =?utf-8?B?VkZZRU9Za3BiQjZ3ai8wM2hrWFZoakdPWFlzYzB5MWllUndUUVhHUFl4QXdo?=
 =?utf-8?B?dDVERjlKNFVKWHozb1Z3WHV2WUdiNmlFZGp4RE51RmFCSDhVbjVFSWtuNWVt?=
 =?utf-8?B?M1BCeHVHRlhYcElaM0E3UUI5VXp2SWFoVmFnWmVaTlJ4NEk3QzRZSFNGNDFw?=
 =?utf-8?B?UXc5L04vV0NKOEpadHhndWo5OHNWTEZtcTdvS3RrdTVEWk5QaktzcG91TXFX?=
 =?utf-8?B?Sm1EQnFjcHM2b29oeUNrWlJJaTR6QXpiTkN5bjV6R3IyamtFVVV4VE50dVB6?=
 =?utf-8?B?MXh2dXErQUhhUGFISlZ2SGVhaVFOcExIbUxTektFVmZHRC9ORHlvSWtwODlT?=
 =?utf-8?B?YU81eHJNNUd1cUFGKzNDUkk5WmE3Rko3M1pzd0tINW44eGM2R3NZangxbGQ5?=
 =?utf-8?B?Y1Y5UTVzVXlDU3RaT3JKblg1UWRMbWp0ejRiTitwTW9UbU5xUGZ3L2dtVFp1?=
 =?utf-8?B?SU1jOUpqSi9OY3Q4YlBWTlVxTzAwSHZEZGRFMzN2c3AyOE1kUHJRb1AvM3E0?=
 =?utf-8?B?aUlkL1BySXFWOHlhM3FHQ212OGRKVUJWY05sU3J5aDFLR3p4WFpieTVjdGR2?=
 =?utf-8?B?YnNUOUJ0NWdQelNpeTUzWlZyMDZuTHdYNGpIbXpiTno0VHIxMVROU3ZWRjhG?=
 =?utf-8?B?a3dqc0NDN25KWG0rNkJKaFgrb202ZXZEQkNqMVNtOWt1SWc1RmhkbHlUUEtS?=
 =?utf-8?B?UGxtNjlOc2VZd294WEcvTFVZdm5XblI0UTRwVWhGRnkxY3hSZHpxeFl2R3RM?=
 =?utf-8?B?Mk82ejF1UHlOcHEzV1h6eG0xczBFODZpNlViVzBuWDZrUmFJdUtib0xhcHBq?=
 =?utf-8?B?SWtXa3ZWbHBqeEpuN0R6WkZES2JTWm5UVW50a0hPSzIrNkNkQlVOUis4QXZo?=
 =?utf-8?B?N2ZmQ0JndHF3Y25VMzh2V2w4M1VJaCtVaGhTaGtidys1UkNNUUcwQWdZbjRP?=
 =?utf-8?B?WDhvWDJQTUtzTGRIUlJnVlFKUDEvMzd3c0VKOHZDVEdkRi9DbFVwVS96MVg5?=
 =?utf-8?B?NlE1LzdNakdYL2l3NEowaXFac3lROVBpL0lwRkVZakRWYXZpTnJ3NTVDaE9Z?=
 =?utf-8?B?d2liU1hZQ3NOMzZZQVVGT1dna1A3SXFMZUFDTER6OXZjd0p4d1NnQVExRk1s?=
 =?utf-8?B?bjMrdFpQTy80L0w2anIvb3ZjelluMWdraTVTNzIrZHRtcVRDR0YwWW1DZjJZ?=
 =?utf-8?B?Y3llTWQ2b2RVWWhjcjZJMXBFQzdRQ1VENnZKcGVQbmJHaklLMklKYlhCam0r?=
 =?utf-8?Q?RdeZAXBUAAPZTN1DljJV7Fbou?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a2bca7-9732-4cdb-e943-08dd43238b22
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 00:50:09.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/A4gYdEPXYeSbgeuVkPIIaOTRZYwTKRJfbu44tZb8xvtSpclDM0xncoh0elUOc1NYvL9bXKB9jSMT+nj/X+PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9932

From: Peng Fan <peng.fan@nxp.com>

i.MX9 OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce ocotp_access_gates to be container of efuse gate info
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/nvmem/Kconfig         |   3 +
 drivers/nvmem/imx-ocotp-ele.c | 173 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1afd753534b56fe1f5ef3e3ec55 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
 	  This is a driver for the On-Chip OTP Controller (OCOTP)
 	  available on i.MX SoCs which has ELE.
 
+	  If built as modules, any other driver relying on this working
+	  as access controller also needs to be a module as well.
+
 config NVMEM_IMX_OCOTP_SCU
 	tristate "i.MX8 SCU On-Chip OTP Controller support"
 	depends on IMX_SCU
diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5f31a3a7530ce942f5abcd51869fcf78cc8409dd 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,8 @@
  * Copyright 2023 NXP
  */
 
+#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
+#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -27,6 +29,7 @@ struct ocotp_map_entry {
 };
 
 struct ocotp_devtype_data {
+	const struct ocotp_access_gates *access_gates;
 	u32 reg_off;
 	char *name;
 	u32 size;
@@ -36,6 +39,20 @@ struct ocotp_devtype_data {
 	struct ocotp_map_entry entry[];
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+
+struct access_gate {
+	u32 word;
+	u32 mask;
+};
+
+struct ocotp_access_gates {
+	u32 num_words;
+	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
+	u32 num_gates;
+	struct access_gate *gates;
+};
+
 struct imx_ocotp_priv {
 	struct device *dev;
 	void __iomem *base;
@@ -131,6 +148,83 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 id)
+{
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	void __iomem *reg = priv->base + priv->data->reg_off;
+	u32 word, mask, val;
+
+	if (id >= access_gates->num_gates) {
+		dev_err(priv->config.dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	word = access_gates->gates[id].word;
+	mask = access_gates->gates[id].mask;
+
+	reg = priv->base + priv->data->reg_off + (word << 2);
+	val = readl(reg);
+
+	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
+	/* true means not allow access */
+	if (val & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struct device_node *parent)
+{
+	struct device *dev = priv->config.dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_args args;
+		u32 id, idx = 0;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 1) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			id = args.args[0];
+
+			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
+
+			if (imx_ele_ocotp_check_access(priv, id)) {
+				of_detach_node(child);
+				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n",
+					 child);
+			}
+		}
+
+		imx_ele_ocotp_grant_access(priv, child);
+	}
+
+	return 0;
+}
+
+static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+
+	if (!priv->data->access_gates)
+		return 0;
+
+	/* This should never happen */
+	if (WARN_ON(!root))
+		return -EINVAL;
+
+	return imx_ele_ocotp_grant_access(priv, root);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -161,14 +255,45 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &priv->config);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	return 0;
+
+	return imx_ele_ocotp_access_control(priv);
 }
 
+struct access_gate imx93_access_gate[] = {
+		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
+		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
+		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
+		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
+		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
+		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
+		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
+		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
+		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
+		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
+		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
+		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
+		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
+		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
+		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
+		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
+		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
+};
+
+static const struct ocotp_access_gates imx93_access_gates_info = {
+	.num_words = 3,
+	.words = {19, 20, 21},
+	.num_gates = ARRAY_SIZE(imx93_access_gate),
+	.gates = imx93_access_gate,
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
+	.access_gates = &imx93_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
@@ -183,7 +308,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 	},
 };
 
+struct access_gate imx95_access_gate[] = {
+		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
+		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
+		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
+		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
+		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
+		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
+		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
+		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
+		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
+		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
+		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
+		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
+		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
+		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
+		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
+		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
+		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
+		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
+		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
+		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
+		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
+		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
+		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
+		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
+		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
+		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
+		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
+		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
+		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
+		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
+		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
+		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
+		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
+		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
+		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
+};
+
+static const struct ocotp_access_gates imx95_access_gates_info = {
+	.num_words = 3,
+	.words = {17, 18, 19},
+	.num_gates = ARRAY_SIZE(imx95_access_gate),
+	.gates = imx95_access_gate,
+};
+
 static const struct ocotp_devtype_data imx95_ocotp_data = {
+	.access_gates = &imx95_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,

-- 
2.37.1

