Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FC2D3A64;
	Thu,  3 Jul 2025 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534045; cv=fail; b=TTpDW4j7PaST8ONJxWZfPGY4goe+dkDQvqGJ5zm3jBI/ztML0GfstAJ9cgdauyYdhWcfTrTdxyD/DMeYZek1g/FcHoMhlwH2aqhDZuvMSvBZ8qFtFapI8gv6AcFmcQxLEdpFpmOFEsCz+LQJdj85lw2Kb44OknGyM/cv3vJD+tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534045; c=relaxed/simple;
	bh=Iop2CQwVSwuA0+Ej6GimY+EGX+S4JWBstpc8qJJsS4k=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vb79gRB95fuulFyrovDnfXXGFNGNdozJiplhCxS6nbCuGZLNAP8roZ9wdySoIgUp0okK5SXINK/WZ1WrsfBsdT/y+KrOxUeO+spCH2EPQR1EudwW3VAziIYqK63tyBL6y4tY5U5k6exfeO8wEP6cNDaRc+JuwWUqEVFU8R9To1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=JoTc2rjx; arc=fail smtp.client-ip=40.107.75.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="JoTc2rjx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhmK9cgtIq+0/dKxqUvL/uBrw+FLjhWifSS6+UttbmEnTi9ZpMHupVgwXJMBiiB2QNyli5VxI2I2Xl5CRYHLNIluPOkJpWAtyM2YyuSBxWtOOSLGFMyOQcr9qdwXfWrLLI/wLkKFAKS2nw4uVbokQhTEPROD5CH1GiI1zkVboa7miJT5eGMq5DLE5Q2yqzRqDlWsi8ZGhLEHwvvaC//wUEgK83rQM5lPtzHwq/Lf5dhFgIVQmGGHLsMS536j8KKa3hQbfyODyGGMN6LZXfymXLtxad8dkH8BioL4dGIMn7PW6OEnTp2nazq/WyQmY9JqRxyJHyXyneozltQ4Yb0+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I99F8WgJjHLL2FNcOBPtD571z2vXQocPjZkJMwedR3U=;
 b=ZXHjtM9fHGopQSeDZNONKJGi/h1PzOtVoVKSo/istIO5rifzYlep+H6N/1hRk4BPn7ZjLfgNtEamDCrCmWWoQzTpSGE1ZT54PBymNeyhSM8Ir9jN6bwgn6O8vxOiV6jrJUSfD9G3lIZaJkZRG0pM7JGU0OzcsNoteIVPMC0VIc2tcX9XxGRzlhKARwIM194T/upf4zIIFt2sDr3jYY0QGLGmmDIOEZCmupSxaWUv/2cUH90ZQBAs84JKxr4kNyPhBBgdm0ZnqxUMUqLADVOge0Aw55hPuJyeoAGQMEdZLHjRkdeQLkL2F6jvRsxWS6FPRNYyQ7r0r1+6WFX5/aZpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I99F8WgJjHLL2FNcOBPtD571z2vXQocPjZkJMwedR3U=;
 b=JoTc2rjx78UjXZihzJ0H+qHjUA6pSJDs5v7+O5uTd1NWkHQvbl3eK5LA/RY6NPu9PtftAuVtRWvj/tyhVgk6SOISuTWaHELWqHJAW8OOEi0WCZIGsFbd4gSsg2G4QZ+cnI6se1Zs18HUBUU0G6Jjx2sC4VLUlqn/V4GZjli2K4NpPUquCL8j9/LehEBDleNTHy0K42+eE3dC8kXc0O6i0HDbG0sMv96zLzTpNijLBC4tDBdCBQ2YtddUnAl4WKGKeATosTCyByqpX0YbgGAAc/BMNL6kdfeFHH5usRS4u0RqZ6o2Kk/nyzMwSV9eLzI91YFoTuaHvA7ZtWjKrIKGFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by JH0PR06MB6293.apcprd06.prod.outlook.com (2603:1096:990:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Thu, 3 Jul
 2025 09:13:57 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 09:13:57 +0000
Message-ID: <62e4e647-9eb4-4329-89f4-6b2b897ba15b@portwell.com.tw>
Date: Thu, 3 Jul 2025 17:13:53 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
To: Guenter Roeck <linux@roeck-us.net>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Cc: hansg@kernel.org, jdelvare@suse.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw>
 <a25733d7-535c-44b8-973c-0bc0c99047c3@roeck-us.net>
Content-Language: en-US
In-Reply-To: <a25733d7-535c-44b8-973c-0bc0c99047c3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|JH0PR06MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e03190-7a28-46e9-47f6-08ddba11f02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFZjMWtCODN6bFVWcklLTWMwVHhtK0h3YndLYXllUHZmd1dIWXp4TDJEalF4?=
 =?utf-8?B?NHNVaDRBV3BHaGpvcC9zMlVYSXBzc05GMCs3VGFyTnhpQkRxZUdZR2ZNOG83?=
 =?utf-8?B?OWQ3U2RaMFVsYUlZVjRCbHdtcmdpbUFUVUtyNHVCZFRqOGdRbFFyckpvejZN?=
 =?utf-8?B?Z2FKcVY4K3ozS3RZU29yU1R4cWpJM1F2elIrYm14eEVmVEpwcjdPMHd4YWxx?=
 =?utf-8?B?QXpoYnJ2aFBneDZwdnBvVG9SWEs5TmJGdmNYSjRqOUxwTmd5NE8rUHlQN1g0?=
 =?utf-8?B?RUhPOEEyRkdkZWVUM0VNeU9xRXJia3F1bjBQTWw3UWpiQ2JVWVZFL0xVam0v?=
 =?utf-8?B?YzFxMzBlK3VGd2kyM0E4ZHY3dlMxSDBoUkswb0w1cmFjNXVpMFNsNFBZQ2lh?=
 =?utf-8?B?ZUpsMGo0VXhRdWk2blgzRk5XMXUrQnV1bXlVY1phR2hEMVRUbTNWVFhEMk5O?=
 =?utf-8?B?YkNZanI4aTI2akpVaUtPN0Z4ZVhkNTErbFlhQ3dQdnpCTHpEUjNRM205ZlRC?=
 =?utf-8?B?SCsvbUJEVzhoT0NRb2NoYndtZ1RqZUI4MWUvR2NlVGJPdWtLS1RxcUxqYy9n?=
 =?utf-8?B?UEI1Wk1aSTUweGJ4SkYwTUNPMmFCT0E4Z0RMeFRlWWtzL2dzejBPL2t2R0tF?=
 =?utf-8?B?d1VIU0JaUURjbnFxcVBzSjJRSEZ0SmZsTEdiQ005L3huZkg2bHg4NGZ2a3c4?=
 =?utf-8?B?VldsMnZ5T1BRWk9LVnZXaUVOOE12U3liLzd3TkhGVE0rNkREVE13Ylp1b3BL?=
 =?utf-8?B?dFVlajM3eFBNYTRDU3NabndQYStxTGtkTkVQd1JwUFc4UFJUQmhCUUFIUVRa?=
 =?utf-8?B?SlNOcFZKTDUxSTNLUUxxL3M5cDYxQ2dhaVByNzg5MjVCM3NRQzFjcUxOWmlt?=
 =?utf-8?B?VWgvajhDUlNEODNPSTdWbVQ5NGFVVEFtbmZGYk8zdWRzcDdLa2pMOVpMcG1G?=
 =?utf-8?B?QjFtM2l5Z3YxeUdMSU1sOUEvNnVWbGxQOHpYS0cvTnJFQmEyVTBlSXNkSG9E?=
 =?utf-8?B?T042TFBaT2h1aXB2VFVZYWRHMjM2VGc4ekw1dHBvR3FZd3VxRDg4RWVITnBW?=
 =?utf-8?B?Z2pZdG5uRUFmL3BWVm1EY0gwNm1jYjBTOFN3QmFUVHFYZjRUZVM0TXgycVVX?=
 =?utf-8?B?WDQxdmh5ZjZqN3JHQmNJMWdRZThVcndyaDMvM2xxSFZtV3VJZFJmeHNHV1Bq?=
 =?utf-8?B?VGtEV3pvR29xZncxOW5DQzliSGZMSFdOb080Q0FPTHdQb1U4eUVzMHhpNTQ1?=
 =?utf-8?B?TTkwa0dQUml4U05rZVZNajZ4c3ZHaVRqcmtoeTAzaU0zNEZha29SYjMwcXZE?=
 =?utf-8?B?Y1pRb2xWMXVqTVViRTFxMjBPclJlTXUvZFF1cTBDdVFaY0s3STB0RjNQZUEv?=
 =?utf-8?B?UzN2UGU5VFNtN1hsVzhNRktQd0lBKy94R0czV1RiS1FLd2NRTDlUenFLSkxz?=
 =?utf-8?B?V1dwSjdQTUJEQ2NnSXF0Y0FvUUtzZHJIaU9mR1M5ZWhzSU5yZWI4ckQ2YzAr?=
 =?utf-8?B?bHNXVW5YK3VweUtuSmh0ZjBhNVFTRy9OcVdyR3AwNzlocTdtbjNtYjR2d090?=
 =?utf-8?B?SGdoN1BXL3B3Wk1VNUZVV0ExMnBKeTkrcjNXNEM3VGlKbmFJYnJPVWhRa0tm?=
 =?utf-8?B?NENwRDFmVmV1bGdoUXBtVEVLS1I1MCtWbzNLU2NGVllkakJ0OTV0bkYvRVF4?=
 =?utf-8?B?L0RLazBma1UzY3UxQ01NWEtJKzRpZWd1eGw3OW03NG5nbWFzQiswSFJkMHpV?=
 =?utf-8?B?V0FxcncvSXhiZktCZU1YdzJxR1h2b3UyZGNBS2NLVlN3Zll4VnlmRnVvMTRJ?=
 =?utf-8?B?MWFDY3BlY3Q4MWQ1Mk1OSFF5VnVnamtWaEFPS0w0eVduYzB5ZTFnT2w3bFQ0?=
 =?utf-8?B?Zkd5VlJaR0w3d0tTS0lzMWtWdFByYksySVhITjFQQVdCa1ZuK3dWY3Z1VG9V?=
 =?utf-8?Q?s2lwPyCnuCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlRjUlY0YTJhcFVJMEdTc2dPS1F1UE16U1FMRFZQS0dSWjlhOFBGMW15TFps?=
 =?utf-8?B?eGxiWGs2MUpZZDBIdWtyR2kzWkdDeVhtZWN6SkQ0amQ3TXBZMUd0UzdZdHZk?=
 =?utf-8?B?N3BISTI1SXlYTnlQV0xpMy9MNWgxQnRxdmdxUFRoalhQOTl2YU5PaE9UcjRI?=
 =?utf-8?B?V0VSMGdGQWNNcDZOQWh3aWJlM1ovSzRlaU51VjFBZnZ3ZGpjalRwdEFHaDJJ?=
 =?utf-8?B?b2w3MjVCT0lxeElZclJyNkUyWFZZR295Q25SNUh4eWc5ZThSbms0aldHRW8x?=
 =?utf-8?B?ellDbW5ZMlNEckZYZkphaDFWV2g0VVp2eFJnMVpOaWhtWVIxUzEzQzdNRVht?=
 =?utf-8?B?R3pBWkpJVUQvd0h0ZzRmbU1tY1BRZ21TOHZCSG1HdmljQ2JTZUFUbFVjcjMw?=
 =?utf-8?B?SWdqRTVQYXYvV1RHSnJmdktCUFR1c1d5aVhWa3BJbkMreFlVVnUvQ0Z0blI5?=
 =?utf-8?B?a3kzc21OeFVWV2V6dXU5cDVKQmc2VE4xaVZpNy9xNFB2UnNuN3lMRUFzYmRN?=
 =?utf-8?B?RzA3YjZHTnpPc291WFBRcWNYQVVFb3k2dktQN1NSUUNXaUVuMklBVHNLUmk5?=
 =?utf-8?B?VmtNQ3A2TTB4T1Q1eEJqRVFaQlNLa2NoUWttTHFVTWV0WExuNnAvb1FtektQ?=
 =?utf-8?B?WVprdCsyWTZlb1Zob3E4Y0pvSTdZRmg0bmdzOE1BYzRXMnNiMlFMWElzL1FI?=
 =?utf-8?B?OXlpbmdKRnhIS2twQjVXUW9PVlRBOFB2SFlDNC8ySm9sU2xpYkV6Vy9TSm1O?=
 =?utf-8?B?bkdlQXZQbjkzc0ZxcFVMUVJzaTZubitDNjdnWnBHTU1HZ3dpUlhtVlMrRllC?=
 =?utf-8?B?N2V3Yzh5b1NSMExaWU9wTTRuWVg4YVBQcGJRSzFXMDJSR296blZlMWhiZnNm?=
 =?utf-8?B?RTRjOEZRSUpVa283cCt6Sko1N2s2SUZwSlh1TzVla3AxejlwTTFNaVVvQ2lw?=
 =?utf-8?B?c2RBbVEvN2ExNWI5TnpQOHpCek9XM1dvUmw1VHg1azB2MDhLM0pwU2NlOVZB?=
 =?utf-8?B?d1JaU3BxcENWQVZMYmt6a0REN2toaGZJamorRnYwZk1QYXpYc1gvQmNYRXd6?=
 =?utf-8?B?SC9DL2xhclMxMFJvZmV4VnB2Vm9RZEl6Z2YzdXRvQXNXSjFWNU9XUTVPcWlV?=
 =?utf-8?B?VXNybkowODVYTlBXMFdER2dLV2VNbjBuUXdjR0xoY3dKbFB6MDM2YWpiSGRa?=
 =?utf-8?B?TXF5Znl6SFZUeTU0WHhVWndpc2pGVzQrL2J6ek5xTCtPT3BtZ21PZzF6M0pO?=
 =?utf-8?B?andkZUZPcGg2dytxUHRDeTdsZkpzekZialpWQVdGS25TZWxHaSt4MjNrcXdG?=
 =?utf-8?B?OHcrT29ucU53TklQNHRCWnlOWGlWSk1nd2krdWMxSFFpcDJGZkduaVM2VERI?=
 =?utf-8?B?ejZGMXkvVWdKWHl0S2lnbWlON1JwL3RNUk9uZ2dMM1lrc011dGgrWjVKYTYv?=
 =?utf-8?B?cmM2S2Y3NlV6NmE3VzUwZG1WUFB1RjM0NFp6N2prc2syZmpMN3ZnZmRpL3Mr?=
 =?utf-8?B?MnMybE1PWEpmdytEY2V2Zk5SeFZTOHArRjJWZW5RclpCQnJjVGNwYnAwQWNE?=
 =?utf-8?B?ZFFvQkxYY0NVbmNyNzRGTm9pdHFKMk1SSlVIV1RSd3NJL3VLelZyYU8wdU9z?=
 =?utf-8?B?V2lyd0Y5WHZSZERXK3ZwUTVEMFcrMW5GMi9md1htSDVzMzlTWVUvOWU4czJE?=
 =?utf-8?B?eE1mRi81RmtsRFpGb1U0b0cyWnNzdkxBdjZReTV3L1RZZUFGY25NT1RYV3Ev?=
 =?utf-8?B?RWxFUDROVlBtU0ZHZTJONmlpbjdrNG9OeXRNaGk4S1E0akU2NEl1Tmdyd29z?=
 =?utf-8?B?RkNtRFlHVzRZOFlpQVNEdExDclZEZW5IRDJ0NkNBdzBQZnpZeGpxS2ZUZU01?=
 =?utf-8?B?UG1tN1l4c2JQU2RIOUxHYnRLbnNObTJ6YnVXN21oeUNFUDlvbitRQmQ5OFBE?=
 =?utf-8?B?Wm5pZjRCZkNzeWxrOFpjQzhHK3hnbko5ZFppK294ZmpMWHl3SFI1TGxwUEp0?=
 =?utf-8?B?V2x5cmR4b0t6TVBQcFQ5cDhURFRldHA3bEtOejk1MGtWczZDNXBrd09pSzVV?=
 =?utf-8?B?blpOajdmVXNmZXJuYld6clc3cTlxd1U0RzBTNjM2WXlOeEEwQTJ1d0xPb25J?=
 =?utf-8?B?M1hVaU9QTU9RQkdGcGtuNFk5TUo4dTJMM1JGZEExY1dVWjZhUnhLUGx1QW11?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e03190-7a28-46e9-47f6-08ddba11f02f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:13:57.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDIIQDmGh/baxQiG5HfN81DwCo5OYI7Y2RQoxI3SJp8HQ0OxviBedZujam0IUVSSIFQ6QYDZoyhYzzXS+fQcK25Ty+5TTQq5jv1+3cYnqjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6293

Hi Ilpo and Guenter,

Thank you both for the review and suggestions.  
Apologies for the missed cleanup in the includes.

---

On 6/27/2025 7:34 PM, Ilpo Jarvinen wrote:
> On Fri, 27 Jun 2025, jesse huang wrote:
>>  #include <linux/sizes.h>
>>  #include <linux/string.h>
>>  #include <linux/watchdog.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/hwmon-vid.h>
>> +#include <linux/err.h>
> 
> You forgot to add these according to alphabetical order.

The include order will be fixed in the next patch.

>> +static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
>> +	{ "Vcore", 0x20, 0x21, 3000 },
>> +	{ "VDIMM", 0x32, 0x33, 3000 },
>> +	{ "3.3V",  0x22, 0x23, 6000 },
>> +	{ "5V",    0x24, 0x25, 9600 },
>> +	{ "12V",   0x30, 0x31, 19800 },
> 
> Those registers appear to be always consecutive so it looks unnecessary to 
> store both.

Some ECs use little-endian while others use big-endian register ordering.

To maintain flexibility and support future boards with different endianness,
both registers are stored explicitly.

>> +static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
>> +	{ "System Temperature", 0x02, 0, 0 },
>> +};
>> +
>> +static const struct pwec_data pwec_board_data[] = {
>> +	[PWEC_BOARD_NANO6064] = {
>> +		.hwmon_in_data = pwec_nano_hwmon_in,
>> +		.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
>> +		.hwmon_temp_data = pwec_nano_hwmon_temp,
>> +		.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
>> +	},
>> +};
> 
> What's advantage of having these in an array?

To support multiple boards with different sensor configurations in a scalable way,
the hwmon data is structured as board-specific arrays.

I intend to store the hwmon configuration in the driver_data field of the dmi_system_id table.
This allows each board to carry its own sensor definitions, making it easier to add support for
new boards without modifying the driver logic. Since the number of sensors may vary, the *_num
fields in pwec_data are used to validate the index range in hwmon_ops callbacks, ensuring only
valid sensors are accessed.

>> +		if (channel < data->hwmon_temp_num) {
>> +			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;
> 
> linux/units.h ?

"1000" will be replaced with MILLI in the next patch.

---

On 6/27/2025 9:28 PM, Guenter Roeck wrote:
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/hwmon-vid.h>
> 
> Two unnecessary include files.
> 
> Guenter

The dummy includes will be removed in the next patch.

Best regards,  
Yen-Chi Huang
