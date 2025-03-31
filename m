Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7EC214A61;
	Mon, 31 Mar 2025 19:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447792; cv=fail; b=nnIrBuRlsni8pZ/FB55PfgXnpsF0vApT4LARXYll3LwnTFTWpFNOPbRf9/jW71Y7SIDgL6NaWz3/Ogy7pdyEEpaYlX8Lo7UIOBnaRVFl3JeQRKYGCQ/GRxdCFbnQokbSwAXdch49zC02CI18ndhZMqnssru0RZ+SbU9SOayx6ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447792; c=relaxed/simple;
	bh=RM6o7N38oAFbzuVK6UYzSgu2et2lfK+JQu3bci1Pr3g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nyP7lVe8Iss/HK6JKoFSPMJmM/hCyomaK2L7KSQoMH/8WgD5a6+qY8dNMjT29pfPJnnqVOYvL/mWiK99MSnbdKWN6IWmr/bX42/nZF/oNPaAMlwBM1rQfWoBWV78HXu78hsrk9CaPoNmt0/vJtZ36hEsBxm89I8LAPOWPdkBGas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e4xplBSv; arc=fail smtp.client-ip=40.107.103.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e4xplBSv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY343rcH80/AWOWN9/QwjnqhokjCyAfBYj9yIJmtx44cgDwWG9uoXFOCVo5LdO9SWrxIJJXU0pLtTYtceP1rw3gchuJ6FPyTwDwvwemjcYGZ2/EdBa1UfrXfF6opQdHM0/+bTPzZCNBh+ggaZNO8HxyAmJ2F3fOlxAF4nbybjZrQGh8jvzvX8maNEJpemS9JhzMBJxrm7ZFYVrY37W6GcvIiRgUQ+por/P67C5aWHP/BLcAEJA1KqRigIaLX7Os6NFU9kufbQV/mHZEp+vSISx6thmf+1ETAfM0EGvdL/Whbt4IZ4m+Yxb7oAQgNNol33XlNGLcl0BFBlEBUq4jv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk3rpx0+tERAlHYGLOsuja1WayYcGPRiWgjszUnxjIM=;
 b=pcT2XOX3xwG7jG//0Rl9GnIOSnkLHm0lEfvmMNY540LAelRCC0DIokLnLMZGRZnBBeXbT8MQ4O4t/4RzHcl4b1sFH+qo05DWzjCtTPRSEPXN0sFy9A1+A0AWXQ0m5ynIFJ7o94HRo2GaDev/fdm/AwA2Xcv5SUqVp6zLrZ5OrnGO/N2yY0pRSLuBkCMqJ5jV13EMtz1AoPIPFJ+AVVvXHH+RCrlSPOsnrw7Aj5fUlU692X8O3kdbhzybdiRjlr/Yu024c8Jq80hcbjUlxpws1/t1kZW4kRNCZ0F4GB2c24L3QWLFMTWc5Z3ye1CMn6DrwhGo9suNREpfNmk+1+ut2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk3rpx0+tERAlHYGLOsuja1WayYcGPRiWgjszUnxjIM=;
 b=e4xplBSvbzadIq7IMYQLYiToTicW77ngAMxk8uzx/xaQqRXuLJmGiaoH2gCuj745358VdnyD9DOp5AYnMMv3Y4+JypX2EQ/R5IeYv8cJQFOlT0D+HLk2p9n3IgqGWBRSSqxjMAQk82oFqd+UyJIbUIDWYsd5bYIPma+GUCVmiQgZdMr6PRWizLvE1lZ6wmX1D3orFdeMLOX9T2JoShCpKgXM2GVfg/miC2mM+1RjSt9S8PEgM+qxXksUreRvZ68ALWO9h8MWJ/vM1+YnI/boqHHT7LAKJfJy2hghnz53O66KVS9/QkYkn1EEhOAf9iMf0DlIKKlbU/SgjSgkz7BQMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:07 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:39 -0400
