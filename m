Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2046.outbound.protection.outlook.com [40.107.249.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A12586E0;
	Fri, 25 Apr 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588334; cv=fail; b=Jrja3DpvAGtIJeeJSnqb6LEDaPEfoBpnB9ojViMWb9mcHRlHgCiugv+nURipA1eZSYCoyGjstiOH7AyIlA71eHojIfOGFlpfl14AL+6c9BjzZ6eQ92Nv3sv86Y0PJJl1eWlLWBuFFeoK/oCM8AD4vHwcOjghg+/7wSZzNQHbtmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588334; c=relaxed/simple;
	bh=h8QmjnBsBsW9VB1WQgn+p9zw2tIy7mxRW0EdJPrrtEA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pSWAg0rCHUBa4XbP7jqK8Uh59qVoP4eSQdbqtjUxlgDK4xQq8JwlTfEffI1evzXo7D79wcKQcw8fXLKq3qxWE5/TK6+ZnIpcPgVx3XFtmbwv2o3etItsypiUc/8jF+8KMmVt8BnStBOxBd0kXyF8ctyoV/QiCw+ndGNsxfgbEAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cd1kIcL9; arc=fail smtp.client-ip=40.107.249.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cd1kIcL9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGlN6xL08mkEbwaoO+kAwQk9vPdv5vPLYesyvolf+HRu/kcZjcFE1UxJZhjXZjdKfMi7/q8zedd3wUHKpS5TEQJ072oBzKHEADk+sF8GLPt1fZ5+Z1PUUA4M6iqckSPo8I7zEhq/eXOSB4s1NGvdysCZCADElWc4DAYhRg3SYHPRhfK5W6ENCWp+6wDGBFpittIm14MnlnODYSd1x0ffobJt5zKRME/taCOcoZAOFdtqogH32qh6qFThIZzS0GN4FagnqGseRhUTu2tCdtvESd5YcW3VQCEoI7B5YRy8K+FiQemrBYnL2gp6ccXw+K7qktodhxNbzB2ICnDlVVU9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyx11DAjKOR0PF/NAFGijXHWKo3vJo0kSk6UR026Xbg=;
 b=GTgcggMakq3mZHUI3WHuXSOzlhiTW+syyMcnRHxY89ut1FVQafYeMc5u9D7ObejimN3/u04X7ikvl/WT9b/PPfa1ppunUwJoO4o/b39vnytWCPqPjfU8xYEFff74DDtVhjP4ov8S12J8yuS3WVTEI4YtuqUoslV5Pg8asFK6oXAAqIlH+j8L+EC/tc/BRdLLk6PtIOWW6U7g3jXLiwYdN/tWnUWAmLApXkJAjkCwoKCX09+iev6ytFhitJ6bK9U+7d/3j3bvsDg6s2UgaCv32pHxMo3hp2LCp3WX72gzaxEcIpj6xynGvpbzVsUirGUbkTHj9rwYXlsVtGdKCEiQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyx11DAjKOR0PF/NAFGijXHWKo3vJo0kSk6UR026Xbg=;
 b=cd1kIcL91HVkaZL3OH8hMGP9diYtskN8ufhliQcX6lxDVMme1GmQdYSjzJtfuhAN8R+cW170flS/EG3psPBfSRo/h4CQkUCuWc64O+miJiePOzRq9eGxYHOG1Ygiw1vuyj+FBC1K0JJh1qR8smqm6XCbuZtrhu6GgxQ8QUmxU2m02kPouVqK0aBlHw1zWztoS+U0TIRKX3b3R3W8xKHMkGM1OfWK5pe9HvhmrvalmboCEFyUSRFjDvdrwV4Pmht/xPk+hHGOV6FLFvEbecXnnbwd7W1homkKaNLb61zZwddU2ElsBQsVeuSA8JBYqxf1/RZCZyDnJYZJNuLaFzzQWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:38:49 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:38:49 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Sat, 26 Apr 2025 00:31:35 +0530
Subject: [PATCH v17 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-imx-se-if-v17-4-0c85155a50d1@nxp.com>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745607704; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=h8QmjnBsBsW9VB1WQgn+p9zw2tIy7mxRW0EdJPrrtEA=;
 b=QngitfLRe8dXwPGgIzNo5+/Kf0wB9KKcIb2Nvm24R+MaGoxhK2Zvzw3fY7rXWDbqgkPy6hNFh
 QrHLmdCknOICCVsypVnHQmMFClcDFfiY0KZmnTDFTsJQm2n7DQ+TCfX
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: d9067c7d-5c9c-424f-8716-08dd83fe8266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V01US2gxeDJmR1QwNE94d0k0QlJjYzgxNzFnTENQckwxOFpVa2dIOXJ1Mk85?=
 =?utf-8?B?ZExXQ3I1b2hBNXIvOEMwOUtSandXZUNtR1JkeDVXNGRYTEp5dllzYUloSitQ?=
 =?utf-8?B?Q1dYMmlCcmZGWXhSRzg4WDZ3Q2ZUZnV5Y2l2YVQyVmUzRVpPdHg4NG4yVFY3?=
 =?utf-8?B?M2hPbjQvMFhpZjYwQnhNZkVlSGV1Y3lRN0pDUmdmY3JxMmsyR3h6dGtLdm5H?=
 =?utf-8?B?cjg3TWNzWGNncjYrM0JpMXk5dG1FWEIxbHltSWtpSmZJUnJhdVlxdVRrZW11?=
 =?utf-8?B?YVBzM3ZoRXRjUWxSVk9rVS9NUTV4ZFRwU3RJVVgrTHFSRGx3aGhXTUdHSUhq?=
 =?utf-8?B?eDFKclIrZ3JoY2ZCNEFBRHF2R3Q0NHAwV280dDVPKzNib0pBZ0JzeEhDaTlW?=
 =?utf-8?B?T1RQb1lIL0JWd0JNMklKOG5MTFBVR0FVdFgzR1c0UjZ0NVI4YWZ0MmIyeERE?=
 =?utf-8?B?d29oT2FWUVEwRlBUaUlGQnlGWVR2VXNtN0hWS3drWm1OTEtkSFJCU0Jid0RN?=
 =?utf-8?B?V3FwNFZBMUw2amVuWVFJYjhETFh1a3lKNzhFT0ZuOVR2TlBsTkVibDdyUUsz?=
 =?utf-8?B?djYyNmQrUjJ2Y1BXSExPN1RseTJLU3QwUnlsbzZwSmcrZS85dFVseEdBcXFo?=
 =?utf-8?B?TkhuVUpILzJOYVYrVUtIOTlFLytDYVlibi9YU011aFl5MnhhMGoxeDVMY3Ra?=
 =?utf-8?B?QkdDS3pVTzZXQm5QVTB0RnU2bmJlMHBGeTN2aENZbXMvTjRRYVNLbEFwczcr?=
 =?utf-8?B?SHl0TGFVS2JQZ1ZEMVRIaGtFOGQ0ckRYZ3RoVUxySnhuU0R0U0ZTaForUHZY?=
 =?utf-8?B?aDhCOUdNNnFPaHpPREV1Qi9xTTRCZzQyZkNOSWYyMUh2RnN0eFJUR1ljcWFT?=
 =?utf-8?B?MXhhK2lMbHV6MVNab1V6dXkrMENIU3E2UFMrUkFrc0pzbVBJdmxmNFFLU3FO?=
 =?utf-8?B?aCtGS2RlK1BZMGErQ2hyN3ZkWEFzNlVXalRhZ1NKZHVCTEM2SUxieEo3anhM?=
 =?utf-8?B?UlIwNlU4ZldKZ1JaQ3F2ZUFNc1kraDdaT1YyQ2lFYUs0K1lsNjlmaXZoU1NQ?=
 =?utf-8?B?M2xCanFjNVpvRWpzQUowNkFRV2FHRStWdURHYW5hZTYzWGpoWXlORWZsOEZJ?=
 =?utf-8?B?dmxqU1NXRk1Pb0ZHSEdybjJtN1loanJhS0xVTzl0cUN1MThzcFkxYXFxUE8y?=
 =?utf-8?B?aFo2UjFpQ2RhSVh2QjdRQ1JVMlUvRTZDb0h5NmpnaC9SdnVsY01CT2RXdzFY?=
 =?utf-8?B?QW1QMnJQbmZ4aS9iSUIvWUY1SXYrZEFrdXI5aGl4Z3A5Z2dYWFZyUENqdWx3?=
 =?utf-8?B?aURkWmEza1JEa1NtMm1zVklsci80T2Q0V2dOOWZGVFpEVjJGV2phNC90ckZQ?=
 =?utf-8?B?RjBtU0VTNWZIYktFaWlGYTk5T0lMZXlSeWVSbjFMUjRPOWtWdmlaV2hRZ2Qy?=
 =?utf-8?B?SEpCU0hubUd1WWx6ek1PRHNld0k5RHpOZzRGOUxpVUVhaEp5SVZ3b2x2c1hJ?=
 =?utf-8?B?RUFJcDBVM2VMTVNDK3VROEVjd3orellRbjRGZzNXbS9VRDVGb0xTYW92NFJu?=
 =?utf-8?B?VmxBRDYxbitBUk5SOHJWRkU5SzhBVEdYV1pHZFp6bkM5ME1TVFVGYytzMG5L?=
 =?utf-8?B?RXp4bENFd0FSekFKQjk1VVBxd2FiV2hxQ2ozemJKcVFoNFNtdDZvVjArcnMv?=
 =?utf-8?B?NDhGUnNsbUd3dGt2VzdsQTZ0dzU0bmdnWEdqcjZMd0ttZ2RuQjlmNUhIVFpX?=
 =?utf-8?B?RmRaOVZqMnV4TVkzNkNwZy9jeStEOXU3UXpNR3ZIUWY5N1l6WmJGZUlBR2ha?=
 =?utf-8?B?N0orMGNEbHF3cW1yR3IyVVV4WkVaY3AyVllHTWpVUmtSRkVzSmxkbnU0enRv?=
 =?utf-8?B?YW1uV1NJYm1KMnJVRGI0ZWxOaXJZVnZIUlBJcmc4aWhwWkQ3SmRtcForYlMv?=
 =?utf-8?B?OXlzOEYzL2lhSmZSYng1TjJzVC9iZGJZNExmbUZlSVVscUlxYmNCL1FyUHMw?=
 =?utf-8?B?a09ZZXJBNlh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmlKRWpMVnh4clMvTjFtR0kwczRTN1kwQVlHeFY4NklhQ3c3MUliS2tNNStG?=
 =?utf-8?B?b2pXNmlUcURlWkdWNGxMd2ZxWDhxSlJxcllGOHVDRWxEb3pyM3JTV01JZ0pJ?=
 =?utf-8?B?Z1Q0aU8zcDVhb1JiT0F0RDFuUGduMlR0UDVSRWRyNThuZHBCR3RicStrYkFv?=
 =?utf-8?B?WDVYYytEeWwxazRObTlCVi9MZTFyb3dFKzNzL3liMnlNNSs0QmpyQzZ3Y1Zk?=
 =?utf-8?B?Y1ByeFVZQkhhdVN6Smt6MGlMYUdkRHRUZ1J5c0wrd3IxbGphTDQwaklzNFZ3?=
 =?utf-8?B?OE10SU5Ga3Y4L2lpOGhUSWJsVU1lU05wdzNwSmVUdkx3b3QrRXBOVXVpN05G?=
 =?utf-8?B?L2Z5Y2NaMU15Z2NOZXZwMjcwOWdIUXZqLzlvUHlKYVFmT2lwWEVQOHhIVCsy?=
 =?utf-8?B?OEpCVDJFOFhZbXFNS2xXQjJEQVplKzQwU3h1aEFydUN1SUxvdzVxQmtyb0py?=
 =?utf-8?B?Z3JlL28wWTlYVmd0YlVKNFI1Z05NMGFGekJZVU5ycFY3K05ReGx1NnVrckhv?=
 =?utf-8?B?T0NiS1dMMmpvN1FTRm8ra2tPbkRVUzY1R0ExMjU2UDNvN1VzODJ1bFZrTFNK?=
 =?utf-8?B?WTFRT2VZZk1BRnNTRlQ5cERVR3RYNXNZZW9Yc1pzdWtTK2ptempKSEJGZlpJ?=
 =?utf-8?B?T2QyK1hMY3JpdkFsWmx0NEZ0cUVOZXNYRXI5K2w1YktGTkFXV3MvRXc1M0ky?=
 =?utf-8?B?RjVqYk1RWXUxRy9iYjJwd0tQcFdzNjN1a01YSVkveFdpY00xb3puM2dVSzhV?=
 =?utf-8?B?cWNDa0pnQ05Qb0VGa3U4b3NXTGpEQkNRRHFraEd3QVRpcTFLVjJFUVlVQ2dX?=
 =?utf-8?B?eUdVRHdaUGQzWUt5QnU3di9ta0Ficjd5ZEx4OGhBdmxQWWlEcU80ZlphUkFM?=
 =?utf-8?B?c0g4d2pRNWxORU4yZHplVGVpcTQ2elA1NnVveGM4b2d2MjFvNGF2Z0lQUFFO?=
 =?utf-8?B?Z0tsMFk5SWlwWW1vZUMwYnI2ekExSVUzNlFWNU1ENlBtWTVEK3NXRmx3SWhO?=
 =?utf-8?B?N25iWkJEK1hjWmpxNU85dndWbUJmNytmZTdoUzlnZzc5T3AxWXByMzMxeGJO?=
 =?utf-8?B?OFE1ZnNyUzBFdEJEZHdBdFVzVGpqL0xiM2p3Sjdja0VLRFV5Zk9Hd3IwUFQw?=
 =?utf-8?B?cEhuTW1mZ0hNNnVPYkp6SDFiQ21pMVBOWFRuVnZBVWtNQyt2enJpVzJyeXpk?=
 =?utf-8?B?b094YzJxK21qNUt1ZkRLSFg3M2NrVWFKY1JJN0dLbzBqZXRmdEgwM09FbDE3?=
 =?utf-8?B?TEphdkFEU2VXdS9VSWYzclRoaVZWUDNvNXhVb21tQXhqSml4M1JwbTFuUWox?=
 =?utf-8?B?bXljdUlycWw2cDR4YmJ2SzdwM1YxMThubnZUbmI0bGJrdWlpZGN0WDQ3NWNB?=
 =?utf-8?B?K05CRTltN3VyendBV1dTaWhzSWFJODNYSVRwR3RJOWk3cUFhU3FBdWdzVlZk?=
 =?utf-8?B?VExzZUVrU2ROR3A2UmoxM2JYZkQwTFVjcllzMG9FVS8zcnpzZTYzVXhUb2tR?=
 =?utf-8?B?Qy9Ba0xjaURXMUlLd3BWaWlvZnJSb0tQVmRvSk4zUnEyUmoySGNZa2JsQnJX?=
 =?utf-8?B?R2J6OHdBTFY1SnVuYnBIalZab1hBNHZCNVRHYU9SRzlhemk1bkplclpHeC81?=
 =?utf-8?B?SjFjdUJMdlgxNVZPSWZteUxXVjBiSDJ6MDg5TUQxVWJwckFEWTBpUzdvV09p?=
 =?utf-8?B?V3E5SXdHU2lpMHo3NE9GN0RBdW9wSkV3T3VUdG9GdU10NjVaUUdwU3VpUm5n?=
 =?utf-8?B?TDJRaVpiM3MzdmE3WGJFZUkvcVdYMDNCRU56aXUwRjB0UHVURE9oSXo0L3My?=
 =?utf-8?B?cjNvUzluOTRpdVRsRk1yc3BlSGRxY0F3UUdSK1ZPQWUzSURxdGFYcVNGWFFk?=
 =?utf-8?B?SnlpVHFCalIvYzIzZ1VuZE1NZ1poS2ZqTURrUkpvWW5UM1JQUVJIRTZNcVEz?=
 =?utf-8?B?QnFTdm1kQXd3c0NpSUtldGc1Y3Z1ZUVmUWROR3FaR044ZGcxSFZxZ1ZRbmdL?=
 =?utf-8?B?ZHNkcTdiRDNhUFZqTU03UEZScllYL2F0TVNidHIzU0xKNjhFOUJkVE51OHVW?=
 =?utf-8?B?LzlyR0kvMnZGZkQxYUYvSlAyN1RPZFh5OXZzNDhMRVVLZzhxQk1JOWNSeXNk?=
 =?utf-8?Q?hp8Gr1E8ccFsjiHkm+on1hsem?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9067c7d-5c9c-424f-8716-08dd83fe8266
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:38:49.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ8mHx7nbVoWlsbER2EEUuisu5t+JC6WzrPQZSeJI9p5VD7m2CcWhR2/ST01aN5j6CljOsNMmYkj6G1QyeOeDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index cdae73686dff..c3ef9262c6ca 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -59,8 +59,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -109,8 +109,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -154,7 +154,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -199,7 +199,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -238,7 +238,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 748eb09474d7..f26fb4d55a9a 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 5f978c97da4a..40544cbc70ca 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -203,6 +203,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -325,6 +348,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b15c4022a46c..b5e7705e2f26 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -19,6 +19,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -36,6 +37,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -80,6 +87,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

