Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6025265637;
	Tue,  8 Apr 2025 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102055; cv=fail; b=WmtMDZlpj+ml9HeOqOHvZZl4UNbGiQyGP+k1Ra4pFpFUig3xCfjlbpsJVwfsR24Z5s0bx09S9hpv4gQVVXqvqhTsghVPMiHe4zU/sfULBkGCVC7o2g83624MJnNndck11J5qcjBrl00dTGDq7GYf/vKo340eMwOMfSiN4xr25aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102055; c=relaxed/simple;
	bh=6+6ZBTN4qmCvwd8Wc/oKQmV2SOEwC3R5KZFua5O3O2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sFQWJH7RK8DQAZpAXnOFjbUAg56JZsJzg4DzIIJKTsR/T365NELJlQlvMaPCZiM08/xJpz2q72G//gpyrbAijoyioPb+dvZIPD2aU8N6fH4HrLyHFF7d4Orej9MMTeik1HtiamKvYWsPUq3oZC+OGGsEAzb1GWZEdJbp/dTafUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UMMmmKR0; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UMMmmKR0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldzLOaMgoezUULInQFrxiKXyHJQrOq9DM3MzPG2AsO0bdgoA9R9wC0WOKw8xIlXMl27ppHrTy4y1xDEdiimpWBlM+0MFQHAw3dPULOIoeXTjvNjbn12nBP5E9lYNJLFtdhwTt2L2P2WPiXbffAv9PD9PUBHykFQ86alkW5NGJ7RmBLGitdWsysQvpbeYtjlxFFGun2F9rFj+CqE1mcnXnyqHXLMgJBz3zGBNu1jfzUlBNhL9JZZKyBnii1QiXxolSSVufHvnIYMl6ymPTnaBSJZg2P0qyEg3rrJDsb/CLS0tq7doTxpGvQx6Ow96Z9hCWNlY7g2JH8J2arRoZOJ2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0URnfs1xyb+W4SHbq+XsmGBAVc4y4jZhI2YCpnW1Ps=;
 b=DlBVYlKeeQYtbH//ggNuqwQrnBZo9FFGEi/Jb1YzJHgVu5UM1JTRfRlFWD0cYtebzC0Mnbec9EY8rlRQ/fu1jfH4uganP19/u7F3w7XQb7LV17y/mPOSOA27KdUacnsIr90dzWjPgaZa87cEFDrM7Ewa+GAIgKjZwbA4T2oilPS8X2BJqpjsAHBtDhikI27/ni5rGSKE4NxGp3Y0woi0axW92NTdWUCmOjHOaSV+EmZxnB2b1OP5XfVx2nMJoU/9GR6w3ikoQnSk8i7uLs+XTpPTJTJNnAW6AInFLMxwfyIg0e/6hh3joSC0HRSq30KFqxBjqrm2z0lMOwPjTl/jRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0URnfs1xyb+W4SHbq+XsmGBAVc4y4jZhI2YCpnW1Ps=;
 b=UMMmmKR0oDn2k1qufJHfPOxjdPnqrUHbXogwPDMYRSi1UzujKnv/VZrmWwL5aXueHVO65LjgVkPmV6qF5DFKCDQArV/CtjIsJFtKCXzKbwI7HVlmlTTU+6YybnM4Ff0ZIVlUhWMPKqJlwIRWm1LzCm3IhKCFF8dQ/RjBlNZr/pYGtQ2wShblVVVcy4nz+xuO6ThRu+3fM/vpIW2/AFSpPHKoho3IQziHUVlc9+gWd2JOdDgWqEoeFC3pdhflpCPNZeRAGDPhyB3LmLTnNB6af7QmabwcJt12Rc+zlzK8I01U3VE85+5jnpy/4AW5ctLVCAJYxUSIpjJk1KKpOfX2bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:28 +0800
