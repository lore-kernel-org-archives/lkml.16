Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2045.outbound.protection.outlook.com [40.107.249.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82AE55B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.45
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748412989; cv=fail; b=WiNceWD7sGhjUK/iwQAsCbJWhE0zpux2PaJGciW5MJXAmiU5OntDjpCJhj+WytYcP+xubi99tLXhT1Yrjmr7rcvZFiNGx7ueWs8C0Da4/A7jZWL8HFqWdG4OPmipCiEWp01fUk3sRRzgwHFAis4Fek55isCXLa3QFSJFdPIS8hM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748412989; c=relaxed/simple;
	bh=PubViw5qtqXlxqU28LYQFjcgQrlULYiGIK8oGNbIcuU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FrevjXrdhGWFw5XFZxLy6TVY6kGVx2LZyq5Y9HQW1WM++tCJRamukCsIVZWWgYnCuT8MpbrCVrotkVcKFhZ06qvElA/m+KgMAfOz9g3fHqkRDeYEZm5vzNI2gZrHZ1uG/+delFPooXAfEs4jO4Y7lkITeNpqNgSmlN0D2eiKTK4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NW7ahbfG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NW7ahbfG; arc=fail smtp.client-ip=40.107.249.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NW7ahbfG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NW7ahbfG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NrpWTkHpa1PL5rPijtpAgtNkNy1BgFrFwV4d7thIH1oFbOlUl+Pou+hSKgA7FE6aoSy/VFj3N9ax+9ws69xGTVHejl7tlAB1l3t5VnDlHf24QLZvtLJc/Qc/vaLhejz5SBptI6Gf/3Z1hCdQvmNESWL43e85DGNP7bCnd/sKnsIk91H/3jcQvObs+Graf/sY4JaAHfi2d8Lr94WaEVE0l4peNBqVbdFAnbgVZqtA6UUFxNZoSpchFYiC7yHpuQE4EuDX0V1ncCs6KOInsiXm+X6M41dA2DVcyHbBuOMgG5FSgsy1L/l4la8IZjZ1Wn4wTzTheSKBEjcYihZmsmStuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PubViw5qtqXlxqU28LYQFjcgQrlULYiGIK8oGNbIcuU=;
 b=tRQQZYm24dlZzp6PG+OiVXsuOETGzCL79OAS5YV0eFa2ccVsoi/6rANJgNeEXPLBufrHRzjGwDLMSOIGTyQiGevgzTQIjHyulFoXGjtP0e5Wlbz427L5VHMfjMLBdvEd/w4/oAVqxjHHynoZp2a9o0ctpRcRJHESYuNFQ4+TdIY1D9xGjxVVPP4v1ssW04kCyph8S8CMGYNQc3iI4VoODHNBnvqsOkBVQA2NaRzDEh2xAw+aEywS4dLxADOWacBRPJN8vj63WQvYghMnvrnf2aiHcpkgV/jAvnLwb6ajXb6cpjE/Dw8GSvytPwPg3QKUYT7QNSMh+FfuJrs5ViQ/iw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PubViw5qtqXlxqU28LYQFjcgQrlULYiGIK8oGNbIcuU=;
 b=NW7ahbfGKNgneVtM+N5j1WhBNzJBjJYeEZ+35XxVOzGS00SwxOIdkF1Z173QC815lTt22K5muC92PeBmVt6Rt2JMrpVIweYb0UUmYb+T3lvDOx+6FovSma3uHSBEHAuaAB6tZXpEb+tGlMT4nlZFgF9346Qabz+LOkufpgFW2Z8=
Received: from CWLP265CA0426.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::10)
 by DB4PR08MB7933.eurprd08.prod.outlook.com (2603:10a6:10:37b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 06:16:22 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::4b) by CWLP265CA0426.outlook.office365.com
 (2603:10a6:400:1d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Wed,
 28 May 2025 06:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 28 May 2025 06:16:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMDUekW9jtxQsO/JHmT72ySGE8EfBzEunVd92DMWqG55pSEPsNoGYCLxDL6fl70cTEodJh7YA5uxTm5SBsoqxtDzffnNvVQbnhiHk0M9o48HkjUu4gprr2TgznssVOoACQoC2NbizyPO3hnnSakFQUIZbg/gVBC0rajSJdafM3RwqyWUs2axqy0TVpuuT3E3MhLPF+EC6URoXHx3l1w2Fq4tI74xzu0Gh2MCTu0R8WTn1Yum+2sS8madL7pq4cobb40mtLRDJF5JJqCqq4xN/I9vi5hgryZLdBBvcSfKPrWer0zRmxq8kSFLev8R3EDtjQozPxXDxfOptTfY70WxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PubViw5qtqXlxqU28LYQFjcgQrlULYiGIK8oGNbIcuU=;
 b=W2sVOZrN6PxwDhsNmR6nTIux61XQsreYtyy/YPyjyYlt01ULc0DkJrg/r2EWJmENO+irwu+ttS366vOyR65wm51LPZNK0BYcNg5R/e2fhniZaHeQL4z4lLEK99T8pC98g8HXoGp17iC3SxU20CIBvR8dUXzzjhJx6swJYqQaf7x7yVPsZz90WwERTI9RyAprxeEi0/jztSfbeggyVUzMwVNR/5UrHYxZplPevODecivOnw3Z9Uf/E3VTzHN0TzgL1gFamYRlQJRtWnCu04lCdQNjuamb6TKzK0Rn5ID2LW5xt0h/+F7WTSUrZsZ4VBSNTScPxXbp1lqVsjtgTI98sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PubViw5qtqXlxqU28LYQFjcgQrlULYiGIK8oGNbIcuU=;
 b=NW7ahbfGKNgneVtM+N5j1WhBNzJBjJYeEZ+35XxVOzGS00SwxOIdkF1Z173QC815lTt22K5muC92PeBmVt6Rt2JMrpVIweYb0UUmYb+T3lvDOx+6FovSma3uHSBEHAuaAB6tZXpEb+tGlMT4nlZFgF9346Qabz+LOkufpgFW2Z8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB8288.eurprd08.prod.outlook.com (2603:10a6:20b:557::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 06:15:45 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 06:15:45 +0000
Message-ID: <68604797-f3a9-4555-aaf2-228f6e7f820a@arm.com>
Date: Wed, 28 May 2025 11:45:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
 <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
 <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
 <8ef715e7-76a2-4004-ac10-3cc10912c67d@arm.com>
 <67cf2131-da6b-4a1d-828e-52f0ff7fd0fb@lucifer.local>
 <170036fa-727c-4d2b-8ed4-0a1b6e4cf8d3@arm.com>
 <53a39d5f-6ea2-403f-8837-fb00d7f8d6b8@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <53a39d5f-6ea2-403f-8837-fb00d7f8d6b8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB8288:EE_|AM3PEPF0000A78E:EE_|DB4PR08MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c27cf4c-17ad-4a8d-fbd0-08dd9daf2a49
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?U0cyWHJZdmlKbStBTmdXZ1RnMVJ4Rk5Ua2dIc05uUUtpNnBGalByOXlYWTg2?=
 =?utf-8?B?MW9QdVFRU1hUL1k1TWN0OHFEeVRWVE9LT211czA0SjQyUEpORkpiMSsrMjJD?=
 =?utf-8?B?R0ZWTTZnUGM4RlpORG13VkozQStCV04wMGFWdFRZVk1NRmdFWjBYTklxb1pB?=
 =?utf-8?B?YnFUM3RBYTJoM1RvajRibDNFWkJkMnFjUWVlVFc1Z3R2WG94WDJiWFNBeVNi?=
 =?utf-8?B?bThNN1QyN1ZuYWJqUUhKUVRsRFdUUGh2aHhnOFlWcTA3OVZ2V3hRaTMvUlNM?=
 =?utf-8?B?bWhmOUt6dU9GcFMwRG5FcUI4SDNVSFZnRVdVS3pJaVJnR1VtbndHTWpFYjVa?=
 =?utf-8?B?QnRVK24wOFhsVWVJb0xKcklBTFBnaEpReS94RmRNU0ErTkhPelk1OEIvN1ZV?=
 =?utf-8?B?R1JEdGpVYWFhUDd2c09mT1cvcksybW95djRQSHk5M1FNNHl5OUd4NmpzSEhD?=
 =?utf-8?B?UnRZTzlUWEhUSlNtdG9rS3MwVGo4V1ZsVDRYNy9yc21LaWJ4SnY3d0hDN1dq?=
 =?utf-8?B?aG5JRjI3NFh3WjhCSTJMSFk3NUYvS0ZsYk5leXgybThRN3NvcEpBbDVrMW9a?=
 =?utf-8?B?NDhKMWhjQVV3QUV5SzlqbUxaREJzbjVhNHY2Z21sV0NZUHFSeSsycFI5Vlho?=
 =?utf-8?B?NVI5U2FxRit1OFhmZVVvRHh5L2lsbDRSQUFROVVadDdORWhQYUk2ZmhzQ2V1?=
 =?utf-8?B?K2E2ZVdkdnUvY3dYVEMzc1lIUTBmSE9wY2xUT3drN1E3cUU2TlJ4Z1JLL0Rv?=
 =?utf-8?B?VmlyOTVRb2JRREE0dnF3b1JBU1Z0WStEM0RsZUFMVU1FZUVzMTZpOVpoQmJV?=
 =?utf-8?B?N0dUQzZwRE0ySXBCSnlOeHFhc28rNjgyeWNnQlBLdGRWSXpwMXFYYndNZlQy?=
 =?utf-8?B?bncwdEhiQlRRY215YUtwazFtK2ZXYU5YZ1hVaGZZZHpmV2hudWR4Zkp1ejJi?=
 =?utf-8?B?WEFaR3hHUUhjQmVPSzJDZ0JoTDhlWmRwd1VNbkR3Ym5lbmwvV2VWck10Q1lO?=
 =?utf-8?B?ZmpSZUxjU0xiZnBIN0dpT2hETW84bHlERm1XRFIwdkpGZyt6TWpULzVCbGlo?=
 =?utf-8?B?blVNV0hLSmNsZC8zSDNwdWtBTjZHbzBFdlZkVW5zVmFRcUZRM0xCRnpuVmtJ?=
 =?utf-8?B?V3dvekRzcFZEbTRMRmlpaFlJY0pHQng1a1pVQmpyTDFLVWY2bDZ2VjdjeVRi?=
 =?utf-8?B?cFBvMXgraUJrbVZpWTM3dmRRYjMvRndOZWsweTFJeDVJbEV0dlpYbUVxVGZl?=
 =?utf-8?B?T0syWVJxakQvTVhPRmI5WlgybTFlclFuMjhFRFBmV21hd25XT0t4allLZjAy?=
 =?utf-8?B?d012TGUzRnFCSnAvL2JsUHAwY0VZZFhmZW9UYUFMbnB2cncyS3NudVpaNHNK?=
 =?utf-8?B?bUJuUDd6eE5wK1lMbDM0bUxkVCtxS3E5SzRmbUJUclJPbHczaDVqV0VqTkw1?=
 =?utf-8?B?cFByVzZua3FYOU1jZDN0WXRndCtHNG1OVWtJRWJ3THo3b2RaVVdnRERDQVFj?=
 =?utf-8?B?cUludy9IQzMzN1JYUFEvc0VXc0lwNjdsdjdCRStib25RZWljR2l6OVdrM2cy?=
 =?utf-8?B?TVNMSGNkL1h1WXJ1SHpCT3UwckllaXNYSlovS093L0hCTzZXYmhZckRoRGdv?=
 =?utf-8?B?TmFIMWd0ZU9UeEM2UVZ2TCtwU2c3bW84ZGxIeEJ4NFQ4VTB2UTRMK3ZIY0Ur?=
 =?utf-8?B?NFpnS2pmNVZQYkhMSUczQXNGVDgzV3MrV2MrZkJMd1VyeHFXMUNZdUlyYkU3?=
 =?utf-8?B?NGd4M0RmdkJLZ01WSzV0TU5CdzBnekk3QVpIRVRtTGZHZWx2b3duWFY1RWl6?=
 =?utf-8?B?QUMrMDV2bWVTR09TOXJQNk5qdjdsVDJSM3dhZ0Rsa3VPcG1BOTVKU0FtREp5?=
 =?utf-8?B?TWdVN25acVE5WWsvbHhHN2NqR3NvQTJkSVFHRmlDYnBYRGtwVmNiUGtYaW5s?=
 =?utf-8?Q?1JOQZBjKly8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8288
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93cfbd2e-42f6-4cf4-1996-08dd9daf13f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|376014|14060799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjN5QnlHMUlMK0ltb1J0NSt1ZEFkYm5ERE5neFFFL29OWVJaU05Zc1BQeWlr?=
 =?utf-8?B?OTl0QmFPUks5NVMyYWxtRHIvemdIK1V4akN3RXFGUkZ1S3Zvb1YvaC9Cd2RC?=
 =?utf-8?B?Y2E4SUlLM1B4T2Nka1ZUUnkwUVQzajRRbUxoNFd3a2lvYk5WdkNGd1IvVjFE?=
 =?utf-8?B?dTY5MVZqckh2ek1NVzFnZEhiaWNxbktsSkxYcUZPMC94aHZTcDFaZlNXUkVZ?=
 =?utf-8?B?TmFma1NnMG01dWJLYVBrejgwL3JGU25Ma1ZNWG9pNU5Kck1Ia1VrRVh1a1Ry?=
 =?utf-8?B?ckg5S1B2ZzI5SHovMGhMa0g1SXdPOXJLREQrSUVaZFprTTlyK09LMG01aG5E?=
 =?utf-8?B?TTVrdHB4ZzcrclE3UGY0RVh0Z0ZiSHY4SWdDNjhIMWdpaFhZV0VvU1R5ZzhZ?=
 =?utf-8?B?ZXpDeGU0OGNYcE1Va2x1NGVUd202ejJ5THdHelZlWlhETWdNeGJUK24wQzF6?=
 =?utf-8?B?YVBIcS9HSVdiODdwM3ZxdGx2Viswb2NJUkEyTUdTOE53dGN6Y2tkdUxjMVBq?=
 =?utf-8?B?M0dYY1JBNXpHbmJoV2dlTVh3ZlYxYlRwdWFMazRGdnIrQnd0YlQzVDNwZ0Y0?=
 =?utf-8?B?dnQ3SnF2VDhZV29LbHdXRlhkemNyM1BsZkRvQ2M2OUR6ZnJhQ1ZIOFdpM0Rz?=
 =?utf-8?B?MGNxaS9zcnZZczdRNTRpSS9GUjBZbGdwZGJqL0RPZ3NUdlVuUi9PdlNDWkdP?=
 =?utf-8?B?R3FYSnpjNnczeTB6cEdJOVp6SlQwOG54UXI5cEJxZ2E4VC9mOWVYVVU3MW1x?=
 =?utf-8?B?b0tTWnY2WUN6clJma0xjMGJXWFV4ZUFUemdDRzlrdlhaZVI4YXV6WElNajhW?=
 =?utf-8?B?emFTS3UxcG5lWjUzaldnUnI2Q2Jia1NCT1BraXVWRTZDejN3Z3F2SHI1Znhk?=
 =?utf-8?B?VnRGWkRtUXZOdjNDb0VNM2dxdjlPVmV2U0lXMlVuVndkb3JWYk5PZ2x0QW8v?=
 =?utf-8?B?VU1icVo0L2RISUJSVG5tQnFDd1k2N3JMZlNiQ0pLL0dOMkpTbTVHcW9MUWEw?=
 =?utf-8?B?bDg4UUVINk14enhiVTlZaHlJTmx0WjlZMHBZb0NUWmpMRUdKemNlUTJWOUFy?=
 =?utf-8?B?ZHpIbG1XalI5L3lMZ0RjQmc5UFBEZHdUMGFkdmJlYXhXcEtTT0l0WUZOSnN4?=
 =?utf-8?B?S3pTbDcwSkdiS01Pc1NnY3JIOUdPaXkzM0drVlpPQWdGQVVqMmhCT3N1WVJl?=
 =?utf-8?B?cDdIT3ZoQmF5SFhmUS9Ga0Urb2JpKzRoM0FsRHoyZGg5K04rV09lU2Nibndo?=
 =?utf-8?B?L2tOQ1FCVnI1VXo5Ym95UlB5UGVhS0JHRFFRUk1oOFJzdk9LRk4wNS9DcDZV?=
 =?utf-8?B?U2Ewemw4M1QxOU8rT1l2M3FzM3lpejVqdzBIYVllUFF0MmdJNXVUemRTK3FD?=
 =?utf-8?B?Z21DazMzY1lEeWdvMXdJYjE1emZiZWtLb3RKR2JtdC8wNXJkeUVPUkpGL0gv?=
 =?utf-8?B?NFI3Y0s2RkVpeW54SGYyR3JOLzZ0YmNuR0twamxTb3Mvbm56MThzU3ZXSytN?=
 =?utf-8?B?Syt3UlVvcFBLV1FsU3o3eFJMQlk4VTlRL3NRVXdwY3hScXhGMXQxaGdWYVhB?=
 =?utf-8?B?QTR3ZDdEQTBHL1pFekQ5dWg1OHZuaDduZTVEM3VBL0FOcjJ1Z3l2emtqSXQ2?=
 =?utf-8?B?cnlMZ2xYYngxN1h3cDNHRHl0R1c4NDQzTE95ODIzME1wTnJNRHBNMGxVUS9E?=
 =?utf-8?B?YVRvajVjL3JyUnVRaEVFUkJ5NzQ4SmVTZkpRM1JQOGFjeWJxVUQ1RVFiaGFZ?=
 =?utf-8?B?ak9aR01yMEZoNGg1RWdrZVpZN2NwUEI0a3J1SkR4RkQwWkk1eVA2NGlyZGl2?=
 =?utf-8?B?S0pLY0ZUVVlUdEY3L0dKVDJpZGpReEtsZjhFRmpsUjlQVTZqYThPai9lRlRC?=
 =?utf-8?B?dFc5ZXR6WEhUYkZyMVFUZW5wYmd1THR3dzQ5UHpRMy82aXJOS0d6ODNhS05B?=
 =?utf-8?B?NkxIZFVqY3lSQkIxVlF2OWM4dWxQRVc0dkNLZWJRaEk2N0lvS1JlVmV5VW1C?=
 =?utf-8?B?YlVwVkpCTk9uZUZFUGJGQyt0dkhyeXR3TTdZQjIyRG14V2lmUDdtNkVyTkF3?=
 =?utf-8?Q?qMobEG?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(376014)(14060799003)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 06:16:20.9907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c27cf4c-17ad-4a8d-fbd0-08dd9daf2a49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7933


On 28/05/25 10:19 am, Lorenzo Stoakes wrote:
> On Wed, May 28, 2025 at 09:02:26AM +0530, Dev Jain wrote:
>> On 27/05/25 10:16 pm, Lorenzo Stoakes wrote:
>>> On Tue, May 27, 2025 at 10:08:59PM +0530, Dev Jain wrote:
>>>> On 27/05/25 9:59 pm, Lorenzo Stoakes wrote:
>>> [snip]
>>>>> If I invoke split_huge_pmd(), I end up with a bunch of PTEs mapping the same
>>>>> large folio. The folio itself is not split, so nr_ptes surely will be equal to
>>>>> something >1 here right?
>>>> Thanks for elaborating.
>>>>
>>>> So,
>>>>
>>>> Case 1: folio splitting => nr_ptes = 1 => the question of a/d bit smearing
>>>> disappears.
>>>>
>>>> Case 2: page table splitting => consec PTEs point to the same large folio
>>>> => nr_ptes > 1 => get_and_clear_full_ptes() will smear a/d bits on the
>>>> new ptes, which is correct because we are still pointing to the same large
>>>> folio.
>>>>
>>> OK awesome, I thought as much, just wanted to make sure :) we are good then.
>>>
>>> The accessed/dirty bits really matter at a folio granularity (and especially
>>> with respect to reclaim/writeback which both operate at folio level) so the
>>> smearing as you say is fine.
>>>
>>> This patch therefore looks fine, only the trivial comment fixup.
>>>
>>> I ran the series on my x86-64 setup (fwiw) with no build/mm selftest errors.
>> Thanks!
>>
>>
>>> Sorry to be a pain but could you respin with the commit message for this patch
>>> updated to explicitly mention that the logic applies for the non-contPTE split
>>> PTE case (and therefore also helps performance there)? That and the trivial
>>> thing of dropping that comment.
>> What do you mean by the non-contpte case? In that case the PTEs do not point
>> to the same folio or are misaligned, and there will be no optimization. This
> Split page table large folio.
>
>> patch is optimizing two things: 1) ptep_get() READ_ONCE accesses 2) reduction
>> in number of TLBIs for contig blocks, both of which happen in the contpte case.
>>
> But it impacts split huge pages. Your code changes this behaviour. We need to
> make this clear :)
>
>> In general, the patch should have a minor improvement on other arches because
>> we are detecting a batch and processing it together, thus saving on a few
>> function calls, but the main benefit is for arm64.
> Ack, but you are changing this behaviour. The commit message doesn't make this
> clear and seems to imply this only impacts contPTE cases. Or at least isn't
> clear enough
>
> A simple additional paragraph like:
>
> 'Transparent huge pages which have been split into PTEs will also be impacted,
> however the performance gain in this case is expected to be modest'

Ah okay, sounds good.

>
> Will sort this out.
>
> Thanks!
>
>>> Then we should be good for a tag unless somebody else spots something
>>> egregious :)
>>>
>>> Thanks for this! Good improvement.
>>>
>>> [snip]
>>>
>>> Cheers, Lorenzo
