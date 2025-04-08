Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E5D264A78;
	Tue,  8 Apr 2025 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102043; cv=fail; b=SN7KgiAXjos75AT7qu45Q1jvEgoPnLqQQuCl6TfiO21G+TCc7Oaaki7QiRjg/opmqSs/yqo9WSpM9EG1u6cpuCm7d6SEshmmFlgqIk7oJL8xGpipeQpMaaSSePycjfcIVHxlqwF+OhXA3giwkAFaBC7zoMHn0IYsnxnP6nCyYbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102043; c=relaxed/simple;
	bh=rYoP8Lbh1wSKkBmEMjWfGfwjuvBGlFh0ik35lZQ9J4E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q6JHJQT/Je5iQGCi+0mP0quWvao4bvY55TnmMP3JmQFsR7GOqd5NVXqDlFDtJ9/vMXu6SEkU0wELrf/E00rSzew82HS0lzY+WruIdzfu0qHEYW9M4cmsNrQmPkDMZGCSXpZTlS2Dhl3QeejgjqN/Glsn21/znYNwcNpPRV5oYKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O3P7Jpbe; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O3P7Jpbe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7Nymch6ju19gVYBBTAlBCPlH0D5oydLfeBZg4RHby7ZU9qXBWny7bABFeU5HWHcb4POcW2yLqUj8Q6FO+LHelYWjNcRLzeqzil5292/8gplYC54sBbTOC/RjcXmOqMRZTFP1fWnSiAuPMd1xTkywMipyKOi1BkWew6Nyk5Hq6x8i46+0+rEoQcz5p3z093qsFioPmmJSL8sO9Xqu0UNA8F/Bpbthu2hySRQckd9hyr9nxuTPnrFO26DZoGe+7BB/dTrkbHV+G3U+tNOqIuBH1IsKGLyxtj6q27PRrha93o6Q/3LFoPtD+ghVzZ4KeuEXoDYtCqfalVwYbY30N/zNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GylHtnGihzECEPF3PtctRfwePyo0+kJy+ltbO5ocOW0=;
 b=b1mRAWfn9qgm8qg1eIICw2tBVWbCiYpbmjJcDeHTx5I/MxkXtBgaxKpWZaxm3iBRnyt19rhpdnF3jFc8gYuYn5FXenqSzhXBS+Tnz/FU/9wNk3/dA3oZ+q8QhFsoszk3+pBRMOMVFeRa4iw5n1/KyK3HFxIGm4LnmsbomxPqvPzPbafsm1+Ko01Sqv+yqeANybv6LSEn86y08L/USpweNqT0Fj+uCOsNFW5yPZxKQLJ/ifGhaA5sO092NdfhA6VS4QYkL0xpzaf60FDHHRawPPcn+1BY4DU9lGMZ7180klapsl/n88Ks6IYlW1InPd1F4INIREzKDPHug3ird/ltEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GylHtnGihzECEPF3PtctRfwePyo0+kJy+ltbO5ocOW0=;
 b=O3P7Jpbec2P6V3lKmQswAhCTuqHo19ttGcDiRP2v+6GWScSPdiJji24wkKz0Xq/2uVLg13QXycOWnmnUUggHqlyhSWrfP7UPIby9ahR4gyJe3IXSEZSgfoaJTWsbdswmzNWtXAeuP6WuHgvcdTF1QeP6nLRcqD1np1hCcyB0scMq3aPp1Gu+hdi0BilNU37ZCZkd4h5G55lfzeREPRj7RvjXLtd41a775B2ZFkII8oXmPDRYwVEh5tTlqnlRTl8GBmz4DLIVZhOJaJuevmdLtvb3E4z0LCcvrmL3ggLxnWsmksntyOUJPXR4am2WgyHZ8osauO0kQ4721naSK8imDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:25 +0800
