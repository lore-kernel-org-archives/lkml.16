Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE42641F4;
	Tue,  8 Apr 2025 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102034; cv=fail; b=lDQ62pGRs+DQAlwd0dna9GcOCmsKhaAmfgNy5fLRVs2cSb6BoCs6VJeLBf3ox6avOJUAh+5eiYtOlYygTz6EFmbFWEID9Y86FlNye8dQYy9uDUZ9hephqmEX3zw6Xtxm53BwtLG/Ownnh2wi5PY9Obk6bc89T44mngR2FlAfSuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102034; c=relaxed/simple;
	bh=pt6GJtL1YfYM11B0+jSClgPKbgD4OSWrmAAFfIF/fSM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=BVt2neWSLO/LElun59KuL9m14P7TzN5EVAHTNfEOcHih60550G45gsadN5J+3JjU4e+bpcrTqjcU/kB6swjYGSHBAnilK07nevleI3tHQdt8+hkIEigx8St1nN6cpNdwiX2esYgoP3jd0zNH7ofhT6rSRyIFlBmp5tMy1TNQcZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dfX1dyvD; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dfX1dyvD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3tsqtDOinSauDyB/AmPxSe7lfmxpafnva0kJoSWPDRO+jdal//d3/MTvMOU2iY+WT4W3VKnZsSQGcGVu99XtgDJxQcJVyC6f4pr9epbahzQLDCa8x7cXNXsTrpaY9DsU7x4NGsbRrL9U81/D8isDWnYA95a/e3x0bC22hN8VIGkAelzg3ucHj/Zv3TeTeUrJtjq1h8fMqzu5eru/nQPFs3IIbJtGSXQ0b6HMkV6Qau9blIPqJfMe0o4L3I7TCFVHHPT+mOr0XPV9ywUT4WO4ScVsUYKi9ouRv0TEfOzTjTlOj5ZXFCuiDXeABD2xcwcW9C3MeOzuhSdU2uyLYWTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUMQmljVm73rf83nVbb/yA/+61+dOo84cOTZ+qN2Lf4=;
 b=itfHQqhJR3l+/JGVOulOCWMUsduiXXXInU8TKqqb7DnBQetL4u8Azc0vJs7mgVemhSjBnJ1wJrsrq+//zYaYDLbFS+WeBbHPONb3t+5E/yfMgXiWL9nEHWmQRu+k41L1zZGlNezXTqBkTa3aLFaR0ILDOdsHpdAzPlL70BcEZhdMWaN0KG/xJOKasqGSb5R2gnZ8rdESW3DtKc8piIWHTTyS9j58NnqsD+OCqIW9e57lgxeDtZB6q+qbt741GBvcFAoXzeUxsXe2vWDMprw92j+s0Hm6+1f7lQsTihJRcBAfZx4P4jrqEiqgcT23dDBUYsIOfTNSYh0qOOFvKc7VfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUMQmljVm73rf83nVbb/yA/+61+dOo84cOTZ+qN2Lf4=;
 b=dfX1dyvDBTRZ3qs16rDm/lSR12JkrPWNreF6S5Kr+BO097U+hlclJkxuc6vDwnR0d3bcRJS+B8RF+Dm9hc8QnBv2xYYoGz5bz28ruWrvQ8dIR4bTM/zei5LD4HmivOM1aN0EYLHsXHnm9bXFjLy1w3n7ha7WrhUuFpzF0+SNWfHGGh/M4dDsLHYw7s9ryQqWLabyQ4w6xJkxKK3V1ZeS4ZebafNVKyQ1+C3HGS1rylsmQs+tF79fVNFq0QUNTXOcmsufKyEt736bNtq/qHigpDFDkUpR14yzh5IB9qho5VT2M8MsDC/E6Lo1qp9s1OFsiVlb8xxIWP+H1XMh/AkvkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 0/7] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Date: Tue, 08 Apr 2025 16:44:24 +0800
Message-Id: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjh9GcC/1XMQQqDMBCF4atI1k2ZTEzUrnqP0kUaJzXQqJhWL
 OLdG4UiLt+D759ZpMFTZJdsZgONPvquTSM/Zcw2pn0S93XaDAEVCATuw8RfIXDbf3guytoYg6o
 gZEn0Azk/bbXbPe3Gx3c3fLf4KNb33xGHzig4cCDzKAgKSTld26k/2y6wtTLiLlHgUWKS0hABq
 EqXVhyl3KUEeZQyyUJXymmnhXV2l8uy/AAazgW0GAEAAA==
