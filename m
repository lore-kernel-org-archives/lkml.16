Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592AA17A30A;
	Thu, 24 Apr 2025 00:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455333; cv=fail; b=O3xd5R/z05cUI8KCobB912Sf7atIZDH8DMNKFl/jOlOqjNNtF3XzCmmrmUfVkuy1fb228qUX0I2b0nS8cLBdMIQVGkxF12v+6Zb0+uCnW/7sk7qmcnavvXgkzMlJvHKU4U65Ia3+jrlCcNVacanpqh00cyhqNpVdc8GNSWVyy08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455333; c=relaxed/simple;
	bh=ghJvfcreZ0UOSdT3ZqVEfbpN1SmbGgV715KuOtaxTpk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=frX0qhdCkuUnsaPQWHP2i1JCGSithI2HLdZKWyxe6njnSereCmyOqePxd18QOi+kdszJcQTQgsMUpyf1AuMNtNnGOReEl8mqUQ7GEPPPHvs3NPO8+mjJSUFNYz8s/vKWqNBhZHxOjGiqfJHWkp1A+mYJyUbYNrgPZ7sPhmVR3As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VPKDV81N; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VPKDV81N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFSEPOKmSi+iff0+FAd0vq3R9MyuKjwwXOBsm6RlzLpMx7kSlXIJe0sNmrtOw3PRmkDPZSooSS113I/JZsHl3+4ZJBc+yDewQNm8vDKAlHLnC+u1gs0Eab2T9zQaS+FMJwKH2+DmesQePr//LzGk4sE9PudPsh54MMgYg+IFXSfe+DaYh7zVsnAnJ3o1dCIrbQf79sHEm/PTNCiuQk+e4Sb4IbU9JNFyxB9cFWIPhNKxg0W/wowhb+U+BzGYmToZS6V/QdMsOiBTN5Y0W8Kf6QQL7KhG/XABL2zKOy1ZOY0WBBXGZHr5w6qeHK6LlzRz/5A+eTBToj2xZW0MnFzNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oHaXDCyZka5H6c/t7G9END9g+8KgR0cLMhI0gmzwes=;
 b=wVJ3CeMHmoud9AOpKhsiiHe02+wuHOkebpCEY4CRHaflA4pk0hS0x7YSZ0098Tq+K9ha6qwP6xLbDAY9h0Kr6O4+PEvjO89x99GRjynh2jgz4TULB9yjXOTF9Kc2tf1Zh1vlGPbaf6NcqMv+KH7McUJXyvtQIZ7bRi/sE1YWr6p3y32meZJMA0xuPBsiD1sHLCdLLQSfuz0u16xSicdgU3Usriu9IN4Fv+SILqA42nExPeCfgRehRO52X5NFTeKuzW2IWqfYb5JPs38C0n0kgKUkmKEu/uMYH7GNV/3ofQWZwSHnFl9f2gmDttEhfS88WLvWIc5kyQoib/AlHX/+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oHaXDCyZka5H6c/t7G9END9g+8KgR0cLMhI0gmzwes=;
 b=VPKDV81N5avcCM+uFnzfwCDnWQGiZ32+piesfQb99yPgfix3VJ09rUSVFs8P5ehonSx9zaaLQV1MtQikT7k7SmRhYBJbU0xudlFoK7UZ5i4TbajTt7vWQO+ZwBHxrZGT5EIpyUH0daMgJpGj/bglVry42gmfVTDUlVoCW5BXbQ410ytIbGueYWNyA8RFMfEbC6ww8Ec8bABhf7fxL7S52NanMexN4BzSgpO6Rl5/ZaPN6cnWJA4KFVPAOZv3lKUJ7RmB1hRxA516K3N2gb6FVuF76N2l5d58OwGGOwpHTkdypK/1TfjtHNS5OpDT+n6Eg6CIprA789GodtNtDdlVow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:42:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:42:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:30 -0400
