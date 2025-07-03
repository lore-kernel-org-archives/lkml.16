Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49396242930;
	Thu,  3 Jul 2025 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514158; cv=fail; b=HBMhBAspr1BMi2T5eAuwj1MyXaRjGbiLs+mmV7YRoctQCscY0gdBpMG0a/ygwwcsQ5IlPL/Qw9xUd24//hLCIr0W+VuYHE0hDl9Jbpcjmum0oPsN4wS25xRwAlRrU43tYRABuhnyyW5t+sIpVN/Hx9pGdB4OjB8GmwIDWj4ptXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514158; c=relaxed/simple;
	bh=vMZE6lVxR3VF8DKlNbdIn/TV4fErkJb4xk9ktjWOx4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XobzVVRN/roJ6/n6yGAgfDaDr3ULgkPRWBnwS8iJhsppNiUdabKY7cy1skseyp+mb7dXTHTBr1prTxPorF0YkSc3hszAkCYJQL6gVmx8nyZPMg8wZCubq2tRA0A1bBJc26auwmESqz8T+3kvZLjf7OMAUteT8Sz9a5R+471gET4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Soy0sfLH; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Soy0sfLH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJzY6VA2Q00BAe3JB+2/VZK+D/5BjaeT/1Ob+Kbk6wLhyXLmU8G00XrvUgvUqlGIMo7HnHXMJX7umYXsjVEx49msGlrwLXkZID+ooLW1fgT9NGkZt1f0CPXIUOpo1knTswVFtRh69yDTB6nKSDhjb+MuSg0vVNcGMbdj74TcFCBGyE3/vJ8Ruf3BAz3D8uLGc08Kwc1rJctZGmEibuNAbLO6j83eq3iDHOYwQzKrRD+EwY0yBToYu4QQq1mqnprqY/VpQL4Q8dveHPm7fmipA2TaDZM9ZXctNayYxLO+8S5JkEGBEsmd6bKZNjgrC7VI4MbHVWszL33dt7nopp4tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhjBezaZL+SCWjU3GxWf0RWfSkQCQyoJkDWXI0JTWWs=;
 b=bOjfzIqts1GA7Spu1rY9aWFRt3qAadn6QjnYF2YyWSYRRd1e6LqsodlpuP3g8Rhy+55ox2GQuqztYIYy4n+sBy3GurC8a3Q3XopJsHwfGtNeOi3J7jUEdNy5EfhKbiNvphX5KsUIdA0g0zufoLpK4AEcQOXx/y57eEsmwBvSz2xeOk2W1cj5R5PeB6y/7wFq76GxJJjsIhsTV2vzlfg86Az/Sq43KwiO3wgjtFlQ50lXsp2Bi8D8OGaXRsLGPMdJ55rpiM0CBBlyg9DjEhLL5npaEkpv4GmLU2q1cI6zy3D1+0dxkt5JlIW4dAs/qBRDK7+zhGbK09pIyQPrYdk3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhjBezaZL+SCWjU3GxWf0RWfSkQCQyoJkDWXI0JTWWs=;
 b=Soy0sfLHotxNPHJiWR/QplIITwVacpczjkohVEUUnjXNtzN9hRmFmVMRZRFb9emPztTTbx+5GZgGOOgko9Sy6l71CgjEOiHz+zcwBPm8m4bEVePAV9k8EjlPdNzbPAonKfYTy8EAWG/G/OT7bTDBpVKkordYeor3CFpPpqk+G1jlVgeJqK5QtO3FLJSUM2fdLRAOaa8ExcVFmFuGsIkWv6LOHooSK/m8r2d3FIzhY0D40wyF6FW9QRjUMYGhrpfzPxpjKH5MbihnIvvvx3tNC7sEt5Tfebao4S2mM/FJ+PdLYrG2rh0TH4c9JSYiY2SnTVdr4/Clz63jNQ990Fw0rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 03:42:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:42:32 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 03 Jul 2025 11:40:21 +0800
