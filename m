Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52E220110B;
	Fri, 27 Jun 2025 06:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004374; cv=fail; b=PFUSXXXOQmw04FKHXatwSOKcI/Wa3sGy+bOiElv6PdgaHRog+clHjcViKCp2iwkEd36QdN1lE+hAvoK3CdNg7UXEGVVklInKgC54pqzFEi4tUYoK0QW+7sr8xlV4yB+716ou7g1O7zOCZumaKrOu+z8VA2Iszz2z4z8F3lZ0Phs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004374; c=relaxed/simple;
	bh=vWxqoEygzt63mXBOpMnGLtsBu1rMzDKcUC2MsGl/Yo0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SBJVVGlpsKWfgIZv+twIBG5yTKeF9LzVpukV0vJbwrOa6kXLV+ObBDK57FLJOV7VhsttS5+eQBsPhiF50HV8kJoXDsQyZBtzXVPY5KdpgyX+51YysDL3xpNb8x4q0a0uY8kj5CPG5NXAr8f8WviEHlZhycg2CykS8k5WFlojWmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RHmcOkXP; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RHmcOkXP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxNCSPMq/Ey7/rROkQBd3Qum7xqxEsTphZYnUePxc2McUF9z6uKtwoo7JYOJ/TzT//sKqvWGqfYtFEOW5LDnJYkiYJc05QvYlPpkmVwIDygKPDe1CQdsqUSPGphiwNVtbBT8ehaPKx+E14rbT7nOXB/Ut0Sbl8insoiu3gW7SXDkaY/Hwb3BFGHsXPmajigLOSeGbHVm3AM70VSxq0kTnlThhSOockBdk1NQI2FQ3KqyRqIY1OlUlnzZL/pKT5kFPeSXkmHj++zfhWchutp8IXEyx3gZdZD8umGsjonA+z0IvXvsA7b9QeO15/YlGoWSZDidFMAt5okPoMASRI9OMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGMowWSfzmEwlGFrj4P9SsvwpZ0kx3A7cQbRwJOLHdg=;
 b=Rf2QELAULeJq1tmIvFL6t4D86Q9n7DnahpdE0ml4f+nYIXodTtiSscjV/wMGa1e7eOLXgBc3nPRCxPog1cxhgOh1fP/LKkd+DO/3weKwzXp8bo2kDs7vAzitSOnVUrSZ3ogKFSLUqKWUzbqzP3xVz3FjUtlcfO8w1Yb2mI5FjK4TEofYwyINIvHj/pUDUfKBFs74ob6ZZppbr2FDmX13DSNv17fP9dVhw2G/PSae3LNMowoYhDaFhnXXv460f1pR4php5EwcxlMLgta9N2Bz9GT1pOuqxDogWPc9bsHokW4U+ej2tEoVtlkUL+1cnIeMV670COXgG7f601kka60rNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGMowWSfzmEwlGFrj4P9SsvwpZ0kx3A7cQbRwJOLHdg=;
 b=RHmcOkXPc6vX3vWUDscO0KNQv8Mqqe+LEyE1C7XJrDVSHBaBPPouavWlFOfEx/HSWJrOZw7ryiZkGmDEaRZWova4LSlPyeay3sQvMt3yPLb7gc+BvSalV06sE+xYkdJ5BqyQDCsnRtjNbki1jP6n2tzx22/L+nBwPDDUoxgOeWsP9S2rzaSIYkboc9dAR+vhUht/XW2Mt25zeVd3IperHOMq5KbSyILDGTF/j9LOF6HM2M2fD+L9docuS37vkz2zr6pbkz/Jj/eLEGJUzR84zCptDywYA6TgeWq+uNlCprDQcr44qQ7nvZWzmmp0nzsRMblYo9sYbR6rS9P7BxhYWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10943.eurprd04.prod.outlook.com (2603:10a6:150:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 27 Jun
 2025 06:06:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:06:09 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:50 +0800
Subject: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
In-Reply-To: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=3687;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=vWxqoEygzt63mXBOpMnGLtsBu1rMzDKcUC2MsGl/Yo0=;
 b=QQGegho7+yKdsZgJPI0KceE6z/zwWmXXebyaQKTD5vHjlQMf07oXgU74e8yjUFAX1Vek8dFpi
 qmlGDG84T0sDYv5Drk1+rvzVw2v758sXKt8MUduxrJYWEgI2TP/PeK1
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10943:EE_
X-MS-Office365-Filtering-Correlation-Id: 2340c917-9a7c-464c-25f7-08ddb540b5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFpRQnZ2N3RRR3RUN1NzRVhsNjRaTlg4Q3QrUFhEbUV4d3FOVUhtcmdELy83?=
 =?utf-8?B?amN2VytXYnBXSlVPSXllY1liQ09wS2NyTDJOR3N2MGw3aHY0K3A1YkF2Sktx?=
 =?utf-8?B?T1ovUDlIQjRkTlpPcXc1KytZMm1pRVJpRWZZOXlaSXJ1N00vYU14SEdWdVVh?=
 =?utf-8?B?Z3lCbW40MG8yN3VyNXhHTkhVRWtOVzliVytZMXlheTluaGR0aGFkMlBDZElF?=
 =?utf-8?B?WW84YS8ycCtTa1JIcDg2VzlKaTlDeXFmNHRZUkJmRDZBRFRpRklOVWI5cFYv?=
 =?utf-8?B?MW9ISGh4V0NySEpsd3RvZGJMbzBrclRTckRTT1ZsbmJMbUYya1RSemNpS3Nz?=
 =?utf-8?B?a3pQb1lUTnFFM1V5OW1mVnBtcTcrT3B1eUdMUnl1STZDdGJadlBjWVRJbWNB?=
 =?utf-8?B?OVA1NjhiYVJiT3hDT2xEaW9WaVhhVUk0eE4zbW5CeFlNTGVlMitrKzFteXlR?=
 =?utf-8?B?RStQVUJLZUNmRGJDRmpkSm85RWRuVURqNU9KT2kwcTcvRlhyVU5NL1NGTk5t?=
 =?utf-8?B?aE5DTmZWZ3d3cU9pU3o3VDlrMWV5ZVNhZnNxaUhFVmlnNUFTbTdzcjFxUFA3?=
 =?utf-8?B?eDJPK2NWNExZZGl3S0RBNzB2N25qMU00WHN0QlU4cmk1Mmx6WHFZM2xRNXVw?=
 =?utf-8?B?WVBuTVNGb3lUUGpTOTk4ZUdGZGtqc3lKZTBEdzQzR2FudkJCbDYxTE9NL2o2?=
 =?utf-8?B?d2IvWEk3cUhOclNyMDgrZVIrbmR5TGZBYTBJK1dFQXZ2NVlvTkJxVjJuaENl?=
 =?utf-8?B?d1RsTU0xaTNtRktaei9NdUFUbktwOXppYnExWnZqcnlYeFFKMjh0RFRnQkdX?=
 =?utf-8?B?U1c3Y2o5TElIVmg2ZXh0ODJUZ0Z2NS94OEhnMUFEUFlGQmdGb2tpYzRpTkxr?=
 =?utf-8?B?Z0Y1a0VlL3Z1UXpSRCtRZWtqM1JNVGczZzZ0aWU3NjErQTcxc3B3Q3NVVlFK?=
 =?utf-8?B?Q0JpN1NaTHIzU25HRTJKSHBRRnk2NFlkS1FERFBGUjBEMUZjK0lybHlNVW5P?=
 =?utf-8?B?WmNxY1FWdDBXYjJITnBjOVhFbUw1S1htdldKaTlGQUU1MGZHMisvQUFkQzVi?=
 =?utf-8?B?ZW8wWTJ0ajZxZk4weDhOVjNJQUNENXRFQ0UzYjU0UU9DS1N5YlNQNnhkRENo?=
 =?utf-8?B?VVdPQlEzYk5INU80U2F2QXdGSnA1Rk5zYlladmJFd3ZkVGNrczl2MUsvU2RQ?=
 =?utf-8?B?cVRpU2R1QWJ3aEs1WnFTZk54V000TTNJRWE2WmIrQ3N6b21iZGVWOVAvK1NW?=
 =?utf-8?B?S0hLaWkrUVFRcGtrVGZFdnluODMzdVIzRXBFKzBGbk41K3I3Wi9uUXV2aytu?=
 =?utf-8?B?YTFMMk10b2JVeTRFTHlhRmdJa2hNWER4N1RSMUhFZlRSTStuOElOT3VzZkdv?=
 =?utf-8?B?aGNPaVZlc2NWeTNnd1c4cnh1dEtVNysvZDB0QWV3VnhCcTduMjhMdkVBODdS?=
 =?utf-8?B?Qk9XeHlKeklnNEJScmJIcHI2UjVWazRlbVcycGFCVjB4WC9NZFU1TUxBQ3Vn?=
 =?utf-8?B?NURyNjF6YW5JN1FncmZSaHRldnZ1NEt0NXJhRERGUnVpMGNHRGpqVnZaUkFS?=
 =?utf-8?B?VGtwd3ZJbnQybEJodHl3dS9kUWorWUUzUEpmdkx6ZTQrd0Zac2dDWEpJUWIv?=
 =?utf-8?B?ZnY3aXdUZ0ZTcmNYK0EvNFJob1dyQ04yYlMrMng3MzJmWEpzc1g4UGtQLzBJ?=
 =?utf-8?B?WmJGMmxTSTNBVDhiWm1uT0NGTkVkU2ZuNkZ1VzY5aVIzQWl2TTB1RGtDWE5q?=
 =?utf-8?B?VW40WDYwQnlLTTdaalY0UDdtV2hsNlN1YVQzMnJkMUZDR1V4dnpadkN3eWUw?=
 =?utf-8?B?em5uaEVzandmOU13UmowZC93L0NnWDdGYzcrUnFpcUZUZ3NWcHJ0MkY4L2dN?=
 =?utf-8?B?VURBdlpqdi9lZktrdGRTYkVOQzRRbmRCay85a2ZJNmlGY0orY3RiajU3R1BT?=
 =?utf-8?B?NUtEbFE5UEJuWHMwSWdUUURlZmFrWmNrQ09PK2RzZE56UUFTOWw2T3UzSXBy?=
 =?utf-8?B?ZDNKVlozNFBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENYbmpEQ1d6djQrdis4dStGMSt3RS8zL2NJa0V3ZkNpbmlnR1FmYzV4MVFm?=
 =?utf-8?B?Nk5vbVoyVG40dEg5dlJlS1VwWEVpblZPRndyM3hxSURrS2MyclVUSjFoNExm?=
 =?utf-8?B?VUg1NEEvdFhxWlQ4QmthMXNVZ1hkbkhwa2ZvdVIrSTY0VlBZSEhOa2YvdGRK?=
 =?utf-8?B?V0Z5ZHpHUjVMb1lVTEswaE4yODM0ckdsSmZNT1BlMG8yWWFqajNBUk04Sisv?=
 =?utf-8?B?Wk5qMjVvZjY0V0N6azltOVRPdHZ3Ny9FM1hFK0pTUHlraFkxckRHQkx6Q1pR?=
 =?utf-8?B?ZDZzaW1Hb0VjUzZhUUo0U1JXTUM3SnpNZFFrQ3h2MnljZVoyanRJR1VMODN0?=
 =?utf-8?B?NUlrVmtMNkFQWFcvOStQeTQzWUNYTUJDSzZRRUlabnEzM1hQbCtJT0tLYjk1?=
 =?utf-8?B?YzFFMS9lYmFYeU40NmgyNng0WmxyTW1zN0RjWm9uNS8waEwrTlpRNnhqTEwv?=
 =?utf-8?B?M3RPa2VhM2FJWnRCbkkzNEYwUjlhczdDendmSXR0cUo5eEQ0dkN6S1RtdnVW?=
 =?utf-8?B?WEx6Q0VHMWZjN2RRc0dYQzQveHRjZllPZFhsV0RwcTFpT09URFlOc1A2NTlY?=
 =?utf-8?B?N3NKRU9ydjd5d09oS3BraVA0dFJhSnVVYjJia2tjWDBybFBNUjNkRjdqemww?=
 =?utf-8?B?a0lScXlQd0dLTlozWkgvYWorc3FnV3I2SVBLUHBxelFXeC9nSlBDZjV4dWsr?=
 =?utf-8?B?NVdEZVNGdHB3ZHpJWFZuL1B6emNTay9ZbC9uaWtVU0JlTlpZM0hvQUZsUG14?=
 =?utf-8?B?Rk11RE5IOUEwWk1EblBOMENwaUtpQWFlbGlaUkxteDJ5TVVjYXRKZ1lXTHdB?=
 =?utf-8?B?dUJvYk53M0NtMklhZ2JSeWlkTjdtQng4VHJkME5MeHNQbVN2V3JLSlFjbUtH?=
 =?utf-8?B?M2VFZWVUNUpPODRDdkw4T1FBeUJJSkFyRnRBUzErNXFxK2ZwZ3VqVFU3YVI2?=
 =?utf-8?B?NHFEOXB4UEJRU0hpMnIveGJndEpsNmdRNmNiZW00NGYzN3VNczVYbkVjZEFz?=
 =?utf-8?B?czJXdGNaTnFBUTA0RWMxYjRmSlRBamJIclkxT2VJdDVvd2pPVXdtR04yNjFk?=
 =?utf-8?B?NW5ZdmVMUk5KU0RWZU5Sc1ZEemN0cU5EWDIwSzhOYlBhU1Q1YWZqMk5SUlQ3?=
 =?utf-8?B?VnZMQzQ5UnZJcnpJNW91WG5hZW1hV1NnUUZiQWJQUXNlWWVkZ3JJYVZnN3lR?=
 =?utf-8?B?SnBsWmxFTS9pWFViV2JqQTREU1IwTzgxSXdVYXZQb0pYN3VDcFp1c1piNFBI?=
 =?utf-8?B?alBUcVNwSUozUUJRQW1TeHUvOTh2dFhadUFVQS9RTmhaeVNYWXpMYXJIU1Zv?=
 =?utf-8?B?VXM4ajRRWlFxVE96OEp2a0prTGJsbzdxUFp0V2J0N1FOUEtxaHJ4VlpVVlJX?=
 =?utf-8?B?VFlZY3VvSkdzdjYzOHA4OWdhR2x1VTl4ZU1LT3JENG1SNm4zTFY2aE05M216?=
 =?utf-8?B?MTE0QUZCZ3gwZ3FSOW0vaC9ZRCszb2RxN3BmRXQ4cHh2SXYxUUt1K3RYNThq?=
 =?utf-8?B?eTFXRGxjL0NVUExIOFRDTTJDMmJ4NEJ4ZmJyYTVpSW1ZVllIOCt0RGFZMjNx?=
 =?utf-8?B?eUVoTGpGM2ZtdGs4Vkd4alhsNm1oWEFpVWdZQWxmR1VrRENBVTh3UTBnV2lU?=
 =?utf-8?B?Z1kwakxHY05UeTV6MEJqWGtMYnBuc1pKRFFhNXBxUkhSdW1ZS0pUbDlTSnZn?=
 =?utf-8?B?ZUtSZzBCc28zTG1wU3J1RE4rU0c2MWNnRkFFek84TVBBMm5uTlJWTXpWN0l6?=
 =?utf-8?B?bzZ4Snkzc2lJRHZFZzFPZ1NMbWxtTWdSRnpXektSVlRXMVh0Z2pBelJOYS8w?=
 =?utf-8?B?di8zU3N3ZTl0aDE3SEhHeXdZaktLWld2NWs5TXhVVS9OL1VvTzVUTCs3L1Vy?=
 =?utf-8?B?dXY2UEpLL2swcGJEczFqSXlzNFBSRGVCVDFxOTRpZi9rbmRlcmtUL0JHSGV1?=
 =?utf-8?B?M3A0NlZHY1NlbzNCd2wrVHkvQml4Q2R5cEVUbTlrZklkQlVUeHdIKzFQOGdo?=
 =?utf-8?B?QlhOb3lkeFdwQ2hCcS93NUVNUGkzNEdUZ0MzSC9oZ29KRXNiZ01iTlVRQkt4?=
 =?utf-8?B?Z3NtazRiNENEVkNETFhRaGltL0ZDYUFyQzVVR3dFOXNXYjdpSE1wbjVnUXkr?=
 =?utf-8?Q?eVaajq9u8vkKkbqUWxaqd1loQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2340c917-9a7c-464c-25f7-08ddb540b5ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:06:09.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtsTunVFxw9vhfkOrmtCtSlIYXgZHB/QBQM0YgQMFctP/iBwDLSx7xV5bJt4okcnao4XS2YZ+YHEmUg+eSfhcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10943

Add sysfs interface to read System Manager syslog and system info

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/sm-misc.c | 97 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index fc3ee12c2be878e0285183e3381c9514a63d5142..55485a3c4a5c615102a377f41025a6911d746770 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -44,6 +44,100 @@ static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
 	return 0;
 }
 
