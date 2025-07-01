Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2251CBEAA;
	Tue,  1 Jul 2025 07:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353617; cv=fail; b=Zs3MDQrBVpG/fpXw8NGC+4/Upel0GH5SE0FYUG35OYWyNcwNzUimDmCmz6ikXfx06JhIP+tH4BNJshmeejAKnNtIq/luihcs7mqB94GBDZwTE8JAKOc9ExtZ6Wiu7YAcmc9dOWi2zSPLIoi/+VxY+/kKvOiBMjSJ9DbB4YaGjIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353617; c=relaxed/simple;
	bh=vMZE6lVxR3VF8DKlNbdIn/TV4fErkJb4xk9ktjWOx4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=H0+/jIeQS7aZWsD4spDpVqVVoqFye+umglBT4fJoBT74vPY1lvEtlrMPHKqhFKSZTe5B1sNNsk+sPpPoG/JeP8EoXnvLZ3UASQtAtI51Wv1KKhBPGJ9ubQDuhYGGL/JuJv9A3R6i5A1jho9muP204KojudPEAUGsVu9w7RS8gNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PN2/cTyl; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PN2/cTyl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS5sVm8QosXsI65NWqqtas75Cc1SVtUeZsDlQtm98SyFxJlDCnWOcWfajNZrBXftYDmfcmK5W3FvLM1iLqdi4ys/SLK8BjcAyQ9IaWfLba+OWUDsBteB2bhMVTj9XhmsY43sq37pAYhSPQPCMEJSyS/vKgsRhErJ8f3qA7xAWOavLqdVh3GalM4O7tst04e3IlVx2xtgQ70RDFtnJJ9KzlykH0tnne2CErhK0VyJKMxDshqD1EX2YNFgdEcfTNhQgZAZhQ/3CcGW1QO+fB/HGgeiURgBrKgJB/WNxWqV8bJUeBpK1Uf5rUxtCjBBjstdEFqPPHrsQh6NFHUZncUL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhjBezaZL+SCWjU3GxWf0RWfSkQCQyoJkDWXI0JTWWs=;
 b=LziQMRiWlZKxbxeeHnNDuhnb9zz/lGYlHnOpZv2Zp4G+om8xgOTCHFSZNJNbBmVoyvoqywSMwccR2qcQYRW66Cjqt4hchxZhEBcNc8FNzf3PPMh9z8MGx25IZhzsWuvvZLGSUK4LvXuSB4ghZxWWqUqkZCvvnMv8i0YuXODTYzybewDuxBK0g8v5IZzkpT9RCqap+IVoVX7QZvXQa+e9U4J7gkcALQeABHUiwGBAQcE2s9MvpGgfvjb1uOPOSXbXzomWmX7/KQByMe27K7kvkeCly1uM5KvFmdxwGw1ELzBNCx5TY48fXDzWtE8D9dR9OEpDqaeuji/GD3J4m/Ef1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhjBezaZL+SCWjU3GxWf0RWfSkQCQyoJkDWXI0JTWWs=;
 b=PN2/cTylzG4hPe/V8nNgQV2YJNxkUa/PU2dRKql1blxkf5tYBpwg6M9QSZF+vkYUgvXbnMlveCPYGulJ9xlqHvl+cVGuo1W5yNIEazwOOUlGcQ02Dzi0yjb/sde2oxsvJvbEjAP7jK6pqrcxwlyhjYIdAYp7eOQ24WItLgvWVi4Ymt7kK2NF8W481taMT9/HXlCeO95YQaPdP2/QmNqKZJKp/IzJEM1hXwI11DH1VxGHPgumGj6T/Ko2DJy9MleZEFwRnwSLrmon+e/IiFIpGrpGhtY8tHorUbUcZ2+YTni0S5rygALxosNtgnfG48xRkR/I9oZ7EoSs2+6tam2u8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 07:06:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:06:52 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 01 Jul 2025 15:04:38 +0800
