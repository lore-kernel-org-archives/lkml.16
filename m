Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623878F6C;
	Sun,  2 Feb 2025 00:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738457413; cv=fail; b=vGhkeIQCr9F+aMuDTAfZvMbFM+gMUJFrLu9uRivzeuboiM+z4cmuG+ruxNd8yoqVQ6GsmrofqyNLAwnx76wJagf14Otc0ZcgfeaxxL2X1qTT+6yJ9cb/qh8KX5uOde+QZxdBAVjcY8yVmfFJo7m+KsTj0466ONzbZFX92Ax/nIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738457413; c=relaxed/simple;
	bh=sjfrwJo3cirnw0w3T7cHbGyxh5PCEPcyb9YHHF2hyWo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MZPqRfUMxfQYoy+XC9iia/kpJYpGqltgT9ufyYMfAzvPxZ2yLcjWVsMWsraM4I9pcbJySZBvTk8JNnurBpahVy1O0pOfmz8JZJsULsVryoQBW/Yq53wr1B6vs/X5Xl2G9nz5nanwRMxjA+anwDr8MXA8DLox+w32LH5UYkaQb6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gqQj51jw; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gqQj51jw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlDIqovUthjl9avBpo3lxruz/mUwynkQjXadFWs3H0SpKrDuM2T1eCsDOMLHedWoq0UUHu6RQrvJ4mk7UUO41Rw2z3vr64sjqRWCf4zhhJdhE8PP3/s6OiJ3SWkpxuQx2YJD6HgBTGHLauUsesLey3xP/x9XenThn2uPaUj96TAZTjMVwyQEoIR7crC36P9MayVCaNmbo2jxIm5bWGVZOcV67gH0EiDvuThzC6GZR3wN3KNymsl21C0CDkoD9kCed1lLnh1IPAhssB7U/kOR8WexE9/Jy400UslYmsSsp4FAWyFlxLsVRJMmjkTtGCBJmg16xJrAsboQToGWz0rXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqDWQKTZyqxTxaDKQ1olaPCS0AfrUcUd5yOLvVszXDw=;
 b=TjoEngB2rgw0mN2Nbogn30Hw1JCbDSKkgjRElqvoyrR6GzJXZATha8FgwifdLN4wxJG14Xpw1I/wuIGErsysbBmFpbOw2CYO76GP4ERRlTWBS3VGeelTtFwdpcQ+4U3Lfc5DxYa5KXD5Rf6mdOHWhL0+uF2kr8qSrdf5vKQeesGKFOHMcburkuQw/kfWoF4k3zHS3KFwfL5azH2OCzSNu9H/YSfXDUH/EdgEhZJPsl52L5+wU4xJNBUIZTyJDVBWcS/lYJoBfppbxIdPWEwyGN9vLUas79lfJxqfeSNshnNObrKNr57zGrw2anfFsgSSjiAuhB1PsH+93Fm9pD4qeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqDWQKTZyqxTxaDKQ1olaPCS0AfrUcUd5yOLvVszXDw=;
 b=gqQj51jwOMlTlfRCBqbb9c4BZ1AlPv/0oK7T2S1x9BDbPCI77n9HLf9xa9Cu+egGbGuZu8dVyiaj+AibIsi1WqS/zBo8xk1MTgedIALUntQWQT2LFexo1GMG7+5RJ0ynp7r9KgVP/nmS+740m4Nr1IwlKYYbmA4rWB7B6/VgdNTFiJzLAr2RfY6Q5fRRmvZBLgQ0vzejDa2NFkDRLsAHI0pTCWQd2dX0sO+AFIysug3vL9nmz1aOif6FQ23Pa9qs6BPnUBB+Fx2B/XR2e2oQdVB+cFEWUAQcyfYMhvDqupgVi4YMjt2YYSMjya96/KmhjS231Q/l2Bi/r03rIs23tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9932.eurprd04.prod.outlook.com (2603:10a6:800:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sun, 2 Feb
 2025 00:50:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 00:50:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 02 Feb 2025 08:49:12 +0800
Subject: [PATCH v7 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-imx-ocotp-v7-1-5622ba16451d@nxp.com>
References: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
In-Reply-To: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738457363; l=4072;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=XnzgujPvzhDsZMamCFtENs9apB02aFgSkBfdNqk+fEY=;
 b=FwGNjYnEO46rkTs5h/XzwZQf935jd6xdAett0mnBjcFZBrMG2EZO7U3wySCBLxyTnSts8hhHG
 u9nt5klZuKBBPvIJsjvz7MtB6uG01g9ALEQEVtM6lcR85YvWEx6GS9S
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: 279e58df-d7eb-4ea4-4a19-08dd432388bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUUzcFh4UFhmekhYaWk0OG0vTWVhWEtJdEk3V3Z2VVhNVy93R3ZTTWpjbFlG?=
 =?utf-8?B?a1VSRnVkLzJmYmFrM2ovTHFSdUhVTG0rTDdOZjM0YWJlUGd6YWZpY0FrK1BN?=
 =?utf-8?B?LzFNak5XYWsrb1NQbXlDK21aWUFzaGVLaHJzcUVzWjZteklhOERQUnlaaTZs?=
 =?utf-8?B?ejFuVjJVRDZJVDVQRngyMGE1SndlbVlaQWZQOUFlNU83c1J1ZmwrajArK1VK?=
 =?utf-8?B?bFhaVldsV0MzWGxXM3ZjOUJ6eEltZk5jSVpmUFNXYVdIQ0tiZHNGVTdVNGJL?=
 =?utf-8?B?eE5ZRHdEOWNBK0FzZ2g5eEJBTDdxbmxFZ0FhaUtqSjBPT2FUWDlRb01lVUxL?=
 =?utf-8?B?NHBiR3E5WmQ3WlZDZnE4RFc2S20xU1dZVUh2enB5Z0pWTlBseHp0NElHUDgr?=
 =?utf-8?B?dVRnNHoveTdzZnpKN3BsQUhOYU5iSHhWMUZXbnVBZ2pZV2FLY2pqcjZOcm1j?=
 =?utf-8?B?ZVFHWXNiV2VNalNsSVloK2ttODIyRWg1MlkrdjZTaDNQT1BtT2FlTFB0YUtX?=
 =?utf-8?B?SmZ5TGlrdjJNeHhZTE1GNThjZ2VLM0h3S1VYZUV3UVQ3NWc2MW9nd00yM0lu?=
 =?utf-8?B?ZGFDaDNuMmdVNjFUdk0wSytpV1ZOeFgwVnc4cDhSczBBK3N5UTF1ODFzTXcv?=
 =?utf-8?B?cmw4K2tDMXpnRlZtMXhGZmFMZERyTFRGZm5SM1NtNWJBY2dXNzNFMUZaQ3pJ?=
 =?utf-8?B?N25POEZ2ZUlESTFoZjU0Z0FwU2N5a1VDRXpGR080OFo5K0FZUlJBLzVzQ01x?=
 =?utf-8?B?cmVFYXpFaXRRM01YdFZiR3F6ZHorMkluUmx6MVJubFh3TEZRb284c0wxa1Qz?=
 =?utf-8?B?UkhQTFBkbFJRdW5tT2J4RXY1TWlHMnFwN3FrVUZWenNSNmNmeDZyaHZUTDhV?=
 =?utf-8?B?UytGTS9NRFJQTXl5UlRpRUo5d3FRTTUrSlVPMmJlQUh6UTNCTzZrLysyRFUz?=
 =?utf-8?B?K0tKWDVGaHUvWlJWMnZSRUV4ZVJrMlA5MHErUEN0UXFrVDFicFB0UEVucDMr?=
 =?utf-8?B?b1pGaVc2UHJSaEdhQWRud1MxeEt3VU1wRjRsaTdvV1JUNmlEb05vNkVmY050?=
 =?utf-8?B?SWpSUXI3bFRrUTFEODA3QTkrVTErNHE4dktIYTNGRG9ONUVvMHdDcHk2K1dL?=
 =?utf-8?B?VVg0bmdHc1h2NGx2eDFlTjQzTUZqNVVJOGZIOUU0bFR5Z1FnNDdJOW5jTnJt?=
 =?utf-8?B?OWNRc2RyeCtwZ2czSEMvMVYxNTdHOFZydkxxcHRUNjF1RGpnbEVBSVVpOGlh?=
 =?utf-8?B?UUlLajV6MlorVmFQOHNnejMyTndVNmdEYXN1QStCVDArZkxsTFhEYUR5S09L?=
 =?utf-8?B?cmlmbzZDWjB5NUtxQUFEN0c1NkN6a2ZxZUNLSUNaNTdna1gyVW9McnFhR1BE?=
 =?utf-8?B?VUswS2lvM3NvSjBkL0hvYWJ0bWhrNkE1TnZpQldJOEQyMFI0N3FmQThkTmdu?=
 =?utf-8?B?V2Zpc3dOUm83bXhUVlZuTDRmZGF0MmhUaUVKVGRvNG84WDYrWXlVekV3bFR3?=
 =?utf-8?B?ZzlvWnYwblpYTU1vTGRMOEVIN05hRElLcyt4dHdYUjZINDFnUjhQSTIvRVo2?=
 =?utf-8?B?a05JVm1hVUd3bGtmeTJzNG9ScUU1UTZQSnY0VE1xUFdnazlIcUlZSjRPdjVk?=
 =?utf-8?B?M0hJYWhvT2NETTl0Y3dWODRvbjlaMHFtbHZteGJNRVVDbWtGNlo5UWwvN01n?=
 =?utf-8?B?dU1TY216Y2ttcWpMYUV5OUN6ZUszQ1U1RFhNYzhtSFZMMlBnSDNjNGxNWCsy?=
 =?utf-8?B?VFNyMkpmTklrT0VueTBqZ2E5L3B2c2F4Wm93RVl5c1VhRE12d3lnbkdwU0Rx?=
 =?utf-8?B?bGU5eEVOQmZVQ0pYUWozY3U3Yy9LWmJxZE8ralpXQTI0RDMrRjZhamdMbHNP?=
 =?utf-8?B?OXFudFpBc3dGYkk1NGpJVDhvRkdCU1E1dDZRQmNZN0xGbmdRM205T0tvY2Rs?=
 =?utf-8?Q?bm82q+jpdgci7Zx1LtSGOo+IhOS+5QGy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1NXOWs1Z3FzYkd4cGtCdk00Q1dkU0FiYTlKVUt3dzY1MmQzbHNGSXNvcEZM?=
 =?utf-8?B?VnNvSGhZV2d1OHdFYTVSSUdRcE5vVkk1NmN4YzEvZmU0TkN1bU9BdjR3ZitQ?=
 =?utf-8?B?TVJWaWlBU3Nacm1rK3ZBbS9nV1FvT1Y3Y0RnSHB6VVp1dFBLU2NBMmRxS1FK?=
 =?utf-8?B?a0x4eWloQ3NaekMxeTVjb0Q3KzhQVmxvcytaSDVjTFlpT01uRk1JanVHeE8y?=
 =?utf-8?B?R09QRHhOZmdwTzR4YnNzeTBza0JSd1FldE45d3B2Zi9mYktKbm91aCtSb2NH?=
 =?utf-8?B?aHkybXpwK2hrRmh4M1RjTHp5SDR6WFZrK3pWelFhS1htSUpER0tYVjN0Sm1t?=
 =?utf-8?B?S2RyL3JlNEEzVUlDQlBPME9nUVcrOVh2Vms0TU1tQXkvVjdBUmRnUFppVmZT?=
 =?utf-8?B?TnQzcGphSHVwUDBaVTQyWG5pOEtCanpDQnRzMlJmZ05wUDd2djFMdkNYYldr?=
 =?utf-8?B?VjkvaUZoMUtialBvV0xjbHBsMFFCQTEvZ3JjaVRpS3NZYjlaeTJ1MG5XZlhB?=
 =?utf-8?B?UDZBV2hzT1dtNDlOVVp3eHJtbm94bmlMTzJhOFRRbkZ3ZnJJSzhXSzZCY1JX?=
 =?utf-8?B?cDBOajlOYmN6cnRGZkovaFliVGdjQ2dPOWx0TFRJcFFaMGNqSWpWZlB3aEZs?=
 =?utf-8?B?dXprWGhrZmhCTlYrbHdCbGV1RHRxMkNVMzZvNjlJUmhQdUNtZjNTbUFrZzYx?=
 =?utf-8?B?T2VocDJsaG1CMElLZFl5RElBZnRqREdmNDYvdjB1clpVQUEvV0VOQWZVYmpv?=
 =?utf-8?B?OTJ1djNqQlV1TEd0dmxUcERpL2FndHBubEFhWVZMZkFvaXZvWG5KYm1yazBV?=
 =?utf-8?B?WlhHSFVrckNRVUVyeWE0eThiT3dUTXVLcEVudlljelpNZkV2TFgzNVZUTFY1?=
 =?utf-8?B?YTZJdGtlb1VBaWVsY05yUVNvM1R0ZkwwZmk3MURPZVFJRERzTVVHejY5MUxM?=
 =?utf-8?B?SzdqNlJJazR0SjFFMnFzSHJOSzUzSUxkcmg2QVNNcThsSExOUWd4NWVnL1pv?=
 =?utf-8?B?SVJHUHR4b0g4QjdKelZBSkxhSmx6dnFZZ1gzemRINFowUXA2RGZGb2lWVFVs?=
 =?utf-8?B?NEFrMVNxR2VFbWIyNVZDdXpSQllmRjRuTzdLSkZOTWpqb01sMFRtYUgvbGNF?=
 =?utf-8?B?R01xamxDaTNSVllXc2QyOTlJeldVSVViV0s2M1BIT2NYb2l5NThxZXV2NUVU?=
 =?utf-8?B?QXRKT3hMalJ2TUhrZ24rR0VrN0l2b0ltZmIwSUpOL01hcitneFJNWUwxM01y?=
 =?utf-8?B?ODJFS00zZG9nTXd2enVCMVlWd0xHZWFjSHZnTjd0ZXNnc29LYVJwZE1nNFlj?=
 =?utf-8?B?U1pOY2NrQVV3aEdvV1NIc2ZtazdyZ01vNktUemI4akdOYWU3ZlpTdHZYUnY3?=
 =?utf-8?B?cWxFMUlXSUM0c3M0VWlDRm5semJ5YTdxL2JZcUhqWkxOSmZoN1NQR3dVTjdQ?=
 =?utf-8?B?ZzFNNjQ2NEZiZGZrZFJoR3ltbU1VSjBjOFQ1MGlQQ016RHkvaTRMdFNxckhS?=
 =?utf-8?B?YU9yYllmQUpldllWLzVLbjNOc3c5SUg2a2IrQ2h4RHNvNXFpbkRuYit5RnZY?=
 =?utf-8?B?VGE0ZHRyN0hEcUJrWk9mdS9LNXdjVFlDNWlKbjdJdmg5czhzeEw1OUxnblJ0?=
 =?utf-8?B?MjA1dTRjQ3lVR3pRT0lCdTUxTDBQNm9GNTFQeTB2UVFDeTRzOGxVTE9XS2RY?=
 =?utf-8?B?QnV3Unk1bWt4bXhDbi9VZ2hmcmlZcnV5QXc3TEtHVjgwVnAzbUZIWGhRMlhk?=
 =?utf-8?B?alhwWkF1dkRTeUFtRVFvb1kvamwyM3p0R0J0YnBXUFUvZXBWTitLbndKeXpV?=
 =?utf-8?B?MkNid3Z2SXVwK3lvRDNUZXFsMy9TM2dCT2hxTFh5cndEQjNXY3VLczhENmFO?=
 =?utf-8?B?enlyZG9HbHNkMGlEcGY1UTIyd2R4MWoydE5rcXJwN2NJS2xLeWZJNGNvRWZa?=
 =?utf-8?B?R2JRUFJMNWRVZDVCRnRDeGprT1hMTUttQWZMaWFRK1BSVVh2VFRXOTJZT1g4?=
 =?utf-8?B?NEdFL0J0WXN5ZzR2QWQyMmJWUFl1djdEOXpEYXU0dzBMMEdZNHk2VnFEaVdU?=
 =?utf-8?B?MnV2cEswWDA5ZHA4a3RTL2pZQW9ZZ0Jsd29LeWNQREdvV3BXaFdtTmkvVmRY?=
 =?utf-8?Q?kLvo1syUNJz7dUj65+ZrDeUwG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e58df-d7eb-4ea4-4a19-08dd432388bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 00:50:05.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8H/FYuJibj6SdTzzD2S0z5NrR91+mIzcNs6eekpoFWs/ZlJIqQlK8waPMwKy5ayeATzOv8U/3c08+crv44VF+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9932

From: Peng Fan <peng.fan@nxp.com>

Introduce "#access-controller-cells" to make OCOTP be an accessing
controller, because i.MX Family OCOTP supports a specific peripheral
or function being fused which means being disabled.

Add the i.MX[95,93] OCOTP gate index.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827b71ba434832d2a7 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -54,6 +54,11 @@ properties:
   clocks:
     maxItems: 1
 
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the gate ID associated to the peripheral.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..4b7fe5930331fc7e3be49f2674faf03c0a46d156
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX93_OCOTP_H
+#define _DT_BINDINGS_NVMEM_IMX93_OCOTP_H
+
+#define IMX93_OCOTP_NPU_GATE		0
+#define IMX93_OCOTP_A550_GATE		1
+#define IMX93_OCOTP_A551_GATE		2
+#define IMX93_OCOTP_M33_GATE		3
+#define IMX93_OCOTP_CAN1_FD_GATE	4
+#define IMX93_OCOTP_CAN2_FD_GATE	5
+#define IMX93_OCOTP_CAN1_GATE		6
+#define IMX93_OCOTP_CAN2_GATE		7
+#define IMX93_OCOTP_USB1_GATE		8
+#define IMX93_OCOTP_USB2_GATE		9
+#define IMX93_OCOTP_ENET1_GATE		10
+#define IMX93_OCOTP_ENET2_GATE		11
+#define IMX93_OCOTP_PXP_GATE		12
+#define IMX93_OCOTP_MIPI_CSI1_GATE	13
+#define IMX93_OCOTP_MIPI_DSI1_GATE	14
+#define IMX93_OCOTP_LVDS1_GATE		15
+#define IMX93_OCOTP_ADC1_GATE		16
+
+#endif
diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..717152219c9890297440b74e11d67e2dc5da883a
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX95_OCOTP_H
+#define _DT_BINDINGS_NVMEM_IMX95_OCOTP_H
+
+#define IMX95_OCOTP_CANFD1_GATE		0
+#define IMX95_OCOTP_CANFD2_GATE		1
+#define IMX95_OCOTP_CANFD3_GATE		2
+#define IMX95_OCOTP_CANFD4_GATE		3
+#define IMX95_OCOTP_CANFD5_GATE		4
+#define IMX95_OCOTP_CAN1_GATE		5
+#define IMX95_OCOTP_CAN2_GATE		6
+#define IMX95_OCOTP_CAN3_GATE		7
+#define IMX95_OCOTP_CAN4_GATE		8
+#define IMX95_OCOTP_CAN5_GATE		9
+#define IMX95_OCOTP_NPU_GATE		10
+#define IMX95_OCOTP_A550_GATE		11
+#define IMX95_OCOTP_A551_GATE		12
+#define IMX95_OCOTP_A552_GATE		13
+#define IMX95_OCOTP_A553_GATE		14
+#define IMX95_OCOTP_A554_GATE		15
+#define IMX95_OCOTP_A555_GATE		16
+#define IMX95_OCOTP_M7_GATE		17
+#define IMX95_OCOTP_DCSS_GATE		18
+#define IMX95_OCOTP_LVDS1_GATE		19
+#define IMX95_OCOTP_ISP_GATE		20
+#define IMX95_OCOTP_USB1_GATE		21
+#define IMX95_OCOTP_USB2_GATE		22
+#define IMX95_OCOTP_NETC_GATE		23
+#define IMX95_OCOTP_PCIE1_GATE		24
+#define IMX95_OCOTP_PCIE2_GATE		25
+#define IMX95_OCOTP_ADC1_GATE		26
+#define IMX95_OCOTP_EARC_RX_GATE	27
+#define IMX95_OCOTP_GPU3D_GATE		28
+#define IMX95_OCOTP_VPU_GATE		29
+#define IMX95_OCOTP_JPEG_ENC_GATE	30
+#define IMX95_OCOTP_JPEG_DEC_GATE	31
+#define IMX95_OCOTP_MIPI_CSI1_GATE	32
+#define IMX95_OCOTP_MIPI_CSI2_GATE	33
+#define IMX95_OCOTP_MIPI_DSI1_GATE	34
+#define IMX95_OCOTP_V2X_GATE		35
+
+#endif

-- 
2.37.1

