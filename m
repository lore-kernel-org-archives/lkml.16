Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC47213E65
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.34
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593771; cv=fail; b=VEASZDvjuU7oAK0KR9iEQLuadeZ43IGtRJoW6H4369lsAsASbu5Xlp2a2BOzj5urihzJ3vux96tRhD8HnUysKtD1ml1Hpe3HJwB8dXZ616nCjWKWnMQx729D4RzTdHZXsxM1DCGjQGvMQZssE54CsTBrxLlwyH3jBGXECU0w8nA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593771; c=relaxed/simple;
	bh=I1lxv7JYTRde3LlIIYp9mSWyh/1PL/W7pe7QOxGdR2g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=faZGjUg1hALnLrSMfyFz2uJ02rYYuUGFI1Ynnk7VpB77LZ1biqAD2nn1D2MRM0S7Vz5GWWdPeF89wCzhxLeAWs25iuB8TzvuZ7qkE2HMIGdGCMKy6l+tJ1hM2J5pDfFL2KnV2c+DBDcPT+rViOaY978l2rM9kwZDQzm2CVIfp6I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qlqUo963; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qlqUo963; arc=fail smtp.client-ip=52.101.72.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qlqUo963";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qlqUo963"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LnsX5hoGjLLd3EBSdNt1/5noqjWCTT+bEPIDErjJ4v2qYFLlwH+kun9h9PRDDu949UT0mPntdpKK2nz2g5gGrSc9UAaha74wsa8gVcHEtL6frV8/GiVzYNTnrTGVwid6b7vVKphe2wfDre30gHsRl2muUJ7bsTRADnVo4GHJAHoarYfE2O0tUTJL344gBtxRgCOgr3rp4TGS7y4z9dgARCaCM3Lqg2I8Jvea3sanZUIKyxNqP4zcy+kxZROQUiMUz4pK0lc0cGHhGMNhSHikUwPypjaYsIsbf+Fh9ervFGWc3Z2dybksxCeCOrYaCx8eibTNMYVBrX+khX6oywS/wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yeugcOlSAfRUVawGznYjSgv0FXKDheLeQggq4EOYTo=;
 b=Cn861EaiolX7PBAriT/TR3po5WBLwBRS7k92QQg1xXWEI8mpaZhQRTdREMexr1OPdjAa/FJ9iusYAyv/pF5V/v7uY00s095F9u/OfwB9bSPvYNhYW2fTGl4dqX+FKbaIJ0Gbot4k2F1DUvwcfQrQvj7TjOnM19ufDhF+IiHICD5iz/gtTgnHzYhTAmYCrpveiK73AjC7WGezLkZ850V5Aasn3CEqHwvXH1MWFuFFZNLYzjxndlcIqxGkG+eR/uNoQMpob+H9DN11GM1E1kET56z8PIe65oCtVeKew+Pc1HoR0UCHXTwkERSayagHRkQC8HHtk/LzqrsJ6L+c8E1hCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yeugcOlSAfRUVawGznYjSgv0FXKDheLeQggq4EOYTo=;
 b=qlqUo963BBsTwQNxdIIoQsSnDP6RMyb/rf0GJq6YmSOv+iqAa7VK0gfGwNaEneHkD1HtPV5XZsJjZqLtNwnLlJlH2e2Nl1bMq7BBaTOwnR5tiYAk2OzcqstHuL/lN4rZeiGrZ8J8f0NQ9blKf8b6OEEmLuSlJNy7Aw5x8KcVxnw=
