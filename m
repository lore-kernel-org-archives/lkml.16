Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964025BF16;
	Tue,  1 Jul 2025 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353608; cv=fail; b=qufnUfUlJ8NX58k3+XZTg8qMGnosjfSU3emzzYwN7sSD5tSqL+Z4/RQDYE2/iWAUUH0wCVCk/NdXCs0U4KtjfNVtmBpQ/aeqG39Y2lY3K10gFwSG3bemmd+5caoZHXD7xchSj2NmdBU3sFy/KoCMvHCbVZSggG4SyraGYwa1cyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353608; c=relaxed/simple;
	bh=QFUFLwctUe02mPvqS3SIv+LGdsgWsxztYTPtNGj8TG4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GQVr6JRBg046zmtCsM/4tnIyglCCwwRB6/z1Fwaw9WftAKZwNgDJxHnqkeqh7UdneiL8lPegR+WzBEV66ZQts1G1tjKAN3Sw1W0S+LzK/5+aBbLIGK7IvwvATg7kAtxxdS7DC6nIJxZ7YSa6nWoFENMQI+rrAPhXE/T1sdps3+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c1ZmlYZH; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c1ZmlYZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrjJ2YjplzcrjVUz9OSYYZCfladrJ56uivdGWJm1KQ2a7fCc5wKnmOc5a/aTVGQdR7K939VKca90p4jcSqoEMyiIwHmmMYXWbteE8pwYjfT3vwe0iLEcuq/Dvj6CDlYkURfcbt7eTioLtSaQeIC54S6k6BHM3XOJMXgUd494HnCfV734vLGTNtFOgeZgWlWwLdPZSb438ebgFBHdwOzIUZ3HccV8Hx6W/3CwPDAj8NbYNPWfYx/X9/4yT+D8F/rkCudOtIFVYn7Va9ANDD7c77o1SeKUzs8LoIUkTSdomNCHEzVGtOvuSKEEcRnvSwRgGHk/mfyMrE6yIV5iflhEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ32sg6GaP7DM2H+45rf1RZ2KYAPJoBSkcCrBjbPZpE=;
 b=w4GhpZKWoYrEpbDFEzILykNlO7zpQtJWG3gMkMSGFUnw/wq20GG/ZpY4zXv++GXjJ7DUevnO/MrQoYPLe9mX99qb3z+VtsUgfpsVQ5TYGupNZziaevK6hMyVgxRnbFplVRYoQCOwo5iaF9znYoRBbeeLwNd+20pbrhr3iU73Vy1DrvV5VDy1pZrYqto1ZI5zj4uJ0XSXOkYkG1+aMbyyBgr93cWkJbtuTtnnuoJ/FS+lkz5BYJXKf8SzjQVdie6neb954hwJMYi6+Es+H6y5Yvc1H2UtLkgBSDGSfBWEEztkIMMxTLvLcMeDxwgFpVDU+sBIGrtHf/c5fKVcQghMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ32sg6GaP7DM2H+45rf1RZ2KYAPJoBSkcCrBjbPZpE=;
 b=c1ZmlYZHAQceDPkY+VeGNzDRyK4F8cxgj/xpDjnmBBchyE+DmQugvpAcgw545mU5gFhPgrAai8cLKaGVj15DI3DXQxDtXtUWJbJB6vbQJIq04855AjAJnsXMljhjQIBz9fT25rTIusVrdEOE3tenakLBOwpgCQFz9IZxdirxkCZDhI0/ipSgndL6efeu3Ptf/5Zocr4xSqrdGoTqpG8VGzL0n932FbUeTe9Zo9Z7zHL0C0efrUSCbnDWDXHA3lQzKQD7GeOi/au4IDiJMtrhTYBCYaO7vV6x5ebZPRtSX8B/skTGWJwNGo+y29d/NNyXOINgKUV0nbgdqX8o5FgfWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 07:06:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:06:45 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 01 Jul 2025 15:04:37 +0800
