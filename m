Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8423C8A0;
	Thu,  3 Jul 2025 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514173; cv=fail; b=chEwOgYMwa+7ATU0Ps1rVOSwALVZQO4GamZhhna4eVuyZpC133AYNw37DtFqN5QPjFDu/FF+VzJ4AK94IV+8/Vr8Xx4O6pKPaGMbt10p38DOCTmOqqBBJL9PMKIAjqBq3+bbBb6Pl46s+zAr/gTtKztGDIoDlRNnwZaFfF335JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514173; c=relaxed/simple;
	bh=gDWLeiUllsFhDhZn5dmuno38nK8dsIBq4pDJyBcEqxQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iUAGLuPJFsC6ZRe28bn7NJARJvU87eA/yxD8BY7fmf3Xc3M6FVh8g/NUnFI3cLfhn9FpvMLFuvxaNzGJ376eM51uCAiQzQOUKIEzbZlLRb9H1wZDxvLZbs0x+4dXX6dCDxCZZYHguuriNCedsetXp8N6LXwVjdhw8Nc2tQWiDBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nL2Iq8Sv; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nL2Iq8Sv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXKD/x+ybusMUQoguPrVB5d2BFWPB2MoejoEhmzzxgXDkey5C3ymqMyJ4Dv0cDRrTv83b+fRsk2zQPVEwZWmbrHSAJZpCcySNekFK5LgU1lLZZbLu5usISlw8w/zesq/uxf6FWcN2mNnlHcSiBz0wIkOTfCcu/csbLWpmXiLlN0FU6lUE6k75rss/+JEWiYFd5V5eqMoQS6kiBUFbZ6229vaKYQ3kF0CGJim9IR20QQan10q97ebSY6tivq0PzK2QsGSAJVPRJ+F1Ai6IOMfpCVktk4yKD3VoUnbQapqaQmAuAKbyZTLw57JDubvRiqt/IUikTXBYOMtYGpeP1IA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq/fTpUk8Jswae5y4wlli6m7utmVOavR91A8SkTpnOQ=;
 b=CLFS7+oacKMWxKxwNfS77sd4gnPXFxG/T5g6fZGSMM2h92zCka7aiiqOKXAdXKADcXwJHWCdKMM6HgD7zC89u04o9Xy8J7EGpCe3+OZpdnZRYUYhGP46/joCTDuaVILdqKN/72WRzAjnFpcw3XQ0egfQAS3Gv0Vmlk++JXHQS9dIv89V8Lg1+t4mla0pBQbQnZ5eEgXGsUe6a9qHvAnswI+ZZKgeSJTJIZ9hhcdjxAb3cmz2tXYl7fXk72QB8YPXtnIajfg43CE8V3fU4ZjXrZ1c01UsJH4YmT0g0oC/tS4DXglZQqyO/E/IQtUTr8q+FrEnlUkXjD7YFy2bFSC3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq/fTpUk8Jswae5y4wlli6m7utmVOavR91A8SkTpnOQ=;
 b=nL2Iq8SvBdJspdpWSdKWyGql9JlNbrz0YRJPXvo1TUEi5hofhsv04t6y9myUHq4+sDbybZ7AmNuW9YzqZWQkUtcS9YFxz2RVrTZ35eql0Pqoi7qJbEls0fmpjjep5HwOP8YRuH5iPpYA2UbjPSHjrImJWw31qq39kY2/3OvLgyZTXYvILbbic9N6VMnQHT2z/yTtqS7cygj9owFlP8ZrqoXz2ZZdDenGiDRytM9Te88ZNAtq6c+FdUCMfngmXFVUeh563mTS+AroPSHCAy3N342u8dOc/z9/m3Nao4WXbkmu68zPjOiB3ZmRzA//C4cRIfawGBslZIeaIzmc+3f/yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 03:42:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:42:48 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 03 Jul 2025 11:40:24 +0800