Subject: [PATCH 1/8] arm64: dts: imx8: create unified pcie0 and pcie0_ep
 label for all chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-1-270ef0868ac9@nxp.com>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=3810;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RM6o7N38oAFbzuVK6UYzSgu2et2lfK+JQu3bci1Pr3g=;
 b=xLXUHyhCgBNfVABu1PtbJyI6kbSdrnYI71DQaiph9GCv3GZurJrcrKbQ7FTF52ytXTiisVL6q
 S8kx4/Gtr1rB9NggyEMS6BdnJt2QwqMSwQ4hg3RD4bXue5KbMnkjFDM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 59abee7d-f45b-4703-4443-08dd7086ac20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFZ6OTNJcUJxNE55SUdJY095M2ZYM0h1VVFidExESlVWeFg2Sm13OFZEVXZJ?=
 =?utf-8?B?eEh3Q25jYTJRRGU4RUxwSjc0c3c5RUlCazVkM1ZGTGV0Nkx6VTBlTjdrc24w?=
 =?utf-8?B?TkhDOG40WUdQb2dQWGlBaXgrdTd3THpKWCtxbUNqSHNYdlNMSWFrcmE0TTQr?=
 =?utf-8?B?UkNkMDhSN1hYZFNaa3REaExRQTF0Rm5wZDF5OFFjK2JTQ25oWStzL1E3eGQy?=
 =?utf-8?B?U0hGUFEvUEhpZVJUQjQ2U3d4TUNqT3NUaE5CT3NlQXQ5cnprTHVHR3ZCcjUy?=
 =?utf-8?B?Z0xPT3RvbU4yZVNGUDUxK09UaXl0ZzJWVlUzMUNNMUdrWFBEMnJJSUR4Tzl3?=
 =?utf-8?B?V3hwOEJxaVc2a2F1RnUzUHN5VEdBVEJmQW9xV2pVbG1jZ0V0K2ZCZWFJeXJr?=
 =?utf-8?B?RG5PQTNXTWN2ajlRb2JHMXFZd0M2MGpRTm5acXhzWXFzdnRHRmFlTjIyZ3VQ?=
 =?utf-8?B?TkJMKzdwTWJ2RjZZaWJCdVVsYlpZbHpJcWZteDZVaDRrUWZiR1NhT1NJU01T?=
 =?utf-8?B?UW0vei9zM2hjeUllVFBxalhJY01FM2gyQitsRjBvTHpYNnlmTHNUTmNDRHJS?=
 =?utf-8?B?d1ZaSjE1SVllcHRXVWVsNjZEcEUrTFdIUE52enppMVFHOW8zME45UFdyYmZG?=
 =?utf-8?B?QnIxVGxQV05YZ2h6dmdzK3dxK3lMREdRMmdHSTM5QUN5emJRN0hiU0VWdjBF?=
 =?utf-8?B?YnFVTUFpbWtOZ1ZpaVd1cUZOL0VjaWNaSzV6NlpIck5mcFdad28yQTgyb1pr?=
 =?utf-8?B?dzZGeE4xNklDdW5jSXlFUTZTckI0Z2x1WmZlRDlvcmhra2hIZzcxaXE2V0dE?=
 =?utf-8?B?bVNUN2lwSnI3WjhmaDk5WDBaZDRTdWxPdEVSQlB1dFVpcHJta3FCNXF6L21E?=
 =?utf-8?B?VlptYmVocTVkYmNiMHMyRWJLUzhidkl3QWlXMUlZcURjanJaYkVaKzZiN3J6?=
 =?utf-8?B?NnFtNmtsMXZZbDc0UzgyVGxId2hVUmZMWmxidFVtSExPdEo0OE92bWVsVGJM?=
 =?utf-8?B?QzNzTDdROWI3aXdVRGtZbWlRd2RxNUlJUVNsVHduRkRSekJhOW9UUk54YmFu?=
 =?utf-8?B?Y0RvN1V1Vlc4TW1kZHppa1BNNmFIb3VHaGZaMGc1UzFNN3VGVm5zZUpqbzVq?=
 =?utf-8?B?YUgxYlMvYWIwNlZrR1RURGhwTU0vVFFsa1JZbGoyQkg5dTViUkVzNlE3U2Z2?=
 =?utf-8?B?dURaSHdVMUJaem5JZENTY0o5c2tGQVpqa3VYR2ZkL1NGT2RyKzN0VCsrNGZB?=
 =?utf-8?B?bllyZktlaXZNTnVrbGt0anBEYkZadWdaSk5adk1najN2cFNEenFIQVQwRGxw?=
 =?utf-8?B?WHBUcDJrVm4xUXBSazViSitTSzlNeXYyMDBRK25uOEhvWjBNaUxBWGVUZzNn?=
 =?utf-8?B?OXdqVHp3RVhWdTk3a1ZlQjZCVDZUNndnUmhGWkt5ZlRxN1U1dm1GMTM5VE55?=
 =?utf-8?B?TlJMNGI3Nm9ERUp0Y0UxRVNhRFFtY0tkcHIyTVVwNkJMZTlUckV2Z2RrMzRq?=
 =?utf-8?B?WngzTXVUS0h6UnovUmtLZXhtUHZUZ2IvazVzaC93NTlRdTAvK29tZWMxaDNv?=
 =?utf-8?B?TVM0ejUramh4dld3cVhGYXA2RC9Gd1picU04bnVQMXIzbzduMExybTlxOEor?=
 =?utf-8?B?NHlGYjlZTW5jWGpzM1pIU2JJTVNZYSs3M09ja1VUZ0JzWDdSMW13WlJuY09m?=
 =?utf-8?B?NFVuemdKcG1hTmpWVEx0TTRlRmRudWM2N3lVcVg5ZlU3emJjUXRVY2lzSjM1?=
 =?utf-8?B?VHJUSTF3M0d6S2lUdy93cXlqZ0Y0V1Rwb2tIdStLV2NiSVVveUlpN3hScmFR?=
 =?utf-8?B?czF3ZkJwZGdFbHhpL3Jwd0Rud1IvWmNqVitzbVNSNlJVYlFIVUE1QTM3VHVn?=
 =?utf-8?B?dUR4U0RnK1pSK3ZCWXBYVEdwb3JOWUtzekZGSUpwUWdMSFp6NGVKajFOYkht?=
 =?utf-8?Q?AVsdE8zC7b8cPK/Jzvmx2PxkO3L7ke4C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTBqNHJQT3ZSdXIyVXZKdGxLN2FIazdhalkwRkRIWktoanNPeGNuMVVEanBQ?=
 =?utf-8?B?MHN4bXkzR0RPeDFDbEpNOXFQTFdHQXlBWk5OUmFnQ0dkOU8xR212YmlGUTdw?=
 =?utf-8?B?aUswODVYRFU1VHI2QTExRzd3d2R2bytEQ0w0NlFHMXNJdXdnM2JjQ24yYVBK?=
 =?utf-8?B?K0tnRWtiUlk5L0ZrV2FGRTN0aHBIK2o0eDdMS2R3U0g3WWY0YjJhdHE3OEVs?=
 =?utf-8?B?S0VuallxWDIxSzNSRDI4Qk1FMEt0TkhQOE9oOG12cWZsOTNxUUQwTkRhUG1j?=
 =?utf-8?B?VjMzY2VVdUtlb1JXNFJvMnN1REFhWlpOWTdPb3RxTTNIRGRERUlNMHNXQ1pF?=
 =?utf-8?B?Sk9LSklORE5YNmdCWDhuaGFXRGlFaWJpY0hmY3JFQUlUeXlZM2tkZjk5Q2Rm?=
 =?utf-8?B?QnRMRWZEcTNQbSttV2t1M2FzTWFUMnVqTmFRUDZBN0xVd1E2dXg2aUZZd2kx?=
 =?utf-8?B?M085TEQyZndiZ0x6N3FiM25UNkVISnJaNXN5WG43cldTZXFiNHJ6SmNHNXhr?=
 =?utf-8?B?Z2FMbE9OWTZKM2dITVJ6Z2c0N2hGYkNEVVpsS0pVRzZpNHRiTlVzQkdyekd0?=
 =?utf-8?B?NkpSVjB5bWZjRGt1RU1uZmRLTUJTSXFQYjlFakswblAyWXplalduZCt1eGps?=
 =?utf-8?B?cjhTckFlNlIreGlGUEt4TWFscFhRbEE2dGpYQ29sQ1BYblgyT1hSbUhCbVlB?=
 =?utf-8?B?ckdWWGxSNXFrbzczR2hDaFB0K1BlS2ZRbVFMLzBQOFpPdGlpd254QXlIekVq?=
 =?utf-8?B?Z1VRVkVpRUJYclpVajZ1L25kZHZzYTdmRTM5dmM0QW02cjc4UFd4UTRtemRL?=
 =?utf-8?B?N3k2VmxCbExKdkNaYmdhSmZ2eEpkR05ZQ3JzRWJnUlpRcmpCMVBVR1BaTjk3?=
 =?utf-8?B?NmdFeG4xTlNSRDEwaDFCblRpRzhUVWxnT21QdmZwbEl4RDJ4cXcwdGIxYW5q?=
 =?utf-8?B?VHVZUCsyL21TMFF6UlEzSnA3M2ExMnMyeGxKNmkyeFI2RlZnejZyMWpESXdH?=
 =?utf-8?B?R2xGaFZNbHgwVWxtZjVrdnRWdTJjZWg4amhDRElsRDJRSmJJektzMzluZ0hP?=
 =?utf-8?B?TG1DTlppblFTVjVQbmNiUUYwMDExYUtTWU1PMTN3ZG1pUm1rNkhaSVBORG1X?=
 =?utf-8?B?VVFOaldMZFVJVzB6WXdmMlcyLzlaOVU3NiszVVJQZjFLTldYY0Z1ZmNtKzNR?=
 =?utf-8?B?Vi9uTFBYRVlFL3o0d1JhNmF6QUo0K1dhRHlzVkoydTN0cjIxZDBCMUlwNFNU?=
 =?utf-8?B?Vm5OajNIQ3pMSmRqWVR5MGtWRS8yZlQwNE9iay85U0xlS3l2c1RsYkg2Y2V1?=
 =?utf-8?B?cmZsNktmZzBtTTVxeHZNL1lkbzFMbVlpNHdldUwxS2RJL3dSS0VpVE9GMVR5?=
 =?utf-8?B?YUZFZHZ5RzNiQXU4Q0hWeWpRZ3U0WEtYTlZ2THJKR3pjbGNJamVHbGwwRUZD?=
 =?utf-8?B?TmVvb3BtZURKVWpGUkRURWtZVXladk56bHFZa2VEVUlXWTNFUTZ1OFpKUUlt?=
 =?utf-8?B?Z3ZWV2JNT3R0WmlVa1FXZ1pZMWM4K3FEemdGTVpvekJRR3dTVGhGYkllTkw4?=
 =?utf-8?B?Z2FENHlYQ0hxZ0FQZm5BbXRlbFpHMlhTYy9zcUFKd3JzdGpsa09GNGVkc2hv?=
 =?utf-8?B?NUxGcW5vVWVRWTNHaEhyZFhXMEJweHhEcnFkUklYMzhUQlJsWE84ZXV0Z3lk?=
 =?utf-8?B?UDQwSi9MM0FWWWUzVVJ2M1dvSTFpNkF3V0NwUno5WFlQSVNHVzR1cW1mckNX?=
 =?utf-8?B?N0hhMHVsWlEzUDRaZ04zL216bFRQcUU0Ty9FVnVIWHUvUkp6Wll6djREbW9B?=
 =?utf-8?B?OWlyKzU4Z1J0YkxwRGNZMjczTmRORy92RFkxdURGOWlFNGhaL1VRZnhZQUJY?=
 =?utf-8?B?dS9qQlNYOGN4dURNSDZvd2VsV0JpdnNBQVMxdDA0aDJiWDQ0UVhQNDA4VkJG?=
 =?utf-8?B?VlhSOVRuWlJraTZzYXFXMXVFdWtKaWp3MTVTOXFIK2wxdFA2YSs4Mk14QjNP?=
 =?utf-8?B?THAydDhSUUdmeUdoR2p0YW54cnhkcTZwaG1CMDVPWnp5dkhwWElVbzlBengy?=
 =?utf-8?B?TkJuZ0xWN1A2UUNIY3JSTzRlZjRpbE9tcjVsYy8vZ2M0cWN5SVpMbU9FR2NP?=
 =?utf-8?Q?sA5QpYUF3Vsm5WjIlOdg7LB+Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59abee7d-f45b-4703-4443-08dd7086ac20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:07.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGeTYrAmiIaRII4x+oArT2cjG//ueTsfeWmfDdB+JQTbBpUDmwd724Sc7B2DkZ4GYzB+B/wB2UJyAhwKAooKkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Add unified pcie<n> and pcie<n>_ep label for existed chipes to prepare