Subject: [PATCH 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751353495; l=1562;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=QFUFLwctUe02mPvqS3SIv+LGdsgWsxztYTPtNGj8TG4=;
 b=ab5NpDi/F6t7kdGjG9OXGButVlZA6wBwvTpiPiqdoTMB7ae5IMvf/LoyqEWltMADOE3Qlgc25
 WM958UMBYcZBEjjj0Ho5j0URnejzDpEWZTxCS8HT2SdVCGmvLTboHzz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 9674d372-9d88-435b-63a0-08ddb86dd6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVg2UnZNdjNRL2pGMWNIeHkraysyYVhSVU5WZStkOEpYVmRRNmltUU1YSHAy?=
 =?utf-8?B?dWhPTld6ZzRiYjkyeThrdHRlZFV0UnE4UVhpVS9zaVlkTG5NaUNqUjQ5OTls?=
 =?utf-8?B?WW5kS0VwdTUwS01tZkIvQzRxTU1nQytwWG94SjFwN0FzdkplNkp3YzJWcnlO?=
 =?utf-8?B?d1JJdkdnazBxblRKYldyYkV3OXFnM2J1cUVnTjY1RTc2K1N2VlkvbEdxVGNr?=
 =?utf-8?B?cXFwci8rR0g1M2V0ZWZ0VTdRWFhMSVJHRUd3TlNrU1VkSXRFZmliT1hsOFZG?=
 =?utf-8?B?cWtQVndmOGM0V0hERnMxemRNdThtNDkzOWI1V2JoWHNqSVh2R1A0akhIVitJ?=
 =?utf-8?B?VkJjSHlxejRPOXloSkgxditrVFphSUY3SFFwem40VERzWW5RVnlORTZMbHI2?=
 =?utf-8?B?a2JSeHd5Y3RPMU9KRUdDR1dnMEhEMSsvOWpLY2dWZDE5MGV3cm9kcGtGNGdT?=
 =?utf-8?B?cXdwT3JnOTlWalMwMnRia29Uem5VZnpweGhCZ2laOHpVK2dYV1ZBaGtUYTNL?=
 =?utf-8?B?V29oWlJ4V0VUcHRoU0FRWm8vTzJsRTRta0x0eFFZemNEQTZyZ2dmY2t0U0Zl?=
 =?utf-8?B?ZkltT2JmN1pQWFBDakNXNFcyVXVES1I5dG11ZE9VektmR0UrTWptRzdSbCt5?=
 =?utf-8?B?MjRWQm53Z0M1NllCZDQ0RGIzd1dQam4vejFvOGpQUDAyTnRJemtoeTgyUWlo?=
 =?utf-8?B?VkNxWVhubWtHOGZIOFpKaGplaFhYVG1VRGRlRDU3M0pQK0ZuRFVsSTZDemdO?=
 =?utf-8?B?ckwrejVEcmdncWZVZDd1RWtJUUhQR2FCbHFDZlJkTUhHKzluZWF3UlVSNXBy?=
 =?utf-8?B?VFNlTkdzUWZqV3h0MldYYmM1NkV5Y0poRjcrVjVON1J1TlR5R3BFaG1zREc5?=
 =?utf-8?B?K1N5Q1djbElNbzhFSUxuZFhKNS9NdkN1RWxCTm9FMTNGQVRyN0dSL29vcEZ0?=
 =?utf-8?B?Ykt2di8zQmk2Y1QvU01tb29xZVNacldNTVZYMFg3NzZtV0t1WURkTmdUbFR4?=
 =?utf-8?B?VS9NVGx2aFdSelV3S3Z5U1NtNjJFTGJDd2tvM1BSSU81ZVh3M2tZdkI2b0xW?=
 =?utf-8?B?T0djMDRsZ3hsTTVFT1k0a0dHRGJla0xaU3NaWVc0Uzhqc1pzVEFMVTVXNWFS?=
 =?utf-8?B?Sm02akl4dEhacStFNkRSZnlUVUtEOHRpRzIzVTEwNDlBYkhyL0JhVldHZG1Z?=
 =?utf-8?B?RzZ4RUdSWmwrQUJ3cXJjZCs4UDhCa2xHbkdNbzZpU08zTWhsOHdMb0pLWnJS?=
 =?utf-8?B?Vi9rTVRBYTV4andpTGVsSTRiSm5wYW5Dd0RKM0J0NjcxcWxGeDJ6MldLMStB?=
 =?utf-8?B?blp5bzVZc1F6VW5yd3JXaER3UjdUbHc1RTRtSGhVTExpZVMwMkhRL09aWEtM?=
 =?utf-8?B?SVk3cW14ZlU3TWdIT0pxNzMwMmxZOW8wMWZsVDNZUWZvY1k1RzlSYWNtTXVz?=
 =?utf-8?B?dW5NNDlMWW54bTVuakpsdE9YV05Uejk5RFlxa1N5R3h4VzkwR2FCMTdvTWpr?=
 =?utf-8?B?ZklpdVZDZU5vMDd3a096LzRHYVVUbStVdUd4MElIUzFBQmU0THdoNVlqZjln?=
 =?utf-8?B?Z09vaytaaFBXV3pwL1pncDNiQlNvL3llbEpJU3NkazBSbjh4WktkV1JjRjhT?=
 =?utf-8?B?TTJnTWJtOVpLVm9ETGgwM2d5K1F2Mm1YMU0wYlhHSEFJUnUxendEOWRabFFO?=
 =?utf-8?B?T212MFJUR0V5T2NMREFDVHdnb0FObWRTd0tPcXZ1S1lMNWN2TmZDN2xXQWw2?=
 =?utf-8?B?dUVvcmdtVitPN2xINFZqN0VEam15RTViQ1ZWMXJIaGN3VWhPT0VpUUdBc0xU?=
 =?utf-8?B?Z3hQZldieG5LVXNDS2pCeno4cHJkaDhBUnp4MmkvYTVNVDdFL2V2OXRYMXVG?=
 =?utf-8?B?STVOSlZOb1QyWEdsb2tjb1crNHFjUXZQN0pCTnU1TkdKejdMWHVIRVhDcDRx?=
 =?utf-8?B?aGN1c1VQVC94Rk4xbUlibjVmL3ROVnNXYXFUUzJhMTFnSDExVXpkclBwczN1?=
 =?utf-8?Q?GSrTLQhKk8S/tsdedg5Wz5rXZtHx9M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R09BWkJoeDFrSTRLR2Jnc285N0YzbC9XYksxbHFYSDl5L3RFTzlxZ1MxS1lt?=
 =?utf-8?B?ODdDWWgwN0F6UWMxaW9icFRxVy8vL1JveTdGNzVmSkpGcklRdkR2c1J6eUFt?=
 =?utf-8?B?MUFKb3o2bUVWempVckhsbUM4WHpGNUorenA2MG5rbFBVWGlSVlg1cGlnQTNk?=
 =?utf-8?B?UWhNNDNQaWJZcjJIRUVXemowTmxidlQ2dkgrWTY3T0loVVFTdWwzZGhLV2NI?=
 =?utf-8?B?eHg3Mml0OW5SczY3aFYrODNiOUR6TEpiZVNydFp3SW9BcWxJNm1lalltYnBC?=
 =?utf-8?B?Q2d6aURXNjFLNTU0ajRENUdJNkVOUFN1dXhEcHpFVUlmZ2VYNFd4MGd4a3Zk?=
 =?utf-8?B?SUJXeFZxL3ZiQjdUM1RCYktPYVVhNHlndTZhdVZMKzFKQ2FBWWtINnUyZHdP?=
 =?utf-8?B?Z2plNFNuVWhQQkY2T2JpWVFRTWE2NWpZaDNNVG8yenBLMXhZRGtWdGppdXRQ?=
 =?utf-8?B?YklTYy94M29PMGhoL0xVNTlKN3RDVm82TDVDNFo0SEpDTk1TYjIxaHlRRjN1?=
 =?utf-8?B?WGRBWTI1bVhmM2FZMGZTUjRWR3d5Y2FlNExPR3dQRmRvbWYrUUpmZ2R0ZEVH?=
 =?utf-8?B?UEIrOVFZWFNYSnAvaEgydmRnTGlXK2cxWGt5MEhja25kVHZOUDBRWEVTUGY0?=
 =?utf-8?B?YWNVaEd2Wm1ubW9QZDg0QU02N3RQV0Q4eGpMYXBtSW51K01UWFVMWDZzQnRK?=
 =?utf-8?B?ZHk5bGNaVDgzaWtZNWlxQUd5QTVZR1lnai9EamJGWnoyd0gvQXBOMWNubUFr?=
 =?utf-8?B?TUVCOTYyNUhzeTIvcWtSQWtid1N6R0pBc1hOWFVjSmxIcXVhTUhCZUJUdG5L?=
 =?utf-8?B?bEVEOEdKMmo3KzhReE1KdHRJZExSUG9kNkdYamV3V3RsZ2hPQUF6c0Ixcktt?=
 =?utf-8?B?L0dkajZ3NmZCeFdQMDdjayt4QWZsUmdtWVFncVhENTEvY1Rtd08wUytLT1BB?=
 =?utf-8?B?cEFkTDhDaXNFWVBxQXNTdTZzS3VmckNCZzZsRWZFL011aVEvR0FXQkJ5Y0hj?=
 =?utf-8?B?V1diOEMxRm13dTl3UXA2aTRFaitsS0JPUjJVTitBWmVicXU5cFAwWHBPMDhE?=
 =?utf-8?B?UkgrUC9la0ZlcGNNWU42Y0NCaWN1dEFEZWk4dHQzb1N6WmJmVURWZHJ5dDhI?=
 =?utf-8?B?ekszNEd0WFBJaUplU0l6WXFWeGV0TVh1MG51bzhMekN1V3lMVG5YUEJLM2dG?=
 =?utf-8?B?WldnRHRIT05zU0FoMTUrZWxTazBtQ0xEOVh3QklSN3EwRWF6dnBPYWcrcGNE?=
 =?utf-8?B?Tlk2dXRyV3lETEtjZVNiU05CQjFtTXUyOU1obFVjSkhyZUJ3OEFnZnZIM0Zi?=
 =?utf-8?B?M2FmUjZnQmZKMUh4NGlkZ0huUno2NXlLMSswbThrZ0tnVEhNTVRsT1pUOG5w?=
 =?utf-8?B?S1hJYXM3RFZqZU10ZHZZRHVJRVM3VkxvekNUWHhobkdMbVRtTjZpeEVHamo5?=
 =?utf-8?B?eXpXOStlam52UTVXQitMeWovOCt5THNaZ0xjdkd4dXhLVHRGOWRQdEtkd0Ur?=
 =?utf-8?B?UTE0ZytZYzl2TkxLMkRRUFhEa2xDeUppbmJqeDZDM1BVYkwxdUR6R2xyMXYv?=
 =?utf-8?B?MlZTUVkycjJCZzdoQW4yc2xFbml2S0hGYWl3TW5yem5qMkl3Y1VsTXlwRm9B?=
 =?utf-8?B?Y2FpVDBmVzI3QXQ4UU9IMGQ5K0gvcjdvVC9RNk9GWlU2MjdpZG1kY29QcDhu?=
 =?utf-8?B?NUtCaVVraUVPbk9IRjB3c3c5UVQrWnp5NzhpdElzWml5WGd3SUtYSm8yamNS?=
 =?utf-8?B?aHRkTHFvT0pmNUpqRkRDMUhvNUpaVUtSVS9jdjBxUTVKTVZGaTcxNG9ib3Bx?=
 =?utf-8?B?Z1NKdERGaDRkckhzeWw0M2NyZUZZNXBTcjk4ZUVVVGg4TE1sbDg3czlNRi9q?=
 =?utf-8?B?Y1E2Q2F6Q2xNenRSZ3F1R2ovVXdQamo1dGdsM21NUDNHMHFwdFN1YUVEZ0x2?=
 =?utf-8?B?UmMraXNuY08zbkIrWjgwVTc0cDBLOXVVczBrUGxUMk13WldJUGNCZ0JwUXND?=
 =?utf-8?B?c3RTdUthZldtUWlXNzk1R0ZXbEFOazdnMGE3aWM5alBoUWNxNzVOL2lDNGlE?=
 =?utf-8?B?LzJmbGl1QXdBRzk0MnJTMXFCZVovZHgxdWJqeGdnVjhRbC8zRmMxZC81ajFj?=
 =?utf-8?Q?ykqvecFKXaURrT051386xkPeU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9674d372-9d88-435b-63a0-08ddb86dd6f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:06:45.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZAhyk6K+llRscak6pggnTtfLQaFFJbptmZqsMaew92qs8S5dvolrBaS0IlBM3P4XW2KBVGAVR22vysYc3ifuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154

Add i.MX94 LVDS/DISPLAY CSR compatible string.

Add clock index for the two CSRs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
 include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..4e20e8c8663b3b6665ff91ae63e1539aa8e9cc9b 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -19,6 +19,8 @@ properties:
           - nxp,imx95-lvds-csr
           - nxp,imx95-netcmix-blk-ctrl
           - nxp,imx95-vpu-csr
+          - nxp,imx94-display-csr
+          - nxp,imx94-lvds-csr
       - const: syscon
 
   reg:
diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad885b5b1e3b1f248a1
--- /dev/null
+++ b/include/dt-bindings/clock/nxp,imx94-clock.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX94_H
+#define __DT_BINDINGS_CLOCK_IMX94_H
+
+#define IMX94_CLK_DISPMIX_CLK_SEL	0
+
+#define IMX94_CLK_DISPMIX_LVDS_CLK_GATE	0
+
+#endif /* __DT_BINDINGS_CLOCK_IMX94_H */

-- 
2.37.1

