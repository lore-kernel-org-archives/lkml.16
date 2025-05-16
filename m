Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012016.outbound.protection.outlook.com [52.101.71.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1827442C;
	Fri, 16 May 2025 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393025; cv=fail; b=l2BuASdvgiY7AHdk9Of+Z8wuMWoLI8osghUQ5UmyM2V1CRyjytrs9/8R9ScZi93bFjG8mW8Ag7OyTn7bTTt+mOCyerUIqCTAIn3Btj5CYX7ZdusOVfGvW4O0kPZjZa6wQAdplnL65oQGvUmHc34StzGLyOmTSZeaiz8ks9V/00I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393025; c=relaxed/simple;
	bh=etfF6B0agafUQmo1/3e5FHK+mpKgQoeiMdm71Q/R6cQ=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=U4EY75pOKzNteJMNJxaEJbD8M0qywdDt7myfVXTI5IuucRRBml6vmKwVF8oAfT/SdnB2UkBYOMeoPkHWv8WkmsTOnbGeHp09zxLjmLNAoAbhAXj4SSh4sRJxHVmeY22ZFHZCHuZIRCM3pCj39n+JdncWp2Uhj9SbRvFkDO5pMn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YlyZ9T6R; arc=fail smtp.client-ip=52.101.71.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YlyZ9T6R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9lB/4M8r+amXwY+sbCj9YOHHvr5Pe6ENWEabIQC82FmsC7UfMouyitOgi+xfVmtAXbscM9yeFBGXGon5zJQoZL5fGOFlUrwRZV+dF4pGe4jI+pJKigN4F4jhVlMkcMqLtVpOUx4nG+0feu9NjQZ/Q6ltS833zB78LbqwDe2z2KAm+d+gNm0hnLhVNGCd240jJ177ISWHjE0rDMxsoJ4VrG7OEH+jbnwpCzuNFnpZD7kfOQN8PDk4vpuYEfmvi/YosqzZVuwAH22nrYlH6rwdRKellBhNUNuvKjximV3dIsOKQHENJGMARVjIXzqpmMzTenGugQGRR2Y4d5lzkIcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxDDwCnlwb9ol4LSC/lG7peOOyd4hUPtmGqKt71MwOc=;
 b=A4Bmme1hFvnY1gNubC+f9eWANIIK3MaTu0HfNNSo1t0m/uexVJOaybwQljJVeheZaOyvCRumO2Pc8emIYBQQRLhiZdi8g0pcnx4L7C5RD7xWZtivaVzOKfRXeJi38xeW93hcEED22h+mm3rawpSyr1mnC4fC0WFgRxBo3qDo8vUD9S6hhqHOHOJNJ+q/Rq9qOUGwKIVpO7zGKBCOLA9PRraT/hnU5N5WL96Ggt6Hftd3g0VvRObtfidaTUL7X6rCOLhAV9LM5ROMIp5jmGMMx7hdlizxEqcaTy2uHt050Zt5rDG6wzCG9uyB3sbxhK5BOa7YHJeLT+JabeDKqjvp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxDDwCnlwb9ol4LSC/lG7peOOyd4hUPtmGqKt71MwOc=;
 b=YlyZ9T6RtiUAshWA4wTB5eJIPiajqtDU7R+AqH+Nhdapq8jjaem80koLw7zMT8tXiUNlnBTrHFyDcKoBQn4rIhfbyjLDf6fRkzD/7gBWDueSfelBIzpHFCOyEIZK36HSC8bD6v2cGPPqJGqQ29xF4WYd/XOIX+DhZKFnCxSTUCc/zDZZzE8Nq7RnUhpc21e939bWsb/8Oqwi/yGfEKvaO8IrlsLFZBqZVFpH8gQ/t1kb1RkBrg1it4/MC04Nwu5jcvR/Lypb7lGWAmuudjG/WAVWPy2oa9lGVilXONnAO/Cq7R4CcuxRBZt2CComwQEqQOEz/pyF1v5Ej9qieL+F2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB7623.eurprd04.prod.outlook.com (2603:10a6:20b:29c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 10:57:00 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 10:57:00 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Fri, 16 May 2025 18:58:49 +0800
Subject: [PATCH] ARM: dts: add ngpios for vf610 compatible gpio controllers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
X-B4-Tracking: v=1; b=H4sIAGgaJ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Mz3fSCzHzdlJJiXRMDC2NDwyQzY+NkEyWg8oKi1LTMCrBR0bG1tQC
 wTsauWgAAAA==
X-Change-ID: 20250516-gpio-dts-408311b633c4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747393156; l=8660;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=etfF6B0agafUQmo1/3e5FHK+mpKgQoeiMdm71Q/R6cQ=;
 b=2Bx9kD3lgHS1ZkMCYTIFRLXd54Y7zOVKKv1VZlraZdHiiXLJyq9+jNjFkBST06qeAzegHg0Rb
 7E/Q8LhSbaMCI7Miccug1fywzNEOz/oLxy2KTSIeAQmunvs6ybkc/vs
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e502602-a319-4738-8210-08dd946861f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUFwUWhZRTBDK1hjMmwwL056UnROR2pEbWZjSE1MYm1NVjFla2lJV0JJbnRK?=
 =?utf-8?B?aWQ2Q3RWYkp4a2RyWTh2aWV2L2xYU0ZBVUo5elp1bkZOYk5NQjU3MllKWGtL?=
 =?utf-8?B?QlJmVVJHL2l0Y2prbzI0SzhNS0xIQUR6cGJBclRPL3UzZmxiSmpVVTNWMVRM?=
 =?utf-8?B?cXhndXQyYVE2MUFZOXRZajZQb0hDYk1ReXlwMmUwckE1OEJKWDllYlcyS1I3?=
 =?utf-8?B?OGNkYWU1OHVDR0c2WWQ3enVYempvR1E3VEZYUDhOZmNWSDRSVXlMY0hOWDV1?=
 =?utf-8?B?Q0pYeVI0Zmx3Y2VFMVR5M0ZET1UvNjBOY0lteFFPazMrTEJaeHFySThOR3Bj?=
 =?utf-8?B?QWZhbjRLSGNDNmQ5cjcwbUNBbHIzWjNpR21pNWNiQWx2b1FLSjk4ckQ5UUoy?=
 =?utf-8?B?ZHJZaUorRkZzWnA5bjcwclJxQXRCSmJnd0hIZ3hKOFFUZ0pXR3lUaGM1eG93?=
 =?utf-8?B?ZEtrbExCRGZwK3dhUUVnR0kxdzdYMTd5cnNPM3ZJWU94TjhMVENaMUZHbGJ3?=
 =?utf-8?B?NnVKM2xZejhLMnprYjl6QTlLeGtSSzNUcXBBdHJEb2szd2phRzQxYkk1RlR3?=
 =?utf-8?B?LytXRk9NODNpNXV2d1ozWXBYejQxNW5mN0Z0T21tS0ZaTExSTUhucTVTdVd1?=
 =?utf-8?B?bk52ODV5eDE3eFU5UWh3WjJXdE5WTzhtNjdQSXZRU0tKS21tR1pzSGdhWmFX?=
 =?utf-8?B?SEJxQnhlaXpCK1pkVHM1ZVAyTEZOSWxQMzE3NGx0ZG81em9JNnUvTmxrRlp2?=
 =?utf-8?B?Y01WbXZNT2d4QmdaUGt3VlcxRlBnZy9RM2Qrd3k4WjlXd3lvWUVjR2tvL1JB?=
 =?utf-8?B?MVd5MHorZDlvYWluTUpZZUFTczhYSGk3UG9DWkNmYUVTaGMxTnB1QmpaOGdW?=
 =?utf-8?B?UlA2RmdFNG1JU1BpdkY2b3RDWlJwTWlVeG9uYVQ5ZCtkL3l1UUpxUGFYQlN3?=
 =?utf-8?B?WDArR29pN0NnWDdtdnB5ZzZZUjFNN21mMVo5SnNEL2JDUEJWU0JPclM0OTVv?=
 =?utf-8?B?ZHQzeDVxYkJrUExCMzBOeUtDSlVCamRzSGc1Ni9kTXE4eWxRdlhrbmRUbHlQ?=
 =?utf-8?B?RDVoRTNPQ0ZORXpQdDNMSVBOZG1qU0JqQlpJKzBWeERFK3hnSUdhNk0xcEZM?=
 =?utf-8?B?R1lwdGNiV3NkeldtVHdjejNGZHFuZEFrM3VUR3IrVDBsbi85aUVEOTdDa3RB?=
 =?utf-8?B?SUZidmxneGUvVzVRbmM3bUFlU0wyNUkzalA3RENRT250NkxmejFySTJ1dXZ1?=
 =?utf-8?B?dnp1S04yWCtTYzF4amNoMmJFOW1Icy9WSzhWOFgyS1lydjhGVWZpNlBQTFF2?=
 =?utf-8?B?ZzZSU09Ia0QyK0tGaHg0S3FqVDh2RWZmMDRUMmRic3Y0S1JYUVpQYzdFaDVQ?=
 =?utf-8?B?aGVBNGdPRGpXTkRYbU5JaTlySzNuU0dFUnNVcC9pYzFxdXZHRUUyZU5aRitE?=
 =?utf-8?B?c1hSaEZDbnVlOUFnRVJLdTJjZVlNbDV1QkxWMFVZZDk4NEh3WmltbFVYNGQy?=
 =?utf-8?B?S2Q0MmRJa01ZZ1RROEpRYTdpcjdDbjNkNTI1ZGdrVW4vRFVzTHNoOEh4UjUz?=
 =?utf-8?B?azN5VnhrVVJ3MXloOUxKVHd5azVnQ3JyNjYzVDk4aldHTlVHaEV4K21DU3ht?=
 =?utf-8?B?T2xKMm9BZHE5ZTBDQjl5OGZwZTVWak9SSnFrOUxGWlRaSU80bCtObXJRaTdu?=
 =?utf-8?B?U3NMbm1qZkxYSU5SY2JLSWUwWDU5enF2d0RCbDhxNExJUW4zM0ZlTzU5aTRN?=
 =?utf-8?B?dEZSNEw3L1VOWW15by9LNzg2SDQ2Wi9VNi9ZOUd0aTcvdTlVdWw0eU51UURa?=
 =?utf-8?B?ak1abG1RRGMyN2w4SE5pS2NneW5PdVFVUitwN2d1Zm5oTXBmTk9wbDdrbEJE?=
 =?utf-8?B?SXZmalhxcnA0c0xYQU1UR0VNYmpSVHRJMHlJU0Q0NUZMZkplY3gzejJRMjNk?=
 =?utf-8?B?b2VZVSsrM0NnOU1uMGxHWEVNYmZDTEQ1cUlJRXhZWEpFR1dxWmlwTHg3VmNr?=
 =?utf-8?B?TmU1MWEvdUVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3k2Q2g0NDRoTHE0d0l5OHhwL09uSlAvWjh6VXRUZ2dTL0tNZTB5ZlJscXN3?=
 =?utf-8?B?SFBDWXRDRnBJZGFCNUxzVDBkL0FKM0pMeDhLYlNSdXhLaU1kUUR1Z3RzMUxG?=
 =?utf-8?B?dnlzelIweTkxSTVqZkgrSG5aUUp5MHJORlFvd1FNZEdYUnA3RXdsNGtqWktQ?=
 =?utf-8?B?UUJQTy9MSjc1S3dKd1gyU2F5emJkdDJ5SVptQWgyZEpNcUk2WldYaFNJS2dw?=
 =?utf-8?B?dWM5VHNPK0g0Q1RScFVuYkg3cVA4aFl1N1hVT3NiYlBzY05EYzJBTVhVTmRE?=
 =?utf-8?B?c2R5Q1NCcWw0ckNXOWdLZXZNV0w0RUU1d05GSDB3c0xacDd1aW5tY1lkWFZS?=
 =?utf-8?B?NVNPeHovMWhKa0dkVitHamR1cXBuT3hYcmpVRVZCd1gwdGhpS21RZDVCVUVZ?=
 =?utf-8?B?TkNYaXd0VDJJOFZBNVJmV003YnZYWFIrOVVGcUkzblRFTi84ektHNjB0YmU5?=
 =?utf-8?B?V0ljRWV1VWIvdEpOV005T3VmeUlmak5JYlk1OHd3SDBCMUo3K3dTQWhRM2lY?=
 =?utf-8?B?ZmhJOE9zM21JeUtDZFR0ZE1wdlJXRlFMWnV3Q2F2Y2NXdGpGQ1M0SFFBcUI1?=
 =?utf-8?B?RDQ4Qm4vOEJoajlqaHQwQzJVQXBObVpwZGdkUXdudWl5MHBWWVp1Nm14OFJR?=
 =?utf-8?B?STJjU1c3MzkySHlDNlU2b2tJanFmWS9veFhlZk9nM3VSUUJtZVUrVkUxVVpu?=
 =?utf-8?B?eTdweDhoK0V0MUE3NDBWbVlBVWVCdk5BaS9qeEtJUGg0Q2pMMzBrZmpIdFNW?=
 =?utf-8?B?SVhuWGhxU1VzdCtHbk5HSVNBdGRPZWZLeDRTSmM4d3dsd1pUNUNmVkhmNE9O?=
 =?utf-8?B?akI4Qm0yZVhRaUZIMzE1YityWFZxT1piSStSQW5nM0FFa3RtZjQ5QkxDdmtq?=
 =?utf-8?B?cDU2VlRqV2pQVjdEa3FNR3E5Mm1JeEtnanhzcWMxa2Ruck54MFNUT1ZpY1A4?=
 =?utf-8?B?ejhuMHA2Nzg1S01qb3VaSW1rSy9QSHF3cEM3enBSa0FPZjFMVWpXaW9aRXBV?=
 =?utf-8?B?MXVtZXZVcUVvN0EycXdib1JGV3BoaG5LOFNPb3ArdkswZSs0N3VhRG93Zy9k?=
 =?utf-8?B?K3hpcHRMTWtGTU4vd1VjVFQrcVFHUzB5S3NTK25WZllnWFNrV1FmYjdyMXBq?=
 =?utf-8?B?N1E1NGhhRjVYM3lLZGdVaFB1anc4ZVpKVnFUWG1WZTdvYjNXRWpPR0FsYVBo?=
 =?utf-8?B?S3Z4bFV1WWhJdndtMjg3cHBsTEhmWUJwck5YMVgrTUk4aWlkMzlFRTh5L1RM?=
 =?utf-8?B?S3NCclhPWUxLNnVER3pRL212RFc0Ujd6UjBlOTc5M1RwUnhBZXBJQmVGMzdN?=
 =?utf-8?B?OXpoWlJWOW5MbHEvWFFjZ2JOL0FPcHlKdTlMb29oc1RvUkZvUlBmOUJxN3lo?=
 =?utf-8?B?aWFiZmN0MEsycWVoNzhGVDg2TW5YU1BWNW1vRFNqOGlPeFduMHBkdVNwOENH?=
 =?utf-8?B?TDF1TTB1Rkw3WEUrVloyUkFGZ3ZRdkk5d1RVSFhVMGJmcXdNd0RoVG9VU0ph?=
 =?utf-8?B?ZGRIOVFwbFVBT1VzU2hrSXNGcEMwcmVpUmZwb2pPWld0c1pQNSt0VlR6WGI1?=
 =?utf-8?B?KzNQQXhZSUhWL2JLTExKdS9UT0d0Qk9ZbDV6MURoMThWRk9iME5zTDROY0lM?=
 =?utf-8?B?a2tOTUp0dlhjeXJSQngvYWtVMU1DTllxN091LzA4SGsxb0I5L3JNSnpTblpG?=
 =?utf-8?B?NjBpRWltRi9QbCs2N0VNeDlTdDZCQ1d6SDlXMmtQdFhOVzNZeWxHOThRdE0y?=
 =?utf-8?B?NmFFK29hM1R1T0w2VzdPUjJUOXZyUW1MVVM4OHZtMTk4NWRFUHhUcVZ4OFE1?=
 =?utf-8?B?MlhhQ0QwUzJ0NHBvNEQ1WmVGOWd6VitXNExTemxTTU5vTmtBUWtBT3ZwRW0r?=
 =?utf-8?B?SDI2Z1lBYTR2b1RWRFlMclZkOUZvNXNoNVBGTGhua0VSUFpqTVNScU1WUTFW?=
 =?utf-8?B?TW0xSFB5SE1DbGFQOUp4Q3BGdUF3SEVkeTdwOStmK1NENUsyUU5paVdacmJF?=
 =?utf-8?B?NkFGaFZXN1QvUjNtRHZ3NnhoNm1HbDVTWlV6QkY3QkFjbDArMmFoYy9yWm5o?=
 =?utf-8?B?MldSU3E1a2tCakNkdFVWckNUSWREUlpMNkJoTWEvS2hodi9WRklhbUdsa2Zi?=
 =?utf-8?Q?ejScQIDfHdkVm1OYmGmMDxPvF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e502602-a319-4738-8210-08dd946861f7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:56:59.9625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnHuam7jw/iCuGYcskDpfOumbYdEWsAl7Wfc4zaXz5XhOtHWIq9ltRukLFEfUon9mzdzM9BOPmvF2u4EzytuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7623

After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
gpio driver no more use the static number 32 for gc->ngpio, user has a
chance to config it through device tree for each port.

And some gpio controllers did have less pads. So add 'ngpios' here,
this can save some memory when request bitmap, and also show user
more accurate information when use gpio tools.

Besides, some gpio controllers have hole in the gpio ranges, so use
'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
correct result.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi     | 4 ++++
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi        | 5 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/imx93.dtsi   | 4 ++++
 arch/arm64/boot/dts/freescale/imx94.dtsi   | 7 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi   | 5 +++++
 6 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 3c6ef7bfba60986b797bb01b843830d364c96d45..880b9a4f32b0846a773dbf9ad30715c84ac2fda6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -399,6 +399,7 @@ gpio_ptc: gpio@40ae0000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLC>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 0 20>;
+			ngpios = <20>;
 		};
 
 		gpio_ptd: gpio@40af0000 {
@@ -413,6 +414,7 @@ gpio_ptd: gpio@40af0000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLD>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 32 12>;
+			ngpios = <12>;
 		};
 
 		gpio_pte: gpio@40b00000 {
@@ -427,6 +429,7 @@ gpio_pte: gpio@40b00000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 64 16>;
+			ngpios = <16>;
 		};
 
 		gpio_ptf: gpio@40b10000 {
@@ -441,6 +444,7 @@ gpio_ptf: gpio@40b10000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLF>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 96 20>;
+			ngpios = <20>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 597f20be82f1ee044e14bfaf3bd05cff37a8ad39..a275821c35d41e97eb2139a081ef5765d07672aa 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -318,6 +318,7 @@ gpio0: gpio@40049000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 0 32>;
+				ngpios = <32>;
 			};
 
 			gpio1: gpio@4004a000 {
@@ -329,6 +330,7 @@ gpio1: gpio@4004a000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 32 32>;
+				ngpios = <32>;
 			};
 
 			gpio2: gpio@4004b000 {
@@ -340,6 +342,7 @@ gpio2: gpio@4004b000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 64 32>;
+				ngpios = <32>;
 			};
 
 			gpio3: gpio@4004c000 {
@@ -351,6 +354,7 @@ gpio3: gpio@4004c000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 96 32>;
+				ngpios = <32>;
 			};
 
 			gpio4: gpio@4004d000 {
@@ -362,6 +366,7 @@ gpio4: gpio@4004d000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 128 7>;
+				ngpios = <7>;
 			};
 
 			anatop: anatop@40050000 {
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c208869d11d7fb970ac84638f45088..13b01f3aa2a4950c37e72e04f6bfb5995dc19178 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -686,6 +686,7 @@ gpioe: gpio@2d000000 {
 					 <&pcc4 IMX8ULP_CLK_PCTLE>;
 				clock-names = "gpio", "port";
 				gpio-ranges = <&iomuxc1 0 32 24>;
+				ngpios = <24>;
 		};
 
 		gpiof: gpio@2d010000 {
@@ -701,6 +702,7 @@ gpiof: gpio@2d010000 {
 					 <&pcc4 IMX8ULP_CLK_PCTLF>;
 				clock-names = "gpio", "port";
 				gpio-ranges = <&iomuxc1 0 64 32>;
+				ngpios = <32>;
 		};
 
 		per_bridge5: bus@2d800000 {
@@ -855,6 +857,7 @@ gpiod: gpio@2e200000 {
 				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 0 24>;
+			ngpios = <24>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d38219fee312baadd4665674a141e..52be83a168d9ee6452a63039c89169d49b63eb60 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1197,6 +1197,7 @@ gpio2: gpio@43810000 {
 				 <&clk IMX93_CLK_GPIO2_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 4 30>;
+			ngpios = <30>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1213,6 +1214,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43830000 {
@@ -1228,6 +1230,7 @@ gpio4: gpio@43830000 {
 				 <&clk IMX93_CLK_GPIO4_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
+			ngpios = <30>;
 		};
 
 		gpio1: gpio@47400000 {
@@ -1243,6 +1246,7 @@ gpio1: gpio@47400000 {
 				 <&clk IMX93_CLK_GPIO1_GATE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc 0 92 16>;
+			ngpios = <16>;
 		};
 
 		ocotp: efuse@47510000 {
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 3661ea48d7d2994df7b02084e9681beb303aa133..b8ffc428e95be1938bf5e73316b4163acaa04701 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -785,6 +785,7 @@ gpio2: gpio@43810000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+			ngpios = <32>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -797,6 +798,7 @@ gpio3: gpio@43820000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 36 26>;
+			ngpios = <26>;
 		};
 
 		gpio4: gpio@43840000 {
@@ -810,6 +812,7 @@ gpio4: gpio@43840000 {
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
 				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164 12>;
+			ngpios = <32>;
 		};
 
 		gpio5: gpio@43850000 {
@@ -822,6 +825,7 @@ gpio5: gpio@43850000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 108 32>;
+			ngpios = <32>;
 		};
 
 		gpio6: gpio@43860000 {
@@ -834,6 +838,7 @@ gpio6: gpio@43860000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 66 32>;
+			ngpios = <32>;
 		};
 
 		gpio7: gpio@43870000 {
@@ -846,6 +851,8 @@ gpio7: gpio@43870000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;
+			gpio-reserved-ranges = <10 6>;
+			ngpios = <28>;
 		};
 
 		aips1: bus@44000000 {
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 632631a2911224cadc16a943cdb467e091e43384..a2f4fcffcde59849bafcedced3ff317ca6c7cf78 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1152,6 +1152,7 @@ gpio2: gpio@43810000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+			ngpios = <32>;
 		};
 
 		gpio3: gpio@43820000 {
@@ -1168,6 +1169,7 @@ gpio3: gpio@43820000 {
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
 				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
+			ngpios = <32>;
 		};
 
 		gpio4: gpio@43840000 {
@@ -1183,6 +1185,7 @@ gpio4: gpio@43840000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
+			ngpios = <30>;
 		};
 
 		gpio5: gpio@43850000 {
@@ -1198,6 +1201,7 @@ gpio5: gpio@43850000 {
 				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
+			ngpios = <18>;
 		};
 
 		aips1: bus@44000000 {
@@ -1508,6 +1512,7 @@ gpio1: gpio@47400000 {
 				 <&scmi_clk IMX95_CLK_M33>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&scmi_iomuxc 0 112 16>;
+			ngpios = <16>;
 			status = "disabled";
 		};
 

---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250516-gpio-dts-408311b633c4

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

