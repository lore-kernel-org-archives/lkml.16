Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012016.outbound.protection.outlook.com [52.101.71.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEA298CDA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889865; cv=fail; b=e7PXtVj+c5+Lakw4i/tf8kafCB8seOdf6o2J/aMYLRQb85Pu+RLi4LlGM4msVFmkKBA0O13EtzPW5f7YniqtFvDc/hD4vV3BYSJ8VrFmAikjtLtF/xLny++es91cHzTGkGwduxblOX6anqVFgMOY2jdKxBHZ7yTPzJ4CJNUwbH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889865; c=relaxed/simple;
	bh=YnmUGw1Y/jaA0w2KZTxjQSSqngvBMmO4tEJc4OhfRy4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BiMxPNzfoc6K+YYiTsF8HGLs9hx1Gr3sEOwps5fbz9ssKaHVC3L/b7WBLQ+yb9pSmgu6UVDfiq/hize7hyduYMi9wpD6783b08rJFG4ei7otY9DleZB9O2VYDcBYtgNccPT5RlvTRfzsJnccqCr6l/QzRD0MGJJTaMgzSwg810g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AkTVn+9+; arc=fail smtp.client-ip=52.101.71.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AkTVn+9+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w959T7Lz/qeAyeWhwXis+BBu7zkvS3XfYuEd21OIg8t9iCkyQWusy/ZI0AY+UXc9pA4J/dvF/W3w+OtBdBlKgOOeiMRA8q89n7vzUJYV+S5HZoRsee5XPpR+9gtWErrq37uDhMsuzJaNTsdSuyX6JhI6qFGPzSc8sE0JMc0Ii63jvT7v2UQUTw54NLxHSd7fgC/VQguQXwKgiv1UdjifKEDWZcMQlZqmSoCOCr5yivoKQ1o7xd3FbwaZVpOxUHcJCYSpJYHorUNWcjo1h0VEipSttdNDUb5ofOiHTnWfmbpQbKqfOmHDrxU8ON4zPI8HKlG8z87SchtO/upU4Nq5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1yx+Gsrmq8VZyYxgVKAlrmU2oziuLQ4xuGzrbSAbHE=;
 b=nuBRUSHnOcFaFj0dqAP7Cg1lEtTXnHA75U7AqORnIAwSPXnNt3X706uN4gs6AkpCi0dvAUhZgsuNpxFjD/9RZEXLDVltt/An0uf+UmREcrZ2W7Sz+i6kY7UPPEF/vqLwe2BihJu23eI0cr2f9aOYadMFrEjRR6sCh7Pasvt9dzfZdDej+L2Hp4FODYkIHJeiq9Rg7KzGt0vTXJ2eYI46t07+p2lI9rRN0ml6s1MX+cPd46W3NvO8Rhlp3E5+ey+Cy0YOR6iBzVMIRDPYzYunR1+tAbMykudTYaBB96kPEUsal1NtEWwRad6LdEs2QdKcQNB6uXukXWDkRVF8DuulAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1yx+Gsrmq8VZyYxgVKAlrmU2oziuLQ4xuGzrbSAbHE=;
 b=AkTVn+9+qGjM0uslpoz8+dCQGzCd0EPng00b1Ju3/GikrjQrazJ1MRdzkpoudolvYELTpwY/Wlk26bokrTuPRGg7bS3OI2KTMZfrSNmw4HQGsQK3ZwIM5538QjYiRTGEg5QDMoI8d987UwNHdNSPT6EC2XmZXTUA3FEK3/r8+taPPmZqPxfL1mIMxhpJrnXN3o8frtlyaO1wfIDvoSN5/D2YdnE3TQm8iMYRmnsWwiKvpixqQ6whP2iKZ5O/VZ20Oymz5b9Ud7T4L2V6t5wPng55WEDO/GgkDceNHiF5RgeMH30ZBdzctu1ch6VxFTG9L+0fCZZCNzTxYtR21gjYKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:04:21 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:04:21 +0000
Message-ID: <77f52835-ab0e-4b93-8c08-b2bc72a99cb2@oss.nxp.com>
Date: Mon, 7 Jul 2025 15:04:18 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] clocksource/drivers/vf_pit: Set the scene for
 multiple timers
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-3-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::15) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|AS8PR04MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7da52b-f22d-462d-79b6-08ddbd4e681f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTVkN1Mzd2Y5NnAyTE5KK3p6c1RlclFHU2k5ajBJbEpwRVAwSG9jbDZXTi9P?=
 =?utf-8?B?V1dNVGxKa21nTGovL2J1WEdoSkNuVnRxbVc4ODFqejZKS25uSldvOXZvVTRI?=
 =?utf-8?B?RkVXT3hpc3BCU28wbGQzaFlIVEU5YWVOb3JZWmVuTDk0Znl4WUZRcVg0VFlD?=
 =?utf-8?B?Vkc4THF4N2dOYldoZm5Kd1pDV2oyVlVIRm9FbFV5Rmtzaklpdnd2eW4xdUJD?=
 =?utf-8?B?QWZ5TkMzajNVeGhPY3J4bC9GRE1Xa3BzUGgxdjB1SzJaRFBzT3hJVzVIdXFY?=
 =?utf-8?B?TmFBdkFIQkI1ZGMwL1IrTkZBZzNQSTNDRmdnSitjYkloK2ZXUDk0VXpaZHdq?=
 =?utf-8?B?UHVMSlVqdTdINUVKamJPSnpGem9ESytHSlJMWERmWDUzcEVXSjZnRU5SRFcr?=
 =?utf-8?B?Mm1BNThYbDUrOEVKQklENk9ScXl5RTQ2Ty9IVUhteVZLbDk1LzVZd3ZmVWdt?=
 =?utf-8?B?VERGdFJlRHJKeHBTaGNNT2Q1cXdBeGxENUIyRWQ1OWRzVzJrUzVoc1JMQm5m?=
 =?utf-8?B?bkhQTFl5WHd6UlJZcFF6d244YStRNzlGWVM2YlB3dkNPZ2lxZ1d1TlFhWk5x?=
 =?utf-8?B?WlAyRUxqUjZ2em1sZXVFTmswSXBIV1hUaFVxeEVtczlBT1JQTGlIVHFDVWpB?=
 =?utf-8?B?OSs1Q3pOcUxzVW93M251d1YzVzdYemN6YktxQWp4UWtkcFhyQXVhMERIbE5S?=
 =?utf-8?B?WVd0Z3pVWUQxM3BsWDU4RWIycEU1NmFFdzc3eTYyWnNqVkF0RlBJOStzdTNt?=
 =?utf-8?B?enU1UGpteWp6YlJEbmM5Y0IxU3ZWc0RuWGkwOE53ano3RWVBV3JRN0ViQURx?=
 =?utf-8?B?RWVvTHpOK1FPT0hIRi9hRk5DNjNrVENiZTZhZzRyeGtiaEl2b2gxU2kwWG5v?=
 =?utf-8?B?d2pJZER3OHJ4cEVqWW54bE03b2NOSFhhLzJrUHVBaVBoVkpKRjVJekQrdmtU?=
 =?utf-8?B?ZHRJODhtN3hHKzJ1Q3czZkZXSmdGRmRvb2dVM1JTU1BkaHpsZ0txYkRpaU1W?=
 =?utf-8?B?V2lvd3BBbFhxL3FhU2JJT1BSeC9YaEdCVlc5cUdmcFFwVHZNWE9oZkhyYjMv?=
 =?utf-8?B?R3p3UE1VQ0F0WG5sRUhRSHJXdkVmdW9OUzY3N21yUUl5bTVxNTdJcVQzd2pR?=
 =?utf-8?B?WU1qaXVRM3JxTFpNSk5wcU1wenc2dWVzWDZSY0dMc0lIbWtVejdSU2h2YUlM?=
 =?utf-8?B?Rk1Rank2R3lMaEpxYU9FUU1OSWhUL2ZuUlQraXpMOFVkS0lPaUFqOFJCdTJH?=
 =?utf-8?B?d0k5OURKVEVTQ1RVcnZjYW1IVHEreXd4WjBVZnZVTmt1ekNMYWk2NEN4bUMz?=
 =?utf-8?B?NnZCdkpNN1E3a3hYMVJJSXhLZlFhMUE5WlFhbnZJSnd3Y2RnSlFpclBqMmwv?=
 =?utf-8?B?MWJ1ck4rNitVekc4R2ZzYUFiNVlqNnNlbmUzdEVxbHY1ZWxvM21MaVlPK2Z5?=
 =?utf-8?B?OXJtY0svQm51K05jbjAwanFBSXZsNWl3MGM1d2lpL1VRd3E2NGtXY2w4S1lK?=
 =?utf-8?B?MDlTdTd2VnNBYVhXbksvQVdUQU10S284dENZc1NDU0NwelQvUm92RUpHV2xP?=
 =?utf-8?B?cWVVQlIrNDdoVUpsQUc3YmZ0REpVUHllOTJtY1pGQ21wb1UyNVBwWTJyMks2?=
 =?utf-8?B?ODBkUUVDbXBOdEYvb0dtVTQ1bVB5UEZTNEJuWFlRZUxvR3AxblU1WWNZTjlm?=
 =?utf-8?B?eTRvUkF1SG9tYTJXRFM5bTNZQ1hUNTZkOC9aOWMwT2c0aGdONU8va29lcE5W?=
 =?utf-8?B?Q29aZk93dXVRZjhWMk85ZEt0UTNpdU9VL3ppM0M5RU5jUU8veUx0VUZrd3VT?=
 =?utf-8?B?WVNDaDh1OGp6MWx3MC9kcEUyN1lSMzN4SGFJU3ZLWGxkMXhuenF5QngrN2hh?=
 =?utf-8?B?S0J0L2hEVndWVmp0cjhja2Q2NlB5S1dua3JncGE0RUh0SGJKSVFCaVo1R0xH?=
 =?utf-8?Q?jqa352AYx64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1sTXoyZ3R4SmtrVEo4S29KQnpOZ2tLQ2V1WmJzdC9xbUVjQStINWovZ0hi?=
 =?utf-8?B?elh5VnpHWmExdXg5ZEc3eG9VWlR2ZXh2TEdUR0ZNYmVDblN5ai9SM2hyU0dr?=
 =?utf-8?B?ZWhYTGVBY0hvSXFnbWRiMWlzTDRwN1VmQ2hQSDRTOTNzWE1mdjF3QmdFMTY5?=
 =?utf-8?B?M0wxNndqOEJyd2JmeWdnbGx5MnRoWEVIQ3N5ZVZld0JJSmdEYXd2YTJmemp5?=
 =?utf-8?B?RWZoYVpHMUkrVTlUeXpQRm04N0tBMVpXU1AwbnNmc1JyTlNKWUhtSkdIaTRl?=
 =?utf-8?B?ZXJJZFZsd0MrcDhEZzllcVpTd2pVRFFUODlsaHNYbjJINForOFRJdXBvV2VW?=
 =?utf-8?B?NFlVSkFzMlYzSWxYVmpJVGc5eDRVMVZSazljaWp4dkp4M0pqZHBQMk55TFdV?=
 =?utf-8?B?dFp1eEx1dENpUEZnWjRURXBiV1B0ekY3TjcxMkhXT05DSVloclFyNHA5cUVY?=
 =?utf-8?B?SjgwcTc2MzdsWlVaUk5PNFRVQlFGTGJJV21XLzBFdEZ1WXh4ODAydzduclBB?=
 =?utf-8?B?L2lYQStUV0NrY2lqWnk5cXIwZlJXVmZ6NGFWTnBsMWR0M3B0QjZ1K3hJdy9Y?=
 =?utf-8?B?Y2lPcGZwRmxVWjMxRDMzYWpybkI3aGt1dlUwNmpQT1VDdEN3UDVGa25HNkJl?=
 =?utf-8?B?ejZhM3cvTTgzNHFkZWR0OEdKajJ5UjRYMGYwc21IK1RGQzRvVmxxcE5INUsy?=
 =?utf-8?B?UTEzbmxUZmJrMVV0dDk5SlpPc3poS3JIR2FlWmtsVEZWT0VsaUt4S0xIcTBt?=
 =?utf-8?B?eWZSS3BKeUt5QVlLOGt4eHB0L3ZPaWFxQzF1b0JXb1JxM0dNMXJSV1cweHVK?=
 =?utf-8?B?QndDL3BLcGhBdHEvOEMrcDU5dHRuRzUwN3kxcWlyY3pjdFdQcmpLQXI4czNI?=
 =?utf-8?B?TXZCcy9OOVJhMnJReXBJaUhGWnlKZGJOZlBHZTYyNklWUHRMblQ1RElMck0r?=
 =?utf-8?B?N0ljeWpBWUp6aDV3eFRaeTArVEpuYUhYeXZySUd3WC9pR3E1TEg4bEtXUzJU?=
 =?utf-8?B?SjZocU9ucStUcjUzOXRxYUNUNVJMblpmNFhhdDdnaWNBbVNBakt1MTRxb3Zu?=
 =?utf-8?B?bjNhTUlNOGU3UTBIcDVybkJERFRZSCtjSGFna01WTDdzNDNGdzM4bTlFMHVO?=
 =?utf-8?B?L1hZS2VEMnRuRUcrSDVOSHFwRGdFNzVKQWZFTlNLaTV0ZVl0bGVzMnI4K3dn?=
 =?utf-8?B?QytoWVFvZHlSa2U1YmhRUlpNUXFZSGR1NnZxS1lNVHVmSW1WNEU0WkdwZE1G?=
 =?utf-8?B?Q2lyL2NSNldmWldRc0h0bG9DYjVFOGJ1ckVHUVBuTSt5aXVaL1A0cGlVQnZx?=
 =?utf-8?B?S1JCb3BnaXdjWmhsS3VDUytCMys3QU83QnVheXdVVW1PVU9vdWJ0cHJZamNy?=
 =?utf-8?B?cmNSQkpWU0RUN2xZZEowall4QmhqQVEwOThlS2FzU0NSMC9VVnR1a0R3a1VN?=
 =?utf-8?B?QmwrQWdXNHE1U2xaZDVjQk4rTlpDNnZJS1UzZzFSSDBEQW9OaTRETnZZY2d2?=
 =?utf-8?B?Y0taS2VhSGRsbHJCNjlyRXYzcHB5WDlJY2Vya0lGbEVkbWNxUGEvd3NKTkR2?=
 =?utf-8?B?Zm1wcW1rcGRqMmt0TDE3aXlQeG5VQnVXdkF1T1k5bU5QakxsQUsrUEI4V1Uv?=
 =?utf-8?B?VVMva3BQS0xsZ1NQRk0zcWIrNXBkOHYwRXJhWEhuM3pQSGJONHJMeEZncTdo?=
 =?utf-8?B?ZThhTWc0MDgxSHNSTnZrbmhpS1VVZmxTdkgrUXF0ajNvbEs1L01yNXNoenJR?=
 =?utf-8?B?K3dxZFBCMDdCQ1JTbVVDK0pFL2dTeGlYTVZDMlRQaHc5bVVMRFlxTEl3STVh?=
 =?utf-8?B?R3ltOW9EK0J1b2QvbS93MmJrMU1Oa3dpR1BTUjZOQWhtUzQzUXdWQll2VGky?=
 =?utf-8?B?RGVCdVVrK3RYcFZHakZuZlFqRWVrTVBWTmhpZEJuZStzOUhnMEUwckdxbGY4?=
 =?utf-8?B?bW1CeEY4WUE3bzhob1ZISVVVVWRvK2crMnhrcXNyemFSb1pjQ1F3dUVsR013?=
 =?utf-8?B?TDVlT3dObitPMTN2VXVUTzFpQm1UOG9sM2hEZHRab1lEVnpxaEFDbnVqcHVm?=
 =?utf-8?B?MjdENDFpclZ6RDE5TDFwRWxiZFNPRUtzQ3FyeC9Yc2lYTnVFVmJHRlNCdVpo?=
 =?utf-8?B?ZTZ1Qmh2Z0tuWklmdFJva0cxa1k3b3lBNlZ2MzRidHZMZm4vODFhY3pQYVlS?=
 =?utf-8?Q?e8hpieu9nvpWEu3mQZCoXJI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7da52b-f22d-462d-79b6-08ddbd4e681f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:04:20.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjS+eMartydDt65qkd4i8AjL2dowNaA4C468wNfa8xLQVZnLT+xZcDMNkOetZoi0W/PNxAZpag1XyzV46q8pWc6YBGsVyszR7PCiEHDy40Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
> The driver is implemented as using a single timer and a single
> clocksource. In order to take advantage of the multiple timers
> supported in the PIT hardware and introduce different setup for a new
> platform, let's encapsulate the data into a structure and pass this
> structure around in the function parameter. The structure will be a
> per timer instanciation in the next changes.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/clocksource/timer-vf-pit.c | 119 +++++++++++++++++------------
>  1 file changed, 70 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
> index 8041a8f62d1f..581b46e7b111 100644
> --- a/drivers/clocksource/timer-vf-pit.c
> +++ b/drivers/clocksource/timer-vf-pit.c
> @@ -15,7 +15,7 @@
>   */
>  #define PITMCR		0x00
>  #define PIT0_OFFSET	0x100
> -#define PITn_OFFSET(n)	(PIT0_OFFSET + 0x10 * (n))
> +#define PIT_CH(n)       (PIT0_OFFSET + 0x10 * (n))
>  #define PITLDVAL	0x00
>  #define PITCVAL		0x04
>  #define PITTCTRL	0x08

While not directly part of this change, the description above this patch states: 'Each PIT takes 0x10 bytes of register space.' In my view, this is somewhat misleading, as the reference manual refers to them as channels rather than separate PIT instances.

-- 
Regards,
Ghennadi
