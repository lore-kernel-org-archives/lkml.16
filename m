Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76E1A5BB7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750913707; cv=fail; b=q9PNHZB0i39twCAelrtqtE7Z1UVPzWvF8hU2em1ZtqUKF3nLo0SpTk43QVOyfzWlR1Uf6SkgXzS70hVfAw1uebYFzBkJIwGjcWzwla4nGV04es7T6SBHxk42s18omu8VS11QmT5wme8qxjkRmTU8JsUX+vupoUVQSeveB1P2uaU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750913707; c=relaxed/simple;
	bh=Ctoxv/oc5kma+zsZ9uLTlCukRsGdtbNDRwl5aFQyQOM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QWP48ldQPk/PpGDu9KKD4W2YI8x0OHV0x3JGNcshKAeEvA+S6mHEnVSnn7oWZUfEeezYoGCYw6GR5kwq+DzJDDeQ71cOhlQRXUpqzfTL4Rbf/C366ymA2w0eGPrUbKyXSPstpxRqXtHDD7i0/qIsQ1eylpU7WNQtTTDEzmZRL7k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KR36hoHH; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KR36hoHH; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KR36hoHH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KR36hoHH"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M++ymli3VNrUFNTpnfrd7bFT6gvYXvwB7IzcLlpWfjkKH67gMRxh4wqI6AFfj6pmLM/umzDIGIbGSYjuYL/qXHaGWNqkUvkJQOTtBxofnC7NnSXF3zsBTKRlbxl115evaiot9OCESFjTq7f01tfgwxc+CLIIwzT7Op+q/4NtHnoQBG9gZYr3HMKnHUGKFPYD2nH7oXPVFGAX5BgMP4y72WdHcjCRI/4qcNK6AcmIHI03r/cn6s4DjoXFa4obDdfRVlzj+Gfw+uxWtM/BWVZ33aM/TlKMQ+O/zwsNftWbYRNrSSb90zZzWvQG0cLypIcmyyBql90W6ZHb9EglGk1GYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSbgKE9EkjyzVy6eAuSdQBN4xTcaSOdKzyzcWcXc1lU=;
 b=N0wSuMMPk9uAVMH0u3nGhxTsBU8BDohwJ2o7jl9ns8kroG1EL1P0NhYufFQdIlmyVfwceRP6tBWuBudY2coCeF7oem1Vv/pR/JhmIUNwVVsGiKALfmtGr78K7XnKt0j6jfFB8lC52tOQFnxdfhaBw1U8W9Qijq5AM6bm32yDjSXk3hWSVMrdsyOHDEA32WEk5s7f8q0UYmNh/26VYBqp6qlr66KakSBKomwiCW9Yey6tG7b5NIToLLSVMUzb1J9eJXh07Ghy6XX4b29fxTEBxtOwxyPU96jD2QVPbANkcmfe+dqkEDvewhDQkf0dr5P/5VR4l5YtpzjG8Dw528gOCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSbgKE9EkjyzVy6eAuSdQBN4xTcaSOdKzyzcWcXc1lU=;
 b=KR36hoHHVBxEZ7T+/SeeRyeR/F/6+09vdQ65T/RQ6SwByc+o9SxHdpSrsgL1HKdJa5ITA46oBsMYxEFw2TfDNG3vr8zZUyN7j8kKME25SVJVKOhKEGr3ZwJf9ExO/U5Ov+ABgsMd8G1JujrI1PeOHq1/61pXEWVzwkN1qg1let0=
