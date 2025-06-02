Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157F149DE8;
	Mon,  2 Jun 2025 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901683; cv=fail; b=bedJFR/GGI/9d6QI5pDKKpYEf4eCuV8CbudzX7ERGkKPG5PUP7eBwijQMK2GDHv6eT2kr7rtOQtQBet1giMOZo9lNL9A0yOEZkM6acMQC7Wdh04/UV9ol2WbSbhdLoIb9biUIILoeXzdTJV4JhVubHbJzhbXHQ/PyXeQ9l0f4vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901683; c=relaxed/simple;
	bh=9zCQl/OFH6/mcT9pkW4dl/tj4RiNpm/QHR6OZTrsXvo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dmpUtogS1+baaWtXnU1+w49TdkaK6vWgU2iHiBurvCI/E24OSbIa4VYMZJsUXo+5o3tjSUadSe58nnoLiYdhJIDtHw90816ap3jmu8Bm4vCKPsFp4MHRGVsVOtJEzXpjooOmY0N2sKMSgiTl5IJmAYze3veCD5/IYCEXG3mYofM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b/8p4rU9; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b/8p4rU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiZEdeFv1TkErxmagArvNeJpPbCwA+DcHDzEAdIy7bFg7yh2xdIEzXp7DQUxERVxrRbKJX/IOB6b2J0w4LTl8F4johrobs0Ff9+CEGBQ9UrgGcNvFZWuSisJZ37AXDLnqMv9QpnGlQ0gVE9fRT49+thdiT2UhCvNWv5ChDP/3keKdHSo+UjcCPPSdeea0ee0woYxtt2RREmHyvS7itDnXPa6HDd4zimJMLxX9nBNT6lJq3nmZoNf2WO6+u+858YMfKBWZt4llRoldgNp7SHbcdKwd0FomfWOmZOeBu7xTrB0bpzJSLkCC9dBJ19YfkMSo54lDqwvLFQ1DEYE4AjyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfO6uJZ+ZK0bozvvFZTEkby8Gt/wHrT/aPyyB6O+eE8=;
 b=IMvoiTPqyHVriAXYQeUAZeT9n6bAhd1vPNgxb1ZkqoP2B9ib6OBiJ24AT3UDsjO37qCbaUIuzUm15MeUaxDG+iseklu8BSvf5gEAyjGNNq/S0M6MPhkcAoY0cp2u17Z0OGpQ+EJVuiZ2JZNCohSo5wDcynl89/FmXJl7eXAN40HmMvYj4FuUcqmeQaziwpLG753NZzLEc5rk4On8sECEMGVysXG31GHAopqvjeKWI5/heJMma/CTIdMr7VcGI2I9arXiZ+klKl/oa3IJIzTtkbbMIHT9Rfkno7/uplEiZuoUA645r7AjFN4UaDVXG2bUkOKc6krQb3IKKeGSbP/YNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfO6uJZ+ZK0bozvvFZTEkby8Gt/wHrT/aPyyB6O+eE8=;
 b=b/8p4rU9htDHNT8sWqnHRvoctvNI2BHdZqz6UbonmSm9OdybuYGo6UxuSGZMAiCuHDfzb1mLcn7du0O0m3+SyMQHkP2a46EfWH5eo20yOTMGIob3b8Rx0aCQA4e9W8kLt0SB8XGehnLYKqlt7yeHvyMi53GyFmxNepnF0jW2Ak2AR7sdyFlSZncitiUTufLktCXOFScpF0hQtb6khkz2AvIyFwNEsk3dP5GQ+sO0gy3+/xiDB7d5gF22Cqv11zLtly8PGJXyaqZnaEzTPjwOrgbmFUf8gF0vvMGN09V/llUYyMc3pNUXh13BDigZn1uUlz33OBARdcxTjtCBGvRoZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 22:01:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 22:01:17 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/3] usb: dwc3: add layerscape platform driver use flatten
 dwc3 core
