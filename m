Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BA3F9C5;
	Thu, 24 Apr 2025 00:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455314; cv=fail; b=rzSDntTAF4xwGrZuY7CaYACDjWy41xrKjOMU3xHZx9wM8pGl+K2yaxI8pIFKvQinIJrk1qMDHlG1QMTqkn+UDQdhOKOZOkFjtIfFREpTlBxbKqXZbCBwTehi7SmgXKx+d8mJ3tTI6lVKpozPJO/QZ5r5XMZLtdOFAnRLDMuV1r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455314; c=relaxed/simple;
	bh=d/+ShhaMRRTryu1vEy7CE0B/GiXoEoH/LwY/JcWFJLw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gSwuYwosRquhlhJWgLAQaWxUSJ5Zi8M+T73XDrMdOTECjwKiLJ6gwfBHucpnLGrg6v4i0yooBIZ56N4aEwRqW3zCQfaTWB/bZjuISL1gRyA656ij33gFDhoMCBPfPxu6pUBvwWOT9CBjOLWn4ZF20TuvGPLtrF2a7+Y+mBOZAQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DEH/vT5Z; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DEH/vT5Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0MH4KVVwPp5XD6yOIbIZRMqu0P3nt0QSgepGl+UUIcXsoNRzf4L3F8NPMsSFA/IxxuFJc0TdjEj8NHdqqUVGuX5U4nleWlKG/ukplQZ7P30DDE4DS7ajim1AB2KO1qKotUBbCLLufBwPc8k2Yz5CoXMIJ62qEKwtY6jCSP0MxWJTKg7kledlclvB5QVBvr3QIzUPfZCQ6EM0UcGo0po00u/WglkasFzRaFfqwJurnQHK4GZ4ri8on1cNtI/tIWr8fXePKgtZ/WV9n2A8ia54+D3Or/ORCOIsTZy+hJ52+TSXRTScGxlPL7T/UzPl9seHSrDS7HiMSSAACUbnObcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwt0KJzJlqQPdWZUTh1ZmqoXFWYGbRRKlHuOBYV69s0=;
 b=F7JVVsUD8XepYXfyMvwHP0IEubbog81f0LOq+um8MwFgMAdPVkeB6QupkzsSELok3pHOf7CBYzeaR3ubfaK2OGHAETUB0uMvFdag2Vl5bX0WRkAugfxGz5KZP+EexhT3O52CQmcdSVQjF3oVD/pyy+xHIa70i49iNdR0pP2UQwM3TKGo8J5k5TfQkcAmUZun0fGOQ6qrOdXD+SSQ6h6cI8UcZ5xG+ytZLrzHsICf9qLxag2/N/OpqD0n4UyzrnhewLT5jNxa6avVdRxU0ePOmp3HcaGWCXH3swbLejsxSo1Slq7nmlSjGj0lReP/Hp+XkUV+GgPYr+vT/UzCGtN1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwt0KJzJlqQPdWZUTh1ZmqoXFWYGbRRKlHuOBYV69s0=;
 b=DEH/vT5ZzTOCouYdYPflia8GL35ccd7dFHYCqCYpM9NIq0ZF2G+GaOcjZa4Ij7opBaQqbvPIs+21ebEViw/vki6m3PcjTlBYmY6kAR8GAbOAi1rLhOhkzB/9sUER7b35aYRn7qiR9FBvH2ZrNzuznIkub+7wYVBpsvJvONr4LuDij/R62XjrS8kof/3S7hOZ6Mg+pBszYzYqTki58yCBNTXB/kBkuXzm5pDpbITQNlfQKdyygKNAPEXWvcq9SGcfzhjbipx7myY5spumK4Lxdv4anHj7E2Ak/J+bfcW+XfEQmKDPKm5GLk4EgJrGgYOi307XIZFhLlOD2xkX4Oqc6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:41:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:41:50 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:24 -0400
