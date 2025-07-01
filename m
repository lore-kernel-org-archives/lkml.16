Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DEC242D95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353167; cv=fail; b=c2Cf1OA/SfRHlUcgAPFBmliu2yWPFLTzmQcRkD4Sfddw3KXpP0Tq7ht0IRxmCcdLwgjT0uCZd6adm8hgiB5jS9oZmVOwc11GfWE4L4uUs7JkWEKrGB6KuigMBRIJEQ27Q2toIoifbzFXg3Pbh+lSLlMOTOMVZY9y/dEDvrDlc9E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353167; c=relaxed/simple;
	bh=18EmXrWLWtG88gHpu738E5PeBArm4obb75MCGXAK3Rk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cW3sos5OfLUax0u6XGODvEhxv0nrW37I3FJFqGThwQ9ci4hiD4syavjYvAEOx58/sq8/kx/sv0X+omRNwhwYqTOWXLhxYShc3oXaZQ5DtRaG8HFomGFy4MpEDTiBaLUVl+GJz3v6GYKwCNhFPCbjOfP63SAq08SEJ2CnfJcs7io=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=huQlLrSa; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=huQlLrSa; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="huQlLrSa";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="huQlLrSa"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a69T3qzRI/QdUeesb08utggWtRlsrm49Zgwir7V8yGlAmJGScJrxoRESKTuOk9ueoEQEdF/lv/U5Zf4sGuKkjcbO6wY7k5dza6cFxqHepfidWbrtfTpZolfxf1TSkneVEuajUR1+MLxzvWp+P2kVzLSJCGz7Dr6mjzFWasx6wEYtjVGZsoGOmpOhCXa55JLIEmA0qz/jral041p8x6P1hde2UVvB31s/yXu3VmwbFPFc/Ay9kRcVOO/DBg2YgkxhvQwtzinlwUX4i8XQ07VeCqsCVrve/ZlhSaBBkDCD99dmZn1QUOBGpTyTTKXB9jrDgtetVZqKwJX/kT/9F10iqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BuHFz/UCnerev/iR9AZC8qfBdmtdLyNeRPYrFScino=;
 b=A499VtDFcRaYL2c023w9JgnxVX5NF4lPUlXR+17QGw9oYzhFXK4lbAX04QKTjEf6OSc8iDDDJmaZ1QyZA5wIkpmq0KgwAOaqMAopwnsS2OCpddpaVJNmxU27bhN3ADiBmTAbcOVS0tk+nyjdEyAHe6S+zJxOgNUrI2G3wHReeLH0RGqz9rHA0dXGDSMlaLBRJZKqZh9sXF9FYJlu6WcgJJwngmy30DGPuKT6mSL0IXPJb3SukcZyEGzLxG3MyzYyfYe10hhBI8FJFmEAYhiH0dw9Ok194x0b6DWFVZdgTF8oBInAj4CZZhoha3TqEUeHckRSUfBGzrBKgZeORxWmoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BuHFz/UCnerev/iR9AZC8qfBdmtdLyNeRPYrFScino=;
 b=huQlLrSaHfCbl29ulHGlNstC0neVjLjBHhnw0ie8tubrqaru9hXKORHoW3ryjvUpoQQDn74L7ToLt2Yd8T60MExWbFP1wp4OghR+O+7bZS6bg5xwHUiukmYyrq3M7UBXGbznOtQ0rky597T0QhqsF6slx5KbFjDqGVofrNzkkGo=