Date: Mon, 02 Jun 2025 18:01:00 -0400
Message-Id: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwfPmgC/x3MQQqAIBBA0avErBNsoqKuEiE1jjVQFgoRSHdPW
 r7F/wkiB+EIQ5Eg8C1RTp9RlQXQNvuVldhsQI2NbjWqPRp7zIbOjQN7YkU14dK6rrcLQs6uwE6
 efzlO7/sByVBSzGIAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748901674; l=2168;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9zCQl/OFH6/mcT9pkW4dl/tj4RiNpm/QHR6OZTrsXvo=;
 b=Z3CtmfSFsYikQgxkCdDBY7e2EZNhP9o/90r1rx9ZOqtKj9dUW9lVRdh3A5ZqfbmWtyQUlMrTr
 D29tNWblCS6C6Mj+spz/X//odHcVOe+CU27dXw333SZTd165MG/W0Ou
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 138978d2-9acf-4663-8827-08dda220fff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFZpbmRIYmp1a1BoU2lWTzBVSjhuendGL0t3ZndhelltOFRqNEVaM0Z3YkFT?=
 =?utf-8?B?N2VQdmU0YVVTRHhLR0s3MjFJaFM2RzVhVWgwR29oeUVScmpkbUVvZ0Qzb3hq?=
 =?utf-8?B?aVM3WXZyd3l0MkZ2MDJ5eHRQUlJZUW9zK0hzODhKN3pLNk5jbmN1VXJLM3ZE?=
 =?utf-8?B?T3EzeXI1T3RQZWwyWTRiWStTcnZ0WTNoTDdPVW54d1dqVTZESUpGaVFOL0Vy?=
 =?utf-8?B?SlE1bDVScU5XNW5tb0ZFQXFyQTNzVThGaTdtZjZDeUhLclB3bnlVOWRPdjI2?=
 =?utf-8?B?RXRUdUJxN1ZLS3FnSXlUSEVrK2twd2ltdjlTVUd1NnN0YWNzdmVNcVcxTjRa?=
 =?utf-8?B?czhmZXV2MmhRTGg4cE4vUTJqd1JTbHRNZXJHMVJNKzZnTUtoSzJVYW1EVmpq?=
 =?utf-8?B?dVY5QXdQaTdJTEoydmszamNQdldsWGRVejhITmpFUHg4TEdUNGMwUFVpeG9a?=
 =?utf-8?B?N0J2bmxLR1pXNVpMd0FZWkxMTmF1QUo2Rk5Ca05sTTVwbURib3pxOTZmaEdT?=
 =?utf-8?B?L3NZVVQvMm03RUpubjQvbit0NmZTcit5ZTFQckZ3RTlGcVJFWkhCWm44Q2Nl?=
 =?utf-8?B?ZDJLU2hid3ltYy9IVDhmcEFSTmdqRXZSOU96TE55ZTNLWS9iNDQ5N1FPa1Zm?=
 =?utf-8?B?ZitlaFBESVVhRmh5T21nWFpXc0N4VkJ2MWxWVDJUR1ZJQk1SSUMrczdYdGc4?=
 =?utf-8?B?VDFkZXdINlNmL01VZEU1UUtSaVZOMnRrMzY5dFozNFFvV053c1VONVo1NUFx?=
 =?utf-8?B?RTZnY2tsTVE2RE1CY0FMVHU3NzdVYytiLzFtQnN3YVd4b2ZHNlhtM1kxTnpp?=
 =?utf-8?B?aTdZQ0lja3Jmd0lQQ3VneXA2bjNWNVB6UldFN0YvNXhJQ1YwVEo3ZEtyWnAx?=
 =?utf-8?B?SVh2MWVWeGo5UjJaR1cycmNwakg3by81MGc5QzdqUGlYbUF0aHRXOWExM2Yr?=
 =?utf-8?B?VHdoM01UUE1IK0JTUDV6K0g2YjVEeUljRGgyY1V3WE1WZ2dtc2F2RWJBS0tL?=
 =?utf-8?B?dW1zTlVmOFBBTW82bWVWYS9WRE1TMVJmSCtIQS9KeEEvR1p0dEpNd2lJODRm?=
 =?utf-8?B?ZDRPWm4vTXFjTFBXWUVYdm5naWoyK0QzUlFWM3dNUTcrS25GN1gvT0ZHUW1B?=
 =?utf-8?B?ZGlUSW4xVVM3TU1yU0VYK2NEUFJ3ZExaOFdONlhxR2lHY0hQNUZuaFZVRk9G?=
 =?utf-8?B?Z1didzRWOFoyV1oxV3dnR0tUb2E3dnM2anFrRldOMVJqL0Y2M1BOMFYrWW9o?=
 =?utf-8?B?RDUvM011OTJQQWZzRnVpSjRmaEIrSDV6UVo2bWZ1bDRQQ1o3N0NuN2lCV0Qr?=
 =?utf-8?B?YnRLZEo4QWIzQ3U1enBNbDFJcHJXTy9XTWFrRHNBcHBnUmJ6ajBEOGp2WG14?=
 =?utf-8?B?Z2hjV3pQT2pwMFNIV0UzWjEzMURQdUNLaExBSVZiTmY2VVlnWk9sMk92aUFt?=
 =?utf-8?B?ZmszRzJFV05yL0w4d2w1NGRiYzA4a05aM2x6UCtOdVc0SmtJdW9rTUVaK3U4?=
 =?utf-8?B?UTRTd0pxYVhaK0NHZWJlY2xhY21hcHdnTCtxNUtDcG5vMTNTTjc0MnBKd3RS?=
 =?utf-8?B?MkNYN2hIZGJESG16RjVMZndBMXVLUlpxMUJhZEVzRTZlK0Z4YzF2NEJnLzZ4?=
 =?utf-8?B?dW1BaTI3aUFJWVdoclo5QlA0L1NDa1JGNzR4RzhZMGNDaVl1Yjd1a3ZNVnJu?=
 =?utf-8?B?OFlkbVdDUE5weVlPVGkrOFJVN3l0WHNVdE12bER4SWljWHB5TEo1akFBYi8v?=
 =?utf-8?B?V0JoN3ZUa2ltSWJNQ1pCU0ZpQnZPQU5jTEFkZkgveGdGNEZRTStmVldWUlNJ?=
 =?utf-8?B?dzVxWm5mTjRHWnhndGliYlZiMzI5RVVNZ3BxTWJVblcvYlRwdmFLb2hQTllR?=
 =?utf-8?B?S1hYNUQvK0pCOG41U3BIMjlSZVpveW9hWWd6amt6UXRKOG1GeHhrT1hFRUkr?=
 =?utf-8?B?endydjQzNHRjeitxM0NFZ1V3Z0dzc21KU01xOFNRQjdTdEVFa2JFRHB1NWR4?=
 =?utf-8?Q?RE5Ey1XJ4MPLlgn1xYKRLn0eW1ME3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkNhTjJsMmowNzRHQ2pkKzFodHJWMW9nVXk3VHcyYjU0OTUyM3RTalZWaVh5?=
 =?utf-8?B?ckZGV001bk5XT1BqM0VwdllvU3U3K3lRZjhPT050NVR5ZENtTmR2MnR1ZHRq?=
 =?utf-8?B?WmYrSUxhTEtxSXpUb1JKemVZWVZ4WWlSTEx1Z3pGYmRxT1pWYWIwdlY1SHVk?=
 =?utf-8?B?a0h1dlp0OHVETGxoTW5VcWZHQzJEa0U5cXhEdG4vM0Z1OUUyZGo5aVVNZ3RH?=
 =?utf-8?B?UEdsVnNsUmU0Y3dBaGhSOTlaTXc4RElKbjNmRERHcndxTmhkTkVlTlppZWRn?=
 =?utf-8?B?aE1aOHFaOTZPcTltazgyWVI3ckRFTnZXVy9XV3pJOGhEbXVZc1BLK3JiUWZ6?=
 =?utf-8?B?SkJwckEwZTVETFFWekRVNFkzUTNZaitiVTl1SHdQTUc4RHJIL2JkSUZNUWMw?=
 =?utf-8?B?SUpKcTcyWlJyVmcrejFrSDJlVVhIYlphM1ZkWnNQSHgyR05id00yOTVkcWxW?=
 =?utf-8?B?L0lsU09uWktCUEdaZUlvLzc0R05qb1RrT3dQc0czTEVrOFZHaWVZTkpUOG9r?=
 =?utf-8?B?VTlRdnlQVnliNElWYzZTL2hEVVdjbFB6aFIvN3dvOEVCQndkeEJGRSt1c2t3?=
 =?utf-8?B?QnZGeDVyVDgyVmljSklVY3VxQjZsb0FnaW1ROWltQ1AwTXg1ZndScEtwTjVE?=
 =?utf-8?B?L2c4VWlscEx3UDcvVnQ4bHFlR1ZNRlQ3YmE1eWxjK1NpTTcrNHZJQS9qY0J3?=
 =?utf-8?B?Q1BQSmdqZDN4ZnkrMGgvNFBBbS83U00zc1krdEdDQ0tHYVdmRzhCRGw1QWVJ?=
 =?utf-8?B?VitWYmxFTmorTUdwTk5wZ1pYTEJZa1hNK2dWRGhvc1kydjJBeE5saEF0QUdG?=
 =?utf-8?B?WTRsdVM0eEREc3VzbzJNY1V5b2E0R3c5OGc5U1EwR21XQ0FvaFc5VW55QlF0?=
 =?utf-8?B?MUdsN2tNSnJvUVBsbkcwdHdGSW5VOUxnd2lRV2QzS005VW1waisyRzJlRVJp?=
 =?utf-8?B?RFk1V0kzMHFOU3lBaGlNMzhyUjFrM1g4K3BXdXI3d2dpT3d3Vyt3OWRNYWIr?=
 =?utf-8?B?enRQUFlTVjV2b2pzWkV6cEZ2SmxzWElOb3VYWmo3d3ZRUkdjZTAzZjlVTEdR?=
 =?utf-8?B?UCtsZE85VmJiMFBDN1oreFA5OURYdkczZHo4NGhoWldkYlA2RjkwdmJzSWFa?=
 =?utf-8?B?Z2c5MnNEN3pXWGRIeXNNMEZNS3d4QnA0dDVkY01TK1c1NVZLZVo0NjZxbVc4?=
 =?utf-8?B?SEhOR3pLbTFERmhRb1A0dzJiK0R4SWQ3bkROWTJ2a0dWNzJBYzluaEs0N0c2?=
 =?utf-8?B?bVBUZGxxQmtzYjI4TUtVR3VtTW5HSXhyNEVNRGdrb2x5M01rT0pMLzdJTGZI?=
 =?utf-8?B?RmZtOEdhZ2tDQ09XNlY4Z2lBcGkvUENVbWtWZktoVm9WNGNBWm5hWTVxdTZC?=
 =?utf-8?B?Ni82Z3J6UGIyVGlZZDVKVHNFZkIwUk1HT1dWakFiVkswR1BkcDg2aDVtZzR6?=
 =?utf-8?B?RG5Yak1lT0NVd0dNSjlzNXBIeEtYUC92ZEluRDFTanQ0N2tRNzdPWVNuS2Ex?=
 =?utf-8?B?VTlmMEs2aENybTRwYzVKSGxvNkQ2N2M0ci9Xa3hPWXVKWnVZbDhQZEloa0ND?=
 =?utf-8?B?OVdJRVNKV3lHcjFGT1YyMzdnaXpHN3ZNSWRCZGpJblpOVWg0Rzdua2Mrdzdo?=
 =?utf-8?B?VnVlMGlORnVzNGtQc0ZnenV2cHQ5REpGMHFUaStRN2Job09CQmYvTG9UTndU?=
 =?utf-8?B?NGNZUkhqNHZFNWFJaldHbHVCZWZmOTdIYUJwcENya0E1SGcxcWZBelEvS255?=
 =?utf-8?B?UkZzWXhiYURoRENFbllhRm5nL0xDZkcvMUpBUVl1anBxUjl0WWQ0emFLNDdZ?=
 =?utf-8?B?SmpzQjI5RUtpeHkwYW04QVcwTFI1T21FdzNPY21PNlFyNmFSMHM5bFpaNUNG?=
 =?utf-8?B?RnVaU1R4KzJFTjNaVE9OTWZCMUxEdFh5MXlNaFpWTlJGUktEZ29xQ2pUaUdH?=
 =?utf-8?B?bEdyTFlTQmpIeGxWakcyMkNCa1hWWW8wZjk1cXdLMTZkTnRRRkZoUDFlUmtH?=
 =?utf-8?B?WW5BZ0E5cFFqSGNKN0s5Ykw2b3h5cjVnNHVqNnh4ODlCYWRjNjFabGk5R3RT?=
 =?utf-8?B?VnZBRVRoZDYwd2FPZFh0MUVPWldyOGExTzVpQmNFU2NBdmFOVjFxdnFyNWt5?=
 =?utf-8?Q?Oz9chFL7y8wFyc3asYguLXX00?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138978d2-9acf-4663-8827-08dda220fff8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:01:17.5715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjj61YVKH4uj7wHesjIP77wnmn3u81pbf9QgWpQxj28UxEsHYw4cEDLj/22+cZqTmKP30QB3s/KRmZ9n3/abtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756