Subject: [PATCH v4 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-1-4c5f4a456e49@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=52893;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=9rLGv2K0F/Z2vpFRzSp/JswFMTO6f3/OgkN9c+WCi8c=;
 b=qF9/oSE20DUYOcFtJuqbmprKcJkha3G9GpdB6H3WGzwqEFlxRZzzf9+jH1TIHgDKknAQyK9qA
 /uU8pJfhuXsCU4+xQbp0dXNqm43ThTuYkbSt9k6UGJxgzD2hD7zNqeN
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
X-MS-Office365-Filtering-Correlation-Id: 9f4e47a6-d9f9-4275-af1b-08dd7679f589
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NytDT1phbC9wYThoNXVBZnlybmxSaE81MDJFTXlvMjkvZ2UrdjZZbXdtTHB4?=
 =?utf-8?B?clIzWStONnZ2aG9uSkJHNGg1ZkNmVXpVTTdjWG1QQkxCYkRhdmxRaEhrcTJj?=
 =?utf-8?B?RW9HTjB6QlM4WUZIY2FHK3VOQXdEZUFYMklzYXZZZUswbzRZTFJiMzZCQkp4?=
 =?utf-8?B?bXlTRi94Sk5JTzBzVUljTGlnVW0yNU45dkx5aS9WUmpBa0oyaWV4Q3VPd1Jz?=
 =?utf-8?B?bkUwWUpKa28rallZc2xTTXNTdnJWV2xoL1VmWEtSVUJ3OWJHM3JyVDI3OWlo?=
 =?utf-8?B?STRlZzZvQXBkemQ2RjJpTW5OWjBuSmxTbEZRemlPUjdJNWZ5OXJmdk1YZ0N4?=
 =?utf-8?B?QUpCVlBaTDQ1ZjViU2pXYXE2Y3Y1cTFZSXFjbjdubDlMRXRod1ltNFptUVBw?=
 =?utf-8?B?RW5QRm1aZ0dRNlBPcGo5UDUyVHk4dVFkNjhPYkZJNURpMEVUQTh4UEZTSzNX?=
 =?utf-8?B?Q0NFa2hIOWg5dUpFM3VlTVRNT2wwRlZqa2szZk9wNCtjRUtYL2M1TnpKMldO?=
 =?utf-8?B?ZStaR2VtQS90SlBZZnJYVjhZQkd0ZFJOWEppY0RCdmcxOFBUQy90RVhpaDNo?=
 =?utf-8?B?WDNyY2d6dldnc1FPZ2xHZHdrT3d0d1VUU0hCbjJxR3h3SDJ5cW9LUEs0L2NU?=
 =?utf-8?B?a2NMQThXTVFhY2s2WWNFMzhFejJJQ3JyS3VIK2RxdlIzTlRjZWZBZVZ1MWFK?=
 =?utf-8?B?UHFEeFd0NlpVRytLLzNPb0NWay9nMDFzWW9YL0RCK3JhRm1VQUhyemJmaUJa?=
 =?utf-8?B?dFY3eXhrekRvSVllbTBHcVVZMGgycm82OURIZzlIZVFBOXAySCs3VmhzdmZQ?=
 =?utf-8?B?cTU2TGJPNnVNNGs1NGxzMElpbERHZWRxYmNpNHIvRDFUeWdjSE5hNXhiRmFq?=
 =?utf-8?B?MXNrS2VuRWFlQ2Urc3BGaTBSRTFRSThqTU1LVXpwQVVRNFVOb1JWL0F3RXNi?=
 =?utf-8?B?aHQ1MHJnMVNaZWE1Q0RZUGorZHhsRjlFUks5SVBNZWg1bWZZNTRLWG5CVnB4?=
 =?utf-8?B?bHpZeldGTXNEM2FrajdJWVROcmh0OUNsZnd0MVozREVkWGIyQ2ttTmRGZzJH?=
 =?utf-8?B?YXFlN0JNd2tzdm9zN1VoejlpeCsxVnUrazlWeCtjWHVUYkxkbEt2dUYzNGsz?=
 =?utf-8?B?ZnRWVWhycXNLQVNleWc2OUlqUHZRaUs2OWZZL0JHanpUd2tNQy8wbEJpNmFv?=
 =?utf-8?B?V25IVXRJbTFqMFR4MHZROWUyTy9DeUZtTWVDdWJ1cW5OMVo1MHdIMmdCL1BY?=
 =?utf-8?B?ZUJERnlUbTVzRGZQTzN3ZS9GaE9jajA2VE5QajdrNjZtYlVmSFljT3ZLVjNX?=
 =?utf-8?B?aUxyTTZJeVd5ejVTRnRISHJKRTJocUJGMFYwUWNwZERuK0NzaEI3WVBVUmpL?=
 =?utf-8?B?K0laTU9Lb2xyTTFCNFNLQ1F6SHpJQWZndnVMTFROQ2s2QlZmbmZYcjlOZE55?=
 =?utf-8?B?S0wzWmx6NytzSThSWjJCSmI4c0o0L1dZbkJ0ZWcrNXlGaElWcG5VbUlMa1Fw?=
 =?utf-8?B?d21QRWlpSEo2R1JxTmIrdnlyYTQ5UkthT2pLenp1R1N1bUt3Vmcza3BJSHhM?=
 =?utf-8?B?cWI5cFZ5VG1tb293RUlrbHV6SEM0TmtVMzNPVWt0cTlLdGwyOCs4TE9ueHNs?=
 =?utf-8?B?ZnpyQllJNlNKL2ZXK0Z2aDhTYzZrRXBGcTV5VWlZZWlNN3dETjRFVm9wZ1BE?=
 =?utf-8?B?QXBQc2xIWWtxeHA0RlhnZXprN0RCWk8yUUtSSjFwRVhqRzJ6K1REVlVQNmlB?=
 =?utf-8?B?WGROc3dHQlhxTUNMRWhGTjBkbjA1MGN4c2FvOUlCbXNtQyt5TjFsTjNQL2Fp?=
 =?utf-8?B?cHhSQzZPTkpYdnlFTjdFTC8rTi9TYStTZVowVHpSS0JWbmx5cFVkSFZ2OFdw?=
 =?utf-8?B?TkhRZVpScm5xclBFckRUdHo1Nlpxc3FTWDl2bnNsV01rM01Hbmd6V080N2xP?=
 =?utf-8?Q?bZg1IlcCXZXw/gTVmdenKqHcmqlhbHe+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEdsOVFCYTU4N0RiTTRrNjUwQVdIWjNZS2lsTjRvYjl4OU4yZmliT21hSWV2?=
 =?utf-8?B?V0Z3bk83Rm9abEgyQjNzMjlLbVJxMGlyaHgyQ2tlMHpnbnArQ0o1dTYyTWN3?=
 =?utf-8?B?NTlKMUo4MkEwWXBDQUZydGtnOW9LdFB6bXdJOStTeXlmbTNyc2ZiR3FIeUZk?=
 =?utf-8?B?cm1pOEoyRVJjMzMwZU9oWGVSRkZXRWc5cFluRUJCZVA4MmNoQ2Y5S2ZUK0hC?=
 =?utf-8?B?WkU4ZlpGSFJTTEkydk9UVG54Y1VVVVpGL0wwRWtyVEZENkxjdFA1KzdobUZ5?=
 =?utf-8?B?bGRCajRCU2JMZ1pwZzM3QjVaVTJhQ1VjdEw4c1hwRlBqRHVqRmxoQXBiQnha?=
 =?utf-8?B?a2RHY3FKdkN0Y1cwZG5aWWE2M0hKdmdJYUJsNlRxTDZSSEs0VHExRFk3bVBN?=
 =?utf-8?B?TVBqNlNSamxQbnl4KzQ3UlJLUC8wdlFSZnVZTzFjU3ZpVmg1N1Q4V3Q4T2V4?=
 =?utf-8?B?Vi9DcjZTbnIrTm1GdFhnb1ExK3JMUE9nOUFvcTJsWkNKOGRFWGxvMUJwbGla?=
 =?utf-8?B?b0wxQVhrMFg3VXg1WHN1STBzQlNqUWZSeEdYeTNZVkYrdXlKWERway95OGI1?=
 =?utf-8?B?d3ovRmx5U1FNWmFPdFRQRVNndmI4aVVrQVNYd1JXRGY5dkZvd2hpTDRlWW9l?=
 =?utf-8?B?aEI1ZDUySjNVZDg0UXlMRVE4cS9xWjJIUFFydkRQcXlHSVQwbThkT2tyTnIy?=
 =?utf-8?B?Rzhlcm15R296L2NyMkgrOHVxNks3cUlhWloyUnd5MzBJSHZzTUk1ekVmUHhz?=
 =?utf-8?B?VXNnSlk5S08yamRwTFFheFJaLzFQV3o0dXZQeWx3QUNxQ0hOWXdBN2N2OTk5?=
 =?utf-8?B?Qi9PQzMxdTB5N0gvU3YwcEE4ZDRXZEhLK0xXL283MXJ5WlRkS1lVMDFBNXN0?=
 =?utf-8?B?TkRVd3BUTUJyNzk2aWdvVFc0cUo3UG9vTlNaN05KYy93QXJKbklURFFuOXNZ?=
 =?utf-8?B?cnhENitzNGZ5enNhM0dCcFF3U1Z4OVBmRHQyRUpDUnhUWi8wclFXeTV5WXpj?=
 =?utf-8?B?dWVLMjVibUQvM0Rya2QyS09jL1VKOUkxanNyRXkxajFXTWFsa1d6aXd1RTdX?=
 =?utf-8?B?LzVXSDk1VXpLV3AwTU1oRTNtZE9aaFl2K0JMbUhsYVZGZHBJMWltYjJQdmh0?=
 =?utf-8?B?ZEk2T25RY1gzSDBSWStYc0hjdVQ3Q1luMXJjK0VaYUdzU01JYnU3M3hzUGQx?=
 =?utf-8?B?aDJsaE5NbXZqNmRiVGlaMk9UcU1SSERqcWFlaHA0NDFuaUNMSUR4a1VGNCtY?=
 =?utf-8?B?RTlVcFRpckZvSGNRdGpzSVhLWWM1eUIzeWpVL1ZVT2d6bHJCUWwzc3c1WW9X?=
 =?utf-8?B?eERRcVJEdTJoUlRISnB4UkxGd1RzMzRDYTBWU1lwcjdZTHNEdFlrNHJhNzZ4?=
 =?utf-8?B?ZTJiS2pTN1k1UVI1a2ptK1cwejJxbFBlWmhGWWFWVGFqWGFFUTZucGlJOE5X?=
 =?utf-8?B?aXVrVDFZd2krSGR1ZTFTVGtIeHVVVzFmbHZ1OU1pZk9ITmJEcEc4ME90dWVw?=
 =?utf-8?B?RzRuRjZvZGRvVlhreHpLTStHeEVOOUZ5ek5hY0ZPRHVGNmh2SjNYL1ZWYzk1?=
 =?utf-8?B?b3pNQUpMbnRlckt0NzdwUTdGTGpqZlMvSTBSZEZYTGJLZnBidmxaM0hRdjdB?=
 =?utf-8?B?Znd3ZUcxOTVNLzlSZ3U5czgzZnlndWJFZDZLdEhiNERqd3AycjJrU0tIRExl?=
 =?utf-8?B?TEhxU1lleU14NDdvaUxUUHE5QkFKL21PUmhJSE9xT2JkcmRvaEV6T0N0dWxj?=
 =?utf-8?B?eGRDdGY0Q2FtajgzZXlaUWQyQWZNNndRODBpRzZBSnZPUmtJekRQSk1LL2I4?=
 =?utf-8?B?eVZwM0IvZ1FxQU1EK2lvSkxPV2xOa0k2N2VCc2Y2Y2kvbzNmT1lsZE56VGtG?=
 =?utf-8?B?M1NzYlpEVUJLR3JDK3FjaEU0RkVNdzdiTnpQSlZ6UktoZ0MyYmhhaHB4OUtP?=
 =?utf-8?B?YUc0b0JPNHEzaTNlMlpnZmpXQitYUmk3WUtEeDF6QytwT1BkVjZiZHVBWWhR?=
 =?utf-8?B?UkFETjkvd2M5d0NhMFp6TWhVZGRBLzNmMTd2ejZmZE5hVk9WR3FocWYxdC9q?=
 =?utf-8?B?TCs4VWd6WjJQbEV6dk95bUNscmtsUU5zTzZVWkZ5aVA0OStncFpSaWtMeVVo?=
 =?utf-8?Q?8i0jxhJOQqCEArj7+CP98y1pl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4e47a6-d9f9-4275-af1b-08dd7679f589
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:14.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFs6S9BVLHm8+MT+WZHQWE12clUiT5NQKIcC71XTtAQ8/hU7turQ9bBEoHLCfal1fFFq8Ehak2iZ06eEVPDy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

From: Peng Fan <peng.fan@nxp.com>

Add i.MX95 Logical Machine Management and CPU Protocol documentation.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 828 ++++++++++++++++++++++++
 1 file changed, 828 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..4e246a78a042a79eb81be35632079c7626bbbe57 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
@@ -32,6 +32,518 @@ port, and deploy the SM on supported processors.
 The SM implements an interface compliant with the Arm SCMI Specification
 with additional vendor specific extensions.
 
+System Control and Management Logical Machine Management Vendor Protocol
+========================================================================
+
+The SM adds the concept of logical machines (LMs). These are analogous to
+VMs and each has its own instance of SCMI. All normal SCMI calls only apply
+the LM running the calling agent. That includes boot, shutdown, reset,
+suspend, wake, etc. If a caller makes the SCMI base call to get a list
+of agents, it will only get those on that LM. Each LM is completely isolated
+from the others. This is mandatory for these to operate independently.
+
+This protocol is intended to support boot, shutdown, and reset of other logical
+machines (LM). It is usually used to allow one LM(e.g. OSPM) to manage
+another LM which is usually an offload or accelerator engine. Notifications
+from this protocol can also be used to manage a communication link to another
+LM. The LMM protocol provides commands to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Discover all the LMs defined in the system.
+- Boot a target LM.
+- Shutdown a target LM (gracefully or forcibly).
+- Reset a target LM (gracefully or forcibly).
+- Wake a target LM from suspend.
+- Suspend a target LM (gracefully).
+- Read boot/shutdown/reset information for a target LM.
+- Get notifications when a target LM boots or shuts down (e.g. LM 'X' requested
+  notification of LM 'Y' boots or shuts down, when LM 'Y' boots or shuts down,
+  SCMI firmware will send notification to LM 'X').
+
+'Graceful' means asking LM itself to shutdown/reset/etc (e.g. sending
+notification to Linux, Then Linux reboots or powers down itself). It is async
+command that the SUCCESS of the command just means the command successfully
+return, not means reboot/reset successfully finished.
+
+'Forceful' means the SM will force shutdown/reset/etc the LM. It is sync
+command that the SUCCESS of the command means the LM has been successfully
+shutdown/reset/etc.
+If the commands not have Graceful/Forceful flag settings, such as WAKE, SUSEND,
+it is a Graceful command.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+This command is mandatory.
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:5] Reserved, must be zero.                         |
+|                  |Bits[4:0] Number of Logical Machines                       |
+|                  |Note that due to both hardware limitations and reset reason|
+|                  |field limitations, the max number of LM is 16. The minimum |
+|                  |is 1.                                                      |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific command in the   |
+|                  |protocol. For all commands in this protocol, this          |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+LMM_ATTRIBUTES
+~~~~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid attributes are returned.                 |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |DENIED: if the agent does not have permission to get info  |
+|                  |for the LM specified by lmid.                              |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |Identifier of the LM whose identification is requested.    |
+|                  |This field is: Populated with the lmid of the calling      |
+|                  |agent, when the lmid parameter passed via the command is   |
+|                  |0xFFFFFFFF. Identical to the lmid field passed via the     |
+|                  |calling parameters, in all other cases                     |
++------------------+-----------------------------------------------------------+
+|uint32 attributes | Bits[31:0] reserved. must be zero                         |
++------------------+-----------------------------------------------------------+
+|uint32 state      | Current state of the LM                                   |
++------------------+-----------------------------------------------------------+
+|uint32 errStatus  | Last error status recorded                                |
++------------------+-----------------------------------------------------------+
+|char name[16]     | A NULL terminated ASCII string with the LM name, of up    |
+|                  | to 16 bytes                                               |
++------------------+-----------------------------------------------------------+
+
+LMM_BOOT
+~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM boots successfully started.                 |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmid is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_RESET
+~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Reset flags:                                               |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Graceful request:                                   |
+|                  |Set to 1 if the request is a graceful request.             |
+|                  |Set to 0 if the request is a forceful request.             |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: The LMM RESET command finished successfully in    |
+|                  |graceful reset or LM successfully resets in forceful reset.|
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmid is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_SHUTDOWN
+~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Reset flags:                                               |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Graceful request:                                   |
+|                  |Set to 1 if the request is a graceful request.             |
+|                  |Set to 0 if the request is a forceful request.             |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: The LMM shutdown command finished successfully in |
+|                  |graceful request or LM successfully shutdown in forceful   |
+|                  |request.                                                   |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmid is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_WAKE
+~~~~~~~~
+
+message_id: 0x7
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM wake command successfully returns.          |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmid is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_SUSPEND
+~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM suspend command successfully returns.       |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmid is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_NOTIFY
+~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags:                                        |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[3] Wake (resume) notification:                         |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[2] Suspend (sleep) notification:                       |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[1] Shutdown (off) notification:                        |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[0] Boot (on) notification:                             |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the notification state successfully updated.   |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if input attributes flag specifies     |
+|                  |unsupported or invalid configurations.                     |
+|                  |DENIED: if the agent does not have permission to request   |
+|                  |the notification.                                          |
++------------------+-----------------------------------------------------------+
+
+LMM_RESET_REASON
+~~~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x80
+This command is mandatory.
+
+This command is to return the reset reason that caused the last reset, such as
+POR, WDOG, JTAG and etc.
+
++---------------------+--------------------------------------------------------+
+|Parameters                                                                    |
++---------------------+--------------------------------------------------------+
+|Name                 |Description                                             |
++---------------------+--------------------------------------------------------+
+|uint32 lmid          |ID of the Logical Machine                               |
++---------------------+--------------------------------------------------------+
+|Return values                                                                 |
++---------------------+--------------------------------------------------------+
+|Name                 |Description                                             |
++---------------------+--------------------------------------------------------+
+|int32 status         |SUCCESS: if the reset reason of the LM successfully     |
+|                     |updated.                                                |
+|                     |NOT_FOUND: if lmid not points to a valid logical machine|
+|                     |DENIED: if the agent does not have permission to request|
+|                     |the reset reason.                                       |
++---------------------+--------------------------------------------------------+
+|uint32 bootflags     |Boot reason flags. This parameter has the format:       |
+|                     |Bits[31] Valid.                                         |
+|                     |Set to 1 if the entire reason is valid.                 |
+|                     |Set to 0 if the entire reason is not valid.             |
+|                     |Bits[30:29] Reserved, must be zero.                     |
+|                     |Bit[28] Valid origin:                                   |
+|                     |Set to 1 if the origin field is valid.                  |
+|                     |Set to 0 if the origin field is not valid.              |
+|                     |Bits[27:24] Origin.                                     |
+|                     |Logical Machine(LM) ID that causes the BOOT of this LM  |
+|                     |Bit[23] Valid err ID:                                   |
+|                     |Set to 1 if the error ID field is valid.                |
+|                     |Set to 0 if the error ID field is not valid.            |
+|                     |Bits[22:8] Error ID(Agent ID of the system).            |
+|                     |Bit[7:0] Reason(WDOG, POR, FCCU and etc):               |
+|                     |See the SRESR register description in the System        |
+|                     |Reset Controller (SRC) section in SoC reference mannual |
+|                     |One reason maps to BIT(reason) in SRESR                 |
++---------------------+--------------------------------------------------------+
+|uint32 shutdownflags |Shutdown reason flags. This parameter has the format:   |
+|                     |Bits[31] Valid.                                         |
+|                     |Set to 1 if the entire reason is valid.                 |
+|                     |Set to 0 if the entire reason is not valid.             |
+|                     |Bits[30:29] Number of valid extended info words.        |
+|                     |Bit[28] Valid origin:                                   |
+|                     |Set to 1 if the origin field is valid.                  |
+|                     |Set to 0 if the origin field is not valid.              |
+|                     |Bits[27:24] Origin.                                     |
+|                     |Logical Machine(LM) ID that causes the BOOT of this LM  |
+|                     |Bit[23] Valid err ID:                                   |
+|                     |Set to 1 if the error ID field is valid.                |
+|                     |Set to 0 if the error ID field is not valid.            |
+|                     |Bits[22:8] Error ID(Agent ID of the System).            |
+|                     |Bit[7:0] Reason                                         |
+|                     |See the SRESR register description in the System        |
+|                     |Reset Controller (SRC) section in SoC reference mannual |
+|                     |One reason maps to BIT(reason) in SRESR                 |
++---------------------+--------------------------------------------------------+
+|uint32 extinfo[3]    |Array of extended info words(e.g. fault pc)             |
++---------------------+--------------------------------------------------------+
+
+LMM_POWER_ON
+~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x80
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |ID of the Logical Machine                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if LM successfully powers on.                     |
+|                  |NOT_FOUND: if lmid not points to a valid logical machine.  |
+|                  |INVALID_PARAMETERS: if lmid is same as the caller.         |
+|                  |DENIED: if the agent does not have permission to manage the|
+|                  |the LM specified by lmid.                                  |
++------------------+-----------------------------------------------------------+
+
+LMM_RESET_VECTOR_SET
+~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0xC
+protocol_id: 0x80
+This command is mandatory.
+
++-----------------------+------------------------------------------------------+
+|Parameters                                                                    |
++-----------------------+------------------------------------------------------+
+|Name                   |Description                                           |
++-----------------------+------------------------------------------------------+
+|uint32 lmid            |ID of the Logical Machine                             |
++-----------------------+------------------------------------------------------+
+|uint32 cpuid           |ID of the CPU inside the LM                           |
++-----------------------+------------------------------------------------------+
+|uint32 flags           |Reset vector flags                                    |
+|                       |Bits[31:0] Reserved, must be zero.                    |
++-----------------------+------------------------------------------------------+
+|uint32 resetVectorLow  |Lower vector                                          |
++-----------------------+------------------------------------------------------+
+|uint32 resetVectorHigh |Higher vector                                         |
++-----------------------+------------------------------------------------------+
+|Return values                                                                 |
++-----------------------+------------------------------------------------------+
+|Name                   |Description                                           |
++-----------------------+------------------------------------------------------+
+|int32 status           |SUCCESS: If reset vector is set successfully.         |
+|                       |NOT_FOUND: if lmid not points to a valid logical      |
+|                       |machine, or cpuId is not valid.                       |
+|                       |INVALID_PARAMETERS: if reset vector is invalid.       |
+|                       |DENIED: if the agent does not have permission to set  |
+|                       |the reset vector for the CPU in the LM.               |
++-----------------------+------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x80
+This command is mandatory.
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+LMM_EVENT
+~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 lmid       |Identifier for the LM that caused the transition.          |
++------------------+-----------------------------------------------------------+
+|uint32 eventlm    |Identifier of the LM this event refers to.                 |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |LM events:                                                 |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[3] Wake (resume) event:                                |
+|                  |1 LM has awakened.                                         |
+|                  |0 not a wake event.                                        |
+|                  |Bit[2] Suspend (sleep) event:                              |
+|                  |1 LM has suspended.                                        |
+|                  |0 not a suspend event.                                     |
+|                  |Bit[1] Shutdown (off) event:                               |
+|                  |1 LM has shutdown.                                         |
+|                  |0 not a shutdown event.                                    |
+|                  |Bit[0] Boot (on) event:                                    |
+|                  |1 LM has booted.                                           |
+|                  |0 not a boot event.                                        |
++------------------+-----------------------------------------------------------+
+
 SCMI_BBM: System Control and Management BBM Vendor Protocol
 ==============================================================
 
