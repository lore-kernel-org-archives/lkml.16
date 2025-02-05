Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB3C22A7F8;
	Wed,  5 Feb 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749064; cv=fail; b=jch4drasNQlqhxz7ffjx++M8uka2vttKvnzOES3w1foKdfEjfkmj01LdigRKO3zJCDvBNmH+Y5OY2RawPCqvIOw36pXNKU1Qpo1FC2zRcCrvKPh4/5hBa8QjvCdplJo3p7flP67ebNoms4q/VtA01a2BDbh5r+HUFgY1TEsRGl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749064; c=relaxed/simple;
	bh=0KS3vyrHnuIM1sfx9+zxaKFLc86r9rgrRnSAFgBEm3o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yab42kydt4uIth3QLb2ymD93iG6L8ssitsNTtxwXJ3Nfz/Np+nCgXNn5GZ1ZX7Sz1TielfXwbJZRxnk1B1TGJvD42/wFb+WqOboUDdUFigGFH6SFNP6CIs4HBDEQiu6LmG2XhoF9s67qmwMY6V5B0oGrPZMujk2o/uWEVNGbFd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YYI3ex3w; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YYI3ex3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiTPbyX/jrOdZIUpGriGGKKdTDzfXN+sR/jZDQcBT1Sihnwh7eb5mDf2ihSabfp27G+7nKq9RMGyGAfEC+wIdzwc+83Lra3FZv4GP/t8bCXWmxpq1vyDyXIPtRVJEl7yVrqMlOY/FxfWYrjmJuEjzciwoCfij9fHLlULWmW28tdzXSRJfEQCK6IdwR+fCDxANJK9dB8yXQak4hZZipIaN8n7mb1aOxzw7P9wlcBQH6ciixPBEEIOU/jbxwB30bktQaqkW2IQQKvv6VYoK40f3HYg/uGzH0/H9oB/6PkW1LrNnL+ogN8cazjVbCJk3IB5uJlxHVkvGVWG+8fAQYLHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l57yxYmeST1OV4vtYzySJQWfWrxoHyD6OZl1nVF+Fc=;
 b=V050q6iUn5DB+oi4l8wplJghMCOSvx3HH8Yxgr+U/CM/UfUrhJCV7NfxU0lhDXXS1MPAhuA+rrTE1yfK03qDoRXg83Smr0zLDO8OTvmmonQuWFqoiLo6qEvUGbg9D7jBTReP1ncRCG7A7a7tJDaxy7HzUchG6PJUZuPnJVn7o5/Dn1/RLDZD5S5OIu49qhRrtH0EP7X0Fdl9NKY8ukCaDnk1RgHZ8dnD3bs6v4Hu+iiRLbWPl7D31jG3LJR/gMPdbu02q5MLEo4S6WwZeseUDbHvrUS4+1ib+MY1wgD0RoBXU4YFWse8mgwNkqOSQ60MTa3/NCpmKHqA8u5RZJoOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l57yxYmeST1OV4vtYzySJQWfWrxoHyD6OZl1nVF+Fc=;
 b=YYI3ex3wmgx9VJqjpowj8wnNzNy8jiavF7J2TsUB0RGv5TUppF1qeh6RcGRlxLZuF8qnpAgi7+LdgN7AZr7rfJaKevSOiaBBJF4eJbO1Cu1VtWxSmLoBh+di2s/+cc48uknxnsP9SxRhCue/YKPNJQDqB4VBCzxVNyo92dK8wvClE6AoaMj4ZFf8nfVYHx0FKIBZDSpIboAypKeo5s3iaPOmNEtpFRkL9bYbqDHvpgamRf6aVCgXiohsnR+nQZCQ6aI5B8CRDVstCsxwM4fz3tvBt0gB0QyvGPKUT4IN6Yw7J7inm/xvedjj1J5D+uYrsKKmxA0m6e13NTjYXKrFMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7783.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 09:50:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 09:50:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 17:49:51 +0800
