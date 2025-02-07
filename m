Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013052.outbound.protection.outlook.com [52.101.67.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE951DE2BF;
	Fri,  7 Feb 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920977; cv=fail; b=RfOFWynExbELfCtwDzzLEiFVAUrqxtdDs+O8yrOKAKVudz7/Db2jN/dNnTvWRUyEsJ7JKce7rdRzi778ewzf/oV3cMcM1k6N2vns69chFC2SqJPVbWJfR+qU3nXH6XrC+EmfUCj5+X2tjmoThOvslJd0/wMbrmM/NRV+MLde7s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920977; c=relaxed/simple;
	bh=++kW0cq47pSlA1brHTD0UH2+w36QxGLL10cb3C6FcZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ojgDYfHwVwUUEhzSZy29XhL78sTRivu03fqUllrdgPhOylsNBG0kUd4wMhrcBsYHdAOiAIMmI6tjTBYrvnHiyVvDJkQlmCEy9p+JaFxtkiyUteoKSes4IZ2JcAa1f8Sdyx9aDZQ0qUeYWVTjUDBVw7KbyeC0T3JOAaR13QZ7z4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Wn2ZzRcP; arc=fail smtp.client-ip=52.101.67.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Wn2ZzRcP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCn/qoAjNALnGYybHQWjU80w/Tlx8twiEnzOBJ4/OBK9uuZGPMa/MptOmqbvQPQPBq1WEOYg7YToqN38mtfkXMq9z6KyROpqmhA+hW0fCnTLo7WMOB2yjIqTs341Cv86H7pCM2W8GoqNrTty10CIeup6ZSx+n2m1vifTPkpid8NJJTR6d+/O8cvL+V+i2uBVFUp6EUtRwYfScTmBDa80ZcnpS2W0JbMPUaQawJIPuK3Dob3i+bOs3HUY5DYG9mp8HwhdhVp0ONslE72tfBrRiw7p6uCFM4uFGaZRtpnwuxEIVeGnHtROu8C4STC7LEiAR3iC9ConAnhKBj+2kN9NZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+6Z+RZdfDV70Rt43PlEP5YHjcvpEoPwyVNtpjotEnE=;
 b=zB25XI4/lX4UO2bRJRkpIAGlH3JwHPOC4kl3hkMDqhK6Px6swFLUte9E5INV1kVApXuuBZxB0V9bQJLqgA8nZxOWko8U+McLX8GGNRTy/JS/e/df/7fqoaijjwsOWZx52jlZKOWnIhVv5FLAZ/9OrIIol0ZBmFwlvnOZ2e4pFe4dx/TX70kU6ppdu25HyhSzlDpyrZPwPzyAJn/4zCwa5KpyIFqdnmv9bJqd4SLNWaWLy+I1ir0X5S3Auwk/6aj1cj61Jwb7XyF48isGAJNMMg4yXtN6U4CvIm5hndgoRn6qdoYrmmLBvi7pMQGOc/LTGCFvVsajdJHcBia3i/Mymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+6Z+RZdfDV70Rt43PlEP5YHjcvpEoPwyVNtpjotEnE=;
 b=Wn2ZzRcPNjLQtox65zSDmFmlcWeoPbFbQm0R7gw4dso2pjhza1oRjh79aIsH2b7L682OLoUumM4kyWk7tNJmeHYEH2lGPpauEv/4eyGoTr46IsPDOcdqrOgRIA6DJaLvg+T8teAa7qPepoTKZYTTSZJuarQWDJM+cgQwghC9ymLMFxDuM03r7GA/u63q1OljsZ/MADu2nFhHNS09T00tcICEOYip/weYSQaJvbev16yBtkRYmGk2Zd9brW13NKcCiwCiLe7aRLr9RTAh9ubJCbuwVqCVUvqDlNppm97wIZqWyVDAqWYrZELfURRmo8QojeXjpy5XgriaWJ/IZpQUJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 09:36:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 09:36:09 +0000
Date: Fri, 7 Feb 2025 18:42:45 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <20250207104245.GA14860@localhost.localdomain>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
 <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0185.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: 101a32ff-e8bd-49e9-be2e-08dd475ada45
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1pNWnZ5UnYwczE5UVRYakdNTmRyOVhBNnF1YjhrQXdQRVhKU1dwQkh1cnJm?=
 =?utf-8?B?bW1vbWZSeVlVakVBTXVuRkNLT013VUdjTFNxOXV3VjgzL1RwWWEvOWpxa1Q3?=
 =?utf-8?B?SC9WTm9ocHF2OVJidlFkSzVLTWI0MU5hUlpkakJJK0RlREFqalRuWVRVQ3A1?=
 =?utf-8?B?eFM2V09ldCtLdk4vMTRHU1JPbHBFbml5YVhtcjJtUHpYeUlsa2NZSnFKSTRF?=
 =?utf-8?B?YVpnbUpWVVpvZDh2N203Y2RFL0NiOEVBZ3FIblJGRGlYS2xQeHdhK3NsTEU3?=
 =?utf-8?B?UnBCL09LY0FpZEo0MlYxR3lOV0RDMzJCL0ZMenRwOEl5Y1FNMGV4ektvb3o2?=
 =?utf-8?B?YVE1RU1ackZCKzZyT0RwV0ZuSlVoZWkvcW1tbEUvMEgwd0hzdm95SUJqWkRu?=
 =?utf-8?B?cERCeVJFQ09qcTc0eEMxQ04zMmVUSGhrOXNzUFh3V2RQZ3MzODlEZEdra3ln?=
 =?utf-8?B?d2xaS0VDVE1tb0NwZkVabzFqV2crTjlxVmhIaC84N2VPdmtBNWhtbHlSNHlX?=
 =?utf-8?B?Um0xSmhXc25WblVkeWV0Q1hFZk9IYTNobkJveTJPSTJLZnJMTDlDRDZiQXRa?=
 =?utf-8?B?eG5VRTRLRGdNTm5YdEorS2JMN3dqc3Ixb0ZsQnV2ZXhrYlNrMjZ2Zm5HOXY5?=
 =?utf-8?B?Y3VBVU1iSDZjWldnZUJPdEN1dU1YYTlqSnRZbHZWNUE1TnB0bTNvMFZ0akds?=
 =?utf-8?B?OWdtMG9FSWVjNUJJVEUwV1U3Q0FlOW5yOCtpVFhPSFVVS1FZUlB6OU9PdnRl?=
 =?utf-8?B?dVo4d3JRWlFBNjdZOWhPTkhQazRwNytmc3ZjenZiUURHLzFTaXdsb1diSzlZ?=
 =?utf-8?B?eVpHaXFvYllMbzVoMk05R0xJKzNzeHFKd3UrbEdGeEdjbHdHNGwyVk15OEtV?=
 =?utf-8?B?amtSTXdXZEVFbjFFVy82aHJZaU5paTljQkdqclJxYThGZC9SanRRcmlYMG1a?=
 =?utf-8?B?bmpZaHRMQUZiRTMrRERlNlhqMUt0WVhrQmVFTFN5MjJnVGVZMGlUdDZJa1BJ?=
 =?utf-8?B?eXRDVklGcTFsK1dvbDBOOXh0ejdGNWhpb3pDVkdpb1c4cS9ORWpXbnVEUFZU?=
 =?utf-8?B?UXl6M2g0NGtxUi9TVFBhTWF4SU41bVNaNytxazhIbm9hMGFhNGxjT1ltck1F?=
 =?utf-8?B?ZlRJN1FVdVZ0QmNsSWJ0TWRmNXJ3azhWTHM0UTR2ZGUvcUY3ZENpbUNDbW9q?=
 =?utf-8?B?Mll5ZDZHakU2c0lpMHpveUt0MnlQSHAyS1lhaG13UGx2VjBqdi9KZG0wdjVH?=
 =?utf-8?B?ZDdQSUJQdlJWOW5RK1hFcjU3MkpyUWQ5d0x3d2U2dnc0dGhKcE9TK2RYckNy?=
 =?utf-8?B?WWJYdFBPcHpwVzRTSHZUTTlldU1FNkoyY0VVY3QxdUdLdGs3eE1UOUxLM3l6?=
 =?utf-8?B?VHpaMExPTnBRTWw3dmFzZ2ZLWU9CdTB4QUthZXJudTJDMUJwL1JrMVg1Z1Zv?=
 =?utf-8?B?N3d1dlBFSzNkdk5sb1JuOExnaThYS2ZPR3NuVWpOSWFWMFhjOUo3SnN5cDN0?=
 =?utf-8?B?SW96b0FnUDBodzJ1bm1CRmpNY3V4M0FVTmhWWkl0Wk56Wkl6Y1QrRGFWYjFp?=
 =?utf-8?B?R01IV0c1eGZydjVoUHdUakw2OEdNZ0JGUlFjcW8yOEdpZ0Q5L1U4T1VSZmsx?=
 =?utf-8?B?K3ZTWUF2TS9WUUFpMU53RjNURHdYWnFZdjM3VHNaTThIOU01V1d2UDF2Vk9S?=
 =?utf-8?B?dG9sYW92YlZnbG0zRnN2ZEtGZGlVQ1lKTzVQelQxMnl0bnFEbFd2RVJROHU0?=
 =?utf-8?B?dzhIdXdFbkNLNTFOZVlDVm1kZ2lPSHdJeGcvQ3pUeUFBM2pPajBiYk1yWGtI?=
 =?utf-8?B?TTVtRnBodDB1YmZxMmNENHc0VWZJNjVWOHhVcnhHZHdDVkRCaXhZbml0VkE3?=
 =?utf-8?B?UGViR3RNUnRrMngrT1FYUkdVODlmMXp0eWVjMitkNnZ4OWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXowcHFTYytXZFlCRlRXWkFDTDlaUC96TjVaVTNrVkk1L0luU29GSXlxeTJl?=
 =?utf-8?B?M1IzTnA1ZEhEczFnSWVpblo2RGkrYitjczlLeE1pd0NmSkx5RFlQWkxzN0JC?=
 =?utf-8?B?Wjg2T3dxN2dyQW5BTDJZY2srazI1Z21jZFk0REZ6RkpFWkxWMjU3NkRJVG5C?=
 =?utf-8?B?emw1THNHRFJjcC92ZC9UM1ovWS9XcFR6VXNlelFrckI3aXF1OC9DNVQzZG5W?=
 =?utf-8?B?L3lVQ25ObnRFdG5FWVlxYjJ5aU1KZ1E3dmFsNjFDYUN2MS8vZVhkNHh4bXlh?=
 =?utf-8?B?cUh5N0kxc0UvZGprNWFnTktpdWZVVU4xWk9zRVdJYUdqVit6OXl3YWVwaXRQ?=
 =?utf-8?B?ZHRBRWQ2Z3NjNGV3L2VkZHZxOFgzeUZQdjYwcGsvdWVoTlVjNm9lUnpOdkVB?=
 =?utf-8?B?bDh0K0pPRTZLem5TdEYwU09pZ2VBWHZUS1h6akc1aFkwU1paeHZIWDdUZ040?=
 =?utf-8?B?MTdaNnZtUVdYYy8yZ0VIcUVCN3Q3VUxmK3dsL1JwMmtFOGw1RXluOHllSEll?=
 =?utf-8?B?NzdaTnFLWUdndjZ6N3lRTzJJdUoySXB2a1gyRVhUaFFrdXc2VkZxVE9WTVRj?=
 =?utf-8?B?RGxzU0VJZU1qZnNjQTBvbUNhUDh3MndBRmtOZDcxc0JUNHhiUEx2TEp5VDlW?=
 =?utf-8?B?eFFnSkNuL09jM0d1MXZBOXJlQm44Mzc5TVExM3MyYmNyNk9RbUFETjVIVjFF?=
 =?utf-8?B?N2dGUDZBejhyVE5ZTkFjYnppMWpSN3FYVGZuR1R0R3ZyVTBWS1daREtXejI5?=
 =?utf-8?B?b2cyOXFJSEsvKzF3MG9oWm1OSVVyL3hUV1pXZmlMbi9tRmR4Mi9LcUtDR3Y0?=
 =?utf-8?B?NDYvVVhCY1dvVE5RUjdSQ3BXbENtY0pwMUJ1dW40QnRRR1pqZUwzRUpnNDg5?=
 =?utf-8?B?UFNYaHljUFd5NVhzb3FJbmxCNExHdVF0enVTYzFmTG0wdmErdTYwbFFuU2NV?=
 =?utf-8?B?SGQzYTY2UHVqYk85K1BVdUJCVmt3WmVzT2FMTVZiTk5nUkVoMTFLM3Z1OU13?=
 =?utf-8?B?ODFZa2lkaGhNOXhVdURJTEpheU9qYUcxTnZvZStwMFQ3YXZZVDljV2lFbWdX?=
 =?utf-8?B?VG1IcTh4d2Y3ZkhVeE5teDdQdnY2MS9OWldXMnV6ZzdHUDhsWlIrQ3ZIbGVW?=
 =?utf-8?B?Q0FEcTg4Y2g1dE03UUlMdXJpcStydStpQzNzZC9ycG1zbTlMSUs5eGZHd0F1?=
 =?utf-8?B?VVNhSTFGYVM1cTRBSURGMGltK2VSbEgzREl3R3RTME5kb2pGMWs1YTJTV0Np?=
 =?utf-8?B?RGJnNDhxK3ZvdG1mS1M4dVMxaG50S3BvM2Z6THFvVWZnK0xPRm1uM1kzaWlv?=
 =?utf-8?B?Unh4aFZiYTRob1g1UUNLWlkzUTFVQy9iYzRTRkRFcDVTRXRwN0pYMjQxL2lp?=
 =?utf-8?B?cVhEOVlCOE1wS3ZxUWprTGNvQy9mQVVvMlBMOThXdHdaZ21nakkzQjNGcWxl?=
 =?utf-8?B?KzdEVFB4encvWXRQME83NG96SlY2VmNXUmxya1c5UmY5UWgrbUd2RE9CQ3pH?=
 =?utf-8?B?Wm9ybTdSQi9wY3pQeUhxcjVDa3FLWUJPS090N1NxRHBDOFBmZG8wRFlTU1BQ?=
 =?utf-8?B?M0xrWmVaR3hNc2RVU09uOHJIMUN5b2d3NTBEMlUzOTVoNTljVmdPNDh2VHV5?=
 =?utf-8?B?TDJVb3ZWTW9UdDlNalZ2eFZXZFN2TWZBWFZxeEgvOVl4SzQzSmlnd29mMXJh?=
 =?utf-8?B?cG8reW90M3YraWcraDhXb1V4V09BVnpEM0Mvd2VFMXNGQnVYYmR6bWVKMmg2?=
 =?utf-8?B?NHBpYVBNTnR3aVlWeGY3MStKRGxqWmwwMUI1UVZWcFdLOTVFVHZnVXZ2QXlD?=
 =?utf-8?B?RVYwTTN3K1NnRFFMK0xYV0JBak1SNnlzT0VOLzZEcVFCU1l4SXJnaEhyM1JH?=
 =?utf-8?B?cGFDQ29ZbVdVQ3dwaVg1TmxiMUxOKytnTWNEd1ViR0tHVVNpVnJUazhkbEtu?=
 =?utf-8?B?ZG5pSURtTlcrSzNKQXA5eHpJdmVhK2Z3YzR3ZGRjbFBRSFB1U2tRT3NhSGlw?=
 =?utf-8?B?dCt2d043NzBCcGRrR1pCNU9LZTBlQXV5VDdvUUNLd0FzeGdsT0hsaEVQNW00?=
 =?utf-8?B?OWlDRzNFdUNPK1NYeUhWQnJXclREMmJlNXkybXA5TjRpM3ZIK0ZmVkZ3enBq?=
 =?utf-8?Q?J/CyyhamkwtU7/jtxC6btKZM7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101a32ff-e8bd-49e9-be2e-08dd475ada45
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:36:09.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ysC65khfyrn4XC99/KuW/Slwt3QL2zeKOugywEsjlrO5ApOrYus2KV3p4wH+0BiFodZ4mgNSEQDIRCfjQAnvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9498

Hi,

On Thu, Feb 06, 2025 at 04:31:46PM +0100, Dario Binacchi wrote:
>Hi Peng,
>
>On Thu, Feb 6, 2025 at 1:53 AM Peng Fan <peng.fan@nxp.com> wrote:
>>
>> > Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum
>> > clock generation
>> >
>> > Hi Peng,
>> >
>> > On Wed, Feb 5, 2025 at 10:51 AM Peng Fan (OSS)
>> > <peng.fan@oss.nxp.com> wrote:
>> > >
>> > > From: Peng Fan <peng.fan@nxp.com>
>> > >
>> > > Add support for spread spectrum clock (SSC) generation to the
>> > pll14xxx
>> > > driver.
>> > >
>> > > Co-developed-by: Dario Binacchi
>> > <dario.binacchi@amarulasolutions.com>
>> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >
>> > It doesn’t seem right to me.
>> > You can’t take 90% of my patch, where the SSC management was
>> > actually implemented, add 10%, and consider yourself the author of
>> > the patch.
>> > Please correct it in version 3.
>>
>> Ah. But if you look into the patches, 10% is not accurate
>> per lines I change.
>> you could see more changes compared with your patch
>> https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@amarulasolutions.com/.
>>
>> 1. Use set_spread_spectrm ops
>> 2. Use clk_spread_spectrum to replace imx_pll14xx_ssc
>> 3. Drop imx_clk_pll14xx_ssc_parse_dt and clk_pll14xx_ssc_mod_type. This one would
>>  count over 50% changes.
>>
>> The logic that I only did minor update is the function
>> clk_pll1443x_enable_ssc with switching to use clk_spread_sectrum
>
>Sorry if I miscounted the lines, but here we are not considering who
>actually implemented
>the algorithmic part of the SSC management and all the time spent
>testing the code on more
>than one platform/board with each submission of the series for all 9 versions.
>
>[1] https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@amarulasolutions.com/
>
>Your changes, which are unnecessary for the clk-scmi.c changes, only
>serve to support the
>DT binding `assigned-clock-sscs`, which, as Krzysztof also reiterated:
>
>https://github.com/devicetree-org/dt-schema/pull/154
>
>you should have proposed during the review of series [1]. You are the
>NXP reviewer.
>
>>
>> If you think it is not fair, I could drop this patch in V3 and leave it to you to handle.
>> I take this patch in the patchset, mainly to ease your work and make
>
>Sorry for quoting Krzysztof again, but:
>"Three months iMX8 patchsets, multiple reviews and no single comment
>from you till January!"


Sigh! I feel depressed, frustrated on such conclusion.

My previous reviewing work got ignored.

For the i.MX clk patches that changes dt-bindings. Only when the dt-binding
patches got R-b/A-b or not have big issues, I start to review the driver
changes.

So in your V1/V2, I not engage, because Krzysztof has major
comments on your bindings that needs big driver changes.

In you V3,
Krzysztof is still not happy with the binding part, so I start to propose
a potential solution to split anatop and ccm. This is in 2024 Nov-8th which is
two days just after you posted the patchset.

In your V4, you still have binding changes required from Krzysztof.
In your V6, after you got R-b/A-b from Krzysztof and addressed some
binding comments, I provided my R-b for some patches. This is in 2024 Dec-24th.

In your V8, you got my R-b for all the changes related to driver changes.
This is 2024 Jan-6th, which is 7 days after you posted the patchset.

In your V9, you added extra 5 patches. I not continue my reviewing for
the extra 5 patches.

>
>So please, if you really want to ease my work, then remove this patch
>from this series and resume
>reviewing series [1].

Krzysztof raised that "assigned-clock-sscs" makes the vendor properties
legacy, so I will not review the extra 5 patches unless the
'assigned-clock-sscs' stuff got rejected. Sorry.

I had similar situation that my access-controller v8 patch got a comment
that needs big changes. Complain does not make things good. This may not
be common, but it could suddenly jump in.

So please not blame me.

I will drop this patch in future version of this patchset.

Thanks,
Peng.

>
>Thanks and regards,
>Dario
>
>> assigned-clock-sscs moving forward, considering SCMI spec needs update
>> (clk-scmi.c changes will not land soon).
>>
>> Regards
>> Peng.
>>
>> >
>> > Thanks and regards,
>> > Dario
>> >
>> > > ---
>> > >  drivers/clk/imx/clk-pll14xx.c | 66
>> > > +++++++++++++++++++++++++++++++++++++++++++
>> > >  1 file changed, 66 insertions(+)
>> > >
>> > > diff --git a/drivers/clk/imx/clk-pll14xx.c
>> > > b/drivers/clk/imx/clk-pll14xx.c index
>> > >
>> > f290981ea13bdba3602af7aa44aaadfe0b78dcf9..3bdce762a9d651a6fb
>> > 048dcbf58d
>> > > b396af9d3aaf 100644
>> > > --- a/drivers/clk/imx/clk-pll14xx.c
>> > > +++ b/drivers/clk/imx/clk-pll14xx.c
>> > > @@ -20,6 +20,8 @@
>> > >  #define GNRL_CTL       0x0
>> > >  #define DIV_CTL0       0x4
>> > >  #define DIV_CTL1       0x8
>> > > +#define SSCG_CTRL      0xc
>> > > +
>> > >  #define LOCK_STATUS    BIT(31)
>> > >  #define LOCK_SEL_MASK  BIT(29)
>> > >  #define CLKE_MASK      BIT(11)
>> > > @@ -31,15 +33,26 @@
>> > >  #define KDIV_MASK      GENMASK(15, 0)
>> > >  #define KDIV_MIN       SHRT_MIN
>> > >  #define KDIV_MAX       SHRT_MAX
>> > > +#define SSCG_ENABLE    BIT(31)
>> > > +#define MFREQ_CTL_MASK GENMASK(19, 12) #define
>> > MRAT_CTL_MASK
>> > > +GENMASK(9, 4)
>> > > +#define SEL_PF_MASK    GENMASK(1, 0)
>> > >
>> > >  #define LOCK_TIMEOUT_US                10000
>> > >
>> > > +enum imx_pll14xx_ssc_mod_type {
>> > > +       IMX_PLL14XX_SSC_DOWN_SPREAD,
>> > > +       IMX_PLL14XX_SSC_UP_SPREAD,
>> > > +       IMX_PLL14XX_SSC_CENTER_SPREAD, };
>> > > +
>> > >  struct clk_pll14xx {
>> > >         struct clk_hw                   hw;
>> > >         void __iomem                    *base;
>> > >         enum imx_pll14xx_type           type;
>> > >         const struct imx_pll14xx_rate_table *rate_table;
>> > >         int rate_count;
>> > > +       struct clk_spread_spectrum      ssc_conf;
>> > >  };
>> > >
>> > >  #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
>> > > @@ -349,6 +362,42 @@ static int clk_pll1416x_set_rate(struct
>> > clk_hw *hw, unsigned long drate,
>> > >         return 0;
>> > >  }
>> > >
>> > > +static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned
>> > long parent_rate,
>> > > +                                   unsigned int pdiv, unsigned int
>> > > +mdiv) {
>> > > +       struct clk_pll14xx *pll = to_clk_pll14xx(hw);
>> > > +       struct clk_spread_spectrum *conf = &pll->ssc_conf;
>> > > +       u32 sscg_ctrl, mfr, mrr, mod_type;
>> > > +
>> > > +       sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
>> > > +       sscg_ctrl &=
>> > > +               ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK |
>> > > + SEL_PF_MASK);
>> > > +
>> > > +       mfr = parent_rate / (conf->modfreq * pdiv * (1 << 5));
>> > > +       mrr = ((conf->spreaddepth / 100) * mdiv * (1 << 6)) / (100 *
>> > > + mfr);
>> > > +
>> > > +       switch (conf->method) {
>> > > +       case CLK_SSC_CENTER_SPREAD:
>> > > +               mod_type = IMX_PLL14XX_SSC_CENTER_SPREAD;
>> > > +               break;
>> > > +       case CLK_SSC_UP_SPREAD:
>> > > +               mod_type = IMX_PLL14XX_SSC_UP_SPREAD;
>> > > +               break;
>> > > +       case CLK_SSC_DOWN_SPREAD:
>> > > +               mod_type = IMX_PLL14XX_SSC_DOWN_SPREAD;
>> > > +               break;
>> > > +       default:
>> > > +               mod_type = IMX_PLL14XX_SSC_DOWN_SPREAD;
>> > > +               break;
>> > > +       }
>> > > +
>> > > +       sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK,
>> > mfr) |
>> > > +               FIELD_PREP(MRAT_CTL_MASK, mrr) |
>> > > +               FIELD_PREP(SEL_PF_MASK, mod_type);
>> > > +
>> > > +       writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL); }
>> > > +
>> > >  static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long
>> > drate,
>> > >                                  unsigned long prate)  { @@ -370,6
>> > > +419,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw,
>> > unsigned long drate,
>> > >                 writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
>> > >                                pll->base + DIV_CTL1);
>> > >
>> > > +               if (pll->ssc_conf.enable)
>> > > +                       clk_pll1443x_enable_ssc(hw, prate, rate.pdiv,
>> > > + rate.mdiv);
>> > > +
>> > >                 return 0;
>> > >         }
>> > >
>> > > @@ -410,6 +462,9 @@ static int clk_pll1443x_set_rate(struct
>> > clk_hw *hw, unsigned long drate,
>> > >         gnrl_ctl &= ~BYPASS_MASK;
>> > >         writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>> > >
>> > > +       if (pll->ssc_conf.enable)
>> > > +               clk_pll1443x_enable_ssc(hw, prate, rate.pdiv,
>> > > + rate.mdiv);
>> > > +
>> > >         return 0;
>> > >  }
>> > >
>> > > @@ -465,6 +520,16 @@ static void clk_pll14xx_unprepare(struct
>> > clk_hw *hw)
>> > >         writel_relaxed(val, pll->base + GNRL_CTL);  }
>> > >
>> > > +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
>> > > +                                           struct clk_spread_spectrum
>> > > +*clk_ss) {
>> > > +       struct clk_pll14xx *pll = to_clk_pll14xx(hw);
>> > > +
>> > > +       memcpy(&pll->ssc_conf, clk_ss, sizeof(pll->ssc_conf));
>> > > +
>> > > +       return 0;
>> > > +}
>> > > +
>> > >  static const struct clk_ops clk_pll1416x_ops = {
>> > >         .prepare        = clk_pll14xx_prepare,
>> > >         .unprepare      = clk_pll14xx_unprepare,
>> > > @@ -485,6 +550,7 @@ static const struct clk_ops clk_pll1443x_ops
>> > = {
>> > >         .recalc_rate    = clk_pll14xx_recalc_rate,
>> > >         .round_rate     = clk_pll1443x_round_rate,
>> > >         .set_rate       = clk_pll1443x_set_rate,
>> > > +       .set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
>> > >  };
>> > >
>> > >  struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const
>> > char
>> > > *name,
>> > >
>> > > --
>> > > 2.37.1
>> > >
>> >
>> >
>> > --
>> >
>> > Dario Binacchi
>> >
>> > Senior Embedded Linux Developer
>> >
>> > dario.binacchi@amarulasolutions.com
>> >
>> > __________________________________
>> >
>> >
>> > Amarula Solutions SRL
>> >
>> > Via Le Canevare 30, 31100 Treviso, Veneto, IT
>> >
>> > T. +39 042 243 5310
>> > info@amarulasolutions.com
>> >
>> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2F
>> > www.amarulasolutions.com%2F&data=05%7C02%7Cpeng.fan%40nxp.
>> > com%7Cbeaf5bdcc6694a5a1a1708dd45d701db%7C686ea1d3bc2b4c6
>> > fa92cd99c5c301635%7C0%7C0%7C638743511953067272%7CUnkno
>> > wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
>> > wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C
>> > %7C%7C&sdata=UFgy1bS7QJ7qenzKFTkPBNfOGn0V89CGR9NLOBka0U
>> > 8%3D&reserved=0
>
>
>
>-- 
>
>Dario Binacchi
>
>Senior Embedded Linux Developer
>
>dario.binacchi@amarulasolutions.com
>
>__________________________________
>
>
>Amarula Solutions SRL
>
>Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
>T. +39 042 243 5310
>info@amarulasolutions.com
>
>www.amarulasolutions.com
