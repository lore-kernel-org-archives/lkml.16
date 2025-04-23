Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012054.outbound.protection.outlook.com [52.101.71.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719021FF4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419125; cv=fail; b=Xp4554ZKTfqcNAQX0ed2G9sgF+1K1+T3BLU7K9/XudLB3ZOft28LEYeBnFLdUj+apIvQvdTCkac61pHt2s7ecQvt5/2imdqNZgRMdr1mnUPf6qi8/TVFHsEcWoyeBzHHoW5kk/M1WLBVk6vhMlx8lKBwqsC0BY1drSguPnAu2l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419125; c=relaxed/simple;
	bh=RgClzDEPzF98dZb5wNlSJi0VJ/Zx/bC+7rhVIacgGK0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=riKADr6a2IdMrvUVHWBtuUWpYFiOwF+5epqYkGAI24vkinyy414D1dsKe5n/fVS/8r/bjbWqn7CI1q2Jhn55RAHmhV3mWllYI3MSCddhGAlakQ+bMVhBSsnipVZ+nu9vz+37t4NnkPv1jujFN3Q/JA+LJBLM9bmCzTWwAn7CW6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fdUmlTOx; arc=fail smtp.client-ip=52.101.71.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fdUmlTOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNDTRdkmfAgQhzRDDPZ5nZqnSVfzX/TRXKC58aaflBTBw/rhTFcQ5jk4qj0KfrYK9yB54JU5JIp+6FOQI9KHRz2HZ5uuCN1u6NE8034ja70v9M1KfWplzQyFN++3jfZc0VmH4SwDc7minmIyfyTivGEG8xlCXriFPuoXEAmp6EXasXMy1UGm8h1J4crE2oyl9cG9ZolyjX05gXPWZKXr0xsiAVVxo0Ougs4irppm+2eikyvxcQEOAZ54l4/6vAQDuDjOGMfTVwJziS/BXi4W7Zc5idamSkKV/PSx35jaHb6unpjShebJrRnI0jmkbzUuf0je1aoighQCUAFOyGkgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mddRfTLa50H9WDE9X5iRHP5Fux/We5Oca38SUukZbo=;
 b=NebhKZo9DrP42jIJs/Ts4dhwVDiyfKSzkFm0jO966QfxpzNVgAvhJZWti4O9MRWm2RdHA0Bt+RnyY/vAHYLEWCXokZFsJfCcXTGBS2qfoFtVGgJUHNYItREXD2Oubc2fZA324SsAA37McLUFSMZxmRUqi3ms9jrzlVPpJEaugzYhpVVjDh93T4hhJ5OiHQfrzTx+qcT42vi9/hOhlg/JJCbQBXY+4iUsxReb2KSZ/uF18Oqh+ns/y6u0BPbQiXwOlU0nYkZkJ8HWrnHHpwDdz4x5fun2xw85oOzAu7FiHnsTkv9Cn6AlNMtqg34AQg8NQvwNJuPwBBO6zXHbXihcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mddRfTLa50H9WDE9X5iRHP5Fux/We5Oca38SUukZbo=;
 b=fdUmlTOxXLi1LudNua+KytxObrJNK31e/IOJ8ErPX9o0zSmkYzpwBXaaS4ONZDRGK2iM6CNeoIeeNFZX7oTIbHrdqekBnGr0vNM/VCkggqjKkB6yjDl0e3GO5fGq5J4xrXFdbjcx6D3P6UfSfW7Op+O3g3Zh+9J2gmh8T5U9HRLyZaCbIyEme4gH9vcyA3zdmdc4f56Rnv0GVsXGZ1g+0JfQIOpWgJqZgjhyspWE6exS/7BPr+NK/lxOIOxl0ySr08arevjkZPk/RoHAzR4SeLClq6VREQjEMkwEzokw8WWn4+kkCPAYwtwOkPmibA/tI5mA86WtLc9JioYl0vVjFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB9003.eurprd04.prod.outlook.com (2603:10a6:20b:40a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 23 Apr
 2025 14:38:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:38:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 23 Apr 2025 22:37:04 +0800
Subject: [PATCH v2 1/3] soc: imx8m: Cleanup with adding
 imx8m_soc_[un]prepare
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-uid-128-v2-1-327c30fe59a9@nxp.com>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
In-Reply-To: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745419041; l=6731;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=kOB9a1d5DUOTsvMVEdbr+GlhlX3umR8H6BJ8hk0sq6k=;
 b=r8vOPBaZywmMPpHnNI85ZQmFhJuv5BWL7orNTjKRQhXFdWneoQeb5HlfAw30/krno3Xk1m+7u
 VQ7MZXlv5Q6AJ6t0scWy6vxYjEP0Sqp7HrRPvVhdOWnTJS31q/S8CPv
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 6740e5d2-d661-4e14-ee12-08dd827487aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OSttV08zVDUxMk1tUlNaaXc1cys3ZHAwQmRxWTB4VUFzY3orbUt2L0g3L3NK?=
 =?utf-8?B?M2pOVHpPSExmYUN5a0hPZnhML3RpOFRQS2FHWmtZVE1SSUpqdWtwT3NuTVpR?=
 =?utf-8?B?ZHFTd2p1RU5pK0pIdnJyMm96R09acTl1Q0dNWjF1RHVUeWJreW10dVBRdFpT?=
 =?utf-8?B?clNSOFcxZ3NNZU41YkVDTzVidzhpdm12c0hQcDAxV0xYNFBXYjJFenU2YnJw?=
 =?utf-8?B?ZnJUZS9hck1JTHM2ZE4yNjhMM3lEMlBmSGkyUm5wcm5nbWJKL1JmYTB2VWIy?=
 =?utf-8?B?aWpFeGYvWEtjNmZNVUZqLzFNRW13U0VOcHEwZCt3SVdoWGRNSFJkbVlrdTMr?=
 =?utf-8?B?bkVmZWNHTVZ4UkxYY0lZMlB0QTRyNnZSY0poa2UrdDU5aEdZY0RIcEV2bDJD?=
 =?utf-8?B?MmFMVitvTllJOXk1eG9oNUZXMk1OcnN3QkhxREQ3NU5STWZvejZEdVJ6Qlhx?=
 =?utf-8?B?bE9SL1B1cS9BUmpYeXFRcjdaMnhYOG9peHcwTUEyeCtKSS9IQmQyRE0rQTZD?=
 =?utf-8?B?ZVlPS3pQTnNDWVg0WWVjQUZEVWtDbzlrUlNNSkhKeGQ5Z3ZKOUdYS1VpclJ3?=
 =?utf-8?B?c1llU3U2c2JPbUNqM3ZEbWJOWjVFbHdLNEEwU1NhUE9pcWlseTg5ZWRrTVdu?=
 =?utf-8?B?UWxHM1VpNU1ESFZNR0xkdUF1YXJmcGpXTEdEL3VoSy9zQWRCNnlwUmVEMjYw?=
 =?utf-8?B?R0U1TkVBWm1IMDdNSFdPK21lUWlBejZJT2p3dm9hbndjRUV1OVBabFpqbzBG?=
 =?utf-8?B?MUxhc1RXUWZqSHVGU09LbVJlWWVGWHJDV3c1a2NZSE1xbGVUUW8zeUZZZmp1?=
 =?utf-8?B?N0FHTlVyam4wU0YySEdMTXVldkxjQ3ZXZVBLRW9HOUpsZXc0Q3V5T3VWc3hl?=
 =?utf-8?B?YTJURGVqbTBjYWdCKzZjamdaZ2hpd0tVTzE3R0R4d1hJUzZaa3JHbFlQMmwx?=
 =?utf-8?B?UzVFOVNuQVhzVWphcGdvWm1wY01sYXRWM2E1L3NRTVduWDQ2bWQyQ1J0bldx?=
 =?utf-8?B?V05RVnhoSThJbHJmWll6MkVEODRyOTc5b1liM1pXdGNXK2VTMnBzOCtIRkEv?=
 =?utf-8?B?VzAvSmpaRTU0c3lGbHNtRTNlMU9UTEs3ZlFYSDMzUXNWRnVUL3dMbklxTHJz?=
 =?utf-8?B?Mzc1bzBHTTVxLzlBRFdEeVpiK2lOU1hBei9OSGN3ZWhtQWg2Y2t6V2FtS1BW?=
 =?utf-8?B?ZzNpdnIrOU9lQzYyY1F1cTgwQmE5eXp5NG5zZ2Y5cEdhZG53VUNoN2psb2gw?=
 =?utf-8?B?YThGemRnQ0tQZ05TRm9ZMHJWM1czMWlQREY0eWtqWUd0SUZlcnlWWE9GenpP?=
 =?utf-8?B?d2w1TTJKUGpHcEhiWE9rTWxJQ1RJYUxmRGRkQW5WUGo3NVpCS2NyaEV0N1hZ?=
 =?utf-8?B?V3VxbG82OVVXV2hLaS9YNE9aRmxQSkNJUkhjU3IwWXF0Wll5aVNhT3VHVEtO?=
 =?utf-8?B?SjZPY2NSdGJxTFI1dktSQjUwT2dDTGRkWEM5NEhEZ0FQcGZnMURVRjBoSDR2?=
 =?utf-8?B?bDhLRGRzbnZPblVKL3ZkNmVkdkVKYXMrcUpreWRlcER6YzZZL0Z4TkM1V1FP?=
 =?utf-8?B?ZDRqNis0ZEJ4Mkh6UTVEaWNmcUZvNWt3L3NCNnhJc1FQVVY2OEtHcjI0eUE3?=
 =?utf-8?B?YmE1c01PbFprZlhNS3kvaVF1OFZIOCtlUlRRbVYyYXJrV1ZUVGp2TXlOUmlK?=
 =?utf-8?B?Tmk0VCs2ZWpFeVAxcUxUcG1JZTN5elRnblB4QnBBaHUwak8yNTNWOWg1NjlS?=
 =?utf-8?B?MVhxU0JjNGhwbHIyMWVxTzhmc0ZyUVh5UWVVMUxwZGM0Wk1YY01zTnpzMTg5?=
 =?utf-8?B?cG1XWFVKcGgybGdPK1JJV0M1TzRXVlpvVFZKS0pjZ2crTFdQZnpRRlp2Z2ZW?=
 =?utf-8?B?bnZGUFRQWENzR2ovYjZxNHpFQnBBK1hBZ2EvbHpNTlpFMzJ1VEZQNHpodzJE?=
 =?utf-8?B?d0dtU2JLOEg4MUVsQjBER0JCNi9ROGNvQlhTYTRWWHd2cHNUU1Q5cXVWL2lo?=
 =?utf-8?Q?rFknjjIAAq4IL/IW/a5XkJYQc+ld+8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU80NC9tYUtPYXdUUW83U3JtSHkxaG4rV3BvcjBrZThGV0VGQ2x4TWhnOU8r?=
 =?utf-8?B?RUVPMW9MTXhmY3VjT0F1RTBNcXBvWjJTbE5EcEROSURxR1pjbjJYL3l1VUdG?=
 =?utf-8?B?T284bmgwMHpQZkVwSEV1Yks2dFNNa3A3amsxU2E1UC84Y09FWmRZeXlkeFls?=
 =?utf-8?B?QlZCYVZvaldNaFk2ZGIzY2Y2R0xVQ2pNYzlaYVhrMi96bHE2ZHNxYzJEaG9y?=
 =?utf-8?B?Q3NTZmt3M2ttRzVsREcxRU9tbUF0YUlsYWNNeVVjTnBSTDJzbnJoNTlJSEFN?=
 =?utf-8?B?bEVKZi8xbDM5MmdLL0gxVExwcjk3QXNUMEVwYXhQZVBhUVp5RUw1aGh1TWNO?=
 =?utf-8?B?ZkZFeTZFU3R2eTV5d0d4Lyt6c1JtSWdOaC9HUVJlNVQwcVNYUU5hS2VGZE5G?=
 =?utf-8?B?NE5nVDlucmN4Vmx0NmtacUUwUUM4bEJQN1NMNTZKOE9Cb0NKbUJyNk94KzhS?=
 =?utf-8?B?bVBEdk9DRTNrRTNLd0dvNUtFa3FOWlFzbTJ3RDJTTW0vcEJZbXBwbEJyQUpM?=
 =?utf-8?B?RHRRUGovS0pIdUFlQVR0K1ZGRHFEMW9pOVdYNGNhV3pNeUV3NlVMVy9ad0Ex?=
 =?utf-8?B?SndpRzdwQmpoQ3BXd0NiS053RGRzdzloaWdiYUlFNUl4WFF6Vk9pdERDWTBr?=
 =?utf-8?B?ZnNpcUw3ZUpvblEwZWZvKzVUN01QNkUzOXAwU1A2dkdFWDJHdnBZU1JrNDAv?=
 =?utf-8?B?V2p5VjV2ZXhUSU50NjBmKzJrbG5wTnZWZ2NPU2tDTlBUejRnaHVJZ1JOVm1I?=
 =?utf-8?B?MHF6WmtGSnhMVnBXSTUrdXgyOGlHaUNTcS95NjRpUWxhK3YyeHU1cFRXUzlG?=
 =?utf-8?B?K0JzWFR1S1FxNGRuSWlCRU1ZQjRJZ1FYM1MzZ3piNUZ5aGJFV0tjOUlhaFZy?=
 =?utf-8?B?VVg3YWxBQ3pBYS9OdDV3WDFvYTRmSk40UFk0QUQwMWxtR0VDSUUvWHVRU1Nn?=
 =?utf-8?B?LzArdU42UGhJOElZek0vckl5Mi84S2RhRlE0cVNrd0ptUGZMUkZzcWUzZHoy?=
 =?utf-8?B?OC9pSnlWcmh0ejQ5L1YwbE1MdkZrNTBTcGk1enJ3cnk1eGJudGhNdzZkdXZV?=
 =?utf-8?B?WVRyOGgySUUzZkRZdG9veDZxNW95c255aFkvRlFYYmxraFlNRlkrSFJFQVV1?=
 =?utf-8?B?M0JJTlUzaHdFQUZuVktPcWVMY2pheEh6Mlp6N3lFV3FPM2duRFB4LzE3WTRo?=
 =?utf-8?B?cU43cFcxUit3UG9UeFlUUXNiaWhKcUwvUU5TdEZZSlZwY3ZGTGJrc0NVcU5I?=
 =?utf-8?B?R1NpdytYNE9yWk5MTmFrM1M0anhvaU45cFNsaWJRQWxOSC9HY3NvQlc5S1hM?=
 =?utf-8?B?cHUwOHAxVVZScmtMeFl0VFArdXFwR3gxQTNpc2pacUIxd0QyR2VJb2VudUxU?=
 =?utf-8?B?Slk0QVdSM1dzdHgyd1F4WWlNZTFta3NJcGtBNy9QRThMOCtsc25UZVZtN0Nu?=
 =?utf-8?B?QStKMUpDc254dU9BblkwNWQ2SEpoNzNENEMvVXorWGttV1EwUmx1YkdOTnJH?=
 =?utf-8?B?ZUdTZENtdkxyMktQSEZGejl2dkFjRy9IOTVnU2pyeHE0NmZ1TFUvcGxWR1ZR?=
 =?utf-8?B?aW92L2o0dGV4OGpKWGlMSVFGWWlUeXppSm00emQxV09JbXZzYnlJUlgyMzhp?=
 =?utf-8?B?YitPNktFOWthbjBkdWUxdkFIWWFtMmtaR3p5R0VDNzZFUUhabFdhbWhnUlpY?=
 =?utf-8?B?YmR2SGgzcndDQ3JpVUROeHd5SjFlMXJmSDU5NHlrSWg2WG00SG83aTEzWDlS?=
 =?utf-8?B?R3dXeVQ0cWxQRFZQTEs1KzJOc3BBa1ZZaVBZNG1oUFBzRTNkazFLWnZsekNs?=
 =?utf-8?B?RGxVemNJZnhvTnBHUEtoTUUrbFU3ckdsQXJXWEZDcUFHSHNaZHUwcmY2Q21B?=
 =?utf-8?B?VjFON2lRWkRkbmdyOTRhRHBoenRxQitsNWNBU1RMc1V5OXQ2MjIycW9NYmJU?=
 =?utf-8?B?MU5RbkVNZ3dZM21LWWttdXhoa0NTeDNlWk1La2N0N0VUK0FRY0dGSjVsdjJL?=
 =?utf-8?B?dyt1NEo0VmxvNmIxWEFFWllVMVR3dm1TQWthc0FDbkh3SUhnMkRTaTJidnA5?=
 =?utf-8?B?OGoxVHdQbk9LV0xiYmJTaWxJcE9HTHUwOU8xU2Y3ajJSNnZLczk5V1J1OXZv?=
 =?utf-8?Q?Z+ItS01tK/OuM7nqixaNSoglG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6740e5d2-d661-4e14-ee12-08dd827487aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:38:36.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyZAas7vQsAo3vmKooo77iKEfk/GV/jbi3712yPyvqR8eea7T2mzqVsO22yxwmgisGSCjbCrnZj69Uhu3IsyCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9003

From: Peng Fan <peng.fan@nxp.com>

There is a common flow to i.MX8M family, map OCOTP register base and
enable ocotp clk first before read Unique ID from OCOTP.

So introduce imx8m_soc_prepare to do ioremap and enable the ocotp clk,
and introduce imx8m_soc_unprepare to disable the clk and do iounmap.

With this patch, no need to spread the ioremap and clk handling in
each soc_revision hook.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx8m.c | 133 ++++++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 61 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 3ed8161d7d28baa6d87174d19eb61cbc5833371e..c4879947dd2d6573854bce86b86a97159c19a875 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -30,7 +30,13 @@
 
 struct imx8_soc_data {
 	char *name;
-	int (*soc_revision)(u32 *socrev, u64 *socuid);
+	const char *ocotp_compatible;
+	int (*soc_revision)(struct platform_device *pdev, u32 *socrev, u64 *socuid);
+};
+
+struct imx8_soc_drvdata {
+	void __iomem *ocotp_base;
+	struct clk *clk;
 };
 
 #ifdef CONFIG_HAVE_ARM_SMCCC
@@ -49,30 +55,12 @@ static u32 imx8mq_soc_revision_from_atf(void)
 static inline u32 imx8mq_soc_revision_from_atf(void) { return 0; };
 #endif
 
-static int imx8mq_soc_revision(u32 *socrev, u64 *socuid)
+static int imx8mq_soc_revision(struct platform_device *pdev, u32 *socrev, u64 *socuid)
 {
-	struct device_node *np __free(device_node) =
-		of_find_compatible_node(NULL, NULL, "fsl,imx8mq-ocotp");
-	void __iomem *ocotp_base;
+	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
+	void __iomem *ocotp_base = drvdata->ocotp_base;
 	u32 magic;
 	u32 rev;
-	struct clk *clk;
-	int ret;
-
-	if (!np)
-		return -EINVAL;
-
-	ocotp_base = of_iomap(np, 0);
-	if (!ocotp_base)
-		return -EINVAL;
-
-	clk = of_clk_get_by_name(np, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto err_clk;
-	}
-
-	clk_prepare_enable(clk);
 
 	/*
 	 * SOC revision on older imx8mq is not available in fuses so query
@@ -91,55 +79,24 @@ static int imx8mq_soc_revision(u32 *socrev, u64 *socuid)
 
 	*socrev = rev;
 
-	clk_disable_unprepare(clk);
-	clk_put(clk);
-	iounmap(ocotp_base);
-
 	return 0;
-
-err_clk:
-	iounmap(ocotp_base);
-	return ret;
 }
 
-static int imx8mm_soc_uid(u64 *socuid)
+static int imx8mm_soc_uid(struct platform_device *pdev, u64 *socuid)
 {
-	struct device_node *np __free(device_node) =
-		of_find_compatible_node(NULL, NULL, "fsl,imx8mm-ocotp");
-	void __iomem *ocotp_base;
-	struct clk *clk;
-	int ret = 0;
+	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
+	void __iomem *ocotp_base = drvdata->ocotp_base;
 	u32 offset = of_machine_is_compatible("fsl,imx8mp") ?
 		     IMX8MP_OCOTP_UID_OFFSET : 0;
 
-	if (!np)
-		return -EINVAL;
-
-	ocotp_base = of_iomap(np, 0);
-	if (!ocotp_base)
-		return -EINVAL;
-
-	clk = of_clk_get_by_name(np, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto err_clk;
-	}
-
-	clk_prepare_enable(clk);
-
 	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + offset);
 	*socuid <<= 32;
 	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + offset);
 
-	clk_disable_unprepare(clk);
-	clk_put(clk);
-
-err_clk:
-	iounmap(ocotp_base);
-	return ret;
+	return 0;
 }
 
-static int imx8mm_soc_revision(u32 *socrev, u64 *socuid)
+static int imx8mm_soc_revision(struct platform_device *pdev, u32 *socrev, u64 *socuid)
 {
 	struct device_node *np __free(device_node) =
 		of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
@@ -156,26 +113,66 @@ static int imx8mm_soc_revision(u32 *socrev, u64 *socuid)
 
 	iounmap(anatop_base);
 
-	return imx8mm_soc_uid(socuid);
+	return imx8mm_soc_uid(pdev, socuid);
+}
+
+static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_compatible)
+{
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL, ocotp_compatible);
+	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	if (!np)
+		return -EINVAL;
+
+	drvdata->ocotp_base = of_iomap(np, 0);
+	if (!drvdata->ocotp_base)
+		return -EINVAL;
+
+	drvdata->clk = of_clk_get_by_name(np, NULL);
+	if (IS_ERR(drvdata->clk)) {
+		ret = PTR_ERR(drvdata->clk);
+		goto err_clk;
+	}
+
+	return clk_prepare_enable(drvdata->clk);
+
+err_clk:
+	iounmap(drvdata->ocotp_base);
+	return ret;
+}
+
+static void imx8m_soc_unprepare(struct platform_device *pdev)
+{
+	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(drvdata->clk);
+	clk_put(drvdata->clk);
+	iounmap(drvdata->ocotp_base);
 }
 
 static const struct imx8_soc_data imx8mq_soc_data = {
 	.name = "i.MX8MQ",
+	.ocotp_compatible = "fsl,imx8mq-ocotp",
 	.soc_revision = imx8mq_soc_revision,
 };
 
 static const struct imx8_soc_data imx8mm_soc_data = {
 	.name = "i.MX8MM",
+	.ocotp_compatible = "fsl,imx8mm-ocotp",
 	.soc_revision = imx8mm_soc_revision,
 };
 
 static const struct imx8_soc_data imx8mn_soc_data = {
 	.name = "i.MX8MN",
+	.ocotp_compatible = "fsl,imx8mm-ocotp",
 	.soc_revision = imx8mm_soc_revision,
 };
 
 static const struct imx8_soc_data imx8mp_soc_data = {
 	.name = "i.MX8MP",
+	.ocotp_compatible = "fsl,imx8mm-ocotp",
 	.soc_revision = imx8mm_soc_revision,
 };
 
@@ -207,6 +204,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	struct soc_device_attribute *soc_dev_attr;
 	struct platform_device *cpufreq_dev;
 	const struct imx8_soc_data *data;
+	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *id;
 	struct soc_device *soc_dev;
@@ -218,6 +216,12 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, drvdata);
+
 	soc_dev_attr->family = "Freescale i.MX";
 
 	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
@@ -231,11 +235,18 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	data = id->data;
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
+		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
+		if (ret)
+			return ret;
+
 		if (data->soc_revision) {
-			ret = data->soc_revision(&soc_rev, &soc_uid);
-			if (ret)
+			ret = data->soc_revision(pdev, &soc_rev, &soc_uid);
+			if (ret) {
+				imx8m_soc_unprepare(pdev);
 				return ret;
+			}
 		}
+		imx8m_soc_unprepare(pdev);
 	}
 
 	soc_dev_attr->revision = imx8_revision(dev, soc_rev);

-- 
2.37.1