Subject: [PATCH v4 4/7] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-4-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=10156;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=TG6cyB/8wHRcrxt99BRqhHciWmEXUxMEAzTx8rHy51Q=;
 b=usYNb7i2TaMJWcUmkCRfZZMrVMId34pDlBf1t04ubBvudQF7hOy8cOOBG5ldUzlFlH02z4Jec
 jFP7XuK8ftYC2Yxk9ygL0vI1ftbME3i2Fs3N7Cpftn/ARl70EQ4jFTE
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB10063:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1f0411-4ec6-44b5-e398-08dd7679fe4a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGNQbytzdXI2RDFCZFQzOUxoNjB4SXhraWIwZjNzOVZGR2pWM3h3NTVocDNM?=
 =?utf-8?B?OUY4T1FRckxEV1ZTYTZGTVZ6bnozcHBmcDIxV2RrZGM4T3JhOEN4Y2tKdTNU?=
 =?utf-8?B?OGo1Y1J1TDlDZDFMcUJRVm9VRSswSWNPQzFyK0piUHNBaTlFc2xyVEFtTGtM?=
 =?utf-8?B?a3lSbWVjVGh4MnZZMTh3UVJ5R2J4STNIK1F6YktFaXFBb2tUSkRKQ2NxMU41?=
 =?utf-8?B?dU9IQWxzSTh1djRnM0RYUU5LcTkzcjgvOGpBMlh0dmJuSmlEcWpGK1BGSTJ0?=
 =?utf-8?B?UDRZS1RDSGhzTkhkeC9WeTVGcm82cFhuR21oNFhhbmxLK0FoMTlhSW9KWDA5?=
 =?utf-8?B?MUR4WWJwRVVtSEplYzNlRjZUbGgxU2k5R0c4dE9NcmNpbUdEU1paTG94ajJ6?=
 =?utf-8?B?eWIyR3Z1enlUeWc1SXpjQTJzb3E2RXQ5WmZzOHNScHUrZ1BWSDc2aU5hQWdW?=
 =?utf-8?B?Wk1LbjJ0ZVdpajdmS3BLOUpPZlFtaEgrMk1EbWhuRE9UU242OVVPb2VJWUhh?=
 =?utf-8?B?Rkt2OW9Ta2pTTEVjakVWT1VRTlBRQ3VlNHp0aFZ0WEs1eWJJczBjcitKbHEr?=
 =?utf-8?B?YTllZ09LMlVhemlTT3dKNS92TmVEMXBLcGk4dHgzY000OVcwenhqODdzMkVC?=
 =?utf-8?B?ajZYMGFnWmE0c1B2dTc1cEQwU2EwbWJCd3pubjR5VHVIalBaQVd3eEtKS0VX?=
 =?utf-8?B?TU9aSm41L2RUT1hPblVTb0MveGw0R0NsR0dWT3IwSjNCc2xLMkl4dm91Y1VB?=
 =?utf-8?B?aitZSWJKZ3hXY1RZRWh2YzMwYWVIRmV3TmVOZjBwWW13UGJqNW9aRlJCNDBu?=
 =?utf-8?B?TnJwREVwUnR5SnVuM2UwclJ1bjd6MEdzUnhESEdXdjMrOWFiRTFlL0Frakxq?=
 =?utf-8?B?V1FVamZ5a01DdGcvaVQ2RWk3VDFWalRkM1FvSk12bmZvUEpWTDdIM0pFeE04?=
 =?utf-8?B?RHF6S2FIL3VHRGtaR3RBTUJ3dzBwTTdzRzBCQi9tY2FDQzlnY2tmM3Q4OVQ3?=
 =?utf-8?B?VmhSK3pJS1FRTStSai9BU0QxQ2hYSTVmUXZyWS9UUHpaUm5PejAzQjExVTgr?=
 =?utf-8?B?b1pNd3lDaDBraDhlbEFpRlpQazVHcmZKYzdFcXZWSnRIMFV5UThkenVBVUV5?=
 =?utf-8?B?YVZ2RjV6NEsxRG1Va1NNd3ZhdjlZS0p5TDFHNWwxSm1mN3Z4UVJFMEJsVWdj?=
 =?utf-8?B?VkhwQk1jdjEyZFFic2V0bXllTWdpK204LzZ2QnMxbDFOQytlR3RXck5xWHdt?=
 =?utf-8?B?NWwxZUpzdFBTMVZMb0NNNjNMaTRiQjljeklHZGV3b2pLakFwbXo4UUtsd3Vl?=
 =?utf-8?B?RjRpSmhtbDlrQm1VblR6ZTFlMVRVTm50b01DdzI4Uk5JZE9ORnZ0clgzUkww?=
 =?utf-8?B?aXVmUUVJdGFRU0pSYXgxRXYybWUzZEkrL3ZmZFQrOU16UjJtamFJWmY3alJp?=
 =?utf-8?B?SUo2UXV6cEd3Y0lac1lBclJTSno4Q3pwVmJWV3FoTVo0SXVmZjRuck9HWDZM?=
 =?utf-8?B?amhDWkhYL3k4NWxtOWxKWHpHTThmK0xWRXU5cjZidWZzUExpZG54TU1NN2ND?=
 =?utf-8?B?R3ZJUm5waGVrNmRmRFlmSnhZekI4eGluVXh5ZExFa2NDVzJZYzJlNHg0cW94?=
 =?utf-8?B?b0F1bkU5WnBkUGs1Skh2RzhnYUNwVGwwaUhTVGxoV2VFY0kxcTFGZWxZb1k5?=
 =?utf-8?B?M1kxdU5YaXpYWmFFd2ZEMUEzRHR2MUVIUEtsQU16RWVYaGsyNW9qU2VydTVZ?=
 =?utf-8?B?WTBTdFdVMXpmNE5iSVBQcWpMaGczUFVDMWdWU3J3dzlsR24zdHpFOWljNk1U?=
 =?utf-8?B?dWkxY2NNaS94VkhEblZiRW1TZStqcGZWZUpLY2g3YXpYdlZIbDRrNnlVank4?=
 =?utf-8?B?RkhLdFRQRDRLc01FbkdjNkc1NCt0SUpWMU83UUtYdWRtT2t3bzhINlV0SDZC?=
 =?utf-8?Q?QZhyXpZoeWpbRdj4KRO8OE96UvU5QKcY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFNESTdGZXRFQURxQ3lCQkczUW9LR0hkb29mY1VwUDR4ZTh5RG9GcXpkR0Vj?=
 =?utf-8?B?UlFSTC9FNlhwd3A2dlZrK0s2Qkp2SlJDdW5vR3FtT2RueUM3bUIvS3g3Wkpm?=
 =?utf-8?B?aGl5VjZaaThHSTdueW5rTWFyOTM2T01nM0x3dHpBbnJYR3ZOa04wY3JaM0pS?=
 =?utf-8?B?cTg2R3J1cHVrZU1vYk1lamxhSTFiU0hXWWlMbnFQb1BRSWpFcjY5cmtPcndG?=
 =?utf-8?B?SEhSOVljWkFoNXJwR3cvbUVHZms3QUhnRkRGWW1nSmVwLzAzdW85WjNLL010?=
 =?utf-8?B?V3JveU4xMDBLY3QvYm1JdkR6emhqalZ5ZnJHLzVsYkJXQ3VURWYzYkJ4ZUFz?=
 =?utf-8?B?NE1BK3pBOUtWZzA4a3NjdnphOFVCZmF0ZTlCMDExTmJxKzZ6ZmtpOTJ3K1VR?=
 =?utf-8?B?eGkyQ2l1L3kxVjdha3U4Rk1OcVJWV1Rpa3NuZHhkTEhYbUltUFZEdzJpdk81?=
 =?utf-8?B?WHhwM3pMdldaQmJLOGhlSlo3eXNObW5LeHNYNnNGcDRnb09TMWh1anZUZXgv?=
 =?utf-8?B?THVpZStwZXJJdk1RaC9ycHFycmVNak1QTkVsKzRLLzFheHNFZ2xCNFFTQ3A5?=
 =?utf-8?B?blIwbWpYZS9pVkZtN2hhcTBhOTR5dVNjYmg5WW5QVjhOVkRqbDdzbm82TUJQ?=
 =?utf-8?B?b2l0VlUzb1hFbWV5ZzRpaEhiaDEvQ21DYjFrM1Bkb0h0cC9scUsrY2grWThy?=
 =?utf-8?B?aXo5TVRLVSt1WUQ1WVZkUzc4bWVTRW1zbVZCcmZyVEhDWlF0bktqMHNibjdJ?=
 =?utf-8?B?M3B3RzRCVlhHMHlINWJHUitTbUJ2VUs5ZVNXZGVmM0Qyc3FSVlBpclpQNGlx?=
 =?utf-8?B?ZlV2MFY0MTV4Ty9qbkxzNEpHZ3U4bm1ZOFJmTC9VVUtrbHV1aThkQjM1bFox?=
 =?utf-8?B?WmRIc1JMV3hxVGVERk5ObStzOTdIWFBybU90L205akxLNDN5dTJFMXY5ZEFX?=
 =?utf-8?B?anJsNUtiY2gxMGhoTld5U0ppaGM5TXhPTitESzZLR2hqUGhZY2Y0aTcrZnpQ?=
 =?utf-8?B?R1Z0RDlKU2dOOVgyTVJYSHBHU3poTlVBSXVXRGsrL2JxQngwUHJyMFZoYVdi?=
 =?utf-8?B?TDVZa3ZLUUR3RXVuM3ZIV1YxTDBGKzFvR0F6VUhVbEdlWFZsSnZxdkV2NlBU?=
 =?utf-8?B?ampmZGs3VkVoeWFVckpueXg2NEcwNEtZNHhSaWkzL3QzRU5wTzdKOTNqRDhs?=
 =?utf-8?B?UjJKUjRtbG13c0xNMHNiR0JDVzRtQ0hPRkxnV29NRXA2aFJBZmtmRjRqYTNQ?=
 =?utf-8?B?TU5wSUZJclJmN24xTnZZMCs5a0lHWFdxaWdZQ05hK3pVbmRkNkRia1RKQ0oy?=
 =?utf-8?B?Z1htTVI2NURxVERMWWtJMHlrcmR5alZmSVU1VGI3WjRmd3pYeGRSN0lqRlpO?=
 =?utf-8?B?K2dibXNRanVjNHdmZWJVYUJKOFI4MHJ4cnpMQ1ZsV1FuSUxCYk9icjRNYnYr?=
 =?utf-8?B?cW9KK0htMlRIRzFFTS9TY1dEM3dyRG5VSVZGSzAzOThqZHJoa3g3L3R2dmhE?=
 =?utf-8?B?akxnUmRMQ3F6eTRwTHErcWpjNDRqcC8rWGR1TERWZ2dHSFkwZ2NZOGNUMUI1?=
 =?utf-8?B?TUJYZHNkUnYxcmlRS1UxRlVWTlgzdWVBd2lHYXVMemFxa25SRk13NmFVL2Zo?=
 =?utf-8?B?cXhJQVRXY2xwVjcrSllYc2s1QlZnbE1wdy9wemtDZ0VpckJLZkhZRXZ1c1ZB?=
 =?utf-8?B?WXVrSlo3SW5xN1oxUkhxemdrMXFOdU1HUHJTVTZtTy9PMDg2Zk5NdkZYZlFz?=
 =?utf-8?B?OFlUaVdsUHRQb1RMa2VVaFdJNkZVcEVQenMwcGZNbzJqalhyNlI2MUxnUTd6?=
 =?utf-8?B?L1pzbTJtNWJ1NW1xWnBzblA3TW1WZW13MDYzQWZtYmtjN2ZvcHllTFJvbzZ0?=
 =?utf-8?B?QVpETTEvaWkwN2E4dVdWcmVER1V6RGc5OE01NjFibVNWVWJ0U0tUMFNGcWds?=
 =?utf-8?B?YWREVi9FeFlUK1I4MlAwRFovWXJidlBsSmh3MWhPZVFzOVV1eTBDUFY2MHlm?=
 =?utf-8?B?am42bXUybExIRmh4NFE2Y2ttUDk3L2JXYmt3L0lFUnlhdUU3N05wK3Ezcmsz?=
 =?utf-8?B?L2ZXNENoOTM0dzFMbXZCVUpYb245Z2tOaXFrTTNPdlB5YWt6UjZsOWx2Yysy?=
 =?utf-8?Q?udWxIffLx2jvd/Gfo9kuRxI3q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1f0411-4ec6-44b5-e398-08dd7679fe4a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:28.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lugX17fnsluMSvIFhfjJXxGKUtRv+qW+vMg7+WPFFB4y4P2VlPJgAABbAo6ZONArzb7vhPIIu5Ggh3OlGETfjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

