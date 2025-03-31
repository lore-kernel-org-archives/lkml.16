Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79FB21B9C3;
	Mon, 31 Mar 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447808; cv=fail; b=LU2Px7QwPPrOT7Emm55ftBfH14q2bzRQYdo1mDggD9wCduRmIbuYGk12K6chp4X0DBH7rXEyWQQNiAfx2JLpRSvj0On6ceeOvFxEy955kji4PrcSq8C8e8zhhlKJQTbjQF1RniEh1NiBgGAu48wdIKwP84Y2Dtf414KJKRRQdzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447808; c=relaxed/simple;
	bh=qH2w3a6f74UfMcnY9mbUtfgcmj8FvbyOtigKSi34vnA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h+5OLxuIydkhA39ytK40Nd8aKIrxBrUiNdoAhV4e/SyitvXzgOAqFCVeCFFjB0HYDAJRXkoxpsZzuG24LmRYaaOAnRGPeRzyi5xQ/zSdbNycYz2lg/Ib8278kysausWM+hwVJxTJbwPQPrEvzzEWJmYPx6dcQSYoRxN0hXRPeAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PefGceZK; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PefGceZK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbz064d+9dD40f6fWQWz/bg4I8POw0hPTsIATocafOJudGL/dP1m+q5RXBC4TR58yje1R1zqG8CZ8SxDhnnBs85lb7E1yPuBlKKJ0RHjweqWP4OSQ2OOSnks3UIFiu8srNQo7XFyEylP2NGcUv2kim8HZmXvrmKxi1K1yV7Cn+SQ52bKuxvdVAotdcKDPfuw8si0b4hEErGJSQy92Pzss3+7IS38UXmPAeDiPIrUaETjWQDpBCadlR6dAw1pixmMYyAYeZ0cMG7rJoCi4zJqjQtblFKZV3/DcHP1WVSj0P4XpJon+E0N19OPT4a0BfkG39WGB0WTIHKPoHlTsVkg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71eX0VvIFvFVC3PPB/pfwv/3zR4VUcukb7laPcSo7DU=;
 b=jIDN2KuulMCSGyU6Pj1ToBYdU3o5lES8+UcTUfnrOMTsiLCNCN2zt7aC1M1vOaqbwQ/XWO7ZNPHsvWj1Dcn0RS+KctgtIlcaaPxU2Poc2PbZt/iDqC/ijVTgm8JMXCqf1PFrnhBobhrGB2O7umkJLlWwX3E3/t2f23SfBlez1Zbc04jbtvITBk1YkNkqTHr+g2cv86MRcfjxybylvJH249T5Glyh05zLqvNZO2DRtZ8SK/XhAZAeiF4hOSPARuL9yptqQuCifItbOSVVNhfl6xdiGo+m9xqufutGBPljYtNep8f3G8b14jVzZqdMIdO4Z9nR3CHmMluXfrrI6wIwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71eX0VvIFvFVC3PPB/pfwv/3zR4VUcukb7laPcSo7DU=;
 b=PefGceZK2+EFJ3KO9JiwaYf6xdkvEfYD5qNmHhUbGuCW8RZzCiDnqCbcS8lvT+lp8Ejp5wbq59L66j09n2A2cqwztAZKEVQLJlMgtL0K81Xa0ItezA/r60zQIdtNZDRyNTilSsXQeGueTBAwov5tNElvZGzPLEJD9UYpNdgD3o8OcTBl2mRPrDm48P7FSe2R/kwdCC6jxhSz4Lh9VfBLfZ11yq5aWn99LL78YDSchCvooXqMbXc4qG7dlaot4JCBvFwcsxmF7we/65NyLy4biCfcASy6ABIBUywVYMwXPQkaynbN8+ur2FRuVvVIfvfpjYhiabCIXwVOCdNdQm0wAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:25 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:45 -0400
