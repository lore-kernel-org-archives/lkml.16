Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96919C574
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658085; cv=fail; b=QqFN+l8bMwsGJQ431NuU8WWj0mAy15OjyzeMTNp6mu2NhiQE7vICDS3Rx2hSR5cQUocvQTD3d3zqmx7G8XjNflKNgf6hCWSBfhb+H+fIIDf8ezAC6Y3Xtg0QAZPIh0++fxrkSzp0IaflguWzYiX+hq83zjiDzvyU6WSJF4HwXwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658085; c=relaxed/simple;
	bh=1Q1u1/HG9pkItBTAHIknCfFo33riIPo+IBIc2ssiP3s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KjrZb4W85r+MRgXBd1xcb7ZNShc7bVfijfGiuJi6ZOh675b8D4orn1NN9p8tywDuWXy6PyppKXw/7LoTXFIXkeRzRoXq42VSRSv98QCwQ/fF7HRxTt4AJuIX5T+8HzTfAbEDlpBXD+FHZtabrzaq83FIzM8XjMu9MuQkjCMXRj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K7nCLIJu; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K7nCLIJu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVy4uv1bOVdNtuWUPVU4kLJn7kx1yA7hJzy4eU7KS7P7Db9tobUTZ7Djps8oIphhw6NA1ll0E/STy1kLZh/AUmpRlHsYojrGIY41Q5ubN+TGCHtJ+RTfT9m12Dcz9cULmCbfn/31j1JSpmfTwu8cxB4r+iEcXAExk4tG717DCweAi4onYd3Iz0znVasGcs9HyCULVK/wK10iAfysGOCKvme7oN35yHO8coQ+S42yelMNKs/81+j3FzqGPVUOHpUwSTtX6f4XP4NeGG8rcRzEk3g814u27vBPlZ0KKtQolJguPLz77uKI8GQyuAfFVLSFAnGAG76DpaJKHS81Njep0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9pmSLbh6HUvwEm4EQIvz3Gb3OlI6R3w3kI7caEUF60=;
 b=rp9DD5zkQAoQLUUWgXypgGvZaKUzY03PmvkBm+92C301W63NBAjxwSsCKbkouE5TcTfPd6BDe4pohTgi3s2CnM9Wj1Teb4Q5jPfrHSnOMQznpbJOAes3B2OIRIvZPLja5RRuCkBaNwETcbVNtZVBH8xxLye0etpWhn7zjOE+xfL1ebeoQ+xa3nvS/cdt03HYYrJ/QZi90m/f1V6D0gUj2kAQ+rBap1Tvivk0z3ucJElGaXUk/zfsyOnh1y7D4l/rTHG2qLsTqEbSTNs+VAPp8jC4n2raxJ54jObWMnX8pjc2aA9DqZA1+IH8gxVSH/ZuoUPwli3tPzxAgPjMmLneQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9pmSLbh6HUvwEm4EQIvz3Gb3OlI6R3w3kI7caEUF60=;
 b=K7nCLIJuaadM0mjZnOjI/6wbUGOSANPL6+zbrESY8QuB7V1z0bnI9bFmNF+GVnrzqrgAn4hE2nM5oUk1+PfKXx+RsriCQTeombDjVorpZjrfs6biIphnpk7QCf6N470KcrNZF+Dd69BXa6H4RCZT0dYGhshxw+ll3BDbt80VxDfuwA7shj8u8xRpu6DjHBR21nSi5ZETSsm8iImi/mrnxaOz4PULyYuEiteMK0rM/8Te+4q8k1qpdKDvCXTdEqyGTSX2BtMCG5aLZMRELCa7NHMYYmX60FtZH0aUFgnwLcuIEtohMN3kYy2sFegN4Ezj+buKKmrSQk3mh3f1mXY1Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by VI2PR04MB10167.eurprd04.prod.outlook.com (2603:10a6:800:22c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 05:27:59 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 05:27:58 +0000
Message-ID: <59c41c52-25f3-5506-a70f-9275425a629f@oss.nxp.com>
Date: Thu, 3 Apr 2025 08:27:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 2/2] clocksource/drivers/nxp-timer: Add the System
 Timer Module for the s32gx platforms
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
 krzysztof.kozlowski@linaro.org, S32@nxp.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-3-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250402090714.3548055-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0216.eurprd07.prod.outlook.com
 (2603:10a6:802:58::19) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|VI2PR04MB10167:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b05e5e-68b6-4dbb-9b28-08dd72704b71
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVZNZE1oUTY1ekFkVGI2VEFpR1dUcVZXVkpzWjhIaklxYmVvMHBjTE55R2lW?=
 =?utf-8?B?TnhrTlpEb3duMDVCNDl1SlgvNjhCQU1tLzBzNmk3YzB2QWFWL0xpa3dNUWli?=
 =?utf-8?B?aFNzbjlyYjlpalZ3OFZPVmhQMVpiL3AzZEdOZ3JSNHpqV0tnUjVXNGxIRDZS?=
 =?utf-8?B?ZVBhZUhXVmlLN3REcVd1UlZRY2lFbGFHNGltNlBsMDhoKzBVSStwQW1NUTJs?=
 =?utf-8?B?dEFsRVNrNDNyOVZSTUNBUnFxaVY5dWVxYTlMenplRy92bnI3b21UbFAxMzB3?=
 =?utf-8?B?NElhSE5OdldDcGJPR1F5TXF2a0F3VUJ2bzNBbmptc0FscEJTaXJ3N0kwY0kz?=
 =?utf-8?B?YU5iZ1NmM09pTG1PS0JkVTFoQkQrZVRsR1FKeWNIb1ZaZU5yNDVzMzlxYU9G?=
 =?utf-8?B?bWZYOHNCNmsvOCs0RENNT1dMcWMvQ0E2d2tJNU5SQzYwZVJycXV6ME9GcEpC?=
 =?utf-8?B?U3VJdis2WTYwU2ZNQ09TYysyM3VleEg4YVluM2lxc3FIc3BOdUVGWUdIRFBy?=
 =?utf-8?B?WjlPaG1hZEMyUkJRZnNqMThPQjhFY0dJMFZmS2llNjJjMVhRdGVzT2FOVkVY?=
 =?utf-8?B?M0hFZ2kzOTZ0VGRqR0xoR1RQVDJPY0RPbWxSN1V6NUFUKzdpQWF1dTFLMTFn?=
 =?utf-8?B?SmdYbXJ2WGREdGJYZ1hqdHorMXN1V2U1VHBWRHlYTXF2M1N5c3F0NlY0c3Vw?=
 =?utf-8?B?VDl0cGkwcW9ta1lMVXlwUXJLUWhpOElmNjJQWUFJWEpFTkMvWjVTR2d5bzV6?=
 =?utf-8?B?OWZHMlNTWkl6alc5dVNERjFBTEF0YVVZMHRTRTBZbkZPSEZXelRyZndpb0Mx?=
 =?utf-8?B?Tysrc2RJMStWMUJBb0FjT1UxUitMSVltN3pSQzMyT3J3Zy9FOFYvL0NBYi82?=
 =?utf-8?B?SjhseTZjc1RaRnpVa3hBQmoybVBhcUdSRDNIYWJFbkR5UUNzaGcwWVJMRmZ5?=
 =?utf-8?B?TTUvalNoTGRsalhTYThRa1J4L1lrVXNKYk9pQlZwZ0s0dGVlUkdNSHhhK0Fa?=
 =?utf-8?B?c281RVJ0RjhXcm9rOGtWdHFNcklUclY5YTJGWjBZOU1Pc1M3TnBkaUxPUklW?=
 =?utf-8?B?OVoxdlIydHdEbVJEbHM4WWY2aWpqMURjemlEMERtUm1RQktPWVVSR3VHY2pw?=
 =?utf-8?B?TmlzYkswSlJ1a3p6c3N0eUEzcXNFalNtZkx5eW5WZWlSS2hQdy9wWmhxNjFS?=
 =?utf-8?B?UG1sYmVBRVpKMlNYeE90ejl6VHRxMkVsczFlcm5ndy9oQ2I0cW5Zc0c1ZUo4?=
 =?utf-8?B?UW55Wjg0eXJEN0h4Z213elhRTUMraTZ2VHh6OHFSSU9sQmVVMCt5ZEZ4ek9E?=
 =?utf-8?B?SVFlbGtlL1h2QmhJUjE0MHcwdEZzLzBHQzQ2TnlRSVJ2ZjRkRG5FWUNrYW9I?=
 =?utf-8?B?UEoyRnZzU2luQ24zelhuV0tiOUFVRnlsQTk3UmFxZ05wUFg0N0IvOWp4a003?=
 =?utf-8?B?R1IvSElkSkE1V1oxNG9mMDlOcGIybkZDZnQxODBRdW0zL3FRckF2MXAzT3dH?=
 =?utf-8?B?NUROeUsxT093djZxVkhHUGlIZGRpU3hhUC9XaXVwMWNIVUdSNEU5TTQxOWdq?=
 =?utf-8?B?TEUrczZkakNhVmNObFBVaU5VNVVuZUxuNzF6LzU0emp3OHdEdStCN2tlSU5U?=
 =?utf-8?B?VkZ1VlJBcHFVQVZnNnJWeFgzekF5NkxvR1VFU25MNVBqR1EwK2tLYXNGMmda?=
 =?utf-8?B?dHlBMTNZOTFzWHFocTk5Qm10RkVIeXVILy9SanJiVDkzS3QzbHI2MjFaeWF4?=
 =?utf-8?B?NzdraHJ3eGJITnN3dW5nM0E0YlQxMXpXdlJnNDA3QnAxakN3eFN0YjdSMVcz?=
 =?utf-8?B?aG5zOXF4bHozNUpnZ1hQMHFJMHhrTFBjKytweWpRdDkrNzkzS3ppZGQ0emI2?=
 =?utf-8?B?VS8vOENZVGR4b1plaWlJNWM5eVNIdDFwZGVDazJjQlVsdWxVUDdLMEhDWGFm?=
 =?utf-8?Q?QDVtgaMlQpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHR1UlovbWZNZkt4Z0hJYjBTdXhEelFWSzB5VmdTc1o4ZCtyVGo0Q1lySUla?=
 =?utf-8?B?ZUpYSGtzNzhQVWlRYWZPYlFuZkJPcWE3bTkzVmFuNXBMSzBsUXVXVlZGZHRO?=
 =?utf-8?B?dW1HbTBGR1RHS2Ixd09VWmc3Snc1WllxZlZFVjhOcUFTT2w3eGxiZTFsR0Rs?=
 =?utf-8?B?Uitld3pYV05MeW9VdWlrSE91TnhqVGRuVXRyZEJKM1B5SGJuUUc0S3dJQWpH?=
 =?utf-8?B?OWNpc2lETnZGS0NIK2hrcXl0WnIvRGFEYXJTR1U3Tkl6VkpnbWlJRmhqR3BR?=
 =?utf-8?B?RzRhTUhtaldObXJWbFNDdFNaaFJqMHYvbnZrdTJBampHa0JBTDlpckh6WGY1?=
 =?utf-8?B?RGJha1BWamM0c1VKTmptWUJ3a2JSNGh2cGNQWEdlaDhJM0RJVUhZaGt1YWJE?=
 =?utf-8?B?YXhhdkt1bWF4ai9WVGFDQ05xOTkwRUE0QVZzVHdRUnVmSUJGN1lyd3krT2cv?=
 =?utf-8?B?N0cvVzZteTRWU1dCZUVnZktpSnU5cDBONFdaTWdVZjRlSElTT2tHRXdwakx2?=
 =?utf-8?B?ZzB0VUp2WGRXWkk2cFdpODk1Zmg4OVNueHBmZDI5aFRXL2NON1VUaFpYcjNS?=
 =?utf-8?B?WmZVQzhObklhcEdwL3RteHhxM2ZEYVRnd3ZLc1BBTGJnRVVPcnlWMDMxcFdw?=
 =?utf-8?B?Y2kyMjJwSHp0YkRaZHcrK2JBcEhzaVNiSGFnZk80bVB4SmlxVHNhQWdwZlBG?=
 =?utf-8?B?Uk1DS0lXNC9sWW9CU0pyR3BKVVNuZVNOVDRQMnFoek4vTC95N3gyMWkrY3ht?=
 =?utf-8?B?cWF2R0VJV3BVWVJPbmdGSGd5ekQ4VncvYlVUSitMWVU1bFBKNTh6MlZVa3dL?=
 =?utf-8?B?RWZqY3E0M2Mzd2lEdUQwL0k5cTRKVUdFSXo5T2ZvdzRxK05GRTJybHJOVEEv?=
 =?utf-8?B?QXg0MTZjbzhnZ0g3akZuUHpvbjJQTmNpdUN5N2NPSDlyK1lEZlZDSVQ5ZWNJ?=
 =?utf-8?B?aDRGd0EzTjQ0SWFjZmF1Q0FjZkpyTE9NMDUyWHNsdk1uYWl4Q1FrdHZSd3oy?=
 =?utf-8?B?RmE1THlBSWhJb3djMUhJcWU2c2RnemtNSWljc1o0enB6elRIQUQwckxyYXRu?=
 =?utf-8?B?blpZSG5BS0pDZkx3dWJzL3h6WVFDRzhGK0dSb1E5Q2dvdG9xUktoYnN5M3M3?=
 =?utf-8?B?VEhPaHNYMVlRcXhQaDZCTUJTbXJWclhLQ2JhcUg5dDY1VStIbjlhUWJYNVpq?=
 =?utf-8?B?QkJ4MzVlc0l5TzlDOXhTa0ZuRFFwRGZxU0hlRWJXQm1QdktqNlR1NWxJdHhO?=
 =?utf-8?B?Snh6UDJvYlM2RURxaXRNZWtuRjg2UzUrd1Yyb24rRTNvZkFwQnhqQkFDR3Rn?=
 =?utf-8?B?WktEWFpvMXNTTnF3SmNyLzR1K1BkSnFPU3FUOHNuU3VVbFE0WDBRTlZJd2Iz?=
 =?utf-8?B?bHNYQ3MzREc5VWRBdFVZcUsrcVRsUkQ2eXBKa0trYWtHVWtyTEdIUEV5azdP?=
 =?utf-8?B?WXNXeVBHQmdTTXE1bXgrTjh4VHZFWUJCei9GNS9IZkRYQkpOVnZDWkVQM2tF?=
 =?utf-8?B?UWh0eXlxMWtnMTU4SFpHTlpGd09FV1RUaDl1WjQ5Zjk3RnBrM1BqenhmNXMw?=
 =?utf-8?B?bUNjVXo0TDR4TFVocDA4UXdFUGc5YmNxd2l0VVAxWlVFMFlMK0htUjBFWUhW?=
 =?utf-8?B?R1JHWkF0aGluc2crMFVIenJpSmJiVnpWOEprdUEwSmg4azJIN0JMWmxOQno4?=
 =?utf-8?B?VTIxM3ZOMk5WUkErYlpwWE5TVGtRODRlQVJucEZ6YWVBT3dtckVYUE9aeUk3?=
 =?utf-8?B?eVpGd2NoWDQreU9zRE53N3VNN3dRNmU1cWozbCtHQWkxVEFSaHlMWXBSQ2Yr?=
 =?utf-8?B?bUhUS1NDVFJTbXQ5SVJMVVpnc25RNzEzc1NkK3dwU1NqS2kzbk0yZ2NIbUxX?=
 =?utf-8?B?bWNXZElKbVEraDNicXdJOHE0ZzFBd1p1K1B2U0d0R2tVaU00cVFEdHBqb0Nk?=
 =?utf-8?B?NjVOK3gxN2V3TitpSXE4RVFNV1Z6Vk9Fc0xQbFFYcXp5N2Y1ZHJ0WW8vamNB?=
 =?utf-8?B?YndxUWVkRURIV05DSkY0QUk3Q2s3THQ5eDFZQU81cFovY015d0VhZDMrUE9o?=
 =?utf-8?B?MUk0OXIxN2ZkSnpyaWJRZmYzdDBiK3IvNkJMZkorUzRHS3VYeGFFQis0bHYx?=
 =?utf-8?B?SzBjNHdZdXltM2NGeEZVN0lLTmhDL0dMV1Bub3RmZUF6S21veThBb2Vhclht?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b05e5e-68b6-4dbb-9b28-08dd72704b71
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 05:27:58.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfZ3Nx2Mn4ZcODWnjaMp3vjzdap5Ex5MDuZV8Y9yTzz1Z/Vt23NtjdIARGt/+bchms/zm4693tIEI20vFIFxQG0rzJkX2hcUVtVQceqPFmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10167