From: Peng Fan <peng.fan@nxp.com>

This protocol allows an agent to start, stop a CPU or set reset vector. It
is used to manage auxiliary CPUs in an LM (e.g. additional cores in an AP
cluster).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  11 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 276 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  10 +
 4 files changed, 298 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index 1a936fc87d2350e2a21bccd45dfbeebfa3b90286..b5f13d0e40155e485f4d1696e9550645d888ef44 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx-sm-bbm.
 
+config IMX_SCMI_CPU_EXT
+	tristate "i.MX SCMI CPU EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System CPU Protocol to manage cpu
+	  start, stop and etc.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx-sm-cpu.
+
 config IMX_SCMI_LMM_EXT
 	tristate "i.MX SCMI LMM EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
index f39a99ccaf9af757475e8b112d224669444d7ddc..e3a5ea46345c89da1afae25e55698044672b7c28 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
+++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_CPU_EXT) += imx-sm-cpu.o
 obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
 obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
new file mode 100644
index 0000000000000000000000000000000000000000..7fa9a89d825396de00ae666f525e8d6a2d2aed18
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP CPU Protocol
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../../protocols.h"
+#include "../../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+enum scmi_imx_cpu_protocol_cmd {
+	SCMI_IMX_CPU_ATTRIBUTES	= 0x3,
+	SCMI_IMX_CPU_START = 0x4,
+	SCMI_IMX_CPU_STOP = 0x5,
+	SCMI_IMX_CPU_RESET_VECTOR_SET = 0x6,
+	SCMI_IMX_CPU_INFO_GET = 0xC,
+};
+
+struct scmi_imx_cpu_info {
+	u32 nr_cpu;
+};
+
+#define SCMI_IMX_CPU_NR_CPU_MASK	GENMASK(15, 0)
+struct scmi_msg_imx_cpu_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_msg_imx_cpu_attributes_out {
+	__le32 attributes;
+#define	CPU_MAX_NAME	16
+	u8 name[CPU_MAX_NAME];
+};
+
+struct scmi_imx_cpu_reset_vector_set_in {
+	__le32 cpuid;
+#define	CPU_VEC_FLAGS_RESUME	BIT(31)
+#define	CPU_VEC_FLAGS_START	BIT(30)
+#define	CPU_VEC_FLAGS_BOOT	BIT(29)
+	__le32 flags;
+	__le32 resetvectorlow;
+	__le32 resetvectorhigh;
+};
+
+struct scmi_imx_cpu_info_get_out {
+#define	CPU_RUN_MODE_START	0
+#define	CPU_RUN_MODE_HOLD	1
+#define	CPU_RUN_MODE_STOP	2
+#define	CPU_RUN_MODE_SLEEP	3
+	__le32 runmode;
+	__le32 sleepmode;
+	__le32 resetvectorlow;
+	__le32 resetvectorhigh;
+};
+
+static int scmi_imx_cpu_validate_cpuid(const struct scmi_protocol_handle *ph,
+				       u32 cpuid)
+{
+	struct scmi_imx_cpu_info *info = ph->get_priv(ph);
+
+	if (cpuid >= info->nr_cpu)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_cpu_start(const struct scmi_protocol_handle *ph,
+			      u32 cpuid, bool start)
+{
+	struct scmi_xfer *t;
+	u8 msg_id;
+	int ret;
+
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	if (start)
+		msg_id = SCMI_IMX_CPU_START;
+	else
+		msg_id = SCMI_IMX_CPU_STOP;
+
+	ret = ph->xops->xfer_get_init(ph, msg_id, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_reset_vector_set(const struct scmi_protocol_handle *ph,
+					 u32 cpuid, u64 vector, bool start,
+					 bool boot, bool resume)
+{
+	struct scmi_imx_cpu_reset_vector_set_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_RESET_VECTOR_SET, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->cpuid = cpu_to_le32(cpuid);
+	in->flags = cpu_to_le32(0);
+	if (start)
+		in->flags |= le32_encode_bits(1, CPU_VEC_FLAGS_START);
+	if (boot)
+		in->flags |= le32_encode_bits(1, CPU_VEC_FLAGS_BOOT);
+	if (resume)
+		in->flags |= le32_encode_bits(1, CPU_VEC_FLAGS_RESUME);
+	in->resetvectorlow = cpu_to_le32(lower_32_bits(vector));
+	in->resetvectorhigh = cpu_to_le32(upper_32_bits(vector));
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_started(const struct scmi_protocol_handle *ph, u32 cpuid,
+				bool *started)
+{
+	struct scmi_imx_cpu_info_get_out *out;
+	struct scmi_xfer *t;
+	u32 mode;
+	int ret;
+
+	if (!started)
+		return -EINVAL;
+
+	*started = false;
+	ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_INFO_GET, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		mode = le32_to_cpu(out->runmode);
+		if ((mode == CPU_RUN_MODE_START) || (mode == CPU_RUN_MODE_SLEEP))
+			*started = true;
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_cpu_proto_ops scmi_imx_cpu_proto_ops = {
+	.cpu_reset_vector_set = scmi_imx_cpu_reset_vector_set,
+	.cpu_start = scmi_imx_cpu_start,
+	.cpu_started = scmi_imx_cpu_started,
+};
+
+static int scmi_imx_cpu_protocol_attributes_get(const struct scmi_protocol_handle *ph,
+						struct scmi_imx_cpu_info *info)
+{
+	struct scmi_msg_imx_cpu_protocol_attributes *attr;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		info->nr_cpu = le32_get_bits(attr->attributes, SCMI_IMX_CPU_NR_CPU_MASK);
+		dev_info(ph->dev, "i.MX SM CPU: %d cpus\n",
+			 info->nr_cpu);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_attributes_get(const struct scmi_protocol_handle *ph,
+				       u32 cpuid)
+{
+	struct scmi_msg_imx_cpu_attributes_out *out;
+	char name[SCMI_SHORT_NAME_MAX_SIZE] = {'\0'};
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_ATTRIBUTES, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(cpuid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		strscpy(name, out->name, SCMI_SHORT_NAME_MAX_SIZE);
+		dev_info(ph->dev, "i.MX CPU: name: %s\n", name);
+	} else {
+		dev_err(ph->dev, "i.MX cpu: Failed to get info of cpu(%u)\n", cpuid);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_cpu_info *info;
+	u32 version;
+	int ret, i;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM CPU Protocol Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	info = devm_kzalloc(ph->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = scmi_imx_cpu_protocol_attributes_get(ph, info);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < info->nr_cpu; i++) {
+		ret = scmi_imx_cpu_attributes_get(ph, i);
+		if (ret)
+			return ret;
+	}
+
+	return ph->set_priv(ph, info, version);
+}
+
+static const struct scmi_protocol scmi_imx_cpu = {
+	.id = SCMI_PROTOCOL_IMX_CPU,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_cpu_protocol_init,
+	.ops = &scmi_imx_cpu_proto_ops,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = SCMI_IMX_VENDOR,
+	.sub_vendor_id = SCMI_IMX_SUBVENDOR,
+};
+module_scmi_protocol(scmi_imx_cpu);
+
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_IMX_CPU) "-" SCMI_IMX_VENDOR);
+MODULE_DESCRIPTION("i.MX SCMI CPU driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 2a96fc29cb6f4dd1e4c29e0aaaa614ae9783da4a..27bd372cbfb142b6acb0b1cf4b82f061529d0d45 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -16,6 +16,7 @@
 
 #define SCMI_PROTOCOL_IMX_LMM	0x80
 #define	SCMI_PROTOCOL_IMX_BBM	0x81
+#define SCMI_PROTOCOL_IMX_CPU	0x82
 #define	SCMI_PROTOCOL_IMX_MISC	0x84
 
 #define SCMI_IMX_VENDOR		"NXP"
@@ -89,4 +90,13 @@ struct scmi_imx_lmm_proto_ops {
 			    u32 flags);
 };
 
+struct scmi_imx_cpu_proto_ops {
+	int (*cpu_reset_vector_set)(const struct scmi_protocol_handle *ph,
+				    u32 cpuid, u64 vector, bool start,
+				    bool boot, bool resume);
+	int (*cpu_start)(const struct scmi_protocol_handle *ph, u32 cpuid,
+			 bool start);
+	int (*cpu_started)(const struct scmi_protocol_handle *ph, u32 cpuid,
+			   bool *started);
+};
 #endif

-- 
2.37.1

