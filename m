Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012054.outbound.protection.outlook.com [52.101.71.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503B827D76E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419127; cv=fail; b=SpgT52HbUuAcs8TLNB4aptDq/j4HWX5FsqHodBeRV6tYlyV5ajDsJcer20IU3R6kihfFEels9uHpfko0488SMobgx0Z8agm+vmPNG+YpRyilK8Iwv08f5hZRZECzTkA7ZTeloSqoUiD/XPFvPt6VOhhnAb5IiwaKwiHExUvJmq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419127; c=relaxed/simple;
	bh=1VtdMTRkJSMlrPrnI19ku95VN3ULEb8vQYE7FyuqZfA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HdJzeT+swq7bRQ81Cj6c5A/DG3GxcATX4z0+tgKoteZwXj9Yp7fX+iyYXlAYHNd8G98+MYXUz8QXnaVdmmn/JYBQLk9gndLx5+bJhyybKzUwU/DIzWuuDJQMeAr85BwfLxedjII+nGN2tLyf4Ucc+zuCdbA85uF+3fSPYZAducQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r+BvHYTS; arc=fail smtp.client-ip=52.101.71.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r+BvHYTS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqx+FLc1npt9n6PNAcp9iIdnZamR7xYqiiEiMrsteW/g9NZE7LeHyMwCfVW/fnaU5eS1MYOrCgNPI7QMqbNJSZqb2ysL1Grx+eXMnnfwzoyMwHHlkfO0w9dIeQSKodiobDvU/TQL1VCqkMHnXN7oit/fEQ/Wn62De5R/owQMdDmBBwH+Gso5dOa/CTEhwfbJFMeHvL7k0EEd2j103S7J7mnC2i1XQxzj4ifaSVUDuQiUPpiKuOuA5mOOgcsnX1FE8qfmebChKbeYQQWxVJ+u2RrpF4TmexT/RB1dIYGsSUjFNN2ldE8hhyQipT4TM0adYIelrq3NzFkfL7B3iXlJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDybR8F1H7deLN6y6cODSNZqhMfu/x+iNwmPV6atHv4=;
 b=MI74cJ0IewH81xhh9XJ2yYvPhDuQIvSs9Ih8yA4A+fuscXZT4Vz2pXawMo4tIrUX+LSYb4RgFMJV/OYl9AXEKHtb3UGkJmYKP1BhhmQVb9UVsg2iEaA7s7G7gsL/NCd/X538eeKorhdoeAHypYxejp2CzuvuXaRRwlFmDjwmqkoEHzM9A8RckxTII1DrFfm9CYE27WY2oSVDt3QDkF6MhlBtA2y3dB59NNn1QWSfkQC2pJRRfRZjVG+fJKNJE0Thk2+zdN17QGdWc8p1FMg6MNBBuuw4hkRf0esiszba1+MqyBCabFTluNYNS/Whm/A/5L4FhdYXh7CiFz74mk+51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDybR8F1H7deLN6y6cODSNZqhMfu/x+iNwmPV6atHv4=;
 b=r+BvHYTS/hV2O8+XBSc+vzDAxU3aKZioKje/zM0DxA28cA/LWUG4eLXeJmhAJYY5EtzrQ91l2qNtLwbhRI4dzPajYw78P9WqzpiWTyTVssvZ5UHbRsWFIMsD/3bbggse5K5RI/PJj/5W+GTfbejwi4LkIR7O++DcAitax1hhdrBWE5v7nqHMErq//HUdKztl/iM/xSo79SsbzQaAscjuu6yfjOu6WhkqZEFmUF+p+5jMqcd+0MH1147F+l1lnw+sbFil83K9B4U/3xiJDRztVfOKGmkEMn2nTrBnFhyU9eOc0URGfWnnA+MWa1uF48DVsAG8CdJJJLsFGE/px/hU1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB9003.eurprd04.prod.outlook.com (2603:10a6:20b:40a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 23 Apr
 2025 14:38:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:38:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 23 Apr 2025 22:37:05 +0800
Subject: [PATCH v2 2/3] soc: imx8m: Introduce soc_uid hook
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-uid-128-v2-2-327c30fe59a9@nxp.com>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
In-Reply-To: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745419041; l=4664;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=12Ldu6edldfuBUWhe/59tqBnsDWj9xub+uAmN2OMpeM=;
 b=YP30D+UMdeFlUfA3OoSKiHBzSZ1iNSD2hPqOIiAFnTZJ45/ri9Ku3lKTI95Muc+w+hD1ddbQh
 qG/EzoOvpxgAgPHrhs6C4aOKankTpl6TQHN18bj7EWm4NAZ6riqREux
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
X-MS-Office365-Filtering-Correlation-Id: 07b25247-291b-4a30-a3f9-08dd827489b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWQ4WFNQU1JMYkJ2c3lxanZ3MnFHalZidDA2Y3hOZDlpY21oMzc3WlF2OFB6?=
 =?utf-8?B?Q3I5SHUya0tHcDdFWlBHaFNPRkl1YWI3T0RxbmlQSjJmblQ1NlMzZWRpdkVP?=
 =?utf-8?B?dUUzVWVUeGhCUmVGanJla2N5SGtUQ0ZWdEFNNW42Y0lObmptTUxMNXpiM2ZN?=
 =?utf-8?B?RXpHSWhFVHU2SWxQdGFaZEc2U1RtbFl2V1lnek43U0lMUzFMM1c4Mnd0N3RW?=
 =?utf-8?B?UXVnUkNuUGRsbVhxTHB2SjVqWitsT3lBQTB4REYveEY3blVpcjd6VE5hUnlM?=
 =?utf-8?B?UjMzQUdXNDhSM3l0RUlNYzVHOXNMcXB6YlEzM09sRWZaVUwrZUsrV3JSVE9y?=
 =?utf-8?B?Z0dZaFptTkd1bEQvRUlienlEblg3cVkxUUNKSklsSGQrbWp6aFlpTk1abHFJ?=
 =?utf-8?B?UFc1Y3FoYWFaREJIRUp0dmhMblZFY3NaM1AwVGZ1VHB5MTIwb3R6NVlWVU9O?=
 =?utf-8?B?R055OVNpUTR2RVU1T2d4eU5LK1FaNUo4Q1JDcEx6UlZrSVdoWEhON1ZZdzRk?=
 =?utf-8?B?ci93eXVzZU5RQmg4dkxYN2dHaC9Ec1J5bGhFTVlEWnExMWloeWdORnlRdGph?=
 =?utf-8?B?eDVYUlFVQmtwL1BlcVVwb0RCc3dxblltdnE2QVVLblZhcklsRXNqN3BHSVRv?=
 =?utf-8?B?STFkLzNIbG15Qk5wd2RrdmpJMUNWZGRBL3V5cG9uOUs0S0ZHZkdjVS9YVzJP?=
 =?utf-8?B?R0tHMGlrZHJBb0lDTkdyMmNpcEZKbTlGTWcvWHRrTWljaW1WbXNEK2l3aC9E?=
 =?utf-8?B?NUE0WVh3R0hRVHgwVGc1NUdieFdtcTBGakV6QUtuN0IvSzZTVGFUVjBJTE1W?=
 =?utf-8?B?bmxPNFFyK2RkekkvZGI1V0NSRy9EMkNKNWlJZktQYVhabkhycUNrRkdJUDda?=
 =?utf-8?B?SjQycmV4cXphUHVBK21vWjAzd1d1NmpGMDFyS2dCRWFHUktqdGNqbm4yREcw?=
 =?utf-8?B?eW8raitZUE1wdVRMOTMvcFJMblhZN3NXU0pTT2FMSWFzNG9yVmVMazh5b2dr?=
 =?utf-8?B?NXQxR1JneXAxUW1tQ21ZK0x1M0lYNmN5djl4S3U1b2JwT2hXUWtaZjNnUGIr?=
 =?utf-8?B?bFl1L1RFY0xaQlUyT0gzaEk5NUNHM0xpc3JBNU1hZVcvRjFJWUtVdERDYTBh?=
 =?utf-8?B?eUNNcmUzdGYwZWVCc1MyZ0FqTU5vTHZJSGkrc0k0MU1YeTE3Q1VzNER2R2NT?=
 =?utf-8?B?anpEM01JT2Nkczl4ZG40aFFDU0MzZjdjaVd1djUyWHh5Y21idnRhd1ZHaE9E?=
 =?utf-8?B?c0p6MWZ3Qk1DVTlIa2RQYklRb3E3OWg0NkJDd3dKaE14WjBPNWowcDlFWCtP?=
 =?utf-8?B?VGNlMmVPdXNqc01WQjhpZHh3cUNHa3JWSWh4MEVYOFJlaXRZMU1CdlhSNzI0?=
 =?utf-8?B?eHgzdEhpSllCMThNUkZnSDN2bXVpY0xHd3IycFM3RzlHSXA3eFdUT0o3UmJt?=
 =?utf-8?B?VXpyOUhFNFZwM0lUanpyZzdJVHhMeXdnNVhMQVhjR3NyRkc5OU8xa2VHVTZQ?=
 =?utf-8?B?NlJwSkJvTlVwLzRDU2k1MDJPQTl3Y2RjeFJvUkR4cHpFMHEzenBZdzAybDJm?=
 =?utf-8?B?TW8zaldocnJvRU0wOVpvQTZ6d1FJLzZtTGcyUWg5Q2RFNkdTQkV2YlRpczlh?=
 =?utf-8?B?OUhCM3d3ejh5djBhU015cjJ3UUxCQnhRVHFuWkFtT1ZyRlc5NVNPL2taSDVY?=
 =?utf-8?B?TUtJUjVoenE2bzZ5MjBkdnZKQXMwVnRuYU12WkpRTW92K2poTDEvejkxRStU?=
 =?utf-8?B?UUE0aFFVS1hGUDFLUzdLalhSSktTNnRVVDNRSDh1a1dnSUtwb2VrN1lodGxC?=
 =?utf-8?B?b25JN3dsNCtBQkdmclpibCs0MUFxOUZVeHVpcVBGTzIreUZhS2U4OFVHcUNy?=
 =?utf-8?B?Nk5aTWphRktvVnZQREpObVgreXBWQnN3OVBZN3NRT2pLNmJPVXE3bXNhN1J3?=
 =?utf-8?B?Mkk0VjNxK1U4NlBKemVYL0o5NzZleTZZSnNTRWp5dEw1YnpYa3BWWE5tQVJK?=
 =?utf-8?Q?cx7qLERIfe1YtBYtBOuxAWUuZir/F4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVh0YkE2RkNmS29FMTg2N2tpclU1NjdwK0h5eG1DS0NJeWlRKzY4OUNCYno0?=
 =?utf-8?B?clF1RE9wckR5K2xxOWdKTkJFeW1OQkVsMGFRT0NDWldCdEl0dUdZR0tNWmRm?=
 =?utf-8?B?MlFrcTFER3pxUEdkcDJETjJFODhDNjN3eDdlSGsvd2x0ZW5SUVlpWDFBYnk4?=
 =?utf-8?B?cFFCaThSOG9HeHVuZGYxZXNnMFBkVmc3YzZCc0tncHNsSUtJZkNYVGh2czlK?=
 =?utf-8?B?WjdVdWt4ZGlNS01RUk5MUzBUd2VWSGlsNnFDOHZCSnBBKzZNUmtFTnFUN1Jq?=
 =?utf-8?B?MjBIS2k3NlY2elJDTW5lY1l6ZjhhVGo4TFpGek1yYm1yYXAzdzdpdXdFUGZX?=
 =?utf-8?B?Ty9lNklXR1lyd1dHcURvTER3MklrbFp1RllXMk9BQWNWSnVFU1E0WG4zZGZ5?=
 =?utf-8?B?NmxxYm5NUmlrVys5cG1vRCsvNDg0Y0xyeXJ5VzJJcXkrczJ3VFJKdG0wY21D?=
 =?utf-8?B?QXRiYk54cGdmREFiZzM2NzRMUHZzV3M0MGpoUDRNZ1QyQm10S0dINGZxbHVk?=
 =?utf-8?B?RDNuVEtiYUhDYVVSZ0NNeHdXUldTUFNiMTA0YisyQ1lGOCtleGwycytKL1NV?=
 =?utf-8?B?NGlBaDVDT0hrdVEwODhVYnRSbmlVUXdndlRZN04yRTZRL1VTYjIxMER3N3B1?=
 =?utf-8?B?UytTT0JDRXBXd1NGZ0R0QkQvSkZxcnVmR2hmbXU2Mmw2YnJDTm9lMG9PRzE2?=
 =?utf-8?B?TnRKTlRqYklSa0p4bVY1OWZhWWczTzZEdEV5Si9CdXVOTnNtelZqYk9kd1Zq?=
 =?utf-8?B?NitzYXdlN0M5T3pTRG1HczNCYWwyYm9PYUhUTnlDN2xJTVl4T0ljYTl6TFoy?=
 =?utf-8?B?WmFHdUtSWDRYbm04ZXRicjE2ZVpqSW9OOGxES3JzWVlLTjNMcHZEV2o0ME5l?=
 =?utf-8?B?QlBwaDlNMFpHOVNSV05sQWwyVUYyd3htSkwvWUZoc0pFSXRTRThRV0dNbks4?=
 =?utf-8?B?WG04Z2tpcVkzRXg2RXlESEhYYU90UlEvM0N5K3FyUmo1djZSNFg2d214dy9Z?=
 =?utf-8?B?WmFqblFLWjZkZEpBZE0xTmVpTVVNcis5bmlHVjhtN1ZBRVJtRkxWeVRDWjRM?=
 =?utf-8?B?ZjNwdDhGNjdINFBvVUNBdUt3RlBJSm1MdFBXYUxlVDhFSmlJb0ZmRUdQZkVq?=
 =?utf-8?B?Z3g5b05oRWFoQ0R5QW9Ba3lYak4yNkNaQTBVZ2dpQXFzbGtUMjlVaXRrK0xX?=
 =?utf-8?B?Ums1YmM4SDNDdHlMdFZmb2Vjb1NkcUkvemh6cXdEWERaTFRjVDZyZnNqVjAx?=
 =?utf-8?B?SGRwTzJmeDd0SXhoWjZld0pscm1CNHNzNE02Wm9NbXZMamJXSjVhVzRvUkI3?=
 =?utf-8?B?eFZ1Mkk5Mlc4bEVmby9YZTFVS3V5VFpMZjRPeWtxalhOSjJCMFAwRDJmUW43?=
 =?utf-8?B?endsSUxUMVB6MW1ZN010RGx0WERTQmlyTS9lWVB4dFZaZ2Z3R3FLUmpyZzBG?=
 =?utf-8?B?NkZXZlZkRlhJUm8rWkszYlQ5dDhVTisvbElZUHpCT2d3TkxuVnBTNW5SaHhL?=
 =?utf-8?B?WjN1N0k3c2pFMUt6ZFE3QXpUUG9CMW1RRnN6T3JiVHBNcm91ZG43Qkk5dWpC?=
 =?utf-8?B?d29DdjNjZlNBTGZ4L0NJU0ZRYXN5TEREaEJlYnVLQmswaWRXZzNiZjZaMERR?=
 =?utf-8?B?YUZzZmhOdzVpckh2VHZJT0NSTSszeWNHengzZzM3cW1zQ1VHb0FkWGp2L1Zp?=
 =?utf-8?B?SFU1dnZpQlNVRUF4Y1RrbEI0NXk4TU9odGFpYWNTZGdVa0MwT3NDU2xlVldt?=
 =?utf-8?B?QlhDZ1l5LzE4QUREeGtnZnRkbUhJaFJobmpSSmM0VFlodWZoK2NObkpkNzFy?=
 =?utf-8?B?WXgyOHEvYjJMQ3pBbDFDclpud1EzTjRWTk9RTUtFR21QUm50SkFzZXYxT2xW?=
 =?utf-8?B?MkdVZVhMTXVPMlZOcEpKVjArdnA0WVNUamxWWlR5dmczOW5hK1V4RUY1R2FP?=
 =?utf-8?B?SDRLak9pd1lkZGdnQ25zTDN3RHBYWXBFNG8xNXNpRTBRVkgrVkJqblJtSXRx?=
 =?utf-8?B?Ykw3V3Q5dmMvNlE3OWZ1WkRjYVhzY0NEYlVoMU9ZdFU4NlN6YnBWTm5XaTAx?=
 =?utf-8?B?NG1xYm9oeFBDenBRM05yMTZpOWZkM0xsVmxVeXFYU0Z4U3hyNldtTmE4cU5Y?=
 =?utf-8?Q?Eres0m0DyFBtWcuegflcO+6Vh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b25247-291b-4a30-a3f9-08dd827489b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:38:39.6268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJTIDZWv6F+iX3e+5toFf9W3DYK6quH9OawsW8Owi2agHesTFS71JR+o5O1EfsmlJZJZkQTr7tNILKB4TlgrMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9003

From: Peng Fan <peng.fan@nxp.com>

Cleanup code by introducing soc_uid hook, i.MX8MQ/M/N could reuse
one function imx8m_soc_uid, i.MX8MP could have its own one.

With this patch, it will easy to add 128bits UID support for i.MX8MP.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx8m.c | 46 +++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index c4879947dd2d6573854bce86b86a97159c19a875..2186f6ab3eddd6c9369c691c845b3b78acaabe23 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -31,7 +31,8 @@
 struct imx8_soc_data {
 	char *name;
 	const char *ocotp_compatible;
-	int (*soc_revision)(struct platform_device *pdev, u32 *socrev, u64 *socuid);
+	int (*soc_revision)(struct platform_device *pdev, u32 *socrev);
+	int (*soc_uid)(struct platform_device *pdev, u64 *socuid);
 };
 
 struct imx8_soc_drvdata {
@@ -55,7 +56,19 @@ static u32 imx8mq_soc_revision_from_atf(void)
 static inline u32 imx8mq_soc_revision_from_atf(void) { return 0; };
 #endif
 
-static int imx8mq_soc_revision(struct platform_device *pdev, u32 *socrev, u64 *socuid)
+static int imx8m_soc_uid(struct platform_device *pdev, u64 *socuid)
+{
+	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
+	void __iomem *ocotp_base = drvdata->ocotp_base;
+
+	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH);
+	*socuid <<= 32;
+	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW);
+
+	return 0;
+}
+
+static int imx8mq_soc_revision(struct platform_device *pdev, u32 *socrev)
 {
 	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
 	void __iomem *ocotp_base = drvdata->ocotp_base;
@@ -73,30 +86,24 @@ static int imx8mq_soc_revision(struct platform_device *pdev, u32 *socrev, u64 *s
 			rev = REV_B1;
 	}
 
-	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH);
-	*socuid <<= 32;
-	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW);
-
 	*socrev = rev;
 
 	return 0;
 }
 
