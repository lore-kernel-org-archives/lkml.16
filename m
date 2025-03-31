Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970621C189;
	Mon, 31 Mar 2025 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447812; cv=fail; b=IhlGtRB+Frvfy+OriOqGwEeHKOJy73nSSOd4QMY2h/6NHoIUAd7TtwpNjmXNjeFya4p8742tNum82xCh9tQN9BEZCfIONpCncJ0AgIlV+8onfGwc3k4BJgaayPqX6E77fTg1r/RolWDPVJOHxAy7D5xNcpmHqMKqldH5vl2OptQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447812; c=relaxed/simple;
	bh=SxsCZ7HxktglIBU8nuSFNa/tquCqnlO9B4lfmMOW0Fk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uISSC2c57C6HpXuey15wav+uG6IBxuaHW1+a7NQQwtGyViupp9ffkK+8DTGCcf4IwQRhjImZOLEdXZLbkeYV4UsmXdtEN2lUY4HCvE2H2DQVPZoyG8kVnvG/Dw7KrWfJrREi4Nh/cDoXXmLQKje43kqzkU8vZSRw3XoRLVmGzsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YcW1Ea7a; arc=fail smtp.client-ip=40.107.105.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YcW1Ea7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If4cbY9a8SFICKUuo7szL+jDTpopTHxwdRwe36pM2JRj5ccud0hSfBWglXhr1cCjWEyiNF7imkxlXZ6iGyJs6OCQUmXDsLE26tAKVbHWPQ1nBlJswIPVgFZ53Ps53CWtjP8Uur0XlN2r3ScKr7SzTdPkLgktgmGrDkHOEHmo6NgMifwyCW2U0u/JqEayZW07mtWKyovNxjfkfyT7nwJLoggJgdHuEtX0OWPxda7Hj3hopjPaa+/32qAIRqdhrQ/xCD7LREiUPHbVx1OMmzIIdr7QPQV3M917PGRYHB2Xr4YQO/ijVSqdo4b9MEHhgkGgN+fDkNse5Wl5oSxPlYC8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t8bSkwPsFBosgCengdXujnbwvxKEGPRJ7DY11XgDfc=;
 b=J5KeUK9dt7adMZHwOiwLOXLii/bO4eHIkJf0SxbahHYROJ52FyAoFwX/q6wx8F/1k2PvWc+DfD8D1Bt+HrlZW12HfBdO8+FOjjGUgprLwkBC+g5s6B5t8fj5jpuYywmJvdWxloZPUSV0IoOwC6KZx7LANP2YI1MGKIny9MkmLlo0SosSHuc3ryr+6fTDyG7aCnC1VgOEh6tHMd00RQmSCNy1ZkOdTrkuO8yQDPyKjXm7kX8T9X6SO6Vh5qG9E0/04VOerLaDJJBsp2Rc4O6HSiomJEYE5Rf3AFeO3KggSCCb+VbjWUQnCcuRQfqgqFWPwMdVAJgprvaMwFN3N5nn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t8bSkwPsFBosgCengdXujnbwvxKEGPRJ7DY11XgDfc=;
 b=YcW1Ea7aTsqtIQaUNCVF10ZxmIsphJUieODTCldywTY38+Dm44Fxqxe5uyN9OvZYWAyWiOeZFQ+OH789mbCKOfsCjRc4yJYxM9L+oRcfDxXFhxVfzfV9Q9HYPqpfJBEN9qaS23iigpnsKXRz6bDAhArEtrQ+ogKGW4Ti5rT0md/W3yLdcwB8giBXezE9VdwZO/9HSb++PLVsUp8bO2rSR2J9Sa+P1lbto6t6JJMS4DTXyrus6muQhR/oZxMe/frCxn0A35xZ6FllgMjJ2TZj9/X5Ld3r+ZaS7FRY15SEdH6nBMsXaL6KLX13i9a9qRCr6wgNq0v2AJWcaeCcKhlnVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:46 -0400
