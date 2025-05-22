Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A32FB6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900074; cv=fail; b=n3HGFCdRza7AYr2sFJGRn9twIBfo1cGcecUo2r7RRPXYlzGHKid5phvugYAyFTbZxcXXH88WaAGJVGCKUuF8PVlAoT2WhQ46tbNFlGU5YPlOJOJXETfcouWOe1eoZSv4TyXLC/KYSk757FX1k5kBg6xFp5W4Rl9E4A94IUkF3Hw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900074; c=relaxed/simple;
	bh=n9sxfBysc/9VfkltTDA90JWc6DYDde+mbkDWc9/LiLI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XT8XsJy4Be7m9xcJL4oba8hiHdu5p2E/LTalH2ienNqCVkre9bqLMdUkJGECR4/hPEWCDKoUWaKmaaeIeHcMYHFKUwmQu3sHPE3lL7ZvG6VhuwQfhykKq6IkCm5iiQiSTxDMhHLwlk07hH2r9nlaTGjglDG0fUYC4FusEDBZmZI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OCLolWX1; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OCLolWX1; arc=fail smtp.client-ip=40.107.104.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OCLolWX1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OCLolWX1"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TIf/G6ajQ5xkf6m0BhfQE/EeU0DAV94S4pRYFp5YuZqIU29uKrH1ebPjWpSNgsTSV1KIpoK3rBfqENslfQFplTELrwQ+HkvhUzMzULPbN2wHONYVFiJm33Xn6pYQxjdQrgREG603n5I0lr9YJNq7OF2GhYoqSVagx/anif8G6FGAPW6GqH2ArbJvFgN7V3IXKKDYKpZtAvF48vViSstXwPffcxGCJBRfFiufxz6ehlZBlmqi9+u2SNlJ7+ZkxENLl5OPhs3cUca9mQBI80HRE0CqHvk4uE19wloyOMekfqvknkD8Vo1pPDegTvR1aitn7SgbbliCO6kqHF74wfelwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6JXhf4ZZ0UkgTFD2VN1iCQwo8ywEemhvP56v3y6SFk=;
 b=apkRNgkPlWko/QdvehfTcYByfYyp77bPgE8aj54GpOYDRxfit2BA6q8KkVMiH3liNVKTUXJRyRipGN1HzfGfzLy8Mol3DgsQ+DC1J0pWVPnvDHpUeBjVp9w9GySmisvwQXjxyw3i5NCPLUzE9xSAfEplIxsfFOxTQYG86dcRMc1+gDi/DyslRAclEmA6pxCh+zNwTDTiTmf6OqcOGquXqol4b8C8YPu6SWj7B5GZj1BFC0cA5LZf67hRvIjk1QG3MvjgapWm0hKsFbvJaFWngWSVZvid0GlBybFg2YOFqX6xu/g/9u8c6IREu5zE2SZFmB6d2oIumcLktU0Qs/sHMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6JXhf4ZZ0UkgTFD2VN1iCQwo8ywEemhvP56v3y6SFk=;
 b=OCLolWX1xgJflxdkCN5yf3PDnZEjsPjHfx8z9SJBMjz6lsJO3Tq+82zkZ+vr9k1f/biNTZI1dXqurHHEiwiRm7ppzlaUpHBd0U3vVoCDR+22eb3Q8Cq6huqaF3f6WU4xzN5i9AOp1SzhTl1lEoXUQAlb67eT/bWQ1WJhWfMygw4=