On 4/2/2025 12:07 PM, Daniel Lezcano wrote:
> STM supports commonly required system and application software timing
> functions. STM includes a 32-bit count-up timer and four 32-bit
> compare channels with a separate interrupt source for each
> channel. The timer is driven by the STM module clock divided by an
> 8-bit prescale value (1 to 256).
> 
> STM has the following features:
>     • One 32-bit count-up timer with an 8-bit prescaler
>     • Four 32-bit compare channels
>     • An independent interrupt source for each channel
>     • Ability to stop the timer in Debug mode
> 
> The s32g platform is declined into two versions, the s32g2 and the
> s32g3. The former has a STM block with 8 timers and the latter has 12
> timers.
> 
> The platform is designed to have one usable STM instance per core on
> the system which is composed of 3 x Cortex-M3 + 4 Cortex-A53 for the
> s32g2 and 3 x Cortex-M3 + 8 Cortex-A53 for the s32g3.
> 
> There is a special STM instance called STM_TS which is dedicated to
> the timestamp. The 7th STM instance STM_07 is directly tied to the
> STM_TS which means it is not usable as a clockevent.
> 
> The driver instantiate each STM described in the device tree as a

nitpick: instantiate -> instantiates

> clocksource and a clockevent conforming to the reference manual even
> if the Linux system does not use all of the clocksource. Each
> clockevent will have a cpumask set for a specific CPU.
> 
> Given the counter is shared between the clocksource and the
> clockevent, the STM module can not be disabled by one or another so
> the refcounting mechanism is used to stop the counter when it reaches
> zero and to start it when it is one. The suspend and resume relies on