X-Change-ID: 20250120-imx-lmm-cpu-418daaa257e2
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=4465;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pt6GJtL1YfYM11B0+jSClgPKbgD4OSWrmAAFfIF/fSM=;
 b=7SOBPu9dqRtb2eOkitQjZ1IEu4HSMMHvjjW4XK7eHEDTrOr6XvY2vba3oRygExhjUwwPUKFfY
 8ndKPJM86EuAi4MqM/uu4IeDSHoaTQdeYMi8ZQYo0FTzx6WwzwD8msF
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
X-MS-Office365-Filtering-Correlation-Id: 902291d3-5b45-4cbb-99de-08dd7679f272
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2xMSGhZRUNRVDlmWXBjTlBteG02cDFJUGVJM1RXUUROVTRPbm43bmNPM243?=
 =?utf-8?B?Y0dMMjlMaG1TNjhyRFlicmFwSVM3d1FXL2phdG5qaVlBMXBZU2FubXRMQ0JJ?=
 =?utf-8?B?MldVT3puVEhZbUhhcmtmMzlEVHpVUWk0OVV0ZWg0UVZubGQvWTBqZzZ4S0hT?=
 =?utf-8?B?eTFFSzI4eWdCY2xPK0ZDUkVNbVpqVGlweHEyRmM3Z0srL1lRNStmMGZWdkNK?=
 =?utf-8?B?VjZLN3J4SVIyMjVCQjRZc3didmJjZG9nejF1SC8zaU53SWsyT2pRTW1tUFA0?=
 =?utf-8?B?dDRiTVJNWVFsNkJXYkRCOXFYLzVyc3hmVUJLeFBjQ1k5Q2dQNTl1OU8ydVVw?=
 =?utf-8?B?WlFzdm85MWwzMk1lR1VBY25WU25udWFSRjdFMTQvSTZNb1pMeHJhYWxXUlUv?=
 =?utf-8?B?SW14WHV3T3BsMzBqUWZrNkxSQngyT2N6bDBLUmgrQmNMTjd5S0pQSGgvZndW?=
 =?utf-8?B?QklNR2MrWFJmZGRMZW5jWi9Mbmx6S1hWOUh2d0pSSVNRSWRTR3RSNU9WeE51?=
 =?utf-8?B?T2w4UW14R3F6YUJxVDFDRE9ibjY3MlFkQkM3RGtjS29SNHpidkNNM0dCOWRp?=
 =?utf-8?B?bkdxUHdsQjRUQm02Y0tJam9BUTYvWk5qYkpNcWtjSnpTMHVLMkRtNTVxd240?=
 =?utf-8?B?Z05GYnVhTHJiTFAyZm5lWjh3ZGpMQUNxdkVkUmxKMjNsYmlEMVRYOUU0Nngr?=
 =?utf-8?B?aUw5dW1XWDFLS0J6YWYrTHVCUTdFeVoxVE9MZzNWbDdGM0ZIYXpUNkFMQzJz?=
 =?utf-8?B?UVdUazlYVVU3OW9oQ1NmNnhvMVNUOFZQT3lid0E4UTdaUElHRmtWV2dadWRK?=
 =?utf-8?B?bnBlNDc5STE0aHBER2lCMm51bjJOdmZ3V0duVS9UK0NDRUpqd0ZDTG1vanV1?=
 =?utf-8?B?R0ticFltRFJvZ2RGWUhVOGNUZUZDY1RZOWZtUkNUNS9PdkdWYWI4L3c3RXRB?=
 =?utf-8?B?QTdCaEtOUmNicEE4ejgvWDVHZ2JmM1FEa3BOUEM1Y0VucTRndWdlQ0pVakJL?=
 =?utf-8?B?TGdhRTdHTFNNSGQ2aThCSndId1czMUJ0WEE5VHo4NGVySG0xK3ZKdlY4OTJZ?=
 =?utf-8?B?MTZGbHhCMDdtcVFyKzVYUDFjYXdqdzFid3hNWWNMRktTVC9xMkJmQ0VpOTU4?=
 =?utf-8?B?Y2hxbUorMlptUjNpSnYzdHFaeHNJWVNNSElwRGkzcVdKTG5lUkhYUlpNdGpx?=
 =?utf-8?B?T2FpaHBaNGUyZ3QrTEtOZFpqM05LUnFneDIyTlFqUEpqRkhEWHhjUXpneGVV?=
 =?utf-8?B?bDc0bFQ2MDdFcm9YTGUveDVPcHNpTHIzaWNac1RSVlg3NGV5bENJdGg1NzMx?=
 =?utf-8?B?azlLY2xWR3hWbFd1S3ZHbTlJYXAwMEkzbUZUdDdtU1U0WEZOQkEyZmNmMGEw?=
 =?utf-8?B?a1JrcmgxL2U4NWYzTFptZ3MyVVVwM2oxaVF4dWNPMDJDa3RhWkE5NS84dmxn?=
 =?utf-8?B?ZS9jSEN3NWM0Y0tHREpsS1VudENGUWZPbTJZbUJoM0o5VWxLTVU3b3d1dlNC?=
 =?utf-8?B?U2J0enpQakRncU1ITG92WURvU2lJaTFadjB1M2lleFpmVnh2M3RHSlluZUVF?=
 =?utf-8?B?WFBjbEszS2dZOEsrcS92cU1tY2hES0VhNEU5cVQ2Mk9IaGhscGVqSmZNMDQ2?=
 =?utf-8?B?eVk1TkdPeVc1d1BYOFNudzF5UkJKZnlaQzFGbERMb0tBYmhmR0ljVkxFaUp0?=
 =?utf-8?B?TkpQb3FWKzhaOFJvb0lVUE9tZngyR0FrWEcrQjRSVWZoNS9OWlZoRDNFODFE?=
 =?utf-8?B?R1c4cVpZNXIrRDBJYkVRNm1aYXBIaDU1WnJSMnh0ZjV3K3I5cDJhd1pmOFlm?=
 =?utf-8?B?RW5tSTg5SnNRcGJmVHNaY2YxdnptVTZqVlV4L2s4YklNQzFQem4rWkdsUGU0?=
 =?utf-8?B?UG5TNDNuaDhXZmtjR0kvR0dubGgxbC9oRCtsMFJhaVhrcjBMbFhicko0NDg1?=
 =?utf-8?Q?KIhU49asqhUywtvgOlZYnst0tNPoUMnZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0pQZmplMFVoSExxN1liWmdMblBHaFRVWW9GNzNLUlhsQzNsQitqVlU1K0c5?=
 =?utf-8?B?Nk1LQk45YXAvRm1nY1E4SXVFNGRBeFovSXlNTmoxNjFQd0JZc3lyMWJVNHdB?=
 =?utf-8?B?UEdCaG9hTng4bkxaaldybWVCbm9Ga0JqYWRUcnl1RkNKV1V0ZnZYdC9VeGtj?=
 =?utf-8?B?YmJuSHRVSE4vb2Y1RHhwM1BnYlNhcDFhNzJZRmNLbmFhbHlWMkxMNGlPUk05?=
 =?utf-8?B?K3ZRdlJTVEdZcVdZTzdodXk5YXE2Z2FlM0RuZnBSUEJFbGQ5SjVWVG0rQnd5?=
 =?utf-8?B?QlpQak5GMGd4K2lxTzZsODlrdy9FOTA2TU84V25vdDE4YUJoZm56MkFOZGYr?=
 =?utf-8?B?MUczZklDYTNtZ0NTVEdxQVhKY1pmUXV6Q2ppeE1KMmJ1cDVWeTVIZnNPeGVN?=
 =?utf-8?B?b1RPdUNxbnk4MEFCWVZWdHJMdGZGOTBsYmhZYm9mVDJkbno3cVFkOTZQRDZY?=
 =?utf-8?B?TTE2akNicFFpSU9GWlkwSTRHWFQ2MVE5d0hOTHBsdFhjSWtlR0g4YjVrc28y?=
 =?utf-8?B?REJ2eWNEaGU1eEwvVEU2aklxTUd4MXNmdUlGdTdEWlg2OFhBa0RGOEFZQUpO?=
 =?utf-8?B?RjliRTA2RUljeWZQSEZTWm4ydFB0S2p5QWR3TmVyTXZpZkx4L0RjZWNVRnNV?=
 =?utf-8?B?UStGMjZzV2NQRU9SUEFNU1ZybUVmVXJLcUpIT0M5WW1BY2N3VkUweHVFZ2dk?=
 =?utf-8?B?d1ZsTU0rd09sUUdkT2w1cXV1Z3dGOFg2dElTbHo4SENYUFE1RC9naExyN0xq?=
 =?utf-8?B?NlBWbytCNHpkZXRtZGVYTHFTN0kyYzgvbkNIdExDbkxFSXhFNFlkekhHd1hl?=
 =?utf-8?B?QzYvNVBhM3lXSXRhaENWd21uZ0VqWXZ2V2xtaUJ4eDVQT1NBVXBIRnk4MnR4?=
 =?utf-8?B?RVNKSm9NU0NzMUhYNkVxQXJvKzk2V0UrMWdicGx1Yy9nRldQbnk0RlpGVnVI?=
 =?utf-8?B?SlFTYWh0RmpremNJQzhSMDF5dDMyMHVZZVpiSlhaaFVyYjBWV254RTFxa0xE?=
 =?utf-8?B?aW5xWTZWTWpBcEdsQkV0dStROWhlRkVvbmFVVlZ5K0JVenlPbkYyNzBJSDIw?=
 =?utf-8?B?d2E2ZS96Z1B2MzZsMkNoc0lIdzZwd1pQemVXTXgvVHB1MWFjYXkrMjdCa05G?=
 =?utf-8?B?VkQzU3FMd2d2QWRmclVGYklsSHh0TitWRTl1MXpiZE1ZSGRXYWJlZjFCdDY2?=
 =?utf-8?B?V3pjNnNHVHEvZVBjTGsyNG8vWnRzcEloMkJ2QkVPSGRzVG52eXlBYzE0R1Qz?=
 =?utf-8?B?U2pFK1VYSEUxai9MYXp2M25GMWgvMEozbjRtNFZXMDl5WGVmcjVzQ1lxV2t0?=
 =?utf-8?B?N2N3elN5cWZHL1dVVjdWUlAwOE1YTHFONERWYkpKRGhIVklaZ2U1VzhNai9Q?=
 =?utf-8?B?dGRHak5rSzhhaisxNys5cldrcjhpMi8rdkt0MXREK1IvdDZJS0ZYUm5paG9H?=
 =?utf-8?B?ZWdwUDg0Q1B0cXdSVllYWjBwcFdqNEd1VHRuRldLdDFDVHhxeW84NjJBME1T?=
 =?utf-8?B?NzJJN3VNWlYrUHBxckROMTRJTWNFa2cvekJUQmlwdm50aTdCbzRxTk9ZYmpT?=
 =?utf-8?B?M2JOVTBvYk1mMEowY2pkOUxheFdBWENmSGJoRWJrcVNHL3J0cG8wT21RQUYz?=
 =?utf-8?B?RjVqNjNueXBCZEJ5UUJoamFCWmtxb25TMHBTbitxOWQvRTlQNFZSeFVLZGZW?=
 =?utf-8?B?YWNKc1N3Tzl2aUF0Ykw2WVc3cldEVFBnMm5BbitUSnFBaE8xRHo3eEZiQVg1?=
 =?utf-8?B?QTlwZW5jMlk5d3hydWRUYlMycHpscjZsT3R0NUkwdXlkd3l4MjBXMVBqSWFp?=
 =?utf-8?B?T2VpTytJVEFsNmxaZCtyQ0x3QkZVcC9QT01jOWpuU1gzbEdQQkEwL1FQUVAy?=
 =?utf-8?B?N21zaUtEc2NGUXoyTzJxcElvdG9wb2g2bjNjczk3MitoQTNSR3RoSFp1WVZC?=
 =?utf-8?B?aGhWSk1ZNmgvQlZ0UTUvZnhWL1JiMWtESjAyazJtUW56a1I0dmZJY3ZyQi9O?=
 =?utf-8?B?MEZ4ZHd3ZWJIQTBrNCtWVWVUZFlpaW5KVnMyaFhyUnRjNjkwSmRoTkVHWGto?=
 =?utf-8?B?bXNpV2x0T1MvNmZqY3FhQUFBcnk5NitvdnpvamFlZ2RIRFRKRGRsZ3BwdUtC?=
 =?utf-8?Q?VvaNyTyhqmFPtszGr9YUDUVZW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902291d3-5b45-4cbb-99de-08dd7679f272
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:08.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgjQuyTeF+dzy/Q+8qvt/JmxJHNcY7BZsrTrjs0L9Axxp6vBFTQ3QVLxeCa4c0yrCpQhdHBHXe00w3p09NttCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).