applied one overay file to enable EP function.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 23 ++++++++++++----------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |  6 +++---
 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi |  6 ++++++
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index afbe962d78ce1..67c5c6029cd9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -37,15 +37,18 @@ hsio_phy: phy@5f1a0000 {
 		power-domains = <&pd IMX_SC_R_SERDES_1>;
 		status = "disabled";
 	};
-};
 
-&pcieb {
-	#interrupt-cells = <1>;
-	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "msi";
-	interrupt-map = <0 0 0 1 &gic 0 47 4>,
-			 <0 0 0 2 &gic 0 48 4>,
-			 <0 0 0 3 &gic 0 49 4>,
-			 <0 0 0 4 &gic 0 50 4>;
-	interrupt-map-mask = <0 0 0 0x7>;
+	pcie0: pcie@5f010000 {
+		#interrupt-cells = <1>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi";
+		interrupt-map = <0 0 0 1 &gic 0 47 4>,
+				<0 0 0 2 &gic 0 48 4>,
+				<0 0 0 3 &gic 0 49 4>,
+				<0 0 0 4 &gic 0 50 4>;
+		interrupt-map-mask = <0 0 0 0x7>;
+	};
+
+	pcie0_ep: pcie-ep@5f010000 {
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57ee..b955db19f3bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2155,7 +2155,7 @@ hdmi_tx_phy: phy@32fdff00 {
 			};
 		};
 
-		pcie: pcie@33800000 {
+		pcie0: pcie: pcie@33800000 {
 			compatible = "fsl,imx8mp-pcie";
 			reg = <0x33800000 0x400000>, <0x1ff00000 0x80000>;
 			reg-names = "dbi", "config";
@@ -2193,7 +2193,7 @@ pcie: pcie@33800000 {
 			status = "disabled";
 		};
 
-		pcie_ep: pcie-ep@33800000 {
+		pcie0_ep: pcie_ep: pcie-ep@33800000 {
 			compatible = "fsl,imx8mp-pcie-ep";
 			reg = <0x33800000 0x100000>,
 			      <0x18000000 0x8000000>,
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index e80f722dbe65f..50c0f6b0f0bdc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -12,7 +12,7 @@ &hsio_subsys {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	pciea: pcie@5f000000 {
+	pcie0: pciea: pcie@5f000000 {
 		compatible = "fsl,imx8q-pcie";
 		reg = <0x5f000000 0x10000>,
 		      <0x4ff00000 0x80000>;
@@ -42,7 +42,7 @@ pciea: pcie@5f000000 {
 		status = "disabled";
 	};
 
-	pciea_ep: pcie-ep@5f000000 {
+	pcie0_ep: pciea_ep: pcie-ep@5f000000 {
 		compatible = "fsl,imx8q-pcie-ep";
 		reg = <0x5f000000 0x00010000>,
 		      <0x40000000 0x10000000>;
@@ -61,7 +61,7 @@ pciea_ep: pcie-ep@5f000000 {
 		status = "disabled";
 	};
 
-	pcieb: pcie@5f010000 {
+	pcie1: pcieb: pcie@5f010000 {
 		compatible = "fsl,imx8q-pcie";
 		reg = <0x5f010000 0x10000>,
 		      <0x8ff00000 0x80000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
index 47fc6e0cff4a1..255b8c91c88cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
@@ -38,4 +38,10 @@ hsio_phy: phy@5f1a0000 {
 		power-domains = <&pd IMX_SC_R_SERDES_1>;
 		status = "disabled";
 	};
+
+	pcie0: pcie@5f010000 {
+	};
+
+	pcie0_ep: pcie-ep@5f010000 {
+	};
 };

-- 
2.34.1