Subject: [PATCH v2 8/8] arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-8-43c982d83a8f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=1988;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ghJvfcreZ0UOSdT3ZqVEfbpN1SmbGgV715KuOtaxTpk=;
 b=ZmXDui/m+a9RXEvmpfIAhbhq24q4FYFHlWl+TKma3sFnL6wH4fpukcKx+fQrAlPu161CSBMZM
 3e+2ClGF5x2AZcG0hY6ArDbuCDiq0opbuKyiquvU3J38tWKoo1U38jG
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
X-MS-Office365-Filtering-Correlation-Id: 7911be33-74a3-43e3-e39a-08dd82c8d8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2h2YWtNNVNoT1hJNzF1QThMZDRQQkl0Z2FUWkFNTmdkUmtpei9sQ2dvazBs?=
 =?utf-8?B?WDViSmxhOTFXWStqYytaYnBKSm5TUHhnZEJkdnFwSWpLSDVNeXpnSmhpL3g2?=
 =?utf-8?B?UE5NcWtILzNOWW5RdFk2WEpJSHZoaUNJMWFKaXdNQ3lxejZNVitXN1g0clEw?=
 =?utf-8?B?ZDVYOXRBVVI3YnFIMVdBRVRXRFRBS241SXRsdkdOcExQcmlOcEg2MFc5MEhD?=
 =?utf-8?B?U01QTzhGbXJtS0RwTGVNT0tHVTNxd0h0UXczZis0b3MzZ2hpdWhDK1p1ZmJH?=
 =?utf-8?B?bGlaaWVqdUIrR3VLWFdIbnB4V2xaeTBVWUlCZUFGam1XcEVRQUFmMHNBYVRq?=
 =?utf-8?B?VHlMSUdFbXMyYTZTM096WFdLS3d1QzdWaWg5eGM4Um1OL3lrd1NJK1dxV2JY?=
 =?utf-8?B?T3VKUllybVJhampJdnY1dndiQUVFS3Ziam9OMjE2QzR1bDNGWkNqdzYrVU9I?=
 =?utf-8?B?YnROK0dDK3lTYmpMRkc4eDBmMytINFg4Sk5VSW9SaWxVMGw1VC9XWUxzdExJ?=
 =?utf-8?B?Vzd5cm5rQVpuTExmMElnbDJLaHlLZjU2aGdwUXJhZUhqUktRdmZEQ3RGU3dx?=
 =?utf-8?B?dDdVWUkxaXJwVW0rSzdDbXI2ZDU5dnNNZUZ5TGRneldkOEd5NkZ2NFdpRnNN?=
 =?utf-8?B?T1ZvbVlad1FmSFJ3cDNsSWcxTHhGL2FjUXAreWhjUkllNUJCY1JSbEQzbjhG?=
 =?utf-8?B?cTQ4eEJGSXF5YTIyQWRLRFZOVzUwYmoyNy91OENsZ3RkVGcwVlUzc1ZvMlM3?=
 =?utf-8?B?UzRrZFRIV1VSeWFHZUdRQjFGZmZmS0VUNDlyNVZMS09lMTdOaGx4NkVaRk4v?=
 =?utf-8?B?ZWJ3SVUxeVAyK01XZFBVN1g0U2cxcWx6enBvTENxdDdMY1JOdlNsSnBkWnZH?=
 =?utf-8?B?K1FpSWhyandGTXlGY040U3d0MEltQ3ZFT3BCMExzWCtRNGd5Q3VqdGdCWjhi?=
 =?utf-8?B?TEhFK3JSdjNFQ21tRUs2VG96RWZLQ3VSVFAwK1FJb2V4emJiWldQTUJRQUdK?=
 =?utf-8?B?OEpxWHc5dVVwc3BaQ2gwOCtsZjQxdEJOM3J1UW1xejZIVXIrZXRZRU9FRXVl?=
 =?utf-8?B?NGxFUFZGd3UzRW9uY0pSOVVnMHdzeTZ3L2F5YWRUVGxQREx4RG1pMmtMeE5E?=
 =?utf-8?B?amhYOWFycXZGU1pMRmY1QmFPR3RSK2szSSszRGJHQ3NkYjZkdkk0SHZRazUr?=
 =?utf-8?B?WC9MUWEzek5Ca2Mrejl3T294QXpKUkVLRHRvY1VKdEpIQlJlQW5VNTczK3ps?=
 =?utf-8?B?WFRQWWxQTTZOcTByckxMSS9WZWZYNDhkTGptdVVKUDNSeVNEQmtnbHJOTjcr?=
 =?utf-8?B?SFlxNzlxa1BjaWxEN1hrakZJTkJ1ak1Jcy9qSExVckFhYnBoTXYxUlgzL0tl?=
 =?utf-8?B?aTlXWjR2U0RqTXcrUHZIZTczdlplanhZNHJBa3dra0xFQ2tCQU52blhheFhq?=
 =?utf-8?B?UUQ2eU10UWRCWGFFVUVYLzJVZlRTZkp3blJWb09YeHoxNSt1SEZ4MG9jaW10?=
 =?utf-8?B?Q2NIdDMzbjQ1RzV6WnQ3ZkpKTFNaUHg3b2ZrUW9KdWNqYTM1YXBWbkt4WENO?=
 =?utf-8?B?MDJmNjlWeGVqQ3ZhcFQ1eW1LQWxRS2d2eTNlYzllTnF3b0p1bVBrU05zK0F1?=
 =?utf-8?B?RkVuL2JBTTRiWVFLcU1TNFk3bWNkdmkzWmI1eUtnSWkrRVBNN2d5c21lV2ZC?=
 =?utf-8?B?MExDS0M0dlJGY1dPdFNGbEVFU1Z4aXVpWVFCK3BReHVMckJ5dWZXSDFtUTVP?=
 =?utf-8?B?UE1OUy8rKy81OERCL0xDdi9CbHVRRFdGRy9taWhYMlg0OThUL0tLeDJNQ1BN?=
 =?utf-8?B?eXZZRmxJU2hqYjQwWFVRbEI5dzRDZ25JRkxzenh0VGRZTlZLUy9ORk1CaVpy?=
 =?utf-8?B?T2U4VVJtOHhIb2lSY2ZUUWlteUdEOE9oRWZzMkQzMTNOaDBJbjY2cS9oS1B2?=
 =?utf-8?B?bmdNaVg2cDA2dGVlMXNqb1NwempMZXo4aUdOZUd1S0RzZkRzR2dxRkV0anh4?=
 =?utf-8?B?Q290b2dEVWZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndSWHI3S1N5V3pVVE5VbnhpYVBOdVFXekQxemZ2UXhQam5kRDN6RE9wSFla?=
 =?utf-8?B?Z3lUMit3MFVDMkpsUm1YQ2VmZHlUTDJRenZzRG93eExiNHk3S2xFcmdWdS9m?=
 =?utf-8?B?aTRiSkN4QUMrWnp2aGRFRnA3bGcrNGQxbnBvL0JrU2ZrTlVGb1prYmYrbkUx?=
 =?utf-8?B?b1UzU0hjZWxEWXBRbEJIR2NlYy9TOWs3Y2pZYmlWS2h2RHBqWUl2Z0ZIWmlX?=
 =?utf-8?B?cWhFOU5hb1RNeG9uYjdhaG9Bc2Q3eGI4VnNKSTJhY0ZYNEJTRlBsdXBDbFk5?=
 =?utf-8?B?QnV3OEdYWGl2VHhHdXRWNmd3NmJNbk5DeHBwZHpYSnRlZ1FUKzlCMGh5RWdk?=
 =?utf-8?B?YjFZSFFrR2dEbDZEdkxSMXk3aCtKZllYKzd1eGlmK3laWmJOY0U3elJGTU1h?=
 =?utf-8?B?ZG1HN0xCMEl1c0MvMS9SdjhzUDY5UDRkYzlTVHRjazVaUHlyRjl3MEhhc1g1?=
 =?utf-8?B?SEVUcHlObWI3NkgvNmJENnFZZlhFOEg3QlFEUUprb0RnREtPTlJadk9FZGRq?=
 =?utf-8?B?VDVPWTVJYjNBRFdaWXIvaEhzSEpjL1YySE84T3VqdU9nOUVXcEszWmk4ZmVq?=
 =?utf-8?B?R1FRTm8xYkQ2cUJSbEhab3ZvcTh2ZGNPSWNIeDlXNFk5c3hjVHIrMWREamho?=
 =?utf-8?B?QVNpWXVEQ09DNkk4WUEyUTl4L3U0ZFlscWdTYWN4dVl2ajVtVU56YWFyVmNs?=
 =?utf-8?B?djJ0RnVMWUZXSTdDYUxIb1ZkMkhjYWRMaEZ1Y0JiZGRtWGRSelE1MVRxaWZP?=
 =?utf-8?B?MlNKV2FGdEZqOEtGVXA3SkFOQVBaQXczZkZmakp3YnJ3TDVvYy84RGZ6Y09q?=
 =?utf-8?B?ZUVuWjlJQnNKQUR1NTk0c1AxWFl4ZUdIZnVXdFgzQmEzNlNmWTVubG9vaDJJ?=
 =?utf-8?B?MUxOZ2puZ0FGbDhDQzg2UDI4bzUvc2x3d252cEhNSWZ1Wms2eWxyMnNRZUEx?=
 =?utf-8?B?cVV0bHE3RWxOTFVaMWtBN01xTjZYdUNKVlFBMng5Rk9GRmx2Z3lKLzRNb0pP?=
 =?utf-8?B?WjU2MUZCMlU0cmQ1ZmtldXJoa3lzTXY4MjczT2JseVd4QXo2cmRvZE5sd3V0?=
 =?utf-8?B?WHF4R3RwQVZjRlpKM3luNmdSeWZCQWoxTVlMQWtVbHhNd1hJbGliOG0ybjBl?=
 =?utf-8?B?aWdHQmVqUUdKbkJhLzY1WFE1SnFzTit1Q0cxcHFNMWRqOWVpcE9sdFN1YXR6?=
 =?utf-8?B?am1iTGV4bVRMbVdSV0ZrQUZDcHZMNE9WUmxJaldOb2hYS0hBNTVlQUZaTUhr?=
 =?utf-8?B?MVVmV3hrZ1N1VTNMMVdNSmxLRC8vKzNiU2tHUXIrSU1pNVFJSEFXV215dGZV?=
 =?utf-8?B?YnZodHZsZGtBZUlOWERWTnUrWG1QYnljNnowS0pyaGIvRy9ZdThPdWdFM0dL?=
 =?utf-8?B?R1hMaWM4TnNuaFVwRldNVjA0MVZkcGhVR0Rkc0NYZGJ3cEExUUZ4cW5NWkFF?=
 =?utf-8?B?TkZHQVMrQmh3NkthZFd6MXV4VEhQanVXNkl5RXMvMFlhdDJRSnRhKzJBL1hH?=
 =?utf-8?B?TW9pZE5iTC9JRkl6NlFWZFNUMUpsWXF0Z1NHZ2R0T1IyVElOZnlHd0VEdGRs?=
 =?utf-8?B?RzdUa05GVmpqckdrVnViRHdmanloS2trd0MyOVYwcmNNZHBLZSs5UVpXaUl4?=
 =?utf-8?B?dnVJdk5KcUlxbFo3MkdxWkUwOWJ5d0YwWVVKeXJVRjdvQjY0TjNudmp2Y25G?=
 =?utf-8?B?R1cyS3ZRYlllR0lyZE9rS0M5QlFNY3BLRkF3WXJKbU13UXRiVmJ3VjNseDlq?=
 =?utf-8?B?ekNRN2k1aVBGS0FwSHNVa1E0VHZIK3JOZWJOZU83VzBiYUthanFRQktHRXhS?=
 =?utf-8?B?V083MTZUVnRPc3RWbEtOTld5ZmdSQjBpNWYyU1Y1MzlQRHRqR0VUU0Ira1FU?=
 =?utf-8?B?bFk1NHZHTHNjWklpR1dLcmV5TjNPVFdCYUJOaUtFZWpBTnZYNFZIS1VoNnk1?=
 =?utf-8?B?UlRqNy9aZjhIOG44eUJ1SFViQ09VWUhzd3NLcWpnejdidktEV0pycTloTTBs?=
 =?utf-8?B?Y0gzdC9TU3BJM3hIZmpRS042Snprei9XakFCSkJwNU1xOGdjek1TRUlzenY4?=
 =?utf-8?B?QXh0a3VUY2t4bHBYZTA1amZmZmRjRUVDNjVGN3VzOEEzUXQydFlybXNWdkRC?=
 =?utf-8?Q?R77w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7911be33-74a3-43e3-e39a-08dd82c8d8c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:42:09.9710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0DeW7XGKobwdlfaIGo4xVToZ2UAPFiWSYOft/MXEhQgHMNboXeyEB2g9XTIrfOe+DyQqchWHiYFQUIcZlOPdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Add pcie[0,1]-ep nodes and apply imx-pcie1-ep overlay file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  3 +++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 44f3f56c1a3b2..862315bdb0f38 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -260,6 +260,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
+imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-pcie1-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-kontron-pitx-imx8m.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index a87d0692c3bb3..43e45b0bd0d17 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -377,6 +377,16 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
+		 <&pcie0_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE1_AUX>;
+	status = "disabled";
+};
+
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
@@ -390,6 +400,16 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie1>;
+	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
+		 <&pcie0_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE2_AUX>;
+	status = "disabled";
+};
+
 &pgc_gpu {
 	power-supply = <&sw1a_reg>;
 };

-- 
2.34.1