Add layerscape platform driver use flatten dwc3 core to enable dma-coherence.
It needs set gsburstcfg0 to 0x2222.

There are some several try before:
[1] https://lore.kernel.org/imx/20240710-ls-dwc-v1-0-62f8cbed31d7@nxp.com/
[2] https://lore.kernel.org/imx/20240123170206.3702413-1-Frank.Li@nxp.com/

[2]: add new property, which was reject because there are no varience in
the soc. Fortunately the below commit resolve this problem by use software
managed property.

d504bfa6cfd1a usb: dwc3: enable CCI support for AMD-xilinx DWC3 controller

[1] was reject because there are not actually dwc wrap at layerscape
platform. Fortunately Bjorn Andersson's below patch to make it possible
by use correct dts dwc3 node layer out.

613a2e655d4dc usb: dwc3: core: Expose core driver as library

This resolve problem [1] and [2] by use flatten dwc3 core library.

1. add soc specific compatible string at dt-binding.
2. create platform driver for layerscape chips and pass down gsbuscfg0 if
dma-coherence enabled.
3. update layerscape dts files.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      dt-bindings: usb: add missed compatible string for arm64 layerscape
      usb: dwc3: add layerscape dwc3 support
      arm64: dts: layerscape: add dma-coherent for usb node

 .../devicetree/bindings/usb/fsl,ls1028a.yaml       | 33 ++++----
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  3 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  8 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  9 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  9 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  8 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  8 +-
 drivers/usb/dwc3/Kconfig                           | 10 +++
 drivers/usb/dwc3/Makefile                          |  1 +
 drivers/usb/dwc3/dwc3-layerscape.c                 | 88 ++++++++++++++++++++++
 10 files changed, 149 insertions(+), 28 deletions(-)
---
base-commit: 66fda7d5293cdf86be0ef5bde9bf37205622dad2
change-id: 20250602-ls_dma_coherence-c3c2b6f79db2

Best regards,
---
Frank Li <Frank.Li@nxp.com>

