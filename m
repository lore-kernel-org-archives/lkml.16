Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2075.outbound.protection.outlook.com [40.107.103.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF691E2613;
	Wed,  9 Apr 2025 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179287; cv=fail; b=IA4lyustrnWregVfyJc90RCHPXbgWzbhR8F8PNWYs3Am4Bkt7bT2i1RmSszKwAxFRNtgNNFPu2n15P8DuQgxlnBKZ3bVCpaBXQTF6LFjzQ6LkDq3BCJA2O/3cWAAwdOMcLLaW6rxSy3VCCvfdkorAUY58JTohhA205mVpC+AQ+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179287; c=relaxed/simple;
	bh=B48tQDT524hp8InBUYX+blef0v5nyeb3FSjkePa8Vp4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sUDrkAfqn6Utq2yhuE5YdQN2wQrO/AwLhoCyKMjPLmMQBXsNe1FJoOTA5woAC9jLBidSU1IAzzc1e+RD1P642yVabI6fWEEFMNn1zQTUTbHhSZTnGG6ajkxQjlMG/jpT6n6IaZkMoH4X6QWK+hezn85syMUfkfzpsbIEPq+LAkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mz2lIuYb; arc=fail smtp.client-ip=40.107.103.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mz2lIuYb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKSrptMOIBgt7Z11R4HdJIqJaDM656dOlhYgDhM88YVCJPjj9pfuiwIkfRI1uENoCvksNGwpN2JnEsm1l8YoBPB4tj0iqhWnl9o5vzSdz/8MkYEHxbJfDSqj6kJoH4z8L/wDfB/ocNQSskAHZTEPVFG1LRei498VkuJLfUjnyvELJX2F0db70ExCLeS2+tOT6YTU2AT+luiy3uy/ZLsVb4bzdC5P3/60irZcM42MJKuIF0GyYSewlTs/qkXL5Elrco/gFWR1kIn5NqlWHUjXy1s22kHrEiWI2gwOs751ELE/rEatVs7Q8IWii1vlA45MeomwHjLxmcHvVd4Fucx8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbF9Z8Iwb0Yo43GJ1scPLbfmBaNSyBK/LRE1t6fs0NU=;
 b=m/5bSPhP4SO1lZo1GaWARx4ka+R+Sq15EJE/pSCYVpdob3ylT4B7MFq7QGPw8VgymerGQmWg8HSssrhkdZdapiMnhblPAKCWOaa5ZgE1q2fxNjizViqxVjE1LFi16QIh54gRodzF2rVG+kOvuzFvLasGGs/gUntXKo5VZng02grpWHfuo0wlkEoRMzmHKXFqSd1YVAIqXzPsqRsLS1NFMShpcRqixSln3us5xS9BYe+Bps76Y7rVIkry7Mu6Ut56IqgLOVgqFGKdqM+0fxoExGMnR2DIdJUZf4Jx9j0tqoP2zIQELdZ1FJNpgwDMvc8jDNchIFh1oWELyMSFBjguqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbF9Z8Iwb0Yo43GJ1scPLbfmBaNSyBK/LRE1t6fs0NU=;
 b=Mz2lIuYbipIt37yGxOKtqiQaKKBMSMs6uabnK7Rzoz8dwVNakTBdqOtTtuxx6gVoODRaf4k1VM/67Lw/zbe7tyU2vGa7zvTTM+26JUgVhCcpIo9X8rUU+WsqOmG6D2xXnbTH1+78pIBSehCdczriTDB/+nucFaWTf3NWGtZMZktse9pylJZMgQ30hi//l6p+eIwpB/DEJ5Jg7BO4BqggJCMIo+mRBJ9TmtD10mD/uoU6UesxFf02RZTRzJ2lAhbiwnvtnh02lI6iyJWYflM6p/E2TDpe2/YmJVQCJgCInDI37jXTJlHuB14uthY3U764ejwDsYYBf9+qZUh6qrQN7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 06:14:41 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:14:41 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 09 Apr 2025 17:07:44 +0530
Subject: [PATCH v16 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-imx-se-if-v16-3-5394e5f3417e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744198674; l=38045;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=B48tQDT524hp8InBUYX+blef0v5nyeb3FSjkePa8Vp4=;
 b=Rl8879xVMncO894xdnVcAwpMG34hrviAo6qzbPrNoNF1SvnU3YMwMetJjA8JCUodTcsm7UvB/
 8dpmIaVE6WgBnK4o4GR0UJ1rua6+5ZegACmBGeLZsBDzxDsd430xPAF
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
X-MS-Office365-Filtering-Correlation-Id: 4f6e5b51-7209-40c1-7e59-08dd772dd04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXdnTjZEQVdiY21xek9nK1VSazA4enZyak45NGRXdVFrWDQ3clpOZEdkZjFl?=
 =?utf-8?B?cllzNU1XYjY3NVcvOUxWZDNHTjBTcnZtTFlxQ2NZMGNKdVN1ZjlSVmRuZEZm?=
 =?utf-8?B?NTBsbXF5aUtMbE1KcGtGQitiWnVmdHo3VVdaMVpTTEtPbmQrelpWT3dneGdo?=
 =?utf-8?B?aFZ4REpuRHJ6MGIrdS9SWTFOc3BDVi9zdDRMV1daTmQ3Z09WTXFvcDdHdGJk?=
 =?utf-8?B?NDIxY2xqc3hoRXptWWdZejEvNisxdkN3aEp1USs2TWQ5bXJzVkRBdUpubEk4?=
 =?utf-8?B?enFoZnY5NU1XZVVOcytnMldyL1dFVm1ab1R5ZS9JZ3Fza0ZUQjFKNWVjWkVp?=
 =?utf-8?B?ZWw2U0RjeHg0VUN5b3FZNjBLc0lqTXliRVc4UUhhcTdKN3Zxd3NacVBnVkhO?=
 =?utf-8?B?aTZabStqbHIwL3hVQk5QckUzVU1lOFQ0M1hqYkZDaUVOeDdyOU92S0I4L282?=
 =?utf-8?B?YytibG5xTHUwNHhac2Y1K2JmcmdzNGdmdnR4K2h6TDVPTy9TMTVqeXlhYlVv?=
 =?utf-8?B?Wk9VeU14dkpoVEpFN1dNNFlxWEUwZjF0SVN4OU9aL0FBYi9DWVlESGhuT1c1?=
 =?utf-8?B?djMrU0JBSjdJNnA4akFmNlZjOVZvMVhDSHZZaTl3YXhwemNEY0xhYjFPc0hD?=
 =?utf-8?B?QVJOMnVVaGdBcXVDdDVObWVqRDlVcnRaVHZ4SCt5MitlOTRSUXl5MFlKMUY2?=
 =?utf-8?B?VStiUkxzLzdmYzMrV3V3aVZEdmFJN2hwU0hQVTl3SU9vNGI1K0ZRMkhCRUNi?=
 =?utf-8?B?bVptbnZlWHZ4MjRSTWNKSmE3Q2szVHo1Mkt3dmZ5NFVTbWZUamJRay9Fekh0?=
 =?utf-8?B?M0NzRUJJVndPMmJKbTdLTE9pekxlQnNrT2oxVWMyOUFQaEdwQUpONytpTFRm?=
 =?utf-8?B?Sk1KVEtIWXNkQi9nWVhLd2t3bmNBT2wvaVV3cjNyby9iVThjQzU2REtMWGVu?=
 =?utf-8?B?bndWR2pSRDZDUldrMHBacGZJcUhRWUR0V2dIWnZPMW1pV25OcEpwL1o0MTVT?=
 =?utf-8?B?SlNRTXpHcXdpNTd6dU1QRi9VNkNIak96Nm9ZSHNJQ3R0aWhRaGpFNlNYZlFQ?=
 =?utf-8?B?Wkw4Q3hndTZvQnFGS05PNmEvbEViODFxVkZVbExldW41em5BOWU4SDl2bHlK?=
 =?utf-8?B?c25KNU9FalhBcm9xdWNtcC9zWjZkUHNJSXlYRm41bGQ2UnE0bkNNd3gydStU?=
 =?utf-8?B?SXZFYXU0eFo1WU90L2FvN2ExY1VzSWhKVXRWZ1BJTk5wbTA2c0c4TkdYcFVT?=
 =?utf-8?B?TEZrbmpxU1ZlUkU1L3pJU29hc29XTVB4dHZjVjYzdzNPRnZlMjhVY21Rdi8x?=
 =?utf-8?B?MStLSmN4ajEzQVBZMTNPeFFWU2ZVK1ozcHlGMnJFNVQxTWlhZnpFZXlpSzJQ?=
 =?utf-8?B?T0J3UEMzWU9IekdObkpJTlcxK1pPOHNDWXNzY1M5MTdsVmNjWDhOUnFSd3BW?=
 =?utf-8?B?STE1Y0NXSFMzWVI5TFZ0SkRVVEpldWFFZTZ5aDVmdmxwMStRanZhLzZXKy9r?=
 =?utf-8?B?NFE3M0ZQUnpKNkNFWW5XRGZZSUNsRkdrR3N3Q1ZsWTdUV0U4OUd0a2F6N3Ny?=
 =?utf-8?B?NDJENk9yNmZPVFBSZzRJWjRIejNRYlJvNXFDUW1wQmY0VmUwVENHNlhVTnNY?=
 =?utf-8?B?QndVKzlPd3BXNGNrU2Y3M0JhNjNZdG8xOGowQ2doRDdaZDFYWEJrN00vMlVJ?=
 =?utf-8?B?Zmd3WENsNitXZElCWFh4cFJseW1Sb1ZDZStMOUZjZjVaY0pvWDB1NG9xTGM2?=
 =?utf-8?B?aEt3eC9rbm1LQWxEK3o0S0JRZ2FaL3dIY0JlTUw1UGZZZjJNK0FINnR0Nlli?=
 =?utf-8?B?VXBsMndOVm1zQ3g4R1BEVzRkeS9mTFpJakVNbGJaV2pNRDJ1dzlJRXBaMEEw?=
 =?utf-8?B?emYxQ3FocTBaK21JSHV3bjQ2eXM1L2w2a3ZzdUo1MzlHN3JVeWM2bll6Tjl2?=
 =?utf-8?B?NWZmWkNUcEZXTmNyaDBLMjhjamM2bHNmQkdMY0NpM3BVWk5wd05uQWNoVXlU?=
 =?utf-8?B?TDlHVU56QWl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akVWMTNMMUNyWXhrVll6bnpDdFdrdmZiSWVYRmtpblNEUzNRc2xCTEd0WDZl?=
 =?utf-8?B?TlNLL2QrY0ZTMTVHTkxrOW5kYTY2K25XUTM4SUJRakV5RzYvam1pUHlFenFv?=
 =?utf-8?B?Q0JCMWlGY2VrYVd2emZHcmpKdkJLUmdTYmM1dUhBdzdiNEJLSWpLbVlmRFN4?=
 =?utf-8?B?N2RuK2VoVG9GZml3REVwWjA0K24xMkduemhGTlVET0ljMU1LMGNPYm9NTUtx?=
 =?utf-8?B?M0dFcXpBb213dDFsK1pOLzhHaUt4T0NBSXRtUXBZOFloVmFUYzlnT2k0K3B5?=
 =?utf-8?B?N1pMWkt2R0VEMmRCdzdRekhmaFVEOEtockJtRncxSzQ0dFkxbWQyZlhGbmNG?=
 =?utf-8?B?aGFSKzhwTklsNDlvaW1wTGdsUUp2VGI3T3hrWUNkVFgxTzZaWGJiS28rRjQ1?=
 =?utf-8?B?MnNDWjBFbU8yYk5lL0xpb1RvRVEvN25mRERlMHpnTjV3Rlptc0FRbEJpbWk0?=
 =?utf-8?B?dllhb2QwM3JjME9ZcnBMUlBzN0l5MWhMdWxldEhEZXdEeDNTNmptQnp2M0dl?=
 =?utf-8?B?UlpHRGs1eWpTc05lVTJLVFUxT2c0aVpDZ09YRnUvYS94OVJaQXZYYkFNTlpj?=
 =?utf-8?B?bjhuZHg5ajFGdlE0KzEzR0VLNStRNkZhVkZkNUlLZTMwaDlqTmh1Z1JkaHBs?=
 =?utf-8?B?OWRIeU5YWWk2WTdtZFZVcWRGRWtzOVhiUXBaVnB1VEt3L0NPL1lEeDNGdEhC?=
 =?utf-8?B?SWdNY1cvWEovRXRudlNxd3h5ME1xUmE0UnM0WDIzUXZ0T2ZoMTZab054UUk2?=
 =?utf-8?B?czJhZUdvQkNwUVhNZGJ2OGhQMHZITG1HMlo2NzZvLzJZdjl2YlN0bmtHdFdw?=
 =?utf-8?B?dlQyVEFDTGIyeUVIaEVsLzBjTzd4MjliWVoxRTRsVU1jRlI3QzdIR0c4Q2tL?=
 =?utf-8?B?dFF5V3pRSG11OWVzN1ZLbGZhNEwvenNuNHUxRFNMSUlEWnRCZDQwakxHODlX?=
 =?utf-8?B?ZkhXNU5kTm1pS05EVG5qQkNDdXdpRkNpK3hwWDFLTGcvUWpiamhaZ0xEZlkv?=
 =?utf-8?B?bHNxNHk2dktOWk9WMWU3NjhiczNXcHJjZjVKMUhuUEpLY3JXa1Y2MjcraWcv?=
 =?utf-8?B?N2FlYWt2TmI3UVB6T3ZESVY3S0cwSWFramMrL2ZVNHNSSUp5clMyTUY5a1pT?=
 =?utf-8?B?cmY1MW9BdTFBWmJMVnZnNC92c0ppTnlydmo2SUFQNkp5REplb1h6L3hHTXg1?=
 =?utf-8?B?RjJrbDM1OFdKOFpnODE4OVNpem5qVkh5WUd6NmhFM0YzWTdBOXpENjNnVThL?=
 =?utf-8?B?VTJPYjBSTkhLZko4cTJwSGNoRllNSDAxUm02VWFxaVNrMlpQSWNsYlliWFhx?=
 =?utf-8?B?SFY2QWtsY0FJbHYxM3FLc1ZDOWp0T3M3QUZlblltMEV4ZkFzOUpDQ3lvNFpJ?=
 =?utf-8?B?MjNEVDBERVlqdElpdCtzcGZaWExNUStDVFNvWENHRWtmYlZmOHhBK3AyU1JN?=
 =?utf-8?B?T2dyRTdpYzQ4dXV4clVzdXppMkt3SGxjYWJTZllEZ0p3SXIrQm1ZYzNOR0Jn?=
 =?utf-8?B?Y25jaGNUQjNacEFSbjJ2S0wyZmVVZlRMZ2NwamxEVVFLcXVzQ3VWYndTQytz?=
 =?utf-8?B?bk83ZytJK1RwR2JuTjlQSGw2M2ZJV3IyMG9oZ2QxVHpyYnVRQTRWQlpHbEJP?=
 =?utf-8?B?dDNkcDJ0R0hPamdPTS82anNQb0Rpd1d2R3ZPcTVNaTduM2ExUnlRb2d6NGYv?=
 =?utf-8?B?NDVwRXdncTNaVzl3UDFTV1h3eWNGZ2dIclN4TTMxT1JWakpDNEdmNmJ3c2RM?=
 =?utf-8?B?bmprYVZqU3dXbHlrQ2NaMTJBV1loM2JXdWw1SUdUZXRaZ2l2M05ZaWtrb293?=
 =?utf-8?B?VjZqRjFHSnJqL2l1WDhrWEFOQ0tCZVRvSDVmS3UvR05XUUFEazM3SVNLQ3U0?=
 =?utf-8?B?RkpXNTkyYTlEc2lDbHh4M3N4Z0RQQ1k4ajdhR1NRdFFCbWp5MkZjM1dRcERP?=
 =?utf-8?B?SkZmYXU3bnZENmdiVytxNHp3bDJSdXhUTDZ0SGkyM2wxWEtCdnU3Q3NaWWh4?=
 =?utf-8?B?UFFCemc5WHJmWEJCUTI2anBNQkNnRE96QlFrVmZaV2tNSm5yNjNGdVdMMXZo?=
 =?utf-8?B?VitMZmdxQ2dIc1BFUkpvTjQyOG4vNjIwVzVLYnhNbUdWNWZrRGdsTVFmbUhk?=
 =?utf-8?Q?cVLnXqCThdiLoVx1N/XIXP8iH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6e5b51-7209-40c1-7e59-08dd772dd04c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:14:40.9724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/5EawdXi1L4/gxUPNMDMRcBGoLoqqcJ778NBrP+DDnWS7KaawGZW45g68TUJrz6VfZqH58IS3h9s7ihp0WHHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

Add driver for enabling MU based communication interface to secure-enclave.

NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
embedded in the SoC to support the features like HSM, SHE & V2X, using
message based communication interface.

The secure enclave FW communicates with Linux over single or multiple
dedicated messaging unit(MU) based interface(s).
Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.

Other dependent kernel drivers will be:
- NVMEM: that supports non-volatile devices like EFUSES,
         managed by NXP's secure-enclave.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

---
changes from v15 to v16
- ele_debug_dump, updated the assignment of keep_logging.
- ele_fw_authenticate function definition is updated to take two address
  as arguments.

Note: copied the change logs for v14 to v15, to cover letter.
---
 drivers/firmware/imx/Kconfig        |  13 ++
 drivers/firmware/imx/Makefile       |   2 +
 drivers/firmware/imx/ele_base_msg.c | 313 +++++++++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h |  96 +++++++++
 drivers/firmware/imx/ele_common.c   | 355 +++++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_common.h   |  50 +++++
 drivers/firmware/imx/se_ctrl.c      | 410 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  86 ++++++++
 include/linux/firmware/imx/se_api.h |  14 ++
 9 files changed, 1339 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index c964f4924359..f76ad32aad59 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -33,3 +33,16 @@ config IMX_SCMI_MISC_DRV
 	  core that could provide misc functions such as board control.
 
 	  This driver can also be built as a module.
+
+config IMX_SEC_ENCLAVE
+	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
+	depends on IMX_MBOX && ARCH_MXC && ARM64
+	select FW_LOADER
+	default m if ARCH_MXC
+
+	help
+	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
+	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
+	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
+	    Unit. This driver exposes these interfaces via a set of file descriptors
+	    allowing to configure shared memory, send and receive messages.
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8d046c341be8..4e1d2706535d 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
+sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
+obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
new file mode 100644
index 000000000000..3e3b684e46f0
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/types.h>
+
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/genalloc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+#define FW_DBG_DUMP_FIXED_STR		"ELE"
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	dma_addr_t get_info_addr = 0;
+	u32 *get_info_data = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	memset(s_info, 0x0, sizeof(*s_info));
+
+	tx_msg = kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	if (priv->mem_pool)
+		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr);
+	else
+		get_info_data = dma_alloc_coherent(priv->dev,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr,
+						   GFP_KERNEL);
+	if (!get_info_data) {
+		dev_dbg(priv->dev,
+			"%s: Failed to allocate get_info_addr.\n",
+			__func__);
+		return -ENOMEM;
+	}
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				  (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_GET_INFO_REQ,
+				  ELE_GET_INFO_REQ_MSG_SZ,
+				  true);
+	if (ret)
+		goto exit;
+
+	tx_msg->data[0] = upper_32_bits(get_info_addr);
+	tx_msg->data[1] = lower_32_bits(get_info_addr);
+	tx_msg->data[2] = sizeof(*s_info);
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg,
+			       ELE_GET_INFO_RSP_MSG_SZ);
+	if (ret < 0)
+		goto exit;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_RSP_MSG_SZ,
+				      true);
+
+	memcpy(s_info, get_info_data, sizeof(*s_info));
+
+exit:
+	if (priv->mem_pool)
+		gen_pool_free(priv->mem_pool,
+			      (u64)get_info_data,
+			      ELE_GET_INFO_BUFF_SZ);
+	else
+		dma_free_coherent(priv->dev,
+				  ELE_GET_INFO_BUFF_SZ,
+				  get_info_data,
+				  get_info_addr);
+
+	return ret;
+}
+
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
+{
+	return ele_get_info(priv, data);
+}
+
+int ele_ping(struct se_if_priv *priv)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_PING_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_PING_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				  (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	if (ret) {
+		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.\n");
+		return ret;
+	}
+
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_PING_REQ_SZ,
+			       rx_msg,
+			       ELE_PING_RSP_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_PING_REQ,
+				      ELE_PING_RSP_SZ,
+				      true);
+
+	return ret;
+}
+
+int ele_service_swap(struct se_if_priv *priv,
+		     phys_addr_t addr,
+		     u32 addr_size, u16 flag)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_SERVICE_SWAP_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_SERVICE_SWAP_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				  (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_SERVICE_SWAP_REQ,
+				  ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = flag;
+	tx_msg->data[1] = addr_size;
+	tx_msg->data[2] = ELE_NONE_VAL;
+	tx_msg->data[3] = lower_32_bits(addr);
+	tx_msg->data[4] = se_get_msg_chksum((uint32_t *)&tx_msg[0],
+					    ELE_SERVICE_SWAP_REQ_MSG_SZ);
+	if (!tx_msg->data[4])
+		return -EINVAL;
+
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
+			       rx_msg,
+			       ELE_SERVICE_SWAP_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_RSP_MSG_SZ,
+				      true);
+	if (ret)
+		return ret;
+
+	if (flag == ELE_IMEM_EXPORT)
+		ret = rx_msg->data[1];
+	else
+		ret = 0;
+
+	return ret;
+}
+
+int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
+			phys_addr_t img_addr)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				  (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_FW_AUTH_REQ,
+				  ELE_FW_AUTH_REQ_SZ,
+				  true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = lower_32_bits(contnr_addr);
+	tx_msg->data[1] = upper_32_bits(contnr_addr);
+	tx_msg->data[2] = img_addr;
+
+	ret = ele_msg_send_rcv(priv,
+			       tx_msg,
+			       ELE_FW_AUTH_REQ_SZ,
+			       rx_msg,
+			       ELE_FW_AUTH_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_FW_AUTH_REQ,
+				      ELE_FW_AUTH_RSP_MSG_SZ,
+				      true);
+	return ret;
+}
+
+int ele_debug_dump(struct se_if_priv *priv)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	bool keep_logging;
+	int msg_ex_cnt;
+	int ret = 0;
+	int i;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_DEBUG_DUMP_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_DEBUG_DUMP_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv,
+				  &tx_msg->header,
+				  ELE_DEBUG_DUMP_REQ,
+				  ELE_DEBUG_DUMP_REQ_SZ,
+				  true);
+	if (ret)
+		return ret;
+
+	msg_ex_cnt = 0;
+	do {
+		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
+
+		ret = ele_msg_send_rcv(priv,
+				       tx_msg,
+				       ELE_DEBUG_DUMP_REQ_SZ,
+				       rx_msg,
+				       ELE_DEBUG_DUMP_RSP_SZ);
+		if (ret < 0)
+			return ret;
+
+		ret = se_val_rsp_hdr_n_status(priv,
+					      rx_msg,
+					      ELE_DEBUG_DUMP_REQ,
+					      ELE_DEBUG_DUMP_RSP_SZ,
+					      true);
+		if (ret) {
+			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
+			break;
+		}
+		keep_logging = (rx_msg->header.size >= (ELE_DEBUG_DUMP_RSP_SZ >> 2) &&
+				msg_ex_cnt < ELE_MAX_DBG_DMP_PKT);
+
+		rx_msg->header.size -= 2;
+
+		if (rx_msg->header.size > 4)
+			rx_msg->header.size--;
+
+		for (i = 0; i < rx_msg->header.size; i += 2)
+			dev_info(priv->dev, "%s%02x_%02x: 0x%08x 0x%08x",
+				 FW_DBG_DUMP_FIXED_STR,	msg_ex_cnt, i,
+				 rx_msg->data[i + 1], rx_msg->data[i + 2]);
+
+		msg_ex_cnt++;
+	} while (keep_logging);
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
new file mode 100644
index 000000000000..dd89412f485e
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ *
+ * Header file for the EdgeLock Enclave Base API(s).
+ */
+
+#ifndef ELE_BASE_MSG_H
+#define ELE_BASE_MSG_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "se_ctrl.h"
+
+#define ELE_NONE_VAL			0x0
+
+#define ELE_GET_INFO_REQ		0xda
+#define ELE_GET_INFO_REQ_MSG_SZ		0x10
+#define ELE_GET_INFO_RSP_MSG_SZ		0x08
+
+#define MAX_UID_SIZE                     (16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
+#define DEV_GETINFO_FW_SHA_SZ            (32)
+#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define DEV_GETINFO_MIN_VER_MASK	0xff
+#define DEV_GETINFO_MAJ_VER_MASK	0xff00
+#define ELE_DEV_INFO_EXTRA_SZ		0x60
+
+struct dev_info {
+	u8  cmd;
+	u8  ver;
+	u16 length;
+	u16 soc_id;
+	u16 soc_rev;
+	u16 lmda_val;
+	u8  ssm_state;
+	u8  dev_atts_api_ver;
+	u8  uid[MAX_UID_SIZE];
+	u8  sha_rom_patch[DEV_GETINFO_ROM_PATCH_SHA_SZ];
+	u8  sha_fw[DEV_GETINFO_FW_SHA_SZ];
+};
+
+struct dev_addn_info {
+	u8  oem_srkh[DEV_GETINFO_OEM_SRKH_SZ];
+	u8  trng_state;
+	u8  csal_state;
+	u8  imem_state;
+	u8  reserved2;
+};
+
+struct ele_dev_info {
+	struct dev_info d_info;
+	struct dev_addn_info d_addn_info;
+};
+
+#define ELE_GET_INFO_BUFF_SZ		(sizeof(struct ele_dev_info) \
+						+ ELE_DEV_INFO_EXTRA_SZ)
+
+#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) \
+	(((u64)(((u32 *)(x))[(uid_word_sz) - 1]) << 32) | ((u32 *)(x))[0])
+
+#define ELE_MAX_DBG_DMP_PKT		50
+#define ELE_DEBUG_DUMP_REQ		0x21
+#define ELE_DEBUG_DUMP_REQ_SZ		0x4
+#define ELE_DEBUG_DUMP_RSP_SZ		0x5c
+
+#define ELE_PING_REQ			0x01
+#define ELE_PING_REQ_SZ			0x04
+#define ELE_PING_RSP_SZ			0x08
+
+#define ELE_SERVICE_SWAP_REQ		0xdf
+#define ELE_SERVICE_SWAP_REQ_MSG_SZ	0x18
+#define ELE_SERVICE_SWAP_RSP_MSG_SZ	0x0c
+#define ELE_IMEM_SIZE			0x10000
+#define ELE_IMEM_STATE_OK		0xca
+#define ELE_IMEM_STATE_BAD		0xfe
+#define ELE_IMEM_STATE_WORD		0x27
+#define ELE_IMEM_STATE_MASK		0x00ff0000
+#define ELE_IMEM_EXPORT			0x1
+#define ELE_IMEM_IMPORT			0x2
+
+#define ELE_FW_AUTH_REQ			0x02
+#define ELE_FW_AUTH_REQ_SZ		0x10
+#define ELE_FW_AUTH_RSP_MSG_SZ		0x08
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
+int ele_ping(struct se_if_priv *priv);
+int ele_service_swap(struct se_if_priv *priv,
+		     phys_addr_t addr,
+		     u32 addr_size, u16 flag);
+int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
+			phys_addr_t img_addr);
+int ele_debug_dump(struct se_if_priv *priv);
+#endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
new file mode 100644
index 000000000000..7573603cdbec
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+/*
+ * se_get_msg_chksum() - to calculate checksum word by word.
+ *
+ * @msg : reference to the input msg-data.
+ * @msg_len : reference to the input msg-data length in bytes.
+ *            Includes extra 4 bytes (or 1 words) chksum.
+ *
+ * This function returns the checksum calculated by ORing word by word.
+ *
+ * Return:
+ *  0: if the input length is not 4 byte aligned, or num of words < 5.
+ *  chksum: calculated word by word.
+ */
+u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
+{
+	u32 nb_words = msg_len / (u32)sizeof(u32);
+	u32 chksum = 0;
+	u32 i;
+
+	if (nb_words < 5)
+		return chksum;
+
+	if (msg_len % SE_MSG_WORD_SZ) {
+		pr_err("Msg-len is not 4-byte aligned.");
+		return chksum;
+	}
+
+	/* nb_words include one checksum word, so skip it. */
+	nb_words--;
+
+	for (i = 0; i < nb_words; i++)
+		chksum ^= *(msg + i);
+
+	return chksum;
+}
+
+int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+{
+	unsigned long timeout;
+	int ret;
+
+	do {
+		timeout = MAX_SCHEDULE_TIMEOUT;
+
+		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
+		if (ret == -ERESTARTSYS) {
+			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
+				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+				continue;
+			}
+			ret = -EINTR;
+			break;
+		}
+		ret = se_clbk_hdl->rx_msg_sz;
+		break;
+	} while (ret < 0);
+
+	return ret;
+}
+
+int ele_msg_send(struct se_if_priv *priv,
+		 void *tx_msg,
+		 int tx_msg_sz)
+{
+	struct se_msg_hdr *header = tx_msg;
+	int err;
+
+	/*
+	 * Check that the size passed as argument matches the size
+	 * carried in the message.
+	 */
+	if (header->size << 2 != tx_msg_sz) {
+		dev_err(priv->dev,
+			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			*(u32 *)header,
+			header->size << 2, tx_msg_sz);
+		return -EINVAL;
+	}
+
+	err = mbox_send_message(priv->tx_chan, tx_msg);
+	if (err < 0) {
+		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		return err;
+	}
+
+	return tx_msg_sz;
+}
+
+/* API used for send/receive blocking call. */
+int ele_msg_send_rcv(struct se_if_priv *priv,
+		     void *tx_msg,
+		     int tx_msg_sz,
+		     void *rx_msg,
+		     int exp_rx_msg_sz)
+{
+	int err;
+
+	guard(mutex)(&priv->se_if_cmd_lock);
+
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
+	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+
+	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	if (err < 0)
+		return err;
+
+	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+
+	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
+		err = -EINTR;
+		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
+		dev_err(priv->dev,
+			"Err[0x%x]:Interrupted by signal.\n", err);
+	}
+
+	return err;
+}
+
+static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
+				       struct se_msg_hdr *header)
+{
+	/*
+	 * List of API(s) header that can be accepte variable length
+	 * response buffer.
+	 */
+	if (header->command == ELE_DEBUG_DUMP_REQ &&
+	    header->ver == priv->if_defs->base_api_ver &&
+	    header->size >= 0 &&
+	    header->size <= ELE_DEBUG_DUMP_RSP_SZ)
+		return true;
+
+	return false;
+}
+
+/*
+ * Callback called by mailbox FW, when data is received.
+ */
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
+{
+	struct se_clbk_handle *se_clbk_hdl;
+	struct device *dev = mbox_cl->dev;
+	struct se_msg_hdr *header;
+	struct se_if_priv *priv;
+	u32 rx_msg_sz;
+
+	priv = dev_get_drvdata(dev);
+
+	/* The function can be called with NULL msg */
+	if (!msg) {
+		dev_err(dev, "Message is invalid\n");
+		return;
+	}
+
+	header = msg;
+	rx_msg_sz = header->size << 2;
+
+	/* Incoming command: wake up the receiver if any. */
+	if (header->tag == priv->if_defs->cmd_tag) {
+		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+		dev_dbg(dev,
+			"Selecting cmd receiver for mesg header:0x%x.",
+			*(u32 *)header);
+
+		/*
+		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
+		 * as the NVM command are initiated by FW.
+		 * Size is revealed as part of this call function.
+		 */
+		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
+			dev_err(dev,
+				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+
+			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
+		}
+		se_clbk_hdl->rx_msg_sz = rx_msg_sz;
+
+	} else if (header->tag == priv->if_defs->rsp_tag) {
+		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
+		dev_dbg(dev,
+			"Selecting resp waiter for mesg header:0x%x.",
+			*(u32 *)header);
+
+		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
+		    check_hdr_exception_for_sz(priv, header)) {
+			dev_err(dev,
+				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+
+			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+		}
+	} else {
+		dev_err(dev, "Failed to select a device for message: %.8x\n",
+			*((u32 *)header));
+		return;
+	}
+
+	memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+
+	/* Allow user to read */
+	complete(&se_clbk_hdl->done);
+}
+
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv,
+			    struct se_api_msg *msg,
+			    u8 msg_id,
+			    u8 sz,
+			    bool is_base_api)
+{
+	struct se_msg_hdr *header = &msg->header;
+	u32 status;
+
+	if (header->tag != priv->if_defs->rsp_tag) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
+			msg_id, header->tag, priv->if_defs->rsp_tag);
+		return -EINVAL;
+	}
+
+	if (header->command != msg_id) {
+		dev_err(priv->dev,
+			"MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
+			header->command, msg_id);
+		return -EINVAL;
+	}
+
+	if ((sz % 4) ||
+	    (header->size != (sz >> 2) && !check_hdr_exception_for_sz(priv, header))) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
+			msg_id, header->size, (sz >> 2));
+		return -EINVAL;
+	}
+
+	if (is_base_api && header->ver != priv->if_defs->base_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->base_api_ver);
+		return -EINVAL;
+	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->fw_api_ver);
+		return -EINVAL;
+	}
+
+	status = RES_STATUS(msg->data[0]);
+	if (status != priv->if_defs->success_tag) {
+		dev_err(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+			header->command, status);
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info = {0};
+	int ret;
+
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		return ret;
+	}
+
+	/* Do not save the IMEM buffer, if the current IMEM state is BAD. */
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD)
+		return ret;
+
+	/*
+	 * EXPORT command will save encrypted IMEM to given address,
+	 * so later in resume, IMEM can be restored from the given
+	 * address.
+	 *
+	 * Size must be at least 64 kB.
+	 */
+	ret = ele_service_swap(priv,
+			       imem->phyaddr,
+			       ELE_IMEM_SIZE,
+			       ELE_IMEM_EXPORT);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to export IMEM.");
+		imem->size = 0;
+	} else {
+		dev_dbg(priv->dev,
+			"Exported %d bytes of encrypted IMEM.",
+			ret);
+		imem->size = ret;
+	}
+
+	return ret > 0 ? 0 : ret;
+}
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info;
+	int ret;
+
+	/* get info from ELE */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	/* Get IMEM state, if 0xFE then import IMEM if imem size is non-zero. */
+	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
+		return ret;
+
+	/*
+	 * IMPORT command will restore IMEM from the given
+	 * address, here size is the actual size returned by ELE
+	 * during the export operation
+	 */
+	ret = ele_service_swap(priv,
+			       imem->phyaddr,
+			       imem->size,
+			       ELE_IMEM_IMPORT);
+	if (ret) {
+		dev_err(priv->dev, "Failed to import IMEM");
+		return ret;
+	}
+
+	/*
+	 * After importing IMEM, check if IMEM state is equal to 0xCA
+	 * to ensure IMEM is fully loaded and
+	 * ELE functionality can be used.
+	 */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_OK)
+		dev_dbg(priv->dev, "Successfully restored IMEM.");
+	else
+		dev_err(priv->dev, "Failed to restore IMEM.");
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
new file mode 100644
index 000000000000..cba2c7854455
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __ELE_COMMON_H__
+#define __ELE_COMMON_H__
+
+#include "se_ctrl.h"
+
+#define ELE_SUCCESS_IND			0xD6
+
+#define IMX_ELE_FW_DIR                 "imx/ele/"
+
+u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
+int ele_msg_rcv(struct se_if_priv *priv,
+		struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_send(struct se_if_priv *priv,
+		 void *tx_msg,
+		 int tx_msg_sz);
+int ele_msg_send_rcv(struct se_if_priv *priv,
+		     void *tx_msg,
+		     int tx_msg_sz,
+		     void *rx_msg,
+		     int exp_rx_msg_sz);
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv,
+			    struct se_api_msg *msg,
+			    u8 msg_id,
+			    u8 sz,
+			    bool is_base_api);
+
+/* Fill a command message header with a given command ID and length in bytes. */
+static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv,
+				      struct se_msg_hdr *hdr,
+				      u8 cmd, u32 len,
+				      bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+#endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
new file mode 100644
index 000000000000..24a32fe137eb
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/firmware.h>
+#include <linux/firmware/imx/se_api.h>
+#include <linux/genalloc.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+#include "se_ctrl.h"
+
+#define MAX_SOC_INFO_DATA_SZ		256
+#define MBOX_TX_NAME			"tx"
+#define MBOX_RX_NAME			"rx"
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+
+struct se_fw_img_name {
+	const u8 *prim_fw_nm_in_rfs;
+	const u8 *seco_fw_nm_in_rfs;
+};
+
+struct se_fw_load_info {
+	const struct se_fw_img_name *se_fw_img_nm;
+	bool is_fw_tobe_loaded;
+	bool imem_mgmt;
+	struct se_imem_buf imem;
+};
+
+struct se_var_info {
+	u16 soc_rev;
+	struct se_fw_load_info load_fw;
+};
+
+/* contains fixed information */
+struct se_soc_info {
+	const u16 soc_id;
+	const bool soc_register;
+	const struct se_fw_img_name se_fw_img_nm;
+};
+
+struct se_if_node {
+	struct se_soc_info *se_info;
+	u8 *pool_name;
+	bool reserved_dma_ranges;
+	struct se_if_defines if_defs;
+};
+
+/* common for all the SoC. */
+static struct se_var_info var_se_info;
+
+static struct se_soc_info se_imx8ulp_info = {
+	.soc_id = SOC_ID_OF_IMX8ULP,
+	.soc_register = true,
+	.se_fw_img_nm = {
+		.prim_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2-ahab-container.img",
+		.seco_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2ext-ahab-container.img",
+	},
+};
+
+static struct se_if_node imx8ulp_se_ele_hsm = {
+	.se_info = &se_imx8ulp_info,
+	.pool_name = "sram",
+	.reserved_dma_ranges = true,
+	.if_defs = {
+		.se_if_type = SE_TYPE_ID_HSM,
+		.cmd_tag = 0x17,
+		.rsp_tag = 0xe1,
+		.success_tag = ELE_SUCCESS_IND,
+		.base_api_ver = MESSAGING_VERSION_6,
+		.fw_api_ver = MESSAGING_VERSION_7,
+	},
+};
+
+static struct se_soc_info se_imx93_info = {
+	.soc_id = SOC_ID_OF_IMX93,
+};
+
+static struct se_if_node imx93_se_ele_hsm = {
+	.se_info = &se_imx93_info,
+	.reserved_dma_ranges = true,
+	.if_defs = {
+		.se_if_type = SE_TYPE_ID_HSM,
+		.cmd_tag = 0x17,
+		.rsp_tag = 0xe1,
+		.success_tag = ELE_SUCCESS_IND,
+		.base_api_ver = MESSAGING_VERSION_6,
+		.fw_api_ver = MESSAGING_VERSION_7,
+	},
+};
+
+static const struct of_device_id se_match[] = {
+	{ .compatible = "fsl,imx8ulp-se-ele-hsm", .data = &imx8ulp_se_ele_hsm},
+	{ .compatible = "fsl,imx93-se-ele-hsm", .data = &imx93_se_ele_hsm},
+	{},
+};
+
+char *get_se_if_name(u8 se_if_id)
+{
+	switch (se_if_id) {
+	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
+	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
+	}
+
+	return NULL;
+}
+
+static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
+{
+	return &var_se_info.load_fw;
+}
+
+static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	struct soc_device_attribute *attr;
+	u8 data[MAX_SOC_INFO_DATA_SZ];
+	struct ele_dev_info *s_info;
+	struct soc_device *sdev;
+	int err = 0;
+
+	/*
+	 * This function should be called once.
+	 * Check if the se_soc_rev is zero to continue.
+	 */
+	if (var_se_info.soc_rev)
+		return err;
+
+	err = ele_fetch_soc_info(priv, &data);
+	if (err < 0)
+		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
+	s_info = (void *)data;
+	var_se_info.soc_rev = s_info->d_info.soc_rev;
+	load_fw->imem.state = s_info->d_addn_info.imem_state;
+
+	if (!se_info->soc_register)
+		return 0;
+
+	attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
+						FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
+							  var_se_info.soc_rev),
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
+							  var_se_info.soc_rev));
+	else
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
+							  var_se_info.soc_rev));
+
+	switch (se_info->soc_id) {
+	case SOC_ID_OF_IMX8ULP:
+		attr->soc_id = "i.MX8ULP";
+		break;
+	case SOC_ID_OF_IMX93:
+		attr->soc_id = "i.MX93";
+		break;
+	}
+
+	err = of_property_read_string(of_root, "model", &attr->machine);
+	if (err)
+		return -EINVAL;
+
+	attr->family = "Freescale i.MX";
+
+	attr->serial_number = devm_kasprintf(priv->dev,
+					     GFP_KERNEL, "%016llX",
+					     GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid,
+								     MAX_UID_SIZE >> 2));
+
+	sdev = soc_device_register(attr);
+	if (IS_ERR(sdev))
+		return PTR_ERR(sdev);
+
+	return 0;
+}
+
+/* interface for managed res to free a mailbox channel */
+static void if_mbox_free_channel(void *mbox_chan)
+{
+	mbox_free_channel(mbox_chan);
+}
+
+static int se_if_request_channel(struct device *dev,
+				 struct mbox_chan **chan,
+				 struct mbox_client *cl,
+				 const char *name)
+{
+	struct mbox_chan *t_chan;
+	int ret = 0;
+
+	t_chan = mbox_request_channel_byname(cl, name);
+	if (IS_ERR(t_chan))
+		return dev_err_probe(dev, PTR_ERR(t_chan),
+				     "Failed to request %s channel.", name);
+
+	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
+	if (ret)
+		return dev_err_probe(dev, -EPERM,
+				     "Failed to add-action for removal of mbox: %s\n",
+				     name);
+	*chan = t_chan;
+
+	return ret;
+}
+
+static void se_if_probe_cleanup(void *plat_dev)
+{
+	struct platform_device *pdev = plat_dev;
+	struct se_fw_load_info *load_fw;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+	load_fw = get_load_fw_instance(priv);
+
+	/*
+	 * In se_if_request_channel(), passed the clean-up functional
+	 * pointer reference as action to devm_add_action_or_reset().
+	 * No need to free the mbox channels here.
+	 */
+
+	/*
+	 * free the buffer in se remove, previously allocated
+	 * in se probe to store encrypted IMEM
+	 */
+	if (load_fw && load_fw->imem.buf) {
+		dmam_free_coherent(dev,
+				   ELE_IMEM_SIZE,
+				   load_fw->imem.buf,
+				   load_fw->imem.phyaddr);
+		load_fw->imem.buf = NULL;
+	}
+
+	/*
+	 * No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(dev);
+}
+
+static int se_if_probe(struct platform_device *pdev)
+{
+	const struct se_soc_info *se_info;
+	const struct se_if_node *if_node;
+	struct se_fw_load_info *load_fw;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+	int ret;
+
+	if_node = device_get_match_data(dev);
+	if (!if_node)
+		return -EINVAL;
+
+	se_info = if_node->se_info;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->if_defs = &if_node->if_defs;
+	dev_set_drvdata(dev, priv);
+
+	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
+	if (ret)
+		return ret;
+
+	/* Mailbox client configuration */
+	priv->se_mb_cl.dev		= dev;
+	priv->se_mb_cl.tx_block		= false;
+	priv->se_mb_cl.knows_txdone	= true;
+	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+
+	ret = se_if_request_channel(dev, &priv->tx_chan,
+				    &priv->se_mb_cl, MBOX_TX_NAME);
+	if (ret)
+		return ret;
+
+	ret = se_if_request_channel(dev, &priv->rx_chan,
+				    &priv->se_mb_cl, MBOX_RX_NAME);
+	if (ret)
+		return ret;
+
+	mutex_init(&priv->se_if_cmd_lock);
+
+	init_completion(&priv->waiting_rsp_clbk_hdl.done);
+	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+
+	if (if_node->pool_name) {
+		priv->mem_pool = of_gen_pool_get(dev->of_node,
+						 if_node->pool_name, 0);
+		if (!priv->mem_pool)
+			return dev_err_probe(dev, -ENOMEM,
+					     "Unable to get sram pool = %s.",
+					     if_node->pool_name);
+	}
+
+	if (if_node->reserved_dma_ranges) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					    "Failed to init reserved memory region.");
+	}
+
+	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
+		ret = get_se_soc_info(priv, se_info);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to fetch SoC Info.");
+	}
+
+	/* By default, there is no pending FW to be loaded.*/
+	if (se_info->se_fw_img_nm.prim_fw_nm_in_rfs ||
+	    se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
+		load_fw = get_load_fw_instance(priv);
+		load_fw->se_fw_img_nm = &se_info->se_fw_img_nm;
+		load_fw->is_fw_tobe_loaded = true;
+
+		if (se_info->se_fw_img_nm.prim_fw_nm_in_rfs) {
+			/* allocate buffer where SE store encrypted IMEM */
+			load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
+								&load_fw->imem.phyaddr,
+								GFP_KERNEL);
+			if (!load_fw->imem.buf)
+				return dev_err_probe(dev, -ENOMEM,
+						     "dmam-alloc-failed: To store encr-IMEM.");
+			load_fw->imem_mgmt = true;
+		}
+	}
+	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
+		 get_se_if_name(priv->if_defs->se_if_type));
+
+	return ret;
+}
+
+static int se_suspend(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+	int ret = 0;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt)
+		ret = se_save_imem_state(priv, &load_fw->imem);
+
+	return ret;
+}
+
+static int se_resume(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt)
+		se_restore_imem_state(priv, &load_fw->imem);
+
+	return 0;
+}
+
+static const struct dev_pm_ops se_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(se_suspend, se_resume)
+};
+
+static struct platform_driver se_driver = {
+	.driver = {
+		.name = "fsl-se",
+		.of_match_table = se_match,
+		.pm = &se_pm,
+	},
+	.probe = se_if_probe,
+};
+MODULE_DEVICE_TABLE(of, se_match);
+
+module_platform_driver(se_driver);
+MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
+MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
new file mode 100644
index 000000000000..b15c4022a46c
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_MU_H
+#define SE_MU_H
+
+#include <linux/miscdevice.h>
+#include <linux/semaphore.h>
+#include <linux/mailbox_client.h>
+
+#define MAX_FW_LOAD_RETRIES		50
+#define SE_MSG_WORD_SZ			0x4
+
+#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_NVM_MSG_LEN			(256)
+#define MESSAGING_VERSION_6		0x6
+#define MESSAGING_VERSION_7		0x7
+
+struct se_clbk_handle {
+	struct completion done;
+	bool signal_rcvd;
+	u32 rx_msg_sz;
+	/*
+	 * Assignment of the rx_msg buffer to held till the
+	 * received content as part callback function, is copied.
+	 */
+	struct se_api_msg *rx_msg;
+};
+
+struct se_imem_buf {
+	u8 *buf;
+	phys_addr_t phyaddr;
+	u32 size;
+	u32 state;
+};
+
+/* Header of the messages exchange with the EdgeLock Enclave */
+struct se_msg_hdr {
+	u8 ver;
+	u8 size;
+	u8 command;
+	u8 tag;
+}  __packed;
+
+#define SE_MU_HDR_SZ	4
+
+struct se_api_msg {
+	struct se_msg_hdr header;
+	u32 data[];
+};
+
+struct se_if_defines {
+	const u8 se_if_type;
+	u8 cmd_tag;
+	u8 rsp_tag;
+	u8 success_tag;
+	u8 base_api_ver;
+	u8 fw_api_ver;
+};
+
+struct se_if_priv {
+	struct device *dev;
+
+	struct se_clbk_handle cmd_receiver_clbk_hdl;
+	/*
+	 * Update to the waiting_rsp_dev, to be protected
+	 * under se_if_cmd_lock.
+	 */
+	struct se_clbk_handle waiting_rsp_clbk_hdl;
+	/*
+	 * prevent new command to be sent on the se interface while previous
+	 * command is still processing. (response is awaited)
+	 */
+	struct mutex se_if_cmd_lock;
+
+	struct mbox_client se_mb_cl;
+	struct mbox_chan *tx_chan, *rx_chan;
+
+	struct gen_pool *mem_pool;
+	const struct se_if_defines *if_defs;
+};
+
+char *get_se_if_name(u8 se_if_id);
+#endif
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
new file mode 100644
index 000000000000..b1c4c9115d7b
--- /dev/null
+++ b/include/linux/firmware/imx/se_api.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __SE_API_H__
+#define __SE_API_H__
+
+#include <linux/types.h>
+
+#define SOC_ID_OF_IMX8ULP		0x084d
+#define SOC_ID_OF_IMX93			0x9300
+
+#endif /* __SE_API_H__ */

-- 
2.43.0