Subject: [PATCH v2 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751514039; l=1827;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gDWLeiUllsFhDhZn5dmuno38nK8dsIBq4pDJyBcEqxQ=;
 b=SJXwPrSBIjSGPNxcPI9PvxKoD0Rd72WRDq9KuIYJsM2wTIb8mg4MG4ShGovIiakmD31Ix7JTa
 R5pHaFkgzmQBmChRx7ynnycsvn0RN83hKfC6lcFVOciZs/OhIQzQeXz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: decf24c8-6df2-4047-95c1-08ddb9e3adfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aER3SG52Q1BDTnhXRDFJL0xMT2FxbVRJZCtraXZvYWhTMkNvOXhiUlNyT1hY?=
 =?utf-8?B?ZTd2VUo1d0JtTXU1a3BpVjE2c3hPa3NiU0VydWVDSTNZazIwYWVubW10T0hT?=
 =?utf-8?B?bzdjdW12cWxQb1l1YjBxNEd1bFYzVFNHMGF1QTJGdjFtVnpQd3dxUmdXS2xN?=
 =?utf-8?B?WGN5Z3k3M29QR1kvYkhDMWdqMWVwTmx4anM1UFFrZTNKdmRBYS95Ni9OTTJ5?=
 =?utf-8?B?Y1VFMUtqOVRZTTNyRmxKTmovcnBzKzFsWmZjM0k1TjlVbTVNbGQweFJMcVBa?=
 =?utf-8?B?S2tZTy9Tdk4vSUNiR2FPTU5rTnVPWDFQdmRRR2Nva0ZDd1pQKzltTThWYkFz?=
 =?utf-8?B?elMyNEVqRGFmK2tNR3hraGQ4Vkxud29sMlFsL0YzREtVYmUvM0xqa3pBQmNz?=
 =?utf-8?B?TTBucC9EbkRyVS9aWlZLeGJzbTZNdzQ4SWo1UW9mTDlRaFRuY1dyb2R0S01l?=
 =?utf-8?B?WDR3ZXNUaGxaWlh0RmRWdEgyYzEwbHVBUnlDaUQvbXFnSDBjWERhS3d0N3dS?=
 =?utf-8?B?N0F2aGFBdWpFYTBMaFF6c2tETkZTV1orUmZoQ2hHbTIrUTNkNWVHY0MxRFRC?=
 =?utf-8?B?eFZoRWI4M3duRlEyMVkrdzBZRDMycWRJRVY4TkszcGVnVHRuMnRvc2RBNEJx?=
 =?utf-8?B?N3Qyd1k2OTAxYlpCNGpsY2dld3NocStBd2JMWFZ5ZUJoOHZ0YVBua0xxMFRN?=
 =?utf-8?B?ZnBxbTlrVzAvQjlScENZQ0l6ZEJ0Yy9Xb213enR6Tkt4QkhjWDZTU0FTZVov?=
 =?utf-8?B?VEdHYnJFa1oxZHR5VG1COXlSWTJwdFJEc1hmdW1BYW50U0cxbmlrWFNueGVV?=
 =?utf-8?B?R1BBOTZBbHR5dW9XQkhZN1IzcmthNVNsdDU1b0R3ZkREbnY4ay9nd2JyVHpQ?=
 =?utf-8?B?WnRETitrcFQ4b3YvS1Y3RnRrSnN6Rm9qRmxaYXhZQkE4QzROeVpOODBiWWFD?=
 =?utf-8?B?aGtBYmhwK0JRREhUbzJRbmJwTWNncUl6VDVnQzh4Umpoem9McnEvM1lGQ0wy?=
 =?utf-8?B?Zy9Bb28yQkV6aWx3bVJRMlB3dFUxbEtyRmZCeVNTbVNVZGQvcnJvQWh4SC9U?=
 =?utf-8?B?bzM1dEdmNktGS0sydDB2UnJhb2xReWFSbkJLME8rMCtGbHFDN3phenROMG9Z?=
 =?utf-8?B?d3B5eGp2b1Nka0ExRWxsS0FVVHVIcXpHVVovTGZlREJEczZFT2p2SnFjTnk3?=
 =?utf-8?B?TTVOSmFPRXEzekxqaGlwYzFOa3pWNFlvR1hPOU0vR0dMbU1DZU8vc21hRW5n?=
 =?utf-8?B?dGpVQmhFZ0hOQ05TNlF3Wnplc1liRXhaak5XL1JiUlNwRWM1eGpYVElMcDlq?=
 =?utf-8?B?cjNhQWhLWlYzS0NJcUVpTVJQRTRhVVJhRDlzN2tqRnRxbEltM2VOeGlrQjNj?=
 =?utf-8?B?dkd6Zi9FSEN2V2EzU2phOFZycTIxaU4zUXRLOE92aEgvRWUvWnBjeHRrYzB4?=
 =?utf-8?B?MEJsRTd5Z1VKWHVFNzg5TEtJRnNHRjB0NTU5bDVaYnYrTnBQczQvL3I3N1F3?=
 =?utf-8?B?TVZCL1RLQ1drT3dzU1ZiVEtZODlBOHFjcSt4OTNocXZrZDdUNDlnWXRoZmdF?=
 =?utf-8?B?TUdiZkpFbmVseW1EYnZGUVRJZVlWd01kRC9RbnlwaTVxZnVid0N1cE5NSnh5?=
 =?utf-8?B?TXltdGxXWkdpNHBicGVrSXNHb0I3bjFEK05PcG1yaFFaWlFxVXZKdEVvRksv?=
 =?utf-8?B?S1E3dm9sRVFBUVV3TW1JSjNLeG5tbzBmY1F6bHF6cUlHVzNOWkc4cGNkVm9k?=
 =?utf-8?B?QjBHTXRRQjhheGd1L3pBRlFYNUxZeWZUK3RVaWNpTUtrYk9wVUFEMnFpRDht?=
 =?utf-8?B?NzI4NmZxK0d1U0RPd3lFMDdwdEk5L0RxcWdDcTFxM0dYSnVyWnNZVmxMUDc3?=
 =?utf-8?B?ZkpvQjkzc3F1ZVhCU3NWb3V5L0FUM1pjSjZhNThkTWxObS9YK29zVG5kUVp4?=
 =?utf-8?B?UjlqeTZtUEhZcVhWMnFPREhFM3ZzL1RZVUYzeDdNRzhqK3BNRTJrck1obTVr?=
 =?utf-8?Q?R0RnB349EcVvvsSCI76eDRQt6viEL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXBaTHI3Y25EaUE3bXl5M0IveC8raGZINmJkZSsvdE1CTlREeEdzd1VZanFN?=
 =?utf-8?B?dDF2TFJ5VCtlbHlsRW1JaVdNWnh2YVNjSzMwZXVyNFBFOGVkTS82c2UxVmpZ?=
 =?utf-8?B?WmpaSFo1cFhuOUlZV3Brdk9oQnJSRXNTSlp6bFByYnVsdnBkSGtGcXJSZWJ2?=
 =?utf-8?B?UFFQU0VqOHAvelV6bms0WEM1R2s4Wjk3WE1zajFRYWNZY2xSdmZNSFljZnNG?=
 =?utf-8?B?elZldytiZEF6Y3FKR0JWMnpFeWszcFdoc0huMDlxWTdpTDRwYzVFcldQMjQr?=
 =?utf-8?B?cDVRRDNnelIwMjhYNGRQeU9DVnZzNmc3Nmp2WFE3RUJlb3BwY0sxVVNOWk9B?=
 =?utf-8?B?YlZ3WlNaOHZ3eW1aNGFhNWVPRUJiUHFtb0ljQzBZSnQ2Tm8vaDFMV3E4VDQz?=
 =?utf-8?B?MjhhQnRlSmlyVTdRUGIyV0ZlUUJTbllHeHFzbERqU0Q5cmFsZGVjTzNtTlpz?=
 =?utf-8?B?SjlNcWZIWXVQTHh2Tk9RdEpGdFZXOThjZjdQSmZWMUV6b0NrbDNyMUdDVVpj?=
 =?utf-8?B?bWtmSjVKUHBIY2E4aUNVb0RXN1NsMW9ybVovVlBDcy84ZjJHZ3FIZGlSZVZy?=
 =?utf-8?B?K1QzdzVYcXp1dHA0eVllbHVvMmN6cTZjQjV3djJObWhUaTlXVHhoMVFMOW1x?=
 =?utf-8?B?R2dJbGYzWVF3N1haMlZxeS9aUG1CS0k3dm9MemRGbTc1RXNrTWJXaytQN25n?=
 =?utf-8?B?cTFrYUdJY3pZYzE2bHRKV1ZCbTVBTTluOHJqQ1pXb2RnNDJTUUd6OFphU281?=
 =?utf-8?B?NlZHQXE2SkRvUzJBNXBDd3AzYmNYbUdHUU42SGpXbytvNFBXNHlyeFVHUEFI?=
 =?utf-8?B?THlITVUvQkE2b2VrWGlnWVVodE00U1QzUlNhYXh0WmlCK1RtdzlIRkkwS0d2?=
 =?utf-8?B?ZmQxQTdtbTBTcjhpWGNRTEg0Ym5zQUJkczllYVlDQ1AzOGxLWWNkSkowMzY0?=
 =?utf-8?B?STNtaTVmZ2FvRUpQS1dOMEd3TCtYVHVxYi8xTDJ3Wm9GWVI0S0dRRCtaeDRz?=
 =?utf-8?B?Q0plYXh0MUxFMEx1dzBiaEJ3OFg4c3FweWFJYkQ3WnJ4NHl2TjlBYWdTWVlh?=
 =?utf-8?B?a0szb3JBV0swaWxSdkdrUFRWUkcrMDJFR3lKQVJVWktlcGxZNElyemtVR0dq?=
 =?utf-8?B?TjJNK29BRmwwYytjejN0NUs5YzR1OFdNYVlsR2JrYmhWdDJENVNONEFETENs?=
 =?utf-8?B?L1hvK3hseUhlcTJRdGM5VVVWVUNTQWVXWUkwY0poWEpNYXhqb2xVK0Y4ZGpt?=
 =?utf-8?B?QjNTQy9FbWRCaWtUWHlzUlhkZnlUYkw1anI5c2dZTEV1SjlROEVqYVpTd3p0?=
 =?utf-8?B?R1d2ZEpXTkNxNHdzbENZUWxkNERhR2hWQk9iWDREQ2JBbHd1Tk1ZUEh3QzJW?=
 =?utf-8?B?R2pQRWhKV0dhNUd2TnBpREhtS3FlTnZVZ1VVL1BsNHlOamhQVzl5aGhGMkNq?=
 =?utf-8?B?N3FaSEE5elZXd3BONWVGZGs1RzljbHZVc0ExY2I5b2dYUGl4djdsYUF0ZFZr?=
 =?utf-8?B?VGhxbFUyOWNxZXNXcmdoMGtpaFkxM3NMc0tYUlR1MzI5MFVaVUIrYzVrWEto?=
 =?utf-8?B?U0pvN0pYMkhSckZ5MW5VV3VLRkFSd3d2ZkRBMlVzS05yUnpqZzl3SnpoT3RC?=
 =?utf-8?B?bVZNQzNHenJHdDlGa0NmYmJvMERFZ0d6TTlYSUpDWDgzVHJVZE4rRHROcXUx?=
 =?utf-8?B?czVqV2dDRHl3VWwrSVBYLzR3MkFSU0ZEWWhIQnJPTlFubGNOV1had3BHVnFu?=
 =?utf-8?B?WS9EZFlpOFJaWVRxRFJBQzZiSCs4OWdSRU5hSUJPWVVFdmZoOHJ0ZnNQVm1P?=
 =?utf-8?B?MmUxSXF3dkE2bkxXTTU2ZHd3OG5CekpXS3hROW9MSTBFczB4QzErcU85QUtO?=
 =?utf-8?B?Q2lyenhFVTZwcWlkbEcrN2F3Z3RvRVZRRlNxM2FlWGNKNitqTjJTME9waE1z?=
 =?utf-8?B?ZTZOb3ZGaG11YVoxdTVZY052SVp3akw0VXpxZUlMLzZhWk4rNWNUb0FkczZV?=
 =?utf-8?B?Sm9pbFZQUFBnTEpQaVFoRGtoZXJrRDFSdDREa2dScXBpakZSY2p5bkliU2dK?=
 =?utf-8?B?eGhLNGVCbGZFYWt1NnNaT0xkYmNiVHY0dG56akJrNEs5L0gwUmxhb3RFL1dZ?=
 =?utf-8?Q?+pzYbJ20bBYtTwQkwDMq1yxZH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decf24c8-6df2-4047-95c1-08ddb9e3adfd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:48.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsnIeMIUUSiZtFQzhZwn54P5HnuIL9Mynaj8c6kjHYPUuRDn6cRqL7irrz75X+OPyroi+xz8qm735xnsba8aHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206

Add nodes for LVDS/DISPLAY CSR.

Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87771c0775eb799ce2da3aac37c060..657c81b6016f21270a1b13d636af72c14ab4f8ef 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -3,6 +3,8 @@
  * Copyright 2025 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx94-clock.h>
+
 #include "imx94.dtsi"
 
 / {
@@ -145,4 +147,36 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	clock-ldb-pll-div7 {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
+		clock-div = <7>;
+		clock-mult = <1>;
+		clock-output-names = "ldb_pll_div7";
+	};
+
+	soc {
+		dispmix_csr: syscon@4b010000 {
+			compatible = "nxp,imx94-display-csr", "syscon";
+			reg = <0x0 0x4b010000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			assigned-clocks = <&scmi_clk IMX94_CLK_DISPAXI>,
+					  <&scmi_clk IMX94_CLK_DISPAPB>;
+			assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			assigned-clock-rates = <400000000>,  <133333333>;
+		};
+
+		lvds_csr: syscon@4b0c0000 {
+			compatible = "nxp,imx94-lvds-csr", "syscon";
+			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+		};
+	};
 };

-- 
2.37.1

