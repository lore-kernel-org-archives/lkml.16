Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B75191F98
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889841; cv=fail; b=YJ7N/6T/ZzuVZXwlSgjXj0GzuuZm7KOFjicI1QF3z0bIsfwj8TaFe5BPweGTS7yxDhmWIKNgI5Sh/UMpI2+fkhlu76X9w23Mw+Gge+F6yMSxdMUt3STYa9XYX1UTbdwLL7ijLZxrCSkwliP1IOM/hsJRdkTetQra6R1Vhe0vhtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889841; c=relaxed/simple;
	bh=Li2SMpiDO/Y58dmXwQc8CNSqQCh9e2/TN8dt/viaDiM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oZr7g4p/P5+1pijxfNh/4sFfNOG3vzMpXWWDodts8P2h6plyPTkRC9zUrNlXhHkB7QnZqwtC/mrUSSE/y+Zkoo4wAhUWi7dsjU/crbJO4vPyyy+fy/bfDQOWHJhAbowAJDX5SmmubAQgYJDI0s/uF894/iWSHFvsCI23Xjdv0U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pJimaJn/; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pJimaJn/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7U66SWErTMGvuKKyEJjGJLZCXBWlmXMERKEVys65NLuyagLNrFcRUbrE07mgkHpvKp6SBEaxvPtiWx1jV+Wa8gSBpUqIYOj4i4yb/+R0ixQJ1lyR3AJY0f55nb2+59xeHNiPrn3oHB+L9zvxJSbkj3+7CThO+OL0l7EW9+uHvY5vaZamkfyadaDJDSnfgClP5cQfo3TKcMV6FmKkqxWWQFkGEVbW5d/ksTUarVN2u3EfSWltxSrjnZ1+27JgvOCKU91+xvOt3y8PTq+iezgplIJBktK6F1Aq/8jmBP5o2lOmMTd0t8C0y0erhfz7KFG81Yxc1kigiAwJ1MDF4TI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2RlHxbp/E5FZ+vg8X3Ds8UDSz5ZskC50WDuOrJ7anE=;
 b=G6UGcnmS693oi115cEOE1PuEIZdni8lDQwTJq/wE/+Z03y1yJZuQr5O7pwEmHRVzhAD1uyWScpRRzNCvVnQ+6vzLjkb+50LjuVPRXvIc+v7X04/MzqjCKAygt9QmPosM7/cLX6fRmz9Aw6Udozw6+rhuhIFr4SMrFQLxj34yLeX0kW2SfHP3v+GiXKO5KWV8Z2PWwVA9E17N8R9RKEg1sXdOkOyHm0OGDzBI6aubs3TAr5IDNNjFTsmClOWp5ogrCs18IDO6sddTMrhICBsOmKNtkTU4ngkUjJWkKpPbYbM4aYMyRMw4E2CnuUN+l+/0Yf4Tus0TXpxae/xUS6Sx7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2RlHxbp/E5FZ+vg8X3Ds8UDSz5ZskC50WDuOrJ7anE=;
 b=pJimaJn/0aqYxdLMyp3kJCaZj1kIJcMUVbEXC7ROz6VB8VoGMATCqbBhs1yFrguxLC1+RAk7WB+KVTLo6KklzCeYZSaSPe3jCgv0HGmhHA9NMsP22XtgONz/x2yhE6bDa/DHZq7CQHx+le3Jj9haQOxuUWm7mDtQEJeT/amTNAY0H8dYj0tN5dz6Gux3bJyaPL2+mmzuguLm+rIdgt7rpfGRud+/Imih6Ta/acvhFy2boIWU+xC7dM2uinzdDx4FQ2t/CxvO4j2BKvFPkcUfHPZCl9wXQo653vdNWtlUBmcGcoDgaYVQ9om4GTtCv/OMmmbsTZImllo1yo5jl38r9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:03:55 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:03:55 +0000