Subject: [PATCH 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-imx95-blk-ctl-7-1-v1-2-00db23bd8876@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751353495; l=2445;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Vi9nUBAGgo+vsABxcFdgbXXnwIO6v8xn9xEL05Xy00Y=;
 b=etSIjljNG5SxxRtfXND9UQ0JyiZ0QbHMW4N+I73BGKNKMZDI+f+/+eTTkXlYQkhBRkZ+c5gSI
 EJQZS/ABPEaDt+IVNtnHFzo7r8wbRQCMHB88If2DwbKuKNXVYbQZlxK
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
X-MS-Office365-Filtering-Correlation-Id: b2e9b205-70a1-44ae-7cc3-08ddb86ddb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnBSeVVJUXBNeUNiZ3BJc2gvSWJSR2I1K00zKzg1QXFsQUVBYk5TK1UvMDU1?=
 =?utf-8?B?L25wRDhGTEhPRDhmZ0tRZVNVbmZaUTdhQ2RFOUc5WXhSMnk5ckpXT05PdWsz?=
 =?utf-8?B?MnlQWS9iNTBpTitlaFNnelJOSEhaRGx3Y29IejlMQ3JJcDJiQTRzaU9QdUFw?=
 =?utf-8?B?V2tBcGFHOERJcnF4MUpKYzJNZ2NDbSszZlVsanRrdlpxWmJ0clNHM2JyU2xK?=
 =?utf-8?B?aFh0T25lMWkxaE1UQjN1RnpoWG4rMWpFVktyczYrNE1iN1dpdy9DMnF1eEVF?=
 =?utf-8?B?cEVkRkFoUGZOeTlPQkIzMVc2TlpqcEJYWTRTcWt3R3kyU3d5MkNBUmVKUTNt?=
 =?utf-8?B?ZXgyK2crcDJSUHBzeDFkNWlaTmNaNXFCMlY1d3drbWNMZndUZW1pZy85MlFs?=
 =?utf-8?B?SGZVUkRnanUyemRGSjgzSjBObWdJV2tPMllUTExEU254QlRMb0RvQlFDc2l2?=
 =?utf-8?B?VTZDKzF6aWovbVR4bjcvT0w1ZVczd0xhajRoa0NBQW5rWXdNeVY4TldaTThZ?=
 =?utf-8?B?aDczQnpOU2hNTGFjWGVkUk4wOHI5QURPS0VWVjN4bGEzNTYyWmEvODlwSVR3?=
 =?utf-8?B?R09DV0lvUnlJZ2NJbGZubStIZmtNMERnaW9WRkd0WTRpaVdydzJjQkJxZm11?=
 =?utf-8?B?QTY3U09WZFNOYU5RWUZicG9UelYya1VsTVUrV0RzczZBOHlTT0E1OTYrSi9X?=
 =?utf-8?B?Ylcva1NCbTdPQUdIS1l2em9la1g0dEhkOXZKV1Z4U1dZS3E0YzFQbnZqMzdJ?=
 =?utf-8?B?cTZaL2F6Z2RvNUJuMnl5QmU4VmRiMGR3Vm5zTDk3WmlQOWVITitWYS9tK2kx?=
 =?utf-8?B?WjlZL0NZaTJVanZDTDMwYlRzbDFTcGhSdmFBRE00bnhIelQ2WkVRMXNRbjlm?=
 =?utf-8?B?OGVudnBKYjROSjZOM3M3Vnk2blZlZlI1b3dlUWk1UThzbitkSXhKTlJzVzVC?=
 =?utf-8?B?ODNVNG5HMGxPNy90Vlp0MjR2bkpMVFJ2Q1FHQ0FDMWJtS0ZaSEdCS2pJcHVG?=
 =?utf-8?B?MndDamlpZHhPbzVxbHZzb09MU0xMQndwVlBJajd1NWJKZVFxT3VldXl3WGwz?=
 =?utf-8?B?bzJpckMxS2pPQ3JyTDZkdVNSL09RM0V5QmNKeHphQWN2SWJpY3JnM2R6ZEdM?=
 =?utf-8?B?TUxROXphamFYOTIwdTNjWThmQVF6bHViUTEwRGk4bmlFWGJ2STFVRVFMSHRa?=
 =?utf-8?B?RTlrN0w1VUJTbXFhSFAwTlpmWUl2eUFVNjJVdWVhUjlZZUpkbFU4SkRJSith?=
 =?utf-8?B?NFpYQVRIaFZFNFlEbENhV0lLMEgwbWxRZkVCRVRLZ3p4cUF6V2k3bEhSb0tQ?=
 =?utf-8?B?djEyMVFScXdOMlhBdzJMSkN6akRGRkE0RDdpUXJYNEhxSGRFL1ZmNmExY2Vx?=
 =?utf-8?B?djVOUzh4SWljbkRHQjBpMWJGanFFRjNjYVluZllvTGg5bFRPTGVOb0daWkRs?=
 =?utf-8?B?cTdkd2djK2IyOHR2TkprYzZtSDRZZURXRCs5bXF0NmNrV1RTQnphMzc3dnU4?=
 =?utf-8?B?Q1RKUktNNkp4NGsraDVMTk8zR3c3V0hxWEY0bzdMNUlITzc4ekdydGs4aDB3?=
 =?utf-8?B?Z1lnZFU2V2g3Q3JYWU9QSUhJdDF2ZWF5VmhCN0hLZUV5c1RpbTZ2Zm16NzFV?=
 =?utf-8?B?WEYvN1Z3bUhPQXI4cldnZmYrR3FxZis0MENtVXNwRUE4WVBYNVJxelV1MlFJ?=
 =?utf-8?B?dmxIempDNWZ3SDlpNjdVKytUK1NFK1NJLzlaV2VXc2NIL3BHSGpiVmxrMExK?=
 =?utf-8?B?L0N1S0t0a1c5OVpMZ3U5ejAwSC9qK1NYbUE0ak9XdFpNMnA5NHllVzV1Qlkx?=
 =?utf-8?B?Q0YyMXZvOUNwSHB1QUtLamREYjlyc2MwNHJ0TGpLbFdNTHQ5STdGUTFrK1Zo?=
 =?utf-8?B?MGp4LzhFdjBac1lDbnBaczR0WVNyOUVmemFRaXNyVVlMOFp3RGhqV1NMVDh1?=
 =?utf-8?B?ZkoxN2ZiVlFaVEhFRTJPYjhkOE4vN1VNOUJVT0p3UXU4RnZxa1BqNDh6eFFo?=
 =?utf-8?Q?77G7aeCjNjVWTcR1NUdKxqtRMOSyiw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3NuSVFjeWJKMDdiSWNKVXJUWFpYNEZXN0xtVHVEaWU4cGoyMVRJTGQrbmZ0?=
 =?utf-8?B?L0VrdGlaMXM5bHZVMWZ1V2xXRmZsVmc5S3lYOTkwVkxaU3JlM0RMUXp3UENu?=
 =?utf-8?B?YWs1bHdXMi9Ja1hFTkJDcVVETmlYUDRSWUdTMUlOUmJ0OFd0bzRKMkNJbzZ2?=
 =?utf-8?B?dnBQdzFwR0NJTGxibXFFNzVyTHV2VWZXY0QrUyt1ZTNWbG41b2Nyek0vd1ll?=
 =?utf-8?B?WHZMeFJUZ3ZSL2FSWlNhL0dtUm5HOWhBUTBEUzRXL0lPcFN5NlhpMzJQRFc4?=
 =?utf-8?B?QVlhbHJXZk10eGxGTzY4b1dDUEMvY2lxUjNBTlA0UUsrdDlIYjV4MTJEQmx4?=
 =?utf-8?B?SWRIVTVjTFYweHhZQzJnYW40REgxelVZa0VYRkJZMjgwTlNOMERteFdGRFNi?=
 =?utf-8?B?cGZ6dzZVVzgzVU5DbDlKa3Q5YzZrWGFscFJybUt3bXIvOG9Ea1YrNEdZM0Q4?=
 =?utf-8?B?QjdDTldsa3FGRmMvYjV6NTRlV3JCejZtVUUrNkkyd3ZUQTFBa1JES2FNV0F4?=
 =?utf-8?B?Y00wNDVjeFJScmczVUl2djlvd1hLem9QV2YxQ3Jqd0pFYlBMUVd4NldkZU5V?=
 =?utf-8?B?UXdWbHRsejRuSFdrUmZQRk9KTUtkempQUHJTL3JBU3VrbC9Ubk5wcHVKNzcw?=
 =?utf-8?B?dXloM3lEa3dXbWQ1SEtUbFpqTDZjQnA4bzhDeHFFS0VMdW5FdGZ4R2hLeit0?=
 =?utf-8?B?Y2ROaE81azlFTlM5UHVsYVZpRGVwSEMzOCsrUUpzaTMyT2wxOHdLM05lTFpN?=
 =?utf-8?B?d1NTY3IrKzlJYUczdU8valhUQzczdDV5MTgxUlZXRUxLVUx1Q1VtbnBEQkhp?=
 =?utf-8?B?b01DZkE4eDdNYllVUzJGLzNxQ3ROYzZpR0dGcDluaTRGNEJUZmZYK3NESGIy?=
 =?utf-8?B?VGhKM2pMb3JCb1hEZDd6bjNmc0ZTRWluZTNOUXZOblZlU1pxcE1UT3d4Zm1V?=
 =?utf-8?B?cGx5RHExUEhldGJGWlRiRjk2L1pGWXRPR0NqSFhHSFRLdU1rdW1Dd2NJeHpX?=
 =?utf-8?B?SXBQVG9yb2RUcFVWZS9KR1NXUmJ0YmxLWDJHeFRoaytTRXNZK0lWYitXNU5N?=
 =?utf-8?B?WHFuZ1RveTRqMFIyZE9tNnNIeXVLQnBqdzJaV3V0UmNBMGNyK2x6UzJSSHVR?=
 =?utf-8?B?dWZFNTY0aVdmKzZzQnVHWi9PdC9kZEVkOUZqOWU2eEI2bWx5M0F3dUtYdmlR?=
 =?utf-8?B?cFhETE1PR3VBai9uVG1nVCtWTjhNNmJ0V0lWd3RpYjBZUmMxTGRnb2VsbXFG?=
 =?utf-8?B?UExlY0pBa1VUeEVyOVpGSFhuMU5HVTAzbFdDdVJjc3ZmM0VCSnZ4ZjgxM3kz?=
 =?utf-8?B?ZE1nZ2JMZ0hscXhnbjVuM1ZBcnowUExaZ1B1RVo5NXBmdmRWYXlRZWhRWFBV?=
 =?utf-8?B?MFhyWHhSbmRHZXRhRWFVWWRMb3Q4MGtrT2ZNOHRZMWlaa0xtaFVrZ3lNV2Vr?=
 =?utf-8?B?MGQzOHRRMGovTDNkd0M0eEQzMW5aOFE3TENMSmZKRVFhb3VQanEzM3AzeGZh?=
 =?utf-8?B?R25ScDAzRzc3SmtGRENSa3hkNnNUdTA5dHNURWw2NklFOHhTRisrM0gwd2dK?=
 =?utf-8?B?eCt3YVhGY2Frb0dIeisvb3QrVUZaR0RqeHZZZHZvY0VxRmttTEZxakZWNHZB?=
 =?utf-8?B?Y25mWm8zcytTeXJkdVNURWlZQWdnbFdsY0Fhb29kdWdrUjV6THpjbnJMeGJ0?=
 =?utf-8?B?S1NWSFRaaEFRU2t0dEpRS2lWZkJXdjdQT0RuMTdjdG5wQ01EelNZdVNNRmRR?=
 =?utf-8?B?Y0g0eE1ReDZoZE9FMjRRb2tqM00vc2dMNmxQWU42am42R3AwM1N6WUV1NEU4?=
 =?utf-8?B?SDc5ZGl5WVl2NDNZdUljZWNSb0h3Qys5akpCM0hIb2xhb0ZEQXNjVDloMm1X?=
 =?utf-8?B?NFdWY0F1Zjh6aWtoc28xYUJxU2NVdkJtZTd1RSsyZkFlMkdxczUrMXRsKzBq?=
 =?utf-8?B?MmRFZm5DZXVGcDRaVEwyRjVZcCt3ZDI0S1RKcUMrN25IRXVUTXZ0TE5tZE8v?=
 =?utf-8?B?SGd0UklUM0xrYVFLYmpqRW1rL3dRMmkwM3hPbXcwcDNPV1BDRW5nVEpHM2pp?=
 =?utf-8?B?eGtWalBQR3pUOXprRFJpbkRWYk5hSEhmV1dFRll4OUZkTTJXM2U3YVRUOFg2?=
 =?utf-8?Q?RpgASecD8iOFwOf8NWn7WSSu5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e9b205-70a1-44ae-7cc3-08ddb86ddb0b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:06:52.3494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYSLoodQEwjqs6+qA6SdulQw4ybi8mWBg/mCrg8ueDIESlxtyh21oMm22LwS6oglCpQ/Ff5SDFZsM915cB+lkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

When enabling runtime PM for clock suppliers that also belong to a power
domain, the following crash is thrown:

---
Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
Workqueue: events_unbound deferred_probe_work_func
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : clk_mux_get_parent+0x60/0x90
lr : clk_core_reparent_orphans_nolock+0x58/0xd8
Call trace:
 clk_mux_get_parent+0x60/0x90
 clk_core_reparent_orphans_nolock+0x58/0xd8
 of_clk_add_hw_provider.part.0+0x90/0x100
 of_clk_add_hw_provider+0x1c/0x38
 imx95_bc_probe+0x2e0/0x3f0
 platform_probe+0x70/0xd8

Enabling runtime PM without explicitly resuming the device caused
the power domain cut off after clk_register() is called. As a result,
a crash happens when the clock hardware provider is added and attempts
to access the BLK_CTL register

Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
and getting rid of the pm_runtime_disable() in the cleanup path.

Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index cc2ee2be18195f0e05e911bcb26e284b1a894244..86bdcd21753102b7d160288e7b69bf73da5a5706 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -342,8 +342,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
 	if (!clk_hw_data)
 		return -ENOMEM;
 
-	if (bc_data->rpm_enabled)
-		pm_runtime_enable(&pdev->dev);
+	if (bc_data->rpm_enabled) {
+		devm_pm_runtime_enable(&pdev->dev);
+		pm_runtime_resume_and_get(&pdev->dev);
+	}
 
 	clk_hw_data->num = bc_data->num_clks;
 	hws = clk_hw_data->hws;
@@ -383,8 +385,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		goto cleanup;
 	}
 
-	if (pm_runtime_enabled(bc->dev))
+	if (pm_runtime_enabled(bc->dev)) {
+		pm_runtime_put_sync(&pdev->dev);
 		clk_disable_unprepare(bc->clk_apb);
+	}
 
 	return 0;
 
@@ -395,9 +399,6 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		clk_hw_unregister(hws[i]);
 	}
 
-	if (bc_data->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
-
 	return ret;
 }
 

-- 
2.37.1