Subject: [PATCH v2 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751514039; l=2445;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Vi9nUBAGgo+vsABxcFdgbXXnwIO6v8xn9xEL05Xy00Y=;
 b=giIbKX/ycvMHlE+n1Pr6aG/bWl4DQXwhaPvi9oL4n4ZW6GKbe9fKequz3MzKTYL/HnYtRO+Wr
 8UFwslnPX6nAe8VFRBewfC5dG04iVRMbgxAF22xTcWASiPH2Kfn8NHc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: b020cbd5-37ea-47f5-90ce-08ddb9e3a48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y01pUzg2SjVub3JOT1FsU1RiSGRiMzJ2RUExOTEzTnVXUUNleTVwYVlYTVdS?=
 =?utf-8?B?THpzZkczNng2ajJwSFRaNjFFcktUWS9qZThZTmVWODZucXpVRTVIaEdtbVJt?=
 =?utf-8?B?UDRxeURwUkMzTHRZYS9TWTNYS1B3a2VMMmhVV2ppdkZzUm45d2RxMFIrUE5Y?=
 =?utf-8?B?ZktFRVMzYVN0U3pxS0M3SGJLNzBqR0ZrWGkzcHBnSnJUUXY0eXcwdm1JUUpo?=
 =?utf-8?B?dWxEWE53VVFzOTdpbndUTVdwMy9hbTZjWDFFTmgwL3I2M3lQTTEwRXVLRjkv?=
 =?utf-8?B?dDAxNisyMjN5VWhYZzZUYkZxTER6R1lCbURQTTZITlRUZmZqaTUvUDE0VWgz?=
 =?utf-8?B?YlRLRFdMbVNzQ0pWK1Fpdm45R1hBOE5qN0RqeCs4UzRXSlNTWEdYTnBiUEhh?=
 =?utf-8?B?Zjg2aU1MUnczYVJVUmkrTStibm1WSlVPMVBRWW96WXZsWDA4dnhMbmIxOWph?=
 =?utf-8?B?cjJkQVRhU3NIOGYxTGl3VjVBNVh4VUFVempJM081bWpZZWZGZ3lRYkJ4V2VV?=
 =?utf-8?B?QnU1TitCOGY4Wi9Tb0JVbEJ6enorRk52QmQxZDY3bHNnYWJwV0g1R21lUkh1?=
 =?utf-8?B?SzZ5Y2FyQzNxaVdRUEJDSnE5MEVJakhjaFFyVHFLQndvaUZDcG1EUnRFdjc3?=
 =?utf-8?B?blhvaXgxV0lMNUw2VllGdG41bDdHb3JseUZOMDBRbUVBZlZrWXp0VDl6Vm4x?=
 =?utf-8?B?a3kraHllVjlFa2RxSXEvSjJBdjRHa1BVSlc2akVwY2M1ZFBEVTgyK1lzRlFi?=
 =?utf-8?B?dHZjNUpuTlAzS2gxTFIvdS9rNmNNL0xjTE5sQlZNejFCdTFyOUV4R3NvUGFP?=
 =?utf-8?B?V0ZLblkyTlJYR0ZLVmJyQTVaaGE0K3d5YkNZUnFlb2dVd0ZkL004THUrcVF4?=
 =?utf-8?B?MnFLbk40b0RtcnJhdUY1SHZQVFlxSllxcCt1STB6MVFUSEt1Z2daa0lrczJR?=
 =?utf-8?B?K3lCU2NETmFTaTZwMEcyckNlWjlVRXBnMzFoM2d0b2xVRHRLS2ZycWl5RGZS?=
 =?utf-8?B?SW9TZjRsRXozam5nNFVDWHJwWWdWdkxmdlE0azl1NVowZklyQ1JUTUg0SVZK?=
 =?utf-8?B?M29HcEVCKzdvQ1MwcVFIL2IvWDI3ZTQwdzdJSUkzaHFCemdMTjRCTkRFU2Vi?=
 =?utf-8?B?U2lVcWZzYUFIT0hHNFN4ZzViUzBBRzFrbWZZSytqTkVNTFJ2d05zVkZkT01l?=
 =?utf-8?B?ZHhjUEtnUVBkZWFrMk5yajJjUHJnY1djazlWRkNGcjRnQnJQbU9mYjN4bGQy?=
 =?utf-8?B?Zm1UWGc1cHJycEcyT3FIWEJjdXpQc0NtQmFQblhSZzdiMTVPZzF4LzcveW9P?=
 =?utf-8?B?N0tDbkFnTU84V2FLR1AyZFNZUmFWNmMrR1RtUmxuaFcyczdISWFPSWFYNFh0?=
 =?utf-8?B?YWxXSEV1Z3RTOXRnd0RCYnVhU2p4MTFFd0ZEM09yVmZEOURQdXUwQisrMVRX?=
 =?utf-8?B?TEVJNHJ0RjF2MkVYTEhqb3IrZ0s3dnhrL2lBa1NsdEhRQ25Oa2F1bEE2aGQv?=
 =?utf-8?B?Y3U3ZEp5M1Y4aGRmTHlwcXI5R1BQcmlYRWRpTndqOHFVRXBrNXdsU0lzd1Rp?=
 =?utf-8?B?dENqRGFUbzRjQ3RJdkcremZhL3BhWjFQZEVDNzEyVlA1SDRXc3lqaEhkOUQz?=
 =?utf-8?B?ekxibjZjWVptVFhIQWxPelZsRll5UnZSWXZVNzdLNkVsRVRRV242S0w2b2U0?=
 =?utf-8?B?eWloQWtSdU9Hd1JNV1RvaWtRbjdYLzJkNCt4UW8rV3RwaUs0OTdUNXNnbFg2?=
 =?utf-8?B?cWt1UGk5S3AyWGgzTzRBUXBBSGdBOC81QjVFYW1sTEdHSWVyY3F3b0JWb3pL?=
 =?utf-8?B?dU90T0FWdzI3N3BLOVZiSzhidy9MMjN6Um9RUklldVhIU3EzWWNrM05EUUx3?=
 =?utf-8?B?SlZOOURWS3RZVTBQUDhkVXV2U2F5Z3U4N3Y4ZjBOVXpuK1R2OUNvekMreWty?=
 =?utf-8?B?U0VvVVdwam1nVGJHb0gwTm0zRmtlYmh3QkhJWU85RnIxTkMyNzhVajQ0dC82?=
 =?utf-8?Q?P1JHAvGkTtSWUcVShNGkcsoPaVpC5g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2s3ZldpdFBGMWZWd3UzR0pGd2ZwWUxNNHFRa2M1NzJmYjBPOXpxREdqaUZu?=
 =?utf-8?B?Rmp2NmZ6TG9zNTFMcU9SUjE3SjVtZElib3V0RmhKUWxlUUNtbDhTdzFGZ0o3?=
 =?utf-8?B?UFZiTzdTekpBaXBSUE5JdWgvU0pzSGdYVCt5bGhPVWhBeTVnbmlPR1RsVjh0?=
 =?utf-8?B?OER3TjYrb1NkN01kRTRXK1JUMTVGQ2JGYmV4OFJPN1c1M0Qzd08rUmxZV3Nl?=
 =?utf-8?B?R3Byd0l2Y1FSNDF2WnBmbGVHM1BFY2NFaG1VQ2NSQ0ljNnd0RmpZMUM2eEVZ?=
 =?utf-8?B?SDMvYnQ0R2J5M3UvSUpMYjVSQUlGcHV2WlZLcExmanFaYVRJNEFKYUJxNlgz?=
 =?utf-8?B?cnBRWCttRE9MaXZHS2hxb2ZCN2x6bTlZSkRoQWJIV2wxYk01RFUwdytEcGh1?=
 =?utf-8?B?UGRFWnF0VTdHZ3BBbmhwTG1PdjFrY2prejl3NzN4VE43NVhPdEs1dXZjQ1Fu?=
 =?utf-8?B?N2tvdS9zRll2VU84VjlBcmdhUnIyN3dtSnQwT28ra2diMmQ4anZwak9kQUVU?=
 =?utf-8?B?MFBmOTRBUzhQTVE3ZHFkakRFVXp4aVFZakFQeDVCTG9VTGo5M0tTampQZlM5?=
 =?utf-8?B?eSs2eGg5ajJOL1lIVndTWjZGWWFNTkVHUGVINGllMVJXR2FET3VTUXplV0JV?=
 =?utf-8?B?RzFIM2hjb3BCSTlZcUFCR0NveUZvLytaUGtvb2xQcmJNK1RtYzNLWERlVWY4?=
 =?utf-8?B?QytQNzJ5dE5pdXRzdTdhZUVZcEJ5SnE2VFBNbXBTRFE1N1AxMVdwdEVmbitB?=
 =?utf-8?B?M3ZpeW5RbHVZdWRWeEJUbkRrMU9vVm5iOEorNXhWRzZLY1ZRZ3RrM21EQnVD?=
 =?utf-8?B?OFREazdIVWVXMzdsdmdxam5CMEM0R1ExMkkwMGpCQTlCVWpKMktnRysvMTJK?=
 =?utf-8?B?MjhHQnlwSlJDSHhYaDVXbmU3ZFI2UVpiTC9NcTlvTGF5aWFocjF4QkRpMTFB?=
 =?utf-8?B?YU9GczY5ZlRBQ3JQQThUeG9mNjNJb2V5SWk1U3FrY0cxb25BSGtOWDF5OWRJ?=
 =?utf-8?B?cTMvL3g5SFlJUHZreHFvNnF6OC9tWHJxbU1tN3piUzBWanFCeU10WW5KeTNN?=
 =?utf-8?B?cXZueWRudlNQQmFScU5MSmxJK2cxMWExS0g3UnZKRDk0dm5QRlhLRWJMcSt3?=
 =?utf-8?B?ci9WbUZ6MjFpVjc2VmVOcGRjejl0OHMvQndxanVuNjFHUnQrTnh3RVhKclVX?=
 =?utf-8?B?UDlvenhUVUJ2MXpuZCtxSXZ1ZEhEdHlVYkRIWGp1UWtjbHNmYjBJcWc5bllq?=
 =?utf-8?B?bk1aU3JsWTZZeHN6d2NBQ3pCYjRiRGNhdG1iSFo3cU9XRmVkalRxTHkrOXFx?=
 =?utf-8?B?cWZLRk50b0ZmT2pkMTg3T2VpekNsazVScGFES0VCbVZMVDkyckdxRHhmZTcy?=
 =?utf-8?B?bU5hNFphT24xZkMzRFJjR0lReGJIa2NTbCtiTHZ6djgzbVhrbDZ1WEIzNW9Y?=
 =?utf-8?B?dHpwQzdOclk2OHJ1TmQwSWpJektoVk9XR1dYcmVPL1ZOcTV5UzNidnhmSGFY?=
 =?utf-8?B?SEUrREJIeEhGdzI5bzRxczRjL3kyWDdRTUZaS2lhTzhpVnpNaHZDZnNnYklz?=
 =?utf-8?B?SUl2di8zTHdYdlV2TkE2OXBFc21uQzlieEY5WUNvSjJIK044blNhMERLMlE2?=
 =?utf-8?B?Y2h2MGZldFF1b00zbERidzB0N2hLaHJmdnlxbzlQK2FiY01tVzFpWEJGNXZT?=
 =?utf-8?B?dWJIUzhRTW5qTk1DSmhwaDhyZXFNVkx0bng5TEpXTmcrZHE4NSs2S2N3eW1n?=
 =?utf-8?B?VGZzYzRKU2Q0S1h0MjJJNmFNTGV2WExNVU9zaGp5YU1WQnBOMGtyaFZlQ1dN?=
 =?utf-8?B?aGY2OStpSFhYMlhVUy9uaXVERkkyZmJHQkdEN3oyT0JKS2d6S3ZUR1ZsenVU?=
 =?utf-8?B?V0NGZVBiOHM3eFlYUkIrVmxOcjRnL3Joc21oL0Nnb2FkTEozcXA1NjMvVHZy?=
 =?utf-8?B?WVI5dUtSamNOK1I1dEc2ejB3cHgwbWxqQjJKMHFLUERpQk1QOXZINXFoSGRQ?=
 =?utf-8?B?UWxRQXhkajlhbXNLSjRyWXRvVkpiODIvQWM4Y3Q3NXMwZlQ2VUQxY2JhS2Ja?=
 =?utf-8?B?Smg4bys1NVZSV2d2SkFKL3dmK2pUa3JrVFE2L1NmajZldTNwYm1seDdaQWRv?=
 =?utf-8?Q?i2c7NMfh+y0JKy/Stf2vHz+mE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b020cbd5-37ea-47f5-90ce-08ddb9e3a48a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:32.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYOvfvqvFnXxtp26OxV1uf94Ifq6djT0M4fGyAAGjtHwcq7/OLxCw07QmCTE47cdafyuue+MpPQp+PPvsWXBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206

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