Subject: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738749007; l=5527;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=N5B1zgouHjlvADWtIMmbMY9BBZv1Dk20KykGSG+oSag=;
 b=7MC8xIQrG6++fG2MGgat1FW7XiwEyXwuRcciuqu0rwLxjZzJ4OhxdSekbhEAnaM/0eWz6cDWJ
 zUYbhWYvqQyC+epoZix8LYIWgYwigEsEe4+BxcvUI5GPzoTmy3Pv1bo
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: cca426ee-cd16-4b81-18f6-08dd45ca9435
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlE4M21TVzkrV1RGbHFvVHR3ZXVFNXZIQVFncSs1NTJ2TFhZR2hYMUk0Z3BO?=
 =?utf-8?B?Q1F6OHZ5T2MyRnFaaEJpbW1nWEU1aWxZdGVxclB1OFlmWlhKNDBCVVY0TjVj?=
 =?utf-8?B?S3pPWGh3RFp2eS9CajZMRmpBSE4xT29FSEtXb3Q0cUF2d3lEcGordE5pT3NB?=
 =?utf-8?B?b3ZMZ1dlVXdnWjN0MnZEQVpJcGhzdW16bW9zR2k4VWxnWVBIRE5XMmVIVkJW?=
 =?utf-8?B?KzVnMVBNRU5aUlVINE5ObGxQa0JBcEd6U1NoSVFrRDgwdXJjTm90elNkM0p0?=
 =?utf-8?B?ajNTcHR2UnQrMHliWTYxL0EwdlNSak5GWGt4cGVYaFZmYmtETytIMHBMejM2?=
 =?utf-8?B?b3owUDlPa3hpQWZicTdWQi8zRVY0RjU0dXpxWDNMd0RoU25NVXhxSGduWGZL?=
 =?utf-8?B?MEh6ZXFxS3QwWnhQWXpZSFNITlNwVDNhYmhjVGRSQ21tZGdNMENzdTVGbkZa?=
 =?utf-8?B?MjY2VEkxMDA3ZDB6OFZRVEhSaVFqZzBjMWZBYzc5aHJ4WkdNZE1yZ2M3cldo?=
 =?utf-8?B?Wm9hTDRjSyt3QXFBNlY1SHdUQ1oyZnNqUW5yc1I5UERTRHAzZUluVGhkYU5S?=
 =?utf-8?B?UU9aUFFlek9pSHFoQnFJdW16NFQrQmxydFpXQVNiQWZoa1NFeXdLYUx3VWll?=
 =?utf-8?B?SGlJU2NLNVFTbWRiTENTMG5LMkQ0K2JIci9zeWErdlJxZXlNendwbEt4amgv?=
 =?utf-8?B?RUNkVkNuTjdBaTlmUjZmNC9CMFVmdVorbmlvakN3TEQ5N0pXY0xVQU5ERkZl?=
 =?utf-8?B?VXNGSnhmS1EyQ1FmeEU5V1ZLVTBlbFViT0dnalY0bnFLemFGanNUV0VmdG9p?=
 =?utf-8?B?OTBnSDVKWDR3OU03U2NMRzY1djZxeUtGK2tDTUV2ZzRSRGZBazRwUElLS1lp?=
 =?utf-8?B?aG1jWlVGdnlOeFZHOTRCSEVvRkl6YW5QRGVpcGhsZGF0b01PMUNWRnJTNFFa?=
 =?utf-8?B?ajloWXFLU2ZVU3htaVdxcUZmbklJZmViMXhxbm1ORFRvek5ucm1kK2F2aFRY?=
 =?utf-8?B?d2pHbmxJajBFLzhoeXk4YTBERzExQWNhV1ZWb2ZqeVUyT3NkN1Z5N254R09p?=
 =?utf-8?B?MGNJWWcwL1JsQ0ZjcXh3c3MraFRMblBZMDV1VGtzYWgzVHNaRHN6VTFJbE96?=
 =?utf-8?B?S0xxZWsyL2R3SldML29VNEFHVVkyczRCSDBvUlFVVHp4TVAyN2tGTWU0QklZ?=
 =?utf-8?B?QllTbzRmZHB3S1JJOHZSQS9obCtpZW5SajFMY0lpL0NYQVNSd2hmUzN6ZlA0?=
 =?utf-8?B?N1V4cjNDR3Blbm9XcVBTLzRxd21aN3l4cFExZjhYaW80NCtyYmFVVmsrYnRJ?=
 =?utf-8?B?eGV3eVlPOGRVNGxOTzVkZnFzU3ptajg5VVFuSkhUcTlEMkduT2ozSTVNR2po?=
 =?utf-8?B?ankvN295dUpYMFdERW9ncVQweEtBcmh4YXBoWWM5QkJ4RTJkMXA1ZHR6eWFY?=
 =?utf-8?B?NEhNOWVLTDAxancvNEtIcE9MaDUzVXg3ZjhkcnZpdnl2YU5JUHdyTzN3YUlz?=
 =?utf-8?B?Q0xYdVRGNldYdjIzQUg5bzQ3S08xK1BqekpZd29XdFFvQVBkNks2ZkU3Ykpt?=
 =?utf-8?B?c2VidzBRdVBPSHRDMVZ1cFB0L0tYUHdJRWFUU0puZ1lpbUcwR1ByTk4vV2RD?=
 =?utf-8?B?WENjN0lPWW83Z2s4S2RheE5iNmZnQVE5b2dHVUtZMWJkZENTTUpvL3dZTTBH?=
 =?utf-8?B?VHpjaU81RGRjRmVhN2hOWjBPUDdRSnkyVTdlOEloeTJ3OTVXaTMwR3d5bEVl?=
 =?utf-8?B?eFJCMlo3TlNQNGpRVHQyVDY3TzNndXRqWXU2ZkRxWldhclhpb0xLNFg5Nkxz?=
 =?utf-8?B?NlA0QThwSkRiQmxDZ1RObkRvQ1hNV0tQMTFoVGpESXpQaS90V2l6c3F1VjM5?=
 =?utf-8?B?SmtkbUROeHVrTlR4UE1BZ2I3TVFkdzNjZk4zczVhMmFPTUh1SjhPZW4xVEVQ?=
 =?utf-8?Q?Rkn6/HZ4DET3K3Y6JVGR0fqMibLCOecI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTBZdFVVRVE0Sm1ZbFl6elRYcWVDN3hHaTh1MVNTYkRYZEJWRzZYZ0Jta3Yy?=
 =?utf-8?B?a1AvRlBvc3h0bWJpZjA5VVFEdm1Bb1I4TndLaGxsbmE1OXVXeFlmVnpvcGto?=
 =?utf-8?B?Q3h5UmltTkJvZC9HM3NKMklTaVRIbDdxS0FCWmUwdk5PQW04YUR5K2lhTW9k?=
 =?utf-8?B?a3NUTGhkUUowb1dJTWJLZlhvb1F4ZFNpTjdpdzJpSVd5eXprVDAzNEgzVGRX?=
 =?utf-8?B?OS8xVUx3a0QwSHJKVW5rSVhTMzBDVjdYRHdSbndRM2lZSEc4UkFqVGprMTdU?=
 =?utf-8?B?ZHJFc2UyMC9Fb3psR0dLREx0UXdJMS95TkhKeGswNGl1cUlxaUZUd1BpK0pO?=
 =?utf-8?B?RU1VZ2YwSXJ0Z2YwRzZjRzV1U0VvR05iVjkrU2xsY01OcW5zb1BYSTJ5ekpz?=
 =?utf-8?B?cDRGY3VkNU42WE1CSGY1OHgyWEZxUzRzOWNvQ2xJdHVUenN1bWNVQmM4UnFY?=
 =?utf-8?B?SHI2MTR5YXNVL2JreVV3bEdoNjdtcjQwWUR5bjhDR1NjMkRaQTdWNWREWHJu?=
 =?utf-8?B?TVQvQnNGcy9tSTNZUG9NaWY1U0pqajN5bVpqUDZZTU9JcEttVFNHYmN2WlJX?=
 =?utf-8?B?bGMwaG9wSUZCZk8rRWhhbmRJUzRJaUp6MmFtMC9lYjJxTWZFNVFvYTZjWXAy?=
 =?utf-8?B?dS9ENGNlblUxSFc2RjVLVmhXZm9lRkhGMEprL2NIOTJRbGp3MkRUcWVPY29D?=
 =?utf-8?B?R3Q3WVRNOFIxV0VlQ0VDTktDbzdIMDhKT0FVa2NnTUdoM3dmZy9yaENobWJx?=
 =?utf-8?B?NkI4MGZYU0orQVNTWC9Yb3JyNmNQbWYxSTdSb1A3SUtRYnh2dWE1bkF0TWRi?=
 =?utf-8?B?K1JnZUxWbktLaGRleFNlbnFtdi94Wm5ianhSSWZ5K0Q1TzRPbFJMOVNrUkt1?=
 =?utf-8?B?WlBBU2JueG5kRDdpV2t3dmVWZkdyQ1hlV1NzVmRUU1RiT09aNEsvY3R2T0g4?=
 =?utf-8?B?UWVMOUZ4YXN2NzNxSjV2UVpIWmFVSDBCczVuVVVENThBNS81eHRCcWdiNTNG?=
 =?utf-8?B?bGVFN0FmZEVxcE9EaXZoS3MrMkVYZmpTaXZiOEJpTVJrRXNESHE2OVF3Mi9m?=
 =?utf-8?B?SnlaYjRaejVLSFUyYkt5VkFCZlk3cDhQUkUwZTJCc3RGRnFsdHFjWk93NzU4?=
 =?utf-8?B?MXVhSmZXZkRoUzR4M2pMRnpWVGtMZ0dkNStCVk1kMDJ6MFJIZTQ1bU54NTZC?=
 =?utf-8?B?QUNscnBiQzJHNEFDSW5WU3BYWWxBZnRlblNsRzJOQWJpRkNRdldFWjZQU0la?=
 =?utf-8?B?VW5yK0ptRTJ6c2I3ZjhodDcwdjhHS0JHeXF5T0pZS3plTEFMSkwwV2hiMEth?=
 =?utf-8?B?M1dqU3JJSysvUXFqLzhuQ1MvUitWbkRyWVZhaGY1TnFQSUxvR05RQ0tYRjU0?=
 =?utf-8?B?ak1aTHBxei9ySThma3pOV1VLcWlXSmp6Y0RYMUVoLzJHd3NvMWhDMkMvQjl1?=
 =?utf-8?B?MXhhU2FpUHB5WE1DdWhsQUhuTjAxMkN5MUJZMXNoOHVYcWF4WHh5MTRJVVpy?=
 =?utf-8?B?eTVESy9JK2ZIbUgzcGxDWGpIUFlXcjBzVVYxMnFCWCtObFNMTXBTKzc2LzQv?=
 =?utf-8?B?T0dqSjE3VXl4R0FqUDZuaDlSSTRKTWpKUGtZbFhJajMvT1dobHAxc05mdzhW?=
 =?utf-8?B?MVY0ZExhMEF3Y0t2OUdESlhtd3A2M0NQbzNQc2gvWktzcmMrSFp0SWRtVVl2?=
 =?utf-8?B?SFErVVV2Rm11VU5VeWNldzFFMW1lbFREOVZzdWg4RzVlRW9vUFRldXR6WWJE?=
 =?utf-8?B?bW8xc3FUVjdlL0RycFpRNE9VMVFmZDBYbG9OSUNGNWdSVUdhOWRJZXV2Y3Rl?=
 =?utf-8?B?VForSmVSbUdBQjkwNVlCL2VWZ0RpSm9hZ0RvVG94NHR4bHdQaHFiS1c5cnI1?=
 =?utf-8?B?dmFpUW5hMVNIZFFHbjJxc21razR5YjhtM2xHT2hjUmt1YmtxMUh0aHlFUFph?=
 =?utf-8?B?bU5GakhkL3lWY2ZqK2dnUDhCUVRLYUcyTVJQNDZOdFU2TVhBR3RZK3JpTGFE?=
 =?utf-8?B?eFpQK2ZSa0Q4cHhESkJabVRhalEyQWpPNG5wU0pMRHQyM2FTekcyS1FrQm9S?=
 =?utf-8?B?ODJ6akt6SjZldGhhQk9tL0VicW1jYmRwQVZGZ25IOExTZWF1NEozcE9qeXE1?=
 =?utf-8?Q?UiEHbfhBnIqLQDdYqmV32SOZ3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca426ee-cd16-4b81-18f6-08dd45ca9435
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 09:50:53.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wg+WhqZ4NSOfWaDPy7sgow7EIZKYOL13UqtNqwFGdeGTCQdkT7KonD6Z9y6jqJqFosIiBirDPl7zCNcDg1aZcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7783