Message-ID: <6b478a82-5087-44b6-b2e6-acb494fe1e22@oss.nxp.com>
Date: Mon, 7 Jul 2025 15:03:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] clocksource/drivers/vf_pit: Rework the base address
 usage
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-4-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-4-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To DU2PR04MB8582.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d95b0473-1dd3-46a5-5572-08ddbd4e5918
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWVXVklGb2F4eFpNY1c5STIyQitlZmFQeUg1VjJSU2YzTW8zeTUwaUJFV0l5?=
 =?utf-8?B?OVpwZCtzTWd6cUNGdytwZUl1ZW9ET0QzaEZvSXdZWXlnVmEzaGFUSmhiQVJ5?=
 =?utf-8?B?ZDNmTStoQTg1WmptTWQ4UlFUdWZPc0E4WkFyNnFsbXFUUWNYRmZ2RGZsYmFZ?=
 =?utf-8?B?dXVkUUVDL1lXb2RLZHN6dDhaSjh0c09yWjk2RUczYnVJVXR3VzE0OUNHNTRm?=
 =?utf-8?B?d0F1cnVyaXpHYUc3V3dvZVlKQW9Ta0FDWkxLWS9QUDIvSWtlbURjbU5OSUVT?=
 =?utf-8?B?Y2xDMHZZUlNMZmdmbm9uU0RCZTRIMTg1dmZ1UXE0S0ZrSFFCRmxyWUVlb0NR?=
 =?utf-8?B?bTkySWNKTkhDR25ZWTJlR0xHWnhUWXg4RjFEN3RIamJHZ2EwTzc3V0V2RzZQ?=
 =?utf-8?B?QkZkUC9mdFhCWVdhOFhYUHFML0ZtRUZ0a3Q3ZHJFNk0vOHlSaWtMZmR3ZEpw?=
 =?utf-8?B?YTUzVHJEZkZtVzBncnNzWnNISFFWejNPWEwydGFmc2FkbVNmQVBlYjRRZ3FR?=
 =?utf-8?B?RXIyYWFXQWVwZ0FoUjBlbklDUGt6T1VwVS8wUm1VT05uWUxHWFRrRDFWZXVs?=
 =?utf-8?B?ZXBwdUsvbzJpeWp4cE1QVlZYUnA2TlYweTJHc0s4TWlpTDZZQWwwTjJ6cXU4?=
 =?utf-8?B?ZlhlTHd5TmM0aHlqQWlMeG45WlZoMzlGQ3FxSzB2QmtXd2tpb1lsaVY0cDlG?=
 =?utf-8?B?U2Fwa2lzYklqUXljZW1wZDlZdFZxbnZLNGI5am1jSis3SlEvM0NneWxnSURH?=
 =?utf-8?B?NWg1TlA1cjNRaWVrc3pCNG5ZdTViZm5XUER0Q0pJUzB1ZC9qeTJGYWE3Lzhy?=
 =?utf-8?B?UitKaEFISEZqbTROQWdaL2d6SjlRSnF1SHl6SXF0RWlQU1djVkx3dGI5Z0NU?=
 =?utf-8?B?YmxzMjNRaklKYVRxS0pjTm1ZdEFRNXRSR2VkY0gzZmFUOE1FU0ZocnJKK0hV?=
 =?utf-8?B?cVF3T1NvazI1aWpXR05ueXFqOE5RZThTbm9hd2Q1M3F6RW9nVkpHVlhtaGNW?=
 =?utf-8?B?NW8zNktEaWZCUVBwT3NodHV3RHFZTnBiY1EycXFLcVBQN1ZkSG5OODFUNUtD?=
 =?utf-8?B?TFJBVFlZTWtPbWwvQ2pjb2pvTFVVczdmMElaMHloVUdKU2Z1U1JIM2FCOHE0?=
 =?utf-8?B?emFNcjFmeTcwZEZLN2pUQm9iaWZIL3pqRUJVc3pIRHB3MmcrL1RyQ3c5L1Nw?=
 =?utf-8?B?cVJYSlFlV3NTenMyZ0xkRGVYOXZUZGpiaDNwQ2dadStqaVZuSDZLdUhzaklF?=
 =?utf-8?B?MW9pUzlwZ2FJeWVaL0NHb2o3VGpVQ0MvK1g5c1ZjMDJrSERiVUh1UEJpVXF5?=
 =?utf-8?B?bks4T3hOdlMxTnVqZm1yOTNpOFZKVEYzUWYySUtLRllNYm9NZEpFdE9ZUldJ?=
 =?utf-8?B?dTRTQ3N0a3grYUNqZmlSZXYyblA3NkxGdytHYzAyVWFpWDE1S3R1U2Erb0cw?=
 =?utf-8?B?U0VTRHlwWjcySXRXQmQ4Q3VNekF2NWx4QS82WkVsY3YwWEN0N1J3RTRjUUhT?=
 =?utf-8?B?V1Q4cWQwbjlNS1ZKbFpEQVdOVVJNeC9FaitUK2V2R2dSSThFZ2xBZjBLcnFT?=
 =?utf-8?B?VEhEa0lJRENpNWxjQ3VWb2VOUVpHQTg4TFJ6SDEyODBoOHl1MnNUMWM0MENu?=
 =?utf-8?B?SG5QWVZrdWQ4RVpVV0FQRUpqOU5EaStpd1p0RmNtZk40R2p2MThZT3AzYjlU?=
 =?utf-8?B?c0p3RlF5R3RjR1BEbHRiQjZCYXpvNjFkc2tDbUpreEFscmZ6U0d2TmYyZjQr?=
 =?utf-8?B?c05RcjRENVA4OC9MZVBHOFI1djE4TmNHN2RHbEZUcjJubEtnU3R5aTZLa25y?=
 =?utf-8?B?eFVTUXRKQVlaZ2Q1YU1JOEU3YUtRWVdsT3l5dzdWWmVCQW9ETERlNDNLVnlP?=
 =?utf-8?B?Q203eWpnU1dPU3JXeEc1SEJXSlhQVGZPbGczNlJOcDZNbDNvdncxOGxpcVdx?=
 =?utf-8?Q?AvkOCA5HUbY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk4xWkxmUVRVcGlHdFdmZEFEQmNWQU5LTSs1VzhSNWRtZC9xblBOZDNpNU11?=
 =?utf-8?B?ZjBBVlFJQXNjdjR1QVlpTDBDRDllTm1jajQxTXpKSDh1V0NWVkpZazVaaENT?=
 =?utf-8?B?eWpwZmRkQWhPVjhrMWI4MDV6ZHRnOEJBQjdQUkRnOG4rcTBqd2dNQzZkaDgr?=
 =?utf-8?B?K2RIZGJjc2hueElnNHdPdlJXSHZDUGJ5SHJLS3UxU3ZJaERWQkhvM0h3WjZH?=
 =?utf-8?B?MXMwd1g3UGVsZVJtNVY0cnZ6MnFtZWZnMGkyT0dWWndUYTJiYndyVnFWQTBM?=
 =?utf-8?B?L1N1c1hhSERtMFRrWlZEUXZNUGRnTi9mdjA2bkhlMDN1WHAwMEVJN2N0aGVT?=
 =?utf-8?B?cFRNd0RHVTVHZ09TaTRVMDEvYkkwWWUyZ0tXZE5YQ0l5YzFlOWxKWE5yc2VL?=
 =?utf-8?B?ZEhraS9kUmh1cjZLcmJEK1BGZlJFVG1BUzNTY0Fab2dyZXdUTllORGVjN2Nz?=
 =?utf-8?B?Y0FEcitxS3JocVd2UU92WWZRUVR4REhPQUx1RXFVMXlIdWpWSUNwL1FpNWNs?=
 =?utf-8?B?dFFtNy9Ka3JFK1hUMmVGODdzRkxsV1J2VmdidXBFdHZMR2VqUTZzYUhYc3pX?=
 =?utf-8?B?RGNJV1dvWkNlTjBiTXA2WmQrd0pWakRQOThCUzRjbmJsQVNjSmxBR2JDYXlq?=
 =?utf-8?B?UVNZbzNLZXlJRkFEaTFKMElUUWdNUXdvdlVRVnNoSEtmcEVoZ0RndXh0c1VW?=
 =?utf-8?B?V2VIRElHTW1yVXpVeDNGSE9iUXlPcUpXM0VoejNwUUt0MG80aENpcXMyVUhL?=
 =?utf-8?B?NU8wZmgwZXFwRXhlY0lyQWNPeko1d25CNEo2MTZVaGx2YU9sMFlrYjhvQzNi?=
 =?utf-8?B?Y05HVk1KaHlIbVR0anJQSDgweUx4Q2EyUEdGWkl1dEhNRlBmeXcvU0NDeUEx?=
 =?utf-8?B?UjlDb3QxVjFNWUFBRVZybkh4bzZBWmNmd01xS1ByYlJmRHRKcm5Ha0NrQndD?=
 =?utf-8?B?REJYVEhZYjB4TlVLemN4RytGaVNZWnU3WHdOVlp1Wml5am9nbS9KV1lOdnpI?=
 =?utf-8?B?cUErVko2dnJNMTIwMi91b3BiUjUvRXJ0V08rZTlrSS93dG1hSzFTMU9QUUJR?=
 =?utf-8?B?cGhGQklmM05QR3AwN3pCQVpWK3dFdFdtQ1V0TmVuVDBSUnZWRm9uaEw3TFhL?=
 =?utf-8?B?RUtDNDF5c3pJeXMzUVE0QjgrcDMveTU0dktob2tqd2EwUDdtRmRiK0tOMXJD?=
 =?utf-8?B?Kzl5VVZ3bzdoRWZEYzZERE1JTWJhUzFYZEVEU2p0NUxuaDhHQ2dtdHZFTEd4?=
 =?utf-8?B?SnlYaVZwVGdyUEp4bVhIMXoxQzdFU2tkZjdJRnI2OVJYVk1DRkZOZTNhSzFF?=
 =?utf-8?B?ekdDWFAydjdJY3AxNmpzQ2FNZjdhaXN5Q2p0azFTdGZkb0xYQjZCQlBiQnFX?=
 =?utf-8?B?SG9sQ0tGYWRFZW5nNllkYURQN3Z3MmJ1WWpENXJiTVE0TzFjRnlwdUJJQjJi?=
 =?utf-8?B?VGZSVHZ2NEVLbnhTUmI2ZlVKcGloZXViNkJCWFNZTUMrQVRIMnpSS2Z3N2xo?=
 =?utf-8?B?UEg3b0RRaUxKeitadUp6QjRaazQvS0JuZEFOZEdnTjhyTG5hUlVSemxieEY1?=
 =?utf-8?B?ajVKMk9PT0xwRDduRUtnOGUvRjZGM0xUc3Bac2owVS9PcUhIK085a1pQTytj?=
 =?utf-8?B?ajM2N3puQWVXQkMyeElsaFgzZjFlOHZqcmlqTWN6Ry8ycUlmMXNQWlpudHlq?=
 =?utf-8?B?eVVNVGd2Ym1sMFdlcU9iNXprU3NXeVo5b3ErQ2xjM0dEV2JVblVrT05HZVVU?=
 =?utf-8?B?SlZidTNCdGg0SmFLUDJVN2RKV3V0T2hhNWxSNE1NREJHemVVNjBvcjNUYVRY?=
 =?utf-8?B?SWNBMkpQbitUQmd4N0ZUWlFNMTk3SkE4bm9WNDlnTUFKNGk5ZVhOUnQwTzVp?=
 =?utf-8?B?bk1JWjJSSUVnRDAyTWlMSWwvMmJWM3pReXVBcVFXUGNuR1VOWVh6NWh1VzJX?=
 =?utf-8?B?Qkg0QVlHZVlqVUY4R2ZhSDlNVmRUc09VZ0RkN2tWQlRPVC9ETW85Qmp5bTlv?=
 =?utf-8?B?MkQzb3JGbUJRS0NhRGRoN3VOaWhqTFVpbmtlekNjV3lzVzJqUHF4Q29kbnVa?=
 =?utf-8?B?c1JtNE8rSXc5b0g4d2wrZmlSemZmS0lnL3dHSnpTenNjVU1QQ21YWU5IRUl1?=
 =?utf-8?B?NU1aajllZjB0L20xRmx6eTJNWll2eU1ULzVlVXpPZmhJblU4RG9JeUttS1Iy?=
 =?utf-8?Q?NY88bTwxib2MOUB1HLDQAfc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95b0473-1dd3-46a5-5572-08ddbd4e5918
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:03:55.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVXD2aJvLcVa0zC+4W//GeqEh6wZlt84kWxBaHI7UTl8/DvEDTq7gVds0o9lkGv0PoGTF02VcM27X6U/fzE7WbEf2XuHBA/qnDdMqhsTeno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
[...]

> -static int __init pit_clockevent_init(struct pit_timer *pit, unsigned long rate, int irq)
> +static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
> +				      unsigned long rate, int irq)
>  {
> +	/*
> +	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
> +	 * choose PIT3 as clockevent and leave PIT0 and PIT1 unused
> +	 * for anyone else who needs them.
> +	 */
> +	pit->clkevt_base = base + PIT_CH(3);
> +

This description is somewhat misleading, as it refers to PIT instances, whereas the code actually operates on PIT channels 0 and 1.

-- 
Regards,
Ghennadi
