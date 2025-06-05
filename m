Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91E566A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749115355; cv=fail; b=JxjyJ04eZevKZS14XZF2gg7QfswJkZyZ4reYv0BSWtKcsJw4zJKpvNmGyqPYUuJo9O4LnqZCVayfxyT5WRY8sWKr91cSgZ56LBdN9wJ6v8HesPn586OrmxnDCaahQOLfpBgvT6XOuc54W+yJOb267wrzAtcjhPNVrPXfmph2K5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749115355; c=relaxed/simple;
	bh=k/C97VAs/BYvQFf+kYd1teRfmY3qijH906Y/BHKtuhw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nWYZ3+YmbTvk5zkNQoMVT0QinM4rRVqPDw/Xp4fmIRbD8duKwI4nxbX2co4j4LKKcp9NrPnYxhi6bHZRTG7/ySMpnfCnvC43PR9hGN+bPcrevPm9ufCdc27qbBQkcVE55lpctNLpUbov9QyugkclXpMONtT3P3l1Wjkd+xnDBb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=EMfk8Bny; arc=fail smtp.client-ip=52.101.69.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="EMfk8Bny"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoQaFJO4xzS+wFz8Dfeoz5oWpDARoF9G9vjmWVasnDqlf3t+jxokvUOp/cRVEeZ/P+DPpSZTnLvM47VRFfmw+umWPAHWpt6vR7/IiY/zFJMAif29k3pVjgJnx5zRKjlvPWSp4xgX3NJOHdz9QOmnBeu3h76DohFIzltdjZwuSW5VS+2Mrx11gpEle7gS6ORnQVUZEsN7/x1tBuC2qjp+DCCgG6IY6IBRU8AAY8yILnFoMduKVKCDyS5afLigdxu2mQPb9BBsoOGVMSMjIGyKjjhoqX7mvNjoMofvt+Sj79b3Nm3cAG1EMYVm110V+0qVUEeeyQwCXA0eIOSDhpuhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nB9KLm1Szno+5xA4SokLhU2/Egrk2cKBGoNKvMk7gIg=;
 b=ORHfqyuoWwWlUokJAmSbm+AlB7gZHedPHNS0IW9COvJ1RobsidTCIVR0b2R2Vaw5Xg8C99BOACI9Ubw2JISoVPtXZVIskt66zMxcgrR3l9h6oKjMkJRDAiv+EL7BNI/0RYkglMFHEogJolu9PsGMalalgmab34HZx/AWkBiCcu0IxSgYPV1mggo6vd/J2DU3xSk/xhTh3+YgdvO4Ldwg8tLQlLCMnJTU4v5B3pH17faB/kbVLNd6er9/hWWp1tOyLQF3bqMuubEd+fOpahI200ctbnXsfcZTpf9A3sqYaUNiFkg0HhKMTSom87SodKBxdurdoF8BMG0v3r0Skh9YTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB9KLm1Szno+5xA4SokLhU2/Egrk2cKBGoNKvMk7gIg=;
 b=EMfk8BnyX2wwfIDrEggZr4Pl5lV6IMigL9TVQXoKbXTjwXC+LvSOGHydJkGexgngOGdVGQ79r9N0C+0Sx8g5WeLGKhoB4cBcWm16ags3CmM5XToN68jqkhnerFWn/weimuAAejUUmuHhWb4ExugzR4EG9EsbHmcUHZM6i3XsvEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7721.eurprd04.prod.outlook.com (2603:10a6:10:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 09:22:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 09:22:27 +0000
Message-ID: <b42e28fb-e254-4901-932f-c5282c189dea@cherry.de>
Date: Thu, 5 Jun 2025 11:22:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add regulator-enable-ramp-delay to
 RK860-2/-3 regulators
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: jonas@kwiboo.se, dsimic@manjaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250604202425.239924-1-heiko@sntech.de>
 <e4a1bf0a-0fc5-4c15-96dc-7e9c7ae3ccd5@cherry.de> <49977521.MN2xkq1pzW@diego>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <49977521.MN2xkq1pzW@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0489fe-3587-4489-0c2b-08dda4127d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUZYZG5qaHJQNjFnNndCVUJ2emljN2RhYTZTN1NhcWVrK1B5VWREOWRseUR5?=
 =?utf-8?B?bGpGRHc2ZnJiT0MzWWZsTmZldGhJWDMwZ0VmQWFyeTM4dlJYN3VrNjc1SVFP?=
 =?utf-8?B?WldpRGlCb2U2VW95Qm14TE5LTEthNGdaWk9ZdUhYK0l1R1NHek1mNmo3ejJ5?=
 =?utf-8?B?Q0w3RmxxMDRrcStoaExoUGVkWmpMa2JMVzJLUUJ3MVF4R3QyelFZSStGT3VK?=
 =?utf-8?B?bDBOcEowaC8vQmk2TFFRMW1mcllHZUJHb2oxdHZ4ekx2NFkycEJXM09Ka3lp?=
 =?utf-8?B?Y3BNVXpEVzgzNEJHVkRuMnVKbGRXNURVblpOK29BOHdEbzI4YUJHeE5Gb0dK?=
 =?utf-8?B?OFhKNzFBTXVtSkYwNitBenloM3ViWHAvb0doWDBIa3hzWjdLVDZBYnpYQzdX?=
 =?utf-8?B?a0UyMDRhRzJ2Y0o5Y05OL1Yzd21hSzdicjNSM0tCZHM5Qk9Fa1lzby8yenFQ?=
 =?utf-8?B?bW0zSGdhancrUCtLaHVPbnhYRkpHZC8xRlA3bTlWWlU2eG1kYWtURVJuNnNs?=
 =?utf-8?B?UlB4enpWd1pMMDhLRjFwUnp6RWFJVmxDVDNsajRKSzRjdU1jY0kzU2dTa1BY?=
 =?utf-8?B?UTFzWGRjQnh5aXkrS3JHcnNiNDhPblRSaENWYlN3Y2c5bTJlVkV3RXdZcGFm?=
 =?utf-8?B?cWo2M0lrNk5uUmpCclhrTFVodnlMaEJ5MFdtNm41SmtLRU9UWExWVUM1dERv?=
 =?utf-8?B?cDY2WHZvT0FaWEtxbW9yK0lsdmNpWjJpQjg4N1ZnWVp4eFdCOWQ3ckZpSmxq?=
 =?utf-8?B?eXU0QUtSWFJmWmNlWVhFbUZsTmsxWUFZeW9RbjBSOE9lem5zUUZveThtWVU1?=
 =?utf-8?B?T2JuVXZuNnNwSUZlc1lLa1hzVkxaSzM4WjJLRlRHS3hKV2NuM1RKV01rcXBr?=
 =?utf-8?B?QVhYTDMzQk1reXRCL2U0ZkxWeTNudHBuV2hxVHFJV0R2dlR2VmNxczBnQVlN?=
 =?utf-8?B?elRYQUNkdEJEQmJGQ0g3cUptemhDN3FFM2hlU3d2U2tVS2tRZXJEcHhoNVZR?=
 =?utf-8?B?R3BsdjV3cHNpQmVUdHQyWUMxWmdBeHFvb3lVYWpRQmRidVVjR2xGcTl3VWhB?=
 =?utf-8?B?NVRDK0J4cTRPSW9Hb0lrbmcwVDNmWVhDV3BhcXNUS09HUEpRK3kyK0IzT1Rx?=
 =?utf-8?B?QzJWMVNNMEVzc1cwSEFkaGJ0eCtZOGdxSVdjZUNyQTAzVUFSZHBTczhJQWVa?=
 =?utf-8?B?aGZBU1ZjOUtwRi9kS29ZR2YrRmsxTGdGeUdSeDJnMFQ2elhxcHhjdXQ2RTRq?=
 =?utf-8?B?akt4UmFKRWx5ZHRwMllBUU5naE5CdEdVUzNYY2V6U3NVWkxQSjhmSFhCMDVv?=
 =?utf-8?B?Z1ZMMXA4YU5LZnYrcnI3SXU4MUFRY3ZDYzZNcEVCNEtxZEI0L04xYmtWTWYr?=
 =?utf-8?B?NVBaOWgzK29zb01JSUpJMjJjQ2xkSGZ3ak92YWhKMTNIM0V5UjhYc05XVGJh?=
 =?utf-8?B?OXZCS0dPV0ZWTVBsSGRnTUtiOUY4N3QrOVNzQjd4bEZyaDlDV2VUOUpsUDB1?=
 =?utf-8?B?UHMxQmRKaGlNa2NLVnhpbUxNeUpnKzFVeTFsV3pGOE1SYk4rT1lucHd4cXd2?=
 =?utf-8?B?Q0d6V3ZOTVR3eUY4MG4xNnV3TkE5TlBjaVkwNEN0aGlVdloyR3ZoQnR1Vnc1?=
 =?utf-8?B?V1FBOEVFeVpWcHJFcnVLUWFZSzZYQXc0dE1YWTB6UUFYbFQ1WDcrTGZBQk54?=
 =?utf-8?B?Y2xvbEhwQ0VMamV6Qk9jWUNsRjVYR0RtRzdpTFBmK3YvejJ4bUV0cEZMTlZM?=
 =?utf-8?B?S0NFUnJkT2s2TFp5RVZ4d2pMdTNpK1dPMXFSQllQNDFHSDRuNGVMYmNhQ1Nt?=
 =?utf-8?B?K2p1MkFBSkdtRTNBY0NrVU9VN21xME9VYUxNWlJUcXR1TDhSZ3Fna2Y2clY3?=
 =?utf-8?B?dkI3bVpNc3VwRHQ1RExMdXM0ODg3VVY5Y05DTXRCT3VwOHBHcWdKckdBREYr?=
 =?utf-8?Q?ZDinEPqXFuo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVhEVUIrcW10TG82dVhyUktlNUl0bkFQYjdhK0FhS0hUK0hleHU3dEQvK01O?=
 =?utf-8?B?YW5oQU1hNkpiTlcvQmoxVHlpT3hmYzhsb3hqNzY2cDVWalVxK1B4MkhLS2VP?=
 =?utf-8?B?d2lIZi8vM0hhdzhnWU5FeUVTVllHSFI3Q243NldsTGNUL2cxMUFKMU0zSjUz?=
 =?utf-8?B?VlJlaW9FMXIyNVlTSlNNVFAxU0c1cUhidzlUaEFpKzJEUXdDZnFxSHRIQVdl?=
 =?utf-8?B?MHZtSkdlWGdrdW05U01ORkZqQkNRVlFVSXZQckhnSVc2c0E3NHpBaCtyK1FZ?=
 =?utf-8?B?djIvdzN1VWF3NXpFMHAxYTZzU3UxOGlJKzdtOFRPYVJhaHRZYlptQ0ViV1FD?=
 =?utf-8?B?L1hlT1FRc3QvL0pTY1RBNmsxWnJjYXFobnBWdGUvdVluclVSTzl5ZVBzZVRn?=
 =?utf-8?B?RkhkM3RETDV6Q05yWWN1Y2Jaa3BURGV0M0pZV0Vlb0YwNWxQNEtZRE8wNHov?=
 =?utf-8?B?SExhUnNWUUgya2ZjUWpoOGc5azg4TWVpQ2x2dHFUdWdDVG0rNFJVWmxtNHlv?=
 =?utf-8?B?QUVvNW9qdzVCbE9VN0pySXRsSDNEQ3ZOeldoT05PTUdFcDFaQWdVamExcUJa?=
 =?utf-8?B?WVdwTFJhMWlLZDJkVkg2NUhxcUN4cTVRRitzWmdnbVZLcjRWb3lTdGNKczd3?=
 =?utf-8?B?OENibTY2ZFhPa2s2Vml1TDZ0S3FJZ09xWXp2djNFWFNWOUVCZXRPbU9DcXhj?=
 =?utf-8?B?dDNMZWtEV1RlUjQ2RUNkdzYrNU9iMlpyYTZzYmhFdlFDS3VuSU9OODh1OTNk?=
 =?utf-8?B?dktHRWVYNW9WQXdUZjBMN1hSeHQ0dVJ4bDIwTEhvVFBMS0NMZFpKVk5iMDY4?=
 =?utf-8?B?Q1ZDL1c0WTZERk03SzZtNmdadVpUandpMEJWNWYzSzBlbnlYbDdFTTVPd2Jn?=
 =?utf-8?B?a0FIKzJERGhKQWZ6NzQyUm04Q2hXaGpGazlQN3pkdmtvQnNXZENRaHQ2K0c5?=
 =?utf-8?B?Y2s5NWJMQlBBUExzWlZVMzU2SER4bDAwWWxqZ1RNTFRUNDVBL2FlY1pnQnhu?=
 =?utf-8?B?cXBDRGtLUzlIVzdqaUVXMG1rcUQxbVY5MWtrSDRNSytQWk8zaGVtRDRQRHBo?=
 =?utf-8?B?SXVxMkdMV29IdlZhQ1pnRzhYOGRPbjJYNmlyclJzeVBGV3RnNjYyOVptQ0Ir?=
 =?utf-8?B?cHpnSVZEWUZ5Z3VoN0FVRjdWeFdHb3NySzMzMFlGS29ndWd5QWt0WjhMdU5n?=
 =?utf-8?B?THNtSGg1NTNpVjRNWVlIYWZnNnR4RXk5UFMxS3NMTmNoaUkrd3RuY21ZcnVv?=
 =?utf-8?B?QlJyTHZBbXpRVkhtdXBqK3VIT1cxK0hPUDdtQXJQUWVRT2xwL2ZrYURLbTJr?=
 =?utf-8?B?R2tSbDNXellsa1ZyUGw1NjdhdDRuV0pXZHp1b2xKcXBXTU0xcEM3SEZJYlpU?=
 =?utf-8?B?emdoMm1UcVpLQXpkbWxMOWhDdWV1R0trWE5SWmJDeW8rUDVhSzE4NFkzR2ZF?=
 =?utf-8?B?cFRaT3ZGczRmckNKYVc0K1BOaUhWTWhlU1ZkQ2s0L3Yya2ZxaXlKUXFySVFZ?=
 =?utf-8?B?NVFzQXdhY1dZOXlzM3JDSzhpenlzOVg3QW9mS3FJSUlFeGQ3VU9iNUZPZlZ2?=
 =?utf-8?B?Vk41ZHR0Nldzb1hVRHQ1OWVqRXJlYTRkcVR3MzZ1UmV2dDRkd0VBZ2t3ejFl?=
 =?utf-8?B?TXlsKzNJRDF2ajE5bG5ydVh5WDdEM1dRK0U1NVE4WlZEZ1ozbURmdkxuaGJp?=
 =?utf-8?B?SUxPUGRuT3A2N2Z5MDNuYlVTRWh1b0xYMGh3dVlqZklCaVZQNTRjbU1nVFM4?=
 =?utf-8?B?TDRjTEFFVUltZk1JQmxIaU9tQnM5YXdBbzhxR0UweVFYVi9qK1lTVm8ybjhk?=
 =?utf-8?B?ekJZdXVLT2RkdWtSTEFRWlBlb0JWZzlLSlpkN3cyYUdSRmRjYkdHT3g1Q0JK?=
 =?utf-8?B?cW44S2tya09lbnVIV2UyUHh5OW9WK0RCUUduSEJUUXk2d09vb1o3Zk9leTd5?=
 =?utf-8?B?cnh4SVNaSU1OSkZQWVEyelR2WWVXdkJVY0dQdG1ZRlRsUksyaUdhS0JORzRK?=
 =?utf-8?B?TEJCZjk1WXlDZFhzV0ZhSmdqeGVWWk1obXhiOUYvS2ROZElwWHRQeVFRbHc2?=
 =?utf-8?B?NzVzYWc0RGRUQ3lNYS9FYVVtcWRLRzg5Z0h6Z3Q2NjBJNklSeDZHc2JzT003?=
 =?utf-8?B?QnQ3TnBWck5GV3FoZlVTMlBMbVZzM1ZsLzJFN2tCZkJUU2Z6T2V5ckdXUHVQ?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0489fe-3587-4489-0c2b-08dda4127d0a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:22:27.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zo1rM8bUMn6dai9OOZHaBy4BtCuNH+RJa6cBMy8sbK0r3TNy8UayxWntdaTdabtqLGLuzCrEWxNVxej6qfds+eDdoXL/i5vKri0+HaPoV8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7721

Hi Heiko,

On 6/5/25 11:09 AM, Heiko Stübner wrote:
> Am Donnerstag, 5. Juni 2025, 10:57:13 Mitteleuropäische Sommerzeit schrieb Quentin Schulz:
>> Hi Heiko,
>>
>> On 6/4/25 10:24 PM, Heiko Stuebner wrote:
[...]
>>> And in fact the datasheet for the regulator defines an "Internal soft-start
>>> time". For a target output voltage of 1.0V the _typical_ time to reach at
>>> least 92% of the output is given as 260uS.
>>>
>>
>> Indeed. Now looking at the existing Device Trees, it seems some set the
>> ramp-up delay already, but to 2300 and not 500 like suggested here.
>> Maybe it'd be safer to go for 2300 by default then?
> 
> enable-ramp-delay is a totally different beast than the ramp-delay.
> ramp-delay is needed when changing the running voltage and uses a unit
> of "uV/us", so microvolt per microsecond ... where the enable-ramp-delay
> is the one for enabling the regulator and uses uS.

Thanks for the explanation.

[...]

>>> mainline right now. I've chosen 500uS to be on the safe side, as
>>> 260uS is the "typical" value for 1.0V and sadly no max value is given
>>> in the datasheet.
>>>
>>
>> Reading the rk808 regulator driver... maybe we should also set the
>> typical delay as default in the fan53555.c driver? See rk805_reg which
>> sets the enable_time for some (typically the LDO with 400 and the DCDC
>> at 0). I assume those can be overridden from the DT anyway, but at least
>> we would have some decently safe defaults?
>>
>> If we do not do this, then we should probably force the presence of
>> regulator-ramp-delay property for the rk860x DT binding so we don't
>> forget for future Device Trees?
> 
> that is scope-creep (rk808 != rk860) ... but I find the idea of trying to

I was just hinting at the possibility to set a default enable_time if 
one's missing from the Device Tree because the rk808 driver seems to be 
doing something like that. rk860-x is indeed supported by a different 
driver, which doesn't set this by default, hence my suggestion :)

> set the enable-ramp-delay as required for the rk860-x interesting :-) .
> 

But incompatible with the "default in driver" approach :) So one or the 
other :)

Cheers,
Quentin