From: Peng Fan <peng.fan@nxp.com>

Add clk_hw_set_spread_spectrum to configure a clock to enable spread
spectrum feature. set_spread_spectrum ops is added for clk drivers to
have their own hardware specific implementation.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk.c            | 34 ++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/clk.h          | 22 ++++++++++++++++++++++
 3 files changed, 88 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cf7720b9172ff223d86227aad144e15375ddfd86..e11f9615e683af52c719d4c8419bd30f369f301b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2790,6 +2790,40 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq,
+			       unsigned int spreaddepth, enum clk_ssc_method method,
+			       bool enable)
+{
+	struct clk_spread_spectrum clk_ss;
+	struct clk_core *core;
+	int ret;
+
+	if (!hw)
+		return 0;
+
+	core = hw->core;
+
+	clk_ss.modfreq = modfreq;
+	clk_ss.spreaddepth = spreaddepth;
+	clk_ss.method = method;
+	clk_ss.enable = enable;
+
+	clk_prepare_lock();
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto fail;
+
+	if (core->ops->set_spread_spectrum)
+		ret = core->ops->set_spread_spectrum(hw, &clk_ss);
+
+	clk_pm_runtime_put(core);
+
+fail:
+	clk_prepare_unlock();
+	return ret;
+}
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..ac0270cc9ec133954b1f8dcffed015723bd1ff5d 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -84,6 +84,28 @@ struct clk_duty {
 	unsigned int den;
 };
 