Received: from DU2P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::34)
 by DB4PR08MB8198.eurprd08.prod.outlook.com (2603:10a6:10:382::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 04:54:59 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::26) by DU2P250CA0029.outlook.office365.com
 (2603:10a6:10:231::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Thu,
 26 Jun 2025 04:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 04:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCdQtpb41CiC40pkE0t7U1XHzWaRvMuaQY/ONe/GSE9dAWYRxJzxfqtZ8VH5ErRfd3gBHkKaW0HAMVcWxx1hNgYjSxoFfqj+tGEnpF2OzNagCy9C9DdyV9VZkd7JwJcdRrDBSE2uZI83J26fJFIC0nJwg5rrJioHhXX/MTU8xokyyrRTZ/mQSm8b6l7hxO0xya+Q8gtiVS5lB/4SvLiQlPR+Hv80d43B+z2rHfkQrZgxDDWTYjeHxYUWkfpLJM6GD0A1VaTV/tg3oDFfX7iHny9pjwDvUsSSbqzFK75QSfiwyWxW5Zrc6ZTuKktEcfoxpp+6UcuuMu3bpoHpy0aaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSbgKE9EkjyzVy6eAuSdQBN4xTcaSOdKzyzcWcXc1lU=;
 b=MkE5/9bLMW66jEM2UMJjvqq9p9zN7FXo12VQpBa8Mq7EgiI0ks3kwdepWnKssgLMfdPqIRdlO3GhLIAv3Z04u5WDOXpdwYW+fAwf4ONNDPFNuc8exdA2MlMNgpoVcBhnkxug/7C7TAPHxNniJCsmxaux4K6J2IZLvMxbhvX0emPeb+4CJOKHWW23DANLTDHP0wf/nYb+Nbs5D4c3W04jvUNJx66FPA5xGGuRZtU9eimG4uFCtpZqh32eI7DPJY36wB3pojmaQYr92OdT42fR5v9J/GwNacivXdrmv6hFwP2qxHgYyGpATiHIyAIV2CXtdfLTdGeA33+5nmedBESJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSbgKE9EkjyzVy6eAuSdQBN4xTcaSOdKzyzcWcXc1lU=;
 b=KR36hoHHVBxEZ7T+/SeeRyeR/F/6+09vdQ65T/RQ6SwByc+o9SxHdpSrsgL1HKdJa5ITA46oBsMYxEFw2TfDNG3vr8zZUyN7j8kKME25SVJVKOhKEGr3ZwJf9ExO/U5Ov+ABgsMd8G1JujrI1PeOHq1/61pXEWVzwkN1qg1let0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 04:54:22 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 04:54:21 +0000
Message-ID: <30b7eb92-c1cc-4cab-b056-1200938f3633@arm.com>
Date: Thu, 26 Jun 2025 10:24:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] khugepaged: Optimize collapse_pte_mapped_thp() for
 large folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-3-dev.jain@arm.com>
 <71350398-b5d8-45b9-b05c-d2b63030f766@lucifer.local>
 <8109236a-9288-4935-8321-dbff361dc529@arm.com>
 <e9b027c8-9db9-4950-8d25-9984ae0a4de1@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e9b027c8-9db9-4950-8d25-9984ae0a4de1@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::26) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV1PR08MB7313:EE_|DB1PEPF000509EB:EE_|DB4PR08MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fab14a5-cf8f-441c-ded3-08ddb46d9973
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L3dHQVpCbFpzRFZRMXV6enhZTkVMeGdKbzNXRUJzcEFJRHlZZmpmUmhUY2s4?=
 =?utf-8?B?NXBndjJTWE1zbm1YYVJlV1l1R0dZWVBQekVxRDhsR2c1V2pvQ25sRlpZTHBk?=
 =?utf-8?B?Y3FpYytHMnVvQVgvVldQYXNvWW1nc05lcWZuaDNyNkRlUVR5QURCazlkdWJk?=
 =?utf-8?B?T0VaakhxdzV2Qm5YOTJSbkZzOXI1WUlDS1BPWlhDaCtTaUwraXpSTTNtZE5X?=
 =?utf-8?B?NHF4THVXOEVBOVlrOEdKYlRhdG9HMXZ5bGlhYWpENXllcHNRRjF5NXBOeU5N?=
 =?utf-8?B?RTkxWmRCSXhyZGY0OEF1SDlkZHk1OXBlYU1NWGc5VXp6Z2ppM0xRQWJRZExo?=
 =?utf-8?B?TTFWR3VNN05HQmJuaG9DcDZTbUt4QSs3SXIzRmxia3E0TU5HdUhpNExzYS9R?=
 =?utf-8?B?ZlE4QUR1MmFndjB5THhSUW9SU3lpSElMNjJDNnIzTXlhL3lmcFJ2S3VMeEY1?=
 =?utf-8?B?L1J3VVQ5dytGMXVzcmN6VHBBSXFWOHo5SHRTci94c1pBOFgyeTZtdmJTd1Bz?=
 =?utf-8?B?Q0RidFlJL1kwNG9aQXMvLzRQcWtORTRpQTMreCs5VnkvNlQ5SkJqUlVzNjBk?=
 =?utf-8?B?OVRXaWZzUVBPWVRFTnZ4M1kzMGhxL245SUdIMnE4NnR3ZFVyT3RtQUpZRlhU?=
 =?utf-8?B?d2U4ZzlrZDNNME1PdDdaYWpQdWt3WXFpQnM3RHlOOEc5RUJ3N1VVSWpLUFRK?=
 =?utf-8?B?QUlCS1FEdXo3Z1htOWI2QmRvaXNNdUhKdlB5OXZZLzZrTm9qeDU2N3Raa1c1?=
 =?utf-8?B?Z2ZTZHJGaGtEN3FEMGV2SncxU3VQdjVKa0ppQmIvV0pmWTFlT3pQSENaOHpW?=
 =?utf-8?B?bW5LL2RRSTlUZ0tLdmZTVC90bTRUNHcrcXk1Z2owbk5WcDVkbWFZR1ljMXhZ?=
 =?utf-8?B?UXhGMlkwb2tJems0L3pQSVl4QVN2bW9WUjdvZ2E1WG9uQWk5Z2FMamxvY1d5?=
 =?utf-8?B?NXlFSlE1U2JDSFZjOXE3UFRldU9EUzYxU2hVeE9TR21YZGtaK25ZL3EvRVRB?=
 =?utf-8?B?ZlZBR2tzUTRGRGJSRUI2WmYrcnJDcjNNNGs2emVBVW9FY2dlQ1NFbEVWQllP?=
 =?utf-8?B?NnZ4Q0VzV3BHRnlHTkhISWZ5NzlOTnRrNzBCQndTUU03V2tWTVBvZUxPcGUw?=
 =?utf-8?B?d0VpK2QrcXlhZW03SEZpY0hjSXdWZHhaQ0xxSkNjM0VKaW5TYVFHQUVmV09B?=
 =?utf-8?B?bC9CYjluTEx0SU1xVXA5eFVPL05DbGNMQkhqV1dQWGFNM282Q2FtZWtrdXd3?=
 =?utf-8?B?RGpTV05la3U5MVc1OHkrRmwyTEhieVJJUS9Nc0VNUWkvUzl6T3FvV1padFNH?=
 =?utf-8?B?NlBuZGFvdUNnM2UyTkp0WDFvVkt5ZGNEWGhoODQxdC9iajZLL3R3c3hSSzNP?=
 =?utf-8?B?dnFOc1FIOG9BVXpzUERCVm9rU1Y0ZHZ4cCt0dVh5eTE2cnJ6eldHOWxnc1Er?=
 =?utf-8?B?Yjk3dllyRHhWWmdCYUJvUEYwakdlZ1BKYTlIRlN6NC9YaWxjb2poOXNSOEhS?=
 =?utf-8?B?SmhlR0puKzVKTEFYZkJLajVwVTJOcjdnVXJLWFJEOHh3S2xDME9yQ295VHJI?=
 =?utf-8?B?dUJYalRqY1FlM2ZwM3ZKbmpHU3k0Mmg5VTJsTWNGU25ZSHVEdDRZR0tNUXg0?=
 =?utf-8?B?TkN6UXNuK1ZaZzJNQUxZQWtMZkFRTmd1eG5hbTlnSDZRTEdjQ2d6elMzbUlG?=
 =?utf-8?B?bXdQMlE0a0lCeVpnYnpRU0hLRVhUaDFsU2cxMHVOcDJUM0prQ1g2bk1ENXZz?=
 =?utf-8?B?SjZBbzFTem5USmtLN2U5bDRVczhtdWtsVjRQR3dHV1E2S0I1ZnJGSkRxSFE4?=
 =?utf-8?B?TXlkdDI5a1RDbE93WTBTeVN3cEtjYlBGN2lqaDdsakJWY3Y3dkpGWTBDR0Fw?=
 =?utf-8?B?aC92a1R3QStKQzlOQy9WWEdVVzJ6ekQzcWpMTUd1bEFSdGc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	878335d7-62de-46bf-ca65-08ddb46d83f9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXQ3eFE2eThRQllsa3hRZm1YRzBROU5wekgwRHVxVlpNQTNjc04zLzE1L3ds?=
 =?utf-8?B?dWh0ZVhCOS90ZEhQWVlyNk9PUTU4bUdDbENGUFAydVlCaDFSSnBHSDNWYXhV?=
 =?utf-8?B?dTJxQmhiK09Gd2hyWlRvTlhQRkVxQXhLZTRycUJpNWQ0RFFIbGQzaXFFdEQ2?=
 =?utf-8?B?dTdQbjB5TTFiM01lT3VvRzRYeWNHSXN6NFVJcjlXSC91RlJuaWRkMGNkVXc3?=
 =?utf-8?B?M1FvZEZUMGJDMkhDaHBRMmxzRzFYbkpLL1RUZWV3TmdaVTJyOFRiZStmdTFs?=
 =?utf-8?B?amJDWG00MXAzNGppakZEaVZMamNNOVlETy8ydU0vOXJ3eHBsU1pobE5MeEJ2?=
 =?utf-8?B?a2hlcFV5VGs4V1M5YkNTWTk3SVFCSzQ0dWVJa201cFFZUlF1eElPdWttMG1y?=
 =?utf-8?B?ZlEycEZLenhGek9XOVRrc3ZJOWxiVjZ6dWhvUXRtak5LcVRZR296WG01RCtm?=
 =?utf-8?B?UENYNGZnMCsxeWxKYUNqRjZFbjFxUTRLQWYvQ0JPbU1ub2pwSk50SkIwQ3Jl?=
 =?utf-8?B?TmFKZ3dnK2o5Y3lpMCtqUFBMMVQ4Z1A4bXFBTzBZc3l0WmhhV0Qvd2dsR1pI?=
 =?utf-8?B?VXpnZGpyYUVoVlJhWFA3QmpqcUl2SWlqVGQrTFlIMU5EeTMyUG9ZcGM2QXBs?=
 =?utf-8?B?QWJBR2Y2REQwSkl0VUFlVEZhYzVwS2p6Rm5jWHRCNEpNWFFjL1VoSTMwSzR1?=
 =?utf-8?B?QVZ3UFIvejVMWVBPSTdUZWNneUQ1V0tRb1NKcVFWa3lnZ2RJR0l6R2IwdnE5?=
 =?utf-8?B?ZFNxdUc4WkxldFlSbUx6NXRBeklOQTVUeHVReU53VW1ZYndsa2FJbmUrZE4z?=
 =?utf-8?B?a1hVTElzVTRtUHNSWDkxY3RvdzZYVStsb3JVNGovc3JYaEgybnkvNGp1UTJV?=
 =?utf-8?B?aTlNa2tYSVpLVW1jTDFhSGN2ZTQvMGcvUkp1K1pyVlY0dDAzakoxOWhaYXVL?=
 =?utf-8?B?NVNuTjhTU3hrZmQ3aFlwMCtrclUrNnNLUTNPeVdYZ0lvdFlNMklhT1Rndm5Z?=
 =?utf-8?B?azF0MmxCNXhoWlhsM0JHMmVYbzJMMitldzU0RzRqNEtveGhXK3JBTnc2UzZm?=
 =?utf-8?B?MkFTKzI4NFRWN0l4bHdyai9weVVwZVZhVndKd09VUHFXYmdMZVJWRVl3Uldn?=
 =?utf-8?B?WVBMU0tEWWQ2R1FZZGtCdlkvUVh0azViYUtLMkhha3E3eEhoYXgzNzczamNM?=
 =?utf-8?B?UTRKZmhMRzB2Z1k2c01mUkN6eEREWnd6WUpBRHZTcWY1cDdscFpBN1hCSmlL?=
 =?utf-8?B?bEhKODZ4ZDhZeXZHaHA3c1FSR200YzFkLzFLSlJ4clZkajVrRWZJVWhOK3hW?=
 =?utf-8?B?K3pBS3lFODd6bXNxYW9tTE1EanNxbGxMM3VmcndqWkRUbUVNM3hWaTlKcFBR?=
 =?utf-8?B?WHZNekxNK2E2c3YreUN6NnBkSEtFVWc2cFczM1hmdVE1SW5OaE96bnZmUi9r?=
 =?utf-8?B?MGFXclpsWWtxSnYrNWlZS0VsMGkwR2JxYllWVnBmQm5yQk03QjNCM29UaVhY?=
 =?utf-8?B?aTcxV2pqbkt4b2RIWkkvc0lVayt4TERpMGdPYklXMGZVQjlQOHM3c1Q5bDdD?=
 =?utf-8?B?OHY4aUVoK0U1MklDS29Sd09KbUhqRGlDQlA1SzZtelZrSVRHTlJvakJVc0Jq?=
 =?utf-8?B?UGlHTjloclJ3MUpEOG1vMWpNSXRoZEZmcTk2Z0x1UVA0ZHpTcjZVU3JNRlcy?=
 =?utf-8?B?WjZGZ1dMQTFyVkJQYXAzOHNxZWVmcEhrZmVvZ0VzRlMyRmZWc20ybVhjaGlD?=
 =?utf-8?B?bktHM3RsYnpyeisvRTd5Z09ka1NLdEF2QmhlbDhnSXFLWGFtT0o5M3BVck5G?=
 =?utf-8?B?SWNKRDAvaWQzNDk4cjJVeG13WjE3K1FiUEp0RzBUbHIyVmcvblR0TkM1aURm?=
 =?utf-8?B?dnFxVDRCZ1VCUlIwblBrQ2VYVlJVQzFSQjZBZk92ejhTWmo4Wll2WlVBblNF?=
 =?utf-8?B?TStBaVNlM0tGMXR1TDh1am5zdS9oU284bjVGaGw0VW95ajJwTFFiT1lkTjFZ?=
 =?utf-8?B?SlVYU3NMZk1uZ2NYa0ZjV1I3RzFONGpFZVc0bjFDa0NWL29Wc015RnRWUTBF?=
 =?utf-8?Q?NGK1lj?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 04:54:57.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fab14a5-cf8f-441c-ded3-08ddb46d9973
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8198


