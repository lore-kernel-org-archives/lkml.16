Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAE1F419B;
	Fri, 27 Jun 2025 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004355; cv=fail; b=ZWQJ2n/auYMRdhzvOz1AzbtD4KmbghjrjRTIpWPe0eD1sMSLmeqVpApdsNMLJy6WAnoGUdbreDmdlDWrCq7v8DKo7mVtNqiMWCk1iomgq/Af8+0fmRqFxlYkUsZSTBNKgj46qh0nIxpxB0KoUJvdfXjrfjQ8AdlAUaTnvzsWVh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004355; c=relaxed/simple;
	bh=4XBgHzfEXmtBPmkmMVc+49w9prnaxJyFzAb4ul2t8W8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K5nj5jKVZDcqZgO7K5HxRxVVWF8UG7qkA1fTkbqyeStZ3whiC6jr3cyiALW26zV3N5Z+O0NZGtSf0nYDgX03c+JIY9TfLjKVMdECU7mx3MYnQF1fDmTU/5oxWkG7xjXMhfji1o6Aq9qTI1hp3QeXkHJihrP+CA8Sp3YuAb2WFwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VfFcaMLG; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VfFcaMLG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4ry/6d7gRjnUSu+X3oExPntCzClGrx3YkkWX45yJ0KDT4OAHyUxwNzoLx0mhCMnDG9atRXkwdQbbADTMYJsEHyW4BkeLaZOrladjF0z6aOC2DzRIwGvoM2a2NUrwqLrbHX8cKPRlEptwmNiJdpf/5q+T7zhj8bTbu3UzeEZPdcw843EmKBVsX9TUM+PBUAFdGRJN3m9e+IzabQRMrBDvopMd9C9dzdudYq2JF9tc0Gv3Af2gOdcVYH8INQZeI8xu+hU1ipDKZik1UCdLvqqo1Svi9qA8AirkxNKujYRfdayRRyF+gIXIKSb75FnoKJyzGz66Bj/bm5CLQ4kk6fFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tauwnd1Zmur/2tAGMDMlSrBbsmrSl8CIHiNOJwq1SH4=;
 b=jhwXdgi9lJQq9o7DIN50idLNFqZU2PGNc7OAALBD1T2xNl3hPC8JZysBp3yeoAIaOIxioiSlsMM92+/ZuMybZXYQo79MBBNNpMfkY2/e8YtLzXtVGCWhPQd+XZ7TTwKs5LJd/v2poIN7ixuyxcK5y0+v31wBa7dnvAio/fToisvRhWjpe8lKvqLDiZ3ZY3zC8ZMKHLxH/+9T8MnD7+p9SlHcJbT6TcOqa7+FBC8w6ArTtzRImomaDL3HJ0Lwo0BMuBkxuasYn8+I8X2IXvqdufdnzNYyej/gK45PvDLZgaW+vbA4LMgM8dEi8L7f15NMhlme+BnT9rrRmm6NQWiW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tauwnd1Zmur/2tAGMDMlSrBbsmrSl8CIHiNOJwq1SH4=;
 b=VfFcaMLGttgbsOUYnFXg339kSBD/iBGJs+M5feMXiL2cHyecOiOE9dpC0G51Xl6AX1I1Ic/DhTVjk2m33B6g9S6ZMvMrGvxMSf9ZFw1M2aPsgP3tC9MZTuKY1kTzKLiFRnIDEfAy6bT4cfTKmpAh9+2JbEJ+MIHjVhEKLRvubMMuZiUCO9Ki5VUPf/ZVaFhzotDJHux6np/WzRAjH08GrBJyJMdzIiH2q3f3Nb1IH0kFtzNbKUi1VinBlZ6iUh1nOARsqPEReDGuB4Yrp6dAdtVVydHqIt2JkVglcMOYOT5baHaMNxrZu+3VzYaTJ1khh20odYnK4FmxY/q+Izc5Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 06:05:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:05:50 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:46 +0800