+/* Aligned with dtschema/schemas/clock/clock.yaml */
+enum clk_ssc_method {
+	CLK_SSC_CENTER_SPREAD,
+	CLK_SSC_UP_SPREAD,
+	CLK_SSC_DOWN_SPREAD,
+};
+
+/**
+ * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
+ *
+ * @modfreq:		Modulation frequency
+ * @spreadpercent:	Modulation percent
+ * @method:		Modulation method
+ * @enable:		Modulation enable or disable
+ */
+struct clk_spread_spectrum {
+	unsigned int modfreq;
+	unsigned int spreaddepth;
+	enum clk_ssc_method method;
+	bool enable;
+};
+
 /**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
@@ -178,6 +200,11 @@ struct clk_duty {
  *		separately via calls to .set_parent and .set_rate.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @set_spread_spectrum: Configure the modulation frequency, modulation percentage
+ *		and method. This callback is optional for clocks that does not
+ *		support spread spectrum feature or no need to enable this feature.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
  * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
  *		is expressed in ppb (parts per billion). The parent accuracy is
  *		an input parameter.
@@ -255,6 +282,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       struct clk_spread_spectrum *clk_ss);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -1404,6 +1433,9 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq,
+			       unsigned int spreaddepth, enum clk_ssc_method method,
+			       bool enable);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b92768896c4e45c4e7c 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
  */
 int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_set_spread_spectrum - set the spread spectrum for a clock
+ * @clk: clock source
+ * @modfreq: modulation freq
+ * @spreadpercent: modulation percentage
+ * @method: down spread, up spread, center spread or else
+ * @enable: enable or disable
+ *
+ * Configure the spread spectrum parameters for a clock.
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
+			    unsigned int spreadpercent, unsigned int method,
+			    bool enable);
 /**
  * clk_has_parent - check if a clock is a possible parent for another
  * @clk: clock source
@@ -1088,6 +1103,13 @@ static inline int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
+static inline int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
+					  unsigned int spreadpercent,
+					  unsigned int method, bool enable)
+{
+	return 0;
+}
+
 static inline long clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;

-- 
2.37.1

