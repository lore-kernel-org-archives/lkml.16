Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3D1A9B24
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880802; cv=fail; b=SNZztDHvuaTRBf+GDxPoWUF3BNsujWsHlBH983Y9zHE6Y1qbKAxVGdSZjFSP2tKneOi6sJlku7/s1UYDfYNMOI7CjVW+rGaa7xg9Gd8Cl5Mh7eXh11JQJ8rTh+auV/oBOTH74UNgHvvxFiVCqXsrtJtXT9h/gCavns6jPfwQVQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880802; c=relaxed/simple;
	bh=W+l30OIu6IsV0l7kenscfqw0OGWO+XLS8PbCuyh3114=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WXrXJTOsGyBQDKvKwxUIsSrYSXLFCfgTbQJlDt2CRHi4hM96jMUI8InBb6NOQTiF0watEKcMFyBwIqsbMT/sKNRYsoC8OL+oX5iPXSNkD1c3qMSMXUgVZx82gz4888C+gCuES7yhLvoKxPiPryVZs+h25OIakGXm1qQWYQKVOKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GTbdSgX3; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GTbdSgX3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCh1o+wjKHVbKdrYVQnDx/JSzYzIfhx+65mymZtjm6UxMhHKRQpQtoDsf9EfnckDsMYLVwipsOsCjMHZUKCVxSaR2F4ASv3//gKmeJk5zahTRylCQPM4MR49+7BUzrQvgJS1UftJYxcV5lKC4oZ/FsmWlKpQ7Rcw6of+HOai7oQ/QGgvHv2DOR0/ZoD0YwRlv5BSl6XLCq9OI15IfJXmGnkIOOha4P5zYLUA8KTmIcajjlLQ3p2V/6nMNUjgtmNvkEBFII/aZ3EVMy3xjJAPdqXEAJaH0zHFuPJi+Gbml3pXROeGowS9NFHRKvTqElVwC+fRqtbxUyh8+xHkCKLdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQN48pDvQ62P1VvuOtD67dcKDkMFH7wchSD0LgI23WA=;
 b=bNMCJJSYRR+Tda9gmPXPlMZ4GJciTfmPKRkoOBZ9ZkLXWxcM29djxeku51HiAxZs18Pc2mTm5OBYDtKhJj1XY+7tZVZQ0QFls/Ix/2hSe8eAmKChb8+pXRAfoo+odQhA4oLifGAOe/lOaB+61jWtt6Q+rxtnOhu8KfhvGPr5HgQwkwhxRcVvEyx55rb6rvN7EZ20cdZ5wqG7YumSLbnepSrlOaYHfh7QinlTEHBm8oiETOsZbC7AniQI5hdorVYrhOPRQdrg3K21DYv98274rnxwDP2FwcRqSQ1E/sHzHHgH0MiE5Po/jrp+BLBDyBM8wHbjZK4lO1VfX4FGXh/+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQN48pDvQ62P1VvuOtD67dcKDkMFH7wchSD0LgI23WA=;
 b=GTbdSgX3gkUY5BLsgl3MC9WU3z7PwC5M5aUzgs6ydKbkQAKCuBWJWJRNj6VoSgjP0rh5louk0JAd5KDTbmqj8bq6zHm03Ahz+FqhE1aNcuY4OkNi75M6EANip00Vo17J8V0r2Em6u4jC8AzARKgIqV9iWo2ETvtL5QH8nAV1VwjkLnscg7Q/xTxa/uNCPwAMAeJac+D9RJPTLuozfMISo94ActXimLrPOL8+4DdQkKG1KRPYdDnkPc3iIDpbe4t7krTagl5vjDB7cN8GLakZlJUb/MNjRTfMKjYyW8d1haAgNLl17K92VpFV8GWmBHYH5/150/YOhKmpwgWkj5Q7cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by DU4PR04MB10600.eurprd04.prod.outlook.com (2603:10a6:10:588::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:33:13 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:33:13 +0000
Message-ID: <5b096078-dea2-4136-b9a5-61d03ff89414@oss.nxp.com>
Date: Mon, 7 Jul 2025 12:33:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] clocksource/drivers/vf_pit: Pass the cpu number as
 parameter
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-5-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-5-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::14) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|DU4PR04MB10600:EE_
X-MS-Office365-Filtering-Correlation-Id: 273a41f6-0c12-4145-eb7b-08ddbd394b70
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RElJK2RMQkRRWkQ1SkdJelQ2VlVOQ0xrSmFlenJDTHN1UGhrQWVNWHhjNkJr?=
 =?utf-8?B?cDNDRXBuSWdlRlRxTzVQTkk2Mm5iWnB2NDd4dGlTVTNuUnZhRm1QRG1DZGNo?=
 =?utf-8?B?ZllrVkljLzhLaHh6RSt0dU9oMHl5YW1rekJ4RW5aZnEvblkvL0xqTE12OWg3?=
 =?utf-8?B?YXlQT2JzNkhLZUx6SjNzSTZNSmRNZ0sxdnVGcGl5NlIvbVYwN3daa09Ya2Zx?=
 =?utf-8?B?MXV5WDdQcENJS3BpRzMzZDNyQTd6T0ZLZmxndDM3OFZNNnpEQzE2V25DMWJD?=
 =?utf-8?B?YS9ybkZkOWZrZ0dMaDZRcHprbnByanR3SUJ0d0QzbXUrTlduUGR5ZER0M21n?=
 =?utf-8?B?SWw2cHZ6ZnBBd2NuMnJ4bStPNzJsNGl1alp6aDRJOStDMFZOQUtac1Q0YmJM?=
 =?utf-8?B?ZFFodGVJbThHSDB3WGZreDdabmhoMFJwbk5DS3o4MTlwRkVxNWJSeXJGVWd1?=
 =?utf-8?B?U2RaWGxrZDRjRVN3RWNGdEdHd2RLMTZlTm1mV2FRN1BuUzBsN3krNTByYzh6?=
 =?utf-8?B?ZTdHREZ1Yk9rdzF3dUpFQnlaOW9mVG1QajJFb1NzK0hUTkN4eTJHNkFZVlpp?=
 =?utf-8?B?KzRKYXgwWDBEUnlJbDlLMUpXM1ZQZFJZZ3FPT2Z5MUxwVHpmeVo1cjZpRzM1?=
 =?utf-8?B?ZmVueFlWek5MZ1pHTTJEY0FucU84Y2lHQzEyTzVpSXp6bG8vempBUUE5YXkx?=
 =?utf-8?B?ZU0xWFBaT0NVRUFENXpKYmFUWE12YWhFZHZ0bjFjWS9tR0R6VFlMaFlVdWc5?=
 =?utf-8?B?ZE5vaXE0eFplU3lDSEhsMmZaV3F1RVF6Qk5WSVFvUjB0Z1RkQ0dFUXFQNDM2?=
 =?utf-8?B?M2ZjejJ0RmgwSGZhdGlSZ2Z3d3E0UHRCN1NtTXczZllvMGNPTEFvTitYc0VO?=
 =?utf-8?B?a0pHZVZBWnRTUFNjWGFDcEpHRmFjVEV1M2NNSDV6WkVBMUdLYXhrdGtEdjVT?=
 =?utf-8?B?NzU3WTRiQ1NwS081c2YySUpEOU82cTZsQjZlN1IzT2FlYnUySi9ZV1c3UzM5?=
 =?utf-8?B?b29sRlVJSnFwM0FMT1VhSlhUSFd1cktLM1ZFWE9aQWZlbXZobGUwR3UxcVpq?=
 =?utf-8?B?eXlPQzFBemZmN2lmcExTWDgxTWFHVjh3LzlGbjNiT3pSMEE2VllyRWdieTgz?=
 =?utf-8?B?MFQvcnUrSU9LNWlWazV6Ym5zVFEyVmxFOXhvMWNGMHN1TFdzY1BpQXRKdXFs?=
 =?utf-8?B?OXNQbS9FdnZ3RmhKSjhWL1FkQXVJQkxPeWh2YTVEOXNkQjFEck80OHZxekov?=
 =?utf-8?B?SW56NU5aVSt0R0lQVEFzS2Q3UGhsNEcrMHBJcU5EQVdqL0JFWlYzcFJJaE1B?=
 =?utf-8?B?WGpobEd0M2wzOEl2NnJhdXFrV05ocCthNE1USlBCT2I3eElKWm5nNkdCMTJV?=
 =?utf-8?B?N3hXNVE4dlhlRzFBdThCaTVsTVQ3L2xCQjdiV25NMnRqbnFZcGZRNVpQWDhD?=
 =?utf-8?B?M3lyUGxBSHhkaWFGaTZsZG9xWFoyUlZod2JDblEwa1hjTEVFTDlNWnJDcHZp?=
 =?utf-8?B?QVA4QUtnN2Z0S09YRFFGbU44QzdBSlUwZUVLQzdRV1kxQjNSWEkyNjNLWWc0?=
 =?utf-8?B?UXpIWFppbGlheWtLZllwN2JCL2pVb1Q2aVM3NFdRTXlhMGdVa3drYlJ0cnQr?=
 =?utf-8?B?eWlEK002czBCMjM4aWQxS09RSkROcEZib2xFaTFpd2k1SHJENmduWmN2eDFM?=
 =?utf-8?B?MXN5Z05lZnhLM1lJdUtCTXNQcDZsL1cxSkJaS3pYRWhjcm1SbFRWamRScXAz?=
 =?utf-8?B?UUcvaHlNV0QrQm9ENnVCeGNZRXY5c2NVb3lRNFVlWDF1MExUVElKS0FiZTJX?=
 =?utf-8?B?OWd1MzRNVHVYWHpzTXdLdU1tWVpGRjlKUVFYZzVaQ2N0Tm9Db2orZlZtOEVF?=
 =?utf-8?B?N3lFMWk1MllaSHVxQ2s4ZzJXVFBwSjVHcVBwY25DVFJkRHEyMEV5ZktzbHRh?=
 =?utf-8?Q?iY8u7V1Y3xQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFk4dGg3Wld4VXNTSEh1WDIvS2pPOTdweWJYek5WQnRTSFpJSXQ1bGkyNmUz?=
 =?utf-8?B?OW94aWZyMGNTNGhUbGlkeDBCblk3MWp3emFsNjYrZkZuanBzNHVPWDFiOFFq?=
 =?utf-8?B?emp2dlRPZGtNY3NKMWxiRWp4dXp2bU9wREtUQjlOa1pXQWFOei8vYmJJcnky?=
 =?utf-8?B?eGlDVjhYRTVWSUZ3OTNxOWtBOXhFY0g4cEpVM3Zubkx0SXAyZkJwUTNGaTJl?=
 =?utf-8?B?aE9VV1FpYXVvL05PWHVpdmFEeGk0S0lCWWloNEs3ekpERGk1c3J2K3BPbnh5?=
 =?utf-8?B?Uml2SnRTTWZmbk1UUHVvL1BQRm9lWHFZUzRQRGsxbXowVWcwcDJuSnl4UGFa?=
 =?utf-8?B?elI5dlBpeGd3R1JXTEtJeHNiVVZpRmtWOFBneUhHSUZMNVJ3Vm5CaWJPYkZv?=
 =?utf-8?B?MjNJcVFIbHpsYzY3MVFabFJmaWJ5RjBzOG01bDlnbTB6MEFoT2hhdjBsTExo?=
 =?utf-8?B?VFZBdTRBQmN4RzVtdlJDcERVZ1JVNUJuNjVhemhqMEpJa1FScGtJQ25zS3Yr?=
 =?utf-8?B?cVZwVk1XODZxOWdGcXpPTmFOT0Y1RzlCMHA2dUhsVm8wVTkvS3ZyQUNIZGw3?=
 =?utf-8?B?Z1ZGNmxBU2dyZHpicWJIS3VrWVJLRmFUUjJSYkZuMjl3a01pUCtIZlh2L1la?=
 =?utf-8?B?Nko5UnlWR1JGb3Y4VXJjN3orSkxlZkcxOFpkanJEVmg3bGthYThSNkR0WjRy?=
 =?utf-8?B?U2pkV2ZnLzdOdG5GcldkcDBMMGRPcHBhek0xNHlFbDZ5STk2U21SVmR6MEw3?=
 =?utf-8?B?cFprRmM1cGRKN1VubERWQUtJS1ZMUGpjRS9hNUg0WWRjaUhMTlN3Mkp6clF4?=
 =?utf-8?B?ZStMMDFsOE9SbkFPVzlraWFPYnkzV05ZSVhWbFpnV0N2ajRMZzZVYzJWYkhi?=
 =?utf-8?B?NWZsbnMyMEowaHgvdmllcjZuMTB6TjlTVUVqWDcrRVdPNk56dm9na2g3WWV3?=
 =?utf-8?B?QUlYYWdtaXZMdGQwbHQ1UDN6b3I2akJYNml5M2RrR09SQVFFNFhSZHRkY2N6?=
 =?utf-8?B?dEh4UnR2bmJ6NWIyVU5ycDF2RTlOWlZTQzE3ZkoyTzRpbzU4VUdIaTg1YkpY?=
 =?utf-8?B?M1lFQXltQWNUcWVjRDZid09XNFJLeTN3L3U5Y2Qva0tyZTEza2pLTlZXVVR4?=
 =?utf-8?B?V2hKM0d0QnJiYW94aE0wNXpvalZZWFlHc3F5eTkyMEdNUXZQQzJ5dlJtZGcr?=
 =?utf-8?B?NzZWOW9jNFVXeDVaOVYxK2x2cjNOcTRtNjlTdFdGbnBGV0p3YWtlT25Mc0p2?=
 =?utf-8?B?YVBkZ0hjMURpeXJRek0xdmcxTEdVQzB4N000QWxyNDJZakJIZ3BPaDVNTS9z?=
 =?utf-8?B?SnZEYWRUWk9CR0tTUXNrOVVFcm5JS0NRNC9oSUJhUVNkaG9tRDk0V25ONGlm?=
 =?utf-8?B?a2JEamxuUEhUVmN1OEV6dnArV2l5NjNUYjlFTmR0aUMwMVlyTS9aN0RySFZV?=
 =?utf-8?B?WE5tcGU3b3BlQmdkNkNjYmV0Wk1VdDU3a1Vmd0FIZXhVbFF4dy85dUQ0Tjcz?=
 =?utf-8?B?SmRqMWFxY1JabFlnLzdDU1hmNEFEZXVBMlQ4UVNzVVNXZFVXN1U4d2xyRVcr?=
 =?utf-8?B?OWxjdzVQcVA5S0Z0N2pMRHVaaWprS2NXQ292SVlLY1c2WVhURHRYdVFWS3pQ?=
 =?utf-8?B?azhyTTErRlpzTUR5TUtFMVpNRlc5dkNidTRaOVg5ZEtvaVAzakFOaXdOSHYy?=
 =?utf-8?B?YzNGYVEyaExTNVRWejdCQnFLR281SUJ2RnB6dGRoQ2FiZ3RQZzBiZGtLSFdE?=
 =?utf-8?B?SHNWMVNzbEF6d2lBTFZrcnk0aXZvM2l5ckd5Wi94OVN3WnBBUi9nMGhYSmFW?=
 =?utf-8?B?Y2s0WUxNRUFwa3JnczdERWVKMmF3WFVueExlTGFOdTlOcHNialRtbWg3YmZC?=
 =?utf-8?B?UkpZMjFGNkluTTlwR0UxNlNEWEZUOVlCL0Z2a1ExQXhQQUVkekFtQzBPRmhj?=
 =?utf-8?B?NUZyczF2OGJuS1I5RWVSeGtCbTRnRk9ES2VicVVzYmdNMUpKVWhPRmx4QzN0?=
 =?utf-8?B?KzlsN1VETy9kRStTVUNDM2I5Z2FsOElwYzREMFV2L0xtTitMcmliY0gzbmV0?=
 =?utf-8?B?dnR5UWl6dUlRdEVSUDE3L1VtUXl4VEJiRW40SnpHQzU1SGV3K0lGREIyWU1W?=
 =?utf-8?B?Z3RjeHVHd1hUcnhEMWg3RHNzQ2F4bHRnS3Rtb01YbU14L2tnVnVISTE3Vm9h?=
 =?utf-8?Q?LKxBVWZ44lKVAKVvw2K8/yU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273a41f6-0c12-4145-eb7b-08ddbd394b70
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:33:13.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pfUbJTSnNIliJy8cwkurFXyxr65me8XeTRu0J+/j3SJeZc85M6PWvuuTwbD+DJyDTnRoSCBhFbo1PZXRJUKGUyvOP9y7Q+PMAr2M/TmQnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10600

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
> In order to initialize the timer with a cpumask tied to a cpu, let's
> pass it as a parameter instead of hardwiring it in the init function.
> 
> No functional changes intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/clocksource/timer-vf-pit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
> index 34edb23194c5..20f637c8e856 100644
> --- a/drivers/clocksource/timer-vf-pit.c
> +++ b/drivers/clocksource/timer-vf-pit.c
> @@ -147,7 +147,7 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
>  }
>  
>  static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
> -				      unsigned long rate, int irq)
> +				      unsigned long rate, int irq, int cpu)

I noticed that cpumask_of() and get_cpu_mask() expect an 'unsigned int cpu' rather than an 'int cpu'. Would you consider updating the type of the cpu parameter accordingly?

-- 
Regards,
Ghennadi
