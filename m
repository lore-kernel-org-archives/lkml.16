Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50A1DF26B;
	Wed,  9 Apr 2025 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179279; cv=fail; b=YiX283EajrFbVsogZ4dmIKFmww5YgIgw3X1THIAmlfS4h1I308It8cnmjPOIcYnWkv7n5zi6fKDnkX/qk0kh726TgiJgBUa9QudWZcsU8I8rPhCILTshGwBcxiEGATPsYv5YOSyLOqs5N8vM6xrOrDV8SO24So3qfamhVn9Homs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179279; c=relaxed/simple;
	bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ExJDLQYhOJyIWhC2RJvH7xxoVykXQXunScVxxRAybRMkhhy7AQUZcj42exs6P00SldOUcoF/UZh8o6uonW8B/cjllEKIy/H68AMdNTajVtYtO/T499hNS5eMS9SjXsYz90Q8M0W6czS1TbqUyVlLkBvtcnnkcmqMY2l+eIMJYYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RqCVF0Bn; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RqCVF0Bn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DztH6xt7VC5q23/9/XmM1lZcmDSZjNJD+q78xu6h7ziMCxgKSQjeMPJYrsA7Ott0hRoPiOwI0kh29UyNuycmZ27BjJLMj9EEGDLKmVbHGuYAUHNR3XHJIzAjEDavCBtpQYzoGcEc2KoD6KdEZiLhbjjdMR8Keud6ZJvyEdCTJwxfvuQeglLrnMgj3LIPPCZSJULzqL8EYVIZXbKjAccQ//XIPHdzihc9xMACrxRs0VjeOVXWo/s/X7tMmlHVJ9fDB2lQI/zaWV4yaoA2m+fsW5/s+w/4eHvaET4mZXUCUHqI+Ns2Un1o/gxdIDvNUtriNKKn/DYJTu2M46iwFICM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=dk1DY8A5H2rF4jQ7wBmeCvKHgbeUaBBG4xVtnbSDfJXnr8LbrihAcLVPBFkykEl6gcIlsuumQTVL66kHJ8MX9C0swHNobc50nrr4p97yvQ6PxWILybvkLfkRY756dkFkqBRxYOThDP+1DWFZLbVOhZdpxpFQyxcwezRQ9ltqnz7o2uRrpIvSykcTULYMv8dfePSmYuQgA1nDl2/nEsj9LrUZqjc2iMrmXv8lay0o4L/MbqGB3Xb5qehUNmtuDuIt6TZ4Kf4Iw9jLi5q9ga2/UWimONN6GUC4aVKyHuv5fwfFDrSkeRN4KHpMYvwHBJvBYR1dpvc+mBjBP7a/uBMUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=RqCVF0Bno8FFKY6MvjaOcxc80XVzNhg+FrFc1rYqYBqSSIhh3WIqtF7A3QUPJmlNK5rGuHrCe0ya48bxIchf5/BmAbUbQwJmVrIB07XVVaFxNsAfpcb5+HPBBTmPb7gLh/AYp1YgxTMkcaB1UbfYH9I08nDcBp29Rs6/K174/j743qiQUOYBDhCBr+DpHxnzAGbIbRgS64zP8pq4VmMHJ/1go0xKH/T6VpJCwM/qk9X3D2JfxWy05+2Jo8VgcQBP8vKv7hvQVi0PBoXJIYrSiMazwl3upa5B4BPknaVPzUQ6pcaBcdSk4I+e9k4bQhGmd6nXhNwef7Yn8ufdGnrBwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 06:14:36 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:14:36 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 09 Apr 2025 17:07:43 +0530