To manage M7 in a separate LM or in same LM as Linux itself. LMM APIs
and CPU APIs are needed.

When M7 is in LM 'lm-m7', and this LM is managable by 'linux-lm',
linux could use LMM_BOOT, LMM_SHUTDOWN and etc to manage 'lm-m7'.

If in same LM, use CPU_START, CPU_STOP, CPU_RESET_VECTOR_SET and etc to
manage M7.

Both LMM/CPU APIs will be used by remoteproc driver. The remoteproc
patchset will be posted out after this patchset gets reviewed or in
good shape per Maitainer's view.

Build pass with COMPILE_TEST
Tested with remoteproc on i.MX95

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- In patch 1 to address Sudeep's comments
  1. Several typo/format fixes in documentation
  2. Describe what LM is in LMM part, update number LMs to use bits[4:0]
  3. Limit max number of LM to 16
  4. Add info for reason in LMM_RESET_REASON
  5. Add info in CPU protocol part about the need for having a CPU protocol
     in the presence of the LMM protocol
- In patch 3: use info->name instead of out->name, update
  SCMI_IMX_LMM_NR_LM_MASK to cover bits[4:0]
- Add R-b from Cristian for patch 1 and patch 3, from Rob for patch 2
- Link to v3: https://lore.kernel.org/r/20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com