Subject: [PATCH 7/8] arm64: dts: imx8mq: add pcie0-ep node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-7-270ef0868ac9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=1940;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qH2w3a6f74UfMcnY9mbUtfgcmj8FvbyOtigKSi34vnA=;
 b=TUEP9FG5ZNfMiRIXKPZEE8tXpt8cr9U9IphY8Hn4FB1XjR71R7Kr/fTQ+hudz5cwBKU74iIaY
 s6mty2EHgI0BXrsfLuvWdhOIHUxoYLMF4em3Hd6gIxnHD2qw75SEEz7
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
X-MS-Office365-Filtering-Correlation-Id: 7fe5b870-0058-41c3-d842-08dd7086b6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVVwY1k2b05UUVNXY1RVdUhSbEdGbFNqVzRIVEYzcGhVUEhaaW5HK3VKZXRM?=
 =?utf-8?B?QzZsWis0NXBrbWtpMGFIR2tUZEo0RlFXMEZSSmpSQTNSRjlIYmRmLzdWb1Fo?=
 =?utf-8?B?OUlaK3hHTGRzQ3h0V2hsN0c3TGsrL1hyWVBkbEZtRXNuV0hnZ0UyclV4VkJF?=
 =?utf-8?B?eWdyMi9QaVoxMTF4TUJNRVRmdXFpNkI2VE8yUitLMk5ZaytEK3RiY1JIdTJv?=
 =?utf-8?B?aitlcjdNcnFjaDhHbzBiUWRDMzRndGhBZ2UreDB3WUpSVy95ZWk3Q3VuMXZE?=
 =?utf-8?B?emZBeThFc3dJMFhMLzhHZklkRzZUenRJdG5uT3JTNmUwN25IZStLb3NhbW02?=
 =?utf-8?B?cTJIalM1TCs1eWJ2K0UyNlZBSmFvQ05scFhzNHU0UnVYMURudklRcWFvdkhW?=
 =?utf-8?B?RlZhNlJhNjRUN0pPdDhpMjIyNUliVmV0NmM0L0tNRllkV1BrT1Z2aUVPL20z?=
 =?utf-8?B?aEg2TW9UbmNpU2FySTRmSlRsOGJpcjdRUVpnclRkTElCRGgzanRnTkxYWDZS?=
 =?utf-8?B?bm5QY0RxellUUTRuQTBMSll5di9VMFR1ZDNTcUJ3MnVROWxPQy9VOENrWERS?=
 =?utf-8?B?YW1jNk1ocXZRbFYzNHhjUTJhVDVKcDAyLzZkQ3p3N2JHREtQNnNRTVNNTWFW?=
 =?utf-8?B?dW15UVBxUWh4QURvL1dPRXlLajNIaUR0cTcxQ29KVE5OdStQWFdYMnkxaVIv?=
 =?utf-8?B?YjBzb09kZEVaN2ZnSDJsWVoxQ2h0M2thU0UwZldOZVUwUFJ2dWpsRzlVNEtU?=
 =?utf-8?B?ZHVEVGJwQmFWS0ZVYSsyU3FJMkllNFZhQVNoM0VpV0lXQmN5MmY5cGQ5enlZ?=
 =?utf-8?B?d2lsZDVKZjJXY01QVnQ3Z25mWHkvWFpnZDIybGpWVSs2V3k1ZlVvTFQ0bFI5?=
 =?utf-8?B?c3ZFSmlNWlhtR0VwcmFYQXl6ME5QUVFmNGJ3VkV2alZLSEpocmhNR2llYlQ5?=
 =?utf-8?B?SzhKQmNNVWV2WnRaVkxjbDBlUmI2QXZidU1mOStIVE50WVdUbURyQWRHSHNi?=
 =?utf-8?B?aDJ4NHVvZDJNeldXUHNLU2YyN2dTc0pmb3hsckYzNGtEM3VLVWhudmFqd0lP?=
 =?utf-8?B?QVNyVDhFNDFrVTN1SFdTanZPN3g5TU9jWWpNK2dMSy96Q0I5SWp4aFVjcnFJ?=
 =?utf-8?B?a0R6Z05CS2RhR2Vna3p2UEFSUkFTUWl2N2ZwMWNEdHR5emRObFFqZ2RuUG00?=
 =?utf-8?B?UEtUN0F5ei9sZ2JFYXRsUXEzN0lNVHlnVEFwODhySlk1QlM4UzNyUnVtSXd6?=
 =?utf-8?B?L01yNXBabkZlTUdRVVY0ZE5LeVQrUFBsY1NtOGEwSG9UY3BUSHN6L2JIVERB?=
 =?utf-8?B?bllIV1poWlBPazdkWGxLSlFQMFVJdTJ4SjMyUStBUTBjVXRxTGFuQXllZUFX?=
 =?utf-8?B?RzVVdHZNbktuWmZHSnZjbEZWWUlPYWd0alYrNC9BN0xMZGkvZXUvemoxQlk2?=
 =?utf-8?B?ejlGeTVscmIxOTJ0VVViSnlQa3g3U2NqK0JsUHhYVCtpUXBhckZSWDh3c1Fl?=
 =?utf-8?B?YXltMTRmallwN2JiSi8rWFdvQURhY1EzMFhDRHVkeVBEcXd1Z3NpZUdQdWJE?=
 =?utf-8?B?dVhoQmJHTkViMnNZR0o4ekpWUk9SR1RDUXFRS1pRbGg0cFFlNFl6Y2NteXdP?=
 =?utf-8?B?S1lDU01YdElKcm5kZ1p0SW5lbmkxRm1BY2FkN3djVGkydVFXNlZndFI4cUFH?=
 =?utf-8?B?aXNMUU5JWURWRjBWRlUwbjFxamRGb1ZYYXUxZTJjSW05OForTUp4SFJ4NjNB?=
 =?utf-8?B?b21WaDNHd3RvejhWekE2dEhLODVzekFjL0N0MGQ0SzMyTDFNZGxQSlR5UWZD?=
 =?utf-8?B?Tm82ZmR3OEY3ZmE4UWFHc1d3RkljeEpDZjdKaVJxYjMvV3JOSHpJSHVZcFgw?=
 =?utf-8?B?MStQK3p1TVVNM3RQSm1pdUgxZldya1hpc2lZb3RUUWRJb2dMa2gxQ1BzY3da?=
 =?utf-8?Q?HxBv4nG/VozZD/zv1rKXtZJ6JNkvQL9C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDBYNWVxY29LaHRETG1GT0NNbk9pc0xCZkNRVjBnNUZIQiswZ2c1UWpjNTRV?=
 =?utf-8?B?aW0zRm1TTk50dmxqYUIxWTRoN1dvWnBMcXdQMi9iMllIcjNaUHdYdWxJTnBC?=
 =?utf-8?B?MGZoUkFPSXdJSHg1SXZCSFo5VmlxbFRhUzR1TmUvV1dsNUc1OXNzek9VS3Ny?=
 =?utf-8?B?b05ib0dIemxpOEd3Z2F4K1IxMm15TWx0QU1VK09laUtUVHlJOG1YSHN5NWFE?=
 =?utf-8?B?amlPVVVoTnVCSnA4S2piVGJubERNd0puVkxJN2ZqTnd0NXMzWkZMdHhIeEtL?=
 =?utf-8?B?VjdFNiszRU9IaTRRS1B0R016aDFlckNhVE9UYStHRG5md0Y0dTdITmpRQkxt?=
 =?utf-8?B?RmFFc2pQYVBmL2VkL3lzWVJNRkhXU3RablZZM2ZpTzZwR1Uxb09KQXYxWDlr?=
 =?utf-8?B?K3JJaW5WMzdLdnF4T09udEE3MTF5WDdOeHJ1REF3WW9hRytpdEdieFZkaVE2?=
 =?utf-8?B?aVBWV3RjeEhoNHdBWk1vc2N1UFJsRERpWDFvdVh5cVdQSC9zTnljaWF6OEFi?=
 =?utf-8?B?MXM3T0h0V0p5VGpQNURWRUd4NmhZL1prZ3FxVUUvc3FydnUrcGNwNDZXK25G?=
 =?utf-8?B?VTlwSm9XN01JanNxUHNaUkw5ZzNSVFl0M0RxWnBmTjN6dDlzT1hxNjFuZm8y?=
 =?utf-8?B?NGNLdGE2UFgwSEhUQmE1RFZ5ODk0WHVkSU85OVQ1L0l4anMrZkFyeXArU2dX?=
 =?utf-8?B?THBlb2JNS1NPWitueU56Z2Z3UzljL3hFajdVMjVYY0dCMVVyaWZXZHEwa1JH?=
 =?utf-8?B?R1NVVjdnVEFnNENZOU0xS2d4TjJFM0Jud3dmd2Q3dzV6aVdDYWIrTG9RbHdU?=
 =?utf-8?B?YUQwWnJFQzVDOCtiRmZxRFRnUGsxMzBQVEtzS1RGa21sRGVFakFBd1Y1YVpv?=
 =?utf-8?B?ZkVicGNidEQ0ejh1LzVsN3cxd0QxZ2VIZ3RmMG94N0VYb2xYK2tPZFJxcStZ?=
 =?utf-8?B?aXVNRkRXcldjOEVZYkFGTWkzb0hXMlN3aDZCUmhMK2Z0M3M4YTNuaE1laTNE?=
 =?utf-8?B?QkpsWTdOMkxiZ3ZucHZIWTJyVmNVaXUrWHA1bFdONHNFM1BKc0VqT2w2cFRB?=
 =?utf-8?B?S1I5MlhQdDMrRjhvamxXTk51Yk5Sa1o3KzE4NHRmelVmcGFjNloyWTJtYWx3?=
 =?utf-8?B?dXFTSjdvYWFnSXNrNWlVQ0ZoZnd4UUpCdjFyby9kL0l0dFVway9NMHF0MzRn?=
 =?utf-8?B?ZE1rTmoxaTFZOWlmWStCWHExdE1YZkZ5c2YrVWVJU2I1NzBrSW5PSE9XY0Q4?=
 =?utf-8?B?UkdCTWQxUUVVV05CYWVxeTNBRHJZWTMrRzVFSFBKNXFBZWRWZGhRZmk1cHRL?=
 =?utf-8?B?V05VaGc3aFNyaFZwSmNVeDgzbXZVTEovbmdNNmpidjIvWTFYME9yZFVzT3hK?=
 =?utf-8?B?TWEweWJsY2haK0hZUDFHSzRmb3hzMEFveW0xZ09mUldOUmhkNVNBbjI1Z3BR?=
 =?utf-8?B?SGNlaFBWZmRiMTBqcW5MUEZGSVhRSkNKQldjWWZjUkRrdzVhc1pzUDVsekdI?=
 =?utf-8?B?bDNqUWxWdmFRRHpoWndCQzk5cldHbnFwQ1k2RTNLWHA2YjhlMGcyem5teWto?=
 =?utf-8?B?bUxZSjJIZk16dUE0b2hlcGNQdmpGRENOdy8yZVFlTjYxZWMzWjZUdExZWS9l?=
 =?utf-8?B?blI3NC9McGlPcDF4dXNVVlJQYWk0VzBwU0xQNXNEMzlQTElMR3ZPbGVGVUl1?=
 =?utf-8?B?clFNRGVWTXZtd0lOY1Y3MU5HYldSWmJEYjlUbXNxb0tUbUFlSkljVjVBZjNs?=
 =?utf-8?B?dW5yaWgzZ2psRjFYdUJnYUMxR0k2OCttWFhkQU00RWZENy9HQ1JJMjN0TEZq?=
 =?utf-8?B?bmhUYUZ2ZGh6bE5tM0xVdTViMDRzWHpGODZNeVdCRkZyRW0yNmppVWd5cElZ?=
 =?utf-8?B?bENYdTBZaGIxS2JhTGk1RkhRUXBobkREaFZkVStlMXp4S0tyY1BqWUJLRmdu?=
 =?utf-8?B?OVF5UkFmaGFPcXVma3prS3U1VzBtV2ZnRS9mUjJIdGt2SEhxZ2RVMDZNSTJG?=
 =?utf-8?B?bGRlSGgvMDJXaG5HcmFkcFVQcmFVbGcxMTR4Mlg4TXp1UWdsc0dmdGc1TmxG?=
 =?utf-8?B?a3I4bk93OG92cDc1MDBscmRzSDl5Y3Z2c0FjdG1BODc3bFVLYUQ5NWM4R3ky?=
 =?utf-8?Q?JBkaAIyHfyKNwLzaHdVPq8OZQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe5b870-0058-41c3-d842-08dd7086b6ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:25.3026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T34cWpFY96sNaMAZo6jrSADIdwuDmHcgKbHh9SVh5wY4VrVCklGEPlEgIPKhkxf6FU9+ymy4LnP3guQPXs6M2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Add pcie0-ep node for i.MX8QM.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2b..e5f9c90129d6c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1774,6 +1774,41 @@ pcie0: pcie@33800000 {
 			status = "disabled";
 		};
 