-static int imx8mm_soc_uid(struct platform_device *pdev, u64 *socuid)
+static int imx8mp_soc_uid(struct platform_device *pdev, u64 *socuid)
 {
 	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
 	void __iomem *ocotp_base = drvdata->ocotp_base;
-	u32 offset = of_machine_is_compatible("fsl,imx8mp") ?
-		     IMX8MP_OCOTP_UID_OFFSET : 0;
 
-	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + offset);
+	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
 	*socuid <<= 32;
-	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + offset);
+	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
 
 	return 0;
 }
 
-static int imx8mm_soc_revision(struct platform_device *pdev, u32 *socrev, u64 *socuid)
+static int imx8mm_soc_revision(struct platform_device *pdev, u32 *socrev)
 {
 	struct device_node *np __free(device_node) =
 		of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
@@ -113,7 +120,7 @@ static int imx8mm_soc_revision(struct platform_device *pdev, u32 *socrev, u64 *s
 
 	iounmap(anatop_base);
 
-	return imx8mm_soc_uid(pdev, socuid);
+	return 0;
 }
 
 static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_compatible)
@@ -156,24 +163,28 @@ static const struct imx8_soc_data imx8mq_soc_data = {
 	.name = "i.MX8MQ",
 	.ocotp_compatible = "fsl,imx8mq-ocotp",
 	.soc_revision = imx8mq_soc_revision,
+	.soc_uid = imx8m_soc_uid,
 };
 
 static const struct imx8_soc_data imx8mm_soc_data = {
 	.name = "i.MX8MM",
 	.ocotp_compatible = "fsl,imx8mm-ocotp",
 	.soc_revision = imx8mm_soc_revision,
+	.soc_uid = imx8m_soc_uid,
 };
 
 static const struct imx8_soc_data imx8mn_soc_data = {
 	.name = "i.MX8MN",
 	.ocotp_compatible = "fsl,imx8mm-ocotp",
 	.soc_revision = imx8mm_soc_revision,
+	.soc_uid = imx8m_soc_uid,
 };
 
 static const struct imx8_soc_data imx8mp_soc_data = {
 	.name = "i.MX8MP",
 	.ocotp_compatible = "fsl,imx8mm-ocotp",
 	.soc_revision = imx8mm_soc_revision,
+	.soc_uid = imx8mp_soc_uid,
 };
 
 static __maybe_unused const struct of_device_id imx8_soc_match[] = {
@@ -240,7 +251,14 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 			return ret;
 
 		if (data->soc_revision) {
-			ret = data->soc_revision(pdev, &soc_rev, &soc_uid);
+			ret = data->soc_revision(pdev, &soc_rev);
+			if (ret) {
+				imx8m_soc_unprepare(pdev);
+				return ret;
+			}
+		}
+		if (data->soc_uid) {
+			ret = data->soc_uid(pdev, &soc_uid);
 			if (ret) {
 				imx8m_soc_unprepare(pdev);
 				return ret;

-- 
2.37.1