Subject: [PATCH 8/8] arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-8-270ef0868ac9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=1988;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SxsCZ7HxktglIBU8nuSFNa/tquCqnlO9B4lfmMOW0Fk=;
 b=4nj8oL6gnyn3Dp9CpJJS/oeVCIkLQThSMHLbui7QcVMEJYddGXDq2HayhVBcSnTKi3E3WvkzM
 A0EmblX+tmNADKYvV50oD68KKQfUDAUuUuD7s7yE5jXrRnzyweZpQfO
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
X-MS-Office365-Filtering-Correlation-Id: 2ab50666-04fe-43c9-3fe8-08dd7086b89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnZXcElJeUxRc2FUcVZzcWlwcTViSHlXVjM4N3ROdGtpTGUvRGdmbWN5bkNt?=
 =?utf-8?B?ZEZta2RUZWpZWTltMXMrdmNFaGRCUlNraEkyb0E2aytqTklCRXBWdHRSNmJt?=
 =?utf-8?B?TTNkVlpDWEYyL3kxQUJoRDlwOUJGQlJqODVlaWFNWld3RG5LSGk2TGpHTnpW?=
 =?utf-8?B?KzZsMENOVEVKRGwrd29CV01LWGoyOTMrVHJhdE44MWtPY2pCUEZNeDhPamt6?=
 =?utf-8?B?NFp6YWRjUnBHL3lyN2xtS3ZXS3p4eVVGY0hSS3NnTzFGTFZTSzV2Zjl3R1lZ?=
 =?utf-8?B?NFMwYjNNL2JyOVZRelNhaUFadUw3aFE4SnFzVndSWU4wektKK0gwOVE1K2w3?=
 =?utf-8?B?enJYUXM3TDFGOGZlNEV1dHRQVEtnbERmRU1abjA0Vi9CeVI5cGpQQ1ZhcmRr?=
 =?utf-8?B?NlUxek41Mms1V0VneWFLVUxsN3BpRityQ1pKOUd5MXkrd2JOSExuUWRTUFN2?=
 =?utf-8?B?QTV0WlAxOUUzWUZkWW5kRFNiYnV4b1ZoTDhGTnoyMGxvQ2JudjBaTFcvMDBq?=
 =?utf-8?B?SEFyTFd5SGU1MnJzbml4bzdwZkhEQzN0c3Y1cVBhOUVQZG56a2UrUVRySUdi?=
 =?utf-8?B?Q1VFWk0zeHN3QXNiZXpXcEVMcjBLT3MzVmVtcWoyRjltTWxyRjQyeUxtWkUw?=
 =?utf-8?B?Sml4NXRDRjRaenZqNkp3eWlJL2pobXRHcWlJZ1dkN2NRL0lzT2RoOXVIREZ4?=
 =?utf-8?B?bTNINmRLM2Z0K2orcmVlWTd6eTkrKy8xY1FBb280N1c4N25WaURVV0oyV0Z3?=
 =?utf-8?B?NmRBWG9OVDlSajNqdHNNdTVHUFdoamgyclV4VzZjZW85WExLcmJIQ0M0cm5m?=
 =?utf-8?B?WVhIMG52ZmlYVjdjbFlsODRrUU1JV2FlNVlMVFFTM21lblB1K2NZWks1Qks3?=
 =?utf-8?B?RnFYOVlwdERiamVodnZjK2dyVEZVSmhKUzhmTUtYL1BLdktLK0M4K2lmcE5i?=
 =?utf-8?B?Q0RvRW80OUp0eFhoTS9ZZ3hrUnVEYnVUaVhFVk93ckt3anJuazZOUmxJMk94?=
 =?utf-8?B?eU11a29pVllMSTd0d1QwdVErTzlUSFlBNGh0TDQ0R1N1NVp6YkoxVVc1REQ3?=
 =?utf-8?B?cVlvcFFJNGswbkNwOVFyQTgrRnlUVTJhSi9YWTY2UGRXNEpxUzVoV3FlQXBU?=
 =?utf-8?B?R1FPdG9vSVJ0QXFhMWRYR2x6KzFQdVgrVGNJRldXdzVJR01GUXEzeUVibFBz?=
 =?utf-8?B?czVTVFM3NGRtQkFYQ1VqaGlyTUd6Kzh5SjNZYm0rSWpMYkhIbFB3djl6SXov?=
 =?utf-8?B?TENnNG5mQkZWWUU2UWs3UUwwTE13eDJRc01SOUhPcmdJN04xSDc3YUMxYzR0?=
 =?utf-8?B?RzJRUSt4OHJvcTNaUVVMVHRpQVp1NzBsaXJkeTFuaUlBOHI0Q0p5L3REMlZa?=
 =?utf-8?B?bGxsTy9qbzhHNDUreTlJN1pMc0NMOHQ4MzIxdmZzdGhIcnlRaXc3bHhITCt5?=
 =?utf-8?B?NFV6VmNKbW1sVW9KMjNkWUkzeENpRmlNQjhrR3J2V1RUTUFVWEphSDZDclJ2?=
 =?utf-8?B?MStRUit0b3gwQjh4N1Q5ZExGWHh2SEkxY3hiSXE2ZGdVQjlhZWtqRjZhSXRM?=
 =?utf-8?B?MVRiMUU3Y1BvT3BORXAxWXpBOUlTWXp3OUR4S1ltdVNwS2pMN3c3aW9xbDNy?=
 =?utf-8?B?b0gwMlpSczVuclNiOUpwQk92QllDc2RDRlJTZFdCYkZma1FaWUpneFZQL3Fx?=
 =?utf-8?B?dGkvZFJaUzZZQVkybXBRRER5eis3L1lHZG10S3BCK0xoUUYzN3E4QVphMWdS?=
 =?utf-8?B?a2NPMEo3WnZKcitVVTRRWFJtS1hBNFR5VGt6NVRvblo2OUZXckd2MVNCaWRo?=
 =?utf-8?B?VCt1SDRKK0Znb3pvZTlZMDY4Ny9CcWMyWnlUTDREYUFEejB4NUFNOHpXWHZG?=
 =?utf-8?B?RlBZY0pCUnlhT1hhMXQzaGVFM1NqOVJWL3hPbHhJMUJ6K0ZheU1tMkpDcnUr?=
 =?utf-8?Q?W08DndiFmsc3RyZd7ZBkGNsRrXcuZur1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEF3WkdHdXNqa0JkUVJ0TTJmb0tDWkxtbWtneXk2Z0xVd2FGazhUQ1lYZHhR?=
 =?utf-8?B?dmgxSnh2QUg2K05PV2NqSkVhSTQzcEdVYURHaEoxSTdORDMzM2YvQjQ3ektO?=
 =?utf-8?B?VmlpNVppdkdwcjg1WkJJYTFGWnpzUGRyb1FnOUpsckVnTE5SbE9uL0p6bXpt?=
 =?utf-8?B?UXhvNEtoQTg0Vzl5dDlpSU9sNTFtNzFmTzZQamtyZndzWlFqZUpGVnJmZG1D?=
 =?utf-8?B?UHVKZEhhQ3VHVFRwQmwzMm0wNWEvdVVZMUYrS2cwS0tDdUFxclo4b09waWxn?=
 =?utf-8?B?N0pFdUJEU1IwYzQ1aThKT2pEdG5RdThlOEpWTjl5TFhZV0V1RzhhVWdFRzIr?=
 =?utf-8?B?cTlienRjZG9uaVJjc0JuNGtvb1dwRWY2aHBacmZxOFFPM2FDOXZSZEF2a3Q1?=
 =?utf-8?B?dmxVckt1cE5KUDllVklqOXhvNnlrNTR2SUVVR1JFMHpzaWk0cllpZnZ2eExk?=
 =?utf-8?B?YjhTK2VXNG5YdGRqVzZGaEFQNnJlOExCRC9DeTZvOTVGcWRrYWgreG10RXJ6?=
 =?utf-8?B?SjFqampJMGRKMWRuK0ZkZTQ3SmxGbEZ4QjFjV0haSklPQ2Vza0RpUGUzNHlm?=
 =?utf-8?B?eE0xWklqOE1halB5eXlqdjBhdCs1eDhQdU5OWlVPbG1oRGlaQ0dPYlRjR1k1?=
 =?utf-8?B?RnZWTUFiR3ErbVU1dUlRbElpWlVWTmwzK3Z1SndlQWR0Z1F1cFVLd3VnVTA0?=
 =?utf-8?B?ZmVkNWxCaW1vNTYyOCtET21HdnlwNnpMaG9mN1VwMWl1NFg2eHY2VTBDZzR5?=
 =?utf-8?B?UThNZlREVXNPTm5lVVJpRVdISmVuWjlvcytQT2xDenJZMHpkcWxBUitTUXJF?=
 =?utf-8?B?aWtFb2xGSHROOGRjM1NsQ3lPdStvek5ZUmYwZk5rRmxOdzFZTXdzMjRoVkh2?=
 =?utf-8?B?WFZ5YnI1OUFNaUhDejFyVEpkZDFtVW1ZUlRDY1lwdThZcjdqZEs4RGNBbWF0?=
 =?utf-8?B?dmJRQUloYVNLZWtpQ0pXYU9tUTFIanhiTjEwRU1mU1dHQ0dRaXVsMkN1b3hm?=
 =?utf-8?B?Q3V1aTFIV090T2w2ZlBrNDl4V2t5d0hnZXdIZzRQSDJaR0MwSnFHR1ZNNytj?=
 =?utf-8?B?eEpJTGtoWVZNaDI2TDlMMi81TjJNMTZuNHhhL3MzS1lMa0pka1lOQnNBRTZ5?=
 =?utf-8?B?dDFLejJEOFkyeFZHaFpoZmVUWnA4U0k2SzRVQkdqNFN4T3lSMGRiU2g0c1pH?=
 =?utf-8?B?b0ZINDlvaWxaWEpHd3c1cFg5LzJ4YlVRWnV4NWVZWDR5NldhSnQzcVFDeUZT?=
 =?utf-8?B?NW5HRSthTDBldWp2cXNsbXl6bHhKS3NzM1VrUmRhRldvMVFNcHFlU0VaVHhW?=
 =?utf-8?B?NXI5cDQ4OHVQYWlvV2VYaTc0ckVpZERBbGhDUE9ZekcxYSs2Rk1STzZmb1h5?=
 =?utf-8?B?eWRnOS83ckFTYkdOT2FOWlA1TjVqT1RRQWZDRHZxRlB6eVBYUk04cTUyTGxU?=
 =?utf-8?B?ZWh4a3MxbWFrbUdOd1JmcGRMNmFiQ1paQXV3cEY5amtaTzVHamRQaXU4aXo2?=
 =?utf-8?B?alRHU3gvcDZCZzJSRktodDFIN1ZwVlRjendmc0ZZZXBSZmRkQWE4bGhMWXMr?=
 =?utf-8?B?Tmk4V3JLUENoYjdSM1EvMXZobDF0ZkxxMnRYaEZaTnRmTVpUOU1lQllwRWlN?=
 =?utf-8?B?c01PVVF2UkF6a1RWeUpjeVd3NU1lbmowZlNpY3FxVU9GZU9qZWRiRVUwT2RJ?=
 =?utf-8?B?K3NlNnMvbVgzSXNZR1hYZXZEYzMyb1dQVXNoQVgrKzljM3BUaENhc3hlaWs3?=
 =?utf-8?B?cTl3dXhOdENadkdIM3R3OFJ6VWxWcDVVWFlLbDFtc3pKZW1XZVRkcWRNQi9i?=
 =?utf-8?B?Q3VWUFdseCtpZm54Q0xEc25FS3graUhvUVI5b3RlYlRaNmpxTXVqb1F2U2Yx?=
 =?utf-8?B?aTQwdW9uUGxvMFM5RVZ6SWRGRjUza2NIaUJraEhlcVlRZkptZm5TWGtrTVhD?=
 =?utf-8?B?b2FWc0tWYXJQRldYYlRld0hOMUw1L0VnTFNQekRtT0xKQ24vZ3JLZmRNL0Zr?=
 =?utf-8?B?TWZ1RWdyaFdiWndPdDlFYnZ4dyt1OEJaSDRJY3FQcDFnMCswVENidUJRazB6?=
 =?utf-8?B?VjFPaDZRWTdSZGsrZ2xDRkJuRGFIK0pPc0Nkck1GVmJheE5tWVJXa2gxMnlW?=
 =?utf-8?Q?8nsW31V8dlns3ION7Of5xZzyz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab50666-04fe-43c9-3fe8-08dd7086b89b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:28.3386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVVTkc2WkXo//4fk8CU5OE2KdgrvJVYGxAYtuE3Bnusj9SOA/PGg7XDTyoT0b1Ng+WB/z7c8n1MwFADFkc34NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Add pcie[0,1]-ep nodes and apply imx-pcie1-ep overlay file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  3 +++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4f2f50203dd86..205552b4e4985 100644
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