Subject: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=3176;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4XBgHzfEXmtBPmkmMVc+49w9prnaxJyFzAb4ul2t8W8=;
 b=xrAxB/eN7N3EjNx8FZ8Yz2PpMdLm53AMO/glZy7e4fHwhnpNBh4oSXyLQv/gkW3M2omqKF0a4
 sL/ctA4enHNCTAMjmcCaoOngS39ywdgH0G0WbEmW/qX9gspazB53hu0
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 35514be8-5259-4342-2619-08ddb540aafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1pZUHNpQ1Q2NTkyU0dkYWZqRUZKa3hWazdaUmhzOGN0RTl6N2tBV3Q2K0RN?=
 =?utf-8?B?T2RJNXhKVDk5Nk1zdFlzZ0tzU0x3cklPVTgweWk5dzFzTDdBWGdTS1J2Nm5l?=
 =?utf-8?B?TVpoUHBhc3FiYkJtVHY0b3lOZDVzTG9BemxqaTJ3NVo1bVgxaEtYb0M3KzJh?=
 =?utf-8?B?YTRkQ051T1UyN3czRUNiUzhNQjhrZER2eFpvNjQvQU1DUkJmL3YzY053bXVz?=
 =?utf-8?B?ZG5Yc0tPT3Q2VFlHUGkxdlF5bnNUQTNzdU9QTjNidERBZyt0aGhMeFd2ZG5u?=
 =?utf-8?B?UlVrQ1Y0NnRGRnJVa3g1cm9rcUFYU0haK3V2Wi9nNEpiNmd6UHVCOTIvWEd2?=
 =?utf-8?B?bkMzdUx6enliSXN5WjZ1K3NSYWV2Rjgzbk03aCszbmpOMHFRd2xPTFRKcXZL?=
 =?utf-8?B?YXBieDhGYjd5RlA0OGI2QXFQWWZCWW5ZL1BFbTg3a3V4SjZLRzBsRWNrT2k5?=
 =?utf-8?B?OURBdS81emllWE94SjlRcWJwYzRDWVpxV0FvbUFwYXd5SjZVdUxjSnNpUmpM?=
 =?utf-8?B?SmVpb1RwYkNXSFExc0M5VllMcEpWVEp0NytNeFd0SlJKWkdSSkd3RVg1WlJ5?=
 =?utf-8?B?OUlWWTVleUVDVEltK3ZiN1FjZkZFOFFkeXExV3pka3NpRjRodkZNc1FzcjNW?=
 =?utf-8?B?NnZOSXdiUHBHS1VXSy9aTU5wbWlIZXUwQ3NQZ0VRMXQ2TkJ1QXQ3NGZQdnVG?=
 =?utf-8?B?NnJXVGE1aWlzY0ZWZnhYNWJIcG1WWS9menp1SUhsV0M5UW5ZeWNTSlhmdGd2?=
 =?utf-8?B?Wk5LK0ZKQnpPSDhicnJ6dFdKSDRmVTMyU0pqUllBd0F3VUZLTGorU0ZpL1pI?=
 =?utf-8?B?aUx1Z1dwNHBaNmh6ay9pYzRnZ2RjQlhWbXI2WXFSMmZzWTJYNnZHWUlwQnZQ?=
 =?utf-8?B?dWhEY1B1SWI0U1hDZHZQWGJEU0FpcnMwaTVWSkhSbHhhRFhQRjZxcVFESVJJ?=
 =?utf-8?B?SEtmbGdTb0pNeFUwNXV3RGFyMDBkSUs1VTlnVTF4cVpYR3ZzdS9wUkRvUFhw?=
 =?utf-8?B?SDRJek9jcDg1ZjFTWks3MFNlTTQ5U1ZEalpJV2U2MjNZWTVNVFIraFg5ZU54?=
 =?utf-8?B?Ymdra3BlVTNHUWh2YWRhOXZoa21YMWRsc2Z6K0k3Q3IydEVxOFg5ZEl6N1dk?=
 =?utf-8?B?T0RUOGlUOExPV1Q1QVdoNmUvakFNT1dVNmpiRDFFVFpkRk9YL1JxNnM5UXEr?=
 =?utf-8?B?Rzkwdm5EcHRZdlBpdVA4WTNqbHZoSFl3TUJNNndPc0kzZ1g3N1libHZIS3Q1?=
 =?utf-8?B?eWdLalhreTJGMnBvRDd4ZXdxTWxXVlJCWCtrbkYwY0tNVzdseGF6VTNUekRG?=
 =?utf-8?B?NTQvaURSaUppbG5aUlpNSTZQaHBvQnJYSG1jajJ6cUFETVJtdXFxQmxacS9v?=
 =?utf-8?B?aE9neGlVVDMvY0hOeW5EQk05Sy93M3BTNzFLVDhwYWkydTVwcVQrRDBxQk82?=
 =?utf-8?B?czBxSXZabGs5QUVxR3ZyM1hKbFppa0xLN0ZmLy83Mmwxd0J5VDJwVnBsN290?=
 =?utf-8?B?NndKMDVkeG43NUU0OTJjUDBQQlZmalZ6ZlhTOWpjSytPZTM4VEpWVjlTZHBx?=
 =?utf-8?B?aXh5b3RXWTU3SWFkOGk2bGQ4QU02WUxiTFFBa3JJaTBodmx4V29rbjVuVEp3?=
 =?utf-8?B?ZFFGRkdyU3ZFUjJOdjhTdFBWaWQ4clV0bm5mcTI4dld0YzJLOHJwTHVoZEFT?=
 =?utf-8?B?QjQwa3Z6YVVVeXRFYWVZeVNxSllkeGNPNCtDckpWdmV4aHRYbWtGbXpGUG5V?=
 =?utf-8?B?NEpIaXBQTTREVHBNMGVna2lOV1lzaW1wbkE4aVljNk5DWXVvd09UZjZ6YndM?=
 =?utf-8?B?VW5zeGhsUmNQUG1lUHU4YVQ4WXZHMnRRdGl2bHRzTXZsL0M5eFB3ZmtFeTFG?=
 =?utf-8?B?ZUM4ZFlVTEJiZjV5MnJ6S1ZvakFGaGI0MlBnNThCcnlKdUY2SW4zV2hVR1Iy?=
 =?utf-8?B?ODFnbElYMTZ2alJRenR3aGZRV25Fak9ZM3lJMEprK1NRcDdZOWZ3UHVmL2R6?=
 =?utf-8?B?RWU1bDRqMWJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVQSnZ2NkpyYmlNcHlZWWt5cEJrMkhqQ0RIa08weVlSY2tqOXl0aFNQMHRu?=
 =?utf-8?B?ak1DQTRlaHVjYW5PQXFGb0lTaVVBcnJ0eTZmdWR2WmR3SDJSSk5pNy9EZ1lp?=
 =?utf-8?B?eGs2OU10Q2d3VlZUL0FaN3ZTSjNrNktXQXkxbitMZzJSNUVwK2RqVEtCbjFJ?=
 =?utf-8?B?OVBZUFdId1lDcTR6azdqTlNaeUNsQkpqc2VtN2xpcTIzTXF0aG9VRVJ2NGFU?=
 =?utf-8?B?T0FNbDBheHRmck1pUVdJMi9DQ2U5em5GeUgyamd6Mjh6OEIzckRhbUI4cnRD?=
 =?utf-8?B?cDJmSGFQazF5eWIwbk0waytSbmhXTlFuTUQvMEVKTnIvQjhDRURFU0tTVjc4?=
 =?utf-8?B?RmwzcHJwY0tBWml5d1JoSUVvUFNoWnRONitrMnBiYWF3L3lQMUhJa3RYRk9D?=
 =?utf-8?B?NjBsaWpjUUxmc2paZDd0dXVFWEhpMHJjTDdHTWk4dE01T0N5NlJFQUhXbGlK?=
 =?utf-8?B?bFluNmRjUGtxeTc3TExubUlIYnE3U3NreElmZ1UrVk1YK253OGQxL0Q1dER4?=
 =?utf-8?B?cXNGdDBndlhpOTRGOHRnNzV4RmFlV0pwL2Y1UkZDUEhYRldBQjIxTmEwNmYv?=
 =?utf-8?B?QnFaRFQzbWJRT2Z2ZzRZRytTYjEvQy9PeVlkeEF2VUpUaFFjVEg4VHJCbnBO?=
 =?utf-8?B?UzFIOThWWkdXQ1cxLzJUKzJ0ZWtUcC9DRnBhaUk3eW9aMWhGb05ENzBnSk1Q?=
 =?utf-8?B?aUpsTytSbmJKYzlHU0xkd3JQVjZUbjdTL01XMWMvazBTNDZlN0M4ZzlMY1pI?=
 =?utf-8?B?UkcvNStQc255bVNWTHpjbWsxdXBSVytnN2NqZTV4WHRtZjczczVUdFpuZU0x?=
 =?utf-8?B?amFXWGI0VGlYREFQalg4cHozTGJjQ09iV2V6V01PZzcrSVAxS1N0NjBSWDlx?=
 =?utf-8?B?Qkp1dlRsOSt5WVNRTHJRRnBlZENIRzFKK1ZBb1VuM2YzTG1KUzhxMFd5M2RZ?=
 =?utf-8?B?cUpmdmRxdkJZd0l2NmI3RFFoSnBIMFdEOUR6YmlVNEZ4SVV2YjBxR3lEUW0v?=
 =?utf-8?B?R0NxeTZkaUJmMzZDRlNWTGJjQVpWSGxTbVNGeTFqdnk2aDN2LzVSYTJZRmxB?=
 =?utf-8?B?UlA4Sk9JT1R6OXdMSjVucjhRcHo1L25aWDZJOWlyUENiM1d1Q2dkMEFVZWo0?=
 =?utf-8?B?Z25rYnc0REkrVDFrbGlKRUhmaGxSdzFtc2gvQ29CS2RiK2duWTN0Tnl0S2NR?=
 =?utf-8?B?T3puN0Q4ME54blpHcXYvSXBEYWFkNGZyUGRta0tQand5WWgwZVVzQThZNms1?=
 =?utf-8?B?aExIWjFzQWhkd0xiaFQydnVTMzBSTXhTdGplZkIrdDE4eng5bXoyM3d5cXg4?=
 =?utf-8?B?TkV4SExLbzBreVI0dlFZOUtxOU5xSjlFRGVqbXROZG5YTlgvc0s5SnY0b014?=
 =?utf-8?B?ck1LK216cStRZ0NGeXo5VmJ0b2hzMUJyeUh4U3M4QnRkbGU0NXJ6Yy83OExn?=
 =?utf-8?B?d0RQUzljUFp0em5PUVBUeG9mcXo3VzV1OHc1eVA3Q0hZazVieFVMTjFsYWc3?=
 =?utf-8?B?SEpaRHVSUDBNYzNYQVJ5VnZ1UUx3ZnpxdGFRZCtwRXF6enh0bENkWXphZmlk?=
 =?utf-8?B?VnZZS3puRHZmUHlVMFgycWNic2R0YS9EcjlRVVM2VTczU29oTytianhjOEd2?=
 =?utf-8?B?bGtRZmdLd0dFejl0ZHF5b2wra3VQejY5WjZielhHQWVvY3dpS3F6ejhDWnk5?=
 =?utf-8?B?d2o1L2YxZzR2eFZiaktKRTkzVUNFcmJyYTl1ZVhSSXo5R25hT1huT0p5REl0?=
 =?utf-8?B?cUpVRFhpWmMrOSs0U3BBQURnTE9XeGpmdGhTMGhCNHJxZ2RLS2pXemJsSE92?=
 =?utf-8?B?eHZpdE9MMWNaZjJoSlBiMC9oazhpcVlJYXd3VndZeS9tTUJUYjk5bXoydE90?=
 =?utf-8?B?MThzVEhrOENhbTdyWW1CNVlUZGkyOUNkZEVCVGF3OU9QaG9rL2Y2UzZRUTRZ?=
 =?utf-8?B?N0R5aWJQZnppQVZHWnp2bDdDeWx3alBuY2Rzc0RBTkNpdEdmajQzSS9WMFdx?=
 =?utf-8?B?ZU9tK3haUUtLRTg5QXF1Sml5dVAzMHAxRXdXY0F3SisxMjV1M1RWSlhBNmdj?=
 =?utf-8?B?QXpJQktWTm9PZEN4cjkxYXozNE5oUWVSNkEvaW13enU1K3Q2Yjk2S2lFdk5T?=
 =?utf-8?Q?9MdGZ7KLbUfpB45k+crjTmbCC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35514be8-5259-4342-2619-08ddb540aafd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:05:50.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0cmp3aq/gg+o6/tEbnXAkQ5UIHP43m46F+VlpxxJ+UVMJD+pmMFZEln2krbUdDc9qPSan7I25tkgXnXOARXNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