Received: from AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::17)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 07:47:48 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:208:e6:cafe::c8) by AM0PR10CA0100.outlook.office365.com
 (2603:10a6:208:e6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 22 May 2025 07:47:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 07:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZnkDVdJb1JHjSb4VOtj5Up+5cpU70ewCpMc43RQEkNNZ/u2OTaBDxy+YW5PHPBjCUBAfM3BwS7U6b1Aqr5eL7/PvheN2mC6ZGSHDXgaTBPvciprJ9UZQUBIkHM/MiYTJ0MsFctIRnbrznJ5CxSWq/zmXwoe2MpBVoya2zRE3XCp76Jjlsxu/OMorSl77glED88FQLNk+hu4gdvoc2yGxgn8W03vhOk+OEtO1mXJjzUIuoDghTFY9kBfe177NtN5jxS5eyLB/z/rPzGuZ0vKp7gIjULpibujm6YYQ6EPT60qeK/QGH5oMV/FfAXkRTk7uL8v0awilKYZafarWQGGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6JXhf4ZZ0UkgTFD2VN1iCQwo8ywEemhvP56v3y6SFk=;
 b=caYbNx3dUfEgLxd3eTRgzfy6k8S8VpPeHzRZZUYwp78c9NwYOZ0Ocwd+uBgaV3NDou9Ppdlp3iAHHlesixs4aAOHeibnBT8JTA6sJxQVHAvNHlOXD8D9o+M5wYlv6ZF985FCqiY10od8zMdsZyoGxCi1B+UhF15ywcGmuBP+a56g7tKWo0DkJEHoamRf80pNEaz1Mdepfa7xkfI+ESUv8VCp/4UHsdO8n5NKC5OFSf+rDjIWVNbT52K6f/YvRx0aILUlKbyrh4EZQjdkhHoqzT1jiAIUgIIKXIyCJe2nWI9GsWSfLMI8hCNHIZ0Z267SGt2wCFmbRT10fpISLXk4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6JXhf4ZZ0UkgTFD2VN1iCQwo8ywEemhvP56v3y6SFk=;
 b=OCLolWX1xgJflxdkCN5yf3PDnZEjsPjHfx8z9SJBMjz6lsJO3Tq+82zkZ+vr9k1f/biNTZI1dXqurHHEiwiRm7ppzlaUpHBd0U3vVoCDR+22eb3Q8Cq6huqaF3f6WU4xzN5i9AOp1SzhTl1lEoXUQAlb67eT/bWQ1WJhWfMygw4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB8228.eurprd08.prod.outlook.com (2603:10a6:10:37f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:47:10 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:47:10 +0000
Message-ID: <4f97491c-b0dd-406a-9ddb-4f4424571704@arm.com>
Date: Thu, 22 May 2025 13:17:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
 <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
 <25c0c700-656c-4a8a-8ef1-5093581cf25c@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <25c0c700-656c-4a8a-8ef1-5093581cf25c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB8228:EE_|AMS0EPF000001B4:EE_|AS8PR08MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 86310865-4967-4793-844e-08dd9904f0f9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VmdBaFY4M3U1S1R2d2tuYXdTRkxyZkV1czFVTjh1SE9hQjJYd3lxMHdxdFdU?=
 =?utf-8?B?TDQ2MXIrdTVzOUpxZ240L0lPL2ZxNlRka3JMNW9FWFp5MVVobTN5alM2YjBu?=
 =?utf-8?B?STI5dU9Ld0dKOGJMN0tkSThnUDFuQjVqdXpCeEhkZnlCTUUyUkkwdGxYR1dk?=
 =?utf-8?B?UFZXeVQ2RG9PTUZiM0wrUEdvQ3RNa0ptTHhXUndvTVJNS2c0UHBrSzFpY1pp?=
 =?utf-8?B?a0dzdnNMOTJTN2NMMW05UldxSkdsOC93aUgwZmVxTXJzSHRLSXJuTy9Wc1NN?=
 =?utf-8?B?aWJnN3pCRUdNUlYxZGpwQ0pIbm9lN3RKRFFsMzh0bUZpcE9CUktZSE9rcWtS?=
 =?utf-8?B?eTg1OTl0VjlTTjA2YjU0UkZjdHVqWGJwTUpLdkYrYm1Ya2pXNllEaFV6cEhp?=
 =?utf-8?B?MXZWRmhmN04vZGpOV0U2ei9HTC9lMGhJQ0RqNy9pcDEvaVdlaVVzWERaSXlt?=
 =?utf-8?B?dU5zR1gvU2Nzd3YvalNMQng2eUloZ1BOVnBJN0dqVzZzZFZ6RTZmOGpFQWlH?=
 =?utf-8?B?eEVMZ3dMekZjWE8zWGJPU3gxMGxEN1UyTHpyWEFSeWhWRi91YUg5MDJuSUdx?=
 =?utf-8?B?UW9lZEZsYTdCR3MrSXFyRm1XdWtDdW9yTHdDTFJzUW01WjNTRWZ2Z25oUnJm?=
 =?utf-8?B?VGY0ZUplQkdXY25UOE1ndTlhbDJnYnk5RklDclpuR0c0dFJOOHNNSFh3bjU1?=
 =?utf-8?B?VFhOcGoyUEJzblFrTThocEZBQUZmNXI0SUtUc0xOeGJ1clNRdEYzS3ZnNkhn?=
 =?utf-8?B?QjJYenExcVJzRENsS0Z6R1BNMEFNTHAyTWkxN0lXazF4akxndE9ZdllyZXFy?=
 =?utf-8?B?VkFDOXhLTkdEYUIySXZVWmlVTHloS2tkYTVyQ3RxbjBjNkFmV2k4WFZIOXR1?=
 =?utf-8?B?c2RPeUluRVBVUVJZT3pIRG53UjNIdnc4bE14NWE3VFBkUXBSWVUzOW95bUFX?=
 =?utf-8?B?M2czY1kxVjdjam5vRW1vazBiUnFLYm8wTncyKy9naS9Icm1mNFVDSE80Z2JB?=
 =?utf-8?B?TEpkM3JHQi9RTVpNZWo5dDF2amNQWC9KeWxhRTJ4L3hkN0I3RXJIUHQ0OTVj?=
 =?utf-8?B?SXljMTRUQVcrR0RmVGxYRkM2eGhvcVBhT0tvRjBsUlk2OXd4dWNtcVZVSVZw?=
 =?utf-8?B?NFlEM1FScy9qTGRxRTJaMGliSXNhZFhlMU10NDFKSmFNWXdqVXJGUkcyU25U?=
 =?utf-8?B?V3VtM3p3SW9Ja1hOa0w0TC9UZHhzek5kWHVWQmEzaC9oSWRvMUFhd3pwQS9z?=
 =?utf-8?B?ZytuNlNsTXlhNzBHZXZEcDJkbnlBK0hrNzBwMGJvdHJxT0pLZjYxY0lwOHI4?=
 =?utf-8?B?S1ZZR0dzOU1tVTRRRmIvbjBSMGFnalJBZFlmV0pwVW0ydG9rWnN0Wk16YjBI?=
 =?utf-8?B?Mmo4TWVPZWlWYk9FSG5wbC80UHNyTHZsbTRsT3JxRUtoaUQzeWt5SzFLSy9C?=
 =?utf-8?B?RmFncHVyUm45cERRTVRxT2VWaFZQWGRuUUVWb2J0RU02QTZlRTRGYUZHckhv?=
 =?utf-8?B?WGFjdDVGYlNsaWpQNGhpUEljYXR1VFpnMys4ajl0M1RvUXNNQ2Q4SUxQSGlq?=
 =?utf-8?B?M1ptcUN6TEFxTXhWdDlyZkl3KzNFbmVJM2xUU1JMT2ZEV1BnQ3ZLK1R3U0Fz?=
 =?utf-8?B?K2U4dmovdzlkZFYvRDAveWloY1YwRnRxOWNpMnpCMUVaNElyVnQxb1ZFYzl2?=
 =?utf-8?B?em5GWFRWZWJ1NEt2SUdvMWx4c2RobkpvTUxXT1ZhcytFMzBhQWZrd1pCWHpl?=
 =?utf-8?B?UjJsTXU3ZHJvL21oWEEraEloc1FJWSt0Q3RLRjliS2xDR3JiS0ZJSHZMdHhN?=
 =?utf-8?B?a29KL1lZZkVobnhlWEQvNXR1aWt3QWJRTjVBUUdpT0gzenNuMHhLUmhaR09n?=
 =?utf-8?B?UzVUaktEMTJHMVpacHlGbDVHM0poS1FETUZrT29qakc1VXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8228
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29686405-aab4-4cab-55bf-08dd9904db79
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDFsNnNGbkxVM2d5TTZGYzFlR2FleFlKYytrOG1oT2lRWUtBa0RwVEFZRU9o?=
 =?utf-8?B?a2NFZzlrOVN4SWlLR1pzRFd3T3NoQ1RwQkhobTBxcmh6eGlLZGRRY09LNU1C?=
 =?utf-8?B?azRQTER5MzhRTEpWc2RKQ1loQUVnZzMzTk9lSXlSUVlPNzZ1aW44ZHNpR21S?=
 =?utf-8?B?V1Q4RENYZ2trakZkZC9ua1N2VUZRVEZpamdsbENiUEJtSzc4SGVDVDZ0UVRm?=
 =?utf-8?B?TkxOOGRrRDV3K3V0MDhTalZudHFtRTFKWVU4dytpT21reTRiSFRrZHJMSGpB?=
 =?utf-8?B?UnBPazB1L1hYaWNPM3ovWm5YNzJIaENNYmtwUlZiSm9qdE1mZjdqMTVzU21U?=
 =?utf-8?B?ZzNQRHhkQ2J3NHZNVmtaNTFycFROc1dqMjhiMTkrWWpCdWY5aXBrRStPU25K?=
 =?utf-8?B?ZjB3ZkhzcmRqYTN1NFVVZEN5M1FLN2h2S0NFUzVTdFFBOXVmUG1xeW5ZOVh4?=
 =?utf-8?B?dU9INHUvSWplaklGWWdOQmxDanR4WUQ4bm10OTUxOFdBM3B0VVB6Zk5KbU9r?=
 =?utf-8?B?U01uSEFhdDFSNXJQbFZIL2NDbDQyeGFTUEs1QVBESzFCdTFJbGRSeDM1TGxl?=
 =?utf-8?B?M2FSOUNmSXZhcWxZMTlCYThlY3VXcXYrc2VJSUhXWU1ZOS85a05PQ29Za1Jn?=
 =?utf-8?B?Yi90WTlhV0U1TVRvZjRUbTlNMUQ3bmRUOTV6YUNQNlE1RW5wZjdYVFpLaDg4?=
 =?utf-8?B?R1EwdVhoeHNvbVdJcWYvSWhZakJPM1oySEI2UGxDMzZpa0ZGZGNSYU9jQWpv?=
 =?utf-8?B?ZXY3OEpXZlAvQ0QyUElDYmtoSHp6OXg3djZDZndBbTdRR2tab2M3bWlpVDdi?=
 =?utf-8?B?VHhKb2R3cmVDNWNYNHpYckZqT0tnRHlpQnBFb1NjdFBXRUNTZkJubnlnVThX?=
 =?utf-8?B?TlE3dkgydGw1Y3FyYXlkY1VMREdqcy9WTjdLQkpNRU1OUTl4TXQ2Tm9GamEr?=
 =?utf-8?B?WUwySVN1ZFNqeFZIQUl0c0QyREhrUG9YYXZHazlBZ3l5MVNDUTJJMGNjMGFK?=
 =?utf-8?B?ZldrNTA4WHNUOVZHNlZ1cHdVdFhOaERYRS9qdFIwaU5OV3FEZWEwVEFOcmN5?=
 =?utf-8?B?UjZSRENpZHVCRzlWTURVeHZnc09ZZ0tVbkQ5cjh2WklKdVRBNFplN0JqSXY0?=
 =?utf-8?B?MkZ0SDNLMmQ5U2s3elI1bXBtWVArTy9ybnRHVDJ4dXFkOU0vT1cwWGFJdWZD?=
 =?utf-8?B?dU16anJDWDRjS3hycUlZLzI2d2phMkFVSGh5eU9PanFaS1NRK0NYeHV0b3Y4?=
 =?utf-8?B?ZXhVaUgydFhoeUtJalgzVzVsVEZTZloxSS9ISHFLejJzTkNBYWdpT0l2MjY1?=
 =?utf-8?B?TGtHL0JiQkJOZkR3b2xmU0toRmhkRENnT3BOT3ZqcmtGdiswMmovT1l0TTFG?=
 =?utf-8?B?TXMreThrc0NIMERIb1Bxc29HY2RPUElvUlF2OGkyci91a0FESzk2am5lUHB2?=
 =?utf-8?B?Z0VLa0ZVREdUcm91SCsrRWJRUCt1cG9IcWV6MmhRTWpFcjJxTjlqT3h5Z0dP?=
 =?utf-8?B?L0xuWnV6VFFaN0tTc0tSMlNCOXJUMDFrZk1IZmNUdDUxSkFLZWd5ZFdPMnpX?=
 =?utf-8?B?WHh1TmU2dW91TXpweXRobWZNWWgzQ1MzNDRCcTBRNVhLU0xFUjZGYzArMkJv?=
 =?utf-8?B?QUhyZFA4Znh5dlpGREhqOHNLckFNSVJBbEdBWUdlY3c2cFAxc2ZRRm5IeE9n?=
 =?utf-8?B?RkFJUG1ZRUVyeTNBNFJNYnpHTVY1Y3hHQWZQd0RDTldodWg3RWJwWndOQmlx?=
 =?utf-8?B?KzNBL01Ld1kzV09teGhlTU9HeHdKS3ZNSDlwNzVPZ0w3UTgzNlc3RWFGWEov?=
 =?utf-8?B?NGE1K1g2VzVXZmRmVTBTbmRkUU9OTWQyc2owSnJxaXN2Q0ZLaHlvTGRvV1hn?=
 =?utf-8?B?TllTMGo3REh2VUc3SWxKSGFLZ2FWTVBwQzdRcytabjJCVThmWVBsb0lENE0w?=
 =?utf-8?B?UGpFTEhCY2REMDVxVHc5NDYxbk1WeWh0d1lmS3BNcm1zQVVaaWtrS1BYeGtG?=
 =?utf-8?B?YkoyY1hnb2h0ejhOYVNHZkpRRi9ZcE5jNzhLUFI1eXFtaEFpSzFqRExKT0tY?=
 =?utf-8?Q?FUZjQy?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:47:45.7480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86310865-4967-4793-844e-08dd9904f0f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867


On 22/05/25 12:43 pm, David Hildenbrand wrote:
>
>>> ... likely with a better function name,
>>
>>
>> I want to be able to reuse the folio from vm_normal_folio(), and we also
>> need
>>
>> nr_ptes to know how much to skip, so if there is no objection in passing
>> int *nr_ptes,
>>
>> or struct folio **foliop to this new function, then I'll carry on with
>> your suggestion :)
>
> Can you quickly prototype what you have in mind and paste it here? 
> Will make it easier :)


if (prot_numa)

     func(vma, addr, oldpte, &nr);


struct folio *folio func(vma, addr, oldpte, int *nr)

{

     if (pte_protnone(oldpte))

         *nr = 1, return NULL;

     folio = vm_normal_folio();

     if (!folio)

         *nr =1, return NULL;

     if the other skipping conditions happen, goto skip_batch, return 
folio and set *nr = batch


     if (sysctl.....) {

skip_batch:

     *nr = mprotect_batch();

}

     if (folio_use_access_time)....

     return folio;

}