+static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
+			   char *buf)
+{
+	struct scmi_imx_misc_sys_sleep_rec *rec;
+	struct scmi_imx_misc_syslog *syslog;
+	int ret;
+	size_t len = 0;
+
+	if (!ph)
+		return 0;
+
+	syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
+	if (!syslog)
+		return -ENOMEM;
+
+	ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
+	if (ret) {
+		kfree(syslog);
+		return ret;
+	}
+
+	rec = &syslog->syssleeprecord;
+
+	len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
+	len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
+	len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
+	len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
+	len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
+	len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
+	len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
+	len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
+	len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
+
+	kfree(syslog);
+
+	return len;
+}
+
+static DEVICE_ATTR_RO(syslog);
+
+static ssize_t system_info_show(struct device *device, struct device_attribute *attr,
+				char *buf)
+{
+	struct scmi_imx_misc_system_info *info;
+	int len = 0;
+	int ret;
+
+	if (!ph)
+		return 0;
+
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = imx_misc_ctrl_ops->misc_discover_build_info(ph, info);
+	if (ret)
+		goto err;
+
+	ret = imx_misc_ctrl_ops->misc_cfg_info(ph, info);
+	if (ret)
+		goto err;
+
+	ret = imx_misc_ctrl_ops->misc_silicon_info(ph, info);
+	if (ret)
+		goto err;
+
+	ret = imx_misc_ctrl_ops->misc_board_info(ph, info);
+	if (ret)
+		goto err;
+
+	len += sysfs_emit_at(buf, len, "SM Version    = Build %u, Commit 08%x\n",
+			     info->buildnum, info->buildcommit);
+	len += sysfs_emit_at(buf, len, "SM Config     = %s, mSel=%u\n",
+			     info->cfgname, info->msel);
+	len += sysfs_emit_at(buf, len, "Silicon       = %s\n", info->siname);
+	len += sysfs_emit_at(buf, len, "Board         = %s, attr=0x%08x\n",
+			     info->brdname, info->brd_attributes);
+
+	ret = len;
+err:
+	kfree(info);
+	return ret;
+}
+
+static DEVICE_ATTR_RO(system_info);
+
+static struct attribute *sm_misc_attrs[] = {
+	&dev_attr_syslog.attr,
+	&dev_attr_system_info.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(sm_misc);
+
 static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
 {
 	const struct scmi_handle *handle = sdev->handle;
@@ -108,6 +202,9 @@ static const struct scmi_device_id scmi_id_table[] = {
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_imx_misc_ctrl_driver = {
+	.driver = {
+		.dev_groups = sm_misc_groups,
+	},
 	.name = "scmi-imx-misc-ctrl",
 	.probe = scmi_imx_misc_ctrl_probe,
 	.id_table = scmi_id_table,

-- 
2.37.1