On 26/06/25 10:17 am, Lorenzo Stoakes wrote:
> On Thu, Jun 26, 2025 at 09:18:47AM +0530, Dev Jain wrote:
>> On 25/06/25 6:41 pm, Lorenzo Stoakes wrote:
>>> On Wed, Jun 25, 2025 at 11:28:05AM +0530, Dev Jain wrote:
>>>> Use PTE batching to optimize collapse_pte_mapped_thp().
>>>>
>>>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
>>>> Then, calling ptep_clear() for every pte will cause a TLB flush for every
>>>> contpte block. Instead, clear_full_ptes() does a
>>>> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
>>>> starting and ending contpte block, if they partially overlap with the range
>>>> khugepaged is looking at.
>>>>
>>>> For all arches, there should be a benefit due to batching atomic operations
>>>> on mapcounts due to folio_remove_rmap_ptes().
>>>>
>>>> Note that we do not need to make a change to the check
>>>> "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
>>>> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
>>>> pages of the folio will be equal to the corresponding pages of our
>>>> batch mapping consecutive pages.
>>>>
>>>> No issues were observed with mm-selftests.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    mm/khugepaged.c | 38 ++++++++++++++++++++++++++------------
>>>>    1 file changed, 26 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 3944b112d452..4c8d33abfbd8 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>>>>    int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>    			    bool install_pmd)
>>>>    {
>>>> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>>>>    	struct mmu_notifier_range range;
>>>>    	bool notified = false;
>>>>    	unsigned long haddr = addr & HPAGE_PMD_MASK;
>>>> +	unsigned long end = haddr + HPAGE_PMD_SIZE;
>>>>    	struct vm_area_struct *vma = vma_lookup(mm, haddr);
>>>>    	struct folio *folio;
>>>>    	pte_t *start_pte, *pte;
>>>>    	pmd_t *pmd, pgt_pmd;
>>>>    	spinlock_t *pml = NULL, *ptl;
>>>> -	int nr_ptes = 0, result = SCAN_FAIL;
>>>>    	int i;
>>>>
>>>>    	mmap_assert_locked(mm);
>>>> @@ -1621,11 +1622,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>    		goto abort;
>>>>
>>>>    	/* step 2: clear page table and adjust rmap */
>>>> -	for (i = 0, addr = haddr, pte = start_pte;
>>>> -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>>>> +	for (i = 0, addr = haddr, pte = start_pte; i < HPAGE_PMD_NR;
>>>> +	     i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
>>>> +	     pte += nr_batch_ptes) {
>>>> +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
>>>> +		struct folio *mapped_folio;
>>>>    		struct page *page;
>>>>    		pte_t ptent = ptep_get(pte);
>>>>
>>>> +		nr_batch_ptes = 1;
>>>> +
>>>>    		if (pte_none(ptent))
>>>>    			continue;
>>>>    		/*
>>>> @@ -1639,26 +1646,33 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>    			goto abort;
>>>>    		}
>>>>    		page = vm_normal_page(vma, addr, ptent);
>>>> +		mapped_folio = page_folio(page);
>>>> +
>>>>    		if (folio_page(folio, i) != page)
>>>>    			goto abort;
>>> Isn't this asserting that folio == mapped_folio here? We're saying page is the
>>> ith page of folio, so why do we need to look up mapped_folio?
>> We need to check for all PTEs whether they map the right page or not. This may
>> get disturbed due to mremap and stuff.
> Right but I'm saying mapped_folio == folio right? You're literally asserting it
> here? So there's no need to assign mapped_folio at all, just reference folio no?

Ah I get you now, we can do the PTE batching directly on the folio, thanks.

>
>>>> +		mapped_folio = page_folio(page);
>>> You're assigning this twice.
>> Forgot to remove, thanks.
>>
>>>> +		nr_batch_ptes = folio_pte_batch(mapped_folio, addr, pte, ptent,
>>>> +						max_nr_batch_ptes, flags,
>>>> +						NULL, NULL, NULL);
>>>> +
>>>>    		/*
>>>>    		 * Must clear entry, or a racing truncate may re-remove it.
>>>>    		 * TLB flush can be left until pmdp_collapse_flush() does it.
>>>>    		 * PTE dirty? Shmem page is already dirty; file is read-only.
>>>>    		 */
>>>> -		ptep_clear(mm, addr, pte);
>>>> -		folio_remove_rmap_pte(folio, page, vma);
>>>> -		nr_ptes++;
>>>> +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, /* full = */ false);
>>>> +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
>>>> +		nr_mapped_ptes += nr_batch_ptes;
>>>>    	}
>>>>
>>>>    	if (!pml)
>>>>    		spin_unlock(ptl);
>>>>
>>>>    	/* step 3: set proper refcount and mm_counters. */
>>>> -	if (nr_ptes) {
>>>> -		folio_ref_sub(folio, nr_ptes);
>>>> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>>>> +	if (nr_mapped_ptes) {
>>>> +		folio_ref_sub(folio, nr_mapped_ptes);
>>>> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>>>    	}
>>>>
>>>>    	/* step 4: remove empty page table */
>>>> @@ -1691,10 +1705,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>    			: SCAN_SUCCEED;
>>>>    	goto drop_folio;
>>>>    abort:
>>>> -	if (nr_ptes) {
>>>> +	if (nr_mapped_ptes) {
>>> I know it's ironic coming from me :P but I'm not sure why we need to churn this
>>> up by renaming?
>> Because nr_ptes is an existing variable and I need a new variable to make
>> the jump at the end of the PTE batch.
> I thought you eliminated nr_ptes as a variable here? Where else is it used?
>
> Oh how this code needs refactoring...
>
>>>>    		flush_tlb_mm(mm);
>>>> -		folio_ref_sub(folio, nr_ptes);
>>>> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>>>> +		folio_ref_sub(folio, nr_mapped_ptes);
>>>> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>>>    	}
>>>>    unlock:
>>>>    	if (start_pte)
>>>> --
>>>> 2.30.2
>>>>
>>> V