MISC protocol supports getting the System Manager(SM) mode selection
and configuration name. Add the API for user to retrieve the information
from SM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  5 ++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
 	SCMI_IMX_MISC_CTRL_SET	= 0x3,
 	SCMI_IMX_MISC_CTRL_GET	= 0x4,
 	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
+	SCMI_IMX_MISC_CFG_INFO = 0xC,
 	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
 };
 
@@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
 	u8 buildtime[MISC_MAX_BUILDTIME];
 };
 
+struct scmi_imx_misc_cfg_info_out {
+	__le32 msel;
+	u8 cfgname[MISC_MAX_CFGNAME];
+};
+
 static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
 					struct scmi_imx_misc_info *mi)
 {
@@ -306,7 +312,31 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
+				  struct scmi_imx_misc_system_info *info)
+{
+	struct scmi_imx_misc_cfg_info_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CFG_INFO, 0, sizeof(*out), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		info->msel = le32_to_cpu(out->msel);
+		strscpy(info->cfgname, out->cfgname, MISC_MAX_CFGNAME);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
+	.misc_cfg_info = scmi_imx_misc_cfg_info,
 	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
 	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
 	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 826402dfe6f4d3b9e6d2e93868d6699f989e9bcc..bb0c35b5d6705acddd6c83c31474482a2667b418 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -54,15 +54,20 @@ struct scmi_imx_misc_ctrl_notify_report {
 
 #define MISC_MAX_BUILDDATE	16
 #define MISC_MAX_BUILDTIME	16
+#define MISC_MAX_CFGNAME	16
 
 struct scmi_imx_misc_system_info {
 	u32 buildnum;
 	u32 buildcommit;
 	u8 date[MISC_MAX_BUILDDATE];
 	u8 time[MISC_MAX_BUILDTIME];
+	u32 msel;
+	u8 cfgname[MISC_MAX_CFGNAME];
 };
 
 struct scmi_imx_misc_proto_ops {
+	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
+			     struct scmi_imx_misc_system_info *info);
 	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
 			     u32 num, u32 *val);
 	int (*misc_ctrl_get)(const struct scmi_protocol_handle *ph, u32 id,

-- 
2.37.1