Received: from AM8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::7)
 by AS2PR08MB9872.eurprd08.prod.outlook.com (2603:10a6:20b:593::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Tue, 1 Jul
 2025 06:59:15 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::1) by AM8P191CA0002.outlook.office365.com
 (2603:10a6:20b:21a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 06:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 06:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpt1bzvHhMbf7sbJiyJAC9UIYeCd0qTiAwbCqSm5ibWsWGF0TljgIe5dZyCqi8Q/ikx/wH9lkntXVGFk0+RTsuNQrgkEZuQZF42hkQuKftroHev7CEwW1R2wXbdnTF6UUl2AIQMjBNHiTN6ooNsxW6ONFqHK0s0U+IznpoxjjSnRWEQsSoMiQqSC63ux0tKYsAMUbnNOt7hND/759+twR3r09VAC07+EPYqK+S3i7mCJlXsUDn3cNBzpihNNNwljNy5PflxJ3wgKfSkBToTuHp9Su3J+DUfCPhSdXUAv4WnGO5bYLCw9v/aUEXlKQgxd/1eu0TtA4bxMxQnwwihhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BuHFz/UCnerev/iR9AZC8qfBdmtdLyNeRPYrFScino=;
 b=kTgUYiaEtotl7ywl1AYUmbUCPWkWibHlmsfsrvMUnBk09yExPoXJbytZ1iogsC6LPlShf5oOii3DhiZGvUcb0gAiLPEKaTbV2Qu7vuvHgsEb7XZXCfZuam2W1MS/DlziBHAmWsD8F9Y7Zxh13gtUYCTR16PJ+iqTGeDGwdGzQSaRoe+GPgLDL0ccLCZWcysERXl1pFdDIuq94+nV+ZOpdRkva84eP5eqoBROdYVOYMz9LOQylPIKAYbVjegZEmY79rjP5Aq0fIAExWCB692IY7YjE+dWrx3SOVs782n88bLsJm1omAZqisSZI4i+vCBK5WxPwL9HQ/jMWXRAeQG+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BuHFz/UCnerev/iR9AZC8qfBdmtdLyNeRPYrFScino=;
 b=huQlLrSaHfCbl29ulHGlNstC0neVjLjBHhnw0ie8tubrqaru9hXKORHoW3ryjvUpoQQDn74L7ToLt2Yd8T60MExWbFP1wp4OghR+O+7bZS6bg5xwHUiukmYyrq3M7UBXGbznOtQ0rky597T0QhqsF6slx5KbFjDqGVofrNzkkGo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6054.eurprd08.prod.outlook.com (2603:10a6:20b:291::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 06:58:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 06:58:42 +0000
Message-ID: <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
Date: Tue, 1 Jul 2025 12:28:37 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
References: <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6054:EE_|AMS0EPF00000192:EE_|AS2PR08MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: 30363a62-144d-44f9-4930-08ddb86ccaa5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YmdPWFRTUlFtcWJSQnpNT1VvYkpXcUtTRVFDOWU0NEptVkYweXB4L1J0ZWxu?=
 =?utf-8?B?R3ZBa1JxUjF6ZER5UzFJNzB4SzF0YTcyRm0zRGNiNFBzTzc0azdxaERsYzRa?=
 =?utf-8?B?YTlnR2JVei9xQjNERlNRN0x5RlNXY0VhejRKK3A1ckpwYXpYSTdKQzkvVXVG?=
 =?utf-8?B?eDZtZ3VOclQ2VzJqbkVtRkJzU0xKclBrWEd4UHkyY2NhNThTd2piaUxvSk5Z?=
 =?utf-8?B?M3VlcUVtaDVEZmJPZHpqWUd6czNpM2thakU5R3phRFVQWkwvRXo1ckZhV1lF?=
 =?utf-8?B?M0doaDU0MHEyUkl5YitLT3JlcUNOL1RYNjRwSDQ5WTE5MFpjMjdpUHgwbE0w?=
 =?utf-8?B?THZLNVA3cVMvSHBIZU9QUjR1MkdwZXlHMUx6WWhqTHhZTXkyb1IxRmhwNkZ0?=
 =?utf-8?B?Y1grQVI3dFBmNVpzcjN2YldlNGl1WXpiSXk5YktkNnRrMEhoM1d2eTdLVUQy?=
 =?utf-8?B?eUFsdVE3YzN2bTRGVzhvQjFpSHNtaTRrOHZKZjdWRHFsZGpiejB4VDU0eEVL?=
 =?utf-8?B?Qi9SY0VoZUUxRWRHSmRiL284STVsNXVKdjY2OHE5VE1PaEFBV2k2ZWdnM2RC?=
 =?utf-8?B?NFlNUWY5Vkh2elQyVXllNmdYWjg1Smt2NWF6R2JYaHVlZUZuWDkxNnJMbmNk?=
 =?utf-8?B?VCtwV2VhWnk2RlpsOURHNUQ4TzZwYTlJWXM1bGN3Z3VFTktCc2w0QjJxMU9O?=
 =?utf-8?B?Q1ppR0pFdkcrYytIVVVGaFFicktrQ2Q4c28wY2FuZGZSK1hGQldUbUhka0Yv?=
 =?utf-8?B?YmFKREtQY1JtNHVEMUFHQTk1b2lRUkhCSFhFSmNaZHBSeXhKV0ZnWWFjQlk3?=
 =?utf-8?B?NWNsMlV4Q1dPQU9xUW9PSHl5dytaQjdIbUNIVVdwOTlpSnRPdjJWK2NxZkFw?=
 =?utf-8?B?NUkwZUlJbkN6WC9FRW15bHFyeDlkTjFGVjNSZzQxamVrNEI0emUvdVhDVUxY?=
 =?utf-8?B?OEhUbkVDMENOWlRTUUJmUWJXYWVZaWlJWE5GVm50eUZGV29XUDAvUGpVL25m?=
 =?utf-8?B?a0xzbmNqY2xpTmpXL2I3bnhqQUUvR3JySDdTNW9VYXQzV3JMZVY3blordExy?=
 =?utf-8?B?OHRXNXg2Vnk3SkVKSHhBNUZRRHlUMHZWTVZVM1E5aGRBSlNtOW9xTjhXUW1J?=
 =?utf-8?B?ZUdvcEdSdHo1Z2F5ZHBrcHpPMmwyOFp3TWlBWjVXejNZSGp1czFMOThSWjcy?=
 =?utf-8?B?b2FmTjdrRmp3Y3BSRlZIZlhoTERmejJ2V1NmMGZOZlhjcFZQRHZzR1M2dkdE?=
 =?utf-8?B?S2l3NXpHdi9XZzVMWU02T0JzZ20yaTMzRWV4bTVkVTR2OGNhaTF6emE5NmRI?=
 =?utf-8?B?aEZadGxaSHFBYTk3dU00cEJFUGovZW9RbDFqZHQrWnExSjRPeFQyN3Z2TFlY?=
 =?utf-8?B?RGh5L204K2xBTnNBOWRkYVhKZVBOUXppQ2pEc2JlMDNDNFJTcDZNWGd6b2hN?=
 =?utf-8?B?bnM1YkFLaWkveGYvMk9tUVByZlp6YWFrVER5dnJNTWp5SWE0MksyUXYwK0Vx?=
 =?utf-8?B?MGFlalFPM1pTVmJSOTdYV0JrNyt3RUtKaWpEeFNsT1ZzTDV4Qk9LY240UlZm?=
 =?utf-8?B?eVlqUUlpSk10NDJ2cTZXUFBFOWxmaGVtRkRuenhSdVZhUXhtZVd2THpJMmY0?=
 =?utf-8?B?V2h5eGNZemFGajhDWXRRODVEY1hwYmZ1cW9MRVlRRE1JeWlFVTNSWTl0OUdn?=
 =?utf-8?B?RmY2OVF4Yk05NmFEOUpQd0gxbWxHelZ6bUY0djBUZHhNYnI4ZTNxa2VRTEEv?=
 =?utf-8?B?c0JoejdpcEFkZ0ZYalBWcFJPeStqOE5VUEU4YWRsVmpxR1BNcnkrV0JpbURn?=
 =?utf-8?B?aTdSaEVuRGNkTWhzWjR6dUYxbTQrbStHMVlTbE1naG91Nk1oSHpiZmFQczM0?=
 =?utf-8?B?MmpXNXhDYTF3dzI5bTlZNDM1TmtsbDdlQkoyVG9SU1UxalRUNTVyNjVEeURk?=
 =?utf-8?Q?Nwjsur9Ozc4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6054
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e51800c3-9bb9-46e1-04f2-08ddb86cb6bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|36860700013|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S01XMDBhUmxPYnNmTGRHVTB1b1F5UGNXYiswQ2tsWnJDTjh3VXNJS1JOZWIv?=
 =?utf-8?B?OFVXclJFS3ZTc3p1cjVGZXI2VEhyeFVwWlVOZkluY2lOMEV3K2pRV0YyTXBQ?=
 =?utf-8?B?R3hXVWk4VDJkY1JMdmx1VFZZekhxSXFiWVYydXVPcXNwR0Rmc3JSZzJYeHF1?=
 =?utf-8?B?eUY4YUZ4YzZJY292cGd3QXZjWHcyRjFDY1hPa0JKRE5hUUZ5R2MvaDJqSHRn?=
 =?utf-8?B?Sk54MlBxaGdKck5JZWdlNFBHd0tEaEl4ZmtwOEJzblA3WVF3SUhRNGU1VHVw?=
 =?utf-8?B?bUZoSm9CWEFKcjRoM1hXbk9uUVJZZHhQT2hTNGg4d3AzRDRiNVd4Q1gvNEN2?=
 =?utf-8?B?WnlMTUZaRTlIbEN1bDQ4ajhBY2ZCMzBmUy91Rm5XOTdTekpOQk1mci9YelVu?=
 =?utf-8?B?dVAxVlVGd0dKS0dBWFF2cGRLN2VSTUlaM0hIbWNpNDFEbVA0bmVDMWhLd3B3?=
 =?utf-8?B?R2VGcGpNM3puWU0xUDZJc291S2JpRmx6QTQvWnFtR1F3ZW9iQmloSER2OWRL?=
 =?utf-8?B?dDhjWHFLZVZLbVQrQ0NZMnlkWnNOcUVhM1cyZkJiUTBIcGRkd0RvdFVkbjVW?=
 =?utf-8?B?MTVXZG9TNFY4SkhIRUFPMHRJWnVnOEY5VmVNdFBVWGVlUFpsRkNvRmhDRVc5?=
 =?utf-8?B?N2lxeCtMd3Y5N2wzcWt4MG43SlQ5dVpJOE1KdUQ4MGwzWUh0eFVJKys5SGkw?=
 =?utf-8?B?U0t5UytlQ2ZGaVY5MHhwbzd5Y3NtZWtxeTdlTEpQU1NCSEpINEVTR3Q0U2Na?=
 =?utf-8?B?YkNqbUhFcGEwSTM4RFZkdEM4ekhXTHRQdnFtd2s1MGtRUFpZdzErWlpZaHlM?=
 =?utf-8?B?OXJLNTAyNlgzbW5iL1dFSlJKMW5kN2lrYTF6azNEWWVDVkNLMGRuMzMwOXFu?=
 =?utf-8?B?aW8vN0ozMjFGeCt3dlZDV0xheVM0MUQ3SmhnOHFwaXNKZ24vSXc4Q3VzN21l?=
 =?utf-8?B?V3lWcXVzNy95c082Q3o4S2xPdVZlbnpIS2NQNkZzY0wzNFZoL2VuekZZeURY?=
 =?utf-8?B?WVVtSUJLUy94K3VjZzJxTFNrWDMxREUxQnFoSXRxcVhVek05RWVoRXRyU3hj?=
 =?utf-8?B?TUlKUFBrU0xjQnZmT1BJYUZMNWFQZDkzd3dTZXBhUnc4NmJ5V3VFQ0xycWVZ?=
 =?utf-8?B?bHhWZWcrQzdCQTlPbVhLRFdHejlFc1BsdHBRRG51ZEhBNnFIc2R6VkNaM25U?=
 =?utf-8?B?aExFR0YzVTlNWHRnbzFldXY0ZzJxLzdhS2YzSnBab2RveG5PWVpCVWxPSGRj?=
 =?utf-8?B?YUcwWlFUY2h4STlPRDM2NE9hT1NocXJFdnQvc3Jzc2w5aXFicUwyU3lIMXB6?=
 =?utf-8?B?MVA3aExiZGR0Nm9iTHNiVXJYOGxaaVR1MnF1UEtuMVRzd3VUcmdLVU5Oc2Mz?=
 =?utf-8?B?bUtZb1BNUnJZZzVOV3A4WDR5R3Q1Nlc2R2xxSXRTcjl6YlgweFpjWVo2N3VU?=
 =?utf-8?B?YXZubW5jUXRPYmRQUjhndm4ySVBpR2Fqdm1uMHhhTFg3OGk1b1owdEJSWk9R?=
 =?utf-8?B?L3ZLNzNXbzVwQkZuUHd6VGJaVnNQKzBPY3hhaHhDSE94emIydGhUTFdoRkVM?=
 =?utf-8?B?bjJzRTM2SHk1Y0NsN3B6QW1La2Z5MldvYlJKa2Z5QW5ZUkxCd1JKMWk3RmdN?=
 =?utf-8?B?VDROd1lhS04rNGo4Y3M2aXo1WjdOVjM1WjRyeEN1MVpYMHQ0SUNkbUhtNk01?=
 =?utf-8?B?SGpSclpDYUw0TzNDRDBwWEN6c0d3R2ZnN1AwT3hhQXdGZjRMNWloS2lja00x?=
 =?utf-8?B?RlVEM21BVWtBaWt6UDFOUDk3K1JUL3NQd2hKaEhYdzU0bnN5NDNTTm1CY2Nl?=
 =?utf-8?B?L1NMN1JlK3BGTDM4dWlKOC8zUG9wL05JdXZVMFVyMXFaMzJsOTI3U2ZQcjl0?=
 =?utf-8?B?N1VrSWhhNU9SYzZxQlA3ZnJIZ2JLNDYrS0g0cExCQ2FNSmlkNXhIbm9LWnY5?=
 =?utf-8?B?R013N3ZJTkJKaHJnSFQ4WGJMQXFtWGRYUE1ZV0dJZW5vemN6NHAzVEU2NEVH?=
 =?utf-8?B?ZEpQZTZBVlU2VzFaTkhUc2NDMEFnSFRLazgxU2ZXZUlYdDVQaXdCcFh1bm44?=
 =?utf-8?Q?lytR9u?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(36860700013)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:59:15.1290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30363a62-144d-44f9-4930-08ddb86ccaa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9872


On 01/07/25 12:20 pm, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 12:00:21PM +0530, Dev Jain wrote:
>> On 01/07/25 11:23 am, Lorenzo Stoakes wrote:
>>> On Tue, Jul 01, 2025 at 11:15:25AM +0530, Dev Jain wrote:
>>>> Sorry I am not following, don't know in detail about the VMA merge stuff.
>>>> Are you saying the after the patch, the VMAs will eventually get merged?
>>>> Is it possible in the kernel to get a merge in the "future"; as I understand
>>>> it only happens at mmap() time?
>>>>
>>>> Suppose before the patch, you have two consecutive VMAs between (PMD, 2*PMD) size.
>>>> If they are able to get merged after the patch, why won't they be merged before the patch,
>>>> since the VMA characteristics are the same?
>>>>
>>>>
>>> Rik's patch aligned each to 2 MiB boundary. So you'd get gaps:
>>>
>>>
>>>     0            2MB                 4MB           6MB                      8MB          10MB
>>>     |-------------.------|            |-------------.------|                 |-------------.------|
>>>     |             .      |		 |             .      |                 |             .      |
>>>     |             .      |		 |             .      |                 |             .      |
>>>     |-------------.------|		 |-------------.------|                 |-------------.------|
>>>       huge mapped  4k m'd
>> The effort to draw this is appreciated!
>>
>> I understood the alignment, what I am asking is this:
>>
>> In __get_unmapped_area(), we will return a THP-aligned addr from
>> thp_get_unmapped_area_vmflags(). Now for the diagram you have
>> drawn, suppose that before the patch, we first mmap() the
>> 8MB-start chunk. Then we mmap the 4MB start chunk.
>> We go to __mmap_region(), and we see that the 8MB-start chunk
>> has mergeable characteristics, so we merge. So the gap goes away?
> No because there's a gap, we only merge immedaitely adjacent VMAs. And obviously
> gaps mean page tables wouldn't be adjacent either...

Ah shoot. That is prev->vm_end == vmg->start in can_vma_merge_left(). Thanks.

>
> The get_unmmaped_area() would have otherwise given adjacent mappings. Vlasta's
> patch means in this case we no longer bother trying to align these because their
> _length_ isn't PMD aligned.