Changes in v3:
Patch 1: Correct LMM_ATTRIBUTE return values
        Update the return status of LM_BOOT/RESET/SHUTDOWN/WAKE
        clarify sync/async in the Introduction chapter of LMM
        Update the Origin entry in LMM_RESET_REASON
        Clarify CPU run/sleep mode
        Add note for CPU protocol to indicate AP using PSCI, non-AP use OS.
        Specify mandatory for each command in LMM/CPU per firmware owner.
        For BBM/MISC which have optional command, I will update doc in separate patch later
Patch 2: Add description in binding doc
Patch 3: Unify scmi_imx_lmm_[boot,power_on], Use le32_get_bits
Patch 4: Unify scmi_imx_cpu_[start,stop], Use le32_encode_bits
	 Add pointer check in scmi_imx_cpu_started
	 correct nr_cpus calculation
Patch 5: Unify lmm shutdown,boot/power_on, update kconfig to avoid build bot issue
         Add R-b
Patch 6: Unity cpu start/stop, update Kconfig to avoid build bot issue.
         Add R-b

Ran smatch as below, no issue found.
~/smatch/smatch_scripts/kchecker drivers/firmware/arm_scmi/vendors/imx/
~/smatch/smatch_scripts/kchecker drivers/firmware/imx/

- Link to v2: https://lore.kernel.org/r/20250212-imx-lmm-cpu-v2-0-3aee005968c1@nxp.com