Received: from JNAP275CA0001.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::6) by
 PAWPR08MB10282.eurprd08.prod.outlook.com (2603:10a6:102:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 08:29:23 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:1086:0:4c:cafe::1f) by JNAP275CA0001.outlook.office365.com
 (2603:1086:0:4c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 30 May 2025 08:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 08:29:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5JeJESBfXgrRbjPBsIOKzWMDqLQM9MqPyr816KaxJ/3DfwG+sQLOB2qXXBrnjgxSthzJfy09GdTCd0QnAuexKUpkIFMfRp1LSxDu1fcIx9tIAKzycB0U5nMacXgbHFciIaXQPwdsrULam8evCQmQ+15YKUFCJg5/ZiVMOtfrgP8DevDCixdbv4MUaFq3WCTcIJVD4D5ohmVQioT43jvQMGQ3RW+PNolwv1SSgW/NSgMHDo4nfdVRzwAGuuPVNvBJOnxz5927MC/hjb+UW55XVrnxr6WbcRuysLB1ikNyMq7QgJON9vSXpMF9zCOP92XChdj2HbNYYNj+DM/DAl3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yeugcOlSAfRUVawGznYjSgv0FXKDheLeQggq4EOYTo=;
 b=DK/CEzchsC19KGKUDaKNSWuQc6t/VNZwYi/rYJR9cqtCfRO90kp3pbz7mOH5ltlTGOxyWcBENhhnMte4EwV81dIAU3dWZwyCxDP/+Ur7BmUgV24wuZXq2OQzEOhwcozQ4PND769S9I7vgO+xv3ZnVmJLbgyeYo5HAon5+6kpfE8ihybF/0ZKA1/rfu8R8x/dOHArlxpxiHaxwKpMHphgGxZkn+5Prver/Mw7OqoqsLH4sjuaIZjdrU0ZD7j+qReP1/oqAphZ+h3ojx2vPTLJmgwzxQqiR2FvZFhbGmDezfT2+zKUDq1PhvCHBeIlkGkeEwLtMbB1zRKSt3xyfZ7LjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yeugcOlSAfRUVawGznYjSgv0FXKDheLeQggq4EOYTo=;
 b=qlqUo963BBsTwQNxdIIoQsSnDP6RMyb/rf0GJq6YmSOv+iqAa7VK0gfGwNaEneHkD1HtPV5XZsJjZqLtNwnLlJlH2e2Nl1bMq7BBaTOwnR5tiYAk2OzcqstHuL/lN4rZeiGrZ8J8f0NQ9blKf8b6OEEmLuSlJNy7Aw5x8KcVxnw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA4PR08MB5965.eurprd08.prod.outlook.com (2603:10a6:102:f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 08:28:47 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 08:28:47 +0000
Message-ID: <6e21b6da-cdb7-48ce-96e3-e00fa52345a4@arm.com>
Date: Fri, 30 May 2025 13:58:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250530082021.18182-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA4PR08MB5965:EE_|AM3PEPF0000A79B:EE_|PAWPR08MB10282:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d2056d-6bde-4238-b8a8-08dd9f541397
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OXQwZ2d1N1pjeGJPazlNM294SXFPaDhQTmJpeHd6UjZoTVRUdlhtZDBzQ0c0?=
 =?utf-8?B?WHFxakV4SWVRSHl5czNMSk0wb09KN21icTBLV3Z1SzRrUGdYZUFic1YyNjd4?=
 =?utf-8?B?STNPM2hHMG0vQUlYbGpKQmdCd3kxQmlPZU9mWU1LMjRkS1ZrWkpCWC8rL1Jx?=
 =?utf-8?B?MUJ2dFp0aUN3dHJpY1l0ZkJPNzllUFBlSHBaWUE2MjhPM2I0aGdsZVNOL1dN?=
 =?utf-8?B?L1FPYXM0NGtYS1BMUUZycmw2SEh5TGpXcWFBRVFlY2o0MG1TMmtiU3BQdmZ6?=
 =?utf-8?B?eVVjRUprOGlKS0FjY0NBMmtHdzhydVFqVlZHUVlFYUQ2RnFtaUxFdnhsbkxG?=
 =?utf-8?B?NDl4S3VpaSsrdGlQYlAvSU1iZmpCajBNNXpiOGQxdTBCTUxBbmp4cFNTZnIx?=
 =?utf-8?B?a0N5cHNXL0E2V2FaWXRjMXMxenNUbHQvRmVZK0JYRDFiY2wyY3ZjNkhHQVFP?=
 =?utf-8?B?eFB6N1dqVHVRdWFsS09YWHEvYXRWTHBpZ0pPYzRFRmh4SzhGclhoczc5SXdp?=
 =?utf-8?B?SlNoVDFFQy96Ly9zVEZBdXUvMGxRRlh5TnZhZHJoOHpqc2tUSk51S3FRbzFC?=
 =?utf-8?B?MUQrRlFqQkx3d29XcENlQXBLSXpZa0NjQW5IZklOcnAvR1lURVBCWElFUU9U?=
 =?utf-8?B?elR2K0w4cVJXZmFmM2kvYjZSUHJjdGNNRjNrMkVDT0x2VVVYNFV0ZTlXVVpJ?=
 =?utf-8?B?UTNzdlgzTzBYblVINkxFZVNvQjR5Q0lCZHJjakpraUswK1F4eFU4cjJqcTVW?=
 =?utf-8?B?MmpweGN3OG43NFRRUW1HVHlVK0t5Y2p4dUtDUmlua1Q4WnZydzJtZUJjSXJk?=
 =?utf-8?B?NTQ0MXl6T1ZmcmtSbDhrOUZERUZhMVRwcWt5eW9OaUhHaVJucDgrTnRFTWNJ?=
 =?utf-8?B?YSs2NzRDQXlPSllCaDJxa1FGVjBTVjc2M1R5SzVOWU0yWTkwc1hYc05ybkF2?=
 =?utf-8?B?YUNaRk9rZS9mS3lkT0RLS1VyK0dTK0xnUWk0aWlJWUdjbEd0RFZFT1dQcmZl?=
 =?utf-8?B?ZDhCRHFkSHI5VGEwYkl0YlF6MXBuVTh2UEgvOHFPeWdqdEkvV0N3Mk03ODFU?=
 =?utf-8?B?bTNuTzFJNnJ3L2JRRkhBYURnNnNPNmk3eDFReVAxWiszRHpPNjdXeTJIUkNz?=
 =?utf-8?B?OHg3S2JEbDJoN01lTzFybUV2Q1N3NUdmTURNNmNkR1FLNHRlVktHa0h2SlNY?=
 =?utf-8?B?Um1wQ0FmSkhCdFBqWGFZSlZkNGJsVmZVMnI3RlJtbWUvMVROR1U3ZHNnOEFL?=
 =?utf-8?B?dzI0dnN3T01samJ5WWZwR1hSQjgrR3NUbnRXY3QxWEJ6RlNrM3lqSmIwUXNI?=
 =?utf-8?B?NHQydmZjbXdsR3lQOTI5SXRKdTRnU3BNd0ExZ3pScFVOOGE4NVpoOG5PQmNJ?=
 =?utf-8?B?MVhTWUNDQ1VjOXRRenVXZVFmSU9zMXJmSHJneEwxVzhTS2JxR2hxTGpjZDNr?=
 =?utf-8?B?MlVjakRnUFZZOGFxbzBiR1RwVjZuaUpEeHBGMjJCV29NaUMrcThFYStrK1FQ?=
 =?utf-8?B?ZFp4LzE5bFpKcE9PRmo0U0dRTFVYUy8vYnVuQXUrR3lJZ0xoM3hOVUtGZFB4?=
 =?utf-8?B?TDhyR3dHYWJvdDRSSEcvSEVzRFdRV1dWKzFNYnlUOU5VWkpKL2RQZ2FlRk1F?=
 =?utf-8?B?OGdkUXFuemZMS1FjS3VQUStmc1hybzlWa3JtZVN3N3UyN0xRV1BRUCtwdnl6?=
 =?utf-8?B?QTJsY1Q4cDRsRWhSQTFBK2puaEJSV1ZMVm02bmdySVRLREczRTZWaERrN3Zy?=
 =?utf-8?B?V2pGTm1GVUE2a2IwUExpSWdYaEtMTlJoenZUWnNueHVSRTZiU3RQMTRrekNj?=
 =?utf-8?B?ZHRxZnJFR2owWitPNjJCZ0l1WUhiRzdiZTJMd0swK3RyRFJXVlRNUVRNa0tF?=
 =?utf-8?B?NVlvcTJzeHo3YzI4SGE4U3NydjVPblppS2JsL3RpMGlnMDF4M0lhVlczRmY5?=
 =?utf-8?Q?TKHk3ryMprc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5965
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b38c661-d3c9-4dec-0ade-08dd9f53ff9f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzE0c3R6eG1oV1pYMWdMNEJCckZaWkhGT1pxbnFmQ05mWXh4bmlSRjI4aFor?=
 =?utf-8?B?QzRVYzc0UDVON294RkpXMytNQ0grSHJnRnJsMVlUa1h2ZmVwOEtKQUlWVzNT?=
 =?utf-8?B?SGVDVGRzVW5UbUhpM3JIbUdlbHJTbHpjOXFpZ2V6NElnVG90REcycnhOQkJM?=
 =?utf-8?B?REpTOU5BREpXL1Z5ZUNEM3lGNjZaQlhXaDhHbjVIanErdnRKNkhEOFY2cThi?=
 =?utf-8?B?bkkvendKSDZ3ZnBLT0dkcHFWK3NiVjVZSG4xRWpUamk3QXVBQzdCR2xIUnRK?=
 =?utf-8?B?VUtyelFLaXh0NHJ4RkhiZVFreW1LVDJzck9pdUxZRzdPZ0tMMHZHNUVFWWZj?=
 =?utf-8?B?V0NtMzVxZkFUeElQMGxISFozRHpLV0k2OUhFbGRrb2FHZDVBWk1SRmhRdVhp?=
 =?utf-8?B?T0pnL3JPRnNuN2lpZEFuc1VnVUR2bG9lTEYyOC8ybEt1b2lsUXNZTEhDbjBl?=
 =?utf-8?B?amFIS1dneG4xcytGK3BtZUl3c3hsbnU2QktRRWlFVkRkZHNwa1VaejA0ck14?=
 =?utf-8?B?cnlidkJmQ0Y3S3BXS3lFdlJSREFPMzAwYWtTMkwvMmZKT04rUnVwUGpTMUk0?=
 =?utf-8?B?Wk9jdVRTY0ZNRmVlRnFVWmpLQ24rU2VkNnplNXFoc3V6QjFKYlpnTHVNK2d4?=
 =?utf-8?B?K05JTXdmclAwazI0dlFSNGx1c1B1aEIyZzhjRmQ5elQ4Y2lwWGh6RzBOaXpQ?=
 =?utf-8?B?Qzc2VHBRbVNEa2dPOEZIVVEzRi9WZVpaaGl1cGg5alc2OHZ6TjdCVERQeTdt?=
 =?utf-8?B?WE5HWUxVWHN2elYrc0VYOXVBWW91SlNuM1VvelNpbVJwbDhDbENpdDM4VENX?=
 =?utf-8?B?cnRWZmFrY0dRTDJ4SWZlUGJOZTdXSTRtUElzUGlUS1lMUTFKNFZDZHlFSTJv?=
 =?utf-8?B?NUc0cjA2M1kwcTBWL2NPVzdNMmtDenNvNVlDbE0wK0Vzd0hlUXZ0YUlqbmtv?=
 =?utf-8?B?R0FDbHBUaFVqY2NOR1R5dC9pR2RrTGJnZnNKWmx3czFJS2pzL1ZwUHVrQlk5?=
 =?utf-8?B?OXN3b2wrL3lzZmpqSCswaS9KNkpYOG52Wk51OXF4MTRqS1NRWjRWbEVKMU5z?=
 =?utf-8?B?TjJUQTBKSlpiVml5WEtObmFDOWVGTHpGc08yeEwzSlF6L3hxV0xQSFpKZ1Za?=
 =?utf-8?B?N1p5TTcwTk9RZUNhTGJBMG4vWG5sTThGRmhqVW5BbFdLMWtKZkpIa0YydGxq?=
 =?utf-8?B?czQ1bjhTTlo5L09QWEtaSlhDSlJCc3cwYWdNQ2hRWTVVajdFQ3UrUzFkM053?=
 =?utf-8?B?QVRuQmNFdkI2MC8xbjdLZnM4YUg2Q3M2SVJ2dEJ4c0JPb1lpUGZDRzhBNHYv?=
 =?utf-8?B?ektPOGE1MU0wZWhzbVhCYUVWN1haeHFLSUd4dkViUnlIdzhJVkgyZExNU1JU?=
 =?utf-8?B?SXNkQkVZR1ZXb0ppSFJvWnpjQkpNZ2xRRjk4V3ZvdnBaSjRnL29QaXpnY0dB?=
 =?utf-8?B?MTU0eXNPWG5nYTYrK0FKNGx1NldjK29MMEdtWVNSTGVxOTRabXBNeWx4cU1r?=
 =?utf-8?B?QzB4RWRSektOOHloSERuNmRaVDdCRnJGN1ZpTHVIcGRHdDh5dTNmaFFYVzRY?=
 =?utf-8?B?ZmZDcjlZblNuaXlFd3BtcnlnWU5YdmFhbmVRNkdGWktJbWhteXAvME9XSUdl?=
 =?utf-8?B?V2tsVXM3Z3hSM3FHSytBNk5iNDdxQ0o4a0dNczRZbklab3hzZkVqc0d1YUtC?=
 =?utf-8?B?Z1BuQklJQU4rejFhUXhyRHIwWHdmR3Y5elBEUWNObm5tMVNlSktrZytFb2R0?=
 =?utf-8?B?WjN4RjRjUFh6cFJDaFM2YVNld1hZWmFoSnBwMHNSYTIrbnpUcnJVc3QyeUhi?=
 =?utf-8?B?djVyUTdyVmxxUHpJeldtcnVEQ2hJWWNtaFEyZUF4aEJWTFJqRCtocXU4Y1Vn?=
 =?utf-8?B?emd5OWtsNDRqNjJ1RkJoUzJvT3F6UG8yZ3NsSUFZN0pGVU0xVlpBb1NCK3A5?=
 =?utf-8?B?L1IwbmdEUmVyY3F4dFgrNDhYaVNMbFQrRG03Tm9JeU5GMGh3ZkdLVHRPRmtC?=
 =?utf-8?B?NzdXYWlIMXBZSmkxdjZ2MTlIWGVBZWhGU3BLemdIY0dha29xWWlzVzdQdEww?=
 =?utf-8?Q?zECFm+?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 08:29:21.0342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d2056d-6bde-4238-b8a8-08dd9f541397
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10282


On 30/05/25 1:50 pm, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to
> analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race.

I mean, there *is* a race, but there is no problem :)

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   arch/arm64/include/asm/vmalloc.h | 6 ++----
>   arch/arm64/mm/mmu.c              | 7 +++++++
>   2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 38fafffe699f..28b7173d8693 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>   	/*
>   	 * SW table walks can't handle removal of intermediate entries.
>   	 */
> -	return pud_sect_supported() &&
> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return pud_sect_supported();
>   }
>   
>   #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>   {
> -	/* See arch_vmap_pud_supported() */
> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return true;
>   }
>   
>   #endif
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..798cebd9e147 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>   	}
>   
>   	table = pte_offset_kernel(pmdp, addr);
> +
> +	/* Synchronize against ptdump_walk_pgd() */
> +	mmap_read_lock(&init_mm);
>   	pmd_clear(pmdp);
> +	mmap_read_unlock(&init_mm);
>   	__flush_tlb_kernel_pgtable(addr);
>   	pte_free_kernel(NULL, table);
>   	return 1;
> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>   		pmd_free_pte_page(pmdp, next);
>   	} while (pmdp++, next += PMD_SIZE, next != end);
>   
> +	/* Synchronize against ptdump_walk_pgd() */
> +	mmap_read_lock(&init_mm);
>   	pud_clear(pudp);
> +	mmap_read_unlock(&init_mm);
>   	__flush_tlb_kernel_pgtable(addr);
>   	pmd_free(NULL, table);
>   	return 1;
