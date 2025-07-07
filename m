Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC721FFC48
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889774; cv=fail; b=jZXzpky4890S8mNW6Wm8B+G/GoEHBgEZJ2L5z5oh9UTXjEvpPXUuyuNixmBmW1BG67QemUG54o6o3GHlJQ9N4xs2KuhDNnYuLJG8zTVRce95smjwup6NwcSnwlrlzAp4vIcuD7zEJz65WhPT9Yk+QqXh6gMv7wWF7Ea4DDw4qc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889774; c=relaxed/simple;
	bh=elCq1M+lqV+ZUrnIDaYf02Mk0bmwYkSe1JUGhSrg7As=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/yMeavAm/WSUsAvkmzfiAO8zB2Im/qovAULeI+SyEdnj1ASMYgUTXmUvwsp6gEUSmHspcxrsCA7B+gjE4XJElyfnbDcqJjlWyHl/6v71w7G+eZMUvpJqbNi3GCmVvcr6KFGjC8lBhOMA0sNavJdS1jpqfCMFOlzYy1UxfIk8dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ASaJ6EcI; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ASaJ6EcI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/XnDJiE3adUP8ar3+y4pBSx8bev2uH4tPAhn0iI4y5aqNHtRvIbGXCKXn+JUZ1ki16ASt4D6dc8skFtNPMspCzuw7BTUJoI4xPUy6mH/xua2wcIip7BYa15zEJgDjREwbVl9qDuPtGeKuI7+atlfqUqRF6p1QVAxXy9zIy4gEJUe1Agj7gMvVYhU/pQcmfVDXDOiyDJMY7MQ/xQARdR9Fr/k1qLvpnl8g4wGCuHb7nJsc/qVQdxRXdSgo9nDsOqC+mHjlsVmP9O7yQ3xBOwU+m+BlgrQ0t3EF4DqEJtM5asNsmGDoAExnouk1bQ/YqRGcLmgcOQvjhzKPd1ROE0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB3uM6sALqUvPluKu4ndIcwgt8nopJ5gT3vwq+qVePM=;
 b=Tek4StMw66FuLsKbw5kB6P2BtmerFSkB9pLpasfsWNo2WL+RzMKnLw5obrL7dXR6I8ERzE3+SKIkf3qthyDVzd8Wl0S4KtwCpT3pW/9aHrua8f54Z3ChSqXmRGwBZdGaF3/Ui2HlL1fvK6cpYQs10uC5sHkLK1KgyNjSkuD1bIh8saju6GEMJj9Z8+8YQnPtWeoT8rnjUVZvbH0/qd7T5iPf5ZZ0rCAE/z1Y1YvyXSjICMS6onjZyzsR9kYuatcuJ2vzFYuCM0mTv126VwInlsQVZloUs7yl+RKBKdzvDUiUFF3tu3w4LCx139qL6SWhZvxH3SWOWv8kCAWmyO+AYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JB3uM6sALqUvPluKu4ndIcwgt8nopJ5gT3vwq+qVePM=;
 b=ASaJ6EcIQlESOlIPz77UOQEK+sxNPG1xGNXZveqL9uzn0le9qkqwT5JLOGmUy6J2BDfuJ2o2V/7E1ULiqIFkgW7Q4c++/FaLKf5RM3hOOdT0Dg0s/OvcGcVRicgWemiwPSWUfNJwrtka7d7LYP+t707kzrZEdD+q8LDlPIOhcN+Dvs8S8ho3Q3n5OWLD1pnFwxW921cevROM3n0STf2U17ClzxlY4vwRMlvl4l6DadOKPhq43JZar8GKaHHG49ILIzoPYPt8P/w5UeJGowTkd6+VzsjvkfNfKNTRBUaGHq0EnSaki4/peclVE9STg/Nbq+7L8vwxKrYYWA16/aSD+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:02:48 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:02:48 +0000