Changes in v2:
- Add dt-bindings patch 2
- Add a maintainer entry with patch 7
- Update doc to address various questions and make it clear
- Use strscpy to use scmi server returned string
- Drop extra blank line
- Shrink scmi_imx_cpu_attributes_get function args.
- Typo fixes
- Add LMM_RESET_VECTOR_SET
- Link to v1: https://lore.kernel.org/r/20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com

---
Peng Fan (7):
      firmware: arm_scmi: imx: Add LMM and CPU documentation
      dt-bindings: firmware: Add i.MX95 SCMI LMM and CPU protocol
      firmware: arm_scmi: imx: Add i.MX95 LMM protocol
      firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
      firmware: imx: Add i.MX95 SCMI LMM driver
      firmware: imx: Add i.MX95 SCMI CPU driver
      MAINTAINERS: add entry for i.MX SCMI extensions

 .../bindings/firmware/nxp,imx95-scmi.yaml          |  23 +
 MAINTAINERS                                        |   9 +
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  24 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 276 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 262 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    | 828 +++++++++++++++++++++
 drivers/firmware/imx/Kconfig                       |  22 +
 drivers/firmware/imx/Makefile                      |   2 +
 drivers/firmware/imx/sm-cpu.c                      |  85 +++
 drivers/firmware/imx/sm-lmm.c                      |  91 +++
 include/linux/firmware/imx/sm.h                    |  19 +
 include/linux/scmi_imx_protocol.h                  |  42 ++
 13 files changed, 1685 insertions(+)
---
base-commit: a1bbf852df875d12e8916095a961d890b7b939e0
change-id: 20250120-imx-lmm-cpu-418daaa257e2

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