+		pcie0_ep: pcie-ep@33800000 {
+			compatible = "fsl,imx8mq-pcie-ep";
+			reg = <0x33800000 0x100000>,
+			      <0x18000000 0x8000000>,
+			      <0x33900000 0x100000>,
+			      <0x33b00000 0x100000>;
+			reg-names = "dbi", "addr_space", "dbi2", "atu";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			linux,pci-domain = <0>;
+			clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
+				 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+				 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+				 <&clk IMX8MQ_CLK_PCIE2_AUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			power-domains = <&pgc_pcie>;
+			resets = <&src IMX8MQ_RESET_PCIEPHY2>,
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_EN>,
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF>;
+			reset-names = "pciephy", "apps", "turnoff";
+			assigned-clocks = <&clk IMX8MQ_CLK_PCIE2_CTRL>,
+					  <&clk IMX8MQ_CLK_PCIE2_PHY>,
+					  <&clk IMX8MQ_CLK_PCIE2_AUX>;
+			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
+						 <&clk IMX8MQ_SYS2_PLL_100M>,
+						 <&clk IMX8MQ_SYS1_PLL_80M>;
+			assigned-clock-rates = <250000000>, <100000000>,
+					       <10000000>;
+			num-ib-windows = <4>;
+			num-ob-windows = <4>;
+			fsl,max-link-speed = <2>;
+			status = "disabled";
+		};
+
 		pcie1: pcie@33c00000 {
 			compatible = "fsl,imx8mq-pcie";
 			reg = <0x33c00000 0x400000>,

-- 
2.34.1