Message-ID: <86dd0130-b9bc-46cd-9bbd-033eafbbd5e0@oss.nxp.com>
Date: Mon, 7 Jul 2025 15:02:45 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] clocksource/drivers/vf-pit: Register the
 clocksource from the driver
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-9-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-9-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To DU2PR04MB8582.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 930ec61b-d844-4978-fdd8-08ddbd4e30de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXNXWW1lYTVraVJMQVBIMjJMaFZpS2l6VUV3SVo2VWM4dThJMTlFdzIwZmxG?=
 =?utf-8?B?Vmx5QlFsZDV0VlJLSDRpdUNUVDBHNXRIQ2gwZk00UmlJMXNmUGxiS0tGYnFj?=
 =?utf-8?B?amRuaGU2TGJtMTVMMGFvUDRHV0FqSlArOHpBazA3b3IxOWgrYUpyb3JaR3Zu?=
 =?utf-8?B?anh2QXhYYkFxVXRWMDZET1M5bkw3R0tKTGhQVy9YME92L0NSL203eDJhNDRD?=
 =?utf-8?B?SGVRSTFjdXdPT3h5djJIZCtxU0ptV2R5aFd6TnYrclF5NEsvdklDUnR6VFJR?=
 =?utf-8?B?U1lNTmliVnJ3MktQSXZOVStjU21SYnN0dnd0QmZGYVdJQVlsOHN0STErT3dy?=
 =?utf-8?B?UHZxYkhNSmZWTkszcDlNck9xUzhFeGZVQ2dFdjk0dzdUTXNyUnFNRUZZbmIy?=
 =?utf-8?B?c1pHUU02TXFFMkxVUUVTTk9rRmZZTWROTkgvd3ozUTBydVFIZTA1UzdsSkpw?=
 =?utf-8?B?d2NPRWlLelJ0QjFrN3BabUxKMStmNFA0OEt0U3gyN1ZWVm1GVUlaeEJsYU5Q?=
 =?utf-8?B?cVp1YjBnSG1Mb2IySWlxMzRGNk1rbC9aQUNML1pTRkFXblhTNEFHdkxJdkRK?=
 =?utf-8?B?c0NoYm9FYnVqeUtDRVQxVUFXQnA5VC9ITWVlb01Ra0V4bW8yYVRtcS9NTStr?=
 =?utf-8?B?ZDBHYmliY0hBMjIrQXJ5YTRVSzVtcUVQREpId2RodlNFSWY5T0pQUUs1aS96?=
 =?utf-8?B?UlBMQVhoS0VuUURrYm1ZL2NBajArbFRPemt4TGllVEM5bHhLbURoMXo0WHlx?=
 =?utf-8?B?TjAxemNJOUx4RE5UcTFpVVhVZklBQUIrWXQwRWVEQWdXYVpGUE9IUHd0QU5v?=
 =?utf-8?B?UXlYN0hydjlXZVVQQjZKc1BsSXZ5NlhRT01UWWNzVWozTCtQalE2S1o2RFFG?=
 =?utf-8?B?WTN0Nk9TQUJjOEh3RExwcDlaNVhZZ0FlSkJGdHVtYXI5RXh0STBQTGNYYXNL?=
 =?utf-8?B?RXJaN2tadWU1Y2orcFl5Q1RyV2lYdDZKMDZzZis5NXZlUG90RGtIVno5cEdz?=
 =?utf-8?B?eWhvd3VERlVBa0ZORStHNHFPQkRYaE9WdDBUUFpqOHpZcHBua1krdENGMG83?=
 =?utf-8?B?djlHR2o4NDljYnpNYUpybjEvaml2UHV5WGs4SXp4Y3BaVG1NNXpReEhLRFE2?=
 =?utf-8?B?N0NFaFlkMWRIcE5iNERmMi9XYXZ4WGlhZ0VRVjByTm1FS0tMVS94eDJHTW5u?=
 =?utf-8?B?elJVNGxMTUw1WlFRU0F0UkhHU29sVjltWG9Hb1phWWV2R2JpTzJFV2xXVHhF?=
 =?utf-8?B?SWF4cVJpekVDaTV2c0FvRFdKajBFNjJIK2dNemI4N3FISXYwSHp4b3M3SkFy?=
 =?utf-8?B?VytrRTJSV2JweTVxRVRjVG5vYnRLdS82aTV0WnRVN01EU3p2RHkxMTdWV1JH?=
 =?utf-8?B?cmFFaVJFdXpLZzkxZnB0WlZ5bG1RYm1EZVdFQk13RzY2aDVXTjFBakR3M1Bu?=
 =?utf-8?B?NXpmV3liRWNsbWJkR1duY2VrYS82N2FPVU1zVyt4YUw5Q21OcWVXcWxZWCtP?=
 =?utf-8?B?L091RzZLTlBXNTMzamFlZ0kyRk45WUU1NmVOTGNvTXk3clhWUXZnNlZxc0tC?=
 =?utf-8?B?U1dDcmxxemZUUXJBcUpHaituZ3pFRnZBRS8wUzIvMzExdWxhVHFXVFEyQlRJ?=
 =?utf-8?B?S1VTcENVQktEVUgvS2pkWmRkcGtCU0xuTFJkOG9MeUs0SlZ5SGh4cFJJRnY2?=
 =?utf-8?B?MFNPSnh5WXlOKzBvQkhoNnRhRkx6QytoZGZrYkF0NGNwbzJuejhDNXBaclNa?=
 =?utf-8?B?WDlyNmt5emljdXU5TWRTYUhsTUNsalVnZXpNSWk5MnpSZTE3TExaWnhRUmhz?=
 =?utf-8?B?MnBtSmdxUVJpVUtMS2hZVlB2Nm5GNWNpVkFMRGlrVXF5ZS9CZm5NZFhnMlZO?=
 =?utf-8?B?NkZlWnF4RXBrV2FOcXdtc2NxTEYxQTl4M1ArQ0lSSFd4b2FuNjlaRVIwd2cv?=
 =?utf-8?Q?De9nw4X8WoY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEZxVm1NZCtrcWdxbHZVNkVpaGdDZ2hwYXBGOWExclRKWXpYbHhQYUZ3N2Zn?=
 =?utf-8?B?N3N4YlJxNkNiS0wraU1RYm1EWGQ5dW1pOWRVeEN2YnkzZDZKdlhUYzlibi9a?=
 =?utf-8?B?MUM2U0hCOFZXbnphMm5HNXI5TGMrcnBhbnlSMmlUQmhZOFhKY1Y1QlZheDJL?=
 =?utf-8?B?OUxvSkdzWExJOGJDT24xdjh1RUcxNUoyQXIwRlBQRkU5YzlhTUpFV2Q0OTJM?=
 =?utf-8?B?TDhXeHM5YXk0bUNzRy9lYW00NjQ1d3VzaE1wN0g0TXRVRzNKalYzRC9qY2FI?=
 =?utf-8?B?S0VoaHIwS2NseGJ6bXl1Tk1NSDhUajBKRnBJSmlTcDRSY21oRDBoNkhjV0NL?=
 =?utf-8?B?MGc2azh0TXE4Ui9GL0s2N2ZqZTZZUTUrWjAvQlZYWEFGbURvSWdqN3dCWm0x?=
 =?utf-8?B?Rm4xT3lKZFFVd2NrbkR1RE00VHE0TWRUdzloQTlCTXNHcStLb0NodU9QSEZr?=
 =?utf-8?B?aFRBMlVPNGMwT00wb0xLVWNtQXJFZnVUblJKYi9CelRKTWs1dlpDcHVXc0U4?=
 =?utf-8?B?cy9YaVdadVZtVmpya21XQkJKWkxNa0kvL1BYWW14WHA2YkFSNzYwSitJVi9N?=
 =?utf-8?B?aTkwNlUwMTlvUmt4TEpnVGZWOXFmKzFMYTVtRThraFN2UVJ4MVhhSlJnanla?=
 =?utf-8?B?RmREdk1kc0lnMUFFT3BhY1hHV29TMVNUWHI4YzNGaS9CYlNGdVVhT2FBS2Q0?=
 =?utf-8?B?MExpalFjdFcrUTN0WUROeG9YUDZ1TFhEWngvZ3dER3RiQnBxM1RXZ2NOV2pR?=
 =?utf-8?B?OHdxN04ycFROZTI5czRXeEtqcVFoS05FTWkvRUhvM29UNHlUejdJeURlb1lU?=
 =?utf-8?B?dCsrb3dCN1ViN1d0NXd6L3RaczNCYVB5MThlSEQxUDhDTWduQ1BIeWJsZXE0?=
 =?utf-8?B?eitCSll5bm0xQjJpTmpVL01NMXp5cTh6dnp4OWtlTy9WR1pTZWU3SzE0ZnFS?=
 =?utf-8?B?MVFLK0EraVFiZjBpNTFDQjI2ZnNlWXUyWi91UnpOWjdlZmxtMHhWays5bVhV?=
 =?utf-8?B?Rk1NYjdMNWpkRTgxMTJBdEVLUzlxcTZRS2dLTkJrOUsrR0hVTWphVTluR3NM?=
 =?utf-8?B?elgxMlhWT0tsTmNzaWNnbzU3RTMwdjRLUU9TQ3B4cDFMUlZueXpQWktaeHVk?=
 =?utf-8?B?cXFxL3RwWlpEY1pDWEtMUzRMb3V0a21RcFE3MzAyNkRNa3pXK0RvcEZCajhk?=
 =?utf-8?B?TjhaSTRQMzVQNnlWZ2JzcTlJMUZNR0xNRHNGOERySXZ1TzNad05NbzZCVzly?=
 =?utf-8?B?aDBjbW54dFh2aXBKa2hveitLNzBENnpVSXRyNVQ2WjdaeUxZQks3bE14VVFw?=
 =?utf-8?B?MVJFQWFIQnE2NGkyUjF3OE41a2VpdC9Cc1NRYlA2d1NzdkNPY1BvWXlJaFZS?=
 =?utf-8?B?encrTFNueFdjU3h2M1dSUkRPWmdnT21vaHNjUTNYV0N5L3kxelp3RysrVWxC?=
 =?utf-8?B?UTUxV2x5b3djVHBiOHJ4RlU5OXFsREdsUEZlU3hCY2EwWkwyT0FYdzJNLyt2?=
 =?utf-8?B?YXZnTVlkRUZIOURYMHFTcVU4YjgxQzBlYkJRYmJ2Zmg1dXg4a0NsN3Y0Tmgx?=
 =?utf-8?B?WUV3a0JIUExrbU5Zd29BbUZlcENlQ3FKVkYxQmYyTDhTL1k2T0ZYMTBtR1RT?=
 =?utf-8?B?RXViTzBtWWcwdDZZL1hSSStubGJNekZLczBOR3VyNWp6WXNTUEo2aUIvaVh4?=
 =?utf-8?B?S2FxcHZTUVZ4b3NLc0Y4aXkzTEVrVG5ybC9jSE1aVEdCUnJPb3EwSzgvU295?=
 =?utf-8?B?MTRFQmhpY2RwUVBuSlNrQk1QY0U4bk1leVpQVjd4ME40ZCtLZFpwc09Yb0Uy?=
 =?utf-8?B?dk90S2lXaGI1QU1SZ2lTUjlkblY1UG5zdjBsUWVrUGFZNlFyU3NnT3NoUUNh?=
 =?utf-8?B?VWUvV2pYNmVXNVdqbkEySGRidnprM0JDZkE1NzFtU2IvNzVXNUlOdE5WZTFu?=
 =?utf-8?B?YkNJd3VHeDQ3WXhkbU9qdWh3bkNSUFRvZnI4MTI3VzNEWm4vRUJQaXVmRktD?=
 =?utf-8?B?ZE1ybXF6ZCtsUEduOGNkZUJjZ0s5M2lUZFN6TTFZWDFvcWxIOWZ5ZGRTQWdJ?=
 =?utf-8?B?VXBtZmVXUWQyT0tZU2dMZkxzMUNERVVqbUpudG4ybEZNMURVREYyd05QWFV6?=
 =?utf-8?B?cEpUWStIV0VacVc0S2JMQmVvMGI2M3RBMlUxK0pyb01KcVNvdzBLclZTaWtM?=
 =?utf-8?Q?P8nm6G08YUF5DhlaOY5unWs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930ec61b-d844-4978-fdd8-08ddbd4e30de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:02:48.3766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2r2tsMSyOg7dX+mKef+H4aXLQlgLI35dPq4mRMe+eMM5VvcD8rMZhGc9IvcrcME59W9KmT7kr0Is2g0HvY38g+8EGViJLZ0Zc09tHALsrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
[...]

> +static u64 pit_timer_clocksource_read(struct clocksource *cs)
> +{
> +	struct pit_timer *pit = cs_to_pit(cs);
> +
> +	return ~(u64)readl(pit->clksrc_base + PITCVAL);
> +}

The CVAL register is a 32-bit countdown timer. Casting its value to 64 bits before applying bitwise negation results in a 64-bit value where the upper 32 bits are always set. To avoid this, shouldn't the operations be reordered so that the bitwise negation is applied first to the 32-bit value, followed by casting the result to 64 bits?

-- 
Regards,
Ghennadi