@@ -436,6 +948,322 @@ protocol_id: 0x81
 |                  |0 no button change detected.                               |
 +------------------+-----------------------------------------------------------+
 
+System Control and Management CPU Vendor Protocol
+=================================================
+
+This protocol allows an agent to start or stop a CPU. It is used to manage
+auxiliary CPUs in a target LM (e.g. additional cores in an AP cluster or
+Cortex-M cores).
+Note:
+ - For cores in AP cluster, PSCI should be used and PSCI firmware will use CPU
+   protocol to handle them. For cores in non-AP cluster, Operating System(e.g.
+   Linux OS) could use CPU protocols to control Cortex-M7 cores.
+ - CPU indicates the core and its auxiliary peripherals(e.g. TCM) inside
+   i.MX SoC
+
+There are cases where giving an agent full control of a CPU via the CPU
+protocol is not desired. The LMM protocol is more restricted to just boot,
+shutdown, etc. So an agent might boot another logical machine but not be
+able to directly mess the state of its CPUs. Its also the reason there is an
+LMM power on command even though that could have been done through the
+power protocol.
+
+The CPU protocol provides commands to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Discover the CPUs defined in the system.
+- Start a CPU.
+- Stop a CPU.
+- Set the boot and resume addresses for a CPU.
+- Set the sleep mode of a CPU.
+- Configure wake-up sources for a CPU.
+- Configure power domain reactions (LPM mode and retention mask) for a CPU.
+- The CPU IDs can be found in the CPU section of the SoC DEVICE: SM Device
+  Interface. They can also be found in the SoC RM. See the CPU Mode Control
+  (CMC) list in General Power Controller (GPC) section.
+
+CPU settings are not aggregated and setting their state is normally exclusive
+to one client.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x82
+This command is mandatory.
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x82
+This command is mandatory.
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:16] Reserved, must be zero.                        |
+|                  |Bits[15:0] Number of CPUs                                  |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x82
+This command is mandatory.
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific command in the   |
+|                  |protocol. For all commands in this protocol, this          |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+CPU_ATTRIBUTES
+~~~~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x82
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpuid      |Identifier for the CPU                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid attributes are returned successfully.    |
+|                  |NOT_FOUND: if the cpuid is not valid.                      |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bits[31:0] Reserved, must be zero                          |
++------------------+-----------------------------------------------------------+
+|char name[16]     |NULL terminated ASCII string with CPU name up to 16 bytes  |
++------------------+-----------------------------------------------------------+
+
+CPU_START
+~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x82
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpuid      |Identifier for the CPU                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the cpu is started successfully.               |
+|                  |NOT_FOUND: if cpuid is not valid.                          |
+|                  |DENIED: the calling agent is not allowed to start this CPU.|
++------------------+-----------------------------------------------------------+
+
+CPU_STOP
+~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x82
+This command is mandatory.
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 cpuid      |Identifier for the CPU                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the cpu is started successfully.               |
+|                  |NOT_FOUND: if cpuid is not valid.                          |
+|                  |DENIED: the calling agent is not allowed to stop this CPU. |
++------------------+-----------------------------------------------------------+
+
+CPU_RESET_VECTOR_SET
+~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x82
+This command is mandatory.
+
++----------------------+-------------------------------------------------------+
+|Parameters                                                                    |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|uint32 cpuid          |Identifier for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|uint32 flags          |Reset vector flags:                                    |
+|                      |Bit[31] Resume flag.                                   |
+|                      |Set to 1 to update the reset vector used on resume.    |
+|                      |Bit[30] Boot flag.                                     |
+|                      |Set to 1 to update the reset vector used for boot.     |
+|                      |Bits[29:1] Reserved, must be zero.                     |
+|                      |Bit[0] Table flag.                                     |
+|                      |Set to 1 if vector is the vector table base address.   |
++----------------------+-------------------------------------------------------+
+|uint32 resetVectorLow |Lower vector:                                          |
+|                      |If bit[0] of flags is 0, the lower 32 bits of the      |
+|                      |physical address where the CPU should execute from on  |
+|                      |reset. If bit[0] of flags is 1, the lower 32 bits of   |
+|                      |the vector table base address                          |
++----------------------+-------------------------------------------------------+
+|uint32 resetVectorhigh|Upper vector:                                          |
+|                      |If bit[0] of flags is 0, the upper 32 bits of the      |
+|                      |physical address where the CPU should execute from on  |
+|                      |reset. If bit[0] of flags is 1, the upper 32 bits of   |
+|                      |the vector table base address                          |
++----------------------+-------------------------------------------------------+
+|Return values                                                                 |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|int32 status          |SUCCESS: if the CPU reset vector is set successfully.  |
+|                      |NOT_FOUND: if cpuId does not point to a valid CPU.     |
+|                      |INVALID_PARAMETERS: the requested vector type is not   |
+|                      |supported by this CPU.                                 |
+|                      |DENIED: the calling agent is not allowed to set the    |
+|                      |reset vector of this CPU                               |
++----------------------+-------------------------------------------------------+
+
+CPU_SLEEP_MODE_SET
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x7
+protocol_id: 0x82
+This command is mandatory.
+
++----------------------+-------------------------------------------------------+
+|Parameters                                                                    |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|uint32 cpuid          |Identifier for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|uint32 flags          |Sleep mode flags:                                      |
+|                      |Bits[31:1] Reserved, must be zero.                     |
+|                      |Bit[0] IRQ mux:                                        |
+|                      |If set to 1 the wakeup mux source is the GIC, else if 0|
+|                      |then the GPC                                           |
++----------------------+-------------------------------------------------------+
+|uint32 sleepmode      |target sleep mode. When CPU runs into WFI, the GPC mode|
+|                      |will be triggered to be in below modes:                |
+|                      |RUN:     (0)                                           |
+|                      |WAIT:    (1)                                           |
+|                      |STOP:    (2)                                           |
+|                      |SUSPEND: (3)                                           |
++----------------------+-------------------------------------------------------+
+|Return values                                                                 |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|int32 status          |SUCCESS: if the CPU sleep mode is set successfully.    |
+|                      |NOT_FOUND: if cpuId does not point to a valid CPU.     |
+|                      |INVALID_PARAMETERS: the sleepmode or flags is invalid. |
+|                      |DENIED: the calling agent is not allowed to configure  |
+|                      |the CPU                                                |
++----------------------+-------------------------------------------------------+
+
+CPU_INFO_GET
+~~~~~~~~~~~~
+
+message_id: 0xC
+protocol_id: 0x82
+This command is mandatory.
+
++----------------------+-------------------------------------------------------+
+|Parameters                                                                    |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|uint32 cpuid          |Identifier for the CPU                                 |
++----------------------+-------------------------------------------------------+
+|Return values                                                                 |
++----------------------+-------------------------------------------------------+
+|Name                  |Description                                            |
++----------------------+-------------------------------------------------------+
+|int32 status          |SUCCESS: if valid attributes are returned successfully.|
+|                      |NOT_FOUND: if the cpuid is not valid.                  |
++----------------------+-------------------------------------------------------+
+|uint32 runmode        |Run mode for the CPU                                   |
+|                      |RUN(0):cpu started                                     |
+|                      |HOLD(1):cpu powered up and reset asserted              |
+|                      |STOP(2):cpu reseted and hold cpu                       |
+|                      |SUSPEND(3):in cpuidle state                            |
++----------------------+-------------------------------------------------------+
+|uint32 sleepmode      |Sleep mode for the CPU, see CPU_SLEEP_MODE_SET         |
++----------------------+-------------------------------------------------------+
+|uint32 resetvectorlow |Reset vector low 32 bits for the CPU                   |
++----------------------+-------------------------------------------------------+
+|uint32 resetvecothigh |Reset vector high 32 bits for the CPU                  |
++----------------------+-------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x82
+This command is mandatory.
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
 SCMI_MISC: System Control and Management MISC Vendor Protocol
 ================================================================
 

-- 
2.37.1