nitpick: relies -> rely

> the refcount to stop the module.
> 
> As the device tree will have multiple STM entries, the driver can be
> probed in parallel with the async option but it is not enabled
> yet. However, the driver code takes care of preventing a race by
> putting a lock to protect the number of STM instances global variable
> which means it is ready to support the option when enough testing will
> be done with the underlying time framework.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Suggested-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/clocksource/Kconfig         |   9 +
>  drivers/clocksource/Makefile        |   2 +
>  drivers/clocksource/timer-nxp-stm.c | 495 ++++++++++++++++++++++++++++
>  3 files changed, 506 insertions(+)
>  create mode 100644 drivers/clocksource/timer-nxp-stm.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c85259967..e86e327392af 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -763,4 +763,13 @@ config RALINK_TIMER
>  	  Enables support for system tick counter present on
>  	  Ralink SoCs RT3352 and MT7620.
>  
> +config NXP_STM_TIMER
> +	bool "NXP System Timer Module driver"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	select CLKSRC_MMIO
> +	help
> +	  Support for NXP System Timer Module. It will create, in this
> +	  order, a clocksource, a broadcast clockevent and a per cpu
> +	  clockevent.

Is this description accurate? Will a broadcast event be created?

[ ... ]
> +
> +static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
> +{
> +	struct stm_timer *stm_timer = ced_to_stm(ced);
> +	u32 val;
> +
> +	nxp_stm_clockevent_disable(stm_timer);
> +
> +	stm_timer->delta = delta;
> +
> +	val = nxp_stm_clockevent_read_counter(stm_timer) + delta;
> +
> +	writel(val, STM_CMP0(stm_timer->base));
> +
> +	/*
> +	 * The counter is shared across the channels and can not be
> +	 * stopped while we are setting the next event. If the delta
> +	 * is very small it is possible the counter increases above
> +	 * the computed 'val'. The min_delta value specified when
> +	 * registering the clockevent will prevent that. The second
> +	 * case is if the counter wraps while we compute the 'val' and
> +	 * before writing the comparator register. We read the counter,
> +	 * check if we are back in time and abort the timer with -ETIME.
> +	 */
> +	if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
> +		return -ETIME;

In my opinion, there is still a race condition between the running
counter and the nxp_stm_clockevent_enable function. This means that the
counter may wrap around between the 'val >
nxp_stm_clockevent_read_counter(stm_timer) + delta' check and the actual
instruction part of the nxp_stm_clockevent_enable that enables the
interrupt. Moreover, this implementation seems to prohibit the case when
the value of val results after a wrap-around of the counter, which seems
like an artificial constraint to me.

In my view, the goal here is to identify the cases when the timer fires
while the comparator interrupt is disabled. There would be too many
cases to consider if using u32 only to store the current value of the
counter and the one to be written in the comparator. Therefore, to
simplify the implementation, I would work with u64. Here is the proposal
(not tested):

u64 val, ctime;

nxp_stm_clockevent_disable(stm_timer);

ctime = nxp_stm_clockevent_read_counter(stm_timer);

/* Build the targeted time using u64, which is not impacted by wraps
since both added values are u32 */
val = ctime + delta;

/* Ensure we have enough time to set up the interrupt without generating
a false one */
writel(lower_32_bits(ctime) - 1, STM_CMP0(stm_timer->base));

nxp_stm_clockevent_enable(stm_timer);

ctime = nxp_stm_clockevent_read_counter(stm_timer);

/* The delta has already passed */
if (ctime > lower_32_bits(val)) {
    nxp_stm_clockevent_disable(stm_timer);
    return -ETIME;
}

/* Keep the 32 LSB bits of the val */
writel(lower_32_bits(val), STM_CMP0(stm_timer->base));


[ ... ]
> +static irqreturn_t nxp_stm_module_interrupt(int irq, void *dev_id)
> +{
> +	struct stm_timer *stm_timer = dev_id;
> +	struct clock_event_device *ced = &stm_timer->ced;
> +	u32 val;
> +
> +	/*
> +	 * The interrupt is shared across the channels in the
> +	 * module. But this one is configured to run only one channel,
> +	 * consequently it is pointless to test the interrupt flags
> +	 * before and we can directly reset the channel 0 irq flag
> +	 * register.
> +	 */
> +	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
> +
> +	/*
> +	 * Update STM_CMP value using the counter value
> +	 */
> +	val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
> +
> +	writel(val, STM_CMP0(stm_timer->base));
> +
> +	/*
> +	 * stm hardware doesn't support oneshot, it will generate an
> +	 * interrupt and start the counter again so software need to

nitpick: software need -> software needs

> +	 * disable the timer to stop the counter loop in ONESHOT mode.
> +	 */
> +	if (likely(clockevent_state_oneshot(ced)))
> +		nxp_stm_clockevent_disable(stm_timer);
> +
> +	ced->event_handler(ced);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
> +{
> +	struct stm_timer *stm_timer;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	const char *name = of_node_full_name(np);
> +	struct clk *clk;
> +	void __iomem *base;
> +	int irq, ret;
> +
> +	/*
> +	 * The device tree can have multiple STM nodes described, so
> +	 * it makes this driver a good candidate for the async probe.
> +	 * It is still unclear if the time framework does correctly
> +	 * handle a parallel loading of the timers but at least this

nitpick: does correctly handle a parallel loading -> correctly handles
parallel loading

> +	 * driver is ready to support the option.
> +	 */
> +	guard(stm_instances)(&stm_instances_lock);
> +
> +	/*
> +	 * The S32Gx are SoCs featuring a diverse set of cores. Linux
> +	 * is expected to run on Cortex-A53 cores, while other
> +	 * software stacks will operate on Cortex-M cores. The number
> +	 * of STM instances has been sized to include at most one
> +	 * instance per core.
> +	 *
> +	 * As we need a clocksource and a clockevent per cpu, we
> +	 * simply initialize a clocksource per cpu along with the
> +	 * clockevent which makes the resulting code simpler.
> +	 *
> +	 * However if the device tree is describing more STM instances
> +	 * than the number of cores, then we ignore them.
> +	 */
> +	if (stm_instances >= num_possible_cpus())
> +		return 0;
> +
> +	base = devm_of_iomap(dev, np, 0, NULL);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base), "Failed to iomap %pOFn\n", np);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Clock not found\n");
> +
> +	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
> +	if (!stm_timer)
> +		return -ENOMEM;
> +
> +	ret = devm_request_irq(dev, irq, nxp_stm_module_interrupt,
> +			       IRQF_TIMER | IRQF_NOBALANCING, name, stm_timer);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to allocate interrupt line\n");
> +
> +	ret = nxp_stm_clocksource_init(dev, stm_timer, name, base, clk);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Next probed STM will be a per CPU clockevent, until
> +	 * we probe as much as we have CPUs available on the

nitpick: as much -> as many

> +	 * system, we do a partial initialization
> +	 */
> +	ret = nxp_stm_clockevent_per_cpu_init(dev, stm_timer, name,
> +					      base, irq, clk,
> +					      stm_instances);
> +	if (ret)
> +		return ret;
> +
> +	stm_instances++;
> +
> +	/*
> +	 * The number of probed STM for per CPU clockevent is

nitpick: STM -> STMs

> +	 * equal to the number of available CPUs on the
> +	 * system. We install the cpu hotplug to finish the
> +	 * initialization by registering the clockevents
> +	 */
> +	if (stm_instances == num_possible_cpus()) {
> +		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "STM timer:starting",
> +					nxp_stm_clockevent_starting_cpu, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nxp_stm_of_match[] = {
> +	{ .compatible = "nxp,s32g2-stm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
> +
> +static struct platform_driver nxp_stm_probe = {
> +	.probe	= nxp_stm_timer_probe,
> +	.driver	= {
> +		.name		= "nxp-stm",
> +		.of_match_table	= nxp_stm_of_match,
> +	},
> +};
> +module_platform_driver(nxp_stm_probe);
> +
> +MODULE_DESCRIPTION("NXP System Timer Module driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,
Ghennadi