Subject: [PATCH v16 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-imx-se-if-v16-2-5394e5f3417e@nxp.com>
References: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
In-Reply-To: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744198674; l=3712;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
 b=713XHi85U0SxWzIxuCrJlpBgb/YLmJUtM9uf2ZDBHPhyoI/ib5iDCPAKrC6L9xD/nGfYf9IX4
 ecRxI5TcGlcDqWsiUo9ibUZSMc3rOHxb3rHYpiIKOvxxNxmCxN7IiMj
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fe2ea5-e5e9-4bf7-df05-08dd772dcdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djRwN29iMk95M1RQeUs0U3ZWVXVNaElvWTNYYm1FVXAwYUZXY2lPOENoMUlS?=
 =?utf-8?B?TVJJSHZtQkY5dHE5a1VETXVNNWJLN0ZjSWFEWGVxOWVzOG00UXloRTV1OG5n?=
 =?utf-8?B?bDZGUnVacE1LQ3Yva3U4cEovT1lzdFpTUmZQS2xLQmxoN3JvL3ZSTDhIeUpF?=
 =?utf-8?B?NGRQamowZUdqYkl2YUtEazNCQXBkM0h4d1NuRS90NHFpNUV5UWpXVVppT1A2?=
 =?utf-8?B?eEZYeTZVVDZ5WThPbnVpT3pyMzFQT0pkNmNodEliUlFUZFAvY3J5OTZzeTZF?=
 =?utf-8?B?elZqdVJjL2M1VTlXa05IT2pGUnRvZFJTUDh0YzRjKzhZNEpYZTFJVzFKNkh0?=
 =?utf-8?B?OTRhUmtlYWxOdlVpS0ZETHVwL3ROOEM0NHBNRDZlYnhxbUlyWDJGYmJmeEVW?=
 =?utf-8?B?d2FmWW1vNnVmaG9ZRGhWdVRPS1J1WnM4SVg2TEc1STJuZ2MzVHM0M3dCRS83?=
 =?utf-8?B?NlpnZkU2dXptRDZ5TVNtWXpwMXJXdXNVNGZWRGtTWEVnUmR4UWpkc2ErODZW?=
 =?utf-8?B?T0g3WUlPM25xYkpIMFhBeVZWeEI4eHJQenlZZTdVcHROejNXbEVPdUZvMDRM?=
 =?utf-8?B?SHBBS0dDUFFHS3plVENlMUZKK1YzRGJ6akNSNmNybGJKcWdVOWd5U1l4TjVW?=
 =?utf-8?B?SEN0MVZPZytBQnhkOG5qa1BaeXZCYmh3akhRR1UycHZhSWxGRS94MkpudmZN?=
 =?utf-8?B?S0FUYURPeEM1WU1YMHhLYWpXay83T3liS3B3V3RlL1cyK1kxRVZKdlBSNDM5?=
 =?utf-8?B?U2lNNDFoS1dmdzVscVM3c01KVU94Z1NJUnZpRFhMeWMyOGdSeDUrdS9YVTRB?=
 =?utf-8?B?YVNZbzc3ZmE5Ylh0TFJQV2V5WmJSZjJIc3c0N21HTzVSeW51dEZ1ZWN4c1lM?=
 =?utf-8?B?djVjT1hrSHd3b3k4WG92Mkpwcmg3SXdUN2U2UllUTEZrRE53aVdncFNXbjhK?=
 =?utf-8?B?dDlabFYzQ0g1c2JyQ2lobTRJK3pjSTVUQ1Mwck80cE5FTEZwd0Z5aVFlQVNU?=
 =?utf-8?B?eXAzZGR5Mkk3Mm81MkxKK2lUYUpsNVVwRTJlcnR5aEVWVWxaTkVWREEvYVBI?=
 =?utf-8?B?ZGlWcWM4SjdtM28yZSs1L0gzbnAraldLckVrZ3VHdHBraDQ3T0UwM1lsbXdT?=
 =?utf-8?B?Z0ZQbjRGbG5Pbm1IL1JsRjZuSGw2M2xqWHVRVmRZS1ZkWnhOZVFkSjg5UXMx?=
 =?utf-8?B?TXpocDJyWDJEcGR3L1AyNUZGa2JVeklFa2g3aUZFWXpkcEIwdXZXaXFJckQz?=
 =?utf-8?B?SFlsVTF4dEo3L3F4YnEybWppWHhpTFptVDZCclNlaUIvSmZGTEFOZzV1b3pF?=
 =?utf-8?B?THVkdml2UGxIYkFHRU1nZm1PSWIvY1RSZ3ZxOGgyOEdZbktheHZrK2Fzb0dl?=
 =?utf-8?B?OWJBTlJncHIvUDBVSWdTcFRUTGxjR0RGY2V4OVozR01KTTVwem1nVEVGOU9T?=
 =?utf-8?B?OC9LQ3diOWJsTkU1a2FlWjMycWRJTTZRcDlXNzk4cHFaUExPNWQ1NlBldWdx?=
 =?utf-8?B?cG8wRm5xbTVqQ3lzYmgvVzV5cnR4aGZhWmpGdmZXdlo0OHZYKzFjVWQ3S0NF?=
 =?utf-8?B?R0ZyNnFIMkFQbjkwZ3p3RHF0eDhCU0oyaXJNb1JQdWNoZWtqUjEzcDRuekt2?=
 =?utf-8?B?QnN1bTZFaHRQMlc3SEROQWJLRWl3dWU5Q1lBa29TVkhNTHlPVkpnNkU2cVR2?=
 =?utf-8?B?Z1o0eEFvc3JKVS96ZUJFOEpZSWM1YVhseVhVT2hLeXlvZGdQOUgwYUFJNENY?=
 =?utf-8?B?c25YYklLOG5UT0dhQ3ZWZTZJNm84bXV3UUJVQlFXbUhzTS9lU1d4RjFaOHlz?=
 =?utf-8?B?UUF4eWg5SzJUVk1MOEl0cUxnWXF0TnBQcm5vUGZWem1rQmlzMmQ3Ky96emF1?=
 =?utf-8?B?UDYxS3V0MUJlUU1heEdxdXZHZnFvcXQ4ZGtQSFlWU1h6cHBINVpPbk0wZm9Q?=
 =?utf-8?Q?3MmaMZ6z8Gs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3VldVlGNlJ5Q20rdG50elJMb1NLbk4xR21Ia3p1YlcwcXBDcW41L2ZPOGRp?=
 =?utf-8?B?UC9rQm1KZTJFVm9HamVjRERLbW83cHFkVGxZQUw2bUcvQ1BpOFVvMWtiMzY3?=
 =?utf-8?B?d09ua2Z0Wnh0a1duWlVpZSsvczVscjNzOGVNZUNvT0RoTThzblY3MUNsbXRQ?=
 =?utf-8?B?OEhoS0t6TnAxYjd5V3NKbk5WZUQreWswMmI4UEM2bmwrUy9NOWh4dHhrUXNC?=
 =?utf-8?B?bHljMENlbDV0Z0Q2UmR4NnJNWDZlSzVuRlpmRXJLNCszcnZBeFo1M3VoMm03?=
 =?utf-8?B?Q2FWMDJwYTdyQytpVWpsMkpQMzZ6WnhtY2ZPZFRzRER6OTJPWitpQm1vNGFN?=
 =?utf-8?B?VWpYdzNyWlJ2bWZEalJHb2JNdzdZYWJNRzhHSEtpN1h1VW9DSUVubWpzRlVY?=
 =?utf-8?B?L3pHRksvd2pqSGNyM04yOG5VZVp0NWZ5a0dPQkpmMmc3TWxjc2NyZFZVZWtD?=
 =?utf-8?B?N2xwOW5nZTZrcFI5aDZnclpHZGxEQlFMMEdXZVVxRWhEM0tneU9QVGg1TVhU?=
 =?utf-8?B?RDhqSDN6TFM2UCtoL0NjeEUvbUJ5ZkpEYUVveXQzRW1TNmVDclYrY01ZODRU?=
 =?utf-8?B?ZUVzZ1lGRlZzcEo1Z2xaOGo3bVJBRjRTUEZ5Y3JqR01XTEhZYWtHdVFaVWg1?=
 =?utf-8?B?c1BOOEo2Q1dZTjM0NEVock5oNzhNSzlSUVlabnpCc2o0UFdaOWdXUXlrKytO?=
 =?utf-8?B?SWhyamlGdnhPS0ZTMkUvakw4cHFZakxUMnR4TnZsOGRxRjJIYjk4WlRDemlU?=
 =?utf-8?B?UjJnblRmLzJFd1VrZ015OHJsTmF6eHdsclRIc2ZFbzdHQkx4dXk1UU1nK1FL?=
 =?utf-8?B?R3NUTlBoUktueW40T1FRbDhXbUNoTUJNN2tUVDJacERxV1d5OWF1aGlCZURD?=
 =?utf-8?B?VFc4RzFueG5ZQlUvdXNBUGcxS3FEN05rNmpXQ1NJTDd3WVVQNHJyejg5Wlpn?=
 =?utf-8?B?Szd4L3RGUFRBMlU4Y1YyaEFvNXdNU0FKNnQrTmx0aVlud1lGQ1lYcVBxR3NR?=
 =?utf-8?B?M1ptb2ltejBLOHU0TVdoWlo0MElIOTg5Unk4NXR2bzBVcWFPNG9uL1lSdGJ2?=
 =?utf-8?B?MjZqaTdFT2dMRVZuZmNodldENFpiTEltcDRJTjFXR2VRR05PYkNud0FIMmoy?=
 =?utf-8?B?WnRQRG1tZ2k4K0lWMm4wd1ZmTlcySy9DVWs3eXdOZmFDeUdXZUhXOEpnVzhS?=
 =?utf-8?B?K0IvRUlNcFpaeUJzTnEraFp6bmpNVzhOajdOMFVCN3hwSGxpQ2dDNk1IZFd6?=
 =?utf-8?B?eWR2QWtKeWhHZFBqcmxxY29ZOUFnY1NiOWRTYTB5cWQ1WElObGhyNTNqZzJI?=
 =?utf-8?B?ODVDL2pKMnJ3eXJaZVNKQkVsMkRkMVc2ZmZuWHZuWmhjbnM2Ri85T1lGNkZK?=
 =?utf-8?B?RFJiMDE1SEUwbHV3UzJKb244Z3ZneXIybzAvY2VVSWswWjAzRmo3bEZNMHpC?=
 =?utf-8?B?TXh6bURIQ3lnUnd1VDlCSGF1amJUai8vREdrTUlHRkwvYWNXV2NxOWNyZE9m?=
 =?utf-8?B?TUZza3FuWUhMNE5Yd1NsVzBZR09ZeUJqVGN3K2hoNTRNNkp1aTBDYTJvZ1lR?=
 =?utf-8?B?MjJkZXBaY2ZnVDZPYzB4c2I5TThyejNXbHFjRG1JYkhtRzlsQ1MrdzhQdmta?=
 =?utf-8?B?Z21VaXpOZ2V5cE9USzUrSzFNSkpGUFlMTWR2RHRzMi9FLy9QNGhOcjJwUTcw?=
 =?utf-8?B?QXRRTjdha0pSUWIwL2tiNEFrVUlwUVZxeG1ucmNJU3o4MUQra2ovZ21Eekl1?=
 =?utf-8?B?MVdadmprT0xDb29sV0pwRzI3VzNiWHpJUDZQb1k0U2xCbG1rWHpKUFF2MGo1?=
 =?utf-8?B?TU5GdHU4c2NFZVBrQnhxbXJlUGthd1NNclUxM1NLMlJDREcwYnRHalkxRCs5?=
 =?utf-8?B?RHc5cXRibTRwRGxXTm1iMG1Ec3piQlVPN09yZVpMblVxNzBUN0JwaU1NZXh6?=
 =?utf-8?B?YVdmalY0N25yN3ZneW02d0JDSDd3b3lNWFJOUHpJb2FHa3IzcmVTQWR6Q29i?=
 =?utf-8?B?TkRlQmVrTUR1UWhoWTliL1JDenpvRm85YVN0azJMK0FHeUpkTVlsdEN3M1I4?=
 =?utf-8?B?Q0g3NzdNUVpndFVQUFdYSHEySmZYbUhUc2NETzJybFVjSnl0TFk5R2dxbHpU?=
 =?utf-8?Q?ah/VdhRaRS9nv6pMyVIko1Va1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fe2ea5-e5e9-4bf7-df05-08dd772dcdc7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:14:36.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nM5nH1BP4NfNZvpUat6a4xbAk3oixwKXrJPsMH8C12aTRWAdAHk4ie9KSFHoWd4wBBNw9AOj4CDdNMrERYdrZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes from v13 to v14:
- No changed.

Changes from v12 to v13:
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