Subject: [PATCH v2 2/8] arm64: dts: imx8dxl-ss-hsio: correct irq number for
 imx8dxl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-2-43c982d83a8f@nxp.com>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=666;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=d/+ShhaMRRTryu1vEy7CE0B/GiXoEoH/LwY/JcWFJLw=;
 b=oO5h1znhOI4elG83m6NL3tVDeAIp5tuyPJkLvDXdfawhbr42iNTvzf4TUf34o2WFdVL+eNmob
 T2aijDgkfEOCJZ+5zucpIPc+spudONUW7iiCFvJhrNVWQoLy/KZjHrd
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: d687e1a3-8a7b-4180-34e2-08dd82c8cd29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bExmRFZVVUluZTdQMmxIeHdHQW5RQmdPYW84RTdaMzVSaVNod3cvdCtSUXBV?=
 =?utf-8?B?SmNmSVdhU2MvNklGR2ZzWUQ0REMxUHJyVFNuMVBQeHI5M2lxZHdPNEVNUkFZ?=
 =?utf-8?B?bzFqVGR4ZmYrMFpGS2FIUW5xTTNrUytBK3lmTkkvOXdYWW9BVEFSZlcxMDFJ?=
 =?utf-8?B?WUhLZG9kOUEvOWE3aEl1cHhNdEovaTVlNkdqcFJTOEpiTXlBY25RNUJhcWhh?=
 =?utf-8?B?Wm5JQlFlV3BOci93SkpyR0tJOCtpMXF1VUZFU3FQbVhmeml2ekZ4OEhBUTdU?=
 =?utf-8?B?OUNSWC9LMmR5NFV1Z1dxWUEzUFVVR0RNbGFwaEY5SERjYk45aVVZeU5HNmE1?=
 =?utf-8?B?SXFlOGdRbTRQbkxyMmltcElPUjQzOHQ3NnZCRzRrZEljbXEya2tCcmZLOEhF?=
 =?utf-8?B?T1NxeUJXUVQzTHJWckx2OWlZSWtJSVg1dFd5QzJ2WEM2TFE1K0tJanlLaGhP?=
 =?utf-8?B?UDdXUENxK24yYlhsM2JrTDl4dUd4N3Z6dEFKYnpjbm5KcGRFN2RVUlJCdWVx?=
 =?utf-8?B?cmY1SXI3SW5WczM3NHhZQ0hNbHlhajlWckJyRzBnUnczMzFtNkdZcnM3MGh5?=
 =?utf-8?B?MVZ6ZHpKcGd5TktLbk5ZWlVNaTB6aDBYMkdyYnhIL0xNWUdRRTNUd2V3Z3N5?=
 =?utf-8?B?VWtvWVdEK1Q0Q1Fqdi9WblJHQ2pBbElVK0YydG5Kemh2b1U2SDJXOHd0cmFl?=
 =?utf-8?B?bVdZRFFNdE0rdzA5dTJQNndqcjZsVmlSZ1gycjBkdnBzN1VQK1ZwejBWZXBN?=
 =?utf-8?B?YjFmVnNDYkNxZ0kzejU0c1lVeW9PNWprTVo0TFZZcXl2eGJrRkM0VEZndWtY?=
 =?utf-8?B?SkxEaUJDT3hqaEdrcXZSRFFBU2RuWW95UEl5a1F5RHMwanhVdW9EMWJ1RVNH?=
 =?utf-8?B?SndBRmI1Y1BFb0VLd0p3VHlnOE9ma3lEYWpDZk1vV2xkSjNKRFBWTktSVW42?=
 =?utf-8?B?Wjg0YnBoZDRCdE9CelM5YW8vMGRMeGFUc3JxVXJFTkc4cU1HejJFMEtmcU1B?=
 =?utf-8?B?Q2h3VjdsTzlHMmdXcUhsUWJVVlU2eGVRb1M3M0o4Nkhzb3RaaXlJQ2Jrbkxy?=
 =?utf-8?B?NnlJd2RkcmdmOG9paVV2cWdZRURNUnc4R29GR0laaElqRWpPSUlkbnBzWksv?=
 =?utf-8?B?NWpIY3NzVFFJK2lYY3RDVGNGL0V0dUpNcW5pbU5hSU1YL0NVMGJ1WXZiY3cy?=
 =?utf-8?B?OERCVjZRbHpCODRneXFmSUdPQlFjdXNtSTdkdHFUUmhkWjE5UGgvbzB1TTlX?=
 =?utf-8?B?WEVNL1FxSnZpcUNwK3IyZ3IyWk1yRlRMMGQ1OFVWVEMyS0xINVhZWU1nZEZy?=
 =?utf-8?B?ZU8wVFk5R2plT2FNdDRCOGV0Vm03S0hoZEVtNVpUVHNaZlc4RnpOZnh4dFM2?=
 =?utf-8?B?U0N5YmNLVFZRY3FYMlFpZ2d0ck1WbjAxQkdnMmJ3WXIzd3hFY1NpQjRDVUVw?=
 =?utf-8?B?OUVkR09rMkx1cmt4QjVHU2hURFRJM3dSd3JxOWUyUG5BOERyN1lsMFVBNDkv?=
 =?utf-8?B?bWpyK0FvR3JCQS80WXpUL2x0MVM2MStoMWtvSGdBSGR3SXhLZWQ3MWNIQ1Yx?=
 =?utf-8?B?NTFuck1hSnYwVnI1Q2lDMG1NSm52SDZjU3hqVnNjcmdHcmRFNlZaaEdtVmlQ?=
 =?utf-8?B?eklpdG4rckRBMjdXVytKc0NBc0xJWStCV2tGWlp1cC9WQUtSUiswUFBwNU56?=
 =?utf-8?B?S3liZFJ3QWFtSURMT1g1UG9Ua21UUDlaU2k2U0dycE1ITnR3ZE5LTUc3bTNV?=
 =?utf-8?B?bWdIcmpkU0VZSFg1Qnl0ZlRBUEprN25ZbzRlRHhvQjM3TGc4K2NyS24xbHBx?=
 =?utf-8?B?QjJxdGc3U0VuL0ZVVTRTUmN1dGQvMG1wTCt2OXAwR0tUeUhGU3gxNFBtWnls?=
 =?utf-8?B?QUpqQndXeGhtNlVhMVZwZDc2ckhMUUpsMUgrcEh2MTlObGVXUjV3WFdxYzhm?=
 =?utf-8?B?UENTRDZCa3pNdmczS05tZkl6OHJDYjgvbXh5dldsck9XdHN1RWhwbU9jK3VT?=
 =?utf-8?Q?70IltzsFEZBf/JhASFP8/ln7ZQCHpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a29DUWdDb2hFQWVoRWh5RUtiWk1yZXNlTzV2ZThYcWsybVFtZCtMdXBCRm1t?=
 =?utf-8?B?ODdacEdndUdzV05ZbnlXZjZjZ0FteVB2NHE5L3MvS1JEYkV6TFg0OUlVUE8z?=
 =?utf-8?B?MjJoR3JXMXNVL01MZEtIclYvdnlBM2hhWDlLYXpNOXlEWEl6TWI0VHhwYzg0?=
 =?utf-8?B?K3lTSnBVU3JpL1ZZdWU5a0tEZ3lnUC9PNWpJTVNUR2hUV0dVOUFhUTRuYUwr?=
 =?utf-8?B?RmdzdTdPOXQ5eFJoTkh0ZlBXZWNoOGZ5SkNrWTF5clplOWZTVzVYZW1NWFph?=
 =?utf-8?B?R0ZNOStOeEwxTmtRc25HNWFiSjl5dGxKSGN3UzVrRE04Z0R0ayt4c2VYU0xH?=
 =?utf-8?B?UWFwVDlpS2Z6cVNwM1Y3bEpURGkwckJacEFwbXFiRzhCa1ZnU0l3VWE5SnZx?=
 =?utf-8?B?ZGRwa0wvYnFyRTV5TDJVdldlVzNwSTZJdzZyWGh2Zk5XUU9UcmNHVmpVa1F3?=
 =?utf-8?B?VldIaHU3aWI4NnJkdk5GcDlHcUJLaEJwdGdlY0Q0U2t4cWx6Z2dIMEFYS3o0?=
 =?utf-8?B?SXE1SVlNWXJ6a25taU9GK1Q5bW4xdnh1UENicGJQQmFKTnFXRW12SGNTWjha?=
 =?utf-8?B?T25TZEFQVW9pREpUVmorVU10ZUxCaDlyQkYrYlg1NUE5UzN1bkExdWNKZ0tv?=
 =?utf-8?B?YkNzZ25tc0kvbG9Fb1k4d1Q4QXcyM0hhRGovNkRxYi9EK2tRbjlnM1ZEMk03?=
 =?utf-8?B?L0ZNTXRXd2g5bzlJUXVGcjNleHZXVlJxQXZmZThpaW9veGRaUTRFcFo2VkNM?=
 =?utf-8?B?OHR1SC96M3FrN3ZNblZxdVpXU0lLU3ZhNmJzTFhCaVJZUEdFQTMvYnFPdE1Q?=
 =?utf-8?B?cjMxd000NzVRbUh3QnVNUnk3dUpkTlRzRG94VkEwYWNzWWlaM2pFbzFJRWEw?=
 =?utf-8?B?QzlaOGNFU3ZuU3JiTkZrWFUvcEVXN29pSE1ySjdIYmpXcndKN0s1Yko2RWIw?=
 =?utf-8?B?cUErTzNMeWQ0bkZyMW9kYUh3dkZZdVVKUkxIMWFsTUwzcFUrcElHOFNhZTM2?=
 =?utf-8?B?cUpYUVdBU082TmlqUHIzOFZLR0dRYThWZTJ6Y2JKZzBjcUhrSVJDTklNT0xZ?=
 =?utf-8?B?THVlNW9ZMGlQVHhGTEErMEtSU09HNVpyZVRUVlEvSTZmVVozaWRmT0lOaGtQ?=
 =?utf-8?B?RHNjcXBxVEE3OGo2N2tqd05paGo5Q2FLSXdpelE4NkZDdElBc3kwWWhYVmRT?=
 =?utf-8?B?M1hITzBEQXZCYTFOVWNnS2JRU1NyckV0ZGhONUZnVnhwek1EcXRUUTZpRUU0?=
 =?utf-8?B?cjk2RW5Ba0tvMkgza1pJV1U5Wjlqdjkyd0ZTTmtUNytzK2NiVkg1bHNyYnFV?=
 =?utf-8?B?VzNzZmVGaXI1bWNaYkFhWXEyaGpqdXMxYU1CODhZUGVvMHhIL1JmampKTVJm?=
 =?utf-8?B?Y2EwcXQ5WjdiWDJGQ2gzTTFkNGV2WCtUT2d2UVNVd0RIZ2pRaURpL05jbXQ1?=
 =?utf-8?B?Ti9HQ0EwaFhrTzB0aDJEMksxS0R6T0lVNmhZMDNvNnhKNE5xRDIyYkpZU3JQ?=
 =?utf-8?B?UmtTT3VSRFdkcHVuT2ViVWRYcU04Y1pCOGdCWlZsdXhwbnpZTUFyUnM5TW93?=
 =?utf-8?B?ekVNcFFYbnRibXBaR2FCMUVHbDJybHdFK3NNRHppZGszZU5nc2FVNkhQOE1D?=
 =?utf-8?B?M2g4eS9Fd0k0VE5XOWdCNmdNNHZwaWg2TUMxV0dkaUg2UW1rTzg3YnVTVHh6?=
 =?utf-8?B?NmhvbS9rRE5NZkt6ZEJSMkpKMndXZG9lbEw3YjdzSnkzR21nMmNscGJWc1N2?=
 =?utf-8?B?ZmYwWVNEdE5FNzdRUVB2M2pNbzdtdmgzT2ZXR3NXMitnaGNjTFNVWEkwMkJq?=
 =?utf-8?B?ZE1MK3BRMlZBUTAzemFubTJaMEVWWUM1NjJTTnpjYzM4aXZTWDNhYUUvWURF?=
 =?utf-8?B?Q0JWWnNIcm81NGZYc3dsbnRLNTU1M2pGeUppMEo1UHlnalFMUXh4aXAyL2hs?=
 =?utf-8?B?WGRuWVEwdS9nNXZLTEUzMWJaQ2xHSUNEUUQvS2R6TTRJbUZsczY0K2Z3TmU0?=
 =?utf-8?B?SnNWb2V0UEtMVi9iTWFmQmsra0RKalJUMFFWNW9kZjBzVCtHOW9ZRkxNK1Vu?=
 =?utf-8?B?T0p4MmhYY3pobkh3cFhGZDdsK2VWRTVMYm9FM2VUVklEcGZhZi9OaGlOWWV2?=
 =?utf-8?Q?vsY8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d687e1a3-8a7b-4180-34e2-08dd82c8cd29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:41:50.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBmjJxdFwMSkvS8Zb8htIKlWr9e9X+rTxna1U+TlTIsZK3mSk5eypW82WX2I7QDSjMYlNc3sjeUqVG4TCI2pvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

i.MX8DXL use difference irq number for PCIe EP DMA.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index 67c5c6029cd9b..bbc6abb0fdf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -50,5 +50,7 @@ pcie0: pcie@5f010000 {
 	};
 
 	pcie0_ep: pcie-ep@5f010000 {
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "dma";
 	};
 };

-- 
2.34.1

